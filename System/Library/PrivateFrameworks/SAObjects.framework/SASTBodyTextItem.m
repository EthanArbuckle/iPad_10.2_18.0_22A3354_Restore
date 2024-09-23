@implementation SASTBodyTextItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.templates");
}

- (id)encodedClassName
{
  return CFSTR("BodyTextItem");
}

+ (id)bodyTextItem
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

- (NSString)bodyText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("bodyText"));
}

- (void)setBodyText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("bodyText"), a3);
}

- (SADecoratedString)decoratedBodyText
{
  return (SADecoratedString *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("decoratedBodyText"));
}

- (void)setDecoratedBodyText:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("decoratedBodyText"), a3);
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
