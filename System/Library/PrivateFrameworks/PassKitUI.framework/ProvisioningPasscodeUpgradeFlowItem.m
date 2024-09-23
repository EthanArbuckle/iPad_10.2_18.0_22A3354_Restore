@implementation ProvisioningPasscodeUpgradeFlowItem

- (_TtC9PassKitUI35ProvisioningPasscodeUpgradeFlowItem)init
{
  _TtC9PassKitUI35ProvisioningPasscodeUpgradeFlowItem *result;

  result = (_TtC9PassKitUI35ProvisioningPasscodeUpgradeFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI35ProvisioningPasscodeUpgradeFlowItem_passcodeController));
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI35ProvisioningPasscodeUpgradeFlowItem_delegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI35ProvisioningPasscodeUpgradeFlowItem_reporter));
}

- (id)topViewController
{
  _TtC9PassKitUI35ProvisioningPasscodeUpgradeFlowItem *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_19D7C3B24();

  return v3;
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  id v6;
  _TtC9PassKitUI35ProvisioningPasscodeUpgradeFlowItem *v7;

  v6 = a3;
  v7 = self;
  sub_19D7C3CAC((uint64_t)v6, a4);

}

@end
