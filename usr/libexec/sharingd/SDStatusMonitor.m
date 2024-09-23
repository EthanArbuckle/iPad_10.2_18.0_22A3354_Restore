@implementation SDStatusMonitor

+ (SDStatusMonitor)sharedMonitor
{
  if (qword_1007C6D18 != -1)
    dispatch_once(&qword_1007C6D18, &stru_10071AA30);
  objc_msgSend((id)qword_1007C6D20, "activate");
  return (SDStatusMonitor *)(id)qword_1007C6D20;
}

- (BOOL)screenOn
{
  NSNumber *screenOn;
  id v4;
  void *v5;
  id v6;
  NSNumber *v7;
  NSNumber *v8;
  unsigned __int8 v9;

  pthread_mutex_lock(&stru_1007B3728);
  screenOn = self->_screenOn;
  if (!screenOn)
  {
    v4 = -[objc_class sharedBacklight](off_1007B3780(), "sharedBacklight");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = objc_msgSend(v5, "backlightState");

    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SDStatusMonitor isScreenOnForBacklightState:](self, "isScreenOnForBacklightState:", v6)));
    v8 = self->_screenOn;
    self->_screenOn = v7;

    screenOn = self->_screenOn;
  }
  v9 = -[NSNumber BOOLValue](screenOn, "BOOLValue");
  pthread_mutex_unlock(&stru_1007B3728);
  return v9;
}

- (unsigned)systemUIFlags
{
  pthread_mutex_lock(&stru_1007B3728);
  LODWORD(self) = self->_systemUIFlags;
  pthread_mutex_unlock(&stru_1007B3728);
  return self;
}

- (void)activate
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  if (!self->_activateStarted)
  {
    self->_activateStarted = 1;
    -[SDStatusMonitor installSleepStateMonitor](self, "installSleepStateMonitor");
    -[SDStatusMonitor installManagedConfigurationMonitor](self, "installManagedConfigurationMonitor");
    -[SDStatusMonitor installFinderSidebarPrefsMonitor](self, "installFinderSidebarPrefsMonitor");
    -[SDStatusMonitor installWirelessCarPlayMonitor](self, "installWirelessCarPlayMonitor");
    -[SDStatusMonitor installSMBPreferencesMonitor](self, "installSMBPreferencesMonitor");
    -[SDStatusMonitor installCarPlayStatusMonitor](self, "installCarPlayStatusMonitor");
    -[SDStatusMonitor installDynamicStoreCallBack](self, "installDynamicStoreCallBack");
    -[SDStatusMonitor installLocaleChangeMonitor](self, "installLocaleChangeMonitor");
    -[SDStatusMonitor installSpringBoardStateMonitor](self, "installSpringBoardStateMonitor");
    -[SDStatusMonitor installBacklightServicesMonitor](self, "installBacklightServicesMonitor");
    -[SDStatusMonitor installSystemUIMonitor](self, "installSystemUIMonitor");
    -[SDStatusMonitor installMirroringMonitor](self, "installMirroringMonitor");
    -[SDStatusMonitor installDisplaySleepMonitor](self, "installDisplaySleepMonitor");
    -[SDStatusMonitor installDisplayConfigurationMonitor](self, "installDisplayConfigurationMonitor");
    -[SDStatusMonitor installClamshellStateChangeMonitor](self, "installClamshellStateChangeMonitor");
    -[SDStatusMonitor installSmartCoverStatusMonitor](self, "installSmartCoverStatusMonitor");
    v3 = MKBDeviceUnlockedSinceBoot(-[SDStatusMonitor installBonjourNameMonitor](self, "installBonjourNameMonitor"));
    if ((_DWORD)v3 == 1)
    {
      self->_deviceWasUnlockedOnce = 1;
      v4 = daemon_log(v3);
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Device has already been unlocked", v6, 2u);
      }

      -[SDStatusMonitor installContactsMonitor](self, "installContactsMonitor");
    }
    -[SDStatusMonitor installKeyBagUnlockMonitor](self, "installKeyBagUnlockMonitor");
    -[SDStatusMonitor installUserPictureMonitor](self, "installUserPictureMonitor");
    -[SDStatusMonitor installUILockStatusMonitor](self, "installUILockStatusMonitor");
    -[SDStatusMonitor installSleepWakeCallBack](self, "installSleepWakeCallBack");
    -[SDStatusMonitor installBluetoothMonitor](self, "installBluetoothMonitor");
    -[SDStatusMonitor installD2DEncryptionMonitor](self, "installD2DEncryptionMonitor");
    -[SDStatusMonitor installWirelessMonitor](self, "installWirelessMonitor");
    -[SDStatusMonitor installAppleIDAccountInfoMonitor](self, "installAppleIDAccountInfoMonitor");
    -[SDStatusMonitor installAppleIDUsernameMonitor](self, "installAppleIDUsernameMonitor");
    -[SDStatusMonitor installVolumesMonitor](self, "installVolumesMonitor");
    -[SDStatusMonitor installBacklightMonitor](self, "installBacklightMonitor");
    -[SDStatusMonitor installSleepNotification](self, "installSleepNotification");
    -[SDStatusMonitor installWiFiPasswordSharingMonitor](self, "installWiFiPasswordSharingMonitor");
    -[SDStatusMonitor installWifiInterfaceMonitor](self, "installWifiInterfaceMonitor");
    -[SDStatusMonitor installSSIDCacheMonitor](self, "installSSIDCacheMonitor");
    -[SDStatusMonitor installWristStateMonitor](self, "installWristStateMonitor");
    -[SDStatusMonitor installMISMonitor](self, "installMISMonitor");
    -[SDStatusMonitor installCoreTelephonyMonitor](self, "installCoreTelephonyMonitor");
    -[SDStatusMonitor installAirplaneModeMonitor](self, "installAirplaneModeMonitor");
    -[SDStatusMonitor installUltraWideBandStateMonitor](self, "installUltraWideBandStateMonitor");
    -[SDStatusMonitor installAirPlayPreferencesMonitor](self, "installAirPlayPreferencesMonitor");
    -[SDStatusMonitor installLowPowerModeMonitor](self, "installLowPowerModeMonitor");
    -[SDStatusMonitor installSystemStateInterfaces](self, "installSystemStateInterfaces");
    self->_multipleUsersLoggedIn = -[SDStatusMonitor _multipleUsersLoggedIn](self, "_multipleUsersLoggedIn");
    -[SDStatusMonitor activateSystemMonitor](self, "activateSystemMonitor");
  }
}

- (SDStatusMonitor)init
{
  SDStatusMonitor *v2;
  SDStatusMonitor *v3;
  NSString *myAppleID;
  NSString *myAppleIDCommonName;
  NSString *workgroup;
  NSString *localHostName;
  NSString *consoleUser;
  NSString *computerName;
  NSString *bonjourName;
  NSString *netbiosName;
  NSMutableString *myEmailHashes;
  NSMutableString *myPhoneHashes;
  NSMutableDictionary *serverNames;
  NSMutableDictionary *identities;
  NSDictionary *mountPoints;
  NSNumber *deviceUIUnlocked;
  NSNumber *deviceKeyBagState;
  NSString *currentDiscoverableMode;
  NSNumber *deviceSupportsWAPI;
  NSString *deviceInformation;
  NSDictionary *awdlState;
  SDDeferrableOperation *preventLocaleRestart;
  NSNumber *screenOn;
  CUSystemMonitor *systemMonitor;
  NSNumber *backlightOn;
  NSNumber *handoffVisible;
  NSDictionary *odisksMountPoints;
  RadiosPreferences *radiosPreferences;
  uint64_t v30;
  NSDictionary *mkbOptions;
  objc_super v33;
  const __CFString *v34;
  void *v35;

  v33.receiver = self;
  v33.super_class = (Class)SDStatusMonitor;
  v2 = -[SDStatusMonitor init](&v33, "init");
  v3 = v2;
  if (v2)
  {
    myAppleID = v2->_myAppleID;
    v2->_myAppleID = 0;

    myAppleIDCommonName = v3->_myAppleIDCommonName;
    v3->_myAppleIDCommonName = 0;

    workgroup = v3->_workgroup;
    v3->_workgroup = 0;

    localHostName = v3->_localHostName;
    v3->_localHostName = 0;

    consoleUser = v3->_consoleUser;
    v3->_consoleUser = 0;

    computerName = v3->_computerName;
    v3->_computerName = 0;

    bonjourName = v3->_bonjourName;
    v3->_bonjourName = 0;

    netbiosName = v3->_netbiosName;
    v3->_netbiosName = 0;

    myEmailHashes = v3->_myEmailHashes;
    v3->_myEmailHashes = 0;

    myPhoneHashes = v3->_myPhoneHashes;
    v3->_myPhoneHashes = 0;

    serverNames = v3->_serverNames;
    v3->_serverNames = 0;

    identities = v3->_identities;
    v3->_identities = 0;

    mountPoints = v3->_mountPoints;
    v3->_mountPoints = 0;

    deviceUIUnlocked = v3->_deviceUIUnlocked;
    v3->_deviceUIUnlocked = 0;

    deviceKeyBagState = v3->_deviceKeyBagState;
    v3->_deviceKeyBagState = 0;

    currentDiscoverableMode = v3->_currentDiscoverableMode;
    v3->_currentDiscoverableMode = 0;

    deviceSupportsWAPI = v3->_deviceSupportsWAPI;
    v3->_deviceSupportsWAPI = 0;

    deviceInformation = v3->_deviceInformation;
    v3->_deviceInformation = 0;

    awdlState = v3->_awdlState;
    v3->_awdlState = 0;

    preventLocaleRestart = v3->_preventLocaleRestart;
    v3->_preventLocaleRestart = 0;

    screenOn = v3->_screenOn;
    v3->_screenOn = 0;

    systemMonitor = v3->__systemMonitor;
    v3->__systemMonitor = 0;

    backlightOn = v3->_backlightOn;
    v3->_backlightOn = 0;

    objc_storeWeak((id *)&v3->_finderServer, 0);
    handoffVisible = v3->_handoffVisible;
    v3->_handoffVisible = 0;

    odisksMountPoints = v3->_odisksMountPoints;
    v3->_odisksMountPoints = 0;

    v3->_dynamicStoreSource = 0;
    v3->_smbPreferences = 0;
    v3->_notifyPortRef = 0;
    v3->_nameMonitor = 0;
    v3->_rootPort = 0;
    v3->_myAppleIDCertificate = 0;
    v3->_myAppleIDSecIdentity = 0;
    v3->_myAppleIDIntermediateCertificate = 0;
    v3->_wifiDevice = 0;
    v3->_wifiManager = 0;
    v3->_awdlDevice = 0;
    *(_WORD *)&v3->_wifiDeviceAttachmentRegistered = 0;
    *(_QWORD *)&v3->_airDropCount = 0xFFFFFFFF00000000;
    v3->_airPlayPrefsToken = -1;
    v3->_notifierObject = 0;
    v3->_consoleUserID = -1;
    v3->_uiLockStatusToken = 0;
    v3->_keyBagUnlockToken = 0;
    v3->_backlightLevelToken = 0;
    v3->_airDropPublished = 0;
    v3->_deviceIsHighPriority = 0;
    v3->_deviceWasUnlockedOnce = 0;
    v3->_finderAirDropEnabled = 0;
    v3->_screenBlankedToken = -1;
    v3->_pairedWatchWristState = 0;
    radiosPreferences = v3->_radiosPreferences;
    v3->_radiosPreferences = 0;

    v34 = CFSTR("ExtendedDeviceLockState");
    v35 = &__kCFBooleanTrue;
    v30 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));
    mkbOptions = v3->_mkbOptions;
    v3->_mkbOptions = (NSDictionary *)v30;

    v3->_sleepModeOn = 0;
    v3->_mediaAccessControlSetting = 0;
  }
  return v3;
}

- (id)systemMonitor
{
  CUSystemMonitor *systemMonitor;
  CUSystemMonitor *v4;
  CUSystemMonitor *v5;

  systemMonitor = self->__systemMonitor;
  if (!systemMonitor)
  {
    v4 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    v5 = self->__systemMonitor;
    self->__systemMonitor = v4;

    -[CUSystemMonitor setDispatchQueue:](self->__systemMonitor, "setDispatchQueue:", &_dispatch_main_q);
    systemMonitor = self->__systemMonitor;
  }
  return systemMonitor;
}

- (void)activateSystemMonitor
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor systemMonitor](self, "systemMonitor"));
  objc_msgSend(v2, "activateWithCompletion:", 0);

}

- (void)clearMonitorCache
{
  uint64_t v3;
  NSObject *v4;
  NSString *bonjourName;
  NSString *computerName;
  NSString *consoleUser;
  NSString *localHostName;
  NSString *netbiosName;
  NSNumber *screenOn;
  NSNumber *backlightOn;
  NSString *workgroup;
  __SecCertificate *myAppleIDCertificate;
  __SecCertificate *myAppleIDIntermediateCertificate;
  __SecIdentity *myAppleIDSecIdentity;
  void *v16;
  uint8_t v17[16];

  v3 = daemon_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "clearMonitorCache", v17, 2u);
  }

  bonjourName = self->_bonjourName;
  self->_bonjourName = 0;

  computerName = self->_computerName;
  self->_computerName = 0;

  consoleUser = self->_consoleUser;
  self->_consoleUser = 0;

  localHostName = self->_localHostName;
  self->_localHostName = 0;

  netbiosName = self->_netbiosName;
  self->_netbiosName = 0;

  screenOn = self->_screenOn;
  self->_screenOn = 0;

  backlightOn = self->_backlightOn;
  self->_backlightOn = 0;

  workgroup = self->_workgroup;
  self->_workgroup = 0;

  myAppleIDCertificate = self->_myAppleIDCertificate;
  if (myAppleIDCertificate)
  {
    CFRelease(myAppleIDCertificate);
    self->_myAppleIDCertificate = 0;
  }
  myAppleIDIntermediateCertificate = self->_myAppleIDIntermediateCertificate;
  if (myAppleIDIntermediateCertificate)
  {
    CFRelease(myAppleIDIntermediateCertificate);
    self->_myAppleIDIntermediateCertificate = 0;
  }
  myAppleIDSecIdentity = self->_myAppleIDSecIdentity;
  if (myAppleIDSecIdentity)
  {
    CFRelease(myAppleIDSecIdentity);
    self->_myAppleIDSecIdentity = 0;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SDStatusMonitor clearMonitorCache]"));
  -[SDStatusMonitor resetMeCardWithReason:](self, "resetMeCardWithReason:", v16);

}

- (NSString)description
{
  id v3;
  id v4;
  const char *v5;
  id v6;
  const char *v7;
  id v8;
  const char *v9;
  id v10;
  const char *v11;
  id v12;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v19 = 0;
  NSAppendPrintF(&v19, "-- SDStatusMonitor --\n");
  v3 = v19;
  v18 = v3;
  NSAppendPrintF(&v18, "Current Discoverable Mode:    %@\n", self->_currentDiscoverableMode);
  v4 = v18;

  v17 = v4;
  if (-[SDStatusMonitor isAirDropAvailable](self, "isAirDropAvailable"))
    v5 = "yes";
  else
    v5 = "no";
  NSAppendPrintF(&v17, "AirDrop Available:            %s\n", v5);
  v6 = v17;

  v16 = v6;
  if (-[SDStatusMonitor isAirDropAllowed](self, "isAirDropAllowed"))
    v7 = "yes";
  else
    v7 = "no";
  NSAppendPrintF(&v16, "AirDrop Allowed:              %s\n", v7);
  v8 = v16;

  v15 = v8;
  if (-[SDStatusMonitor enableAirDropAdvertising](self, "enableAirDropAdvertising"))
    v9 = "yes";
  else
    v9 = "no";
  NSAppendPrintF(&v15, "AirDrop Advertising:          %s\n", v9);
  v10 = v15;

  v14 = v10;
  if (-[SDStatusMonitor enableAirDropReceiving](self, "enableAirDropReceiving"))
    v11 = "yes";
  else
    v11 = "no";
  NSAppendPrintF(&v14, "AirDrop Receiving:            %s\n", v11);
  v12 = v14;

  return (NSString *)v12;
}

- (void)addServerName:(id)a3 forHostName:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *serverNames;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  pthread_mutex_lock(&stru_1007B3728);
  if (!self->_serverNames)
  {
    v7 = objc_opt_new(NSMutableDictionary);
    serverNames = self->_serverNames;
    self->_serverNames = v7;

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor createHostNameKey:](self, "createHostNameKey:", v6));
  if (v9)
    -[NSMutableDictionary setValue:forKey:](self->_serverNames, "setValue:forKey:", v10, v9);
  pthread_mutex_unlock(&stru_1007B3728);

}

- (void)airDropTransactionBegin:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  pthread_mutex_lock(&stru_1007B3728);
  -[SDStatusMonitor logAirDropTransactionForClientServer:beginEnd:count:](self, "logAirDropTransactionForClientServer:beginEnd:count:", v3, 1, self->_airDropCount);
  pthread_mutex_unlock(&stru_1007B3728);
}

- (void)airDropTransactionEnd:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  pthread_mutex_lock(&stru_1007B3728);
  --self->_airDropCount;
  -[SDStatusMonitor logAirDropTransactionForClientServer:beginEnd:count:](self, "logAirDropTransactionForClientServer:beginEnd:count:", v3, 0);
  pthread_mutex_unlock(&stru_1007B3728);
}

- (id)createHostNameKey:(id)a3
{
  id v3;
  char *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = (char *)objc_msgSend(v3, "length");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));

  v6 = objc_msgSend(v5, "mutableCopy");
  if (objc_msgSend(v6, "hasSuffix:", CFSTR(".")))
    objc_msgSend(v6, "deleteCharactersInRange:", v4 - 1, 1);
  return v6;
}

- (id)defaultDiscoverableMode
{
  return kSFOperationDiscoverableModeContactsOnly;
}

- (int64_t)discoverableLevel
{
  void *v2;
  int64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor discoverableMode](self, "discoverableMode"));
  if (CFEqual(v2, kSFOperationDiscoverableModeEveryone))
    v3 = 2;
  else
    v3 = CFEqual(v2, kSFOperationDiscoverableModeContactsOnly) != 0;

  return v3;
}

- (NSString)discoverableMode
{
  NSString *currentDiscoverableMode;

  currentDiscoverableMode = self->_currentDiscoverableMode;
  if (!currentDiscoverableMode)
  {
    -[SDStatusMonitor updateDiscoverableMode](self, "updateDiscoverableMode");
    currentDiscoverableMode = self->_currentDiscoverableMode;
  }
  return currentDiscoverableMode;
}

- (BOOL)isAirDropReady
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  int IsVirtualMachine;
  unsigned __int8 v9;
  _BOOL8 v10;
  BOOL v11;
  _BOOL4 v12;
  uint64_t v13;
  NSObject *v14;
  _DWORD v16[2];
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  unsigned int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  _BOOL4 v28;

  v3 = -[SDStatusMonitor wirelessEnabled](self, "wirelessEnabled");
  v4 = -[SDStatusMonitor wirelessCarPlay](self, "wirelessCarPlay");
  v5 = -[SDStatusMonitor wirelessAccessPoint](self, "wirelessAccessPoint");
  v6 = -[SDStatusMonitor bluetoothEnabledIncludingRestricted](self, "bluetoothEnabledIncludingRestricted");
  v7 = -[SDStatusMonitor enableAirDropReceiving](self, "enableAirDropReceiving");
  IsVirtualMachine = SFDeviceIsVirtualMachine();
  v9 = -[SDStatusMonitor isClarityBoardEnabled](self, "isClarityBoardEnabled");
  v10 = -[SDStatusMonitor isMulticastAdvertisementsDisabled](self, "isMulticastAdvertisementsDisabled");
  v11 = v7 & v6 & v3 ^ 1 | v4 | v5 | v9 | v10;
  if (v11)
  {
    v12 = v10;
    v13 = airdrop_log(v10);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16[0] = 67110656;
      v16[1] = v3;
      v17 = 1024;
      v18 = v6;
      v19 = 1024;
      v20 = v5;
      v21 = 1024;
      v22 = v4;
      v23 = 1024;
      v24 = v7;
      v25 = 1024;
      v26 = IsVirtualMachine;
      v27 = 1024;
      v28 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "AirDrop not ready: wifi=%d, bluetooth=%d, hotspot=%d, carplay=%d, receivingEnabled=%d, isVirtualMachine=%d isMulticastAdvertisementsDisabled=%d", (uint8_t *)v16, 0x2Cu);
    }

  }
  return !v11;
}

- (BOOL)isClarityBoardEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CLFSystemShellSwitcher sharedSystemShellSwitcher](CLFSystemShellSwitcher, "sharedSystemShellSwitcher"));
  v3 = objc_msgSend(v2, "isClarityBoardEnabled");

  return v3;
}

- (id)mountPointsForServer:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  pthread_mutex_lock(&stru_1007B3728);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_mountPoints, "objectForKeyedSubscript:", v4));

  v6 = objc_msgSend(v5, "copy");
  pthread_mutex_unlock(&stru_1007B3728);

  return v6;
}

- (id)newDiscoverableMode
{
  void *v3;
  unint64_t v4;
  _BOOL8 v5;
  _BOOL4 v6;
  id *v8;
  uint64_t v9;
  NSObject *v10;
  const __CFString *v11;
  id v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  _BOOL4 v16;

  if (!-[SDStatusMonitor isAirDropAllowed](self, "isAirDropAllowed"))
  {
    v8 = (id *)&kSFOperationDiscoverableModeDisabled;
    return *v8;
  }
  if (!-[SDStatusMonitor isAirDropReady](self, "isAirDropReady"))
  {
    v8 = (id *)&kSFOperationDiscoverableModeOff;
    return *v8;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor reconciledDiscoverableMode](self, "reconciledDiscoverableMode"));
  if (!objc_msgSend(v3, "isEqual:", kSFOperationDiscoverableModeContactsOnly))
    return v3;
  v4 = -[SDStatusMonitor appleIDAccountState](self, "appleIDAccountState");
  v5 = -[SDStatusMonitor eduModeEnabled](self, "eduModeEnabled");
  v6 = v5;
  if (v4 == 1 && !v5)
    return v3;
  v9 = airdrop_log(v5);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (v4 > 0xE)
      v11 = CFSTR("?");
    else
      v11 = (const __CFString *)*((_QWORD *)&off_10071AD38 + v4);
    v13 = 138412546;
    v14 = v11;
    v15 = 1024;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Discoverable mode off: appleIDAccountState=%@ eduModeEnabled=%d", (uint8_t *)&v13, 0x12u);
  }

  v12 = kSFOperationDiscoverableModeOff;
  return v12;
}

- (id)odiskMountPointsForServer:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  pthread_mutex_lock(&stru_1007B3728);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_odisksMountPoints, "objectForKeyedSubscript:", v4));

  v6 = objc_msgSend(v5, "copy");
  pthread_mutex_unlock(&stru_1007B3728);

  return v6;
}

- (id)reconciledDiscoverableMode
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  void *v11;
  __int16 v12;
  const __CFString *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", kSFOperationDiscoverableModeKey));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = CFSTR("User Defaults");
  }
  else
  {
    v4 = objc_claimAutoreleasedReturnValue(-[SDStatusMonitor defaultDiscoverableMode](self, "defaultDiscoverableMode"));
    v5 = (void *)v4;
    v6 = CFSTR("Default");
  }
  v7 = airdrop_log(v4);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = 138412546;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Reconciled discoverable mode: %@ (%@)", (uint8_t *)&v10, 0x16u);
  }

  return v5;
}

- (void)removeServerName:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  pthread_mutex_lock(&stru_1007B3728);
  if (self->_serverNames)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor createHostNameKey:](self, "createHostNameKey:", v5));
    if (v4)
      -[NSMutableDictionary removeObjectForKey:](self->_serverNames, "removeObjectForKey:", v4);

  }
  pthread_mutex_unlock(&stru_1007B3728);

}

- (id)serverNameForHost:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  pthread_mutex_lock(&stru_1007B3728);
  if (self->_serverNames)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor createHostNameKey:](self, "createHostNameKey:", v4));
    if (v5)
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_serverNames, "objectForKeyedSubscript:", v5));
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }
  pthread_mutex_unlock(&stru_1007B3728);

  return v6;
}

- (void)setODiskMountPoints:(id)a3
{
  id v5;

  v5 = a3;
  pthread_mutex_lock(&stru_1007B3728);
  if (sub_1000CE998(self->_odisksMountPoints, v5))
  {
    objc_storeStrong((id *)&self->_odisksMountPoints, a3);
    pthread_mutex_unlock(&stru_1007B3728);
    -[SDStatusMonitor postNotification:](self, "postNotification:", CFSTR("com.apple.sharingd.ODiskMountPointsChanged"));
  }
  else
  {
    pthread_mutex_unlock(&stru_1007B3728);
  }

}

