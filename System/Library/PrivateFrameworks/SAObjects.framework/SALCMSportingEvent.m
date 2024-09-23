@implementation SALCMSportingEvent

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.livecontent");
}

- (id)encodedClassName
{
  return CFSTR("SportingEvent");
}

+ (id)sportingEvent
{
  return objc_alloc_init((Class)a1);
}

- (NSURL)sportingEventId
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("sportingEventId"));
}

- (void)setSportingEventId:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("sportingEventId"), a3);
}

@end
