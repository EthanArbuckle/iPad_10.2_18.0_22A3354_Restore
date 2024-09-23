@implementation FMDSystemConfig

+ (id)sharedInstance
{
  if (qword_1003064E0 != -1)
    dispatch_once(&qword_1003064E0, &stru_1002C2360);
  return (id)qword_1003064D8;
}

- (id)initSingleton
{
  FMDSystemConfig *v2;
  FMDSystemConfig *v3;
  dispatch_queue_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FMDSystemConfig;
  v2 = -[FMDSystemConfig init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    -[FMDSystemConfig initializeSystemConfig](v2, "initializeSystemConfig");
    v4 = dispatch_queue_create("com.apple.icloud.findmydevice-system-info", 0);
    -[FMDSystemConfig setSystemInfoQueue:](v3, "setSystemInfoQueue:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v3, "baUUIDMayHaveChanged", CFSTR("kFMDDeviceSPSelfBeaconChangeNotification"), 0);

  }
  return v3;
}

- (void)baUUIDMayHaveChanged
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[FMDSystemConfig systemInfoQueue](self, "systemInfoQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B764;
  block[3] = &unk_1002C1328;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)initializeSystemConfig
{
  self->_internalBAStatus = 1;
}

- (NSString)deviceName
{
  return 0;
}

- (NSString)deviceClassString
{
  return 0;
}

- (int64_t)deviceClass
{
  return 0;
}

- (NSString)deviceUDID
{
  return 0;
}

- (NSString)idsDeviceID
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;

  v2 = (void *)qword_1003064E8;
  if (!qword_1003064E8)
  {
    v3 = IDSCopyLocalDeviceUniqueID(0, a2);
    v4 = (void *)qword_1003064E8;
    qword_1003064E8 = v3;

    v2 = (void *)qword_1003064E8;
    if (!qword_1003064E8)
    {
      v5 = sub_1000031B8();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_100227054(v6);

      v2 = (void *)qword_1003064E8;
    }
  }
  return (NSString *)v2;
}

- (NSString)productType
{
  return 0;
}

- (NSString)productName
{
  return 0;
}

- (NSString)productVersion
{
  return 0;
}

- (NSString)buildVersion
{
  return 0;
}

- (NSString)platform
{
  return 0;
}

- (BOOL)isLocationServicesEnabled
{
  return 0;
}

- (BOOL)isLocationServicesCapable
{
  return 1;
}

- (BOOL)isBuddyDone
{
  return 0;
}

- (NSString)recoveryBuildVersion
{
  return 0;
}

- (NSString)recoveryProductVersion
{
  return 0;
}

- (BOOL)isRunningInRecovery
{
  return 0;
}

- (BOOL)isRunningInLocked
{
  return 0;
}

- (NSString)recoveryBootState
{
  return 0;
}

- (NSString)deviceColor
{
  return 0;
}

- (NSString)deviceEnclosureColor
{
  return 0;
}

- (NSString)coverGlassColor
{
  return 0;
}

- (NSString)housingColor
{
  return 0;
}

- (NSString)backOfEnclosureColor
{
  return 0;
}

- (BOOL)hasSecureElement
{
  return 0;
}

- (BOOL)hasNFC
{
  return 0;
}

- (NSString)internationalMobileEquipmentIdentity
{
  return 0;
}

- (NSString)internationalMobileEquipmentIdentityTwo
{
  return 0;
}

- (NSString)mobileEquipmentIdentifier
{
  return 0;
}

- (NSString)serialNumber
{
  return 0;
}

- (NSString)mlbSerialNumber
{
  return 0;
}

- (id)fetchBaUUIDWithTimeout:(double)a3
{
  NSString *internalBAUUID;
  NSObject *v6;
  _QWORD v8[6];

  internalBAUUID = self->_internalBAUUID;
  if (!internalBAUUID)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[FMDSystemConfig systemInfoQueue](self, "systemInfoQueue"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10002B984;
    v8[3] = &unk_1002C1460;
    *(double *)&v8[5] = a3;
    v8[4] = self;
    dispatch_sync(v6, v8);

    internalBAUUID = self->_internalBAUUID;
  }
  return internalBAUUID;
}

- (id)fetchBaUUIDBeforeFirstRegister
{
  return -[FMDSystemConfig fetchBaUUIDWithTimeout:](self, "fetchBaUUIDWithTimeout:", 60.0);
}

- (NSString)baUUID
{
  return (NSString *)-[FMDSystemConfig fetchBaUUIDWithTimeout:](self, "fetchBaUUIDWithTimeout:", 5.0);
}

