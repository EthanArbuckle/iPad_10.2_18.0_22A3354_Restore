@implementation ProvisioningOptionalExpressSetupFlowItem

- (_TtC9PassKitUI40ProvisioningOptionalExpressSetupFlowItem)init
{
  _TtC9PassKitUI40ProvisioningOptionalExpressSetupFlowItem *result;

  result = (_TtC9PassKitUI40ProvisioningOptionalExpressSetupFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI40ProvisioningOptionalExpressSetupFlowItem_provisionedPasses));
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI40ProvisioningOptionalExpressSetupFlowItem_delegate);
  swift_bridgeObjectRelease();
}

- (void)optionalExpressModeViewControllerDidFinish:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t ObjectType;
  id v8;
  _TtC9PassKitUI40ProvisioningOptionalExpressSetupFlowItem *v9;

  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI40ProvisioningOptionalExpressSetupFlowItem_delegate;
  if (MEMORY[0x1A1AE6A68]((char *)self + OBJC_IVAR____TtC9PassKitUI40ProvisioningOptionalExpressSetupFlowItem_delegate, a2))
  {
    v6 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType();
    v8 = a3;
    v9 = self;
    sub_19D789E94((uint64_t)v9, (uint64_t)&off_1E3E51F30, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

@end
