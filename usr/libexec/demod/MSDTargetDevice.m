@implementation MSDTargetDevice

+ (MSDTargetDevice)sharedInstance
{
  if (qword_100175320 != -1)
    dispatch_once(&qword_100175320, &stru_10013E8D0);
  return (MSDTargetDevice *)(id)qword_100175318;
}

- (MSDTargetDevice)init
{
  MSDTargetDevice *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSDTargetDevice;
  v2 = -[MSDTargetDevice init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](MSDHelperAgent, "sharedInstance"));
    -[MSDTargetDevice setHelperAgent:](v2, "setHelperAgent:", v3);

    -[MSDTargetDevice setPowerAssertion:](v2, "setPowerAssertion:", 0);
  }
  return v2;
}

- (NSString)name
{
  return (NSString *)(id)MGCopyAnswer(CFSTR("UserAssignedDeviceName"), 0);
}

- (NSString)udid
{
  void *v2;
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
  v3 = objc_msgSend(v2, "macOS");

  if (v3)
  {
    v4 = (void *)MGCopyAnswer(CFSTR("SerialNumber"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByPaddingToLength:withString:startingAtIndex:", 25, CFSTR("0"), 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uppercaseString"));

  }
  else
  {
    v6 = (void *)MGCopyAnswer(CFSTR("UniqueDeviceID"), 0);
  }
  return (NSString *)v6;
}

- (NSString)serialNumber
{
  return (NSString *)(id)MGCopyAnswer(CFSTR("SerialNumber"), 0);
}

- (int)mode
{
  void *v2;
  void *v3;
  int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("demo-install-state")));

  if (v3)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 0;

  return v4;
}

- (unint64_t)typeOfDemoDevice
{
  void *v3;
  void *v4;
  void *v6;
  unsigned int v7;
  BOOL v8;
  unint64_t v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKeychainManager sharedInstance](MSDKeychainManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getItemForKey:", CFSTR("com.apple.mobilestoredemo.keychainItemID")));

  if (v4)
    return 6;
  if (-[MSDTargetDevice isVerifiedDemoDevice](self, "isVerifiedDemoDevice"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](MSDHelperAgent, "sharedInstance"));
    v7 = objc_msgSend(v6, "fileExistsAtPath:", CFSTR("/private/var/demo_backup/Metadata/Content.plist"));

    v8 = v7 == 0;
    v9 = 4;
  }
  else
  {
    if (-[MSDTargetDevice storeDemoMode](self, "storeDemoMode"))
      return 3;
    v8 = !-[MSDTargetDevice isVerifiedPOSDevice](self, "isVerifiedPOSDevice");
    v9 = 1;
  }
  if (v8)
    return v9;
  else
    return v9 + 1;
}

- (void)setMode:(int)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)&a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("demo-install-state"));

}

- (BOOL)removeKeyFromPreferenceFile:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  id v7;
  NSObject *v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v5 = objc_msgSend(v4, "removeObjectForKey:", v3);

  if ((v5 & 1) == 0)
  {
    v7 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000BE768();

  }
  return v5;
}

- (NSString)request
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("msd-request")));

  return (NSString *)v3;
}

- (void)setRequest:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("msd-request"));

}

- (NSString)response
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("msd-response")));

  return (NSString *)v3;
}

- (void)setResponse:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("msd-response"));

}

- (BOOL)switchModeImmediately:(int)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;
  char v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  id v19;
  BOOL v20;
  id v21;
  NSObject *v22;
  BOOL v23;
  BOOL v24;
  BOOL v25;
  char v26;
  BOOL v27;
  char v28;
  BOOL v29;
  BOOL v30;
  char v31;
  unsigned __int8 v32;
  void *v33;
  BOOL v34;
  void *v35;
  id v36;
  NSObject *v37;
  BOOL v38;
  int v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  id v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  id v48;
  NSObject *v49;
  id v50;
  uint8_t buf[4];
  int v52;
  __int16 v53;
  int v54;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice modeLock](self, "modeLock"));
  objc_sync_enter(v5);
  v6 = -[MSDTargetDevice mode](self, "mode");
  if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d-%d"), v6, v3));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestInterface sharedInstance](MSDTestInterface, "sharedInstance"));
    objc_msgSend(v8, "pushTestEvent:ofType:", v7, CFSTR("deviceModeChange"));

  }
  v9 = (_DWORD)v3 == 4 && (_DWORD)v6 == 2;
  v10 = v9;
  if (v9)
  {
    v11 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v52 = 2;
      v53 = 1024;
      v54 = 4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Changing mode from %d to %d, waiting for 30s...", buf, 0xEu);
    }

    sleep(0x1Eu);
  }
  else
  {
    switch((int)v3)
    {
      case 0:
      case 9:
        -[MSDTargetDevice backToVirgin:](self, "backToVirgin:", v3);
        if ((_DWORD)v3 == 8 || (_DWORD)v3 == 6)
          goto LABEL_17;
        break;
      case 6:
      case 8:
LABEL_17:
        v13 = sub_1000604F0();
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Move device to clearing mode to change the device to virgin/obliterate...", buf, 2u);
        }

        -[MSDTargetDevice setMode:](self, "setMode:", v3);
        -[MSDTargetDevice enableSnapshotMode:](self, "enableSnapshotMode:", 0);
        break;
      default:
        break;
    }
  }
  if ((_DWORD)v6 == (_DWORD)v3)
    goto LABEL_97;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKeychainManager sharedInstance](MSDKeychainManager, "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "getItemForKey:", CFSTR("com.apple.mobilestoredemo.keychainItemID")));

  if ((v3 & 0xFFFFFFFE) != 4 || !v16)
  {
LABEL_28:
    v21 = sub_1000604F0();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v52 = v6;
      v53 = 1024;
      v54 = v3;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Changing mode from %d to %d", buf, 0xEu);
    }

    if ((_DWORD)v3 == 5)
    {
      if (!-[MSDTargetDevice allowEnteringDemoMode](self, "allowEnteringDemoMode"))
      {
        v44 = sub_1000604F0();
        v45 = objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          sub_1000BE7F8();

        v46 = objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727740953, CFSTR("Snapshot mode not allowed.")));
        goto LABEL_103;
      }
      if (!(_DWORD)v6)
      {
        v26 = 1;
        goto LABEL_58;
      }
      if ((_DWORD)v6 != 1)
      {
        v23 = 0;
        v24 = 0;
        v25 = 0;
        goto LABEL_39;
      }
    }
    else
    {
      v24 = (_DWORD)v3 == 1;
      if ((_DWORD)v3 != 1 || (_DWORD)v6)
      {
        v25 = (_DWORD)v6 == 1;
        v23 = (_DWORD)v3 == 2;
        if ((_DWORD)v3 != 2 || (_DWORD)v6 != 1)
        {
LABEL_39:
          v26 = 0;
          if ((_DWORD)v3 != 7)
            v25 = 0;
          v27 = (_DWORD)v6 == 2 && (_DWORD)v3 == 5;
          v28 = v10 | v27 | v25;
          v29 = (_DWORD)v6 == 7 && (_DWORD)v3 == 5;
          v30 = (_DWORD)v6 == 4 && (_DWORD)v3 == 5;
          if ((v28 & 1) == 0 && !v29 && !v30)
          {
            v31 = v23 || v24;
            if ((_DWORD)v3 == 7)
              v31 = 1;
            if ((_DWORD)v6 == 5 && (v31 & 1) != 0)
              goto LABEL_57;
            v48 = sub_1000604F0();
            v49 = objc_claimAutoreleasedReturnValue(v48);
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              v52 = v6;
              v53 = 1024;
              v54 = v3;
              _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Cannot change mode from %d to %d", buf, 0xEu);
            }

            v46 = objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727740956, CFSTR("The operation is not allowed.")));
LABEL_103:
            v19 = (id)v46;
LABEL_104:
            v47 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateStatusHub sharedInstance](MSDDemoUpdateStatusHub, "sharedInstance"));
            objc_msgSend(v47, "demoUpdateFailed:", v19);

            goto LABEL_26;
          }
LABEL_58:
          v32 = -[MSDTargetDevice getSavedFlag](self, "getSavedFlag");
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
          if ((objc_msgSend(v33, "macOS") & 1) != 0)
          {
            v34 = (v32 & 2) == 0;

          }
          else
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
            if ((objc_msgSend(v35, "iOS") & 1) == 0)
            {

              goto LABEL_66;
            }
            v34 = (v32 & 2) == 0;

          }
          if (!v34)
          {
            if ((_DWORD)v3 == 4)
            {
              -[MSDTargetDevice waitForPricing:forReboot:](self, "waitForPricing:forReboot:", 60, 1);
              goto LABEL_67;
            }
            if ((_DWORD)v3 == 5 && (_DWORD)v6 == 4)
              -[MSDTargetDevice waitForPricing:forReboot:](self, "waitForPricing:forReboot:", 0, 1);
            goto LABEL_72;
          }
LABEL_66:
          if ((_DWORD)v3 == 4)
          {
LABEL_67:
            sleep(2u);
            -[MSDTargetDevice setProceeded:](self, "setProceeded:", 1);
            if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
              -[MSDTargetDevice delayRebootForTesting](self, "delayRebootForTesting");
            goto LABEL_73;
          }
LABEL_72:
          -[MSDTargetDevice setProceeded:](self, "setProceeded:", 0);
LABEL_73:
          if ((v26 & 1) != 0
            || ((_DWORD)v3 == 5 ? (v38 = (_DWORD)v6 == 1) : (v38 = 0),
                !v38 ? (v39 = 0) : (v39 = 1),
                (_DWORD)v3 == 2 || v39))
          {
            if (!-[MSDTargetDevice setDemoDeviceFlag](self, "setDemoDeviceFlag"))
            {
              v36 = sub_1000604F0();
              v37 = objc_claimAutoreleasedReturnValue(v36);
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                sub_1000BE7CC();

              v19 = 0;
              goto LABEL_104;
            }
          }
          if ((_DWORD)v3 == 5)
          {
            -[MSDTargetDevice deleteConfigurationApp](self, "deleteConfigurationApp");
            v40 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](MSDProgressUpdater, "sharedInstance"));
            objc_msgSend(v40, "updateStage:", 7);

            if (-[MSDTargetDevice allowSnapshotMode](self, "allowSnapshotMode"))
            {
              v41 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWiFiHelper sharedInstance](MSDWiFiHelper, "sharedInstance"));
              objc_msgSend(v41, "saveCurrentWiFiSettings");

            }
            if ((_DWORD)v6 == 4)
            {
              v42 = 1;
              -[MSDTargetDevice cleanUpBackgroundState:](self, "cleanUpBackgroundState:", 1);
            }
            else
            {
              v42 = 1;
            }
          }
          else
          {
            v42 = v6 == 5;
          }
          -[MSDTargetDevice setMode:](self, "setMode:", v3);
          if (v42)
            -[MSDTargetDevice enableSnapshotMode:](self, "enableSnapshotMode:", (_DWORD)v3 == 5);
          if ((_DWORD)v3 == 4)
            -[MSDTargetDevice rebootForStage:](self, "rebootForStage:", 6);
LABEL_97:
          v20 = 1;
          goto LABEL_98;
        }
      }
    }
LABEL_57:
    v26 = 0;
    goto LABEL_58;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateTimeKeeper sharedInstance](MSDDemoUpdateTimeKeeper, "sharedInstance"));
  v50 = 0;
  v18 = objc_msgSend(v17, "shouldCleanUp:", &v50);
  v19 = v50;

  if (!v18 || objc_msgSend(v19, "code") != (id)3727741185)
  {

    goto LABEL_28;
  }
  -[MSDTargetDevice forceSwitchToDemoUpdateModeIfNeeded](self, "forceSwitchToDemoUpdateModeIfNeeded");
LABEL_26:

  v20 = 0;
LABEL_98:
  objc_sync_exit(v5);

  return v20;
}

- (void)waitForPricing:(int)a3 forReboot:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  void *v7;
  MSDTargetDevice *v8;
  void *v9;
  id v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  id v15;
  void *v16;
  unint64_t v17;
  BOOL v18;
  uint64_t v20;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPricingUpdateController sharedInstance](MSDPricingUpdateController, "sharedInstance"));
  if (v4)
  {
    v8 = self;
    objc_sync_enter(v8);
    -[MSDTargetDevice setAboutToReboot:](v8, "setAboutToReboot:", 1);
    objc_sync_exit(v8);

  }
  if ((objc_msgSend(v7, "completed") & 1) == 0)
  {
    if ((_DWORD)v5)
    {
      if (v4)
      {
        objc_msgSend(v7, "stopMonitor");
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLocalMessageResponder sharedInstance](MSDLocalMessageResponder, "sharedInstance"));
        objc_msgSend(v9, "sendRebootTimeoutMessageToPricing:", v5);

      }
      v10 = sub_1000604F0();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      LODWORD(v20) = 67109120;
      HIDWORD(v20) = v5;
      v12 = "Defering the operation (up to %d seconds) as Pricing update is not done yet...";
      v13 = v11;
      v14 = 8;
    }
    else
    {
      v15 = sub_1000604F0();
      v11 = objc_claimAutoreleasedReturnValue(v15);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
LABEL_12:

        v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](MSDProgressUpdater, "sharedInstance"));
        objc_msgSend(v16, "updateStage:", 17);

        goto LABEL_13;
      }
      LOWORD(v20) = 0;
      v12 = "Defering the operation until the Pricing update is done...";
      v13 = v11;
      v14 = 2;
    }
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v20, v14);
    goto LABEL_12;
  }
LABEL_13:
  v17 = 0;
  do
  {
    if ((objc_msgSend(v7, "completed", v20) & 1) != 0)
      break;
    +[NSThread sleepForTimeInterval:](NSThread, "sleepForTimeInterval:", 1.0);
    v18 = v17++ >= v5;
  }
  while (!v18 || (int)v5 < 1);

}

- (void)forceSwitchToDemoModeIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint8_t v20[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice modeLock](self, "modeLock"));
  objc_sync_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKeychainManager sharedInstance](MSDKeychainManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getItemForKey:", CFSTR("com.apple.mobilestoredemo.keychainItemID")));

  if (v5)
  {
    v6 = sub_1000604F0();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "The device is enrolled, will force to demo mode now.", buf, 2u);
    }

    if (-[MSDTargetDevice mode](self, "mode") == 4)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateController sharedInstance](MSDDemoUpdateController, "sharedInstance"));
      objc_msgSend(v8, "migrateDataWithBlockingUI:startMigration:", -[MSDTargetDevice mode](self, "mode"), 1);

    }
    -[MSDTargetDevice deleteConfigurationApp](self, "deleteConfigurationApp");
    if (-[MSDTargetDevice allowSnapshotMode](self, "allowSnapshotMode"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWiFiHelper sharedInstance](MSDWiFiHelper, "sharedInstance"));
      objc_msgSend(v9, "saveCurrentWiFiSettings");

    }
    if (-[MSDTargetDevice mode](self, "mode") == 2 || -[MSDTargetDevice mode](self, "mode") == 4)
    {
      -[MSDTargetDevice markContentInstallingInstalled](self, "markContentInstallingInstalled");
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](MSDHelperAgent, "sharedInstance"));
      objc_msgSend(v10, "switchToBackupFolder");

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](MSDProgressUpdater, "sharedInstance"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleInProgress"));
      objc_msgSend(v12, "stopBundleUpdateTimer");

    }
    if (-[MSDTargetDevice mode](self, "mode") == 7)
      -[MSDTargetDevice clearOSUpdateRequest](self, "clearOSUpdateRequest");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](MSDProgressUpdater, "sharedInstance"));
    objc_msgSend(v13, "updateStage:", 7);

    v14 = -[MSDTargetDevice getSavedFlag](self, "getSavedFlag");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
    if ((objc_msgSend(v15, "macOS") & 1) == 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
      if ((objc_msgSend(v16, "iOS") & 1) == 0)
      {

LABEL_22:
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice helperAgent](self, "helperAgent"));
        objc_msgSend(v19, "clearStagedDeviceAfterUpdateProcess");

        -[MSDTargetDevice setMode:](self, "setMode:", 5);
        -[MSDTargetDevice enableSnapshotMode:](self, "enableSnapshotMode:", 1);
        goto LABEL_23;
      }

    }
    if ((v14 & 2) != 0)
      -[MSDTargetDevice waitForPricing:forReboot:](self, "waitForPricing:forReboot:", 60, 1);
    goto LABEL_22;
  }
  v17 = sub_1000604F0();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "The device has not been enrolled, will not force to demo mode.", v20, 2u);
  }

LABEL_23:
  objc_sync_exit(v3);

}

- (void)forceSwitchToDemoUpdateModeIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice modeLock](self, "modeLock"));
  objc_sync_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKeychainManager sharedInstance](MSDKeychainManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getItemForKey:", CFSTR("com.apple.mobilestoredemo.keychainItemID")));

  if (v5)
  {
    v6 = sub_1000604F0();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "The device is enrolled and was updating demo content, will force to demo update mode.", buf, 2u);
    }

    if (-[MSDTargetDevice mode](self, "mode") == 4)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](MSDProgressUpdater, "sharedInstance"));
      objc_msgSend(v8, "updateStage:", 100);

      -[MSDTargetDevice setMode:](self, "setMode:", 2);
    }
  }
  else
  {
    v9 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "The device has not been enrolled, will not force to demo update mode.", v11, 2u);
    }

  }
  objc_sync_exit(v3);

}

