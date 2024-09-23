@implementation DMDiOSDeviceController

- (id)availableCapacity
{
  return +[DMDMobileGestalt dataAvailable](DMDMobileGestalt, "dataAvailable");
}

- (id)batteryLevel
{
  int v2;
  int v3;
  int v5;

  v5 = 0;
  v2 = IOPSGetPercentRemaining(&v5, 0, 0);
  if (!v2)
    return (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v5 / 100.0));
  v3 = v2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100075490(v3);
  return &off_1000C35D0;
}

- (id)capacity
{
  return +[DMDMobileGestalt dataCapacity](DMDMobileGestalt, "dataCapacity");
}

- (id)isDeviceLocatorServiceEnabled
{
  return -[DMDiOSDeviceController deviceLocatorServiceEnabledWithError:](self, "deviceLocatorServiceEnabledWithError:", 0);
}

- (id)isDoNotDisturbInEffect
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DNDStateService serviceForClientIdentifier:](DNDStateService, "serviceForClientIdentifier:", CFSTR("com.apple.dmd")));
  v7 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "queryCurrentStateWithError:", &v7));
  v4 = v7;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v3, "isActive")));
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100075508();
    v5 = 0;
  }

  return v5;
}

- (id)isLostModeEnabled
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMDFMIPManager sharedInstance](FMDFMIPManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v2, "isManagedLostModeActive")));

  return v3;
}

- (id)isDiagnosticSubmissionEnabled
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v2, "isDiagnosticSubmissionAllowed")));

  return v3;
}

- (id)isAppAnalyticsEnabled
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v2, "isAppAnalyticsAllowed")));

  return v3;
}

- (id)isCloudBackupEnabled
{
  return -[DMDiOSDeviceController _isCloudBackupEnabled](self, "_isCloudBackupEnabled");
}

- (id)carrierSettingsVersion
{
  return +[DMDCoreTelephonyUtilities carrierBundleVersion](DMDCoreTelephonyUtilities, "carrierBundleVersion");
}

- (id)cellularTechnology
{
  unsigned int v2;
  uint64_t v3;

  v2 = +[DMDCoreTelephonyUtilities hasGSM](DMDCoreTelephonyUtilities, "hasGSM");
  if (+[DMDCoreTelephonyUtilities hasCDMA](DMDCoreTelephonyUtilities, "hasCDMA"))
    v3 = v2 | 2;
  else
    v3 = v2;
  return +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3);
}

- (id)currentCarrierNetwork
{
  return +[DMDCoreTelephonyUtilities currentNetworkName](DMDCoreTelephonyUtilities, "currentNetworkName");
}

- (id)currentMCC
{
  return +[DMDCoreTelephonyUtilities currentMobileCountryCode](DMDCoreTelephonyUtilities, "currentMobileCountryCode");
}

- (id)currentMNC
{
  return +[DMDCoreTelephonyUtilities currentMobileNetworkCode](DMDCoreTelephonyUtilities, "currentMobileNetworkCode");
}

- (id)isDataRoamingEnabled
{
  return +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[DMDCoreTelephonyUtilities dataRoamingEnabled](DMDCoreTelephonyUtilities, "dataRoamingEnabled"));
}

- (id)EASIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DADConnection sharedConnection](DADConnection, "sharedConnection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activeSyncDeviceIdentifier"));

  return v3;
}

- (id)enforcedSoftwareUpdateDelay
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v2, "enforcedSoftwareUpdateDelayInDays")));

  return v3;
}

- (id)ICCID
{
  return +[DMDCoreTelephonyUtilities ICCID](DMDCoreTelephonyUtilities, "ICCID");
}

- (id)IMEI
{
  return +[DMDCoreTelephonyUtilities IMEI](DMDCoreTelephonyUtilities, "IMEI");
}

- (id)isActivationLockEnabled
{
  return -[DMDiOSDeviceController isActivationLockEnabledWithError:](self, "isActivationLockEnabledWithError:", 0);
}

- (id)isEphemeralMultiUser
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  if (objc_msgSend(v2, "isMultiUser")
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentUser")),
        v4 = objc_msgSend(v3, "userType"),
        v3,
        v4 == (id)1))
  {
    v5 = &__kCFBooleanTrue;
  }
  else
  {
    v5 = &__kCFBooleanFalse;
  }

  return v5;
}

