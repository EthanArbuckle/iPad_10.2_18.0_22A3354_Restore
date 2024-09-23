@implementation ProvisioningAppleCardFlowItem

- (_TtC9PassKitUI29ProvisioningAppleCardFlowItem)init
{
  _TtC9PassKitUI29ProvisioningAppleCardFlowItem *result;

  result = (_TtC9PassKitUI29ProvisioningAppleCardFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI29ProvisioningAppleCardFlowItem_accountFlowController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI29ProvisioningAppleCardFlowItem_provisionedPasses));
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI29ProvisioningAppleCardFlowItem_delegate);
  swift_bridgeObjectRelease();
}

- (void)nextViewControllerWithCompletion:(id)a3
{
  void *v4;
  void (*v5)(uint64_t, uint64_t);
  _TtC9PassKitUI29ProvisioningAppleCardFlowItem *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v4;
    v5 = sub_19D2CF484;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  sub_19D2CF0A8(v5);
  sub_19D1A9F60((uint64_t)v5);

}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t ObjectType;
  id v8;
  _TtC9PassKitUI29ProvisioningAppleCardFlowItem *v9;

  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI29ProvisioningAppleCardFlowItem_delegate;
  if (MEMORY[0x1A1AE6A68]((char *)self + OBJC_IVAR____TtC9PassKitUI29ProvisioningAppleCardFlowItem_delegate, a2))
  {
    v6 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType();
    v8 = a3;
    v9 = self;
    sub_19D789E94((uint64_t)v9, (uint64_t)&off_1E3E2CBF8, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

@end
