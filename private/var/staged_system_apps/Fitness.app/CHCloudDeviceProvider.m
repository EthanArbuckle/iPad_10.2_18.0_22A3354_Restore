@implementation CHCloudDeviceProvider

- (BOOL)oldDevicesExist
{
  CHCloudDeviceProvider *v2;
  _QWORD *v3;
  uint64_t v4;

  v2 = self;
  v3 = sub_1002ACD40();
  v4 = v3[2];

  swift_bridgeObjectRelease(v3);
  return v4 != 0;
}

- (CHCloudDeviceProvider)init
{
  CHCloudDeviceProvider *result;

  result = (CHCloudDeviceProvider *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.CloudDeviceProvider", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CHCloudDeviceProvider_accountDeviceProvider));
}

@end
