@implementation EnableSchedulePromptViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)enableButtonAction
{
  _TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0634EnableSchedulePromptViewController *v3;

  if (MEMORY[0x1AF4203E0]((char *)self+ OBJC_IVAR____TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0634EnableSchedulePromptViewController_delegate, a2))
  {
    v3 = self;
    sub_1A9CCF6C8();

    swift_unknownObjectRelease();
  }
}

- (_TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0634EnableSchedulePromptViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0634EnableSchedulePromptViewController *result;

  result = (_TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0634EnableSchedulePromptViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0634EnableSchedulePromptViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  sub_1A9CCE02C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, a5);
}

- (void).cxx_destruct
{
  sub_1A9B94894((uint64_t)self+ OBJC_IVAR____TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0634EnableSchedulePromptViewController_delegate);
}

@end
