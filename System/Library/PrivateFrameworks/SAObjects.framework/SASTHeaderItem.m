@implementation SASTHeaderItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.templates");
}

- (id)encodedClassName
{
  return CFSTR("HeaderItem");
}

+ (id)headerItem
{
  return objc_alloc_init((Class)a1);
}

- (SAUIDecoratedText)header
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("header"));
}

- (void)setHeader:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("header"), a3);
}

- (SAUIDecoratedText)subtitle
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("subtitle"));
}

- (void)setSubtitle:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("subtitle"), a3);
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
