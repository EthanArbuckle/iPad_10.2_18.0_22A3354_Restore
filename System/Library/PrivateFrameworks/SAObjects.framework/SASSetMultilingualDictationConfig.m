@implementation SASSetMultilingualDictationConfig

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("SetMultilingualDictationConfig");
}

+ (id)setMultilingualDictationConfig
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)multilingualDisabled
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("multilingualDisabled"));
}

- (void)setMultilingualDisabled:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("multilingualDisabled"), a3);
}

- (NSNumber)multilingualTimeoutInMillis
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("multilingualTimeoutInMillis"));
}

- (void)setMultilingualTimeoutInMillis:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("multilingualTimeoutInMillis"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
