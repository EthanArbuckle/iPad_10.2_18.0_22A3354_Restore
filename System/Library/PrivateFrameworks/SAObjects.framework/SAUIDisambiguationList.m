@implementation SAUIDisambiguationList

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("DisambiguationList");
}

+ (id)disambiguationList
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)autoDisambiguationDisabled
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("autoDisambiguationDisabled"));
}

- (void)setAutoDisambiguationDisabled:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("autoDisambiguationDisabled"), a3);
}

- (NSString)disambiguationKey
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("disambiguationKey"));
}

- (void)setDisambiguationKey:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("disambiguationKey"), a3);
}

- (SAUIDomainObjectPicker)domainObjectPicker
{
  return (SAUIDomainObjectPicker *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("domainObjectPicker"));
}

- (void)setDomainObjectPicker:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("domainObjectPicker"), a3);
}

- (NSArray)fallbackCommands
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("fallbackCommands"), v3);
}

- (void)setFallbackCommands:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("fallbackCommands"), (uint64_t)a3);
}

- (NSString)groupTitle
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("groupTitle"));
}

- (void)setGroupTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("groupTitle"), a3);
}

- (NSArray)items
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("items"), v3);
}

- (void)setItems:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("items"), (uint64_t)a3);
}

- (NSString)selectionResponse
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("selectionResponse"));
}

- (void)setSelectionResponse:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("selectionResponse"), a3);
}

- (NSString)speakableDelimiter
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("speakableDelimiter"));
}

- (void)setSpeakableDelimiter:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("speakableDelimiter"), a3);
}

- (NSString)speakableFinalDelimiter
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("speakableFinalDelimiter"));
}

- (void)setSpeakableFinalDelimiter:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("speakableFinalDelimiter"), a3);
}

- (NSString)speakableSelectionResponse
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("speakableSelectionResponse"));
}

- (void)setSpeakableSelectionResponse:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("speakableSelectionResponse"), a3);
}

- (NSString)speakableSuffix
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("speakableSuffix"));
}

- (void)setSpeakableSuffix:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("speakableSuffix"), a3);
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
