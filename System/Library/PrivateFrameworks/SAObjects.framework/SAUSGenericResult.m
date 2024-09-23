@implementation SAUSGenericResult

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.universalsearch");
}

- (id)encodedClassName
{
  return CFSTR("GenericResult");
}

+ (id)genericResult
{
  return objc_alloc_init((Class)a1);
}

- (SAUIAppPunchOut)actionButton
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("actionButton"));
}

- (void)setActionButton:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("actionButton"), a3);
}

- (BOOL)centered
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("centered"));
}

- (void)setCentered:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("centered"), a3);
}

- (NSArray)descriptions
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("descriptions"), v3);
}

- (void)setDescriptions:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("descriptions"), (uint64_t)a3);
}

- (NSString)footnote
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("footnote"));
}

- (void)setFootnote:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("footnote"), a3);
}

- (NSString)secondaryTitle
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("secondaryTitle"));
}

- (void)setSecondaryTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("secondaryTitle"), a3);
}

- (SAUIImageResource)thumbnail
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("thumbnail"));
}

- (void)setThumbnail:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("thumbnail"), a3);
}

- (NSString)title
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("title"));
}

- (void)setTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("title"), a3);
}

- (NSNumber)titleMaxLines
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("titleMaxLines"));
}

- (void)setTitleMaxLines:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("titleMaxLines"), a3);
}

@end
