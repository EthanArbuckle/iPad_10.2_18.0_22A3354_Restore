@implementation SADynamiteClientState

+ (id)deliveryDeadline
{
  return CFSTR("SYNC");
}

+ (id)persistencePolicy
{
  return CFSTR("LIFE_OF_USER_DATA");
}

+ (id)syncKey
{
  return CFSTR("com.apple.siri.client.state.DynamiteClientState");
}

+ (id)uniqueObjectIdentifier
{
  return CFSTR("ClientState://DynamiteClientState");
}

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("DynamiteClientState");
}

+ (id)dynamiteClientState
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)activeTvUser
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("activeTvUser"));
}

- (void)setActiveTvUser:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("activeTvUser"), a3);
}

- (BOOL)ageVerificationRequired
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("ageVerificationRequired"));
}

- (void)setAgeVerificationRequired:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("ageVerificationRequired"), a3);
}

- (SAUserState)defaultUserState
{
  return (SAUserState *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("defaultUserState"));
}

- (void)setDefaultUserState:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("defaultUserState"), a3);
}

- (NSArray)eligibleOffers
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("eligibleOffers"));
}

- (void)setEligibleOffers:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("eligibleOffers"), a3);
}

- (SACalendar)expirationDate
{
  return (SACalendar *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("expirationDate"));
}

- (void)setExpirationDate:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("expirationDate"), a3);
}

- (NSNumber)iCloudMusicLibraryToggle
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("iCloudMusicLibraryToggle"));
}

- (void)setICloudMusicLibraryToggle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("iCloudMusicLibraryToggle"), a3);
}

- (NSString)iTunesMatchSubscriptionStatus
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("iTunesMatchSubscriptionStatus"));
}

- (void)setITunesMatchSubscriptionStatus:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("iTunesMatchSubscriptionStatus"), a3);
}

- (NSArray)inContextUsersStates
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("inContextUsersStates"), v3);
}

- (void)setInContextUsersStates:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("inContextUsersStates"), (uint64_t)a3);
}

- (BOOL)isPromotionRelatedStatus
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("isPromotionRelatedStatus"));
}

- (void)setIsPromotionRelatedStatus:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("isPromotionRelatedStatus"), a3);
}

- (NSString)status
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("status"));
}

- (void)setStatus:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("status"), a3);
}

- (NSNumber)userHistoryUnmodifiable
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("userHistoryUnmodifiable"));
}

- (void)setUserHistoryUnmodifiable:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("userHistoryUnmodifiable"), a3);
}

- (NSString)userToken
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("userToken"));
}

- (void)setUserToken:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("userToken"), a3);
}

- (SAUserTokenStatus)userTokenStatus
{
  return (SAUserTokenStatus *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("userTokenStatus"));
}

- (void)setUserTokenStatus:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("userTokenStatus"), a3);
}

- (NSString)xpAbCookie
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("xpAbCookie"));
}

- (void)setXpAbCookie:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("xpAbCookie"), a3);
}

@end
