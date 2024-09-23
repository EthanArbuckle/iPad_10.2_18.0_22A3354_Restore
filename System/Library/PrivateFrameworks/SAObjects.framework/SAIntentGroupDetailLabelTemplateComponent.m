@implementation SAIntentGroupDetailLabelTemplateComponent

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("DetailLabelTemplateComponent");
}

+ (id)detailLabelTemplateComponent
{
  return objc_alloc_init((Class)a1);
}

- (NSString)detailText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("detailText"));
}

- (void)setDetailText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("detailText"), a3);
}

@end
