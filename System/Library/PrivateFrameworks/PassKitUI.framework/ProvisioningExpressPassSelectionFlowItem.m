@implementation ProvisioningExpressPassSelectionFlowItem

- (_TtC9PassKitUI40ProvisioningExpressPassSelectionFlowItem)init
{
  _TtC9PassKitUI40ProvisioningExpressPassSelectionFlowItem *result;

  result = (_TtC9PassKitUI40ProvisioningExpressPassSelectionFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI40ProvisioningExpressPassSelectionFlowItem_provisionedPasses));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI40ProvisioningExpressPassSelectionFlowItem_groupsController));
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI40ProvisioningExpressPassSelectionFlowItem_delegate);
  swift_bridgeObjectRelease();
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t ObjectType;
  id v8;
  _TtC9PassKitUI40ProvisioningExpressPassSelectionFlowItem *v9;

  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI40ProvisioningExpressPassSelectionFlowItem_delegate;
  if (MEMORY[0x1A1AE6A68]((char *)self + OBJC_IVAR____TtC9PassKitUI40ProvisioningExpressPassSelectionFlowItem_delegate, a2))
  {
    v6 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType();
    v8 = a3;
    v9 = self;
    sub_19D789E94((uint64_t)v9, (uint64_t)&off_1E3E57E48, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

- (void)viewController:(id)a3 didFinishWithPasses:(id)a4 error:(id)a5
{
  uint64_t v6;
  id v9;
  id v10;
  _TtC9PassKitUI40ProvisioningExpressPassSelectionFlowItem *v11;

  v6 = (uint64_t)a4;
  if (a4)
  {
    sub_19D1A9ED4(0, (unint64_t *)&qword_1EE4B89F0);
    v6 = sub_19DE87E10();
  }
  v9 = a3;
  v10 = a5;
  v11 = self;
  sub_19D80CD38(v6);

  swift_bridgeObjectRelease();
}

@end
