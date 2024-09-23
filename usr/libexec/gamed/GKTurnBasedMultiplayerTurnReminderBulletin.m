@implementation GKTurnBasedMultiplayerTurnReminderBulletin

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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerTurnReminderBulletin update", v5, 2u);
  }
  -[GKTurnBasedMultiplayerBulletin updateBadgeCount](self, "updateBadgeCount");
}

- (id)aggregateDictionaryKey
{
  return GKReporterPushCountTurnBasedReminder;
}

@end
