@implementation SASetRestrictedAppContext

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("SetRestrictedAppContext");
}

+ (id)setRestrictedAppContext
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)previewRestrictedApps
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("previewRestrictedApps"));
}

- (void)setPreviewRestrictedApps:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("previewRestrictedApps"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