- (void)setDiscoverableMode:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  pthread_mutex_lock(&stru_1007B3728);
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v5, "setObject:forKey:", v4, kSFOperationDiscoverableModeKey);

  objc_msgSend(v5, "synchronize");
  pthread_mutex_unlock(&stru_1007B3728);
  -[SDStatusMonitor updateDiscoverableMode](self, "updateDiscoverableMode");

}

- (void)setServerMountPoints:(id)a3
{
  id v5;

  v5 = a3;
  pthread_mutex_lock(&stru_1007B3728);
  if (sub_1000CE998(self->_mountPoints, v5))
  {
    objc_storeStrong((id *)&self->_mountPoints, a3);
    pthread_mutex_unlock(&stru_1007B3728);
    -[SDStatusMonitor postNotification:](self, "postNotification:", CFSTR("com.apple.sharingd.MountPointsChanged"));
  }
  else
  {
    pthread_mutex_unlock(&stru_1007B3728);
  }

}

- (void)updateDiscoverableMode
{
  id v3;
  NSString *v4;
  unsigned __int8 v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  NSString *v11;
  __int16 v12;
  id v13;

  -[SDStatusMonitor _checkEveryoneModeExpiry](self, "_checkEveryoneModeExpiry");
  v3 = -[SDStatusMonitor newDiscoverableMode](self, "newDiscoverableMode");
  pthread_mutex_lock(&stru_1007B3728);
  v4 = self->_currentDiscoverableMode;
  v5 = objc_msgSend(v3, "isEqual:", v4);
  objc_storeStrong((id *)&self->_currentDiscoverableMode, v3);
  pthread_mutex_unlock(&stru_1007B3728);
  if ((v5 & 1) == 0 && v4)
    -[SDStatusMonitor _updateEveryoneModeExpiryDateOnChange:](self, "_updateEveryoneModeExpiryDateOnChange:", v3);
  if ((v5 & 1) == 0)
  {
    v6 = -[SDStatusMonitor postNotification:](self, "postNotification:", CFSTR("com.apple.sharingd.DiscoverableModeChanged"));
    if (self->_airDropModeNotifyToken != -1)
    {
      if ((objc_msgSend(v3, "isEqual:", kSFOperationDiscoverableModeOff) & 1) != 0)
      {
        v7 = 1;
      }
      else if ((objc_msgSend(v3, "isEqual:", kSFOperationDiscoverableModeContactsOnly) & 1) != 0)
      {
        v7 = 2;
      }
      else if ((objc_msgSend(v3, "isEqual:", kSFOperationDiscoverableModeEveryone) & 1) != 0)
      {
        v7 = 3;
      }
      else
      {
        v7 = objc_msgSend(v3, "isEqual:", kSFOperationDiscoverableModeDisabled);
      }
      notify_set_state(self->_airDropModeNotifyToken, v7);
      v6 = (id)notify_post("com.apple.sharing.airdrop-mode-changed");
    }
    v8 = airdrop_log(v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412546;
      v11 = v4;
      v12 = 2112;
      v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Discoverable mode changed from %@ to %@, posting notification", (uint8_t *)&v10, 0x16u);
    }

  }
}

- (int64_t)appleIDAccountState
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  NSObject *v11;
  const __CFString *v12;
  int v14;
  const __CFString *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myAppleID](self, "myAppleID"));

  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAppleIDAgent sharedAgent](SDAppleIDAgent, "sharedAgent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myAppleID](self, "myAppleID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountStatusForAppleID:", v6));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AccountState")));
    v9 = CFGetInt64(v8, 0);

  }
  else
  {
    v9 = 13;
  }
  v10 = airdrop_log(v4);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v9 > 0xE)
      v12 = CFSTR("?");
    else
      v12 = (const __CFString *)*((_QWORD *)&off_10071AD38 + v9);
    v14 = 138412290;
    v15 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Apple ID account state: %@", (uint8_t *)&v14, 0xCu);
  }

  return v9;
}

- (BOOL)verifyAndParseValidationRecordData:(id)a3 intoDictionary:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  int v14;
  uint64_t v15;

  v5 = a3;
  v6 = mach_absolute_time();
  v7 = SFAppleIDParseValidationRecordDataSync(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    v10 = airdrop_log(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = mach_absolute_time();
      v14 = 134217984;
      v15 = UpTicksToMilliseconds(v12 - v6);
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Verified validation record data (%ld ms)\n", (uint8_t *)&v14, 0xCu);
    }

    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }

  return v8 != 0;
}

- (void)cacheCertificate:(__SecCertificate *)a3 forRealName:(id)a4
{
  NSMutableDictionary *v6;
  NSMutableDictionary *certificates;
  void *v8;
  id v9;

  v9 = a4;
  pthread_mutex_lock(&stru_1007B3728);
  if (!self->_certificates)
  {
    v6 = objc_opt_new(NSMutableDictionary);
    certificates = self->_certificates;
    self->_certificates = v6;

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lowercaseString"));
  if (v8)
    -[NSMutableDictionary setValue:forKey:](self->_certificates, "setValue:forKey:", a3, v8);
  pthread_mutex_unlock(&stru_1007B3728);

}

- (void)cacheIdentity:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *identities;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  pthread_mutex_lock(&stru_1007B3728);
  if (!self->_identities)
  {
    v4 = objc_opt_new(NSMutableDictionary);
    identities = self->_identities;
    self->_identities = v4;

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "emailOrPhone"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lowercaseString"));

  if (v7)
    -[NSMutableDictionary setValue:forKey:](self->_identities, "setValue:forKey:", v8, v7);
  pthread_mutex_unlock(&stru_1007B3728);

}

- (void)clearMyAppleIDInfo
{
  uint64_t v3;
  NSObject *v4;
  NSString *myAppleID;
  NSString *myAppleIDCommonName;
  NSMutableString *myEmailHashes;
  NSMutableString *myPhoneHashes;
  __SecCertificate *myAppleIDCertificate;
  __SecCertificate *myAppleIDIntermediateCertificate;
  __SecIdentity *myAppleIDSecIdentity;
  void *v12;
  uint8_t v13[16];

  v3 = daemon_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Clear my Apple ID called", v13, 2u);
  }

  pthread_mutex_lock(&stru_1007B3728);
  myAppleID = self->_myAppleID;
  self->_myAppleID = 0;

  myAppleIDCommonName = self->_myAppleIDCommonName;
  self->_myAppleIDCommonName = 0;

  myEmailHashes = self->_myEmailHashes;
  self->_myEmailHashes = 0;

  myPhoneHashes = self->_myPhoneHashes;
  self->_myPhoneHashes = 0;

  myAppleIDCertificate = self->_myAppleIDCertificate;
  if (myAppleIDCertificate)
  {
    CFRelease(myAppleIDCertificate);
    self->_myAppleIDCertificate = 0;
  }
  myAppleIDIntermediateCertificate = self->_myAppleIDIntermediateCertificate;
  if (myAppleIDIntermediateCertificate)
  {
    CFRelease(myAppleIDIntermediateCertificate);
    self->_myAppleIDIntermediateCertificate = 0;
  }
  myAppleIDSecIdentity = self->_myAppleIDSecIdentity;
  if (myAppleIDSecIdentity)
  {
    CFRelease(myAppleIDSecIdentity);
    self->_myAppleIDSecIdentity = 0;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SDStatusMonitor clearMyAppleIDInfo]"));
  -[SDStatusMonitor resetMeCardWithReason:](self, "resetMeCardWithReason:", v12);

  pthread_mutex_unlock(&stru_1007B3728);
}

- (id)commonNameForCertificate:(__SecCertificate *)a3
{
  const __CFArray *v3;
  const __CFArray *v4;
  const void *ValueAtIndex;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;

  v3 = (const __CFArray *)SecCertificateCopyCommonNames(a3, a2);
  if (v3)
  {
    v4 = v3;
    if (CFArrayGetCount(v3))
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v4, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(ValueAtIndex);
    }
    else
    {
      v9 = daemon_log(0);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_1001D8D84();

      v6 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    v7 = daemon_log(0);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1001D8D58();

    v6 = 0;
  }
  return v6;
}

- (__SecCertificate)copyCertificateForRealName:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  pthread_mutex_lock(&stru_1007B3728);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lowercaseString"));

  v6 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_certificates, "objectForKeyedSubscript:", v5));
  pthread_mutex_unlock(&stru_1007B3728);

  return (__SecCertificate *)v6;
}

- (__SecCertificate)copyMyAppleIDCertificate
{
  __SecCertificate *v3;

  pthread_mutex_lock(&stru_1007B3728);
  v3 = -[SDStatusMonitor _copyMyAppleIDCertificate](self, "_copyMyAppleIDCertificate");
  pthread_mutex_unlock(&stru_1007B3728);
  return v3;
}

- (__SecCertificate)_copyMyAppleIDCertificate
{
  void *v3;
  void *v4;
  void *v5;
  __SecCertificate *result;

  if (!self->_myAppleIDCertificate)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAppleIDAgent sharedAgent](SDAppleIDAgent, "sharedAgent"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "myAccount"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identity"));
      self->_myAppleIDCertificate = (__SecCertificate *)objc_msgSend(v5, "copyCertificate");

    }
  }
  result = self->_myAppleIDIntermediateCertificate;
  if (result)
  {
    CFRetain(result);
    return self->_myAppleIDIntermediateCertificate;
  }
  return result;
}

- (__SecCertificate)copyMyAppleIDIntermediateCertificate
{
  return -[SDStatusMonitor _copyMyAppleIDIntermediateCertificate](self, "_copyMyAppleIDIntermediateCertificate");
}

- (__SecCertificate)_copyMyAppleIDIntermediateCertificate
{
  __SecCertificate *myAppleIDIntermediateCertificate;
  void *v4;
  void *v5;
  void *v6;
  __SecCertificate *v7;
  __SecCertificate *v8;
  __SecCertificate *v9;

  pthread_mutex_lock(&stru_1007B3728);
  myAppleIDIntermediateCertificate = self->_myAppleIDIntermediateCertificate;
  pthread_mutex_unlock(&stru_1007B3728);
  if (!myAppleIDIntermediateCertificate)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDAppleIDAgent sharedAgent](SDAppleIDAgent, "sharedAgent"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "myAccount"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identity"));
      v7 = (__SecCertificate *)objc_msgSend(v6, "copyIntermediateCertificate");

      pthread_mutex_lock(&stru_1007B3728);
      self->_myAppleIDIntermediateCertificate = v7;
      pthread_mutex_unlock(&stru_1007B3728);
    }

  }
  pthread_mutex_lock(&stru_1007B3728);
  v8 = self->_myAppleIDIntermediateCertificate;
  if (v8)
  {
    CFRetain(v8);
    v9 = self->_myAppleIDIntermediateCertificate;
  }
  else
  {
    v9 = 0;
  }
  pthread_mutex_unlock(&stru_1007B3728);
  return v9;
}

- (__SecIdentity)copyMyAppleIDSecIdentity
{
  __SecIdentity *v3;

  pthread_mutex_lock(&stru_1007B3728);
  v3 = -[SDStatusMonitor _copyMyAppleIDSecIdentity](self, "_copyMyAppleIDSecIdentity");
  pthread_mutex_unlock(&stru_1007B3728);
  return v3;
}

- (__SecIdentity)_copyMyAppleIDSecIdentity
{
  __SecIdentity *result;
  void *v4;
  void *v5;

  result = self->_myAppleIDSecIdentity;
  if (result)
    goto LABEL_5;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor _myAppleID](self, "_myAppleID"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAppleIDAgent sharedAgent](SDAppleIDAgent, "sharedAgent"));
    self->_myAppleIDSecIdentity = (__SecIdentity *)objc_msgSend(v5, "copyIdentityForAppleID:", v4);

  }
  result = self->_myAppleIDSecIdentity;
  if (result)
  {
LABEL_5:
    CFRetain(result);
    return self->_myAppleIDSecIdentity;
  }
  return result;
}

- (id)emailAddressesForAppleID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDAppleIDAgent sharedAgent](SDAppleIDAgent, "sharedAgent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountForAppleID:", v3));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contactInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "validatedEmailAddresses"));

  return v7;
}

- (void)fixAltDSIDIfNeeded
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint8_t v8[8];
  _QWORD v9[4];
  NSObject *v10;
  id v11;
  SDStatusMonitor *v12;

  if (-[SDStatusMonitor altDSIDNeedsFixing](self, "altDSIDNeedsFixing"))
  {
    v3 = objc_alloc_init((Class)ACAccountStore);
    v4 = sub_10019B264(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    if (v5)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1001CBB80;
      v9[3] = &unk_10071AA58;
      v10 = v3;
      v11 = v5;
      v12 = self;
      -[NSObject aa_updatePropertiesForAppleAccount:completion:](v10, "aa_updatePropertiesForAppleAccount:completion:", v11, v9);

      v6 = v10;
    }
    else
    {
      v7 = tethering_log(0);
      v6 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No primary account, not fixing appleID", v8, 2u);
      }
    }

  }
}

- (void)handleAppleAccountSignIn
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = daemon_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Apple Account signed in", v5, 2u);
  }

  -[SDStatusMonitor clearMyAppleIDInfo](self, "clearMyAppleIDInfo");
  -[SDStatusMonitor postNotification:](self, "postNotification:", CFSTR("com.apple.sharingd.AppleAccountSignIn"));
}

- (void)handleAppleAccountSignOut
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = daemon_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Apple Account signed out", v5, 2u);
  }

  -[SDStatusMonitor clearMyAppleIDInfo](self, "clearMyAppleIDInfo");
  -[SDStatusMonitor postNotification:](self, "postNotification:", CFSTR("com.apple.sharingd.AppleAccountSignOut"));
}

- (id)phoneNumbersForAppleID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDAppleIDAgent sharedAgent](SDAppleIDAgent, "sharedAgent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountForAppleID:", v3));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contactInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "validatedPhoneNumbers"));

  return v7;
}

- (id)unifiedAppleIDInfo
{
  __SecIdentity *v3;
  __SecIdentity *v4;
  NSObject *v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  NSMutableArray *v25;
  unint64_t v26;
  unint64_t i;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v34;
  void *v35;
  uint8_t buf[16];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];

  v3 = -[SDStatusMonitor copyMyAppleIDSecIdentity](self, "copyMyAppleIDSecIdentity");
  if (v3)
  {
    v4 = v3;
    v5 = objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myAppleIDEmailAddresses](self, "myAppleIDEmailAddresses"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myAppleIDPhoneNumbers](self, "myAppleIDPhoneNumbers"));
    if (-[NSObject count](v5, "count") || objc_msgSend(v35, "count"))
    {
      v6 = objc_opt_new(NSMutableArray);
      v7 = objc_opt_new(NSMutableArray);
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v8 = v5;
      v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v42;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v42 != v11)
              objc_enumerationMutation(v8);
            v13 = sub_10019CAC4(*(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v12), 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
            if ((-[NSMutableArray containsObject:](v6, "containsObject:", v14) & 1) == 0)
              -[NSMutableArray addObject:](v6, "addObject:", v14);

            v12 = (char *)v12 + 1;
          }
          while (v10 != v12);
          v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
        }
        while (v10);
      }

      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v15 = v35;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v38;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v38 != v18)
              objc_enumerationMutation(v15);
            v20 = sub_10019CBA4(*(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v19));
            v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
            if (v21 && (-[NSMutableArray containsObject:](v7, "containsObject:", v21) & 1) == 0)
              -[NSMutableArray addObject:](v7, "addObject:", v21);

            v19 = (char *)v19 + 1;
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        }
        while (v17);
      }

      v22 = (unint64_t)-[NSMutableArray count](v6, "count");
      v23 = (unint64_t)-[NSMutableArray count](v7, "count");
      if (v22 | v23)
      {
        v24 = v23;
        v25 = objc_opt_new(NSMutableArray);
        if (v22 <= v24)
          v26 = v24;
        else
          v26 = v22;
        if (v26)
        {
          for (i = 0; i != v26; ++i)
          {
            if (i < v22)
            {
              v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", i));
              -[NSMutableArray addObject:](v25, "addObject:", v28);

            }
            if (i < v24)
            {
              v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", i));
              -[NSMutableArray addObject:](v25, "addObject:", v29);

            }
          }
        }
      }
      else
      {
        v31 = daemon_log(v23);
        v32 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "No normalized emails or phone numbers", buf, 2u);
        }

        v25 = 0;
      }

    }
    else
    {
      v34 = daemon_log(0);
      v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(&v6->super.super, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, &v6->super.super, OS_LOG_TYPE_DEFAULT, "No emails or phone numbers", buf, 2u);
      }
      v25 = 0;
    }

    CFRelease(v4);
  }
  else
  {
    v30 = daemon_log(0);
    v5 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No Apple ID certificate", buf, 2u);
    }
    v25 = 0;
  }

  return v25;
}

- (id)verifiedIdentityForAppleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  pthread_mutex_lock(&stru_1007B3728);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lowercaseString"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_identities, "objectForKeyedSubscript:", v5));
  pthread_mutex_unlock(&stru_1007B3728);

  return v6;
}

- (id)awdlDevice
{
  __WiFiDeviceClient *awdlDevice;

  awdlDevice = self->_awdlDevice;
  if (!awdlDevice)
  {
    -[SDStatusMonitor updateWirelessDevice](self, "updateWirelessDevice");
    awdlDevice = self->_awdlDevice;
  }
  return awdlDevice;
}

- (id)awdlInfoForPeerWithServiceName:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  CFDictionaryRef (__cdecl **v9)(CFErrorRef);
  void *i;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];

  v4 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor awdlPeerList](self, "awdlPeerList"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    v9 = &CFErrorCopyUserInfo_ptr;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v12 = objc_opt_class(v9[496]);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
        {
          v13 = v11;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("STATION_AWDL_SERVICES")));
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v15 = v14;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v22;
            while (2)
            {
              for (j = 0; j != v17; j = (char *)j + 1)
              {
                if (*(_QWORD *)v22 != v18)
                  objc_enumerationMutation(v15);
                if (objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)j), "containsString:", v4))
                {

                  goto LABEL_21;
                }
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
              if (v17)
                continue;
              break;
            }
          }

          v9 = &CFErrorCopyUserInfo_ptr;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      v13 = 0;
    }
    while (v7);
  }
  else
  {
    v13 = 0;
  }
LABEL_21:

  return v13;
}

- (id)awdlNetwork
{
  __WiFiDeviceClient *wifiDevice;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *i;
  void *v10;
  uint64_t Property;
  void *v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v19;
  _BYTE v20[128];

  v19 = 0;
  wifiDevice = self->_wifiDevice;
  if (!wifiDevice || WiFiDeviceClientCopyHostedNetworks(wifiDevice, &v19))
    return 0;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v19;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    v8 = kWiFiNetworkRoleKey;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        Property = WiFiNetworkGetProperty(v10, v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue(Property);
        v13 = v12;
        if (v12 && objc_msgSend(v12, "intValue", (_QWORD)v15) == 4)
        {
          v14 = v10;

          goto LABEL_15;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_15:

  return v14;
}

- (id)addAdditionalInformationToMeCard:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  void *j;
  id v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  NSObject *v48;
  id v49;
  uint64_t v50;
  NSObject *v51;
  id v52;
  void *v54;
  void *v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  _BYTE v73[128];
  _BYTE v74[128];

  v4 = objc_msgSend(a3, "mutableCopy");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor _myAppleID](self, "_myAppleID"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDAppleIDAgent sharedAgent](SDAppleIDAgent, "sharedAgent"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accountForAppleID:", v5));

    if (v7)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "givenName"));
      v10 = objc_msgSend(v9, "length");

      if (!v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contactInfo"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstName"));
        objc_msgSend(v4, "setGivenName:", v12);

      }
      v54 = v5;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "familyName"));
      v14 = objc_msgSend(v13, "length");

      if (!v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contactInfo"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastName"));
        objc_msgSend(v4, "setFamilyName:", v16);

      }
      v56 = v4;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "phoneNumbers"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v17));

      v55 = v7;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contactInfo"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "validatedPhoneNumbers"));

      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v21 = v20;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v62;
        do
        {
          for (i = 0; i != v23; i = (char *)i + 1)
          {
            if (*(_QWORD *)v62 != v24)
              objc_enumerationMutation(v21);
            v26 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i);
            v27 = objc_alloc((Class)CNLabeledValue);
            v28 = (void *)objc_claimAutoreleasedReturnValue(+[CNPhoneNumber phoneNumberWithStringValue:](CNPhoneNumber, "phoneNumberWithStringValue:", v26));
            v29 = objc_msgSend(v27, "initWithLabel:value:", &stru_10072FE60, v28);

            objc_msgSend(v18, "addObject:", v29);
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
        }
        while (v23);
      }

      objc_msgSend(v56, "setPhoneNumbers:", v18);
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "emailAddresses"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v30));

      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contactInfo"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "validatedEmailAddresses"));

      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v34 = v33;
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v58;
        do
        {
          for (j = 0; j != v36; j = (char *)j + 1)
          {
            if (*(_QWORD *)v58 != v37)
              objc_enumerationMutation(v34);
            v39 = objc_msgSend(objc_alloc((Class)CNLabeledValue), "initWithLabel:value:", &stru_10072FE60, *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)j));
            objc_msgSend(v31, "addObject:", v39);

          }
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
        }
        while (v36);
      }

      v4 = v56;
      v40 = daemon_log(objc_msgSend(v56, "setEmailAddresses:", v31));
      v41 = objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "givenName"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "familyName"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "componentsJoinedByString:", CFSTR(",")));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "componentsJoinedByString:", CFSTR(",")));
        *(_DWORD *)buf = 138413059;
        v66 = v42;
        v67 = 2112;
        v68 = v43;
        v69 = 2113;
        v70 = v44;
        v71 = 2113;
        v72 = v45;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Enhanced meCard: fn=%@,ln=%@,pnums=[%{private}@],emails=[%{private}@]", buf, 0x2Au);

        v4 = v56;
      }

      v46 = v4;
      v5 = v54;
      v7 = v55;
    }
    else
    {
      v50 = daemon_log(v8);
      v51 = objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        sub_1001D8EB8((uint64_t)v5, v51);

      v52 = v4;
    }

  }
  else
  {
    v47 = daemon_log(0);
    v48 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      sub_1001D8E8C();

    v49 = v4;
  }

  return v4;
}

- (void)clearMyIconAndHash
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = daemon_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Clear my icon and hash requested", v6, 2u);
  }

  pthread_mutex_lock(&stru_1007B3728);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SDStatusMonitor clearMyIconAndHash]"));
  -[SDStatusMonitor resetMeCardWithReason:](self, "resetMeCardWithReason:", v5);

  pthread_mutex_unlock(&stru_1007B3728);
}

- (id)contactsForEmailHash:(id)a3 phoneHash:(id)a4
{
  id v6;
  id v7;
  NSMutableSet *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_new(NSMutableSet);
  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropContactHashManager contactsForCombinedHash:](self->_contactHashManager, "contactsForCombinedHash:", v6));
    -[NSMutableSet unionSet:](v8, "unionSet:", v9);

  }
  if (v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropContactHashManager contactsForCombinedHash:](self->_contactHashManager, "contactsForCombinedHash:", v7));
    -[NSMutableSet unionSet:](v8, "unionSet:", v10);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", v8));

  return v11;
}

- (id)contactIdentifierForMediumHashes:(id)a3
{
  return -[SDAirDropContactHashManager contactIdentifierForMediumHashes:](self->_contactHashManager, "contactIdentifierForMediumHashes:", a3);
}

- (BOOL)contactIdentifierIsBlocked:(id)a3
{
  id v4;
  void *v5;
  CNContactStore *contactStore;
  void *v7;
  BOOL v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[0] = CNContactPhoneNumbersKey;
  v11[1] = CNContactEmailAddressesKey;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
  contactStore = self->_contactStore;
  v10 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactStore unifiedContactWithIdentifier:keysToFetch:error:](contactStore, "unifiedContactWithIdentifier:keysToFetch:error:", v4, v5, &v10));

  if (v7)
    v8 = -[SDStatusMonitor contactIsBlocked:](self, "contactIsBlocked:", v7);
  else
    v8 = 0;

  return v8;
}

