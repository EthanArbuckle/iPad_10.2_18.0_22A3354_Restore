@implementation PMDevice

- (NSString)deviceName
{
  return (NSString *)sub_24368D5E8();
}

- (NSString)operatingSystemName
{
  return (NSString *)sub_24368D5E8();
}

- (NSString)operatingSystemVersion
{
  return (NSString *)sub_24368D5E8();
}

- (NSString)deviceImageSymbolName
{
  return (NSString *)sub_24368D5E8();
}

- (PMDevice)initWithDeviceName:(id)a3 operatingSystemName:(id)a4 operatingSystemVersion:(id)a5 deviceImageSymbolName:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  objc_super v23;

  v7 = sub_243850264();
  v9 = v8;
  v10 = sub_243850264();
  v12 = v11;
  v13 = sub_243850264();
  v15 = v14;
  v16 = sub_243850264();
  v17 = (uint64_t *)((char *)self + OBJC_IVAR___PMDevice_deviceName);
  *v17 = v7;
  v17[1] = v9;
  v18 = (uint64_t *)((char *)self + OBJC_IVAR___PMDevice_operatingSystemName);
  *v18 = v10;
  v18[1] = v12;
  v19 = (uint64_t *)((char *)self + OBJC_IVAR___PMDevice_operatingSystemVersion);
  *v19 = v13;
  v19[1] = v15;
  v20 = (uint64_t *)((char *)self + OBJC_IVAR___PMDevice_deviceImageSymbolName);
  *v20 = v16;
  v20[1] = v21;
  v23.receiver = self;
  v23.super_class = (Class)PMDevice;
  return -[PMDevice init](&v23, sel_init);
}

- (PMDevice)init
{
  PMDevice *result;

  result = (PMDevice *)_swift_stdlib_reportUnimplementedInitializer();
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
