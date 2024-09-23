@implementation SAUSRichTitleCardSection

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.universalsearch");
}

- (id)encodedClassName
{
  return CFSTR("RichTitleCardSection");
}

+ (id)richTitleCardSection
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)centered
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("centered"));
}

- (void)setCentered:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("centered"), a3);
}

- (NSString)contentRatingText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("contentRatingText"));
}

- (void)setContentRatingText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("contentRatingText"), a3);
}

- (NSString)subtitle
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("subtitle"));
}

- (void)setSubtitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("subtitle"), a3);
}

- (SAUIImageResource)titleImage
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("titleImage"));
}

- (void)setTitleImage:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("titleImage"), a3);
}

@end
