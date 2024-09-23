@implementation GKBiomeManager

+ (GKBiomeManager)shared
{
  return (GKBiomeManager *)static BiomeManager.shared.getter();
}

- (GKBiomeManager)init
{
  return (GKBiomeManager *)sub_10016226C();
}

- (void)logEarnedWithAchievement:(id)a3
{
  id v4;
  GKBiomeManager *v5;

  v4 = a3;
  v5 = self;
  BiomeManager.logEarned(achievement:)(v4);

}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->achievementHandler[OBJC_IVAR___GKBiomeManager_achievementHandler]);
}

@end
