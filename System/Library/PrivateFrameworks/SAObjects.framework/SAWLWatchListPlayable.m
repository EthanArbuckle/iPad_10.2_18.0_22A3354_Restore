@implementation SAWLWatchListPlayable

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.watchlist");
}

- (id)encodedClassName
{
  return CFSTR("WatchListPlayable");
}

+ (id)watchListPlayable
{
  return objc_alloc_init((Class)a1);
}

- (SAWLWatchListChannelDetails)channelDetails
{
  return (SAWLWatchListChannelDetails *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("channelDetails"));
}

- (void)setChannelDetails:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("channelDetails"), a3);
}

- (BOOL)entitled
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("entitled"));
}

- (void)setEntitled:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("entitled"), a3);
}

- (BOOL)installed
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("installed"));
}

- (void)setInstalled:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("installed"), a3);
}

- (NSURL)playURL
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("playURL"));
}

- (void)setPlayURL:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("playURL"), a3);
}

@end