- (BOOL)contactIsBlocked:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *j;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  Class v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];

  v3 = a3;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "emailAddresses"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v42;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        v10 = -[objc_class sharedPrivacyManager](off_1007B3768(), "sharedPrivacyManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "value"));
        v13 = objc_msgSend(v11, "isIncomingCommunicationBlockedForEmailAddress:", v12);

        if (v13)
        {
          v29 = airdrop_log(v14);
          v15 = objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "value"));
            *(_DWORD *)buf = 141558275;
            v47 = 1752392040;
            v48 = 2113;
            v49 = v30;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Incoming communications blocked for email address %{private, mask.hash}@", buf, 0x16u);

          }
LABEL_23:

          LOBYTE(v15) = 1;
          goto LABEL_24;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
      if (v6)
        continue;
      break;
    }
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "phoneNumbers"));
  v15 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v15)
  {
    v35 = v3;
    v36 = *(_QWORD *)v38;
    while (2)
    {
      for (j = 0; j != v15; j = ((char *)j + 1))
      {
        if (*(_QWORD *)v38 != v36)
          objc_enumerationMutation(v4);
        v17 = v4;
        v18 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)j);
        v19 = -[objc_class sharedPrivacyManager](off_1007B3768(), "sharedPrivacyManager");
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        v21 = off_1007B3770();
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "value"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringValue"));
        v24 = off_1007B3990();
        v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class phoneNumberWithDigits:countryCode:](v21, "phoneNumberWithDigits:countryCode:", v23, v25));
        v27 = objc_msgSend(v20, "isIncomingCommunicationBlockedForPhoneNumber:", v26);

        if (v27)
        {
          v31 = airdrop_log(v28);
          v15 = objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "value"));
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "stringValue"));
            *(_DWORD *)buf = 141558275;
            v47 = 1752392040;
            v48 = 2113;
            v49 = v33;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Incoming communications blocked for phone number %{private, mask.hash}@", buf, 0x16u);

          }
          v3 = v35;
          v4 = v17;
          goto LABEL_23;
        }
        v4 = v17;
      }
      v15 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      if (v15)
        continue;
      break;
    }
    v3 = v35;
  }
LABEL_24:

  return (char)v15;
}

- (BOOL)contactsContainsShortHashes:(id)a3
{
  return -[SDAirDropContactHashManager contactsContainsShortHashes:](self->_contactHashManager, "contactsContainsShortHashes:", a3);
}

- (id)contactWithPreferredIdentifierForContacts:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "anyObject"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    obj = v6;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor meCard](self, "meCard"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
        v15 = objc_msgSend(v13, "isEqualToString:", v14);

        if ((v15 & 1) != 0)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor meCard](self, "meCard"));
          v6 = obj;

          goto LABEL_13;
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
        v18 = objc_msgSend(v16, "compare:", v17);

        if (v18 == (id)1)
        {
          v19 = v11;

          v5 = v19;
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v6 = obj;
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v8)
        continue;
      break;
    }
  }

  v5 = v5;
  v20 = v5;
LABEL_13:

  return v20;
}

- (BOOL)isEmail:(id)a3
{
  return objc_msgSend(a3, "containsString:", CFSTR("@"));
}

- (id)contactsWithPhoneNumberOrEmail:(id)a3 keys:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  if (-[SDStatusMonitor isEmail:](self, "isEmail:", v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CNContact predicateForContactsMatchingEmailAddress:](CNContact, "predicateForContactsMatchingEmailAddress:", v7));
  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(+[CNPhoneNumber phoneNumberWithStringValue:](CNPhoneNumber, "phoneNumberWithStringValue:", v7));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CNContact predicateForContactsMatchingPhoneNumber:](CNContact, "predicateForContactsMatchingPhoneNumber:", v9));
    v7 = (id)v9;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactStore unifiedContactsMatchingPredicate:keysToFetch:error:](self->_contactStore, "unifiedContactsMatchingPredicate:keysToFetch:error:", v8, v6, 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v10));

  return v11;
}

- (id)contactWithContactIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  CNContactStore *contactStore;
  unsigned __int8 v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  id v29;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor meCard](self, "meCard"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v7 = objc_msgSend(v6, "isEqual:", v4);

  if (v7)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor meCard](self, "meCard"));
  }
  else
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = sub_1001CD654;
    v27 = sub_1001CD664;
    v28 = 0;
    v9 = objc_alloc((Class)CNContactFetchRequest);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDAirDropContactHashManager GeneralContactKeysToFetch](_TtC16DaemoniOSLibrary27SDAirDropContactHashManager, "GeneralContactKeysToFetch"));
    v11 = objc_msgSend(v9, "initWithKeysToFetch:", v10);

    v29 = v4;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CNContact predicateForContactsWithIdentifiers:](CNContact, "predicateForContactsWithIdentifiers:", v12));
    objc_msgSend(v11, "setPredicate:", v13);

    contactStore = self->_contactStore;
    v22 = 0;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1001CD66C;
    v21[3] = &unk_10071AA80;
    v21[4] = &v23;
    v15 = -[CNContactStore enumerateContactsWithFetchRequest:error:usingBlock:](contactStore, "enumerateContactsWithFetchRequest:error:usingBlock:", v11, &v22, v21);
    v16 = v22;
    v17 = v16;
    if ((v15 & 1) == 0)
    {
      v18 = airdrop_log(v16);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_1001D8F3C();

    }
    v8 = (id)v24[5];

    _Block_object_dispose(&v23, 8);
  }

  return v8;
}

- (id)emailsForContact:(id)a3
{
  id v3;
  NSMutableArray *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableArray);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "emailAddresses", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9), "value"));
        -[NSMutableArray addObject:](v4, "addObject:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)emailOrPhoneForEmailHash:(id)a3 phoneHash:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropContactHashManager emailOrPhoneForCombinedHash:](self->_contactHashManager, "emailOrPhoneForCombinedHash:", v6));
    if (!v8)
      goto LABEL_7;
  }
  else
  {
    v9 = 0;
    if (!v7)
      goto LABEL_7;
  }
  if (!v9)
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropContactHashManager emailOrPhoneForCombinedHash:](self->_contactHashManager, "emailOrPhoneForCombinedHash:", v8));
LABEL_7:

  return v9;
}

- (id)instantMessageEmailsForContact:(id)a3
{
  id v3;
  NSMutableArray *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableArray);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "instantMessageAddresses", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9), "value"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "username"));
        objc_msgSend(v11, "rangeOfString:", CFSTR("@"));
        if (v12)
          -[NSMutableArray addObject:](v4, "addObject:", v11);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (CNContact)meCard
{
  CNContact *meCard;
  CNContactStore *contactStore;
  void *v5;
  CNContact *v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  CNContact *v14;
  uint64_t v15;
  NSObject *v16;
  CNContact *v17;
  CNContact *v18;
  id v20;

  meCard = self->___meCard;
  if (!meCard)
  {
    contactStore = self->_contactStore;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAirDropContactHashManager GeneralContactKeysToFetch](_TtC16DaemoniOSLibrary27SDAirDropContactHashManager, "GeneralContactKeysToFetch"));
    v20 = 0;
    v6 = (CNContact *)objc_claimAutoreleasedReturnValue(-[CNContactStore _crossPlatformUnifiedMeContactWithKeysToFetch:error:](contactStore, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v5, &v20));
    v7 = v20;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v9 = -[CNContact isEqual:](v6, "isEqual:", v8);

    if ((v9 & 1) != 0 || !v6)
    {
      v11 = airdrop_log(v10);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      v13 = v12;
      if (v7)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          sub_1001D9008();
      }
      else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        sub_1001D8FDC();
      }

      v14 = objc_opt_new(CNContact);
      v6 = v14;
    }
    v15 = airdrop_log(v10);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      sub_1001D8FB0();

    v17 = (CNContact *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor addAdditionalInformationToMeCard:](self, "addAdditionalInformationToMeCard:", v6));
    v18 = self->___meCard;
    self->___meCard = v17;

    -[SDAirDropContactHashManager setMeCard:](self->_contactHashManager, "setMeCard:", self->___meCard);
    meCard = self->___meCard;
  }
  return meCard;
}

- (void)resetMeCardWithReason:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  SDStatusMonitor *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001CDB90;
  v5[3] = &unk_100714860;
  v6 = a3;
  v7 = self;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (id)phoneNumbersForContact:(id)a3
{
  id v3;
  NSMutableArray *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableArray);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "phoneNumbers", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), "value"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringValue"));
        -[NSMutableArray addObject:](v4, "addObject:", v11);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (int64_t)autoHotspotState
{
  NSNumber *personalHotspotAutoState;
  unsigned int AutoInstantHotspotMode;
  uint64_t v5;
  NSNumber *v6;
  NSNumber *v7;

  personalHotspotAutoState = self->_personalHotspotAutoState;
  if (!personalHotspotAutoState)
  {
    AutoInstantHotspotMode = WiFiManagerClientGetAutoInstantHotspotMode(self->_wifiManager, a2);
    if (AutoInstantHotspotMode <= 2)
      v5 = AutoInstantHotspotMode;
    else
      v5 = 0;
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v5));
    v7 = self->_personalHotspotAutoState;
    self->_personalHotspotAutoState = v6;

    personalHotspotAutoState = self->_personalHotspotAutoState;
  }
  return -[NSNumber integerValue](personalHotspotAutoState, "integerValue");
}

- (void)updateAutoHotspotState
{
  unint64_t v3;
  uint64_t v4;
  unsigned int AutoInstantHotspotMode;
  uint64_t v6;
  NSNumber *v7;
  NSNumber *personalHotspotAutoState;
  NSInteger v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  unint64_t v13;
  const char *v14;
  int v15;
  const char *v16;
  __int16 v17;
  const char *v18;

  v3 = -[NSNumber integerValue](self->_personalHotspotAutoState, "integerValue");
  AutoInstantHotspotMode = WiFiManagerClientGetAutoInstantHotspotMode(self->_wifiManager, v4);
  if (AutoInstantHotspotMode <= 2)
    v6 = AutoInstantHotspotMode;
  else
    v6 = 0;
  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v6));
  personalHotspotAutoState = self->_personalHotspotAutoState;
  self->_personalHotspotAutoState = v7;

  v9 = -[NSNumber integerValue](self->_personalHotspotAutoState, "integerValue");
  if (v3 != v9)
  {
    v10 = daemon_log(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      if (v3 > 2)
        v12 = "?";
      else
        v12 = off_10071ADB0[v3];
      v13 = -[NSNumber integerValue](self->_personalHotspotAutoState, "integerValue");
      if (v13 > 2)
        v14 = "?";
      else
        v14 = off_10071ADB0[v13];
      v15 = 136315394;
      v16 = v12;
      v17 = 2080;
      v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Auto Hotspot state changed %s -> %s", (uint8_t *)&v15, 0x16u);
    }

    -[SDStatusMonitor postNotification:](self, "postNotification:", CFSTR("com.apple.sharingd.HotspotAutoStateChanged"));
  }
}

- (void)cellularDataEnabled:(BOOL *)a3 airplaneMode:(BOOL *)a4
{
  uint64_t CellularDataSettings;
  uint64_t v7;
  NSObject *v8;
  __int16 v9;

  v9 = 0;
  CellularDataSettings = _CTServerConnectionGetCellularDataSettings(self->_coreTelephonyServerConnection, 0, (char *)&v9 + 1, &v9);
  if ((_DWORD)CellularDataSettings)
  {
    v7 = daemon_log(CellularDataSettings);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1001D9068();

  }
  if (a3)
    *a3 = HIBYTE(v9) != 0;
  if (a4)
    *a4 = (_BYTE)v9 != 0;
}

- (BOOL)lteConnectionShows4G
{
  pthread_mutex_lock(&stru_1007B3728);
  LOBYTE(self) = self->_coreTelephonyLTEShows4G;
  pthread_mutex_unlock(&stru_1007B3728);
  return (char)self;
}

- (int64_t)familyHotspotStateForAltDSID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  v5 = v4;
  if (!self->_personalHotspotFamilyStates)
  {
    -[SDStatusMonitor updateFamilyHotspotState](self, "updateFamilyHotspotState");
    if (v5)
      goto LABEL_3;
LABEL_5:
    v7 = -1;
    goto LABEL_6;
  }
  if (!v4)
    goto LABEL_5;
LABEL_3:
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_personalHotspotFamilyStates, "objectForKeyedSubscript:", v5));
  v7 = (int64_t)objc_msgSend(v6, "integerValue");

LABEL_6:
  return v7;
}

- (void)updateFamilyHotspotState
{
  NSMutableDictionary *personalHotspotFamilyStates;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;
  id v6;
  void *v7;
  id v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _BOOL4 personalHotspotFamilyEnabled;
  uint64_t v16;
  NSObject *v17;
  const __CFString *v18;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, _BYTE *);
  void *v22;
  id v23;
  id v24;
  SDStatusMonitor *v25;
  uint64_t *v26;
  uint64_t *v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  const __CFString *v40;

  personalHotspotFamilyStates = self->_personalHotspotFamilyStates;
  if (!personalHotspotFamilyStates)
  {
    v4 = objc_opt_new(NSMutableDictionary);
    v5 = self->_personalHotspotFamilyStates;
    self->_personalHotspotFamilyStates = v4;

  }
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v6 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithString:", CFSTR("Family Hotspot State: "));
  v7 = (void *)WiFiManagerClientCopyFamilyHotspotPreferences(self->_wifiManager);
  v8 = objc_msgSend(v7, "count");
  v9 = (int)v8;
  v10 = daemon_log(v8);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v38) = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Family hotspot entries: %d", buf, 8u);
  }

  if (!v9)
    *((_BYTE *)v30 + 24) = 1;
  v19 = _NSConcreteStackBlock;
  v20 = 3221225472;
  v21 = sub_1001CE35C;
  v22 = &unk_10071AAA8;
  v28 = personalHotspotFamilyStates == 0;
  v12 = v6;
  v23 = v12;
  v13 = v7;
  v24 = v13;
  v25 = self;
  v26 = &v33;
  v27 = &v29;
  v14 = objc_msgSend(v13, "enumerateObjectsUsingBlock:", &v19);
  personalHotspotFamilyEnabled = self->_personalHotspotFamilyEnabled;
  self->_personalHotspotFamilyEnabled = *((_BYTE *)v30 + 24) ^ 1;
  if (!personalHotspotFamilyStates)
  {
    v16 = daemon_log(v14);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      if (*((_BYTE *)v30 + 24))
        v18 = CFSTR("Disabled");
      else
        v18 = &stru_10072FE60;
      *(_DWORD *)buf = 138412546;
      v38 = v12;
      v39 = 2112;
      v40 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@%@", buf, 0x16u);
    }

  }
  if (*((_BYTE *)v34 + 24) || personalHotspotFamilyEnabled != self->_personalHotspotFamilyEnabled)
    -[SDStatusMonitor postNotification:](self, "postNotification:", CFSTR("com.apple.sharingd.HotspotFamilyStateChanged"), v19, v20, v21, v22, v23);

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
}

- (BOOL)familyHotspotEnabled
{
  if (!self->_personalHotspotFamilyStates)
    -[SDStatusMonitor updateFamilyHotspotState](self, "updateFamilyHotspotState");
  return self->_personalHotspotFamilyEnabled;
}

- (unsigned)networkType
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned __int8 v6;

  pthread_mutex_lock(&stru_1007B3728);
  v3 = -[CTDataStatus indicator](self->_coreTelephonyDataStatus, "indicator");
  v4 = -[CTDataStatus indicatorOverride](self->_coreTelephonyDataStatus, "indicatorOverride");
  v5 = -[CTDataStatus radioTechnology](self->_coreTelephonyDataStatus, "radioTechnology");
  pthread_mutex_unlock(&stru_1007B3728);
  v6 = 0;
  switch(v3)
  {
    case 1u:
      if (v5 - 3 < 3)
        v6 = 1;
      else
        v6 = 2;
      break;
    case 2u:
      v6 = 3;
      break;
    case 3u:
    case 4u:
    case 5u:
      if (v4 == 7)
        v6 = 6;
      else
        v6 = 4;
      break;
    case 7u:
      if (-[SDStatusMonitor lteConnectionShows4G](self, "lteConnectionShows4G"))
        v6 = 6;
      else
        v6 = 7;
      break;
    case 8u:
      v6 = 8;
      break;
    default:
      return v6;
  }
  return v6;
}

- (BOOL)personalHotspotAllowed
{
  NSNumber *personalHotspotAllowed;
  void *v4;
  NSNumber *v5;
  NSNumber *v6;

  personalHotspotAllowed = self->_personalHotspotAllowed;
  if (!personalHotspotAllowed)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "isPersonalHotspotModificationAllowed")));
    v6 = self->_personalHotspotAllowed;
    self->_personalHotspotAllowed = v5;

    personalHotspotAllowed = self->_personalHotspotAllowed;
  }
  return -[NSNumber BOOLValue](personalHotspotAllowed, "BOOLValue");
}

- (void)updatePersonalHotspotAllowed
{
  unsigned int v3;
  void *v4;
  NSNumber *v5;
  NSNumber *personalHotspotAllowed;

  v3 = -[NSNumber BOOLValue](self->_personalHotspotAllowed, "BOOLValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "isPersonalHotspotModificationAllowed")));
  personalHotspotAllowed = self->_personalHotspotAllowed;
  self->_personalHotspotAllowed = v5;

  if (v3 != -[NSNumber BOOLValue](self->_personalHotspotAllowed, "BOOLValue"))
    -[SDStatusMonitor postNotification:](self, "postNotification:", CFSTR("com.apple.sharingd.PersonalHotspotAllowedChanged"));
}

- (int64_t)signalStrength
{
  int64_t v3;

  if (!-[SDStatusMonitor networkType](self, "networkType"))
    return 0;
  pthread_mutex_lock(&stru_1007B3728);
  v3 = -[NSNumber integerValue](self->_coreTelephonySignalStrength, "integerValue");
  pthread_mutex_unlock(&stru_1007B3728);
  return v3;
}

- (BOOL)simStateReady
{
  pthread_mutex_lock(&stru_1007B3728);
  LOBYTE(self) = -[NSString isEqualToString:](self->_coreTelephonySIMStatus, "isEqualToString:", kCTSIMSupportSIMStatusReady);
  pthread_mutex_unlock(&stru_1007B3728);
  return (char)self;
}

- (void)addPreventExitForLocaleReason:(id)a3
{
  id v4;
  SDStatusMonitor *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SDStatusMonitor *v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001CE948;
  v7[3] = &unk_100714860;
  v8 = v4;
  v9 = v5;
  v6 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);

  objc_sync_exit(v5);
}

- (void)pushDateForPreventExitForLocaleReason:(id)a3 expirationDate:(id)a4
{
  id v6;
  id v7;
  SDStatusMonitor *v8;
  _QWORD block[4];
  id v10;
  SDStatusMonitor *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = self;
    objc_sync_enter(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001CEAB8;
    block[3] = &unk_100715138;
    v10 = v6;
    v11 = v8;
    v12 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_sync_exit(v8);
  }

}

- (void)removePreventExitForLocaleReason:(id)a3
{
  id v4;
  SDStatusMonitor *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SDStatusMonitor *v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001CEC04;
  v7[3] = &unk_100714860;
  v8 = v4;
  v9 = v5;
  v6 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);

  objc_sync_exit(v5);
}

- (void)postNotification:(id)a3 userInfo:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "postNotificationName:object:userInfo:", v6, 0, v5);

}

- (void)postNotification:(id)a3
{
  -[SDStatusMonitor postNotification:userInfo:](self, "postNotification:userInfo:", a3, 0);
}

- (BOOL)_multipleUsersLoggedIn
{
  return 0;
}

- (__WiFiManagerClient)wifiManager
{
  return self->_wifiManager;
}

- (id)defaultWiFiDevice
{
  __WiFiDeviceClient *wifiDevice;

  wifiDevice = self->_wifiDevice;
  if (!wifiDevice)
  {
    -[SDStatusMonitor updateWirelessDevice](self, "updateWirelessDevice");
    wifiDevice = self->_wifiDevice;
  }
  return wifiDevice;
}

- (unsigned)wifiPasswordSharingAvailability
{
  __SecIdentity *v3;
  int v4;
  void *v5;
  unsigned int v6;
  int v7;
  int v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  _DWORD v18[2];

  v3 = -[SDStatusMonitor copyMyAppleIDSecIdentity](self, "copyMyAppleIDSecIdentity");
  if (v3)
  {
    CFRelease(v3);
    v4 = 0;
  }
  else
  {
    v4 = 4;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v6 = objc_msgSend(v5, "isPasswordProximityAutoFillRequestingAllowed");

  if (v6)
    v7 = v4;
  else
    v7 = v4 | 0x40;
  if (-[SDStatusMonitor bluetoothEnabled](self, "bluetoothEnabled"))
    v8 = v7;
  else
    v8 = v7 | 2;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myAppleID](self, "myAppleID"));

  if (v9)
    v10 = v8;
  else
    v10 = v8 | 0x20;
  v11 = objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myAppleIDValidationRecord](self, "myAppleIDValidationRecord"));
  if (!v11
    || (v12 = (void *)v11,
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myAppleIDValidationRecord](self, "myAppleIDValidationRecord")),
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("AppleIDAccountValidationRecordData"))),
        v14,
        v13,
        v12,
        !v14))
  {
    v10 |= 8u;
  }
  v15 = daemon_log(v11);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v18[0] = 67109120;
    v18[1] = v10;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "PWS availability: %ud\n", (uint8_t *)v18, 8u);
  }

  return v10;
}

- (id)wifiSSIDForSSIDHash:(id)a3
{
  id v4;
  NSMutableDictionary *ssidHashes;
  uint64_t v6;
  NSObject *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  const __CFArray *v10;
  const __CFArray *v11;
  CFIndex Count;
  CFIndex v13;
  CFIndex i;
  const void *ValueAtIndex;
  uint64_t SSID;
  id v17;
  const char *v18;
  const char *v19;
  CC_LONG v20;
  id v21;
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  CC_LONG v28;
  id v29;
  void *v30;
  __int128 v32;
  __int128 v33;

  v4 = a3;
  pthread_mutex_lock(&stru_1007B3728);
  ssidHashes = self->_ssidHashes;
  if (!ssidHashes)
  {
    v6 = daemon_log(0);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v32) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Generating SSID hashes", (uint8_t *)&v32, 2u);
    }

    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v9 = self->_ssidHashes;
    self->_ssidHashes = v8;

    if (self->_wifiManager)
    {
      v10 = (const __CFArray *)WiFiManagerClientCopyNetworks();
      if (v10)
      {
        v11 = v10;
        Count = CFArrayGetCount(v10);
        if (Count >= 1)
        {
          v13 = Count;
          for (i = 0; i != v13; ++i)
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v11, i);
            if (WiFiNetworkGetShareMode() == 3)
            {
              SSID = WiFiNetworkGetSSID(ValueAtIndex);
              v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(SSID));
              v18 = (const char *)objc_msgSend(v17, "UTF8String");
              if (v18)
              {
                v19 = v18;
                v32 = 0u;
                v33 = 0u;
                v20 = strlen(v18);
                CC_SHA256(v19, v20, (unsigned __int8 *)&v32);
                v21 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v32, 3);
                -[NSMutableDictionary setObject:forKeyedSubscript:](self->_ssidHashes, "setObject:forKeyedSubscript:", v17, v21, v32, v33);

              }
            }
          }
        }
        CFRelease(v11);
      }
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDHotspotAgent sharedAgent](SDHotspotAgent, "sharedAgent"));
    if (objc_msgSend(v22, "isTetheringInUse"))
    {
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "hotspotName")));
      v24 = (const char *)objc_msgSend(v23, "UTF8String");
      v25 = daemon_log(v24);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      v27 = v26;
      if (v24)
      {
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v32) = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Tethering active, adding to ssid cache.", (uint8_t *)&v32, 2u);
        }

        v32 = 0u;
        v33 = 0u;
        v28 = strlen(v24);
        CC_SHA256(v24, v28, (unsigned __int8 *)&v32);
        v29 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v32, 3);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_ssidHashes, "setObject:forKeyedSubscript:", v23, v29, v32, v33);

      }
      else
      {
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          sub_1001D90DC();

      }
    }

    ssidHashes = self->_ssidHashes;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](ssidHashes, "objectForKeyedSubscript:", v4));
  pthread_mutex_unlock(&stru_1007B3728);

  return v30;
}

- (BOOL)airDropPublished
{
  return self->_airDropPublished;
}

- (void)setAirDropPublished:(BOOL)a3
{
  self->_airDropPublished = a3;
  if (a3)
    -[SDStatusMonitor postNotification:](self, "postNotification:", CFSTR("com.apple.sharingd.AirDropPublished"));
}

