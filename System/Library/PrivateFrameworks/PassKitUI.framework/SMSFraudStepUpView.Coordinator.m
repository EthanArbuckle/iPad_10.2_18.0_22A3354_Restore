@implementation SMSFraudStepUpView.Coordinator

- (void)explanationViewDidSelectContinue:(id)a3
{
  void (*v4)(uint64_t);
  id v5;
  _TtCV9PassKitUI18SMSFraudStepUpView11Coordinator *v6;
  uint64_t v7;

  v4 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtCV9PassKitUI18SMSFraudStepUpView11Coordinator_dismissAction);
  v5 = a3;
  v6 = self;
  v7 = sub_19DE82CB0();
  v4(v7);

  swift_release();
}

- (_TtCV9PassKitUI18SMSFraudStepUpView11Coordinator)init
{
  _TtCV9PassKitUI18SMSFraudStepUpView11Coordinator *result;

  result = (_TtCV9PassKitUI18SMSFraudStepUpView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