- (BOOL)setDemoDeviceFlag
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  id v6;
  NSObject *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
  v4 = objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("DemoDevice"));

  if ((v4 & 1) == 0)
  {
    v6 = sub_1000604F0();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000BE7CC();

  }
  return v4;
}

- (BOOL)setPOSDeviceFlag
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  id v6;
  NSObject *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
  v4 = objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("POSDevice"));

  if ((v4 & 1) == 0)
  {
    v6 = sub_1000604F0();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000BE824();

  }
  return v4;
}

- (void)setPreferredStoreID:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("PreferredStoreID"));

}

- (NSString)preferredStoreID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("PreferredStoreID")));

  return (NSString *)v3;
}

- (void)obliterateDeviceWithAdminCredential:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;

  v3 = objc_alloc_init((Class)DDRResetOptions);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("PreserveESimRequested")));

  v6 = sub_1000604F0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Should we preserve eSim across device obliteration: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  if (!v5 || (objc_msgSend(v5, "BOOLValue") & 1) == 0)
    objc_msgSend(v3, "setEraseDataPlan:", 1);
  v8 = objc_msgSend(objc_alloc((Class)DDRResetRequest), "initWithMode:options:reason:", 4, v3, CFSTR("Demod obliterate Device"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[DDRResetService sharedInstance](DDRResetService, "sharedInstance"));
  objc_msgSend(v9, "resetWithRequest:completion:", v8, &stru_10013E8F0);

}

- (void)backToVirgin:(int)a3
{
  NSObject *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  MSDTargetDevice *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint8_t buf[4];
  _QWORD v30[2];

  v5 = dispatch_semaphore_create(0);
  v6 = -[MSDTargetDevice mode](self, "mode");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateTimeKeeper sharedInstance](MSDDemoUpdateTimeKeeper, "sharedInstance"));
  v28 = 0;
  v8 = objc_msgSend(v7, "shouldCleanUp:", &v28);
  v9 = v28;
  v10 = v9;
  if (v8)
    v8 = objc_msgSend(v9, "code") == (id)3727741185;

  v11 = sub_1000604F0();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v6 == 5 || v8)
  {
    if (v13)
    {
      *(_DWORD *)buf = 67109376;
      LODWORD(v30[0]) = v6;
      WORD2(v30[0]) = 1024;
      *(_DWORD *)((char *)v30 + 6) = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "mode = %d, canceling is %d, need an extra reboot to complete the operation.", buf, 0xEu);
    }

    if (a3 == 9)
    {
      v21 = self;
      v22 = 8;
    }
    else
    {
      if (a3)
        goto LABEL_23;
      v21 = self;
      v22 = 6;
    }
    -[MSDTargetDevice switchModeImmediately:](v21, "switchModeImmediately:", v22);
    goto LABEL_23;
  }
  if (v13)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Clearing all nvrams/demo volume/keychain items/preference-file used by demod.", buf, 2u);
  }

  -[MSDTargetDevice deleteNVRam:](self, "deleteNVRam:", CFSTR("demo-install-state"));
  -[MSDTargetDevice deleteNVRam:](self, "deleteNVRam:", CFSTR("enable-remap-mode"));
  -[MSDTargetDevice deleteNVRam:](self, "deleteNVRam:", CFSTR("msd-request"));
  -[MSDTargetDevice deleteNVRam:](self, "deleteNVRam:", CFSTR("msd-reboot-at"));
  -[MSDTargetDevice deleteNVRam:](self, "deleteNVRam:", CFSTR("msd-last-auto-reboot"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("preserveDDLFlag")));

  if (!v15
    || (v16 = objc_msgSend(v15, "BOOLValue"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance")),
        objc_msgSend(v17, "removeObjectForKey:", CFSTR("preserveDDLFlag")),
        v17,
        (v16 & 1) == 0))
  {
    v18 = sub_1000604F0();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v30[0] = "-[MSDTargetDevice backToVirgin:]";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s - Deleting DDL flag in nvram.", buf, 0xCu);
    }

    -[MSDTargetDevice deleteNVRam:](self, "deleteNVRam:", CFSTR("ownership-warning"));
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAccountManager sharedInstance](MSDAccountManager, "sharedInstance"));
  objc_msgSend(v20, "removeAccounts:", 0);

  -[MSDTargetDevice manageDemoVolume:](self, "manageDemoVolume:", CFSTR("Delete"));
  -[MSDTargetDevice unregisterCAHeartbeatActivity](self, "unregisterCAHeartbeatActivity");
  if (a3 == 9)
  {
    -[MSDTargetDevice obliterateDeviceWithAdminCredential:](self, "obliterateDeviceWithAdminCredential:", 0);
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    -[MSDTargetDevice deactivateDevice](self, "deactivateDevice");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[MSDCryptoHandler sharedInstance](MSDCryptoHandler, "sharedInstance"));
    objc_msgSend(v23, "deleteSecretKey");

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAppPrivacyPermissionsHelper sharedInstance](MSDAppPrivacyPermissionsHelper, "sharedInstance"));
    objc_msgSend(v24, "revokePrivacyPermissionsForAllApps");

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice pathForDummyPreferenceFile](self, "pathForDummyPreferenceFile"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    objc_msgSend(v26, "removeItemAtPath:error:", v25, 0);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKeychainManager sharedInstance](MSDKeychainManager, "sharedInstance"));
    objc_msgSend(v27, "deleteItemForKey:", CFSTR("com.apple.mobilestoredemo.keychainItemID"));

    -[MSDTargetDevice enableSnapshotMode:](self, "enableSnapshotMode:", 0);
  }

LABEL_23:
}

- (BOOL)removePerHubInfoFromPreferencesForMigration
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = objc_msgSend(v2, "removeObjectsForKeys:", &off_10014E4B0);

  return v3;
}

- (BOOL)cleanUpPreferencesFile
{
  id v2;
  __int128 v3;
  id v4;
  uint64_t v5;
  void *i;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  unsigned __int8 v13;
  id v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  _BYTE v24[128];

  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = objc_msgSend(&off_10014E4C8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v2)
  {
    v4 = v2;
    v5 = *(_QWORD *)v19;
    *(_QWORD *)&v3 = 138543362;
    v17 = v3;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(&off_10014E4C8);
        v7 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance", v17));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v7));

        if (v9)
        {
          v10 = sub_1000604F0();
          v11 = objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v17;
            v23 = v7;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Removing legacy key %{public}@ from preference file", buf, 0xCu);
          }

          v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
          v13 = objc_msgSend(v12, "removeObjectForKey:", v7);

          if ((v13 & 1) == 0)
          {
            v15 = sub_1000604F0();
            v16 = objc_claimAutoreleasedReturnValue(v15);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              sub_1000BE850();

            return 0;
          }
        }
      }
      v4 = objc_msgSend(&off_10014E4C8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      if (v4)
        continue;
      break;
    }
  }
  return 1;
}

- (BOOL)migrateDemoDeviceToDemoVolume
{
  MSDTargetDevice *v2;
  unsigned int v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[MSDTargetDevice migratePreferenceAndWifiSettingsToDemoVolume](v2, "migratePreferenceAndWifiSettingsToDemoVolume");
  if (v3)
    -[MSDTargetDevice migrateNvramToDemoVolume](v2, "migrateNvramToDemoVolume");
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)migratePreferenceAndWifiSettingsToDemoVolume
{
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  BOOL v10;
  void *v11;
  unsigned int v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  unsigned __int8 v19;
  id v20;
  id v22;
  id v23;
  uint8_t v24[8];
  id v25;
  uint8_t v26[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  -[MSDTargetDevice manageDemoVolume:](self, "manageDemoVolume:", CFSTR("Setup"));
  if (+[MSDPreferencesFile preferencesFileExists](MSDPreferencesFile, "preferencesFileExists"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice pathForDummyPreferenceFile](self, "pathForDummyPreferenceFile"));
    v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

    if (v5)
    {
      v6 = sub_1000604F0();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Migration already done.", buf, 2u);
      }
      v8 = 0;
      v9 = 0;
      v10 = 1;
      goto LABEL_19;
    }
  }
  if (+[MSDPreferencesFile preferencesFileExists](MSDPreferencesFile, "preferencesFileExists")
    || (v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice pathForDummyPreferenceFile](self, "pathForDummyPreferenceFile")),
        v12 = objc_msgSend(v3, "fileExistsAtPath:", v11),
        v11,
        !v12))
  {
    v20 = sub_1000604F0();
    v7 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Migration encountered unexpected error.", v24, 2u);
    }
    v8 = 0;
    v9 = 0;
    goto LABEL_18;
  }
  v13 = sub_1000604F0();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Need to migrate old preferences file and other data.", v26, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/Preferences/com.apple.MobileStoreDemo.WiFiSetting.plist")));
  -[MSDTargetDevice manageDemoVolume:](self, "manageDemoVolume:", CFSTR("Delete"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice pathForDummyPreferenceFile](self, "pathForDummyPreferenceFile"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile preferencesFilePath](MSDPreferencesFile, "preferencesFilePath"));
  v25 = 0;
  v17 = objc_msgSend(v3, "moveItemAtPath:toPath:error:", v15, v16, &v25);
  v8 = v25;

  if ((v17 & 1) == 0)
  {
    v22 = sub_1000605D0();
    v7 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000BE8E0();
    goto LABEL_18;
  }
  if (v9)
    -[MSDTargetDevice setWifiSettings:](self, "setWifiSettings:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice pathForDummyPreferenceFile](self, "pathForDummyPreferenceFile"));
  v19 = objc_msgSend(v3, "createFileAtPath:contents:attributes:", v18, 0, 0);

  if ((v19 & 1) == 0)
  {
    v23 = sub_1000605D0();
    v7 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000BE8B4();
LABEL_18:
    v10 = 0;
LABEL_19:

    goto LABEL_20;
  }
  v10 = 1;
LABEL_20:

  return v10;
}

- (void)migrateNvramToDemoVolume
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice readNVRam:](self, "readNVRam:", CFSTR("demo-install-state")));
  if (v4)
  {
    v5 = objc_opt_class(NSData, v3);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", objc_msgSend(objc_retainAutorelease(v4), "bytes"), 4));
      -[MSDTargetDevice setMode:](self, "setMode:", objc_msgSend(v6, "intValue"));
      -[MSDTargetDevice deleteNVRam:](self, "deleteNVRam:", CFSTR("demo-install-state"));

    }
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice readNVRam:](self, "readNVRam:", CFSTR("msd-reboot-at")));

  if (v7)
  {
    v9 = objc_opt_class(NSData, v8);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
      -[MSDTargetDevice deleteNVRam:](self, "deleteNVRam:", CFSTR("msd-reboot-at"));
  }
  -[MSDTargetDevice removeKeyFromPreferenceFile:](self, "removeKeyFromPreferenceFile:", CFSTR("msd-reboot-at"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice readNVRam:](self, "readNVRam:", CFSTR("enable-remap-mode")));

  if (v10)
    -[MSDTargetDevice deleteNVRam:](self, "deleteNVRam:", CFSTR("enable-remap-mode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice readNVRam:](self, "readNVRam:", CFSTR("msd-last-auto-reboot")));

  if (v11)
  {
    v13 = objc_opt_class(NSString, v12);
    if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
      -[MSDTargetDevice deleteNVRam:](self, "deleteNVRam:", CFSTR("msd-last-auto-reboot"));
  }
  -[MSDTargetDevice removeKeyFromPreferenceFile:](self, "removeKeyFromPreferenceFile:", CFSTR("msd-last-auto-reboot"));
  v17 = (id)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice readNVRam:](self, "readNVRam:", CFSTR("msd-request")));

  if (v17)
  {
    v15 = objc_opt_class(NSData, v14);
    if ((objc_opt_isKindOfClass(v17, v15) & 1) != 0)
    {
      v16 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v17, 4);
      -[MSDTargetDevice setRequest:](self, "setRequest:", v16);

      -[MSDTargetDevice deleteNVRam:](self, "deleteNVRam:", CFSTR("msd-request"));
    }
  }

}

- (BOOL)setupDemoDeviceMetadataFolder
{
  MSDTargetDevice *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;
  BOOL v6;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  uint64_t v12;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  -[MSDTargetDevice manageDemoVolume:](v2, "manageDemoVolume:", CFSTR("Setup"));
  if (!-[MSDTargetDevice createMobileStoreDemoCache](v2, "createMobileStoreDemoCache"))
  {
    v8 = sub_1000605D0();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000BE990();
    goto LABEL_9;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice pathForDummyPreferenceFile](v2, "pathForDummyPreferenceFile"));
  v5 = objc_msgSend(v3, "createFileAtPath:contents:attributes:", v4, 0, 0);

  if ((v5 & 1) == 0)
  {
    v10 = sub_1000605D0();
    v9 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice pathForDummyPreferenceFile](v2, "pathForDummyPreferenceFile"));
      sub_1000BE944(v11, (uint64_t)&v12, v9);
    }
LABEL_9:

    v6 = 0;
    goto LABEL_4;
  }
  v6 = 1;
LABEL_4:

  objc_sync_exit(v2);
  return v6;
}

- (BOOL)setupFactoryDemoDeviceMetadataFolder
{
  MSDTargetDevice *v2;
  id v3;
  NSObject *v4;
  void *v5;
  unsigned __int8 v6;
  uint8_t v8[16];

  v2 = self;
  objc_sync_enter(v2);
  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting up metadata folder for factory demo device...", v8, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](MSDHelperAgent, "sharedInstance"));
  v6 = objc_msgSend(v5, "prepareWorkDirectory:writableByNonRoot:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata"), 1);

  objc_sync_exit(v2);
  return v6;
}

- (id)pathForDummyPreferenceFile
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/var/mobile/Library/Preferences"), "stringByAppendingPathComponent:", CFSTR("com.apple.MobileStoreDemo")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByAppendingPathExtension:", CFSTR("plist")));

  return v3;
}

- (BOOL)setupDummyPreferenceFile
{
  MSDTargetDevice *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v9;
  NSObject *v10;
  void *v11;
  uint8_t v12[24];

  v2 = self;
  objc_sync_enter(v2);
  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting up dummy preference (keep alive) file for factory demo device...", v12, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice pathForDummyPreferenceFile](v2, "pathForDummyPreferenceFile"));
  v7 = objc_msgSend(v5, "createFileAtPath:contents:attributes:", v6, 0, 0);

  if ((v7 & 1) == 0)
  {
    v9 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice pathForDummyPreferenceFile](v2, "pathForDummyPreferenceFile"));
      sub_1000BE944(v11, (uint64_t)v12, v10);
    }

  }
  objc_sync_exit(v2);

  return v7;
}

- (void)cleanupDummyPreferenceFile
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Removing dummy preference (keep alive) file for factory demo device...", v7, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice pathForDummyPreferenceFile](self, "pathForDummyPreferenceFile"));
  objc_msgSend(v5, "removeItemAtPath:error:", v6, 0);

}

- (BOOL)moveFilesToFinalDst:(id)a3 finalPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  id v11;
  NSObject *v12;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice helperAgent](self, "helperAgent"));
  v9 = objc_msgSend(v8, "moveStagingToFinal:finalPath:", v6, v7);

  if ((v9 & 1) == 0)
  {
    v11 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1000BE9BC();

  }
  return v9;
}

- (void)patchBackupFolderInStaging:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  unsigned __int8 v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice pathForDummyPreferenceFile](self, "pathForDummyPreferenceFile"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", v6));

  if (objc_msgSend(v5, "fileExistsAtPath:", v7))
  {
    v8 = sub_1000604F0();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Preference file already in backup path, removing it.", buf, 2u);
    }

    v24 = 0;
    v10 = objc_msgSend(v5, "removeItemAtPath:error:", v7, &v24);
    v11 = v24;
    v12 = v11;
    if ((v10 & 1) == 0)
    {
      v20 = sub_1000604F0();
      v18 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_1000BEAB0();
      v14 = 0;
      goto LABEL_19;
    }
    v13 = v11;
  }
  else
  {
    v13 = 0;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByDeletingLastPathComponent"));
  if ((objc_msgSend(v5, "fileExistsAtPath:", v14) & 1) == 0)
  {
    v23 = v13;
    v15 = objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v14, 1, 0, &v23);
    v12 = v23;

    if ((v15 & 1) == 0)
    {
      v21 = sub_1000604F0();
      v18 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_1000BEA30(v12, v18);
      goto LABEL_19;
    }
    v13 = v12;
  }
  v22 = v13;
  v16 = objc_msgSend(v5, "copyItemAtPath:toPath:error:", v6, v7, &v22);
  v12 = v22;

  if ((v16 & 1) == 0)
  {
    v17 = sub_1000604F0();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedDescription"));
      *(_DWORD *)buf = 138543874;
      v26 = v6;
      v27 = 2114;
      v28 = v7;
      v29 = 2114;
      v30 = v19;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Cannot copy preference file to backup path (from %{public}@ to %{public}@ - %{public}@)", buf, 0x20u);

    }
LABEL_19:

  }
}

