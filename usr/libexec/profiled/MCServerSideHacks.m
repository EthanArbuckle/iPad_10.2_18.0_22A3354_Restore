@implementation MCServerSideHacks

+ (id)sharedHacks
{
  id v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MCServerSideHacks;
  v2 = objc_msgSendSuper2(&v4, "sharedHacks");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (void)applyEffectiveSettings:(id)a3 toOtherSubsystemsPasscode:(id)a4 credentialSet:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  BOOL v35;
  id v36;
  id v37;
  uint64_t v38;
  unsigned int v39;
  unsigned int v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  unsigned int v44;
  unsigned int v45;
  uint64_t v46;
  _DWORD *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  const void *v57;
  CFRunLoopRef Current;
  CFRunLoopRef v59;
  void *v60;
  void *v61;
  id *v62;
  float v63;
  uint64_t v64;
  id v65;
  void *v66;
  void *v67;
  unsigned int v68;
  void *v69;
  uint64_t v70;
  void *v71;
  unsigned int v72;
  uint64_t v73;
  void *v74;
  char v75;
  NSObject *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  id v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  void *v99;
  uint8_t buf[4];
  void *v101;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (byte_1000FD760)
  {
    v78 = v9;
    v11 = +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", MCFeatureAutomaticDateAndTimeForced, v7);
    if ((_DWORD)v11 == 1)
    {
      TMSetAutomaticTimeZoneEnabled();
      v11 = (id)TMSetAutomaticTimeEnabled(1);
    }
    if (MCGestaltHasSEP(v11))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "memberQueueRestrictions"));

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager valueForFeature:withRestrictionsDictionary:](MCRestrictionManager, "valueForFeature:withRestrictionsDictionary:", MCFeatureMaximumFailedPasscodeAttempts, v13));
      v15 = objc_msgSend(v14, "unsignedIntegerValue");

      if (v15 != (id)MCKeybagCurrentMaximumFailedPasscodeAttempts())
      {
        v16 = MCKeybagSetMaximumFailedPasscodeAttempts(v15, v8);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        if (v17)
        {
          v18 = _MCLogObjects[0];
          if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v101 = v17;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to set maximum failed passcode attempts. Error: %{public}@", buf, 0xCu);
          }
        }

      }
    }
    v19 = MCFeaturePasscodeLockGraceTime;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager valueSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "valueSettingForFeature:withUserSettingDictionary:", MCFeaturePasscodeLockGraceTime, v7));
    v21 = objc_msgSend(v20, "unsignedLongValue");

    v22 = MCKeybagCurrentPasscodeGracePeriod();
    if (v21 != (id)v22)
    {
      v23 = v22;
      v24 = MCKeybagSetPasscodeGracePeriod(v21, v8);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      if (v25)
      {
        v26 = _MCLogObjects[0];
        if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v101 = v25;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Failed to set grace period. Error: %{public}@", buf, 0xCu);
        }
        v98 = MCRestrictedValueKey;
        v96 = v19;
        v94 = MCRestrictedValueValueKey;
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v23));
        v95 = v27;
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1));
        v97 = v28;
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1));
        v99 = v29;
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v99, &v98, 1));

        objc_msgSend(v7, "MCDeepCopyEntriesFromDictionary:", v30);
      }

    }
    if (_os_feature_enabled_impl("MobileKeyBag", "Memento")
      && +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", MCFeaturePasscodeRecoveryAllowed, v7) == 2&& MCKeybagMementoBlobExists())
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](MCPasscodeManagerWriter, "sharedManager"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "clearRecoveryPasscode"));

      if (v32)
      {
        v33 = _MCLogObjects[0];
        if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v101 = v32;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Failed to clear recovery passcode. Error: %{public}@", buf, 0xCu);
        }
      }
      else
      {
        +[MCPasscodeAnalytics sendRecoveryPasscodeClearedEventWithReason:](MCPasscodeAnalytics, "sendRecoveryPasscodeClearedEventWithReason:", 4);
      }

    }
    v80 = 0;
    v81 = 0;
    v35 = sub_10000477C(&v81, &v80);
    v36 = v81;
    v37 = v80;
    v79 = v8;
    if (v35)
    {
      v38 = MCFeatureFingerprintUnlockAllowed;
      v39 = +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", MCFeatureFingerprintUnlockAllowed, v7);
      if (!v36 || (v40 = v39, (v39 != 2) == objc_msgSend(v36, "BOOLValue")))
        v41 = 0;
      else
        v41 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v40 != 2));
      v43 = MCFeatureFingerprintForContactlessPaymentAllowed;
      v44 = +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", MCFeatureFingerprintForContactlessPaymentAllowed, v7);
      if (!v37 || (v45 = v44, (v44 != 2) == objc_msgSend(v37, "BOOLValue")))
        v46 = 0;
      else
        v46 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v45 != 2));
      if (v41 | v46)
      {
        v47 = sub_1000526BC((void *)v41, (void *)v46, v79, v78);
        v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
        if (v48)
        {
          if (v41)
          {
            v92 = MCRestrictedBoolKey;
            v89 = v36;
            v90 = v38;
            v88 = MCRestrictedBoolValueKey;
            v77 = v48;
            v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1));
            v91 = v49;
            v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1));
            v93 = v50;
            v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1));

            objc_msgSend(v7, "MCDeepCopyEntriesFromDictionary:", v51);
            v48 = v77;
          }
          if (v46)
          {
            v86 = MCRestrictedBoolKey;
            v83 = v37;
            v84 = v43;
            v82 = MCRestrictedBoolValueKey;
            v52 = v48;
            v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1));
            v85 = v53;
            v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1));
            v87 = v54;
            v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1));

            objc_msgSend(v7, "MCDeepCopyEntriesFromDictionary:", v55);
            v48 = v52;
          }
        }

      }
    }
    else
    {
      v42 = _MCLogObjects[0];
      if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "Fingerprint unlock state is currently not available. Ignoring.", buf, 2u);
      }
    }
    if (+[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", MCFeatureWifiPowerOnEnforced, v7) == 1)
    {
      v56 = WiFiManagerClientCreate(kCFAllocatorDefault, 0);
      if (v56)
      {
        v57 = (const void *)v56;
        Current = CFRunLoopGetCurrent();
        WiFiManagerClientScheduleWithRunLoop(v57, Current, kCFRunLoopDefaultMode);
        if (!WiFiManagerClientGetPower(v57))
          WiFiManagerClientSetPower(v57, 1);
        v59 = CFRunLoopGetCurrent();
        WiFiManagerClientUnscheduleFromRunLoop(v57, v59, kCFRunLoopDefaultMode);
        CFRelease(v57);
      }
    }
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager valueSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "valueSettingForFeature:withUserSettingDictionary:", MCFeatureSafariAcceptCookies, v7));
    v61 = v60;
    v62 = (id *)&kMCSafariCookieAcceptPolicyExclusivelyFromMainDocumentDomain;
    if (v60)
    {
      objc_msgSend(v60, "floatValue");
      if (v63 >= 2.0)
      {
        v62 = (id *)&kMCSafariCookieAcceptPolicyAlways;
        v64 = 3;
      }
      else if (v63 >= 1.5)
      {
        v62 = (id *)&kMCSafariCookieAcceptPolicyOnlyFromMainDocumentDomain;
        v64 = 2;
      }
      else
      {
        v64 = v63 >= 1.0;
        if (v63 < 1.0)
          v62 = (id *)&kMCSafariCookieAcceptPolicyNever;
      }
    }
    else
    {
      v64 = 1;
    }
    v65 = *v62;
    v66 = (void *)CFPreferencesCopyAppValue(CFSTR("CookieAcceptPolicy"), CFSTR("com.apple.WebUI"));
    if ((MCEqualStrings(v65, v66) & 1) == 0)
    {
      CFPreferencesSetAppValue(CFSTR("CookieAcceptPolicy"), v65, CFSTR("com.apple.WebUI"));
      CFPreferencesAppSynchronize(CFSTR("com.apple.WebUI"));
      v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSHTTPCookieStorage sharedHTTPCookieStorage](NSHTTPCookieStorage, "sharedHTTPCookieStorage"));
      objc_msgSend(v67, "setCookieAcceptPolicy:", v64);

      MCSendSafariCookiePolicyChangedNotification();
    }

    v68 = +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", MCFeatureEnterpriseBookBackupAllowed, v7);
    v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v70 = MDMManagedNonStoreBooksDirectory();
    v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
    v72 = objc_msgSend(v69, "fileExistsAtPath:", v71);

    if (v72)
    {
      v73 = MDMManagedNonStoreBooksDirectory();
      v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
      v75 = MCSetSkipBackupAttributeToItemAtPath(v74, v68 == 2);

      if ((v75 & 1) == 0)
      {
        v76 = _MCLogObjects[0];
        if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_ERROR, "Failed to set backup exclusion on managed books directory", buf, 2u);
        }
      }
    }

    v10 = v78;
    v8 = v79;
  }
  else
  {
    v34 = _MCLogObjects[0];
    if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Not calling out to external components.", buf, 2u);
    }
  }

}

