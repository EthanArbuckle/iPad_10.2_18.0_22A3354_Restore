@implementation ProvisioningMakeDefaultFlowItem

- (_TtC9PassKitUI31ProvisioningMakeDefaultFlowItem)init
{
  _TtC9PassKitUI31ProvisioningMakeDefaultFlowItem *result;

  result = (_TtC9PassKitUI31ProvisioningMakeDefaultFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI31ProvisioningMakeDefaultFlowItem_provisionedPasses));
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI31ProvisioningMakeDefaultFlowItem_delegate);
  swift_bridgeObjectRelease();
}

- (void)paymentPassMakeDefaultViewControllerDidFinish:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t ObjectType;
  id v8;
  _TtC9PassKitUI31ProvisioningMakeDefaultFlowItem *v9;

  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI31ProvisioningMakeDefaultFlowItem_delegate;
  if (MEMORY[0x1A1AE6A68]((char *)self + OBJC_IVAR____TtC9PassKitUI31ProvisioningMakeDefaultFlowItem_delegate, a2))
  {
    v6 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType();
    v8 = a3;
    v9 = self;
    sub_19D789E94((uint64_t)v9, (uint64_t)&off_1E3E2AFC8, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

@end
