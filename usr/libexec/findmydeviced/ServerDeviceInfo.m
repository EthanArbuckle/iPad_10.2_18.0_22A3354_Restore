@implementation ServerDeviceInfo

+ (id)sharedInstance
{
  if (qword_100306518 != -1)
    dispatch_once(&qword_100306518, &stru_1002C2C18);
  return (id)qword_100306510;
}

- (id)deviceInfoForAccount:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (a3)
  {
    v4 = a3;
    v5 = objc_alloc_init((Class)NSMutableDictionary);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ServerDeviceInfo _nonVolatileDeviceInfoForAccount:](self, "_nonVolatileDeviceInfoForAccount:", v4));
    objc_msgSend(v5, "addEntriesFromDictionary:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ServerDeviceInfo _volatileDeviceInfoForAccount:completedFirstRegister:](self, "_volatileDeviceInfoForAccount:completedFirstRegister:", v4, 1));
    objc_msgSend(v5, "addEntriesFromDictionary:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ServerDeviceInfo _nonCriticalDeviceInfoForAccount:](self, "_nonCriticalDeviceInfoForAccount:", v4));
    objc_msgSend(v5, "addEntriesFromDictionary:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ServerDeviceInfo _accessoryConfigurationDeviceInfo](self, "_accessoryConfigurationDeviceInfo"));
    objc_msgSend(v5, "addEntriesFromDictionary:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMDPreferencesMgr deviceInfoOverrides](FMDPreferencesMgr, "deviceInfoOverrides"));
    if (v10)
      objc_msgSend(v5, "addEntriesFromDictionary:", v10);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)registrationDigestDeviceInfoForAccount:(id)a3 completedFirstRegister:(BOOL)a4
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ServerDeviceInfo _volatileDeviceInfoForAccount:completedFirstRegister:](self, "_volatileDeviceInfoForAccount:completedFirstRegister:", a3, a4));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("bioLock"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("unlockState"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("wristStatus"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("lowPowerMode"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("connectionStatus"));
  return v4;
}

- (id)locationDeviceInfoForAccount:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServerDeviceInfo deviceInfoForAccount:](self, "deviceInfoForAccount:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMDPreferencesMgr locationDeviceInfoOverrides](FMDPreferencesMgr, "locationDeviceInfoOverrides"));
  if (v4)
    objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  return v3;
}

- (id)identityDeviceInfoForAccount:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceUDID"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("udid"), v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMDDaemon sharedInstance](FMDDaemon, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "apsEnvironmentConstant"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "apsHandlerForEnvironment:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "apsToken"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("aps-token"), v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "alCapability")));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("alCapability"), v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "suinfoLastModifiedTimestamp"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("pscSUILastModified"), v14);

  return v4;
}

- (id)deviceInfoForAccount:(id)a3 accessory:(id)a4
{
  void *v5;
  id v6;
  void *v7;

  if (a4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "deviceInfo", a3));
    v6 = objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v6, "fm_safelyMapKey:toObject:", CFSTR("aps-token"), CFSTR("TOKEN"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ServerDeviceInfo _accessoryConfigurationDeviceInfo](self, "_accessoryConfigurationDeviceInfo"));
    objc_msgSend(v6, "addEntriesFromDictionary:", v7);

  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[ServerDeviceInfo deviceInfoForAccount:](self, "deviceInfoForAccount:", a3));
  }
  return v6;
}

- (id)locationDeviceInfoForAccount:(id)a3 accessory:(id)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "locationDeviceInfo", a3));
  v5 = objc_msgSend(v4, "mutableCopy");

  return v5;
}

- (id)lastKnownLocationDeviceInfoForAccount:(id)a3 accessory:(id)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "lastKnownLocationDeviceInfo", a3));
  v5 = objc_msgSend(v4, "mutableCopy");

  return v5;
}

- (id)completeDeviceInfoForAccount:(id)a3 accessory:(id)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "completeDeviceInfo", a3));
  v5 = objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "fm_safelyMapKey:toObject:", CFSTR("aps-token"), CFSTR("TOKEN"));
  return v5;
}

