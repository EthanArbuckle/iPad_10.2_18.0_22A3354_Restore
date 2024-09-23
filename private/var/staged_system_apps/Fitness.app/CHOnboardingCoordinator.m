@implementation CHOnboardingCoordinator

- (CHOnboardingCoordinator)initWithHealthStore:(id)a3
{
  return (CHOnboardingCoordinator *)sub_100553540(a3);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___CHOnboardingCoordinator_delegate, a3);
}

- (int64_t)currentPhase
{
  uint64_t v2;
  uint64_t v3;
  const mach_header_64 *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = 0x1000000000000;
  if (!*((_BYTE *)&self->super.isa + OBJC_IVAR___CHOnboardingCoordinator_criteria + 6))
    v2 = 0;
  v3 = 0x10000000000;
  if (!*((_BYTE *)&self->super.isa + OBJC_IVAR___CHOnboardingCoordinator_criteria + 5))
    v3 = 0;
  v4 = &_mh_execute_header;
  if (!*((_BYTE *)&self->super.isa + OBJC_IVAR___CHOnboardingCoordinator_criteria + 4))
    v4 = 0;
  v5 = 0x1000000;
  if (!*((_BYTE *)&self->super.isa + OBJC_IVAR___CHOnboardingCoordinator_criteria + 3))
    v5 = 0;
  v6 = 0x10000;
  if (!*((_BYTE *)&self->super.isa + OBJC_IVAR___CHOnboardingCoordinator_criteria + 2))
    v6 = 0;
  v7 = 256;
  if (!*((_BYTE *)&self->super.isa + OBJC_IVAR___CHOnboardingCoordinator_criteria + 1))
    v7 = 0;
  return sub_10002A5B4(v7 | *((unsigned __int8 *)&self->super.isa + OBJC_IVAR___CHOnboardingCoordinator_criteria) | v6 | v5 | (unint64_t)v4 | v3 | v2);
}

- (CHOnboardingCoordinatorDelegate)delegate
{
  return (CHOnboardingCoordinatorDelegate *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___CHOnboardingCoordinator_delegate);
}

- (void)dealloc
{
  CHOnboardingCoordinator *v2;

  v2 = self;
  sub_100553B5C();
}

- (void).cxx_destruct
{
  SEL v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  sub_1000F61B4((uint64_t)self + OBJC_IVAR___CHOnboardingCoordinator_delegate);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CHOnboardingCoordinator_queryLock));
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.isa+ OBJC_IVAR___CHOnboardingCoordinator_notifyTokens), v3, v4, v5, v6, v7, v8, v9);
}

- (void)setCompletedWelcomeViews
{
  CHOnboardingCoordinator *v2;

  v2 = self;
  sub_100553C68();

}

- (void)setCompletedWhatsNewViews
{
  CHOnboardingCoordinator *v2;

  v2 = self;
  sub_1005540E8();

}

- (CHOnboardingCoordinator)init
{
  CHOnboardingCoordinator *result;

  result = (CHOnboardingCoordinator *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.OnboardingCoordinator", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