+ (void)setAllowHacksToCallExternalComponents:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  byte_1000FD760 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[MCActivationUtilities sharedInstance](MCActivationUtilities, "sharedInstance"));
  objc_msgSend(v4, "setIsReady:", v3);

}

- (BOOL)_anyBoolRestrictionChangedInSet:(id)a3 oldRestrictions:(id)a4 newRestrictions:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v10);
        if ((+[MCRestrictionManagerWriter restrictedBool:changedBetweenOldRestrictions:andNewRestrictions:](MCRestrictionManagerWriter, "restrictedBool:changedBetweenOldRestrictions:andNewRestrictions:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), v8, v9, (_QWORD)v15) & 1) != 0)
        {
          LOBYTE(v11) = 1;
          goto LABEL_11;
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v11;
}

- (void)_applyServerSideChangesWithOldRestrictions:(id)a3 newRestrictions:(id)a4 oldEffectiveUserSettings:(id)a5 newEffectiveUserSettings:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  const char *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  __CFNotificationCenter *v36;
  uint64_t v37;
  void *v38;
  id v39;
  unsigned __int8 v40;
  id v41;
  os_log_t v42;
  const char *v43;
  NSObject *v44;
  os_log_type_t v45;
  uint32_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  unsigned int v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *i;
  void *v58;
  int v59;
  id v60;
  id v61;
  id v62;
  MCServerSideHacks *v63;
  id obj;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  id v78;
  _QWORD v79[4];
  BOOL v80;
  _QWORD block[4];
  BOOL v82;
  _BYTE v83[128];
  _QWORD v84[5];
  uint8_t buf[4];
  id v86;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!byte_1000FD760)
  {
    v33 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Not calling out to external components.", buf, 2u);
    }
    goto LABEL_72;
  }
  if (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureEncryptedBackupRequired, v12, v13))-[MCServerSideHacks _setRequriesEncryptedBackupInLockdownWithEffectiveUserSettings:](self, "_setRequriesEncryptedBackupInLockdownWithEffectiveUserSettings:", v13);
  v14 = MCFeatureAppInstallationAllowed;
  v63 = self;
  if (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureAppInstallationAllowed, v12, v13))
  {
    v15 = +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", v14, v13) != 2;
    v16 = MCLockdownOperationQueue();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100089490;
    block[3] = &unk_1000E43F0;
    v82 = v15;
    self = v63;
    dispatch_async(v17, block);

  }
  v18 = MCFeatureAppRemovalAllowed;
  if (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureAppRemovalAllowed, v12, v13))
  {
    v19 = +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", v18, v13) != 2;
    v20 = MCLockdownOperationQueue();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    v79[0] = _NSConcreteStackBlock;
    v79[1] = 3221225472;
    v79[2] = sub_100089504;
    v79[3] = &unk_1000E43F0;
    v80 = v19;
    self = v63;
    dispatch_async(v21, v79);

  }
  v22 = MCFeatureHostPairingAllowed;
  if (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureHostPairingAllowed, v12, v13)&& +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", v22, v13) == 2)
  {
    v23 = MCLockdownOperationQueue();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    dispatch_async(v24, &stru_1000E4410);

  }
  if (+[MCRestrictionManager unionValuesSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "unionValuesSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureTrustedCodeSigningIdentities, v12, v13))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[MCProvisioningProfileJanitor sharedJanitor](MCProvisioningProfileJanitor, "sharedJanitor"));
    objc_msgSend(v25, "updateMISTrust");

  }
  v26 = MCFeatureAllowGlobalBackgroundFetchWhenRoaming;
  if (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureAllowGlobalBackgroundFetchWhenRoaming, v12, v13))PCSettingsSetGlobalMCCForceManualWhenRoaming(+[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", v26, v13) == 2);
  v27 = MCFeatureAssistantAllowed;
  if (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureAssistantAllowed, v12, v13)&& +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", v27, v13) == 2)
  {
    CFPreferencesSetAppValue(CFSTR("Assistant Enabled"), kCFBooleanFalse, CFSTR("com.apple.assistant.support"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.assistant.support"));
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("kAFPreferencesDidChangeDarwinNotification"), 0, 0, 1u);
  }
  v29 = MCFeatureFIPSVerificationForced;
  if (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureFIPSVerificationForced, v12, v13))
  {
    if (+[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", v29, v13) == 1)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
      objc_msgSend(v30, "writeToFile:atomically:", CFSTR("/var/mobile/Library/Preferences/enable_fips_mode"), 0);

      v31 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v32 = "Turning on FIPS verification.";
LABEL_26:
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, v32, buf, 2u);
      }
    }
    else
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      objc_msgSend(v34, "removeItemAtPath:error:", CFSTR("/var/mobile/Library/Preferences/enable_fips_mode"), 0);

      v31 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v32 = "Turning off FIPS verification.";
        goto LABEL_26;
      }
    }
  }
  v35 = MCFeatureDiagnosticsSubmissionAllowed;
  if (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureDiagnosticsSubmissionAllowed, v12, v13)&& +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", v35, v12))
  {
    v36 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v36, CFSTR("com.apple.OTACrashCopier.SubmissionPreferenceChanged"), 0, 0, 1u);
  }
  v62 = v13;
  v37 = MCFeatureCloudKeychainSyncAllowed;
  if (!+[MCRestrictionManager restrictedBool:changedBetweenOldRestrictions:andNewRestrictions:](MCRestrictionManager, "restrictedBool:changedBetweenOldRestrictions:andNewRestrictions:", MCFeatureCloudKeychainSyncAllowed, v10, v11)|| +[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", v37, v11) != 2)
  {
    goto LABEL_39;
  }
  v38 = (void *)objc_opt_new(OTConfigurationContext);
  v39 = objc_msgSend(objc_alloc((Class)OTClique), "initWithContextData:", v38);
  v78 = 0;
  v40 = objc_msgSend(v39, "setUserControllableViewsSyncStatus:error:", 0, &v78);
  v41 = v78;
  v42 = _MCLogObjects[0];
  if ((v40 & 1) != 0)
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v43 = "Disabled keychain sync.";
      v44 = v42;
      v45 = OS_LOG_TYPE_DEFAULT;
      v46 = 2;
LABEL_37:
      _os_log_impl((void *)&_mh_execute_header, v44, v45, v43, buf, v46);
    }
  }
  else if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v86 = v41;
    v43 = "Unable to leave clique to disable keychain sync. Error: %{public}@";
    v44 = v42;
    v45 = OS_LOG_TYPE_ERROR;
    v46 = 12;
    goto LABEL_37;
  }

  self = v63;
