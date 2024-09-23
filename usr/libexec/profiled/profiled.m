id sub_100004164(uint64_t a1)
{
  uint64_t v3;

  if (os_log_type_enabled((os_log_t)_MCLogObjects[2], OS_LOG_TYPE_DEBUG))
    sub_10009A854();
  LODWORD(v3) = *(_DWORD *)(a1 + 96);
  return objc_msgSend(*(id *)(a1 + 32), "_workerQueue_setParametersForSettingsByType:configurationUUID:toSystem:user:passcode:credentialSet:senderPID:sender:assertion:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 100), *(unsigned __int8 *)(a1 + 101), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v3, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
}

BOOL sub_10000477C(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;

  v4 = (void *)MCBiometricKitClass();
  if (!v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "manager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getProtectedConfiguration"));
  v7 = v6;
  if (v6)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BKUserCfgTouchIDUnlockEnabled")));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("BKUserCfgTouchIDApplePayEnabled")));
    v10 = (v8 | v9) != 0;
    if (v8 | v9)
    {
      if (a1)
        *a1 = objc_retainAutorelease((id)v8);
      if (a2)
        *a2 = objc_retainAutorelease((id)v9);
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void sub_1000058F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100006FF4(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "memberQueueSetParametersForSettingsByType:configurationUUID:toSystem:user:passcode:credentialSet:sender:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 88), *(unsigned __int8 *)(a1 + 89), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = (_BYTE)result;
  return result;
}

uint64_t start()
{
  void *v0;
  int AppBooleanValue;
  BOOL v2;
  uint64_t v3;
  int v4;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  NSObject *v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  MCProfileServiceDelegate *v17;
  void *v18;
  void *v19;
  char v21;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  const __CFString *v24;

  MCIsDaemonProcess = 1;
  MCLoggingInitialize();
  +[NSError _setFileNameLocalizationEnabled:](NSError, "_setFileNameLocalizationEnabled:", 0);
  v0 = objc_autoreleasePoolPush();
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(kMCInternalAbortOnUnreadableFiles, kCFPreferencesAnyApplication, &keyExistsAndHasValidFormat);
  v21 = 0;
  if (keyExistsAndHasValidFormat)
    v2 = AppBooleanValue == 0;
  else
    v2 = 1;
  v3 = v2;
  v4 = MCCheckSystemGroupContainerFileReadability(v3, &v21);
  v5 = _MCLogObjects[2];
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)_MCLogObjects[2], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "System group container check complete!", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)_MCLogObjects[2], OS_LOG_TYPE_ERROR))
    {
      if (v21)
        v6 = CFSTR("recoverable");
      else
        v6 = CFSTR("unrecoverable");
      *(_DWORD *)buf = 138543362;
      v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "System group container check found %{public}@ errors!", buf, 0xCu);
    }
    if ((v3 & 1) == 0)
      abort();
  }
  objc_autoreleasePoolPop(v0);
  v7 = objc_autoreleasePoolPush();
  v8 = _MCLogObjects[2];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Service starting...", buf, 2u);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_1000073B4, CFSTR("com.apple.language.changed"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  +[MCProfileStateHandler addProfileSettingsStateHandler](MCProfileStateHandler, "addProfileSettingsStateHandler");
  +[MCProfileStateHandler addProfileRestrictionsStateHandler](MCProfileStateHandler, "addProfileRestrictionsStateHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
  objc_msgSend(v10, "start");
  v11 = objc_alloc((Class)NSXPCListener);
  v12 = objc_msgSend(v11, "initWithMachServiceName:", MCProfileServiceName);
  v13 = (void *)qword_1000FD7D0;
  qword_1000FD7D0 = (uint64_t)v12;

  v14 = objc_alloc((Class)NSXPCListener);
  v15 = objc_msgSend(v14, "initWithMachServiceName:", MCProfileServicePublicName);
  v16 = (void *)qword_1000FD7D8;
  qword_1000FD7D8 = (uint64_t)v15;

  v17 = objc_opt_new(MCProfileServiceDelegate);
  v18 = (void *)qword_1000FD7E0;
  qword_1000FD7E0 = (uint64_t)v17;

  objc_msgSend((id)qword_1000FD7D0, "setDelegate:", qword_1000FD7E0);
  objc_msgSend((id)qword_1000FD7D8, "setDelegate:", qword_1000FD7E0);
  objc_msgSend((id)qword_1000FD7D0, "resume");
  objc_msgSend((id)qword_1000FD7D8, "resume");

  objc_autoreleasePoolPop(v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  objc_msgSend(v19, "run");

  return 0;
}

uint64_t sub_1000073B4()
{
  NSObject *v0;
  uint8_t v2[16];

  v0 = _MCLogObjects[2];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "System language changed", v2, 2u);
  }
  return xpc_transaction_exit_clean();
}

void sub_10000741C(id a1)
{
  MCProfileServiceServer *v1;
  void *v2;

  v1 = objc_alloc_init(MCProfileServiceServer);
  v2 = (void *)qword_1000FD7F0;
  qword_1000FD7F0 = (uint64_t)v1;

}

void sub_1000076D0(uint64_t a1)
{
  void *v2;
  MCMigrator *v3;
  void *v4;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "workerQueueBackgroundActivityManager"));
  objc_msgSend(v2, "start");

  if ((MCHasMigrated() & 1) == 0)
  {
    v3 = objc_opt_new(MCMigrator);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "workerQueue"));
    -[MCMigrator migrateWithPostMigrationTaskQueue:](v3, "migrateWithPostMigrationTaskQueue:", v4);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
}

void sub_10000775C(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  MCProfileDaemonManagedConfigurationHelper *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  int out_token;
  _QWORD handler[5];
  _BYTE v30[128];

  objc_msgSend(*(id *)(a1 + 32), "_workerQueuePrepareForService");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v2, "removeOrphanedClientRestrictions");
  objc_msgSend(v2, "recomputeUserRestrictionsAndEffectiveUserSettings");
  if (!+[DMCMultiUserModeUtilities isSharediPad](DMCMultiUserModeUtilities, "isSharediPad")
    || (v3 = objc_msgSend((id)MCUMUserManagerClass(), "sharedManager"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(v3),
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentUser")),
        v6 = objc_msgSend(v5, "isLoginUser"),
        v5,
        v4,
        v6))
  {
    objc_msgSend(*(id *)(a1 + 32), "workerQueueNotifyUserLoggedIn");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManager sharedManager](MCPasscodeManager, "sharedManager"));
  v8 = objc_msgSend(v7, "isPasscodeSet");

  if ((v8 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "notifyFirstUnlock");
    objc_msgSend(*(id *)(a1 + 32), "notifyDeviceUnlockedWithCompletion:", 0);
  }
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100007ADC;
  handler[3] = &unk_1000E2C78;
  handler[4] = *(_QWORD *)(a1 + 32);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", 0, handler);
  xpc_set_event_stream_handler("com.apple.fsevents.matching", 0, &stru_1000E2CB8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "appWorkspace"));
  objc_msgSend(v9, "addObserver:", *(_QWORD *)(a1 + 32));

  out_token = 0;
  notify_register_dispatch("com.apple.message.MailAccountsChanged", &out_token, *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 88), &stru_1000E2CF8);
  objc_msgSend(*(id *)(a1 + 32), "notifyBatterySaverModeChanged");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v10, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "localeChanged", NSCurrentLocaleDidChangeNotification, 0);

  objc_msgSend(*(id *)(a1 + 32), "reapplyAppEnforcedRestrictionsWithAssertion:", *(_QWORD *)(a1 + 40));
  v11 = +[MCProfile thisDeviceType](MCProfile, "thisDeviceType");
  if (+[MCTargetDeviceResolver purgatorySupportedForDevice:](MCTargetDeviceResolver, "purgatorySupportedForDevice:", v11))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](MCInstaller, "sharedInstaller"));
    objc_msgSend(v12, "purgePurgatoryProfilesForTargetDevice:", v11);

  }
  if ((+[DMCMultiUserModeUtilities isSharediPad](DMCMultiUserModeUtilities, "isSharediPad") & 1) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](MDMConfiguration, "sharedConfiguration"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "memberQueueManagingProfileIdentifier"));

    if (!v14)
    {
      v15 = objc_opt_new(MCProfileDaemonManagedConfigurationHelper);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[DMCEnrollmentFlowController enrollmentFlowControllerWithPresenter:managedConfigurationHelper:](DMCEnrollmentFlowController, "enrollmentFlowControllerWithPresenter:managedConfigurationHelper:", 0, v15));

      objc_msgSend(v16, "cleanUpDirtyState");
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](MDMConfiguration, "sharedConfiguration"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "personaID"));

    if (!v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[DMCPersonaHelper fetchDirtyPersonaIDs](DMCPersonaHelper, "fetchDirtyPersonaIDs"));
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v25;
        do
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v25 != v22)
              objc_enumerationMutation(v19);
            +[DMCPersonaHelper removePersonaAndAccountsWithPersonaID:](DMCPersonaHelper, "removePersonaAndAccountsWithPersonaID:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v23));
            v23 = (char *)v23 + 1;
          }
          while (v21 != v23);
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
        }
        while (v21);
      }

    }
  }
  +[DMCPersonaHelper untrackAllDirtyPersonas](DMCPersonaHelper, "untrackAllDirtyPersonas");

}

void sub_100007ADC(uint64_t a1, xpc_object_t xdict)
{
  NSString *v3;
  id v4;

  v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(xdict, _xpc_event_key_name));
  v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.system.lowpowermode")))
  {
    objc_msgSend(*(id *)(a1 + 32), "notifyBatterySaverModeChanged");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("GracePeriodChanged")))
  {
    objc_msgSend(*(id *)(a1 + 32), "notifyGracePeriodChanged");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("ProvisioningProfileInstalled"))
         || objc_msgSend(v4, "isEqualToString:", CFSTR("ProvisioningProfileRemoved")))
  {
    objc_msgSend(*(id *)(a1 + 32), "notifyProvisioningProfilesChanged");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("FirstUnlock")))
  {
    objc_msgSend(*(id *)(a1 + 32), "notifyFirstUnlock");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.LoginKit.isLoggedIn")))
  {
    objc_msgSend(*(id *)(a1 + 32), "notifyUserLoggedIn");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.keystore.memento.effaced")))
  {
    objc_msgSend(*(id *)(a1 + 32), "notifyMementoEffaced");
  }

}

void sub_100007C08(id a1, int a2)
{
  +[MailAccount reloadAccounts](MailAccount, "reloadAccounts");
}

void sub_100007C48(id a1)
{
  void *v1;
  NSObject *v2;
  const __CFString *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  const __CFString *v12;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[MCBatterySaverMode currentBatterySaverRestrictions](MCBatterySaverMode, "currentBatterySaverRestrictions"));
  v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    v3 = CFSTR("Setting");
    if (!v1)
      v3 = CFSTR("Removing");
    *(_DWORD *)buf = 138543362;
    v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ battery saver mode restrictions", buf, 0xCu);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  v5 = kBatterySaverClientType;
  v6 = MCLocalizedFormat(CFSTR("BATTERY_SAVER_CLIENT_TYPE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v10 = 0;
  objc_msgSend(v4, "setClientRestrictions:clientType:clientUUID:sender:localizedClientDescription:localizedWarning:outRestrictionsChanged:outEffectiveSettingsChanged:outRecomputedNag:outError:", v1, v5, v5, CFSTR("ProfileServiceServer.NotifyBatterySaverModeChanged"), v7, 0, 0, 0, 0, &v10);
  v8 = (__CFString *)v10;

  if (v8)
  {
    v9 = _MCLogObjects[2];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to set battery saver restrictions with error %{public}@", buf, 0xCu);
    }
  }

}

void sub_100007ED0()
{
  id v0;
  id v1;
  uint64_t v2;
  void *i;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id obj;
  uint64_t v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  _BYTE v27[128];

  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(+[MCAppEnforcedRestrictions restrictionEnforcingApps](MCAppEnforcedRestrictions, "restrictionEnforcingApps"));
  v0 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v0)
  {
    v1 = v0;
    v17 = *(_QWORD *)v20;
    v2 = kAppEnforcedRestrictionsClientType;
    do
    {
      for (i = 0; i != v1; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCAppEnforcedRestrictions enforcedRestrictionsForBundleID:](MCAppEnforcedRestrictions, "enforcedRestrictionsForBundleID:", v4));
        v6 = v4;
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", v6));
        v8 = v7;
        v9 = v6;
        if (v7)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedName"));
          v11 = objc_msgSend(v10, "length");

          v9 = v6;
          if (v11)
          {
            v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedName"));

          }
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCAppEnforcedRestrictionUtilities clientUUIDForBundleID:](MCAppEnforcedRestrictionUtilities, "clientUUIDForBundleID:", v6));
        v18 = 0;
        objc_msgSend(v12, "setClientRestrictions:clientType:clientUUID:sender:localizedClientDescription:localizedWarning:outRestrictionsChanged:outEffectiveSettingsChanged:outRecomputedNag:outError:", v5, v2, v13, CFSTR("ProfileServiceServer.ReapplyAppEnforcedRestrictions"), v9, 0, 0, 0, 0, &v18);
        v14 = v18;

        if (v14)
        {
          v15 = _MCLogObjects[2];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v24 = v6;
            v25 = 2114;
            v26 = v14;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to set enforced restrictions for app “%{public}@” with error %{public}@", buf, 0x16u);
          }
        }

      }
      v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v1);
  }

}

id sub_100008688(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMemberQueueHasMigrated:", 1);
}

void sub_100008694(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;
  int v4;
  NSError *v5;

  v2 = a2;
  if (v2)
  {
    v3 = _MCLogObjects[0];
    if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Recompute Profile Restrictions error: %@", (uint8_t *)&v4, 0xCu);
    }
  }

}

id sub_100008740(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "workerQueueRecomputeNagMessage");
}

void sub_100008FBC(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG))
    sub_100099D54();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](MCInstaller, "sharedInstaller"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "verifiedMDMProfileIdentifierWithCleanUp"));
  (*(void (**)(uint64_t, _QWORD, void *))(v2 + 16))(v2, 0, v4);

}

void sub_1000090C4(uint64_t a1)
{
  void *v2;
  void *v3;

  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG))
    sub_100099DD4();
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](MCInstaller, "sharedInstaller"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "popProfileDataAtHeadOfInstallationQueue"));

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1000091CC(uint64_t a1)
{
  void *v2;
  void *v3;

  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG))
    sub_100099E54();
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](MCInstaller, "sharedInstaller"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "peekPurgatoryProfileDataForTargetDevice:", *(_QWORD *)(a1 + 40)));

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100009360(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  char v20;
  __int16 v21;

  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG))
    sub_100099ED4();
  v2 = *(id *)(a1 + 32);
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.WebSheet")))
  {

    v2 = 0;
  }
  if (!*(_BYTE *)(a1 + 72))
    goto LABEL_14;
  if (+[DMCMultiUserModeUtilities isSharediPad](DMCMultiUserModeUtilities, "isSharediPad"))
  {
    v3 = MCInstallationErrorDomain;
    v4 = MCErrorArray(CFSTR("ERROR_PROFILE_NO_INTERACTIVE_INSTALLATION_IN_MULTI_USER"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = MCErrorTypeFatal;
    v7 = v3;
    v8 = 4033;
LABEL_11:
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v7, v8, v5, v6, 0));

    goto LABEL_12;
  }
  v21 = 0;
  v9 = MCSBSSpringBoardServerPort();
  MCSBGetScreenLockStatus(v9, (char *)&v21 + 1, &v21);
  v10 = 0;
  if (HIBYTE(v21) && (_BYTE)v21)
  {
    v11 = MCInstallationErrorDomain;
    v12 = MCErrorArray(CFSTR("ERROR_DEVICE_LOCKED"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v6 = MCErrorTypeFatal;
    v7 = v11;
    v8 = 4009;
    goto LABEL_11;
  }
LABEL_12:
  if (!v10)
  {
LABEL_14:
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](MCInstaller, "sharedInstaller"));
    v14 = *(void **)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 48);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000958C;
    v16[3] = &unk_1000E2DF8;
    v16[4] = *(_QWORD *)(a1 + 56);
    v17 = v14;
    v20 = *(_BYTE *)(a1 + 72);
    v18 = v2;
    v19 = *(id *)(a1 + 64);
    objc_msgSend(v13, "queueProfileDataForInstallation:originalFileName:completion:", v17, v15, v16);

    goto LABEL_15;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

LABEL_15:
}

void sub_10000958C(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  id v16;

  v16 = a2;
  v7 = a3;
  if (objc_msgSend(v16, "MCContainsErrorDomain:code:", MCProfileErrorDomain, 1000)
    && objc_msgSend(*(id *)(a1 + 32), "_isValidProvisioningProfileData:", *(_QWORD *)(a1 + 40)))
  {
    v8 = MCInstallationErrorDomain;
    v9 = MCErrorArray(CFSTR("ERROR_PROVISIONING_PROFILE_UI_INSTALL_NOT_SUPPORTED"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v8, 4053, v10, MCErrorTypeFatal, 0));

    v16 = (id)v11;
  }
  if (v7 && !v16 && *(_BYTE *)(a1 + 64))
    objc_msgSend(*(id *)(a1 + 32), "_handleSettingsJumpWithProfileData:targetDeviceType:bundleID:", *(_QWORD *)(a1 + 40), a4, *(_QWORD *)(a1 + 48));
  v12 = *(_QWORD *)(a1 + 56);
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUID"));
  v14 = (void *)v13;
  if (v13)
    v15 = (const __CFString *)v13;
  else
    v15 = &stru_1000E4AA0;
  (*(void (**)(uint64_t, const __CFString *, uint64_t, id))(v12 + 16))(v12, v15, a4, v16);

}

void sub_100009948(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  dispatch_queue_global_t global_queue;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG))
    sub_100099F54();
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](MCInstaller, "sharedInstaller"));
  v3 = objc_msgSend(v2, "verifiedMDMProfileIdentifierWithCleanUp");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](MCInstaller, "sharedInstaller"));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v20 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "installProfileData:options:interactionClient:source:outError:", v5, v6, v7, v8, &v20));
  v10 = v20;

  objc_msgSend(*(id *)(a1 + 48), "didFinishInstallationWithIdentifier:error:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 64), "workerQueueBackgroundActivityManager"));
  objc_msgSend(v11, "rescheduleProfileJanitorJob");

  v12 = *(void **)(a1 + 80);
  if (v12)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v14 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009AD0;
    block[3] = &unk_1000E2E48;
    v19 = v12;
    v16 = v9;
    v17 = v10;
    v18 = *(id *)(a1 + 72);
    dispatch_async(v14, block);

  }
}

uint64_t sub_100009AD0(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5]);
}

void sub_100009C08(uint64_t *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG))
    sub_100099FD4();
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](MCInstaller, "sharedInstaller"));
  v3 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v8 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "updateProfileWithIdentifier:interactionClient:source:outError:", v3, v4, v5, &v8));
  v7 = v8;

  objc_msgSend((id)a1[5], "didFinishInstallationWithIdentifier:error:", v6, v7);
  (*(void (**)(void))(a1[8] + 16))();

}

void sub_100009DD0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG))
    sub_10009A054();
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](MCInstaller, "sharedInstaller"));
  objc_msgSend(v2, "removeProfileWithIdentifier:installationType:source:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40));

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "workerQueueBackgroundActivityManager"));
  objc_msgSend(v3, "rescheduleProfileJanitorJob");

  v4 = *(void **)(a1 + 64);
  if (v4)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue(global_queue);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100009EDC;
    v7[3] = &unk_1000E2EC0;
    v9 = v4;
    v8 = *(id *)(a1 + 56);
    dispatch_async(v6, v7);

  }
}

uint64_t sub_100009EDC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_100009FD8(uint64_t a1)
{
  void *v2;
  void *v3;
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG))
    sub_10009A0D4();
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](MCInstaller, "sharedInstaller"));
  objc_msgSend(v2, "removeUninstalledProfileWithIdentifier:installationType:targetDeviceType:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

  v3 = *(void **)(a1 + 48);
  if (v3)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue(global_queue);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000A0CC;
    v6[3] = &unk_1000E2EC0;
    v8 = v3;
    v7 = *(id *)(a1 + 40);
    dispatch_async(v5, v6);

  }
}

uint64_t sub_10000A0CC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t sub_10000A314(uint64_t a1)
{
  void *v2;

  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG))
    sub_10009A154();
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v2, "removeOrphanedClientRestrictions");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10000A678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

id sub_10000A6A0(uint64_t a1)
{
  id result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "memberQueueHasMigrated");
  result = objc_msgSend(*(id *)(a1 + 32), "memberQueueHasActivationRecordChangesPending");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (_BYTE)result;
  return result;
}

uint64_t sub_10000A6E4(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  v2 = _MCLogObjects[2];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Now allowing client to proceed.", v4, 2u);
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

BOOL sub_10000AFC4(id a1, NSString *a2)
{
  return MCIsAppExemptFromOpenInSourceRestrictions(a2);
}

BOOL sub_10000AFCC(id a1, NSString *a2)
{
  return MCIsAppAccountBasedSourceForOpenIn(a2);
}

uint64_t sub_10000AFD4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

BOOL sub_10000B3C4(id a1, NSString *a2)
{
  return MCIsAppExemptFromImportFromTargetRestrictions(a2);
}

BOOL sub_10000B3CC(id a1, NSString *a2)
{
  return MCIsAppAccountBasedTargetForOpenIn(a2);
}

uint64_t sub_10000B3D4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t sub_10000B898(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

BOOL sub_10000BB98(id a1, MailAccount *a2, NSDictionary *a3)
{
  MailAccount *v3;
  uint64_t v4;
  unsigned int v5;

  v3 = a2;
  v4 = objc_opt_class(LocalAccount);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    LOBYTE(v5) = 0;
  else
    v5 = -[MailAccount restrictedFromSendingExternally](v3, "restrictedFromSendingExternally") ^ 1;

  return v5;
}

BOOL sub_10000BBF0(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  if (objc_msgSend(v3, "sourceIsManaged") && *(_BYTE *)(a1 + 32))
    v4 = 1;
  else
    v4 = (objc_msgSend(v3, "sourceIsManaged") & 1) == 0 && *(_BYTE *)(a1 + 33) != 0;

  return v4;
}

void sub_10000BC54(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "identifier"));
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t sub_10000BC98(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_10000C474(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;

  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG))
    sub_10009A1D4();
  v2 = ((uint64_t (*)(void))MCNagUIMetaFilePath)();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithContentsOfFile:](NSMutableDictionary, "dictionaryWithContentsOfFile:", v3));

  if (v4 && *(_QWORD *)(a1 + 32))
  {
    v5 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v9 = 138543362;
      v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Starting password compliance by %{public}@", (uint8_t *)&v9, 0xCu);
    }
    v7 = MCNagUIMetaFilePath(objc_msgSend(v4, "setObject:forKey:", *(_QWORD *)(a1 + 32), kMCNagMetaTimerExpiryDateKey));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_msgSend(v4, "MCWriteToBinaryFile:", v8);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t sub_10000C6CC(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = MCBackupContainsPasscodeFilePath();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v2, "removeItemAtPath:error:", v4, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v5, "notifyHaveSeenComplianceMessageWithLastLockDate:", *(_QWORD *)(a1 + 32));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t sub_10000C838(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "workerQueueRecomputeNagMessage");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t sub_10000C948(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v2, "notifyClientsToRecomputeCompliance");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_10000CA64(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;

  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG))
    sub_10009A3D4();
  v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ is attempting to clear the recovery passcode", (uint8_t *)&v7, 0xCu);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](MCPasscodeManagerWriter, "sharedManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clearRecoveryPasscode"));

  if (!v5)
  {
    if (objc_msgSend(MCPreferencesBundleIdentifier, "isEqualToString:", *(_QWORD *)(a1 + 32)))
      v6 = 5;
    else
      v6 = 6;
    +[MCPasscodeAnalytics sendRecoveryPasscodeClearedEventWithReason:](MCPasscodeAnalytics, "sendRecoveryPasscodeClearedEventWithReason:", v6);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_10000CCD0(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  id v10;
  unsigned int v11;
  NSObject *v12;
  uint64_t v13;
  char v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;

  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG))
    sub_10009A454();
  v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v20 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ is attempting to change the passcode", buf, 0xCu);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](MCPasscodeManagerWriter, "sharedManager"));
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(unsigned __int8 *)(a1 + 72);
  v8 = *(_QWORD *)(a1 + 32);
  v18 = 0;
  v9 = objc_msgSend(v4, "changePasscodeFrom:to:skipRecovery:senderBundleID:outError:", v5, v6, v7, v8, &v18);
  v10 = v18;

  v11 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", MCSetupAssistantBundleIdentifier);
  if (v9 && v11)
  {
    v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Buddy is changing the passcode; attempting to create unlock token",
        buf,
        2u);
    }
    v13 = *(_QWORD *)(a1 + 48);
    v17 = v10;
    v14 = MCKeybagCreateMDMEscrowWithPasscode(v13, &v17);
    v15 = v17;

    if ((v14 & 1) == 0)
    {
      v16 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v20 = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Can't create escrow keybag. Error: %{public}@", buf, 0xCu);
      }
    }
  }
  else
  {
    v15 = v10;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

void sub_10000D000(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;

  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG))
    sub_10009A4D4();
  v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ is attempting to change the passcode with recovery passcode", buf, 0xCu);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](MCPasscodeManagerWriter, "sharedManager"));
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(unsigned __int8 *)(a1 + 72);
  v8 = *(_QWORD *)(a1 + 32);
  v10 = 0;
  objc_msgSend(v4, "changePasscodeWithRecoveryPasscode:to:skipRecovery:senderBundleID:outError:", v5, v6, v7, v8, &v10);
  v9 = v10;

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

void sub_10000D1FC(uint64_t a1)
{
  uint64_t v2;
  char v3;
  id v4;
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  id v8;

  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG))
    sub_10009A554();
  v2 = *(_QWORD *)(a1 + 32);
  v6 = 0;
  v3 = MCKeybagCreateMDMEscrowWithPasscode(v2, &v6);
  v4 = v6;
  if ((v3 & 1) == 0)
  {
    v5 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Can't create escrow keybag. Error: %{public}@", buf, 0xCu);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_10000D428(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;

  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG))
    sub_10009A5D4();
  v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ is attempting to clear the passcode", buf, 0xCu);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](MCPasscodeManagerWriter, "sharedManager"));
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 32);
  v9 = 0;
  objc_msgSend(v4, "clearPasscodeWithEscrowKeybagData:secret:senderBundleID:outError:", v5, v6, v7, &v9);
  v8 = v9;

  objc_msgSend(*(id *)(a1 + 56), "workerQueueRecomputeNagMessage");
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

}

void sub_10000D5EC(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG))
    sub_10009A654();
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManager sharedManager](MCPasscodeManager, "sharedManager"));
  v3 = *(_QWORD *)(a1 + 32);
  v5 = 0;
  objc_msgSend(v2, "isPasscodeCompliantWithNamedPolicy:outError:", v3, &v5);
  v4 = v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t sub_10000D744(uint64_t a1)
{
  void *v2;

  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG))
    sub_10009A6D4();
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](MCPasscodeManagerWriter, "sharedManager"));
  objc_msgSend(v2, "resetPasscodeMetadata");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_10000D930(uint64_t a1)
{
  MCMigrator *v2;

  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG))
    sub_10009A754();
  v2 = objc_opt_new(MCMigrator);
  -[MCMigrator migratePostDataMigratorWithContext:passcodeWasSetInBackup:](v2, "migratePostDataMigratorWithContext:passcodeWasSetInBackup:", *(unsigned int *)(a1 + 48), *(unsigned __int8 *)(a1 + 52));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_10000DA64(uint64_t a1)
{
  MCMigrator *v2;
  const __CFString *v3;

  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG))
    sub_10009A7D4();
  v2 = objc_opt_new(MCMigrator);
  -[MCMigrator migrateCleanupMigratorWithContext:](v2, "migrateCleanupMigratorWithContext:", *(unsigned int *)(a1 + 56));
  v3 = (const __CFString *)kMCNotBackedUpPreferencesDomain;
  CFPreferencesSetAppValue(kMCHasCheckedForAutoInstalledProfiles, kCFBooleanFalse, kMCNotBackedUpPreferencesDomain);
  CFPreferencesAppSynchronize(v3);
  objc_msgSend(*(id *)(a1 + 32), "workerQueueCheckForAutoInstallProfiles");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t sub_10000DD84(_QWORD *a1)
{
  void *v2;

  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG))
    sub_10009A8D4();
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v2, "removeBoolSetting:sender:", a1[4], a1[5]);

  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

uint64_t sub_10000DEF8(_QWORD *a1)
{
  void *v2;

  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG))
    sub_10009A954();
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v2, "removeValueSetting:sender:", a1[4], a1[5]);

  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

uint64_t sub_10000E018(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  os_log_t v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;

  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG))
    sub_10009A9D4();
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    v13 = MCSBSApplicationLaunchFromURLOptionUnlockDeviceKey();
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 48)));
    v14 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
    v6 = objc_msgSend(v3, "openSensitiveURL:withOptions:", v2, v5);

    if ((v6 & 1) == 0)
    {
      v7 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v8 = v7;
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "absoluteString"));
        v11 = 138543362;
        v12 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Open of URL %{public}@ reported failure", (uint8_t *)&v11, 0xCu);

      }
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_10000E93C(id a1, NSDictionary *a2, NSError *a3)
{
  NSDictionary *v4;
  NSError *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  int v11;
  NSError *v12;

  v4 = a2;
  v5 = a3;
  v6 = _MCLogObjects[2];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "authenticateWithContext Completion block...", (uint8_t *)&v11, 2u);
  }
  if (v5)
  {
    v7 = _MCLogObjects[2];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 138543362;
      v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed toauthenticateWithContext with the following error: %{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    v8 = objc_alloc_init((Class)AIDAMutableServiceContext);
    objc_msgSend(v8, "setAuthenticationResults:", v4);
    objc_msgSend(v8, "setShouldForceOperation:", 0);
    objc_msgSend(v8, "setOperationUIPermissions:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
    v10 = objc_msgSend(objc_alloc((Class)AIDAServiceOwnersManager), "initWithAccountStore:", v9);
    objc_msgSend(v10, "signInService:withContext:completion:", AIDAServiceTypeFaceTime, v8, &stru_1000E3270);

  }
}

void sub_10000EACC(id a1, BOOL a2, NSError *a3)
{
  _BOOL4 v3;
  NSError *v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  int v10;
  NSError *v11;

  v3 = a2;
  v4 = a3;
  v5 = _MCLogObjects[2];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "signInService Completion block...", (uint8_t *)&v10, 2u);
  }
  v6 = _MCLogObjects[2];
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = v4;
      v7 = "Succesfully signed in to service AIDAServiceTypeFaceTime, error: %{public}@";
      v8 = v6;
      v9 = OS_LOG_TYPE_DEFAULT;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v10 = 138543362;
    v11 = v4;
    v7 = "Failed to sign in to service AIDAServiceTypeFaceTime with error: %{public}@";
    v8 = v6;
    v9 = OS_LOG_TYPE_ERROR;
    goto LABEL_8;
  }

}

void sub_10000F664(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  os_log_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  char v22;
  uint8_t buf[4];
  void *v24;

  v5 = a2;
  v6 = a3;
  v20[2] = sub_10000F8A0;
  v20[3] = &unk_1000E32C0;
  v7 = *(void **)(a1 + 40);
  v20[4] = *(_QWORD *)(a1 + 32);
  v22 = *(_BYTE *)(a1 + 48);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v21 = v7;
  v8 = objc_retainBlock(v20);
  v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v8;
  if (v6)
  {
    v10 = _MCLogObjects[2];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "MCVerboseDescription"));
      *(_DWORD *)buf = 138543362;
      v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "CheckCarrierProfile: Error getting data SIM: %{public}@", buf, 0xCu);

    }
    ((void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, id))v9)[2](v9, 0, 0, 0, 0, v6);
  }
  else if (v5)
  {
    v13 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000FA20;
    v17[3] = &unk_1000E32E8;
    v14 = v8;
    v15 = *(_QWORD *)(a1 + 32);
    v19 = v14;
    v17[4] = v15;
    v18 = v5;
    objc_msgSend(v13, "getSIMStatus:completion:", v18, v17);

  }
  else
  {
    v16 = _MCLogObjects[2];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "CheckCarrierProfile: No SIM is marked as data SIM.", buf, 2u);
    }
    v9[2](v9, 1, 0, 0, 0, 0);
  }

}

void sub_10000F8A0(uint64_t a1, char a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  char v27;
  char v28;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "workerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F9D0;
  block[3] = &unk_1000E3298;
  v27 = a2;
  v16 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v22 = v11;
  v23 = v12;
  v24 = v13;
  v28 = *(_BYTE *)(a1 + 48);
  v25 = v14;
  v26 = v16;
  v17 = v14;
  v18 = v13;
  v19 = v12;
  v20 = v11;
  dispatch_async(v15, block);

}

uint64_t sub_10000F9D0(uint64_t a1)
{
  uint64_t result;

  if (*(_BYTE *)(a1 + 80))
    objc_msgSend(*(id *)(a1 + 32), "_workerQueueCheckCarrierProfileForCarrierIdentifier:name:atPath:forceReinstallation:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 81));
  result = *(_QWORD *)(a1 + 72);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 64));
  return result;
}

void sub_10000FA20(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  os_log_t v7;
  NSObject *v8;
  void *v9;
  void (*v10)(void);
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;

  v5 = a2;
  v6 = a3;
  v7 = _MCLogObjects[2];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "MCVerboseDescription"));
    *(_DWORD *)buf = 138543618;
    v20 = v5;
    v21 = 2114;
    v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CheckCarrierProfile: getSIMStatus status:%{public}@ error:%{public}@)", buf, 0x16u);

  }
  if (v6)
  {
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", kCTSIMSupportSIMStatusNotInserted))
    {
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10000FBE8;
      v16[3] = &unk_1000E32E8;
      v13 = *(id *)(a1 + 48);
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(a1 + 40);
      v18 = v13;
      v16[4] = v14;
      v17 = v15;
      objc_msgSend(v12, "copyCarrierBundleLocation:completion:", v11, v16);

      goto LABEL_8;
    }
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v10();
LABEL_8:

}

void sub_10000FBE8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  os_log_t v7;
  NSObject *v8;
  void *v9;
  void (*v10)(void);
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  void *v17;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = _MCLogObjects[2];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "MCVerboseDescription"));
      v16 = 138543362;
      v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "CheckCarrierProfile: Could not find carrier bundle path. Error: %{public}@", (uint8_t *)&v16, 0xCu);

    }
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_5:
    v10();
    goto LABEL_10;
  }
  if (!v5)
  {
    v15 = _MCLogObjects[2];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "CheckCarrierProfile: Could not find carrier bundle path.", (uint8_t *)&v16, 2u);
    }
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_5;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_carrierIdentifierFromContext:", *(_QWORD *)(a1 + 40)));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_carrierNameFromContext:", *(_QWORD *)(a1 + 40)));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("profile.mobileconfig")));
  v14 = _MCLogObjects[2];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138543362;
    v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "CheckCarrierProfile: Evaluating carrier profile at: %{public}@", (uint8_t *)&v16, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

LABEL_10:
}

void sub_1000102D8(uint64_t a1)
{
  void *v2;

  if (mach_timebase_info((mach_timebase_info_t)&dword_1000FD800))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v2, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("MCProfileServiceServer.m"), 1893, CFSTR("mach_timebase_info not available"));

  }
  else
  {
    qword_1000FD808 = (1000000000 * dword_1000FD804);
  }
  byte_1000FD810 = 1;
}

void sub_100010364(id a1, NSError *a2)
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = _MCLogObjects[0];
  if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "CheckCarrierProfile: Device was unlocked, check complete.", v3, 2u);
  }
}

uint64_t sub_100010588(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "workerQueueNotifyDeviceUnlockedAndPasscodeRequired");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t sub_100010694(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "workerQueueNotifyDeviceUnlocked");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

id sub_10001072C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "workerQueueReadBiometricState");
}

void sub_100010744(id a1)
{
  NSObject *v1;
  void *v2;
  uint8_t v3[16];

  v1 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Rereading grace period", v3, 2u);
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks sharedHacks](MCServerSideHacks, "sharedHacks"));
  objc_msgSend(v2, "applyGracePeriodSettingFromKeybagToUserSettings");

}

void sub_10001081C(uint64_t a1)
{
  NSObject *v2;
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Provisioning profiles changed", v8, 2u);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v4, &stru_1000E3398);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "workerQueueBackgroundActivityManager"));
  objc_msgSend(v5, "rescheduleProfileJanitorJob");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "workerQueueBackgroundActivityManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 30.0));
  objc_msgSend(v6, "rescheduleManagedAppValidationJob:", v7);

}

void sub_1000108FC(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[MCProvisioningProfileJanitor sharedJanitor](MCProvisioningProfileJanitor, "sharedJanitor"));
  objc_msgSend(v1, "updateMISTrust");

}

id sub_100010AD8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "workerQueueNotifyUserLoggedIn");
}

id sub_100010C60(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "workerQueueNotifyMementoEffaced");
}

void sub_100010CEC(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  unsigned __int8 v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[8];
  _BYTE v18[128];

  v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Applications finished installing", buf, 2u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MDMManagedMediaReader attributesByAppID](MDMManagedMediaReader, "attributesByAppID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));

  if (objc_msgSend(v4, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = *(id *)(a1 + 32);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "bundleIdentifier", (_QWORD)v13));
          v11 = objc_msgSend(v4, "containsObject:", v10);

          if ((v11 & 1) != 0)
          {

            v12 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Managed applications finished installing", buf, 2u);
            }
            v5 = (id)objc_claimAutoreleasedReturnValue(+[MCProvisioningProfileJanitor sharedJanitor](MCProvisioningProfileJanitor, "sharedJanitor"));
            objc_msgSend(v5, "updateMISTrust");
            goto LABEL_16;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_16:

  }
}

void sub_100010FDC(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG))
    sub_10009AA54();
  v2 = MCHCUSetHostCertificateDataForMappedLabel(a1[4], a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](MCDependencyManager, "sharedManager"));
  v5 = a1[5];
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "MCHexString"));
  objc_msgSend(v4, "addDependent:ofParent:inDomain:reciprocalDomain:", v5, v6, kMCDMCertificateToHostIdentifierDependencyKey, kMCDMHostIdentifierToCertificateDependencyKey);

  objc_msgSend(v4, "commitChanges");
  (*(void (**)(void))(a1[7] + 16))();

}

void sub_1000112C0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  dispatch_queue_global_t global_queue;
  NSObject *v9;
  uint64_t UUID;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;

  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG))
    sub_10009AAD4();
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = MISProfileCreateWithData(kCFAllocatorDefault, v2);
    if (v3)
    {
      v4 = (const void *)v3;
      if (MISProvisioningProfileValidateSignature())
        goto LABEL_6;
      if (objc_msgSend(*(id *)(a1 + 48), "length"))
      {
        if (MISProvisioningProfileIsForLocalProvisioning(v4))
        {
          v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_localProvisioningProfileError"));
          goto LABEL_7;
        }
        UUID = MISProvisioningProfileGetUUID(v4);
        if (!UUID)
        {
LABEL_6:
          v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_badProvisioningProfileError"));
LABEL_7:
          v6 = (void *)v5;
LABEL_8:
          CFRelease(v4);
          goto LABEL_10;
        }
        v11 = UUID;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](MCDependencyManager, "sharedManager"));
        v13 = kMCDMManagingProfileToProvisioningProfileKey;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dependentsOfParent:inDomain:", *(_QWORD *)(a1 + 48), kMCDMManagingProfileToProvisioningProfileKey));
        if ((objc_msgSend(v14, "containsObject:", v11) & 1) == 0)
        {
          objc_msgSend(v12, "addDependent:ofParent:inDomain:reciprocalDomain:", v11, *(_QWORD *)(a1 + 48), v13, kMCDMProvisioningProfileToManagingProfileKey);
          objc_msgSend(v12, "commitChanges");
        }

      }
      v15 = MISInstallProvisioningProfile(v4);
      if ((_DWORD)v15)
      {
        v16 = MCProvisioningProfileErrorDomain;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v15));
        v18 = MCErrorArray(CFSTR("PROVISIONING_ERROR_CANNOT_INSTALL_P_CODE"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v16, 25001, v19, MCErrorTypeFatal, v17, 0));

      }
      else
      {
        v6 = 0;
      }
      goto LABEL_8;
    }
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_badProvisioningProfileError"));
LABEL_10:
  v7 = *(void **)(a1 + 64);
  if (v7)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100011534;
    block[3] = &unk_1000E3088;
    v23 = v7;
    v21 = v6;
    v22 = *(id *)(a1 + 56);
    dispatch_async(v9, block);

  }
}

uint64_t sub_100011534(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void sub_10001166C(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  dispatch_queue_global_t global_queue;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG))
    sub_10009AB54();
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](MCInstaller, "sharedInstaller"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "removeProvisioningProfileUUID:sender:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40)));

  if (v3)
  {
    v4 = MCProvisioningProfileErrorDomain;
    v5 = MCErrorArray(CFSTR("PROVISIONING_ERROR_CANNOT_REMOVE_P_CODE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v4, 25002, v6, MCErrorTypeFatal, v3, 0));
LABEL_7:

    goto LABEL_8;
  }
  if (*(_QWORD *)(a1 + 48))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](MCDependencyManager, "sharedManager"));
    objc_msgSend(v6, "removeDependent:fromParent:inDomain:reciprocalDomain:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), kMCDMManagingProfileToProvisioningProfileKey, kMCDMProvisioningProfileToManagingProfileKey);
    objc_msgSend(v6, "commitChanges");
    v7 = 0;
    goto LABEL_7;
  }
  v7 = 0;
LABEL_8:
  v8 = *(void **)(a1 + 64);
  if (v8)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100011838;
    block[3] = &unk_1000E3088;
    v14 = v8;
    v12 = v7;
    v13 = *(id *)(a1 + 56);
    dispatch_async(v10, block);

  }
}

uint64_t sub_100011838(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32) != 0);
}

void sub_100011958(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  int v15;
  uint64_t v16;
  void *i;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  id v40;
  id v41;
  uint8_t buf[4];
  _BYTE v43[14];
  _BYTE v44[128];

  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG))
    sub_10009ABD4();
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100011DE8;
  v39[3] = &unk_1000E33E8;
  v41 = *(id *)(a1 + 56);
  v40 = *(id *)(a1 + 32);
  v2 = objc_retainBlock(v39);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MDMProvisioningProfileTrust signerIdentitiesFromProvisioningProfileUUID:](MDMProvisioningProfileTrust, "signerIdentitiesFromProvisioningProfileUUID:", *(_QWORD *)(a1 + 40)));
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
    v6 = MCFeatureTrustedCodeSigningIdentities;
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "effectiveUnionValuesForSetting:", MCFeatureTrustedCodeSigningIdentities));
    v8 = (void *)v7;
    v9 = &__NSArray0__struct;
    if (v7)
      v9 = (void *)v7;
    v10 = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v10));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v12 = v4;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    if (v13)
    {
      v14 = v13;
      v30 = v6;
      v31 = v10;
      v15 = 0;
      v16 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v36 != v16)
            objc_enumerationMutation(v12);
          v18 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v11, "containsObject:", v18) & 1) == 0)
          {
            objc_msgSend(v11, "addObject:", v18);
            ++v15;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      }
      while (v14);

      v10 = v31;
      if (v15 > 0)
      {
        v19 = _MCLogObjects[2];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 67240450;
          *(_DWORD *)v43 = v15;
          *(_WORD *)&v43[4] = 2114;
          *(_QWORD *)&v43[6] = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Trusting %{public}d new code signing identities for provisioning profile UUID: %{public}@", buf, 0x12u);
        }
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allObjects"));
        objc_msgSend(v21, "setUnionValues:forSetting:sender:", v22, v30, *(_QWORD *)(a1 + 48));

        v23 = (void *)objc_claimAutoreleasedReturnValue(+[MCProvisioningProfileJanitor sharedJanitor](MCProvisioningProfileJanitor, "sharedJanitor"));
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_100011ED4;
        v32[3] = &unk_1000E3410;
        v34 = v2;
        v33 = *(id *)(a1 + 32);
        objc_msgSend(v23, "updateMISTrustAndValidateApps:validateManagedApps:completion:", 0, 0, v32);

        goto LABEL_27;
      }
    }
    else
    {

    }
    v28 = _MCLogObjects[2];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v43 = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "No new code signing identities for provisioning profile UUID: %{public}@", buf, 0xCu);
    }
    ((void (*)(_QWORD *, uint64_t, _QWORD))v2[2])(v2, 1, 0);
  }
  else
  {
    v24 = _MCLogObjects[2];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v43 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "MCProfileServiceServer missing code signing identities for provisioning profile UUID: %{public}@", buf, 0xCu);
    }
    v26 = MCProvisioningProfileErrorDomain;
    v27 = MCErrorArray(CFSTR("PROVISIONING_ERROR_NO_SIGNING_IDENTITIES"));
    v10 = (id)objc_claimAutoreleasedReturnValue(v27);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v26, 25005, v10, MCErrorTypeFatal, 0));
    ((void (*)(_QWORD *, _QWORD, void *))v2[2])(v2, 0, v11);
  }
LABEL_27:

}

void sub_100011DE8(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  char v13;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue(global_queue);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100011EBC;
    v9[3] = &unk_1000E33C0;
    v12 = v6;
    v13 = a2;
    v10 = v5;
    v11 = *(id *)(a1 + 32);
    dispatch_async(v8, v9);

  }
}

uint64_t sub_100011EBC(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
}

uint64_t sub_100011ED4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

id sub_100012044(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "workerQueueRemoveExpiredProfiles");
}

id sub_1000120FC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "workerQueueRevalidateManagedApps");
}

uint64_t sub_1000121A0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1000126DC(uint64_t a1)
{
  void *v2;
  void *v3;

  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG))
    sub_10009AC54();
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v2, "resetAllSettingsToDefaultsSender:", *(_QWORD *)(a1 + 32));

  if (*(_BYTE *)(a1 + 56))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks sharedHacks](MCServerSideHacks, "sharedHacks"));
    objc_msgSend(v3, "resetSettingsSender:", *(_QWORD *)(a1 + 32));

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t sub_1000127F4(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v5[16];

  v2 = _MCLogObjects[2];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Rereading managed app attributes.", v5, 2u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks sharedHacks](MCServerSideHacks, "sharedHacks"));
  objc_msgSend(v3, "recomputeAppRulesForNetworkExtension");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100012CFC(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

id sub_100013480(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMemberQueueHasActivationRecordChangesPending:", 1);
}

void sub_10001348C(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013500;
  block[3] = &unk_1000E2C50;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_barrier_async(v2, block);

}

id sub_100013500(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMemberQueueHasActivationRecordChangesPending:", 0);
}

uint64_t sub_100013BC4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

id sub_100013C7C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "waitForEnrollmentToFinishWithPersonaID:", *(_QWORD *)(a1 + 40));
}

uint64_t sub_100014818(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "workerQueueBackgroundActivityManager"));
  objc_msgSend(v2, "_rescheduleBackgroundActivity:startDate:gracePeriod:priority:repeatingInterval:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56));

  result = *(_QWORD *)(a1 + 72);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void sub_100014A48(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void sub_100016484(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = a2;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "MCShortenedObject:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "MCShortenedObject:", v7));

  objc_msgSend(v5, "setObject:forKey:", v9, v8);
}

void sub_100018684(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v9));
  if (v4)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v4));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v3));
    objc_msgSend(v7, "intersectSet:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v9);

  }
}

uint64_t sub_100019004(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v3, "count") || objc_msgSend(v4, "count"))
    v5 = (uint64_t)objc_msgSend(v3, "isEqualToDictionary:", v4);
  else
    v5 = 1;

  return v5;
}

void sub_1000192D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000192F8(uint64_t a1, void *a2)
{
  id v3;
  os_log_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = a2;
  if (v3)
  {
    v4 = _MCLogObjects[8];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "MCVerboseDescription"));
      v7 = 138543362;
      v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Request user input error. Error: %{public}@", (uint8_t *)&v7, 0xCu);

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_1000193D8(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id *v9;
  id v10;
  id v11;
  id WeakRetained;

  v9 = (id *)(a1 + 7);
  v10 = a5;
  v11 = a2;
  WeakRetained = objc_loadWeakRetained(v9);
  objc_msgSend(WeakRetained, "_receivedUserInput:preflight:payloadIndex:delegate:semaphore:error:outResponses:", v11, a3, a4, a1[4], a1[5], v10, a1[6]);

}

void sub_100019714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  uint64_t v32;

  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100019750(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100019760(uint64_t a1)
{

}

void sub_100019768(uint64_t a1, void *a2)
{
  id v3;
  os_log_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = a2;
  if (v3)
  {
    v4 = _MCLogObjects[8];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "MCVerboseDescription"));
      v7 = 138543362;
      v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Request MAID login error. Error: %{public}@", (uint8_t *)&v7, 0xCu);

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100019848(uint64_t a1, char a2, id obj, char a4)
{
  id v7;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v7 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a4;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100019A34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_100019A64(id a1, NSError *a2)
{
  NSError *v2;
  os_log_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;

  v2 = a2;
  if (v2)
  {
    v3 = _MCLogObjects[8];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError MCVerboseDescription](v2, "MCVerboseDescription"));
      v6 = 138543362;
      v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Request managed restore error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

void sub_100019B38(_QWORD *a1, int a2, void *a3, int a4)
{
  id v8;
  NSObject *v9;
  _DWORD v10[2];
  __int16 v11;
  id v12;
  __int16 v13;
  int v14;

  v8 = a3;
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = a4;
  v9 = _MCLogObjects[8];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109634;
    v10[1] = a2;
    v11 = 2114;
    v12 = v8;
    v13 = 1024;
    v14 = a4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Request managed restore finished with success: %d, error: %{public}@, cancelled: %d", (uint8_t *)v10, 0x18u);
  }

}

void sub_100019E60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100019E84(uint64_t a1, void *a2)
{
  id v3;
  os_log_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = a2;
  if (v3)
  {
    v4 = _MCLogObjects[8];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "MCVerboseDescription"));
      v7 = 138543362;
      v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Finish preflight error. Error: %{public}@", (uint8_t *)&v7, 0xCu);

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100019F64(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id *v9;
  id v10;
  id v11;
  id WeakRetained;

  v9 = (id *)(a1 + 7);
  v10 = a5;
  v11 = a2;
  WeakRetained = objc_loadWeakRetained(v9);
  objc_msgSend(WeakRetained, "_receivedUserInput:preflight:payloadIndex:delegate:semaphore:error:outResponses:", v11, a3, a4, a1[4], a1[5], v10, a1[6]);

}

void sub_10001A1F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_10001A218(uint64_t a1, void *a2)
{
  id v4;
  os_log_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;

  v4 = a2;
  if (v4)
  {
    v5 = _MCLogObjects[8];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = v5;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "MCVerboseDescription"));
      v8 = 138543362;
      v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Show user warnings error. Error: %{public}@", (uint8_t *)&v8, 0xCu);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_10001A318(uint64_t a1, char a2, void *a3)
{
  id v6;

  v6 = a3;
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_10001A4EC(uint64_t a1, void *a2)
{
  id v3;
  os_log_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = a2;
  if (v3)
  {
    v4 = _MCLogObjects[8];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "MCVerboseDescription"));
      v7 = 138543362;
      v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Did finish installation error. Error: %{public}@", (uint8_t *)&v7, 0xCu);

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

intptr_t sub_10001A5CC(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10001A68C(id a1, NSError *a2)
{
  NSError *v2;
  os_log_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;

  v2 = a2;
  if (v2)
  {
    v3 = _MCLogObjects[8];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError MCVerboseDescription](v2, "MCVerboseDescription"));
      v6 = 138543362;
      v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Did update status error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

void sub_10001A7F8(id a1, NSError *a2)
{
  NSError *v2;
  os_log_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;

  v2 = a2;
  if (v2)
  {
    v3 = _MCLogObjects[8];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError MCVerboseDescription](v2, "MCVerboseDescription"));
      v6 = 138543362;
      v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Did begin installating next profile error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

void sub_10001AAC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_10001AAE4(uint64_t a1, void *a2)
{
  id v3;
  os_log_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = a2;
  if (v3)
  {
    v4 = _MCLogObjects[8];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "MCVerboseDescription"));
      v7 = 138543362;
      v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Request current passcode error. Error: %{public}@", (uint8_t *)&v7, 0xCu);

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_10001ABC4(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_10001AD2C(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  MCProfileDaemonManagedConfigurationHelper *v5;
  void *v6;
  int v7;
  id v8;

  v3 = a2;
  if (v3)
  {
    v4 = _MCLogObjects[8];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Client has disconnected with error: %@{public}", (uint8_t *)&v7, 0xCu);
    }
  }
  v5 = objc_opt_new(MCProfileDaemonManagedConfigurationHelper);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[DMCEnrollmentFlowController enrollmentFlowControllerWithPresenter:managedConfigurationHelper:](DMCEnrollmentFlowController, "enrollmentFlowControllerWithPresenter:managedConfigurationHelper:", 0, v5));

  objc_msgSend(v6, "cleanUpDirtyState");
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

intptr_t sub_10001AE2C(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = _MCLogObjects[8];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Enrollment has completed, stop waiting!", v4, 2u);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10001BF04(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;

  v3 = a2;
  if (v3)
  {
    v4 = _MCLogObjects[0];
    if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v5 = 138543362;
      v6 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Watch enrollment failed to install MDM profile: %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t sub_10001BFCC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10001BFDC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a4;
  objc_msgSend(v5, "setEnrollmentController:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t sub_10001C7C8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10001D374(uint64_t a1)
{
  dispatch_queue_attr_t v2;
  dispatch_queue_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;

  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v6 = objc_claimAutoreleasedReturnValue(v2);
  v3 = dispatch_queue_create("MCBackgroundActivityManager work queue", v6);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v3;

}

void sub_10001D3D4(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  MCProfileJanitor *v4;
  void *v5;
  MCProfileEventsManager *v6;
  void *v7;
  CFIndex AppIntegerValue;
  CFIndex v9;
  NSObject *v10;
  void *v11;
  uint8_t v12[14];
  Boolean v13;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[16];

  v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Profile list changed. Rescheduling profile janitor.", buf, 2u);
  }
  v3 = *(void **)(a1 + 32);
  v4 = objc_opt_new(MCProfileJanitor);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileJanitor earliestExpiryDate](v4, "earliestExpiryDate"));
  objc_msgSend(v3, "_workQueueReschedule:startDate:gracePeriod:priority:repeatingInterval:", 0, v5, 0, XPC_ACTIVITY_PRIORITY_UTILITY, 0);

  v6 = objc_opt_new(MCProfileEventsManager);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileEventsManager earlistProfileEventExpiry](v6, "earlistProfileEventExpiry"));

  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "_workQueueReschedule:startDate:gracePeriod:priority:repeatingInterval:", 1, v7, 0, XPC_ACTIVITY_PRIORITY_UTILITY, 0);
  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("MCOutputLevel"), kCFPreferencesAnyApplication, &keyExistsAndHasValidFormat);
  v13 = 0;
  v9 = CFPreferencesGetAppIntegerValue(CFSTR("MCLogLevel"), kCFPreferencesAnyApplication, &v13);
  if (keyExistsAndHasValidFormat && v13 && AppIntegerValue == 7 && v9 == 7)
  {
    v10 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Log level is heightened. Checking MDM installation status.", v12, 2u);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](MDMConfiguration, "sharedConfiguration"));
    objc_msgSend(v11, "refreshDetailsFromDisk");

  }
}

void sub_10001D598(uint64_t a1)
{
  NSObject *v2;
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Managed applications changed. Rescheduling managed app validation & MIS trust update", v7, 2u);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v4, &stru_1000E36E8);

  v5 = *(void **)(a1 + 32);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 60.0));
  objc_msgSend(v5, "_workQueueReschedule:startDate:gracePeriod:priority:repeatingInterval:", 3, v6, 0, 0, 0);

}

void sub_10001D664(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[MCProvisioningProfileJanitor sharedJanitor](MCProvisioningProfileJanitor, "sharedJanitor"));
  objc_msgSend(v1, "updateMISTrust");

}

id sub_10001D698(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Passcode changed. Rescheduling passcode and recovery passcode expiry checks", v4, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_workQueueReschedulePasscodeExpiryJob");
  return objc_msgSend(*(id *)(a1 + 32), "_workQueueRescheduleRecoveryPasscodeExpiryJob");
}

id sub_10001D710(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Passcode policy changed. Rescheduling passcode expiry check", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_workQueueReschedulePasscodeExpiryJob");
}

id sub_10001D780(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 300.0));
  objc_msgSend(v2, "_workQueueReschedule:startDate:gracePeriod:priority:repeatingInterval:", 3, v3, 0, 0, 0);

  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_nextRegularDate"));
  objc_msgSend(v4, "_workQueueReschedule:startDate:gracePeriod:priority:repeatingInterval:", 4, v5, 0, 0, 0);

  v6 = *(void **)(a1 + 32);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_nextRegularDate"));
  objc_msgSend(v6, "_workQueueReschedule:startDate:gracePeriod:priority:repeatingInterval:", 7, v7, 0, 0, 0);

  objc_msgSend(*(id *)(a1 + 32), "_workQueueReschedulePasscodeExpiryJob");
  return objc_msgSend(*(id *)(a1 + 32), "_workQueueRescheduleRecoveryPasscodeExpiryJob");
}

void sub_10001E07C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_10001E0A0(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  xpc_activity_state_t state;
  id WeakRetained;
  NSObject *v9;
  void *v10;
  MCProfileEventsManager *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  os_log_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  _BOOL4 v26;

  v3 = a2;
  if (xpc_activity_should_defer(v3))
  {
    v4 = xpc_activity_set_state(v3, 3);

    v5 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      v6 = *(void **)(a1 + 64);
      v23 = 136315394;
      v24 = v6;
      v25 = 1024;
      v26 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Background activity fired but deferred. name %s result %i", (uint8_t *)&v23, 0x12u);
    }
  }
  else
  {
    state = xpc_activity_get_state(v3);

    if (state == 2)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      v9 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(void **)(a1 + 32);
        v23 = 138543618;
        v24 = v10;
        v25 = 1024;
        v26 = WeakRetained == 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Performing %{public}@ (Nil self? %d)…", (uint8_t *)&v23, 0x12u);
      }
      switch(*(_QWORD *)(a1 + 72))
      {
        case 0:
          v11 = (MCProfileEventsManager *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "server"));
          -[MCProfileEventsManager removeExpiredProfiles](v11, "removeExpiredProfiles");
          goto LABEL_26;
        case 1:
          v11 = objc_opt_new(MCProfileEventsManager);
          -[MCProfileEventsManager removeExpiredProfileEvents](v11, "removeExpiredProfileEvents");
          goto LABEL_26;
        case 2:
          +[MCCrypto clearStoredActivationLockBypassCode](MCCrypto, "clearStoredActivationLockBypassCode");
          break;
        case 3:
          v11 = (MCProfileEventsManager *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "server"));
          -[MCProfileEventsManager revalidateManagedApps](v11, "revalidateManagedApps");
          goto LABEL_26;
        case 4:
          sub_10003FE2C();
          if (*(_QWORD *)(a1 + 40))
            break;
          v12 = *(void **)(a1 + 48);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_nextRegularDate"));
          v14 = *(_QWORD *)(a1 + 80);
          v15 = v12;
          v16 = 4;
          goto LABEL_23;
        case 5:
          v11 = (MCProfileEventsManager *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
          -[MCProfileEventsManager clearAllPasscodeComplianceCaches](v11, "clearAllPasscodeComplianceCaches");
          LOBYTE(v23) = 0;
          if (!-[MCProfileEventsManager recomputeNagMetadata:](v11, "recomputeNagMetadata:", &v23)
            || (_BYTE)v23)
          {
            objc_msgSend(WeakRetained, "reschedulePasscodeExpiryJob");
          }
          goto LABEL_26;
        case 6:
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](MCPasscodeManagerWriter, "sharedManager"));
          v11 = (MCProfileEventsManager *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "clearRecoveryPasscode"));

          if (v11)
          {
            v18 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
            {
              v19 = v18;
              v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileEventsManager MCVerboseDescription](v11, "MCVerboseDescription"));
              v23 = 138543362;
              v24 = v20;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Unable to clear recovery passcode. Error: %{public}@", (uint8_t *)&v23, 0xCu);

            }
            objc_msgSend(WeakRetained, "rescheduleRecoveryPasscodeExpiryJob");
          }
          else
          {
            +[MCPasscodeAnalytics sendRecoveryPasscodeClearedEventWithReason:](MCPasscodeAnalytics, "sendRecoveryPasscodeClearedEventWithReason:", 3);
          }
          goto LABEL_26;
        case 7:
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
          objc_msgSend(v21, "removeOrphanedClientRestrictions");

          if (*(_QWORD *)(a1 + 40))
            break;
          v22 = *(void **)(a1 + 48);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "_nextRegularDate"));
          v14 = *(_QWORD *)(a1 + 80);
          v15 = v22;
          v16 = 7;
LABEL_23:
          objc_msgSend(v15, "_rescheduleBackgroundActivity:startDate:gracePeriod:priority:repeatingInterval:", v16, v13, 0, v14, 0);

          break;
        case 8:
          v11 = (MCProfileEventsManager *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
          -[MCProfileEventsManager recomputeNagMetadata](v11, "recomputeNagMetadata");
LABEL_26:

          break;
        default:
          break;
      }

    }
  }
}

id sub_10001E604(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_workQueueReschedulePasscodeExpiryJob");
}

id sub_10001E6F8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_workQueueRescheduleRecoveryPasscodeExpiryJob");
}

void sub_10001E92C(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", XPC_ACTIVITY_INTERVAL_1_MIN));
  objc_msgSend(v1, "_workQueueReschedule:startDate:gracePeriod:priority:repeatingInterval:", 8, v3, v2, XPC_ACTIVITY_PRIORITY_UTILITY, 0);

}

id sub_10001EA8C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_workQueueReschedule:startDate:gracePeriod:priority:repeatingInterval:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56));
}

void sub_10001FD80(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  if (a2 == 2)
  {
    v8 = v5;
    objc_msgSend(*(id *)(a1 + 40), "_showPromptForHomePodAndWatchWithCompletionBlock:", *(_QWORD *)(a1 + 32));
    goto LABEL_8;
  }
  if (a2 == 1)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      v8 = v5;
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, +[MCProfile thisDeviceType](MCProfile, "thisDeviceType"));
LABEL_8:
      v5 = v8;
    }
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
    {
      v8 = v5;
      (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, 99);
      goto LABEL_8;
    }
  }

}

uint64_t sub_10001FF64(uint64_t a1, int a2)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    v3 = 99;
    if (a2 == 2)
      v3 = 2;
    if (a2 == 1)
      v4 = 3;
    else
      v4 = v3;
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v4);
  }
  return result;
}

void sub_1000200E4(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (a2 == 2)
  {
    v7 = 3;
  }
  else if (a2 == 1)
  {
    v6 = +[MCProfile thisDeviceType](MCProfile, "thisDeviceType", v5);
    v5 = v9;
    v7 = (uint64_t)v6;
  }
  else
  {
    v7 = 99;
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, v7, v5);
    v5 = v9;
  }

}

void sub_1000202B0(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (a2 == 2)
  {
    v7 = 2;
  }
  else if (a2 == 1)
  {
    v6 = +[MCProfile thisDeviceType](MCProfile, "thisDeviceType", v5);
    v5 = v9;
    v7 = (uint64_t)v6;
  }
  else
  {
    v7 = 99;
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, v7, v5);
    v5 = v9;
  }

}

void sub_100021070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100021094(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000210A4(uint64_t a1)
{

}

void sub_1000210AC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000212C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000212DC(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t sub_100025A4C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
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

  v3 = a2;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if ((v12 & 1) != 0)
        goto LABEL_18;
      if (v6 == (id)++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = *(id *)(a1 + 40);
  v13 = (uint64_t)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v22;
LABEL_11:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v14)
        objc_enumerationMutation(v4);
      v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier", (_QWORD)v21));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if ((v19 & 1) != 0)
        break;
      if (v13 == ++v15)
      {
        v13 = (uint64_t)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v13)
          goto LABEL_11;
        goto LABEL_19;
      }
    }
LABEL_18:
    v13 = 1;
  }
LABEL_19:

  return v13;
}

void sub_100026CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100026D28(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100026D38(uint64_t a1)
{

}

intptr_t sub_100026D40(_QWORD *a1, uint64_t a2, id obj)
{
  if (obj)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), obj);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
    CFRetain(*(CFTypeRef *)(*(_QWORD *)(a1[5] + 8) + 24));
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1[6] + 8) + 40));
}

id sub_10002A220(uint64_t a1)
{
  return +[MailAccount setMailAccounts:](MailAccount, "setMailAccounts:", *(_QWORD *)(a1 + 32));
}

id sub_10002A234(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "savePersistentAccount");
}

id sub_10002A23C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "savePersistentAccount");
}

void sub_10002F358(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v2 = sharedDAAccountStore();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002F414;
  v6[3] = &unk_1000E38C8;
  v7 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v3, "removeAccount:withDataclassActions:completion:", v4, v5, v6);

}

void sub_10002F414(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;

  v5 = a3;
  v6 = _MCLogObjects[0];
  if ((_DWORD)a2)
  {
    if (!os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v7 = *(_QWORD *)(a1 + 32);
    v14 = 138543362;
    v15 = v7;
    v8 = "Finished removing account with identifier: %{public}@";
    v9 = v6;
    v10 = OS_LOG_TYPE_DEFAULT;
    v11 = 12;
  }
  else
  {
    if (!os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v12 = *(_QWORD *)(a1 + 32);
    v14 = 138543618;
    v15 = v12;
    v16 = 2114;
    v17 = v5;
    v8 = "Couldn't remove the account with identifier %{public}@: %{public}@";
    v9 = v6;
    v10 = OS_LOG_TYPE_ERROR;
    v11 = 22;
  }
  _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, (uint8_t *)&v14, v11);
LABEL_7:
  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
    (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, a2, v5);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void sub_10003254C(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;
  int v4;
  NSError *v5;

  v2 = a2;
  if (v2)
  {
    v3 = _MCLogObjects[12];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Recompute Profile Restrictions error: %@", (uint8_t *)&v4, 0xCu);
    }
  }

}

void sub_1000325F8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v2 = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentRestrictions"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "effectiveUserSettings"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks sharedHacks](MCServerSideHacks, "sharedHacks"));
  objc_msgSend(v7, "setUserTrackingTCCAccessOverrideForRestrictions:", v4);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks sharedHacks](MCServerSideHacks, "sharedHacks"));
  objc_msgSend(v8, "_applyServerSideChangesWithOldRestrictions:newRestrictions:oldEffectiveUserSettings:newEffectiveUserSettings:", &__NSDictionary0__struct, v4, &__NSDictionary0__struct, v6);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v9, "recomputeEffectiveUserSettingsPasscode:", 0);

  MCSendSettingsChangedNotification();
  v10 = getpid();
  v11 = MCSendEffectiveSettingsChangedNotification(v10);
  MCSendProfileListChangedNotification(v11);
  objc_msgSend(*(id *)(a1 + 32), "_wakeDaemonsPostMigration");

  objc_autoreleasePoolPop(v2);
}

void sub_1000366F8(id a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v1 = MCTagsMappingFilePath(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v3 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v2));
  v4 = (void *)qword_1000FD838;
  qword_1000FD838 = v3;

  v5 = qword_1000FD838;
  if (!qword_1000FD838)
  {
    v7 = 0;
LABEL_6:
    qword_1000FD838 = 0;

    return;
  }
  v6 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
  {
    v7 = (void *)qword_1000FD838;
    goto LABEL_6;
  }
}

void sub_100039568(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  unsigned int v7;
  int v8;
  _QWORD v9[2];

  v3 = a2;
  v4 = _MCLogObjects[12];
  if (v3)
  {
    if (os_log_type_enabled(_MCLogObjects[12], OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9[0] = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Recompute Profile Restrictions error: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled(_MCLogObjects[12], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    LODWORD(v5) = objc_msgSend(v5, "count");
    v7 = objc_msgSend(*(id *)(a1 + 40), "count");
    v8 = 67109376;
    LODWORD(v9[0]) = (_DWORD)v5;
    WORD2(v9[0]) = 1024;
    *(_DWORD *)((char *)v9 + 6) = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Done updating. %d system profile and %d user profile restrictions processed.", (uint8_t *)&v8, 0xEu);

  }
}

void sub_10003A3BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003A3DC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  _QWORD v13[2];
  _QWORD v14[2];
  uint64_t v15;
  uint64_t v16;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v15 = kMCMDMLostModeLastLocationRequestDateKey;
  v16 = *(_QWORD *)(a1 + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
  if (objc_msgSend(v4, "writeToURL:atomically:", v3, 1))
  {
    v13[0] = NSFileProtectionKey;
    v13[1] = NSURLIsExcludedFromBackupKey;
    v14[0] = NSFileProtectionNone;
    v14[1] = &__kCFBooleanTrue;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 2));
    v10 = 0;
    v6 = objc_msgSend(v3, "setResourceValues:error:", v5, &v10);
    v7 = v10;

    if ((v6 & 1) == 0)
    {
      v8 = _MCLogObjects[12];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v12 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Could not write device last located time interval URL resource values: %{public}@", buf, 0xCu);
      }
    }

  }
  else
  {
    v9 = _MCLogObjects[12];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Could not write device last located time interval", buf, 2u);
    }
  }

}

void sub_10003E35C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

intptr_t sub_10003E37C(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_10003FE2C()
{
  return AnalyticsSendEventLazy(CFSTR("com.apple.managedconfiguration.dailystatus"), &stru_1000E39B8);
}

NSDictionary *__cdecl sub_10003FE40(id a1)
{
  id v1;

  v1 = objc_alloc_init((Class)NSMutableDictionary);
  +[MCDailyAnalyticsHelper addCloudConfigInfoWithEventPayload:](MCDailyAnalyticsHelper, "addCloudConfigInfoWithEventPayload:", v1);
  +[MCDailyAnalyticsHelper addMDMConfigInfoWithEventPayload:](MCDailyAnalyticsHelper, "addMDMConfigInfoWithEventPayload:", v1);
  +[MCDailyAnalyticsHelper addSharediPadInfoWithEventPayload:](MCDailyAnalyticsHelper, "addSharediPadInfoWithEventPayload:", v1);
  +[MCDailyAnalyticsHelper addProfileAndPayloadInfoWithEventPayload:](MCDailyAnalyticsHelper, "addProfileAndPayloadInfoWithEventPayload:", v1);
  +[MCDailyAnalyticsHelper addRestrictionInfoWithEventPayload:](MCDailyAnalyticsHelper, "addRestrictionInfoWithEventPayload:", v1);
  +[MCDailyAnalyticsHelper addSettingsInfoWithEventPayload:](MCDailyAnalyticsHelper, "addSettingsInfoWithEventPayload:", v1);
  +[MCDailyAnalyticsHelper addPasscodeInfoWithEventPayload:](MCDailyAnalyticsHelper, "addPasscodeInfoWithEventPayload:", v1);
  return (NSDictionary *)v1;
}

void sub_1000408AC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  v5 = *(_QWORD *)(a1 + 32);
  v7 = a3;
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", a2, v5) == 2)v6 = &__kCFBooleanTrue;
  else
    v6 = &__kCFBooleanFalse;
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v7);

}

void sub_10004092C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  v5 = *(_QWORD *)(a1 + 32);
  v7 = a3;
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", a2, v5) == 1)v6 = &__kCFBooleanTrue;
  else
    v6 = &__kCFBooleanFalse;
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v7);

}

void sub_1000409AC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager objectForFeature:withRestrictionsDictionary:](MCRestrictionManager, "objectForFeature:withRestrictionsDictionary:", a2, v5));
  if (v8)
    v7 = &__kCFBooleanTrue;
  else
    v7 = &__kCFBooleanFalse;
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v6);

}

void sub_100040A40(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager intersectedValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "intersectedValuesForFeature:withRestrictionsDictionary:", a2, v5));
  if (v8)
    v7 = &__kCFBooleanTrue;
  else
    v7 = &__kCFBooleanFalse;
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v6);

}

void sub_100040AD4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager valueForFeature:withRestrictionsDictionary:](MCRestrictionManager, "valueForFeature:withRestrictionsDictionary:", a2, v5));
  v8 = objc_msgSend(v7, "unsignedIntValue");

  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v8));
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v6);

}

void sub_100041008(id a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[39];

  v4[0] = CFSTR("payload_count_airPlayConfiguration");
  v4[1] = CFSTR("payload_count_airPrintConfiguration");
  v4[2] = CFSTR("payload_count_alwaysOnVPN");
  v4[3] = CFSTR("payload_count_apn");
  v4[4] = CFSTR("payload_count_appLayerVPN");
  v4[5] = CFSTR("payload_count_calDAVAccount");
  v4[6] = CFSTR("payload_count_cardDAVAccount");
  v4[7] = CFSTR("payload_count_cellular");
  v4[8] = CFSTR("payload_count_dnsProxy");
  v4[9] = CFSTR("payload_count_dnsSettings");
  v4[10] = CFSTR("payload_count_domains");
  v4[11] = CFSTR("payload_count_exchangeAccount");
  v4[12] = CFSTR("payload_count_educationConfiguration");
  v4[13] = CFSTR("payload_count_emailAccount");
  v4[14] = CFSTR("payload_count_encryptedProfileService");
  v4[15] = CFSTR("payload_count_font");
  v4[16] = CFSTR("payload_count_globalHTTPProxy");
  v4[17] = CFSTR("payload_count_googleAccount");
  v4[18] = CFSTR("payload_count_homeScreenLayout");
  v4[19] = CFSTR("payload_count_ldapAccount");
  v4[20] = CFSTR("payload_count_logging");
  v4[21] = CFSTR("payload_count_mdm");
  v4[22] = CFSTR("payload_count_networkUsageRules");
  v4[23] = CFSTR("payload_count_notificationSettings");
  v4[24] = CFSTR("payload_count_passwordPolicy");
  v4[25] = CFSTR("payload_count_plainCertificate");
  v4[26] = CFSTR("payload_count_restriction");
  v4[27] = CFSTR("payload_count_scep");
  v4[28] = CFSTR("payload_count_selfsignedcertificate");
  v4[29] = CFSTR("payload_count_sharedDeviceConfiguration");
  v4[30] = CFSTR("payload_count_singleAppMode");
  v4[31] = CFSTR("payload_count_singleSignOnAccount");
  v4[32] = CFSTR("payload_count_subCalAccount");
  v4[33] = CFSTR("payload_count_supervisionPolicy");
  v4[34] = CFSTR("payload_count_vpn");
  v4[35] = CFSTR("payload_count_wapiIdentityCertificate");
  v4[36] = CFSTR("payload_count_webClip");
  v4[37] = CFSTR("payload_count_webContentFilter");
  v4[38] = CFSTR("payload_count_wiFiNetwork");
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v4, 39));
  v2 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v1));
  v3 = (void *)qword_1000FD848;
  qword_1000FD848 = v2;

}

void sub_10004126C(id a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[43];
  _QWORD v4[43];

  v3[0] = kMCAirPlayPayloadType;
  v3[1] = kMCAirPrintPayloadType;
  v4[0] = CFSTR("payload_count_airPlayConfiguration");
  v4[1] = CFSTR("payload_count_airPrintConfiguration");
  v3[2] = kMCAlwaysOnVPNPayloadType;
  v3[3] = kMCAPNPayloadType;
  v4[2] = CFSTR("payload_count_alwaysOnVPN");
  v4[3] = CFSTR("payload_count_apn");
  v3[4] = kMCAppLayerVPNPayloadType;
  v3[5] = kMCCardDAVAccountPayloadType;
  v4[4] = CFSTR("payload_count_appLayerVPN");
  v4[5] = CFSTR("payload_count_cardDAVAccount");
  v3[6] = kMCCalDAVAccountPayloadType;
  v3[7] = kMCCellularPayloadType;
  v4[6] = CFSTR("payload_count_calDAVAccount");
  v4[7] = CFSTR("payload_count_cellular");
  v3[8] = kMCChaperonePayloadType;
  v3[9] = kMCCPRootType;
  v4[8] = CFSTR("payload_count_supervisionPolicy");
  v4[9] = CFSTR("payload_count_plainCertificate");
  v3[10] = kMCCPPKCS12Type;
  v3[11] = kMCCPPKCS1Type;
  v4[10] = CFSTR("payload_count_plainCertificate");
  v4[11] = CFSTR("payload_count_plainCertificate");
  v3[12] = kMCCPPEMType;
  v3[13] = kMCCWAPIType;
  v4[12] = CFSTR("payload_count_plainCertificate");
  v4[13] = CFSTR("payload_count_wapiIdentityCertificate");
  v3[14] = kMCDNSProxyPayloadType;
  v3[15] = kMCDNSSettingsPayloadType;
  v4[14] = CFSTR("payload_count_dnsProxy");
  v4[15] = CFSTR("payload_count_dnsSettings");
  v3[16] = kMCDomainsPayloadType;
  v3[17] = kMCEASAccountPayloadType;
  v4[16] = CFSTR("payload_count_domains");
  v4[17] = CFSTR("payload_count_exchangeAccount");
  v3[18] = kMCEncryptedProfileServicePayloadType;
  v3[19] = kMCEmailAccountPayloadType;
  v4[18] = CFSTR("payload_count_encryptedProfileService");
  v4[19] = CFSTR("payload_count_emailAccount");
  v3[20] = kMCFontPayloadType;
  v3[21] = kMCGlobalHTTPProxyPayloadType;
  v4[20] = CFSTR("payload_count_font");
  v4[21] = CFSTR("payload_count_globalHTTPProxy");
  v3[22] = kMCGmailAccountLegacyPayloadType;
  v3[23] = kMCGmailAccountPayloadType;
  v4[22] = CFSTR("payload_count_googleAccount");
  v4[23] = CFSTR("payload_count_googleAccount");
  v3[24] = kMCHomeScreenLayoutPayloadType;
  v3[25] = kMCLDAPAccountPayloadType;
  v4[24] = CFSTR("payload_count_homeScreenLayout");
  v4[25] = CFSTR("payload_count_ldapAccount");
  v3[26] = kMCLoggingPayloadType;
  v3[27] = kMCMDMPayloadType;
  v4[26] = CFSTR("payload_count_logging");
  v4[27] = CFSTR("payload_count_mdm");
  v3[28] = kMCNetworkUsageRulesPayloadType;
  v3[29] = kMCNotificationSettingsPayloadType;
  v4[28] = CFSTR("payload_count_networkUsageRules");
  v4[29] = CFSTR("payload_count_notificationSettings");
  v3[30] = kMCPasswordPolicyPayloadType;
  v3[31] = kMCRestrictionsPayloadType;
  v4[30] = CFSTR("payload_count_passwordPolicy");
  v4[31] = CFSTR("payload_count_restriction");
  v3[32] = kMCSCEPPayloadType;
  v3[33] = kMCSelfSignedCertificatePayloadType;
  v4[32] = CFSTR("payload_count_scep");
  v4[33] = CFSTR("payload_count_selfsignedcertificate");
  v3[34] = kMCSharedDeviceConfigurationPayloadType;
  v3[35] = kMCSingleAppPayloadType;
  v4[34] = CFSTR("payload_count_sharedDeviceConfiguration");
  v4[35] = CFSTR("payload_count_singleAppMode");
  v3[36] = kMCSingleSignOnPayloadType;
  v3[37] = kMCSubCalAccountPayloadType;
  v4[36] = CFSTR("payload_count_singleSignOnAccount");
  v4[37] = CFSTR("payload_count_subCalAccount");
  v3[38] = kMCVPNPayloadType;
  v3[39] = kMCWebClipPayloadType;
  v4[38] = CFSTR("payload_count_vpn");
  v4[39] = CFSTR("payload_count_webClip");
  v3[40] = kMCWebContentFilterPayloadType;
  v3[41] = kMCWiFiPayloadType;
  v4[40] = CFSTR("payload_count_webContentFilter");
  v4[41] = CFSTR("payload_count_wiFiNetwork");
  v3[42] = kMCEDUClassroomPayloadType;
  v4[42] = CFSTR("payload_count_educationConfiguration");
  v1 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 43));
  v2 = (void *)qword_1000FD858;
  qword_1000FD858 = v1;

}

void sub_10004173C(id a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[39];
  _QWORD v4[39];

  v3[0] = MCFeatureAccountModificationAllowed;
  v3[1] = MCFeatureActivityContinuationAllowed;
  v4[0] = CFSTR("restriction_allowAccountModification");
  v4[1] = CFSTR("restriction_allowActivityContinuation");
  v3[2] = MCFeatureAppInstallationAllowed;
  v3[3] = MCFeatureAppRemovalAllowed;
  v4[2] = CFSTR("restriction_allowAppInstallation");
  v4[3] = CFSTR("restriction_allowAppRemoval");
  v3[4] = MCFeatureAutoCorrectionAllowed;
  v3[5] = MCFeatureBluetoothModificationAllowed;
  v4[4] = CFSTR("restriction_allowAutoCorrection");
  v4[5] = CFSTR("restriction_allowBluetoothModification");
  v3[6] = MCFeatureCameraAllowed;
  v3[7] = MCFeatureCloudBackupAllowed;
  v4[6] = CFSTR("restriction_allowCamera");
  v4[7] = CFSTR("restriction_allowCloudBackup");
  v3[8] = MCFeatureCloudDocumentSyncAllowed;
  v3[9] = MCFeatureDefinitionLookupAllowed;
  v4[8] = CFSTR("restriction_allowCloudDocumentSync");
  v4[9] = CFSTR("restriction_allowDefinitionLookup");
  v3[10] = MCFeatureSelectedTextSharingAllowed;
  v3[11] = MCFeatureDeviceNameModificationAllowed;
  v4[10] = CFSTR("restriction_allowSelectedTextSharing");
  v4[11] = CFSTR("restriction_allowDeviceNameModification");
  v3[12] = MCFeatureEnablingRestrictionsAllowed;
  v3[13] = MCFeatureEnterpriseAppTrustAllowed;
  v4[12] = CFSTR("restriction_allowEnablingRestrictions");
  v4[13] = CFSTR("restriction_allowEnterpriseAppTrust");
  v3[14] = MCFeatureEnterpriseBookBackupAllowed;
  v3[15] = MCFeatureEnterpriseBookMetadataSyncAllowed;
  v4[14] = CFSTR("restriction_allowEnterpriseBookBackup");
  v4[15] = CFSTR("restriction_allowEnterpriseBookMetadataSync");
  v3[16] = MCFeatureEraseContentAndSettingsAllowed;
  v3[17] = MCFeatureFingerprintUnlockAllowed;
  v4[16] = CFSTR("restriction_allowEraseContentAndSettings");
  v4[17] = CFSTR("restriction_allowFingerprintForUnlock");
  v3[18] = MCFeatureHostPairingAllowed;
  v3[19] = MCFeatureManagedAppsCloudSyncAllowed;
  v4[18] = CFSTR("restriction_allowHostPairing");
  v4[19] = CFSTR("restriction_allowManagedAppsCloudSync");
  v3[20] = MCFeatureOpenFromManagedToUnmanagedAllowed;
  v3[21] = MCFeatureOpenFromUnmanagedToManagedAllowed;
  v4[20] = CFSTR("restriction_allowOpenFromManagedToUnmanaged");
  v4[21] = CFSTR("restriction_allowOpenFromUnmanagedToManaged");
  v3[22] = MCFeaturePairedWatchAllowed;
  v3[23] = MCFeaturePasscodeModificationAllowed;
  v4[22] = CFSTR("restriction_allowPairedWatch");
  v4[23] = CFSTR("restriction_allowPasscodeModification");
  v3[24] = MCFeaturePasscodeRecoveryAllowed;
  v3[25] = MCFeaturePredictiveKeyboardAllowed;
  v4[24] = CFSTR("restriction_allowPasscodeRecovery");
  v4[25] = CFSTR("restriction_allowPredictiveKeyboard");
  v3[26] = MCFeatureRemoteScreenObservationAllowed;
  v3[27] = MCFeatureSafariAllowed;
  v4[26] = CFSTR("restriction_allowRemoteScreenObservation");
  v4[27] = CFSTR("restriction_allowSafari");
  v3[28] = MCFeatureScreenShotAllowed;
  v3[29] = MCFeatureSpellCheckAllowed;
  v4[28] = CFSTR("restriction_allowScreenShot");
  v4[29] = CFSTR("restriction_allowSpellCheck");
  v3[30] = MCFeatureUIAppInstallationAllowed;
  v3[31] = MCFeatureAppClipsAllowed;
  v4[30] = CFSTR("restriction_allowUIAppInstallation");
  v4[31] = CFSTR("restriction_allowAppClips");
  v3[32] = MCFeatureUIConfigurationProfileInstallationAllowed;
  v3[33] = MCFeatureUntrustedTLSPromptAllowed;
  v4[32] = CFSTR("restriction_allowUIConfigurationProfileInstallation");
  v4[33] = CFSTR("restriction_allowUntrustedTLSPrompt");
  v3[34] = MCFeatureUSBRestrictedModeAllowed;
  v3[35] = MCFeatureWallpaperModificationAllowed;
  v4[34] = CFSTR("restriction_allowUSBRestrictedMode");
  v4[35] = CFSTR("restriction_allowWallpaperModification");
  v3[36] = MCFeatureiPhoneWidgetsOnMacAllowed;
  v3[37] = MCFeatureHiddenAppsAllowed;
  v4[36] = CFSTR("restriction_allowiPhoneWidgetsOnMac");
  v4[37] = CFSTR("restriction_allowHidingApps");
  v3[38] = MCFeatureLockedAppsAllowed;
  v4[38] = CFSTR("restriction_allowLockingApps");
  v1 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 39));
  v2 = (void *)qword_1000FD868;
  qword_1000FD868 = v1;

}

void sub_100041BBC(id a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[7];
  _QWORD v4[7];

  v3[0] = MCFeatureAirDropUnmanagedForced;
  v3[1] = MCFeatureDelayedSoftwareUpdatesForced;
  v4[0] = CFSTR("restriction_forceAirDropUnmanaged");
  v4[1] = CFSTR("restriction_forceDelayedSoftwareUpdates");
  v3[2] = MCFeatureEncryptedBackupRequired;
  v3[3] = MCFeatureLimitAdTrackingForced;
  v4[2] = CFSTR("restriction_forceEncryptedBackup");
  v4[3] = CFSTR("restriction_forceLimitAdTracking");
  v3[4] = MCFeatureUnpairedExternalBootToRecoveryAllowed;
  v3[5] = MCFeatureWatchWristDetectRequired;
  v4[4] = CFSTR("restriction_allowUnpairedExternalBootToRecovery");
  v4[5] = CFSTR("restriction_forceWatchWristDetection");
  v3[6] = MCFeatureWiFiWhitelistingForced;
  v4[6] = CFSTR("restriction_forceWiFiWhitelisting");
  v1 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 7));
  v2 = (void *)qword_1000FD878;
  qword_1000FD878 = v1;

}

void sub_100041D18(id a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[2];
  _QWORD v4[2];

  v3[0] = MCFeatureBlacklistedAppBundleIDs;
  v3[1] = MCFeatureAppLockBundleIDs;
  v4[0] = CFSTR("restriction_blacklistedAppBundleIDs");
  v4[1] = CFSTR("restriction_whitelistedAppBundleIDs");
  v1 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 2));
  v2 = (void *)qword_1000FD888;
  qword_1000FD888 = v1;

}

void sub_100041DF8(id a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  const __CFString *v4;

  v3 = MCFeatureAutonomousSingleAppModePermittedAppIDs;
  v4 = CFSTR("restriction_autonomousSingleAppModePermittedAppIDs");
  v1 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1));
  v2 = (void *)qword_1000FD898;
  qword_1000FD898 = v1;

}

void sub_100041EC0(id a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[4];
  _QWORD v4[4];

  v3[0] = MCFeatureAutoLockTime;
  v3[1] = MCFeatureMinimumPasscodeLength;
  v4[0] = CFSTR("restriction_autoLockTime");
  v4[1] = CFSTR("restriction_minimumPasscodeLength");
  v3[2] = MCFeaturePasscodeHistoryCount;
  v3[3] = MCFeaturePasscodeLockGraceTime;
  v4[2] = CFSTR("restriction_passcodeHistory");
  v4[3] = CFSTR("restriction_passcodeLockGraceTime");
  v1 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 4));
  v2 = (void *)qword_1000FD8A8;
  qword_1000FD8A8 = v1;

}

void sub_100041FD0(id a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[0] = CFSTR("settings_allowPasscodeRecovery");
  v4[1] = CFSTR("settings_allowUSBRestrictedMode");
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v4, 2));
  v2 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v1));
  v3 = (void *)qword_1000FD8B8;
  qword_1000FD8B8 = v2;

}

void sub_1000420B8(id a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[2];
  _QWORD v4[2];

  v3[0] = MCFeaturePasscodeRecoveryAllowed;
  v3[1] = MCFeatureUSBRestrictedModeAllowed;
  v4[0] = CFSTR("settings_allowPasscodeRecovery");
  v4[1] = CFSTR("settings_allowUSBRestrictedMode");
  v1 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 2));
  v2 = (void *)qword_1000FD8C8;
  qword_1000FD8C8 = v1;

}

void sub_100042198(id a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[0] = CFSTR("settings_allowLockdownMode");
  v4[1] = CFSTR("settings_forceLimitAdTracking");
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v4, 2));
  v2 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v1));
  v3 = (void *)qword_1000FD8D8;
  qword_1000FD8D8 = v2;

}

void sub_100042280(id a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[2];
  _QWORD v4[2];

  v3[0] = MCFeatureLockdownModeAllowed;
  v3[1] = MCFeatureLimitAdTrackingForced;
  v4[0] = CFSTR("settings_allowLockdownMode");
  v4[1] = CFSTR("settings_forceLimitAdTracking");
  v1 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 2));
  v2 = (void *)qword_1000FD8E8;
  qword_1000FD8E8 = v1;

}

void sub_100043D9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100043DC4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100043DD4(uint64_t a1)
{

}

void sub_100043DDC(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "complete");

}

void sub_1000440FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100044124(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "complete");

}

void sub_1000441B0(id a1)
{
  MCInstaller *v1;
  void *v2;

  v1 = objc_alloc_init(MCInstaller);
  v2 = (void *)qword_1000FD908;
  qword_1000FD908 = (uint64_t)v1;

}

id sub_1000443A8()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)qword_1000FD900;
  if (!qword_1000FD900)
  {
    v1 = MCUserProfileStorageDirectory();
    v2 = objc_claimAutoreleasedReturnValue(v1);
    v3 = (void *)qword_1000FD900;
    qword_1000FD900 = v2;

    v0 = (void *)qword_1000FD900;
  }
  return v0;
}

id sub_1000443E4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)qword_1000FD8F8;
  if (!qword_1000FD8F8)
  {
    v1 = MCSystemProfileStorageDirectory();
    v2 = objc_claimAutoreleasedReturnValue(v1);
    v3 = (void *)qword_1000FD8F8;
    qword_1000FD8F8 = v2;

    v0 = (void *)qword_1000FD8F8;
  }
  return v0;
}

id sub_100044D58(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queueProfileData:profile:forDevice:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2, *(_QWORD *)(a1 + 56));
}

void sub_100044D6C(uint64_t a1, uint64_t a2)
{
  void *v3;
  os_log_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_targetDeviceErrorWithUnderlyingError:", a2));
  v4 = _MCLogObjects[9];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(void **)(a1 + 40);
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfile stringForDeviceType:](MCProfile, "stringForDeviceType:", objc_msgSend(v5, "targetDeviceType")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "MCVerboseDescription"));
    v9 = 138543618;
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Profile-defined target-device-type %{public}@ error: %{public}@", (uint8_t *)&v9, 0x16u);

  }
  (*(void (**)(_QWORD, void *, _QWORD, id))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v3, *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 40), "targetDeviceType"));

}

void sub_1000456B8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 56);
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_uiProfileInstallationDisabledTopLevelErrorWithCause:", MCErrorRestrictionCauseStolenDeviceProtection));
    (*(void (**)(uint64_t, id, _QWORD, _QWORD))(v3 + 16))(v3, v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_continueQueueingProfile:profileData:forDevice:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
  }
}

void sub_100045AB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100045AE0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100045AF0(uint64_t a1)
{

}

void sub_100045AF8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "identifier"));
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(v2, "sendPurgatoryProfileData:identifier:targetDevice:outError:", v3, v4, v5, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);

}

void sub_100046AA4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;

  v4 = a3;
  v5 = _MCLogObjects[9];
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)_MCLogObjects[9], OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v12 = 134349314;
      v13 = v6;
      v14 = 2114;
      v15 = v4;
      v7 = "MCInstaller failed to update CDP with new passcode of type %{public}lu with error: %{public}@";
      v8 = v5;
      v9 = OS_LOG_TYPE_ERROR;
      v10 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, (uint8_t *)&v12, v10);
    }
  }
  else if (os_log_type_enabled((os_log_t)_MCLogObjects[9], OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = 134349056;
    v13 = v11;
    v7 = "MCInstaller successfully updated CDP with new passcode of type: %{public}lu";
    v8 = v5;
    v9 = OS_LOG_TYPE_DEFAULT;
    v10 = 12;
    goto LABEL_6;
  }

}

void sub_10004A59C(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x318], 8);
  _Unwind_Resume(a1);
}

void sub_10004A6AC(id a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[3];

  v3[0] = objc_opt_class(MCDNSProxyPayload);
  v3[1] = objc_opt_class(MCNetworkUsageRulesPayload);
  v3[2] = objc_opt_class(MCExtensibleSingleSignOnPayload);
  v1 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 3));
  v2 = (void *)qword_1000FD918;
  qword_1000FD918 = v1;

}

void sub_10004A748(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[7];
  v6 = a1[8];
  v7 = *(_QWORD *)(a1[10] + 8);
  obj = *(id *)(v7 + 40);
  v8 = objc_msgSend(v2, "_promptUserForMAIDSignIn:personaID:handler:interactionClient:outError:", v3, v4, v5, v6, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = v8;
}

void sub_10004A7B4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v7 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "profile"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "organization"));
  objc_msgSend(v7, "setAccountDescription:", v5);

  objc_msgSend(v7, "setManagingOwnerIdentifier:", kMCAccountManagingOwnerIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "friendlyName"));
  objc_msgSend(v7, "setManagingSourceName:", v6);

  objc_msgSend(v7, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("MCAccountIsManaged"));
}

void sub_10004A86C(uint64_t a1, int a2, int a3, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v6 = obj;
  objc_msgSend(*(id *)(a1 + 32), "lock");
  objc_msgSend(*(id *)(a1 + 32), "unlockWithCondition:", 0);

}

void sub_10004D604(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[MCPayload remoteQueueableWatchPayloadClasses](MCPayload, "remoteQueueableWatchPayloadClasses"));
  v2 = (void *)qword_1000FD928;
  qword_1000FD928 = v1;

}

id sub_10004ED3C(uint64_t a1)
{
  return +[MCKeychain removeItemWithPersistentID:useSystemKeychain:enforcePersonalPersona:](MCKeychain, "removeItemWithPersistentID:useSystemKeychain:enforcePersonalPersona:", *(_QWORD *)(a1 + 32), 1, 0);
}

void sub_100051118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100051134(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "installOptions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kMCInstallProfileOptionIsInstalledByMDM));
  v6 = objc_msgSend(v5, "BOOLValue");

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
    if ((objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
      v7 = 0;
    else
      v7 = objc_msgSend(v3, "containsOnlyPayloadsOfClasses:", *(_QWORD *)(a1 + 40));

  }
  v9 = v7 & objc_msgSend(v3, "isInstalledForSystem");

  return v9;
}

uint64_t sub_1000511F4(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "installOptions"));
  v5 = kMCInstallProfileOptionIsInstalledByMDM;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kMCInstallProfileOptionIsInstalledByMDM));
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) == 0)
  {
    v8 = objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, v5);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", a1[4], kMCInstallProfileOptionManagingProfileIdentifier);
    if (v8)
    {
      v9 = objc_msgSend(v8, "copy");
      objc_msgSend(v3, "setInstallOptions:", v9);

      v11 = MCSystemProfileStorageDirectory(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      objc_msgSend(v3, "writeStubToDirectory:", v12);

    }
    v13 = (void *)a1[5];
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
    objc_msgSend(v13, "addObject:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](MCDependencyManager, "sharedManager"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
    objc_msgSend(v15, "addDependent:ofParent:inDomain:reciprocalDomain:", v16, a1[4], kMCDMManagingProfileToManagedProfileKey, kMCDMManagedProfileToManagingProfileKey);

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }

  return 1;
}

void sub_100051AB0(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  uint64_t v9;

  v2 = (void *)a1[5];
  v3 = *(NSObject **)(a1[4] + 16);
  block[0] = _NSConcreteStackBlock;
  block[2] = sub_100051B34;
  block[3] = &unk_1000E3D50;
  block[1] = 3221225472;
  v4 = v2;
  v5 = a1[4];
  v7 = v4;
  v8 = v5;
  v9 = a1[6];
  dispatch_sync(v3, block);

}

id sub_100051B34(uint64_t a1)
{
  sub_10007AF48(*(void **)(a1 + 32), 3);
  return objc_msgSend(*(id *)(a1 + 40), "purgePurgatoryProfilesForTargetDevice:", *(_QWORD *)(a1 + 48));
}

id sub_100052038(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_purgatoryWorkerQueue_didPurgePurgatory:", 1);
}

_DWORD *sub_1000526BC(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _DWORD *v15;
  id v16;
  id v17;
  int v18;
  NSObject *v19;
  const void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v27;
  const void *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  NSData *v38;
  const __CFString *v39;
  id v40;
  _BYTE buf[24];
  void *v42;
  id v43;
  uint64_t *v44;
  uint64_t *v45;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = (void *)MCBiometricKitClass();
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "manager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 2));
    v14 = v13;
    if (v7)
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v7, CFSTR("BKUserCfgTouchIDUnlockEnabled"));
    if (v8)
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v8, CFSTR("BKUserCfgTouchIDApplePayEnabled"));
    v39 = CFSTR("BKOptionAuthWithCredentialSet");
    if (v10)
    {
      v15 = 0;
      v16 = v10;
    }
    else
    {
      v17 = v9;
      v33 = 0;
      v34 = &v33;
      v35 = 0x3032000000;
      v36 = sub_100052B00;
      v37 = sub_100052B10;
      v38 = objc_opt_new(NSData);
      v29 = 0;
      v30 = &v29;
      v31 = 0x2020000000;
      v32 = 0;
      v28 = 0;
      v18 = ACMContextCreate((uint64_t *)&v28);
      *((_DWORD *)v30 + 6) = v18;
      if (v18)
      {
        v19 = _MCLogObjects[0];
        if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v18;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Couldn't create auth context: ACM err %d", buf, 8u);
        }
        v16 = (id)v34[5];
        v15 = 0;
      }
      else
      {
        v20 = v28;
        *(_QWORD *)buf = _NSConcreteStackBlock;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = sub_100052B18;
        v42 = &unk_1000E3DA0;
        v43 = v17;
        v44 = &v29;
        v45 = &v33;
        ACMContextGetExternalForm(v20, (uint64_t)buf);
        v15 = v28;
        v16 = (id)v34[5];

      }
      _Block_object_dispose(&v29, 8);
      _Block_object_dispose(&v33, 8);

    }
    v40 = v16;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
    if (!v10)

    v22 = objc_msgSend(v12, "setProtectedConfiguration:withOptions:", v14, v21);
    v23 = _MCLogObjects[0];
    if ((_DWORD)v22)
    {
      if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v14;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = (_DWORD)v22;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Could not set fingerprint options: %{public}@ Status: %d", buf, 0x12u);
      }
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v22));
      v24 = MCErrorArray(CFSTR("PASSCODE_ERROR_CANNOT_SET_FINGERPRINT_UNLOCK_P_CODE"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v15 = (_DWORD *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCPasscodeErrorDomain, 5016, v25, MCErrorTypeFatal));

    }
    else
    {
      if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v14;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Set fingerprint options: %{public}@", buf, 0xCu);
      }
      if (v15)
      {
        ACMContextDelete(v15, 1);
        v15 = 0;
      }
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void sub_100052AD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  uint64_t v6;
  va_list va;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  va_list va1;

  va_start(va1, a5);
  va_start(va, a5);
  v6 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100052B00(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100052B10(uint64_t a1)
{

}

void sub_100052B18(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  id v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _DWORD v13[2];

  v6 = (void *)a1[4];
  if (!v6)
    goto LABEL_7;
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataUsingEncoding:", 4)));
  *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = sub_100099BEC(0, (const char *)objc_msgSend(v7, "bytes"), (uint64_t)objc_msgSend(v7, "length"), a2, a3);
  if (!*(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24))
  {

LABEL_7:
    v10 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a2, a3));
    v11 = *(_QWORD *)(a1[6] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    return;
  }
  v8 = _MCLogObjects[0];
  if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v9 = *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
    v13[0] = 67109120;
    v13[1] = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Couldn't verify input passcode: MKB err %d", (uint8_t *)v13, 8u);
  }

}

uint64_t sub_100056B24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100056C28(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  (*(void (**)(uint64_t, BOOL, id))(v4 + 16))(v4, objc_msgSend(a2, "count") != 0, v5);

}

void sub_100057028(uint64_t a1)
{
  NSObject *v1;
  void *v2;
  uint8_t v3[16];

  if (*(_BYTE *)(a1 + 40))
  {
    v1 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Checking for any MDM NotNow response to retry...", v3, 2u);
    }
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[MDMClient sharedClient](MDMClient, "sharedClient"));
    objc_msgSend(v2, "retryNotNowResponse");

  }
}

uint64_t sub_1000573D4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t sub_1000573E4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100057678(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  int v12;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100057730;
    block[3] = &unk_1000E3E18;
    v11 = v6;
    v12 = a2;
    v10 = v5;
    dispatch_async(v8, block);

  }
}

uint64_t sub_100057730(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void sub_100057744(uint64_t a1, int a2, void *a3)
{
  void (*v5)(void);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a3;
  switch(a2)
  {
    case 0:
      v5 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
      goto LABEL_5;
    case 1:
    case 2:
      v5 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_5:
      v5();
      goto LABEL_8;
    case 3:
      v6 = *(_QWORD *)(a1 + 32);
      v13 = MCFeaturePromptErrorDomain;
      v14 = MCErrorArray(CFSTR("FEATURE_PROMPT_CANCELED"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v10 = MCErrorTypeFatal;
      v11 = v13;
      v12 = 50000;
      goto LABEL_7;
    default:
      v6 = *(_QWORD *)(a1 + 32);
      v7 = MCFeaturePromptErrorDomain;
      v8 = MCErrorArray(CFSTR("FEATURE_PROMPT_INVALID_RESPONSE"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = MCErrorTypeFatal;
      v11 = v7;
      v12 = 50001;
LABEL_7:
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v11, v12, v9, v10, 0, v16));
      (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v15);

LABEL_8:
      return;
  }
}

void sub_100057A18(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue(global_queue);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100057AC8;
    v7[3] = &unk_1000E2EC0;
    v9 = v4;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t sub_100057AC8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t sub_100057AD8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10005B814()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = _MCLogObjects[0];
  if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "eapolConfigurationAPIEnabled: returning FALSE", v1, 2u);
  }
}

void sub_100060904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100060940(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100060950(uint64_t a1)
{

}

intptr_t sub_100060958(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

intptr_t sub_100060974(uint64_t a1)
{
  dispatch_semaphore_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  int8x16_t v11;

  v2 = dispatch_semaphore_create(0);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v6 = sharedDAAccountStore(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "backingAccountInfo"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100060A3C;
  v10[3] = &unk_1000E3E68;
  v11 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  objc_msgSend(v7, "saveVerifiedAccount:withCompletionHandler:", v8, v10);

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t sub_100060A3C(uint64_t a1, char a2, void *a3)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  if ((a2 & 1) == 0)
  {
    v4 = MCSubCalErrorDomain;
    v5 = a3;
    v6 = MCErrorArray(CFSTR("SUBCAL_ACCT_CREATION_FAILED"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v4, 16000, v7, v5, MCErrorTypeFatal, 0));

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void sub_100061014(uint64_t a1, char a2, void *a3)
{
  id v5;
  os_log_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v7 = *(void **)(a1 + 32);
      v8 = v6;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
      v10 = 138543362;
      v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to save set aside account %{public}@ back in place", (uint8_t *)&v10, 0xCu);

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void sub_100062710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100062738(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100062748(uint64_t a1)
{

}

void sub_100062750(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100062C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

intptr_t sub_100062C74(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

intptr_t sub_100062C90(uint64_t a1)
{
  dispatch_semaphore_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  int8x16_t v11;

  v2 = dispatch_semaphore_create(0);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v6 = sharedDAAccountStore(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "backingAccountInfo"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100062D58;
  v10[3] = &unk_1000E3E68;
  v11 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  objc_msgSend(v7, "saveVerifiedAccount:withCompletionHandler:", v8, v10);

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t sub_100062D58(uint64_t a1, char a2, void *a3)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  if ((a2 & 1) == 0)
  {
    v4 = MCCalDAVErrorDomain;
    v5 = a3;
    v6 = MCErrorArray(CFSTR("CALDAV_ACCT_CREATION_FAILED"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v4, 17000, v7, v5, MCErrorTypeFatal, 0));

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void sub_100063330(uint64_t a1, char a2, void *a3)
{
  id v5;
  os_log_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v7 = *(void **)(a1 + 32);
      v8 = v6;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
      v10 = 138543362;
      v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to save set aside account %{public}@ back in place", (uint8_t *)&v10, 0xCu);

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void sub_100063670(id a1)
{
  MCProvisioningProfileJanitor *v1;
  void *v2;

  v1 = objc_alloc_init(MCProvisioningProfileJanitor);
  v2 = (void *)qword_1000FD940;
  qword_1000FD940 = (uint64_t)v1;

}

void sub_100063790(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint8_t v9[16];

  v2 = _MCLogObjects[11];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Updating MIS trust...", v9, 2u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "effectiveUnionValuesForSetting:", MCFeatureTrustedCodeSigningIdentities));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "profileTrust"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "updateTrustedCodeSigningIdentities:validateBundleIDs:validateManagedApps:", v4, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64)));

  objc_msgSend(*(id *)(a1 + 32), "_updateTrustedCodeSigningIdentitiesWithManagedAppSigners:outError:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](MCInstaller, "sharedInstaller"));
  objc_msgSend(v7, "removeUntrustedIdentitiesFromSender:", CFSTR("MCProvisioningProfileJanitor.updateMISTrust"));

  v8 = *(_QWORD *)(a1 + 56);
  if (v8)
    (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);

}

intptr_t sub_100063C00(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100063CE4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  dispatch_queue_global_t global_queue;
  NSObject *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueSystemDomainsDict"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyReader systemStoragePath](MCDependencyReader, "systemStoragePath"));
  objc_msgSend(v2, "MCWriteToBinaryFile:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueUserDomainsDict"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyReader userStoragePath](MCDependencyReader, "userStoragePath"));
  objc_msgSend(v4, "MCWriteToBinaryFile:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueSystemOrphansDict"));
  objc_msgSend(v6, "removeAllObjects");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueUserOrphansDict"));
  objc_msgSend(v7, "removeAllObjects");

  MCSendDependencyChangedNotification();
  v8 = *(void **)(a1 + 40);
  if (v8)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_async(v10, v8);

  }
}

void sub_1000642FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100064314(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100064324(uint64_t a1)
{

}

void sub_10006432C(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueOrphanedParentsInSystemDomain:", *(_QWORD *)(a1 + 40)));
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueOrphanedParentsInUserDomain:", *(_QWORD *)(a1 + 40)));
  if (v9 | v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    if (v9)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v9, "allObjects"));
      objc_msgSend(v3, "addObjectsFromArray:", v4);

    }
    if (v2)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v2, "allObjects"));
      objc_msgSend(v3, "addObjectsFromArray:", v5);

    }
  }
  else
  {
    v3 = 0;
  }
  v6 = objc_msgSend(v3, "copy");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void sub_100064504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10006451C(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueOrphanedParentsInSystemDomain:", *(_QWORD *)(a1 + 40)));
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_100064660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100064678(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueOrphanedParentsInUserDomain:", *(_QWORD *)(a1 + 40)));
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id sub_100064920(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "memberQueueAddDependent:toParent:inDomain:toSystem:user:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64), *(unsigned __int8 *)(a1 + 65));
}

void sub_100064DC4(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  BOOL v10;
  char v11;
  BOOL v12;
  int v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueDependentsOfParent:inSystemDomain:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)));
  v3 = objc_msgSend(v2, "count");

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueDependentsOfParent:inUserDomain:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)));
  v5 = objc_msgSend(v4, "count");

  objc_msgSend(*(id *)(a1 + 32), "memberQueueRemoveDependent:fromParent:inDomain:fromSystem:user:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(unsigned __int8 *)(a1 + 65));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueDependentsOfParent:inSystemDomain:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)));
  v7 = objc_msgSend(v6, "count");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueDependentsOfParent:inUserDomain:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)));
  v9 = objc_msgSend(v8, "count");

  if (v3)
    v10 = v7 == 0;
  else
    v10 = 0;
  v11 = v10;
  if (v5)
    v12 = v9 == 0;
  else
    v12 = 0;
  v13 = v12;
  if ((v11 & 1) != 0 || v13)
    objc_msgSend(*(id *)(a1 + 32), "memberQueueAddOrphanParent:inDomain:toSystem:user:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

id sub_1000652EC(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "memberQueueAddDependent:toParent:inDomain:toSystem:user:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 72), *(unsigned __int8 *)(a1 + 73));
  return objc_msgSend(*(id *)(a1 + 32), "memberQueueAddDependent:toParent:inDomain:toSystem:user:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72), *(unsigned __int8 *)(a1 + 73));
}

id sub_100065460(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "memberQueueRemoveDependent:fromParent:inDomain:fromSystem:user:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 72), *(unsigned __int8 *)(a1 + 73));
  return objc_msgSend(*(id *)(a1 + 32), "memberQueueRemoveDependent:fromParent:inDomain:fromSystem:user:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72), *(unsigned __int8 *)(a1 + 73));
}

void sub_100066AEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100066B14(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100066B24(uint64_t a1)
{

}

void sub_100066B2C(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100067054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  uint64_t v28;

  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 152), 8);
  _Unwind_Resume(a1);
}

intptr_t sub_100067090(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

intptr_t sub_1000670AC(uint64_t a1)
{
  dispatch_semaphore_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  int8x16_t v11;

  v2 = dispatch_semaphore_create(0);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v6 = sharedDAAccountStore(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "backingAccountInfo"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100067174;
  v10[3] = &unk_1000E3E68;
  v11 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  objc_msgSend(v7, "saveVerifiedAccount:withCompletionHandler:", v8, v10);

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t sub_100067174(uint64_t a1, char a2, void *a3)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  if ((a2 & 1) == 0)
  {
    v4 = MCLDAPErrorDomain;
    v5 = a3;
    v6 = MCErrorArray(CFSTR("LDAP_ACCT_CREATION_FAILED"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v4, 19000, v7, v5, MCErrorTypeFatal, 0));

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void sub_10006774C(uint64_t a1, char a2, void *a3)
{
  id v5;
  os_log_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v7 = *(void **)(a1 + 32);
      v8 = v6;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
      v10 = 138543362;
      v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to save set aside account %{public}@ back in place", (uint8_t *)&v10, 0xCu);

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void sub_100069004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10006902C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10006903C(uint64_t a1)
{

}

void sub_100069044(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_10006956C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  uint64_t v28;

  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 152), 8);
  _Unwind_Resume(a1);
}

intptr_t sub_1000695A8(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

intptr_t sub_1000695C4(uint64_t a1)
{
  dispatch_semaphore_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  int8x16_t v11;

  v2 = dispatch_semaphore_create(0);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v6 = sharedDAAccountStore(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "backingAccountInfo"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10006968C;
  v10[3] = &unk_1000E3E68;
  v11 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  objc_msgSend(v7, "saveVerifiedAccount:withCompletionHandler:", v8, v10);

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t sub_10006968C(uint64_t a1, char a2, void *a3)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  if ((a2 & 1) == 0)
  {
    v4 = MCCardDAVErrorDomain;
    v5 = a3;
    v6 = MCErrorArray(CFSTR("CARDDAV_ACCT_CREATION_FAILED"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v4, 20000, v7, v5, MCErrorTypeFatal, 0));

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void sub_100069C64(uint64_t a1, char a2, void *a3)
{
  id v5;
  os_log_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v7 = *(void **)(a1 + 32);
      v8 = v6;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
      v10 = 138543362;
      v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to save set aside account %{public}@ back in place", (uint8_t *)&v10, 0xCu);

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void sub_100069EC8(id a1)
{
  MCWatchSettingsMirror *v1;
  void *v2;

  v1 = objc_alloc_init(MCWatchSettingsMirror);
  v2 = (void *)qword_1000FD950;
  qword_1000FD950 = (uint64_t)v1;

}

void sub_10006A884(id a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
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
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  _QWORD v31[3];
  _QWORD v32[3];
  const __CFString *v33;
  void *v34;
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[3];
  const __CFString *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  _QWORD v43[3];
  _QWORD v44[3];
  const __CFString *v45;
  void *v46;
  _QWORD v47[3];
  _QWORD v48[3];
  const __CFString *v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  _QWORD v53[4];
  _QWORD v54[4];
  _QWORD v55[2];
  _QWORD v56[2];
  const __CFString *v57;
  void *v58;
  _QWORD v59[3];
  _QWORD v60[3];
  _QWORD v61[4];
  _QWORD v62[4];
  const __CFString *v63;
  void *v64;
  _QWORD v65[4];
  _QWORD v66[4];
  const __CFString *v67;
  void *v68;
  _QWORD v69[3];
  _QWORD v70[3];
  _QWORD v71[3];
  _QWORD v72[3];
  _QWORD v73[2];
  _QWORD v74[2];
  _QWORD v75[24];
  _QWORD v76[24];

  v75[0] = CFSTR("com.apple.aac");
  v73[0] = CFSTR("neverOrphanCheck");
  v73[1] = CFSTR("canOverrideRestrictions");
  v74[0] = &__kCFBooleanTrue;
  v74[1] = &__kCFBooleanTrue;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v74, v73, 2));
  v76[0] = v26;
  v75[1] = CFSTR("com.apple.accessibility.unmanaged.asam");
  v71[0] = CFSTR("bundlePath");
  v71[1] = CFSTR("loaderClass");
  v72[0] = CFSTR("/System/Library/PrivateFrameworks/AccessibilityUtilities.framework/AccessibilityUtilities");
  v72[1] = CFSTR("AXMobileConfigurationInterface");
  v71[2] = CFSTR("loaderSelector");
  v72[2] = CFSTR("activeRestrictionIdentifiers");
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v72, v71, 3));
  v76[1] = v25;
  v75[2] = CFSTR("com.apple.batterysaver");
  v69[0] = CFSTR("bundlePath");
  v69[1] = CFSTR("loaderClass");
  v70[0] = CFSTR("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration");
  v70[1] = CFSTR("MCBatterySaverMode");
  v69[2] = CFSTR("loaderSelector");
  v70[2] = CFSTR("setOfActiveRestrictionUUIDs");
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v70, v69, 3));
  v76[2] = v24;
  v75[3] = CFSTR("com.apple.carousel.noplaytime");
  v67 = CFSTR("neverOrphanCheck");
  v68 = &__kCFBooleanTrue;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1));
  v76[3] = v23;
  v75[4] = CFSTR("com.apple.dmd");
  v65[0] = CFSTR("bundlePath");
  v65[1] = CFSTR("loaderClass");
  v66[0] = CFSTR("/System/Library/PrivateFrameworks/DeviceManagement.framework/DeviceManagement");
  v66[1] = CFSTR("DMFConfigurationSourceClient");
  v65[2] = CFSTR("loaderSelector");
  v65[3] = CFSTR("orphanCheckMayFail");
  v66[2] = CFSTR("setOfActiveRestrictionUUIDs");
  v66[3] = &__kCFBooleanTrue;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v66, v65, 4));
  v76[4] = v22;
  v75[5] = CFSTR("com.apple.FaceTime");
  v63 = CFSTR("neverOrphanCheck");
  v64 = &__kCFBooleanTrue;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1));
  v76[5] = v21;
  v75[6] = CFSTR("com.apple.eas.account");
  v61[0] = CFSTR("bundlePath");
  v61[1] = CFSTR("loaderClass");
  v62[0] = CFSTR("/System/Library/PrivateFrameworks/DataAccess.framework/DataAccess");
  v62[1] = CFSTR("DAAccount");
  v61[2] = CFSTR("loaderSelector");
  v61[3] = CFSTR("recomputeComplianceSelector");
  v62[2] = CFSTR("oneshotListOfAccountIDs");
  v62[3] = CFSTR("reacquireClientRestrictions:");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v62, v61, 4));
  v76[6] = v20;
  v75[7] = CFSTR("com.apple.itunesstored");
  v59[0] = CFSTR("bundlePath");
  v59[1] = CFSTR("loaderClass");
  v60[0] = CFSTR("/System/Library/PrivateFrameworks/StoreServices.framework/StoreServices");
  v60[1] = CFSTR("SSRestrictions");
  v59[2] = CFSTR("loaderSelector");
  v60[2] = CFSTR("setOfActiveRestrictionUUIDs");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v60, v59, 3));
  v76[7] = v19;
  v75[8] = CFSTR("com.apple.lsd.appremoval");
  v57 = CFSTR("neverOrphanCheck");
  v58 = &__kCFBooleanTrue;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1));
  v76[8] = v18;
  v75[9] = CFSTR("com.apple.managedconfiguration.profilectl");
  v55[0] = CFSTR("neverOrphanCheck");
  v55[1] = CFSTR("canOverrideRestrictions");
  v56[0] = &__kCFBooleanTrue;
  v56[1] = &__kCFBooleanTrue;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v56, v55, 2));
  v76[9] = v17;
  v75[10] = CFSTR("com.apple.ManagedSettings");
  v53[0] = CFSTR("bundlePath");
  v53[1] = CFSTR("loaderClass");
  v54[0] = CFSTR("/System/Library/PrivateFrameworks/ManagedSettingsObjC.framework/ManagedSettingsObjC");
  v54[1] = CFSTR("MOEffectiveSettingsStore");
  v53[2] = CFSTR("loaderSelector");
  v53[3] = CFSTR("orphanCheckMayFail");
  v54[2] = CFSTR("setOfActiveRestrictionUUIDs");
  v54[3] = &__kCFBooleanTrue;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v54, v53, 4));
  v76[10] = v16;
  v75[11] = CFSTR("com.apple.mobilestoredemod");
  v51 = CFSTR("neverOrphanCheck");
  v52 = &__kCFBooleanTrue;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1));
  v76[11] = v15;
  v75[12] = CFSTR("com.apple.NanoBooksRestrictions");
  v49 = CFSTR("neverOrphanCheck");
  v50 = &__kCFBooleanTrue;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1));
  v76[12] = v14;
  v75[13] = CFSTR("com.apple.Passbook");
  v47[0] = CFSTR("bundlePath");
  v47[1] = CFSTR("loaderClass");
  v48[0] = CFSTR("/System/Library/PrivateFrameworks/PassKitCore.framework/PassKitCore");
  v48[1] = CFSTR("PKWalletVisibility");
  v47[2] = CFSTR("loaderSelector");
  v48[2] = CFSTR("setOfActiveRestrictionUUIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v48, v47, 3));
  v76[13] = v13;
  v75[14] = CFSTR("com.apple.Preferences");
  v45 = CFSTR("neverOrphanCheck");
  v46 = &__kCFBooleanTrue;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1));
  v76[14] = v12;
  v75[15] = CFSTR("com.apple.profiled.appenforced");
  v43[0] = CFSTR("bundlePath");
  v43[1] = CFSTR("loaderClass");
  v44[0] = CFSTR("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration");
  v44[1] = CFSTR("MCAppEnforcedRestrictions");
  v43[2] = CFSTR("loaderSelector");
  v44[2] = CFSTR("setOfActiveRestrictionUUIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v44, v43, 3));
  v76[15] = v11;
  v75[16] = CFSTR("com.apple.profiled.managedcodesigningidentities");
  v41 = CFSTR("neverOrphanCheck");
  v42 = &__kCFBooleanTrue;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
  v76[16] = v10;
  v75[17] = CFSTR("com.apple.remotemanagementd");
  v39 = CFSTR("neverOrphanCheck");
  v40 = &__kCFBooleanTrue;
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
  v76[17] = v1;
  v75[18] = CFSTR("com.apple.siri.parsec.HashtagImagesApp");
  v37[0] = CFSTR("bundlePath");
  v37[1] = CFSTR("loaderClass");
  v38[0] = CFSTR("/System/Library/PrivateFrameworks/CoreParsec.framework/CoreParsec");
  v38[1] = CFSTR("PARHashtagImagesVisibility");
  v37[2] = CFSTR("loaderSelector");
  v38[2] = CFSTR("setOfActiveRestrictionUUIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v38, v37, 3));
  v76[18] = v2;
  v75[19] = CFSTR("com.apple.siri.parsec.news");
  v35[0] = CFSTR("bundlePath");
  v35[1] = CFSTR("loaderClass");
  v36[0] = CFSTR("/System/Library/PrivateFrameworks/CoreParsec.framework/CoreParsec");
  v36[1] = CFSTR("PARNewsVisibility");
  v35[2] = CFSTR("loaderSelector");
  v36[2] = CFSTR("setOfActiveRestrictionUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v36, v35, 3));
  v76[19] = v3;
  v75[20] = CFSTR("com.apple.springboard");
  v33 = CFSTR("neverOrphanCheck");
  v34 = &__kCFBooleanTrue;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
  v76[20] = v4;
  v75[21] = CFSTR("com.apple.studentd");
  v31[0] = CFSTR("bundlePath");
  v31[1] = CFSTR("loaderClass");
  v32[0] = CFSTR("/System/Library/PrivateFrameworks/ClassroomKit.framework/ClassroomKit");
  v32[1] = CFSTR("CRKClassroomConfiguration");
  v31[2] = CFSTR("loaderSelector");
  v32[2] = CFSTR("setOfActiveRestrictionUUIDs:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 3));
  v76[21] = v5;
  v75[22] = CFSTR("com.apple.WatchListKit.isTVAllowed");
  v29 = CFSTR("neverOrphanCheck");
  v30 = &__kCFBooleanTrue;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
  v76[22] = v6;
  v75[23] = CFSTR("NanoPreferencesSync");
  v27 = CFSTR("neverOrphanCheck");
  v28 = &__kCFBooleanTrue;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
  v76[23] = v7;
  v8 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v76, v75, 24));
  v9 = (void *)qword_1000FD960;
  qword_1000FD960 = v8;

}

void sub_10006DC3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10006DC5C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10006DC6C(uint64_t a1)
{

}

void sub_10006DC74(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_10006DFA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10006DFC0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = (void *)*((_QWORD *)WeakRetained + 7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[DASharedAccountProperties DAAccountDoNotSaveReason](DASharedAccountProperties, "DAAccountDoNotSaveReason"));
    objc_msgSend(v8, "removeAccountPropertyForKey:", v9);

    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
      (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v11, v5);
  }

}

void sub_10006E25C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10006E280(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;
  uint64_t v7;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10006E308;
  v5[3] = &unk_1000E3850;
  v7 = *(_QWORD *)(a1 + 64);
  v4 = *(_OWORD *)(a1 + 48);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(v1, "_preflightWithPreflighter:completionHandler:", v2, v5);

}

void sub_10006E308(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10006F53C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 152), 8);
  _Unwind_Resume(a1);
}

intptr_t sub_10006F590(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

intptr_t sub_10006F5AC(uint64_t a1)
{
  dispatch_semaphore_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  int8x16_t v11;

  v2 = dispatch_semaphore_create(0);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v6 = sharedDAAccountStore(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "backingAccountInfo"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10006F674;
  v10[3] = &unk_1000E3E68;
  v11 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  objc_msgSend(v7, "saveVerifiedAccount:withCompletionHandler:", v8, v10);

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t sub_10006F674(uint64_t a1, char a2, void *a3)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  if ((a2 & 1) == 0)
  {
    v4 = MCEASErrorDomain;
    v5 = a3;
    v6 = MCErrorArray(CFSTR("EAS_ACCT_CREATION_FAILED"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v4, 21004, v7, v5, MCErrorTypeFatal, 0));

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void sub_10006FAC8(uint64_t a1, char a2, void *a3)
{
  id v5;
  os_log_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v7 = *(void **)(a1 + 32);
      v8 = v6;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
      v10 = 138543362;
      v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to save set aside account %{public}@ back in place", (uint8_t *)&v10, 0xCu);

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void sub_100070300(_Unwind_Exception *a1, int a2)
{
  uint64_t v2;
  id v3;
  NSObject *v4;

  if (a2 == 1)
  {
    v3 = objc_begin_catch(a1);
    v4 = _MCLogObjects[0];
    if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)(v2 - 160) = 138543362;
      *(_QWORD *)(v2 - 156) = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Caught exception %{public}@ while attempting to remove an account restrictions.", (uint8_t *)(v2 - 160), 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x1000702A4);
  }
  _Unwind_Resume(a1);
}

void sub_100070408(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  int v20;

  v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(unsigned __int8 *)(a1 + 64);
    *(_DWORD *)buf = 136315650;
    v16 = "-[MCNewEASAccountPayloadHandler remove]_block_invoke";
    v17 = 2114;
    v18 = v3;
    v19 = 1024;
    v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s - Will reset credential for account: %{public}@, use old password? %d", buf, 0x1Cu);
  }
  v5 = 48;
  if (!*(_BYTE *)(a1 + 64))
    v5 = 56;
  v6 = *(_QWORD *)(a1 + v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "backingAccountInfo"));
  objc_msgSend(v7, "setCredential:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "backingAccountInfo"));
  objc_msgSend(v8, "setAuthenticated:", 1);

  v10 = sharedDAAccountStore(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "backingAccountInfo"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10007059C;
  v13[3] = &unk_1000E4070;
  v14 = *(id *)(a1 + 40);
  objc_msgSend(v11, "saveVerifiedAccount:withCompletionHandler:", v12, v13);

}

void sub_10007059C(uint64_t a1, char a2, void *a3)
{
  id v5;
  os_log_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v7 = *(void **)(a1 + 32);
      v8 = v6;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "backingAccountInfo"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
      v11 = 138543618;
      v12 = v10;
      v13 = 2114;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Error saving account %{public}@. Error: %{public}@", (uint8_t *)&v11, 0x16u);

    }
  }

}

void sub_100071D58(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100071D90(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100071DA0(uint64_t a1)
{

}

void sub_100071DA8(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100073944(id a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v1 = MCGetBaseResourcePath(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("enforcedAppWhitelistRestrictions.plist")));
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v3));

  v4 = objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization MCSafePropertyListWithData:options:format:error:](NSPropertyListSerialization, "MCSafePropertyListWithData:options:format:error:", v6, 0, 0, 0));
  v5 = (void *)qword_1000FD970;
  qword_1000FD970 = v4;

}

void sub_100073CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  uint64_t v14;
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 120), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100073CF0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100073D00(uint64_t a1)
{

}

void sub_100073D08(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  unsigned int v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  unsigned int v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  _BYTE *v42;
  _BYTE *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  unsigned int v51;
  id v52;
  id v53;
  char v54;

  v54 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueRestrictions"));
  v3 = objc_msgSend(v2, "copy");

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueCombinedSystemProfileRestrictions"));
  v5 = objc_msgSend(v4, "copy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueRestrictions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "defaultRestrictions"));
  v9 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueSystemClientRestrictions"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueUserClientRestrictions"));
  v53 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter restrictionsWithCurrentRestrictions:defaultRestrictions:systemProfileRestrictions:userProfileRestrictions:systemClientRestrictions:userClientRestrictions:outRestrictionsChanged:outError:](MCRestrictionManagerWriter, "restrictionsWithCurrentRestrictions:defaultRestrictions:systemProfileRestrictions:userProfileRestrictions:systemClientRestrictions:userClientRestrictions:outRestrictionsChanged:outError:", v6, v7, v9, v8, v10, v11, &v54, &v53));
  v13 = v53;

  if (!v12)
    goto LABEL_28;
  v52 = v5;
  v51 = objc_msgSend(*(id *)(a1 + 32), "applyConfiguration:toDomain:inNamespace:fromSender:", *(_QWORD *)(a1 + 40), 6, 0, *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "applyConfiguration:toDomain:inNamespace:fromSender:", *(_QWORD *)(a1 + 48), 7, 0, *(_QWORD *)(a1 + 56));
  v14 = objc_msgSend(*(id *)(a1 + 32), "applyConfiguration:toDomain:inNamespace:fromSender:", v12, 5, 0, *(_QWORD *)(a1 + 56));
  v15 = *(void **)(a1 + 40);
  v16 = MCSystemProfileRestrictionsFilePath(v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  objc_msgSend(v15, "MCWriteToBinaryFile:", v17);

  v18 = *(void **)(a1 + 48);
  v19 = MCUserProfileRestrictionsFilePath();
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  objc_msgSend(v18, "MCWriteToBinaryFile:", v20);

  objc_msgSend(*(id *)(a1 + 32), "memberQueueCommitRestrictionsToDisk");
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueEffectiveUserSettings"));
  v22 = objc_msgSend(v21, "MCDeepCopy");

  v23 = objc_msgSend(*(id *)(a1 + 32), "memberQueueRecomputeEffectiveUserSettingsPasscode:credentialSet:", 0, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](MCHacks, "sharedHacks"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueEffectiveUserSettings"));
  objc_msgSend(v24, "_applyServerSideChangesWithOldRestrictions:newRestrictions:oldEffectiveUserSettings:newEffectiveUserSettings:", v3, v12, v22, v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueSystemUserSettings"));
  v27 = objc_msgSend(v26, "MCMutableDeepCopy");

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks sharedHacks](MCServerSideHacks, "sharedHacks"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueEffectiveUserSettings"));
  v30 = objc_msgSend(v28, "applyEffectiveSettings:toSettings:withOldRestrictions:newRestrictions:", v29, v27, v3, v12);

  if (v23 && v30)
  {
    objc_msgSend(*(id *)(a1 + 32), "applyConfiguration:toDomain:inNamespace:fromSender:", v27, 0, 0, *(_QWORD *)(a1 + 56));
    v31 = objc_msgSend(*(id *)(a1 + 32), "memberQueueCommitUserSettingsToDisk");
  }
  if (v54)
  {
    MCSendRestrictionChangedNotification(v31);
    if (+[MCPasscodeManagerWriter didPasscodePolicyChangeWithOldRestrictions:newRestrictions:](MCPasscodeManagerWriter, "didPasscodePolicyChangeWithOldRestrictions:newRestrictions:", v3, v12))
    {
      objc_msgSend(*(id *)(a1 + 32), "memberQueueClearPasscodeHistoryIfNecessary");
      objc_msgSend(*(id *)(a1 + 32), "memberQueueClearRestrictionPasscodeComplianceCache");
      MCSendPasscodePolicyChangedNotification(objc_msgSend(*(id *)(a1 + 32), "memberQueueClearProfileRestrictionPasscodeComplianceCache"));
    }
    if (*(_QWORD *)(a1 + 80))
    {
      v32 = MCFeatureAppLockBundleIDs;
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueEffectiveUserSettings"));
      if ((+[MCRestrictionManagerWriter intersectedValuesSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManagerWriter, "intersectedValuesSetting:valueChangedBetweenOldSettings:andNewSettings:", v32, v22, v33) & 1) != 0)
      {
LABEL_16:

LABEL_17:
        **(_BYTE **)(a1 + 80) = 1;
        goto LABEL_18;
      }
      v34 = MCFeatureAppLockMultipleAppsAllowed;
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueEffectiveUserSettings"));
      if ((+[MCRestrictionManagerWriter BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManagerWriter, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", v34, v22, v35) & 1) != 0)
      {
LABEL_15:

        goto LABEL_16;
      }
      v50 = v35;
      v36 = MCFeatureAppLockAccessWithoutPasscodeAllowed;
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueEffectiveUserSettings"));
      if ((+[MCRestrictionManagerWriter BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManagerWriter, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", v36, v22, v37) & 1) != 0)
      {
LABEL_14:

        v35 = v50;
        goto LABEL_15;
      }
      v49 = v37;
      v38 = MCFeatureAppLockGrantSupervisorAccessForced;
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueEffectiveUserSettings"));
      if ((+[MCRestrictionManagerWriter BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManagerWriter, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", v38, v22, v39) & 1) != 0)
      {

        v37 = v49;
        goto LABEL_14;
      }
      v46 = MCFeatureAppLockLogoutAllowed;
      v48 = v39;
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueEffectiveUserSettings"));
      LOBYTE(v46) = +[MCRestrictionManagerWriter BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManagerWriter, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", v46, v22, v47);

      if ((v46 & 1) != 0)
        goto LABEL_17;
    }
  }
LABEL_18:
  if (v51)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueuePasscodeCompliesWithProfileRestrictions"));

    if (v40)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueCombinedSystemProfileRestrictions"));
      if (+[MCPasscodeManagerWriter didPasscodePolicyChangeWithOldRestrictions:newRestrictions:](MCPasscodeManagerWriter, "didPasscodePolicyChangeWithOldRestrictions:newRestrictions:", v52, v41))
      {
        objc_msgSend(*(id *)(a1 + 32), "memberQueueClearProfileRestrictionPasscodeComplianceCache");
      }

    }
  }
  v42 = *(_BYTE **)(a1 + 88);
  if (v42)
    *v42 = v54;
  v43 = *(_BYTE **)(a1 + 96);
  if (v43)
    *v43 = v23;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;

  v5 = v52;
LABEL_28:
  v44 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v45 = *(void **)(v44 + 40);
  *(_QWORD *)(v44 + 40) = v13;

}

void sub_1000744B8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueUserClientRestrictions"));
  v12 = objc_msgSend(v2, "MCMutableDeepCopy");

  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)v3;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueSystemClientRestrictions"));
    v7 = objc_msgSend(v6, "MCMutableDeepCopy");

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));
    v12 = v7;
    if (!v5)
      goto LABEL_11;
  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
    v8 = *(_QWORD *)(a1 + 48);
  else
    v8 = 0;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, kMCClientRestrictionsUserInfo);
  if (v4)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueSystemClientRestrictions"));
    v10 = v12;
  }
  else
  {
    v9 = v12;
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueUserClientRestrictions"));
  }
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "memberQueueSetSystemClientRestrictions:userClientRestrictions:sender:outRestrictionsChanged:outEffectiveSettingsChanged:outError:", v9, v10, *(_QWORD *)(a1 + 56), 0, 0, 0);

LABEL_11:
}

void sub_100074B6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t v12;
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v12 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_100074B94(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  id v8;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[9];
  v6 = a1[10];
  obj = 0;
  v7 = objc_msgSend(v2, "memberQueueSetAllClientRestrictions:sender:outRestrictionsChanged:outEffectiveSettingsChanged:outError:", v3, v4, v5, v6, &obj);
  v8 = obj;
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v7;
  objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), v8);
}

void sub_100074F54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_100074F84(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  id v10;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned __int8 v36;
  id v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  _QWORD v45[2];
  _QWORD v46[2];

  if (*(_BYTE *)(a1 + 128))
  {
    v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000FD980, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32)));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("canOverrideRestrictions")));
    if ((objc_msgSend(v3, "BOOLValue") & 1) == 0)
    {
      v26 = MCClientRestrictionsErrorDomain;
      v40 = *(_QWORD *)(a1 + 32);
      v27 = MCErrorArray(CFSTR("CLIENT_RESTRICTION_ERROR_CANNOT_OVERRIDE_P_CLIENT_TYPE"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      v10 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v26, 63000, v28, MCErrorTypeFatal, v40, 0));

      goto LABEL_32;
    }
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "memberQueueOverridingRestrictionClientUUID"));
    v5 = v4;
    if (v4 && !MCEqualStrings(v4, *(_QWORD *)(a1 + 48)))
    {
      v29 = MCClientRestrictionsErrorDomain;
      v30 = MCErrorArray(CFSTR("CLIENT_RESTRICTION_ERROR_ALREADY_OVERRIDDEN"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      v10 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v29, 63001, v31, MCErrorTypeFatal, 0));

LABEL_31:
      goto LABEL_32;
    }

  }
  v2 = objc_msgSend(*(id *)(a1 + 56), "MCMutableDeepCopy");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](MCHacks, "sharedHacks"));
  objc_msgSend(v6, "_applyHeuristicsToRestrictions:forProfile:ignoresUnrestrictableApps:", v2, 0, *(unsigned __int8 *)(a1 + 128));

  v7 = MCLocalizedErrorFormatByDevice(CFSTR("ENCRYPTION_POLICY_CLIENT_FAILURE_TEXT"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCDeviceCapabilities currentDevice](MCDeviceCapabilities, "currentDevice"));
  v44 = 0;
  v9 = objc_msgSend(v8, "validateCapabilitiesRequiredByRestrictions:localizedIncompatibilityMessage:outError:", v2, v3, &v44);
  v10 = v44;

  if (v9)
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "memberQueueClientRestrictionsForClientUUID:", *(_QWORD *)(a1 + 48)));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "memberQueueClientTypeForClientUUID:", *(_QWORD *)(a1 + 48)));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "memberQueueOverridingRestrictionClientUUID"));
    v13 = *(unsigned __int8 *)(a1 + 128);
    v14 = MCEqualStrings(v12, *(_QWORD *)(a1 + 48));
    if (sub_100019004((void *)v5, v2)
      && MCEqualStrings(v11, *(_QWORD *)(a1 + 32))
      && v13 == v14
      || !(v5 | v11) && !objc_msgSend(*(id *)(a1 + 56), "count"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 1;
LABEL_30:

      goto LABEL_31;
    }
    v41 = v11;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "memberQueueSystemClientRestrictions"));
    v16 = objc_msgSend(v15, "MCMutableDeepCopy");

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "memberQueueUserClientRestrictions"));
    v18 = objc_msgSend(v17, "MCMutableDeepCopy");

    if (*(_BYTE *)(a1 + 129))
      v19 = v16;
    else
      v19 = v18;
    v20 = v19;
    v42 = v20;
    if (!objc_msgSend(*(id *)(a1 + 56), "count"))
    {
      objc_msgSend(v20, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 48));
      if (MCEqualStrings(v12, *(_QWORD *)(a1 + 48)))
        objc_msgSend(*(id *)(a1 + 40), "setMemberQueueOverridingRestrictionClientUUID:", 0);
      goto LABEL_27;
    }
    v45[0] = kMCClientRestrictionsTruth;
    v45[1] = kMCClientRestrictionsType;
    v21 = *(_QWORD *)(a1 + 32);
    v46[0] = v2;
    v46[1] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v46, v45, 2));
    v23 = objc_msgSend(v22, "mutableCopy");

    objc_msgSend(v23, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 64), kMCClientRestrictionsLocalizedClientDescription);
    objc_msgSend(v23, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 72), kMCClientRestrictionsLocalizedWarning);
    objc_msgSend(v23, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 80), kMCClientRestrictionsAppsAndOptions);
    if (*(_BYTE *)(a1 + 128))
    {
      objc_msgSend(v23, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kMCClientRestrictionsOverrideRestrictions);
      v24 = *(_QWORD *)(a1 + 48);
      v25 = v42;
    }
    else
    {
      v25 = v42;
      if (!MCEqualStrings(v12, *(_QWORD *)(a1 + 48)))
      {
LABEL_26:
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v23, *(_QWORD *)(a1 + 48));

LABEL_27:
        v32 = *(void **)(a1 + 40);
        v33 = *(_QWORD *)(a1 + 88);
        v34 = *(_QWORD *)(a1 + 112);
        v35 = *(_QWORD *)(a1 + 120);
        v43 = v10;
        v36 = objc_msgSend(v32, "memberQueueSetSystemClientRestrictions:userClientRestrictions:sender:outRestrictionsChanged:outEffectiveSettingsChanged:outError:", v16, v18, v33, v34, v35, &v43);
        v37 = v43;

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = v36;
        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
          objc_msgSend(*(id *)(a1 + 40), "setMemberQueueOverridingRestrictionClientUUID:", v12);

        v10 = v37;
        v11 = v41;
        goto LABEL_30;
      }
      v24 = 0;
    }
    objc_msgSend(*(id *)(a1 + 40), "setMemberQueueOverridingRestrictionClientUUID:", v24);
    goto LABEL_26;
  }
LABEL_32:

  v38 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
  v39 = *(void **)(v38 + 40);
  *(_QWORD *)(v38 + 40) = v10;

}

void sub_100075DC0(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueSystemClientRestrictions"));
  v3 = objc_msgSend(v2, "copy");

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "orphanedClientUUIDsForClientRestrictionDictionary:", v3));
  if (objc_msgSend(v4, "count"))
  {
    v5 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543362;
      v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Found orphaned system client uuids %{public}@.  Removing them", (uint8_t *)&v16, 0xCu);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueSystemClientRestrictions"));
    v7 = objc_msgSend(v6, "MCMutableDeepCopy");

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
    objc_msgSend(v7, "removeObjectsForKeys:", v8);

    objc_msgSend(*(id *)(a1 + 32), "applyConfiguration:toDomain:inNamespace:fromSender:", v7, 8, 0, CFSTR("MCRestrictionManagerWriter.RemoveOrphanedClientRestrictions"));
    objc_msgSend(*(id *)(a1 + 32), "memberQueueMarkToClearPasscodeComplianceCacheWithOldSystemClientRestrictions:newSystemClientRestrictions:", v3, v7);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueUserClientRestrictions"));
  v10 = objc_msgSend(v9, "copy");

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "orphanedClientUUIDsForClientRestrictionDictionary:", v10));
  if (objc_msgSend(v11, "count"))
  {
    v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543362;
      v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Found orphaned user client uuids %{public}@.  Removing them", (uint8_t *)&v16, 0xCu);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueUserClientRestrictions"));
    v14 = objc_msgSend(v13, "MCMutableDeepCopy");

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allObjects"));
    objc_msgSend(v14, "removeObjectsForKeys:", v15);

    objc_msgSend(*(id *)(a1 + 32), "applyConfiguration:toDomain:inNamespace:fromSender:", v14, 9, 0, CFSTR("MCRestrictionManagerWriter.RemoveOrphanedClientRestrictions"));
  }
  if (objc_msgSend(v4, "count") || objc_msgSend(v11, "count"))
    objc_msgSend(*(id *)(a1 + 32), "memberQueueCommitClientRestrictionsToDisk");

}

void sub_1000760E0(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  unsigned int v6;
  _BYTE *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  unsigned __int8 v44;
  NSDictionary *v45;
  uint64_t v46;
  void *v47;
  id v48;
  uint8_t buf[16];

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueRecomputePasscodeComplianceForClientUUID"));
  if (!v2
    || (v3 = (void *)v2,
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueRecomputePasscodeComplianceForClientUUID")),
        v5 = objc_msgSend(v4, "count"),
        v4,
        v3,
        v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "memberQueueCacheClientRestrictionPasscodeCompliance");
  }
  v6 = objc_msgSend(*(id *)(a1 + 32), "memberQueueCheckPasscodeCompliesWithCurrentRestrictions");
  v7 = *(_BYTE **)(a1 + 40);
  if (v7)
    *v7 = v6;
  if (v6)
  {
    v8 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Current passcode complies with restrictions. Removing nag.", buf, 2u);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v10 = MCNagUIMetaFilePath(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_msgSend(v9, "fileExistsAtPath:", v11);

    v13 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v14 = (void *)v13;
    if (!v12)
    {
      v28 = MCPasscodeNagKeepAliveFilePath();
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      objc_msgSend(v14, "removeItemAtPath:error:", v29, 0);

      return;
    }
    v15 = MCNagUIMetaFilePath(v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    objc_msgSend(v14, "removeItemAtPath:error:", v16, 0);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v18 = MCPasscodeNagKeepAliveFilePath();
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    objc_msgSend(v17, "removeItemAtPath:error:", v19, 0);

    goto LABEL_22;
  }
  v20 = *(void **)(a1 + 32);
  v48 = 0;
  v21 = objc_msgSend(v20, "memberQueueIsPasscodeComplianceMandatoryWithOutLocalizedWarning:", &v48);
  v22 = v48;
  v23 = MCNagUIMetaFilePath(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithContentsOfFile:](NSMutableDictionary, "dictionaryWithContentsOfFile:", v24));
  v26 = v25;
  if (v25)
    v27 = v25;
  else
    v27 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v30 = v27;

  v31 = kMCNagMetaMandatoryKey;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", kMCNagMetaMandatoryKey));
  v33 = v32;
  if (v32 && (_DWORD)v21 == objc_msgSend(v32, "BOOLValue"))
  {
    v35 = 0;
  }
  else
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v21));
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v34, v31);

    v35 = 1;
  }
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v22, kMCNagMetaMessageKey);
  objc_msgSend(v30, "setObject:forKeyedSubscript:", 0, kMCNagMetaLastLockDateKey);
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "localeIdentifier"));
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v37, kMCNagMetaLastLocaleKey);

  v39 = MCNagUIMetaFilePath(v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
  objc_msgSend(v30, "MCWriteToBinaryFile:", v40);

  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v42 = MCPasscodeNagKeepAliveFilePath();
  v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
  v44 = objc_msgSend(v41, "fileExistsAtPath:", v43);

  if ((v44 & 1) == 0)
  {
    v45 = objc_opt_new(NSDictionary);
    v46 = MCPasscodeNagKeepAliveFilePath();
    v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
    -[NSDictionary MCWriteToBinaryFile:](v45, "MCWriteToBinaryFile:", v47);

  }
  if (v35)
LABEL_22:
    MCSendPasscodeComplianceChangedNotification();
}

id sub_100077720(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "memberQueueClearAllPasscodeComplianceCaches");
}

void sub_100077810(id a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v1 = MCNagUIMetaFilePath(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithContentsOfFile:](NSMutableDictionary, "dictionaryWithContentsOfFile:", v2));

  if (v5)
  {
    v3 = MCNagUIMetaFilePath(objc_msgSend(v5, "removeObjectForKey:", kMCNagMetaLastLockDateKey));
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    objc_msgSend(v5, "MCWriteToBinaryFile:", v4);

  }
}

void sub_100077928(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = MCNagUIMetaFilePath(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithContentsOfFile:](NSMutableDictionary, "dictionaryWithContentsOfFile:", v3));

  v4 = v8;
  if (v8)
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
    {
      v6 = MCNagUIMetaFilePath(objc_msgSend(v8, "setObject:forKey:", v5, kMCNagMetaLastLockDateKey));
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      objc_msgSend(v8, "MCWriteToBinaryFile:", v7);

      v4 = v8;
    }
  }

}

void sub_1000782A0(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueSystemUserSettings"));
  v6 = objc_msgSend(v2, "mutableCopy");

  v3 = MCRestrictedBoolKey;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", MCRestrictedBoolKey));
  v5 = objc_msgSend(v4, "mutableCopy");

  if (v5)
  {
    objc_msgSend(v5, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v6, "setObject:forKey:", v5, v3);
    objc_msgSend(*(id *)(a1 + 32), "applyConfiguration:toDomain:inNamespace:fromSender:", v6, 0, 0, *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "memberQueueCommitUserSettingsToDisk");
    objc_msgSend(*(id *)(a1 + 32), "memberQueueRecomputeEffectiveUserSettingsPasscode:credentialSet:", 0, 0);
  }

}

void sub_100078428(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueSystemUserSettings"));
  v6 = objc_msgSend(v2, "mutableCopy");

  v3 = MCRestrictedValueKey;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", MCRestrictedValueKey));
  v5 = objc_msgSend(v4, "mutableCopy");

  if (v5)
  {
    objc_msgSend(v5, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v6, "setObject:forKey:", v5, v3);
    objc_msgSend(*(id *)(a1 + 32), "applyConfiguration:toDomain:inNamespace:fromSender:", v6, 0, 0, *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "memberQueueCommitUserSettingsToDisk");
    objc_msgSend(*(id *)(a1 + 32), "memberQueueRecomputeEffectiveUserSettingsPasscode:credentialSet:", 0, 0);
  }

}

id sub_10007858C(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "defaultSettings"));
  objc_msgSend(v2, "applyConfiguration:toDomain:inNamespace:fromSender:", v3, 0, 0, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "memberQueueCommitUserSettingsToDisk");
  return objc_msgSend(*(id *)(a1 + 32), "memberQueueRecomputeEffectiveUserSettingsPasscode:credentialSet:", 0, 0);
}

id sub_10007868C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "memberQueueRecomputeEffectiveUserSettingsPasscode:credentialSet:", *(_QWORD *)(a1 + 40), 0);
}

void sub_100078708(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  unsigned int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  char v17;

  v17 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueRestrictions"));
  v3 = objc_msgSend(v2, "copy");

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueRestrictions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "defaultRestrictions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueSystemProfileRestrictions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueUserProfileRestrictions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueSystemClientRestrictions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueUserClientRestrictions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter restrictionsWithCurrentRestrictions:defaultRestrictions:systemProfileRestrictions:userProfileRestrictions:systemClientRestrictions:userClientRestrictions:outRestrictionsChanged:outError:](MCRestrictionManagerWriter, "restrictionsWithCurrentRestrictions:defaultRestrictions:systemProfileRestrictions:userProfileRestrictions:systemClientRestrictions:userClientRestrictions:outRestrictionsChanged:outError:", v4, v5, v6, v7, v8, v9, &v17, 0));

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "applyConfiguration:toDomain:inNamespace:fromSender:", v10, 5, 0, CFSTR("MCRestrictionManagerWriter.RecomputeUserRestrictions"));
    objc_msgSend(*(id *)(a1 + 32), "memberQueueCommitRestrictionsToDisk");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueEffectiveUserSettings"));
    v12 = objc_msgSend(v11, "MCDeepCopy");

    v13 = objc_msgSend(*(id *)(a1 + 32), "memberQueueRecomputeEffectiveUserSettingsPasscode:credentialSet:", 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](MCHacks, "sharedHacks"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "memberQueueEffectiveUserSettings"));
    objc_msgSend(v14, "_applyServerSideChangesWithOldRestrictions:newRestrictions:oldEffectiveUserSettings:newEffectiveUserSettings:", v3, v10, v12, v15);

    if (v17)
    {
      MCSendRestrictionChangedNotification(v16);
      if (+[MCPasscodeManagerWriter didPasscodePolicyChangeWithOldRestrictions:newRestrictions:](MCPasscodeManagerWriter, "didPasscodePolicyChangeWithOldRestrictions:newRestrictions:", v3, v10))
      {
        objc_msgSend(*(id *)(a1 + 32), "memberQueueClearPasscodeHistoryIfNecessary");
        MCSendPasscodePolicyChangedNotification(objc_msgSend(*(id *)(a1 + 32), "memberQueueClearAllPasscodeComplianceCaches"));
      }
    }
    if (v13)
      MCSendEffectiveSettingsChangedNotification(*(unsigned int *)(*(_QWORD *)(a1 + 32) + 8));

  }
}

void sub_100078A9C(id a1)
{
  uint64_t v1;
  void *v2;
  __int128 v3;
  void *v4;
  NSString *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  BOOL v13;
  os_log_t v15;
  NSObject *v16;
  os_log_type_t v17;
  const char *v18;
  uint32_t v19;
  NSString *v20;
  Class v21;
  SEL v22;
  os_log_t v23;
  os_log_t v24;
  NSObject *v25;
  SEL v26;
  os_log_t v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  __int128 v33;
  void *v34;
  void *v35;
  id obj;
  uint64_t v37;
  id v38;
  NSString *aSelectorName;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  NSString *v45;
  __int16 v46;
  NSString *v47;
  __int16 v48;
  NSString *v49;
  _BYTE v50[128];

  v1 = objc_claimAutoreleasedReturnValue(+[MCClientTypeLoaders clientTypeLoaders](MCClientTypeLoaders, "clientTypeLoaders"));
  v2 = (void *)qword_1000FD980;
  qword_1000FD980 = v1;

  qword_1000FD990 = (uint64_t)CFDictionaryCreateMutable(kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, 0);
  qword_1000FD998 = (uint64_t)CFDictionaryCreateMutable(kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, 0);
  qword_1000FD9A0 = (uint64_t)CFDictionaryCreateMutable(kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = (id)qword_1000FD980;
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
  if (v38)
  {
    v37 = *(_QWORD *)v41;
    *(_QWORD *)&v3 = 138543874;
    v33 = v3;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v41 != v37)
          objc_enumerationMutation(obj);
        v5 = *(NSString **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000FD980, "objectForKey:", v5, v33));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("bundlePath")));
        v8 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("loaderClass")));
        v9 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("loaderSelector")));
        aSelectorName = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("recomputeComplianceSelector")));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("neverOrphanCheck")));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("orphanCheckMayFail")));
        if (v10 && objc_msgSend(v10, "BOOLValue"))
        {
          v12 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            v45 = v5;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Client type %{public}@ is denoted as never orphan check. Skipping client loader.", buf, 0xCu);
          }
          objc_msgSend(v35, "addObject:", v5);
        }
        else
        {
          if (v7)
            v13 = v8 == 0;
          else
            v13 = 1;
          if (v13 || v9 == 0)
          {
            v15 = _MCLogObjects[0];
            if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
              goto LABEL_29;
            *(_DWORD *)buf = 138543618;
            v45 = v5;
            v46 = 2114;
            v47 = (NSString *)v6;
            v16 = v15;
            v17 = OS_LOG_TYPE_ERROR;
            v18 = "Could not find a client type loader for client type %{public}@. Found a loader dict of %{public}@";
LABEL_21:
            v19 = 22;
LABEL_28:
            _os_log_impl((void *)&_mh_execute_header, v16, v17, v18, buf, v19);
            goto LABEL_29;
          }
          v20 = objc_retainAutorelease(v7);
          if (!dlopen(-[NSString cStringUsingEncoding:](v20, "cStringUsingEncoding:", 1), 2))
          {
            v23 = _MCLogObjects[0];
            if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
              goto LABEL_29;
            *(_DWORD *)buf = 138543362;
            v45 = v20;
            v16 = v23;
            v17 = OS_LOG_TYPE_ERROR;
            v18 = "Could not find a bundle at %{public}@";
            v19 = 12;
            goto LABEL_28;
          }
          v21 = NSClassFromString(v8);
          if (v21)
          {
            CFDictionarySetValue((CFMutableDictionaryRef)qword_1000FD990, v5, v21);
            v22 = NSSelectorFromString(v9);
            if (v22)
            {
              CFDictionarySetValue((CFMutableDictionaryRef)qword_1000FD998, v5, v22);
            }
            else
            {
              v25 = _MCLogObjects[0];
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v33;
                v45 = v20;
                v46 = 2114;
                v47 = v9;
                v48 = 2114;
                v49 = v8;
                _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Bundle at path %{public}@ does not have selector %{public}@ for class %{public}@.", buf, 0x20u);
              }
            }
            if (v11 && objc_msgSend(v11, "BOOLValue"))
              objc_msgSend(v34, "addObject:", v5);
            if (aSelectorName)
            {
              v26 = NSSelectorFromString(aSelectorName);
              if (v26)
              {
                CFDictionarySetValue((CFMutableDictionaryRef)qword_1000FD9A0, v5, v26);
              }
              else
              {
                v27 = _MCLogObjects[0];
                if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = v33;
                  v45 = v20;
                  v46 = 2114;
                  v47 = aSelectorName;
                  v48 = 2114;
                  v49 = v8;
                  v16 = v27;
                  v17 = OS_LOG_TYPE_INFO;
                  v18 = "Bundle at path %{public}@ does not have selector %{public}@ for class %{public}@.";
                  v19 = 32;
                  goto LABEL_28;
                }
              }
            }
          }
          else
          {
            v24 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v45 = v8;
              v46 = 2114;
              v47 = v20;
              v16 = v24;
              v17 = OS_LOG_TYPE_ERROR;
              v18 = "Could not find class %{public}@ in bundle at path %{public}@";
              goto LABEL_21;
            }
          }
        }
LABEL_29:

        v4 = (char *)v4 + 1;
      }
      while (v38 != v4);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
      v38 = v28;
    }
    while (v28);
  }

  v29 = objc_msgSend(v35, "copy");
  v30 = (void *)qword_1000FD988;
  qword_1000FD988 = (uint64_t)v29;

  v31 = objc_msgSend(v34, "copy");
  v32 = (void *)qword_1000FD9A8;
  qword_1000FD9A8 = (uint64_t)v31;

}

void sub_1000790E4(id a1)
{
  MCCloudConfigurationWriter *v1;
  void *v2;

  v1 = objc_opt_new(MCCloudConfigurationWriter);
  v2 = (void *)qword_1000FD9B8;
  qword_1000FD9B8 = (uint64_t)v1;

}

void sub_100079354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10007936C(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if ((a2 & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_isCloudConfigurationActuallyAvailable");
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      v9 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "This device must be configured using DEP.", v11, 2u);
      }
    }
  }
  else
  {
    v10 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Could not retrieve DEP configuration.", buf, 2u);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void sub_100079B98(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100079BB4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100079BC4(uint64_t a1)
{

}

uint64_t sub_100079BCC(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v7 = a2;
  v8 = a4;
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7));
  v10 = (void *)v9;
  if (v9 && (objc_opt_isKindOfClass(v9, a3) & 1) == 0)
  {
    v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ value is not a %@"), v7, v8));
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    v11 = 0;
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

uint64_t sub_100079C8C(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  v4 = objc_opt_class(NSNumber);
  v5 = (*(uint64_t (**)(uint64_t, id, uint64_t, const __CFString *))(v2 + 16))(v2, v3, v4, CFSTR("BOOLean"));

  return v5;
}

uint64_t sub_100079CF0(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  v4 = objc_opt_class(NSNumber);
  v5 = (*(uint64_t (**)(uint64_t, id, uint64_t, const __CFString *))(v2 + 16))(v2, v3, v4, CFSTR("number"));

  return v5;
}

uint64_t sub_100079D54(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  v4 = objc_opt_class(NSString);
  v5 = (*(uint64_t (**)(uint64_t, id, uint64_t, const __CFString *))(v2 + 16))(v2, v3, v4, CFSTR("string"));

  return v5;
}

uint64_t sub_100079DB8(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v7 = a2;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7));
  if (v9 && (v10 = objc_opt_class(NSArray), (objc_opt_isKindOfClass(v9, v10) & 1) == 0))
  {
    v20 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ value is not an array"), v7));
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;

    v16 = 0;
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      while (2)
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          if ((objc_opt_isKindOfClass(*(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v15), a3) & 1) == 0)
          {
            v17 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ element is not a %@"), v7, v8, (_QWORD)v24));
            v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v19 = *(void **)(v18 + 40);
            *(_QWORD *)(v18 + 40) = v17;

            v16 = 0;
            goto LABEL_13;
          }
          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v13)
          continue;
        break;
      }
    }
    v16 = 1;
LABEL_13:

  }
  return v16;
}

uint64_t sub_100079F88(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  v4 = objc_opt_class(NSData);
  v5 = (*(uint64_t (**)(uint64_t, id, uint64_t, const __CFString *))(v2 + 16))(v2, v3, v4, CFSTR("data"));

  return v5;
}

uint64_t sub_100079FEC(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  v4 = objc_opt_class(NSString);
  v5 = (*(uint64_t (**)(uint64_t, id, uint64_t, const __CFString *))(v2 + 16))(v2, v3, v4, CFSTR("string"));

  return v5;
}

void sub_10007AE8C(void *a1)
{
  id v1;
  _QWORD v2[4];
  id v3;

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10007AF04;
  v2[3] = &unk_1000E42D0;
  v3 = a1;
  v1 = v3;
  AnalyticsSendEventLazy(CFSTR("com.apple.managedconfiguration.profilepurgatory.enter"), v2);

}

id sub_10007AF04(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init((Class)NSMutableDictionary);
  +[MCProfileAnalyticsHelper addContainsPayloadInfoWithProfile:eventPayload:](MCProfileAnalyticsHelper, "addContainsPayloadInfoWithProfile:eventPayload:", *(_QWORD *)(a1 + 32), v2);
  return v2;
}

void sub_10007AF48(void *a1, int a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  int v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007AFC8;
  v4[3] = &unk_1000E42F8;
  v5 = a1;
  v6 = a2;
  v3 = v5;
  AnalyticsSendEventLazy(CFSTR("com.apple.managedconfiguration.profilepurgatory.exit"), v4);

}

id sub_10007AFC8(uint64_t a1)
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)NSMutableDictionary);
  +[MCProfileAnalyticsHelper addContainsPayloadInfoWithProfile:eventPayload:](MCProfileAnalyticsHelper, "addContainsPayloadInfoWithProfile:eventPayload:", *(_QWORD *)(a1 + 32), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40)));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("exitReason"));

  return v2;
}

void sub_10007B290(id a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[7];
  _QWORD v4[7];

  v3[0] = kMCEASAccountPayloadType;
  v3[1] = kMCEmailAccountPayloadType;
  v4[0] = CFSTR("profile_containsPayload_mailAccount");
  v4[1] = CFSTR("profile_containsPayload_mailAccount");
  v3[2] = kMCGmailAccountLegacyPayloadType;
  v3[3] = kMCGmailAccountPayloadType;
  v4[2] = CFSTR("profile_containsPayload_mailAccount");
  v4[3] = CFSTR("profile_containsPayload_mailAccount");
  v3[4] = kMCMDMPayloadType;
  v3[5] = kMCPasswordPolicyPayloadType;
  v4[4] = CFSTR("profile_containsPayload_mdm");
  v4[5] = CFSTR("profile_containsPayload_passwordPolicy");
  v3[6] = kMCRestrictionsPayloadType;
  v4[6] = CFSTR("profile_containsPayload_restrictions");
  v1 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 7));
  v2 = (void *)qword_1000FD9C8;
  qword_1000FD9C8 = v1;

}

void sub_10007C890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10007C8A8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10007C8B8(uint64_t a1)
{

}

id sub_10007C8C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  if (a2 == 2)
  {
    v9 = MCOTAProfilesErrorDomain;
    v10 = MCErrorArray(CFSTR("OTA_SERVER_RETURNED_FORBIDDEN_PROFILE_IN_SDP"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v6 = MCErrorTypeFatal;
    v7 = v9;
    v8 = 24007;
    goto LABEL_5;
  }
  if (a2 == 1)
  {
    v3 = MCOTAProfilesErrorDomain;
    v4 = MCErrorArray(CFSTR("OTA_SERVER_RETURNED_FORBIDDEN_PROFILE_IN_SDP"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = MCErrorTypeFatal;
    v7 = v3;
    v8 = 24005;
LABEL_5:
    v11 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v7, v8, v5, v6, 0));
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
  return objc_msgSend(*(id *)(a1 + 32), "complete");
}

void sub_10007CA58(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
  v2 = (void *)qword_1000FD9D8;
  qword_1000FD9D8 = v1;

}

void sub_10007CE70(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "accountStore"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007CF00;
  v4[3] = &unk_1000E4070;
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "removeAccount:withCompletionHandler:", v3, v4);

}

void sub_10007CF00(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    v5 = _MCLogObjects[0];
    if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v6 = 138543362;
      v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Couldn't remove the account: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }

}

void sub_100081124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100081160(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100081170(uint64_t a1)
{

}

void sub_100081178(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_installWithAccountDictionary:", *(_QWORD *)(a1 + 40)));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_1000816D4(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;

  v5 = a3;
  v6 = _MCLogObjects[0];
  v7 = os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_INFO);
  if (a2)
  {
    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 32);
      v13 = 138543362;
      v14 = v8;
      v9 = "Removed Google account %{public}@";
      v10 = v6;
      v11 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v13, v11);
    }
  }
  else if (v7)
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = 138543618;
    v14 = v12;
    v15 = 2114;
    v16 = v5;
    v9 = "Failed to remove Google account %{public}@ with error: %{public}@";
    v10 = v6;
    v11 = 22;
    goto LABEL_6;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t sub_100082284(uint64_t a1, uint64_t a2)
{
  uint64_t Name;
  void *v5;
  uint64_t UUID;
  void *v7;
  uint64_t ExpirationDate;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  int v15;
  void *v16;

  Name = MISProvisioningProfileGetName(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(Name);
  UUID = MISProvisioningProfileGetUUID(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(UUID);
  ExpirationDate = MISProvisioningProfileGetExpirationDate(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(ExpirationDate);
  v10 = v9;
  if (v9
    && (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "earlierDate:", *(_QWORD *)(a1 + 32))),
        v11,
        v11 == v10))
  {
    v13 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543362;
      v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Provisioning profile “%{public}@” has expired and will be removed.", (uint8_t *)&v15, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
  }
  else if (!MISProvisioningProfileIncludesDevice(a2, *(_QWORD *)(a1 + 48)))
  {
    v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543362;
      v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Provisioning profile “%{public}@” is not valid for this device and will be removed.", (uint8_t *)&v15, 0xCu);
    }
  }

  return 1;
}

void sub_1000826D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100082714(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100082724(uint64_t a1)
{

}

uint64_t sub_10008272C(uint64_t a1, uint64_t a2)
{
  uint64_t ExpirationDate;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  ExpirationDate = MISProvisioningProfileGetExpirationDate(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(ExpirationDate);
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (!*(_QWORD *)(v6 + 40))
    goto LABEL_5;
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "earlierDate:"));

    if (v7 == v5)
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
LABEL_5:
      objc_storeStrong((id *)(v6 + 40), v5);
    }
  }

  return 1;
}

id sub_100086578(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendPasscodeChangedNotification");
}

void sub_10008856C(id a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v5 = MCNewsBundleIdentifier;
  v1 = MCNewsServicesFrameworkPath(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v6 = v2;
  v3 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));
  v4 = (void *)qword_1000FD9E8;
  qword_1000FD9E8 = v3;

}

uint64_t sub_100089490()
{
  uint64_t result;
  uint64_t v1;

  result = lockdown_connect();
  if (result)
  {
    v1 = result;
    lockdown_set_value();
    return lockdown_disconnect(v1);
  }
  return result;
}

uint64_t sub_100089504()
{
  uint64_t result;
  uint64_t v1;

  result = lockdown_connect();
  if (result)
  {
    v1 = result;
    lockdown_set_value();
    return lockdown_disconnect(v1);
  }
  return result;
}

void sub_10008957C(id a1, BOOL a2, NSError *a3)
{
  NSError *v4;
  NSObject *v5;
  int v6;
  NSError *v7;

  v4 = a3;
  if (!a2)
  {
    v5 = _MCLogObjects[0];
    if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v6 = 138543362;
      v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Could not save account. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }

}

void sub_10008C51C(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("MCKeybagUnlockAssertion serialization queue", 0);
  v2 = (void *)qword_1000FD9F8;
  qword_1000FD9F8 = (uint64_t)v1;

}

void sub_10008C57C(id a1)
{
  NSObject *v1;
  const char *v2;
  uint8_t *v3;
  NSObject *v4;
  os_log_type_t v5;
  CFNumberRef v6;
  CFDictionaryRef v7;
  NSObject *v8;
  NSObject *v9;
  int valuePtr;
  CFTypeRef cf;
  uint8_t buf[4];
  CFTypeRef v13;
  void *values[2];
  void *keys[2];

  if (byte_1000FDA08 == 1)
  {
    v1 = _MCLogObjects[0];
    if (!os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      return;
    LOWORD(keys[0]) = 0;
    v2 = "Attempting to recursively hold keybag unlock assertion. Ignoring.";
    v3 = (uint8_t *)keys;
    v4 = v1;
    v5 = OS_LOG_TYPE_ERROR;
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, v4, v5, v2, v3, 2u);
    return;
  }
  cf = 0;
  valuePtr = 600;
  v6 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  *(_OWORD *)keys = *(_OWORD *)&off_1000E4490;
  values[0] = CFSTR("RemoteProfile");
  values[1] = v6;
  v7 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  qword_1000FDA10 = MKBDeviceLockAssertion(v7, &cf);
  CFRelease(v7);
  CFRelease(v6);
  if (qword_1000FDA10)
  {
    byte_1000FDA08 = 1;
    v8 = _MCLogObjects[0];
    if (!os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_INFO))
      return;
    *(_WORD *)buf = 0;
    v2 = "Holding keybag unlock assertion.";
    v3 = buf;
    v4 = v8;
    v5 = OS_LOG_TYPE_INFO;
    goto LABEL_7;
  }
  v9 = _MCLogObjects[0];
  if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v13 = cf;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Could not hold keybag lock assertion. Error: %{public}@", buf, 0xCu);
  }
  if (cf)
    CFRelease(cf);
}

void sub_10008C790(id a1)
{
  NSObject *v1;
  uint8_t v2[16];

  if (byte_1000FDA08 == 1)
  {
    v1 = _MCLogObjects[0];
    if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Releasing keybag unlock assertion.", v2, 2u);
    }
    CFRelease((CFTypeRef)qword_1000FDA10);
    qword_1000FDA10 = 0;
    byte_1000FDA08 = 0;
  }
}

uint64_t sub_10008CF38(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = *(id *)(a1 + 32);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUID", (_QWORD)v18));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUID"));
          v15 = objc_msgSend(v13, "isEqualToString:", v14);

          if ((v15 & 1) != 0)
          {
            v16 = 0;
            goto LABEL_12;
          }
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v9)
          continue;
        break;
      }
    }
    v16 = 1;
LABEL_12:

  }
  else
  {
    v16 = 1;
  }

  return v16;
}

void sub_10008EDEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a67;

  _Block_object_dispose(&a67, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10008EE0C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10008EE1C(uint64_t a1)
{

}

void sub_10008EE24(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_copyCertificateWithPayloadUUID:intoKeychainAccessGroup:personaID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id sub_10008FA44(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[9];
  _QWORD v14[9];

  v13[0] = CFSTR("isClearingPasscode");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 56)));
  v14[0] = v2;
  v13[1] = CFSTR("newPasscodeUnlockScreenType");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48)));
  v14[1] = v3;
  v13[2] = CFSTR("newPasscodeSimpleType");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52)));
  v14[2] = v4;
  v13[3] = CFSTR("oldPasscodeExists");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 57)));
  v14[3] = v5;
  v13[4] = CFSTR("passcodeChangeType");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *(_QWORD *)(a1 + 40)));
  v14[4] = v6;
  v13[5] = CFSTR("passcodeRecoveryRestricted");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 58)));
  v14[5] = v7;
  v13[6] = CFSTR("passcodeRecoverySupported");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 59)));
  v14[6] = v8;
  v13[7] = CFSTR("recoverySkipped");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 60)));
  v13[8] = CFSTR("senderBundleID");
  v10 = *(_QWORD *)(a1 + 32);
  v14[7] = v9;
  v14[8] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 9));

  return v11;
}

id sub_10008FC84(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  void *v5;

  v4 = CFSTR("clearReason");
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *(_QWORD *)(a1 + 32)));
  v5 = v1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v5, &v4, 1));

  return v2;
}

uint64_t sub_100090F44(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
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

  v3 = a2;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if ((v12 & 1) != 0)
        goto LABEL_18;
      if (v6 == (id)++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = *(id *)(a1 + 40);
  v13 = (uint64_t)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v22;
LABEL_11:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v14)
        objc_enumerationMutation(v4);
      v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier", (_QWORD)v21));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if ((v19 & 1) != 0)
        break;
      if (v13 == ++v15)
      {
        v13 = (uint64_t)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v13)
          goto LABEL_11;
        goto LABEL_19;
      }
    }
LABEL_18:
    v13 = 1;
  }
LABEL_19:

  return v13;
}

void sub_100091334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10009135C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10009136C(uint64_t a1)
{

}

void sub_100091374(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

intptr_t sub_100091B0C(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100091BEC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = _MCLogObjects[2];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to remove application with bundle ID: %{public}@, error: %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v6);

}

uint64_t sub_100091CD8(char a1, uint64_t a2, char a3, uint64_t a4, char a5, uint64_t a6)
{
  _QWORD v7[7];
  char v8;
  char v9;
  char v10;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100091D40;
  v7[3] = &unk_1000E45A8;
  v8 = a1;
  v9 = a3;
  v7[4] = a2;
  v7[5] = a4;
  v10 = a5;
  v7[6] = a6;
  return AnalyticsSendEventLazy(CFSTR("com.apple.webcontentfilter.listchanged"), v7);
}

id sub_100091D40(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];
  _QWORD v11[6];

  v10[0] = CFSTR("autoPermitList_changed");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 56)));
  v11[0] = v2;
  v10[1] = CFSTR("autoPermitList_count");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", *(_QWORD *)(a1 + 32)));
  v11[1] = v3;
  v10[2] = CFSTR("blacklist_changed");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 57)));
  v11[2] = v4;
  v10[3] = CFSTR("blacklist_count");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", *(_QWORD *)(a1 + 40)));
  v11[3] = v5;
  v10[4] = CFSTR("whitelist_changed");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 58)));
  v11[4] = v6;
  v10[5] = CFSTR("whitelist_count");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", *(_QWORD *)(a1 + 48)));
  v11[5] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 6));

  return v8;
}

uint64_t sub_100091EC0(char a1, char a2, char a3, char a4)
{
  _QWORD v5[4];
  char v6;
  char v7;
  char v8;
  char v9;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100091F24;
  v5[3] = &unk_1000E45C8;
  v6 = a1;
  v7 = a2;
  v8 = a3;
  v9 = a4;
  return AnalyticsSendEventLazy(CFSTR("com.apple.webcontentfilter.modechanged"), v5);
}

id sub_100091F24(unsigned __int8 *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[4];

  v8[0] = CFSTR("autoFilter_changed");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a1[32]));
  v9[0] = v2;
  v8[1] = CFSTR("autoFilter_enabled");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a1[33]));
  v9[1] = v3;
  v8[2] = CFSTR("whitelist_changed");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a1[34]));
  v9[2] = v4;
  v8[3] = CFSTR("whitelist_enabled");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a1[35]));
  v9[3] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 4));

  return v6;
}

uint64_t sub_10009204C()
{
  uint64_t v0;
  id v1;
  NSObject *v2;
  const char *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint32_t v6;
  id v8;
  uint8_t buf[4];
  id v10;

  v8 = 0;
  v0 = MAERecertifyDeviceWithError(&v8);
  v1 = v8;
  v2 = _MCLogObjects[0];
  if ((_DWORD)v0)
  {
    if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v3 = "Recertification succeeded.";
      v4 = v2;
      v5 = OS_LOG_TYPE_DEFAULT;
      v6 = 2;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v4, v5, v3, buf, v6);
    }
  }
  else if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v10 = v1;
    v3 = "Recertification failed: %{public}@";
    v4 = v2;
    v5 = OS_LOG_TYPE_ERROR;
    v6 = 12;
    goto LABEL_6;
  }

  return v0;
}

void sub_100094BA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a65;

  _Block_object_dispose(&a65, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100094C08(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100094C18(uint64_t a1)
{

}

void sub_100094C20(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  id v7;
  id v8;
  __int128 v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100094CD4;
  v6[3] = &unk_1000E4650;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v5 = *(_OWORD *)(a1 + 64);
  v4 = (id)v5;
  v9 = v5;
  objc_msgSend(v2, "insertAccountType:withCompletionHandler:", v3, v6);

}

void sub_100094CD4(uint64_t a1, int a2, void *a3)
{
  id v6;

  v6 = a3;
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "setAccountTypeGUID:", *(_QWORD *)(a1 + 40));
  else
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

void sub_100094D40(uint64_t a1)
{
  dispatch_queue_global_t global_queue;
  NSObject *v3;
  id v4;
  __int128 v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;
  __int128 v10;

  global_queue = dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100094E1C;
  block[3] = &unk_1000E46A0;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v5 = *(_OWORD *)(a1 + 56);
  v4 = (id)v5;
  v10 = v5;
  dispatch_async(v3, block);

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 56), 0xFFFFFFFFFFFFFFFFLL);
}

void sub_100094E1C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  id v7;
  id v8;
  __int128 v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100094ED0;
  v6[3] = &unk_1000E4650;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 40);
  v5 = *(_OWORD *)(a1 + 56);
  v4 = (id)v5;
  v9 = v5;
  objc_msgSend(v2, "saveVerifiedAccount:withCompletionHandler:", v3, v6);

}

void sub_100094ED0(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (a2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "identifier"));
    objc_msgSend(*(id *)(a1 + 32), "setAccountGUID:", v6);
  }
  else
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = v5;
    v6 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v8;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_100094F50(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100094FC4;
  v3[3] = &unk_1000E4070;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "removeAccount:withCompletionHandler:", v2, v3);

}

void sub_100094FC4(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  int v11;
  id v12;

  v5 = a3;
  v6 = _MCLogObjects[0];
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      v7 = "Rolled back Kerberos account.";
      v8 = v6;
      v9 = OS_LOG_TYPE_INFO;
      v10 = 2;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, (uint8_t *)&v11, v10);
    }
  }
  else if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v11 = 138543362;
    v12 = v5;
    v7 = "Warning: unable to remove Kerberos account while rolling back installation. Error: %{public}@";
    v8 = v6;
    v9 = OS_LOG_TYPE_ERROR;
    v10 = 12;
    goto LABEL_6;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_1000950BC(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100095130;
  v3[3] = &unk_1000E4070;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "removeAccountType:withCompletionHandler:", v2, v3);

}

void sub_100095130(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  int v11;
  id v12;

  v5 = a3;
  v6 = _MCLogObjects[0];
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      v7 = "Rolled back Kerberos account type.";
      v8 = v6;
      v9 = OS_LOG_TYPE_INFO;
      v10 = 2;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, (uint8_t *)&v11, v10);
    }
  }
  else if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v11 = 138543362;
    v12 = v5;
    v7 = "Warning: unable to remove Kerberos account type while rolling back installation. Error: %{public}@";
    v8 = v6;
    v9 = OS_LOG_TYPE_ERROR;
    v10 = 12;
    goto LABEL_6;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_1000957CC(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100095860;
  v4[3] = &unk_1000E3E90;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "removeAccount:withCompletionHandler:", v3, v4);

}

void sub_100095860(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;

  v5 = a3;
  v6 = _MCLogObjects[0];
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Remove SSO payload: account removal complete", (uint8_t *)&v10, 2u);
    }
  }
  else if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v7 = *(void **)(a1 + 32);
    v8 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "humanReadableName"));
    v10 = 138543618;
    v11 = v9;
    v12 = 2114;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Warning: Failed to remove Kerberos account for “%{public}@”. Ignoring. Error: %{public}@", (uint8_t *)&v10, 0x16u);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void sub_10009598C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100095A20;
  v4[3] = &unk_1000E3E90;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "removeAccountType:withCompletionHandler:", v3, v4);

}

void sub_100095A20(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;

  v5 = a3;
  v6 = _MCLogObjects[0];
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Remove SSO payload: account type removal complete", (uint8_t *)&v10, 2u);
    }
  }
  else if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v7 = *(void **)(a1 + 32);
    v8 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "humanReadableName"));
    v10 = 138543618;
    v11 = v9;
    v12 = 2114;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Warning: Failed to remove Kerberos account type for “%{public}@”. Ignoring. Error: %{public}@", (uint8_t *)&v10, 0x16u);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void sub_1000968B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000968D8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000968E8(uint64_t a1)
{

}

void sub_1000968F0(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_copyCertificateWithPayloadUUID:intoKeychainAccessGroup:personaID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void *acm_mem_alloc_data(size_t size)
{
  void *result;

  result = malloc_type_calloc(1uLL, size, 0xCB62F0E9uLL);
  if (result)
    qword_1000FDA28 += size;
  return result;
}

void acm_mem_free_data(void *a1, rsize_t __n)
{
  uint64_t v4;

  if (a1)
  {
    memset_s(a1, __n, 0, __n);
    free(a1);
    v4 = qword_1000FDA28 - __n;
    if (qword_1000FDA28 < __n)
      v4 = 0;
    qword_1000FDA28 = v4;
  }
}

void *acm_mem_alloc(size_t size)
{
  void *result;

  result = malloc_type_calloc(1uLL, size, 0xDB9956F0uLL);
  if (result)
    qword_1000FDA30 += size;
  return result;
}

void acm_mem_free(void *a1, rsize_t __n)
{
  uint64_t v4;

  if (a1)
  {
    memset_s(a1, __n, 0, __n);
    free(a1);
    v4 = qword_1000FDA30 - __n;
    if (qword_1000FDA30 < __n)
      v4 = 0;
    qword_1000FDA30 = v4;
  }
}

const char *acm_mem_alloc_info(const char *result, const void *a2, uint64_t a3, const char *a4, int a5, const char *a6)
{
  const char *v6;
  const char *v7;
  const char *v8;

  if (a2)
    qword_1000FDA20 += a3;
  if (gACMLoggingLevel <= 0x1Eu)
  {
    v6 = "NULL";
    if (result)
      v7 = result;
    else
      v7 = "NULL";
    if (a4)
      v8 = a4;
    else
      v8 = "NULL";
    if (a6)
      v6 = a6;
    return (const char *)printf("%s: %s: mem: type=%s ptr=%p size=%u (total=%u raw=%u data=%u types=%u) %s:%d (%s).\n", "ACM", "acm_mem_alloc_info", v7, a2, a3, qword_1000FDA20, 0, qword_1000FDA28, qword_1000FDA30, v8, a5, v6);
  }
  return result;
}

const char *acm_mem_free_info(const char *result, const void *a2, unint64_t a3, const char *a4, int a5, const char *a6)
{
  uint64_t v6;
  const char *v7;
  const char *v8;
  const char *v9;

  if (a2)
  {
    v6 = qword_1000FDA20 - a3;
    if (qword_1000FDA20 < a3)
      v6 = 0;
    qword_1000FDA20 = v6;
  }
  if (gACMLoggingLevel <= 0x1Eu)
  {
    v7 = "NULL";
    if (result)
      v8 = result;
    else
      v8 = "NULL";
    if (a4)
      v9 = a4;
    else
      v9 = "NULL";
    if (a6)
      v7 = a6;
    return (const char *)printf("%s: %s: mem: type=%s ptr=%p size=%u (total=%u raw=%u data=%u types=%u) %s:%d (%s).\n", "ACM", "acm_mem_free_info", v8, a2, a3, qword_1000FDA20, 0, qword_1000FDA28, qword_1000FDA30, v9, a5, v7);
  }
  return result;
}

uint64_t ACMContextCreate(uint64_t *a1)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;

  if (byte_1000FD7C9 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "ACMContextCreate";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v6 = 0;
  v2 = LibCall_ACMContextCreate((uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _BYTE *, uint64_t *))sub_1000986D4, (uint64_t)&v6, a1, &byte_1000FD7C9, 1);
  if ((_DWORD)v2)
  {
    sub_1000991E8();
    v3 = 70;
  }
  else
  {
    v3 = 10;
    if (a1 && byte_1000FD7C9 <= 0x28u)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        v4 = *a1;
        if (*a1)
          LODWORD(v4) = *(_DWORD *)(v4 + 16);
        *(_DWORD *)buf = 136315650;
        v8 = "ACMLib";
        v9 = 2080;
        v10 = "ACMContextCreate";
        v11 = 1024;
        LODWORD(v12) = v4;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: CS[%u] created.\n", buf, 0x1Cu);
      }
      v3 = 10;
    }
  }
  if (v3 >= byte_1000FD7C9 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "ACMContextCreate";
    v11 = 2048;
    v12 = (int)v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v2;
}

uint64_t sub_1000986D4(uint64_t *a1, int a2, char a3, const void *a4, size_t a5, void *a6, size_t *a7)
{
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;

  if (byte_1000FD7C9 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v18 = 136315394;
    v19 = "ACMLib";
    v20 = 2080;
    v21 = "ioKitTransport";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v18, 0x16u);
  }
  if (a1)
  {
    v14 = sub_100098C88();
    v15 = 70;
    if ((_DWORD)v14)
    {
      v16 = v14;
    }
    else
    {
      v16 = sub_100098E68(*a1, a2, a3, a4, a5, a6, a7);
      if ((_DWORD)v16)
        v15 = 70;
      else
        v15 = 10;
    }
  }
  else
  {
    v15 = 70;
    v16 = 4294967293;
  }
  if (v15 >= byte_1000FD7C9 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v18 = 136315650;
    v19 = "ACMLib";
    v20 = 2080;
    v21 = "ioKitTransport";
    v22 = 2048;
    v23 = (int)v16;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v18, 0x20u);
  }
  return v16;
}

uint64_t ACMContextDelete(_DWORD *a1, int a2)
{
  unsigned int v4;
  int v5;
  const char *v6;
  uint64_t v7;
  unsigned int v8;
  _DWORD *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  _QWORD v16[2];

  v4 = byte_1000FD7C9;
  if (byte_1000FD7C9 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextDelete";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
    v4 = byte_1000FD7C9;
  }
  if (a1 && v4 <= 0x28 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v5 = a1[4];
    v6 = "deleted";
    *(_DWORD *)buf = 136315906;
    v12 = "ACMLib";
    v14 = "ACMContextDelete";
    v13 = 2080;
    if (a2)
      v6 = "destroyed";
    v15 = 1024;
    LODWORD(v16[0]) = v5;
    WORD2(v16[0]) = 2080;
    *(_QWORD *)((char *)v16 + 6) = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: CS[%u] %s.\n", buf, 0x26u);
  }
  v10 = a1;
  v7 = LibCall_ACMContextDelete((void (*)(uint64_t, uint64_t, _QWORD, void *, uint64_t, _QWORD, _QWORD))sub_1000986D4, (uint64_t)&v10, a1, a2);
  if ((_DWORD)v7)
    v8 = 70;
  else
    v8 = 10;
  if (v8 >= byte_1000FD7C9 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextDelete";
    v15 = 2048;
    v16[0] = (int)v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v7;
}

void ACMContextGetExternalForm(const void *a1, uint64_t a2)
{
  int v4;
  const char *v5;
  __int16 v6;
  const char *v7;

  if (byte_1000FD7C9 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "ACMLib";
    v6 = 2080;
    v7 = "ACMContextGetExternalForm";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v4, 0x16u);
  }
  if (!a1
    || !a2
    || sub_100098C88()
    || sub_100098E68((uint64_t)a1, 19, 0, a1, 0x10uLL, 0, 0))
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, 0, 0);
  }
  else
  {
    (*(void (**)(uint64_t, const void *, uint64_t))(a2 + 16))(a2, a1, 16);
  }
  if (byte_1000FD7C9 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "ACMLib";
    v6 = 2080;
    v7 = "ACMContextGetExternalForm";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning.\n", (uint8_t *)&v4, 0x16u);
  }
}

uint64_t sub_100098C88()
{
  uint64_t v0;
  const __CFDictionary *v1;
  io_service_t MatchingService;
  io_object_t v3;
  unsigned int v4;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;

  if (byte_1000FD7C9 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "ACMLib";
    v8 = 2080;
    v9 = "init";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v6, 0x16u);
  }
  if ((byte_1000FDA3C & 1) != 0)
  {
    v0 = 0;
  }
  else
  {
    v1 = IOServiceMatching("AppleCredentialManager");
    MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v1);
    if (!MatchingService)
    {
      v4 = 70;
      v0 = 4294967291;
      goto LABEL_10;
    }
    v3 = MatchingService;
    v0 = IOServiceOpen(MatchingService, mach_task_self_, 0, (io_connect_t *)&dword_1000FDA38);
    if ((_DWORD)v0)
    {
      v4 = 70;
      goto LABEL_10;
    }
    IOObjectRelease(v3);
    byte_1000FDA3C = 1;
  }
  v4 = 10;
LABEL_10:
  if (v4 >= byte_1000FD7C9 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v6 = 136315650;
    v7 = "ACMLib";
    v8 = 2080;
    v9 = "init";
    v10 = 2048;
    v11 = (int)v0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v6, 0x20u);
  }
  return v0;
}

uint64_t sub_100098E68(uint64_t a1, int a2, char a3, const void *a4, size_t a5, void *a6, size_t *a7)
{
  _BYTE *v14;
  void *v15;
  size_t v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  unsigned int v20;
  size_t v22;
  size_t inputStructCnt;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  _BYTE v29[10];
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;

  if (byte_1000FD7C9 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "ACMLib";
    v26 = 2080;
    v27 = "performCommand";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  inputStructCnt = 0;
  v14 = LibCall_BuildCommand(a2, 0, a3, a4, a5, &inputStructCnt);
  if (v14)
  {
    v15 = v14;
    if (!a6 && a7)
    {
      v18 = 4294967293;
    }
    else
    {
      if (a7)
        v16 = *a7;
      else
        v16 = 0;
      v22 = v16;
      v17 = IOConnectCallStructMethod(dword_1000FDA38, 0, v14, inputStructCnt, a6, &v22);
      v18 = v17;
      if (a1)
        LODWORD(a1) = *(_DWORD *)(a1 + 16);
      if ((_DWORD)v17)
      {
        if (byte_1000FD7C9 <= 0x46u
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136316418;
          v25 = "ACMLib";
          v26 = 2080;
          v27 = "performCommand";
          v28 = 1024;
          *(_DWORD *)v29 = a2;
          *(_WORD *)&v29[4] = 1024;
          *(_DWORD *)&v29[6] = a1;
          v30 = 1024;
          v31 = v18;
          v32 = 1024;
          v33 = v18;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: cmd(%u) on CS[%u] -> err 0x%x (%d).\n", buf, 0x2Eu);
        }
      }
      else
      {
        if (byte_1000FD7C9 <= 0x28u
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315906;
          v25 = "ACMLib";
          v26 = 2080;
          v27 = "performCommand";
          v28 = 1024;
          *(_DWORD *)v29 = a2;
          *(_WORD *)&v29[4] = 1024;
          *(_DWORD *)&v29[6] = a1;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: cmd(%u) on CS[%u] -> ok.\n", buf, 0x22u);
        }
        v18 = 0;
        if (a7)
          *a7 = v22;
      }
    }
    v19 = inputStructCnt;
    acm_mem_free_info("<data>", v15, inputStructCnt, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 134, "performCommand");
    acm_mem_free_data(v15, v19);
    if ((_DWORD)v18)
      v20 = 70;
    else
      v20 = 10;
  }
  else
  {
    v20 = 70;
    v18 = 4294967291;
  }
  if (v20 >= byte_1000FD7C9 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v25 = "ACMLib";
    v26 = 2080;
    v27 = "performCommand";
    v28 = 2048;
    *(_QWORD *)v29 = (int)v18;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v18;
}

void sub_1000991E8()
{
  unsigned __int8 v0;
  unsigned int v1;
  uint32_t outputCnt;
  uint64_t output;
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;

  if (byte_1000FD7C9 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v5 = "ACMLib";
    v6 = 2080;
    v7 = "updateLogLevelFromKext";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  output = 0;
  outputCnt = 1;
  if (IOConnectCallScalarMethod(dword_1000FDA38, 2u, 0, 0, &output, &outputCnt))
    goto LABEL_8;
  v0 = output;
  v1 = output;
  byte_1000FD7C9 = output;
  if (output <= 0x1EuLL && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v5 = "ACMLib";
    v6 = 2080;
    v7 = "updateLogLevelFromKext";
    v8 = 1024;
    v9 = v0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: log level set to %d.\n", buf, 0x1Cu);
LABEL_8:
    v1 = byte_1000FD7C9;
  }
  if (v1 <= 0xA && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v5 = "ACMLib";
    v6 = 2080;
    v7 = "updateLogLevelFromKext";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

_BYTE *LibCall_BuildCommand(char a1, char a2, char a3, const void *a4, size_t a5, _QWORD *a6)
{
  _BYTE *v12;
  BOOL v13;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_BuildCommand");
  v12 = 0;
  if (a5)
    v13 = a4 == 0;
  else
    v13 = 0;
  if (!v13 && a6)
  {
    if (a5 >= 0xFFFFFFFFFFFFFFF8)
    {
      v12 = 0;
    }
    else
    {
      v12 = acm_mem_alloc_data(a5 + 8);
      acm_mem_alloc_info("<data>", v12, a5 + 8, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 22, "LibCall_BuildCommand");
      if (v12)
      {
        *a6 = a5 + 8;
        *(_DWORD *)v12 = 1396920900;
        v12[4] = a1;
        v12[5] = a2;
        v12[6] = a3;
        if (a5)
          memcpy(v12 + 8, a4, a5);
      }
    }
  }
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: returning.\n", "ACM", "LibCall_BuildCommand");
  return v12;
}

uint64_t LibCall_ACMContextCreate(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _BYTE *, uint64_t *), uint64_t a2, _QWORD *a3, _BYTE *a4, int a5)
{
  unsigned int v10;
  uint64_t v11;
  _DWORD *v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  uint64_t v18;
  _BYTE v19[21];

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextCreate");
  v10 = 70;
  v11 = 4294967293;
  if (!a1 || !a3)
    goto LABEL_25;
  v12 = acm_mem_alloc(0x14uLL);
  acm_mem_alloc_info("ACMHandleWithPayload", v12, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 50, "LibCall_ACMContextCreate");
  if (!v12)
  {
    v10 = 70;
    v11 = 4294967292;
    goto LABEL_25;
  }
  memset(v19, 0, sizeof(v19));
  if (a5)
  {
    v18 = 21;
    v13 = a1(a2, 36, 0, 0, 0, v19, &v18);
    if (!(_DWORD)v13)
    {
      if (v18 != 21)
      {
        v11 = 4294967291;
        goto LABEL_23;
      }
      v11 = 0;
      goto LABEL_20;
    }
    v11 = v13;
    if ((_DWORD)v13 != -3)
    {
LABEL_23:
      acm_mem_free_info("ACMHandleWithPayload", v12, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 89, "LibCall_ACMContextCreate");
      acm_mem_free(v12, 0x14uLL);
      v10 = 70;
      goto LABEL_25;
    }
  }
  v18 = 17;
  v14 = a1(a2, 1, 0, 0, 0, v19, &v18);
  if (v18 == 17)
    v15 = 0;
  else
    v15 = -5;
  if (v14)
    v11 = v14;
  else
    v11 = v15;
  if (!v14 && v18 == 17)
  {
LABEL_20:
    v16 = *(_DWORD *)&v19[17];
    *(_OWORD *)v12 = *(_OWORD *)v19;
    v12[4] = v16;
    *a3 = v12;
    if (a4)
      *a4 = v19[16];
  }
  if ((_DWORD)v11)
    goto LABEL_23;
  v10 = 10;
LABEL_25:
  if (v10 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextCreate", (int)v11);
  return v11;
}

uint64_t LibCall_ACMContextDelete(void (*a1)(uint64_t, uint64_t, _QWORD, void *, uint64_t, _QWORD, _QWORD), uint64_t a2, void *a3, int a4)
{
  uint64_t v8;
  unsigned int v9;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextDelete");
  if (a1 && a3)
  {
    if (a4)
      a1(a2, 2, 0, a3, 16, 0, 0);
    goto LABEL_7;
  }
  if (a3)
  {
LABEL_7:
    acm_mem_free_info("ACMHandleWithPayload", a3, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 172, "LibCall_ACMContextDelete");
    acm_mem_free(a3, 0x14uLL);
    v8 = 0;
    v9 = 10;
    goto LABEL_8;
  }
  v9 = 70;
  v8 = 4294967293;
LABEL_8:
  if (v9 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextDelete", (int)v8);
  return v8;
}

uint64_t sub_100099884()
{
  uint64_t result;

  if (qword_1000FDA48 != -1)
    dispatch_once(&qword_1000FDA48, &stru_1000E4720);
  dispatch_sync((dispatch_queue_t)qword_1000FDA50, &stru_1000E46E0);
  result = dword_1000FDA40;
  if (!dword_1000FDA40)
  {
    syslog(3, "failed to open connection to %s\n", "AppleKeyStore");
    return dword_1000FDA40;
  }
  return result;
}

void sub_10009990C(id a1)
{
  if (!dword_1000FDA40)
    dword_1000FDA40 = sub_100099970("IOService:/IOResources/AppleKeyStore", "AppleKeyStore");
}

void sub_100099948(id a1)
{
  qword_1000FDA50 = (uint64_t)dispatch_queue_create("aks-client-queue", 0);
}

uint64_t sub_100099970(char *path, const char *a2)
{
  io_service_t v3;
  io_object_t v4;
  kern_return_t v5;
  const __CFDictionary *v6;
  io_service_t MatchingService;
  io_object_t v8;
  uint64_t result;
  kern_return_t v10;
  io_connect_t connect;

  connect = 0;
  v3 = IORegistryEntryFromPath(kIOMasterPortDefault, path);
  if (!v3 || (v4 = v3, v5 = IOServiceOpen(v3, mach_task_self_, 0, &connect), IOObjectRelease(v4), v5))
  {
    v6 = IOServiceMatching(a2);
    MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v6);
    if (MatchingService)
    {
      v8 = MatchingService;
      IOServiceOpen(MatchingService, mach_task_self_, 0, &connect);
      IOObjectRelease(v8);
    }
  }
  result = connect;
  if (connect)
  {
    v10 = IOConnectCallMethod(connect, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    result = connect;
    if (v10)
    {
      IOServiceClose(connect);
      return 0;
    }
  }
  return result;
}

uint64_t sub_100099A64(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  uint64_t v9;
  mach_port_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  mach_port_t v16;
  const char *v17;
  void *v18;
  int v20;
  void *v21;
  uint64_t input[4];

  v9 = 3758097084;
  v21 = 0;
  v20 = 0;
  v10 = sub_100099884();
  if (v10)
  {
    v16 = v10;
    if (a2)
      v17 = a2;
    else
      v17 = "";
    sub_100099C78((char **)&v21, (unsigned int *)&v20, 2, v11, v12, v13, v14, v15, (uint64_t)v17);
    if (v21)
    {
      input[0] = a1;
      input[1] = a6;
      input[2] = (uint64_t)v21;
      input[3] = v20;
      v9 = IOConnectCallMethod(v16, 0x2Au, input, 4u, 0, 0, 0, 0, 0, 0);
      v18 = v21;
    }
    else
    {
      v18 = 0;
      v9 = 3758097085;
    }
  }
  else
  {
    fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_aks_verify_password", ":", 1807, "", 0, "", "");
    v18 = 0;
  }
  free(v18);
  return v9;
}

uint64_t sub_100099BEC(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_100099A64(a1, a2, a3, a4, a5, 0);
}

char *sub_100099BF4(_DWORD *a1, const void *a2, int a3)
{
  char *v3;
  int v5;
  size_t v6;
  int __s;

  v3 = (char *)(a1 + 1);
  if (a2)
  {
    *a1 = a3;
    memcpy(a1 + 1, a2, a3);
    v3 += a3;
    v5 = -a3;
    v6 = -a3 & 3;
    if ((v5 & 3) != 0)
    {
      __s = 0;
      memset_s(&__s, 4uLL, 0, 4uLL);
      memcpy(v3, &__s, v6);
      v3 += v6;
    }
  }
  else
  {
    *a1 = 0;
  }
  return v3;
}

char *sub_100099C78(char **a1, unsigned int *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unsigned int v12;
  int v13;
  uint64_t *v14;
  char *result;
  char *v16;
  int v17;
  uint64_t v18;
  const void **v19;
  const void *v20;
  uint64_t *v21;
  const void **v22;

  v21 = &a9;
  v12 = 4;
  if (a3)
  {
    v13 = a3;
    do
    {
      v14 = v21;
      v21 += 2;
      v12 += *((_DWORD *)v14 + 2) + (-*((_DWORD *)v14 + 2) & 3) + 4;
      --v13;
    }
    while (v13);
  }
  result = (char *)calloc(1uLL, v12);
  v16 = result;
  v22 = (const void **)&a9;
  v17 = 0;
  if (a3)
  {
    v18 = 4;
    do
    {
      v19 = v22;
      v20 = *v22;
      v22 += 2;
      result = sub_100099BF4(&v16[v18], v20, *((_DWORD *)v19 + 2));
      v18 = result - v16;
      ++v17;
    }
    while (a3 != v17);
  }
  *(_DWORD *)v16 = v17;
  *a1 = v16;
  *a2 = v12;
  return result;
}

void sub_100099D54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_100099DD4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_100099E54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_100099ED4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_100099F54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_100099FD4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_10009A054()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_10009A0D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_10009A154()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_10009A1D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_10009A254()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_10009A2D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_10009A354()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_10009A3D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_10009A454()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_10009A4D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_10009A554()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_10009A5D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_10009A654()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_10009A6D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_10009A754()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_10009A7D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_10009A854()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_10009A8D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_10009A954()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_10009A9D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_10009AA54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_10009AAD4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_10009AB54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_10009ABD4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_10009AC54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_10009ACD4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_10009AD54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_10009ADD4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_10009AE54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_10009AED4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_10009AF54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_10009AFD4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_10009B054()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_10009B0D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014A6C();
  sub_100014A58();
  sub_100014A48((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_100014A7C();
}

void sub_10009B154(void *a1)
{
  id v1;
  NSObject *v2;
  int v3;
  id v4;

  v1 = objc_begin_catch(a1);
  v2 = _MCLogObjects[0];
  if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v3 = 138543362;
    v4 = v1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Caught exception %{public}@ while attempting to remove an account.", (uint8_t *)&v3, 0xCu);
  }

  objc_end_catch();
}

void sub_10009B20C(void *a1)
{
  id v1;
  NSObject *v2;
  int v3;
  id v4;

  v1 = objc_begin_catch(a1);
  v2 = _MCLogObjects[0];
  if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v3 = 138543362;
    v4 = v1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Caught exception %{public}@ while attempting to remove an account.", (uint8_t *)&v3, 0xCu);
  }

  objc_end_catch();
}

void sub_10009B2C4(void *a1)
{
  id v1;
  NSObject *v2;
  int v3;
  id v4;

  v1 = objc_begin_catch(a1);
  v2 = _MCLogObjects[0];
  if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v3 = 138543362;
    v4 = v1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Caught exception %{public}@ while attempting to remove an account.", (uint8_t *)&v3, 0xCu);
  }

  objc_end_catch();
}

void sub_10009B37C(void *a1)
{
  id v1;
  NSObject *v2;
  int v3;
  id v4;

  v1 = objc_begin_catch(a1);
  v2 = _MCLogObjects[0];
  if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v3 = 138543362;
    v4 = v1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Caught exception %{public}@ while attempting to remove an account.", (uint8_t *)&v3, 0xCu);
  }

  objc_end_catch();
}

void sub_10009B434(void *a1)
{
  id v1;
  NSObject *v2;
  int v3;
  id v4;

  v1 = objc_begin_catch(a1);
  v2 = _MCLogObjects[0];
  if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v3 = 138543362;
    v4 = v1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Caught exception %{public}@ while attempting to remove an account.", (uint8_t *)&v3, 0xCu);
  }

  objc_end_catch();
}

id objc_msgSend_APNs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "APNs");
}

id objc_msgSend_CACaps(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CACaps");
}

id objc_msgSend_CAFingerprint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CAFingerprint");
}

id objc_msgSend_CAInstanceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CAInstanceName");
}

id objc_msgSend_DAAccountDoNotSaveReason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "DAAccountDoNotSaveReason");
}

id objc_msgSend_DAAccountIdentifiersToIgnoreForUniquenessCheck(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "DAAccountIdentifiersToIgnoreForUniquenessCheck");
}

id objc_msgSend_DMCErrorWithDomain_code_descriptionArray_errorType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "DMCErrorWithDomain:code:descriptionArray:errorType:");
}

id objc_msgSend_DMCSafePropertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "DMCSafePropertyListWithData:options:format:error:");
}

id objc_msgSend_DMCWriteToBinaryFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "DMCWriteToBinaryFile:");
}

id objc_msgSend_HESSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "HESSID");
}

id objc_msgSend_MAIDUsername(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MAIDUsername");
}

id objc_msgSend_MCACAccountIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCACAccountIdentifier");
}

id objc_msgSend_MCACAccountIdentifierWithIncomingAccountInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCACAccountIdentifierWithIncomingAccountInfo:");
}

id objc_msgSend_MCACAccountIdentifierWithOutgoingAccountInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCACAccountIdentifierWithOutgoingAccountInfo:");
}

id objc_msgSend_MCAppendGreenteaSuffix(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCAppendGreenteaSuffix");
}

id objc_msgSend_MCCAndMNCs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCCAndMNCs");
}

id objc_msgSend_MCContainsErrorDomain_code_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCContainsErrorDomain:code:");
}

id objc_msgSend_MCCopyAsPrimaryError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCCopyAsPrimaryError");
}

id objc_msgSend_MCDataFromFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCDataFromFile:");
}

id objc_msgSend_MCDataWithHexString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCDataWithHexString:");
}

id objc_msgSend_MCDeepCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCDeepCopy");
}

id objc_msgSend_MCDeepCopyEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCDeepCopyEntriesFromDictionary:");
}

id objc_msgSend_MCDeepCopyMissingEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCDeepCopyMissingEntriesFromDictionary:");
}

id objc_msgSend_MCDictionaryAdditiveDeltaToCreateDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCDictionaryAdditiveDeltaToCreateDictionary:");
}

id objc_msgSend_MCDictionaryFromFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCDictionaryFromFile:");
}

id objc_msgSend_MCDictionarySubtractiveDeltaToCreateDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCDictionarySubtractiveDeltaToCreateDictionary:");
}

id objc_msgSend_MCDictionaryWithLeafValuesSetToValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCDictionaryWithLeafValuesSetToValue:");
}

id objc_msgSend_MCErrorType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCErrorType");
}

id objc_msgSend_MCErrorWithDomain_code_descriptionArray_errorType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCErrorWithDomain:code:descriptionArray:errorType:");
}

id objc_msgSend_MCErrorWithDomain_code_descriptionArray_suggestion_USEnglishSuggestion_underlyingError_errorType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCErrorWithDomain:code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:");
}

id objc_msgSend_MCErrorWithDomain_code_descriptionArray_suggestion_USEnglishSuggestion_underlyingError_errorType_extraUserInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCErrorWithDomain:code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:extraUserInfo:");
}

id objc_msgSend_MCErrorWithDomain_code_descriptionArray_underlyingError_errorType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:");
}

id objc_msgSend_MCHashedFilenameWithExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCHashedFilenameWithExtension:");
}

id objc_msgSend_MCHashedIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCHashedIdentifier");
}

id objc_msgSend_MCHexString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCHexString");
}

id objc_msgSend_MCInsertedKeysFromDictionary_withNewLeafValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCInsertedKeysFromDictionary:withNewLeafValue:");
}

id objc_msgSend_MCMakeUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCMakeUUID");
}

id objc_msgSend_MCMutableDeepCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCMutableDeepCopy");
}

id objc_msgSend_MCMutableDeepCopyWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCMutableDeepCopyWithZone:");
}

id objc_msgSend_MCOldStyleSafeFilenameHash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCOldStyleSafeFilenameHash");
}

id objc_msgSend_MCOldStyleSafeFilenameHashWithExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCOldStyleSafeFilenameHashWithExtension:");
}

id objc_msgSend_MCRemovedKeysFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCRemovedKeysFromDictionary:");
}

id objc_msgSend_MCSafePropertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCSafePropertyListWithData:options:format:error:");
}

id objc_msgSend_MCSetObjectIfNotNil_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCSetObjectIfNotNil:forKey:");
}

id objc_msgSend_MCSetUnionRestriction_values_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCSetUnionRestriction:values:");
}

id objc_msgSend_MCShortenedArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCShortenedArray:");
}

id objc_msgSend_MCShortenedData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCShortenedData:");
}

id objc_msgSend_MCShortenedDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCShortenedDictionary:");
}

id objc_msgSend_MCShortenedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCShortenedObject:");
}

id objc_msgSend_MCValidateBoolRestriction_inRestrictions_defaultRestrictions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCValidateBoolRestriction:inRestrictions:defaultRestrictions:");
}

id objc_msgSend_MCValidateIntersectionRestriction_inRestrictions_defaultRestrictions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCValidateIntersectionRestriction:inRestrictions:defaultRestrictions:");
}

id objc_msgSend_MCValidateUnionRestriction_inRestrictions_defaultRestrictions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCValidateUnionRestriction:inRestrictions:defaultRestrictions:");
}

id objc_msgSend_MCValidateValueRestriction_inRestrictions_defaultRestrictions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCValidateValueRestriction:inRestrictions:defaultRestrictions:");
}

id objc_msgSend_MCVerboseDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCVerboseDescription");
}

id objc_msgSend_MCWriteToBinaryFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCWriteToBinaryFile:");
}

id objc_msgSend_NAIRealmNames(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "NAIRealmNames");
}

id objc_msgSend_NEVPNPayloadBaseDelegateWithConfigurationDict_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "NEVPNPayloadBaseDelegateWithConfigurationDict:");
}

id objc_msgSend_OAuthSignInURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "OAuthSignInURL");
}

id objc_msgSend_OAuthTokenRequestURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "OAuthTokenRequestURL");
}

id objc_msgSend_OTAProfile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "OTAProfile");
}

id objc_msgSend_PPTPDeprecatedError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "PPTPDeprecatedError");
}

id objc_msgSend_SIMRules(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SIMRules");
}

id objc_msgSend_SMBDomains(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SMBDomains");
}

id objc_msgSend_SMIMEEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SMIMEEnabled");
}

id objc_msgSend_SMIMEEncryptByDefaultUserOverrideable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SMIMEEncryptByDefaultUserOverrideable");
}

id objc_msgSend_SMIMEEncryptionEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SMIMEEncryptionEnabled");
}

id objc_msgSend_SMIMEEncryptionIdentityPersistentID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SMIMEEncryptionIdentityPersistentID");
}

id objc_msgSend_SMIMEEncryptionIdentityUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SMIMEEncryptionIdentityUUID");
}

id objc_msgSend_SMIMEEncryptionIdentityUserOverrideable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SMIMEEncryptionIdentityUserOverrideable");
}

id objc_msgSend_SMIMEPerMessageSwitchEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SMIMEPerMessageSwitchEnabled");
}

id objc_msgSend_SMIMESigningEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SMIMESigningEnabled");
}

id objc_msgSend_SMIMESigningIdentityPersistentID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SMIMESigningIdentityPersistentID");
}

id objc_msgSend_SMIMESigningIdentityUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SMIMESigningIdentityUUID");
}

id objc_msgSend_SMIMESigningIdentityUserOverrideable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SMIMESigningIdentityUserOverrideable");
}

id objc_msgSend_SMIMESigningUserOverrideable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SMIMESigningUserOverrideable");
}

id objc_msgSend_SafariDomains(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SafariDomains");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_URLPrefixMatches(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLPrefixMatches");
}

id objc_msgSend_URLString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLString");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend_VPNUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "VPNUUID");
}

id objc_msgSend__SCEPOperationURLWithBaseURLString_operation_message_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_SCEPOperationURLWithBaseURLString:operation:message:");
}

id objc_msgSend__WiFiAssistConfigurationForPayloads_includingPayloads_excludingPayloads_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_WiFiAssistConfigurationForPayloads:includingPayloads:excludingPayloads:error:");
}

id objc_msgSend__accountFromPayload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accountFromPayload");
}

id objc_msgSend__accountFromPayloadWithUserInputResponses_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accountFromPayloadWithUserInputResponses:");
}

id objc_msgSend__accountFromPayloadWithUserInputResponses_identityPersistentID_SMIMESigningIdentityPersistentID_SMIMEEncryptionIdentityPersistentID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accountFromPayloadWithUserInputResponses:identityPersistentID:SMIMESigningIdentityPersistentID:SMIMEEncryptionIdentityPersistentID:");
}

id objc_msgSend__activationRecordIndicatesCloudConfigurationIsAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_activationRecordIndicatesCloudConfigurationIsAvailable");
}

id objc_msgSend__addDependency(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addDependency");
}

id objc_msgSend__addWebClip_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addWebClip:");
}

id objc_msgSend__allFalseSettingsKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_allFalseSettingsKeys");
}

id objc_msgSend__allPayloadCountKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_allPayloadCountKeys");
}

id objc_msgSend__allTrueSettingsKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_allTrueSettingsKeys");
}

id objc_msgSend__allowsPasswordPoliciesFromProfile_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_allowsPasswordPoliciesFromProfile:outError:");
}

id objc_msgSend__anyBoolRestrictionChangedInSet_oldRestrictions_newRestrictions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_anyBoolRestrictionChangedInSet:oldRestrictions:newRestrictions:");
}

id objc_msgSend__applyAccountTagsToProfile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applyAccountTagsToProfile:");
}

id objc_msgSend__applyDefaultSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applyDefaultSettings");
}

id objc_msgSend__applyHeuristicsToEffectiveUserSettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applyHeuristicsToEffectiveUserSettings:");
}

id objc_msgSend__applyHeuristicsToRestrictions_forProfile_ignoresUnrestrictableApps_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applyHeuristicsToRestrictions:forProfile:ignoresUnrestrictableApps:");
}

id objc_msgSend__applyImpliedSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applyImpliedSettings");
}

id objc_msgSend__applyImpliedSettingsToSettingsDictionary_currentSettings_restrictions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applyImpliedSettingsToSettingsDictionary:currentSettings:restrictions:");
}

id objc_msgSend__applyInternalDiagnosticEnforcementToSettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applyInternalDiagnosticEnforcementToSettings:");
}

id objc_msgSend__applyMandatorySettingsToEffectiveUserSettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applyMandatorySettingsToEffectiveUserSettings:");
}

id objc_msgSend__applyProxyCredential_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applyProxyCredential:");
}

id objc_msgSend__applyServerSideChangesWithOldRestrictions_newRestrictions_oldEffectiveUserSettings_newEffectiveUserSettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applyServerSideChangesWithOldRestrictions:newRestrictions:oldEffectiveUserSettings:newEffectiveUserSettings:");
}

id objc_msgSend__assumeOwnershipProfileHandler_options_source_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_assumeOwnershipProfileHandler:options:source:outError:");
}

id objc_msgSend__atsContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_atsContext");
}

id objc_msgSend__attributesForSystemProfileStorageItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_attributesForSystemProfileStorageItems");
}

id objc_msgSend__attributesForUserProfileStorageItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_attributesForUserProfileStorageItem");
}

id objc_msgSend__authSchemeForAuthenticationMethod_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_authSchemeForAuthenticationMethod:");
}

id objc_msgSend__badIdentityError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_badIdentityError");
}

id objc_msgSend__badProvisioningProfileError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_badProvisioningProfileError");
}

id objc_msgSend__cannotCheckInErrorWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cannotCheckInErrorWithName:");
}

id objc_msgSend__cannotStoreCertificateError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cannotStoreCertificateError");
}

id objc_msgSend__cannotStorePEMDataError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cannotStorePEMDataError");
}

id objc_msgSend__cannotStoreRootCertificateError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cannotStoreRootCertificateError");
}

id objc_msgSend__carrierIdentifierFromContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_carrierIdentifierFromContext:");
}

id objc_msgSend__carrierNameFromContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_carrierNameFromContext:");
}

id objc_msgSend__checkValidUserEnrollment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkValidUserEnrollment");
}

id objc_msgSend__cleanUpAfterRemovingProfileWithIdentifier_installedForUser_profileHandler_oldRestrictions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cleanUpAfterRemovingProfileWithIdentifier:installedForUser:profileHandler:oldRestrictions:");
}

id objc_msgSend__cleanUpAppConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cleanUpAppConfiguration");
}

id objc_msgSend__configurationForPayloads_includingPayloads_excludingPayloads_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_configurationForPayloads:includingPayloads:excludingPayloads:error:");
}

id objc_msgSend__configureEncryptionTypeForWiFiNetwork_payload_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_configureEncryptionTypeForWiFiNetwork:payload:outError:");
}

id objc_msgSend__configureNetworkServiceForWiFiNetwork_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_configureNetworkServiceForWiFiNetwork:outError:");
}

id objc_msgSend__containsPayloadsDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_containsPayloadsDictionary");
}

id objc_msgSend__continueQueueingProfile_profileData_forDevice_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_continueQueueingProfile:profileData:forDevice:completion:");
}

id objc_msgSend__copyAlmostAtomicallyItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyAlmostAtomicallyItemAtPath:toPath:error:");
}

id objc_msgSend__copyCertificateWithPayloadUUID_intoKeychainAccessGroup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyCertificateWithPayloadUUID:intoKeychainAccessGroup:");
}

id objc_msgSend__copyCertificateWithPayloadUUID_intoKeychainAccessGroup_personaID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyCertificateWithPayloadUUID:intoKeychainAccessGroup:personaID:");
}

id objc_msgSend__copyContentsOfPKCS12DataWithPasscode_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyContentsOfPKCS12DataWithPasscode:outError:");
}

id objc_msgSend__correctCloudConfigurationIfNecessary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_correctCloudConfigurationIfNecessary");
}

id objc_msgSend__correctInstallOptionsOnProfileStubs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_correctInstallOptionsOnProfileStubs");
}

id objc_msgSend__correctMDMConfigurationFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_correctMDMConfigurationFile");
}

id objc_msgSend__createDirectories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createDirectories");
}

id objc_msgSend__createDirectoryAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createDirectoryAtPath:");
}

id objc_msgSend__createDirectoryAtPath_attributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createDirectoryAtPath:attributes:");
}

id objc_msgSend__createKeyPairLength_outPublicKey_outPrivateKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createKeyPairLength:outPublicKey:outPrivateKey:");
}

id objc_msgSend__createKeyPairType_size_hardwareBound_outPublicKey_outPrivateKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createKeyPairType:size:hardwareBound:outPublicKey:outPrivateKey:");
}

id objc_msgSend__createStubs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createStubs");
}

id objc_msgSend__createSystemGroupContainerAndMoveFiles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createSystemGroupContainerAndMoveFiles");
}

id objc_msgSend__createSystemProfileStorageDirectoryMigratingFromLegacyStorageIfNecessary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createSystemProfileStorageDirectoryMigratingFromLegacyStorageIfNecessary");
}

id objc_msgSend__ctPrivateNetworkProfile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_ctPrivateNetworkProfile:");
}

id objc_msgSend__currentPublicPasscodeDict(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_currentPublicPasscodeDict");
}

id objc_msgSend__deleteAccountAndAssociatedData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deleteAccountAndAssociatedData:");
}

id objc_msgSend__derCertificatesFromPersistentRefArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_derCertificatesFromPersistentRefArray:");
}

id objc_msgSend__destructiveDataclassActionsForRemovalOfAccount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_destructiveDataclassActionsForRemovalOfAccount:");
}

id objc_msgSend__deviceLockedError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deviceLockedError");
}

id objc_msgSend__deviceSpecificDefaultSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deviceSpecificDefaultSettings");
}

id objc_msgSend__endPointFQDNForPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_endPointFQDNForPayload:");
}

id objc_msgSend__enumerateProfilesWithCriteria_filterFlags_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_enumerateProfilesWithCriteria:filterFlags:block:");
}

id objc_msgSend__errorBadProfile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_errorBadProfile");
}

id objc_msgSend__errorEnrollmentCannotBeStaged(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_errorEnrollmentCannotBeStaged");
}

id objc_msgSend__errorEnrollmentMalformed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_errorEnrollmentMalformed");
}

id objc_msgSend__errorFontAlreadyInstalled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_errorFontAlreadyInstalled");
}

id objc_msgSend__errorFontCollection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_errorFontCollection");
}

id objc_msgSend__errorFontInvalid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_errorFontInvalid");
}

id objc_msgSend__errorFontUnknownWithUnderlyingError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_errorFontUnknownWithUnderlyingError:");
}

id objc_msgSend__errorFromPolicyPreflightError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_errorFromPolicyPreflightError:");
}

id objc_msgSend__errorFromValidationError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_errorFromValidationError:");
}

id objc_msgSend__errorInvalidServiceURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_errorInvalidServiceURL");
}

id objc_msgSend__errorMissingMDMPayload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_errorMissingMDMPayload");
}

id objc_msgSend__errorMissingServiceURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_errorMissingServiceURL");
}

id objc_msgSend__errorPhoneUnsupervised(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_errorPhoneUnsupervised");
}

id objc_msgSend__errorUnacceptablePayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_errorUnacceptablePayload:");
}

id objc_msgSend__exchangeSyncUUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_exchangeSyncUUIDString");
}

id objc_msgSend__falseRestrictionsDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_falseRestrictionsDictionary");
}

id objc_msgSend__falseSettingsDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_falseSettingsDictionary");
}

id objc_msgSend__filterPublicPasscodeDict_forGeneration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_filterPublicPasscodeDict:forGeneration:");
}

id objc_msgSend__findInstalledClipWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_findInstalledClipWithIdentifier:");
}

id objc_msgSend__fixDirectoryAtPath_permissions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fixDirectoryAtPath:permissions:");
}

id objc_msgSend__fixManifestFromStubsIfNecessary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fixManifestFromStubsIfNecessary");
}

id objc_msgSend__fixManifestFromStubsIfNecessaryWithStubPath_manifestPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fixManifestFromStubsIfNecessaryWithStubPath:manifestPath:");
}

id objc_msgSend__fixPermissionsOnTheSystemProfileLibraryDirectoryAndContents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fixPermissionsOnTheSystemProfileLibraryDirectoryAndContents");
}

id objc_msgSend__fixUpPasscodeCharacteristics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fixUpPasscodeCharacteristics:");
}

id objc_msgSend__fixUpPublicPasscodeDict_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fixUpPublicPasscodeDict:");
}

id objc_msgSend__fullyInstalledPayloads(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fullyInstalledPayloads");
}

id objc_msgSend__generatedManifestIfNeededFromOrderedProfiles_hiddenProfiles_existingManifest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_generatedManifestIfNeededFromOrderedProfiles:hiddenProfiles:existingManifest:");
}

id objc_msgSend__getBoolDictionaryFromKeySet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getBoolDictionaryFromKeySet:");
}

id objc_msgSend__getClientRestrictionsFromServerCertificatePersistentID_SMIMESigningIdentityPersistentID_SMIMEEncryptionIdentityPersistentID_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getClientRestrictionsFromServerCertificatePersistentID:SMIMESigningIdentityPersistentID:SMIMEEncryptionIdentityPersistentID:outError:");
}

id objc_msgSend__getCounterDictionaryFromKeySet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getCounterDictionaryFromKeySet:");
}

id objc_msgSend__grantPartialNonSSLTrustPolicyForCertificate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_grantPartialNonSSLTrustPolicyForCertificate:");
}

id objc_msgSend__guardAgainstNoMDMPayloadWithNewProfile_oldProfile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_guardAgainstNoMDMPayloadWithNewProfile:oldProfile:");
}

id objc_msgSend__handleSettingsJumpWithProfileData_targetDeviceType_bundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleSettingsJumpWithProfileData:targetDeviceType:bundleID:");
}

id objc_msgSend__handleXPCActivity_proposedStartDate_normalizeStartDate_proposedGracePeriod_proposedPriority_repeatingInterval_requireNetwork_requireUnlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleXPCActivity:proposedStartDate:normalizeStartDate:proposedGracePeriod:proposedPriority:repeatingInterval:requireNetwork:requireUnlock:");
}

id objc_msgSend__hasCompletedPostLoginWork(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_hasCompletedPostLoginWork");
}

id objc_msgSend__incomingAccountInfoDictionaryWithUserInput_isPreflight_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_incomingAccountInfoDictionaryWithUserInput:isPreflight:outError:");
}

id objc_msgSend__incomingAccountWithAccountInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_incomingAccountWithAccountInfo:");
}

id objc_msgSend__install(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_install");
}

id objc_msgSend__install_username_password_identity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_install:username:password:identity:");
}

id objc_msgSend__installAndReturnError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_installAndReturnError:");
}

id objc_msgSend__installApplicationRulesFromPayload_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_installApplicationRulesFromPayload:outError:");
}

id objc_msgSend__installDependency(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_installDependency");
}

id objc_msgSend__installEAPConfiguration_isHotspot_securityType_authProperties_username_password_identity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_installEAPConfiguration:isHotspot:securityType:authProperties:username:password:identity:");
}

id objc_msgSend__installPrivateNetworkProfile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_installPrivateNetworkProfile");
}

id objc_msgSend__installProfileHandler_options_interactionClient_source_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_installProfileHandler:options:interactionClient:source:outError:");
}

id objc_msgSend__installTimePersistentIDForIdentityCertificateOutError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_installTimePersistentIDForIdentityCertificateOutError:");
}

id objc_msgSend__installWithAccountDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_installWithAccountDictionary:");
}

id objc_msgSend__installWithIncomingAccountInfo_outgoingAccountInfo_isInstalledByMDM_personaID_rmAccountIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_installWithIncomingAccountInfo:outgoingAccountInfo:isInstalledByMDM:personaID:rmAccountIdentifier:");
}

id objc_msgSend__installationFailureErrorWithUnderlyingError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_installationFailureErrorWithUnderlyingError:");
}

id objc_msgSend__installationHaltedTopLevelError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_installationHaltedTopLevelError");
}

id objc_msgSend__installedACAccountOtherThanSelf(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_installedACAccountOtherThanSelf");
}

id objc_msgSend__installedAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_installedAccount");
}

id objc_msgSend__installedDAAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_installedDAAccount");
}

id objc_msgSend__installedProfileWithIdentifier_installationType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_installedProfileWithIdentifier:installationType:");
}

id objc_msgSend__installedSetAsideACAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_installedSetAsideACAccount");
}

id objc_msgSend__installedWebClip(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_installedWebClip");
}

id objc_msgSend__intersectionRestrictionsDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_intersectionRestrictionsDictionary");
}

id objc_msgSend__invalidInputError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_invalidInputError");
}

id objc_msgSend__invalidPasscodeError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_invalidPasscodeError");
}

id objc_msgSend__invalidRAResponse(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_invalidRAResponse");
}

id objc_msgSend__invalidValue_forArgument_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_invalidValue:forArgument:");
}

id objc_msgSend__isActivated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isActivated");
}

id objc_msgSend__isCloudConfigurationActuallyAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isCloudConfigurationActuallyAvailable");
}

id objc_msgSend__isCloudConfigurationAvailableInDEP(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isCloudConfigurationAvailableInDEP");
}

id objc_msgSend__isConfiguredWithSCEP(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isConfiguredWithSCEP");
}

id objc_msgSend__isDirectoryEmptyAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isDirectoryEmptyAtPath:");
}

id objc_msgSend__isLegacyProfileStoragePresent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isLegacyProfileStoragePresent");
}

id objc_msgSend__isMetadataValid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isMetadataValid:");
}

id objc_msgSend__isMultiUserMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isMultiUserMode");
}

id objc_msgSend__isValidProvisioningProfileData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isValidProvisioningProfileData:");
}

id objc_msgSend__isWiFiDaemonAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isWiFiDaemonAvailable");
}

id objc_msgSend__jobDescriptionForBackgroundActivityType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_jobDescriptionForBackgroundActivityType:");
}

id objc_msgSend__jobNameForBackgroundActivityType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_jobNameForBackgroundActivityType:");
}

id objc_msgSend__lastSystemMigratedBuildVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_lastSystemMigratedBuildVersion");
}

id objc_msgSend__lastUserMigratedBuildVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_lastUserMigratedBuildVersion");
}

id objc_msgSend__liveClientUUIDsForClientType_outLoaderMissing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_liveClientUUIDsForClientType:outLoaderMissing:");
}

id objc_msgSend__localProvisioningProfileError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_localProvisioningProfileError");
}

id objc_msgSend__malformedCertificateError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_malformedCertificateError");
}

id objc_msgSend__malformedPayloadErrorInternal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_malformedPayloadErrorInternal:");
}

id objc_msgSend__malformedPayloadErrorWithUnderlyingError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_malformedPayloadErrorWithUnderlyingError:");
}

id objc_msgSend__managingProfileIdentifierForProfileIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_managingProfileIdentifierForProfileIdentifier:");
}

id objc_msgSend__markPostUserLoginWorkCompleted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_markPostUserLoginWorkCompleted");
}

id objc_msgSend__mdmDictWithInstaller_options_payload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mdmDictWithInstaller:options:payload:");
}

id objc_msgSend__memberQueueNewUserSettingsWithParametersForSettingsByType_currentUserSettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_memberQueueNewUserSettingsWithParametersForSettingsByType:currentUserSettings:");
}

id objc_msgSend__migrateBoolRestrictions_withAppID_forKey_valuesToRestrictions_currentBoolUserSettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_migrateBoolRestrictions:withAppID:forKey:valuesToRestrictions:currentBoolUserSettings:");
}

id objc_msgSend__migrateBoolValueToFeature_withAppID_forKey_synchronize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_migrateBoolValueToFeature:withAppID:forKey:synchronize:");
}

id objc_msgSend__migrateClientRestrictions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_migrateClientRestrictions");
}

id objc_msgSend__migrateExtensibleSSO(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_migrateExtensibleSSO");
}

id objc_msgSend__migrateLegacySystemProfileStorage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_migrateLegacySystemProfileStorage");
}

id objc_msgSend__migrateLostModeLastLocationRequestDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_migrateLostModeLastLocationRequestDate");
}

id objc_msgSend__migrateManifestLocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_migrateManifestLocation");
}

id objc_msgSend__migrateOTAProfiles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_migrateOTAProfiles");
}

id objc_msgSend__migratePasscodeDidRestore_passcodeWasSet_historyRequired_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_migratePasscodeDidRestore:passcodeWasSet:historyRequired:");
}

id objc_msgSend__migrateProfileStubsForNetworkExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_migrateProfileStubsForNetworkExtension");
}

id objc_msgSend__migrateSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_migrateSettings");
}

id objc_msgSend__migrateSharedDeviceConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_migrateSharedDeviceConfiguration");
}

id objc_msgSend__migrateSupervisionSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_migrateSupervisionSettings");
}

id objc_msgSend__migrateValueRestrictions_withAppID_forKey_keysToRestricitons_currentValueUserSettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_migrateValueRestrictions:withAppID:forKey:keysToRestricitons:currentValueUserSettings:");
}

id objc_msgSend__missingWatchMDMEnrollmentEntitlementError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_missingWatchMDMEnrollmentEntitlementError");
}

id objc_msgSend__moveFilesToPublicDirectories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_moveFilesToPublicDirectories");
}

id objc_msgSend__moveSignerCertificatesInProfileStubDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_moveSignerCertificatesInProfileStubDictionary:");
}

id objc_msgSend__networkServiceRequired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_networkServiceRequired");
}

id objc_msgSend__newZStringWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_newZStringWithString:");
}

id objc_msgSend__nextActivationLockCleanupDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_nextActivationLockCleanupDate");
}

id objc_msgSend__nextManagedAppValidationDateWithOverride_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_nextManagedAppValidationDateWithOverride:");
}

id objc_msgSend__nextRegularDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_nextRegularDate");
}

id objc_msgSend__objectRestrictionsDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_objectRestrictionsDictionary");
}

id objc_msgSend__optionsForCarrierProfileInstallationForCarrierIdentifier_name_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_optionsForCarrierProfileInstallationForCarrierIdentifier:name:");
}

id objc_msgSend__organizationNameFromProfile_payload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_organizationNameFromProfile:payload:");
}

id objc_msgSend__originatorIdentifierFromInstallationOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_originatorIdentifierFromInstallationOptions:");
}

id objc_msgSend__originatorNameFromInstallationOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_originatorNameFromInstallationOptions:");
}

id objc_msgSend__outgoingAccountInfoDictionaryWithUserInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_outgoingAccountInfoDictionaryWithUserInput:");
}

id objc_msgSend__outgoingAccountWithAccountInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_outgoingAccountWithAccountInfo:");
}

id objc_msgSend__overrideProfileValidation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_overrideProfileValidation");
}

id objc_msgSend__payloadCountDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_payloadCountDictionary");
}

id objc_msgSend__performPKIOperation_withPayload_usingPost_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performPKIOperation:withPayload:usingPost:error:");
}

id objc_msgSend__persistentIDForCertificateUUID_notFoundLocErrorString_badLocErrorString_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_persistentIDForCertificateUUID:notFoundLocErrorString:badLocErrorString:outError:");
}

id objc_msgSend__persistentIDForPayloadUUID_requireIdentity_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_persistentIDForPayloadUUID:requireIdentity:error:");
}

id objc_msgSend__postPurgatoryFollowUpForProfileData_targetDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_postPurgatoryFollowUpForProfileData:targetDevice:");
}

id objc_msgSend__preflightProfileForInstallationOnHomePod_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_preflightProfileForInstallationOnHomePod:");
}

id objc_msgSend__preflightProfileForInstallationOnWatch_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_preflightProfileForInstallationOnWatch:");
}

id objc_msgSend__preflightTimePersistentIDForIdentityCertificateUserInputResponses_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_preflightTimePersistentIDForIdentityCertificateUserInputResponses:outError:");
}

id objc_msgSend__preflightWithAccount_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_preflightWithAccount:completionHandler:");
}

id objc_msgSend__preflightWithPreflighter_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_preflightWithPreflighter:completionHandler:");
}

id objc_msgSend__privatePasscodeDictWithOutError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_privatePasscodeDictWithOutError:");
}

id objc_msgSend__profileDrivenEnrollmentBlocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_profileDrivenEnrollmentBlocked");
}

id objc_msgSend__profileDrivenUserEnrollmentNotSupportedError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_profileDrivenUserEnrollmentNotSupportedError");
}

id objc_msgSend__profileEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_profileEvents");
}

id objc_msgSend__profileEventsOnDisk(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_profileEventsOnDisk");
}

id objc_msgSend__profileInstallationErrorWithUnderlyingError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_profileInstallationErrorWithUnderlyingError:");
}

id objc_msgSend__profileNotEligibleErrorWithProfile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_profileNotEligibleErrorWithProfile:");
}

id objc_msgSend__profilesFromManifestAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_profilesFromManifestAtPath:");
}

id objc_msgSend__profilesFromStubsAtPath_orderedProfiles_hiddenProfiles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_profilesFromStubsAtPath:orderedProfiles:hiddenProfiles:");
}

id objc_msgSend__promptUserForComplianceWithRestrictions_handler_interactionClient_outPasscode_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_promptUserForComplianceWithRestrictions:handler:interactionClient:outPasscode:outError:");
}

id objc_msgSend__promptUserForMAIDSignIn_personaID_handler_interactionClient_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_promptUserForMAIDSignIn:personaID:handler:interactionClient:outError:");
}

id objc_msgSend__promptUserForRestoreWithAccountID_personaID_interactionClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_promptUserForRestoreWithAccountID:personaID:interactionClient:");
}

id objc_msgSend__purgatoryWorkerQueue_didPurgePurgatory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_purgatoryWorkerQueue_didPurgePurgatory:");
}

id objc_msgSend__queueProfileData_profile_forDevice_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_queueProfileData:profile:forDevice:completion:");
}

id objc_msgSend__reallyInstallInstaller_isInstalledByMDM_personaID_rmAccountIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reallyInstallInstaller:isInstalledByMDM:personaID:rmAccountIdentifier:");
}

id objc_msgSend__reallyRemoveInstalledProfileWithIdentifier_installationType_options_source_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reallyRemoveInstalledProfileWithIdentifier:installationType:options:source:");
}

id objc_msgSend__reallyRemoveProfileWithIdentifier_installationType_profileInstalled_targetDeviceType_options_source_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reallyRemoveProfileWithIdentifier:installationType:profileInstalled:targetDeviceType:options:source:");
}

id objc_msgSend__reapplyConfigurationIncludingPayloads_excludingPayloads_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reapplyConfigurationIncludingPayloads:excludingPayloads:error:");
}

id objc_msgSend__reapplyPayloads_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reapplyPayloads:error:");
}

id objc_msgSend__rebuildWiFiAssistConfigurationIncludingPayloads_excludingPayloads_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_rebuildWiFiAssistConfigurationIncludingPayloads:excludingPayloads:error:");
}

id objc_msgSend__receivedUserInput_preflight_payloadIndex_delegate_semaphore_error_outResponses_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_receivedUserInput:preflight:payloadIndex:delegate:semaphore:error:outResponses:");
}

id objc_msgSend__recoverProxyCredential(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_recoverProxyCredential");
}

id objc_msgSend__releaseDependency(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_releaseDependency");
}

id objc_msgSend__releaseDependencyBetweenPersistentID_andUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_releaseDependencyBetweenPersistentID:andUUID:");
}

id objc_msgSend__releaseDependencyBetweenPersistentID_andUUID_forSystem_user_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_releaseDependencyBetweenPersistentID:andUUID:forSystem:user:");
}

id objc_msgSend__releaseDependencyBetweenPersistentID_andUUID_forSystem_user_personaID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_releaseDependencyBetweenPersistentID:andUUID:forSystem:user:personaID:");
}

id objc_msgSend__remove(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remove");
}

id objc_msgSend__removeAccountWithPersistentResourceID_fromArray_outArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeAccountWithPersistentResourceID:fromArray:outArray:");
}

id objc_msgSend__removeDependency(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeDependency");
}

id objc_msgSend__removeDuplicatedHiddenIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeDuplicatedHiddenIdentifiers");
}

id objc_msgSend__removeExistingSystemProfileStorageDirectoryBlockingMigration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeExistingSystemProfileStorageDirectoryBlockingMigration");
}

id objc_msgSend__removeExpiredProvisioningProfiles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeExpiredProvisioningProfiles");
}

id objc_msgSend__removeHardwareBoundPayloads(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeHardwareBoundPayloads");
}

id objc_msgSend__removeInvalidOptionsFromLegacyCloudConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeInvalidOptionsFromLegacyCloudConfiguration");
}

id objc_msgSend__removeLegacyAPNConfigurations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeLegacyAPNConfigurations");
}

id objc_msgSend__removeMDMProfileIfDataSeparated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeMDMProfileIfDataSeparated");
}

id objc_msgSend__removeNetworkWithUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeNetworkWithUUID:");
}

id objc_msgSend__removeOSXServerPayloadAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeOSXServerPayloadAccount");
}

id objc_msgSend__removeOriginalCopies(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeOriginalCopies");
}

id objc_msgSend__removeOrphanedCertificateDependencyManager_persistentID_persona_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeOrphanedCertificateDependencyManager:persistentID:persona:");
}

id objc_msgSend__removeOrphanedManifestEntries(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeOrphanedManifestEntries");
}

id objc_msgSend__removeOrphanedManifestEntriesFromManifestInDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeOrphanedManifestEntriesFromManifestInDirectory:");
}

id objc_msgSend__removeOrphanedResourcesOptions_includingAccounts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeOrphanedResourcesOptions:includingAccounts:");
}

id objc_msgSend__removePersonaIDForMailAccountWithPersistentResourceID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removePersonaIDForMailAccountWithPersistentResourceID:");
}

id objc_msgSend__removeProxyCredential(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeProxyCredential");
}

id objc_msgSend__removeSupervisionProfiles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeSupervisionProfiles");
}

id objc_msgSend__removeUnmanageableApps(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeUnmanageableApps");
}

id objc_msgSend__removeUnusedManifestArrays(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeUnusedManifestArrays");
}

id objc_msgSend__removeWebClip_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeWebClip:");
}

id objc_msgSend__removeiPCUCertificates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeiPCUCertificates");
}

id objc_msgSend__replacePurgatoryProfilesForTargetDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_replacePurgatoryProfilesForTargetDevice:");
}

id objc_msgSend__rescheduleBackgroundActivity_startDate_gracePeriod_priority_repeatingInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_rescheduleBackgroundActivity:startDate:gracePeriod:priority:repeatingInterval:");
}

id objc_msgSend__retainDependency(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_retainDependency");
}

id objc_msgSend__retainDependencyBetweenPersistentID_andUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_retainDependencyBetweenPersistentID:andUUID:");
}

id objc_msgSend__retainDependencyBetweenPersistentID_andUUID_forSystem_user_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_retainDependencyBetweenPersistentID:andUUID:forSystem:user:");
}

id objc_msgSend__retainDependencyBetweenPersistentID_andUUID_forSystem_user_personaID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_retainDependencyBetweenPersistentID:andUUID:forSystem:user:personaID:");
}

id objc_msgSend__revertFullSSLTrustIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_revertFullSSLTrustIfNeeded");
}

id objc_msgSend__saveConferenceRoomDisplayConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_saveConferenceRoomDisplayConfiguration");
}

id objc_msgSend__saveProfileEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_saveProfileEvents:");
}

id objc_msgSend__saveSetupAssistantSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_saveSetupAssistantSettings");
}

id objc_msgSend__saveSharedDeviceConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_saveSharedDeviceConfiguration");
}

id objc_msgSend__sdpErrorForFinalProfile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sdpErrorForFinalProfile:");
}

id objc_msgSend__sendChangeNotificationsBasedOnDefaultsAdditionByDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendChangeNotificationsBasedOnDefaultsAdditionByDomain:");
}

id objc_msgSend__sendChangeNotificationsBasedOnDefaultsRemovalByDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendChangeNotificationsBasedOnDefaultsRemovalByDomain:");
}

id objc_msgSend__sendCloudConfigurationChangedNotificationIfWeMigratedLegacyProfileStorage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendCloudConfigurationChangedNotificationIfWeMigratedLegacyProfileStorage");
}

id objc_msgSend__sendEffectiveSettingsChangedNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendEffectiveSettingsChangedNotification");
}

id objc_msgSend__sendMDMEnrollmentEventWithInstallationOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendMDMEnrollmentEventWithInstallationOptions:");
}

id objc_msgSend__sendRestrictionChangedNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendRestrictionChangedNotification");
}

id objc_msgSend__sendSystemConfigurationProxyChangeNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendSystemConfigurationProxyChangeNotification");
}

id objc_msgSend__serviceURLFromEnrollmentDictionary_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_serviceURLFromEnrollmentDictionary:outError:");
}

id objc_msgSend__setAccessType_securityType_password_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setAccessType:securityType:password:");
}

id objc_msgSend__setAccountProperties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setAccountProperties:");
}

id objc_msgSend__setAirPlaySecurityConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setAirPlaySecurityConfiguration");
}

id objc_msgSend__setAttributesOnSystemProfileStorageDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setAttributesOnSystemProfileStorageDirectory");
}

id objc_msgSend__setEAPConfig_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setEAPConfig:");
}

id objc_msgSend__setEAPConfig_onNetwork_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setEAPConfig:onNetwork:");
}

id objc_msgSend__setFileNameLocalizationEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setFileNameLocalizationEnabled:");
}

id objc_msgSend__setPassword_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setPassword:");
}

id objc_msgSend__setPrivatePasscodeDict_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setPrivatePasscodeDict:");
}

id objc_msgSend__setPublicPasscodeDict_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setPublicPasscodeDict:");
}

id objc_msgSend__setRequriesEncryptedBackupInLockdownWithEffectiveUserSettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setRequriesEncryptedBackupInLockdownWithEffectiveUserSettings:");
}

id objc_msgSend__shouldAttemptToMigrateLegacyProfileStorage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldAttemptToMigrateLegacyProfileStorage");
}

id objc_msgSend__showPromptForHomePodAndWatchWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_showPromptForHomePodAndWatchWithCompletionBlock:");
}

id objc_msgSend__showPromptForHomePodWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_showPromptForHomePodWithCompletionBlock:");
}

id objc_msgSend__showPromptForThisDeviceAndOtherDevicesWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_showPromptForThisDeviceAndOtherDevicesWithCompletionBlock:");
}

id objc_msgSend__showPromptForWatchWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_showPromptForWatchWithCompletionBlock:");
}

id objc_msgSend__showWarnings_interactionClient_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_showWarnings:interactionClient:outError:");
}

id objc_msgSend__showWarningsForProfile_interactionClient_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_showWarningsForProfile:interactionClient:outError:");
}

id objc_msgSend__showWarningsForUpdatingProfile_originalProfile_interactionClient_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_showWarningsForUpdatingProfile:originalProfile:interactionClient:outError:");
}

id objc_msgSend__storeCertificate_allowSSLTrust_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_storeCertificate:allowSSLTrust:outError:");
}

id objc_msgSend__storePEMDataInKeychain_UUID_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_storePEMDataInKeychain:UUID:outError:");
}

id objc_msgSend__synchronousTransactionWithURL_method_content_contentType_outResponseCode_outContentType_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_synchronousTransactionWithURL:method:content:contentType:outResponseCode:outContentType:outError:");
}

id objc_msgSend__synchronouslyDeleteAccountAndAssociatedData_timeout_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_synchronouslyDeleteAccountAndAssociatedData:timeout:completion:");
}

id objc_msgSend__tagIMAPAccountsWithProfileAndPayloadProperties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_tagIMAPAccountsWithProfileAndPayloadProperties");
}

id objc_msgSend__tagManagedAccounts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_tagManagedAccounts");
}

id objc_msgSend__targetDeviceArchivedError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_targetDeviceArchivedError");
}

id objc_msgSend__targetDeviceErrorWithUnderlyingError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_targetDeviceErrorWithUnderlyingError:");
}

id objc_msgSend__targetDeviceMismatchError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_targetDeviceMismatchError");
}

id objc_msgSend__targetDevicePreflightFailedError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_targetDevicePreflightFailedError");
}

id objc_msgSend__targetDeviceUnavailableError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_targetDeviceUnavailableError");
}

id objc_msgSend__targetValidationStatusForProfile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_targetValidationStatusForProfile:");
}

id objc_msgSend__tellAMFIIfWeAreSupervised(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_tellAMFIIfWeAreSupervised");
}

id objc_msgSend__temporaryPersistentIDForIdentityUUID_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_temporaryPersistentIDForIdentityUUID:outError:");
}

id objc_msgSend__timestampFromEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_timestampFromEvent:");
}

id objc_msgSend__tooManyCertificatesError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_tooManyCertificatesError");
}

id objc_msgSend__touchDependencyBetweenPersistentID_andUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_touchDependencyBetweenPersistentID:andUUID:");
}

id objc_msgSend__touchDependencyBetweenPersistentID_andUUID_personaID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_touchDependencyBetweenPersistentID:andUUID:personaID:");
}

id objc_msgSend__transferInstallationDatesFromOriginalProfiles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_transferInstallationDatesFromOriginalProfiles");
}

id objc_msgSend__transferRemovalPasswordsFromOriginalProfiles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_transferRemovalPasswordsFromOriginalProfiles");
}

id objc_msgSend__transferSignerCertificates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_transferSignerCertificates");
}

id objc_msgSend__transferTagsToProfileStubs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_transferTagsToProfileStubs");
}

id objc_msgSend__trueRestrictionsDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_trueRestrictionsDictionary");
}

id objc_msgSend__trueSettingsDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_trueSettingsDictionary");
}

id objc_msgSend__uiProfileInstallationDisabledTopLevelErrorWithCause_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_uiProfileInstallationDisabledTopLevelErrorWithCause:");
}

id objc_msgSend__uninstall(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_uninstall");
}

id objc_msgSend__updateCDPWithNewPasscode_passcodeType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateCDPWithNewPasscode:passcodeType:");
}

id objc_msgSend__updateClientRestrictions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateClientRestrictions");
}

id objc_msgSend__updateProfileRestrictions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateProfileRestrictions");
}

id objc_msgSend__updateProfileRestrictionsForProfileRestrictions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateProfileRestrictionsForProfileRestrictions:");
}

id objc_msgSend__updateSupervision_cloudConfigReader_cloudConfigWriter_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateSupervision:cloudConfigReader:cloudConfigWriter:outError:");
}

id objc_msgSend__updateTrustedCodeSigningIdentitiesWithManagedAppSigners_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateTrustedCodeSigningIdentitiesWithManagedAppSigners:outError:");
}

id objc_msgSend__updateWiFiCustomSetWithSetID_forSSID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateWiFiCustomSetWithSetID:forSSID:");
}

id objc_msgSend__userCancelledErrorWithFriendlyName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_userCancelledErrorWithFriendlyName:");
}

id objc_msgSend__validateCloudConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateCloudConfiguration");
}

id objc_msgSend__validateDetails_outReasonWhyInvalid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateDetails:outReasonWhyInvalid:");
}

id objc_msgSend__validateMDMReplacementNewProfile_oldProfile_client_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateMDMReplacementNewProfile:oldProfile:client:");
}

id objc_msgSend__validateNewMDMProfile_installationOption_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateNewMDMProfile:installationOption:");
}

id objc_msgSend__valueRestrictionsDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_valueRestrictionsDictionary");
}

id objc_msgSend__wakeDaemonsPostMigration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_wakeDaemonsPostMigration");
}

id objc_msgSend__watchInformationOutIsCellularSupported_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_watchInformationOutIsCellularSupported:");
}

id objc_msgSend__webclipFailedToCreateOnDiskError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_webclipFailedToCreateOnDiskError");
}

id objc_msgSend__workQueueReschedule_startDate_gracePeriod_priority_repeatingInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_workQueueReschedule:startDate:gracePeriod:priority:repeatingInterval:");
}

id objc_msgSend__workQueueReschedulePasscodeExpiryJob(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_workQueueReschedulePasscodeExpiryJob");
}

id objc_msgSend__workQueueRescheduleRecoveryPasscodeExpiryJob(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_workQueueRescheduleRecoveryPasscodeExpiryJob");
}

id objc_msgSend__workerQueueCheckCarrierProfileForCarrierIdentifier_name_atPath_forceReinstallation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_workerQueueCheckCarrierProfileForCarrierIdentifier:name:atPath:forceReinstallation:");
}

id objc_msgSend__workerQueueForceCheckOfCarrierProfileOnNextUnlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_workerQueueForceCheckOfCarrierProfileOnNextUnlock");
}

id objc_msgSend__workerQueuePrepareForService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_workerQueuePrepareForService");
}

id objc_msgSend__workerQueueRemoveAllCarrierProfiles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_workerQueueRemoveAllCarrierProfiles");
}

id objc_msgSend__workerQueue_setParametersForSettingsByType_configurationUUID_toSystem_user_passcode_credentialSet_senderPID_sender_assertion_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_workerQueue_setParametersForSettingsByType:configurationUUID:toSystem:user:passcode:credentialSet:senderPID:sender:assertion:completion:");
}

id objc_msgSend__writeConfiguration_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_writeConfiguration:withError:");
}

id objc_msgSend__writeDetails_toFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_writeDetails:toFile:");
}

id objc_msgSend__writeWiFiAssistConfiguration_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_writeWiFiAssistConfiguration:withError:");
}

id objc_msgSend_aa_appleAccounts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aa_appleAccounts");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_accessRights(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessRights");
}

id objc_msgSend_accessType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessType");
}

id objc_msgSend_accessibility(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibility");
}

id objc_msgSend_accountBoolPropertyForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountBoolPropertyForKey:");
}

id objc_msgSend_accountDataclassesForBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountDataclassesForBundleID:");
}

id objc_msgSend_accountDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountDescription");
}

id objc_msgSend_accountDictionaryWithIsInstalledByMDM_personaID_rmAccountIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountDictionaryWithIsInstalledByMDM:personaID:rmAccountIdentifier:");
}

id objc_msgSend_accountGUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountGUID");
}

id objc_msgSend_accountIsValid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountIsValid");
}

id objc_msgSend_accountName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountName");
}

id objc_msgSend_accountPayloads(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountPayloads");
}

id objc_msgSend_accountPropertyForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountPropertyForKey:");
}

id objc_msgSend_accountRemovalTimeoutWithDefaultValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountRemovalTimeoutWithDefaultValue:");
}

id objc_msgSend_accountStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountStore");
}

id objc_msgSend_accountTypeGUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountTypeGUID");
}

id objc_msgSend_accountTypeIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountTypeIdentifiers");
}

id objc_msgSend_accountTypeWithAccountTypeIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountTypeWithAccountTypeIdentifier:");
}

id objc_msgSend_accountValidationCompletionHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountValidationCompletionHandler");
}

id objc_msgSend_accountWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountWithIdentifier:");
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accounts");
}

id objc_msgSend_accountsWithAccountType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountsWithAccountType:");
}

id objc_msgSend_accountsWithAccountTypeIdentifiers_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountsWithAccountTypeIdentifiers:error:");
}

id objc_msgSend_activationRecordFlagsWithFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activationRecordFlagsWithFlags:");
}

id objc_msgSend_activeAccounts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeAccounts");
}

id objc_msgSend_activePairedDeviceSelectorBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activePairedDeviceSelectorBlock");
}

id objc_msgSend_addCloudConfigInfoWithEventPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addCloudConfigInfoWithEventPayload:");
}

id objc_msgSend_addContainsPayloadInfoWithProfile_eventPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addContainsPayloadInfoWithProfile:eventPayload:");
}

id objc_msgSend_addDeliveryAccount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDeliveryAccount:");
}

id objc_msgSend_addDependent_ofParent_inDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDependent:ofParent:inDomain:");
}

id objc_msgSend_addDependent_ofParent_inDomain_reciprocalDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDependent:ofParent:inDomain:reciprocalDomain:");
}

id objc_msgSend_addDependent_ofParent_inDomain_reciprocalDomain_toSystem_user_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDependent:ofParent:inDomain:reciprocalDomain:toSystem:user:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addEventForProfile_operation_source_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEventForProfile:operation:source:");
}

id objc_msgSend_addIdentifierToSystemManifest_flag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addIdentifierToSystemManifest:flag:");
}

id objc_msgSend_addIdentifierToUserManifest_flag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addIdentifierToUserManifest:flag:");
}

id objc_msgSend_addMDMConfigInfoWithEventPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addMDMConfigInfoWithEventPayload:");
}

id objc_msgSend_addManagedPreferences_toDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addManagedPreferences:toDomain:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addPasscodeInfoWithEventPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addPasscodeInfoWithEventPayload:");
}

id objc_msgSend_addProfileAndPayloadInfoWithEventPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addProfileAndPayloadInfoWithEventPayload:");
}

id objc_msgSend_addProfilePayload_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addProfilePayload:error:");
}

id objc_msgSend_addProfileRestrictionsStateHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addProfileRestrictionsStateHandler");
}

id objc_msgSend_addProfileSettingsStateHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addProfileSettingsStateHandler");
}

id objc_msgSend_addPurgatoryProfileData_identifier_targetDevice_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addPurgatoryProfileData:identifier:targetDevice:outError:");
}

id objc_msgSend_addRestrictionInfoWithEventPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addRestrictionInfoWithEventPayload:");
}

id objc_msgSend_addSearchSettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSearchSettings:");
}

id objc_msgSend_addSetAsideAccountIdentifier_forPayloadClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSetAsideAccountIdentifier:forPayloadClass:");
}

id objc_msgSend_addSetAsideDictionary_forPayloadHandlerClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSetAsideDictionary:forPayloadHandlerClass:");
}

id objc_msgSend_addSettingsInfoWithEventPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSettingsInfoWithEventPayload:");
}

id objc_msgSend_addSharediPadInfoWithEventPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSharediPadInfoWithEventPayload:");
}

id objc_msgSend_addTimer_forMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTimer:forMode:");
}

id objc_msgSend_addTrustedCodeSigningIdentitiesForProvisioningProfileUUID_sender_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTrustedCodeSigningIdentitiesForProvisioningProfileUUID:sender:completion:");
}

id objc_msgSend_additionsDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "additionsDictionary");
}

id objc_msgSend_allHeaderFields(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allHeaderFields");
}

id objc_msgSend_allInstalledPayloadsOfClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allInstalledPayloadsOfClass:");
}

id objc_msgSend_allInstalledProfileIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allInstalledProfileIdentifiers");
}

id objc_msgSend_allInstalledUserProfileIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allInstalledUserProfileIdentifiers");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allTrustedSignerIdentities(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allTrustedSignerIdentities");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_allowInsecureHTTPLoadsOfURL_forConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowInsecureHTTPLoadsOfURL:forConfiguration:");
}

id objc_msgSend_allowListBookmarks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowListBookmarks");
}

id objc_msgSend_allowListDestinations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowListDestinations");
}

id objc_msgSend_allowUnsupervisedWatchEnrollment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowUnsupervisedWatchEnrollment");
}

id objc_msgSend_allowedImportFromAppBundleIDs_importingAppBundleID_importingIsManaged_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowedImportFromAppBundleIDs:importingAppBundleID:importingIsManaged:completion:");
}

id objc_msgSend_allowedImportFromAppBundleIDsWithOriginalAppBundleIDs_managedAppBundleIDs_localAppBundleID_localAccountIsManaged_mayOpenFromUnmanagedToManaged_mayOpenFromManagedToUnmanaged_isAppBundleIDExemptBlock_isAppBundleIDAccountBasedBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowedImportFromAppBundleIDsWithOriginalAppBundleIDs:managedAppBundleIDs:localAppBundleID:localAccountIsManaged:mayOpenFromUnmanagedToManaged:mayOpenFromManagedToUnmanaged:isAppBundleIDExemptBlock:isAppBundleIDAccountBasedBlock:");
}

id objc_msgSend_allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs_managedAppBundleIDs_hostAppIsManaged_mayOpenFromUnmanagedToManaged_mayOpenFromManagedToUnmanaged_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:managedAppBundleIDs:hostAppIsManaged:mayOpenFromUnmanagedToManaged:mayOpenFromManagedToUnmanaged:");
}

id objc_msgSend_allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs_messageSendingAppBundleID_hostAppBundleID_accountIsManaged_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:messageSendingAppBundleID:hostAppBundleID:accountIsManaged:completion:");
}

id objc_msgSend_allowedOpenInAppBundleIDs_originatingAppBundleID_originatingIsManaged_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowedOpenInAppBundleIDs:originatingAppBundleID:originatingIsManaged:completion:");
}

id objc_msgSend_allowedOpenInAppBundleIDsWithOriginalAppBundleIDs_managedAppBundleIDs_localAppBundleID_localAccountIsManaged_mayOpenFromUnmanagedToManaged_mayOpenFromManagedToUnmanaged_isAppBundleIDExemptBlock_isAppBundleIDAccountBasedBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowedOpenInAppBundleIDsWithOriginalAppBundleIDs:managedAppBundleIDs:localAppBundleID:localAccountIsManaged:mayOpenFromUnmanagedToManaged:mayOpenFromManagedToUnmanaged:isAppBundleIDExemptBlock:isAppBundleIDAccountBasedBlock:");
}

id objc_msgSend_allowedToRunAppWithBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowedToRunAppWithBundleID:");
}

id objc_msgSend_alreadySignedIntoFaceTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alreadySignedIntoFaceTime");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "anyObject");
}

id objc_msgSend_anyUPPExistsForManagedAppSigners(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "anyUPPExistsForManagedAppSigners");
}

id objc_msgSend_apnDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "apnDefaults");
}

id objc_msgSend_apnDomainName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "apnDomainName");
}

id objc_msgSend_appAccessibilityParameters(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appAccessibilityParameters");
}

id objc_msgSend_appIdentifierMatches(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appIdentifierMatches");
}

id objc_msgSend_appWhitelistStateWithSettingsDictionary_restrictionsDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appWhitelistStateWithSettingsDictionary:restrictionsDictionary:");
}

id objc_msgSend_appWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appWorkspace");
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_applicationBundleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationBundleID");
}

id objc_msgSend_applicationID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationID");
}

id objc_msgSend_applicationProxyForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationProxyForIdentifier:");
}

id objc_msgSend_applicationRules(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationRules");
}

id objc_msgSend_applyConfiguration_toDomain_inNamespace_fromSender_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyConfiguration:toDomain:inNamespace:fromSender:");
}

id objc_msgSend_applyEffectiveSettings_toOtherSubsystemsPasscode_credentialSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyEffectiveSettings:toOtherSubsystemsPasscode:credentialSet:");
}

id objc_msgSend_applyEffectiveSettings_toSettings_withOldRestrictions_newRestrictions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyEffectiveSettings:toSettings:withOldRestrictions:newRestrictions:");
}

id objc_msgSend_applyGracePeriodSettingFromKeybagToUserSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyGracePeriodSettingFromKeybagToUserSettings");
}

id objc_msgSend_applyPairingWatchMDMEnrollmentData_source_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyPairingWatchMDMEnrollmentData:source:completion:");
}

id objc_msgSend_applyPairingWatchMDMEnrollmentData_source_usingProfileInstaller_cloudConfigReader_cloudConfigWriter_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyPairingWatchMDMEnrollmentData:source:usingProfileInstaller:cloudConfigReader:cloudConfigWriter:completion:");
}

id objc_msgSend_applyRestrictionDictionary_overrideRestrictions_appsAndOptions_clientType_clientUUID_sender_localizedClientDescription_localizedWarningMessage_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyRestrictionDictionary:overrideRestrictions:appsAndOptions:clientType:clientUUID:sender:localizedClientDescription:localizedWarningMessage:completion:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assertionHoldQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assertionHoldQueue");
}

id objc_msgSend_assignedManagedAppleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assignedManagedAppleID");
}

id objc_msgSend_associatedDomains(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "associatedDomains");
}

id objc_msgSend_atsOverrideDataWithInsecureHTTPForHost_fromATSOverrideData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "atsOverrideDataWithInsecureHTTPForHost:fromATSOverrideData:");
}

id objc_msgSend_attachAPN(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attachAPN");
}

id objc_msgSend_attest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attest");
}

id objc_msgSend_attributesByAppID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributesByAppID");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "auditToken");
}

id objc_msgSend_authenticateWithCheckInURL_identity_pinnedSecCertificateRefs_pinningRevocationCheckRequired_topic_useDevelopmentAPNS_signMessage_isUserEnrollment_enrollmentID_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticateWithCheckInURL:identity:pinnedSecCertificateRefs:pinningRevocationCheckRequired:topic:useDevelopmentAPNS:signMessage:isUserEnrollment:enrollmentID:outError:");
}

id objc_msgSend_authenticateWithContext_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticateWithContext:completion:");
}

id objc_msgSend_autoJoin(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "autoJoin");
}

id objc_msgSend_backingAccountInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backingAccountInfo");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_blockedByFilter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blockedByFilter");
}

id objc_msgSend_blockedByFilterMetadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blockedByFilterMetadata");
}

id objc_msgSend_bookmarksFromBookmarkDicts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bookmarksFromBookmarkDicts:");
}

id objc_msgSend_BOOLSetting_valueChangedBetweenOldSettings_andNewSettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:");
}

id objc_msgSend_BOOLSettingForFeature_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLSettingForFeature:");
}

id objc_msgSend_BOOLSettingForFeature_withUserSettingDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLSettingForFeature:withUserSettingDictionary:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_calendarAccountIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calendarAccountIdentifiers");
}

id objc_msgSend_calendarDomains(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calendarDomains");
}

id objc_msgSend_canSaveAccount_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canSaveAccount:withCompletionHandler:");
}

id objc_msgSend_cancelNotificationsWithIdentifier_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelNotificationsWithIdentifier:completionBlock:");
}

id objc_msgSend_cannotInstallError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cannotInstallError");
}

id objc_msgSend_cannotInstallErrorWithUnderlyingError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cannotInstallErrorWithUnderlyingError:");
}

id objc_msgSend_canonicalConfigurationWithSupervision_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canonicalConfigurationWithSupervision:");
}

id objc_msgSend_canonicalPersistentReferenceForItemWithPersistentReference_inSystemKeychain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canonicalPersistentReferenceForItemWithPersistentReference:inSystemKeychain:");
}

id objc_msgSend_captiveBypass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "captiveBypass");
}

id objc_msgSend_cellularDataPreferred(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cellularDataPreferred");
}

id objc_msgSend_cellularRequiredPayloads(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cellularRequiredPayloads");
}

id objc_msgSend_certificateData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "certificateData");
}

id objc_msgSend_certificateFileName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "certificateFileName");
}

id objc_msgSend_certificatePersistentID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "certificatePersistentID");
}

id objc_msgSend_certificateUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "certificateUUID");
}

id objc_msgSend_challenge(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "challenge");
}

id objc_msgSend_changePasscode_oldPasscode_skipRecovery_senderBundleID_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "changePasscode:oldPasscode:skipRecovery:senderBundleID:completion:");
}

id objc_msgSend_changePasscode_recoveryPasscode_skipRecovery_senderBundleID_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "changePasscode:recoveryPasscode:skipRecovery:senderBundleID:completion:");
}

id objc_msgSend_changePasscodeFrom_to_skipRecovery_senderBundleID_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "changePasscodeFrom:to:skipRecovery:senderBundleID:outError:");
}

id objc_msgSend_changePasscodeWithRecoveryPasscode_to_skipRecovery_senderBundleID_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "changePasscodeWithRecoveryPasscode:to:skipRecovery:senderBundleID:outError:");
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterSetWithCharactersInString:");
}

id objc_msgSend_characteristicsDictionaryFromPasscode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characteristicsDictionaryFromPasscode:");
}

id objc_msgSend_checkAccountConsistencyAndReleaseOrphanedAccounts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkAccountConsistencyAndReleaseOrphanedAccounts");
}

id objc_msgSend_checkCarrierProfile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkCarrierProfile");
}

id objc_msgSend_checkCarrierProfileAndForceReinstallation_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkCarrierProfileAndForceReinstallation:completion:");
}

id objc_msgSend_checkInPinningPersistentRefs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkInPinningPersistentRefs");
}

id objc_msgSend_checkInPinningUUIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkInPinningUUIDs");
}

id objc_msgSend_checkInURLString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkInURLString");
}

id objc_msgSend_checkInWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkInWithCompletion:");
}

id objc_msgSend_checkOutCheckInURL_identity_pinnedSecCertificateRefs_pinningRevocationCheckRequired_topic_signMessage_isUserEnrollment_enrollmentID_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkOutCheckInURL:identity:pinnedSecCertificateRefs:pinningRevocationCheckRequired:topic:signMessage:isUserEnrollment:enrollmentID:outError:");
}

id objc_msgSend_checkOutWhenRemoved(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkOutWhenRemoved");
}

id objc_msgSend_checkValidityOnAccountStore_withConsumer_inQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkValidityOnAccountStore:withConsumer:inQueue:");
}

id objc_msgSend_chipID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chipID");
}

id objc_msgSend_cleanUpDirtyState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cleanUpDirtyState");
}

id objc_msgSend_clearAllPasscodeComplianceCaches(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearAllPasscodeComplianceCaches");
}

id objc_msgSend_clearAllPermissionsGrantedForAccountType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearAllPermissionsGrantedForAccountType:");
}

id objc_msgSend_clearPasscodeHistory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearPasscodeHistory");
}

id objc_msgSend_clearPasscodeWithEscrowKeybagData_secret_senderBundleID_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearPasscodeWithEscrowKeybagData:secret:senderBundleID:completion:");
}

id objc_msgSend_clearPasscodeWithEscrowKeybagData_secret_senderBundleID_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearPasscodeWithEscrowKeybagData:secret:senderBundleID:outError:");
}

id objc_msgSend_clearPendingFollowUpItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearPendingFollowUpItems:");
}

id objc_msgSend_clearRecoveryPasscode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearRecoveryPasscode");
}

id objc_msgSend_clearRecoveryPasscodeOpaqueDataWithOutError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearRecoveryPasscodeOpaqueDataWithOutError:");
}

id objc_msgSend_clearRecoveryPasscodeWithSenderBundleID_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearRecoveryPasscodeWithSenderBundleID:completion:");
}

id objc_msgSend_clearStoredActivationLockBypassCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearStoredActivationLockBypassCode");
}

id objc_msgSend_clientIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientIdentifier");
}

id objc_msgSend_clientRestrictionQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientRestrictionQueue");
}

id objc_msgSend_clientRestrictionsForClientUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientRestrictionsForClientUUID:");
}

id objc_msgSend_clientTypeLoaders(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientTypeLoaders");
}

id objc_msgSend_clientUUIDForBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientUUIDForBundleID:");
}

id objc_msgSend_cloudConfigurationMachineInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cloudConfigurationMachineInfo");
}

id objc_msgSend_cloudConfigurationMachineInfoDataWithAdditionalInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cloudConfigurationMachineInfoDataWithAdditionalInfo:");
}

id objc_msgSend_cloudConfigurationMachineInfoDataWithAdditionalInfo_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cloudConfigurationMachineInfoDataWithAdditionalInfo:completion:");
}

id objc_msgSend_cloudConfigurationStoreDetails_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cloudConfigurationStoreDetails:completion:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_combinedProfileRestrictions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "combinedProfileRestrictions");
}

id objc_msgSend_commitChanges(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commitChanges");
}

id objc_msgSend_commitChangesCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commitChangesCompletion:");
}

id objc_msgSend_commitChangesWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commitChangesWithError:");
}

id objc_msgSend_commitProfilePayloadsAndReturnError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commitProfilePayloadsAndReturnError:");
}

id objc_msgSend_communicationServiceRules(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "communicationServiceRules");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_compare_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:options:");
}

id objc_msgSend_complete(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "complete");
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "components:fromDate:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByCharactersInSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByCharactersInSet:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configuration");
}

id objc_msgSend_configurationDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationDictionary");
}

id objc_msgSend_configurationForProfileManagement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationForProfileManagement");
}

id objc_msgSend_configurationWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationWithError:");
}

id objc_msgSend_confirmInstallation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "confirmInstallation");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_connectionTracker(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionTracker");
}

id objc_msgSend_considerProfilesInstalledDuringBuddyForManagement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "considerProfilesInstalledDuringBuddyForManagement");
}

id objc_msgSend_contactsAccountIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contactsAccountIdentifiers");
}

id objc_msgSend_contactsDomains(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contactsDomains");
}

id objc_msgSend_containsAnyPayloadOfClasses_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsAnyPayloadOfClasses:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsOnlyPayloadsOfClasses_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsOnlyPayloadsOfClasses:");
}

id objc_msgSend_containsPayloadOfClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsPayloadOfClass:");
}

id objc_msgSend_contentFilterUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentFilterUUID");
}

id objc_msgSend_contentMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentMode");
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsOfDirectoryAtPath:error:");
}

id objc_msgSend_convertPayloadWithUUIDToUnknownPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "convertPayloadWithUUIDToUnknownPayload:");
}

id objc_msgSend_coordinateWritingItemAtURL_options_error_byAccessor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coordinateWritingItemAtURL:options:error:byAccessor:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyCarrierBundleLocation_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyCarrierBundleLocation:completion:");
}

id objc_msgSend_copyCarrierBundleValue_key_bundleType_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyCarrierBundleValue:key:bundleType:error:");
}

id objc_msgSend_copyCertificate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyCertificate");
}

id objc_msgSend_copyCertificateRefFromPEMData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyCertificateRefFromPEMData:");
}

id objc_msgSend_copyCertificateRefFromPKCS1Data_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyCertificateRefFromPKCS1Data:");
}

id objc_msgSend_copyCertificateWithPersistentID_useSystemKeychain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyCertificateWithPersistentID:useSystemKeychain:");
}

id objc_msgSend_copyCertificatesWithPersistentIDs_useSystemKeychain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyCertificatesWithPersistentIDs:useSystemKeychain:");
}

id objc_msgSend_copyCertificatesWithPersistentIDs_useSystemKeychain_enforcePersonalPersona_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyCertificatesWithPersistentIDs:useSystemKeychain:enforcePersonalPersona:");
}

id objc_msgSend_copyIdentityImmediatelyWithInteractionClient_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyIdentityImmediatelyWithInteractionClient:outError:");
}

id objc_msgSend_copyIdentityWithPersistentID_useSystemKeychain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyIdentityWithPersistentID:useSystemKeychain:");
}

id objc_msgSend_copyItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyItemAtPath:toPath:error:");
}

id objc_msgSend_copyItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyItemAtURL:toURL:error:");
}

id objc_msgSend_copyManagedConfigurationIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyManagedConfigurationIDs");
}

id objc_msgSend_copySMIMEEncryptionPolicyForAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copySMIMEEncryptionPolicyForAddress:");
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countOfPayloadsOfClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countOfPayloadsOfClass:");
}

id objc_msgSend_createActivationLockBypassCodeWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createActivationLockBypassCodeWithCompletion:");
}

id objc_msgSend_createAndStoreNewActivationLockBypassCodeAndHashIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createAndStoreNewActivationLockBypassCodeAndHashIfNeeded");
}

id objc_msgSend_createConfigurationFromPayload_payloadType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createConfigurationFromPayload:payloadType:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createEnterprisePersonaWithDevicePasscode_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createEnterprisePersonaWithDevicePasscode:error:");
}

id objc_msgSend_createHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createHandler");
}

id objc_msgSend_createMDMUnlockTokenIfNeededWithPasscode_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createMDMUnlockTokenIfNeededWithPasscode:completion:");
}

id objc_msgSend_createOnDisk(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createOnDisk");
}

id objc_msgSend_credential(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "credential");
}

id objc_msgSend_credentialUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "credentialUUID");
}

id objc_msgSend_credentialWithUser_password_persistence_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "credentialWithUser:password:persistence:");
}

id objc_msgSend_csgNetworkIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "csgNetworkIdentifier");
}

id objc_msgSend_currentBatterySaverRestrictions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentBatterySaverRestrictions");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentCalendar");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentLocale");
}

id objc_msgSend_currentPasscodeCompliesWithPolicyFromRestrictions_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentPasscodeCompliesWithPolicyFromRestrictions:outError:");
}

id objc_msgSend_currentProductType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentProductType");
}

id objc_msgSend_currentRestrictions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRestrictions");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_currentTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentTime");
}

id objc_msgSend_currentUnlockScreenType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentUnlockScreenType");
}

id objc_msgSend_currentUnlockSimplePasscodeType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentUnlockSimplePasscodeType");
}

id objc_msgSend_currentUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentUser");
}

id objc_msgSend_currentUserConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentUserConnection");
}

id objc_msgSend_daAccountSubclassWithBackingAccountInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "daAccountSubclassWithBackingAccountInfo:");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_dataEncoding(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataEncoding");
}

id objc_msgSend_dataFromCMSEncodedData_outSignerCertificates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataFromCMSEncodedData:outSignerCertificates:");
}

id objc_msgSend_dataFromService_account_label_description_useSystemKeychain_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataFromService:account:label:description:useSystemKeychain:outError:");
}

id objc_msgSend_dataProvider(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataProvider");
}

id objc_msgSend_dataSetName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataSetName");
}

id objc_msgSend_dataTaskWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataTaskWithRequest:completionHandler:");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfFile:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_dataclassActionsForAccountDeletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataclassActionsForAccountDeletion:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_dateFromComponents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateFromComponents:");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "day");
}

id objc_msgSend_debugRescheduleBackgroundActivity_startDate_gracePeriod_repeatingInterval_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "debugRescheduleBackgroundActivity:startDate:gracePeriod:repeatingInterval:completion:");
}

id objc_msgSend_declarations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "declarations");
}

id objc_msgSend_defaultAppBundleIDForCommunicationServiceType_forAccountWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultAppBundleIDForCommunicationServiceType:forAccountWithIdentifier:");
}

id objc_msgSend_defaultAppBundleIDForCommunicationServiceType_forAccountWithIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultAppBundleIDForCommunicationServiceType:forAccountWithIdentifier:completion:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultCredentialForProtectionSpace_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCredentialForProtectionSpace:");
}

id objc_msgSend_defaultMDMOptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultMDMOptions");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultRestrictions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultRestrictions");
}

id objc_msgSend_defaultSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultSettings");
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultStore");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_defaultsForDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultsForDomain:");
}

id objc_msgSend_deliveryAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deliveryAccount");
}

id objc_msgSend_dependentsOfParent_inDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dependentsOfParent:inDomain:");
}

id objc_msgSend_dependentsOfParent_inSystemDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dependentsOfParent:inSystemDomain:");
}

id objc_msgSend_dependentsOfParent_inUserDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dependentsOfParent:inUserDomain:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_destinationsWithPasswords(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "destinationsWithPasswords");
}

id objc_msgSend_details(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "details");
}

id objc_msgSend_deviceAttributes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceAttributes");
}

id objc_msgSend_deviceHasMultipleUsers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceHasMultipleUsers");
}

id objc_msgSend_deviceID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceID");
}

id objc_msgSend_deviceIsSupervisedError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceIsSupervisedError");
}

id objc_msgSend_deviceLockedError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceLockedError");
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceName");
}

id objc_msgSend_deviceNotSupervisedError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceNotSupervisedError");
}

id objc_msgSend_deviceSupervisionRequiredForPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceSupervisionRequiredForPayload:");
}

id objc_msgSend_deviceUDID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceUDID");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfURL:error:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didBeginInstallingNextProfileData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didBeginInstallingNextProfileData:");
}

id objc_msgSend_didEnrollInMDMWithPasscode_duringMigration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didEnrollInMDMWithPasscode:duringMigration:");
}

id objc_msgSend_didFinishInstallationWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didFinishInstallationWithIdentifier:error:");
}

id objc_msgSend_didInstallOldGlobalRestrictions_newGlobalRestrictions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didInstallOldGlobalRestrictions:newGlobalRestrictions:");
}

id objc_msgSend_didPasscodePolicyChangeWithOldRestrictions_newRestrictions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didPasscodePolicyChangeWithOldRestrictions:newRestrictions:");
}

id objc_msgSend_didRemoveOldGlobalRestrictions_newGlobalRestrictions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didRemoveOldGlobalRestrictions:newGlobalRestrictions:");
}

id objc_msgSend_didSuperviseThroughConfigurator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didSuperviseThroughConfigurator");
}

id objc_msgSend_didUnenrollFromMDM(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didUnenrollFromMDM");
}

id objc_msgSend_didUpdateStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didUpdateStatus:");
}

id objc_msgSend_directoryURLString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "directoryURLString");
}

id objc_msgSend_disableAssociationMACRandomization(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableAssociationMACRandomization");
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayName");
}

id objc_msgSend_displayUserNotificationWithIdentifier_title_message_defaultButtonText_alternateButtonText_otherButtonText_textfieldPlaceholder_displayOnLockScreen_dismissOnLock_displayInAppWhitelistModes_dismissAfterTimeInterval_assertion_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayUserNotificationWithIdentifier:title:message:defaultButtonText:alternateButtonText:otherButtonText:textfieldPlaceholder:displayOnLockScreen:dismissOnLock:displayInAppWhitelistModes:dismissAfterTimeInterval:assertion:completionBlock:");
}

id objc_msgSend_displayedOperatorName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayedOperatorName");
}

id objc_msgSend_dmc_altDSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dmc_altDSID");
}

id objc_msgSend_dmc_remoteManagementAccountForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dmc_remoteManagementAccountForIdentifier:");
}

id objc_msgSend_dmc_remoteManagementAccountForManagementProfileIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dmc_remoteManagementAccountForManagementProfileIdentifier:");
}

id objc_msgSend_dmc_removeMAIDRelatedAccountsWithAltDSID_asynchronous_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dmc_removeMAIDRelatedAccountsWithAltDSID:asynchronous:");
}

id objc_msgSend_dmc_updateAppleAccountWithPersonaID_error_updateBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dmc_updateAppleAccountWithPersonaID:error:updateBlock:");
}

id objc_msgSend_dnsProxyUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dnsProxyUUID");
}

id objc_msgSend_doMCICDidBeginInstallingNextProfileData_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doMCICDidBeginInstallingNextProfileData:completion:");
}

id objc_msgSend_doMCICDidFinishInstallationWithIdentifier_error_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doMCICDidFinishInstallationWithIdentifier:error:completion:");
}

id objc_msgSend_doMCICDidFinishPreflightWithError_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doMCICDidFinishPreflightWithError:completion:");
}

id objc_msgSend_doMCICDidRequestCurrentPasscodeWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doMCICDidRequestCurrentPasscodeWithCompletion:");
}

id objc_msgSend_doMCICDidRequestMAIDSignIn_personaID_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doMCICDidRequestMAIDSignIn:personaID:completion:");
}

id objc_msgSend_doMCICDidRequestManagedRestoreWithManagedAppleID_personaID_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doMCICDidRequestManagedRestoreWithManagedAppleID:personaID:completion:");
}

id objc_msgSend_doMCICDidRequestShowUserWarnings_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doMCICDidRequestShowUserWarnings:completion:");
}

id objc_msgSend_doMCICDidRequestUserInput_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doMCICDidRequestUserInput:completion:");
}

id objc_msgSend_doMCICDidUpdateStatus_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doMCICDidUpdateStatus:completion:");
}

id objc_msgSend_doMCICWaitForEnrollmentToFinishWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doMCICWaitForEnrollmentToFinishWithCompletion:");
}

id objc_msgSend_doesSigningAllowReplacementWithProfile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doesSigningAllowReplacementWithProfile:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_domainName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domainName");
}

id objc_msgSend_domainRules(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domainRules");
}

id objc_msgSend_domains(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domains");
}

id objc_msgSend_doubleForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleForKey:");
}

id objc_msgSend_eapClientConfig(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eapClientConfig");
}

id objc_msgSend_eapClientConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eapClientConfiguration");
}

id objc_msgSend_earlierDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "earlierDate:");
}

id objc_msgSend_earliestExpiryDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "earliestExpiryDate");
}

id objc_msgSend_earliestRequiredManagedAppValidationDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "earliestRequiredManagedAppValidationDate");
}

id objc_msgSend_earlistProfileEventExpiry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "earlistProfileEventExpiry");
}

id objc_msgSend_easEnrollmentID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "easEnrollmentID");
}

id objc_msgSend_effectiveBoolValueForSetting_pairingID_pairingDataStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveBoolValueForSetting:pairingID:pairingDataStore:");
}

id objc_msgSend_effectiveBoolValueForWatchSetting_pairingID_pairingDataStore_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveBoolValueForWatchSetting:pairingID:pairingDataStore:completion:");
}

id objc_msgSend_effectiveIntersectionValuesForSetting_pairingID_pairingDataStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveIntersectionValuesForSetting:pairingID:pairingDataStore:");
}

id objc_msgSend_effectiveRestrictedBoolForSetting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveRestrictedBoolForSetting:");
}

id objc_msgSend_effectiveUnionValuesForSetting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveUnionValuesForSetting:");
}

id objc_msgSend_effectiveUnionValuesForSetting_pairingID_pairingDataStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveUnionValuesForSetting:pairingID:pairingDataStore:");
}

id objc_msgSend_effectiveUserSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveUserSettings");
}

id objc_msgSend_effectiveValueForSetting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveValueForSetting:");
}

id objc_msgSend_effectiveValueForSetting_pairingID_pairingDataStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveValueForSetting:pairingID:pairingDataStore:");
}

id objc_msgSend_effectiveValueForWatchSetting_pairingID_pairingDataStore_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveValueForWatchSetting:pairingID:pairingDataStore:completion:");
}

id objc_msgSend_effectiveValuesForWatchIntersectionSetting_pairingID_pairingDataStore_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveValuesForWatchIntersectionSetting:pairingID:pairingDataStore:completion:");
}

id objc_msgSend_effectiveValuesForWatchUnionSetting_pairingID_pairingDataStore_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveValuesForWatchUnionSetting:pairingID:pairingDataStore:completion:");
}

id objc_msgSend_emailAccountDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "emailAccountDescription");
}

id objc_msgSend_emailAccountName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "emailAccountName");
}

id objc_msgSend_emailAccountType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "emailAccountType");
}

id objc_msgSend_emailAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "emailAddress");
}

id objc_msgSend_embeddedCertificate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "embeddedCertificate");
}

id objc_msgSend_embeddedCertificateName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "embeddedCertificateName");
}

id objc_msgSend_embeddedCertificatePassword(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "embeddedCertificatePassword");
}

id objc_msgSend_enableAlwaysOnVpn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableAlwaysOnVpn");
}

id objc_msgSend_enableCalendars(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableCalendars");
}

id objc_msgSend_enableCalendarsUserOverridable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableCalendarsUserOverridable");
}

id objc_msgSend_enableContacts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableContacts");
}

id objc_msgSend_enableContactsUserOverridable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableContactsUserOverridable");
}

id objc_msgSend_enableMail(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableMail");
}

id objc_msgSend_enableMailUserOverridable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableMailUserOverridable");
}

id objc_msgSend_enableNRStandalone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableNRStandalone");
}

id objc_msgSend_enableNotes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableNotes");
}

id objc_msgSend_enableNotesUserOverridable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableNotesUserOverridable");
}

id objc_msgSend_enableReminders(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableReminders");
}

id objc_msgSend_enableRemindersUserOverridable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableRemindersUserOverridable");
}

id objc_msgSend_encryptionType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encryptionType");
}

id objc_msgSend_enforcedAppWhitelistRestrictions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enforcedAppWhitelistRestrictions");
}

id objc_msgSend_enforcedRestrictionsForBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enforcedRestrictionsForBundleID:");
}

id objc_msgSend_enforcedRestrictionsForBundleID_countryCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enforcedRestrictionsForBundleID:countryCode:");
}

id objc_msgSend_enforcedRestrictionsForBundleID_restrictionPlistURL_countryCodes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enforcedRestrictionsForBundleID:restrictionPlistURL:countryCodes:");
}

id objc_msgSend_enrollmentController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enrollmentController");
}

id objc_msgSend_enrollmentFlowController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enrollmentFlowController");
}

id objc_msgSend_enrollmentFlowControllerWithPresenter_managedConfigurationHelper_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enrollmentFlowControllerWithPresenter:managedConfigurationHelper:");
}

id objc_msgSend_enrollmentID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enrollmentID");
}

id objc_msgSend_enrollmentIdentityPersistentID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enrollmentIdentityPersistentID");
}

id objc_msgSend_enrollmentMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enrollmentMode");
}

id objc_msgSend_enterprisePersonaIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enterprisePersonaIdentifier");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumeratorAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorAtPath:");
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ephemeralSessionConfiguration");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_esso_URLs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "esso_URLs");
}

id objc_msgSend_esso_deniedBundleIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "esso_deniedBundleIdentifiers");
}

id objc_msgSend_esso_extensionData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "esso_extensionData");
}

id objc_msgSend_esso_extensionIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "esso_extensionIdentifier");
}

id objc_msgSend_esso_hosts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "esso_hosts");
}

id objc_msgSend_esso_realm(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "esso_realm");
}

id objc_msgSend_esso_screenLockedBehavior(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "esso_screenLockedBehavior");
}

id objc_msgSend_esso_teamIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "esso_teamIdentifier");
}

id objc_msgSend_esso_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "esso_type");
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_exceptionsDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exceptionsDictionary");
}

id objc_msgSend_excludedDomains(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "excludedDomains");
}

id objc_msgSend_existingProfileContainingPayloadClass_excludingProfileIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "existingProfileContainingPayloadClass:excludingProfileIdentifier:");
}

id objc_msgSend_existingProfileContainingPayloadClass_inProfilesWithFilterFlags_excludingProfileIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "existingProfileContainingPayloadClass:inProfilesWithFilterFlags:excludingProfileIdentifier:");
}

id objc_msgSend_explicitlyRestrictedAppsBySetting(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "explicitlyRestrictedAppsBySetting");
}

id objc_msgSend_extendedKeyUsage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extendedKeyUsage");
}

id objc_msgSend_faceTimeSignInAttemptDidFinish(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "faceTimeSignInAttemptDidFinish");
}

id objc_msgSend_featureFlagsConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "featureFlagsConfiguration");
}

id objc_msgSend_fetchConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchConfiguration:");
}

id objc_msgSend_fetchConfigurationWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchConfigurationWithCompletionBlock:");
}

id objc_msgSend_fetchDirtyPersonaIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchDirtyPersonaIDs");
}

id objc_msgSend_fetchFinalProfileWithClient_outProfileData_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchFinalProfileWithClient:outProfileData:outError:");
}

id objc_msgSend_fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion:");
}

id objc_msgSend_fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken:completion:");
}

id objc_msgSend_fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileManager");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_filterType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterType");
}

id objc_msgSend_filterUserSettingsForPublicUse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterUserSettingsForPublicUse:");
}

id objc_msgSend_filterUsingPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterUsingPredicate:");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_finalizeCloudConfigurationOutError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finalizeCloudConfigurationOutError:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatValue");
}

id objc_msgSend_followUpController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "followUpController");
}

id objc_msgSend_fontData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fontData");
}

id objc_msgSend_friendlyName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "friendlyName");
}

id objc_msgSend_fullScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fullScreen");
}

id objc_msgSend_generateSalt(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateSalt");
}

id objc_msgSend_generateSelfSignedCertificatePublicKey_privateKey_keyUsage_extendedKeyUsage_lifetime_outCert_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateSelfSignedCertificatePublicKey:privateKey:keyUsage:extendedKeyUsage:lifetime:outCert:");
}

id objc_msgSend_geofenceId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "geofenceId");
}

id objc_msgSend_geofenceList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "geofenceList");
}

id objc_msgSend_getAllDevicesWithArchivedAltAccountDevicesMatching_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAllDevicesWithArchivedAltAccountDevicesMatching:");
}

id objc_msgSend_getCertificatesForConfigurationWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCertificatesForConfigurationWithIdentifier:");
}

id objc_msgSend_getConfigurationIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getConfigurationIdentifier");
}

id objc_msgSend_getPendingCertificateInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPendingCertificateInfo:");
}

id objc_msgSend_getPreferredDataSubscriptionContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPreferredDataSubscriptionContext:");
}

id objc_msgSend_getPreprocessedPayloadContents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPreprocessedPayloadContents");
}

id objc_msgSend_getProtectedConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getProtectedConfiguration");
}

id objc_msgSend_getSIMStatus_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSIMStatus:completion:");
}

id objc_msgSend_getUUIDBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getUUIDBytes:");
}

id objc_msgSend_getWatchPairingTokenForPhoneID_watchID_securityToken_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getWatchPairingTokenForPhoneID:watchID:securityToken:outError:");
}

id objc_msgSend_globalManagedPreferencesDomain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "globalManagedPreferencesDomain");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handlerWithProfileHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handlerWithProfileHandler:");
}

id objc_msgSend_hasCertificate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasCertificate");
}

id objc_msgSend_hasMAIDCredential(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasMAIDCredential");
}

id objc_msgSend_hasManagedAccountOfDataclasses_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasManagedAccountOfDataclasses:");
}

id objc_msgSend_hasSEP(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSEP");
}

id objc_msgSend_hashDictionaries(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hashDictionaries");
}

id objc_msgSend_hashForPasscode_usingMethod_salt_customIterations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hashForPasscode:usingMethod:salt:customIterations:");
}

id objc_msgSend_holdAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "holdAssertion");
}

id objc_msgSend_homeScreenLayoutFilePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "homeScreenLayoutFilePath");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "host");
}

id objc_msgSend_hostname(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hostname");
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hour");
}

id objc_msgSend_hrnRequiredPayloads(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hrnRequiredPayloads");
}

id objc_msgSend_humanReadableName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "humanReadableName");
}

id objc_msgSend_iCloudEnrollmentID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iCloudEnrollmentID");
}

id objc_msgSend_iconData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iconData");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_identifiersOfInstalledProfilesWithFilterFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifiersOfInstalledProfilesWithFilterFlags:");
}

id objc_msgSend_identifiersOfProfilesWithFilterFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifiersOfProfilesWithFilterFlags:");
}

id objc_msgSend_identityPersistentID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identityPersistentID");
}

id objc_msgSend_identityUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identityUUID");
}

id objc_msgSend_ignoreManifestScope(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ignoreManifestScope");
}

id objc_msgSend_imageWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWithData:");
}

id objc_msgSend_inSharediPadUserSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inSharediPadUserSession");
}

id objc_msgSend_incomingMailServerAuthentication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "incomingMailServerAuthentication");
}

id objc_msgSend_incomingMailServerHostname(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "incomingMailServerHostname");
}

id objc_msgSend_incomingMailServerIMAPPathPrefix(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "incomingMailServerIMAPPathPrefix");
}

id objc_msgSend_incomingMailServerPortNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "incomingMailServerPortNumber");
}

id objc_msgSend_incomingMailServerUseSSL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "incomingMailServerUseSSL");
}

id objc_msgSend_incomingMailServerUsername(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "incomingMailServerUsername");
}

id objc_msgSend_incomingPassword(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "incomingPassword");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexesOfObjectsPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexesOfObjectsPassingTest:");
}

id objc_msgSend_ingestedConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ingestedConfiguration");
}

id objc_msgSend_initFileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initFileURLWithPath:isDirectory:");
}

id objc_msgSend_initWithAccount_policyKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAccount:policyKey:");
}

id objc_msgSend_initWithAccountStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAccountStore:");
}

id objc_msgSend_initWithAccountType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAccountType:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithBundleType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleType:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithClientIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithClientIdentifier:");
}

id objc_msgSend_initWithCondition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCondition:");
}

id objc_msgSend_initWithContentsOfPayload_profile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentsOfPayload:profile:");
}

id objc_msgSend_initWithContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContext:");
}

id objc_msgSend_initWithContextData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContextData:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDataProvider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDataProvider:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithDictionary_path_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:path:");
}

id objc_msgSend_initWithDomain_pairingID_pairingDataStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDomain:pairingID:pairingDataStore:");
}

id objc_msgSend_initWithFireDate_interval_repeats_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFireDate:interval:repeats:block:");
}

id objc_msgSend_initWithIdentifier_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:description:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithName_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:value:");
}

id objc_msgSend_initWithOAuth2Token_refreshToken_expiryDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOAuth2Token:refreshToken:expiryDate:");
}

id objc_msgSend_initWithPassword_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPassword:");
}

id objc_msgSend_initWithPayload_profileHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPayload:profileHandler:");
}

id objc_msgSend_initWithPersistentAccount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPersistentAccount:");
}

id objc_msgSend_initWithProcessName_connectionThreshold_requestThreshold_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithProcessName:connectionThreshold:requestThreshold:");
}

id objc_msgSend_initWithProxyHost_port_type_realm_authenticationMethod_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithProxyHost:port:type:realm:authenticationMethod:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithReason:");
}

id objc_msgSend_initWithSerializableDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSerializableDictionary:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTarget:selector:object:");
}

id objc_msgSend_initWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTimeIntervalSinceNow:");
}

id objc_msgSend_initWithURL_method_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:method:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithValidationQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithValidationQueue:");
}

id objc_msgSend_initWithXPCClientConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithXPCClientConnection:");
}

id objc_msgSend_insertAccountType_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertAccountType:withCompletionHandler:");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_installOptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installOptions");
}

id objc_msgSend_installPrivateNetworkProfile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installPrivateNetworkProfile:");
}

id objc_msgSend_installProfile_declarations_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installProfile:declarations:completionHandler:");
}

id objc_msgSend_installProfileData_interactionClient_options_source_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installProfileData:interactionClient:options:source:completion:");
}

id objc_msgSend_installProfileData_interactive_options_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installProfileData:interactive:options:completion:");
}

id objc_msgSend_installProfileData_options_interactionClient_source_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installProfileData:options:interactionClient:source:outError:");
}

id objc_msgSend_installProvisioningProfileData_managingProfileIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installProvisioningProfileData:managingProfileIdentifier:completion:");
}

id objc_msgSend_installService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installService:");
}

id objc_msgSend_installType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installType");
}

id objc_msgSend_installWithInstaller_options_interactionClient_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installWithInstaller:options:interactionClient:outError:");
}

id objc_msgSend_installationWarnings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installationWarnings");
}

id objc_msgSend_installedACAccounts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installedACAccounts");
}

id objc_msgSend_installedAccountWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installedAccountWithIdentifier:");
}

id objc_msgSend_installedMDMProfile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installedMDMProfile");
}

id objc_msgSend_installedProfileWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installedProfileWithIdentifier:");
}

id objc_msgSend_installedSystemProfileWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installedSystemProfileWithIdentifier:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interactionClient_didRequestPreflightUserInputResponses_forPayloadIndex_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interactionClient:didRequestPreflightUserInputResponses:forPayloadIndex:outError:");
}

id objc_msgSend_internalError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "internalError");
}

id objc_msgSend_internalErrorWithCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "internalErrorWithCode:");
}

id objc_msgSend_internalErrorWithCode_underlyingError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "internalErrorWithCode:underlyingError:");
}

id objc_msgSend_internalErrorWithUnderlyingError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "internalErrorWithUnderlyingError:");
}

id objc_msgSend_intersectSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intersectSet:");
}

id objc_msgSend_intersectedValuesForFeature_withRestrictionsDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intersectedValuesForFeature:withRestrictionsDictionary:");
}

id objc_msgSend_intersectedValuesSetting_valueChangedBetweenOldSettings_andNewSettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intersectedValuesSetting:valueChangedBetweenOldSettings:andNewSettings:");
}

id objc_msgSend_intersectedValuesSettingForFeature_withUserSettingDectionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intersectedValuesSettingForFeature:withUserSettingDectionary:");
}

id objc_msgSend_intersectionFeaturesWithPayloadRestictionKeyAlias(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intersectionFeaturesWithPayloadRestictionKeyAlias");
}

id objc_msgSend_intersectionPayloadRestrictionKeysForFeature_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intersectionPayloadRestrictionKeysForFeature:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidateCache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateCache");
}

id objc_msgSend_isAuthorizedForOperation_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAuthorizedForOperation:completion:");
}

id objc_msgSend_isBoolSettingLockedDownByRestrictions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBoolSettingLockedDownByRestrictions:");
}

id objc_msgSend_isBundleBlocked_outHash_outHashType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBundleBlocked:outHash:outHashType:");
}

id objc_msgSend_isCertificateReference_aliasedInDependencyManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCertificateReference:aliasedInDependencyManager:");
}

id objc_msgSend_isCloudLocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCloudLocked");
}

id objc_msgSend_isCloudLockedProfileWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCloudLockedProfileWithIdentifier:");
}

id objc_msgSend_isConsideredTheSame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isConsideredTheSame:");
}

id objc_msgSend_isDestructive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDestructive");
}

id objc_msgSend_isDeviceLocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDeviceLocked");
}

id objc_msgSend_isDeviceUnlocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDeviceUnlocked");
}

id objc_msgSend_isEnabledForDataclass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEnabledForDataclass:");
}

id objc_msgSend_isEncrypted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEncrypted");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToArray:");
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToData:");
}

id objc_msgSend_isEqualToDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToDictionary:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToSet:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFirstAutoJoinRestricted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFirstAutoJoinRestricted");
}

id objc_msgSend_isFullyTrustedRootCert(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFullyTrustedRootCert");
}

id objc_msgSend_isHRNMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isHRNMode");
}

id objc_msgSend_isHardwareBound(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isHardwareBound");
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isHidden");
}

id objc_msgSend_isHomePodAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isHomePodAvailable");
}

id objc_msgSend_isHotspot(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isHotspot");
}

id objc_msgSend_isIdentity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isIdentity");
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInstalled");
}

id objc_msgSend_isInstalled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInstalled:");
}

id objc_msgSend_isInstalledForSystem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInstalledForSystem");
}

id objc_msgSend_isInstalledForUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInstalledForUser");
}

id objc_msgSend_isInteractiveProfileInstallationAllowedBySDP_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInteractiveProfileInstallationAllowedBySDP:completion:");
}

id objc_msgSend_isLocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLocked");
}

id objc_msgSend_isLoginUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLoginUser");
}

id objc_msgSend_isMDMClientIdentity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMDMClientIdentity");
}

id objc_msgSend_isMDMProfile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMDMProfile");
}

id objc_msgSend_isMailDropEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMailDropEnabled");
}

id objc_msgSend_isManagedByMDM(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isManagedByMDM");
}

id objc_msgSend_isOpenInRestrictionInEffect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isOpenInRestrictionInEffect");
}

id objc_msgSend_isPasscodeCompliantWithNamedPolicy_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPasscodeCompliantWithNamedPolicy:completion:");
}

id objc_msgSend_isPasscodeCompliantWithNamedPolicy_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPasscodeCompliantWithNamedPolicy:outError:");
}

id objc_msgSend_isPasscodeRecoveryRestricted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPasscodeRecoveryRestricted");
}

id objc_msgSend_isPasscodeSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPasscodeSet");
}

id objc_msgSend_isRecentsSyncingDisabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRecentsSyncingDisabled");
}

id objc_msgSend_isRemovable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRemovable");
}

id objc_msgSend_isRoot(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRoot");
}

id objc_msgSend_isServiceProviderRoamingEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isServiceProviderRoamingEnabled");
}

id objc_msgSend_isSetAside(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSetAside");
}

id objc_msgSend_isSharedIPad(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSharedIPad");
}

id objc_msgSend_isSharediPad(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSharediPad");
}

id objc_msgSend_isSigned(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSigned");
}

id objc_msgSend_isStub(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isStub");
}

id objc_msgSend_isSubsetOfSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSubsetOfSet:");
}

id objc_msgSend_isSupervised(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSupervised");
}

id objc_msgSend_isSupportedByWatchVersions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSupportedByWatchVersions:");
}

id objc_msgSend_isTeslaEnrolled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTeslaEnrolled");
}

id objc_msgSend_isUserEnrollment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isUserEnrollment");
}

id objc_msgSend_isUserEnrollmentProfile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isUserEnrollmentProfile");
}

id objc_msgSend_isVisionDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isVisionDevice");
}

id objc_msgSend_isVisionProfileEnrollEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isVisionProfileEnrollEnabled");
}

id objc_msgSend_isWEP(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isWEP");
}

id objc_msgSend_isWPA(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isWPA");
}

id objc_msgSend_isWebContentFilterUIActiveWithRestrictionDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isWebContentFilterUIActiveWithRestrictionDictionary:");
}

id objc_msgSend_kerberosInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "kerberosInfo");
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyEnumerator");
}

id objc_msgSend_keySize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keySize");
}

id objc_msgSend_keyType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyType");
}

id objc_msgSend_keyUsage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyUsage");
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "label");
}

id objc_msgSend_lacksArrayEntitlementError_withMemberString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lacksArrayEntitlementError:withMemberString:");
}

id objc_msgSend_lacksBooleanEntitlementError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lacksBooleanEntitlementError:");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_laterDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "laterDate:");
}

id objc_msgSend_latitude(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "latitude");
}

id objc_msgSend_layout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layout");
}

id objc_msgSend_leaderPayloadCertificateAnchorPersistentID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leaderPayloadCertificateAnchorPersistentID");
}

id objc_msgSend_leaderPayloadCertificateAnchorUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leaderPayloadCertificateAnchorUUID");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_lifetime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lifetime");
}

id objc_msgSend_loadConfigurationsForceReloadFromDisk(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadConfigurationsForceReloadFromDisk");
}

id objc_msgSend_loadMailAccountsWithAuditToken_filteringEnabled_sourceAccountManagement_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadMailAccountsWithAuditToken:filteringEnabled:sourceAccountManagement:completion:");
}

id objc_msgSend_localSecretChangedTo_secretType_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localSecretChangedTo:secretType:completion:");
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localeIdentifier");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedDescriptionOfPasscodePolicyFromRestrictions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescriptionOfPasscodePolicyFromRestrictions:");
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedName");
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lock");
}

id objc_msgSend_lockConfigurations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockConfigurations");
}

id objc_msgSend_lockWhenCondition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockWhenCondition:");
}

id objc_msgSend_loggingID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loggingID");
}

id objc_msgSend_loggingPayload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loggingPayload");
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longValue");
}

id objc_msgSend_longitude(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longitude");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_machineInfoWithKeys_challenge_identity_additionalInfo_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "machineInfoWithKeys:challenge:identity:additionalInfo:outError:");
}

id objc_msgSend_machineInfoWithKeys_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "machineInfoWithKeys:outError:");
}

id objc_msgSend_mailAccountIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mailAccountIdentifiers");
}

id objc_msgSend_mailAccounts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mailAccounts");
}

id objc_msgSend_mailDomains(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mailDomains");
}

id objc_msgSend_mailNumberOfPastDaysToSync(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mailNumberOfPastDaysToSync");
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_managedAppChangeNotificationToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managedAppChangeNotificationToken");
}

id objc_msgSend_managedAppleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managedAppleID");
}

id objc_msgSend_managedAppleIDName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managedAppleIDName");
}

id objc_msgSend_managedPreferencesForDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managedPreferencesForDomain:");
}

id objc_msgSend_managedServiceIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managedServiceIDs");
}

id objc_msgSend_managedSystemConfigurationServiceIDsWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managedSystemConfigurationServiceIDsWithCompletion:");
}

id objc_msgSend_managedWiFiNetworkNames(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managedWiFiNetworkNames");
}

id objc_msgSend_managedWiFiNetworkNamesWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managedWiFiNetworkNamesWithCompletion:");
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manager");
}

id objc_msgSend_managingOrganizationInformationWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managingOrganizationInformationWithCompletion:");
}

id objc_msgSend_markAllPropertiesDirty(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "markAllPropertiesDirty");
}

id objc_msgSend_markIfUpdatingOverInstalledAccount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "markIfUpdatingOverInstalledAccount:");
}

id objc_msgSend_markStoredProfileAsInstalledWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "markStoredProfileAsInstalledWithCompletion:");
}

id objc_msgSend_marketingVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "marketingVersion");
}

id objc_msgSend_mayChangePasscode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mayChangePasscode");
}

id objc_msgSend_mayInstallWithOptions_hasInteractionClient_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mayInstallWithOptions:hasInteractionClient:outError:");
}

id objc_msgSend_mayOpenFromManagedToUnmanaged(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mayOpenFromManagedToUnmanaged");
}

id objc_msgSend_mayOpenFromUnmanagedToManaged(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mayOpenFromUnmanagedToManaged");
}

id objc_msgSend_mayShareToAirDropForOriginatingAppBundleID_originatingAccountIsManaged_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mayShareToAirDropForOriginatingAppBundleID:originatingAccountIsManaged:completion:");
}

id objc_msgSend_mayShareToMessagesForOriginatingAppBundleID_originatingAccountIsManaged_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mayShareToMessagesForOriginatingAppBundleID:originatingAccountIsManaged:completion:");
}

id objc_msgSend_mcAccountIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mcAccountIdentifier");
}

id objc_msgSend_mcConfigurationProfileIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mcConfigurationProfileIdentifier");
}

id objc_msgSend_mcPayloadUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mcPayloadUUID");
}

id objc_msgSend_mcProfileUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mcProfileUUID");
}

id objc_msgSend_mc_userPasscodeTypeWithUnlockScreenType_simplePasscodeType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mc_userPasscodeTypeWithUnlockScreenType:simplePasscodeType:");
}

id objc_msgSend_mdmAdoptablePayloads(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mdmAdoptablePayloads");
}

id objc_msgSend_memberPayloadCertificateAnchorPersistentID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberPayloadCertificateAnchorPersistentID");
}

id objc_msgSend_memberPayloadCertificateAnchorUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberPayloadCertificateAnchorUUID");
}

id objc_msgSend_memberQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueue");
}

id objc_msgSend_memberQueueAddDependent_toParent_inDomain_toSystem_user_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueAddDependent:toParent:inDomain:toSystem:user:");
}

id objc_msgSend_memberQueueAddOrphanParent_inDomain_toSystem_user_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueAddOrphanParent:inDomain:toSystem:user:");
}

id objc_msgSend_memberQueueAppsAndOptionsForClientUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueAppsAndOptionsForClientUUID:");
}

id objc_msgSend_memberQueueCacheClientRestrictionPasscodeCompliance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueCacheClientRestrictionPasscodeCompliance");
}

id objc_msgSend_memberQueueCheckPasscodeCompliesWithCurrentRestrictions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueCheckPasscodeCompliesWithCurrentRestrictions");
}

id objc_msgSend_memberQueueCheckPasscodeCompliesWithProfileRestrictions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueCheckPasscodeCompliesWithProfileRestrictions");
}

id objc_msgSend_memberQueueClearAllPasscodeComplianceCaches(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueClearAllPasscodeComplianceCaches");
}

id objc_msgSend_memberQueueClearPasscodeHistoryIfNecessary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueClearPasscodeHistoryIfNecessary");
}

id objc_msgSend_memberQueueClearProfileRestrictionPasscodeComplianceCache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueClearProfileRestrictionPasscodeComplianceCache");
}

id objc_msgSend_memberQueueClearRestrictionPasscodeComplianceCache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueClearRestrictionPasscodeComplianceCache");
}

id objc_msgSend_memberQueueClientRestrictionsForClientUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueClientRestrictionsForClientUUID:");
}

id objc_msgSend_memberQueueClientTypeForClientUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueClientTypeForClientUUID:");
}

id objc_msgSend_memberQueueCombinedSystemProfileRestrictions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueCombinedSystemProfileRestrictions");
}

id objc_msgSend_memberQueueCommitClientRestrictionsToDisk(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueCommitClientRestrictionsToDisk");
}

id objc_msgSend_memberQueueCommitEffectiveUserSettingsToDiskOldEffectiveUserSettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueCommitEffectiveUserSettingsToDiskOldEffectiveUserSettings:");
}

id objc_msgSend_memberQueueCommitRestrictionsToDisk(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueCommitRestrictionsToDisk");
}

id objc_msgSend_memberQueueCommitUserSettingsToDisk(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueCommitUserSettingsToDisk");
}

id objc_msgSend_memberQueueDependentsOfParent_inSystemDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueDependentsOfParent:inSystemDomain:");
}

id objc_msgSend_memberQueueDependentsOfParent_inUserDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueDependentsOfParent:inUserDomain:");
}

id objc_msgSend_memberQueueEffectiveUserSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueEffectiveUserSettings");
}

id objc_msgSend_memberQueueHasActivationRecordChangesPending(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueHasActivationRecordChangesPending");
}

id objc_msgSend_memberQueueHasMigrated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueHasMigrated");
}

id objc_msgSend_memberQueueIsPasscodeComplianceMandatoryWithOutLocalizedWarning_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueIsPasscodeComplianceMandatoryWithOutLocalizedWarning:");
}

id objc_msgSend_memberQueueManagingProfileIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueManagingProfileIdentifier");
}

id objc_msgSend_memberQueueMarkToClearPasscodeComplianceCacheWithOldSystemClientRestrictions_newSystemClientRestrictions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueMarkToClearPasscodeComplianceCacheWithOldSystemClientRestrictions:newSystemClientRestrictions:");
}

id objc_msgSend_memberQueueOrganizationInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueOrganizationInfo");
}

id objc_msgSend_memberQueueOrphanedParentsInSystemDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueOrphanedParentsInSystemDomain:");
}

id objc_msgSend_memberQueueOrphanedParentsInUserDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueOrphanedParentsInUserDomain:");
}

id objc_msgSend_memberQueueOverridingRestrictionClientUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueOverridingRestrictionClientUUID");
}

id objc_msgSend_memberQueuePasscodeCompliesWithProfileRestrictions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueuePasscodeCompliesWithProfileRestrictions");
}

id objc_msgSend_memberQueuePasscodeCompliesWithRestrictions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueuePasscodeCompliesWithRestrictions");
}

id objc_msgSend_memberQueueRecomputeEffectiveUserSettingsPasscode_credentialSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueRecomputeEffectiveUserSettingsPasscode:credentialSet:");
}

id objc_msgSend_memberQueueRecomputePasscodeComplianceForClientUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueRecomputePasscodeComplianceForClientUUID");
}

id objc_msgSend_memberQueueRemoveDependent_fromParent_inDomain_fromSystem_user_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueRemoveDependent:fromParent:inDomain:fromSystem:user:");
}

id objc_msgSend_memberQueueRemoveOrphanParent_inDomain_fromSystem_user_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueRemoveOrphanParent:inDomain:fromSystem:user:");
}

id objc_msgSend_memberQueueRestrictions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueRestrictions");
}

id objc_msgSend_memberQueueServerURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueServerURL");
}

id objc_msgSend_memberQueueSetAllClientRestrictions_sender_outRestrictionsChanged_outEffectiveSettingsChanged_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueSetAllClientRestrictions:sender:outRestrictionsChanged:outEffectiveSettingsChanged:outError:");
}

id objc_msgSend_memberQueueSetParametersForSettingsByType_configurationUUID_toSystem_user_passcode_credentialSet_sender_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueSetParametersForSettingsByType:configurationUUID:toSystem:user:passcode:credentialSet:sender:");
}

id objc_msgSend_memberQueueSetSystemClientRestrictions_userClientRestrictions_sender_outRestrictionsChanged_outEffectiveSettingsChanged_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueSetSystemClientRestrictions:userClientRestrictions:sender:outRestrictionsChanged:outEffectiveSettingsChanged:outError:");
}

id objc_msgSend_memberQueueSettingsEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueSettingsEvents");
}

id objc_msgSend_memberQueueSystemClientRestrictions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueSystemClientRestrictions");
}

id objc_msgSend_memberQueueSystemDomainsDict(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueSystemDomainsDict");
}

id objc_msgSend_memberQueueSystemNamespacedUserSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueSystemNamespacedUserSettings");
}

id objc_msgSend_memberQueueSystemOrphansDict(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueSystemOrphansDict");
}

id objc_msgSend_memberQueueSystemProfileRestrictions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueSystemProfileRestrictions");
}

id objc_msgSend_memberQueueSystemUserSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueSystemUserSettings");
}

id objc_msgSend_memberQueueUserClientRestrictions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueUserClientRestrictions");
}

id objc_msgSend_memberQueueUserDomainsDict(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueUserDomainsDict");
}

id objc_msgSend_memberQueueUserNamespacedUserSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueUserNamespacedUserSettings");
}

id objc_msgSend_memberQueueUserOrphansDict(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueUserOrphansDict");
}

id objc_msgSend_memberQueueUserProfileRestrictions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueUserProfileRestrictions");
}

id objc_msgSend_memberQueueUserUserSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberQueueUserUserSettings");
}

id objc_msgSend_mergeArray_withArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mergeArray:withArray:");
}

id objc_msgSend_methodForSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "methodForSelector:");
}

id objc_msgSend_migrateCleanupMigratorWithContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "migrateCleanupMigratorWithContext:");
}

id objc_msgSend_migrateCleanupMigratorWithContext_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "migrateCleanupMigratorWithContext:completion:");
}

id objc_msgSend_migratePasscodeMetadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "migratePasscodeMetadata");
}

id objc_msgSend_migratePostDataMigratorWithContext_passcodeWasSetInBackup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "migratePostDataMigratorWithContext:passcodeWasSetInBackup:");
}

id objc_msgSend_migrateWithContext_passcodeWasSetInBackup_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "migrateWithContext:passcodeWasSetInBackup:completion:");
}

id objc_msgSend_migrateWithPostMigrationTaskQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "migrateWithPostMigrationTaskQueue:");
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minusSet:");
}

id objc_msgSend_monitorEnrollmentStateForClient_personaID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monitorEnrollmentStateForClient:personaID:");
}

id objc_msgSend_month(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "month");
}

id objc_msgSend_moveItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveItemAtPath:toPath:error:");
}

id objc_msgSend_mustNotUseSynchronizableCredential(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mustNotUseSynchronizableCredential");
}

id objc_msgSend_mutableATSExceptionInExceptionDomains_matchingHost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableATSExceptionInExceptionDomains:matchingHost:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_mutableCopyWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopyWithZone:");
}

id objc_msgSend_nePayloadBase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nePayloadBase");
}

id objc_msgSend_neProfileIngestionHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "neProfileIngestionHandler");
}

id objc_msgSend_networkIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "networkIdentifier");
}

id objc_msgSend_newAccountWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newAccountWithDictionary:");
}

id objc_msgSend_newEffectiveSettingsByApplyingRestrictions_toSettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newEffectiveSettingsByApplyingRestrictions:toSettings:");
}

id objc_msgSend_newProfileSignatureVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newProfileSignatureVersion");
}

id objc_msgSend_nonChaperonePairingAllowed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nonChaperonePairingAllowed");
}

id objc_msgSend_normalizedURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "normalizedURL");
}

id objc_msgSend_notInstalledByMDMError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notInstalledByMDMError");
}

id objc_msgSend_notSupportedUnderMultiUserModeError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notSupportedUnderMultiUserModeError");
}

id objc_msgSend_notificationSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notificationSettings");
}

id objc_msgSend_notificationSettingsFilePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notificationSettingsFilePath");
}

id objc_msgSend_notifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifier");
}

id objc_msgSend_notifyBatterySaverModeChanged(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyBatterySaverModeChanged");
}

id objc_msgSend_notifyClientsToRecomputeCompliance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyClientsToRecomputeCompliance");
}

id objc_msgSend_notifyDeviceUnlockedAndPasscodeRequiredWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyDeviceUnlockedAndPasscodeRequiredWithCompletion:");
}

id objc_msgSend_notifyDeviceUnlockedWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyDeviceUnlockedWithCompletion:");
}

id objc_msgSend_notifyFirstUnlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyFirstUnlock");
}

id objc_msgSend_notifyGracePeriodChanged(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyGracePeriodChanged");
}

id objc_msgSend_notifyHaveSeenComplianceMessageWithLastLockDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyHaveSeenComplianceMessageWithLastLockDate:");
}

id objc_msgSend_notifyHaveSeenComplianceMessageWithLastLockDate_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyHaveSeenComplianceMessageWithLastLockDate:completion:");
}

id objc_msgSend_notifyMementoEffaced(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyMementoEffaced");
}

id objc_msgSend_notifyNewConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyNewConfiguration");
}

id objc_msgSend_notifyProvisioningProfilesChanged(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyProvisioningProfilesChanged");
}

id objc_msgSend_notifyStartComplianceTimer_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyStartComplianceTimer:completion:");
}

id objc_msgSend_notifyUserLoggedIn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyUserLoggedIn");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedChar:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLong:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForFeature_withRestrictionsDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForFeature:withRestrictionsDictionary:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectID");
}

id objc_msgSend_oidsAnonymous_nonce_coresidency_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "oidsAnonymous:nonce:coresidency:");
}

id objc_msgSend_openSensitiveURL_unlock_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openSensitiveURL:unlock:completion:");
}

id objc_msgSend_openSensitiveURL_withOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openSensitiveURL:withOptions:");
}

id objc_msgSend_openSettingsAppForProfileInstallation_bundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openSettingsAppForProfileInstallation:bundleID:");
}

id objc_msgSend_organization(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "organization");
}

id objc_msgSend_orphanedClientUUIDsForClientRestrictionDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orphanedClientUUIDsForClientRestrictionDictionary:");
}

id objc_msgSend_orphanedParentsForDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orphanedParentsForDomain:");
}

id objc_msgSend_outgoingMailServerAuthentication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outgoingMailServerAuthentication");
}

id objc_msgSend_outgoingMailServerHostname(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outgoingMailServerHostname");
}

id objc_msgSend_outgoingMailServerPortNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outgoingMailServerPortNumber");
}

id objc_msgSend_outgoingMailServerUseSSL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outgoingMailServerUseSSL");
}

id objc_msgSend_outgoingMailServerUsername(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outgoingMailServerUsername");
}

id objc_msgSend_outgoingPassword(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outgoingPassword");
}

id objc_msgSend_outgoingPasswordSameAsIncomingPassword(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outgoingPasswordSameAsIncomingPassword");
}

id objc_msgSend_overridePreviousPassword(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overridePreviousPassword");
}

id objc_msgSend_pairedDevicesSelectorBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairedDevicesSelectorBlock");
}

id objc_msgSend_pairingCertificateData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingCertificateData");
}

id objc_msgSend_pairingToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingToken");
}

id objc_msgSend_parentsInDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parentsInDomain:");
}

id objc_msgSend_passcode_compliesWithPolicyFromRestrictions_checkHistory_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcode:compliesWithPolicyFromRestrictions:checkHistory:outError:");
}

id objc_msgSend_passcodeChangedNotificationToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeChangedNotificationToken");
}

id objc_msgSend_passcodeExpiryDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeExpiryDate");
}

id objc_msgSend_passcodePolicyChangedNotificationToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodePolicyChangedNotificationToken");
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "password");
}

id objc_msgSend_passwordRequired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passwordRequired");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathExtension");
}

id objc_msgSend_pathToHoldingTankProfileDataForIdentifier_targetDevice_createDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathToHoldingTankProfileDataForIdentifier:targetDevice:createDirectory:");
}

id objc_msgSend_pathToInstalledProfileByIdentifier_installationType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathToInstalledProfileByIdentifier:installationType:");
}

id objc_msgSend_pathToUninstalledProfileByIdentifier_installationType_targetDeviceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathToUninstalledProfileByIdentifier:installationType:targetDeviceType:");
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payload");
}

id objc_msgSend_payloadCertificateAnchorUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadCertificateAnchorUUID");
}

id objc_msgSend_payloadCertificateAnchorUUIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadCertificateAnchorUUIDs");
}

id objc_msgSend_payloadCertificatePersistentID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadCertificatePersistentID");
}

id objc_msgSend_payloadCertificateUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadCertificateUUID");
}

id objc_msgSend_payloadHandlerWithUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadHandlerWithUUID:");
}

id objc_msgSend_payloadHasHardwareBoundKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadHasHardwareBoundKey:");
}

id objc_msgSend_payloadWithUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadWithUUID:");
}

id objc_msgSend_payloads(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloads");
}

id objc_msgSend_payloadsOfClass_installedBeforePayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadsOfClass:installedBeforePayload:");
}

id objc_msgSend_payloadsOfClass_removedBeforePayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadsOfClass:removedBeforePayload:");
}

id objc_msgSend_payloadsOfClass_setAsideBeforePayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadsOfClass:setAsideBeforePayload:");
}

id objc_msgSend_payloadsOfClass_unsetAsideBeforePayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadsOfClass:unsetAsideBeforePayload:");
}

id objc_msgSend_payloadsOfKindOfClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadsOfKindOfClass:");
}

id objc_msgSend_payloadsRequiringRatchetWithStolenDeviceProtection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadsRequiringRatchetWithStolenDeviceProtection");
}

id objc_msgSend_payloadsWithClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadsWithClass:");
}

id objc_msgSend_peekProfileDataFromPurgatoryForDeviceType_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peekProfileDataFromPurgatoryForDeviceType:withCompletion:");
}

id objc_msgSend_peekPurgatoryProfileDataForTargetDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peekPurgatoryProfileDataForTargetDevice:");
}

id objc_msgSend_pemData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pemData");
}

id objc_msgSend_performBlockUnderPersona_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performBlockUnderPersona:block:");
}

id objc_msgSend_performRequest_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performRequest:completion:");
}

id objc_msgSend_performSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSelector:");
}

id objc_msgSend_performSelector_withObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSelector:withObject:");
}

id objc_msgSend_performSelectorOnMainThread_withObject_waitUntilDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSelectorOnMainThread:withObject:waitUntilDone:");
}

id objc_msgSend_performSynchronously(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSynchronously");
}

id objc_msgSend_permanentlyRedirectedURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "permanentlyRedirectedURL");
}

id objc_msgSend_persistentAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentAccount");
}

id objc_msgSend_persistentIDForCertificateUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentIDForCertificateUUID:");
}

id objc_msgSend_persistentRefForUUID_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentRefForUUID:outError:");
}

id objc_msgSend_persistentRefsForUUIDs_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentRefsForUUIDs:outError:");
}

id objc_msgSend_persistentResourceID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentResourceID");
}

id objc_msgSend_persistentURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentURL");
}

id objc_msgSend_persistentUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentUUID");
}

id objc_msgSend_personaID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personaID");
}

id objc_msgSend_personaIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personaIdentifier");
}

id objc_msgSend_pinningRevocationCheckRequired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pinningRevocationCheckRequired");
}

id objc_msgSend_pluginConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pluginConfiguration");
}

id objc_msgSend_policy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "policy");
}

id objc_msgSend_pollingIntervalMinutes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pollingIntervalMinutes");
}

id objc_msgSend_popProfileDataAtHeadOfInstallationQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "popProfileDataAtHeadOfInstallationQueue");
}

id objc_msgSend_popProfileDataFromHeadOfInstallationQueueWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "popProfileDataFromHeadOfInstallationQueueWithCompletion:");
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "port");
}

id objc_msgSend_postFollowUpItem_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postFollowUpItem:error:");
}

id objc_msgSend_precomposed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "precomposed");
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithBlock:");
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredLanguages");
}

id objc_msgSend_prefixedFeaturePromptIdentifierForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prefixedFeaturePromptIdentifierForIdentifier:");
}

id objc_msgSend_preflightCompletionHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preflightCompletionHandler");
}

id objc_msgSend_preflightUserInputResponses_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preflightUserInputResponses:outError:");
}

id objc_msgSend_prepareToAddProfilePayloads(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prepareToAddProfilePayloads");
}

id objc_msgSend_preventAppSheet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preventAppSheet");
}

id objc_msgSend_preventMove(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preventMove");
}

id objc_msgSend_principalName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "principalName");
}

id objc_msgSend_principalURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "principalURL");
}

id objc_msgSend_prioritizeUserInput_key_overField_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prioritizeUserInput:key:overField:");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_processPasscodeChangeWithOldPascodeGeneration_oldPublicDict_newPasscodeGeneration_newPublicDict_newPasscodeWasSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processPasscodeChangeWithOldPascodeGeneration:oldPublicDict:newPasscodeGeneration:newPublicDict:newPasscodeWasSet:");
}

id objc_msgSend_productNameWithDefaultValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productNameWithDefaultValue:");
}

id objc_msgSend_profile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "profile");
}

id objc_msgSend_profileChangeNotificationToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "profileChangeNotificationToken");
}

id objc_msgSend_profileEventsExpirationInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "profileEventsExpirationInterval");
}

id objc_msgSend_profileEventsFilePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "profileEventsFilePath");
}

id objc_msgSend_profileEventsMaxLength(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "profileEventsMaxLength");
}

id objc_msgSend_profileHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "profileHandler");
}

id objc_msgSend_profileMetadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "profileMetadata");
}

id objc_msgSend_profileStoreForOwner_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "profileStoreForOwner:");
}

id objc_msgSend_profileTrust(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "profileTrust");
}

id objc_msgSend_profileWithData_fileName_allowEmptyPayload_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "profileWithData:fileName:allowEmptyPayload:outError:");
}

id objc_msgSend_profileWithData_options_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "profileWithData:options:outError:");
}

id objc_msgSend_profileWithData_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "profileWithData:outError:");
}

id objc_msgSend_promptDictionaryForKey_title_description_retypeDescription_finePrint_defaultValue_placeholderValue_minimumLength_fieldType_flags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_provisionedDataclasses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "provisionedDataclasses");
}

id objc_msgSend_proxyCaptiveLoginAllowed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxyCaptiveLoginAllowed");
}

id objc_msgSend_proxyPACFallbackAllowed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxyPACFallbackAllowed");
}

id objc_msgSend_proxyPACURLString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxyPACURLString");
}

id objc_msgSend_proxyPassword(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxyPassword");
}

id objc_msgSend_proxyServer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxyServer");
}

id objc_msgSend_proxyServerPort(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxyServerPort");
}

id objc_msgSend_proxyType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxyType");
}

id objc_msgSend_proxyUsername(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxyUsername");
}

id objc_msgSend_purgatorySupportedForDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "purgatorySupportedForDevice:");
}

id objc_msgSend_purgatoryTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "purgatoryTimer");
}

id objc_msgSend_purgePurgatoryProfileWithIdentifier_targetDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "purgePurgatoryProfileWithIdentifier:targetDevice:");
}

id objc_msgSend_purgePurgatoryProfilesForTargetDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "purgePurgatoryProfilesForTargetDevice:");
}

id objc_msgSend_qosMarkingConfig(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "qosMarkingConfig");
}

id objc_msgSend_queueProfileDataForInstallation_originalFileName_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queueProfileDataForInstallation:originalFileName:completion:");
}

id objc_msgSend_queueProfileDataForInstallation_originalFileName_originatingBundleID_transitionToUI_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queueProfileDataForInstallation:originalFileName:originatingBundleID:transitionToUI:completion:");
}

id objc_msgSend_radius(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "radius");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfString:options:");
}

id objc_msgSend_realm(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "realm");
}

id objc_msgSend_reapplyAppEnforcedRestrictionsWithAssertion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reapplyAppEnforcedRestrictionsWithAssertion:");
}

id objc_msgSend_rebuildConfigurationIncludingPayloads_excludingPayloads_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rebuildConfigurationIncludingPayloads:excludingPayloads:error:");
}

id objc_msgSend_recomputeAccountVPNAssociations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recomputeAccountVPNAssociations");
}

id objc_msgSend_recomputeAirPlaySettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recomputeAirPlaySettings");
}

id objc_msgSend_recomputeAppOptionsEffectiveUserSettings_outEffectiveChangeDetected_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recomputeAppOptionsEffectiveUserSettings:outEffectiveChangeDetected:");
}

id objc_msgSend_recomputeAppRulesForNetworkExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recomputeAppRulesForNetworkExtension");
}

id objc_msgSend_recomputeEffectiveUserSettingsPasscode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recomputeEffectiveUserSettingsPasscode:");
}

id objc_msgSend_recomputeHacksAfterProfileChangesEffectiveUserSettings_sendNotifications_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recomputeHacksAfterProfileChangesEffectiveUserSettings:sendNotifications:");
}

id objc_msgSend_recomputeNagMetadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recomputeNagMetadata");
}

id objc_msgSend_recomputeNagMetadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recomputeNagMetadata:");
}

id objc_msgSend_recomputePerClientUserComplianceWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recomputePerClientUserComplianceWithCompletion:");
}

id objc_msgSend_recomputeProfileRestrictionsWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recomputeProfileRestrictionsWithCompletionBlock:");
}

id objc_msgSend_recomputeUserComplianceWarningWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recomputeUserComplianceWarningWithCompletion:");
}

id objc_msgSend_recomputeUserRestrictionsAndEffectiveUserSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recomputeUserRestrictionsAndEffectiveUserSettings");
}

id objc_msgSend_recomputeWebContentFilterEffectiveUserSettings_outEffectiveChangeDetected_outMechanismChangedDetected_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recomputeWebContentFilterEffectiveUserSettings:outEffectiveChangeDetected:outMechanismChangedDetected:");
}

id objc_msgSend_recoveryPasscodeExpiryDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recoveryPasscodeExpiryDate");
}

id objc_msgSend_reducedMachineInfoDataWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reducedMachineInfoDataWithCompletion:");
}

id objc_msgSend_refetchUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refetchUser");
}

id objc_msgSend_refreshDetailsFromDisk(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refreshDetailsFromDisk");
}

id objc_msgSend_relayUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relayUUID");
}

id objc_msgSend_releaseAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "releaseAssertion");
}

id objc_msgSend_reloadAccounts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reloadAccounts");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_remoteProcessBundleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteProcessBundleID");
}

id objc_msgSend_remoteProcessCanRemoveProfilesOutError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteProcessCanRemoveProfilesOutError:");
}

id objc_msgSend_remoteProcessEntitlementStringArrayForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteProcessEntitlementStringArrayForKey:");
}

id objc_msgSend_remoteProcessHasBooleanEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteProcessHasBooleanEntitlement:");
}

id objc_msgSend_remoteProcessHasBooleanEntitlement_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteProcessHasBooleanEntitlement:error:");
}

id objc_msgSend_remoteProcessHasEntitlementArray_containingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteProcessHasEntitlementArray:containingString:");
}

id objc_msgSend_remoteProcessHasEntitlementArray_containingString_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteProcessHasEntitlementArray:containingString:error:");
}

id objc_msgSend_remoteQueueableHomePodPayloadClasses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteQueueableHomePodPayloadClasses");
}

id objc_msgSend_remoteQueueableWatchPayloadClasses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteQueueableWatchPayloadClasses");
}

id objc_msgSend_removalDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removalDate");
}

id objc_msgSend_removalPasscode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removalPasscode");
}

id objc_msgSend_remove(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remove");
}

id objc_msgSend_removeAccount_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAccount:withCompletionHandler:");
}

id objc_msgSend_removeAccount_withDataclassActions_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAccount:withDataclassActions:completion:");
}

id objc_msgSend_removeAccountPropertyForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAccountPropertyForKey:");
}

id objc_msgSend_removeAccountType_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAccountType:withCompletionHandler:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeBoolSetting_sender_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeBoolSetting:sender:");
}

id objc_msgSend_removeBoolSetting_sender_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeBoolSetting:sender:completion:");
}

id objc_msgSend_removeClientCertificateData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeClientCertificateData");
}

id objc_msgSend_removeConfigurationWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeConfigurationWithIdentifier:");
}

id objc_msgSend_removeCredential_forProtectionSpace_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeCredential:forProtectionSpace:options:");
}

id objc_msgSend_removeDeliveryAccount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeDeliveryAccount:");
}

id objc_msgSend_removeDependent_fromParent_inDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeDependent:fromParent:inDomain:");
}

id objc_msgSend_removeDependent_fromParent_inDomain_reciprocalDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeDependent:fromParent:inDomain:reciprocalDomain:");
}

id objc_msgSend_removeDependent_fromParent_inDomain_reciprocalDomain_fromSystem_user_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeDependent:fromParent:inDomain:reciprocalDomain:fromSystem:user:");
}

id objc_msgSend_removeExpiredProfileEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeExpiredProfileEvents");
}

id objc_msgSend_removeExpiredProfiles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeExpiredProfiles");
}

id objc_msgSend_removeExpiredProfilesWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeExpiredProfilesWithCompletion:");
}

id objc_msgSend_removeFromDisk(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromDisk");
}

id objc_msgSend_removeIdentifierFromSystemManifest_flag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeIdentifierFromSystemManifest:flag:");
}

id objc_msgSend_removeIdentifierFromUserManifest_flag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeIdentifierFromUserManifest:flag:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeItemForService_account_label_description_useSystemKeychain_group_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemForService:account:label:description:useSystemKeychain:group:");
}

id objc_msgSend_removeItemWithPersistentID_useSystemKeychain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemWithPersistentID:useSystemKeychain:");
}

id objc_msgSend_removeManagedPreferences_fromDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeManagedPreferences:fromDomain:");
}

id objc_msgSend_removeManagedProfilesIfNecessary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeManagedProfilesIfNecessary");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsAtIndexes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsAtIndexes:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_removeObjectsInRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsInRange:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeOrphanedClientRestrictions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeOrphanedClientRestrictions");
}

id objc_msgSend_removeOrphanedClientRestrictionsWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeOrphanedClientRestrictionsWithCompletion:");
}

id objc_msgSend_removeOrphanedEnrollmentAccounts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeOrphanedEnrollmentAccounts");
}

id objc_msgSend_removePersistentAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removePersistentAccount");
}

id objc_msgSend_removePersona_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removePersona:error:");
}

id objc_msgSend_removePersonaAndAccountsWithPersonaID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removePersonaAndAccountsWithPersonaID:");
}

id objc_msgSend_removePostSetupAutoInstallSetAsideProfileWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removePostSetupAutoInstallSetAsideProfileWithCompletion:");
}

id objc_msgSend_removePrivateNetworkProfile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removePrivateNetworkProfile:");
}

id objc_msgSend_removeProfile_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeProfile:completionHandler:");
}

id objc_msgSend_removeProfileDataWithIdentifier_fromHoldingTankForDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeProfileDataWithIdentifier:fromHoldingTankForDevice:");
}

id objc_msgSend_removeProfileWithIdentifier_installationType_options_source_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeProfileWithIdentifier:installationType:options:source:");
}

id objc_msgSend_removeProfileWithIdentifier_installationType_source_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeProfileWithIdentifier:installationType:source:");
}

id objc_msgSend_removeProfileWithIdentifier_installationType_source_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeProfileWithIdentifier:installationType:source:completion:");
}

id objc_msgSend_removeProvisioningProfileUUID_sender_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeProvisioningProfileUUID:sender:");
}

id objc_msgSend_removeProvisioningProfileWithUUID_managingProfileIdentifier_sender_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeProvisioningProfileWithUUID:managingProfileIdentifier:sender:completion:");
}

id objc_msgSend_removeSetAsideCloudConfigurationProfileWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeSetAsideCloudConfigurationProfileWithCompletion:");
}

id objc_msgSend_removeUninstalledProfileWithIdentifier_installationType_targetDeviceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeUninstalledProfileWithIdentifier:installationType:targetDeviceType:");
}

id objc_msgSend_removeUninstalledProfileWithIdentifier_installationType_targetDeviceType_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeUninstalledProfileWithIdentifier:installationType:targetDeviceType:completion:");
}

id objc_msgSend_removeUntrustedIdentitiesFromSender_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeUntrustedIdentitiesFromSender:");
}

id objc_msgSend_removeValueSetting_sender_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeValueSetting:sender:");
}

id objc_msgSend_removeValueSetting_sender_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeValueSetting:sender:completion:");
}

id objc_msgSend_removeWithInstaller_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeWithInstaller:options:");
}

id objc_msgSend_replaceCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceCharactersInRange:withString:");
}

id objc_msgSend_replacePayloadWithUUID_withPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replacePayloadWithUUID:withPayload:");
}

id objc_msgSend_requestCurrentPasscodeOutPasscode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestCurrentPasscodeOutPasscode:");
}

id objc_msgSend_requestMAIDSignIn_personaID_outError_isCancelled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestMAIDSignIn:personaID:outError:isCancelled:");
}

id objc_msgSend_requestManagedRestoreWithManagedAppleID_personaID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestManagedRestoreWithManagedAppleID:personaID:");
}

id objc_msgSend_requestUserInput_delegate_outResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestUserInput:delegate:outResult:");
}

id objc_msgSend_requestWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestWithURL:");
}

id objc_msgSend_requiredAppIDForMDM(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requiredAppIDForMDM");
}

id objc_msgSend_rereadManagedAppAttributesWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rereadManagedAppAttributesWithCompletion:");
}

id objc_msgSend_rescheduleManagedAppValidationJob(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rescheduleManagedAppValidationJob");
}

id objc_msgSend_rescheduleManagedAppValidationJob_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rescheduleManagedAppValidationJob:");
}

id objc_msgSend_reschedulePasscodeExpiryJob(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reschedulePasscodeExpiryJob");
}

id objc_msgSend_rescheduleProfileJanitorJob(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rescheduleProfileJanitorJob");
}

id objc_msgSend_rescheduleRecoveryPasscodeExpiryJob(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rescheduleRecoveryPasscodeExpiryJob");
}

id objc_msgSend_resetAPNSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetAPNSettings");
}

id objc_msgSend_resetAllSettingsToDefaultsIsUserInitiated_sender_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetAllSettingsToDefaultsIsUserInitiated:sender:completion:");
}

id objc_msgSend_resetAllSettingsToDefaultsSender_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetAllSettingsToDefaultsSender:");
}

id objc_msgSend_resetPasscodeMetadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetPasscodeMetadata");
}

id objc_msgSend_resetPasscodeMetadataWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetPasscodeMetadataWithCompletion:");
}

id objc_msgSend_resetSettingsSender_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetSettingsSender:");
}

id objc_msgSend_resourcePayloadCertificatePersistentID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resourcePayloadCertificatePersistentID");
}

id objc_msgSend_resourcePayloadCertificateUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resourcePayloadCertificateUUID");
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "response");
}

id objc_msgSend_responseData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "responseData");
}

id objc_msgSend_responsibleClients(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "responsibleClients");
}

id objc_msgSend_restoreCloudConfigAndMDMProfileFromSetAsideDataWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreCloudConfigAndMDMProfileFromSetAsideDataWithCompletion:");
}

id objc_msgSend_restrictDomains(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restrictDomains");
}

id objc_msgSend_restrictedBool_changedBetweenOldRestrictions_andNewRestrictions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restrictedBool:changedBetweenOldRestrictions:andNewRestrictions:");
}

id objc_msgSend_restrictedBoolForFeature_withRestrictionsDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restrictedBoolForFeature:withRestrictionsDictionary:");
}

id objc_msgSend_restrictedFromSendingExternally(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restrictedFromSendingExternally");
}

id objc_msgSend_restrictedValue_changedBetweenOldRestrictions_andNewRestrictions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:");
}

id objc_msgSend_restrictionEnforcingApps(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restrictionEnforcingApps");
}

id objc_msgSend_restrictions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restrictions");
}

id objc_msgSend_restrictionsAfterApplyingRestrictionsDictionary_toRestrictionsDictionary_outChangeDetected_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restrictionsAfterApplyingRestrictionsDictionary:toRestrictionsDictionary:outChangeDetected:outError:");
}

id objc_msgSend_restrictionsAlreadyInstalledFromPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restrictionsAlreadyInstalledFromPayload:");
}

id objc_msgSend_restrictionsEnforcePasscodePolicy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restrictionsEnforcePasscodePolicy:");
}

id objc_msgSend_restrictionsWithCurrentRestrictions_defaultRestrictions_systemProfileRestrictions_userProfileRestrictions_systemClientRestrictions_userClientRestrictions_outRestrictionsChanged_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restrictionsWithCurrentRestrictions:defaultRestrictions:systemProfileRestrictions:userProfileRestrictions:systemClientRestrictions:userClientRestrictions:outRestrictionsChanged:outError:");
}

id objc_msgSend_restrictionsWithHeuristicsAppliedOutError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restrictionsWithHeuristicsAppliedOutError:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_retries(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retries");
}

id objc_msgSend_retryDelay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retryDelay");
}

id objc_msgSend_retryNotNowResponse(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retryNotNowResponse");
}

id objc_msgSend_revalidateManagedApps(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "revalidateManagedApps");
}

id objc_msgSend_rmAccountID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rmAccountID");
}

id objc_msgSend_roamingConsortiumOIs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "roamingConsortiumOIs");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_runUntilDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runUntilDate:");
}

id objc_msgSend_sanitizedProfileSignerCertificateChainIsAllowedToWriteDefaults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sanitizedProfileSignerCertificateChainIsAllowedToWriteDefaults:");
}

id objc_msgSend_saveAccount_withDataclassActions_doVerify_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveAccount:withDataclassActions:doVerify:completion:");
}

id objc_msgSend_saveCloudConfigurationDetails_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveCloudConfigurationDetails:outError:");
}

id objc_msgSend_saveConfigurationData_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveConfigurationData:completion:");
}

id objc_msgSend_saveEncryptionCertificate_forAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveEncryptionCertificate:forAddress:");
}

id objc_msgSend_saveIngestedConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveIngestedConfiguration:");
}

id objc_msgSend_saveItem_withLabel_group_useSystemKeychain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveItem:withLabel:group:useSystemKeychain:");
}

id objc_msgSend_saveItem_withLabel_group_useSystemKeychain_accessibility_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveItem:withLabel:group:useSystemKeychain:accessibility:");
}

id objc_msgSend_saveItem_withLabel_group_useSystemKeychain_enforcePersonalPersona_accessibility_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveItem:withLabel:group:useSystemKeychain:enforcePersonalPersona:accessibility:");
}

id objc_msgSend_savePersistentAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "savePersistentAccount");
}

id objc_msgSend_saveVerifiedAccount_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveVerifiedAccount:error:");
}

id objc_msgSend_saveVerifiedAccount_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveVerifiedAccount:withCompletionHandler:");
}

id objc_msgSend_savedIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "savedIdentifier");
}

id objc_msgSend_savedWebClipIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "savedWebClipIdentifier");
}

id objc_msgSend_scheduleRecomputeNagMetadataJob(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleRecomputeNagMetadataJob");
}

id objc_msgSend_scheduleTokenUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleTokenUpdate");
}

id objc_msgSend_scheduleTokenUpdateIfNecessary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleTokenUpdateIfNecessary");
}

id objc_msgSend_searchSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchSettings");
}

id objc_msgSend_securityType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "securityType");
}

id objc_msgSend_sendCleanupMigrationFinishedNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendCleanupMigrationFinishedNotification");
}

id objc_msgSend_sendCloudConfigurationDetailsChangedNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendCloudConfigurationDetailsChangedNotification");
}

id objc_msgSend_sendManagedPreferencesChangedNotificationForDomains_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendManagedPreferencesChangedNotificationForDomains:");
}

id objc_msgSend_sendPasscodeChangedEventWithChangeType_oldPasscodeExists_isClearingPasscode_newPasscodeUnlockScreenType_newPasscodeSimpleType_passcodeRecoverySupported_passcodeRecoveryRestricted_recoverySkipped_senderBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendPasscodeChangedEventWithChangeType:oldPasscodeExists:isClearingPasscode:newPasscodeUnlockScreenType:newPasscodeSimpleType:passcodeRecoverySupported:passcodeRecoveryRestricted:recoverySkipped:senderBundleID:");
}

id objc_msgSend_sendPurgatoryProfileData_identifier_targetDevice_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendPurgatoryProfileData:identifier:targetDevice:outError:");
}

id objc_msgSend_sendRecoveryPasscodeClearedEventWithReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendRecoveryPasscodeClearedEventWithReason:");
}

id objc_msgSend_serializableDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serializableDictionary");
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "server");
}

id objc_msgSend_serverCapabilities(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serverCapabilities");
}

id objc_msgSend_serverPinningPersistentRefs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serverPinningPersistentRefs");
}

id objc_msgSend_serverPinningUUIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serverPinningUUIDs");
}

id objc_msgSend_serverURLString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serverURLString");
}

id objc_msgSend_sessionWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionWithConfiguration:");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setAMFISupervisionFromCloudConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAMFISupervisionFromCloudConfiguration:");
}

id objc_msgSend_setAcAccountIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAcAccountIdentifier:");
}

id objc_msgSend_setAccountBoolProperty_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccountBoolProperty:forKey:");
}

id objc_msgSend_setAccountDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccountDescription:");
}

id objc_msgSend_setAccountGUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccountGUID:");
}

id objc_msgSend_setAccountProperty_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccountProperty:forKey:");
}

id objc_msgSend_setAccountTypeGUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccountTypeGUID:");
}

id objc_msgSend_setAccountValidationCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccountValidationCompletionHandler:");
}

id objc_msgSend_setActions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActions:");
}

id objc_msgSend_setAdditions_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdditions:outError:");
}

id objc_msgSend_setAllClientRestrictions_sender_outRestrictionsChanged_outEffectiveSettingsChanged_outRecomputedNag_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllClientRestrictions:sender:outRestrictionsChanged:outEffectiveSettingsChanged:outRecomputedNag:outError:");
}

id objc_msgSend_setAllowHacksToCallExternalComponents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowHacksToCallExternalComponents:");
}

id objc_msgSend_setAllowedURLStrings_senderPID_sender_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowedURLStrings:senderPID:sender:completion:");
}

id objc_msgSend_setAppProvidedContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAppProvidedContext:");
}

id objc_msgSend_setApplicationBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setApplicationBundleIdentifier:");
}

id objc_msgSend_setAsideAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAsideAccount");
}

id objc_msgSend_setAsideAccountCredential(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAsideAccountCredential");
}

id objc_msgSend_setAsideAccountDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAsideAccountDictionary");
}

id objc_msgSend_setAsideAccountIdentifiersByPayloadClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAsideAccountIdentifiersByPayloadClass");
}

id objc_msgSend_setAsideAccountIdentifiersForPayloadClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAsideAccountIdentifiersForPayloadClass:");
}

id objc_msgSend_setAsideConfigurationName_unsetAside_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAsideConfigurationName:unsetAside:");
}

id objc_msgSend_setAsideDAAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAsideDAAccount");
}

id objc_msgSend_setAsideDictionariesForPayloadHandlerClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAsideDictionariesForPayloadHandlerClass:");
}

id objc_msgSend_setAsideDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAsideDictionary");
}

id objc_msgSend_setAsideWithInstaller_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAsideWithInstaller:");
}

id objc_msgSend_setAssociatedDomains_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssociatedDomains:");
}

id objc_msgSend_setAttributes_ofItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributes:ofItemAtPath:error:");
}

id objc_msgSend_setAuthenticated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAuthenticated:");
}

id objc_msgSend_setAuthenticationResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAuthenticationResults:");
}

id objc_msgSend_setAuthenticationType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAuthenticationType:");
}

id objc_msgSend_setAutoCorrectionAllowed_senderPID_sender_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoCorrectionAllowed:senderPID:sender:completion:");
}

id objc_msgSend_setBoolValue_forSetting_sender_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBoolValue:forSetting:sender:");
}

id objc_msgSend_setBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBundleIdentifier:");
}

id objc_msgSend_setByAddingObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setByAddingObject:");
}

id objc_msgSend_setByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setByAddingObjectsFromArray:");
}

id objc_msgSend_setByAddingObjectsFromSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setByAddingObjectsFromSet:");
}

id objc_msgSend_setCalendarAccountIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCalendarAccountIdentifiers:");
}

id objc_msgSend_setCalendarDomains_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCalendarDomains:");
}

id objc_msgSend_setCellularDataPreferred_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCellularDataPreferred:");
}

id objc_msgSend_setCertificatePersistentID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCertificatePersistentID:");
}

id objc_msgSend_setCertificates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCertificates:");
}

id objc_msgSend_setCheckInPinningPersistentRefs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCheckInPinningPersistentRefs:");
}

id objc_msgSend_setClientRestrictions_clientType_clientUUID_sender_localizedClientDescription_localizedWarning_outRestrictionsChanged_outEffectiveSettingsChanged_outRecomputedNag_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClientRestrictions:clientType:clientUUID:sender:localizedClientDescription:localizedWarning:outRestrictionsChanged:outEffectiveSettingsChanged:outRecomputedNag:outError:");
}

id objc_msgSend_setClientRestrictions_overrideRestrictions_appsAndOptions_system_clientType_clientUUID_sender_localizedClientDescription_localizedWarning_shouldRecomputeNag_outRestrictionsChanged_outEffectiveSettingsChanged_outRecomputedNag_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClientRestrictions:overrideRestrictions:appsAndOptions:system:clientType:clientUUID:sender:localizedClientDescription:localizedWarning:shouldRecomputeNag:outRestrictionsChanged:outEffectiveSettingsChanged:outRecomputedNag:outError:");
}

id objc_msgSend_setCommunicationServiceRules_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCommunicationServiceRules:");
}

id objc_msgSend_setConfiguration_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfiguration:completion:");
}

id objc_msgSend_setConfiguration_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfiguration:error:");
}

id objc_msgSend_setConfigurationIsManaged_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfigurationIsManaged:");
}

id objc_msgSend_setContactsAccountIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContactsAccountIdentifiers:");
}

id objc_msgSend_setContactsDomains_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContactsDomains:");
}

id objc_msgSend_setContentModeWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentModeWithString:");
}

id objc_msgSend_setContentType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentType:");
}

id objc_msgSend_setContinuousPathKeyboardAllowed_senderPID_sender_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContinuousPathKeyboardAllowed:senderPID:sender:completion:");
}

id objc_msgSend_setCookieAcceptPolicy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCookieAcceptPolicy:");
}

id objc_msgSend_setCredential_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCredential:");
}

id objc_msgSend_setCredentialType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCredentialType:");
}

id objc_msgSend_setCredentialUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCredentialUUID:");
}

id objc_msgSend_setCsgNetworkIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCsgNetworkIdentifier:");
}

id objc_msgSend_setCurrentEphemeralUserPasscodeTypeFromUnlockScreenType_simplePasscodeType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentEphemeralUserPasscodeTypeFromUnlockScreenType:simplePasscodeType:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setData_forService_account_label_description_access_useSystemKeychain_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:forService:account:label:description:access:useSystemKeychain:outError:");
}

id objc_msgSend_setData_forService_account_label_description_useSystemKeychain_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:forService:account:label:description:useSystemKeychain:outError:");
}

id objc_msgSend_setDataSetName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDataSetName:");
}

id objc_msgSend_setDay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDay:");
}

id objc_msgSend_setDefaultCredential_forProtectionSpace_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDefaultCredential:forProtectionSpace:");
}

id objc_msgSend_setDefaultStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDefaultStatus:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDeliveryAccount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeliveryAccount:");
}

id objc_msgSend_setDisplayName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisplayName:");
}

id objc_msgSend_setDisplayStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisplayStyle:");
}

id objc_msgSend_setEasEnrollmentID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEasEnrollmentID:");
}

id objc_msgSend_setEmailAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEmailAddress:");
}

id objc_msgSend_setEmbeddedCertificatePassword_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEmbeddedCertificatePassword:");
}

id objc_msgSend_setEnabled_forDADataclass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnabled:forDADataclass:");
}

id objc_msgSend_setEnabled_forDataclass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnabled:forDataclass:");
}

id objc_msgSend_setEncrypted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEncrypted:");
}

id objc_msgSend_setEncryptionIdentityPersistentReference_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEncryptionIdentityPersistentReference:");
}

id objc_msgSend_setEncryptionIdentityPersistentReference_forAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEncryptionIdentityPersistentReference:forAddress:");
}

id objc_msgSend_setEnrollmentController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnrollmentController:");
}

id objc_msgSend_setEnrollmentID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnrollmentID:");
}

id objc_msgSend_setEnrollmentIdentityPersistentID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnrollmentIdentityPersistentID:");
}

id objc_msgSend_setExceptions_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExceptions:outError:");
}

id objc_msgSend_setExcludedDomains_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExcludedDomains:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFullScreen_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFullScreen:");
}

id objc_msgSend_setGeofenceId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGeofenceId:");
}

id objc_msgSend_setGeofenceList_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGeofenceList:");
}

id objc_msgSend_setGroupIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGroupIdentifier:");
}

id objc_msgSend_setHTTPBody_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHTTPBody:");
}

id objc_msgSend_setHTTPMethod_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHTTPMethod:");
}

id objc_msgSend_setHost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHost:");
}

id objc_msgSend_setHour_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHour:");
}

id objc_msgSend_setICloudEnrollmentID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setICloudEnrollmentID:");
}

id objc_msgSend_setIconImage_isPrecomposed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIconImage:isPrecomposed:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIdentityCertificatePersistentID_managedByProfile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentityCertificatePersistentID:managedByProfile:");
}

id objc_msgSend_setIdentityPersistentID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentityPersistentID:");
}

id objc_msgSend_setIgnoreManifestScope_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIgnoreManifestScope:");
}

id objc_msgSend_setIncomingACAccountIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIncomingACAccountIdentifier:");
}

id objc_msgSend_setInstallDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInstallDate:");
}

id objc_msgSend_setInstallOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInstallOptions:");
}

id objc_msgSend_setIntersectionValues_forSetting_sender_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIntersectionValues:forSetting:sender:");
}

id objc_msgSend_setIsReady_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsReady:");
}

id objc_msgSend_setIsUserEnrollment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsUserEnrollment:");
}

id objc_msgSend_setIsUsernameEditable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsUsernameEditable:");
}

id objc_msgSend_setKeybagOpaqueDataForUser_withOpaqueData_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeybagOpaqueDataForUser:withOpaqueData:withError:");
}

id objc_msgSend_setKeyboardShortcutsAllowed_senderPID_sender_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeyboardShortcutsAllowed:senderPID:sender:completion:");
}

id objc_msgSend_setLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLabel:");
}

id objc_msgSend_setLatitude_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLatitude:");
}

id objc_msgSend_setLeaderPayloadCertificateAnchorPersistentID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLeaderPayloadCertificateAnchorPersistentID:");
}

id objc_msgSend_setLocked_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocked:");
}

id objc_msgSend_setLongitude_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLongitude:");
}

id objc_msgSend_setMailAccountIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMailAccountIdentifiers:");
}

id objc_msgSend_setMailAccounts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMailAccounts:");
}

id objc_msgSend_setMailDomains_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMailDomains:");
}

id objc_msgSend_setMailNumberOfPastDaysToSync_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMailNumberOfPastDaysToSync:");
}

id objc_msgSend_setManagedPreferences_forDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setManagedPreferences:forDomain:");
}

id objc_msgSend_setManagingOwnerIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setManagingOwnerIdentifier:");
}

id objc_msgSend_setManagingSourceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setManagingSourceName:");
}

id objc_msgSend_setMcAccountIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMcAccountIdentifier:");
}

id objc_msgSend_setMcConfigurationProfileIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMcConfigurationProfileIdentifier:");
}

id objc_msgSend_setMcEASAccountEnableNotes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMcEASAccountEnableNotes:");
}

id objc_msgSend_setMcEnableCalendarsUserOverridable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMcEnableCalendarsUserOverridable:");
}

id objc_msgSend_setMcEnableContactsUserOverridable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMcEnableContactsUserOverridable:");
}

id objc_msgSend_setMcEnableMailUserOverridable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMcEnableMailUserOverridable:");
}

id objc_msgSend_setMcEnableNotesUserOverridable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMcEnableNotesUserOverridable:");
}

id objc_msgSend_setMcEnableRemindersUserOverridable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMcEnableRemindersUserOverridable:");
}

id objc_msgSend_setMcPayloadUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMcPayloadUUID:");
}

id objc_msgSend_setMcProfileUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMcProfileUUID:");
}

id objc_msgSend_setMemberPayloadCertificateAnchorPersistentID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMemberPayloadCertificateAnchorPersistentID:");
}

id objc_msgSend_setMemberQueueOverridingRestrictionClientUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMemberQueueOverridingRestrictionClientUUID:");
}

id objc_msgSend_setMemberQueuePasscodeCompliesWithProfileRestrictions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMemberQueuePasscodeCompliesWithProfileRestrictions:");
}

id objc_msgSend_setMemberQueuePasscodeCompliesWithRestrictions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMemberQueuePasscodeCompliesWithRestrictions:");
}

id objc_msgSend_setMemberQueueRecomputePasscodeComplianceForClientUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMemberQueueRecomputePasscodeComplianceForClientUUID:");
}

id objc_msgSend_setMinute_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinute:");
}

id objc_msgSend_setMonth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMonth:");
}

id objc_msgSend_setNRStandaloneMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNRStandaloneMode:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNetworkIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNetworkIdentifier:");
}

id objc_msgSend_setOTAProfile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOTAProfile:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOperationUIPermissions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOperationUIPermissions:");
}

id objc_msgSend_setOutgoingACAccountIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOutgoingACAccountIdentifier:");
}

id objc_msgSend_setPageURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPageURL:");
}

id objc_msgSend_setPairingToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPairingToken:");
}

id objc_msgSend_setParametersForSettingsByType_configurationUUID_toSystem_user_passcode_credentialSet_sender_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setParametersForSettingsByType:configurationUUID:toSystem:user:passcode:credentialSet:sender:");
}

id objc_msgSend_setParametersForSettingsByType_configurationUUID_toSystem_user_passcode_credentialSet_senderPID_sender_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setParametersForSettingsByType:configurationUUID:toSystem:user:passcode:credentialSet:senderPID:sender:completion:");
}

id objc_msgSend_setParametersForSettingsByType_sender_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setParametersForSettingsByType:sender:");
}

id objc_msgSend_setPasscodeType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPasscodeType:");
}

id objc_msgSend_setPassword_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPassword:");
}

id objc_msgSend_setPayloadCertificatePersistentID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPayloadCertificatePersistentID:");
}

id objc_msgSend_setPayloadInfoCommon_payloadOrganization_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPayloadInfoCommon:payloadOrganization:");
}

id objc_msgSend_setPayloadInfoIdentity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPayloadInfoIdentity:");
}

id objc_msgSend_setPerAppUUID_andSafariDomains_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPerAppUUID:andSafariDomains:");
}

id objc_msgSend_setPermissionGranted_forBundleID_onAccountType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPermissionGranted:forBundleID:onAccountType:");
}

id objc_msgSend_setPersistentResourceID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPersistentResourceID:");
}

id objc_msgSend_setPersistentURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPersistentURL:");
}

id objc_msgSend_setPersonaID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPersonaID:");
}

id objc_msgSend_setPort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPort:");
}

id objc_msgSend_setPostprocessedPayloadContents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPostprocessedPayloadContents:");
}

id objc_msgSend_setPredictiveKeyboardAllowed_senderPID_sender_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPredictiveKeyboardAllowed:senderPID:sender:completion:");
}

id objc_msgSend_setPreflightCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreflightCompletionHandler:");
}

id objc_msgSend_setPrincipalURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrincipalURL:");
}

id objc_msgSend_setProfileInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProfileInfo:");
}

id objc_msgSend_setProtectedConfiguration_withOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProtectedConfiguration:withOptions:");
}

id objc_msgSend_setProvisioned_forDataclass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProvisioned:forDataclass:");
}

id objc_msgSend_setProxyPassword_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProxyPassword:");
}

id objc_msgSend_setPurgatoryTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPurgatoryTimer:");
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQueryItems:");
}

id objc_msgSend_setRadius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRadius:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRemovalDisallowed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemovalDisallowed:");
}

id objc_msgSend_setRemovalPasscode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemovalPasscode:");
}

id objc_msgSend_setRequiredAppIDForMDM_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequiredAppIDForMDM:");
}

id objc_msgSend_setResourcePayloadCertificatePersistentID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResourcePayloadCertificatePersistentID:");
}

id objc_msgSend_setResourceValues_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResourceValues:error:");
}

id objc_msgSend_setRestrictDomains_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRestrictDomains:");
}

id objc_msgSend_setSMBDomains_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSMBDomains:");
}

id objc_msgSend_setSMIMEEncryptionIdentityPersistentID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSMIMEEncryptionIdentityPersistentID:");
}

id objc_msgSend_setSMIMESigningIdentityPersistentID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSMIMESigningIdentityPersistentID:");
}

id objc_msgSend_setSavedIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSavedIdentifier:");
}

id objc_msgSend_setScheme_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScheme:");
}

id objc_msgSend_setScope_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScope:");
}

id objc_msgSend_setSearchBase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSearchBase:");
}

id objc_msgSend_setSearchDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSearchDescription:");
}

id objc_msgSend_setSenderPID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSenderPID:");
}

id objc_msgSend_setServer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServer:");
}

id objc_msgSend_setServerPinningPersistentRefs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServerPinningPersistentRefs:");
}

id objc_msgSend_setServiceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServiceType:");
}

id objc_msgSend_setSetAsideAccount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSetAsideAccount:");
}

id objc_msgSend_setSetAsideAccountCredential_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSetAsideAccountCredential:");
}

id objc_msgSend_setSetAsideAccountDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSetAsideAccountDictionary:");
}

id objc_msgSend_setSetAsideAccountIdentifiersByPayloadClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSetAsideAccountIdentifiersByPayloadClass:");
}

id objc_msgSend_setSetAsideDAAccount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSetAsideDAAccount:");
}

id objc_msgSend_setSetAsideDictionariesByPayloadClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSetAsideDictionariesByPayloadClass:");
}

id objc_msgSend_setSetAsideDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSetAsideDictionary:");
}

id objc_msgSend_setShouldDoInitialAutodiscovery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldDoInitialAutodiscovery:");
}

id objc_msgSend_setShouldForceOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldForceOperation:");
}

id objc_msgSend_setSignerCertificates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSignerCertificates:");
}

id objc_msgSend_setSigningIdentityPersistentReference_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSigningIdentityPersistentReference:");
}

id objc_msgSend_setSigningIdentityPersistentReference_forAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSigningIdentityPersistentReference:forAddress:");
}

id objc_msgSend_setSmartPunctuationAllowed_senderPID_sender_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSmartPunctuationAllowed:senderPID:sender:completion:");
}

id objc_msgSend_setSpellCheckAllowed_senderPID_sender_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSpellCheckAllowed:senderPID:sender:completion:");
}

id objc_msgSend_setString_forService_account_label_description_access_group_useSystemKeychain_sysBound_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setString:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:");
}

id objc_msgSend_setString_forService_account_label_description_group_useSystemKeychain_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setString:forService:account:label:description:group:useSystemKeychain:outError:");
}

id objc_msgSend_setString_forService_account_label_description_useSystemKeychain_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setString:forService:account:label:description:useSystemKeychain:outError:");
}

id objc_msgSend_setSystemMetadataDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSystemMetadataDictionary:");
}

id objc_msgSend_setSystemProfileRestrictions_userProfileRestrictions_sender_outRestrictionsChanged_outEffectiveSettingsChanged_outAppWhitelistSettingsChanged_outRecomputedNag_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSystemProfileRestrictions:userProfileRestrictions:sender:outRestrictionsChanged:outEffectiveSettingsChanged:outAppWhitelistSettingsChanged:outRecomputedNag:outError:");
}

id objc_msgSend_setSystemProfileStorageWasMigratedFromLegacyStorage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSystemProfileStorageWasMigratedFromLegacyStorage:");
}

id objc_msgSend_setTargetApplicationBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTargetApplicationBundleIdentifier:");
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeZone:");
}

id objc_msgSend_setTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeout:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setType:");
}

id objc_msgSend_setURLsFromUserBookmarkDictsAsSettings_sender_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setURLsFromUserBookmarkDictsAsSettings:sender:");
}

id objc_msgSend_setUnionValues_forSetting_sender_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUnionValues:forSetting:sender:");
}

id objc_msgSend_setUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUniqueIdentifier:");
}

id objc_msgSend_setUpdatedOverInstalledAccount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpdatedOverInstalledAccount:");
}

id objc_msgSend_setUrl_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUrl:");
}

id objc_msgSend_setUseSSL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUseSSL:");
}

id objc_msgSend_setUserAgent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserAgent:");
}

id objc_msgSend_setUserBookmarks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserBookmarks:");
}

id objc_msgSend_setUserBookmarks_senderPID_sender_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserBookmarks:senderPID:sender:completion:");
}

id objc_msgSend_setUserControllableViewsSyncStatus_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserControllableViewsSyncStatus:error:");
}

id objc_msgSend_setUserInfo_forClientUUID_sender_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInfo:forClientUUID:sender:");
}

id objc_msgSend_setUserInfo_forClientUUID_sender_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInfo:forClientUUID:sender:completion:");
}

id objc_msgSend_setUserInputResponses_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInputResponses:");
}

id objc_msgSend_setUserMetadataDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserMetadataDictionary:");
}

id objc_msgSend_setUserTrackingTCCAccessOverrideForRestrictions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserTrackingTCCAccessOverrideForRestrictions:");
}

id objc_msgSend_setUsername_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUsername:");
}

id objc_msgSend_setValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setValue_forSetting_sender_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forSetting:sender:");
}

id objc_msgSend_setValueInAccountProperties_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValueInAccountProperties:forKey:");
}

id objc_msgSend_setVersionNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVersionNumber:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithCapacity:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setWorkerQueueLastCarrierProfileCheckTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWorkerQueueLastCarrierProfileCheckTime:");
}

id objc_msgSend_setXpcConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setXpcConnection:");
}

id objc_msgSend_setYear_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setYear:");
}

id objc_msgSend_set_atsContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set_atsContext:");
}

id objc_msgSend_set_useSystemKeychain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set_useSystemKeychain:");
}

id objc_msgSend_sharedClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedClient");
}

id objc_msgSend_sharedConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedConfiguration");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedConnection");
}

id objc_msgSend_sharedCredentialStorage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedCredentialStorage");
}

id objc_msgSend_sharedHTTPCookieStorage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedHTTPCookieStorage");
}

id objc_msgSend_sharedHacks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedHacks");
}

id objc_msgSend_sharedInstaller(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstaller");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedJanitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedJanitor");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_sharedManifest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedManifest");
}

id objc_msgSend_sharedMirror(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedMirror");
}

id objc_msgSend_sharedServer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedServer");
}

id objc_msgSend_shouldApplyFilterForBundleID_sourceAccountManagement_outAllowManagedAccounts_outAllowUnmanagedAccounts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldApplyFilterForBundleID:sourceAccountManagement:outAllowManagedAccounts:outAllowUnmanagedAccounts:");
}

id objc_msgSend_shouldHaveFullSSLTrust(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldHaveFullSSLTrust");
}

id objc_msgSend_showResolutionPromptWithWatchOption_homePodOption_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showResolutionPromptWithWatchOption:homePodOption:completionBlock:");
}

id objc_msgSend_showUserWarnings_outResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showUserWarnings:outResult:");
}

id objc_msgSend_signInService_withContext_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signInService:withContext:completion:");
}

id objc_msgSend_signIntoFaceTimeWithUsername_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signIntoFaceTimeWithUsername:");
}

id objc_msgSend_signMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signMessage");
}

id objc_msgSend_signOutAllPrimaryAccounts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signOutAllPrimaryAccounts");
}

id objc_msgSend_signerCertificates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signerCertificates");
}

id objc_msgSend_signerIdentitiesFromProvisioningProfileUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signerIdentitiesFromProvisioningProfileUUID:");
}

id objc_msgSend_simulatePush(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "simulatePush");
}

id objc_msgSend_slotID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "slotID");
}

id objc_msgSend_softwareUpdateDeviceIDWithDefaultValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "softwareUpdateDeviceIDWithDefaultValue:");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_sourceIsManaged(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sourceIsManaged");
}

id objc_msgSend_ssid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ssid");
}

id objc_msgSend_stageForInstallationWithInstaller_interactionClient_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stageForInstallationWithInstaller:interactionClient:outError:");
}

id objc_msgSend_stageMDMEnrollmentInfoForPairingWatchWithProfileData_orServiceURL_anchorCertificates_supervised_declarationKeys_declarationConfiguration_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stageMDMEnrollmentInfoForPairingWatchWithProfileData:orServiceURL:anchorCertificates:supervised:declarationKeys:declarationConfiguration:completion:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_startPreflight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startPreflight");
}

id objc_msgSend_startWatchEnrollmentFlowWithServiceURL_anchorCertificates_restartIfFail_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startWatchEnrollmentFlowWithServiceURL:anchorCertificates:restartIfFail:completionHandler:");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusCode");
}

id objc_msgSend_storeActivationRecord_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeActivationRecord:completion:");
}

id objc_msgSend_storeCertificateData_forIPCUIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeCertificateData:forIPCUIdentifier:completion:");
}

id objc_msgSend_storeCloudConfigurationDetails_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeCloudConfigurationDetails:outError:");
}

id objc_msgSend_storeProfileData_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeProfileData:completion:");
}

id objc_msgSend_storedActivationLockBypassCodeWithOutError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storedActivationLockBypassCodeWithOutError:");
}

id objc_msgSend_storedProfileDataWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storedProfileDataWithCompletion:");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByDeletingLastPathComponent");
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByDeletingPathExtension");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringForDeviceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForDeviceType:");
}

id objc_msgSend_stringForWatchAvailability_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForWatchAvailability:");
}

id objc_msgSend_stringFromService_account_label_description_useSystemKeychain_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromService:account:label:description:useSystemKeychain:outError:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithContentsOfFile_encoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithContentsOfFile:encoding:error:");
}

id objc_msgSend_stringWithContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithContext:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subdataWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subdataWithRange:");
}

id objc_msgSend_subject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subject");
}

id objc_msgSend_subjectAltName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subjectAltName");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_supervisedRequiredPayloads(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supervisedRequiredPayloads");
}

id objc_msgSend_supplementalBuildVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supplementalBuildVersion");
}

id objc_msgSend_supplementalMarketingVersionExtra(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supplementalMarketingVersionExtra");
}

id objc_msgSend_supportUserChannel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportUserChannel");
}

id objc_msgSend_supportedDataclasses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportedDataclasses");
}

id objc_msgSend_supportedDataclassesForAccountType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportedDataclassesForAccountType:");
}

id objc_msgSend_supportsCapability_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsCapability:");
}

id objc_msgSend_syncDefaultFoldersOnly(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncDefaultFoldersOnly");
}

id objc_msgSend_syncableSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncableSettings");
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronize");
}

id objc_msgSend_systemClientRestrictions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemClientRestrictions");
}

id objc_msgSend_systemMetadataDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemMetadataDictionary");
}

id objc_msgSend_systemProfileRestrictions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemProfileRestrictions");
}

id objc_msgSend_systemProfileStorageWasMigratedFromLegacyStorage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemProfileStorageWasMigratedFromLegacyStorage");
}

id objc_msgSend_systemStoragePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemStoragePath");
}

id objc_msgSend_systemUserSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemUserSettings");
}

id objc_msgSend_targetApplicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "targetApplicationBundleIdentifier");
}

id objc_msgSend_targetDeviceType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "targetDeviceType");
}

id objc_msgSend_telephonyRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "telephonyRepresentation");
}

id objc_msgSend_thisDeviceType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "thisDeviceType");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_timeZone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeZone");
}

id objc_msgSend_topic(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topic");
}

id objc_msgSend_touchWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "touchWithCompletion:");
}

id objc_msgSend_trackConnectionFromPID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trackConnectionFromPID:");
}

id objc_msgSend_trackDirtyPersona_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trackDirtyPersona:");
}

id objc_msgSend_trackRequestFromPID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trackRequestFromPID:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_typeStrings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "typeStrings");
}

id objc_msgSend_unavailablePayloadsInEphemeralMultiUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unavailablePayloadsInEphemeralMultiUser");
}

id objc_msgSend_unavailableSystemPayloadsInEphemeralMultiUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unavailableSystemPayloadsInEphemeralMultiUser");
}

id objc_msgSend_unavailableUserPayloadsInEphemeralMultiUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unavailableUserPayloadsInEphemeralMultiUser");
}

id objc_msgSend_unhashedAccountIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unhashedAccountIdentifier");
}

id objc_msgSend_unhashedAccountIdentifierWithType_hostname_username_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unhashedAccountIdentifierWithType:hostname:username:");
}

id objc_msgSend_uninstalledProfileDataWithIdentifier_targetDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uninstalledProfileDataWithIdentifier:targetDevice:");
}

id objc_msgSend_uninstalledProfileIdentifiersForDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uninstalledProfileIdentifiersForDevice:");
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_unionValuesForFeature_withRestrictionsDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unionValuesForFeature:withRestrictionsDictionary:");
}

id objc_msgSend_unionValuesSetting_valueChangedBetweenOldSettings_andNewSettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unionValuesSetting:valueChangedBetweenOldSettings:andNewSettings:");
}

id objc_msgSend_unionValuesSettingForFeature_withUserSettingDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unionValuesSettingForFeature:withUserSettingDictionary:");
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlock");
}

id objc_msgSend_unlockConfigurations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlockConfigurations");
}

id objc_msgSend_unlockDeviceWithPasscode_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlockDeviceWithPasscode:outError:");
}

id objc_msgSend_unlockScreenTypeForPasscodeCharacteristics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlockScreenTypeForPasscodeCharacteristics:");
}

id objc_msgSend_unlockScreenTypeForPasscodeCharacteristics_outSimplePasscodeType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlockScreenTypeForPasscodeCharacteristics:outSimplePasscodeType:");
}

id objc_msgSend_unlockScreenTypeForRestrictions_outSimplePasscodeType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlockScreenTypeForRestrictions:outSimplePasscodeType:");
}

id objc_msgSend_unlockScreenTypeWithPublicPasscodeDict_isRecovery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlockScreenTypeWithPublicPasscodeDict:isRecovery:");
}

id objc_msgSend_unlockSimplePasscodeTypeWithPublicPasscodeDict_isRecovery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlockSimplePasscodeTypeWithPublicPasscodeDict:isRecovery:");
}

id objc_msgSend_unlockWithCondition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlockWithCondition:");
}

id objc_msgSend_unsetAside(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsetAside");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongValue");
}

id objc_msgSend_unstageFromInstallationWithInstaller_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unstageFromInstallationWithInstaller:");
}

id objc_msgSend_unstageMDMEnrollmentInfoForPairingWatchWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unstageMDMEnrollmentInfoForPairingWatchWithCompletion:");
}

id objc_msgSend_untrackAllDirtyPersonas(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "untrackAllDirtyPersonas");
}

id objc_msgSend_untrackDirtyPersona_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "untrackDirtyPersona:");
}

id objc_msgSend_unverifiedInstalledMDMProfileIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unverifiedInstalledMDMProfileIdentifier");
}

id objc_msgSend_updateAccountIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateAccountIdentifiers:");
}

id objc_msgSend_updateDefaultAfterAddingConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateDefaultAfterAddingConfiguration");
}

id objc_msgSend_updateDefaultAfterDeletingConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateDefaultAfterDeletingConfiguration");
}

id objc_msgSend_updateGlobalManagedPreferencesByAddingPreferences_removingPreferences_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateGlobalManagedPreferencesByAddingPreferences:removingPreferences:");
}

id objc_msgSend_updateMDMEnrollmentInfoForPairingWatch_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateMDMEnrollmentInfoForPairingWatch:completion:");
}

id objc_msgSend_updateMDMUserEnrollmentWithManagedAppleID_profileIdentifier_organizationName_personaID_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateMDMUserEnrollmentWithManagedAppleID:profileIdentifier:organizationName:personaID:completionHandler:");
}

id objc_msgSend_updateMISTrust(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateMISTrust");
}

id objc_msgSend_updateMISTrustAndValidateApps_validateManagedApps_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateMISTrustAndValidateApps:validateManagedApps:completion:");
}

id objc_msgSend_updateManagedAppRules_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateManagedAppRules:");
}

id objc_msgSend_updatePasscodeHistoryWithOldPasscode_oldPasscodeData_newPrivateDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePasscodeHistoryWithOldPasscode:oldPasscodeData:newPrivateDictionary:");
}

id objc_msgSend_updatePerAppMappingRules_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePerAppMappingRules:");
}

id objc_msgSend_updatePrivateNetworkProfile_setProfileAside_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePrivateNetworkProfile:setProfileAside:");
}

id objc_msgSend_updateProfileIdentifier_interactionClient_source_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateProfileIdentifier:interactionClient:source:completion:");
}

id objc_msgSend_updateProfileWithIdentifier_interactionClient_source_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateProfileWithIdentifier:interactionClient:source:outError:");
}

id objc_msgSend_updateTrustedCodeSigningIdentities_validateBundleIDs_validateManagedApps_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateTrustedCodeSigningIdentities:validateBundleIDs:validateManagedApps:");
}

id objc_msgSend_updatedOverInstalledAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatedOverInstalledAccount");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uppercaseString");
}

id objc_msgSend_uprootMDM(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uprootMDM");
}

id objc_msgSend_usageFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usageFlags");
}

id objc_msgSend_useDevelopmentAPNS(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useDevelopmentAPNS");
}

id objc_msgSend_useOAuth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useOAuth");
}

id objc_msgSend_useSSL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useSSL");
}

id objc_msgSend_userBookmarks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userBookmarks");
}

id objc_msgSend_userCancelledError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userCancelledError");
}

id objc_msgSend_userClientRestrictions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userClientRestrictions");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInputFields(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInputFields");
}

id objc_msgSend_userInputResponses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInputResponses");
}

id objc_msgSend_userMetadataDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userMetadataDictionary");
}

id objc_msgSend_userMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userMode");
}

id objc_msgSend_userProfileRestrictions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userProfileRestrictions");
}

id objc_msgSend_userSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userSettings");
}

id objc_msgSend_userStoragePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userStoragePath");
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "username");
}

id objc_msgSend_usernameRequired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usernameRequired");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uuid");
}

id objc_msgSend_validateAccount_useSSL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateAccount:useSSL:");
}

id objc_msgSend_validateAppBundleIDs_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateAppBundleIDs:completion:");
}

id objc_msgSend_validateCapabilitiesRequiredByRestrictions_localizedIncompatibilityMessage_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateCapabilitiesRequiredByRestrictions:localizedIncompatibilityMessage:outError:");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueForFeature_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForFeature:");
}

id objc_msgSend_valueForFeature_withRestrictionsDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForFeature:withRestrictionsDictionary:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForProperty:");
}

id objc_msgSend_valueInAccountPropertiesForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueInAccountPropertiesForKey:");
}

id objc_msgSend_valueSettingForFeature_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueSettingForFeature:");
}

id objc_msgSend_valueSettingForFeature_withUserSettingDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueSettingForFeature:withUserSettingDictionary:");
}

id objc_msgSend_verifiedMDMProfileIdentifierWithCleanUp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "verifiedMDMProfileIdentifierWithCleanUp");
}

id objc_msgSend_verifiedMDMProfileIdentifierWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "verifiedMDMProfileIdentifierWithCompletion:");
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "version");
}

id objc_msgSend_versionNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "versionNumber");
}

id objc_msgSend_vpnType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vpnType");
}

id objc_msgSend_waitForCompletion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitForCompletion");
}

id objc_msgSend_waitForMigrationIncludingPostRestoreMigration_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitForMigrationIncludingPostRestoreMigration:completion:");
}

id objc_msgSend_watchAvailability(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "watchAvailability");
}

id objc_msgSend_watchEnrollmentAllowLocalProfile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "watchEnrollmentAllowLocalProfile");
}

id objc_msgSend_webClipWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "webClipWithIdentifier:");
}

id objc_msgSend_webClips(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "webClips");
}

id objc_msgSend_webContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "webContent");
}

id objc_msgSend_whitelistedAppsAndOptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whitelistedAppsAndOptions");
}

id objc_msgSend_willPostEffectiveSettingsChangedNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willPostEffectiveSettingsChangedNotification");
}

id objc_msgSend_workerQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workerQueue");
}

id objc_msgSend_workerQueueBackgroundActivityManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workerQueueBackgroundActivityManager");
}

id objc_msgSend_workerQueueCheckForAutoInstallProfiles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workerQueueCheckForAutoInstallProfiles");
}

id objc_msgSend_workerQueueDidRecomputeNagMessageWithResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workerQueueDidRecomputeNagMessageWithResult:");
}

id objc_msgSend_workerQueueLastCarrierProfileCheckTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workerQueueLastCarrierProfileCheckTime");
}

id objc_msgSend_workerQueueNotifyDeviceUnlocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workerQueueNotifyDeviceUnlocked");
}

id objc_msgSend_workerQueueNotifyDeviceUnlockedAndPasscodeRequired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workerQueueNotifyDeviceUnlockedAndPasscodeRequired");
}

id objc_msgSend_workerQueueNotifyUserLoggedIn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workerQueueNotifyUserLoggedIn");
}

id objc_msgSend_workerQueueRecomputeNagMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workerQueueRecomputeNagMessage");
}

id objc_msgSend_write(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "write");
}

id objc_msgSend_writeStubToDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeStubToDirectory:");
}

id objc_msgSend_writeStubToPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeStubToPath:");
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:options:error:");
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:atomically:");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection");
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "year");
}
