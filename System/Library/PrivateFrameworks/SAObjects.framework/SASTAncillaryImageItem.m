@implementation SASTAncillaryImageItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.templates");
}

- (id)encodedClassName
{
  return CFSTR("AncillaryImageItem");
}

+ (id)ancillaryImageItem
{
  return objc_alloc_init((Class)a1);
}

- (SAUINanoImageResource)imageResource
{
  return (SAUINanoImageResource *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("imageResource"));
}

- (void)setImageResource:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("imageResource"), a3);
}

- (SAUIDecoratedText)subtitle
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("subtitle"));
}

- (void)setSubtitle:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("subtitle"), a3);
}

- (SAUIDecoratedText)title
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("title"));
}

- (void)setTitle:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("title"), a3);
}

@end
