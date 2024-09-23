@implementation STRootViewModel

- (STRootViewModel)init
{
  STRootViewModel *v2;
  uint64_t v3;
  STUIUser *me;
  NSArray *children;
  uint64_t v6;
  NSSet *installedBundleIDs;
  NSDictionary *installedBundleIDsByCategoryIdentifier;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)STRootViewModel;
  v2 = -[STRootViewModel init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    me = v2->_me;
    v2->_me = (STUIUser *)v3;

    children = v2->_children;
    v2->_children = (NSArray *)MEMORY[0x24BDBD1A8];

    v6 = objc_opt_new();
    installedBundleIDs = v2->_installedBundleIDs;
    v2->_installedBundleIDs = (NSSet *)v6;

    installedBundleIDsByCategoryIdentifier = v2->_installedBundleIDsByCategoryIdentifier;
    v2->_installedBundleIDsByCategoryIdentifier = (NSDictionary *)MEMORY[0x24BDBD1B8];

  }
  return v2;
}

+ (id)keyPathsForValuesAffectingScreenTimeEnabled
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("me.screenTimeEnabled"));
}

- (BOOL)isScreenTimeEnabled
{
  void *v2;
  char v3;

  -[STRootViewModel me](self, "me");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isScreenTimeEnabled");

  return v3;
}

+ (id)keyPathsForValuesAffectingCanStartScreenTime
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("me.type"), CFSTR("me.remoteUser"), CFSTR("me.screenTimeEnabled"), 0);
}

- (BOOL)canStartScreenTime
{
  char v2;
  void *v3;

  -[STRootViewModel me](self, "me");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isRemoteUser") & 1) != 0 || (unint64_t)objc_msgSend(v3, "type") <= 7)
    v2 = objc_msgSend(v3, "isScreenTimeEnabled") ^ 1;

  return v2 & 1;
}

+ (id)keyPathsForValuesAffectingCanStopScreenTime
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("me.remoteUser"), CFSTR("me.type"), CFSTR("me.screenTimeEnabled"), CFSTR("me.managed"), 0);
}

- (BOOL)canStopScreenTime
{
  char v2;
  void *v3;
  unint64_t v4;

  -[STRootViewModel me](self, "me");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isRemoteUser") || (v4 = objc_msgSend(v3, "type"), v4 < 5))
  {
    v2 = objc_msgSend(v3, "isScreenTimeEnabled");
  }
  else if (v4 - 5 < 3)
  {
    if (objc_msgSend(v3, "isScreenTimeEnabled"))
      v2 = objc_msgSend(v3, "isManaged") ^ 1;
    else
      v2 = 0;
  }

  return v2 & 1;
}

+ (id)keyPathsForValuesAffectingCanStopSharingScreenTime
{
  int v2;
  const __CFString *v3;

  v2 = _os_feature_enabled_impl();
  v3 = CFSTR("me.screenTimeEnabled");
  if (v2)
    v3 = CFSTR("me.managed");
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("me.type"), CFSTR("me.remoteUser"), v3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)canStopSharingScreenTime
{
  void *v2;
  unint64_t v3;
  char v4;

  -[STRootViewModel me](self, "me");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_os_feature_enabled_impl())
  {
    if (objc_msgSend(v2, "isScreenTimeEnabled") && (objc_msgSend(v2, "isRemoteUser") & 1) == 0)
    {
      v4 = objc_msgSend(v2, "type") == 5;
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (!objc_msgSend(v2, "isManaged"))
  {
LABEL_8:
    v4 = 0;
    goto LABEL_9;
  }
  v3 = objc_msgSend(v2, "type");
  if (v3 >= 5 && v3 - 6 >= 2)
    v4 = 1;
  else
    v4 = objc_msgSend(v2, "isRemoteUser");
LABEL_9:

  return v4;
}

+ (id)keyPathsForValuesAffectingIsSharingUsageData
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("me.type"), CFSTR("me.remoteUser"), CFSTR("me.screenTimeEnabled"), CFSTR("me.managed"), 0);
}

- (BOOL)isSharingUsageData
{
  void *v2;
  char v3;

  -[STRootViewModel me](self, "me");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "isScreenTimeEnabled")
    || (objc_msgSend(v2, "isRemoteUser") & 1) != 0
    || (unint64_t)(objc_msgSend(v2, "type") - 5) > 2)
  {
    v3 = 0;
  }
  else
  {
    v3 = objc_msgSend(v2, "isManaged");
  }

  return v3;
}

+ (id)keyPathsForValuesAffectingWebUsageEnabled
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("me.webUsageEnabled"));
}

- (BOOL)isWebUsageEnabled
{
  void *v2;
  char v3;

  -[STRootViewModel me](self, "me");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isWebUsageEnabled");

  return v3;
}

+ (id)keyPathsForValuesAffectingIsRemoteUnmanagedChild
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("me.type"), CFSTR("me.remoteUser"), CFSTR("me.managed"), 0);
}