- (id)_volatileDeviceInfoForAccount:(id)a3 completedFirstRegister:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  EmbeddedOSSupport *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  unsigned int v59;
  void *v60;
  void *v61;
  unsigned __int8 v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  double v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v90;
  void *v91;

  v4 = a4;
  v5 = a3;
  v6 = objc_alloc_init((Class)NSMutableDictionary);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v7, "isLocationServicesEnabled")));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("locationServicesEnabled"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v9, "isFMIPLocationServicesEnabled")));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("fmipLS"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "deviceName"));
  objc_msgSend(v6, "fm_safelyMapKey:toObject:", CFSTR("deviceName"), v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "timezone"));
  objc_msgSend(v6, "fm_safelyMapKey:toObject:", CFSTR("timezone"), v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "locale"));
  objc_msgSend(v6, "fm_safelyMapKey:toObject:", CFSTR("locale"), v16);

  v17 = objc_alloc_init(EmbeddedOSSupport);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[EmbeddedOSSupport bioLockState](v17, "bioLockState"));
  objc_msgSend(v6, "fm_safelyMapKey:toObject:", CFSTR("bioLock"), v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[FMDDaemon sharedInstance](FMDDaemon, "sharedInstance"));
  v20 = objc_msgSend(v19, "isFirstRunAfterBoot");
  if (v20 && v4)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
    v22 = objc_msgSend(v21, "unlockState");

    if (v22 != (id)1)
    {
LABEL_4:
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance", self));
      v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "baUUID"));
      goto LABEL_7;
    }
  }
  else
  {

    if (!v20)
      goto LABEL_4;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance", self));
  v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "fetchBaUUIDBeforeFirstRegister"));
LABEL_7:
  v25 = (void *)v24;
  objc_msgSend(v6, "fm_safelyMapKey:toObject:", CFSTR("baUUID"), v24);

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v26, "baRegistrationStatus")));
  objc_msgSend(v6, "fm_safelyMapKey:toObject:", CFSTR("baStatus"), v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[FMDLocalActivationLockInfoManager sharedInstance](FMDLocalActivationLockInfoManager, "sharedInstance"));
  v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "maskedAppleIDValue"));

  v91 = (void *)v29;
  objc_msgSend(v6, "fm_safelyMapKey:toObject:", CFSTR("maskedAppleID"), v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[FMDLostModeManager sharedInstance](FMDLostModeManager, "sharedInstance"));
  v31 = objc_msgSend(v30, "lostModeEnabled");

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v31));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v32, CFSTR("lostModeEnabled"));

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "locationTracker"));

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v34, "trackingStatus")));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v35, CFSTR("trackingStatus"));

  if (objc_msgSend(v34, "isTrackingOn"))
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v34, "trackNotifyEnabled")));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v36, CFSTR("trackNotifyEnabled"));

  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v37, "isFMIPLocationServicesEnabled")));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v38, CFSTR("fmipLS"));

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v39, "isLocationServicesEnabledForShareMyLocation")));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v40, CFSTR("smlLS"));

  objc_msgSend(v6, "fm_safelyMapKey:toObject:", CFSTR("fmipVersion"), CFSTR("517"));
  objc_msgSend(v6, "fm_safelyMapKey:toObject:", CFSTR("fmipBuildVersion"), CFSTR("5.0"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "username"));
  objc_msgSend(v6, "fm_safelyMapKey:toObject:", CFSTR("appleId"), v41);

  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountAddTime"));
  if (v42)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountAddTime"));
    objc_msgSend(v43, "timeIntervalSince1970");
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", floor(v44)));
    objc_msgSend(v6, "fm_safelyMapKey:toObject:", CFSTR("enableTS"), v45);

  }
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v47 = objc_msgSend(v46, "allowsActivationLock");

  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v47));
  objc_msgSend(v6, "fm_safelyMapKey:toObject:", CFSTR("activationLock"), v48);

  v49 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v49, "hasCellularCapability")));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v50, CFSTR("hasCellularCapability"));

  v51 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v52 = objc_msgSend(v51, "isPasscodeSet");

  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v52));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v53, CFSTR("passcodeIsSet"));

  v54 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "currentPasscodeConstraintStr"));
  objc_msgSend(v6, "fm_safelyMapKey:toObject:", CFSTR("passcodeConstraint"), v55);

  if ((_DWORD)v52)
  {
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v56, "unlockState")));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v57, CFSTR("unlockState"));

  }
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v59 = objc_msgSend(v58, "isPasscodeChangeRestricted");

  if (v59)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("passcodeRestricted"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "_constructPairedDevicesInfo"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v60, CFSTR("otherDevices"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  if (!objc_msgSend(v61, "isInternalBuild"))
  {

    goto LABEL_19;
  }
  v62 = +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("DisableRemoteAccessoryConfig"), kFMDNotBackedUpPrefDomain);

  if ((v62 & 1) == 0)
  {
LABEL_19:
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "supportedAccessoryRegistry"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "supportedAccessoriesVersion"));

    objc_msgSend(v6, "fm_safelyMapKey:toObject:", CFSTR("accConfigVersion"), v65);
  }
  v66 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "suinfoLastModifiedTimestamp"));
  objc_msgSend(v6, "fm_safelyMapKey:toObject:", CFSTR("pscSUILastModified"), v67);

  v68 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v68, "alCapability")));
  objc_msgSend(v6, "fm_safelyMapKey:toObject:", CFSTR("alCapability"), v69);

  v70 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "ecid"));
  objc_msgSend(v6, "fm_safelyMapKey:toObject:", CFSTR("ecid"), v71);

  v72 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "chipId"));
  objc_msgSend(v6, "fm_safelyMapKey:toObject:", CFSTR("chipId"), v73);

  v74 = v5;
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "lastIdentityTime"));
  v76 = v75;
  if (v75)
  {
    objc_msgSend(v75, "timeIntervalSince1970");
    v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v77 * 1000.0));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v78, CFSTR("lastIdentityTime"));

  }
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "lastUnregisterFailedTime"));
  v80 = v79;
  if (v79)
  {
    objc_msgSend(v79, "timeIntervalSince1970");
    v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v81 * 1000.0));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v82, CFSTR("lastUnlockActivationFailedTime"));

  }
  v83 = objc_msgSend(v74, "fmipEnableContext");
  if (v83)
  {
    v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v83));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v84, CFSTR("fmipEnableReason"));

  }
  v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v74, "lowBatteryLocateEnabled")));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v85, CFSTR("lowBatteryLocate"));

  v86 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v86, "isLowPowerModeEnabled")));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v87, CFSTR("lowPowerMode"));

  return v6;
}

