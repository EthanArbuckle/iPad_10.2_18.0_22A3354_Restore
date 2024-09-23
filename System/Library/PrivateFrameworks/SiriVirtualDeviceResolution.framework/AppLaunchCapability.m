@implementation AppLaunchCapability

- (NSString)key
{
  void *v2;

  sub_1C2EEFCF0();
  v2 = (void *)sub_1C2EF7410();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC27SiriVirtualDeviceResolution19AppLaunchCapability *v7;

  v4 = sub_1C2EF741C();
  v6 = v5;
  v7 = self;
  sub_1C2EEFD9C(v4, v6);

}

- (_TtC27SiriVirtualDeviceResolution19AppLaunchCapability)initWithStatus:(int64_t)a3
{
  return (_TtC27SiriVirtualDeviceResolution19AppLaunchCapability *)AppLaunchCapability.init(status:)(a3);
}

- (int64_t)supportsAppLaunch
{
  _TtC27SiriVirtualDeviceResolution19AppLaunchCapability *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_1C2EF0048();
  v4 = v3;

  return v4;
}

+ (id)capabilityDescriptionMatchingSupportStatus:(int64_t)a3
{
  id v3;

  sub_1C2EF00D4(a3);
  return v3;
}

- (BOOL)matchesWithDescriptions:(id)a3
{
  unint64_t v4;
  _TtC27SiriVirtualDeviceResolution19AppLaunchCapability *v5;
  char v6;

  type metadata accessor for CapabilityDescription();
  v4 = sub_1C2EF74D0();
  v5 = self;
  v6 = sub_1C2EF0120(v4);

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
  _TtC27SiriVirtualDeviceResolution19AppLaunchCapability *v5;

  v4 = a3;
  v5 = self;
  sub_1C2EF01D8(v4);

}

- (_TtC27SiriVirtualDeviceResolution19AppLaunchCapability)initWithCoder:(id)a3
{
  return (_TtC27SiriVirtualDeviceResolution19AppLaunchCapability *)AppLaunchCapability.init(coder:)(a3);
}

- (_TtC27SiriVirtualDeviceResolution19AppLaunchCapability)init
{
  AppLaunchCapability.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
