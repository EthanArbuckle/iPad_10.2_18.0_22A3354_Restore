@implementation PaymentSetupCredentialsFlowItem

- (_TtC9PassKitUI31PaymentSetupCredentialsFlowItem)init
{
  _TtC9PassKitUI31PaymentSetupCredentialsFlowItem *result;

  result = (_TtC9PassKitUI31PaymentSetupCredentialsFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();

  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI31PaymentSetupCredentialsFlowItem_delegate);
  swift_bridgeObjectRelease();
}

- (void)credentialsViewControllerDidTerminate:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t ObjectType;
  id v8;
  _TtC9PassKitUI31PaymentSetupCredentialsFlowItem *v9;

  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI31PaymentSetupCredentialsFlowItem_delegate;
  if (MEMORY[0x1A1AE6A68]((char *)self + OBJC_IVAR____TtC9PassKitUI31PaymentSetupCredentialsFlowItem_delegate, a2))
  {
    v6 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType();
    v8 = a3;
    v9 = self;
    sub_19D789E94((uint64_t)v9, (uint64_t)&off_1E3E5BF00, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

- (void)credentialsViewControllerDidSelectManualEntry:(id)a3
{
  id v4;
  _TtC9PassKitUI31PaymentSetupCredentialsFlowItem *v5;

  v4 = a3;
  v5 = self;
  sub_19D86ACD0();

}

- (void)credentialsViewControllerDidSelectSecondaryManualEntry:(id)a3
{
  id v4;
  _TtC9PassKitUI31PaymentSetupCredentialsFlowItem *v5;

  v4 = a3;
  v5 = self;
  sub_19D86AE0C();

}

- (void)credentialsViewController:(id)a3 didSelectCredentials:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC9PassKitUI31PaymentSetupCredentialsFlowItem *v8;

  sub_19D6B27C8();
  v6 = sub_19DE87E10();
  v7 = a3;
  v8 = self;
  sub_19D86B0BC(v6);

  swift_bridgeObjectRelease();
}

@end
