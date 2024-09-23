@implementation SpeechTranslationInstrumentation

- (_TtC17SequoiaTranslator32SpeechTranslationInstrumentation)init
{
  return (_TtC17SequoiaTranslator32SpeechTranslationInstrumentation *)sub_100177FCC();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator32SpeechTranslationInstrumentation_localePair));
  sub_10000A020((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator32SpeechTranslationInstrumentation_sourceLocale, (uint64_t *)&unk_10028FE50);
  v3 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator32SpeechTranslationInstrumentation_start;
  v4 = type metadata accessor for Date(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_10000A020((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator32SpeechTranslationInstrumentation_firstResult, &qword_1002948B0);
  sub_10000A020((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator32SpeechTranslationInstrumentation_firstTranslation, &qword_1002948B0);
  sub_10000A020((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator32SpeechTranslationInstrumentation_firstTTS, &qword_1002948B0);
  sub_10000A020((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator32SpeechTranslationInstrumentation_firstLID, &qword_1002948B0);
}

@end
