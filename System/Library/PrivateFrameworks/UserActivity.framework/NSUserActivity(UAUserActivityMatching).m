@implementation NSUserActivity(UAUserActivityMatching)

+ (BOOL)_currentUserActivityProxiesWithOptions:()UAUserActivityMatching matching:completionHandler:
{
  return +[UAUserActivity currentUserActivityProxiesWithOptions:matching:completionHandler:](UAUserActivity, "currentUserActivityProxiesWithOptions:matching:completionHandler:");
}

@end