- (void)rebootForStage:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t buf[16];

  v3 = *(_QWORD *)&a3;
  v5 = dispatch_semaphore_create(0);
  v6 = sub_1000604F0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Reporting progress - reboot", buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](MSDProgressUpdater, "sharedInstance"));
  objc_msgSend(v8, "updateStage:", v3);

  -[MSDTargetDevice configApplePencilToEnterSleepModeIfPaired](self, "configApplePencilToEnterSleepModeIfPaired");
  v9 = sub_1000604F0();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Rebooting...", v15, 2u);
  }

  v11 = sub_1000604F0();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, " ", v14, 2u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice helperAgent](self, "helperAgent"));
  objc_msgSend(v13, "reboot");

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)rebootWithSnapshotRevertForStage:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](MSDUIHelper, "sharedInstance"));
  objc_msgSend(v5, "startFullScreenUIWith:allowCancel:", CFSTR("IN_PROGRESS"), 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](MSDAnalytics, "sharedInstance"));
  objc_msgSend(v6, "rollOverCoreAnalyticsLogs");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoPeerPairingManager sharedInstance](MSDDemoPeerPairingManager, "sharedInstance"));
  objc_msgSend(v7, "preservePairedPeersData");

  -[MSDTargetDevice manageDeviceSnapshot:](self, "manageDeviceSnapshot:", CFSTR("RevertSnapshot"));
  -[MSDTargetDevice saveSnapshotRevertFlagged:](self, "saveSnapshotRevertFlagged:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  -[MSDTargetDevice saveLastSnapshotRevertTime:](self, "saveLastSnapshotRevertTime:", v8);

  if ((_DWORD)v3 == 33)
    -[MSDTargetDevice shutdown](self, "shutdown");
  else
    -[MSDTargetDevice rebootForStage:](self, "rebootForStage:", v3);
}

- (void)reboot
{
  -[MSDTargetDevice rebootForStage:](self, "rebootForStage:", 27);
}

- (void)shutdown
{
  NSObject *v2;
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  uint8_t v7[16];

  v2 = dispatch_semaphore_create(0);
  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Device shutting down...", v7, 2u);
  }

  v5 = objc_msgSend(objc_alloc((Class)FBSShutdownOptions), "initWithReason:", CFSTR("demod shutdown device"));
  objc_msgSend(v5, "setRebootType:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FBSSystemService sharedService](FBSSystemService, "sharedService"));
  objc_msgSend(v6, "shutdownWithOptions:", v5);

  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)configApplePencilToEnterSleepModeIfPaired
{
  id v2;
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  unsigned int v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  uint8_t v14[8];
  id v15;
  uint8_t buf[4];
  id v17;

  v2 = objc_alloc_init((Class)HIDManager);
  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Configuring Apple Pencil (if any) before device reboot...", buf, 2u);
  }

  objc_msgSend(v2, "setDeviceMatching:", &off_10014E768);
  objc_msgSend(v2, "setDispatchQueue:", &_dispatch_main_q);
  objc_msgSend(v2, "open");
  objc_msgSend(v2, "activate");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "devices"));
  if (objc_msgSend(v5, "count") == (id)1)
  {
    buf[2] = 1;
    *(_WORD *)buf = 676;
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    -[NSObject open](v6, "open");
    -[NSObject activate](v6, "activate");
    v15 = 0;
    v7 = -[NSObject setReport:reportLength:withIdentifier:forType:error:](v6, "setReport:reportLength:withIdentifier:forType:error:", buf, 3, 164, 2, &v15);
    v8 = v15;
    v9 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = v10;
    if (v7)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "HID Report successfully sent to Apple Pencil!", v14, 2u);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      sub_1000BEADC(v8, v11);
    }

    -[NSObject close](v6, "close");
  }
  else
  {
    v12 = sub_1000604F0();
    v6 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(v5, "count");
      *(_DWORD *)buf = 134217984;
      v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No or multiple matching Apple Pencil device(s) found: %lu", buf, 0xCu);
    }
  }

  objc_msgSend(v2, "close");
}

- (void)manualUpdateMode:(BOOL *)a3 allowChange:(BOOL *)a4
{
  unsigned int v7;
  id v8;
  NSObject *v9;

  if (a3 && a4)
  {
    v7 = -[MSDTargetDevice mode](self, "mode");
    if (v7 >= 2)
    {
      *a3 = 0;
      *a4 = v7 == 5;
    }
    else
    {
      *a3 = 1;
      *a4 = -[MSDTargetDevice allowEnteringDemoMode](self, "allowEnteringDemoMode");
    }
  }
  else
  {
    v8 = sub_1000604F0();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      sub_1000BEB5C();

  }
}

- (id)deviceInformation:(id)a3
{
  return -[MSDTargetDevice deviceInformation:appendPingInfo:](self, "deviceInformation:appendPingInfo:", a3, 0);
}

- (id)deviceInformationForPing:(id)a3
{
  return -[MSDTargetDevice deviceInformation:appendPingInfo:](self, "deviceInformation:appendPingInfo:", a3, 1);
}

- (id)deviceInformation:(id)a3 appendPingInfo:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  MSDTargetDevice *v17;
  id v18;

  v4 = a4;
  v6 = a3;
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_1000475F4;
  v16 = &unk_10013E918;
  v17 = self;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v18 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v13);

  if (v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAccountManager sharedInstance](MSDAccountManager, "sharedInstance", v13, v14, v15, v16, v17));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "existingAccounts"));
    v10 = objc_msgSend(v9, "mutableCopy");

    if (v10)
      objc_msgSend(v7, "setObject:forKey:", v10, CFSTR("MSDExistingAccounts"));

  }
  if (objc_msgSend(v7, "count", v13, v14, v15, v16, v17))
    v11 = v7;
  else
    v11 = 0;

  return v11;
}

- (id)getCachingHubFailureEventForPing
{
  id v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint8_t buf[4];
  void *v14;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  if ((byte_100175328 & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice localHubFailureReason](self, "localHubFailureReason"));

    if (v5)
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice localHubFailureReason](self, "localHubFailureReason"));
    else
      v6 = CFSTR("Default:Local Hub Not Reachable");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", CFSTR("CACHING_HUB_FAILURE"), CFSTR("error"), v6, CFSTR("reason"), 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice udid](self, "udid"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v8, CFSTR("UniqueDeviceID"), v7, CFSTR("MSDCachingHubEvent"), 0));

    byte_100175328 = 1;
    v10 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Reporting event:%{public}@", buf, 0xCu);
    }

    v3 = v9;
    v4 = v3;
  }

  return v4;
}

- (id)getS3ServerFailureEventForPing
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint8_t buf[4];
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice s3ServerFailureReason](self, "s3ServerFailureReason"));

  if (v4)
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice s3ServerFailureReason](self, "s3ServerFailureReason"));
  else
    v5 = CFSTR("Default:S3 Server Not Reachable");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", CFSTR("S3_SERVER_FAILURE"), CFSTR("error"), v5, CFSTR("reason"), 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice udid](self, "udid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v7, CFSTR("UniqueDeviceID"), v6, CFSTR("MSDS3ServerEvent"), 0));

  v9 = sub_1000604F0();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Reporting event:%{public}@", buf, 0xCu);
  }

  return v8;
}

- (NSString)manifestPath
{
  return (NSString *)CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer/Manifest.signed.plist");
}

- (NSString)manifestAndFileDownloadInfoPath
{
  return (NSString *)CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer/ManifestAndFileDownloadInfo.plist");
}

- (BOOL)criticalUpdatePrioritized
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("criticalContentUpdateOnly")));
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setCriticalUpdatePrioritized:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _DWORD v8[2];

  v3 = a3;
  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting criticalupdate:%d", (uint8_t *)v8, 8u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("criticalContentUpdateOnly"));

}

- (BOOL)saveOperationRequest:(id)a3 requestFlag:(int)a4 completeBy:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v8 = a3;
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("UpdateContent")) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", CFSTR("RevertSnapshot")) & 1) == 0)
  {
    v6 = -[MSDTargetDevice getSavedFlag](self, "getSavedFlag");
  }
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("UpdateContent")) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", CFSTR("UpdateOS")) & 1) == 0)
  {
    v5 = -[MSDTargetDevice getSavedCompleteByInterval](self, "getSavedCompleteByInterval");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@:%@:%d:%d"), v8, &stru_100141020, &stru_100141020, v6, v5));
  -[MSDTargetDevice setRequest:](self, "setRequest:", v9);

  return 1;
}

- (BOOL)saveOperationError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  uint8_t buf[4];
  NSObject *v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice getSavedRequest](self, "getSavedRequest"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedFailureReason"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
    v8 = objc_msgSend(v4, "code");
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedDescription"));
    v10 = (void *)v9;
    if (v6)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedFailureReason"));
      v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("demoUpdateFailed: %@:0x%lx: %@ - %@"), v7, v8, v10, v11));

    }
    else
    {
      v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("demoUpdateFailed: %@:0x%lx: %@"), v7, v8, v9));
    }

    v13 = sub_1000604F0();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Saving error message: %{public}@", buf, 0xCu);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%08lX"), objc_msgSend(v4, "code")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedDescription"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@:%@"), v15, v16, v17));
    -[MSDTargetDevice setResponse:](self, "setResponse:", v18);

  }
  else
  {
    v20 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1000BEBE0();
  }

  return v5 != 0;
}

- (BOOL)deleteOperationRequest
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice request](self, "request"));

  if (!v3
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance")),
        objc_msgSend(v4, "removeObjectForKey:", CFSTR("criticalContentUpdateOnly")),
        v4,
        v5 = -[MSDTargetDevice removeKeyFromPreferenceFile:](self, "removeKeyFromPreferenceFile:", CFSTR("msd-request"))))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice response](self, "response"));

    if (v6)
      LOBYTE(v5) = -[MSDTargetDevice removeKeyFromPreferenceFile:](self, "removeKeyFromPreferenceFile:", CFSTR("msd-response"));
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)deleteOperationRequestAndQuitHelper
{
  _BOOL4 v3;
  void *v4;
  unsigned __int8 v5;

  v3 = -[MSDTargetDevice deleteOperationRequest](self, "deleteOperationRequest");
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice helperAgent](self, "helperAgent"));
    v5 = objc_msgSend(v4, "quitHelper");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (id)decodeComponentIdx:(int)a3 forSavedString:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _DWORD v16[2];
  __int16 v17;
  void *v18;

  v5 = a4;
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(":")));
    v8 = sub_1000604F0();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = a3;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a3));
      v16[0] = 67109378;
      v16[1] = a3;
      v17 = 2114;
      v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "components[%d] = %{public}@", (uint8_t *)v16, 0x12u);

    }
    if ((unint64_t)objc_msgSend(v7, "count") > a3
      && (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a3)),
          v14 = objc_msgSend(v13, "length"),
          v13,
          v14))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v10));
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)getSavedRequest
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice request](self, "request"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice decodeComponentIdx:forSavedString:](self, "decodeComponentIdx:forSavedString:", 0, v3));

  return v4;
}

- (int)getSavedFlag
{
  void *v3;
  void *v4;
  int v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice request](self, "request"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice decodeComponentIdx:forSavedString:](self, "decodeComponentIdx:forSavedString:", 3, v3));

  if (v4)
    v5 = objc_msgSend(v4, "intValue");
  else
    v5 = 1;

  return v5;
}

- (int)getSavedCompleteByInterval
{
  void *v3;
  void *v4;
  int v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice request](self, "request"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice decodeComponentIdx:forSavedString:](self, "decodeComponentIdx:forSavedString:", 4, v3));

  if (v4)
    v5 = objc_msgSend(v4, "intValue");
  else
    v5 = 0;

  return v5;
}

- (id)getSavedError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  unsigned int v16;
  uint8_t buf[4];
  void *v18;
  NSErrorUserInfoKey v19;
  void *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice response](self, "response"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice decodeComponentIdx:forSavedString:](self, "decodeComponentIdx:forSavedString:", 0, v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice response](self, "response"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice decodeComponentIdx:forSavedString:](self, "decodeComponentIdx:forSavedString:", 1, v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice response](self, "response"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice decodeComponentIdx:forSavedString:](self, "decodeComponentIdx:forSavedString:", 2, v7));

  v16 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v4));
  v10 = v9;
  if (v4)
  {
    if (objc_msgSend(v9, "scanHexInt:", &v16))
    {
      v11 = v16;
      v19 = NSLocalizedDescriptionKey;
      v20 = v8;
      v12 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v6, v11, v12));
    }
    else
    {
      v14 = sub_1000604F0();
      v12 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v18 = v4;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unable to decode saved error code: %{public}@; ignoring",
          buf,
          0xCu);
      }
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSDate)lastRebootTime
{
  id v4;
  NSObject *v5;
  size_t v6;
  _QWORD v7[2];
  int v8[2];

  v7[0] = 0;
  v7[1] = 0;
  v6 = 16;
  *(_QWORD *)v8 = 0x1500000001;
  if (sysctl(v8, 2u, v7, &v6, 0, 0) != -1 && v7[0] != 0)
    return (NSDate *)(id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)v7[0]));
  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_1000BEC0C();

  return (NSDate *)0;
}

- (NSNumber)nandSize
{
  const __CFDictionary *v2;
  io_registry_entry_t v3;
  void *CFProperty;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  mach_port_t mainPort[2];

  *(_QWORD *)mainPort = 0;
  if (IOMasterPort(0, &mainPort[1]))
  {
    v6 = sub_1000604F0();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000BED14();
  }
  else
  {
    v2 = IOBSDNameMatching(mainPort[1], 0, "disk0");
    if (v2)
    {
      if (IOServiceGetMatchingServices(mainPort[1], v2, mainPort))
      {
        v9 = sub_1000604F0();
        v7 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          sub_1000BECE8();
      }
      else if (mainPort[0])
      {
        v3 = IOIteratorNext(mainPort[0]);
        if (v3)
        {
          CFProperty = (void *)IORegistryEntryCreateCFProperty(v3, CFSTR("Size"), kCFAllocatorDefault, 0);
          if (CFProperty)
            goto LABEL_7;
          v12 = sub_1000604F0();
          v7 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
            sub_1000BECBC();
        }
        else
        {
          v11 = sub_1000604F0();
          v7 = objc_claimAutoreleasedReturnValue(v11);
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
            sub_1000BEC90();
        }
      }
      else
      {
        v10 = sub_1000604F0();
        v7 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          sub_1000BEC64();
      }
    }
    else
    {
      v8 = sub_1000604F0();
      v7 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_1000BEC38();
    }
  }

  CFProperty = 0;
LABEL_7:
  if (mainPort[0])
    IOObjectRelease(mainPort[0]);
  return (NSNumber *)CFProperty;
}

- (NSString)OSVersion
{
  return (NSString *)(id)MGCopyAnswer(CFSTR("ProductVersion"), 0);
}

- (NSString)OSBuild
{
  return (NSString *)(id)MGCopyAnswer(CFSTR("BuildVersion"), 0);
}

- (NSString)demodVersion
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForInfoDictionaryKey:", CFSTR("CFBundleVersion")));

  return (NSString *)v3;
}

- (NSString)packageVersion
{
  return 0;
}

- (NSString)productType
{
  return (NSString *)(id)MGCopyAnswer(CFSTR("ProductType"), 0);
}

- (int64_t)batteryCapacity
{
  void *v2;
  id v3;

  v2 = (void *)MGCopyAnswer(CFSTR("BatteryCurrentCapacity"), 0);
  v3 = objc_msgSend(v2, "integerValue");

  return (int64_t)v3;
}

- (BOOL)demoSetup
{
  void *v4;

  if (-[MSDTargetDevice mode](self, "mode"))
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice request](self, "request"));

  return v4 != 0;
}

- (int)activationConfigurationFlags
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  int v6;
  id v8;
  id v9;
  id v10;

  v10 = 0;
  v2 = MAECopyActivationRecordWithError(&v10, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = v10;
  if (v4)
  {
    v8 = sub_1000604F0();
    v5 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000BED6C(v4, v5);
    goto LABEL_9;
  }
  if (!v3)
  {
    v9 = sub_1000604F0();
    v5 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000BED40();
LABEL_9:
    v6 = 0;
    goto LABEL_4;
  }
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DeviceConfigurationFlags")));
  v6 = -[NSObject intValue](v5, "intValue");
LABEL_4:

  return v6;
}

- (BOOL)isVerifiedDemoDevice
{
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint8_t v9[16];

  if (os_variant_has_internal_content("com.apple.mobilestoredemod")
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](MSDTestPreferences, "sharedInstance")),
        v4 = objc_msgSend(v3, "fakeActivationDemoBit"),
        v3,
        v4))
  {
    v5 = sub_1000604F0();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Device is running internal build and wants to fake demo bit; Pass as demo device!",
        v9,
        2u);
    }

    LOBYTE(v7) = 1;
  }
  else
  {
    return (-[MSDTargetDevice activationConfigurationFlags](self, "activationConfigurationFlags") >> 1) & 1;
  }
  return v7;
}

- (BOOL)isVerifiedPOSDevice
{
  return (-[MSDTargetDevice activationConfigurationFlags](self, "activationConfigurationFlags") >> 2) & 1;
}

