@implementation ManagedConfigWrapper

+ (id)sharedInstance
{
  if (qword_10026D580 != -1)
    dispatch_once(&qword_10026D580, &stru_10022EE70);
  return (id)qword_10026D578;
}

- (void)initializeWithHandler:(__WiFiManager *)a3
{
  void *v5;

  v5 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: starting", "-[ManagedConfigWrapper initializeWithHandler:]");
  objc_autoreleasePoolPop(v5);
  -[ManagedConfigWrapper setManager:](self, "setManager:", a3);
  -[ManagedConfigWrapper setMcInitialized:](self, "setMcInitialized:", 0);
  -[ManagedConfigWrapper setMonitoring:](self, "setMonitoring:", 0);
  -[ManagedConfigWrapper setMcConnection:](self, "setMcConnection:", +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  -[ManagedConfigWrapper setProfileIdentifier:](self, "setProfileIdentifier:", 0);
}

- (void)dealloc
{
  objc_super v3;

  if (-[ManagedConfigWrapper monitoring](self, "monitoring"))
    -[ManagedConfigWrapper stopMonitoring](self, "stopMonitoring");

  self->_profileIdentifier = 0;
  v3.receiver = self;
  v3.super_class = (Class)ManagedConfigWrapper;
  -[ManagedConfigWrapper dealloc](&v3, "dealloc");
}

- (void)MCSettingsDidChange:(id)a3
{
  void *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  void *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  void *v12;
  _QWORD block[5];
  char v14;
  char v15;
  char v16;

  v4 = objc_autoreleasePoolPush();
  v5 = -[MCProfileConnection isWiFiWithAllowedNetworksOnlyEnforced](-[ManagedConfigWrapper mcConnection](self, "mcConnection"), "isWiFiWithAllowedNetworksOnlyEnforced");
  v6 = -[MCProfileConnection isWiFiPowerModificationAllowed](-[ManagedConfigWrapper mcConnection](self, "mcConnection"), "isWiFiPowerModificationAllowed");
  v7 = -[MCProfileConnection isPersonalHotspotModificationAllowed](-[ManagedConfigWrapper mcConnection](self, "mcConnection"), "isPersonalHotspotModificationAllowed");
  v8 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
  {
    v9 = "FALSE";
    if (v5)
      v9 = "TRUE";
    v10 = "Disabled";
    if (v6)
      v11 = "Enabled";
    else
      v11 = "Disabled";
    if (v7)
      v10 = "Enabled";
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: MCNotification received. isWiFiWithAllowedNetworksOnlyEnforced (%s) WiFiPowerModification (%s) PersonalHotspotModification (%s)", "-[ManagedConfigWrapper MCSettingsDidChange:]", v9, v11, v10);
  }
  objc_autoreleasePoolPop(v8);
  if (-[ManagedConfigWrapper queue](self, "queue"))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003EA00;
    block[3] = &unk_10022EE98;
    block[4] = self;
    v14 = v6 ^ 1;
    v15 = v7 ^ 1;
    v16 = v5;
    dispatch_async((dispatch_queue_t)-[ManagedConfigWrapper queue](self, "queue"), block);
  }
  else
  {
    v12 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: probably WiFiManager is in middle of closing.", "-[ManagedConfigWrapper MCSettingsDidChange:]");
    objc_autoreleasePoolPop(v12);
  }
  objc_autoreleasePoolPop(v4);
}

- (BOOL)isWiFiPowerModificationDisabled
{
  void *v3;

  v3 = objc_autoreleasePoolPush();
  LOBYTE(self) = -[MCProfileConnection isWiFiPowerModificationAllowed](-[ManagedConfigWrapper mcConnection](self, "mcConnection"), "isWiFiPowerModificationAllowed") ^ 1;
  objc_autoreleasePoolPop(v3);
  return (char)self;
}

- (void)MCInitialize
{
  void *v3;
  _QWORD v4[5];

  v3 = objc_autoreleasePoolPush();
  if (!-[ManagedConfigWrapper mcInitialized](self, "mcInitialized"))
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10003EB08;
    v4[3] = &unk_10022EEC0;
    v4[4] = self;
    -[MCProfileConnection checkInWithCompletion:](-[ManagedConfigWrapper mcConnection](self, "mcConnection"), "checkInWithCompletion:", v4);
  }
  objc_autoreleasePoolPop(v3);
}

- (void)scheduleWithQueue:(id)a3
{
  void *v5;
  _QWORD block[5];

  v5 = objc_autoreleasePoolPush();
  -[ManagedConfigWrapper setQueue:](self, "setQueue:", a3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003EC34;
  block[3] = &unk_10022EEE8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)qword_10026DD40, block);
  objc_autoreleasePoolPop(v5);
}

- (void)unscheduleFromQueue:(id)a3
{
  void *v4;

  v4 = objc_autoreleasePoolPush();
  -[ManagedConfigWrapper stopMonitoring](self, "stopMonitoring");
  -[ManagedConfigWrapper setQueue:](self, "setQueue:", 0);
  objc_autoreleasePoolPop(v4);
}

- (void)startMonitoring
{
  void *v3;
  void *v4;
  NSNotificationCenter *v5;

  v3 = objc_autoreleasePoolPush();
  v4 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: adding observer", "-[ManagedConfigWrapper startMonitoring]");
  objc_autoreleasePoolPop(v4);
  v5 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter addObserver:selector:name:object:](v5, "addObserver:selector:name:object:", self, "MCSettingsDidChange:", MCEffectiveSettingsChangedNotification, 0);
  -[ManagedConfigWrapper setMonitoring:](self, "setMonitoring:", 1);
  objc_autoreleasePoolPop(v3);
}

