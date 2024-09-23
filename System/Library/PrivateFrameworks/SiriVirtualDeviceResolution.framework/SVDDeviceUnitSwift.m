@implementation SVDDeviceUnitSwift

+ (BOOL)supportsSecureCoding
{
  char v2;

  static DeviceUnit.supportsSecureCoding.getter();
  return v2 & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static DeviceUnit.supportsSecureCoding.setter(a3);
}

- (NSString)identifier
{
  return (NSString *)sub_1C2ED5728((uint64_t)self, (uint64_t)a2, DeviceUnit.identifier.getter);
}

- (NSString)assistantId
{
  return (NSString *)sub_1C2ED5728((uint64_t)self, (uint64_t)a2, DeviceUnit.assistantId.getter);
}

- (NSString)name
{
  return (NSString *)sub_1C2ED57A0((uint64_t)self, (uint64_t)a2, DeviceUnit.name.getter);
}

- (NSString)roomName
{
  return (NSString *)sub_1C2ED57A0((uint64_t)self, (uint64_t)a2, DeviceUnit.roomName.getter);
}

- (int64_t)proximity
{
  return DeviceUnit.proximity.getter();
}

- (NSString)mediaRouteIdentifier
{
  return (NSString *)sub_1C2ED57A0((uint64_t)self, (uint64_t)a2, DeviceUnit.mediaRouteIdentifier.getter);
}

- (BOOL)isCommunalDevice
{
  return DeviceUnit.isCommunalDevice.getter() & 1;
}

- (NSString)homeKitAccessoryIdentifier
{
  return (NSString *)sub_1C2ED57A0((uint64_t)self, (uint64_t)a2, DeviceUnit.homeKitAccessoryIdentifier.getter);
}

- (SVDDeviceUnitSwift)initWithIdentifier:(id)a3 assistantId:(id)a4 builder:(id)a5
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)();
  SVDDeviceUnitSwift *result;

  v5 = _Block_copy(a5);
  v6 = sub_1C2EF741C();
  v8 = v7;
  v9 = sub_1C2EF741C();
  v11 = v10;
  if (v5)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v5;
    v12 = sub_1C2ED90C0;
  }
  else
  {
    v12 = 0;
  }
  DeviceUnit.init(identifier:assistantId:builder:)(v6, v8, v9, v11, (void (*)(uint64_t))v12);
  return result;
}

- (SVDDeviceUnitSwift)initWithCoder:(id)a3
{
  return (SVDDeviceUnitSwift *)DeviceUnit.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SVDDeviceUnitSwift *v5;

  v4 = a3;
  v5 = self;
  sub_1C2ED6270(v4);

}

- (NSString)description
{
  SVDDeviceUnitSwift *v2;
  void *v3;

  v2 = self;
  sub_1C2ED6500();

  v3 = (void *)sub_1C2EF7410();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  return sub_1C2ED8004(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_1C2ED6760);
}

- (int64_t)hash
{
  SVDDeviceUnitSwift *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1C2ED6848();

  return v3;
}

- (SVDDeviceUnitSwift)init
{
  DeviceUnit.init()();
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_86();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_50_0();
}

@end