- (id)_nonVolatileDeviceInfoForAccount:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  unsigned __int8 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "idsDeviceID"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("deviceDiscoveryId"), v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "deviceUDID"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("udid"), v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deviceClassString"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("deviceClass"), v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "productType"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("productType"), v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "buildVersion"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("buildVersion"), v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "productVersion"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("productVersion"), v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "platform"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("platform"), v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v19, "isInternalBuild")));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("isInternal"), v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "serialNumber"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("serialNumber"), v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "mlbSerialNumber"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("mlbSerialNumber"), v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "versionHistory"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "componentsJoinedByString:", CFSTR(",")));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("versionHistory"), v26);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("supportsLostModeV2"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("findMyiPhone"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  if (objc_msgSend(v27, "isInternalBuild"))
  {
    v28 = +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("SendSEID"), kFMDNotBackedUpPrefDomain);

    if (!v28)
      goto LABEL_5;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "secureElementId"));
    objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("seid"), v29);

  }
LABEL_5:
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v31 = objc_msgSend(v30, "isRunningInRecovery");

  if ((v31 & 1) == 0)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v32, "hasSecureElement")));
    objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("secureElement"), v33);

  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[FMDDaemon sharedInstance](FMDDaemon, "sharedInstance"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "apsEnvironmentConstant"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "apsHandlerForEnvironment:", v35));

  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "apsToken"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("aps-token"), v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  LODWORD(v37) = objc_msgSend(v38, "hasSecureElement");

  if ((_DWORD)v37)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("hasSM1"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v40 = objc_msgSend(v39, "hasNFC");

  if (v40)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("hasSM2"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v41, "hasNFC")));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("nfc"), v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "deviceModel"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("model"), v44);

  v45 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "deviceRegion"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("region"), v46);

  v47 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "housingColor"));

  v49 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "backOfEnclosureColor"));

  v51 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "coverGlassColor"));

  if (objc_msgSend(v48, "isEqualToString:", CFSTR("0"))
    && objc_msgSend(v50, "isEqualToString:", CFSTR("0"))
    && (objc_msgSend(v52, "isEqualToString:", CFSTR("0")) & 1) != 0)
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "deviceColor"));
    objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("deviceColor"), v54);

    v55 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "deviceEnclosureColor"));
    objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("enclosureColor"), v56);

  }
  else
  {
    objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("coverGlassColor"), v52);
    objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("housingColor"), v48);
    objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("backingColor"), v50);
  }
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dsid"));
  v58 = sub_10002B0C4((uint64_t)v57);
  v59 = (void *)objc_claimAutoreleasedReturnValue(v58);

  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "base64EncodedStringWithOptions:", 0));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("mid"), v60);

  v61 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v61, "isRoseCapable")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v62, CFSTR("roseCapable"));

  return v4;
}

