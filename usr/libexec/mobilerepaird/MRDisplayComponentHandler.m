@implementation MRDisplayComponentHandler

- (MRDisplayComponentHandler)init
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
  MRDisplayComponentHandler *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  objc_super v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)MRDisplayComponentHandler;
  v2 = -[MRBaseComponentHandler init](&v19, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    -[MRBaseComponentHandler setIsSUCaseForComponent:](v2, "setIsSUCaseForComponent:", objc_msgSend(v3, "BOOLForKey:", CFSTR("SUcaseForDisplay")));

    -[MRBaseComponentHandler setComponentName:](v2, "setComponentName:", CFSTR("TouchController"));
    -[MRBaseComponentHandler setSupportsRepair:](v2, "setSupportsRepair:", 1);
    -[MRBaseComponentHandler setPopUpNotificationMessage:](v2, "setPopUpNotificationMessage:", CFSTR("UNABLE_TO_VERIFY_DISPLAY_NOTIF_TEXT"));
    -[MRBaseComponentHandler setPopUpNotificationTitle:](v2, "setPopUpNotificationTitle:", CFSTR("IMPORTANT_DISPLAY_MESSAGE"));
    -[MRBaseComponentHandler setFollowUpInfoMessage:](v2, "setFollowUpInfoMessage:", CFSTR("UNABLE_TO_VERIFY_DISPLAY_MESSAGE"));
    -[MRBaseComponentHandler setComponentSUCaseKey:](v2, "setComponentSUCaseKey:", CFSTR("SUcaseForDisplay"));
    -[MRBaseComponentHandler setDisplayNotification:](v2, "setDisplayNotification:", 0);
    -[MRBaseComponentHandler setDisplayModalPopup:](v2, "setDisplayModalPopup:", -[MRBaseComponentHandler isSUCaseForComponent](v2, "isSUCaseForComponent") ^ 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("prefs:root=General&path=About/MAIN_PARTS_AND_SERVICE/TouchController")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v4));
    -[MRBaseComponentHandler setLinkedSensitiveURL:](v2, "setLinkedSensitiveURL:", v5);

    -[MRBaseComponentHandler setComponentFollowupClientID:](v2, "setComponentFollowupClientID:", CFSTR("com.apple.mobilerepair.DisplayRepair"));
    -[MRBaseComponentHandler setFinishRepairTitle:](v2, "setFinishRepairTitle:", CFSTR("FINISH_DISPLAY_REPAIR_TITLE"));
    -[MRBaseComponentHandler setFinishRepairMessage:](v2, "setFinishRepairMessage:", CFSTR("FINISH_DISPLAY_REPAIR_DESC"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentFollowupClientID](v2, "componentFollowupClientID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", CFSTR("FINISH_REPAIR")));
    -[MRBaseComponentHandler setFinishRepairKey:](v2, "setFinishRepairKey:", v7);

    -[MRBaseComponentHandler setComponentUnLockCheckCountKey:](v2, "setComponentUnLockCheckCountKey:", CFSTR("unlockCheckCountForDisplay"));
    -[MRBaseComponentHandler setComponentRetriggerCountKey:](v2, "setComponentRetriggerCountKey:", CFSTR("retriggerCheckCountForDisplay"));
    -[MRBaseComponentHandler setComponentLastCheckTimeKey:](v2, "setComponentLastCheckTimeKey:", CFSTR("lastCheckTimeForDisplay"));
    -[MRBaseComponentHandler setComponentHasDisplayedFollowUpKey:](v2, "setComponentHasDisplayedFollowUpKey:", CFSTR("hasDisplayedFollowupForDisplay"));
    -[MRBaseComponentHandler setComponentUnlockCheckerActivityName:](v2, "setComponentUnlockCheckerActivityName:", CFSTR("com.apple.mobilerepair.displayunlockchecker"));
    -[MRBaseComponentHandler setComponentNtwkActivityName:](v2, "setComponentNtwkActivityName:", CFSTR("com.apple.mobilerepair.displaynotifyServer"));
    -[MRBaseComponentHandler setComponentId:](v2, "setComponentId:", 1);
    -[MRBaseComponentHandler setComponentHasNotifiedServerKey:](v2, "setComponentHasNotifiedServerKey:", CFSTR("hasNotifiedServerForDisplay"));
    v8 = (void *)objc_opt_new(CRRepairHistory);
    -[MRBaseComponentHandler setNotifyServer:](v2, "setNotifyServer:", objc_msgSend(v8, "deviceSupportsRepairBootIntent") ^ 1);

    -[MRBaseComponentHandler setComponentNtwkActivityName:](v2, "setComponentNtwkActivityName:", CFSTR("com.apple.mobilerepair.displaynotifyServer"));
    -[MRBaseComponentHandler setComponentDataCollectionPresentedKey:](v2, "setComponentDataCollectionPresentedKey:", CFSTR("dataCollectionNoticePresentedForPartsAndService"));
    -[MRBaseComponentHandler setComponentFirstUIDisplayedTimeKey:](v2, "setComponentFirstUIDisplayedTimeKey:", CFSTR("firstUIDisplayedTimeForDisplay"));
    -[MRBaseComponentHandler setLastKnownComponentIdentifierKey:](v2, "setLastKnownComponentIdentifierKey:", CFSTR("lastKnownIDForDisplay"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](v2, "componentName"));
    v10 = +[CRFDRBaseDeviceHandler copySealingManifestDataInstanceForComponent:](CRFDRBaseDeviceHandler, "copySealingManifestDataInstanceForComponent:", v9);
    -[MRBaseComponentHandler setLastKnownComponentIdentifierValue:](v2, "setLastKnownComponentIdentifierValue:", v10);

    v11 = (void *)objc_opt_new(CRDisplayStatus);
    -[MRBaseComponentHandler setComponentAuthHandler:](v2, "setComponentAuthHandler:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentFollowupClientID](v2, "componentFollowupClientID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/var/mobile/Library/Preferences/"), "stringByAppendingString:", v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingString:", CFSTR(".plist")));
    -[MRBaseComponentHandler setStateFilePath:](v2, "setStateFilePath:", v14);

    -[MRBaseComponentHandler setComponentForceKey:](v2, "setComponentForceKey:", CFSTR("ForceDisplayStatus"));
    v18.receiver = v2;
    v18.super_class = (Class)MRDisplayComponentHandler;
    if (-[MRBaseComponentHandler deviceClass](&v18, "deviceClass") == 3)
    {
      -[MRBaseComponentHandler setFinishRepairMessage:](v2, "setFinishRepairMessage:", CFSTR("FINISH_DISPLAY_REPAIR_DESC_IPAD"));
      -[MRBaseComponentHandler setFollowUpInfoMessage:](v2, "setFollowUpInfoMessage:", CFSTR("UNABLE_TO_VERIFY_DISPLAY_MESSAGE_IPAD"));
      -[MRBaseComponentHandler setPopUpNotificationMessage:](v2, "setPopUpNotificationMessage:", CFSTR("UNABLE_TO_VERIFY_DISPLAY_NOTIF_TEXT_IPAD"));
      v15 = (void *)objc_opt_new(CRRepairHistory);
      v16 = objc_msgSend(v15, "isSupportedIPad");

      if ((v16 & 1) == 0)
      {
        -[MRBaseComponentHandler setUnlockCheckActivityRequired:](v2, "setUnlockCheckActivityRequired:", 0);
        -[MRBaseComponentHandler setDisplayNotification:](v2, "setDisplayNotification:", 0);
        -[MRBaseComponentHandler setDisplayModalPopup:](v2, "setDisplayModalPopup:", 0);
        -[MRBaseComponentHandler setDisplayFollowup:](v2, "setDisplayFollowup:", 0);
      }
    }
  }
  return v2;
}

+ (void)handleSUCase
{
  id v3;

  if (+[CRFDRBaseDeviceHandler isFDRDataClassSupported:](CRFDRBaseDeviceHandler, "isFDRDataClassSupported:", CFSTR("tcrt")))
  {
    v3 = (id)objc_opt_new(CRDisplayStatus);
    objc_msgSend(a1, "handleComponentSUCase:lastAUthCheckBuildVersion:followUpItemID:queryString:suCasekey:startBuildVersion:componentAuth:", CFSTR("hasDisplayedFollowupForDisplay"), CFSTR("LastDisplayAuthCompleteBuildVersion"), CFSTR("com.apple.mobilerepair.DisplayRepair"), CFSTR("TouchController"), CFSTR("SUcaseForDisplay"), CFSTR("17A800"), v3);

  }
}

+ (id)sharedSingleton
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005E04;
  block[3] = &unk_1000185F8;
  block[4] = a1;
  if (qword_10001EA68 != -1)
    dispatch_once(&qword_10001EA68, block);
  return (id)qword_10001EA60;
}

@end
