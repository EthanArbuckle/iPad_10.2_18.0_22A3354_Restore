@implementation SAHomeMemberSettings

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("HomeMemberSettings");
}

+ (id)homeMemberSettings
{
  return objc_alloc_init((Class)a1);
}

- (NSString)countryCode
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("countryCode"));
}

- (void)setCountryCode:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("countryCode"), a3);
}

- (SAPerson)meCard
{
  return (SAPerson *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("meCard"));
}

- (void)setMeCard:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("meCard"), a3);
}

- (BOOL)mediaPlayerExplicitContentDisallowed
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("mediaPlayerExplicitContentDisallowed"));
}

- (void)setMediaPlayerExplicitContentDisallowed:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("mediaPlayerExplicitContentDisallowed"), a3);
}

- (NSArray)parentalRestrictions
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("parentalRestrictions"));
}

- (void)setParentalRestrictions:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("parentalRestrictions"), a3);
}

- (NSString)preferredLanguage
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("preferredLanguage"));
}

- (void)setPreferredLanguage:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("preferredLanguage"), a3);
}

- (NSString)region
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("region"));
}

- (void)setRegion:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("region"), a3);
}

- (NSString)temperatureUnit
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("temperatureUnit"));
}

- (void)setTemperatureUnit:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("temperatureUnit"), a3);
}

- (SAVoice)ttsVoice
{
  return (SAVoice *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("ttsVoice"));
}

- (void)setTtsVoice:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("ttsVoice"), a3);
}

- (NSNumber)twentyFourHourTimeDisplay
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("twentyFourHourTimeDisplay"));
}

- (void)setTwentyFourHourTimeDisplay:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("twentyFourHourTimeDisplay"), a3);
}

@end
