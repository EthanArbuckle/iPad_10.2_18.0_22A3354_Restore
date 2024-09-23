@implementation MRCameraComponentHandler

- (MRCameraComponentHandler)init
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
  MRCameraComponentHandler *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MRCameraComponentHandler;
  v2 = -[MRBaseComponentHandler init](&v16, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    -[MRBaseComponentHandler setIsSUCaseForComponent:](v2, "setIsSUCaseForComponent:", objc_msgSend(v3, "BOOLForKey:", CFSTR("SUcaseForCamera")));

    -[MRBaseComponentHandler setComponentName:](v2, "setComponentName:", CFSTR("Camera"));
    -[MRBaseComponentHandler setSupportsRepair:](v2, "setSupportsRepair:", 1);
    -[MRBaseComponentHandler setPopUpNotificationMessage:](v2, "setPopUpNotificationMessage:", CFSTR("UNABLE_TO_VERIFY_CAMERA_NOTIF_TEXT"));
    -[MRBaseComponentHandler setPopUpNotificationTitle:](v2, "setPopUpNotificationTitle:", CFSTR("IMPORTANT_CAMERA_MESSAGE"));
    -[MRBaseComponentHandler setFollowUpInfoMessage:](v2, "setFollowUpInfoMessage:", CFSTR("UNABLE_TO_VERIFY_CAMERA_MESSAGE"));
    -[MRBaseComponentHandler setComponentSUCaseKey:](v2, "setComponentSUCaseKey:", CFSTR("SUcaseForCamera"));
    -[MRBaseComponentHandler setDisplayNotification:](v2, "setDisplayNotification:", 0);
    -[MRBaseComponentHandler setDisplayModalPopup:](v2, "setDisplayModalPopup:", -[MRBaseComponentHandler isSUCaseForComponent](v2, "isSUCaseForComponent") ^ 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("prefs:root=General&path=About/MAIN_PARTS_AND_SERVICE/Camera")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v4));
    -[MRBaseComponentHandler setLinkedSensitiveURL:](v2, "setLinkedSensitiveURL:", v5);

    -[MRBaseComponentHandler setComponentFollowupClientID:](v2, "setComponentFollowupClientID:", CFSTR("com.apple.mobilerepair.CameraRepair"));
    -[MRBaseComponentHandler setFinishRepairTitle:](v2, "setFinishRepairTitle:", CFSTR("FINISH_CAMERA_REPAIR_TITLE"));
    -[MRBaseComponentHandler setFinishRepairMessage:](v2, "setFinishRepairMessage:", CFSTR("FINISH_CAMERA_REPAIR_DESC"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentFollowupClientID](v2, "componentFollowupClientID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", CFSTR("FINISH_REPAIR")));
    -[MRBaseComponentHandler setFinishRepairKey:](v2, "setFinishRepairKey:", v7);

    -[MRBaseComponentHandler setComponentUnLockCheckCountKey:](v2, "setComponentUnLockCheckCountKey:", CFSTR("unlockCheckCountForCamera"));
    -[MRBaseComponentHandler setComponentRetriggerCountKey:](v2, "setComponentRetriggerCountKey:", CFSTR("retriggerCheckCountForCamera"));
    -[MRBaseComponentHandler setComponentLastCheckTimeKey:](v2, "setComponentLastCheckTimeKey:", CFSTR("lastCheckTimeForCamera"));
    -[MRBaseComponentHandler setComponentHasDisplayedFollowUpKey:](v2, "setComponentHasDisplayedFollowUpKey:", CFSTR("hasDisplayedFollowupForCamera"));
    -[MRBaseComponentHandler setComponentUnlockCheckerActivityName:](v2, "setComponentUnlockCheckerActivityName:", CFSTR("com.apple.mobilerepair.cameraunlockchecker"));
    -[MRBaseComponentHandler setComponentId:](v2, "setComponentId:", 2);
    -[MRBaseComponentHandler setComponentNtwkActivityName:](v2, "setComponentNtwkActivityName:", CFSTR("com.apple.mobilerepair.cameranotifyServer"));
    -[MRBaseComponentHandler setComponentHasNotifiedServerKey:](v2, "setComponentHasNotifiedServerKey:", CFSTR("hasNotifiedServerForCamera"));
    -[MRBaseComponentHandler setNotifyServer:](v2, "setNotifyServer:", 0);
    -[MRBaseComponentHandler setComponentDataCollectionPresentedKey:](v2, "setComponentDataCollectionPresentedKey:", CFSTR("dataCollectionNoticePresentedForPartsAndService"));
    -[MRBaseComponentHandler setComponentFirstUIDisplayedTimeKey:](v2, "setComponentFirstUIDisplayedTimeKey:", CFSTR("firstUIDisplayedTimeForCamera"));
    -[MRBaseComponentHandler setLastKnownComponentIdentifierKey:](v2, "setLastKnownComponentIdentifierKey:", CFSTR("lastKnownIDForCamera"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](v2, "componentName"));
    v9 = +[CRFDRBaseDeviceHandler copySealingManifestDataInstanceForComponent:](CRFDRBaseDeviceHandler, "copySealingManifestDataInstanceForComponent:", v8);
    -[MRBaseComponentHandler setLastKnownComponentIdentifierValue:](v2, "setLastKnownComponentIdentifierValue:", v9);

    v10 = (void *)objc_opt_new(CRCameraAuth);
    -[MRBaseComponentHandler setComponentAuthHandler:](v2, "setComponentAuthHandler:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentFollowupClientID](v2, "componentFollowupClientID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/var/mobile/Library/Preferences/"), "stringByAppendingString:", v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingString:", CFSTR(".plist")));
    -[MRBaseComponentHandler setStateFilePath:](v2, "setStateFilePath:", v13);

    -[MRBaseComponentHandler setComponentForceKey:](v2, "setComponentForceKey:", CFSTR("ForceCameraStatus"));
    if (-[MRBaseComponentHandler deviceClass](v2, "deviceClass") == 3)
    {
      -[MRBaseComponentHandler setFinishRepairMessage:](v2, "setFinishRepairMessage:", CFSTR("FINISH_CAMERA_REPAIR_DESC_IPAD"));
      -[MRBaseComponentHandler setFollowUpInfoMessage:](v2, "setFollowUpInfoMessage:", CFSTR("UNABLE_TO_VERIFY_CAMERA_MESSAGE_IPAD"));
      -[MRBaseComponentHandler setPopUpNotificationMessage:](v2, "setPopUpNotificationMessage:", CFSTR("UNABLE_TO_VERIFY_CAMERA_NOTIF_TEXT_IPAD"));
      v14 = (void *)objc_opt_new(CRCameraAuthUsingProperty);
      -[MRBaseComponentHandler setComponentAuthHandler:](v2, "setComponentAuthHandler:", v14);

    }
  }
  return v2;
}

