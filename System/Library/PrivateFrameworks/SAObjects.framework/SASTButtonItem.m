@implementation SASTButtonItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.templates");
}

- (id)encodedClassName
{
  return CFSTR("ButtonItem");
}

+ (id)buttonItem
{
  return objc_alloc_init((Class)a1);
}

- (SASTTemplateAction)action
{
  return (SASTTemplateAction *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("action"));
}

- (void)setAction:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("action"), a3);
}

- (BOOL)centered
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("centered"));
}

- (void)setCentered:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("centered"), a3);
}

- (SAUIDecoratedText)decoratedLabel
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("decoratedLabel"));
}

- (void)setDecoratedLabel:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("decoratedLabel"), a3);
}

- (SAUILocalImageResource)localImageResource
{
  return (SAUILocalImageResource *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("localImageResource"));
}

- (void)setLocalImageResource:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("localImageResource"), a3);
}

- (NSString)position
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("position"));
}

- (void)setPosition:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("position"), a3);
}

@end
