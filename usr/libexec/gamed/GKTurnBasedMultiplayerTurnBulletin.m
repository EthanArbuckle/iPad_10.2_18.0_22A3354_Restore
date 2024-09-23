@implementation GKTurnBasedMultiplayerTurnBulletin

- (void)update
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerTurnBulletin update", v5, 2u);
  }
  -[GKTurnBasedMultiplayerBulletin updateBadgeCount](self, "updateBadgeCount");
  -[GKTurnBasedMultiplayerBulletin expireAndLoadCaches](self, "expireAndLoadCaches");
}

- (id)aggregateDictionaryKey
{
  return GKReporterPushCountTurnBasedTurn;
}

- (void)handleAcceptAction
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerTurnBulletin handleAcceptAction", v5, 2u);
  }
  -[GKTurnBasedMultiplayerBulletin acceptTurnBasedTurn](self, "acceptTurnBasedTurn");
}

- (void)assembleBulletin
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKTurnBasedMultiplayerTurnBulletin;
  -[GKTurnBasedMultiplayerBulletin assembleBulletin](&v3, "assembleBulletin");
  -[GKBulletin setBulletinType:](self, "setBulletinType:", 201);
}

@end
