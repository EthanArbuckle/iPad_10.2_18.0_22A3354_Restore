@implementation SAGuidanceCheckForGuideUpdateContext

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.guidance");
}

- (id)encodedClassName
{
  return CFSTR("CheckForGuideUpdateContext");
}

+ (id)checkForGuideUpdateContext
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)supportedFeatures
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("supportedFeatures"));
}

- (void)setSupportedFeatures:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("supportedFeatures"), a3);
}

@end
