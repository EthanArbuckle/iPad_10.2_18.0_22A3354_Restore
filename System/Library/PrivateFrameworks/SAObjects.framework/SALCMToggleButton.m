@implementation SALCMToggleButton

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.livecontent");
}

- (id)encodedClassName
{
  return CFSTR("ToggleButton");
}

+ (id)toggleButton
{
  return objc_alloc_init((Class)a1);
}

- (SABaseCommand)commandToToggleToOffMode
{
  return (SABaseCommand *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("commandToToggleToOffMode"));
}

- (void)setCommandToToggleToOffMode:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("commandToToggleToOffMode"), a3);
}

- (SABaseCommand)commandToToggleToOnMode
{
  return (SABaseCommand *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("commandToToggleToOnMode"));
}

- (void)setCommandToToggleToOnMode:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("commandToToggleToOnMode"), a3);
}

- (NSDictionary)offIconDynamicImage
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("offIconDynamicImage"));
}

- (void)setOffIconDynamicImage:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("offIconDynamicImage"), a3);
}

- (NSString)offTitle
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("offTitle"));
}

- (void)setOffTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("offTitle"), a3);
}

- (NSDictionary)onIconDynamicImage
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("onIconDynamicImage"));
}

- (void)setOnIconDynamicImage:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("onIconDynamicImage"), a3);
}

- (NSString)onTitle
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("onTitle"));
}

- (void)setOnTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("onTitle"), a3);
}

@end
