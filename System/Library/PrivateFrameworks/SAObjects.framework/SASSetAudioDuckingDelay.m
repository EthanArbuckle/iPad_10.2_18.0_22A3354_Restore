@implementation SASSetAudioDuckingDelay

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("SetAudioDuckingDelay");
}

+ (id)setAudioDuckingDelay
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)duckingEventSyncDelay
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("duckingEventSyncDelay"));
}

- (void)setDuckingEventSyncDelay:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("duckingEventSyncDelay"), a3);
}

- (NSNumber)preTriggerToDuckingEndDuration
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("preTriggerToDuckingEndDuration"));
}

- (void)setPreTriggerToDuckingEndDuration:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("preTriggerToDuckingEndDuration"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
