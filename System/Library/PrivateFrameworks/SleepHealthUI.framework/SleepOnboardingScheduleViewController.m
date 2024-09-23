@implementation SleepOnboardingScheduleViewController

- (void)viewDidLoad
{
  _TtC13SleepHealthUI37SleepOnboardingScheduleViewController *v2;

  v2 = self;
  sub_1A9CC636C();

}

- (void)hksp_nextButtonTapped
{
  _TtC13SleepHealthUI37SleepOnboardingScheduleViewController *v2;

  v2 = self;
  sub_1A9CC6E8C();
  sub_1A9CC7130();

}

- (void)hksp_cancelButtonTapped
{
  uint64_t v3;
  void *v4;
  _TtC13SleepHealthUI37SleepOnboardingScheduleViewController *v5;
  _QWORD v6[6];

  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = self;
  v6[4] = sub_1A9CC8EEC;
  v6[5] = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 1107296256;
  v6[2] = sub_1A9C0A74C;
  v6[3] = &block_descriptor_40;
  v4 = _Block_copy(v6);
  v5 = self;
  swift_release();
  -[OBWelcomeController hksp_presentCancelConfirmationAlertWithCancelHandler:](v5, sel_hksp_presentCancelConfirmationAlertWithCancelHandler_, v4);
  _Block_release(v4);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI37SleepOnboardingScheduleViewController_nextButton));
  swift_release();
}

@end
