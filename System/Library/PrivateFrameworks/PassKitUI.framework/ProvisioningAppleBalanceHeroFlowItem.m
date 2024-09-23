@implementation ProvisioningAppleBalanceHeroFlowItem

- (_TtC9PassKitUI36ProvisioningAppleBalanceHeroFlowItem)init
{
  _TtC9PassKitUI36ProvisioningAppleBalanceHeroFlowItem *result;

  result = (_TtC9PassKitUI36ProvisioningAppleBalanceHeroFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI36ProvisioningAppleBalanceHeroFlowItem_setupController));
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI36ProvisioningAppleBalanceHeroFlowItem_delegate);
  swift_bridgeObjectRelease();
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  id v4;
  _TtC9PassKitUI36ProvisioningAppleBalanceHeroFlowItem *v5;

  v4 = a3;
  v5 = self;
  sub_19D81D538();

}

- (void)appleBalanceExplanationViewControllerDidSelectContinue:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t ObjectType;
  id v8;
  _TtC9PassKitUI36ProvisioningAppleBalanceHeroFlowItem *v9;

  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI36ProvisioningAppleBalanceHeroFlowItem_delegate;
  if (MEMORY[0x1A1AE6A68]((char *)self + OBJC_IVAR____TtC9PassKitUI36ProvisioningAppleBalanceHeroFlowItem_delegate, a2))
  {
    v6 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType();
    v8 = a3;
    v9 = self;
    sub_19D789E94((uint64_t)v9, (uint64_t)&off_1E3E58920, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

@end