+ (void)handleSUCase
{
  void *v3;
  unsigned int v4;
  _QWORD *v5;
  id v6;

  v3 = (void *)MGCopyAnswer(CFSTR("DeviceClassNumber"), 0);
  v4 = objc_msgSend(v3, "intValue");

  if ((+[CRFDRBaseDeviceHandler isFDRDataClassSupported:](CRFDRBaseDeviceHandler, "isFDRDataClassSupported:", CFSTR("CmCl")) & 1) != 0|| +[CRFDRBaseDeviceHandler isFDRPropertySupported:](CRFDRBaseDeviceHandler, "isFDRPropertySupported:", CFSTR("RCSn")))
  {
    v5 = CRCameraAuth_ptr;
    if (v4 != 1)
      v5 = CRCameraAuthUsingProperty_ptr;
    v6 = (id)objc_opt_new(*v5);
    objc_msgSend(a1, "handleComponentSUCase:lastAUthCheckBuildVersion:followUpItemID:queryString:suCasekey:startBuildVersion:componentAuth:", CFSTR("hasDisplayedFollowupForCamera"), CFSTR("LastCameraAuthCompleteBuildVersion"), CFSTR("com.apple.mobilerepair.CameraRepair"), CFSTR("Camera"), CFSTR("SUcaseForCamera"), CFSTR("18D1"), v6);

  }
}

+ (id)sharedSingleton
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004A94;
  block[3] = &unk_1000185F8;
  block[4] = a1;
  if (qword_10001EA08 != -1)
    dispatch_once(&qword_10001EA08, block);
  return (id)qword_10001EA00;
}

@end
