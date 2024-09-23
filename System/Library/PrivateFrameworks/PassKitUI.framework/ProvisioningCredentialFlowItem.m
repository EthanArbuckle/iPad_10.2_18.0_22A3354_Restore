@implementation ProvisioningCredentialFlowItem

- (_TtC9PassKitUI30ProvisioningCredentialFlowItem)init
{
  _TtC9PassKitUI30ProvisioningCredentialFlowItem *result;

  result = (_TtC9PassKitUI30ProvisioningCredentialFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI30ProvisioningCredentialFlowItem_viewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI30ProvisioningCredentialFlowItem_provisionedPasses));
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI30ProvisioningCredentialFlowItem_delegate);
  swift_bridgeObjectRelease();
}

- (void)provisioningViewController:(id)a3 didFinishWithSuccess:(BOOL)a4
{
  char *v6;
  uint64_t v7;
  uint64_t ObjectType;
  id v9;
  _TtC9PassKitUI30ProvisioningCredentialFlowItem *v10;

  v6 = (char *)self + OBJC_IVAR____TtC9PassKitUI30ProvisioningCredentialFlowItem_delegate;
  if (MEMORY[0x1A1AE6A68]((char *)self + OBJC_IVAR____TtC9PassKitUI30ProvisioningCredentialFlowItem_delegate, a2, a3, a4))
  {
    v7 = *((_QWORD *)v6 + 1);
    ObjectType = swift_getObjectType();
    v9 = a3;
    v10 = self;
    sub_19D789E94((uint64_t)v10, (uint64_t)&off_1E3E582E0, ObjectType, v7);

    swift_unknownObjectRelease();
  }
}

- (void)provisioningViewControllerDidSelectManualEntry:(id)a3
{
  id v4;
  _TtC9PassKitUI30ProvisioningCredentialFlowItem *v5;

  v4 = a3;
  v5 = self;
  sub_19D81294C();

}

@end
