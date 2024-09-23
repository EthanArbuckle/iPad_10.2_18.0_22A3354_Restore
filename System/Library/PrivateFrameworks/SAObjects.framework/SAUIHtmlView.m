@implementation SAUIHtmlView

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("HtmlView");
}

+ (id)htmlView
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)commands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("commands"), &unk_1EE77C568);
}

- (void)setCommands:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("commands"), (uint64_t)a3);
}

- (NSString)descriptionText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("descriptionText"));
}

- (void)setDescriptionText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("descriptionText"), a3);
}

- (NSString)html
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("html"));
}

- (void)setHtml:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("html"), a3);
}

@end
