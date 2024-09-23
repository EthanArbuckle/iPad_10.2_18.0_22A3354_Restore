@implementation SATTSEstimateTTSRequestDuration

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.tts");
}

- (id)encodedClassName
{
  return CFSTR("EstimateTTSRequestDuration");
}

+ (id)estimateTTSRequestDuration
{
  return objc_alloc_init((Class)a1);
}

- (NSString)gender
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("gender"));
}

- (void)setGender:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("gender"), a3);
}

- (NSString)locale
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("locale"));
}

- (void)setLocale:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("locale"), a3);
}

- (NSArray)texts
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("texts"));
}

- (void)setTexts:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("texts"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end