- (BOOL)isPressDemoDevice
{
  unsigned __int8 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  if (!+[MSDOSFeatureFlags isPressDemoModeEnabled](MSDOSFeatureFlags, "isPressDemoModeEnabled"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice hubSuppliedSettings](self, "hubSuppliedSettings"));
    v5 = v4;
    if (v4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("DemoMode")));
      if (v7)
      {
        v8 = objc_opt_class(NSString, v6);
        if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
        {
          v3 = objc_msgSend(v7, "isEqualToString:", CFSTR("press"));
LABEL_15:

          return v3;
        }
      }

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice getDeviceOptions](self, "getDeviceOptions"));
    v7 = v9;
    if (v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("demo_mode")));
      if (v11 && (v12 = objc_opt_class(NSString, v10), (objc_opt_isKindOfClass(v11, v12) & 1) != 0))
        v3 = objc_msgSend(v11, "isEqualToString:", CFSTR("press"));
      else
        v3 = 0;

    }
    else
    {
      v3 = 0;
    }
    goto LABEL_15;
  }
  return 1;
}

- (BOOL)isContentFrozen
{
  if (-[MSDTargetDevice mode](self, "mode") == 5)
    return -[MSDTargetDevice allowSnapshotMode](self, "allowSnapshotMode");
  else
    return 0;
}

- (BOOL)isBetterTogetherDemo
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice getDeviceOptions](self, "getDeviceOptions"));
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("enable_better_together")));
    v5 = v4;
    if (v4)
      v6 = objc_msgSend(v4, "BOOLValue");
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)deactivateDevice
{
  char v2;
  id v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  id v9;

  v7 = 0;
  v2 = MAEDeactivateDeviceWithError(&v7, a2);
  v3 = v7;
  if ((v2 & 1) == 0)
  {
    v4 = sub_1000604F0();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Deactivation failed with error - %{public}@", buf, 0xCu);
    }

  }
  return v2;
}

- (NSData)certificateHash
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("CertificateHash")));

  return (NSData *)v3;
}

- (BOOL)isDemoEligible
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("DemoEligible")));

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (BOOL)isOfflineMode
{
  unint64_t v3;
  void *v4;
  unsigned __int8 v5;

  v3 = -[MSDTargetDevice typeOfDemoDevice](self, "typeOfDemoDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice getDemoEnrollmentFlag](self, "getDemoEnrollmentFlag"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("enrollmentSuccess"));

  if (!-[MSDTargetDevice mode](self, "mode") && (v3 == 5 || v3 == 3))
    return v5 ^ 1;
  else
    return 0;
}

- (BOOL)dcotaOfflineModeDevice
{
  unsigned __int8 v3;
  unint64_t v4;
  unsigned __int8 v5;
  unsigned __int8 v6;

  v3 = -[MSDTargetDevice isDemoEligible](self, "isDemoEligible");
  v4 = -[MSDTargetDevice typeOfDemoDevice](self, "typeOfDemoDevice");
  v5 = -[MSDTargetDevice isOfflineMode](self, "isOfflineMode");
  if (v4 == 5)
    v6 = v5;
  else
    v6 = 0;
  return v6 & v3;
}

- (BOOL)cachedBundleInstallAttempted
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("CachedBundleInstallState")));
  v4 = v3 != 0;

  return v4;
}

- (NSString)cachedBundleInstallState
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("CachedBundleInstallState")));

  return (NSString *)v3;
}

- (void)setCachedBundleInstallState:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("CachedBundleInstallState"));

}

- (NSString)installedFactoryBundleID
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v9;
  NSObject *v10;
  uint64_t v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("InstalledFactoryBundleID")));

  if (v3)
    goto LABEL_5;
  v4 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.demo-settings"));
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("InstalledFactoryBundleID")));
  if (!v3)
  {
LABEL_10:

    v7 = 0;
    goto LABEL_6;
  }
  v6 = objc_opt_class(NSString, v5);
  if ((objc_opt_isKindOfClass(v3, v6) & 1) == 0)
  {
    v9 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1000BEDEC((uint64_t)v3, v10, v11);

    goto LABEL_10;
  }

LABEL_5:
  v3 = v3;
  v7 = v3;
LABEL_6:

  return (NSString *)v7;
}

- (void)setInstalledFactoryBundleID:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("InstalledFactoryBundleID"));

}

- (void)kickOffCachedBundleInstall
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  NSObject *v21;
  uint8_t v22[16];
  uint8_t v23[16];
  uint8_t v24[16];
  uint8_t v25[16];
  uint8_t v26[16];
  uint8_t buf[15];
  char v28;

  v28 = 0;
  v3 = -[MSDTargetDevice isOfflineMode](self, "isOfflineMode");
  v4 = -[MSDTargetDevice isVerifiedDemoDevice](self, "isVerifiedDemoDevice");
  v5 = -[MSDTargetDevice dcotaOfflineModeDevice](self, "dcotaOfflineModeDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice getDemoEnrollmentFlag](self, "getDemoEnrollmentFlag"));

  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Kicking off cached bundle install for current device locale", buf, 2u);
  }

  v9 = (void *)os_transaction_create("Installing cached bundles");
  if (!v6)
  {
    if (v4)
    {
      v10 = sub_1000604F0();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Setting up demo device metadata folder for DCOTA managed device", v26, 2u);
      }

      -[MSDTargetDevice setupDemoDeviceMetadataFolder](self, "setupDemoDeviceMetadataFolder");
    }
    else if (v3)
    {
      v12 = sub_1000604F0();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Setting up metadata folder for non-DCOTA managed device", v25, 2u);
      }

      -[MSDTargetDevice setupFactoryDemoDeviceMetadataFolder](self, "setupFactoryDemoDeviceMetadataFolder");
    }
  }
  v14 = sub_1000604F0();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Waiting for buddy to quit...", v24, 2u);
  }

  -[MSDTargetDevice waitForBuddyWithTimeout](self, "waitForBuddyWithTimeout");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateController sharedInstance](MSDDemoUpdateController, "sharedInstance"));
  objc_msgSend(v16, "installCachedContentForCurrentLocale:", &v28);

  if (v5)
  {
    if (!v6)
    {
      v17 = sub_1000604F0();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Setting up device to perform enrollment retries", v23, 2u);
      }

      -[MSDTargetDevice setDemoEnrollmentFlag:](self, "setDemoEnrollmentFlag:", CFSTR("enrollmentStarted"));
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[MSDFindMyHub sharedInstance](MSDFindMyHub, "sharedInstance"));
    objc_msgSend(v19, "setupOfflineModeEnrollmentRetry");

  }
  if (v28)
  {
    if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
      -[MSDTargetDevice delayRebootForTesting](self, "delayRebootForTesting");
    v20 = sub_1000604F0();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Rebooting device after cached bundle install", v22, 2u);
    }

    -[MSDTargetDevice reboot](self, "reboot");
  }

}

- (id)hubCertificateIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("HubCertificateIdentifier")));

  return v3;
}

- (BOOL)saveHubCertificateIdentifer:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("HubCertificateIdentifier"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  LOBYTE(v3) = objc_msgSend(v5, "removeObjectsForKeys:", &off_10014E4E0);

  return (char)v3;
}

- (NSString)hubHostName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("HubHostName")));

  return (NSString *)v3;
}

- (void)setHubHostName:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;

  v3 = a3;
  if (+[MSDPreferencesFile preferencesFileExists](MSDPreferencesFile, "preferencesFileExists"))
  {
    v4 = sub_1000604F0();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Saving hub host name: %{public}@", (uint8_t *)&v7, 0xCu);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
    objc_msgSend(v6, "setObject:forKey:", v3, CFSTR("HubHostName"));

  }
}

- (id)hubHostNameList
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("HubHostNameList")));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice hubHostName](self, "hubHostName"));
    if (v5)
      v6 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v5));
    else
      v6 = objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
    v4 = (void *)v6;
    -[MSDTargetDevice saveHubHostNameList:](self, "saveHubHostNameList:", v6);

  }
  return v4;
}

- (BOOL)saveHubHostNameList:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = a3;
  if (!v3)
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v5 = objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("HubHostNameList"));

  return v5;
}

- (NSString)hubPort
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("HubPort")));

  return (NSString *)v3;
}

- (void)setHubPort:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;

  v3 = a3;
  if (+[MSDPreferencesFile preferencesFileExists](MSDPreferencesFile, "preferencesFileExists"))
  {
    v4 = sub_1000604F0();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Saving hub port: %{public}@", (uint8_t *)&v7, 0xCu);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
    objc_msgSend(v6, "setObject:forKey:", v3, CFSTR("HubPort"));

  }
}

- (int64_t)findMyHubRetryAtTime
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("FMHRetryAtTime")));

  if (v3)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 0;

  return (int64_t)v4;
}

- (void)saveFindMyHubRetryAtTime:(int64_t)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  if (a3 <= 0)
  {
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("FMHRetryAtTime"));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("FMHRetryAtTime"));

  }
}

- (int64_t)hubLastOnlineTime
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("HubLastOnlineTime")));

  if (v3)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 0;

  return (int64_t)v4;
}

- (void)saveHubLastOnlineTime:(int64_t)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  if (a3 <= 0)
  {
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("HubLastOnlineTime"));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), a3));
    objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("HubLastOnlineTime"));

  }
}

- (id)lastSnapshotRevertTime
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("LastSnapshotRevertTime")));

  if (v3)
    v4 = v3;
  else
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  v5 = v4;

  return v5;
}

- (void)saveLastSnapshotRevertTime:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v4 = v3;
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("LastSnapshotRevertTime"));
  else
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("LastSnapshotRevertTime"));

}

- (BOOL)snapshotRevertFlagged
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("SnapshotRevertFlagged")));

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)saveSnapshotRevertFlagged:(BOOL)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v5 = v4;
  if (a3)
    objc_msgSend(v4, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("SnapshotRevertFlagged"));
  else
    objc_msgSend(v4, "removeObjectForKey:", CFSTR("SnapshotRevertFlagged"));

}

- (id)lastShallowRefreshTime
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  objc_msgSend(v2, "reload");

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("LastShallowRefreshTime")));

  if (v4)
    v5 = v4;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  v6 = v5;

  return v6;
}

- (void)saveLastShallowRefreshTime:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v4 = v3;
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("LastShallowRefreshTime"));
  else
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("LastShallowRefreshTime"));

}

- (id)lastSettingsUpdatedTime
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("LastSettingsUpdatedTime")));

  if (v3)
    v4 = v3;
  else
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  v5 = v4;

  return v5;
}

- (void)saveLastSettingsUpdatedTime:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v4 = v3;
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("LastSettingsUpdatedTime"));
  else
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("LastSettingsUpdatedTime"));

}

- (id)hubSuppliedSettings
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("HubSuppliedSettings")));

  if (!v3 || (v5 = objc_opt_class(NSDictionary, v4), (objc_opt_isKindOfClass(v3, v5) & 1) == 0))
  {
LABEL_9:
    v7 = 0;
    goto LABEL_5;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("SettingsID")));

  if (!v6)
  {
    v9 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1000BEE78(v10, v11, v12);

    goto LABEL_9;
  }
  v7 = v3;
LABEL_5:

  return v7;
}

- (BOOL)saveHubSuppliedSettings:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  if (!v5)
    goto LABEL_10;
  v6 = objc_opt_class(NSDictionary, v4);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
    goto LABEL_10;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("SettingsID")));

  if (!v7)
  {
    v14 = sub_1000604F0();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1000BEEEC(v15, v16, v17);

    goto LABEL_10;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v9 = objc_msgSend(v8, "setObject:forKey:", v5, CFSTR("HubSuppliedSettings"));

  if (!v9)
  {
LABEL_10:
    v12 = 0;
    goto LABEL_6;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[MSDTargetDevice saveLastSettingsUpdatedTime:](self, "saveLastSettingsUpdatedTime:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  v12 = 1;
  objc_msgSend(v11, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.MobileStoreDemo.SettingsUpdated"), 0, 0, 1);

LABEL_6:
  return v12;
}

- (id)iCloudAccountRecoveryKey
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("iCloudAccountRecoveryKey")));

  return v3;
}

- (void)saveiCloudAccountRecoveryKey:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v4 = v3;
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("iCloudAccountRecoveryKey"));
  else
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("iCloudAccountRecoveryKey"));

}

- (BOOL)iCloudAccountSyncNeeded
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("iCloudAccountSyncNeeded")));

  if (v3 && (v5 = objc_opt_class(NSNumber, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0))
    v6 = objc_msgSend(v3, "BOOLValue");
  else
    v6 = 0;

  return v6;
}

- (void)saveiCloudAccountSyncNeeded:(BOOL)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v5 = v4;
  if (a3)
    objc_msgSend(v4, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("iCloudAccountSyncNeeded"));
  else
    objc_msgSend(v4, "removeObjectForKey:", CFSTR("iCloudAccountSyncNeeded"));

}

- (id)demoUserHomePath
{
  return NSHomeDirectoryForUser(CFSTR("mobile"));
}

- (void)saveRequiredDeletableSystemApps
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004AC88;
  v5[3] = &unk_10013E940;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0));
  v3 = v6;
  objc_msgSend(v2, "enumerateBundlesOfType:block:", 7, v5);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("RequiredDeletableSystemApps"));

}

- (id)requiredDeletableSystemApps
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("RequiredDeletableSystemApps")));

  return v3;
}

- (id)installedDeletableSystemApps
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice requiredDeletableSystemApps](self, "requiredDeletableSystemApps"));
  v5 = objc_msgSend(v4, "mutableCopy");

  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_10004AE60;
  v13 = &unk_10013E968;
  v14 = v5;
  v15 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0));
  v6 = v15;
  v7 = v5;
  objc_msgSend(v3, "enumerateBundlesOfType:block:", 1, &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v6, v10, v11, v12, v13));

  return v8;
}

- (void)installAndWaitForSystemApps
{
  void *v3;
  void *v4;
  id v5;
  __int128 v6;
  void *v7;
  unsigned int v8;
  id v9;
  NSObject *v10;
  void *v11;
  unsigned int v12;
  id v13;
  NSObject *v14;
  unint64_t v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  id v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t buf[4];
  unint64_t v34;
  __int16 v35;
  id v36;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice requiredDeletableSystemApps](self, "requiredDeletableSystemApps"));
  v5 = objc_msgSend(v4, "mutableCopy");

  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](MSDTestPreferences, "sharedInstance"));
    v8 = objc_msgSend(v7, "systemAppTimeoutInterval");

    if (v8)
    {
      v9 = sub_1000604F0();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v34 = v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Override system app timeout interval: %lu", buf, 0xCu);
      }

    }
    else
    {
      v8 = 1800;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](MSDTestPreferences, "sharedInstance"));
    v12 = objc_msgSend(v11, "systemAppPollingInterval");

    if (v12)
    {
      v13 = sub_1000604F0();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v34 = v12;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Override system app polling interval: %lu", buf, 0xCu);
      }

      goto LABEL_13;
    }
  }
  else
  {
    v8 = 1800;
  }
  v12 = 30;
LABEL_13:
  v15 = v8;
  *(_QWORD *)&v6 = 138543362;
  v25 = v6;
  while (objc_msgSend(v5, "count", v25))
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10004B2F4;
    v26[3] = &unk_10013E990;
    v16 = v5;
    v27 = v16;
    v28 = &v29;
    objc_msgSend(v3, "enumerateBundlesOfType:block:", 1, v26);
    if (!objc_msgSend(v16, "count"))
    {
      v19 = sub_1000604F0();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v21 = "All system apps have been installed. Move forward.";
        v22 = v20;
        v23 = 2;
        goto LABEL_24;
      }
LABEL_25:

      break;
    }
    if (v30[3] >= (unint64_t)v8)
    {
      v24 = sub_1000604F0();
      v20 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v34 = v15;
        v35 = 2114;
        v36 = v5;
        v21 = "Waited %lu seconds for system apps to install. Now moving forward. Still missing the following apps - %{public}@";
        v22 = v20;
        v23 = 22;
LABEL_24:
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
      }
      goto LABEL_25;
    }
    sleep(v12);
    v30[3] += v12;
    v17 = sub_1000604F0();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = v25;
      v34 = (unint64_t)v5;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Still waiting for system apps %{public}@", buf, 0xCu);
    }

  }
  _Block_object_dispose(&v29, 8);

}

- (BOOL)isPasscodeModificationAllowed
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v3 = objc_msgSend(v2, "isPasscodeModificationAllowed");

  return v3;
}

- (BOOL)setPasscodeModificationAllowed:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "errorCheckedSetBoolValue:forSetting:", v3, MCFeaturePasscodeModificationAllowed));
  if (v5)
  {
    v6 = sub_1000604F0();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000BEF60(v3, v5);

  }
  return v5 == 0;
}