- (void)stopMonitoring
{
  void *v3;
  void *v4;
  NSNotificationCenter *v5;

  v3 = objc_autoreleasePoolPush();
  v4 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: removing observer", "-[ManagedConfigWrapper stopMonitoring]");
  objc_autoreleasePoolPop(v4);
  v5 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:](v5, "removeObserver:name:object:", self, MCEffectiveSettingsChangedNotification, 0);
  -[ManagedConfigWrapper setMonitoring:](self, "setMonitoring:", 0);
  objc_autoreleasePoolPop(v3);
}

- (BOOL)isWiFiNetworkSubjectToMDM:(__WiFiNetwork *)a3
{
  void *v5;
  const void *v6;
  id v7;

  v5 = objc_autoreleasePoolPush();
  v6 = sub_10002BE64((uint64_t)a3, CFSTR("PayloadUUID"));
  if (v6)
  {
    v7 = -[MCProfileConnection installedProfilesWithFilterFlags:](-[ManagedConfigWrapper mcConnection](self, "mcConnection"), "installedProfilesWithFilterFlags:", 69);
    if (v7)
      LOBYTE(v6) = objc_msgSend(objc_msgSend(v7, "filteredArrayUsingPredicate:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("ANY SELF.payloads.UUID MATCHES %@"), v6)), "count") == 0;
    else
      LOBYTE(v6) = 0;
  }
  objc_autoreleasePoolPop(v5);
  return (char)v6;
}

- (BOOL)isEAPShareBlockedByManagedDefault
{
  void *v2;
  NSDictionary *v3;
  BOOL v4;

  v2 = objc_autoreleasePoolPush();
  v3 = +[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", CFSTR("/Library/Managed Preferences/mobile/.GlobalPreferences.plist"));
  v4 = v3
    && objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("EAPCredentialShareDisable")), "intValue");
  objc_autoreleasePoolPop(v2);
  return v4;
}

- (BOOL)isSupervisedDevice
{
  void *v2;
  unsigned __int8 v3;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isSupervised");
  objc_autoreleasePoolPop(v2);
  return v3;
}

- (BOOL)isWiFiNetworkMDMNetwork:(__WiFiNetwork *)a3
{
  void *v5;
  const void *v6;
  id v7;

  v5 = objc_autoreleasePoolPush();
  v6 = sub_10002BE64((uint64_t)a3, CFSTR("PayloadUUID"));
  if (v6)
  {
    v7 = -[MCProfileConnection installedProfilesWithFilterFlags:](-[ManagedConfigWrapper mcConnection](self, "mcConnection"), "installedProfilesWithFilterFlags:", 32);
    if (v7)
      LOBYTE(v6) = objc_msgSend(objc_msgSend(v7, "filteredArrayUsingPredicate:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("ANY SELF.payloads.UUID MATCHES %@"), v6)), "count") != 0;
    else
      LOBYTE(v6) = 0;
  }
  objc_autoreleasePoolPop(v5);
  return (char)v6;
}

- (void)installMegaWiFiProfile
{
  void *v3;
  void *v4;
  uint64_t v5;

  v3 = objc_autoreleasePoolPush();
  v5 = 0;
  -[ManagedConfigWrapper setProfileIdentifier:](self, "setProfileIdentifier:", -[MCProfileConnection installProfileData:outError:](self->_mcConnection, "installProfileData:outError:", +[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/AppleInternal/Library/WiFi/Profiles/MegaWifi Profile.mobileconfig"))), &v5));
  if (v5)
  {
    v4 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: %@", "-[ManagedConfigWrapper installMegaWiFiProfile]", v5);
    objc_autoreleasePoolPop(v4);
  }
  objc_autoreleasePoolPop(v3);
}

- (void)uninstallMegaWiFiProfile
{
  void *v3;

  v3 = objc_autoreleasePoolPush();
  if (-[ManagedConfigWrapper profileIdentifier](self, "profileIdentifier"))
  {
    -[MCProfileConnection removeProfileWithIdentifier:](self->_mcConnection, "removeProfileWithIdentifier:", -[ManagedConfigWrapper profileIdentifier](self, "profileIdentifier"));
    -[ManagedConfigWrapper setProfileIdentifier:](self, "setProfileIdentifier:", 0);
  }
  objc_autoreleasePoolPop(v3);
}

- (BOOL)isMegaWiFiProfileInstalled
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = objc_autoreleasePoolPush();
  v4 = -[MCProfileConnection installedProfilesWithFilterFlags:](self->_mcConnection, "installedProfilesWithFilterFlags:", 1);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "identifier"), "isEqualToString:", CFSTR("com.apple.defaults.managed.corecapture.wifi.megawifi")) & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:
  objc_autoreleasePoolPop(v3);
  return v9;
}

- (__WiFiManager)manager
{
  return self->_manager;
}

- (void)setManager:(__WiFiManager *)a3
{
  self->_manager = a3;
}

- (BOOL)mcInitialized
{
  return self->_mcInitialized;
}

- (void)setMcInitialized:(BOOL)a3
{
  self->_mcInitialized = a3;
}

- (BOOL)monitoring
{
  return self->_monitoring;
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  self->_queue = (OS_dispatch_queue *)a3;
}

- (MCProfileConnection)mcConnection
{
  return self->_mcConnection;
}

- (void)setMcConnection:(id)a3
{
  self->_mcConnection = (MCProfileConnection *)a3;
}

- (NSString)profileIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setProfileIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

@end
