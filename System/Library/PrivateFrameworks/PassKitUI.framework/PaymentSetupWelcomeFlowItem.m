@implementation PaymentSetupWelcomeFlowItem

- (_TtC9PassKitUI27PaymentSetupWelcomeFlowItem)init
{
  _TtC9PassKitUI27PaymentSetupWelcomeFlowItem *result;

  result = (_TtC9PassKitUI27PaymentSetupWelcomeFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI27PaymentSetupWelcomeFlowItem_delegate);
  swift_bridgeObjectRelease();
}

- (void)welcomeViewControllerDidSelectCardsOnFile:(id)a3
{
  id v4;
  _TtC9PassKitUI27PaymentSetupWelcomeFlowItem *v5;

  v4 = a3;
  v5 = self;
  sub_19D593EE8();

}

- (void)welcomeViewControllerDidSelectManualEntry:(id)a3
{
  id v4;
  _TtC9PassKitUI27PaymentSetupWelcomeFlowItem *v5;

  v4 = a3;
  v5 = self;
  sub_19D5940A8();

}

- (void)welcomeViewController:(id)a3 didSelectCategory:(id)a4 products:(id)a5
{
  unint64_t v5;
  id v9;
  id v10;
  _TtC9PassKitUI27PaymentSetupWelcomeFlowItem *v11;

  v5 = (unint64_t)a5;
  if (a5)
  {
    sub_19D1A9ED4(0, (unint64_t *)&qword_1EE496068);
    v5 = sub_19DE87E10();
  }
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_19D594178(v10, v5);

  swift_bridgeObjectRelease();
}

- (void)welcomeViewControllerDidTerminate:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t ObjectType;
  id v8;
  _TtC9PassKitUI27PaymentSetupWelcomeFlowItem *v9;

  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI27PaymentSetupWelcomeFlowItem_delegate;
  if (MEMORY[0x1A1AE6A68]((char *)self + OBJC_IVAR____TtC9PassKitUI27PaymentSetupWelcomeFlowItem_delegate, a2))
  {
    v6 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType();
    v8 = a3;
    v9 = self;
    sub_19D789E94((uint64_t)v9, (uint64_t)&off_1E3E43A78, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

@end