LABEL_39:
  v72 = MCFeaturePhotoStreamAllowed;
  v73 = MCFeatureCloudPhotoLibraryAllowed;
  v84[0] = MCFeatureCloudPhotoLibraryAllowed;
  v84[1] = MCFeaturePhotoStreamAllowed;
  v70 = MCFeatureCloudBackupAllowed;
  v71 = MCFeatureSharedStreamAllowed;
  v84[2] = MCFeatureSharedStreamAllowed;
  v84[3] = MCFeatureCloudBackupAllowed;
  v47 = MCFeatureCloudDocumentSyncAllowed;
  v84[4] = MCFeatureCloudDocumentSyncAllowed;
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v84, 5));
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v48));
  v50 = -[MCServerSideHacks _anyBoolRestrictionChangedInSet:oldRestrictions:newRestrictions:](self, "_anyBoolRestrictionChangedInSet:oldRestrictions:newRestrictions:", v49, v10, v11);

  if (!v50)
    goto LABEL_68;
  v60 = v12;
  v61 = v10;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "aa_appleAccounts"));
  v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
  if (!v51)
    goto LABEL_67;
  v52 = v51;
  v53 = *(_QWORD *)v75;
  v54 = kAccountDataclassCloudPhotos;
  v69 = kAccountDataclassMediaStream;
  v68 = kAccountDataclassSharedStreams;
  v67 = kAccountDataclassBackup;
  v66 = kAccountDataclassUbiquity;
  v55 = kAccountDataclassKeyValue;
  v56 = kAccountDataclassCloudPhotos;
  do
  {
    for (i = 0; i != v52; i = (char *)i + 1)
    {
      if (*(_QWORD *)v75 != v53)
        objc_enumerationMutation(obj);
      v58 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)i);
      if (+[MCRestrictionManagerWriter restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManagerWriter, "restrictedBoolForFeature:withRestrictionsDictionary:", v73, v11) == 2&& objc_msgSend(v58, "isEnabledForDataclass:", v54))
      {
        objc_msgSend(v58, "setEnabled:forDataclass:", 0, v54);
        v59 = 1;
      }
      else
      {
        v59 = 0;
      }
      if (+[MCRestrictionManagerWriter restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManagerWriter, "restrictedBoolForFeature:withRestrictionsDictionary:", v72, v11) == 2&& objc_msgSend(v58, "isEnabledForDataclass:", v69))
      {
        objc_msgSend(v58, "setEnabled:forDataclass:", 0, v69);
        v59 = 1;
      }
      if (+[MCRestrictionManagerWriter restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManagerWriter, "restrictedBoolForFeature:withRestrictionsDictionary:", v71, v11) == 2&& objc_msgSend(v58, "isEnabledForDataclass:", v68))
      {
        objc_msgSend(v58, "setEnabled:forDataclass:", 0, v68);
        v59 = 1;
      }
      if (+[MCRestrictionManagerWriter restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManagerWriter, "restrictedBoolForFeature:withRestrictionsDictionary:", v70, v11) == 2&& objc_msgSend(v58, "isEnabledForDataclass:", v67))
      {
        objc_msgSend(v58, "setEnabled:forDataclass:", 0, v67);
        v59 = 1;
      }
      if (+[MCRestrictionManagerWriter restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManagerWriter, "restrictedBoolForFeature:withRestrictionsDictionary:", v47, v11) != 2)goto LABEL_63;
      if (objc_msgSend(v58, "isEnabledForDataclass:", v66))
      {
        objc_msgSend(v58, "setEnabled:forDataclass:", 0, v66);
        v59 = 1;
      }
      if (objc_msgSend(v58, "isEnabledForDataclass:", v55))
      {
        objc_msgSend(v58, "setEnabled:forDataclass:", 0, v55);
      }
      else
      {
LABEL_63:
        if (!v59)
          goto LABEL_65;
      }
      objc_msgSend(v65, "saveAccount:withDataclassActions:doVerify:completion:", v58, 0, 0, &stru_1000E4430);
LABEL_65:
      v54 = v56;
    }
    v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
  }
  while (v52);
LABEL_67:

  v12 = v60;
  v10 = v61;
  self = v63;
