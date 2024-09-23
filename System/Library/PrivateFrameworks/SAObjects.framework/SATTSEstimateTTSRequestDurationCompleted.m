@implementation SATTSEstimateTTSRequestDurationCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.tts");
}

- (id)encodedClassName
{
  return CFSTR("EstimateTTSRequestDurationCompleted");
}

+ (id)estimateTTSRequestDurationCompleted
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)durations
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("durations"));
}

- (void)setDurations:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("durations"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