- (unint64_t)baRegistrationStatus
{
  unint64_t result;
  void *v4;
  void *v5;
  id v6;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, void *);
  void *v10;
  FMDSystemConfig *v11;
  id v12;

  result = self->_internalBAStatus;
  if (result == 1)
  {
    v4 = (void *)objc_opt_new(SPOwnerInterface);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "settingsConfiguration"));

    v7 = _NSConcreteStackBlock;
    v8 = 3221225472;
    v9 = sub_10002BBE0;
    v10 = &unk_1002C23B0;
    v11 = self;
    v12 = objc_msgSend(objc_alloc((Class)FMSynchronizer), "initWithDescription:andTimeout:", CFSTR("SP-BA-STATUS"), 5.0);
    v6 = v12;
    objc_msgSend(v5, "beginRefreshingServiceStateWithBlock:", &v7);
    objc_msgSend(v6, "wait", v7, v8, v9, v10, v11);

    return self->_internalBAStatus;
  }
  return result;
}

- (BOOL)isInAirplaneMode
{
  return 0;
}

- (BOOL)isPasscodeSet
{
  return 0;
}

- (BOOL)isPasscodeChangeRestricted
{
  return 0;
}

- (BOOL)isLocked
{
  return 0;
}

- (unint64_t)unlockState
{
  return 0;
}

- (BOOL)isLocking
{
  return 0;
}

- (NSString)currentPasscodeConstraintStr
{
  return (NSString *)CFSTR("simple");
}

- (BOOL)isRegionMonitoringAvailable
{
  return 0;
}

- (NSString)timezone
{
  return 0;
}

- (NSString)locale
{
  return 0;
}

- (BOOL)hasCellularCapability
{
  return 0;
}

- (BOOL)isRoseCapable
{
  return 0;
}

- (NSNumber)deletablePlans
{
  return (NSNumber *)&off_1002D7FF0;
}

- (BOOL)allowsActivationLock
{
  return 1;
}

- (NSData)escrowHash
{
  return 0;
}

- (NSString)deviceModel
{
  return 0;
}

- (NSString)deviceRegion
{
  return 0;
}

- (BOOL)isLowPowerModeEnabled
{
  return 0;
}

- (int64_t)connectionStatus
{
  return 0;
}

- (NSNumber)suinfoLastModifiedTimestamp
{
  return 0;
}

- (id)stringForConnectionStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
    return CFSTR("Unknown");
  else
    return *(&off_1002C23D0 + a3 - 1);
}

- (NSString)wristStatusString
{
  return 0;
}

- (unint64_t)pairingType
{
  return 1;
}

- (int)processIdentifier
{
  void *v2;
  int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v3 = objc_msgSend(v2, "processIdentifier");

  return v3;
}

- (BOOL)canHandleLocates
{
  return self->_canHandleLocates;
}

- (unint64_t)fileVaultStatus
{
  return self->_fileVaultStatus;
}

- (NSString)rootVolumeUUID
{
  return self->_rootVolumeUUID;
}

- (NSNumber)secureElementId
{
  return self->_secureElementId;
}

- (NSNumber)ecid
{
  return self->_ecid;
}

- (NSNumber)chipId
{
  return self->_chipId;
}

- (NSString)wifiMacAddress
{
  return self->_wifiMacAddress;
}

- (NSString)btMacAddress
{
  return self->_btMacAddress;
}

- (unint64_t)activationLockAllowedState
{
  return self->_activationLockAllowedState;
}

- (unint64_t)alCapability
{
  return self->_alCapability;
}

- (BOOL)isLocationServicesEnabledForShareMyLocation
{
  return self->_isLocationServicesEnabledForShareMyLocation;
}

- (BOOL)isFMIPLocationServicesEnabled
{
  return self->_isFMIPLocationServicesEnabled;
}

- (OS_dispatch_queue)systemInfoQueue
{
  return self->_systemInfoQueue;
}

- (void)setSystemInfoQueue:(id)a3
{
  objc_storeStrong((id *)&self->_systemInfoQueue, a3);
}

- (NSString)internalBAUUID
{
  return self->_internalBAUUID;
}

- (void)setInternalBAUUID:(id)a3
{
  objc_storeStrong((id *)&self->_internalBAUUID, a3);
}

- (unint64_t)internalBAStatus
{
  return self->_internalBAStatus;
}

- (void)setInternalBAStatus:(unint64_t)a3
{
  self->_internalBAStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalBAUUID, 0);
  objc_storeStrong((id *)&self->_systemInfoQueue, 0);
  objc_storeStrong((id *)&self->_btMacAddress, 0);
  objc_storeStrong((id *)&self->_wifiMacAddress, 0);
  objc_storeStrong((id *)&self->_chipId, 0);
  objc_storeStrong((id *)&self->_ecid, 0);
  objc_storeStrong((id *)&self->_secureElementId, 0);
  objc_storeStrong((id *)&self->_rootVolumeUUID, 0);
}

@end