- (BOOL)createTemporaryPasscodeIfNeeded
{
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  id v12;
  NSObject *v13;
  id v14;
  uint8_t v15[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Creating temporary device passcode...", buf, 2u);
  }

  if ((objc_msgSend(v3, "isPasscodeSet") & 1) != 0)
  {
    v6 = 0;
    v7 = 1;
    goto LABEL_12;
  }
  v8 = -[MSDTargetDevice isPasscodeModificationAllowed](self, "isPasscodeModificationAllowed");
  if ((v8 & 1) == 0)
  {
    v9 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Passcode modification is NOT allowed. Temporarily lifting the restriction!", v15, 2u);
    }

    if (!-[MSDTargetDevice setPasscodeModificationAllowed:](self, "setPasscodeModificationAllowed:", 1))
    {
      v6 = 0;
      v7 = 0;
      goto LABEL_11;
    }
  }
  v14 = 0;
  v7 = objc_msgSend(v3, "changePasscodeFrom:to:outError:", 0, CFSTR("123456"), &v14);
  v6 = v14;
  if ((v7 & 1) != 0)
  {
    if ((v8 & 1) != 0)
      goto LABEL_12;
LABEL_11:
    -[MSDTargetDevice setPasscodeModificationAllowed:](self, "setPasscodeModificationAllowed:", 0);
    goto LABEL_12;
  }
  v12 = sub_1000604F0();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    sub_1000BF008(v6, v13);

  if ((v8 & 1) == 0)
    goto LABEL_11;
LABEL_12:

  return v7;
}

- (BOOL)removeTemporaryPasscodeIfNeeded
{
  void *v3;
  id v4;
  NSObject *v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  unsigned __int8 v9;
  id v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  id v15;
  uint8_t v16[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing temporary device passcode...", buf, 2u);
  }

  if (!objc_msgSend(v3, "isPasscodeSet"))
  {
    v10 = 0;
    v11 = 1;
    goto LABEL_15;
  }
  v6 = -[MSDTargetDevice isPasscodeModificationAllowed](self, "isPasscodeModificationAllowed");
  if ((v6 & 1) == 0)
  {
    v7 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Passcode modification is NOT allowed. Temporarily lifting the restriction!", v16, 2u);
    }

    if (!-[MSDTargetDevice setPasscodeModificationAllowed:](self, "setPasscodeModificationAllowed:", 1))
    {
      v10 = 0;
      v11 = 0;
      goto LABEL_10;
    }
  }
  v15 = 0;
  v9 = objc_msgSend(v3, "changePasscodeFrom:to:outError:", CFSTR("123456"), 0, &v15);
  v10 = v15;
  if ((v9 & 1) != 0)
  {
    v11 = 1;
    if ((v6 & 1) == 0)
LABEL_10:
      -[MSDTargetDevice setPasscodeModificationAllowed:](self, "setPasscodeModificationAllowed:", 0);
  }
  else
  {
    v12 = sub_1000604F0();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000BF088(v10, v13);

    v11 = 0;
  }
LABEL_15:

  return v11;
}

- (BOOL)isDDLDevice
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  unsigned __int8 v9;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice readNVRam:](self, "readNVRam:", CFSTR("ownership-warning")));
  if (!v3 || (v4 = objc_opt_class(NSData, v2), (objc_opt_isKindOfClass(v3, v4) & 1) == 0))
  {
    v11 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1000BF108(v12, v13, v14);

    goto LABEL_16;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", objc_msgSend(objc_retainAutorelease(v3), "bytes"), 4));
  v6 = sub_1000604F0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (!v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000BF17C();

LABEL_16:
    v5 = 0;
    v9 = 0;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_1000BF1A8();

  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("1")) & 1) != 0)
    v9 = 1;
  else
    v9 = objc_msgSend(v5, "isEqualToString:", CFSTR("2"));
LABEL_9:

  return v9;
}

- (id)readNVRam:(id)a3
{
  __CFString *v3;
  io_registry_entry_t v4;
  io_object_t v5;
  void *CFProperty;
  id v8;
  NSObject *v9;
  id v10;
  mach_port_t mainPort;

  v3 = (__CFString *)a3;
  mainPort = 0;
  if (IOMasterPort(bootstrap_port, &mainPort))
  {
    v8 = sub_1000604F0();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000BF240();
    goto LABEL_9;
  }
  v4 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
  if (!v4)
  {
    v10 = sub_1000604F0();
    v9 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000BF214();
LABEL_9:

    CFProperty = 0;
    goto LABEL_4;
  }
  v5 = v4;
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v4, v3, kCFAllocatorDefault, 0);
  IOObjectRelease(v5);
LABEL_4:

  return CFProperty;
}

- (BOOL)deleteNVRam:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice helperAgent](self, "helperAgent"));
  v6 = objc_msgSend(v5, "deleteNvram:", v4);

  return v6;
}

- (BOOL)setSEPDemoMode:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  NSObject *v8;
  _DWORD v10[2];

  v3 = a3;
  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting SEP demo mode to: %{BOOL}d", (uint8_t *)v10, 8u);
  }

  v6 = AMFIDemoModeSetState(v3);
  if (v6)
  {
    v7 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000BF26C();

  }
  return v6 == 0;
}

- (BOOL)toggleSEPDemoModeOnManagedPreferencesChange
{
  return -[MSDTargetDevice setSEPDemoMode:](self, "setSEPDemoMode:", -[MSDTargetDevice managedStoreDemoMode](self, "managedStoreDemoMode"));
}

- (BOOL)turnOnDemoMode
{
  if (-[MSDTargetDevice isPressDemoDevice](self, "isPressDemoDevice"))
    return -[MSDTargetDevice turnOnPressDemoMode](self, "turnOnPressDemoMode");
  else
    return -[MSDTargetDevice turnOnStoreDemoMode](self, "turnOnStoreDemoMode");
}

- (BOOL)turnOnStoreDemoMode
{
  id v3;
  NSObject *v4;
  id v5;
  uint8_t v7[16];

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Turning on Store Demo Mode.", v7, 2u);
  }

  if (!-[MSDTargetDevice storeDemoMode](self, "storeDemoMode"))
  {
    v5 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.demo-settings"));
    objc_msgSend(v5, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("StoreDemoMode"));
    objc_msgSend(v5, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("LockIcons"));
    objc_msgSend(v5, "synchronize");

  }
  return 1;
}

- (BOOL)turnOnPressDemoMode
{
  id v3;
  NSObject *v4;
  id v5;
  uint8_t v7[16];

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Turning on Press Demo Mode.", v7, 2u);
  }

  if (!-[MSDTargetDevice pressDemoMode](self, "pressDemoMode"))
  {
    v5 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.demo-settings"));
    objc_msgSend(v5, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("PressDemoMode"));
    objc_msgSend(v5, "synchronize");

  }
  return 1;
}

- (BOOL)isDemoModeOn
{
  if (-[MSDTargetDevice isPressDemoDevice](self, "isPressDemoDevice"))
    return -[MSDTargetDevice pressDemoMode](self, "pressDemoMode");
  else
    return -[MSDTargetDevice storeDemoMode](self, "storeDemoMode");
}

- (BOOL)managedStoreDemoMode
{
  int IsForced;

  IsForced = CFPreferencesAppValueIsForced(CFSTR("StoreDemoMode"), CFSTR("com.apple.demo-settings"));
  if (IsForced)
    LOBYTE(IsForced) = CFPreferencesGetAppBooleanValue(CFSTR("StoreDemoMode"), CFSTR("com.apple.demo-settings"), 0) != 0;
  return IsForced;
}

- (BOOL)storeDemoMode
{
  return -[MSDTargetDevice demoModeValueForKey:](self, "demoModeValueForKey:", CFSTR("StoreDemoMode"));
}

- (BOOL)pressDemoMode
{
  return -[MSDTargetDevice demoModeValueForKey:](self, "demoModeValueForKey:", CFSTR("PressDemoMode"));
}

- (BOOL)demoModeValueForKey:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.demo-settings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v3));
  if (!v6)
  {
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  v7 = objc_opt_class(NSNumber, v5);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    v9 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1000BF2CC();

    goto LABEL_7;
  }
  v8 = objc_msgSend(v6, "BOOLValue");
LABEL_8:

  return v8;
}

- (void)enableSnapshotMode:(BOOL)a3
{
  _BOOL4 v3;
  MSDTargetDevice *v5;
  uint64_t v6;

  v3 = a3;
  if (!-[MSDTargetDevice allowSnapshotMode](self, "allowSnapshotMode"))
  {
    v5 = self;
    v6 = 27;
    goto LABEL_5;
  }
  if (v3)
  {
    -[MSDTargetDevice removeTemporaryPasscodeIfNeeded](self, "removeTemporaryPasscodeIfNeeded");
    -[MSDTargetDevice manageDeviceSnapshot:](self, "manageDeviceSnapshot:", CFSTR("CreateSnapshot"));
    v5 = self;
    v6 = 8;
LABEL_5:
    -[MSDTargetDevice rebootForStage:](v5, "rebootForStage:", v6);
    return;
  }
  -[MSDTargetDevice rebootWithSnapshotRevertForStage:](self, "rebootWithSnapshotRevertForStage:", 0);
}

- (void)manageDeviceSnapshot:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("UnmountSnapshot")))
  {
    -[MSDTargetDevice manageUserVolume:](self, "manageUserVolume:", v4);
    -[MSDTargetDevice manageDataVolume:](self, "manageDataVolume:", v4);
  }
  else
  {
    -[MSDTargetDevice manageDataVolume:](self, "manageDataVolume:", v4);
    -[MSDTargetDevice manageUserVolume:](self, "manageUserVolume:", v4);
  }

}

- (void)manageDataVolume:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice helperAgent](self, "helperAgent"));
  objc_msgSend(v5, "manageDataVolume:", v4);

}

- (void)manageDemoVolume:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice helperAgent](self, "helperAgent"));
  objc_msgSend(v5, "manageDemoVolume:", v4);

}

- (void)manageUserVolume:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice helperAgent](self, "helperAgent"));
  objc_msgSend(v5, "manageUserVolume:forUser:", v4, CFSTR("mobile"));

}

- (void)disableLaunchdServicesIfNeededForWatch
{
  void *v3;
  id v4;

  v4 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.demo-settings"));
  if (objc_msgSend(v4, "integerForKey:", CFSTR("FProgramNumber")) != (id)300)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice helperAgent](self, "helperAgent"));
    objc_msgSend(v3, "disableLaunchdServicesForWatch");

  }
}

- (void)disableSUAutoDownloadForWatch
{
  id v2;

  v2 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.subridge"));
  objc_msgSend(v2, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("SUDisableAutoScan"));
  objc_msgSend(v2, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("SkipAutoDownload"));
  objc_msgSend(v2, "synchronize");

}

- (void)setupWorkFolderForBootTask
{
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice helperAgent](self, "helperAgent"));
  objc_msgSend(v3, "prepareWorkDirectory:writableByNonRoot:", CFSTR("/private/var/demo_backup"), 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
  v5 = objc_msgSend(v4, "macOS");

  if (v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice helperAgent](self, "helperAgent"));
    objc_msgSend(v6, "prepareWorkDirectory:writableByNonRoot:", CFSTR("/private/var/dekota"), 0);

  }
}

- (void)destroyWorkFolderForBootTask
{
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice helperAgent](self, "helperAgent"));
  objc_msgSend(v3, "removeWorkDirectory:", CFSTR("/private/var/demo_backup"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
  v5 = objc_msgSend(v4, "macOS");

  if (v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice helperAgent](self, "helperAgent"));
    objc_msgSend(v6, "removeWorkDirectory:", CFSTR("/private/var/dekota"));

  }
}

- (BOOL)deleteConfigurationApp
{
  unsigned __int8 v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9[16];

  v2 = +[IXAppInstallCoordinator uninstallAppWithBundleID:error:](IXAppInstallCoordinator, "uninstallAppWithBundleID:error:", CFSTR("com.apple.DemoUpdate"), 0);
  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if ((v2 & 1) != 0)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Configuration app deleted.", v9, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    sub_1000BF340(v5, v7, v8);
  }

  return v2;
}

- (void)markContentInstallingInstalled
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](MSDProgressUpdater, "sharedInstance"));
  objc_msgSend(v2, "markBundleInProgressAsBundleCompleted");

}

- (BOOL)powerAssertionActive
{
  return self->_powerAssertion != 0;
}

- (BOOL)holdPowerAssertion
{
  unsigned int *p_powerAssertion;
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  p_powerAssertion = &self->_powerAssertion;
  if (self->_powerAssertion)
    return 1;
  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Taking power assertion to prevent device sleep.", v8, 2u);
  }

  if (!IOPMAssertionCreateWithName(CFSTR("PreventUserIdleSystemSleep"), 0xFFu, CFSTR("com.apple.demod.noSleep"), p_powerAssertion))return 1;
  v6 = sub_1000604F0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    sub_1000BF3B4();

  return 0;
}

- (BOOL)liftPowerAssertion
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  uint8_t v8[16];

  if (!self->_powerAssertion)
    return 1;
  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Lifting power assertion to enable device sleep.", v8, 2u);
  }

  if (!IOPMAssertionRelease(self->_powerAssertion))
  {
    self->_powerAssertion = 0;
    return 1;
  }
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1000BF3E0();

  return 0;
}

- (BOOL)createMobileStoreDemoCache
{
  void *v2;
  void *v3;
  id v4;
  BOOL v5;
  unsigned __int8 v6;
  id v8;
  NSObject *v9;
  id v10;
  id v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDCache sharedInstance](MSDCache, "sharedInstance"));
  if ((objc_msgSend(v2, "fileExistsAtPath:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob")) & 1) == 0&& (objc_msgSend(v3, "createContainer:", CFSTR("com.apple.mobilestoredemo.blob")) & 1) == 0)
  {
    v8 = sub_1000605D0();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000BF438();
    v4 = 0;
    goto LABEL_12;
  }
  if ((objc_msgSend(v2, "fileExistsAtPath:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata")) & 1) == 0)
  {
    v11 = 0;
    v5 = 1;
    v6 = objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata"), 1, 0, &v11);
    v4 = v11;
    if ((v6 & 1) != 0)
      goto LABEL_6;
    v10 = sub_1000605D0();
    v9 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000BF40C();
LABEL_12:

    v5 = 0;
    goto LABEL_6;
  }
  v4 = 0;
  v5 = 1;
LABEL_6:

  return v5;
}

- (void)clearUpNvramIfNeeded
{
  void *v3;
  unsigned __int8 v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  if (!-[MSDTargetDevice storeDemoMode](self, "storeDemoMode")
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice pathForDummyPreferenceFile](self, "pathForDummyPreferenceFile")),
        v4 = objc_msgSend(v5, "fileExistsAtPath:", v3),
        v3,
        (v4 & 1) == 0))
  {
    -[MSDTargetDevice deleteNVRam:](self, "deleteNVRam:", CFSTR("demo-install-state"));
    -[MSDTargetDevice deleteNVRam:](self, "deleteNVRam:", CFSTR("enable-remap-mode"));
    -[MSDTargetDevice deleteNVRam:](self, "deleteNVRam:", CFSTR("msd-request"));
    -[MSDTargetDevice deleteNVRam:](self, "deleteNVRam:", CFSTR("msd-reboot-at"));
    -[MSDTargetDevice deleteNVRam:](self, "deleteNVRam:", CFSTR("msd-last-auto-reboot"));
  }

}

- (void)clearUpF200FootprintIfNeeded
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  if (objc_msgSend(v3, "fileExistsAtPath:", CFSTR("/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/F200EventsData")))
  {
    v9 = 0;
    v4 = objc_msgSend(v3, "removeItemAtPath:error:", CFSTR("/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/F200EventsData"), &v9);
    v5 = v9;
    if ((v4 & 1) == 0)
    {
      v6 = sub_1000604F0();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_1000BF464(v5);

    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("F200EventDbCleanupTime")));

  if (v8)
    objc_msgSend(v2, "removeObjectForKey:", CFSTR("F200EventDbCleanupTime"));

}

- (void)refreshStoreHoursManagerUsingSettings
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[MSDStoreHoursManager sharedInstance](MSDStoreHoursManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice hubSuppliedSettings](self, "hubSuppliedSettings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("StoreHours")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice lastSettingsUpdatedTime](self, "lastSettingsUpdatedTime"));
  objc_msgSend(v6, "updateStoreHours:lastSettingsUpdatedDate:", v4, v5);
  objc_msgSend(v6, "evaluateStoreStatusAgainstCurrentTime");
  objc_msgSend(v6, "setupStoreOpenCloseTimers");
  -[MSDTargetDevice configureLowPowerMode](self, "configureLowPowerMode");

}

- (void)setupStoreHoursManager
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  uint8_t buf[16];

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting up store hours manager!", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10004CAE8;
  v16[3] = &unk_10013D8D8;
  v16[4] = self;
  v7 = objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", CFSTR("com.apple.MobileStoreDemo.StoreHours.Expired"), 0, v6, v16);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10004CB60;
  v15[3] = &unk_10013D8D8;
  v15[4] = self;
  v10 = objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", CFSTR("com.apple.MobileStoreDemo.StoreHours.StoreOpen"), 0, v9, v15);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10004CB68;
  v14[3] = &unk_10013D8D8;
  v14[4] = self;
  v13 = objc_msgSend(v11, "addObserverForName:object:queue:usingBlock:", CFSTR("com.apple.MobileStoreDemo.StoreHours.StoreClosed"), 0, v12, v14);

  -[MSDTargetDevice refreshStoreHoursManagerUsingSettings](self, "refreshStoreHoursManagerUsingSettings");
}

- (void)caLogsUploadTimerHandler:(id)a3
{
  dispatch_queue_global_t global_queue;
  NSObject *v4;

  global_queue = dispatch_get_global_queue(9, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v4, &stru_10013E9B0);

}

