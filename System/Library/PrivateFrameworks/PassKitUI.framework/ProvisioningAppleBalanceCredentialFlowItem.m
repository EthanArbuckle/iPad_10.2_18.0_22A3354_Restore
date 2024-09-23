@implementation ProvisioningAppleBalanceCredentialFlowItem

- (_TtC9PassKitUI42ProvisioningAppleBalanceCredentialFlowItem)init
{
  _TtC9PassKitUI42ProvisioningAppleBalanceCredentialFlowItem *result;

  result = (_TtC9PassKitUI42ProvisioningAppleBalanceCredentialFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI42ProvisioningAppleBalanceCredentialFlowItem_setupController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI42ProvisioningAppleBalanceCredentialFlowItem_viewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI42ProvisioningAppleBalanceCredentialFlowItem_provisionedPasses));
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI42ProvisioningAppleBalanceCredentialFlowItem_delegate);
  swift_bridgeObjectRelease();
}

- (void)provisioningViewController:(id)a3 didFinishWithSuccess:(BOOL)a4
{
  char *v6;
  uint64_t v7;
  uint64_t ObjectType;
  id v9;
  _TtC9PassKitUI42ProvisioningAppleBalanceCredentialFlowItem *v10;

  v6 = (char *)self + OBJC_IVAR____TtC9PassKitUI42ProvisioningAppleBalanceCredentialFlowItem_delegate;
  if (MEMORY[0x1A1AE6A68]((char *)self + OBJC_IVAR____TtC9PassKitUI42ProvisioningAppleBalanceCredentialFlowItem_delegate, a2, a3, a4))
  {
    v7 = *((_QWORD *)v6 + 1);
    ObjectType = swift_getObjectType();
    v9 = a3;
    v10 = self;
    sub_19D789E94((uint64_t)v10, (uint64_t)&off_1E3E3BB48, ObjectType, v7);

    swift_unknownObjectRelease();
  }
}

@end
