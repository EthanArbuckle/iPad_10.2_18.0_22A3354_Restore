@implementation AudioPlaybackCapability

- (NSString)key
{
  void *v2;

  sub_1C2ECDAB8();
  v2 = (void *)sub_1C2EF7410();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC27SiriVirtualDeviceResolution23AudioPlaybackCapability *v7;

  v4 = sub_1C2EF741C();
  v6 = v5;
  v7 = self;
  sub_1C2ECDB64(v4, v6);

}

- (_TtC27SiriVirtualDeviceResolution23AudioPlaybackCapability)initWithStatus:(int64_t)a3
{
  return (_TtC27SiriVirtualDeviceResolution23AudioPlaybackCapability *)AudioPlaybackCapability.init(status:)(a3);
}

- (int64_t)supportsAudioPlayback
{
  _TtC27SiriVirtualDeviceResolution23AudioPlaybackCapability *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_1C2ECDE38();
  v4 = v3;

  return v4;
}

+ (id)capabilityDescriptionMatchingSupportStatus:(int64_t)a3
{
  id v3;

  sub_1C2ECDEC4(a3);
  return v3;
}

- (BOOL)matchesWithDescriptions:(id)a3
{
  unint64_t v4;
  _TtC27SiriVirtualDeviceResolution23AudioPlaybackCapability *v5;
  char v6;

  type metadata accessor for CapabilityDescription();
  v4 = sub_1C2EF74D0();
  v5 = self;
  v6 = sub_1C2ECDF10(v4);

  swift_bridgeObjectRelease();
  return v6 & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC27SiriVirtualDeviceResolution23AudioPlaybackCapability)initWithCoder:(id)a3
{
  return (_TtC27SiriVirtualDeviceResolution23AudioPlaybackCapability *)AudioPlaybackCapability.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC27SiriVirtualDeviceResolution23AudioPlaybackCapability *v5;

  v4 = a3;
  v5 = self;
  sub_1C2ECE0E8(v4);

}

- (_TtC27SiriVirtualDeviceResolution23AudioPlaybackCapability)init
{
  AudioPlaybackCapability.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
