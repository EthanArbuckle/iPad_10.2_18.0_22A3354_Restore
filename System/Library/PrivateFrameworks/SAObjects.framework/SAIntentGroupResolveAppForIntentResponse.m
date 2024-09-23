@implementation SAIntentGroupResolveAppForIntentResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("ResolveAppForIntentResponse");
}

+ (id)resolveAppForIntentResponse
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)appsList
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("appsList"), v3);
}

- (void)setAppsList:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("appsList"), (uint64_t)a3);
}

- (NSNumber)needsConfirmation
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("needsConfirmation"));
}

- (void)setNeedsConfirmation:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("needsConfirmation"), a3);
}

- (NSString)resolutionType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("resolutionType"));
}

- (void)setResolutionType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("resolutionType"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
