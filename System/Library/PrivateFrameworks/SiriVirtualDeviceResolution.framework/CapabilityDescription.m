@implementation CapabilityDescription

- (NSString)key
{
  void *v2;

  CapabilityDescription.key.getter();
  v2 = (void *)sub_1C2EF7410();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSSet)valueSet
{
  void *v2;

  if (CapabilityDescription.valueSet.getter())
  {
    sub_1C2ECABD4(0, (unint64_t *)&qword_1EF7D3200);
    sub_1C2EDBCC8();
    v2 = (void *)sub_1C2EF7548();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSSet *)v2;
}

- (NSString)capabilityKey
{
  _TtC27SiriVirtualDeviceResolution21CapabilityDescription *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  CapabilityDescription.capabilityKey.getter();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1C2EF7410();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSNumber)valueRangeLowerBound
{
  _TtC27SiriVirtualDeviceResolution21CapabilityDescription *v2;
  id v3;

  v2 = self;
  v3 = CapabilityDescription.valueRangeLowerBound.getter();

  return (NSNumber *)v3;
}

- (NSNumber)valueRangeUpperBound
{
  _TtC27SiriVirtualDeviceResolution21CapabilityDescription *v2;
  id v3;

  v2 = self;
  v3 = CapabilityDescription.valueRangeUpperBound.getter();

  return (NSNumber *)v3;
}

- (_TtC27SiriVirtualDeviceResolution21CapabilityDescription)initWithKey:(id)a3 valueSet:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = sub_1C2EF741C();
  v6 = v5;
  sub_1C2ECABD4(0, (unint64_t *)&qword_1EF7D3200);
  sub_1C2EDBCC8();
  v7 = sub_1C2EF7554();
  return (_TtC27SiriVirtualDeviceResolution21CapabilityDescription *)CapabilityDescription.init(key:valueSet:)(v4, v6, v7);
}

- (_TtC27SiriVirtualDeviceResolution21CapabilityDescription)initWithKey:(id)a3 lowerbound:(double)a4 upperbound:(double)a5
{
  uint64_t v7;
  uint64_t v8;
  _TtC27SiriVirtualDeviceResolution21CapabilityDescription *result;

  v7 = sub_1C2EF741C();
  CapabilityDescription.init(key:lowerbound:upperbound:)(v7, v8, a4, a5);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return static CapabilityDescription.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static CapabilityDescription.supportsSecureCoding.setter(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC27SiriVirtualDeviceResolution21CapabilityDescription *v5;

  v4 = a3;
  v5 = self;
  CapabilityDescription.encode(with:)((NSCoder)v4);

}

- (_TtC27SiriVirtualDeviceResolution21CapabilityDescription)initWithCoder:(id)a3
{
  _TtC27SiriVirtualDeviceResolution21CapabilityDescription *result;

  CapabilityDescription.init(coder:)(a3);
  return result;
}

- (id)copyWithZone:(void *)a3
{
  _TtC27SiriVirtualDeviceResolution21CapabilityDescription *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  CapabilityDescription.copy(with:)(v6);

  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  v4 = (void *)sub_1C2EF792C();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (NSString)description
{
  _TtC27SiriVirtualDeviceResolution21CapabilityDescription *v2;
  void *v3;

  v2 = self;
  CapabilityDescription.description.getter((uint64_t)v2);

  v3 = (void *)sub_1C2EF7410();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC27SiriVirtualDeviceResolution21CapabilityDescription)init
{
  CapabilityDescription.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