- (id)isNetworkTethered
{
  return +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[DMDNetworkTetherUtilities isNetworkTethered](DMDNetworkTetherUtilities, "isNetworkTethered"));
}

- (id)isPersonalHotspotEnabled
{
  return -[DMDiOSDeviceController _isPersonalHotspotEnabled](self, "_isPersonalHotspotEnabled");
}

- (id)isRoaming
{
  return +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[DMDCoreTelephonyUtilities isRoaming](DMDCoreTelephonyUtilities, "isRoaming"));
}

- (id)maximumResidentUsers
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v2, "maxNumberOfUsers")));

  return v3;
}

- (id)MEID
{
  return +[DMDCoreTelephonyUtilities MEID](DMDCoreTelephonyUtilities, "MEID");
}

- (id)modemFirmwareVersion
{
  return +[DMDCoreTelephonyUtilities modemFirmwareVersion](DMDCoreTelephonyUtilities, "modemFirmwareVersion");
}

- (id)phoneNumber
{
  return +[DMDMobileGestalt phoneNumber](DMDMobileGestalt, "phoneNumber");
}

- (id)skippedSetupPanes
{
  return -[DMDiOSDeviceController _skippedSetupPanes](self, "_skippedSetupPanes");
}

- (id)subscriberCarrierNetwork
{
  return +[DMDCoreTelephonyUtilities carrierName](DMDCoreTelephonyUtilities, "carrierName");
}

- (id)subscriberMCC
{
  return +[DMDMobileGestalt mobileSubscriberCountryCode](DMDMobileGestalt, "mobileSubscriberCountryCode");
}

- (id)subscriberMNC
{
  return +[DMDMobileGestalt mobileSubscriberNetworkCode](DMDMobileGestalt, "mobileSubscriberNetworkCode");
}

- (id)isVoiceRoamingEnabled
{
  return +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[DMDCoreTelephonyUtilities voiceRoamingEnabled](DMDCoreTelephonyUtilities, "voiceRoamingEnabled"));
}

+ (id)_stringFromSubscriptionSlot:(int64_t)a3
{
  void *v3;

  v3 = (void *)CTSubscriptionSlotAsString(a3, a2);
  if (v3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v3));
  return v3;
}

