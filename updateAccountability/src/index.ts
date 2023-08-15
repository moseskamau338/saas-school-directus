import { defineHook } from '@directus/extensions-sdk';

type Accountability = {
  admin?: boolean;
  app?: boolean;
  ip?: string;
  role?: string | null;
  userAgent?: string;
  user?: string | null;
}


export default defineHook(({ filter }) => {

	filter("items.read", async (input, context, { accountability }) => {
	
		console.log('[HOOK] context: ', context)
		console.log('[HOOK] Accountability: ', accountability)

		console.log('[Hook] Accountability user: ',accountability?.user, accountability?.user?.name)
	
		return input;
	});


});
