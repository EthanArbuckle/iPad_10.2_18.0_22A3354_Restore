@implementation SkipTimeIntentHandler

- (_TtC26SiriPlaybackControlIntents21SkipTimeIntentHandler)init
{
  return (_TtC26SiriPlaybackControlIntents21SkipTimeIntentHandler *)SkipTimeIntentHandler.init()();
}

- (void)handleSkipTime:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC26SiriPlaybackControlIntents21SkipTimeIntentHandler *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_2248C2E2C((uint64_t)v8, (uint64_t)sub_22481A9E4, v7);

  swift_release();
}

- (void)resolveDurationForSkipTime:(id)a3 withCompletion:(id)a4
{
  sub_2248129F4(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_2248C3894);
}

- (void)resolveDevicesForSkipTime:(id)a3 withCompletion:(id)a4
{
  sub_2248129F4(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_2248C39EC);
}

- (void)confirmSkipTime:(id)a3 completion:(id)a4
{
  sub_2248129F4(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_2248C4EC4);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents21SkipTimeIntentHandler_playbackController);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents21SkipTimeIntentHandler_analyticsService);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents21SkipTimeIntentHandler_deviceState);
}

@end
