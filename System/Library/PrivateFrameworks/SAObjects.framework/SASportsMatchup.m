@implementation SASportsMatchup

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sports");
}

- (id)encodedClassName
{
  return CFSTR("Matchup");
}

+ (id)matchup
{
  return objc_alloc_init((Class)a1);
}

- (SASportsEntity)awayEntity
{
  return (SASportsEntity *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("awayEntity"));
}

- (void)setAwayEntity:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("awayEntity"), a3);
}

- (NSArray)awayLineScores
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("awayLineScores"), v3);
}

- (void)setAwayLineScores:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("awayLineScores"), (uint64_t)a3);
}

- (NSString)awayScore
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("awayScore"));
}

- (void)setAwayScore:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("awayScore"), a3);
}

- (NSNumber)awayShootoutPoints
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("awayShootoutPoints"));
}

- (void)setAwayShootoutPoints:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("awayShootoutPoints"), a3);
}

- (NSString)awayTeamRecordSummary
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("awayTeamRecordSummary"));
}

- (void)setAwayTeamRecordSummary:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("awayTeamRecordSummary"), a3);
}

- (NSString)currentPeriod
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("currentPeriod"));
}

- (void)setCurrentPeriod:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("currentPeriod"), a3);
}

- (NSNumber)expectedLineScoreCount
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("expectedLineScoreCount"));
}

- (void)setExpectedLineScoreCount:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("expectedLineScoreCount"), a3);
}

- (NSString)favoredEntity
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("favoredEntity"));
}

- (void)setFavoredEntity:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("favoredEntity"), a3);
}

- (NSString)gameSummary
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("gameSummary"));
}

- (void)setGameSummary:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("gameSummary"), a3);
}

- (NSString)gameType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("gameType"));
}

- (void)setGameType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("gameType"), a3);
}

- (SAServerBoundCommand)getAppsCommand
{
  return (SAServerBoundCommand *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("getAppsCommand"));
}

- (void)setGetAppsCommand:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("getAppsCommand"), a3);
}

- (SAServerBoundCommand)getModalDetailSnippetCommand
{
  return (SAServerBoundCommand *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("getModalDetailSnippetCommand"));
}

- (void)setGetModalDetailSnippetCommand:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("getModalDetailSnippetCommand"), a3);
}

- (SASportsEntity)homeEntity
{
  return (SASportsEntity *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("homeEntity"));
}

- (void)setHomeEntity:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("homeEntity"), a3);
}

- (NSArray)homeLineScores
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("homeLineScores"), v3);
}

- (void)setHomeLineScores:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("homeLineScores"), (uint64_t)a3);
}

- (NSString)homeScore
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("homeScore"));
}

- (void)setHomeScore:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("homeScore"), a3);
}

- (NSNumber)homeShootoutPoints
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("homeShootoutPoints"));
}

- (void)setHomeShootoutPoints:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("homeShootoutPoints"), a3);
}

- (NSString)homeTeamRecordSummary
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("homeTeamRecordSummary"));
}

- (void)setHomeTeamRecordSummary:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("homeTeamRecordSummary"), a3);
}

- (BOOL)isAvailable
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("isAvailable"));
}

- (void)setIsAvailable:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("isAvailable"), a3);
}

- (NSNumber)isExplicitlyEndOfPeriod
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("isExplicitlyEndOfPeriod"));
}

- (void)setIsExplicitlyEndOfPeriod:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("isExplicitlyEndOfPeriod"), a3);
}

- (BOOL)isOnNow
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("isOnNow"));
}

- (void)setIsOnNow:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("isOnNow"), a3);
}

- (BOOL)isWatchlistable
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("isWatchlistable"));
}

- (void)setIsWatchlistable:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("isWatchlistable"), a3);
}

- (NSString)line
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("line"));
}

- (void)setLine:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("line"), a3);
}

- (SALCMLiveTuneInButton)liveTuneInButton
{
  return (SALCMLiveTuneInButton *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("liveTuneInButton"));
}

- (void)setLiveTuneInButton:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("liveTuneInButton"), a3);
}

- (NSString)location
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("location"));
}

- (void)setLocation:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("location"), a3);
}

- (NSString)locationName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("locationName"));
}

- (void)setLocationName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("locationName"), a3);
}

- (NSString)matchupOrder
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("matchupOrder"));
}

- (void)setMatchupOrder:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("matchupOrder"), a3);
}

- (NSString)overUnder
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("overUnder"));
}

- (void)setOverUnder:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("overUnder"), a3);
}

- (NSString)periodDescription
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("periodDescription"));
}

- (void)setPeriodDescription:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("periodDescription"), a3);
}

- (NSArray)playSummaries
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("playSummaries"), v3);
}

- (void)setPlaySummaries:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("playSummaries"), (uint64_t)a3);
}

- (NSNumber)playoff
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("playoff"));
}

- (void)setPlayoff:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("playoff"), a3);
}

- (SAUIAppPunchOut)punchout
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("punchout"));
}

- (void)setPunchout:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("punchout"), a3);
}

- (NSDate)startTime
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("startTime"));
}

- (void)setStartTime:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("startTime"), a3);
}

- (NSNumber)statsId
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("statsId"));
}

- (void)setStatsId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("statsId"), a3);
}

- (NSString)status
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("status"));
}

- (void)setStatus:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("status"), a3);
}

- (NSString)timeRemaining
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("timeRemaining"));
}

- (void)setTimeRemaining:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("timeRemaining"), a3);
}

- (NSNumber)timeTBD
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("timeTBD"));
}

- (void)setTimeTBD:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("timeTBD"), a3);
}

- (NSString)title
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("title"));
}

- (void)setTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("title"), a3);
}

- (SALCMToggleButton)toggleButton
{
  return (SALCMToggleButton *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("toggleButton"));
}

- (void)setToggleButton:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("toggleButton"), a3);
}

- (NSString)tournamentSeriesDescription
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("tournamentSeriesDescription"));
}

- (void)setTournamentSeriesDescription:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("tournamentSeriesDescription"), a3);
}

- (NSArray)tvChannels
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("tvChannels"));
}

- (void)setTvChannels:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("tvChannels"), a3);
}

- (NSString)winningEntity
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("winningEntity"));
}

- (void)setWinningEntity:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("winningEntity"), a3);
}

@end