- (void)setupCoreAnalyticsLogsUploadTimer
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10004CCD0;
  v2[3] = &unk_10013D840;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)snapshotRevertTimerHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWorkQueueSet sharedInstance](MSDWorkQueueSet, "sharedInstance"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "messageQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004CFE0;
  v7[3] = &unk_10013D840;
  objc_copyWeak(&v8, &location);
  dispatch_async(v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)setupSnapshotRevertTimer
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10004D1BC;
  v2[3] = &unk_10013D840;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)unlockDeviceKeybagIfNeeded
{
  int v2;
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  _DWORD v10[2];

  v2 = MKBGetDeviceLockState(0, a2);
  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Device keybag lock state: %d", (uint8_t *)v10, 8u);
  }

  if (v2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("123456"), "dataUsingEncoding:", 4));
    v6 = sub_1000604F0();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unlocking device keybag using default passcode.", (uint8_t *)v10, 2u);
    }

    if (MKBUnlockDevice(v5, 0))
    {
      v8 = sub_1000604F0();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_1000BF51C();

    }
  }
}

- (void)acquireDeviceKeybagAssertionIfNeeded
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];
  void *v10;
  const __CFString *v11;
  const __CFString *v12;

  if (!-[MSDTargetDevice deviceLockAssertion](self, "deviceLockAssertion"))
  {
    v11 = CFSTR("MKBAssertionKey");
    v12 = CFSTR("Other");
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    v10 = 0;
    v4 = sub_1000604F0();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Acquiring device keybag lock assertion.", v9, 2u);
    }

    -[MSDTargetDevice setDeviceLockAssertion:](self, "setDeviceLockAssertion:", MKBDeviceLockAssertion(v3, &v10));
    if (!-[MSDTargetDevice deviceLockAssertion](self, "deviceLockAssertion"))
    {
      v6 = v10;
      v7 = sub_1000604F0();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_1000BF57C(v6, v8);

    }
  }
}

- (void)registerCAHearbeatActivity
{
  id v2;
  NSObject *v3;
  xpc_object_t v4;

  v2 = sub_1000604F0();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_1000BF5FC();

  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_INTERVAL, 7200);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_GRACE_PERIOD, 300);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_DELAY, 0);
  xpc_dictionary_set_string(v4, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_activity_register("com.apple.MobileStoreDemo.heartbeat", v4, &stru_10013E9F0);

}

- (void)unregisterCAHeartbeatActivity
{
  xpc_activity_unregister("com.apple.MobileStoreDemo.heartbeat");
}

- (id)previousiOSBuild
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("PreviousOSBuild")));

  return v3;
}

- (BOOL)saveCurrentiOSBuild
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice OSBuild](self, "OSBuild"));
  v5 = objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("PreviousOSBuild"));

  return v5;
}

- (BOOL)clearCurrentiOSBuild
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = objc_msgSend(v2, "removeObjectForKey:", CFSTR("PreviousOSBuild"));

  return v3;
}

- (id)minOSVersionAvailable
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("MinOSVersionAvailable")));

  return v3;
}

- (void)saveMinOSVersionAvailable:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("MinOSVersionAvailable"));

}

- (void)clearMinOSVersionAvailable
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("MinOSVersionAvailable"));

}

- (void)saveOSUpdateRequest:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("OSUpdateRequest"));

}

- (id)getOSUpdateRequest
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  id v12;

  if (!os_variant_has_internal_content("com.apple.mobilestoredemod"))
    goto LABEL_13;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](MSDTestPreferences, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mockOSUpdateRequestFile"));

  if (!v3)
  {
LABEL_12:

LABEL_13:
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("OSUpdateRequest")));
    goto LABEL_14;
  }
  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543362;
    v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Loading mock OS update request from file: %{public}@", (uint8_t *)&v11, 0xCu);
  }

  v6 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfFile:", v3);
  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (!v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000BF654();

    goto LABEL_12;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543362;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Mock OS update request successfully loaded: %{public}@", (uint8_t *)&v11, 0xCu);
  }

LABEL_14:
  return v6;
}

- (void)clearOSUpdateRequest
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("OSUpdateRequest"));

}

- (BOOL)waitingForCommand
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("WaitingForCommand")));

  if (v3 && (v5 = objc_opt_class(NSNumber, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0))
    v6 = objc_msgSend(v3, "BOOLValue");
  else
    v6 = 0;

  return v6;
}

- (void)setWaitingForCommand:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  _QWORD block[5];

  v3 = a3;
  if (-[MSDTargetDevice waitingForCommand](self, "waitingForCommand") != a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
    v6 = v5;
    if (v3)
    {
      objc_msgSend(v5, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("WaitingForCommand"));

      -[MSDTargetDevice startWaitingForCommandTimer](self, "startWaitingForCommandTimer");
    }
    else
    {
      objc_msgSend(v5, "removeObjectForKey:", CFSTR("WaitingForCommand"));

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10004DDCC;
      block[3] = &unk_10013D868;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)startWaitingForCommandTimer
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004DE60;
  block[3] = &unk_10013D868;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)waitForBuddy:(id)a3 updateStatus:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  CFNotificationCenterRef DarwinNotifyCenter;
  __CFNotificationCenter *v8;
  int v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  __CFNotificationCenter *v13;
  id v14;
  _DWORD v15[2];

  v4 = a4;
  v6 = a3;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  if (!DarwinNotifyCenter)
  {
    v14 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1000BF680();
    goto LABEL_7;
  }
  v8 = DarwinNotifyCenter;
  -[MSDTargetDevice setBuddyCompletionHandler:](self, "setBuddyCompletionHandler:", v6);
  CFNotificationCenterAddObserver(v8, 0, (CFNotificationCallback)sub_1000444F0, CFSTR("com.apple.purplebuddy.setupdone"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v9 = BYSetupAssistantNeedsToRun();
  v10 = sub_1000604F0();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109120;
    v15[1] = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Assistant needs to run: %{BOOL}d", (uint8_t *)v15, 8u);
  }

  if ((v9 & 1) == 0)
  {
    v13 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(v13, 0, CFSTR("com.apple.purplebuddy.setupdone"), 0);
    -[MSDTargetDevice invokeHandler:](self, "invokeHandler:", 1);
    goto LABEL_9;
  }
  if (v4)
  {
    v12 = objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](MSDProgressUpdater, "sharedInstance"));
    -[NSObject updateStage:](v12, "updateStage:", 16);
LABEL_7:

  }
LABEL_9:

}

- (void)waitForBuddy:(id)a3
{
  -[MSDTargetDevice waitForBuddy:updateStatus:](self, "waitForBuddy:updateStatus:", a3, 1);
}

- (void)waitForBuddyWithoutStatusUpdate:(id)a3
{
  -[MSDTargetDevice waitForBuddy:updateStatus:](self, "waitForBuddy:updateStatus:", a3, 0);
}

- (void)waitForBuddyWithTimeout
{
  dispatch_semaphore_t v3;
  dispatch_time_t v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  NSObject *v9;
  uint8_t buf[4];
  int v11;

  v3 = dispatch_semaphore_create(0);
  v4 = dispatch_time(0, 60000000000);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004E264;
  v8[3] = &unk_10013E320;
  v5 = v3;
  v9 = v5;
  -[MSDTargetDevice waitForBuddy:](self, "waitForBuddy:", v8);
  if (dispatch_semaphore_wait(v5, v4))
  {
    v6 = sub_1000604F0();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v11 = 60;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Buddy setup timed out after %d seconds.", buf, 8u);
    }

  }
}

- (void)invokeHandler:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id obj;

  v3 = a3;
  obj = (id)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice buddyCompletionHandlerLock](self, "buddyCompletionHandlerLock"));
  objc_sync_enter(obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice buddyCompletionHandler](self, "buddyCompletionHandler"));

  if (v5)
  {
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MSDTargetDevice buddyCompletionHandler](self, "buddyCompletionHandler"));
    v6[2](v6, v3);

  }
  objc_sync_exit(obj);

}

- (void)terminateConfigurationApp
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  unsigned int v14;
  id v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  id v20;
  id v21;
  uint8_t buf[4];
  unsigned int v23;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessPredicate predicateMatchingBundleIdentifier:](RBSProcessPredicate, "predicateMatchingBundleIdentifier:", CFSTR("com.apple.DemoUpdate")));
  v21 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessHandle handleForPredicate:error:](RBSProcessHandle, "handleForPredicate:error:", v2, &v21));
  v4 = v21;

  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentState"));
    v6 = objc_msgSend(v5, "taskState");

    if (!v4)
      goto LABEL_9;
  }
  else
  {
    v6 = 1;
    if (!v4)
      goto LABEL_9;
  }
  if (objc_msgSend(v4, "code") != (id)3)
  {
    v7 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000BF6AC();

  }
LABEL_9:
  if (v6 >= 2)
  {
    v9 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Trying to terminate configuration app...", buf, 2u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[FBSSystemService sharedService](FBSSystemService, "sharedService"));
    objc_msgSend(v11, "terminateApplication:forReason:andReport:withDescription:", CFSTR("com.apple.DemoUpdate"), 1, 0, 0);

    v12 = 11;
    while (1)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentState"));
      v14 = objc_msgSend(v13, "taskState");

      if (v14 < 2)
        break;
      sleep(1u);
      if (--v12 <= 1)
      {
        v15 = sub_1000604F0();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          goto LABEL_20;
        *(_WORD *)buf = 0;
        v17 = "Terminating configuration app timeout.";
        v18 = v16;
        v19 = 2;
        goto LABEL_19;
      }
    }
    v20 = sub_1000604F0();
    v16 = objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    *(_DWORD *)buf = 67109120;
    v23 = v14;
    v17 = "Configuration app terminated with state == %d";
    v18 = v16;
    v19 = 8;
LABEL_19:
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
LABEL_20:

  }
}

- (BOOL)allowSnapshotMode
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  BOOL v8;
  uint8_t v10[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice getDeviceOptions](self, "getDeviceOptions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("disable_snapshot_mode")));

  if (v3
    && (v5 = objc_opt_class(NSNumber, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    && objc_msgSend(v3, "BOOLValue"))
  {
    v6 = sub_1000604F0();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Device snapshot mode is disabled as requested by DeviceOptions.", v10, 2u);
    }

    v8 = 0;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (BOOL)allowSnapshotRevertTimer
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  uint8_t v11[16];

  if (+[MSDHubFeatureFlags disableNightlySnapshotRevert](MSDHubFeatureFlags, "disableNightlySnapshotRevert"))
  {
    v3 = sub_1000604F0();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Snapshot revert timer is disabled by feature flag!", v11, 2u);
    }

    return 0;
  }
  if (-[MSDTargetDevice isPressDemoDevice](self, "isPressDemoDevice")
    || !-[MSDTargetDevice allowSnapshotMode](self, "allowSnapshotMode"))
  {
    return 0;
  }
  v5 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.demo-settings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("DisableNightlyRefresh")));
  v9 = 1;
  if (v7)
  {
    v8 = objc_opt_class(NSNumber, v6);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0 && (objc_msgSend(v7, "BOOLValue") & 1) != 0)
      v9 = 0;
  }

  return v9;
}

- (BOOL)allowAccountSetup
{
  void *v3;
  BOOL v4;

  v3 = (void *)MGCopyAnswer(CFSTR("PasswordConfigured"), 0);
  if ((objc_msgSend(v3, "BOOLValue") & 1) != 0)
    v4 = 0;
  else
    v4 = -[MSDTargetDevice isDemoModeOn](self, "isDemoModeOn");

  return v4;
}

- (void)configureNetworkInterface
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWiFiHelper sharedInstance](MSDWiFiHelper, "sharedInstance"));
  objc_msgSend(v3, "enableWiFi:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getPersistentWiFiSsid"));

  if (v4)
  {
    objc_msgSend(v3, "configureWiFiWithPersistentSettings");
  }
  else if (-[MSDTargetDevice isContentFrozen](self, "isContentFrozen"))
  {
    objc_msgSend(v3, "disassociateAndForgetWiFi");
  }
  else if (-[MSDTargetDevice shouldForgetKnownNetworkUponUnlock](self, "shouldForgetKnownNetworkUponUnlock"))
  {
    v5 = sub_1000604F0();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Forgetting known wifi network after device unlock...", v7, 2u);
    }

    objc_msgSend(v3, "disassociateAndForgetWiFi");
    -[MSDTargetDevice setShouldForgetKnownNetworkUponUnlock:](self, "setShouldForgetKnownNetworkUponUnlock:", 0);
  }

}

- (void)waitForNetworkReachability
{
  -[MSDTargetDevice waitForNetworkReachabilityWithTimeout:](self, "waitForNetworkReachabilityWithTimeout:", 20);
}

- (void)waitForNetworkReachabilityWithTimeout:(unint64_t)a3
{
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  id v15;
  NSObject *v16;
  _QWORD update_handler[7];
  _QWORD v18[5];
  MSDTargetDevice *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t buf[4];
  unint64_t v31;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)a3));
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_10004EBF4;
  v28 = sub_10004EC04;
  v29 = objc_alloc_init((Class)NSCondition);
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = sub_10004EBF4;
  v18[4] = sub_10004EC04;
  v19 = self;
  v6 = sub_1000604F0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Waiting for network to become reachable...", buf, 2u);
  }

  v8 = nw_path_monitor_create();
  if (v8)
  {
    v9 = &_dispatch_main_q;
    nw_path_monitor_set_queue(v8, (dispatch_queue_t)&_dispatch_main_q);

    update_handler[0] = _NSConcreteStackBlock;
    update_handler[1] = 3221225472;
    update_handler[2] = sub_10004EC0C;
    update_handler[3] = &unk_10013EA40;
    update_handler[4] = &v24;
    update_handler[5] = &v20;
    update_handler[6] = v18;
    nw_path_monitor_set_update_handler(v8, update_handler);
    nw_path_monitor_start(v8);
    objc_msgSend((id)v25[5], "lock");
    while (!v21[3])
    {
      if ((objc_msgSend((id)v25[5], "waitUntilDate:", v5) & 1) == 0)
      {
        v10 = sub_1000604F0();
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v31 = a3;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Timeout waiting %lus for desired network interface to come up.", buf, 0xCu);
        }

        break;
      }
    }
    objc_msgSend((id)v25[5], "unlock");
    nw_path_monitor_cancel(v8);
  }
  else
  {
    v15 = sub_1000604F0();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1000BF724();

  }
  v12 = sub_1000604F0();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v21[3] != 0;
    *(_DWORD *)buf = 67109120;
    LODWORD(v31) = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Network reachability after wait: %{BOOL}d", buf, 8u);
  }

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

}

- (unint64_t)fetchActiveNetworkInterface
{
  NSObject *v2;
  void *evaluator_for_endpoint;
  NSObject *v4;
  unint64_t v5;
  _QWORD v7[4];
  NSObject *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v2 = nw_parameters_create();
  nw_parameters_set_multipath_service(v2, nw_multipath_service_handover);
  evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint(0, v2);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004EDF8;
  v7[3] = &unk_10013EA68;
  v4 = (id)nw_path_evaluator_copy_path();
  v8 = v4;
  v9 = &v10;
  nw_path_enumerate_interfaces(v4, v7);
  v5 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (BOOL)migrateCellularSupportFlag
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  BOOL v8;
  int v10;
  const __CFString *v11;
  __int16 v12;
  unsigned int v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice getDeviceOptions](self, "getDeviceOptions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("enable_cellular_support")));
  if (objc_msgSend(v4, "BOOLValue"))
  {
    v5 = sub_1000604F0();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543618;
      v11 = CFSTR("enable_cellular_support");
      v12 = 1024;
      v13 = objc_msgSend(v4, "BOOLValue");
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@=%{BOOL}d; disconnecting & forgetting all wifi SSID...",
        (uint8_t *)&v10,
        0x12u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWiFiHelper sharedInstance](MSDWiFiHelper, "sharedInstance"));
    objc_msgSend(v7, "disassociateAndForgetWiFi");

    v8 = -[MSDTargetDevice updateDeviceOptions:skipImutableKeys:](self, "updateDeviceOptions:skipImutableKeys:", v3, 1);
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)resetSystemTimeCache
{
  id v2;
  NSObject *v3;
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v2 = sub_1000604F0();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Resetting system time cache...", v6, 2u);
  }

  if (!TMResetToFirstLaunch())
  {
    v4 = sub_1000604F0();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000BF750();

  }
}

- (int64_t)getFreeSpace
{
  const __CFDictionary *v2;
  const __CFDictionary *v3;
  id v5;
  NSObject *v6;
  int64_t v7;

  v7 = 0;
  v2 = (const __CFDictionary *)MGCopyAnswer(CFSTR("DiskUsage"), 0);
  if (v2)
  {
    v3 = v2;
    sub_1000482E8(v2, kMGQDiskUsageTotalDataAvailable, &v7);
    CFRelease(v3);
    return v7;
  }
  else
  {
    v5 = sub_1000604F0();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000BF77C();

    return 0;
  }
}

