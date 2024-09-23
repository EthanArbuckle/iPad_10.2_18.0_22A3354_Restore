@implementation SASportsTeam

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sports");
}

- (id)encodedClassName
{
  return CFSTR("Team");
}

+ (id)team
{
  return objc_alloc_init((Class)a1);
}

- (NSString)abbreviatedName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("abbreviatedName"));
}

- (void)setAbbreviatedName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("abbreviatedName"), a3);
}

- (BOOL)alwaysUseAthleteFullName
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("alwaysUseAthleteFullName"));
}

- (void)setAlwaysUseAthleteFullName:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("alwaysUseAthleteFullName"), a3);
}

- (NSArray)athletes
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("athletes"), v3);
}

- (void)setAthletes:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("athletes"), (uint64_t)a3);
}

- (NSString)awayLosses
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("awayLosses"));
}

- (void)setAwayLosses:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("awayLosses"), a3);
}

- (NSString)awayOvertimeLosses
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("awayOvertimeLosses"));
}

- (void)setAwayOvertimeLosses:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("awayOvertimeLosses"), a3);
}

- (NSString)awayPoints
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("awayPoints"));
}

- (void)setAwayPoints:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("awayPoints"), a3);
}

- (NSString)awayTies
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("awayTies"));
}

- (void)setAwayTies:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("awayTies"), a3);
}

- (NSString)awayWins
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("awayWins"));
}

- (void)setAwayWins:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("awayWins"), a3);
}

- (NSNumber)clinchedQualificationPosition
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("clinchedQualificationPosition"));
}

- (void)setClinchedQualificationPosition:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("clinchedQualificationPosition"), a3);
}

- (NSNumber)conferencePosition
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("conferencePosition"));
}

- (void)setConferencePosition:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("conferencePosition"), a3);
}

- (NSString)gamesBehind
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("gamesBehind"));
}

- (void)setGamesBehind:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("gamesBehind"), a3);
}

- (NSString)gamesPlayed
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("gamesPlayed"));
}

- (void)setGamesPlayed:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("gamesPlayed"), a3);
}

- (NSString)groupName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("groupName"));
}

- (void)setGroupName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("groupName"), a3);
}

- (NSNumber)groupPosition
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("groupPosition"));
}

- (void)setGroupPosition:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("groupPosition"), a3);
}

- (NSString)groupPositionDescription
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("groupPositionDescription"));
}

- (void)setGroupPositionDescription:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("groupPositionDescription"), a3);
}

- (NSString)homeLosses
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("homeLosses"));
}

- (void)setHomeLosses:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("homeLosses"), a3);
}

- (NSString)homeOvertimeLosses
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("homeOvertimeLosses"));
}

- (void)setHomeOvertimeLosses:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("homeOvertimeLosses"), a3);
}

- (NSString)homePoints
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("homePoints"));
}

- (void)setHomePoints:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("homePoints"), a3);
}

- (NSString)homeTies
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("homeTies"));
}

- (void)setHomeTies:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("homeTies"), a3);
}

- (NSString)homeWins
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("homeWins"));
}

- (void)setHomeWins:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("homeWins"), a3);
}

- (NSString)location
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("location"));
}

- (void)setLocation:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("location"), a3);
}

- (NSString)losses
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("losses"));
}

- (void)setLosses:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("losses"), a3);
}

- (NSString)monogram
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("monogram"));
}

- (void)setMonogram:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("monogram"), a3);
}

- (NSString)netRunRate
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("netRunRate"));
}

- (void)setNetRunRate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("netRunRate"), a3);
}

- (NSArray)news
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("news"), v3);
}

- (void)setNews:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("news"), (uint64_t)a3);
}

- (NSString)overtimeLosses
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("overtimeLosses"));
}

- (void)setOvertimeLosses:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("overtimeLosses"), a3);
}

- (NSString)points
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("points"));
}

- (void)setPoints:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("points"), a3);
}

- (NSString)pointsAgainst
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("pointsAgainst"));
}

- (void)setPointsAgainst:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("pointsAgainst"), a3);
}

- (NSString)pointsFor
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("pointsFor"));
}

- (void)setPointsFor:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("pointsFor"), a3);
}

- (NSNumber)primaryColor
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("primaryColor"));
}

- (void)setPrimaryColor:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("primaryColor"), a3);
}

- (NSString)qualificationPosition
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("qualificationPosition"));
}

- (void)setQualificationPosition:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("qualificationPosition"), a3);
}

- (NSString)qualificationPositionSummary
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("qualificationPositionSummary"));
}

- (void)setQualificationPositionSummary:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("qualificationPositionSummary"), a3);
}

- (NSArray)rankings
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("rankings"), v3);
}

- (void)setRankings:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("rankings"), (uint64_t)a3);
}

- (NSNumber)secondaryColor
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("secondaryColor"));
}

- (void)setSecondaryColor:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("secondaryColor"), a3);
}

- (NSArray)statistics
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("statistics"), v3);
}

- (void)setStatistics:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("statistics"), (uint64_t)a3);
}

- (NSString)streakNumber
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("streakNumber"));
}

- (void)setStreakNumber:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("streakNumber"), a3);
}

- (NSString)streakType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("streakType"));
}

- (void)setStreakType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("streakType"), a3);
}

- (NSString)ties
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("ties"));
}

- (void)setTies:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("ties"), a3);
}

- (NSString)venueLocation
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("venueLocation"));
}

- (void)setVenueLocation:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("venueLocation"), a3);
}

- (NSString)venueName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("venueName"));
}

- (void)setVenueName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("venueName"), a3);
}

- (NSString)winPercentage
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("winPercentage"));
}

- (void)setWinPercentage:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("winPercentage"), a3);
}

- (NSString)wins
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("wins"));
}

- (void)setWins:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("wins"), a3);
}

@end
