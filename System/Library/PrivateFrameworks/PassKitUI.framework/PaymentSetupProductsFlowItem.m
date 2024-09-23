@implementation PaymentSetupProductsFlowItem

- (_TtC9PassKitUIP33_72014EF847C2945C10179480F21D54B228PaymentSetupProductsFlowItem)init
{
  _TtC9PassKitUIP33_72014EF847C2945C10179480F21D54B228PaymentSetupProductsFlowItem *result;

  result = (_TtC9PassKitUIP33_72014EF847C2945C10179480F21D54B228PaymentSetupProductsFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUIP33_72014EF847C2945C10179480F21D54B228PaymentSetupProductsFlowItem_category));
  swift_bridgeObjectRelease();
  sub_19D1A2C50((uint64_t)self+ OBJC_IVAR____TtC9PassKitUIP33_72014EF847C2945C10179480F21D54B228PaymentSetupProductsFlowItem_delegate);
  swift_bridgeObjectRelease();
}

- (void)productsViewControllerDidSelectManualEntry:(id)a3
{
  id v4;
  _TtC9PassKitUIP33_72014EF847C2945C10179480F21D54B228PaymentSetupProductsFlowItem *v5;

  v4 = a3;
  v5 = self;
  sub_19D1A29C0();

}

- (void)productsViewController:(id)a3 didSelectProduct:(id)a4
{
  id v6;
  id v7;
  _TtC9PassKitUIP33_72014EF847C2945C10179480F21D54B228PaymentSetupProductsFlowItem *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_19D1A2A90(v7);

}

@end
