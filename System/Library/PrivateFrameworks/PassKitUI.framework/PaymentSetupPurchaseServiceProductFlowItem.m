@implementation PaymentSetupPurchaseServiceProductFlowItem

- (_TtC9PassKitUI42PaymentSetupPurchaseServiceProductFlowItem)init
{
  _TtC9PassKitUI42PaymentSetupPurchaseServiceProductFlowItem *result;

  result = (_TtC9PassKitUI42PaymentSetupPurchaseServiceProductFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI42PaymentSetupPurchaseServiceProductFlowItem_product));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI42PaymentSetupPurchaseServiceProductFlowItem_serviceProviderProduct));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI42PaymentSetupPurchaseServiceProductFlowItem_viewController));
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI42PaymentSetupPurchaseServiceProductFlowItem_delegate);
  swift_bridgeObjectRelease();
}

- (void)purchaseServiceProviderProductItemsViewController:(id)a3 didPerformPurchaseWithCredential:(id)a4
{
  id v6;
  id v7;
  _TtC9PassKitUI42PaymentSetupPurchaseServiceProductFlowItem *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_19D555218(v6, v7);

}

- (void)purchaseServiceProviderProductItemsViewControllerDidTerminate:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t ObjectType;
  id v8;
  _TtC9PassKitUI42PaymentSetupPurchaseServiceProductFlowItem *v9;

  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI42PaymentSetupPurchaseServiceProductFlowItem_delegate;
  if (MEMORY[0x1A1AE6A68]((char *)self + OBJC_IVAR____TtC9PassKitUI42PaymentSetupPurchaseServiceProductFlowItem_delegate, a2))
  {
    v6 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType();
    v8 = a3;
    v9 = self;
    sub_19D789E94((uint64_t)v9, (uint64_t)&off_1E3E41528, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

@end
