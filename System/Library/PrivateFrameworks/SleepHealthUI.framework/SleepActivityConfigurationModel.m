@implementation SleepActivityConfigurationModel

- (_TtC13SleepHealthUI31SleepActivityConfigurationModel)init
{
  _TtC13SleepHealthUI31SleepActivityConfigurationModel *result;

  result = (_TtC13SleepHealthUI31SleepActivityConfigurationModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v3 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI31SleepActivityConfigurationModel__layout;
  v4 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0C96198];
  sub_1A9BDFB8C(0, &qword_1EEB453F8, (uint64_t (*)(_QWORD, ValueMetadata *))MEMORY[0x1E0C96198]);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v3, v5);
  v6 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI31SleepActivityConfigurationModel__scheduleModel;
  sub_1A9B92F34(0, &qword_1EEB45408, (uint64_t (*)(uint64_t))type metadata accessor for SleepScheduleModel, v4);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI31SleepActivityConfigurationModel__settingsModel;
  sub_1A9B92F34(0, (unint64_t *)&unk_1EEB45418, (uint64_t (*)(uint64_t))type metadata accessor for SleepSettingsModel, v4);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI31SleepActivityConfigurationModel_watchAppInstalledProvider));
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI31SleepActivityConfigurationModel_behavior));
}

- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  _TtC13SleepHealthUI31SleepActivityConfigurationModel *v9;
  uint64_t v10;

  v4 = sub_1A9CE80A0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (uint64_t *)((char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1A9B94A18(0, (unint64_t *)&qword_1ED2625C0);
  swift_unknownObjectRetain();
  v9 = self;
  *v8 = sub_1A9CE870C();
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v5 + 104))(v8, *MEMORY[0x1E0DEF740], v4);
  LOBYTE(self) = sub_1A9CE80AC();
  (*(void (**)(uint64_t *, uint64_t))(v5 + 8))(v8, v4);
  if ((self & 1) != 0)
  {
    sub_1A9BDEC64();
    swift_unknownObjectRelease();

  }
  else
  {
    __break(1u);
  }
}

@end