- (id)_deviceInformationForEquipmentInfo:(id)a3 subscription:(id)a4 esimIdentifier:(id)a5 withClient:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  NSMutableDictionary *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  _BOOL8 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _BOOL8 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  _BOOL8 v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  id v65;
  void *v66;
  id v67;
  id v68;
  id v69;
  void *v70;
  id v71;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  void *v86;
  void *v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  uint8_t buf[4];
  const char *v97;
  __int16 v98;
  id v99;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (!v11)
  {
    v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v73, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDDeviceController+iOS.m"), 229, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("equipmentInfo != nil"));

    if (v15)
    {
LABEL_59:
      v71 = &__NSDictionary0__struct;
      goto LABEL_56;
    }
LABEL_58:
    v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v74, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDDeviceController+iOS.m"), 230, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client != nil"));

    goto LABEL_59;
  }
  if (!v14)
    goto LABEL_58;
  v16 = objc_msgSend(objc_alloc((Class)CTBundle), "initWithBundleType:", 1);
  v17 = objc_opt_new(NSMutableDictionary);
  v95 = 0;
  v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "getPreferredDataSubscriptionContextSync:", &v95));
  v19 = v95;
  v20 = v19;
  v87 = (void *)v18;
  if (!v18 && v19 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v97 = "-[DMDiOSDeviceController _deviceInformationForEquipmentInfo:subscription:esimIdentifier:withClient:]";
    v98 = 2114;
    v99 = v20;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "getPreferredDataSubscriptionContextSync: in %s failed: %{public}@", buf, 0x16u);
  }
  v86 = v20;
  v21 = objc_msgSend((id)objc_opt_class(self), "_stringFromSubscriptionSlot:", objc_msgSend(v11, "slotId"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v22, DMFDeviceServiceSubscriptionSlotKey);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ICCID"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[DMDCoreTelephonyUtilities formattedICCIDStringFromString:](DMDCoreTelephonyUtilities, "formattedICCIDStringFromString:", v23));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v24, DMFDeviceICCIDKey);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "IMEI"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[DMDCoreTelephonyUtilities formattedIMEIStringFromString:](DMDCoreTelephonyUtilities, "formattedIMEIStringFromString:", v25));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v26, DMFDeviceIMEIKey);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "MEID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v27, DMFDeviceMEIDKey);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "CSN"));
  v29 = DMFDeviceEIDKey;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v28, DMFDeviceEIDKey);

  if (-[DMDiOSDeviceController _equipmentInfoHasEsimIdentifier:](self, "_equipmentInfoHasEsimIdentifier:", v11))
    -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v13, v29);
  v30 = objc_msgSend(v11, "slotId");
  if (v13
    && v30 == (id)2
    && !-[DMDiOSDeviceController _equipmentInfoHasEsimIdentifier:](self, "_equipmentInfoHasEsimIdentifier:", v11))
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v13, v29);
  }
  if (v12)
  {
    v94 = 0;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "getPhoneNumber:error:", v12, &v94));
    v32 = v94;
    v78 = v31;
    if (v31)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "number"));
      if (v33)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v33, DMFDevicePhoneNumberKey);
      }
      else
      {
        v34 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v34)
          sub_100075984(v34, v35, v36, v37, v38, v39, v40, v41);
      }

    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100075910();
    }
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v12, "isEqual:", v87)));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v42, DMFDeviceServiceSubscriptionIsDataPreferredKey);

    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "userDefaultVoice"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v43, DMFDeviceServiceSubscriptionIsVoicePreferredKey);

    v93 = 0;
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "getSimLabel:error:", v12, &v93));
    v84 = v93;
    v85 = v16;
    if (v44)
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "text"));
      if (v45)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v45, DMFDeviceServiceSubscriptionLabelKey);
      }
      else
      {
        v46 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v46)
          sub_10007589C(v46, v47, v48, v49, v50, v51, v52, v53);
      }
      v54 = v44;
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "unique_id"));
      if (v55)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v55, DMFDeviceServiceSubscriptionLabelIDKey);
      }
      else
      {
        v56 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v56)
          sub_100075828(v56, v57, v58, v59, v60, v61, v62, v63);
      }

      v44 = v54;
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1000757B4();
    }
    v92 = 0;
    v64 = objc_msgSend(v15, "copyCarrierBundleVersion:error:", v12, &v92);
    v83 = v92;
    v75 = v64;
    if (v64)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v64, DMFDeviceCarrierSettingsVersionKey);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100075740();
    }
    v91 = 0;
    v65 = objc_msgSend(v15, "copyCarrierBundleValue:key:bundleType:error:", v12, CFSTR("CarrierName"), v16, &v91);
    v82 = v91;
    if (v65)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v65, DMFDeviceSubscriberCarrierNetworkKey);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1000756CC();
    }
    v90 = 0;
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "getLocalizedOperatorName:error:", v12, &v90));
    v81 = v90;
    v77 = v32;
    if (v66)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v66, DMFDeviceCurrentCarrierNetworkKey);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100075658();
    }
    v89 = 0;
    v67 = objc_msgSend(v15, "copyMobileCountryCode:error:", v12, &v89);
    v79 = v13;
    v80 = v89;
    v76 = v44;
    if (v67)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v67, DMFDeviceCurrentMCCKey);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1000755E4();
    }
    v88 = 0;
    v68 = objc_msgSend(v15, "copyMobileNetworkCode:error:", v12, &v88);
    v69 = v88;
    if (v68)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v68, DMFDeviceCurrentMNCKey);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100075570();
    }
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[DMDCoreTelephonyUtilities isSubscriptionRoaming:client:](DMDCoreTelephonyUtilities, "isSubscriptionRoaming:client:", v12, v15)));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v70, DMFDeviceIsRoamingKey);

    v13 = v79;
    v16 = v85;
  }
  v71 = -[NSMutableDictionary copy](v17, "copy");

LABEL_56:
  return v71;
}

- (BOOL)_equipmentInfoHasEsimIdentifier:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayCSN"));
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "CSN"));
    v5 = v6 != 0;

  }
  return v5;
}