- (NSString)nextAirDropID
{
  return self->_nextAirDropID;
}

- (void)setNextAirDropID:(id)a3
{
  objc_storeStrong((id *)&self->_nextAirDropID, a3);
}

- (BOOL)bluetoothEnabledIncludingRestricted
{
  CBController *bluetoothController;

  if ((SFDeviceIsVirtualMachine(self, a2) & 1) != 0)
    return 1;
  bluetoothController = self->_bluetoothController;
  if (!bluetoothController)
    return SFIsBluetoothEnabled();
  if (-[CBController bluetoothState](bluetoothController, "bluetoothState") == (id)5)
    return 1;
  return -[CBController bluetoothState](self->_bluetoothController, "bluetoothState") == (id)10;
}

- (BOOL)bluetoothEnabled
{
  CBController *bluetoothController;

  if ((SFDeviceIsVirtualMachine(self, a2) & 1) != 0)
    return 1;
  bluetoothController = self->_bluetoothController;
  if (bluetoothController)
    return -[CBController bluetoothState](bluetoothController, "bluetoothState") == (id)5;
  else
    return SFIsBluetoothEnabled();
}

- (void)setBluetoothEnabled:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  CBController *bluetoothController;
  _QWORD v7[4];
  id v8;
  id location;

  v3 = a3;
  pthread_mutex_lock(&stru_1007B3728);
  if (v3)
    v5 = 5;
  else
    v5 = 4;
  location = 0;
  objc_initWeak(&location, self);
  bluetoothController = self->_bluetoothController;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001CF36C;
  v7[3] = &unk_100718A78;
  objc_copyWeak(&v8, &location);
  -[CBController setPowerState:completion:](bluetoothController, "setPowerState:completion:", v5, v7);
  pthread_mutex_unlock(&stru_1007B3728);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (SDAirDropServer)finderServer
{
  id v3;
  id to;

  pthread_mutex_lock(&stru_1007B3728);
  to = 0;
  objc_copyWeak(&to, (id *)&self->_finderServer);
  pthread_mutex_unlock(&stru_1007B3728);
  v3 = objc_loadWeakRetained(&to);
  objc_destroyWeak(&to);
  return (SDAirDropServer *)v3;
}

- (void)setFinderServer:(id)a3
{
  id v4;
  id WeakRetained;

  v4 = a3;
  pthread_mutex_lock(&stru_1007B3728);
  WeakRetained = objc_loadWeakRetained((id *)&self->_finderServer);

  objc_storeWeak((id *)&self->_finderServer, v4);
  pthread_mutex_unlock(&stru_1007B3728);
  if (WeakRetained != v4)
  {
    -[SDStatusMonitor updateDiscoverableMode](self, "updateDiscoverableMode");
    -[SDStatusMonitor postNotification:](self, "postNotification:", CFSTR("com.apple.sharingd.FinderAirDropChanged"));
  }
}

- (BOOL)wirelessEnabled
{
  pthread_mutex_lock(&stru_1007B3728);
  LOBYTE(self) = self->_wirelessEnabled;
  pthread_mutex_unlock(&stru_1007B3728);
  return (char)self;
}

- (void)setWirelessEnabled:(BOOL)a3
{
  _BOOL8 v3;
  __WiFiManagerClient *wifiManager;
  uint64_t v6;
  NSObject *v7;

  v3 = a3;
  pthread_mutex_lock(&stru_1007B3728);
  wifiManager = self->_wifiManager;
  if (wifiManager)
  {
    WiFiManagerClientSetPower(wifiManager, v3);
  }
  else
  {
    v6 = daemon_log(0);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1001D9108();

  }
  pthread_mutex_unlock(&stru_1007B3728);
}

- (BOOL)airplaneModeEnabled
{
  return -[RadiosPreferences airplaneMode](self->_radiosPreferences, "airplaneMode");
}

- (void)setAirplaneModeEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  pthread_mutex_lock(&stru_1007B3728);
  -[RadiosPreferences setAirplaneMode:](self->_radiosPreferences, "setAirplaneMode:", v3);
  pthread_mutex_unlock(&stru_1007B3728);
}

- (BOOL)isMulticastAdvertisementsDisabled
{
  return sub_1000CE8D0(CFSTR("NoMulticastAdvertisements"), 0) != 0;
}

+ (float)airDropProgressUIMaxPercentage
{
  return (float)(int)sub_10019CC9C(CFSTR("AirDropProgressUIMaxPercentage"), 40) / 100.0;
}

- (NSDictionary)awdlInfo
{
  NSDictionary *awdlState;
  NSDictionary *v3;
  NSDictionary *v4;
  void *v5;

  awdlState = self->_awdlState;
  if (awdlState)
    v3 = awdlState;
  else
    v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor awdlStateInfo](self, "awdlStateInfo"));
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("AWDL_INFO")));

  return (NSDictionary *)v5;
}

- (NSArray)awdlPeerList
{
  NSDictionary *awdlState;
  NSDictionary *v3;
  NSDictionary *v4;
  void *v5;

  awdlState = self->_awdlState;
  if (awdlState)
    v3 = awdlState;
  else
    v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor awdlStateInfo](self, "awdlStateInfo"));
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("LINK_CHANGED_PEER_LIST")));

  return (NSArray *)v5;
}

- (id)awdlStateInfo
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor awdlDevice](self, "awdlDevice"));

  if (v3)
  {
    v12 = 0;
    v5 = WiFiDeviceClientCopyInterfaceStateInfo(self->_awdlDevice, &v12);
    if ((_DWORD)v5)
    {
      v6 = daemon_log(v5);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_1001D918C();
    }
    else
    {
      v9 = v12;
      if (v12)
        return v9;
      v11 = daemon_log(0);
      v7 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_1001D9160();
    }
  }
  else
  {
    v8 = daemon_log(v4);
    v7 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1001D9134();
  }

  v9 = 0;
  return v9;
}

- (NSData)bluetoothAddress
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor systemMonitor](self, "systemMonitor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bluetoothAddressData"));

  return (NSData *)v3;
}

- (NSString)bonjourName
{
  NSString *bonjourName;
  NSString *v4;
  __CFString *v5;

  pthread_mutex_lock(&stru_1007B3728);
  bonjourName = self->_bonjourName;
  if (bonjourName)
  {
    v4 = bonjourName;
  }
  else
  {
    v5 = (__CFString *)SCDynamicStoreCopyComputerName(0, 0);
    v4 = (NSString *)-[__CFString copy](v5, "copy");

  }
  pthread_mutex_unlock(&stru_1007B3728);
  return v4;
}

- (NSString)computerName
{
  NSString *computerName;
  __CFString *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;

  pthread_mutex_lock(&stru_1007B3728);
  computerName = self->_computerName;
  if (!computerName)
  {
    v4 = (__CFString *)SCDynamicStoreCopyComputerName(0, 0);
    v5 = (NSString *)-[__CFString copy](v4, "copy");
    v6 = self->_computerName;
    self->_computerName = v5;

    computerName = self->_computerName;
  }
  v7 = computerName;
  pthread_mutex_unlock(&stru_1007B3728);
  return v7;
}

- (void)clearComputerName
{
  NSString *computerName;

  pthread_mutex_lock(&stru_1007B3728);
  computerName = self->_computerName;
  self->_computerName = 0;

  pthread_mutex_unlock(&stru_1007B3728);
}

- (NSString)consoleUser
{
  NSString *v3;

  pthread_mutex_lock(&stru_1007B3728);
  v3 = self->_consoleUser;
  pthread_mutex_unlock(&stru_1007B3728);
  return v3;
}

- (void)clearConsoleUser
{
  NSString *consoleUser;

  pthread_mutex_lock(&stru_1007B3728);
  consoleUser = self->_consoleUser;
  self->_consoleUser = 0;

  self->_consoleUserID = -1;
  pthread_mutex_unlock(&stru_1007B3728);
}

- (NSString)deviceInformation
{
  _UNKNOWN **v3;
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSString *v19;
  NSString *deviceInformation;
  void *v21;
  void *v22;
  unsigned int v23;
  __CFString *v24;
  __CFString *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v31;
  __CFString *v32;
  _QWORD v33[2];
  _QWORD v34[7];

  v3 = NSLocale_ptr;
  if (!self->_deviceInformation)
  {
    v34[0] = CFSTR("BuildVersion");
    v34[1] = CFSTR("IsSimulator");
    v34[2] = CFSTR("marketing-name");
    v34[3] = CFSTR("ProductName");
    v34[4] = CFSTR("ProductType");
    v34[5] = CFSTR("ProductVersion");
    v34[6] = CFSTR("ReleaseType");
    v4 = (void *)MGCopyMultipleAnswers(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 7), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IsSimulator")));
    v6 = objc_msgSend(v5, "BOOLValue");

    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ReleaseType")));
    v8 = (void *)v7;
    v9 = CFSTR("Production");
    if (v7)
      v9 = (__CFString *)v7;
    v10 = v9;
    v32 = v10;

    v11 = CFSTR("Simulator");
    if (!v6)
      v11 = v10;
    v12 = v11;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("marketing-name")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ProductType")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%@)"), v31, v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ProductName")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ProductVersion")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BuildVersion")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@ (%@)"), v15, v16, v17));
    v19 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@, %@, "), v12, v14, v18));

    deviceInformation = self->_deviceInformation;
    self->_deviceInformation = v19;

    v3 = NSLocale_ptr;
  }
  v33[0] = CFSTR("BatteryCurrentCapacity");
  v33[1] = CFSTR("BatteryIsCharging");
  v21 = (void *)MGCopyMultipleAnswers(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 2), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("BatteryIsCharging")));
  v23 = objc_msgSend(v22, "BOOLValue");

  v24 = CFSTR("not charging");
  if (v23)
    v24 = CFSTR("charging");
  v25 = v24;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("BatteryCurrentCapacity")));
  v27 = objc_msgSend(v26, "integerValue");

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3[26], "stringWithFormat:", CFSTR("%d%% (%@)"), v27, v25));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingString:](self->_deviceInformation, "stringByAppendingString:", v28));

  return (NSString *)v29;
}

- (int64_t)deviceKeyBagState
{
  NSNumber *deviceKeyBagState;
  NSNumber *v4;
  NSNumber *v5;
  NSNumber *v6;

  deviceKeyBagState = self->_deviceKeyBagState;
  if (!deviceKeyBagState)
  {
    v4 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", MKBGetDeviceLockState(self->_mkbOptions));
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue(v4);
    v6 = self->_deviceKeyBagState;
    self->_deviceKeyBagState = v5;

    deviceKeyBagState = self->_deviceKeyBagState;
  }
  return -[NSNumber integerValue](deviceKeyBagState, "integerValue");
}

- (NSString)localHostName
{
  NSString *localHostName;
  __CFString *v4;
  NSString *v5;
  NSString *v6;

  pthread_mutex_lock(&stru_1007B3728);
  localHostName = self->_localHostName;
  if (!localHostName)
  {
    v4 = (__CFString *)SCDynamicStoreCopyLocalHostName(0);
    v5 = self->_localHostName;
    self->_localHostName = &v4->isa;

    localHostName = self->_localHostName;
  }
  v6 = localHostName;
  pthread_mutex_unlock(&stru_1007B3728);
  return v6;
}

- (void)clearLocalHostName
{
  NSString *localHostName;

  pthread_mutex_lock(&stru_1007B3728);
  localHostName = self->_localHostName;
  self->_localHostName = 0;

  pthread_mutex_unlock(&stru_1007B3728);
}

+ (double)b332BTAddressRotationDelay
{
  return (double)(int)sub_10019CC9C(CFSTR("B332BTAddressRotationDelayMsec"), 100) / 1000.0;
}

+ (double)b389MultiDiscoveryDebounce
{
  return (double)(int)sub_10019CC9C(CFSTR("B389MultiDiscoveryDebounceKeyMsec"), 1000) / 1000.0;
}

+ (double)b389MultiDiscoveryInstructionsDelay
{
  return (double)(int)sub_10019CC9C(CFSTR("B389MultiDiscoveryInstructionsDelayKeyMsec"), 6000) / 1000.0;
}

- (int)minPersonImageSize
{
  return sub_10019CC9C(CFSTR("MinPersonImageSize"), 32);
}

- (NSString)modelCode
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  size_t v6;
  int v7[2];
  _OWORD v8[16];

  memset(v8, 0, sizeof(v8));
  v6 = 256;
  *(_QWORD *)v7 = 0x100000006;
  v2 = sysctl(v7, 2u, v8, &v6, 0, 0);
  if (!(_DWORD)v2)
    return (NSString *)(id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v8));
  v3 = daemon_log(v2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_1001D91EC(v4);

  return (NSString *)0;
}

- (NSString)modelName
{
  __CFString *v2;
  unsigned int v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;

  pthread_mutex_lock(&stru_1007B3728);
  v2 = (__CFString *)MGCopyAnswer(CFSTR("DeviceName"), 0);
  v3 = -[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("iPod"));
  v4 = CFSTR("iPod touch");
  if (!v3)
    v4 = v2;
  v5 = v4;
  if (v5)
    v6 = v5;
  else
    v6 = CFSTR("iOS");
  pthread_mutex_unlock(&stru_1007B3728);

  return (NSString *)v6;
}

- (NSString)myAccountAppleID
{
  id v2;
  id v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init((Class)ACAccountStore);
  v3 = sub_10019B264(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "username"));

  return (NSString *)v5;
}

+ (int64_t)mrQLProgressUpdateFreqMsec
{
  return (int)sub_10019CC9C(CFSTR("MRQLProgFreqMsec"), 200);
}

- (NSString)myAltDSID
{
  id v2;
  id v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init((Class)ACAccountStore);
  v3 = sub_10019B264(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aa_altDSID"));

  return (NSString *)v5;
}

- (NSString)myAppleID
{
  void *v3;

  pthread_mutex_lock(&stru_1007B3728);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor _myAppleID](self, "_myAppleID"));
  pthread_mutex_unlock(&stru_1007B3728);
  return (NSString *)v3;
}

- (id)_myAppleID
{
  NSString *myAppleID;
  id v4;
  id v5;
  void *v6;
  NSString *v7;
  NSString *v8;

  myAppleID = self->_myAppleID;
  if (!myAppleID)
  {
    v4 = objc_alloc_init((Class)ACAccountStore);
    v5 = sub_10019B264(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "username"));
    v8 = self->_myAppleID;
    self->_myAppleID = v7;

    myAppleID = self->_myAppleID;
  }
  return myAppleID;
}

- (NSString)myAppleIDCommonName
{
  __SecIdentity *v3;
  __SecIdentity *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSString *v8;
  NSString *myAppleIDCommonName;
  NSString *v10;
  SecCertificateRef certificateRef;

  pthread_mutex_lock(&stru_1007B3728);
  if (!self->_myAppleIDCommonName)
  {
    v3 = -[SDStatusMonitor _copyMyAppleIDSecIdentity](self, "_copyMyAppleIDSecIdentity");
    if (v3)
    {
      v4 = v3;
      certificateRef = 0;
      v5 = SecIdentityCopyCertificate(v3, &certificateRef);
      if ((_DWORD)v5)
      {
        v6 = daemon_log(v5);
        v7 = objc_claimAutoreleasedReturnValue(v6);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          sub_1001D9274();

      }
      else
      {
        v8 = (NSString *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor commonNameForCertificate:](self, "commonNameForCertificate:", certificateRef));
        myAppleIDCommonName = self->_myAppleIDCommonName;
        self->_myAppleIDCommonName = v8;

        CFRelease(certificateRef);
      }
      CFRelease(v4);
    }
  }
  v10 = self->_myAppleIDCommonName;
  pthread_mutex_unlock(&stru_1007B3728);
  return v10;
}

- (NSArray)myAppleIDEmailAddresses
{
  void *v3;
  void *v4;

  pthread_mutex_lock(&stru_1007B3728);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor _myAppleID](self, "_myAppleID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor emailAddressesForAppleID:](self, "emailAddressesForAppleID:", v3));

  pthread_mutex_unlock(&stru_1007B3728);
  return (NSArray *)v4;
}

- (NSString)myAppleIDEmailHash
{
  void *v3;
  const __CFArray *v4;
  NSMutableString *Mutable;
  NSMutableString *myEmailHashes;
  CFIndex Count;
  CFIndex v8;
  uint64_t v9;
  void *ValueAtIndex;
  id v11;
  const __CFString *v12;
  __CFString *v13;
  uint64_t v14;
  const void *v15;
  NSMutableString *v16;

  pthread_mutex_lock(&stru_1007B3728);
  if (!self->_myEmailHashes)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor _myAppleID](self, "_myAppleID"));
    v4 = (const __CFArray *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor emailAddressesForAppleID:](self, "emailAddressesForAppleID:", v3));

    if (v4)
    {
      Mutable = (NSMutableString *)CFStringCreateMutable(0, 0);
      myEmailHashes = self->_myEmailHashes;
      self->_myEmailHashes = Mutable;

      Count = CFArrayGetCount(v4);
      if (Count >= 1)
      {
        v8 = 0;
        if (Count >= 8)
          v9 = 8;
        else
          v9 = Count;
        do
        {
          ValueAtIndex = (void *)CFArrayGetValueAtIndex(v4, v8);
          v11 = sub_10019CAC4(ValueAtIndex, 0);
          v12 = (const __CFString *)objc_claimAutoreleasedReturnValue(v11);
          v13 = (__CFString *)v12;
          if (v12)
          {
            v14 = sub_10019B468(v12);
            if (v14)
            {
              v15 = (const void *)v14;
              -[NSMutableString appendString:](self->_myEmailHashes, "appendString:", v14);
              if (v9 - 1 != v8)
                -[NSMutableString appendString:](self->_myEmailHashes, "appendString:", CFSTR(","));
              CFRelease(v15);
            }
          }

          ++v8;
        }
        while (v9 != v8);
      }
      CFRelease(v4);
    }
  }
  v16 = self->_myEmailHashes;
  pthread_mutex_unlock(&stru_1007B3728);
  return (NSString *)v16;
}

- (NSString)myAppleIDPhoneHash
{
  void *v3;
  const __CFArray *v4;
  NSMutableString *Mutable;
  NSMutableString *myPhoneHashes;
  CFIndex Count;
  CFIndex v8;
  uint64_t v9;
  void *ValueAtIndex;
  const __CFString *v11;
  uint64_t v12;
  const void *v13;
  NSMutableString *v14;

  pthread_mutex_lock(&stru_1007B3728);
  if (!self->_myPhoneHashes)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor _myAppleID](self, "_myAppleID"));
    v4 = (const __CFArray *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor phoneNumbersForAppleID:](self, "phoneNumbersForAppleID:", v3));

    if (v4)
    {
      Mutable = (NSMutableString *)CFStringCreateMutable(0, 0);
      myPhoneHashes = self->_myPhoneHashes;
      self->_myPhoneHashes = Mutable;

      Count = CFArrayGetCount(v4);
      if (Count >= 1)
      {
        v8 = 0;
        if (Count >= 8)
          v9 = 8;
        else
          v9 = Count;
        do
        {
          ValueAtIndex = (void *)CFArrayGetValueAtIndex(v4, v8);
          v11 = (const __CFString *)sub_10019CBA4(ValueAtIndex);
          if (v11)
          {
            v12 = sub_10019B468(v11);
            if (v12)
            {
              v13 = (const void *)v12;
              -[NSMutableString appendString:](self->_myPhoneHashes, "appendString:", v12);
              if (v9 - 1 != v8)
                -[NSMutableString appendString:](self->_myPhoneHashes, "appendString:", CFSTR(","));
              CFRelease(v13);
            }
          }
          ++v8;
        }
        while (v9 != v8);
      }
      CFRelease(v4);
    }
  }
  v14 = self->_myPhoneHashes;
  pthread_mutex_unlock(&stru_1007B3728);
  return (NSString *)v14;
}

- (NSArray)myAppleIDPhoneNumbers
{
  void *v3;
  uint64_t v4;
  void *v5;

  pthread_mutex_lock(&stru_1007B3728);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor _myAppleID](self, "_myAppleID"));
  v4 = objc_claimAutoreleasedReturnValue(-[SDStatusMonitor phoneNumbersForAppleID:](self, "phoneNumbersForAppleID:", v3));

  pthread_mutex_unlock(&stru_1007B3728);
  if (v4)
    v5 = (void *)v4;
  else
    v5 = &__NSArray0__struct;
  return (NSArray *)v5;
}

- (NSDictionary)myAppleIDValidationRecord
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myAppleID](self, "myAppleID"));
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAppleIDAgent sharedAgent](SDAppleIDAgent, "sharedAgent"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "validationRecordInfoForAppleID:", v2));

  }
  else
  {
    v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (NSString)myEmail
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  pthread_mutex_lock(&stru_1007B3728);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor meCard](self, "meCard"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "emailAddresses"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "value"));

  pthread_mutex_unlock(&stru_1007B3728);
  return (NSString *)v6;
}

- (NSString)myName
{
  void *v3;
  void *v4;

  pthread_mutex_lock(&stru_1007B3728);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor meCard](self, "meCard"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactFormatter stringFromContact:style:](CNContactFormatter, "stringFromContact:style:", v3, 0));

  pthread_mutex_unlock(&stru_1007B3728);
  return (NSString *)v4;
}

- (NSString)myGivenName
{
  void *v3;
  void *v4;

  pthread_mutex_lock(&stru_1007B3728);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor meCard](self, "meCard"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "givenName"));

  pthread_mutex_unlock(&stru_1007B3728);
  return (NSString *)v4;
}

- (NSString)myPrimaryEmail
{
  id v2;
  id v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init((Class)ACAccountStore);
  v3 = sub_10019B264(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aa_primaryEmail"));

  return (NSString *)v5;
}

- (NSData)myMediumHashes
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor unifiedAppleIDInfo](self, "unifiedAppleIDInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAirDropContactHashManager obfuscatedMediumHashDataForStrings:](_TtC16DaemoniOSLibrary27SDAirDropContactHashManager, "obfuscatedMediumHashDataForStrings:", v2));

  return (NSData *)v3;
}

- (NSData)myShortHashesForAirDrop
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor unifiedAppleIDInfo](self, "unifiedAppleIDInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAirDropContactHashManager btleAdvertisementDataForStrings:](_TtC16DaemoniOSLibrary27SDAirDropContactHashManager, "btleAdvertisementDataForStrings:", v2));

  return (NSData *)v3;
}

- (NSString)netbiosName
{
  NSString **p_netbiosName;
  id v4;
  __SCPreferences *smbPreferences;
  id v7;

  pthread_mutex_lock(&stru_1007B3728);
  p_netbiosName = &self->_netbiosName;
  if (self->_netbiosName)
  {
    v4 = 0;
  }
  else
  {
    smbPreferences = self->_smbPreferences;
    v7 = 0;
    -[SDStatusMonitor smbConfiguration:netBiosName:workgroup:](self, "smbConfiguration:netBiosName:workgroup:", smbPreferences, &v7, 0);
    v4 = v7;
  }
  objc_storeStrong((id *)p_netbiosName, v4);
  pthread_mutex_unlock(&stru_1007B3728);
  return (NSString *)v4;
}

- (int)sidebarMaxCount
{
  return sub_10019CC9C(CFSTR("SidebarMaxCount"), 7);
}

+ (int64_t)shareSheetMaxSuggestions
{
  return (int)sub_10019CC9C(CFSTR("ShareSheetMaxSuggestions"), 12);
}

- (NSString)someComputerName
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor computerName](self, "computerName"));
  if (!v3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor modelName](self, "modelName"));
  return (NSString *)v3;
}

- (NSString)workgroup
{
  NSString **p_workgroup;
  id v4;
  __SCPreferences *smbPreferences;
  id v7;

  pthread_mutex_lock(&stru_1007B3728);
  p_workgroup = &self->_workgroup;
  if (self->_workgroup)
  {
    v4 = 0;
  }
  else
  {
    smbPreferences = self->_smbPreferences;
    v7 = 0;
    -[SDStatusMonitor smbConfiguration:netBiosName:workgroup:](self, "smbConfiguration:netBiosName:workgroup:", smbPreferences, 0, &v7);
    v4 = v7;
  }
  objc_storeStrong((id *)p_workgroup, v4);
  pthread_mutex_unlock(&stru_1007B3728);
  return (NSString *)v4;
}

- (int)workgroupThreshold
{
  return sub_10019CC9C(CFSTR("WorkgroupThreshold"), 6);
}

