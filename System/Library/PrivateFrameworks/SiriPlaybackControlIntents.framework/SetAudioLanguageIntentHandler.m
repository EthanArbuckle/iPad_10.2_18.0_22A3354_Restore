@implementation SetAudioLanguageIntentHandler

- (_TtC26SiriPlaybackControlIntents29SetAudioLanguageIntentHandler)init
{
  _TtC26SiriPlaybackControlIntents29SetAudioLanguageIntentHandler *result;

  SetAudioLanguageIntentHandler.init()();
  return result;
}

- (void)handleSetAudioLanguage:(id)a3 completion:(id)a4
{
  sub_2248CA310(self, (int)a2, a3, a4, (uint64_t)&unk_24EC897A0, (uint64_t)sub_2248390EC, (void (*)(id, uint64_t, uint64_t))sub_2248F8838);
}

- (void)resolveDeviceForSetAudioLanguage:(id)a3 withCompletion:(id)a4
{
  sub_2248129F4(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_2248F8EEC);
}

- (void)resolveLanguageForSetAudioLanguage:(id)a3 withCompletion:(id)a4
{
  sub_2248CA310(self, (int)a2, a3, a4, (uint64_t)&unk_24EC89700, (uint64_t)sub_22481A9E4, (void (*)(id, uint64_t, uint64_t))sub_2248FA0B8);
}

- (void)confirmSetAudioLanguage:(id)a3 completion:(id)a4
{
  sub_2248129F4(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_2248FA7D4);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents29SetAudioLanguageIntentHandler_playbackController);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents29SetAudioLanguageIntentHandler_analyticsService);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents29SetAudioLanguageIntentHandler_deviceState);
}

@end
