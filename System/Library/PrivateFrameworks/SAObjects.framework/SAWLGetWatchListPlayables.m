@implementation SAWLGetWatchListPlayables

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.watchlist");
}

- (id)encodedClassName
{
  return CFSTR("GetWatchListPlayables");
}

+ (id)getWatchListPlayables
{
  return objc_alloc_init((Class)a1);
}

- (NSString)statsId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("statsId"));
}

- (void)setStatsId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("statsId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