LABEL_68:
  v13 = v62;
  if (+[MCRestrictionManagerWriter BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManagerWriter, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureVehicleUIAllowed, v12, v62))CRHandleCarPlayRestrictionChanged();
  if (+[MCRestrictionManager restrictedBool:changedBetweenOldRestrictions:andNewRestrictions:](MCRestrictionManager, "restrictedBool:changedBetweenOldRestrictions:andNewRestrictions:", MCFeatureLimitAdTrackingForced, v10, v11))-[MCServerSideHacks setUserTrackingTCCAccessOverrideForRestrictions:](self, "setUserTrackingTCCAccessOverrideForRestrictions:", v11);
LABEL_72:

}

- (BOOL)applyEffectiveSettings:(id)a3 toSettings:(id)a4 withOldRestrictions:(id)a5 newRestrictions:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;

  v9 = a3;
  v10 = a4;
  v11 = MCFeaturePasscodeLockGraceTime;
  if (+[MCRestrictionManager restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:](MCRestrictionManager, "restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:", MCFeaturePasscodeLockGraceTime, a5, a6)&& (v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager valueSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "valueSettingForFeature:withUserSettingDictionary:", v11, v9)), v13 = objc_msgSend(v12, "unsignedLongValue"), v12, v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager valueSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "valueSettingForFeature:withUserSettingDictionary:", v11, v10)),
        v15 = objc_msgSend(v14, "unsignedLongValue"),
        v14,
        v13 != v15))
  {
    v26 = MCRestrictedValueKey;
    v24 = v11;
    v22 = MCRestrictedValueValueKey;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v13));
    v23 = v17;
    v16 = 1;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
    v25 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
    v27 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));

    objc_msgSend(v10, "MCDeepCopyEntriesFromDictionary:", v20);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)recomputeAppOptionsEffectiveUserSettings:(id)a3 outEffectiveChangeDetected:(BOOL *)a4
{
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _UNKNOWN **v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *i;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *j;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  void *k;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *m;
  void *v46;
  void *v47;
  id v48;
  id v49;
  uint64_t v50;
  void *n;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  uint64_t v74;
  void *ii;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  char v80;
  uint64_t v81;
  char v82;
  void *v83;
  void *v84;
  void *v85;
  unsigned __int8 v86;
  _BYTE *v88;
  id v89;
  void *v90;
  uint64_t v91;
  id v92;
  id obj;
  void *v94;
  void *v95;
  void *context;
  uint64_t v97;
  id v98;
  id v99;
  id v100;
  id v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  id v106;
  id v107;
  id v108;
  void *v109;
  id v110;
  id v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  uint8_t buf[16];
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];

  v89 = a3;
  v4 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Recomputing app options.", buf, 2u);
  }
  v94 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest", a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "allInstalledProfileIdentifiers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v140 = 0u;
  v141 = 0u;
  v142 = 0u;
  v143 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v140, v152, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v141;
    v10 = kMCAppWhitelistIdentifierKey;
    v11 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
    v91 = *(_QWORD *)v141;
    do
    {
      v12 = 0;
      v92 = v8;
      do
      {
        if (*(_QWORD *)v141 != v9)
          objc_enumerationMutation(obj);
        v97 = v12;
        v13 = *(_QWORD *)(*((_QWORD *)&v140 + 1) + 8 * v12);
        context = objc_autoreleasePoolPush();
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "installedProfileWithIdentifier:", v13));
        v15 = objc_opt_class(MCConfigurationProfile);
        if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
          v136 = 0u;
          v137 = 0u;
          v138 = 0u;
          v139 = 0u;
          v95 = v14;
          v110 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "payloads"));
          v17 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v136, v151, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(id *)v137;
            v98 = *(id *)v137;
            v102 = v16;
            do
            {
              v20 = 0;
              v106 = v18;
              do
              {
                if (*(id *)v137 != v19)
                  objc_enumerationMutation(v110);
                v21 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * (_QWORD)v20);
                v22 = objc_opt_class(v11[119]);
                if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0)
                {
                  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "whitelistedAppsAndOptions"));
                  if (v23)
                  {
                    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "UUID"));
                    objc_msgSend(v16, "setObject:forKey:", v23, v24);

                    v134 = 0u;
                    v135 = 0u;
                    v132 = 0u;
                    v133 = 0u;
                    v25 = v23;
                    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v132, v150, 16);
                    if (v26)
                    {
                      v27 = v26;
                      v28 = *(_QWORD *)v133;
                      do
                      {
                        for (i = 0; i != v27; i = (char *)i + 1)
                        {
                          if (*(_QWORD *)v133 != v28)
                            objc_enumerationMutation(v25);
                          v30 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * (_QWORD)i);
                          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKey:", v10));
                          if (v31)
                            objc_msgSend(v6, "setObject:forKey:", v30, v31);

                        }
                        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v132, v150, 16);
                      }
                      while (v27);
                    }

                    v11 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
                    v19 = v98;
                    v16 = v102;
                    v18 = v106;
                  }

                }
                v20 = (char *)v20 + 1;
              }
              while (v20 != v18);
              v18 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v136, v151, 16);
            }
            while (v18);
          }

          if (objc_msgSend(v16, "count"))
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "identifier"));
            objc_msgSend(v90, "setObject:forKey:", v16, v32);

          }
          v9 = v91;
          v8 = v92;
          v14 = v95;
        }

        objc_autoreleasePoolPop(context);
        v12 = v97 + 1;
      }
      while ((id)(v97 + 1) != v8);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v140, v152, 16);
    }
    while (v8);
  }

  v128 = 0u;
  v129 = 0u;
  v130 = 0u;
  v131 = 0u;
  v111 = (id)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  v99 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "memberQueueUserClientRestrictions"));
  v107 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v128, v149, 16);
  if (v107)
  {
    v103 = *(_QWORD *)v129;
    v33 = kMCAppWhitelistIdentifierKey;
    do
    {
      for (j = 0; j != v107; j = (char *)j + 1)
      {
        if (*(_QWORD *)v129 != v103)
          objc_enumerationMutation(v99);
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "memberQueueAppsAndOptionsForClientUUID:", *(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * (_QWORD)j)));
        v36 = v35;
        if (v35)
        {
          v126 = 0u;
          v127 = 0u;
          v124 = 0u;
          v125 = 0u;
          v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v124, v148, 16);
          if (v37)
          {
            v38 = v37;
            v39 = *(_QWORD *)v125;
            do
            {
              for (k = 0; k != v38; k = (char *)k + 1)
              {
                if (*(_QWORD *)v125 != v39)
                  objc_enumerationMutation(v36);
                v41 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * (_QWORD)k);
                v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKey:", v33));
                if (v42)
                {
                  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v42));

                  if (!v43)
                    objc_msgSend(v6, "setObject:forKey:", v41, v42);
                }

              }
              v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v124, v148, 16);
            }
            while (v38);
          }
        }

      }
      v107 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v128, v149, 16);
    }
    while (v107);
  }

  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  v100 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "memberQueueSystemClientRestrictions"));
  v108 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v120, v147, 16);
  if (v108)
  {
    v104 = *(_QWORD *)v121;
    v44 = kMCAppWhitelistIdentifierKey;
    do
    {
      for (m = 0; m != v108; m = (char *)m + 1)
      {
        if (*(_QWORD *)v121 != v104)
          objc_enumerationMutation(v100);
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "memberQueueAppsAndOptionsForClientUUID:", *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * (_QWORD)m)));
        v47 = v46;
        if (v46)
        {
          v118 = 0u;
          v119 = 0u;
          v116 = 0u;
          v117 = 0u;
          v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v116, v146, 16);
          if (v48)
          {
            v49 = v48;
            v50 = *(_QWORD *)v117;
            do
            {
              for (n = 0; n != v49; n = (char *)n + 1)
              {
                if (*(_QWORD *)v117 != v50)
                  objc_enumerationMutation(v47);
                v52 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * (_QWORD)n);
                v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectForKey:", v44));
                if (v53)
                {
                  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v53));

                  if (!v54)
                    objc_msgSend(v6, "setObject:forKey:", v52, v53);
                }

              }
              v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v116, v146, 16);
            }
            while (v49);
          }
        }

      }
      v108 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v120, v147, 16);
    }
    while (v108);
  }

  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v56 = objc_msgSend(v6, "count");
  v57 = MCSystemAppOptionsByBundleIDFilePath();
  v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
  v59 = v90;
  if (v56)
    objc_msgSend(v6, "writeToFile:atomically:", v58, 1);
  else
    objc_msgSend(v55, "removeItemAtPath:error:", v58, 0);

  v60 = objc_msgSend(v90, "count");
  v61 = MCSystemAppWhitelistByProfileFilePath();
  v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
  if (v60)
  {
    objc_msgSend(v90, "writeToFile:atomically:", v62, 1);
  }
  else
  {
    objc_msgSend(v55, "removeItemAtPath:error:", v62, 0);

    v63 = MCSystemEffectiveAppWhitelistFilePath();
    v62 = (void *)objc_claimAutoreleasedReturnValue(v63);
    objc_msgSend(v55, "removeItemAtPath:error:", v62, 0);
  }

  v64 = MCSystemEffectiveAppWhitelistFilePath();
  v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
  v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v65));

  if (v66)
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization MCSafePropertyListWithData:options:format:error:](NSPropertyListSerialization, "MCSafePropertyListWithData:options:format:error:", v66, 0, 0, 0));
  else
    v67 = 0;
  if (objc_msgSend(v6, "count"))
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager intersectedValuesSettingForFeature:withUserSettingDectionary:](MCRestrictionManager, "intersectedValuesSettingForFeature:withUserSettingDectionary:", MCFeatureAppLockBundleIDs, v89));
    if (objc_msgSend(v68, "count"))
    {
      v101 = v67;
      v105 = v66;
      v109 = v55;
      v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v68));
      v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v68, "count")));
      v112 = 0u;
      v113 = 0u;
      v114 = 0u;
      v115 = 0u;
      v71 = v6;
      v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v112, v145, 16);
      if (v72)
      {
        v73 = v72;
        v74 = *(_QWORD *)v113;
        do
        {
          for (ii = 0; ii != v73; ii = (char *)ii + 1)
          {
            if (*(_QWORD *)v113 != v74)
              objc_enumerationMutation(v71);
            v76 = *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * (_QWORD)ii);
            v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectForKey:", v76));
            if (objc_msgSend(v69, "containsObject:", v76))
              objc_msgSend(v70, "addObject:", v77);

          }
          v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v112, v145, 16);
        }
        while (v73);
      }

      if (objc_msgSend(v70, "count"))
      {
        v78 = MCSystemEffectiveAppWhitelistFilePath();
        v79 = (void *)objc_claimAutoreleasedReturnValue(v78);
        v80 = 1;
        objc_msgSend(v70, "writeToFile:atomically:", v79, 1);

        v59 = v90;
        v66 = v105;
        v55 = v109;
        v67 = v101;
        goto LABEL_97;
      }

      v59 = v90;
      v66 = v105;
      v55 = v109;
      v67 = v101;
    }
    else
    {
      v70 = 0;
    }

  }
  else
  {
    v70 = 0;
  }
  v81 = MCSystemEffectiveAppWhitelistFilePath();
  v68 = (void *)objc_claimAutoreleasedReturnValue(v81);
  objc_msgSend(v55, "removeItemAtPath:error:", v68, 0);
  v80 = 0;
