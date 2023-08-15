# Personal Notes

## Implementing Map View:


To create a map panel with the Mapbox implementation, you need to do the following steps:

- First, you need to get a **Mapbox access token** from the Mapbox website.
- Second, you need to add your Mapbox access token to the **project settings** in Directus under the **Mapbox Token** field¹².
- Third, you need to create a custom panel extension that uses the **map interface** to display your data on a map. You can use the **Directus SDK** or the **Directus API** to fetch your data and pass it to the map interface as props.
- Fourth, you need to add your custom panel to a dashboard in the **Insights** module and configure its options³.

Here is an example of how to create a custom panel with a map interface:

```js
import { defineDisplay } from '@directus/shared/utils';
import { useApi } from '@directus/shared/composables';
import { Map } from '@directus/shared/interfaces';

export default defineDisplay({
  id: 'my-map-panel',
  name: 'My Map Panel',
  description: 'This is a custom panel that shows some data on a map',
  icon: 'map',
  component: MyMapPanel,
});

const MyMapPanel = {
  props: {
    dashboard: {
      type: Object,
      default: null,
    },
    panel: {
      type: Object,
      default: null,
    },
  },
  setup(props) {
    const api = useApi();

    // You can use the api object to access your data
    // For example, you can fetch a collection of locations
    const locations = api.getCollection('locations');

    return () => (
      <div class="my-map-panel">
        <h1>{props.panel.name}</h1>
        <p>This is my map panel</p>
        <Map
          value={locations.value.data}
          latitudeField="latitude"
          longitudeField="longitude"
          zoom={10}
          height={500}
        />
      </div>
    );
  },
};
```

I hope this helps. Do you have any other questions?

Source: Conversation with Bing, 14/08/2023
(1) Settings | Directus Docs. https://docs.directus.io/reference/system/settings.html.
(2) map interface needs a location search · directus directus - GitHub. https://github.com/directus/directus/discussions/12633.
(3) Make a Map Provider Default · directus directus - GitHub. https://github.com/directus/directus/discussions/13170.