- (BOOL)updateDeviceOptions:(id)a3 skipImutableKeys:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  unsigned int v24;
  __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  __CFString *v28;
  unsigned int v29;
  void *v30;
  id v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  void *v35;
  unsigned __int8 v36;
  void *v37;
  unsigned __int8 v38;
  id v39;
  NSObject *v40;
  id v41;
  BOOL v42;
  id v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  NSObject *v48;
  _BOOL4 v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  __CFString *v56;
  void *v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  const char *v64;
  __int16 v65;
  const __CFString *v66;
  _BYTE v67[128];

  v4 = a4;
  v5 = a3;
  v6 = sub_1000604F0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Updating device options dictionary on device", buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("device_options")));

  v10 = objc_alloc_init((Class)NSMutableDictionary);
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
  v57 = v9;
  if (v12)
  {
    v13 = v12;
    v56 = 0;
    v14 = *(_QWORD *)v60;
    v58 = v10;
    while (1)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v60 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)v15);
        if ((objc_msgSend(v16, "isEqualToString:", CFSTR("disable_snapshot_mode")) & 1) != 0
          || objc_msgSend(v16, "isEqualToString:", CFSTR("enable_better_together")))
        {
          if (v4)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v16));

            if (!v17)
              goto LABEL_20;
            v18 = v9;
          }
          else
          {
            v18 = v11;
          }
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", v16));
        }
        else
        {
          if ((objc_msgSend(v16, "isEqualToString:", CFSTR("enable_cellular_support")) & 1) != 0)
          {
            v19 = &__kCFBooleanFalse;
LABEL_19:
            objc_msgSend(v10, "setObject:forKey:", v19, v16);

            goto LABEL_20;
          }
          if (!objc_msgSend(v16, "isEqualToString:", CFSTR("enable_do_not_buy")))
          {
            v29 = objc_msgSend(v16, "isEqualToString:", CFSTR("device_info"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v16));
            if (v29)
            {
              v30 = (void *)objc_claimAutoreleasedReturnValue(+[MSDNPIMaskValues sharedInstance](MSDNPIMaskValues, "sharedInstance"));
              objc_msgSend(v30, "saveDeviceInfo:", v19);

            }
            goto LABEL_32;
          }
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v16));
          v22 = objc_opt_class(NSNumber, v21);
          if ((objc_opt_isKindOfClass(v20, v22) & 1) == 0)
          {

LABEL_31:
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v16));
            goto LABEL_32;
          }
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v16));
          v24 = objc_msgSend(v23, "BOOLValue");

          v9 = v57;
          if (!v24)
            goto LABEL_31;
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v16));
          v25 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("store_type")));

          if (v25)
          {
            v27 = objc_opt_class(NSString, v26);
            if ((objc_opt_isKindOfClass(v25, v27) & 1) == 0)
            {
              v44 = sub_1000604F0();
              v48 = objc_claimAutoreleasedReturnValue(v44);
              v10 = v58;
              if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                sub_1000BF890(v48, v45, v46);
              goto LABEL_59;
            }
            v28 = v25;
          }
          else
          {
            v31 = sub_1000604F0();
            v32 = objc_claimAutoreleasedReturnValue(v31);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v64 = "-[MSDTargetDevice updateDeviceOptions:skipImutableKeys:]";
              v65 = 2114;
              v66 = CFSTR("retail");
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%s - Device has \"do not buy\" enabled but store type is not set.  Default to %{public}@", buf, 0x16u);
            }

            v28 = CFSTR("retail");
          }
          v33 = sub_1000604F0();
          v34 = objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v64 = "-[MSDTargetDevice updateDeviceOptions:skipImutableKeys:]";
            v65 = 2114;
            v66 = v28;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%s - device_options has \"do not buy\" enabled with store type:  %{public}@", buf, 0x16u);
          }

          v56 = v28;
          if (-[__CFString isEqualToString:](v28, "isEqualToString:", CFSTR("retail")))
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](MSDHelperAgent, "sharedInstance"));
            v36 = objc_msgSend(v35, "writeNvram:withValue:", CFSTR("ownership-warning"), CFSTR("1"));

            if ((v36 & 1) == 0)
            {
              v47 = sub_1000604F0();
              v48 = objc_claimAutoreleasedReturnValue(v47);
              v49 = os_log_type_enabled(v48, OS_LOG_TYPE_ERROR);
              v10 = v58;
              if (v49)
                sub_1000BF7A8(v48, v50, v51);
              goto LABEL_58;
            }
            goto LABEL_43;
          }
          if (-[__CFString isEqualToString:](v28, "isEqualToString:", CFSTR("channel")))
          {
            v37 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](MSDHelperAgent, "sharedInstance"));
            v38 = objc_msgSend(v37, "writeNvram:withValue:", CFSTR("ownership-warning"), CFSTR("2"));

            if ((v38 & 1) == 0)
            {
              v52 = sub_1000604F0();
              v48 = objc_claimAutoreleasedReturnValue(v52);
              v10 = v58;
              if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                sub_1000BF81C(v48, v53, v54);
LABEL_58:
              v25 = v56;
LABEL_59:

              v42 = 0;
              goto LABEL_51;
            }
LABEL_43:
            v9 = v57;
LABEL_32:
            v10 = v58;
            goto LABEL_15;
          }
          v39 = sub_1000604F0();
          v40 = objc_claimAutoreleasedReturnValue(v39);
          v10 = v58;
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v64 = "-[MSDTargetDevice updateDeviceOptions:skipImutableKeys:]";
            v65 = 2114;
            v66 = v56;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%s - Ignore do-not-buy for unrecognized store type:  %{public}@", buf, 0x16u);
          }

          v9 = v57;
        }
LABEL_15:
        if (v19)
          goto LABEL_19;
LABEL_20:
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v41 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
      v13 = v41;
      if (!v41)
        goto LABEL_50;
    }
  }
  v56 = 0;
LABEL_50:

  -[MSDTargetDevice saveDeviceOptions:](self, "saveDeviceOptions:", v10);
  v42 = 1;
  v25 = v56;
LABEL_51:

  return v42;
}

- (void)saveDeviceOptions:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("device_options"));

}

- (id)getDeviceOptions
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  unsigned int v25;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("device_options")));
  v4 = objc_msgSend(v3, "mutableCopy");

  if (!v4 || (v6 = objc_opt_class(NSMutableDictionary, v5), (objc_opt_isKindOfClass(v4, v6) & 1) == 0))
  {
    v7 = objc_alloc_init((Class)NSMutableDictionary);

    v4 = v7;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDNPIMaskValues sharedInstance](MSDNPIMaskValues, "sharedInstance"));
  v9 = objc_msgSend(v8, "isNPIDevice");

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDNPIMaskValues sharedInstance](MSDNPIMaskValues, "sharedInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "getMaskValueForKey:", CFSTR("ProductType")));

    if (v11)
    {
      v13 = objc_opt_class(NSString, v12);
      if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
        objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("product_type"));
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDNPIMaskValues sharedInstance](MSDNPIMaskValues, "sharedInstance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "getMaskValueForKey:", CFSTR("part_description")));

    if (v15)
    {
      v17 = objc_opt_class(NSString, v16);
      if ((objc_opt_isKindOfClass(v15, v17) & 1) != 0)
        objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("part_description"));
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MSDNPIMaskValues sharedInstance](MSDNPIMaskValues, "sharedInstance"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "getMaskValueForKey:", CFSTR("device_family")));

    if (v19)
    {
      v21 = objc_opt_class(NSString, v20);
      if ((objc_opt_isKindOfClass(v19, v21) & 1) != 0)
        objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("device_family"));
    }

  }
  else
  {
    v11 = (void *)MGCopyAnswer(CFSTR("ProductType"), 0);
    if (v11)
    {
      v23 = objc_opt_class(NSString, v22);
      if ((objc_opt_isKindOfClass(v11, v23) & 1) != 0)
        objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("product_type"));
    }
  }

  if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](MSDTestPreferences, "sharedInstance"));
    v25 = objc_msgSend(v24, "mockForBetterTogetherDemo");

    if (v25)
      objc_msgSend(v4, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("enable_better_together"));
  }
  return v4;
}

- (void)processNewFeatureFlags:(id)a3 oldFeatureFlags:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  __int128 v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  unsigned int v17;
  id v18;
  NSObject *v19;
  __int128 v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
  unsigned int v31;
  _BYTE v32[128];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHubFeatureFlags supportedFeatureFlags](MSDHubFeatureFlags, "supportedFeatureFlags"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v23;
    *(_QWORD *)&v9 = 138543874;
    v20 = v9;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v13, v20));
        v15 = objc_msgSend(v14, "BOOLValue");

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v13));
        v17 = objc_msgSend(v16, "BOOLValue");

        if (v15 != v17)
        {
          v18 = sub_1000604F0();
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v20;
            v27 = v13;
            v28 = 1024;
            v29 = v15;
            v30 = 1024;
            v31 = v17;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Feature flag '%{public}@' has new value set: %{BOOL}d -> %{BOOL}d", buf, 0x18u);
          }

          if (objc_msgSend(v13, "isEqualToString:", CFSTR("DisableNightlySnapshotRevert")))
          {
            if (-[MSDTargetDevice isContentFrozen](self, "isContentFrozen"))
              -[MSDTargetDevice setupSnapshotRevertTimer](self, "setupSnapshotRevertTimer");
          }
          else if (objc_msgSend(v13, "isEqualToString:", CFSTR("DisableNightlyLowPowerMode")))
          {
            if (-[MSDTargetDevice mode](self, "mode") == 5)
              -[MSDTargetDevice configureLowPowerMode](self, "configureLowPowerMode");
          }
          else
          {
            objc_msgSend(v13, "isEqualToString:", CFSTR("DisableScreenDarkHours"));
          }
        }
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    }
    while (v10);
  }

}

- (BOOL)setDemoEnrollmentFlag:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v5 = objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("enrollmentFlag"));

  return v5;
}

- (id)getDemoEnrollmentFlag
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("enrollmentFlag")));

  return v3;
}

- (BOOL)lockSnapshot
{
  return -[MSDTargetDevice switchModeImmediately:](self, "switchModeImmediately:", 5);
}

- (BOOL)unlockSnapshot
{
  return -[MSDTargetDevice switchModeImmediately:](self, "switchModeImmediately:", 1);
}

- (BOOL)revertSnapshot
{
  -[MSDTargetDevice saveOperationRequest:requestFlag:completeBy:](self, "saveOperationRequest:requestFlag:completeBy:", CFSTR("RevertSnapshot"), 8, 0);
  return -[MSDTargetDevice switchModeImmediately:](self, "switchModeImmediately:", 2);
}

- (BOOL)revertSnapshotAndShutdown
{
  -[MSDTargetDevice rebootWithSnapshotRevertForStage:](self, "rebootWithSnapshotRevertForStage:", 33);
  return 1;
}

- (BOOL)unenrollWithObliteration:(BOOL)a3 preserveESim:(BOOL)a4 callUnregister:(BOOL)a5 preserveDDLFlag:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL8 v8;
  uint64_t v10;
  void *v11;
  void *v12;
  MSDUnEnrollRequest *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint8_t v21[16];

  v6 = a6;
  v7 = a4;
  v8 = a3;
  if (a5)
  {
    v10 = objc_claimAutoreleasedReturnValue(-[MSDTargetDevice hubHostName](self, "hubHostName"));
    if (v10)
    {
      v11 = (void *)v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice hubPort](self, "hubPort"));

      if (v12)
      {
        v13 = objc_alloc_init(MSDUnEnrollRequest);
        -[MSDUnEnrollRequest setObliterate:](v13, "setObliterate:", v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDServerRequestHandler sharedInstance](MSDServerRequestHandler, "sharedInstance"));
        v15 = objc_msgSend(v14, "handleRequestSync:", v13);

      }
    }
  }
  if (v6)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
    objc_msgSend(v16, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("preserveDDLFlag"));

  }
  if (!v8)
    return -[MSDTargetDevice switchModeImmediately:](self, "switchModeImmediately:", 0);
  if (v7)
  {
    v17 = sub_1000604F0();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Received request to preserve installed eSim across device obliteration.", v21, 2u);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
    objc_msgSend(v19, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("PreserveESimRequested"));

  }
  return -[MSDTargetDevice switchModeImmediately:](self, "switchModeImmediately:", 9);
}

- (BOOL)runCleanUpForBetterTogetherDevice
{
  uint64_t v3;
  void *v4;
  void *v5;
  MSDUnEnrollRequest *v6;
  void *v7;
  id v8;

  v3 = objc_claimAutoreleasedReturnValue(-[MSDTargetDevice hubHostName](self, "hubHostName"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice hubPort](self, "hubPort"));

    if (v5)
    {
      v6 = objc_alloc_init(MSDUnEnrollRequest);
      -[MSDUnEnrollRequest setObliterate:](v6, "setObliterate:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDServerRequestHandler sharedInstance](MSDServerRequestHandler, "sharedInstance"));
      v8 = objc_msgSend(v7, "handleRequestSync:", v6);

    }
  }
  -[MSDTargetDevice manageDemoVolume:](self, "manageDemoVolume:", CFSTR("Delete"));
  return 1;
}

- (BOOL)canLockSnapshot
{
  return -[MSDTargetDevice mode](self, "mode") == 1 && -[MSDTargetDevice allowSnapshotMode](self, "allowSnapshotMode");
}

- (BOOL)canUnlockSnapshot
{
  return -[MSDTargetDevice mode](self, "mode") == 5 && -[MSDTargetDevice allowSnapshotMode](self, "allowSnapshotMode");
}

- (BOOL)canRevertSnapshot
{
  return -[MSDTargetDevice mode](self, "mode") == 5 && -[MSDTargetDevice allowSnapshotMode](self, "allowSnapshotMode");
}

- (BOOL)canStartContentUpdate
{
  unsigned int v3;

  v3 = -[MSDTargetDevice mode](self, "mode");
  if (v3 != 1)
    LOBYTE(v3) = -[MSDTargetDevice mode](self, "mode") == 5;
  return v3;
}

- (BOOL)canStartBackgroundDownload
{
  return -[MSDTargetDevice mode](self, "mode") == 5;
}

- (BOOL)canStartOSUpdate
{
  unsigned int v3;

  v3 = -[MSDTargetDevice mode](self, "mode");
  if (v3 != 1)
    LOBYTE(v3) = -[MSDTargetDevice mode](self, "mode") == 5;
  return v3;
}

- (BOOL)canUnenrollWithObliteration:(BOOL)a3 consultDeviceOptions:(BOOL)a4
{
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  int v11;
  void *v12;

  if (a4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice getDeviceOptions](self, "getDeviceOptions", a3));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("enable_on_device_unenroll")));

    v7 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Consulting device options before unenroll: %{public}@", (uint8_t *)&v11, 0xCu);
    }

    v9 = v6 == 0;
    if (!v6 || (objc_msgSend(v6, "BOOLValue") & 1) == 0)
    {

      return v9;
    }

  }
  return -[MSDTargetDevice mode](self, "mode", a3) == 5
      || !-[MSDTargetDevice mode](self, "mode")
      || -[MSDTargetDevice mode](self, "mode") == 1;
}

- (BOOL)canRunCleanUpForBetterTogetherDevice
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
  if (objc_msgSend(v3, "watchOS"))
    v4 = -[MSDTargetDevice isBetterTogetherDemo](self, "isBetterTogetherDemo");
  else
    v4 = 0;

  return v4;
}

- (BOOL)shouldForgetKnownNetworkUponUnlock
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("ForgetKnownNetworkUponUnlock")));
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setShouldForgetKnownNetworkUponUnlock:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  _BOOL4 v11;

  v3 = a3;
  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543618;
    v9 = CFSTR("ForgetKnownNetworkUponUnlock");
    v10 = 1024;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Set %{public}@ to %{BOOL}d", (uint8_t *)&v8, 0x12u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("ForgetKnownNetworkUponUnlock"));

}

- (BOOL)backgroundDownloadActive
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("BackgroundDownloadActive")));
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setBackgroundDownloadActive:(BOOL)a3
{
  _BOOL4 v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  _DWORD v14[2];

  v3 = a3;
  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109120;
    v14[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting bg:%d", (uint8_t *)v14, 8u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v7 = v6;
  if (v3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    v9 = objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("BackgroundDownloadActive"));

    if ((v9 & 1) == 0)
    {
      v10 = sub_1000604F0();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_1000BF904();
LABEL_11:

    }
  }
  else
  {
    v12 = objc_msgSend(v6, "removeObjectForKey:", CFSTR("BackgroundDownloadActive"));

    if ((v12 & 1) == 0)
    {
      v13 = sub_1000604F0();
      v11 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_1000BF930();
      goto LABEL_11;
    }
  }
}

- (unint64_t)backgroundDownloadState
{
  void *v2;
  void *v3;
  unint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](MSDProgressUpdater, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "backgroundBundle"));

  if (v3)
    v4 = objc_msgSend(v3, "bundleState");
  else
    v4 = 0;

  return v4;
}

- (void)setBackgroundDownloadState:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  unint64_t v10;

  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "setting background download state:%lu", (uint8_t *)&v9, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](MSDProgressUpdater, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "backgroundBundle"));
  objc_msgSend(v8, "setBundleStateAs:", a3);

  if (a3 - 3 <= 1)
    -[MSDTargetDevice setBackgroundDownloadActive:](self, "setBackgroundDownloadActive:", 0);
}

