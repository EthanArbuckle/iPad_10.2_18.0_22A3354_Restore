@implementation SAUSRowCardSection

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.universalsearch");
}

- (id)encodedClassName
{
  return CFSTR("RowCardSection");
}

+ (id)rowCardSection
{
  return objc_alloc_init((Class)a1);
}

- (SAUIImageResource)image
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("image"));
}

- (void)setImage:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("image"), a3);
}

- (BOOL)imageIsRightAligned
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("imageIsRightAligned"));
}

- (void)setImageIsRightAligned:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("imageIsRightAligned"), a3);
}

- (NSString)leftText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("leftText"));
}

- (void)setLeftText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("leftText"), a3);
}

- (NSString)rightText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("rightText"));
}

- (void)setRightText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("rightText"), a3);
}

@end
