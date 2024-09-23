@implementation VCDailyMetricSubmitter

+ (id)activityIdentifier
{
  return CFSTR("com.apple.siriactionsd.ShortcutsDailyMetricCheckIn");
}

- (VCDailyMetricSubmitter)initWithDatabaseProvider:(id)a3
{
  id v4;
  void *v5;
  id v6;
  VCDailyMetricSubmitter *v7;

  v4 = a3;
  +[VCMetricCheckIn recentCheckInWithMode:](VCMetricCheckIn, "recentCheckInWithMode:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0DD9DE0]);
  v7 = -[VCMetricSubmitter initWithCheckIn:event:databaseProvider:](self, "initWithCheckIn:event:databaseProvider:", v5, v6, v4);

  return v7;
}

- (id)event
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0DD9DE0]);
  objc_msgSend(v2, "setKey:", CFSTR("DailyStatus"));
  return v2;
}

@end
