import { defineHook } from '@directus/extensions-sdk';
import { BaseException } from "@directus/shared/exceptions";
// @ts-ignore
import jwt from "jsonwebtoken";

export default defineHook(({ filter }, {database}) => {
	filter("authenticate", async (accountability: any, { req }) => {

		async function getMembership(id: string){
			return await database
				.select(
					'membership.id',
					'membership.status',
					'membership.user',
					'membership.account',
					'membership.role',
					'membership.date_created',
					'user.id as user_id',
					'user.email as user_email',
					'user.role as user_role',
					'account.id as account_id',
					'account.slug as account_slug',
					'account.type as account_type'
				)
				.from('membership')
				.where('membership.id', id)
				.leftJoin(function () {
					this.select('id', 'email', 'role')
					.from('directus_users')
					.as('user');
				}, 'user.id', '=', 'membership.user')
				.leftJoin(function () { // Add this leftJoin block
					this.select('id', 'slug', 'type') // Select id and slug columns
					.from('accounts')
					.as('account');
				}, 'account.id', '=', 'membership.account')
				.first();


		}

		  const rawToken =
				req?.headers.authorization ||
				req?.headers?.["x-access-token"] ||
				req?.body?.token ||
				req.query?.token;

		console.log('Raw Token: ', rawToken);

		const token = rawToken ? rawToken.split(" ")[1] : false;
		const decodedToken = token ? jwt.decode(token) : false;
		console.log('Decoded token: ', decodedToken);

		if (token && decodedToken) {
			// continue with existing user
			// if is admin and app access, pass
				// else: update accountability
			if (!decodedToken.admin_access && decodedToken.role !== 'ec1c2da0-5edb-45a3-89ca-52d420adc80a')
			{
				//user is ! admin	
				if (req?.headers?.membership_id && await getMembership(req?.headers?.membership_id)) 
				{
					let membership_entry =  await getMembership(req?.headers?.membership_id)
					//update accountability
					accountability = {
						...accountability,
						membership_entry,
						user: membership_entry.user_id,
  						role: membership_entry.user_role,
						account_id: membership_entry.account_id,
						account_type: membership_entry.account_type,
						account_slug: membership_entry.account_slug,
					}

					console.log('New accountability: ', accountability);
					
				}else{
					throw new BaseException("Membership ID required", 401, "INVALID_CREDENTIALS");
				}

			}

		}

	
		console.log('Accountability: ', accountability);
	
		return accountability;
	});

});
