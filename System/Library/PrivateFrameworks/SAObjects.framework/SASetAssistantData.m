@implementation SASetAssistantData

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("SetAssistantData");
}

+ (id)setAssistantData
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)abSources
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("abSources"), v3);
}

- (void)setAbSources:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("abSources"), (uint64_t)a3);
}

- (NSNumber)allowUserGeneratedContent
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("allowUserGeneratedContent"));
}

- (void)setAllowUserGeneratedContent:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("allowUserGeneratedContent"), a3);
}

- (NSString)anchor
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("anchor"));
}

- (void)setAnchor:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("anchor"), a3);
}

- (BOOL)censorSpeech
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("censorSpeech"));
}

- (void)setCensorSpeech:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("censorSpeech"), a3);
}

- (NSString)countryCode
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("countryCode"));
}

- (void)setCountryCode:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("countryCode"), a3);
}

- (NSNumber)debugFlags
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("debugFlags"));
}

- (void)setDebugFlags:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("debugFlags"), a3);
}

- (NSArray)deviceCapabilities
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("deviceCapabilities"));
}

- (void)setDeviceCapabilities:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("deviceCapabilities"), a3);
}

- (NSString)deviceColor
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("deviceColor"));
}

- (void)setDeviceColor:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("deviceColor"), a3);
}

- (NSString)deviceEnclosure
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("deviceEnclosure"));
}

- (void)setDeviceEnclosure:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("deviceEnclosure"), a3);
}

- (NSString)deviceVersion
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("deviceVersion"));
}

- (void)setDeviceVersion:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("deviceVersion"), a3);
}

- (NSString)firstName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("firstName"));
}

- (void)setFirstName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("firstName"), a3);
}

- (NSString)fullStorefrontId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("fullStorefrontId"));
}

- (void)setFullStorefrontId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("fullStorefrontId"), a3);
}

- (BOOL)handsFree
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("handsFree"));
}

- (void)setHandsFree:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("handsFree"), a3);
}

- (NSNumber)holdToTalkThresholdInMilliseconds
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("holdToTalkThresholdInMilliseconds"));
}

- (void)setHoldToTalkThresholdInMilliseconds:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("holdToTalkThresholdInMilliseconds"), a3);
}

- (BOOL)inRetailStoreDemoMode
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("inRetailStoreDemoMode"));
}

- (void)setInRetailStoreDemoMode:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("inRetailStoreDemoMode"), a3);
}

- (NSString)lastName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("lastName"));
}

- (void)setLastName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("lastName"), a3);
}

- (NSArray)meCards
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("meCards"), v3);
}

- (void)setMeCards:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("meCards"), (uint64_t)a3);
}

- (SAMediaContentRatingRestrictions)mediaContentRatingRestrictions
{
  return (SAMediaContentRatingRestrictions *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("mediaContentRatingRestrictions"));
}

- (void)setMediaContentRatingRestrictions:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("mediaContentRatingRestrictions"), a3);
}

- (BOOL)mediaPlayerExplicitContentDisallowed
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("mediaPlayerExplicitContentDisallowed"));
}

- (void)setMediaPlayerExplicitContentDisallowed:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("mediaPlayerExplicitContentDisallowed"), a3);
}

- (NSString)osVersion
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("osVersion"));
}

- (void)setOsVersion:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("osVersion"), a3);
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

- (NSNumber)storefront
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("storefront"));
}

- (void)setStorefront:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("storefront"), a3);
}

- (NSString)temperatureUnit
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("temperatureUnit"));
}

- (void)setTemperatureUnit:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("temperatureUnit"), a3);
}

- (NSString)timeZoneId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("timeZoneId"));
}

- (void)setTimeZoneId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("timeZoneId"), a3);
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

- (NSNumber)uiScale
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("uiScale"));
}

- (void)setUiScale:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("uiScale"), a3);
}

- (NSString)userInterfaceIdiom
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("userInterfaceIdiom"));
}

- (void)setUserInterfaceIdiom:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("userInterfaceIdiom"), a3);
}

- (BOOL)voiceOver
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("voiceOver"));
}

- (void)setVoiceOver:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("voiceOver"), a3);
}

- (NSNumber)voiceTriggerEnabled
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("voiceTriggerEnabled"));
}

- (void)setVoiceTriggerEnabled:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("voiceTriggerEnabled"), a3);
}

- (SAWatchData)watchData
{
  return (SAWatchData *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("watchData"));
}

- (void)setWatchData:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("watchData"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