- (id)serviceSubscriptions
{
  id v3;
  NSMutableDictionary *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  NSMutableDictionary *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *j;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  _BOOL8 v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  _BOOL8 v40;
  uint64_t v41;
  uint64_t v42;
  _BOOL8 v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  void *k;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v56;
  _BYTE *v57;
  const char *v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  NSMutableDictionary *v65;
  NSMutableArray *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t v72;
  _BYTE v73[7];
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  id v78;
  uint8_t v79;
  _BYTE v80[15];
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  id v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];

  v3 = objc_msgSend(objc_alloc((Class)CoreTelephonyClient), "initWithQueue:", 0);
  if (!v3)
  {
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v56, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDDeviceController+iOS.m"), 382, CFSTR("could not create CoreTelephonyClient"));

    v3 = 0;
  }
  v67 = objc_opt_new(NSMutableArray);
  v4 = objc_opt_new(NSMutableDictionary);
  v85 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getMobileEquipmentInfo:", &v85));
  v6 = v85;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "meInfoList"));
    if (!v7)
    {
      v36 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v36)
        sub_1000759F8(v36, v37, v38);
      v19 = 0;
      goto LABEL_54;
    }
    v58 = a2;
    v63 = v6;
    v64 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDiOSDeviceController _esimIdentifierFromEquipmentInfoArray:](self, "_esimIdentifierFromEquipmentInfoArray:", v7));
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v62 = v7;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v81, v88, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v82;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v82 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)i);
          v15 = objc_msgSend(v14, "slotId");
          if (!v15)
          {
            v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v20)
              sub_100075B6C(v20, v21, v22);
            goto LABEL_22;
          }
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v15));
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v16));
          if (v17 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            sub_100075BA4(&v79, v80, v18);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v14, v16);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v81, v88, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_22:

    v23 = objc_opt_new(NSMutableDictionary);
    v78 = 0;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getSubscriptionInfoWithError:", &v78));
    v65 = v4;
    v60 = v78;
    v61 = v24;
    if (v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "subscriptionsInUse"));
      if (v25)
      {
        v59 = v3;
        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        v26 = v25;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v75;
          v57 = v73;
          while (2)
          {
            for (j = 0; j != v28; j = (char *)j + 1)
            {
              if (*(_QWORD *)v75 != v29)
                objc_enumerationMutation(v26);
              v31 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)j);
              v32 = objc_msgSend(v31, "slotID", v57);
              if (!v32)
              {
                v43 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
                if (v43)
                  sub_100075AFC(v43, v44, v45);
                goto LABEL_45;
              }
              v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v32));
              v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", v33));
              if (v34 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                sub_100075B34(&v72, v57, v35);
              -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v31, v33);

            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
            if (v28)
              continue;
            break;
          }
        }
LABEL_45:
        v39 = v59;

        goto LABEL_46;
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100075A68(v58);
    }
    v39 = v3;
    v40 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v40)
      sub_100075A30(v40, v41, v42);
LABEL_46:
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v65, "allValues"));
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v69;
      do
      {
        for (k = 0; k != v48; k = (char *)k + 1)
        {
          if (*(_QWORD *)v69 != v49)
            objc_enumerationMutation(v46);
          v51 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)k);
          v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v51, "slotId")));
          v53 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", v52));

          v54 = (void *)objc_claimAutoreleasedReturnValue(-[DMDiOSDeviceController _deviceInformationForEquipmentInfo:subscription:esimIdentifier:withClient:](self, "_deviceInformationForEquipmentInfo:subscription:esimIdentifier:withClient:", v51, v53, v8, v39));
          -[NSMutableArray addObject:](v67, "addObject:", v54);

        }
        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
      }
      while (v48);
    }

    v19 = -[NSMutableArray copy](v67, "copy");
    v3 = v39;
    v5 = v64;
    v4 = v65;
    v7 = v62;
    v6 = v63;
LABEL_54:

    goto LABEL_55;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100074C08();
  v19 = 0;
LABEL_55:

  return v19;
}

