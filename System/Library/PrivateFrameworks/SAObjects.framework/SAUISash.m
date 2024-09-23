@implementation SAUISash

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("Sash");
}

+ (id)sash
{
  return objc_alloc_init((Class)a1);
}

- (NSString)applicationBundleIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("applicationBundleIdentifier"));
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("applicationBundleIdentifier"), a3);
}

- (SAUIColor)backgroundColor
{
  return (SAUIColor *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("backgroundColor"));
}

- (void)setBackgroundColor:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("backgroundColor"), a3);
}

- (NSArray)commands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("commands"), &unk_1EE77C568);
}

- (void)setCommands:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("commands"), (uint64_t)a3);
}

- (SAUIImageResource)image
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("image"));
}

- (void)setImage:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("image"), a3);
}

- (SAUIColor)textColor
{
  return (SAUIColor *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("textColor"));
}

- (void)setTextColor:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("textColor"), a3);
}

- (NSString)title
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("title"));
}

- (void)setTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("title"), a3);
}

@end
