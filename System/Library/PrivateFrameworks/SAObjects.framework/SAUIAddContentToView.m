@implementation SAUIAddContentToView

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("AddContentToView");
}

+ (id)addContentToView
{
  return objc_alloc_init((Class)a1);
}

- (NSString)status
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("status"));
}

- (void)setStatus:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("status"), a3);
}

- (NSString)targetViewId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("targetViewId"));
}

- (void)setTargetViewId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("targetViewId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
