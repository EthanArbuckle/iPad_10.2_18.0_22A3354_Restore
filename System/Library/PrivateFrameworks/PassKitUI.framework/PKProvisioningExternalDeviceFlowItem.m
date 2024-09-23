@implementation PKProvisioningExternalDeviceFlowItem

- (PKProvisioningExternalDeviceFlowItem)initWithContext:(id)a3 pass:(id)a4 externalOptions:(id)a5 cardIdentifier:(id)a6
{
  sub_19DE87BF4();
  return (PKProvisioningExternalDeviceFlowItem *)ProvisioningExternalDeviceFlowItem.init(context:pass:externalOptions:cardIdentifier:)(a3, a4, a5);
}

- (id)extract
{
  char *v3;

  v3 = (char *)objc_allocWithZone((Class)type metadata accessor for ExtractedUIFlowItem());
  return sub_19D5C212C(self, v3);
}

- (PKProvisioningExternalDeviceFlowItem)init
{
  PKProvisioningExternalDeviceFlowItem *result;

  result = (PKProvisioningExternalDeviceFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  sub_19D1A2C50((uint64_t)self + OBJC_IVAR___PKProvisioningExternalDeviceFlowItem_delegate);
  swift_bridgeObjectRelease();

}

@end