- (void)setHubProtocolVersion:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;

  v3 = a3;
  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting hub proto version:%{public}@", (uint8_t *)&v7, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  objc_msgSend(v6, "setObject:forKey:", v3, CFSTR("HubProtocolVersion"));

}

- (NSString)hubProtocolVersion
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("HubProtocolVersion")));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("HubProtocolVersion")));

  }
  else
  {
    v5 = CFSTR("2");
  }
  return (NSString *)v5;
}

- (BOOL)proceeded
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("Proceeded")));

  if (v3 && (v5 = objc_opt_class(NSNumber, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0))
    v6 = objc_msgSend(v3, "BOOLValue");
  else
    v6 = 0;

  return v6;
}

- (void)setProceeded:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  int v8;
  id v9;
  NSObject *v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v5 = v4;
  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    v7 = objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("Proceeded"));

    if ((v7 & 1) != 0)
      return;
  }
  else
  {
    v8 = objc_msgSend(v4, "removeObjectForKey:", CFSTR("Proceeded"));

    if ((v8 & 1) != 0)
      return;
  }
  v9 = sub_1000604F0();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_1000BF95C(v10);

}

- (void)cleanUpBackgroundState:(BOOL)a3
{
  void *v4;
  void *v5;

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
    objc_msgSend(v4, "removeObjectsForKeys:", &off_10014E4F8);

  }
  +[MSDBundleProgressTracker removeBundleFromPreferences:](MSDBundleProgressTracker, "removeBundleFromPreferences:", CFSTR("Content.Downloading"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](MSDProgressUpdater, "sharedInstance"));
  objc_msgSend(v5, "resetTrackerForBundleType:", 1);

  -[MSDTargetDevice setBackgroundDownloadActive:](self, "setBackgroundDownloadActive:", 0);
}

- (NSDictionary)wifiSettings
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("WiFiSettings")));

  return (NSDictionary *)v3;
}

- (void)setWifiSettings:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  id v8;
  NSObject *v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v5 = v4;
  if (v3)
    v6 = objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("WiFiSettings"));
  else
    v6 = objc_msgSend(v4, "removeObjectForKey:", CFSTR("WiFiSettings"));
  v7 = v6;

  if ((v7 & 1) == 0)
  {
    v8 = sub_1000604F0();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000BF95C(v9);

  }
}

- (id)getDesiredIconStateFromSB
{
  uint64_t v2;
  BOOL v3;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t v10[4];
  _DWORD size[3];

  memset(size, 0, sizeof(size));
  v2 = SBSSpringBoardBlockableServerPort(self, a2);
  if (SBGetPendingIconState(v2, 1, &size[1], size))
  {
    v9 = sub_1000604F0();
    v7 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000BF9E4();
    v5 = 0;
  }
  else
  {
    if (*(_QWORD *)&size[1])
      v3 = size[0] == 0;
    else
      v3 = 1;
    if (v3)
      return 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:"));
    vm_deallocate(mach_task_self_, *(vm_address_t *)&size[1], size[0]);
    v6 = sub_1000604F0();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Desired icon state is loaded.", v10, 2u);
    }
  }

  return v5;
}

- (BOOL)sendIconStateToSB:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  int v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t v15[16];

  v3 = a3;
  v4 = v3;
  if (v3 && (v5 = objc_msgSend(v3, "length")) != 0)
  {
    v7 = SBSSpringBoardBlockableServerPort(v5, v6);
    v8 = objc_retainAutorelease(v4);
    v9 = SBSetIconState(v7, objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"));
    v10 = v9 == 0;
    v11 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = v12;
    if (v9)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_1000BFA44();
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Desired icon state is restored.", v15, 2u);
    }

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (void)delayRebootForTesting
{
  void *v2;
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  _DWORD v7[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](MSDTestPreferences, "sharedInstance"));
  v4 = objc_msgSend(v3, "rebootDelayForStaging");

  if (v4)
  {
    if ((objc_msgSend(v2, "fileExistsAtPath:", CFSTR("/tmp/rebootDelayEntered")) & 1) == 0)
      objc_msgSend(v2, "createFileAtPath:contents:attributes:", CFSTR("/tmp/rebootDelayEntered"), 0, 0);
    v5 = sub_1000604F0();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Waiting for %u seconds to run test.", (uint8_t *)v7, 8u);
    }

    sleep(v4);
  }

}

- (void)configureLowPowerMode
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDStoreHoursManager sharedInstance](MSDStoreHoursManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("LowPowerModeConfigured")));
  v6 = objc_msgSend(v5, "BOOLValue");

  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Configuring low power mode...", buf, 2u);
  }

  if (+[MSDHubFeatureFlags disableNightlyLowPowerMode](MSDHubFeatureFlags, "disableNightlyLowPowerMode"))
  {
    v9 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Nightly low power mode is disabled by feature flag!", v11, 2u);
    }

    if (v6)
    {
      -[MSDTargetDevice setLowPowerMode:](self, "setLowPowerMode:", 0);
      objc_msgSend(v4, "removeObjectForKey:", CFSTR("LowPowerModeConfigured"));
    }
  }
  else
  {
    objc_msgSend(v3, "evaluateStoreStatusAgainstCurrentTime");
    -[MSDTargetDevice setLowPowerMode:](self, "setLowPowerMode:", objc_msgSend(v3, "isStoreOpenNow") ^ 1);
    objc_msgSend(v4, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("LowPowerModeConfigured"));
  }

}

- (BOOL)setLowPowerMode:(int64_t)a3
{
  void *v4;
  id v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  int v13;
  int64_t v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_PMLowPowerMode sharedInstance](_PMLowPowerMode, "sharedInstance"));
  v5 = objc_msgSend(v4, "getPowerMode");

  v6 = v5 == (id)a3;
  if (v5 == (id)a3)
  {
    v7 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134217984;
      v14 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Low power mode already set to: %ld", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_9;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_PMLowPowerMode sharedInstance](_PMLowPowerMode, "sharedInstance"));
  v10 = objc_msgSend(v9, "setPowerMode:fromSource:", a3, CFSTR("MobileStoreDemo"));

  if ((v10 & 1) == 0)
  {
    v11 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000BFAA4();
LABEL_9:

    return v6;
  }
  return 1;
}

- (id)retrieveSignedManifest
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  id v10;
  MSDDownloadManifestRequest *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void **p_cache;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v42;
  id v43;
  unsigned int v44;
  void *v45;
  id v46;
  id v47;
  uint8_t buf[4];
  void *v49;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDFileDownloadCredentials sharedInstance](MSDFileDownloadCredentials, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = objc_msgSend(v4, "fileExistsAtPath:", CFSTR("/var/MSDWorkContainer/.MSD_cache_manifest"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice manifestPath](self, "manifestPath"));
  v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

  if (!v8
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice manifestPath](self, "manifestPath")),
        v10 = (id)objc_claimAutoreleasedReturnValue(+[MSDSignedManifestFactory createSignedManifestFromManifestFile:](MSDSignedManifestFactory, "createSignedManifestFromManifestFile:", v9)), v9, !v10))
  {
    v11 = objc_alloc_init(MSDDownloadManifestRequest);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "manifestInfo"));
    -[MSDDownloadManifestRequest setManifestInfo:](v11, "setManifestInfo:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice manifestPath](self, "manifestPath"));
    -[MSDServerRequest setSavePath:](v11, "setSavePath:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDServerRequestHandler sharedInstance](MSDServerRequestHandler, "sharedInstance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "handleRequestSync:", v11));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "error"));
    if (v16)
    {
      v43 = 0;
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice manifestPath](self, "manifestPath"));
      v10 = (id)objc_claimAutoreleasedReturnValue(+[MSDSignedManifestFactory createSignedManifestFromManifestFile:](MSDSignedManifestFactory, "createSignedManifestFromManifestFile:", v17));

      if (v10)
      {

        goto LABEL_6;
      }
      v47 = 0;
      sub_1000B63A4(&v47, 3727740938, (uint64_t)CFSTR("Manifest is corrupted."));
      v43 = v47;
    }

    v10 = 0;
LABEL_24:

    v46 = v43;
    sub_1000B6428(&v46, 3727740940, CFSTR("Could not download manifest."));
    v29 = v46;

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateStatusHub sharedInstance](MSDDemoUpdateStatusHub, "sharedInstance"));
    objc_msgSend(v28, "demoUpdateFailed:", v29);
    v40 = 0;
    goto LABEL_17;
  }
LABEL_6:
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice helperAgent](self, "helperAgent"));
  v19 = objc_msgSend(v18, "updateSignedManifest");

  if ((v19 & 1) == 0)
  {
    v42 = sub_1000604F0();
    v11 = (MSDDownloadManifestRequest *)objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(&v11->super.super.super.super, OS_LOG_TYPE_ERROR))
      sub_1000BFB08();
    v43 = 0;
    goto LABEL_24;
  }
  v44 = v5;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", CFSTR("MSDCacheManifestVersion")));

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "getInfo"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", CFSTR("PartNumber")));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "getInfo"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKey:", CFSTR("Revision")));
  v45 = v3;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "manifestInfo"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKey:", CFSTR("SigningKey")));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@_%@"), v23, v25, v27));

  v29 = v21;
  if (v21 && (objc_msgSend(v21, "isEqualToString:", v28) & 1) == 0)
  {
    v35 = sub_1000604F0();
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v49 = v28;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "This is a new manifest (%{public}@). Discard this cache and reset timer.", buf, 0xCu);
    }

    v37 = (void *)objc_claimAutoreleasedReturnValue(+[MSDContentCacheManager sharedInstance](MSDContentCacheManager, "sharedInstance"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "getAllFileHash"));
    objc_msgSend(v37, "clearCacheExceptFileHashes:", v38);

    -[MSDTargetDevice cleanUpBackgroundState:](self, "cleanUpBackgroundState:", 1);
    v3 = v45;
    p_cache = &OBJC_METACLASS___MSDConfigurationProfileInstallOperation.cache;
  }
  else
  {
    v3 = v45;
    p_cache = (void **)(&OBJC_METACLASS___MSDConfigurationProfileInstallOperation + 16);
    if (v44)
    {
      v31 = sub_1000604F0();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Factory cache exists. Discard this cache.", buf, 2u);
      }

      v33 = (void *)objc_claimAutoreleasedReturnValue(+[MSDContentCacheManager sharedInstance](MSDContentCacheManager, "sharedInstance"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "getAllFileHash"));
      objc_msgSend(v33, "clearCacheExceptFileHashes:", v34);

    }
  }
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_cache + 218, "sharedInstance"));
  objc_msgSend(v39, "setObject:forKey:", v28, CFSTR("MSDCacheManifestVersion"));

  v10 = v10;
  v40 = v10;
LABEL_17:

  return v40;
}

- (void)clearSafariHistory
{
  pid_t v2;
  pid_t v3;
  int v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  void *v17;
  NSString *v18;
  void *v19;
  void *v20;
  NSString *v21;
  void *v22;
  void *v23;
  NSString *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  void *i;
  uint64_t v33;
  unsigned int v34;
  id v35;
  NSObject *v36;
  _BOOL4 v37;
  unsigned __int8 v38;
  id v39;
  id v40;
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
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  uint64_t v62;
  __int16 v63;
  id v64;
  _BYTE v65[128];

  v2 = SFProcessIDForProcessNamed(CFSTR("com.apple.Safari.History"), a2);
  if (v2 < 0)
  {
    v8 = sub_1000604F0();
    v7 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      sub_1000BFBC0();
  }
  else
  {
    v3 = v2;
    v4 = kill(v2, 1);
    v5 = sub_1000604F0();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = v6;
    if (v4 == -1)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_1000BFB34();
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v62) = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Killed com.apple.Safari.History (%i)", buf, 8u);
    }
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", CFSTR("com.apple.mobilesafari")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dataContainerURL"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));

  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("Library/Caches")));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("Library/Cookies")));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("Library/WebKit/WebsiteData")));
  v53 = v11;
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("Library/Caches/WebKit")));
  v12 = NSHomeDirectory();
  v52 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "stringByAppendingPathComponent:", CFSTR("Library/Safari/History.db")));
  v13 = NSHomeDirectory();
  v51 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "stringByAppendingPathComponent:", CFSTR("Library/Safari/History.db-shm")));
  v14 = NSHomeDirectory();
  v48 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "stringByAppendingPathComponent:", CFSTR("Library/Safari/History.db-wal")));
  v15 = NSHomeDirectory();
  v46 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "stringByAppendingPathComponent:", CFSTR("Library/Safari/SafariTabs.db")));
  v16 = NSHomeDirectory();
  v44 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "stringByAppendingPathComponent:", CFSTR("Library/Safari/SafariTabs.db-shm")));
  v18 = NSHomeDirectory();
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByAppendingPathComponent:", CFSTR("Library/Safari/SafariTabs.db-wal")));
  v21 = NSHomeDirectory();
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringByAppendingPathComponent:", CFSTR("Library/Safari/LastSession.plist")));
  v24 = NSHomeDirectory();
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "stringByAppendingPathComponent:", CFSTR("Library/Safari/RecentlyClosedTabs.plist")));
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v49, v55, v47, v54, v45, v43, v42, v41, v17, v20, v23, v26, 0));

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v28 = v50;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v30; i = (char *)i + 1)
      {
        if (*(_QWORD *)v58 != v31)
          objc_enumerationMutation(v28);
        v33 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
        v34 = objc_msgSend(v27, "fileExistsAtPath:", v33);
        v35 = sub_1000604F0();
        v36 = objc_claimAutoreleasedReturnValue(v35);
        v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
        if (!v34)
        {
          if (v37)
          {
            *(_DWORD *)buf = 138543362;
            v62 = v33;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "File not found for Safari: %{public}@", buf, 0xCu);
          }
          v39 = 0;
          goto LABEL_23;
        }
        if (v37)
        {
          *(_DWORD *)buf = 138543362;
          v62 = v33;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Removing item for Safari: %{public}@", buf, 0xCu);
        }

        v56 = 0;
        v38 = objc_msgSend(v27, "removeItemAtPath:error:", v33, &v56);
        v39 = v56;
        if ((v38 & 1) == 0)
        {
          v40 = sub_1000604F0();
          v36 = objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v62 = v33;
            v63 = 2114;
            v64 = v39;
            _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Failed to remove item for Safari: %{public}@, Error: %{public}@", buf, 0x16u);
          }
LABEL_23:

        }
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
    }
    while (v30);
  }

}

- (BOOL)overrideComputerNameAndHostnameIfNeeded
{
  return 0;
}

- (BOOL)aboutToReboot
{
  return self->_aboutToReboot;
}

- (void)setAboutToReboot:(BOOL)a3
{
  self->_aboutToReboot = a3;
}

- (NSString)localHubFailureReason
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLocalHubFailureReason:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)s3ServerFailureReason
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setS3ServerFailureReason:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unsigned)powerAssertion
{
  return self->_powerAssertion;
}

- (void)setPowerAssertion:(unsigned int)a3
{
  self->_powerAssertion = a3;
}

- (NSTimer)snapshotRevertTimer
{
  return self->_snapshotRevertTimer;
}

- (void)setSnapshotRevertTimer:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotRevertTimer, a3);
}

- (NSTimer)caLogsUploadTimer
{
  return self->_caLogsUploadTimer;
}

- (void)setCaLogsUploadTimer:(id)a3
{
  objc_storeStrong((id *)&self->_caLogsUploadTimer, a3);
}

- (NSTimer)waitForCommandTimer
{
  return self->_waitForCommandTimer;
}

- (void)setWaitForCommandTimer:(id)a3
{
  objc_storeStrong((id *)&self->_waitForCommandTimer, a3);
}

- (id)buddyCompletionHandler
{
  return self->_buddyCompletionHandler;
}

- (void)setBuddyCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)modeLock
{
  return self->_modeLock;
}

- (void)setModeLock:(id)a3
{
  objc_storeStrong((id *)&self->_modeLock, a3);
}

- (NSNumber)buddyCompletionHandlerLock
{
  return self->_buddyCompletionHandlerLock;
}

- (void)setBuddyCompletionHandlerLock:(id)a3
{
  objc_storeStrong((id *)&self->_buddyCompletionHandlerLock, a3);
}

- (MSDHelperAgent)helperAgent
{
  return self->_helperAgent;
}

- (void)setHelperAgent:(id)a3
{
  objc_storeStrong((id *)&self->_helperAgent, a3);
}

- (__MKBAssertion)deviceLockAssertion
{
  return self->_deviceLockAssertion;
}

- (void)setDeviceLockAssertion:(__MKBAssertion *)a3
{
  self->_deviceLockAssertion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helperAgent, 0);
  objc_storeStrong((id *)&self->_buddyCompletionHandlerLock, 0);
  objc_storeStrong((id *)&self->_modeLock, 0);
  objc_storeStrong(&self->_buddyCompletionHandler, 0);
  objc_storeStrong((id *)&self->_waitForCommandTimer, 0);
  objc_storeStrong((id *)&self->_caLogsUploadTimer, 0);
  objc_storeStrong((id *)&self->_snapshotRevertTimer, 0);
  objc_storeStrong((id *)&self->_s3ServerFailureReason, 0);
  objc_storeStrong((id *)&self->_localHubFailureReason, 0);
}

@end
