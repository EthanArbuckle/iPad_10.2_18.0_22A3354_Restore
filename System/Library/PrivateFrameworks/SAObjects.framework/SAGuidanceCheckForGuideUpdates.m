@implementation SAGuidanceCheckForGuideUpdates

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.guidance");
}

- (id)encodedClassName
{
  return CFSTR("CheckForGuideUpdates");
}

+ (id)checkForGuideUpdates
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)currentGuideTag
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("currentGuideTag"));
}

- (void)setCurrentGuideTag:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("currentGuideTag"), a3);
}

- (NSArray)supportedFeatures
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("supportedFeatures"));
}

- (void)setSupportedFeatures:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("supportedFeatures"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