LABEL_97:

  if (v88)
  {
    v82 = v80 ^ 1;
    if (!v67)
      v82 = 0;
    if ((v82 & 1) != 0
      || (v83 = v67,
          v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v67)),
          v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v70)),
          v86 = objc_msgSend(v84, "isEqualToSet:", v85),
          v85,
          v67 = v83,
          v84,
          (v86 & 1) == 0))
    {
      *v88 = 1;
    }
  }

}

- (void)recomputeAppRulesForNetworkExtension
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Recomputing app rules for NetworkExtension.", buf, 2u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MDMManagedMediaReader attributesByAppID](MDMManagedMediaReader, "attributesByAppID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
  v5 = MCNEProfileIngestionHandlerClassForPayload(CFSTR("PayloadTypeNone"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if ((objc_msgSend(v6, "lockConfigurations") & 1) != 0)
  {
    objc_msgSend(v6, "loadConfigurationsForceReloadFromDisk");
    objc_msgSend(v6, "updatePerAppMappingRules:", v3);
    objc_msgSend(v6, "updateManagedAppRules:", v4);
    objc_msgSend(v6, "unlockConfigurations");
  }
  else
  {
    v7 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "recomputeAppRulesForNetworkExtension could not get NetworkExtension store lock.", v8, 2u);
    }
  }

}

