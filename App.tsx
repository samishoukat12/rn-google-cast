import React, {useEffect} from 'react';
import {View} from 'react-native';
import CastContext, {
  CastButton,
  PlayServicesState,
  useRemoteMediaClient,
} from 'react-native-google-cast';

export default function App() {
  // This will automatically rerender when client is connected to a device
  // (after pressing the button that's rendered below)
  const client = useRemoteMediaClient();

  if (client) {
    // Send the media to your Cast device as soon as we connect to a device
    // (though you'll probably want to call this later once user clicks on a video or something)
    client.loadMedia({
      mediaInfo: {
        contentUrl:
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/CastVideos/mp4/BigBuckBunny.mp4',
        contentType: 'video/mp4',
      },
    });
  }
  useEffect(() => {
    CastContext.getPlayServicesState().then(state => {
      console.log('Play Services State:', state);
    });
  }, []);

  useEffect(() => {
    CastContext.getPlayServicesState().then(state => {
      if (state && state !== PlayServicesState.SUCCESS)
        CastContext.showPlayServicesErrorDialog(state);
    });
  }, []);

  // This will render native Cast button.
  // When a user presses it, a Cast dialog will prompt them to select a Cast device to connect to.
  return (
    <View
      style={{
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: 'white',
      }}>
      <CastButton style={{width: 24, height: 24, tintColor: 'black'}} />
    </View>
  );
}
