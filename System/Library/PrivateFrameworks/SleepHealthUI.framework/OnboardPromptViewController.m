@implementation OnboardPromptViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)beginButtonAction
{
  _TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0627OnboardPromptViewController *v3;

  if (MEMORY[0x1AF4203E0]((char *)self+ OBJC_IVAR____TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0627OnboardPromptViewController_delegate, a2))
  {
    v3 = self;
    sub_1A9CCEF64("[%{public}s] Opening Health > Sleep > Onboarding...", MEMORY[0x1E0DA83B0]);

    swift_unknownObjectRelease();
  }
}

- (void)removeButtonAction
{
  uint64_t v3;
  _TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0627OnboardPromptViewController *v4;

  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = self;
  v4 = self;
  sub_1A9CCDC5C((uint64_t)sub_1A9CCEBF0, v3);

  swift_release();
}

- (_TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0627OnboardPromptViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0627OnboardPromptViewController *result;

  result = (_TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0627OnboardPromptViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0627OnboardPromptViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  sub_1A9CCE02C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, a5);
}

- (void).cxx_destruct
{
  sub_1A9B94894((uint64_t)self+ OBJC_IVAR____TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0627OnboardPromptViewController_delegate);
}

@end
