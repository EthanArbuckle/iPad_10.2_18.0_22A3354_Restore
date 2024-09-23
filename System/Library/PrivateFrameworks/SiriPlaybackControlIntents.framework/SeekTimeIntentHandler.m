@implementation SeekTimeIntentHandler

- (_TtC26SiriPlaybackControlIntents21SeekTimeIntentHandler)init
{
  _TtC26SiriPlaybackControlIntents21SeekTimeIntentHandler *result;

  SeekTimeIntentHandler.init()();
  return result;
}

- (void)handleSeekTime:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC26SiriPlaybackControlIntents21SeekTimeIntentHandler *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_2249D07C0((uint64_t)v8, (uint64_t)sub_22481A9E4, v7);

  swift_release();
}

- (void)resolveDevicesForSeekTime:(id)a3 withCompletion:(id)a4
{
  sub_2248129F4(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_2249D1338);
}

- (void)resolvePlayheadPositionForSeekTime:(id)a3 withCompletion:(id)a4
{
  sub_2248129F4(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_2249D27F0);
}

- (void)confirmSeekTime:(id)a3 completion:(id)a4
{
  sub_2248129F4(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_2249D3550);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents21SeekTimeIntentHandler_playbackController);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents21SeekTimeIntentHandler_analyticsService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents21SeekTimeIntentHandler_deviceState);
  swift_release();
}

@end
