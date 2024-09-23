@implementation SAPreSynthesizeTTSCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("PreSynthesizeTTSCompleted");
}

+ (id)preSynthesizeTTSCompleted
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)approximateSpeechDuration
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("approximateSpeechDuration"));
}

- (void)setApproximateSpeechDuration:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("approximateSpeechDuration"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
