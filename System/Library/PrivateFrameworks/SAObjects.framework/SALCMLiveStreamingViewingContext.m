@implementation SALCMLiveStreamingViewingContext

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.livecontent");
}

- (id)encodedClassName
{
  return CFSTR("LiveStreamingViewingContext");
}

+ (id)liveStreamingViewingContext
{
  return objc_alloc_init((Class)a1);
}

- (NSDate)eventStartTime
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("eventStartTime"));
}

- (void)setEventStartTime:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("eventStartTime"), a3);
}

- (BOOL)watchingLive
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("watchingLive"));
}

- (void)setWatchingLive:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("watchingLive"), a3);
}

@end