- (BOOL)isRemoteUnmanagedChild
{
  void *v2;
  int v3;

  -[STRootViewModel me](self, "me");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "type") & 0xFFFFFFFFFFFFFFFELL) == 6 && objc_msgSend(v2, "isRemoteUser"))
    v3 = objc_msgSend(v2, "isManaged") ^ 1;
  else
    LOBYTE(v3) = 0;

  return v3;
}

+ (id)keyPathsForValuesAffectingIsLocalOrRemotelyManagedUser
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("me.remoteUser"), CFSTR("me.managed"), 0);
}

- (BOOL)isLocalOrRemotelyManagedUser
{
  void *v2;
  char v3;

  -[STRootViewModel me](self, "me");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isRemoteUser"))
  {
    if (objc_msgSend(v2, "isRemoteUser"))
      v3 = objc_msgSend(v2, "isManaged");
    else
      v3 = 0;
  }
  else
  {
    v3 = 1;
  }

  return v3;
}

+ (id)keyPathsForValuesAffectingIsLocalOrRemotelyManagedUserWithScreenTimeDisabled
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("me.remoteUser"), CFSTR("me.managed"), CFSTR("me.screenTimeEnabled"), 0);
}

- (BOOL)isLocalOrRemotelyManagedUserWithScreenTimeDisabled
{
  void *v2;
  char v3;

  -[STRootViewModel me](self, "me");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isScreenTimeEnabled") & 1) != 0)
    goto LABEL_2;
  if (!objc_msgSend(v2, "isRemoteUser"))
  {
    v3 = 1;
    goto LABEL_7;
  }
  if (!objc_msgSend(v2, "isRemoteUser"))
LABEL_2:
    v3 = 0;
  else
    v3 = objc_msgSend(v2, "isManaged");
LABEL_7:

  return v3;
}

+ (id)keyPathsForValuesAffectingIsRemotelyManagedUserWithPasscode
{
  uint64_t v3;

  if (_os_feature_enabled_impl())
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("me.type"), CFSTR("me.remoteUser"), CFSTR("me.managed"), CFSTR("me.hasPasscode"), 0, v3);
  else
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("me.type"), CFSTR("me.remoteUser"), CFSTR("me.screenTimeEnabled"), CFSTR("me.managed"), CFSTR("me.hasPasscode"), 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isRemotelyManagedUserWithPasscode
{
  void *v2;
  char v3;

  -[STRootViewModel me](self, "me");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
  {
    if ((objc_msgSend(v2, "isRemoteUser") & 1) == 0)
    {
LABEL_9:
      v3 = 0;
      goto LABEL_10;
    }
  }
  else if (!objc_msgSend(v2, "isScreenTimeEnabled") || !objc_msgSend(v2, "isRemoteUser"))
  {
    goto LABEL_9;
  }
  if ((unint64_t)(objc_msgSend(v2, "type") - 5) > 2 || !objc_msgSend(v2, "isManaged"))
    goto LABEL_9;
  v3 = objc_msgSend(v2, "hasPasscode");
LABEL_10:

  return v3;
}

+ (id)keyPathsForValuesAffectingCanSignIn
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("me.type"), CFSTR("me.remoteUser"), 0);
}

- (BOOL)canSignIn
{
  void *v2;
  BOOL v3;

  -[STRootViewModel me](self, "me");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (_os_feature_enabled_impl() || objc_msgSend(v2, "isScreenTimeEnabled"))
    && (objc_msgSend(v2, "isRemoteUser") & 1) == 0
    && (unint64_t)(objc_msgSend(v2, "type") - 8) < 0xFFFFFFFFFFFFFFF9;

  return v3;
}

+ (id)keyPathsForValuesAffectingCanToggleCloudSyncData
{
  uint64_t v3;

  if (_os_feature_enabled_impl())
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("me.type"), CFSTR("me.remoteUser"), 0, v3);
  else
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("me.type"), CFSTR("me.remoteUser"), CFSTR("me.screenTimeEnabled"), 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)canToggleCloudSyncData
{
  void *v2;
  unsigned int v3;
  unint64_t v4;

  -[STRootViewModel me](self, "me");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_os_feature_enabled_impl() || objc_msgSend(v2, "isScreenTimeEnabled"))
    && (objc_msgSend(v2, "isRemoteUser") & 1) == 0)
  {
    v4 = objc_msgSend(v2, "type");
    if (v4 <= 7)
      v3 = (0xFEu >> v4) & 1;
    else
      LOBYTE(v3) = 0;
  }
  else
  {
    LOBYTE(v3) = 0;
  }

  return v3;
}

+ (id)keyPathsForValuesAffectingCanEditScreenTimePasscode
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("me.remoteUser"), CFSTR("me.type"), CFSTR("me.managed"), 0);
}

