@implementation ProvisioningExternalVerificationFlowItem

- (_TtC9PassKitUI40ProvisioningExternalVerificationFlowItem)init
{
  _TtC9PassKitUI40ProvisioningExternalVerificationFlowItem *result;

  result = (_TtC9PassKitUI40ProvisioningExternalVerificationFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI40ProvisioningExternalVerificationFlowItem_verificationController));
  swift_unknownObjectWeakDestroy();
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI40ProvisioningExternalVerificationFlowItem_delegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI40ProvisioningExternalVerificationFlowItem_reporter));
}

- (void)productViewControllerDidFinish:(id)a3
{
  id v4;
  _TtC9PassKitUI40ProvisioningExternalVerificationFlowItem *v5;

  v4 = a3;
  v5 = self;
  sub_19D7A9C50(v4);

}

@end
