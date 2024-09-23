@implementation SAScreenActionActivateUIElement

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.onscreenaction");
}

- (id)encodedClassName
{
  return CFSTR("ActivateUIElement");
}

+ (id)activateUIElement
{
  return objc_alloc_init((Class)a1);
}

- (NSString)elementId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("elementId"));
}

- (void)setElementId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("elementId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
