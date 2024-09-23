@implementation ProvisioningAutoReloadSetUpFlowItem

- (_TtC9PassKitUI35ProvisioningAutoReloadSetUpFlowItem)init
{
  _TtC9PassKitUI35ProvisioningAutoReloadSetUpFlowItem *result;

  result = (_TtC9PassKitUI35ProvisioningAutoReloadSetUpFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI35ProvisioningAutoReloadSetUpFlowItem_provisionedPasses));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI35ProvisioningAutoReloadSetUpFlowItem_controller));
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI35ProvisioningAutoReloadSetUpFlowItem_delegate);
  swift_bridgeObjectRelease();
}

- (void)autoReloadSetupControllerDidCompleteWithAmount:(id)a3 threshold:(id)a4
{
  id v6;
  id v7;
  _TtC9PassKitUI35ProvisioningAutoReloadSetUpFlowItem *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_19D709684(v6, v7);

}

- (void)autoReloadSetupControllerDidCancel:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t ObjectType;
  id v8;
  _TtC9PassKitUI35ProvisioningAutoReloadSetUpFlowItem *v9;

  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI35ProvisioningAutoReloadSetUpFlowItem_delegate;
  if (MEMORY[0x1A1AE6A68]((char *)self + OBJC_IVAR____TtC9PassKitUI35ProvisioningAutoReloadSetUpFlowItem_delegate, a2))
  {
    v6 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType();
    v8 = a3;
    v9 = self;
    sub_19D789E94((uint64_t)v9, (uint64_t)&off_1E3E4ED70, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

@end
