@implementation SetVolumeLevelIntentHandler

- (void)resolveDevicesForSetVolumeLevel:(id)a3 withCompletion:(id)a4
{
  sub_224837638(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_2248333AC);
}

- (void)resolveVolumeLevelForSetVolumeLevel:(id)a3 withCompletion:(id)a4
{
  sub_224837638(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_2248345D0);
}

- (void)confirmSetVolumeLevel:(id)a3 completion:(id)a4
{
  sub_224837638(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_2248371A0);
}

- (void)handleSetVolumeLevel:(id)a3 completion:(id)a4
{
  sub_224837638(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_2248376B8);
}

- (_TtC26SiriPlaybackControlIntents27SetVolumeLevelIntentHandler)init
{
  _TtC26SiriPlaybackControlIntents27SetVolumeLevelIntentHandler *result;

  SetVolumeLevelIntentHandler.init()();
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  OUTLINED_FUNCTION_75_1(OBJC_IVAR____TtC26SiriPlaybackControlIntents27SetVolumeLevelIntentHandler_accessoryVolumeController);
  OUTLINED_FUNCTION_75_1(OBJC_IVAR____TtC26SiriPlaybackControlIntents27SetVolumeLevelIntentHandler_deviceState);
  OUTLINED_FUNCTION_75_1(OBJC_IVAR____TtC26SiriPlaybackControlIntents27SetVolumeLevelIntentHandler_playbackController);
  OUTLINED_FUNCTION_75_1(OBJC_IVAR____TtC26SiriPlaybackControlIntents27SetVolumeLevelIntentHandler_userDefaultsProvider);
  OUTLINED_FUNCTION_75_1(OBJC_IVAR____TtC26SiriPlaybackControlIntents27SetVolumeLevelIntentHandler_audioSession);
  swift_release();
  OUTLINED_FUNCTION_75_1(OBJC_IVAR____TtC26SiriPlaybackControlIntents27SetVolumeLevelIntentHandler_featureFlagProvider);
}

@end
