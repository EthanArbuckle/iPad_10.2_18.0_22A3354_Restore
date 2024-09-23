@implementation PaymentSetupPurchaseProductFlowItem

- (_TtC9PassKitUI35PaymentSetupPurchaseProductFlowItem)init
{
  _TtC9PassKitUI35PaymentSetupPurchaseProductFlowItem *result;

  result = (_TtC9PassKitUI35PaymentSetupPurchaseProductFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI35PaymentSetupPurchaseProductFlowItem_viewController));
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI35PaymentSetupPurchaseProductFlowItem_delegate);
  swift_bridgeObjectRelease();
}

- (void)purchaseViewControllerDidRequestTransferBalance:(id)a3
{
  id v4;
  _TtC9PassKitUI35PaymentSetupPurchaseProductFlowItem *v5;

  v4 = a3;
  v5 = self;
  sub_19D74D090();

}

- (void)purchaseViewController:(id)a3 didPerformPurchaseWithCredential:(id)a4
{
  id v6;
  id v7;
  _TtC9PassKitUI35PaymentSetupPurchaseProductFlowItem *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_19D74CE50(v6, v7);

}

@end
