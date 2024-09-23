@implementation SRSSSpeechRecognitionPhoneticChecker

- (_TtC30SpeechRecognitionSharedSupport36SRSSSpeechRecognitionPhoneticChecker)initWithLocaleIdentifier:(id)a3
{
  sub_247956A68();
  return (_TtC30SpeechRecognitionSharedSupport36SRSSSpeechRecognitionPhoneticChecker *)SRSSSpeechRecognitionPhoneticChecker.init(localeIdentifier:)();
}

- (id)guessesForString:(id)a3 maxResults:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC30SpeechRecognitionSharedSupport36SRSSSpeechRecognitionPhoneticChecker *v9;
  void *v10;

  v6 = sub_247956A68();
  v8 = v7;
  v9 = self;
  sub_24793AA7C(v6, v8, a4);

  swift_bridgeObjectRelease();
  sub_24793B8E8();
  v10 = (void *)sub_247956AE0();
  swift_bridgeObjectRelease();
  return v10;
}

- (id)guessesForString:(id)a3 maxResults:(int64_t)a4 phoneticWeight:(double)a5 priorWeight:(double)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC30SpeechRecognitionSharedSupport36SRSSSpeechRecognitionPhoneticChecker *v11;
  void *v12;

  v8 = sub_247956A68();
  v10 = v9;
  v11 = self;
  sub_24793AA7C(v8, v10, a4);

  swift_bridgeObjectRelease();
  sub_24793B8E8();
  v12 = (void *)sub_247956AE0();
  swift_bridgeObjectRelease();
  return v12;
}

- (_TtC30SpeechRecognitionSharedSupport36SRSSSpeechRecognitionPhoneticChecker)init
{
  _TtC30SpeechRecognitionSharedSupport36SRSSSpeechRecognitionPhoneticChecker *result;

  result = (_TtC30SpeechRecognitionSharedSupport36SRSSSpeechRecognitionPhoneticChecker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC30SpeechRecognitionSharedSupport36SRSSSpeechRecognitionPhoneticChecker_logger;
  v4 = sub_2479569E4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