- (BOOL)isAirDropAllowed
{
  NSNumber *airDropAllowed;
  void *v4;
  NSNumber *v5;
  NSNumber *v6;

  airDropAllowed = self->_airDropAllowed;
  if (!airDropAllowed)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "isAirDropAllowed")));
    v6 = self->_airDropAllowed;
    self->_airDropAllowed = v5;

    airDropAllowed = self->_airDropAllowed;
  }
  return -[NSNumber BOOLValue](airDropAllowed, "BOOLValue");
}

- (void)updateAirDropAllowed
{
  unsigned int v3;
  void *v4;
  NSNumber *v5;
  NSNumber *airDropAllowed;

  v3 = -[NSNumber BOOLValue](self->_airDropAllowed, "BOOLValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "isAirDropAllowed")));
  airDropAllowed = self->_airDropAllowed;
  self->_airDropAllowed = v5;

  if (v3 != -[NSNumber BOOLValue](self->_airDropAllowed, "BOOLValue"))
    -[SDStatusMonitor postNotification:](self, "postNotification:", CFSTR("com.apple.sharingd.AirDropAllowedChanged"));
}

- (BOOL)isTourModeEnabled
{
  return 0;
}

- (BOOL)lowPowerModeEnabled
{
  return 0;
}

- (BOOL)iCloudSharedPhotoLibraryEnabled
{
  int iCloudSharedPhotoLibraryEnabled;
  uint64_t AppBooleanValue;
  int v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  const __CFString *v10;
  int v12;
  const __CFString *v13;
  __int16 v14;
  const __CFString *v15;

  iCloudSharedPhotoLibraryEnabled = self->_iCloudSharedPhotoLibraryEnabled;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("PhotosSharedLibrarySyncingIsActive"), CFSTR("com.apple.mobileslideshow"), 0);
  v5 = AppBooleanValue != 0;
  if (iCloudSharedPhotoLibraryEnabled == v5)
  {
    LOBYTE(v5) = self->_iCloudSharedPhotoLibraryEnabled;
  }
  else
  {
    v6 = AppBooleanValue;
    v7 = daemon_log(AppBooleanValue);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = CFSTR("YES");
      if (iCloudSharedPhotoLibraryEnabled)
        v10 = CFSTR("YES");
      else
        v10 = CFSTR("NO");
      if (!v6)
        v9 = CFSTR("NO");
      v12 = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "iCloud Shared Photo Library enabled: %@ -> %@", (uint8_t *)&v12, 0x16u);
    }

    self->_iCloudSharedPhotoLibraryEnabled = v5;
  }
  return v5;
}

- (BOOL)allEnabled
{
  return 1;
}

- (BOOL)altDSIDNeedsFixing
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;

  v2 = objc_alloc_init((Class)ACAccountStore);
  v3 = sub_10019B264(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aa_altDSID"));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_primaryEmail"));
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

      if (v8)
      {
        v10 = tethering_log(v9);
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          sub_1001D9300();
      }
      else
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "username"));
        v15 = objc_msgSend(v6, "isEqualToString:", v14);

        if (!v15)
        {
          v12 = 0;
          goto LABEL_13;
        }
        v17 = tethering_log(v16);
        v11 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          sub_1001D932C();
      }
    }
    else
    {
      v13 = tethering_log(0);
      v11 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_1001D92D4();
    }

    v12 = 1;
LABEL_13:

    goto LABEL_14;
  }
  v12 = 0;
LABEL_14:

  return v12;
}

- (BOOL)alwaysAutoAccept
{
  return sub_1000CE8D0(CFSTR("AlwaysAutoAccept"), 0) != 0;
}

- (BOOL)alwaysSendPayload
{
  return sub_1000CE8D0(CFSTR("AlwaysSendPayload"), 0) != 0;
}

+ (BOOL)b332PairingEnabled
{
  return sub_1000CE8D0(CFSTR("B332PairingEnabled"), 1) != 0;
}

+ (BOOL)b389ShowLogsInUI
{
  return sub_1000CE8D0(CFSTR("B389ShowLogsInUI"), 0) != 0;
}

- (BOOL)backlightOn
{
  NSNumber *backlightOn;
  NSNumber *v4;
  NSNumber *v5;
  uint64_t state64;

  backlightOn = self->_backlightOn;
  if (!backlightOn)
  {
    state64 = 0;
    notify_get_state(self->_backlightLevelToken, &state64);
    v4 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", state64 != 0));
    v5 = self->_backlightOn;
    self->_backlightOn = v4;

    backlightOn = self->_backlightOn;
  }
  return -[NSNumber BOOLValue](backlightOn, "BOOLValue");
}

- (BOOL)bonjourEnabled
{
  return 1;
}

- (BOOL)browseAllInterfaces
{
  return sub_1000CE84C((uint64_t)self, (uint64_t)a2) != 0;
}

+ (BOOL)isBuddyCompleted
{
  int AppBooleanValue;

  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("SetupDone"), CFSTR("com.apple.purplebuddy"), 0);
  return (AppBooleanValue | CFPreferencesGetAppBooleanValue(CFSTR("ForceNoBuddy"), CFSTR("com.apple.purplebuddy"), 0)) != 0;
}

- (BOOL)bypassLTKeyAbort
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1000CE8D0(CFSTR("BypassLTKeyAbort"), 0);
  if ((_DWORD)v2)
    LOBYTE(v2) = IsAppleInternalBuild(v2, v3) != 0;
  return v2;
}

- (BOOL)carplayConnected
{
  return self->_carplayConnected;
}

- (BOOL)coalesceMe
{
  return sub_1000CE8D0(CFSTR("CoalesceMe"), 0) != 0;
}

- (BOOL)connectedEnabled
{
  return 1;
}

- (BOOL)currentConsoleUser
{
  return 1;
}

- (BOOL)deviceInBiolockout
{
  id v2;
  id v3;
  __int128 v4;
  uint64_t v5;
  void *i;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  unsigned int v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  __int128 v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  _BYTE v35[128];

  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue(+[BKDeviceManager availableDevices](BKDeviceManager, "availableDevices"));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (!v3)
    goto LABEL_23;
  v5 = *(_QWORD *)v28;
  *(_QWORD *)&v4 = 138412290;
  v22 = v4;
  while (2)
  {
    for (i = 0; i != v3; i = (char *)i + 1)
    {
      if (*(_QWORD *)v28 != v5)
        objc_enumerationMutation(v2);
      v7 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
      v26 = 0;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKDevice deviceWithDescriptor:error:](BKDevice, "deviceWithDescriptor:error:", v7, &v26, v22));
      v9 = v26;
      v25 = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identitiesWithError:", &v25));
      v11 = v25;

      if (v11 || !v10)
      {
        v13 = daemon_log(v12);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v22;
          v32 = v11;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Error getting device identities. Error: %@", buf, 0xCu);
        }

      }
      v24 = 0;
      v15 = objc_msgSend(v10, "count");
      if (!v15)
        goto LABEL_16;
      v16 = getuid();
      v23 = v11;
      v17 = objc_msgSend(v8, "extendedBioLockoutState:forUser:error:", &v24, v16, &v23);
      v18 = v23;

      if (!v17)
      {
        v11 = v18;
LABEL_16:
        v19 = daemon_log(v15);
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v32 = v8;
          v33 = 2112;
          v34 = v11;
          _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Got error getting lockout state for device: %@ with error: %@", buf, 0x16u);
        }

        goto LABEL_19;
      }
      if ((v24 & 4) != 0)
      {

        LOBYTE(v3) = 1;
        goto LABEL_23;
      }
      v11 = v18;
LABEL_19:

    }
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v3)
      continue;
    break;
  }
LABEL_23:

  return (char)v3;
}

- (BOOL)deviceIsInClassD
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor systemMonitor](self, "systemMonitor"));
  v3 = objc_msgSend(v2, "firstUnlocked") ^ 1;

  return v3;
}

- (BOOL)deviceKeyBagDisabled
{
  return (id)-[SDStatusMonitor deviceKeyBagState](self, "deviceKeyBagState") == (id)3;
}

- (BOOL)deviceKeyBagLocked
{
  unint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  NSObject *v6;
  int v8;
  int64_t v9;

  v3 = -[SDStatusMonitor deviceKeyBagState](self, "deviceKeyBagState");
  if (v3 >= 8)
  {
    v5 = daemon_log(v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134217984;
      v9 = -[SDStatusMonitor deviceKeyBagState](self, "deviceKeyBagState");
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unknown keybag state: %ld File a radar against Sharing | all", (uint8_t *)&v8, 0xCu);
    }

    LOBYTE(v4) = 0;
  }
  else
  {
    return (0x76u >> v3) & 1;
  }
  return v4;
}

- (BOOL)deviceKeyBagLocking
{
  return (id)-[SDStatusMonitor deviceKeyBagState](self, "deviceKeyBagState") == (id)2;
}

- (BOOL)deviceKeyBagUnlocked
{
  unint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  NSObject *v6;
  int v8;
  int64_t v9;

  v3 = -[SDStatusMonitor deviceKeyBagState](self, "deviceKeyBagState");
  if (v3 >= 8)
  {
    v5 = daemon_log(v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134217984;
      v9 = -[SDStatusMonitor deviceKeyBagState](self, "deviceKeyBagState");
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unknown keybag state: %ld File a radar against Sharing | all", (uint8_t *)&v8, 0xCu);
    }

    LOBYTE(v4) = 0;
  }
  else
  {
    return (0x89u >> v3) & 1;
  }
  return v4;
}

- (BOOL)deviceKeyBagUnlockedAndScreenOn
{
  _BOOL4 v3;

  v3 = -[SDStatusMonitor deviceKeyBagUnlocked](self, "deviceKeyBagUnlocked");
  if (v3)
    LOBYTE(v3) = -[SDStatusMonitor screenOn](self, "screenOn");
  return v3;
}

- (BOOL)deviceRequiresNewRanging
{
  return 0;
}

- (BOOL)deviceSupportsRanging
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const __CFString *v12;
  __WiFiDeviceClient *wifiDevice;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  const __CFString *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  __WiFiDeviceClient *v23;
  _BYTE v24[128];

  v3 = (void *)WiFiDeviceClientCopyProperty(self->_wifiDevice, kWiFiDeviceCapabilitiesKey);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v24, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "integerValue", (_QWORD)v14) == (id)58)
        {
          LODWORD(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v24, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  v9 = auto_unlock_log(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v12 = CFSTR("NO");
    wifiDevice = self->_wifiDevice;
    *(_DWORD *)buf = 138412802;
    if ((_DWORD)v5)
      v12 = CFSTR("YES");
    v19 = v12;
    v20 = 2112;
    v21 = v4;
    v22 = 2112;
    v23 = wifiDevice;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Device supports ranging %@, capabilities: %@, wifiDevice: %@", buf, 0x20u);
  }

  return (char)v5;
}

- (BOOL)deviceUIUnlocked
{
  NSNumber *deviceUIUnlocked;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSNumber *v7;
  NSNumber *v8;
  __int16 v10;

  deviceUIUnlocked = self->_deviceUIUnlocked;
  if (!deviceUIUnlocked)
  {
    v10 = 0;
    v4 = SBSSpringBoardServerPort(0, a2);
    v5 = SBGetScreenLockStatus(v4, (char *)&v10 + 1, &v10);
    if ((_DWORD)v5)
    {
      v6 = daemon_log(v5);
      v7 = (NSNumber *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_ERROR))
        sub_1001D9358();
    }
    else
    {
      v8 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", HIBYTE(v10) == 0));
      v7 = self->_deviceUIUnlocked;
      self->_deviceUIUnlocked = v8;
    }

    deviceUIUnlocked = self->_deviceUIUnlocked;
  }
  return -[NSNumber BOOLValue](deviceUIUnlocked, "BOOLValue");
}

- (BOOL)deviceWasUnlockedOnce
{
  return self->_deviceWasUnlockedOnce;
}

- (BOOL)disableAutoAccept
{
  return sub_1000CE8D0(CFSTR("DisableAutoAccept"), 0) != 0;
}

- (BOOL)disableAutoAcceptForPhotosAssetBundles
{
  return sub_1000CE8D0(CFSTR("DisableAutoAcceptForPhotosAssetBundles"), 1) != 0;
}

- (BOOL)disableCompression
{
  return sub_1000CE8D0(CFSTR("DisableCompression"), 0) != 0;
}

- (BOOL)disableContinuityTLS
{
  return sub_1000CE8D0(CFSTR("DisableContinuityTLS"), 0) != 0;
}

- (BOOL)disablePeopleSuggestions
{
  return sub_1000CE8D0(CFSTR("DisablePeopleSuggestions"), 0) != 0;
}

- (BOOL)disablePictureQuery
{
  return sub_1000CE8D0(CFSTR("DisablePictureQuery"), 0) != 0;
}

- (BOOL)disablePipelining
{
  return sub_1000CE8D0(CFSTR("DisablePipelining"), 0) != 0;
}

- (BOOL)disableQuarantine
{
  return sub_1000CE8D0(CFSTR("DisableQuarantine"), 0) != 0;
}

- (BOOL)disableExtractMediaFromBundles
{
  return sub_1000CE8D0(CFSTR("DisableExtractMediaFromBundles"), 0) != 0;
}

- (BOOL)disableTransformingPhotosAssetBundlesToFolders
{
  return sub_1000CE8D0(CFSTR("DisableTransformingPhotosAssetBundlesToFolders"), 0) != 0;
}

- (BOOL)disableRotation
{
  return sub_1000CE8D0(CFSTR("DisableRotation"), 0) != 0;
}

- (BOOL)disableTLS
{
  return variable initialization expression of SDAirDropHashStoreCDB.destroyed() != 0;
}

- (BOOL)dockHasDownloadsFolder
{
  return 0;
}

- (BOOL)eduModeEnabled
{
  if (qword_1007C6D30 != -1)
    dispatch_once(&qword_1007C6D30, &stru_10071AAC8);
  return byte_1007C6D28;
}

- (BOOL)enableAirDropAdvertising
{
  if (sub_1000CE8D0(CFSTR("DisableAirDropAdvertising"), 0))
    return 0;
  else
    return -[SDStatusMonitor isAirDropAvailable](self, "isAirDropAvailable");
}

- (BOOL)enableAirDropReceiving
{
  int v3;
  int v4;

  v3 = SFIsDeviceAudioAccessory(self);
  v4 = sub_1000CE8D0(CFSTR("EnableAirDropReceiving"), v3 ^ 1u);
  if (v4)
    LOBYTE(v4) = -[SDStatusMonitor isAirDropAvailable](self, "isAirDropAvailable");
  return v4;
}

- (BOOL)enableAllRecents
{
  return sub_1000CE8D0(CFSTR("EnableAllRecents"), 0) != 0;
}

- (BOOL)enableBugs
{
  return sub_1000CE8D0(CFSTR("EnableBugs"), 0) != 0;
}

- (BOOL)enableContinuity
{
  if (sub_1000CE8D0(CFSTR("DisableContinuity"), 0))
    return 0;
  else
    return -[SDStatusMonitor deviceSupportsContinuity](self, "deviceSupportsContinuity");
}

- (BOOL)enableDebugMode
{
  return sub_1000CE8D0(CFSTR("EnableDebugMode"), 0) != 0;
}

- (BOOL)enableDemoMode
{
  return sub_1000CE8C0() != 0;
}

- (BOOL)enableDVZip
{
  return sub_1000CE8D0(CFSTR("EnableDVZip"), 1) != 0;
}

- (BOOL)enableHotspotFallback
{
  return sub_1000CE8D0(CFSTR("EnableHotspotFallback"), 0) != 0;
}

+ (BOOL)enableOOBPCredentialLogging
{
  int v2;

  v2 = IsAppleInternalBuild(a1, a2);
  if (v2)
    LOBYTE(v2) = sub_1000CE8D0(CFSTR("EnableOOBPCredentialLogging"), 0) != 0;
  return v2;
}

- (BOOL)enablePKZip
{
  return sub_1000CE8D0(CFSTR("EnablePKZip"), 0) != 0;
}

- (BOOL)enablePKZipCompression
{
  return sub_1000CE8D0(CFSTR("EnablePKZipCompression"), 0) != 0;
}

- (BOOL)enableStrangers
{
  return sub_1000CE8D0(CFSTR("pdStrangers"), 0) != 0;
}

- (BOOL)enableStreamDebugging
{
  return sub_1000CE8D0(CFSTR("EnableStreamDebugging"), 0) != 0;
}

+ (BOOL)enableShareSheetVectorSlots
{
  return sub_1000CE8D0(CFSTR("kEnableShareSheetVectorSlots"), 0) != 0;
}

+ (BOOL)enableAirDropHUDScene
{
  return sub_1000CE8D0(CFSTR("kEnableAirDropHUDScene"), 0) != 0;
}

- (BOOL)enableWebloc
{
  return sub_1000CE8D0(CFSTR("EnableWebloc"), 0) != 0;
}

- (BOOL)enableXML
{
  return sub_1000CE8D0(CFSTR("EnableXML"), 0) != 0;
}

- (BOOL)finderAirDropEnabled
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor finderServer](self, "finderServer"));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)forceAWDL
{
  return sub_1000CE8D0(CFSTR("ForceAWDL"), 0) != 0;
}

- (BOOL)forceP2P
{
  return sub_1000CE8D0(CFSTR("ForceP2P"), 0) != 0;
}

- (BOOL)handoffVisible
{
  NSNumber *handoffVisible;
  NSNumber *v4;
  NSNumber *v5;
  NSNumber *v6;
  unsigned __int8 v7;

  pthread_mutex_lock(&stru_1007B3728);
  handoffVisible = self->_handoffVisible;
  if (!handoffVisible)
  {
    v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", SBSEventObserverGetValueForState(SBSEventObserverStateContinuityUIIsVisible) != 0);
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue(v4);
    v6 = self->_handoffVisible;
    self->_handoffVisible = v5;

    handoffVisible = self->_handoffVisible;
  }
  v7 = -[NSNumber BOOLValue](handoffVisible, "BOOLValue");
  pthread_mutex_unlock(&stru_1007B3728);
  return v7;
}

- (BOOL)ignoreIconDiskCache
{
  return sub_1000CE8D0(CFSTR("IgnoreIconDiskCache"), 0) != 0;
}

- (BOOL)lostModeEnabled
{
  if ((SFLostMode(self, a2) & 1) != 0)
    return 1;
  else
    return SFManagedLostMode();
}

- (BOOL)internetSharingEnabled
{
  return 0;
}

- (BOOL)myAppleIDIsManaged
{
  id v2;
  id v3;
  void *v4;
  unsigned __int8 v5;

  v2 = objc_alloc_init((Class)ACAccountStore);
  v3 = sub_10019B264(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "aa_isManagedAppleID");

  return v5;
}

- (BOOL)registerAllInterfaces
{
  return sub_1000CE8D0(CFSTR("RegisterAllInterfaces"), 0) != 0;
}

- (BOOL)runningAsSetupUser
{
  return 0;
}

- (BOOL)showMeInWormhole
{
  return sub_1000CE8D0(CFSTR("ShowMeInWormhole"), 0) != 0;
}

- (BOOL)showThisComputer
{
  return sub_1000CE8D0(CFSTR("ShowThisComputer"), 0) != 0;
}

- (BOOL)signedIntoPrimaryiCloudAccount
{
  id v2;
  id v3;
  void *v4;
  BOOL v5;

  v2 = objc_alloc_init((Class)ACAccountStore);
  v3 = sub_10019B264(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4 != 0;

  return v5;
}

- (BOOL)sleepModeOn
{
  return self->_sleepModeOn;
}

- (BOOL)smartCoverIsClosed
{
  return -[SDSmartCoverMonitor smartCoverIsClosed](self->_smartCoverMonitor, "smartCoverIsClosed");
}

- (BOOL)supportsFitnessPlusPairing
{
  int DeviceClass;

  DeviceClass = GestaltGetDeviceClass(self, a2);
  return DeviceClass == 6 || DeviceClass == 1;
}

- (BOOL)supportsXcodePairing
{
  unsigned int DeviceClass;

  DeviceClass = GestaltGetDeviceClass(self, a2);
  return (DeviceClass < 7) & (0x5Au >> DeviceClass);
}

- (BOOL)testDiskFull
{
  return sub_1000CE8D0(CFSTR("TestDiskFull"), 0) != 0;
}

- (BOOL)wifiUserPowerPreference
{
  return 0;
}

- (BOOL)wirelessCarPlay
{
  CARSessionStatus *carKitSessionStatus;
  CARSessionStatus *v4;
  CARSessionStatus *v5;
  void *v6;
  BOOL v7;

  pthread_mutex_lock(&stru_1007B3728);
  carKitSessionStatus = self->_carKitSessionStatus;
  if (!carKitSessionStatus)
  {
    v4 = (CARSessionStatus *)objc_alloc_init((Class)CARSessionStatus);
    v5 = self->_carKitSessionStatus;
    self->_carKitSessionStatus = v4;

    carKitSessionStatus = self->_carKitSessionStatus;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CARSessionStatus currentSession](carKitSessionStatus, "currentSession"));
  pthread_mutex_unlock(&stru_1007B3728);
  if (v6)
    v7 = -[SDStatusMonitor isCarKitSessionWireless:](self, "isCarKitSessionWireless:", v6);
  else
    v7 = 0;

  return v7;
}

- (BOOL)asynchronousProxyLoadingEnabled
{
  return sub_1000CE8D0(CFSTR("EnableAsynchronousProxyLoading"), 0) != 0;
}

- (void)logAirDropTransactionForClientServer:(BOOL)a3 beginEnd:(BOOL)a4 count:(int)a5
{
  _BOOL4 v6;
  _BOOL4 v7;
  uint64_t v8;
  NSObject *v9;
  const __CFString *v10;
  const __CFString *v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;

  v6 = a4;
  v7 = a3;
  v8 = airdrop_log(self);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("server");
    if (v7)
      v10 = CFSTR("client");
    v12 = 138412802;
    v13 = v10;
    if (v6)
      v11 = CFSTR("begin");
    else
      v11 = CFSTR("end");
    v14 = 2112;
    v15 = v11;
    v16 = 1024;
    v17 = a5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "AirDrop %@ transaction %@ (%d)", (uint8_t *)&v12, 0x1Cu);
  }

}

- (void)updateMediaAccessControlSetting:(BOOL)a3
{
  _BOOL4 v3;
  unsigned int v5;
  unsigned int v6;
  int64_t v7;
  id v8;

  v3 = a3;
  v8 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.airplay"));
  v5 = objc_msgSend(v8, "BOOLForKey:", CFSTR("accessControlLevel"));
  v6 = objc_msgSend(v8, "BOOLForKey:", CFSTR("p2pAllow"));
  v7 = 3;
  if (!v5)
    v7 = 1;
  if (!v6)
    v7 = 2;
  if (self->_mediaAccessControlSetting != v7)
  {
    self->_mediaAccessControlSetting = v7;
    if (v3)
      -[SDStatusMonitor postNotification:](self, "postNotification:", CFSTR("com.apple.sharingd.MediaAccessControlSettingChanged"));
  }

}

- (int64_t)mediaAccessControlSetting
{
  return self->_mediaAccessControlSetting;
}

- (void)installAppleIDUsernameMonitor
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1001D2154, AKAppleIDEmailsDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)appleIDAccountInfoChanged:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = daemon_log(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Apple ID account info changed.", v6, 2u);
  }

  -[SDStatusMonitor clearMyAppleIDInfo](self, "clearMyAppleIDInfo");
  -[SDStatusMonitor updateDiscoverableMode](self, "updateDiscoverableMode");
  -[SDStatusMonitor postNotification:](self, "postNotification:", CFSTR("com.apple.sharingd.AppleIDAccountInfoChanged"));
}

- (void)installAppleIDAccountInfoMonitor
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "appleIDAccountInfoChanged:", SFAppleIDIdentityDidChangeNotification, 0);

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "appleIDAccountInfoChanged:", SFAppleIDValidationRecordDidChangeNotification, 0);

}

- (void)forceAWDLDeviceRefresh:(__WiFiDeviceClient *)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = daemon_log(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting awdlDevice to nil", v6, 2u);
  }

  self->_awdlDevice = 0;
}

- (void)updateWirelessCritical:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;

  v3 = a3;
  v5 = daemon_log(self);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (v3)
      v7 = CFSTR("YES");
    v8 = 138412290;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "updateWirelessCritical inCriticalState=%@", (uint8_t *)&v8, 0xCu);
  }

  self->_wirelessCritical = v3;
  -[SDStatusMonitor postNotification:](self, "postNotification:", CFSTR("com.apple.sharingd.WirelessCriticalChanged"));
}

