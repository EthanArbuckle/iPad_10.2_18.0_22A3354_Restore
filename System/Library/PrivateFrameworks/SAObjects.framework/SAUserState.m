@implementation SAUserState

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("UserState");
}

+ (id)userState
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)ageVerificationRequired
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("ageVerificationRequired"));
}

- (void)setAgeVerificationRequired:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("ageVerificationRequired"), a3);
}

- (NSString)defaultMediaPlaybackAppBundleIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("defaultMediaPlaybackAppBundleIdentifier"));
}

- (void)setDefaultMediaPlaybackAppBundleIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("defaultMediaPlaybackAppBundleIdentifier"), a3);
}

- (NSArray)eligibleOffers
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("eligibleOffers"));
}

- (void)setEligibleOffers:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("eligibleOffers"), a3);
}

- (NSString)iTunesMatchSubscriptionStatus
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("iTunesMatchSubscriptionStatus"));
}

- (void)setITunesMatchSubscriptionStatus:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("iTunesMatchSubscriptionStatus"), a3);
}

- (BOOL)isPromotionRelatedStatus
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("isPromotionRelatedStatus"));
}

- (void)setIsPromotionRelatedStatus:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("isPromotionRelatedStatus"), a3);
}

- (NSString)sharedUserId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sharedUserId"));
}

- (void)setSharedUserId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sharedUserId"), a3);
}

- (NSString)status
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("status"));
}

- (void)setStatus:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("status"), a3);
}

- (NSString)syncSharedUserId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("syncSharedUserId"));
}

- (void)setSyncSharedUserId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("syncSharedUserId"), a3);
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
