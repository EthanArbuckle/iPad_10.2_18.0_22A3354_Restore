@implementation PauseMediaIntentHandler

- (void)resolveDevicesForPauseMedia:(id)a3 withCompletion:(id)a4
{
  sub_2248129F4(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_224812A68);
}

- (void)confirmPauseMedia:(id)a3 completion:(id)a4
{
  sub_2248129F4(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_2248163A4);
}

- (void)handlePauseMedia:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC26SiriPlaybackControlIntents23PauseMediaIntentHandler *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_224816E44((uint64_t)v8, (uint64_t)sub_22481A9E4, v7);

  swift_release();
}

- (_TtC26SiriPlaybackControlIntents23PauseMediaIntentHandler)init
{
  _TtC26SiriPlaybackControlIntents23PauseMediaIntentHandler *result;

  PauseMediaIntentHandler.init()();
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents23PauseMediaIntentHandler_playbackController);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents23PauseMediaIntentHandler_analyticsService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents23PauseMediaIntentHandler_deviceState);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents23PauseMediaIntentHandler_aceService);
}

@end
