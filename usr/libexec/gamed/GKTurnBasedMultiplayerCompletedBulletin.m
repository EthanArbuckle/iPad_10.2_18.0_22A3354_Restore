@implementation GKTurnBasedMultiplayerCompletedBulletin

- (id)bulletinMessage
{
  return +[GCFLocalizedStrings KETTLE_TURN_BASED_GAME_OVER_NOTIFICATION_MESSAGE_FORMAT](_TtC20GameCenterFoundation19GCFLocalizedStrings, "KETTLE_TURN_BASED_GAME_OVER_NOTIFICATION_MESSAGE_FORMAT");
}

- (id)aggregateDictionaryKey
{
  return GKReporterPushCountTurnBasedCompleted;
}

@end
