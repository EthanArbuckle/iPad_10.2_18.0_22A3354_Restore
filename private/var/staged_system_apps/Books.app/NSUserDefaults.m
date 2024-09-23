@implementation NSUserDefaults

- (BOOL)readerShowStatusBar
{
  NSUserDefaults *v2;
  NSString v3;
  unsigned __int8 v4;

  v2 = self;
  v3 = String._bridgeToObjectiveC()();
  v4 = -[NSUserDefaults BOOLForKey:](v2, "BOOLForKey:", v3);

  return v4;
}

- (BOOL)BKReadingGoalsShouldClearDataTrigger
{
  return sub_1005BAC30(self);
}

- (void)setBKReadingGoalsShouldClearDataTrigger:(BOOL)a3
{
  sub_1005BACB0(self);
}

- (BOOL)BKReadingGoalsShouldClearDataKey
{
  return sub_1005BAC30(self);
}

- (void)setBKReadingGoalsShouldClearDataKey:(BOOL)a3
{
  sub_1005BACB0(self);
}

- (BOOL)BAResetAnalyticsUserIDTrigger
{
  return sub_1005BAC30(self);
}

- (void)setBAResetAnalyticsUserIDTrigger:(BOOL)a3
{
  sub_1005BACB0(self);
}

- (BOOL)BCWWebRepExternalLoadApprovalCacheClearTrigger
{
  return sub_1005BAC30(self);
}

- (void)setBCWWebRepExternalLoadApprovalCacheClearTrigger:(BOOL)a3
{
  sub_1005BACB0(self);
}

- (BOOL)AllowAutoDownloadsForPurchasesFromOtherDevices
{
  return sub_1005BAC30(self);
}

- (void)setAllowAutoDownloadsForPurchasesFromOtherDevices:(BOOL)a3
{
  sub_1005BACB0(self);
}

- (BOOL)BEDocumentExternalLoadApprovalCacheDefaultsClearKey
{
  return -[NSUserDefaults BOOLForKey:](self, "BOOLForKey:", BEDocumentExternalLoadApprovalCacheDefaultsClearKey);
}

- (void)setBEDocumentExternalLoadApprovalCacheDefaultsClearKey:(BOOL)a3
{
  sub_1005BAB78(self, (uint64_t)a2, a3, &BEDocumentExternalLoadApprovalCacheDefaultsClearKey);
}

- (BOOL)BAResetAnalyticsUserID
{
  return -[NSUserDefaults BOOLForKey:](self, "BOOLForKey:", kBAResetAnalyticsUserID);
}

- (void)setBAResetAnalyticsUserID:(BOOL)a3
{
  sub_1005BAB78(self, (uint64_t)a2, a3, &kBAResetAnalyticsUserID);
}

- (BOOL)BKReadingGoalsUserDefaultsKey
{
  return sub_1005BAC30(self);
}

- (void)setBKReadingGoalsUserDefaultsKey:(BOOL)a3
{
  sub_1005BACB0(self);
}

- (BOOL)BKFinishedAssetRemovalEnabledKey
{
  return sub_1005BAC30(self);
}

- (void)setBKFinishedAssetRemovalEnabledKey:(BOOL)a3
{
  sub_1005BACB0(self);
}

@end
