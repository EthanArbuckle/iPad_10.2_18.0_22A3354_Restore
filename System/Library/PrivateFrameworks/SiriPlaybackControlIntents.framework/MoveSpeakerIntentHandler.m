@implementation MoveSpeakerIntentHandler

- (_TtC26SiriPlaybackControlIntents24MoveSpeakerIntentHandler)init
{
  return (_TtC26SiriPlaybackControlIntents24MoveSpeakerIntentHandler *)MoveSpeakerIntentHandler.init()();
}

- (void)handleMoveSpeaker:(id)a3 completion:(id)a4
{
  sub_2248CA310(self, (int)a2, a3, a4, (uint64_t)&unk_24EC908A8, (uint64_t)sub_22481A9E4, (void (*)(id, uint64_t, uint64_t))sub_22498244C);
}

- (void)resolveSourceForMoveSpeaker:(id)a3 withCompletion:(id)a4
{
  sub_2248CA310(self, (int)a2, a3, a4, (uint64_t)&unk_24EC90880, (uint64_t)sub_2248390EC, (void (*)(id, uint64_t, uint64_t))sub_2249832E0);
}

- (void)resolveDestinationsForMoveSpeaker:(id)a3 withCompletion:(id)a4
{
  sub_2248CA310(self, (int)a2, a3, a4, (uint64_t)&unk_24EC90858, (uint64_t)sub_224985388, (void (*)(id, uint64_t, uint64_t))sub_224983CF0);
}

- (void)confirmMoveSpeaker:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC26SiriPlaybackControlIntents24MoveSpeakerIntentHandler *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_224984E04((uint64_t)v7, (uint64_t)v8, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);

}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents24MoveSpeakerIntentHandler_playbackController);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents24MoveSpeakerIntentHandler_deviceState);
  swift_release();
}

@end
