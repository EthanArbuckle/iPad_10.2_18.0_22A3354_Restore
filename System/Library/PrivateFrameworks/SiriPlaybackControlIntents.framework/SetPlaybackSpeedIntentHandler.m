@implementation SetPlaybackSpeedIntentHandler

- (_TtC26SiriPlaybackControlIntents29SetPlaybackSpeedIntentHandler)init
{
  return (_TtC26SiriPlaybackControlIntents29SetPlaybackSpeedIntentHandler *)SetPlaybackSpeedIntentHandler.init()();
}

- (void)handleSetPlaybackSpeed:(id)a3 completion:(id)a4
{
  sub_2248129F4(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_22488F1B8);
}

- (void)confirmSetPlaybackSpeed:(id)a3 completion:(id)a4
{
  sub_2248129F4(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_22488FCA0);
}

- (void)resolveSpeedMagnitudeForSetPlaybackSpeed:(id)a3 withCompletion:(id)a4
{
  sub_2248129F4(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_22488FD50);
}

- (void)resolvePlaybackSpeedTypeForSetPlaybackSpeed:(id)a3 withCompletion:(id)a4
{
  sub_2248129F4(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_224890948);
}

- (void)resolveDevicesForSetPlaybackSpeed:(id)a3 withCompletion:(id)a4
{
  sub_2248129F4(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_224890DC0);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents29SetPlaybackSpeedIntentHandler_playbackController);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents29SetPlaybackSpeedIntentHandler_deviceState);
}

@end
