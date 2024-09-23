@implementation PaymentSetupUpLeveledPurchaseServiceProductFlowItem

- (_TtC9PassKitUI51PaymentSetupUpLeveledPurchaseServiceProductFlowItem)init
{
  _TtC9PassKitUI51PaymentSetupUpLeveledPurchaseServiceProductFlowItem *result;

  result = (_TtC9PassKitUI51PaymentSetupUpLeveledPurchaseServiceProductFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI51PaymentSetupUpLeveledPurchaseServiceProductFlowItem_product));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI51PaymentSetupUpLeveledPurchaseServiceProductFlowItem_viewController));
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI51PaymentSetupUpLeveledPurchaseServiceProductFlowItem_delegate);
  swift_bridgeObjectRelease();
}

- (void)purchaseServiceProviderProductItemsViewController:(id)a3 didPerformPurchaseWithCredential:(id)a4
{
  id v6;
  id v7;
  _TtC9PassKitUI51PaymentSetupUpLeveledPurchaseServiceProductFlowItem *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_19D208F5C(v6, v7);

}

- (void)purchaseServiceProviderProductItemsViewControllerDidTerminate:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t ObjectType;
  id v8;
  _TtC9PassKitUI51PaymentSetupUpLeveledPurchaseServiceProductFlowItem *v9;

  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI51PaymentSetupUpLeveledPurchaseServiceProductFlowItem_delegate;
  if (MEMORY[0x1A1AE6A68]((char *)self + OBJC_IVAR____TtC9PassKitUI51PaymentSetupUpLeveledPurchaseServiceProductFlowItem_delegate, a2))
  {
    v6 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType();
    v8 = a3;
    v9 = self;
    sub_19D789E94((uint64_t)v9, (uint64_t)&off_1E3E28F88, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

@end
