@implementation NetworkingAnalytics

+ (id)databasePath
{
  return +[SFAnalytics defaultAnalyticsDatabasePath:](SFAnalytics, "defaultAnalyticsDatabasePath:", CFSTR("networking_analytics"));
}

@end
