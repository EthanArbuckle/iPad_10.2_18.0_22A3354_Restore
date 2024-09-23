@implementation SpeakerCapability

- (NSString)key
{
  void *v2;

  sub_1C2ECBA48();
  v2 = (void *)sub_1C2EF7410();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC27SiriVirtualDeviceResolution17SpeakerCapability *v7;

  v4 = sub_1C2EF741C();
  v6 = v5;
  v7 = self;
  sub_1C2ECBAF4(v4, v6);

}

- (_TtC27SiriVirtualDeviceResolution17SpeakerCapability)initWithStatus:(int64_t)a3 qualityScore:(int64_t)a4
{
  return (_TtC27SiriVirtualDeviceResolution17SpeakerCapability *)SpeakerCapability.init(status:qualityScore:)(a3, a4);
}

- (int64_t)supportStatus
{
  _TtC27SiriVirtualDeviceResolution17SpeakerCapability *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_1C2ECBE10();
  v4 = v3;

  return v4;
}

- (int64_t)qualityScore
{
  _TtC27SiriVirtualDeviceResolution17SpeakerCapability *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1C2ECBEBC();

  return v3;
}

+ (id)capabilityDescriptionMatchingSupportStatus:(int64_t)a3
{
  id v3;

  sub_1C2ECBF98(a3);
  return v3;
}

+ (id)capabilityDescriptionMatchingQualityScoreRangeWithLowerBound:(int64_t)a3 upperBound:(int64_t)a4
{
  id v4;

  sub_1C2ECBFE4();
  return v4;
}

- (BOOL)matchesWithDescriptions:(id)a3
{
  unint64_t v4;
  _TtC27SiriVirtualDeviceResolution17SpeakerCapability *v5;
  char v6;

  type metadata accessor for CapabilityDescription();
  v4 = sub_1C2EF74D0();
  v5 = self;
  v6 = sub_1C2ECC040(v4);

  swift_bridgeObjectRelease();
  return v6 & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC27SiriVirtualDeviceResolution17SpeakerCapability *v5;

  v4 = a3;
  v5 = self;
  sub_1C2ECC0F8(v4);

}

- (_TtC27SiriVirtualDeviceResolution17SpeakerCapability)initWithCoder:(id)a3
{
  return (_TtC27SiriVirtualDeviceResolution17SpeakerCapability *)SpeakerCapability.init(coder:)(a3);
}

- (_TtC27SiriVirtualDeviceResolution17SpeakerCapability)init
{
  SpeakerCapability.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
