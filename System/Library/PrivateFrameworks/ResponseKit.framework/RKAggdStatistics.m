@implementation RKAggdStatistics

+ (void)incrementAggdKeyForCategory:(id)a3 forAction:(id)a4 withLanguageID:(id)a5
{
  +[RKCoreAnalytics sendCoreAnalyticsEvent:forAction:withLanguageID:](RKCoreAnalytics, "sendCoreAnalyticsEvent:forAction:withLanguageID:", a3, a4, a5);
}

@end
