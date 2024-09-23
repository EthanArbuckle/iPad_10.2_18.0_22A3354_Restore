@implementation ProvisioningAutoReloadCompleteFlowItem

- (_TtC9PassKitUI38ProvisioningAutoReloadCompleteFlowItem)init
{
  _TtC9PassKitUI38ProvisioningAutoReloadCompleteFlowItem *result;

  result = (_TtC9PassKitUI38ProvisioningAutoReloadCompleteFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI38ProvisioningAutoReloadCompleteFlowItem_provisionedPasses));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI38ProvisioningAutoReloadCompleteFlowItem_amount));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI38ProvisioningAutoReloadCompleteFlowItem_threshold));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI38ProvisioningAutoReloadCompleteFlowItem_controller));
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI38ProvisioningAutoReloadCompleteFlowItem_delegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI38ProvisioningAutoReloadCompleteFlowItem_reporter));
}

- (void)autoReloadSetupCompleteViewControllerDidComplete
{
  char *v3;
  uint64_t v4;
  uint64_t ObjectType;
  _TtC9PassKitUI38ProvisioningAutoReloadCompleteFlowItem *v6;

  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI38ProvisioningAutoReloadCompleteFlowItem_delegate;
  if (MEMORY[0x1A1AE6A68]((char *)self + OBJC_IVAR____TtC9PassKitUI38ProvisioningAutoReloadCompleteFlowItem_delegate, a2))
  {
    v4 = *((_QWORD *)v3 + 1);
    ObjectType = swift_getObjectType();
    v6 = self;
    sub_19D789E94((uint64_t)v6, (uint64_t)&off_1E3E4ED20, ObjectType, v4);

    swift_unknownObjectRelease();
  }
}

@end
