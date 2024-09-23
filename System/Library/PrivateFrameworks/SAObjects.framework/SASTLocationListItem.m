@implementation SASTLocationListItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.templates");
}

- (id)encodedClassName
{
  return CFSTR("LocationListItem");
}

+ (id)locationListItem
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

- (SAUIDecoratedText)formattedDistance
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("formattedDistance"));
}

- (void)setFormattedDistance:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("formattedDistance"), a3);
}

- (SASTTemplateStarRating)rating
{
  return (SASTTemplateStarRating *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("rating"));
}

- (void)setRating:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("rating"), a3);
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
