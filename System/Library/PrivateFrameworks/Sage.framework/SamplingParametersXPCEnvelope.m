@implementation SamplingParametersXPCEnvelope

- (NSData)_parameters
{
  return (NSData *)sub_24575D080((uint64_t)self, (uint64_t)a2, sub_24575B36C);
}

+ (BOOL)supportsSecureCoding
{
  char v2;

  static SamplingParametersXPCEnvelope.supportsSecureCoding.getter();
  return v2 & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static SamplingParametersXPCEnvelope.supportsSecureCoding.setter(a3);
}

- (_TtC4Sage29SamplingParametersXPCEnvelope)initWithCoder:(id)a3
{
  return (_TtC4Sage29SamplingParametersXPCEnvelope *)SamplingParametersXPCEnvelope.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC4Sage29SamplingParametersXPCEnvelope *v5;

  v4 = a3;
  v5 = self;
  SamplingParametersXPCEnvelope.encode(with:)((NSCoder)v4);

}

- (_TtC4Sage29SamplingParametersXPCEnvelope)init
{
  SamplingParametersXPCEnvelope.init()();
}

- (void).cxx_destruct
{
  sub_245767A3C((uint64_t)self, OBJC_IVAR____TtC4Sage29SamplingParametersXPCEnvelope__parameters);
}

@end