- (BOOL)canEditScreenTimePasscode
{
  void *v2;
  int v3;

  -[STRootViewModel me](self, "me");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isRemoteUser"))
  {
    LOBYTE(v3) = objc_msgSend(v2, "isManaged");
  }
  else if ((unint64_t)(objc_msgSend(v2, "type") - 5) > 2)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = objc_msgSend(v2, "isManaged") ^ 1;
  }

  return v3;
}

+ (id)keyPathsForValuesAffectingCanSetUpFamily
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("me.type"), CFSTR("me.remoteUser"), 0);
}

- (BOOL)canSetUpFamily
{
  void *v2;
  BOOL v3;

  -[STRootViewModel me](self, "me");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (_os_feature_enabled_impl() || objc_msgSend(v2, "isScreenTimeEnabled"))
    && (objc_msgSend(v2, "isRemoteUser") & 1) == 0
    && objc_msgSend(v2, "type") == 1;

  return v3;
}

+ (id)keyPathsForValuesAffectingCanViewAskForTimeRequests
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("screenTimeEnabled"), CFSTR("me.remoteUser"), 0);
}

- (BOOL)canViewAskForTimeRequests
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[STRootViewModel isScreenTimeEnabled](self, "isScreenTimeEnabled");
  if (v3)
  {
    -[STRootViewModel me](self, "me");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isRemoteUser");

    LOBYTE(v3) = v5;
  }
  return v3;
}

+ (id)keyPathsForValuesAffectingForceParentalControls
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("me.isRemoteUser"), CFSTR("me.type"), 0);
}

- (BOOL)forceParentalControls
{
  void *v2;
  BOOL v3;

  -[STRootViewModel me](self, "me");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isRemoteUser"))
    v3 = (objc_msgSend(v2, "type") & 0xFFFFFFFFFFFFFFFELL) == 6;
  else
    v3 = 0;

  return v3;
}

+ (id)keyPathsForValuesAffectingCanToggleWebsiteData
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("me.type"), CFSTR("me.remoteUser"), CFSTR("me.screenTimeEnabled"), 0);
}

- (BOOL)canToggleWebsiteData
{
  void *v2;
  BOOL v3;

  -[STRootViewModel me](self, "me");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isScreenTimeEnabled")
    && objc_msgSend(v2, "isRemoteUser")
    && (unint64_t)(objc_msgSend(v2, "type") - 5) < 3;

  return v3;
}

- (BOOL)shouldShowCompatibilityAlerts
{
  void *v3;
  void *v4;
  BOOL v5;

  -[STRootViewModel me](self, "me");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[STRootViewModel isCloudSyncEnabled](self, "isCloudSyncEnabled")
    || objc_msgSend(v3, "isRemoteUser"))
  {
    objc_msgSend(v3, "dsid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)keyPathsForValuesAffectingHasWatchOSDevices
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("devices"));
}

+ (id)keyPathsForValuesAffectingHasWatchOSDevicesOnly
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("devices"));
}

- (BOOL)canStopScreenTimeWithoutPasscode
{
  return self->_canStopScreenTimeWithoutPasscode;
}

- (void)setCanStopScreenTimeWithoutPasscode:(BOOL)a3
{
  self->_canStopScreenTimeWithoutPasscode = a3;
}

- (BOOL)isCloudSyncEnabled
{
  return self->_isCloudSyncEnabled;
}

- (void)setIsCloudSyncEnabled:(BOOL)a3
{
  self->_isCloudSyncEnabled = a3;
}

- (NSSet)installedBundleIDs
{
  return self->_installedBundleIDs;
}

- (void)setInstalledBundleIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)installedBundleIDsByCategoryIdentifier
{
  return self->_installedBundleIDsByCategoryIdentifier;
}

- (void)setInstalledBundleIDsByCategoryIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (STUIUser)me
{
  return self->_me;
}

- (void)setMe:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isCommunicationSafetyReceivingRestricted
{
  return self->_isCommunicationSafetyReceivingRestricted;
}

- (BOOL)isCommunicationSafetySendingRestricted
{
  return self->_isCommunicationSafetySendingRestricted;
}

- (BOOL)isCommunicationSafetyNotificationEnabled
{
  return self->_isCommunicationSafetyNotificationEnabled;
}

- (BOOL)isCommunicationSafetyAnalyticsEnabled
{
  return self->_isCommunicationSafetyAnalyticsEnabled;
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)hasWatchOSDevicesInternal
{
  return self->_hasWatchOSDevicesInternal;
}

- (void)setHasWatchOSDevicesInternal:(BOOL)a3
{
  self->_hasWatchOSDevicesInternal = a3;
}

- (BOOL)hasWatchOSDevicesOnlyInternal
{
  return self->_hasWatchOSDevicesOnlyInternal;
}

- (void)setHasWatchOSDevicesOnlyInternal:(BOOL)a3
{
  self->_hasWatchOSDevicesOnlyInternal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_me, 0);
  objc_storeStrong((id *)&self->_installedBundleIDsByCategoryIdentifier, 0);
  objc_storeStrong((id *)&self->_installedBundleIDs, 0);
}

@end