- (void)handleAWDLState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t isKindOfClass;
  uint64_t v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  NSDictionary *v13;
  NSDictionary *awdlState;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_awdlState, "objectForKeyedSubscript:", CFSTR("AWDL_INFO")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AWDL_INFO")));
  if (v5
    && (v7 = objc_opt_class(NSDictionary),
        isKindOfClass = objc_opt_isKindOfClass(v5, v7),
        (isKindOfClass & 1) == 0)
    || v6
    && (v9 = objc_opt_class(NSDictionary),
        isKindOfClass = objc_opt_isKindOfClass(v6, v9),
        (isKindOfClass & 1) == 0))
  {
    v15 = auto_unlock_log(isKindOfClass);
    awdlState = (NSDictionary *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(&awdlState->super, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412546;
      v17 = objc_opt_class(v5);
      v18 = 2112;
      v19 = objc_opt_class(v6);
      _os_log_impl((void *)&_mh_execute_header, &awdlState->super, OS_LOG_TYPE_DEFAULT, "AWDL Info isn't a dictionary (stored info class %@, new info class %@)", (uint8_t *)&v16, 0x16u);
    }
  }
  else
  {
    v10 = objc_msgSend(v5, "isEqualToDictionary:", v6);
    if ((v10 & 1) == 0)
    {
      v11 = auto_unlock_log(v10);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138412290;
        v17 = (uint64_t)v6;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "AWDL Info updated %@", (uint8_t *)&v16, 0xCu);
      }

    }
    v13 = (NSDictionary *)objc_msgSend(v4, "copy");
    awdlState = self->_awdlState;
    self->_awdlState = v13;
  }

}

- (void)updateAWDLStateInfo
{
  if (!-[SDStatusMonitor wirelessEnabled](self, "wirelessEnabled"))
    -[SDStatusMonitor handleAWDLState:](self, "handleAWDLState:", 0);
}

- (void)installWirelessMonitor
{
  __WiFiManagerClient *v3;
  uint64_t v4;
  NSObject *v5;

  if (!self->_wifiDevice)
  {
    if (self->_wifiManager
      || (v3 = (__WiFiManagerClient *)WiFiManagerClientCreate(0, 0), (self->_wifiManager = v3) != 0))
    {
      -[SDStatusMonitor updateWirelessDevice](self, "updateWirelessDevice");
    }
    else
    {
      v4 = daemon_log(0);
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        sub_1001D93B8();

    }
  }
}

- (void)updateWirelessDevice
{
  __WiFiDeviceClient *awdlDevice;
  _BOOL4 wifiDeviceAttachmentRegistered;
  __WiFiManagerClient *wifiManager;
  const __CFArray *v6;
  const __CFArray *v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  __WiFiDeviceClient *wifiDevice;
  uint64_t InterfaceRoleIndex;
  __WiFiDeviceClient *v16;
  uint64_t v17;
  NSObject *v18;
  __WiFiDeviceClient *v19;
  __WiFiDeviceClient *v20;
  CFTypeRef v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  __WiFiDeviceClient *v27;
  _BOOL4 v28;
  _BOOL4 wifiScheduledOnRunLoop;
  __WiFiManagerClient *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  CFRunLoopRef Main;
  CFTypeRef cf;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  __WiFiDeviceClient *v44;
  _BYTE v45[128];

  pthread_mutex_lock(&stru_1007B3728);
  if (self->_wifiDevice)
  {
    awdlDevice = self->_awdlDevice;
    pthread_mutex_unlock(&stru_1007B3728);
    if (awdlDevice)
      goto LABEL_37;
  }
  else
  {
    pthread_mutex_unlock(&stru_1007B3728);
  }
  pthread_mutex_lock(&stru_1007B3728);
  wifiDeviceAttachmentRegistered = self->_wifiDeviceAttachmentRegistered;
  wifiManager = self->_wifiManager;
  self->_wifiDeviceAttachmentRegistered = 1;
  pthread_mutex_unlock(&stru_1007B3728);
  if (!wifiDeviceAttachmentRegistered)
  {
    WiFiManagerClientRegisterDeviceAttachmentCallback(wifiManager, sub_1001D2B7C, self);
    WiFiManagerClientRegisterVirtInterfaceChangeCallback(wifiManager, sub_1001D2C5C, self);
  }
  v6 = (const __CFArray *)WiFiManagerClientCopyDevices(wifiManager);
  if (v6)
  {
    v7 = v6;
    if (CFArrayGetCount(v6))
    {
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v8 = (id)WiFiManagerClientCopyInterfaces(wifiManager);
      v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v40 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
            pthread_mutex_lock(&stru_1007B3728);
            wifiDevice = self->_wifiDevice;
            pthread_mutex_unlock(&stru_1007B3728);
            if (!wifiDevice)
            {
              InterfaceRoleIndex = WiFiDeviceClientGetInterfaceRoleIndex(v13);
              if (InterfaceRoleIndex)
              {
                v16 = 0;
              }
              else
              {
                pthread_mutex_lock(&stru_1007B3728);
                v16 = v13;
                self->_wifiDevice = v16;
                pthread_mutex_unlock(&stru_1007B3728);
                InterfaceRoleIndex = WiFiDeviceClientRegisterPowerCallback(v16, sub_1001D2D24, self);
              }
              v17 = daemon_log(InterfaceRoleIndex);
              v18 = objc_claimAutoreleasedReturnValue(v17);
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v44 = v16;
                _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Wi-Fi device %@", buf, 0xCu);
              }

            }
            pthread_mutex_lock(&stru_1007B3728);
            v19 = self->_awdlDevice;
            pthread_mutex_unlock(&stru_1007B3728);
            if (!v19 && WiFiDeviceClientIsInterfaceAWDL(v13))
            {
              pthread_mutex_lock(&stru_1007B3728);
              v20 = v13;
              self->_awdlDevice = v20;
              pthread_mutex_unlock(&stru_1007B3728);
              WiFiDeviceClientRegisterVirtualInterfaceStateChangeCallback(v20, sub_1001D2D6C, self);
              cf = 0;
              WiFiDeviceClientCopyInterfaceStateInfo(v20, &cf);
              -[SDStatusMonitor handleAWDLState:](self, "handleAWDLState:", cf);
              v21 = cf;
              if (cf)
                CFRelease(cf);
              v22 = daemon_log(v21);
              v23 = objc_claimAutoreleasedReturnValue(v22);
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v44 = v20;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "AWDL device %@", buf, 0xCu);
              }

            }
          }
          v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
        }
        while (v10);
      }

    }
    else
    {
      v26 = daemon_log(0);
      v8 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_1001D943C();
    }

    CFRelease(v7);
  }
  else
  {
    v24 = daemon_log(0);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_1001D9410();

  }
LABEL_37:
  pthread_mutex_lock(&stru_1007B3728);
  v27 = self->_wifiDevice;
  v28 = self->_wifiDeviceAttachmentRegistered;
  wifiScheduledOnRunLoop = self->_wifiScheduledOnRunLoop;
  v30 = self->_wifiManager;
  v31 = pthread_mutex_unlock(&stru_1007B3728);
  if (!v27)
  {
    if (wifiScheduledOnRunLoop)
      return;
    v35 = daemon_log(v31);
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "SDStatusMonitor: WiFi device monitor started", buf, 2u);
    }

    goto LABEL_52;
  }
  if (v28)
  {
    v32 = daemon_log(v31);
    v33 = objc_claimAutoreleasedReturnValue(v32);
    v34 = v33;
    if (wifiScheduledOnRunLoop)
    {
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "SDStatusMonitor: WiFi device attached", buf, 2u);
      }

      -[SDStatusMonitor postNotification:](self, "postNotification:", CFSTR("com.apple.sharingd.WiFiDeviceAttached"));
    }
    else
    {
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        sub_1001D93E4();

    }
    WiFiManagerClientRegisterDeviceAttachmentCallback(v30, 0, 0);
    WiFiDeviceClientRegisterHostApStateChangedCallback(v27, sub_1001D2DA0, self);
    WiFiDeviceClientRegister24GHzNetworkInCriticalStateCallback(v27, sub_1001D2EA8, self);
    pthread_mutex_lock(&stru_1007B3728);
    self->_wifiDeviceAttachmentRegistered = 0;
    pthread_mutex_unlock(&stru_1007B3728);
  }
  if (!wifiScheduledOnRunLoop)
  {
LABEL_52:
    Main = CFRunLoopGetMain();
    WiFiManagerClientScheduleWithRunLoop(v30, Main, kCFRunLoopDefaultMode);
    pthread_mutex_lock(&stru_1007B3728);
    self->_wifiScheduledOnRunLoop = 1;
    pthread_mutex_unlock(&stru_1007B3728);
  }
}

- (void)installWifiInterfaceMonitor
{
  NSObject *v3;
  _QWORD block[5];

  if (!self->_wifiInterfaceMonitor)
  {
    v3 = dispatch_queue_create("com.apple.sharing.cwfinterface.queue", 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001D2FF4;
    block[3] = &unk_1007146D8;
    block[4] = self;
    dispatch_async(v3, block);

  }
}

- (void)updateWifiState:(int64_t)a3
{
  CWFInterface *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const __CFString *v14;
  const __CFString *v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  const __CFString *v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  _BYTE v26[10];
  const __CFString *v27;

  if (self->_wifiInterfaceMonitor)
  {
    pthread_mutex_lock(&stru_1007B3728);
    v5 = self->_wifiInterfaceMonitor;
    pthread_mutex_unlock(&stru_1007B3728);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CWFInterface channel](v5, "channel"));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CWFInterface channel](v5, "channel"));
      v8 = objc_msgSend(v7, "is2GHz");

    }
    else
    {
      v8 = 0;
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CWFInterface currentKnownNetworkProfile](v5, "currentKnownNetworkProfile"));
    v10 = objc_msgSend(v9, "isPersonalHotspot");

    pthread_mutex_lock(&stru_1007B3728);
    self->_isUsing2GHzWifi = v8;
    self->_isWifiPersonalHotspot = v10;
    v11 = pthread_mutex_unlock(&stru_1007B3728);
    v12 = daemon_log(v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = CFSTR("YES");
      if (self->_isUsing2GHzWifi)
        v15 = CFSTR("YES");
      else
        v15 = CFSTR("NO");
      if (!self->_isWifiPersonalHotspot)
        v14 = CFSTR("NO");
      v25 = 138412546;
      *(_QWORD *)v26 = v15;
      *(_WORD *)&v26[8] = 2112;
      v27 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "WifiState: isUsing2GHz: %@ - isWifiPersonalHotspot: %@\n", (uint8_t *)&v25, 0x16u);
    }

    if (a3 == 1)
    {
      v22 = -[CWFInterface powerOn](v5, "powerOn");
      pthread_mutex_lock(&stru_1007B3728);
      self->_wirelessEnabled = v22;
      v23 = pthread_mutex_unlock(&stru_1007B3728);
      v24 = daemon_log(v23);
      v20 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v25 = 67109120;
        *(_DWORD *)v26 = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "WifiPowerOn: _wirelessEnabled: %d", (uint8_t *)&v25, 8u);
      }
      v21 = CFSTR("com.apple.sharingd.WirelessPowerChanged");
    }
    else
    {
      if (a3 != 8)
      {
LABEL_21:

        return;
      }
      v16 = (-[CWFInterface opMode](v5, "opMode") >> 3) & 1;
      v17 = (-[CWFInterface opMode](v5, "opMode") >> 1) & 1;
      pthread_mutex_lock(&stru_1007B3728);
      self->_wirelessAccessPoint = v16;
      self->_computerToComputer = v17;
      v18 = pthread_mutex_unlock(&stru_1007B3728);
      v19 = daemon_log(v18);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v25 = 67109376;
        *(_DWORD *)v26 = v16;
        *(_WORD *)&v26[4] = 1024;
        *(_DWORD *)&v26[6] = v17;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "WifiMode: wirelessAccessPoint: %d computerToComputer: %d", (uint8_t *)&v25, 0xEu);
      }
      v21 = CFSTR("com.apple.sharingd.WirelessModeChanged");
    }

    -[SDStatusMonitor updateDiscoverableMode](self, "updateDiscoverableMode");
    -[SDStatusMonitor postNotification:](self, "postNotification:", v21);
    goto LABEL_21;
  }
}

- (void)installBacklightMonitor
{
  _QWORD handler[5];

  if (!self->_backlightLevelToken)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1001D365C;
    handler[3] = &unk_100714EC8;
    handler[4] = self;
    notify_register_dispatch("com.apple.backboardd.backlight.changed", &self->_backlightLevelToken, (dispatch_queue_t)&_dispatch_main_q, handler);
  }
}

- (void)installAirplaneModeMonitor
{
  RadiosPreferences *v3;
  RadiosPreferences *radiosPreferences;

  v3 = (RadiosPreferences *)objc_alloc_init((Class)RadiosPreferences);
  radiosPreferences = self->_radiosPreferences;
  self->_radiosPreferences = v3;

  -[RadiosPreferences setDelegate:](self->_radiosPreferences, "setDelegate:", self);
}

- (void)airplaneModeChanged
{
  -[SDStatusMonitor postNotification:](self, "postNotification:", CFSTR("com.apple.sharingd.AirplaneModeChanged"));
}

- (void)d2dEncryptionAvailableWithCompletionHandler:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)d2dEncryptionChanged
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = daemon_log(self);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Device to device encryption status changed", v4, 2u);
  }

}

- (void)installD2DEncryptionMonitor
{
  void *v3;
  uint64_t v4;
  id v5;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  objc_copyWeak(&v5, &location);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor systemMonitor](self, "systemMonitor", _NSConcreteStackBlock, 3221225472, sub_1001D3848, &unk_1007145D0));
  objc_msgSend(v3, "setManateeChangedHandler:", &v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)bluetoothAddressChanged
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = daemon_log(self);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Bluetooth address changed", v4, 2u);
  }

}

- (void)installBluetoothMonitor
{
  CBController *v3;
  CBController *bluetoothController;
  CBController *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  if (!self->_bluetoothController)
  {
    v3 = (CBController *)objc_alloc_init((Class)CBController);
    bluetoothController = self->_bluetoothController;
    self->_bluetoothController = v3;

    location = 0;
    objc_initWeak(&location, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1001D3ADC;
    v13[3] = &unk_1007145D0;
    objc_copyWeak(&v14, &location);
    -[CBController setBluetoothStateChangedHandler:](self->_bluetoothController, "setBluetoothStateChangedHandler:", v13);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001D3B08;
    v11[3] = &unk_1007145D0;
    objc_copyWeak(&v12, &location);
    -[CBController setInvalidationHandler:](self->_bluetoothController, "setInvalidationHandler:", v11);
    v5 = self->_bluetoothController;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001D3B34;
    v9[3] = &unk_100718A78;
    objc_copyWeak(&v10, &location);
    -[CBController activateWithCompletion:](v5, "activateWithCompletion:", v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  location = 0;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001D3B7C;
  v7[3] = &unk_1007145D0;
  objc_copyWeak(&v8, &location);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor systemMonitor](self, "systemMonitor"));
  objc_msgSend(v6, "setBluetoothAddressChangedHandler:", v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)bluetoothStateChanged
{
  uint64_t v3;
  NSObject *v4;
  unint64_t v5;
  const char *v6;
  int v7;
  const char *v8;

  v3 = daemon_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (unint64_t)-[CBController bluetoothState](self->_bluetoothController, "bluetoothState");
    if (v5 > 0xA)
      v6 = "?";
    else
      v6 = off_10071ADC8[v5];
    v7 = 136315138;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Bluetooth state changed %s", (uint8_t *)&v7, 0xCu);
  }

  -[SDStatusMonitor updateDiscoverableMode](self, "updateDiscoverableMode");
  -[SDStatusMonitor postNotification:](self, "postNotification:", CFSTR("com.apple.sharingd.BluetoothPowerChanged"));
}

- (void)bluetoothActivatedWithError:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  int v8;
  id v9;

  v4 = a3;
  v5 = daemon_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v7)
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Bluetooth controller failed to activate - error: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  else
  {
    if (v7)
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Bluetooth controller activated", (uint8_t *)&v8, 2u);
    }

    -[SDStatusMonitor bluetoothStateChanged](self, "bluetoothStateChanged");
  }

}

- (void)bluetoothDidSetPowerStateWithError:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  int v10;
  id v11;

  v3 = a3;
  v4 = daemon_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      v10 = 138412290;
      v11 = v3;
      v7 = "Bluetooth controller failed to set power state - error: %@";
      v8 = v5;
      v9 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v9);
    }
  }
  else if (v6)
  {
    LOWORD(v10) = 0;
    v7 = "Bluetooth controller set power state";
    v8 = v5;
    v9 = 2;
    goto LABEL_6;
  }

}

- (void)bluetoothMonitorInvalidated
{
  uint64_t v3;
  NSObject *v4;
  CBController *bluetoothController;
  uint8_t v6[16];

  v3 = daemon_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Bluetooth controller invalidated, retry in 5 seconds", v6, 2u);
  }

  bluetoothController = self->_bluetoothController;
  self->_bluetoothController = 0;

  -[SDStatusMonitor retryInstallBluetoothMonitor](self, "retryInstallBluetoothMonitor");
}

- (void)retryInstallBluetoothMonitor
{
  dispatch_time_t v2;
  _QWORD v3[4];
  id v4;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v2 = dispatch_time(0, 5000000000);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1001D3F7C;
  v3[3] = &unk_1007145D0;
  objc_copyWeak(&v4, &location);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)installBonjourNameMonitor
{
  _DNSServiceRef_t **p_nameMonitor;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;

  if (!self->_nameMonitor)
  {
    p_nameMonitor = &self->_nameMonitor;
    v3 = DNSServiceRegister(&self->_nameMonitor, 0, 0xFFFFFFFF, 0, "_whats-my-name._tcp.", "local.", 0, 0, 0, 0, (DNSServiceRegisterReply)sub_1001D4088, self);
    if ((_DWORD)v3)
    {
      v4 = daemon_log(v3);
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        sub_1001D9528();
    }
    else
    {
      v6 = DNSServiceSetDispatchQueue(*p_nameMonitor, (dispatch_queue_t)&_dispatch_main_q);
      if (!(_DWORD)v6)
        return;
      v7 = daemon_log(v6);
      v5 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        sub_1001D94C8();
    }

  }
}

- (void)uninstallBonjourNameMonitor
{
  _DNSServiceRef_t *nameMonitor;

  nameMonitor = self->_nameMonitor;
  if (nameMonitor)
  {
    DNSServiceRefDeallocate(nameMonitor);
    self->_nameMonitor = 0;
  }
}

- (void)restartBonjourNameMonitor
{
  pthread_mutex_lock(&stru_1007B3728);
  -[SDStatusMonitor uninstallBonjourNameMonitor](self, "uninstallBonjourNameMonitor");
  -[SDStatusMonitor installBonjourNameMonitor](self, "installBonjourNameMonitor");
  pthread_mutex_unlock(&stru_1007B3728);
}

- (void)carplayMonitorDiedNotification:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = daemon_log(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CarPlay server crashed", v6, 2u);
  }

  -[SDStatusMonitor uninstallCarPlayStatusMonitor](self, "uninstallCarPlayStatusMonitor");
  -[SDStatusMonitor installCarPlayStatusMonitor](self, "installCarPlayStatusMonitor");
  -[SDStatusMonitor carplayStatusNotification:](self, "carplayStatusNotification:", 0);
}

- (void)carplayStatusNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  const char *v14;
  int v15;
  const char *v16;
  __int16 v17;
  const char *v18;

  v4 = -[objc_class sharedAVSystemController](off_1007B3788(), "sharedAVSystemController");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = off_1007B3790();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attributeForKey:", v7));
  v9 = objc_msgSend(v8, "BOOLValue");

  v11 = daemon_log(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = "on";
    if (self->_carplayConnected)
      v14 = "on";
    else
      v14 = "off";
    if (!v9)
      v13 = "off";
    v15 = 136315394;
    v16 = v14;
    v17 = 2080;
    v18 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CarPlay status changed: %s -> %s", (uint8_t *)&v15, 0x16u);
  }

  self->_carplayConnected = v9;
  -[SDStatusMonitor postNotification:](self, "postNotification:", CFSTR("com.apple.sharingd.CarPlayStatusChanged"));
}

- (void)installCarPlayStatusMonitor
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[2];

  v3 = -[objc_class sharedAVSystemController](off_1007B3788(), "sharedAVSystemController");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = off_1007B3798();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v20[0] = v6;
  v7 = off_1007B37A0();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v20[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2));

  v10 = off_1007B37A8();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v4, "setAttribute:forKey:error:", v9, v11, 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v13 = off_1007B3798();
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  objc_msgSend(v12, "addObserver:selector:name:object:", self, "carplayMonitorDiedNotification:", v14, 0);

  v15 = off_1007B37A0();
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  objc_msgSend(v12, "addObserver:selector:name:object:", self, "carplayStatusNotification:", v16, 0);

  v17 = off_1007B3790();
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributeForKey:", v18));
  self->_carplayConnected = objc_msgSend(v19, "BOOLValue");

}

- (void)installWirelessCarPlayMonitor
{
  CARSessionStatus *carKitSessionStatus;
  CARSessionStatus *v4;
  CARSessionStatus *v5;

  pthread_mutex_lock(&stru_1007B3728);
  carKitSessionStatus = self->_carKitSessionStatus;
  if (!carKitSessionStatus)
  {
    v4 = (CARSessionStatus *)objc_alloc_init((Class)CARSessionStatus);
    v5 = self->_carKitSessionStatus;
    self->_carKitSessionStatus = v4;

    carKitSessionStatus = self->_carKitSessionStatus;
  }
  -[CARSessionStatus setSessionObserver:](carKitSessionStatus, "setSessionObserver:", self);
  pthread_mutex_unlock(&stru_1007B3728);
}

- (BOOL)isCarKitSessionWireless:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "configuration"));
  v4 = objc_msgSend(v3, "transportType") == (id)3;

  return v4;
}

- (void)handleCarKitSessionStateChanged:(id)a3
{
  _QWORD block[5];

  if (-[SDStatusMonitor isCarKitSessionWireless:](self, "isCarKitSessionWireless:", a3))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001D4598;
    block[3] = &unk_1007146D8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)sessionDidConnect:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = daemon_log(-[SDStatusMonitor handleCarKitSessionStateChanged:](self, "handleCarKitSessionStateChanged:", a3));
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CarPlay session connected.", v5, 2u);
  }

}

- (void)sessionDidDisconnect:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = daemon_log(-[SDStatusMonitor handleCarKitSessionStateChanged:](self, "handleCarKitSessionStateChanged:", a3));
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CarPlay session disconnected.", v5, 2u);
  }

}

- (void)uninstallCarPlayStatusMonitor
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v3 = off_1007B3798();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v7, "removeObserver:name:object:", self, v4, 0);

  v5 = off_1007B37A0();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v7, "removeObserver:name:object:", self, v6, 0);

  self->_carplayConnected = 0;
}

- (void)installSmartCoverStatusMonitor
{
  SDSmartCoverMonitor *v3;
  SDSmartCoverMonitor *smartCoverMonitor;

  v3 = objc_alloc_init(SDSmartCoverMonitor);
  smartCoverMonitor = self->_smartCoverMonitor;
  self->_smartCoverMonitor = v3;

}

- (void)contactStoreDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D480C;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)meCardChanged:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D48E8;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)installContactsMonitor
{
  CNContactStore *v3;
  CNContactStore *contactStore;
  _TtC16DaemoniOSLibrary27SDAirDropContactHashManager *v5;
  _TtC16DaemoniOSLibrary27SDAirDropContactHashManager *contactHashManager;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (CNContactStore *)objc_alloc_init((Class)CNContactStore);
  contactStore = self->_contactStore;
  self->_contactStore = v3;

  v5 = (_TtC16DaemoniOSLibrary27SDAirDropContactHashManager *)objc_claimAutoreleasedReturnValue(+[SDAirDropContactHashManager shared](_TtC16DaemoniOSLibrary27SDAirDropContactHashManager, "shared"));
  contactHashManager = self->_contactHashManager;
  self->_contactHashManager = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SDStatusMonitor installContactsMonitor]"));
  -[SDStatusMonitor resetMeCardWithReason:](self, "resetMeCardWithReason:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDAirDropContactHashManager kStatusContactsHashesChanged](_TtC16DaemoniOSLibrary27SDAirDropContactHashManager, "kStatusContactsHashesChanged"));
  objc_msgSend(v8, "addObserver:selector:name:object:", self, "contactStoreDidChange:", v9, 0);

  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDAirDropContactHashManager kStatusMeCardChanged](_TtC16DaemoniOSLibrary27SDAirDropContactHashManager, "kStatusMeCardChanged"));
  objc_msgSend(v11, "addObserver:selector:name:object:", self, "meCardChanged:", v10, 0);

}

