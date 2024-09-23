@implementation AchievementProgressEnvironment

- (double)bestEnergyBurnedOfWorkoutModality
{
  return 0.0;
}

- (BOOL)isSessionGuided
{
  return 0;
}

- (BOOL)isSessionCompletingProgram
{
  return 0;
}

- (NSString)modalityIdentifier
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1CE0B626C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (double)sessionDuration
{
  return 0.0;
}

- (double)sessionEnergyBurned
{
  return 0.0;
}

- (int64_t)currentPlanCompletedNumberOfWorkouts
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13SeymourClient30AchievementProgressEnvironment_currentPlanCompletedNumberOfWorkouts);
}

- (int64_t)currentPlanTotalNumberOfWorkouts
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13SeymourClient30AchievementProgressEnvironment_currentPlanTotalNumberOfWorkouts);
}

- (int64_t)currentWeeklyStreak
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13SeymourClient30AchievementProgressEnvironment_currentWeeklyStreak);
}

- (int64_t)longestWeeklyStreak
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13SeymourClient30AchievementProgressEnvironment_longestWeeklyStreak);
}

- (int64_t)numberOfWorkoutsOver5Minutes
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13SeymourClient30AchievementProgressEnvironment_numberOfWorkoutsOver5Minutes);
}

- (id)numberOfGuidedWorkoutsOver5MinutesForModality:(id)a3
{
  id v4;
  _TtC13SeymourClient30AchievementProgressEnvironment *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1CE09F660((uint64_t)v4);

  return v6;
}

- (id)numberOfWorkoutsOver5MinutesForModality:(id)a3
{
  id v4;
  _TtC13SeymourClient30AchievementProgressEnvironment *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1CE09F6B8((uint64_t)v4);

  return v6;
}

- (_TtC13SeymourClient30AchievementProgressEnvironment)init
{
  _TtC13SeymourClient30AchievementProgressEnvironment *result;

  result = (_TtC13SeymourClient30AchievementProgressEnvironment *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
