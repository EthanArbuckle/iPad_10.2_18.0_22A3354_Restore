@implementation PaymentSetupServiceProviderProductsFlowItem

- (_TtC9PassKitUI43PaymentSetupServiceProviderProductsFlowItem)init
{
  _TtC9PassKitUI43PaymentSetupServiceProviderProductsFlowItem *result;

  result = (_TtC9PassKitUI43PaymentSetupServiceProviderProductsFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI43PaymentSetupServiceProviderProductsFlowItem_product));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI43PaymentSetupServiceProviderProductsFlowItem_viewController));
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI43PaymentSetupServiceProviderProductsFlowItem_delegate);
  swift_bridgeObjectRelease();
}

- (void)purchaseServiceProviderProductsViewController:(id)a3 didSelectServiceProviderProduct:(id)a4
{
  id v6;
  id v7;
  _TtC9PassKitUI43PaymentSetupServiceProviderProductsFlowItem *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_19D544128(v7);

}

@end