- (void)installCoreTelephonyMonitor
{
  id v3;
  uint64_t v4;
  void *v5;
  CoreTelephonyClient *v6;
  CoreTelephonyClient *coreTelephonyClient;
  _QWORD v8[5];

  self->_coreTelephonyServerConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue(0, CFSTR("com.apple.sharing"), &_dispatch_main_q, 0);
  v3 = objc_alloc((Class)CoreTelephonyClient);
  v4 = CUMainQueue();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (CoreTelephonyClient *)objc_msgSend(v3, "initWithQueue:", v5);
  coreTelephonyClient = self->_coreTelephonyClient;
  self->_coreTelephonyClient = v6;

  -[CoreTelephonyClient setDelegate:](self->_coreTelephonyClient, "setDelegate:", self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001D4B68;
  v8[3] = &unk_10071AB18;
  v8[4] = self;
  -[SDStatusMonitor fetchSubscriptionContextWithCompletion:](self, "fetchSubscriptionContextWithCompletion:", v8);
}

- (void)fetchSubscriptionContextWithCompletion:(id)a3
{
  id v4;
  CoreTelephonyClient *coreTelephonyClient;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  coreTelephonyClient = self->_coreTelephonyClient;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001D4C50;
  v7[3] = &unk_10071AB40;
  v8 = v4;
  v6 = v4;
  -[CoreTelephonyClient getPreferredDataSubscriptionContext:](coreTelephonyClient, "getPreferredDataSubscriptionContext:", v7);

}

- (void)fetchLTEShows4GWithContext:(id)a3
{
  id v4;
  id v5;
  CoreTelephonyClient *coreTelephonyClient;
  _QWORD v7[5];

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)CTBundle), "initWithBundleType:", 1);
  coreTelephonyClient = self->_coreTelephonyClient;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001D4E04;
  v7[3] = &unk_10071AB68;
  v7[4] = self;
  -[CoreTelephonyClient copyCarrierBundleValueWithDefault:key:bundleType:completion:](coreTelephonyClient, "copyCarrierBundleValueWithDefault:key:bundleType:completion:", v4, CFSTR("DataIndicatorOverrideForLTE"), v5, v7);

}

- (void)fetchSIMStatusWithContext:(id)a3
{
  CoreTelephonyClient *coreTelephonyClient;
  _QWORD v4[5];

  coreTelephonyClient = self->_coreTelephonyClient;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001D4F10;
  v4[3] = &unk_10071AB90;
  v4[4] = self;
  -[CoreTelephonyClient getSIMStatus:completion:](coreTelephonyClient, "getSIMStatus:completion:", a3, v4);
}

- (void)fetchDataStatusWithContext:(id)a3
{
  CoreTelephonyClient *coreTelephonyClient;
  _QWORD v4[5];

  coreTelephonyClient = self->_coreTelephonyClient;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001D4FDC;
  v4[3] = &unk_10071ABB8;
  v4[4] = self;
  -[CoreTelephonyClient getDataStatus:completion:](coreTelephonyClient, "getDataStatus:completion:", a3, v4);
}

- (void)fetchSignalStrengthWithContext:(id)a3
{
  CoreTelephonyClient *coreTelephonyClient;
  _QWORD v4[5];

  coreTelephonyClient = self->_coreTelephonyClient;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001D50A8;
  v4[3] = &unk_10071ABE0;
  v4[4] = self;
  -[CoreTelephonyClient getSignalStrengthInfo:completion:](coreTelephonyClient, "getSignalStrengthInfo:completion:", a3, v4);
}

- (void)updateLTEShows4G:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;

  v3 = a3;
  v5 = pthread_mutex_lock(&stru_1007B3728);
  if (self->_coreTelephonyLTEShows4G != v3)
  {
    v6 = daemon_log(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = CFSTR("NO");
      if (v3)
        v8 = CFSTR("YES");
      v9 = 138412290;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Updating LTE shows 4G %@", (uint8_t *)&v9, 0xCu);
    }

    self->_coreTelephonyLTEShows4G = v3;
  }
  pthread_mutex_unlock(&stru_1007B3728);
}

- (void)updateSIMStatus:(id)a3
{
  id v4;
  unsigned int v5;
  uint64_t v6;
  _BOOL8 v7;
  uint64_t v8;
  NSObject *v9;
  NSString *coreTelephonySIMStatus;
  int v11;
  id v12;

  v4 = a3;
  pthread_mutex_lock(&stru_1007B3728);
  if (-[NSString isEqualToString:](self->_coreTelephonySIMStatus, "isEqualToString:", v4))
  {
    v5 = 0;
  }
  else
  {
    v6 = kCTSIMSupportSIMStatusReady;
    if (-[NSString isEqualToString:](self->_coreTelephonySIMStatus, "isEqualToString:", kCTSIMSupportSIMStatusReady))
      v5 = 1;
    else
      v5 = objc_msgSend(v4, "isEqualToString:", v6);
  }
  v7 = -[NSString isEqualToString:](self->_coreTelephonySIMStatus, "isEqualToString:", v4);
  if (!v7)
  {
    v8 = daemon_log(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Updating SIM status %@", (uint8_t *)&v11, 0xCu);
    }

  }
  coreTelephonySIMStatus = self->_coreTelephonySIMStatus;
  self->_coreTelephonySIMStatus = (NSString *)v4;

  pthread_mutex_unlock(&stru_1007B3728);
  if (v5)
    -[SDStatusMonitor postNotification:](self, "postNotification:", CFSTR("com.apple.sharingd.SIMStateChanged"));
}

- (void)updateDataStatus:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  CTDataStatus *v8;
  CTDataStatus *coreTelephonyDataStatus;
  int v10;
  id v11;

  v4 = a3;
  pthread_mutex_lock(&stru_1007B3728);
  v5 = objc_msgSend(v4, "isEqual:", self->_coreTelephonyDataStatus);
  if ((v5 & 1) != 0)
  {
    pthread_mutex_unlock(&stru_1007B3728);
  }
  else
  {
    v6 = daemon_log(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Updating data status %@", (uint8_t *)&v10, 0xCu);
    }

    v8 = (CTDataStatus *)objc_msgSend(v4, "copy");
    coreTelephonyDataStatus = self->_coreTelephonyDataStatus;
    self->_coreTelephonyDataStatus = v8;

    pthread_mutex_unlock(&stru_1007B3728);
    -[SDStatusMonitor postNotification:](self, "postNotification:", CFSTR("com.apple.sharingd.SIMDataChanged"));
  }

}

- (void)updateSignalStrength:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  NSObject *v8;
  NSNumber *v9;
  NSNumber *coreTelephonySignalStrength;
  int v11;
  id v12;

  v4 = a3;
  pthread_mutex_lock(&stru_1007B3728);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayBars"));
  v6 = -[NSNumber isEqualToNumber:](self->_coreTelephonySignalStrength, "isEqualToNumber:", v5);
  if (v6)
  {
    pthread_mutex_unlock(&stru_1007B3728);
  }
  else
  {
    v7 = daemon_log(v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134217984;
      v12 = objc_msgSend(v5, "integerValue");
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updating signal strength %ld bars", (uint8_t *)&v11, 0xCu);
    }

    v9 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayBars"));
    coreTelephonySignalStrength = self->_coreTelephonySignalStrength;
    self->_coreTelephonySignalStrength = v9;

    pthread_mutex_unlock(&stru_1007B3728);
    -[SDStatusMonitor postNotification:](self, "postNotification:", CFSTR("com.apple.sharingd.SignalStrengthChanged"));
  }

}

- (void)subscriptionInfoDidChange
{
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  v3 = daemon_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CoreTelephony subscription info changed", buf, 2u);
  }

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001D5630;
  v5[3] = &unk_10071AB18;
  v5[4] = self;
  -[SDStatusMonitor fetchSubscriptionContextWithCompletion:](self, "fetchSubscriptionContextWithCompletion:", v5);
}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001D56EC;
  v4[3] = &unk_10071AB18;
  v4[4] = self;
  -[SDStatusMonitor fetchSubscriptionContextWithCompletion:](self, "fetchSubscriptionContextWithCompletion:", v4, a4);
}

- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001D5750;
  v4[3] = &unk_10071AB18;
  v4[4] = self;
  -[SDStatusMonitor fetchSubscriptionContextWithCompletion:](self, "fetchSubscriptionContextWithCompletion:", v4, a4);
}

- (void)signalStrengthChanged:(id)a3 info:(id)a4
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001D57B4;
  v4[3] = &unk_10071AB18;
  v4[4] = self;
  -[SDStatusMonitor fetchSubscriptionContextWithCompletion:](self, "fetchSubscriptionContextWithCompletion:", v4, a4);
}

- (void)handleDynamicStoreCallback:(__SCDynamicStore *)a3 changedKeys:(__CFArray *)a4
{
  CFStringRef v6;
  CFStringRef ComputerName;
  CFStringRef HostNames;
  CFIndex Count;
  CFIndex v10;
  char v11;
  char v12;
  CFIndex i;
  const void *ValueAtIndex;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  CFStringRef cf2;
  uint8_t buf[4];
  __CFArray *v21;

  cf2 = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, kSCDynamicStoreDomainState, CFSTR("awdl0"), kSCEntNetLink);
  v6 = SCDynamicStoreKeyCreate(0, CFSTR("%@/%@/%@"), kSCDynamicStoreDomainState, kSCCompNetwork, CFSTR("MulticastDNS"));
  ComputerName = SCDynamicStoreKeyCreateComputerName(0);
  HostNames = SCDynamicStoreKeyCreateHostNames(0);
  Count = CFArrayGetCount(a4);
  if (Count < 1)
    goto LABEL_21;
  v10 = Count;
  v18 = 0;
  v11 = 0;
  v12 = 0;
  for (i = 0; i != v10; ++i)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(a4, i);
    if (CFEqual(ValueAtIndex, ComputerName))
    {
      -[SDStatusMonitor clearComputerName](self, "clearComputerName");
      v11 = 1;
    }
    else if (CFEqual(ValueAtIndex, HostNames))
    {
      -[SDStatusMonitor clearLocalHostName](self, "clearLocalHostName");
      v12 = 1;
    }
    else if (CFEqual(ValueAtIndex, v6))
    {
      BYTE4(v18) = 1;
    }
    else
    {
      v15 = CFEqual(ValueAtIndex, cf2);
      if ((_DWORD)v15)
      {
        LOBYTE(v18) = 1;
      }
      else
      {
        v16 = daemon_log(v15);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v21 = a4;
          _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "SDStatusMonitor: Unknown keys changed (%@)", buf, 0xCu);
        }

      }
    }
  }
  if ((v18 & 0x100000000) != 0)
  {
    -[SDStatusMonitor restartBonjourNameMonitor](self, "restartBonjourNameMonitor");
    -[SDStatusMonitor postNotification:](self, "postNotification:", CFSTR("com.apple.sharingd.MulticastDNSChanged"));
  }
  if ((v18 & 1) == 0)
  {
    if ((v12 & 1) == 0)
      goto LABEL_19;
LABEL_23:
    -[SDStatusMonitor postNotification:](self, "postNotification:", CFSTR("com.apple.sharingd.LocalHostNameChanged"));
    if ((v11 & 1) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
  -[SDStatusMonitor postNotification:](self, "postNotification:", CFSTR("com.apple.sharingd.AirDropLinkStateChanged"));
  if ((v12 & 1) != 0)
    goto LABEL_23;
LABEL_19:
  if ((v11 & 1) != 0)
LABEL_20:
    -[SDStatusMonitor postNotification:](self, "postNotification:", CFSTR("com.apple.sharingd.ComputerNameChanged"));
LABEL_21:
  CFRelease(ComputerName);
  CFRelease(HostNames);
  CFRelease(v6);
  CFRelease(cf2);
}

- (void)installDynamicStoreCallBack
{
  SCDynamicStoreRef v3;
  const __SCDynamicStore *v4;
  CFStringRef HostNames;
  CFStringRef ComputerName;
  CFStringRef v7;
  CFStringRef NetworkInterfaceEntity;
  __CFArray *Mutable;
  uint64_t v10;
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoop *Main;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  SCDynamicStoreContext context;

  context.version = 0;
  memset(&context.retain, 0, 24);
  context.info = self;
  v3 = SCDynamicStoreCreate(0, CFSTR("com.apple.sharingd"), (SCDynamicStoreCallBack)sub_1001D5C80, &context);
  if (v3)
  {
    v4 = v3;
    HostNames = SCDynamicStoreKeyCreateHostNames(0);
    ComputerName = SCDynamicStoreKeyCreateComputerName(0);
    v7 = SCDynamicStoreKeyCreate(0, CFSTR("%@/%@/%@"), kSCDynamicStoreDomainState, kSCCompNetwork, CFSTR("MulticastDNS"));
    NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, kSCDynamicStoreDomainState, CFSTR("awdl0"), kSCEntNetLink);
    Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    CFArrayAppendValue(Mutable, HostNames);
    CFArrayAppendValue(Mutable, ComputerName);
    CFArrayAppendValue(Mutable, v7);
    CFArrayAppendValue(Mutable, NetworkInterfaceEntity);
    v10 = SCDynamicStoreSetNotificationKeys(v4, Mutable, 0);
    if ((_DWORD)v10)
    {
      RunLoopSource = SCDynamicStoreCreateRunLoopSource(0, v4, 0);
      self->_dynamicStoreSource = RunLoopSource;
      if (RunLoopSource)
      {
        Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, self->_dynamicStoreSource, kCFRunLoopDefaultMode);
LABEL_13:
        CFRelease(HostNames);
        CFRelease(ComputerName);
        CFRelease(v7);
        CFRelease(NetworkInterfaceEntity);
        CFRelease(Mutable);
        CFRelease(v4);
        return;
      }
      v17 = daemon_log(0);
      v16 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_1001D9850(v16);
    }
    else
    {
      v15 = daemon_log(v10);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_1001D97DC(v16);
    }

    goto LABEL_13;
  }
  v13 = daemon_log(0);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    sub_1001D9768(v14);

}

- (void)installKeyBagUnlockMonitor
{
  _QWORD handler[5];

  if (!self->_keyBagUnlockToken)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1001D5D0C;
    handler[3] = &unk_100714EC8;
    handler[4] = self;
    notify_register_dispatch(kMobileKeyBagLockStatusNotifyToken, &self->_keyBagUnlockToken, (dispatch_queue_t)&_dispatch_main_q, handler);
  }
}

- (void)installLocaleChangeMonitor
{
  SDDeferrableOperation *v3;
  SDDeferrableOperation *preventLocaleRestart;
  __CFNotificationCenter *LocalCenter;

  v3 = -[SDDeferrableOperation initWithIdentifier:queue:operation:]([SDDeferrableOperation alloc], "initWithIdentifier:queue:operation:", CFSTR("preventExitForLocaleChange"), &_dispatch_main_q, &stru_10071AC20);
  preventLocaleRestart = self->_preventLocaleRestart;
  self->_preventLocaleRestart = v3;

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)sub_1001D5E70, kCFLocaleCurrentLocaleDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)installManagedConfigurationMonitor
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  objc_msgSend(v3, "addObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "managedConfigurationSettingsChanged:", MCEffectiveSettingsChangedNotification, 0);

  -[SDStatusMonitor managedConfigurationSettingsChanged:](self, "managedConfigurationSettingsChanged:", 0);
}

- (void)managedConfigurationSettingsChanged:(id)a3
{
  -[SDStatusMonitor updateAirDropAllowed](self, "updateAirDropAllowed", a3);
  -[SDStatusMonitor updatePersonalHotspotAllowed](self, "updatePersonalHotspotAllowed");
  -[SDStatusMonitor updateBlacklistedAppBundleIDs](self, "updateBlacklistedAppBundleIDs");
}

- (void)updateBlacklistedAppBundleIDs
{
  void *v3;
  void *v4;
  NSSet *effectiveBlockedAppBundleIDs;
  NSSet *v6;
  unsigned __int8 v7;
  NSSet *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "effectiveBlockedAppBundleIDs"));

  effectiveBlockedAppBundleIDs = self->_effectiveBlockedAppBundleIDs;
  v8 = v4;
  v6 = effectiveBlockedAppBundleIDs;
  if (v8 == v6)
  {

  }
  else
  {
    if ((v8 == 0) != (v6 != 0))
    {
      v7 = -[NSSet isEqual:](v8, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_8;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_effectiveBlockedAppBundleIDs, v4);
    -[SDStatusMonitor postNotification:](self, "postNotification:", CFSTR("com.apple.sharingd.BlacklistedAppsChanged"));
  }
LABEL_8:

}

- (void)handleNameMonitorCallBack:(const char *)a3 flags:(unsigned int)a4 error:(int)a5
{
  char v6;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  __CFString *v12;
  NSString *v13;
  NSString *bonjourName;

  v6 = a4;
  v9 = pthread_mutex_lock(&stru_1007B3728);
  if (a5)
  {
    v10 = daemon_log(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1001D98C4();

    DNSServiceRefDeallocate(self->_nameMonitor);
    self->_nameMonitor = 0;
  }
  else if ((v6 & 2) != 0)
  {
    v12 = (__CFString *)CFStringCreateWithCString(0, a3, 0x8000100u);
    if (sub_1000CE998(self->_bonjourName, v12))
    {
      v13 = (NSString *)-[__CFString copy](v12, "copy");
      bonjourName = self->_bonjourName;
      self->_bonjourName = v13;

    }
    else
    {
      CFRelease(v12);
    }
  }
  pthread_mutex_unlock(&stru_1007B3728);
}

- (int64_t)pairedWatchWristState
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDPairedDeviceAgent sharedAgent](SDPairedDeviceAgent, "sharedAgent"));
  v3 = objc_msgSend(v2, "wristState");

  return (int64_t)v3;
}

- (void)updatePairedWatchWristState:(int64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;

  v5 = daemon_log(self);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor stringForWatchWristState:](self, "stringForWatchWristState:", a3));
    v8 = 138412290;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Paired watch wrist state changed: %@", (uint8_t *)&v8, 0xCu);

  }
  -[SDStatusMonitor postNotification:](self, "postNotification:", CFSTR("com.apple.sharingd.PairedWatchWristStateChanged"));
}

- (int)pairedWatchLockState
{
  void *v2;
  int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDPairedDeviceAgent sharedAgent](SDPairedDeviceAgent, "sharedAgent"));
  v3 = objc_msgSend(v2, "lockState");

  return v3;
}

- (void)updatePairedWatchLockState:(int)a3
{
  uint64_t v5;
  NSObject *v6;
  _DWORD v7[2];

  v5 = daemon_log(self);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Paired watch wrist lock changed: %d", (uint8_t *)v7, 8u);
  }

  -[SDStatusMonitor postNotification:](self, "postNotification:", CFSTR("com.apple.sharingd.PairedWatchLockStateChanged"));
}

- (void)installMISMonitor
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "handleMISStateChanged:", CFSTR("com.apple.sharingd.HotspotMISStateChanged"), 0);

}

- (void)handleMISStateChanged:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = airdrop_log(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating discoverable mode for personal hotspot change", v6, 2u);
  }

  -[SDStatusMonitor updateDiscoverableMode](self, "updateDiscoverableMode");
}

- (void)updateLocalPowerSource:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  _QWORD block[5];

  v4 = CUMainQueue(self, a2, a3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D6504;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(v5, block);

}

- (SFPowerSource)localPowerSource
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDPairedDeviceAgent sharedAgent](SDPairedDeviceAgent, "sharedAgent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "powerSource"));

  return (SFPowerSource *)v3;
}

- (void)handleSleepWakeCallBack:(unsigned int)a3 messageArguement:(void *)a4
{
  unint64_t v4;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  uint8_t v16[16];
  uint8_t v17[16];
  uint8_t v18[16];
  uint8_t buf[16];

  HIDWORD(v4) = a3;
  LODWORD(v4) = a3 + 536870288;
  switch((v4 >> 4))
  {
    case 0u:
      v7 = daemon_log(self);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Device can sleep", buf, 2u);
      }

      goto LABEL_8;
    case 1u:
      v9 = daemon_log(self);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Device will sleep", v18, 2u);
      }

      -[SDStatusMonitor postNotification:](self, "postNotification:", CFSTR("com.apple.sharingd.SystemWillSleep"));
LABEL_8:
      IOAllowPowerChange(self->_rootPort, (intptr_t)a4);
      return;
    case 2u:
      v11 = daemon_log(self);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Device will not sleep", v16, 2u);
      }

      v13 = CFSTR("com.apple.sharingd.SystemWillNotSleep");
      goto LABEL_15;
    case 9u:
      v14 = daemon_log(self);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Device has powered on", v17, 2u);
      }

      v13 = CFSTR("com.apple.sharingd.SystemHasPoweredOn");
LABEL_15:
      -[SDStatusMonitor postNotification:](self, "postNotification:", v13);
      break;
    default:
      return;
  }
}

- (void)installSleepWakeCallBack
{
  int DeviceClass;
  BOOL v4;
  IONotificationPort **p_notifyPortRef;
  uint64_t v6;
  __CFRunLoop *Main;
  __CFRunLoopSource *RunLoopSource;
  uint64_t v9;
  NSObject *v10;

  DeviceClass = GestaltGetDeviceClass(self, a2);
  if (self->_notifyPortRef)
    v4 = 1;
  else
    v4 = DeviceClass == 4;
  if (!v4)
  {
    p_notifyPortRef = &self->_notifyPortRef;
    v6 = IORegisterForSystemPower(self, &self->_notifyPortRef, (IOServiceInterestCallback)j__objc_msgSend_handleSleepWakeCallBack_messageArguement_, &self->_notifierObject);
    self->_rootPort = v6;
    if ((_DWORD)v6)
    {
      Main = CFRunLoopGetMain();
      RunLoopSource = IONotificationPortGetRunLoopSource(*p_notifyPortRef);
      CFRunLoopAddSource(Main, RunLoopSource, kCFRunLoopDefaultMode);
    }
    else
    {
      v9 = daemon_log(v6);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_1001D9924();

    }
  }
}

- (void)reloadSMBConfInfo
{
  __SCPreferences *smbPreferences;
  unsigned __int8 v4;
  id v5;
  id v6;
  id v7;
  id v8;
  _BOOL4 v9;
  const __CFString *v10;
  id v11;
  id v12;

  pthread_mutex_lock(&stru_1007B3728);
  smbPreferences = self->_smbPreferences;
  v11 = 0;
  v12 = 0;
  v4 = -[SDStatusMonitor smbConfiguration:netBiosName:workgroup:](self, "smbConfiguration:netBiosName:workgroup:", smbPreferences, &v12, &v11);
  v5 = v12;
  v6 = v12;
  v7 = v11;
  v8 = v11;
  if ((v4 & 1) != 0)
  {
    v9 = sub_1000CE998(self->_netbiosName, v6);
    if (v9)
      objc_storeStrong((id *)&self->_netbiosName, v5);
    if (sub_1000CE998(self->_workgroup, v8))
    {
      objc_storeStrong((id *)&self->_workgroup, v7);
      pthread_mutex_unlock(&stru_1007B3728);
      if (v9)
        -[SDStatusMonitor postNotification:](self, "postNotification:", CFSTR("com.apple.sharingd.NetbiosNameChanged"));
      v10 = CFSTR("com.apple.sharingd.WorkgroupChanged");
      goto LABEL_11;
    }
    pthread_mutex_unlock(&stru_1007B3728);
    if (v9)
    {
      v10 = CFSTR("com.apple.sharingd.NetbiosNameChanged");
LABEL_11:
      -[SDStatusMonitor postNotification:](self, "postNotification:", v10);
    }
  }
  else
  {
    pthread_mutex_unlock(&stru_1007B3728);
  }

}

- (BOOL)smbConfiguration:(__SCPreferences *)a3 netBiosName:(id *)a4 workgroup:(id *)a5
{
  return 0;
}

- (void)installSpringBoardStateMonitor
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1001D697C;
  v2[3] = &unk_10071AC48;
  v2[4] = self;
  SBSEventObserverInitialize(&_dispatch_main_q, v2);
  SBSEventObserverStartObservingEvent(SBSEventObserverEventDimmed);
  SBSEventObserverStartObservingEvent(SBSEventObserverEventUndimmed);
  SBSEventObserverStartObservingEvent(SBSEventObserverEventContinuityUIWasObscured);
  SBSEventObserverStartObservingEvent(SBSEventObserverEventContinuityUIBecameVisible);
}

