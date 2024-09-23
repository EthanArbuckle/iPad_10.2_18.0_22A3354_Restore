@implementation SAIntentGroupTextSnippetTemplate

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("TextSnippetTemplate");
}

+ (id)textSnippetTemplate
{
  return objc_alloc_init((Class)a1);
}

- (NSString)alignment
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("alignment"));
}

- (void)setAlignment:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("alignment"), a3);
}

- (NSString)detailText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("detailText"));
}

- (void)setDetailText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("detailText"), a3);
}

- (NSArray)labelComponents
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("labelComponents"), v3);
}

- (void)setLabelComponents:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("labelComponents"), (uint64_t)a3);
}

- (BOOL)showsDisclosureIndicator
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("showsDisclosureIndicator"));
}

- (void)setShowsDisclosureIndicator:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("showsDisclosureIndicator"), a3);
}

@end
