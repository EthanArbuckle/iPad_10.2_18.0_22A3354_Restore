@implementation CoreSynthesisVoicePickable

- (_TtC26TextToSpeechVoiceBankingUI26CoreSynthesisVoicePickable)init
{
  _TtC26TextToSpeechVoiceBankingUI26CoreSynthesisVoicePickable *result;

  result = (_TtC26TextToSpeechVoiceBankingUI26CoreSynthesisVoicePickable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  swift_unknownObjectWeakDestroy();
  v3 = (char *)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI26CoreSynthesisVoicePickable__voice;
  v4 = sub_2488BBA34();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI26CoreSynthesisVoicePickable___observationRegistrar;
  v6 = sub_2488BB80C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end
