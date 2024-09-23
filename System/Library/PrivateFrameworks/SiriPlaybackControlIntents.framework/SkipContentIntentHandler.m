@implementation SkipContentIntentHandler

- (_TtC26SiriPlaybackControlIntents24SkipContentIntentHandler)init
{
  return (_TtC26SiriPlaybackControlIntents24SkipContentIntentHandler *)SkipContentIntentHandler.init()();
}

- (void)handleSkipContent:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC26SiriPlaybackControlIntents24SkipContentIntentHandler *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_2248A05CC((uint64_t)v8, (uint64_t)sub_22481A9E4, v7);

  swift_release();
}

- (void)resolveDevicesForSkipContent:(id)a3 withCompletion:(id)a4
{
  sub_2248129F4(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_2248A123C);
}

- (void)confirmSkipContent:(id)a3 completion:(id)a4
{
  sub_2248129F4(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_2248A2710);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents24SkipContentIntentHandler_playbackController);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents24SkipContentIntentHandler_analyticsService);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents24SkipContentIntentHandler_deviceState);
  v3 = (char *)self
     + OBJC_IVAR____TtC26SiriPlaybackControlIntents24SkipContentIntentHandler_aceBlockClearAudioQueueForSkip;
  v4 = OUTLINED_FUNCTION_17_3();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
