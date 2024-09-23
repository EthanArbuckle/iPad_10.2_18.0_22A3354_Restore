@implementation SiriTTSInlineStreamingSignal

- (NSString)text
{
  return (NSString *)sub_19AE15DF0(self, (uint64_t)a2, InlineStreamingSignal.text.getter);
}

- (NSString)identifier
{
  return (NSString *)sub_19AE15DF0(self, (uint64_t)a2, InlineStreamingSignal.identifier.getter);
}

- (SiriTTSInlineStreamingSignal)initWithText:(id)a3 identifier:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = sub_19AE55448();
  v6 = v5;
  v7 = sub_19AE55448();
  return (SiriTTSInlineStreamingSignal *)InlineStreamingSignal.init(text:identifier:)(v4, v6, v7, v8);
}

+ (BOOL)supportsSecureCoding
{
  char v2;

  static InlineStreamingSignal.supportsSecureCoding.getter();
  return v2 & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static InlineStreamingSignal.supportsSecureCoding.setter(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SiriTTSInlineStreamingSignal *v5;

  v4 = a3;
  v5 = self;
  sub_19AE1601C(v4);

}

- (SiriTTSInlineStreamingSignal)initWithCoder:(id)a3
{
  return (SiriTTSInlineStreamingSignal *)InlineStreamingSignal.init(coder:)((uint64_t)a3);
}

- (NSString)description
{
  return (NSString *)sub_19AE16280(self, (uint64_t)a2, sub_19AE162CC);
}

- (SiriTTSInlineStreamingSignal)init
{
  InlineStreamingSignal.init()();
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_224_0(OBJC_IVAR___SiriTTSInlineStreamingSignal_identifier);
  OUTLINED_FUNCTION_41_1();
}

@end
