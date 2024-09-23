@implementation RecordableResult

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_255A5DA70;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_255A5DA70 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC16SiriAudioSupport16RecordableResult *v5;

  v4 = a3;
  v5 = self;
  sub_229743DE0(v4);

}

- (_TtC16SiriAudioSupport16RecordableResult)initWithCoder:(id)a3
{
  id v3;
  _TtC16SiriAudioSupport16RecordableResult *v4;

  v3 = a3;
  v4 = (_TtC16SiriAudioSupport16RecordableResult *)sub_229744470(v3);

  return v4;
}

- (_TtC16SiriAudioSupport16RecordableResult)init
{
  _TtC16SiriAudioSupport16RecordableResult *result;

  result = (_TtC16SiriAudioSupport16RecordableResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
