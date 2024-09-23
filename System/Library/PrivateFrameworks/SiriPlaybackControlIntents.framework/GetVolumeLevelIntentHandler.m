@implementation GetVolumeLevelIntentHandler

- (_TtC26SiriPlaybackControlIntents27GetVolumeLevelIntentHandler)init
{
  return (_TtC26SiriPlaybackControlIntents27GetVolumeLevelIntentHandler *)GetVolumeLevelIntentHandler.init()();
}

- (void)handleGetVolumeLevel:(id)a3 completion:(id)a4
{
  sub_224837638(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_22490224C);
}

- (void)resolveDeviceForGetVolumeLevel:(id)a3 withCompletion:(id)a4
{
  sub_224837638(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_2249033B8);
}

- (void)confirmGetVolumeLevel:(id)a3 completion:(id)a4
{
  sub_224837638(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_224904E48);
}

- (void).cxx_destruct
{
  swift_release();
  OUTLINED_FUNCTION_75_1(OBJC_IVAR____TtC26SiriPlaybackControlIntents27GetVolumeLevelIntentHandler_accessoryVolumeController);
  OUTLINED_FUNCTION_75_1(OBJC_IVAR____TtC26SiriPlaybackControlIntents27GetVolumeLevelIntentHandler_playbackController);
  OUTLINED_FUNCTION_75_1(OBJC_IVAR____TtC26SiriPlaybackControlIntents27GetVolumeLevelIntentHandler_deviceState);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents27GetVolumeLevelIntentHandler_featureFlagProvider);
}

@end
