@implementation SAUIDisambiguationItemSelected

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("DisambiguationItemSelected");
}

+ (id)disambiguationItemSelected
{
  return objc_alloc_init((Class)a1);
}

- (NSString)selectedAceId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("selectedAceId"));
}

- (void)setSelectedAceId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("selectedAceId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
