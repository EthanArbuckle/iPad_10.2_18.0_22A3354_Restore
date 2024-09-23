@implementation FitnessPlusCardDataProvider

- (_TtC10FitnessApp27FitnessPlusCardDataProvider)init
{
  _TtC10FitnessApp27FitnessPlusCardDataProvider *result;

  result = (_TtC10FitnessApp27FitnessPlusCardDataProvider *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.FitnessPlusCardDataProvider", 38, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  SEL v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp27FitnessPlusCardDataProvider_catalogClient));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp27FitnessPlusCardDataProvider_contentAvailabilityClient));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC10FitnessApp27FitnessPlusCardDataProvider_eventHub));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp27FitnessPlusCardDataProvider_networkEvaluator));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp27FitnessPlusCardDataProvider_recommendationClient));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp27FitnessPlusCardDataProvider_subscriptionClient));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC10FitnessApp27FitnessPlusCardDataProvider_subscriptionToken));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC10FitnessApp27FitnessPlusCardDataProvider_makeBodyFocusMapTask));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC10FitnessApp27FitnessPlusCardDataProvider_makeModalityMapTask));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC10FitnessApp27FitnessPlusCardDataProvider_makeMusicGenreMapTask));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC10FitnessApp27FitnessPlusCardDataProvider_makeSkillLevelMapTask));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC10FitnessApp27FitnessPlusCardDataProvider_makeThemeMapTask));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC10FitnessApp27FitnessPlusCardDataProvider_makeTrainerMapTask));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC10FitnessApp27FitnessPlusCardDataProvider_queryLocaleTask));
  v3 = (char *)self + OBJC_IVAR____TtC10FitnessApp27FitnessPlusCardDataProvider__state;
  v4 = sub_100047110(&qword_10082F9C0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC10FitnessApp27FitnessPlusCardDataProvider__pendingUpdates;
  v6 = sub_100047110(&qword_10083B500);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.isa+ OBJC_IVAR____TtC10FitnessApp27FitnessPlusCardDataProvider_candidates), v7, v8, v9, v10, v11, v12, v13);
}

@end