- (id)recomputeAccountVPNAssociations
{
  void *v2;
  id v3;
  id v4;
  _UNKNOWN **v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  uint64_t v38;
  void *v39;
  id v40;
  id obj;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  id v48;
  uint8_t buf[16];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];

  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allInstalledProfileIdentifiers"));
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  if (v3)
  {
    v4 = v3;
    v5 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
    v6 = *(_QWORD *)v55;
    v7 = CFSTR("passcodeRecoverySupported");
    v38 = *(_QWORD *)v55;
    v39 = v2;
    do
    {
      v8 = 0;
      v40 = v4;
      do
      {
        if (*(_QWORD *)v55 != v6)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)v8);
        v10 = objc_autoreleasePoolPush();
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "installedProfileWithIdentifier:", v9));
        v12 = objc_opt_class(v5[129]);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
        {
          v43 = v10;
          v44 = v8;
          v52 = 0u;
          v53 = 0u;
          v50 = 0u;
          v51 = 0u;
          v42 = v11;
          v48 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "payloads"));
          v13 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v51;
            v45 = *(_QWORD *)v51;
            do
            {
              v16 = 0;
              v46 = v14;
              do
              {
                if (*(_QWORD *)v51 != v15)
                  objc_enumerationMutation(v48);
                v17 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)v16);
                if (objc_msgSend(v17, "conformsToProtocol:", v7[123].data))
                {
                  v18 = v17;
                  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "VPNUUID"));
                  if (v19)
                  {
                    if ((objc_opt_respondsToSelector(v18, "mailAccountIdentifiers") & 1) != 0)
                      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "mailAccountIdentifiers"));
                    else
                      v20 = 0;
                    if ((objc_opt_respondsToSelector(v18, "contactsAccountIdentifiers") & 1) != 0)
                      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "contactsAccountIdentifiers"));
                    else
                      v21 = 0;
                    if ((objc_opt_respondsToSelector(v18, "calendarAccountIdentifiers") & 1) != 0)
                      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "calendarAccountIdentifiers"));
                    else
                      v22 = 0;
                    if (objc_msgSend(v20, "count") || objc_msgSend(v21, "count") || objc_msgSend(v22, "count"))
                    {
                      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", v19));
                      if (!v23)
                      {
                        v23 = (void *)objc_opt_new(NEAccountIdentifiers);
                        objc_msgSend(v47, "setObject:forKeyedSubscript:", v23, v19);
                      }
                      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "mailAccountIdentifiers"));
                      v25 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks mergeArray:withArray:](MCServerSideHacks, "mergeArray:withArray:", v24, v20));
                      objc_msgSend(v23, "setMailAccountIdentifiers:", v25);

                      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "contactsAccountIdentifiers"));
                      v27 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks mergeArray:withArray:](MCServerSideHacks, "mergeArray:withArray:", v26, v21));
                      objc_msgSend(v23, "setContactsAccountIdentifiers:", v27);

                      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "calendarAccountIdentifiers"));
                      v29 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks mergeArray:withArray:](MCServerSideHacks, "mergeArray:withArray:", v28, v22));
                      objc_msgSend(v23, "setCalendarAccountIdentifiers:", v29);

                      v7 = CFSTR("passcodeRecoverySupported");
                      v15 = v45;
                      v14 = v46;
                    }

                  }
                }
                v16 = (char *)v16 + 1;
              }
              while (v14 != v16);
              v14 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
            }
            while (v14);
          }

          v2 = v39;
          v4 = v40;
          v5 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
          v6 = v38;
          v10 = v43;
          v8 = v44;
          v11 = v42;
        }

        objc_autoreleasePoolPop(v10);
        v8 = (char *)v8 + 1;
      }
      while (v8 != v4);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    }
    while (v4);
  }

  v30 = MCNEProfileIngestionHandlerClassForPayload(CFSTR("PayloadTypeNone"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  objc_msgSend(v31, "loadConfigurationsForceReloadFromDisk");
  if ((objc_msgSend(v31, "updateAccountIdentifiers:", v47) & 1) != 0)
  {
    v32 = 0;
  }
  else
  {
    v33 = MCVPNErrorDomain;
    v34 = MCErrorArray(CFSTR("ERROR_VPN_INTERNAL_ERROR"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v33, 15004, v35, MCErrorTypeFatal, 0));

    v36 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "recomputeAccountVPNAssociations failed to update associations.", buf, 2u);
    }
  }

  return v32;
}

+ (id)mergeArray:(id)a3 withArray:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    v11 = v6;
LABEL_6:
    v10 = v11;
    goto LABEL_7;
  }
  if (!v6)
  {
    v11 = v5;
    goto LABEL_6;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "setByAddingObjectsFromArray:", v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allObjects"));

LABEL_7:
  return v10;
}

