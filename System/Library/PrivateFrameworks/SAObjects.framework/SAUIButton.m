@implementation SAUIButton

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("Button");
}

+ (id)button
{
  return objc_alloc_init((Class)a1);
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

- (NSString)secondaryText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("secondaryText"));
}

- (void)setSecondaryText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("secondaryText"), a3);
}

- (NSString)text
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("text"));
}

- (void)setText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("text"), a3);
}

- (SAUIColor)textColor
{
  return (SAUIColor *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("textColor"));
}

- (void)setTextColor:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("textColor"), a3);
}

@end
