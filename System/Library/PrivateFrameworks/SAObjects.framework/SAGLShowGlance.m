@implementation SAGLShowGlance

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.glance");
}

- (id)encodedClassName
{
  return CFSTR("ShowGlance");
}

+ (id)showGlance
{
  return objc_alloc_init((Class)a1);
}

- (NSString)bundleId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("bundleId"));
}

- (void)setBundleId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("bundleId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
