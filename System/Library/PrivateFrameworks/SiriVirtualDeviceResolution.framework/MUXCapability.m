@implementation MUXCapability

- (NSString)key
{
  void *v2;

  sub_1C2EEF0FC();
  v2 = (void *)sub_1C2EF7410();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC27SiriVirtualDeviceResolution13MUXCapability *v7;

  v4 = sub_1C2EF741C();
  v6 = v5;
  v7 = self;
  sub_1C2EEF1A8(v4, v6);

}

- (_TtC27SiriVirtualDeviceResolution13MUXCapability)initWithStatus:(int64_t)a3
{
  return (_TtC27SiriVirtualDeviceResolution13MUXCapability *)MUXCapability.init(status:)(a3);
}

- (int64_t)supportsMUX
{
  _TtC27SiriVirtualDeviceResolution13MUXCapability *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_1C2EEF454();
  v4 = v3;

  return v4;
}

+ (id)capabilityDescriptionMatchingSupportStatus:(int64_t)a3
{
  id v3;

  sub_1C2EEF4E0(a3);
  return v3;
}

- (BOOL)matchesWithDescriptions:(id)a3
{
  unint64_t v4;
  _TtC27SiriVirtualDeviceResolution13MUXCapability *v5;
  char v6;

  type metadata accessor for CapabilityDescription();
  v4 = sub_1C2EF74D0();
  v5 = self;
  v6 = sub_1C2EEF52C(v4);

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
  _TtC27SiriVirtualDeviceResolution13MUXCapability *v5;

  v4 = a3;
  v5 = self;
  sub_1C2EEF5E4(v4);

}

- (_TtC27SiriVirtualDeviceResolution13MUXCapability)initWithCoder:(id)a3
{
  return (_TtC27SiriVirtualDeviceResolution13MUXCapability *)MUXCapability.init(coder:)(a3);
}

- (_TtC27SiriVirtualDeviceResolution13MUXCapability)init
{
  MUXCapability.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
