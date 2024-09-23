@implementation SAIntentGroupLabelTemplateComponent

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("LabelTemplateComponent");
}

+ (id)labelTemplateComponent
{
  return objc_alloc_init((Class)a1);
}

- (NSString)labelTemplateComponentStyle
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("labelTemplateComponentStyle"));
}

- (void)setLabelTemplateComponentStyle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("labelTemplateComponentStyle"), a3);
}

- (NSString)text
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("text"));
}

- (void)setText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("text"), a3);
}

@end
