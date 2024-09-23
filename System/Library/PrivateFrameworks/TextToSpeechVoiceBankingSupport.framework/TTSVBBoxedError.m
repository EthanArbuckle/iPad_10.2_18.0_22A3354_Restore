@implementation TTSVBBoxedError

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_25777C1E0;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_25777C1E0 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC31TextToSpeechVoiceBankingSupport15TTSVBBoxedError *v5;

  v4 = a3;
  v5 = self;
  sub_2486F56C4(v4);

}

- (_TtC31TextToSpeechVoiceBankingSupport15TTSVBBoxedError)initWithCoder:(id)a3
{
  return (_TtC31TextToSpeechVoiceBankingSupport15TTSVBBoxedError *)TTSVBBoxedError.init(coder:)(a3);
}

- (NSString)description
{
  _TtC31TextToSpeechVoiceBankingSupport15TTSVBBoxedError *v2;
  void *v3;

  v2 = self;
  TTSVBError.description.getter();

  v3 = (void *)sub_2487B5504();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC31TextToSpeechVoiceBankingSupport15TTSVBBoxedError)init
{
  _TtC31TextToSpeechVoiceBankingSupport15TTSVBBoxedError *result;

  result = (_TtC31TextToSpeechVoiceBankingSupport15TTSVBBoxedError *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2486EDA68((uint64_t)self + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport15TTSVBBoxedError_ttsvbError, type metadata accessor for TTSVBError);
}

@end
