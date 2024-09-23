@implementation ICMutableUserIdentityProperties

- (void)setActiveLocker:(BOOL)a3
{
  self->super._activeLocker = a3;
}

- (void)setActive:(BOOL)a3
{
  self->super._active = a3;
}

- (void)setUsername:(id)a3
{
  NSString *v4;
  NSString *username;

  if (self->super._username != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    username = self->super._username;
    self->super._username = v4;

  }
}

- (void)setSubscriptionStatusEnabled:(BOOL)a3
{
  self->super._subscriptionStatusEnabled = a3;
}

- (void)setStorefrontIdentifier:(id)a3
{
  NSString *v4;
  NSString *storefrontIdentifier;

  if (self->super._storefrontIdentifier != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    storefrontIdentifier = self->super._storefrontIdentifier;
    self->super._storefrontIdentifier = v4;

  }
}

- (void)setSandboxed:(BOOL)a3
{
  self->super._sandboxed = a3;
}

- (void)setPrivateListeningEnabledForHomeUsers:(id)a3
{
  NSDictionary *v4;
  NSDictionary *privateListeningEnabledForHomeUsers;

  if (self->super._privateListeningEnabledForHomeUsers != a3)
  {
    v4 = (NSDictionary *)objc_msgSend(a3, "copy");
    privateListeningEnabledForHomeUsers = self->super._privateListeningEnabledForHomeUsers;
    self->super._privateListeningEnabledForHomeUsers = v4;

  }
}

- (void)setPrivateListeningEnabled:(id)a3
{
  NSNumber *v4;
  NSNumber *privateListeningEnabled;

  if (self->super._privateListeningEnabled != a3)
  {
    v4 = (NSNumber *)objc_msgSend(a3, "copy");
    privateListeningEnabled = self->super._privateListeningEnabled;
    self->super._privateListeningEnabled = v4;

  }
}

- (void)setPrivacyAcknowledgementVersions:(id)a3
{
  NSDictionary *v4;
  NSDictionary *privacyAcknowledgementVersions;

  if (self->super._privacyAcknowledgementVersions != a3)
  {
    v4 = (NSDictionary *)objc_msgSend(a3, "copy");
    privacyAcknowledgementVersions = self->super._privacyAcknowledgementVersions;
    self->super._privacyAcknowledgementVersions = v4;

  }
}

- (void)setMergeToCloudLibraryPreference:(id)a3
{
  NSNumber *v4;
  NSNumber *mergeToCloudLibraryPreference;

  if (self->super._mergeToCloudLibraryPreference != a3)
  {
    v4 = (NSNumber *)objc_msgSend(a3, "copy");
    mergeToCloudLibraryPreference = self->super._mergeToCloudLibraryPreference;
    self->super._mergeToCloudLibraryPreference = v4;

  }
}

- (void)setManagedAppleID:(BOOL)a3
{
  self->super._managedAppleID = a3;
}

- (void)setLastName:(id)a3
{
  NSString *v4;
  NSString *lastName;

  if (self->super._lastName != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    lastName = self->super._lastName;
    self->super._lastName = v4;

  }
}

- (void)setHomeUserIdentifiers:(id)a3
{
  NSArray *v4;
  NSArray *homeUserIdentifiers;

  if (self->super._homeUserIdentifiers != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    homeUserIdentifiers = self->super._homeUserIdentifiers;
    self->super._homeUserIdentifiers = v4;

  }
}

- (void)setFirstName:(id)a3
{
  NSString *v4;
  NSString *firstName;

  if (self->super._firstName != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    firstName = self->super._firstName;
    self->super._firstName = v4;

  }
}

- (void)setDSID:(id)a3
{
  NSNumber *v4;
  NSNumber *dsid;

  if (self->super._dsid != a3)
  {
    v4 = (NSNumber *)objc_msgSend(a3, "copy");
    dsid = self->super._dsid;
    self->super._dsid = v4;

  }
}

- (void)setCloudLibraryStateReason:(id)a3
{
  NSDictionary *v4;
  NSDictionary *cloudLibraryStateReason;

  if (self->super._cloudLibraryStateReason != a3)
  {
    v4 = (NSDictionary *)objc_msgSend(a3, "copy");
    cloudLibraryStateReason = self->super._cloudLibraryStateReason;
    self->super._cloudLibraryStateReason = v4;

  }
}

- (void)setAlternateDSID:(id)a3
{
  NSString *v4;
  NSString *alternateDSID;

  if (self->super._alternateDSID != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    alternateDSID = self->super._alternateDSID;
    self->super._alternateDSID = v4;

  }
}

- (void)replaceValuesWithValuesFromProperties:(id)a3
{
  __CopyHelper(a3, self, 0);
}

- (void)setCarrierBundleDeviceIdentifier:(id)a3
{
  NSString *v4;
  NSString *carrierBundleDeviceIdentifier;

  if (self->super._carrierBundleDeviceIdentifier != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    carrierBundleDeviceIdentifier = self->super._carrierBundleDeviceIdentifier;
    self->super._carrierBundleDeviceIdentifier = v4;

  }
}

- (void)setDelegated:(BOOL)a3
{
  self->super._delegated = a3;
}

- (void)setDelegateToken:(id)a3
{
  ICDelegateToken *v4;
  ICDelegateToken *delegateToken;

  if (self->super._delegateToken != a3)
  {
    v4 = (ICDelegateToken *)objc_msgSend(a3, "copy");
    delegateToken = self->super._delegateToken;
    self->super._delegateToken = v4;

  }
}

- (void)setU18MinorAccount:(BOOL)a3
{
  self->super._u18MinorAccount = a3;
}

- (void)setCloudBackupEnabled:(BOOL)a3
{
  self->super._cloudBackupEnabled = a3;
}

- (void)setICloudPersonID:(id)a3
{
  NSString *v4;
  NSString *iCloudPersonID;

  if (self->super._iCloudPersonID != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    iCloudPersonID = self->super._iCloudPersonID;
    self->super._iCloudPersonID = v4;

  }
}

@end
