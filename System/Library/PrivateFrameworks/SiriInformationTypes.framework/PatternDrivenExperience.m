@implementation PatternDrivenExperience

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC21SiriInformationSearch23PatternDrivenExperience)initWithCoder:(id)a3
{
  return (_TtC21SiriInformationSearch23PatternDrivenExperience *)PatternDrivenExperience.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC21SiriInformationSearch23PatternDrivenExperience *v5;

  v4 = a3;
  v5 = self;
  PatternDrivenExperience.encode(with:)((NSCoder)v4);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