- (id)_nonCriticalDeviceInfoForAccount:(id)a3
{
  id v4;
  FMDBatteryInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = objc_alloc_init(FMDBatteryInfo);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBatteryInfo dictionaryValue](v5, "dictionaryValue"));
  objc_msgSend(v4, "setValuesForKeysWithDictionary:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v7, "processIdentifier")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringValue"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("processId"), v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMDBLEStateOwner sharedInstance](FMDBLEStateOwner, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "blePowerStatus"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("bleStatus"));

  -[ServerDeviceInfo _addOctagonStatusToDict:](self, "_addOctagonStatusToDict:", v4);
  return v4;
}

- (id)_constructPairedDevicesInfo
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accessoryRegistry"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allAccessories"));

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), "deviceInfoForHostRegister", (_QWORD)v13));
        objc_msgSend(v2, "fm_safeAddObject:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v2;
}

- (void)_addOctagonStatusToDict:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSPStatusUtil sharedInstance](FMDSPStatusUtil, "sharedInstance"));
  v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "beaconZoneCreationDate"));

  objc_msgSend(v20, "timeIntervalSince1970");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("bcnZoneTime"), v5);
  if (v20)
    v6 = CFSTR("created");
  else
    v6 = CFSTR("notCreated");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("bcnZoneStatus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSPStatusUtil sharedInstance](FMDSPStatusUtil, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "beaconZoneCreationErrorCode"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("bcnZoneErrorCode"), v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSPStatusUtil sharedInstance](FMDSPStatusUtil, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "beaconLastKeyRollDate"));
  objc_msgSend(v10, "timeIntervalSince1970");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));

  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("bcnKeyLastGenTime"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSPStatusUtil sharedInstance](FMDSPStatusUtil, "sharedInstance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "octStatus"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("octStatus"), v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSPStatusUtil sharedInstance](FMDSPStatusUtil, "sharedInstance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "octStatusError"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("octStatusError"), v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSPStatusUtil sharedInstance](FMDSPStatusUtil, "sharedInstance"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mteStatus"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("mteStatus"), v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSPStatusUtil sharedInstance](FMDSPStatusUtil, "sharedInstance"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "mteStatusError"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("mteStatusError"), v19);

}

- (id)_accessoryConfigurationDeviceInfo
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtConfigurationRegistry sharedInstance](FMDExtConfigurationRegistry, "sharedInstance"));
  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "version"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v4, CFSTR("accessoryTypeListVersion"));

  objc_msgSend(v3, "fm_safeSetObject:forKey:", CFSTR("true"), CFSTR("supportsDataUpdate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDFMIPServiceProvider, "activeServiceProvider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "detachNotificationManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "notifWhenDetachedListVersion"));

  objc_msgSend(v3, "fm_safeSetObject:forKey:", v7, CFSTR("nwdListVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMDMagSafeDataStore sharedInstance](FMDMagSafeDataStore, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "readLostModeAccessoriesListVersion"));

  objc_msgSend(v3, "fm_safeSetObject:forKey:", v9, CFSTR("lostModeInfoVersion"));
  return v3;
}

@end
