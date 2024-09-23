@implementation PaymentSetupFeatureOnboardingFlowItem

- (_TtC9PassKitUI37PaymentSetupFeatureOnboardingFlowItem)init
{
  _TtC9PassKitUI37PaymentSetupFeatureOnboardingFlowItem *result;

  result = (_TtC9PassKitUI37PaymentSetupFeatureOnboardingFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI37PaymentSetupFeatureOnboardingFlowItem_product));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI37PaymentSetupFeatureOnboardingFlowItem_payLaterSetupFlowController));
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI37PaymentSetupFeatureOnboardingFlowItem_delegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI37PaymentSetupFeatureOnboardingFlowItem_viewController));
}

- (void)nextViewControllerWithCompletion:(id)a3
{
  void *v4;
  const void *v5;
  void (*v6)(const void *, _QWORD, _QWORD);
  _TtC9PassKitUI37PaymentSetupFeatureOnboardingFlowItem *v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = (void (*)(const void *, _QWORD, _QWORD))*((_QWORD *)v4 + 2);
    v7 = self;
    v6(v5, 0, 0);
    _Block_release(v5);

  }
  else
  {
    __break(1u);
  }
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t ObjectType;
  id v8;
  _TtC9PassKitUI37PaymentSetupFeatureOnboardingFlowItem *v9;

  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI37PaymentSetupFeatureOnboardingFlowItem_delegate;
  if (MEMORY[0x1A1AE6A68]((char *)self + OBJC_IVAR____TtC9PassKitUI37PaymentSetupFeatureOnboardingFlowItem_delegate, a2))
  {
    v6 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType();
    v8 = a3;
    v9 = self;
    sub_19D789E94((uint64_t)v9, (uint64_t)&off_1E3E54F48, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

@end
