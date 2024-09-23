@implementation GKAchievementLeaderboardScoreRangeRequest

- (id)bagKey
{
  return CFSTR("gk-get-achievement-leaderboard");
}

- (id)serverRequestWithService:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  _QWORD v11[4];

  v10[0] = CFSTR("player-scope");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementLeaderboardScoreRangeRequest serverPlayerScope](self, "serverPlayerScope", a3));
  v11[0] = v4;
  v10[1] = CFSTR("count");
  -[GKAchievementLeaderboardScoreRangeRequest range](self, "range");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v5));
  v11[1] = v6;
  v10[2] = CFSTR("starting-rank");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[GKAchievementLeaderboardScoreRangeRequest range](self, "range")));
  v10[3] = CFSTR("category");
  v11[2] = v7;
  v11[3] = CFSTR("points");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 4));

  return v8;
}

@end