- (void)recomputeWebContentFilterEffectiveUserSettings:(id)a3 outEffectiveChangeDetected:(BOOL *)a4 outMechanismChangedDetected:(BOOL *)a5
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  uint64_t v25;
  _UNKNOWN **v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  void *j;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  unsigned __int8 v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  unsigned int v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  uint64_t v75;
  void *k;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  id v82;
  _BOOL8 v83;
  void *v84;
  void *v85;
  unsigned int v86;
  void *v87;
  unsigned int v88;
  uint64_t v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  id v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  uint64_t v101;
  void *v102;
  void *v103;
  id v104;
  uint64_t v105;
  void *v106;
  void *v107;
  id v108;
  uint64_t v109;
  void *v110;
  void *v111;
  id v112;
  char v113;
  char v114;
  uint64_t v115;
  int v116;
  void *v117;
  id v118;
  id v119;
  id v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  char v124;
  void *v125;
  void *v128;
  void *v129;
  id v130;
  id v131;
  id obj;
  uint64_t v133;
  void *v134;
  id v135;
  void *v136;
  void *v137;
  void *v138;
  uint64_t v139;
  unsigned int v140;
  uint64_t v141;
  void *v142;
  id v143;
  uint64_t v144;
  id v145;
  id v146;
  id v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  uint8_t buf[16];
  _BYTE v169[128];
  _QWORD v170[2];
  _QWORD v171[2];
  _BYTE v172[128];
  _BYTE v173[128];
  _BYTE v174[128];
  _BYTE v175[128];

  v5 = a3;
  v6 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Recomputing web content filter.", buf, 2u);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v8 = ((uint64_t (*)(void))MCWebContentFilterOutputPath)();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v128 = v7;
  LODWORD(v7) = objc_msgSend(v7, "fileExistsAtPath:", v9);

  if ((_DWORD)v7)
  {
    v10 = ((uint64_t (*)(void))MCWebContentFilterOutputPath)();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v129 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v11));

  }
  else
  {
    v129 = 0;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCBookmarkManager sharedManager](MCBookmarkManager, "sharedManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "userBookmarks"));

  v166 = 0u;
  v167 = 0u;
  v164 = 0u;
  v165 = 0u;
  obj = v14;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v164, v175, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v165;
    v18 = kMCWCFAddressKey;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v165 != v17)
          objc_enumerationMutation(obj);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v164 + 1) + 8 * (_QWORD)i), "serializableDictionary"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", v18));
        if (v21)
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, v21);

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v164, v175, 16);
    }
    while (v16);
  }
  v130 = v5;

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](MCDependencyManager, "sharedManager"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "parentsInDomain:", kMCDMProfileWithWebContentFilterToPayloadUUIDDependencyKey));

  v162 = 0u;
  v163 = 0u;
  v160 = 0u;
  v161 = 0u;
  v131 = v23;
  v135 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v160, v174, 16);
  v24 = 0;
  if (v135)
  {
    v133 = *(_QWORD *)v161;
    v25 = kMCWCFAddressKey;
    v26 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v161 != v133)
          objc_enumerationMutation(v131);
        v139 = v27;
        v28 = *(_QWORD *)(*((_QWORD *)&v160 + 1) + 8 * v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "installedProfileWithIdentifier:", v28));

        v158 = 0u;
        v159 = 0u;
        v156 = 0u;
        v157 = 0u;
        v137 = v30;
        v146 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "payloads"));
        v31 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v156, v173, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v157;
          v141 = *(_QWORD *)v157;
          do
          {
            v34 = 0;
            v143 = v32;
            do
            {
              if (*(_QWORD *)v157 != v33)
                objc_enumerationMutation(v146);
              v35 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * (_QWORD)v34);
              v36 = objc_autoreleasePoolPush();
              v37 = objc_opt_class(v26[175]);
              if ((objc_opt_isKindOfClass(v35, v37) & 1) != 0)
              {
                v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "allowListBookmarks"));
                v152 = 0u;
                v153 = 0u;
                v154 = 0u;
                v155 = 0u;
                v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v152, v172, 16);
                if (v39)
                {
                  v40 = v39;
                  v41 = *(_QWORD *)v153;
                  do
                  {
                    for (j = 0; j != v40; j = (char *)j + 1)
                    {
                      if (*(_QWORD *)v153 != v41)
                        objc_enumerationMutation(v38);
                      v43 = *(void **)(*((_QWORD *)&v152 + 1) + 8 * (_QWORD)j);
                      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", v25));
                      objc_msgSend(v12, "setObject:forKeyedSubscript:", v43, v44);

                    }
                    v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v152, v172, 16);
                  }
                  while (v40);
                }

                v24 = 1;
                v26 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
                v33 = v141;
                v32 = v143;
              }
              objc_autoreleasePoolPop(v36);
              v34 = (char *)v34 + 1;
            }
            while (v34 != v32);
            v32 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v156, v173, 16);
          }
          while (v32);
        }

        v27 = v139 + 1;
      }
      while ((id)(v139 + 1) != v135);
      v135 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v160, v174, 16);
    }
    while (v135);
  }

  v45 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager intersectedValuesSettingForFeature:withUserSettingDectionary:](MCRestrictionManager, "intersectedValuesSettingForFeature:withUserSettingDectionary:", MCFeatureWebContentFilterWhitelistedBookmarks, v130));
  v144 = MCFeatureWebContentFilterWhitelistedURLs;
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager intersectedValuesSettingForFeature:withUserSettingDectionary:](MCRestrictionManager, "intersectedValuesSettingForFeature:withUserSettingDectionary:"));
  v47 = objc_msgSend(v46, "count");
  v147 = v45;
  if (v47 == objc_msgSend(v45, "count") && objc_msgSend(v46, "count"))
  {
    v48 = 0;
    v49 = kMCWCFAddressKey;
    v50 = kMCWCFPageTitleKey;
    do
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectAtIndexedSubscript:", v48));
      v171[0] = v51;
      v170[0] = v49;
      v170[1] = v50;
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectAtIndexedSubscript:", v48));
      v171[1] = v52;
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v171, v170, 2));
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v53, v51);

      v45 = v147;
      ++v48;
    }
    while (v48 < (unint64_t)objc_msgSend(v46, "count"));
  }
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v54, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("restrictWeb"));
  if (!_os_feature_enabled_impl("ScreenTime", "simplified_agent"))
  {
    if ((v24 & 1) == 0)
    {
      v58 = (void *)objc_opt_new(MOEffectiveSettingsStore);
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "webContent"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "blockedByFilter"));
      v61 = objc_msgSend(v60, "policy");

      if (!v61)
        goto LABEL_48;
    }
    goto LABEL_47;
  }
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[MOWebContentSettingsGroup blockedByFilterMetadata](MOWebContentSettingsGroup, "blockedByFilterMetadata"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "responsibleClients"));
  v57 = objc_msgSend(v56, "containsObject:", CFSTR("com.apple.ScreenTime"));

  if ((v57 & 1) == 0)
LABEL_47:
    objc_msgSend(v54, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("noOverridingAllowed"));
