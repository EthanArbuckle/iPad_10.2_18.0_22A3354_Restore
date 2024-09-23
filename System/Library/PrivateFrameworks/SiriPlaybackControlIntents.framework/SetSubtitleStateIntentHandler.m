@implementation SetSubtitleStateIntentHandler

- (_TtC26SiriPlaybackControlIntents29SetSubtitleStateIntentHandler)init
{
  _TtC26SiriPlaybackControlIntents29SetSubtitleStateIntentHandler *result;

  SetSubtitleStateIntentHandler.init()();
  return result;
}

- (void)handleSetSubtitleState:(id)a3 completion:(id)a4
{
  sub_2248CA310(self, (int)a2, a3, a4, (uint64_t)&unk_24EC8ECC0, (uint64_t)sub_22481A9E4, (void (*)(id, uint64_t, uint64_t))sub_22495F404);
}

- (void)resolveDeviceForSetSubtitleState:(id)a3 withCompletion:(id)a4
{
  sub_2248129F4(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_22495FF64);
}

- (void)resolveLanguageForSetSubtitleState:(id)a3 withCompletion:(id)a4
{
  sub_2248CA310(self, (int)a2, a3, a4, (uint64_t)&unk_24EC8EC20, (uint64_t)sub_2248390EC, (void (*)(id, uint64_t, uint64_t))sub_2249610EC);
}

- (void)confirmSetSubtitleState:(id)a3 completion:(id)a4
{
  sub_2248129F4(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_224961940);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents29SetSubtitleStateIntentHandler_playbackController);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents29SetSubtitleStateIntentHandler_analyticsService);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents29SetSubtitleStateIntentHandler_deviceState);
}

@end
