@implementation SASTSpecificAnswerItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.templates");
}

- (id)encodedClassName
{
  return CFSTR("SpecificAnswerItem");
}

+ (id)specificAnswerItem
{
  return objc_alloc_init((Class)a1);
}

- (SAUIDecoratedText)decoratedFooter
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("decoratedFooter"));
}

- (void)setDecoratedFooter:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("decoratedFooter"), a3);
}

- (SAUIDecoratedText)decoratedValue
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("decoratedValue"));
}

- (void)setDecoratedValue:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("decoratedValue"), a3);
}

- (NSString)footer
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("footer"));
}

- (void)setFooter:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("footer"), a3);
}

- (NSString)value
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("value"));
}

- (void)setValue:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("value"), a3);
}

@end