- (void)installBacklightServicesMonitor
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  void *v6;
  uint8_t v7[16];

  v3 = daemon_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Installing backlight services monitor", v7, 2u);
  }

  v5 = -[objc_class sharedBacklight](off_1007B3780(), "sharedBacklight");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v6, "addObserver:", self);

}

- (void)backlight:(id)a3 activatingWithEvent:(id)a4
{
  uint64_t v5;
  NSObject *v6;

  v5 = daemon_log(self);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_1001D99B4();

  -[SDStatusMonitor screenOnStateChangedTo:](self, "screenOnStateChangedTo:", 1);
}

- (void)backlight:(id)a3 deactivatingWithEvent:(id)a4
{
  uint64_t v5;
  NSObject *v6;

  v5 = daemon_log(self);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_1001D99E0();

  -[SDStatusMonitor screenOnStateChangedTo:](self, "screenOnStateChangedTo:", 0);
}

- (void)screenOnStateChangedTo:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t Int64;
  BOOL v6;
  NSNumber *screenOn;
  unsigned int v8;
  NSNumber *v9;
  NSNumber *v10;
  uint64_t v11;
  NSNumber *v12;
  NSNumber *v13;
  uint64_t v14;
  NSObject *v15;
  unsigned int v16;
  const __CFString *v17;
  int v18;
  uint8_t buf[4];
  const __CFString *v20;

  v3 = a3;
  v18 = 0;
  Int64 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("disableFastScreenOnOffEvents"), &v18);
  if (v18)
    v6 = 1;
  else
    v6 = Int64 == 0;
  if (v6)
  {
    pthread_mutex_lock(&stru_1007B3728);
    screenOn = self->_screenOn;
    if (screenOn)
    {
      v8 = -[NSNumber BOOLValue](screenOn, "BOOLValue");
      v9 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
      v10 = self->_screenOn;
      self->_screenOn = v9;

      v11 = pthread_mutex_unlock(&stru_1007B3728);
      if (v8 == v3)
        return;
    }
    else
    {
      v12 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
      v13 = self->_screenOn;
      self->_screenOn = v12;

      v11 = pthread_mutex_unlock(&stru_1007B3728);
    }
    v14 = daemon_log(v11);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = -[NSNumber BOOLValue](self->_screenOn, "BOOLValue");
      v17 = CFSTR("Off");
      if (v16)
        v17 = CFSTR("On");
      *(_DWORD *)buf = 138412290;
      v20 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Screen state changed to %@", buf, 0xCu);
    }

    -[SDStatusMonitor postNotification:](self, "postNotification:", CFSTR("com.apple.sharingd.ScreenStateChanged"));
  }
}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvents:(id)a5 abortedEvents:(id)a6
{
  uint64_t v8;
  NSObject *v9;
  uint64_t Int64;
  _BOOL8 v11;
  NSNumber *screenOn;
  unsigned int v13;
  NSNumber *v14;
  NSNumber *v15;
  uint64_t v16;
  NSNumber *v17;
  NSNumber *v18;
  uint64_t v19;
  NSObject *v20;
  unsigned int v21;
  const __CFString *v22;
  int v23;
  uint8_t buf[4];
  const __CFString *v25;

  v8 = daemon_log(self);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_1001D9A0C(self, a4, v9);

  v23 = 0;
  Int64 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("disableFastScreenOnOffEvents"), &v23);
  if (!v23 && Int64)
  {
    pthread_mutex_lock(&stru_1007B3728);
    v11 = -[SDStatusMonitor isScreenOnForBacklightState:](self, "isScreenOnForBacklightState:", a4);
    screenOn = self->_screenOn;
    if (screenOn)
    {
      v13 = -[NSNumber BOOLValue](screenOn, "BOOLValue");
      v14 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v11));
      v15 = self->_screenOn;
      self->_screenOn = v14;

      v16 = pthread_mutex_unlock(&stru_1007B3728);
      if (v11 == v13)
        return;
    }
    else
    {
      v17 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v11));
      v18 = self->_screenOn;
      self->_screenOn = v17;

      v16 = pthread_mutex_unlock(&stru_1007B3728);
    }
    v19 = daemon_log(v16);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = -[NSNumber BOOLValue](self->_screenOn, "BOOLValue");
      v22 = CFSTR("Off");
      if (v21)
        v22 = CFSTR("On");
      *(_DWORD *)buf = 138412290;
      v25 = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Screen state changed to %@", buf, 0xCu);
    }

    -[SDStatusMonitor postNotification:](self, "postNotification:", CFSTR("com.apple.sharingd.ScreenStateChanged"));
  }
}

- (BOOL)isScreenOnForBacklightState:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  _BOOL4 v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v9[16];
  uint64_t v10;
  uint64_t v11;

  if ((unint64_t)a3 >= 4)
  {
    v10 = v3;
    v11 = v4;
    v6 = daemon_log(self);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unknown backlight state, please file a radar to Sharing | all", v9, 2u);
    }

    LOBYTE(v5) = 1;
  }
  else
  {
    return (0xCu >> (a3 & 0xF)) & 1;
  }
  return v5;
}

- (void)installSystemUIMonitor
{
  void *v3;
  void *v4;
  FBSDisplayLayoutMonitor *v5;
  FBSDisplayLayoutMonitor *systemUIMonitor;
  _QWORD v7[6];
  _QWORD v8[20];
  _QWORD v9[20];

  if (!self->_systemUIMonitor)
  {
    v8[0] = FBSDisplayLayoutElementControlCenterIdentifier;
    v8[1] = FBSDisplayLayoutElementLockScreenIdentifier;
    v9[0] = &off_10074BAC0;
    v9[1] = &off_10074BAD8;
    v8[2] = FBSDisplayLayoutElementNotificationCenterIdentifier;
    v8[3] = FBSDisplayLayoutElementSiriIdentifier;
    v9[2] = &off_10074BAF0;
    v9[3] = &off_10074BB08;
    v8[4] = SBSDisplayLayoutElementHomeScreenIdentifier;
    v8[5] = SBSDisplayLayoutElementAppSwitcherIdentifier;
    v9[4] = &off_10074BB20;
    v9[5] = &off_10074BB38;
    v8[6] = SBSDisplayLayoutElementSpotlightIdentifier;
    v8[7] = SBSDisplayLayoutElementNowPlayingIdentifier;
    v9[6] = &off_10074BB50;
    v9[7] = &off_10074BB68;
    v8[8] = SBSDisplayLayoutElementCarPlayOEMIdentifier;
    v8[9] = SBSDisplayLayoutElementLoginIdentifier;
    v9[8] = &off_10074BB80;
    v9[9] = &off_10074BB98;
    v8[10] = SBSDisplayLayoutElementPasscodeIdentifier;
    v8[11] = SBSDisplayLayoutElementTodayViewIdentifier;
    v9[10] = &off_10074BBB0;
    v9[11] = &off_10074BBC8;
    v8[12] = SBSDisplayLayoutElementLockScreenNavigationIdentifier;
    v8[13] = CFSTR("SBVoiceControlAlert");
    v9[12] = &off_10074BBE0;
    v9[13] = &off_10074BBF8;
    v8[14] = CFSTR("com.apple.SharingViewService");
    v8[15] = CFSTR("com.apple.camera");
    v9[14] = &off_10074BC10;
    v9[15] = &off_10074BC28;
    v8[16] = CFSTR("com.apple.InCallService");
    v8[17] = CFSTR("com.apple.CoreAuthUI");
    v9[16] = &off_10074BC40;
    v9[17] = &off_10074BC58;
    v8[18] = CFSTR("com.apple.purplebuddy");
    v8[19] = CFSTR("SBSpotlightAlert");
    v9[18] = &off_10074BC70;
    v9[19] = &off_10074BB50;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 20));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor](FBSDisplayLayoutMonitorConfiguration, "configurationForDefaultMainDisplayMonitor"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100008CE4;
    v7[3] = &unk_10071AC70;
    v7[4] = v3;
    v7[5] = self;
    objc_msgSend(v4, "setTransitionHandler:", v7);
    v5 = (FBSDisplayLayoutMonitor *)objc_claimAutoreleasedReturnValue(+[FBSDisplayLayoutMonitor monitorWithConfiguration:](FBSDisplayLayoutMonitor, "monitorWithConfiguration:", v4));
    systemUIMonitor = self->_systemUIMonitor;
    self->_systemUIMonitor = v5;

  }
}

- (void)installMirroringMonitor
{
  void *v3;
  FBSDisplayLayoutMonitor *v4;
  FBSDisplayLayoutMonitor *mirroringMonitor;
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FBSDisplayLayoutMonitorConfiguration configurationForContinuityDisplay](FBSDisplayLayoutMonitorConfiguration, "configurationForContinuityDisplay"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001D7360;
  v6[3] = &unk_10071AC98;
  v6[4] = self;
  objc_msgSend(v3, "setTransitionHandler:", v6);
  v4 = (FBSDisplayLayoutMonitor *)objc_claimAutoreleasedReturnValue(+[FBSDisplayLayoutMonitor monitorWithConfiguration:](FBSDisplayLayoutMonitor, "monitorWithConfiguration:", v3));
  mirroringMonitor = self->_mirroringMonitor;
  self->_mirroringMonitor = v4;

}

- (void)installUILockStatusMonitor
{
  _QWORD handler[5];

  if (!self->_uiLockStatusToken)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1001D74EC;
    handler[3] = &unk_100714EC8;
    handler[4] = self;
    notify_register_dispatch(kSBSLockStateNotifyKey, &self->_uiLockStatusToken, (dispatch_queue_t)&_dispatch_main_q, handler);
  }
}

- (void)installUltraWideBandStateMonitor
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "handleRapportStatusChanged", CFSTR("com.apple.sharingd.RapportStatusChanged"), 0);

}

- (void)handleRapportStatusChanged
{
  -[SDStatusMonitor postNotification:](self, "postNotification:", CFSTR("com.apple.sharingd.UltraWideBandStateChanged"));
}

- (unint64_t)ultraWideBandState
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDRapportBrowser sharedRapportBrowser](SDRapportBrowser, "sharedRapportBrowser"));
  v3 = objc_msgSend(v2, "ultraWideBandState");

  return (unint64_t)v3;
}

- (void)updateWatchWristState:(int64_t)a3
{
  int64_t watchWristState;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;

  watchWristState = self->_watchWristState;
  self->_watchWristState = a3;
  if (watchWristState != a3)
  {
    v6 = daemon_log(self);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor stringForWatchWristState:](self, "stringForWatchWristState:", a3));
      v9 = 138412290;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Watch wrist state changed: %@", (uint8_t *)&v9, 0xCu);

    }
    -[SDStatusMonitor postNotification:](self, "postNotification:", CFSTR("com.apple.sharingd.WristStateChanged"));
  }
}

- (int64_t)watchWristState
{
  return self->_watchWristState;
}

- (id)stringForWatchWristState:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("Unexpected");
  else
    return *(&off_10071AE20 + a3);
}

- (void)handleWiFiPasswordSharingChanged
{
  notify_post((const char *)objc_msgSend(SFPasswordSharingAvailabilityNotification, "UTF8String"));
}

- (void)installWiFiPasswordSharingMonitor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "handleWiFiPasswordSharingChanged", CFSTR("com.apple.sharingd.BluetoothPowerChanged"), 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "handleWiFiPasswordSharingChanged", CFSTR("com.apple.sharingd.AppleIDChanged"), 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "handleWiFiPasswordSharingChanged", CFSTR("com.apple.sharingd.AppleAccountSignIn"), 0);

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "handleWiFiPasswordSharingChanged", CFSTR("com.apple.sharingd.AppleAccountSignOut"), 0);

}

- (void)installSSIDCacheMonitor
{
  const __SCPreferences *v3;
  const __SCPreferences *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  SCPreferencesContext v12;
  uint8_t buf[4];
  const char *v14;

  v3 = SCPreferencesCreateWithAuthorization(0, CFSTR("com.apple.sharingd"), CFSTR("com.apple.wifi.plist"), 0);
  if (v3)
  {
    v4 = v3;
    v12.version = 0;
    memset(&v12.retain, 0, 24);
    v12.info = self;
    v5 = SCPreferencesSetCallback(v3, (SCPreferencesCallBack)sub_1001D7A44, &v12);
    v6 = SCPreferencesSetDispatchQueue(v4, (dispatch_queue_t)&_dispatch_main_q);
    v7 = daemon_log(v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = "yes";
      if (!v5)
        v9 = "no";
      *(_DWORD *)buf = 136315138;
      v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SSID cache monitor successfully installed: %s", buf, 0xCu);
    }

    CFRelease(v4);
  }
  else
  {
    v10 = daemon_log(0);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1001D9B00();

  }
}

- (void)clearWirelessState
{
  NSNumber *deviceSupportsWAPI;

  pthread_mutex_lock(&stru_1007B3728);
  deviceSupportsWAPI = self->_deviceSupportsWAPI;
  self->_deviceSupportsWAPI = 0;

  pthread_mutex_unlock(&stru_1007B3728);
}

- (void)logWiFiPowerState
{
  uint64_t v3;
  NSObject *v4;
  unsigned int v5;
  const char *v6;
  int v7;
  const char *v8;

  v3 = daemon_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[SDStatusMonitor wirelessEnabled](self, "wirelessEnabled");
    v6 = "off";
    if (v5)
      v6 = "on";
    v7 = 136315138;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Wi-Fi power is now %s", (uint8_t *)&v7, 0xCu);
  }

}

- (BOOL)_isEveryoneModeExpired
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor _everyoneModeExpiryDate](self, "_everyoneModeExpiryDate"));
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "laterDate:", v2));
    v5 = objc_msgSend(v4, "isEqualToDate:", v3);

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (id)_everyoneModeExpiryDate
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint8_t v15[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("EveryoneModeUpdateTime")));

  if (v4)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 1209600.0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "laterDate:", v6));
    v8 = objc_msgSend(v7, "isEqualToDate:", v4);

    if (!v8)
    {
      -[SDStatusMonitor _everyoneModeExpiryInterval](self, "_everyoneModeExpiryInterval");
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateByAddingTimeInterval:"));
      goto LABEL_10;
    }
    v10 = daemon_log(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Everyone mode updated date too far in future", v15, 2u);
    }

  }
  else
  {
    v12 = daemon_log(v5);
    v6 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Everyone mode updated date not present", buf, 2u);
    }
  }
  v13 = 0;
LABEL_10:

  return v13;
}

- (void)_checkEveryoneModeExpiry
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = SFDeviceTimeLimitEveryoneMode(self, a2);
  if ((_DWORD)v3 && !self->_currentDiscoverableMode)
  {
    v4 = daemon_log(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Checking initial everyone mode expiry", v6, 2u);
    }

    if (-[SDStatusMonitor _isEveryoneModeExpired](self, "_isEveryoneModeExpired"))
      -[SDStatusMonitor _expireEveryoneModeAndOnlySetDefault:](self, "_expireEveryoneModeAndOnlySetDefault:", 1);
    else
      -[SDStatusMonitor _scheduleCheckForEveryoneModeExpiry](self, "_scheduleCheckForEveryoneModeExpiry");
  }
}

- (void)_expireEveryoneModeAndOnlySetDefault:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = kSFOperationDiscoverableModeKey;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", kSFOperationDiscoverableModeKey));

  v8 = objc_msgSend(v7, "isEqual:", kSFOperationDiscoverableModeEveryone);
  v9 = (void *)kSFOperationDiscoverableModeContactsOnly;
  if (!v8)
    v9 = v7;
  v10 = v9;
  v11 = daemon_log(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Everyone mode expired - setting to %@", (uint8_t *)&v14, 0xCu);
  }

  if (v3)
  {
    pthread_mutex_lock(&stru_1007B3728);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v13, "setObject:forKey:", v10, v6);
    objc_msgSend(v13, "synchronize");
    pthread_mutex_unlock(&stru_1007B3728);

  }
  else
  {
    -[SDStatusMonitor setDiscoverableMode:](self, "setDiscoverableMode:", v10);
  }
  -[SDStatusMonitor _cancelCheckForEveryoneModeExpiry](self, "_cancelCheckForEveryoneModeExpiry");

}

- (void)_updateEveryoneModeExpiryDateOnChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  void *v12;

  v4 = a3;
  if (SFDeviceTimeLimitEveryoneMode(v4, v5))
  {
    if (objc_msgSend(v4, "isEqual:", kSFOperationDiscoverableModeEveryone))
    {
      pthread_mutex_lock(&stru_1007B3728);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("EveryoneModeUpdateTime"));
      objc_msgSend(v7, "synchronize");
      v8 = pthread_mutex_unlock(&stru_1007B3728);
      v9 = daemon_log(v8);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138412290;
        v12 = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Updating everyone mode updated date %@", (uint8_t *)&v11, 0xCu);
      }

      -[SDStatusMonitor _scheduleCheckForEveryoneModeExpiry](self, "_scheduleCheckForEveryoneModeExpiry");
    }
    else
    {
      -[SDStatusMonitor _cancelCheckForEveryoneModeExpiry](self, "_cancelCheckForEveryoneModeExpiry");
    }
  }

}

- (void)_scheduleCheckForEveryoneModeExpiry
{
  void *v3;
  void *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *airDropEveryoneModeExpiryTimer;
  NSObject *v7;
  id v8;
  double v9;
  double v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  _QWORD handler[5];
  uint8_t buf[4];
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", kSFOperationDiscoverableModeKey));

  if (!self->_airDropEveryoneModeExpiryTimer
    && objc_msgSend(v4, "isEqual:", kSFOperationDiscoverableModeEveryone))
  {
    pthread_mutex_lock(&stru_1007B3728);
    v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
    airDropEveryoneModeExpiryTimer = self->_airDropEveryoneModeExpiryTimer;
    self->_airDropEveryoneModeExpiryTimer = v5;

    v7 = self->_airDropEveryoneModeExpiryTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1001D82F8;
    handler[3] = &unk_1007146D8;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    v8 = -[SDStatusMonitor _currentEveryoneModeExpiryInterval](self, "_currentEveryoneModeExpiryInterval");
    v10 = v9;
    v11 = daemon_log(v8);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v10));
      *(_DWORD *)buf = 138412290;
      v16 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Scheduling everyone mode expiry handler for interval %@", buf, 0xCu);

    }
    SFDispatchTimerSet(self->_airDropEveryoneModeExpiryTimer, v10, -1.0, 0.0);
    dispatch_resume((dispatch_object_t)self->_airDropEveryoneModeExpiryTimer);
    pthread_mutex_unlock(&stru_1007B3728);
  }

}

- (void)_cancelCheckForEveryoneModeExpiry
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  OS_dispatch_source *airDropEveryoneModeExpiryTimer;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  if (self->_airDropEveryoneModeExpiryTimer)
  {
    v3 = pthread_mutex_lock(&stru_1007B3728);
    v4 = daemon_log(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Cancelling scheduled everyone mode expiry handler", buf, 2u);
    }

    dispatch_source_cancel((dispatch_source_t)self->_airDropEveryoneModeExpiryTimer);
    airDropEveryoneModeExpiryTimer = self->_airDropEveryoneModeExpiryTimer;
    self->_airDropEveryoneModeExpiryTimer = 0;

    pthread_mutex_unlock(&stru_1007B3728);
  }
  else
  {
    v7 = daemon_log(self);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Everyone mode expiry handler already cancelled", v9, 2u);
    }

  }
}

- (double)_everyoneModeExpiryInterval
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  if (!IsAppleInternalBuild(self, a2))
    return 600.0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("EveryoneModeExpiryTimeInterval")));

  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 600.0;
  }

  return v5;
}

- (double)_currentEveryoneModeExpiryInterval
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor _everyoneModeExpiryDate](self, "_everyoneModeExpiryDate"));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "timeIntervalSinceNow");
    if (v4 >= 0.0)
      v5 = v4;
    else
      v5 = 0.0;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (NSDictionary)awdlState
{
  return (NSDictionary *)objc_getProperty(self, a2, 696, 1);
}

- (NSDate)lastDarkWakeDate
{
  return (NSDate *)objc_getProperty(self, a2, 704, 1);
}

- (NSSet)effectiveBlockedAppBundleIDs
{
  return (NSSet *)objc_getProperty(self, a2, 712, 1);
}

- (BOOL)computerToComputer
{
  return self->_computerToComputer;
}

- (BOOL)controlCenterVisible
{
  return self->_controlCenterVisible;
}

- (BOOL)multipleUsersLoggedIn
{
  return self->_multipleUsersLoggedIn;
}

- (BOOL)wirelessAccessPoint
{
  return self->_wirelessAccessPoint;
}

- (BOOL)wirelessCritical
{
  return self->_wirelessCritical;
}

- (BOOL)isWifiPersonalHotspot
{
  return self->_isWifiPersonalHotspot;
}

- (BOOL)isUsing2GHzWifi
{
  return self->_isUsing2GHzWifi;
}

- (BOOL)isMirroringActive
{
  return self->_isMirroringActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectiveBlockedAppBundleIDs, 0);
  objc_storeStrong((id *)&self->_lastDarkWakeDate, 0);
  objc_storeStrong((id *)&self->_awdlState, 0);
  objc_storeStrong((id *)&self->___meCard, 0);
  objc_storeStrong((id *)&self->_wifiInterfaceMonitor, 0);
  objc_storeStrong((id *)&self->_mkbOptions, 0);
  objc_storeStrong((id *)&self->_radiosPreferences, 0);
  objc_storeStrong((id *)&self->_mirroringMonitor, 0);
  objc_storeStrong((id *)&self->_systemUIMonitor, 0);
  objc_storeStrong((id *)&self->_coreTelephonySignalStrength, 0);
  objc_storeStrong((id *)&self->_coreTelephonySIMStatus, 0);
  objc_storeStrong((id *)&self->_coreTelephonyDataStatus, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_carKitSessionStatus, 0);
  objc_storeStrong((id *)&self->_bluetoothController, 0);
  objc_storeStrong((id *)&self->_smartCoverMonitor, 0);
  objc_storeStrong((id *)&self->_preventLocaleRestart, 0);
  objc_storeStrong((id *)&self->_workgroup, 0);
  objc_storeStrong((id *)&self->__systemMonitor, 0);
  objc_storeStrong((id *)&self->_ssidHashes, 0);
  objc_storeStrong((id *)&self->_serverNames, 0);
  objc_storeStrong((id *)&self->_screenOn, 0);
  objc_storeStrong((id *)&self->_personalHotspotAllowed, 0);
  objc_storeStrong((id *)&self->_personalHotspotFamilyStates, 0);
  objc_storeStrong((id *)&self->_personalHotspotAutoState, 0);
  objc_storeStrong((id *)&self->_odisksMountPoints, 0);
  objc_storeStrong((id *)&self->_netbiosName, 0);
  objc_storeStrong((id *)&self->_myPhoneHashes, 0);
  objc_storeStrong((id *)&self->_myEmailHashes, 0);
  objc_storeStrong((id *)&self->_myAppleIDCommonName, 0);
  objc_storeStrong((id *)&self->_myAppleID, 0);
  objc_storeStrong((id *)&self->_mountPoints, 0);
  objc_storeStrong((id *)&self->_localHostName, 0);
  objc_storeStrong((id *)&self->_identities, 0);
  objc_storeStrong((id *)&self->_handoffVisible, 0);
  objc_destroyWeak((id *)&self->_finderServer);
  objc_storeStrong((id *)&self->_deviceUIUnlocked, 0);
  objc_storeStrong((id *)&self->_deviceSupportsWAPI, 0);
  objc_storeStrong((id *)&self->_deviceKeyBagState, 0);
  objc_storeStrong((id *)&self->_deviceInformation, 0);
  objc_storeStrong((id *)&self->_currentDiscoverableMode, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_contactHashManager, 0);
  objc_storeStrong((id *)&self->_consoleUser, 0);
  objc_storeStrong((id *)&self->_computerName, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_bonjourName, 0);
  objc_storeStrong((id *)&self->_backlightOn, 0);
  objc_storeStrong((id *)&self->_nextAirDropID, 0);
  objc_storeStrong((id *)&self->_airDropEveryoneModeExpiryTimer, 0);
  objc_storeStrong((id *)&self->_airDropAllowed, 0);
}

- (BOOL)screenStateSupportsAirDrop
{
  SDStatusMonitor *v2;
  unsigned __int8 v3;

  v2 = self;
  if (-[SDStatusMonitor screenOn](v2, "screenOn"))
    v3 = 1;
  else
    v3 = -[SDStatusMonitor isMirroringActive](v2, "isMirroringActive");

  return v3;
}

@end
