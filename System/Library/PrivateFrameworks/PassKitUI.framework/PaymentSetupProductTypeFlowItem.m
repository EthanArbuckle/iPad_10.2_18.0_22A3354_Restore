@implementation PaymentSetupProductTypeFlowItem

- (_TtC9PassKitUI31PaymentSetupProductTypeFlowItem)init
{
  _TtC9PassKitUI31PaymentSetupProductTypeFlowItem *result;

  result = (_TtC9PassKitUI31PaymentSetupProductTypeFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI31PaymentSetupProductTypeFlowItem_viewController));
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI31PaymentSetupProductTypeFlowItem_delegate);
  swift_bridgeObjectRelease();
}

- (void)chooseProductTypeViewControllerDidSelectManualEntry:(id)a3
{
  id v4;
  _TtC9PassKitUI31PaymentSetupProductTypeFlowItem *v5;

  v4 = a3;
  v5 = self;
  sub_19D259240();

}

- (void)chooseProductTypeViewController:(id)a3 didPerformPurchaseWithCredential:(id)a4
{
  id v6;
  id v7;
  _TtC9PassKitUI31PaymentSetupProductTypeFlowItem *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_19D258EC0(v6, v7);

}

- (void)chooseProductTypeViewControllerDidTerminate:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t ObjectType;
  id v8;
  _TtC9PassKitUI31PaymentSetupProductTypeFlowItem *v9;

  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI31PaymentSetupProductTypeFlowItem_delegate;
  if (MEMORY[0x1A1AE6A68]((char *)self + OBJC_IVAR____TtC9PassKitUI31PaymentSetupProductTypeFlowItem_delegate, a2))
  {
    v6 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType();
    v8 = a3;
    v9 = self;
    sub_19D789E94((uint64_t)v9, (uint64_t)&_s14descr1E3E2A351OMn.NumPayloadCasesAndPayloadSizeOffset + 3, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

- (void)chooseProductTypeViewController:(id)a3 didSelectServiceProducts:(id)a4
{
  unint64_t v6;
  id v7;
  _TtC9PassKitUI31PaymentSetupProductTypeFlowItem *v8;

  sub_19D259204();
  v6 = sub_19DE87E10();
  v7 = a3;
  v8 = self;
  sub_19D2593A4(v6);

  swift_bridgeObjectRelease();
}

@end
