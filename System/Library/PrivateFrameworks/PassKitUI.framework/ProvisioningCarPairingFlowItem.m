@implementation ProvisioningCarPairingFlowItem

- (_TtC9PassKitUI30ProvisioningCarPairingFlowItem)init
{
  _TtC9PassKitUI30ProvisioningCarPairingFlowItem *result;

  result = (_TtC9PassKitUI30ProvisioningCarPairingFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI30ProvisioningCarPairingFlowItem_delegate);
  swift_bridgeObjectRelease();
}

- (void)subcredentialProvisioningFlowController:(id)a3 didFinishWithPass:(id)a4 error:(id)a5
{
  id v8;
  _TtC9PassKitUI30ProvisioningCarPairingFlowItem *v9;
  id v10;

  swift_unknownObjectRetain();
  v8 = a4;
  v9 = self;
  v10 = a5;
  sub_19D80DE50(a4, a5);
  swift_unknownObjectRelease();

}

- (void)userCanceledPairingWithSubcredentialProvisioningFlowController:(id)a3
{
  char *v4;
  uint64_t v5;
  uint64_t ObjectType;
  _TtC9PassKitUI30ProvisioningCarPairingFlowItem *v7;

  v4 = (char *)self + OBJC_IVAR____TtC9PassKitUI30ProvisioningCarPairingFlowItem_delegate;
  if (MEMORY[0x1A1AE6A68]((char *)self + OBJC_IVAR____TtC9PassKitUI30ProvisioningCarPairingFlowItem_delegate, a2))
  {
    v5 = *((_QWORD *)v4 + 1);
    ObjectType = swift_getObjectType();
    swift_unknownObjectRetain();
    v7 = self;
    sub_19D789E94((uint64_t)v7, (uint64_t)&off_1E3E57F20, ObjectType, v5);
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
  }
}

@end
