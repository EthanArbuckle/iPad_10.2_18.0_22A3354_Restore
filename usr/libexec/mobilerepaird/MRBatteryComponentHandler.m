@implementation MRBatteryComponentHandler

- (MRBatteryComponentHandler)init
{
  objc_class *v4;
  NSString *v5;
  void *v6;
  NSString *v7;
  void *v8;
  NSString *v9;
  void *v10;

  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = NSStringFromSelector("sharedSingleton");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("Use +[%@ %@] instead of -%@."), v6, v8, v10);

  return 0;
}

- (id)_init
{
  MRBatteryComponentHandler *v2;
  MRBatteryComponentHandler *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  uint64_t v20;
  NSObject *v21;
  uint8_t v23[16];
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)MRBatteryComponentHandler;
  v2 = -[MRBaseComponentHandler init](&v24, "init");
  v3 = v2;
  if (v2)
  {
    -[MRBaseComponentHandler setComponentName:](v2, "setComponentName:", CFSTR("Battery"));
    -[MRBaseComponentHandler setComponentFollowupClientID:](v3, "setComponentFollowupClientID:", CFSTR("com.apple.mobilerepair.BatteryRepair"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    -[MRBaseComponentHandler setIsSUCaseForComponent:](v3, "setIsSUCaseForComponent:", objc_msgSend(v4, "BOOLForKey:", CFSTR("SUcaseForBattery")));

    -[MRBaseComponentHandler setSupportsRepair:](v3, "setSupportsRepair:", 1);
    -[MRBaseComponentHandler setPopUpNotificationMessage:](v3, "setPopUpNotificationMessage:", CFSTR("UNABLE_TO_VERIFY_BATTERY_NOTIF_TEXT"));
    -[MRBaseComponentHandler setPopUpNotificationTitle:](v3, "setPopUpNotificationTitle:", CFSTR("IMPORTANT_BATTERY_MESSAGE"));
    -[MRBaseComponentHandler setFollowUpInfoMessage:](v3, "setFollowUpInfoMessage:", CFSTR("UNABLE_TO_VERIFY_BATTERY_MESSAGE"));
    -[MRBaseComponentHandler setComponentSUCaseKey:](v3, "setComponentSUCaseKey:", CFSTR("SUcaseForBattery"));
    v5 = (void *)objc_opt_new(CRRepairHistory);
    -[MRBaseComponentHandler setNotifyServer:](v3, "setNotifyServer:", objc_msgSend(v5, "deviceSupportsRepairBootIntent") ^ 1);

    -[MRBaseComponentHandler setFinishRepairTitle:](v3, "setFinishRepairTitle:", CFSTR("FINISH_BATTERY_REPAIR_TITLE"));
    -[MRBaseComponentHandler setFinishRepairMessage:](v3, "setFinishRepairMessage:", CFSTR("FINISH_BATTERY_REPAIR_DESC"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentFollowupClientID](v3, "componentFollowupClientID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", CFSTR("FINISH_REPAIR")));
    -[MRBaseComponentHandler setFinishRepairKey:](v3, "setFinishRepairKey:", v7);

    -[MRBaseComponentHandler setDisplayNotification:](v3, "setDisplayNotification:", 0);
    -[MRBaseComponentHandler setDisplayModalPopup:](v3, "setDisplayModalPopup:", -[MRBaseComponentHandler isSUCaseForComponent](v3, "isSUCaseForComponent") ^ 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("prefs:root=General&path=About/MAIN_PARTS_AND_SERVICE/Battery")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v8));
    -[MRBaseComponentHandler setLinkedSensitiveURL:](v3, "setLinkedSensitiveURL:", v9);

    -[MRBaseComponentHandler setComponentUnLockCheckCountKey:](v3, "setComponentUnLockCheckCountKey:", CFSTR("unlockCheckCountForBattery"));
    -[MRBaseComponentHandler setComponentRetriggerCountKey:](v3, "setComponentRetriggerCountKey:", CFSTR("retriggerCheckCountForBattery"));
    -[MRBaseComponentHandler setComponentLastCheckTimeKey:](v3, "setComponentLastCheckTimeKey:", CFSTR("lastCheckTimeForBattery"));
    -[MRBaseComponentHandler setComponentHasDisplayedFollowUpKey:](v3, "setComponentHasDisplayedFollowUpKey:", CFSTR("hasDisplayedFollowupForBattery"));
    -[MRBaseComponentHandler setComponentHasNotifiedServerKey:](v3, "setComponentHasNotifiedServerKey:", CFSTR("hasNotifiedServerForBattery"));
    -[MRBaseComponentHandler setComponentUnlockCheckerActivityName:](v3, "setComponentUnlockCheckerActivityName:", CFSTR("com.apple.mobilerepair.batteryunlockchecker"));
    -[MRBaseComponentHandler setComponentNtwkActivityName:](v3, "setComponentNtwkActivityName:", CFSTR("com.apple.mobilerepair.batterynotifyserver"));
    -[MRBaseComponentHandler setComponentId:](v3, "setComponentId:", 0);
    -[MRBaseComponentHandler setComponentDataCollectionPresentedKey:](v3, "setComponentDataCollectionPresentedKey:", CFSTR("dataCollectionNoticePresentedForPartsAndService"));
    -[MRBaseComponentHandler setComponentFirstUIDisplayedTimeKey:](v3, "setComponentFirstUIDisplayedTimeKey:", CFSTR("firstUIDisplayedTimeForBattery"));
    -[MRBaseComponentHandler setLastKnownComponentIdentifierKey:](v3, "setLastKnownComponentIdentifierKey:", CFSTR("lastKnownIDForBattery"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](v3, "componentName"));
    v11 = +[CRFDRBaseDeviceHandler copySealingManifestDataInstanceForComponent:](CRFDRBaseDeviceHandler, "copySealingManifestDataInstanceForComponent:", v10);
    -[MRBaseComponentHandler setLastKnownComponentIdentifierValue:](v3, "setLastKnownComponentIdentifierValue:", v11);

    v12 = (void *)objc_opt_new(CRBatteryStatus);
    -[MRBaseComponentHandler setComponentAuthHandler:](v3, "setComponentAuthHandler:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v14 = objc_msgSend(v13, "BOOLForKey:", CFSTR("overrideDisableUIForBattery"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentFollowupClientID](v3, "componentFollowupClientID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/var/mobile/Library/Preferences/"), "stringByAppendingString:", v15));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByAppendingString:", CFSTR(".plist")));
    -[MRBaseComponentHandler setStateFilePath:](v3, "setStateFilePath:", v17);

    if (MGGetProductType(-[MRBaseComponentHandler setComponentForceKey:](v3, "setComponentForceKey:", CFSTR("ForceBatteryStatus"))) == 2159747553)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[MRBaseComponentHandler getHwRevision](MRBatteryComponentHandler, "getHwRevision"));
      v19 = objc_msgSend(v18, "containsString:", CFSTR("EVT"));

      if (((v19 ^ 1 | v14) & 1) == 0)
      {
        v20 = handleForCategory(0);
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v23 = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Disabling UI for D79 EVT", v23, 2u);
        }

        -[MRBaseComponentHandler setDisableUIForComponent:](v3, "setDisableUIForComponent:", 1);
      }
    }
  }
  return v3;
}

+ (void)handleSUCase
{
  id v3;

  if ((+[CRFDRBaseDeviceHandler isFDRDataClassSupported:](CRFDRBaseDeviceHandler, "isFDRDataClassSupported:", CFSTR("bcrt")) & 1) != 0|| +[CRFDRBaseDeviceHandler isFDRDataClassSupported:](CRFDRBaseDeviceHandler, "isFDRDataClassSupported:", CFSTR("vcrt")))
  {
    v3 = (id)objc_opt_new(CRBatteryStatus);
    objc_msgSend(a1, "handleComponentSUCase:lastAUthCheckBuildVersion:followUpItemID:queryString:suCasekey:startBuildVersion:componentAuth:", CFSTR("hasDisplayedFollowupForBattery"), CFSTR("LastBatteryAuthCompleteBuildVersion"), CFSTR("com.apple.mobilerepair.BatteryRepair"), CFSTR("Battery"), CFSTR("SUcaseForBattery"), CFSTR("17A800"), v3);

  }
}

+ (id)sharedSingleton
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BAD4;
  block[3] = &unk_1000185F8;
  block[4] = a1;
  if (qword_10001EAD8 != -1)
    dispatch_once(&qword_10001EAD8, block);
  return (id)qword_10001EAD0;
}

@end
