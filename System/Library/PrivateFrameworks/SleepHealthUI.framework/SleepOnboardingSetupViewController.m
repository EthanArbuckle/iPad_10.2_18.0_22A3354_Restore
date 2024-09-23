@implementation SleepOnboardingSetupViewController

- (void)viewDidLoad
{
  _TtC13SleepHealthUI34SleepOnboardingSetupViewController *v2;

  v2 = self;
  sub_1A9C79CA0();

}

- (void)hksp_nextButtonTapped
{
  _TtC13SleepHealthUI34SleepOnboardingSetupViewController *v2;

  v2 = self;
  sub_1A9C7C224();
  sub_1A9C7C4D4();

}

- (void)hksp_skipButtonTapped
{
  _TtC13SleepHealthUI34SleepOnboardingSetupViewController *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t ObjectType;
  void (*v6)(uint64_t, uint64_t);

  v2 = self;
  sub_1A9C7892C(1, 5, &OBJC_IVAR____TtC13SleepHealthUI29SleepOnboardingFlowController_userInfo);
  v3 = (Class *)((char *)&v2->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC13SleepHealthUI29SleepOnboardingFlowController_delegate);
  swift_beginAccess();
  if (*v3)
  {
    v4 = v3[1];
    ObjectType = swift_getObjectType();
    v6 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
    swift_unknownObjectRetain();
    v6(ObjectType, v4);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (void)hksp_cancelButtonTapped
{
  uint64_t v3;
  void *v4;
  _TtC13SleepHealthUI34SleepOnboardingSetupViewController *v5;
  _QWORD v6[6];

  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = self;
  v6[4] = sub_1A9C7DA80;
  v6[5] = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 1107296256;
  v6[2] = sub_1A9C0A74C;
  v6[3] = &block_descriptor_13;
  v4 = _Block_copy(v6);
  v5 = self;
  swift_release();
  -[OBWelcomeController hksp_presentCancelConfirmationAlertWithCancelHandler:](v5, sel_hksp_presentCancelConfirmationAlertWithCancelHandler_, v4);
  _Block_release(v4);

}

@end