LABEL_48:
  v62 = v130;
  v63 = +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", MCFeatureWebContentFilterAutoForced, v130);
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v63 == 1));
  objc_msgSend(v54, "setObject:forKeyedSubscript:", v64, CFSTR("useContentFilter"));

  v65 = objc_claimAutoreleasedReturnValue(+[MCRestrictionManager intersectedValuesSettingForFeature:withUserSettingDectionary:](MCRestrictionManager, "intersectedValuesSettingForFeature:withUserSettingDectionary:", MCFeatureWebContentFilterAutoPermittedURLs, v130));
  v142 = (void *)v65;
  if (v65)
    v66 = (void *)v65;
  else
    v66 = &__NSArray0__struct;
  objc_msgSend(v54, "setObject:forKeyedSubscript:", v66, CFSTR("filterWhitelist"));
  if (v46)
  {
    v140 = v63;
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager intersectedValuesSettingForFeature:withUserSettingDectionary:](MCRestrictionManager, "intersectedValuesSettingForFeature:withUserSettingDectionary:", v144, v130));
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v67));

    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allKeys"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v69));

    objc_msgSend(v70, "intersectSet:", v68);
    v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v70, "count")));
    v148 = 0u;
    v149 = 0u;
    v150 = 0u;
    v151 = 0u;
    v72 = v70;
    v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v148, v169, 16);
    if (v73)
    {
      v74 = v73;
      v75 = *(_QWORD *)v149;
      do
      {
        for (k = 0; k != v74; k = (char *)k + 1)
        {
          if (*(_QWORD *)v149 != v75)
            objc_enumerationMutation(v72);
          v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v148 + 1) + 8 * (_QWORD)k)));
          objc_msgSend(v71, "addObject:", v77);

        }
        v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v148, v169, 16);
      }
      while (v74);
    }

    objc_msgSend(v54, "setObject:forKeyedSubscript:", v71, CFSTR("siteWhitelist"));
    v62 = v130;
    v63 = v140;
  }
  v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v46 != 0));
  objc_msgSend(v54, "setObject:forKeyedSubscript:", v78, CFSTR("whitelistEnabled"));

  v79 = objc_claimAutoreleasedReturnValue(+[MCRestrictionManager unionValuesSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "unionValuesSettingForFeature:withUserSettingDictionary:", MCFeatureWebContentFilterBlacklistedURLs, v62));
  v80 = (void *)v79;
  if (v79)
    v81 = (void *)v79;
  else
    v81 = &__NSArray0__struct;
  v82 = v81;

  objc_msgSend(v54, "setObject:forKeyedSubscript:", v82, CFSTR("filterBlacklist"));
  v138 = v82;
  if (v142)
    v83 = 1;
  else
    v83 = objc_msgSend(v82, "count") != 0;
  v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v83));
  objc_msgSend(v54, "setObject:forKeyedSubscript:", v84, CFSTR("useContentFilterOverrides"));

  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "objectForKeyedSubscript:", CFSTR("whitelistEnabled")));
  v86 = (v46 != 0) ^ objc_msgSend(v85, "BOOLValue");

  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "objectForKeyedSubscript:", CFSTR("useContentFilter")));
  v88 = (v63 == 1) ^ objc_msgSend(v87, "BOOLValue");

  v124 = v86 | v88;
  if ((v86 | v88) == 1)
    sub_100091EC0(v88, v63 == 1, v86, v46 != 0);
  v89 = objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("filterWhitelist")));
  v90 = (void *)v89;
  if (v89)
    v91 = (void *)v89;
  else
    v91 = &__NSArray0__struct;
  v145 = v91;

  v92 = objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "objectForKeyedSubscript:", CFSTR("filterWhitelist")));
  v93 = (void *)v92;
  if (v92)
    v94 = (void *)v92;
  else
    v94 = &__NSArray0__struct;
  v95 = v94;

  v96 = objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("filterBlacklist")));
  v97 = (void *)v96;
  if (v96)
    v98 = (void *)v96;
  else
    v98 = &__NSArray0__struct;
  v99 = v54;
  v100 = v98;

  v101 = objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "objectForKeyedSubscript:", CFSTR("filterBlacklist")));
  v102 = (void *)v101;
  if (v101)
    v103 = (void *)v101;
  else
    v103 = &__NSArray0__struct;
  v104 = v103;

  v134 = v99;
  v105 = objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("siteWhitelist")));
  v106 = (void *)v105;
  if (v105)
    v107 = (void *)v105;
  else
    v107 = &__NSArray0__struct;
  v108 = v107;

  v109 = objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "objectForKeyedSubscript:", CFSTR("siteWhitelist")));
  v110 = (void *)v109;
  if (v109)
    v111 = (void *)v109;
  else
    v111 = &__NSArray0__struct;
  v112 = v111;

  v136 = v95;
  v113 = objc_msgSend(v145, "isEqualToArray:", v95) ^ 1;
  v125 = v104;
  v114 = objc_msgSend(v100, "isEqualToArray:", v104) ^ 1;
  v115 = (uint64_t)objc_msgSend(v108, "isEqualToArray:", v112);
  v116 = v115 ^ 1;
  v117 = v130;
  if ((v113 & 1) != 0 || (v114 & 1) != 0 || v116)
  {
    v118 = objc_msgSend(v145, "count");
    v119 = objc_msgSend(v100, "count");
    v120 = objc_msgSend(v108, "count");
    v121 = (uint64_t)v118;
    v117 = v130;
    v115 = sub_100091CD8(v113, v121, v114, (uint64_t)v119, v116, (uint64_t)v120);
  }
  if (a5)
    *a5 = v124;
  if (a4)
  {
    v115 = (uint64_t)objc_msgSend(v129, "isEqualToDictionary:", v134);
    *a4 = v115 ^ 1;
  }
  v122 = MCWebContentFilterOutputPath(v115);
  v123 = (void *)objc_claimAutoreleasedReturnValue(v122);
  objc_msgSend(v134, "MCWriteToBinaryFile:", v123);

}

- (void)recomputeHacksAfterProfileChangesEffectiveUserSettings:(id)a3 sendNotifications:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  char v9;
  char v10;
  char v11;

  v4 = a4;
  v6 = a3;
  -[MCServerSideHacks recomputeAppRulesForNetworkExtension](self, "recomputeAppRulesForNetworkExtension");
  v11 = 0;
  -[MCServerSideHacks recomputeAppOptionsEffectiveUserSettings:outEffectiveChangeDetected:](self, "recomputeAppOptionsEffectiveUserSettings:outEffectiveChangeDetected:", v6, &v11);
  v10 = 0;
  v9 = 0;
  -[MCServerSideHacks recomputeWebContentFilterEffectiveUserSettings:outEffectiveChangeDetected:outMechanismChangedDetected:](self, "recomputeWebContentFilterEffectiveUserSettings:outEffectiveChangeDetected:outMechanismChangedDetected:", v6, &v10, &v9);

  if (v4)
  {
    if (v11)
      v7 = MCSendAppWhitelistChangedNotification();
    if (v9)
      v7 = MCSendWebContentFilterTypeChangedNotification(v7);
    if (v10)
      MCSendWebContentFilterChangedNotification(v7);
  }
  if (v11)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MDMClient sharedClient](MDMClient, "sharedClient"));
    objc_msgSend(v8, "retryNotNowResponse");

  }
}

- (void)applyGracePeriodSettingFromKeybagToUserSettings
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  _DWORD v10[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  v3 = MCFeaturePasscodeLockGraceTime;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueSettingForFeature:", MCFeaturePasscodeLockGraceTime));
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  v6 = MCKeybagCurrentPasscodeGracePeriod();
  if (v5 != (id)v6)
  {
    v7 = v6;
    v8 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109120;
      v10[1] = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Setting grace period to %u to match keybag value.", (uint8_t *)v10, 8u);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
    objc_msgSend(v2, "setValue:forSetting:sender:", v9, v3, CFSTR("MCServerSideHacks.ApplyGracePeriodSettingFromKeybag"));

  }
}

- (void)resetSettingsSender:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v4, "setBoolValue:forSetting:sender:", 0, MCFeatureDiagnosticsSubmissionAllowed, v3);
  objc_msgSend(v4, "setBoolValue:forSetting:sender:", 0, MCFeatureAppAnalyticsAllowed, v3);

}

- (void)setUserTrackingTCCAccessOverrideForRestrictions:(id)a3
{
  _BOOL8 v3;

  v3 = +[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", MCFeatureLimitAdTrackingForced, a3) == 1;
  TCCAccessSetOverride(kTCCServiceUserTracking, v3);
}

@end
