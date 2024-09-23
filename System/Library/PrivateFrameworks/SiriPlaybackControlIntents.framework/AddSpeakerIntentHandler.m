@implementation AddSpeakerIntentHandler

- (_TtC26SiriPlaybackControlIntents23AddSpeakerIntentHandler)init
{
  return (_TtC26SiriPlaybackControlIntents23AddSpeakerIntentHandler *)AddSpeakerIntentHandler.init()();
}

- (void)handleAddSpeaker:(id)a3 completion:(id)a4
{
  sub_2248CA310(self, (int)a2, a3, a4, (uint64_t)&unk_24EC87B78, (uint64_t)sub_22481A9E4, (void (*)(id, uint64_t, uint64_t))sub_2248C70A4);
}

- (void)resolveSourceForAddSpeaker:(id)a3 withCompletion:(id)a4
{
  sub_2248CA310(self, (int)a2, a3, a4, (uint64_t)&unk_24EC87B50, (uint64_t)sub_2248390EC, (void (*)(id, uint64_t, uint64_t))sub_2248C87B8);
}

- (void)resolveDestinationsForAddSpeaker:(id)a3 withCompletion:(id)a4
{
  sub_2248CA310(self, (int)a2, a3, a4, (uint64_t)&unk_24EC87B28, (uint64_t)sub_2248CA934, (void (*)(id, uint64_t, uint64_t))sub_2248C91C8);
}

- (void)confirmAddSpeaker:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC26SiriPlaybackControlIntents23AddSpeakerIntentHandler *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_2248CA39C((uint64_t)v7, (uint64_t)v8, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);

}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents23AddSpeakerIntentHandler_playbackController);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents23AddSpeakerIntentHandler_deviceState);
  swift_release();
}

@end
