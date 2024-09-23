@implementation ProvisioningReaderModeDetailsFlowItem

- (_TtC9PassKitUI37ProvisioningReaderModeDetailsFlowItem)init
{
  _TtC9PassKitUI37ProvisioningReaderModeDetailsFlowItem *result;

  result = (_TtC9PassKitUI37ProvisioningReaderModeDetailsFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI37ProvisioningReaderModeDetailsFlowItem_product));
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI37ProvisioningReaderModeDetailsFlowItem_delegate);
  swift_bridgeObjectRelease();
}

- (void)provisioningViewController:(id)a3 didFinishWithSuccess:(BOOL)a4
{
  id v7;
  _TtC9PassKitUI37ProvisioningReaderModeDetailsFlowItem *v8;

  v7 = a3;
  v8 = self;
  sub_19D21AC04(a3, a4);

}

@end
