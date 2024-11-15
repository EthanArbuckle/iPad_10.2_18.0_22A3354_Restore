@implementation AchievementEnvironment

- (double)sessionDuration
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC15SeymourServices22AchievementEnvironment_sessionDuration);
}

- (double)bestEnergyBurnedOfWorkoutModality
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC15SeymourServices22AchievementEnvironment_bestEnergyBurnedOfWorkoutModality);
}

- (int64_t)currentPlanCompletedNumberOfWorkouts
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15SeymourServices22AchievementEnvironment_currentPlanCompletedNumberOfWorkouts);
}

- (int64_t)currentPlanTotalNumberOfWorkouts
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15SeymourServices22AchievementEnvironment_currentPlanTotalNumberOfWorkouts);
}

- (int64_t)currentWeeklyStreak
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15SeymourServices22AchievementEnvironment_currentWeeklyStreak);
}

- (BOOL)isSessionCompletingPlan
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC15SeymourServices22AchievementEnvironment_isSessionCompletingPlan);
}

- (BOOL)isSessionCompletingProgram
{
  return *((_BYTE *)&self->super.isa
         + OBJC_IVAR____TtC15SeymourServices22AchievementEnvironment_isSessionCompletingProgram);
}

- (BOOL)isSessionGuided
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC15SeymourServices22AchievementEnvironment_isSessionGuided);
}

- (BOOL)isSessionParticipatingInPlan
{
  return *((_BYTE *)&self->super.isa
         + OBJC_IVAR____TtC15SeymourServices22AchievementEnvironment_isSessionParticipatingInPlan);
}

- (int64_t)longestWeeklyStreak
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15SeymourServices22AchievementEnvironment_longestWeeklyStreak);
}

- (NSString)modalityIdentifier
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1CF151B4C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (int64_t)numberOfWorkoutsOver5Minutes
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15SeymourServices22AchievementEnvironment_numberOfWorkoutsOver5Minutes);
}

- (double)sessionEnergyBurned
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC15SeymourServices22AchievementEnvironment_sessionEnergyBurned);
}

- (id)numberOfWorkoutsOver5MinutesForModality:(id)a3
{
  id v4;
  _TtC15SeymourServices22AchievementEnvironment *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1CEBEAA28((uint64_t)v4);

  return v6;
}

- (id)numberOfGuidedWorkoutsOver5MinutesForModality:(id)a3
{
  id v4;
  _TtC15SeymourServices22AchievementEnvironment *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1CEBEAA80((uint64_t)v4);

  return v6;
}

- (_TtC15SeymourServices22AchievementEnvironment)init
{
  _TtC15SeymourServices22AchievementEnvironment *result;

  result = (_TtC15SeymourServices22AchievementEnvironment *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  sub_1CEAF7A24((uint64_t)self + OBJC_IVAR____TtC15SeymourServices22AchievementEnvironment_planCompletionDate);
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC15SeymourServices22AchievementEnvironment_sessionStartDate;
  v4 = sub_1CF14AE44();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
