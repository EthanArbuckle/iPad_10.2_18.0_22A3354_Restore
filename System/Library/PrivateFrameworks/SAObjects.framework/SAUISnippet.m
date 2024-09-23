@implementation SAUISnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("Snippet");
}

+ (id)snippet
{
  return objc_alloc_init((Class)a1);
}

- (int64_t)category
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("category"));
}

- (void)setCategory:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("category"), a3);
}

- (SAUIConfirmationOptions)confirmationOptions
{
  return (SAUIConfirmationOptions *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("confirmationOptions"));
}

- (void)setConfirmationOptions:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("confirmationOptions"), a3);
}

- (SAUISash)sash
{
  return (SAUISash *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("sash"));
}

- (void)setSash:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("sash"), a3);
}

- (NSString)subtitle
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("subtitle"));
}

- (void)setSubtitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("subtitle"), a3);
}

- (NSString)summaryTitle
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("summaryTitle"));
}

- (void)setSummaryTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("summaryTitle"), a3);
}

- (NSString)title
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("title"));
}

- (void)setTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("title"), a3);
}

@end
