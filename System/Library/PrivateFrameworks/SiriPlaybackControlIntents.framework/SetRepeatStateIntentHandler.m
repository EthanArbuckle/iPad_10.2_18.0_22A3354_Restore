@implementation SetRepeatStateIntentHandler

- (_TtC26SiriPlaybackControlIntents27SetRepeatStateIntentHandler)init
{
  _TtC26SiriPlaybackControlIntents27SetRepeatStateIntentHandler *result;

  SetRepeatStateIntentHandler.init()();
  return result;
}

- (void)handleSetRepeatState:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC26SiriPlaybackControlIntents27SetRepeatStateIntentHandler *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_2248AC284((uint64_t)v8, (uint64_t)sub_22481A9E4, v7);

  swift_release();
}

- (void)resolveDevicesForSetRepeatState:(id)a3 withCompletion:(id)a4
{
  sub_2248129F4(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_2248ACCF8);
}

- (void)confirmSetRepeatState:(id)a3 completion:(id)a4
{
  sub_2248129F4(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_2248AE1EC);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents27SetRepeatStateIntentHandler_playbackController);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents27SetRepeatStateIntentHandler_analyticsService);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents27SetRepeatStateIntentHandler_deviceState);
}

@end