- (id)_esimIdentifierFromEquipmentInfoArray:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayCSN", (_QWORD)v19));
        if (v8)
        {
          v9 = (void *)v8;
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayCSN"));
          v11 = objc_msgSend(v10, "length");

          if (v11)
          {
            v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayCSN"));
LABEL_15:
            v4 = (id)v16;
            goto LABEL_16;
          }
        }
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "CSN"));
        if (v12)
        {
          v13 = (void *)v12;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "CSN"));
          v15 = objc_msgSend(v14, "length");

          if (v15)
          {
            v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "CSN"));
            goto LABEL_15;
          }
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_16:

  v17 = objc_msgSend(v4, "copy");
  return v17;
}

- (id)deviceLocatorServiceEnabledWithError:(id *)a3
{
  dispatch_semaphore_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t, unint64_t, void *);
  void *v15;
  NSObject *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  NSErrorUserInfoKey v29;
  uint64_t v30;

  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1000378B4;
  v23 = sub_1000378C4;
  v24 = 0;
  v4 = dispatch_semaphore_create(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMDFMIPManager sharedInstance](FMDFMIPManager, "sharedInstance"));
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_1000378CC;
  v15 = &unk_1000BADE0;
  v17 = &v19;
  v18 = &v25;
  v6 = v4;
  v16 = v6;
  objc_msgSend(v5, "fmipStateWithCompletion:", &v12);

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v7 = v20[5];
  if (v7)
  {
    if (a3)
    {
      v29 = NSUnderlyingErrorKey;
      v30 = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1, v12, v13, v14, v15));
      v9 = DMFErrorWithCodeAndUserInfo(111, v8);
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v9));
      *a3 = v10;

      a3 = 0;
    }
  }
  else
  {
    a3 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)v26 + 24), v12, v13, v14, v15));
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  return a3;
}

- (id)isActivationLockEnabledWithError:(id *)a3
{
  dispatch_semaphore_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, char, void *);
  void *v16;
  NSObject *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  NSErrorUserInfoKey v30;
  uint64_t v31;

  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_1000378B4;
  v24 = sub_1000378C4;
  v25 = 0;
  v4 = dispatch_semaphore_create(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMDFMIPManager sharedInstance](FMDFMIPManager, "sharedInstance"));
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_100037B4C;
  v16 = &unk_1000BAE08;
  v18 = &v20;
  v19 = &v26;
  v6 = v4;
  v17 = v6;
  objc_msgSend(v5, "isActivationLockedWithCompletion:", &v13);

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  if (a3)
  {
    v7 = v21[5];
    if (v7)
    {
      v30 = NSUnderlyingErrorKey;
      v31 = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1, v13, v14, v15, v16));
      v9 = DMFErrorWithCodeAndUserInfo(111, v8);
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v9));
      *a3 = v10;

    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)v27 + 24), v13, v14, v15, v16));

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);
  return v11;
}

- (id)_isCloudBackupEnabled
{
  ACAccountStore *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = objc_opt_new(ACAccountStore);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore aa_primaryAppleAccountWithPreloadedDataclasses](v2, "aa_primaryAppleAccountWithPreloadedDataclasses"));

  if (v3 && objc_msgSend(v3, "isEnabledForDataclass:", kAccountDataclassBackup))
    v4 = objc_msgSend(v3, "aa_isPrimaryEmailVerified");
  else
    v4 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));

  return v5;
}

- (id)_isPersonalHotspotEnabled
{
  void *v2;
  id v3;

  if (+[DMDMobileGestalt hasPersonalHotspotCapability](DMDMobileGestalt, "hasPersonalHotspotCapability"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPersonalHotspotManager sharedManager](DMDPersonalHotspotManager, "sharedManager"));
    v3 = objc_msgSend(v2, "enabled");

  }
  else
  {
    v3 = 0;
  }
  return +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3);
}

- (id)_skippedSetupPanes
{
  NSMutableArray *v2;
  void *v3;
  unsigned int v4;
  id v5;

  v2 = objc_opt_new(NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = objc_msgSend(v3, "fileExistsAtPath:", CFSTR("/private/var/mobile/Library/Application Support/com.apple.dmd-setup-option"));

  if (v4)
    -[NSMutableArray addObject:](v2, "addObject:", kMCCCSkipSetupTapToSetup);
  v5 = -[NSMutableArray copy](v2, "copy");

  return v5;
}

@end
