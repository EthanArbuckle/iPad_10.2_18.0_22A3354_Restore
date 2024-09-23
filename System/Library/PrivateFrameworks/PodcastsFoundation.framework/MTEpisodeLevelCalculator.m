@implementation MTEpisodeLevelCalculator

- (MTEpisodeLevelCalculator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EpisodeLevelCalculator();
  return -[MTEpisodeLevelCalculator init](&v3, sel_init);
}

+ (int64_t)uncalculatedLevel
{
  return 1000000;
}

- (void)unsafeUpdateEpisodeLevelsWithShowUUID:(id)a3 on:(id)a4
{
  sub_1A928E728(self, (uint64_t)a2, (uint64_t)a3, a4, 0);
}

- (void)unsafeUpdateEpisodeShowTypeSpecificLevelsWithShowUUID:(id)a3 on:(id)a4
{
  sub_1A928E728(self, (uint64_t)a2, (uint64_t)a3, a4, 1);
}

@end
