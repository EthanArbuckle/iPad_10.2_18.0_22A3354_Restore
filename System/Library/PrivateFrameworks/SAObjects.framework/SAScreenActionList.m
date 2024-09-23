@implementation SAScreenActionList

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.onscreenaction");
}

- (id)encodedClassName
{
  return CFSTR("List");
}

+ (id)list
{
  return objc_alloc_init((Class)a1);
}

- (NSString)appId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("appId"));
}

- (void)setAppId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("appId"), a3);
}

- (NSString)mainEntitySemanticData
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("mainEntitySemanticData"));
}

- (void)setMainEntitySemanticData:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("mainEntitySemanticData"), a3);
}

- (NSURL)viewId
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("viewId"));
}

- (void)setViewId:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("viewId"), a3);
}

@end
