@implementation MRUWBComponentHandler

- (MRUWBComponentHandler)init
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
  MRUWBComponentHandler *v2;
  MRUWBComponentHandler *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MRUWBComponentHandler;
  v2 = -[MRSystemHealthComponentHandler initWithComponentName:](&v8, "initWithComponentName:", CFSTR("UWB"));
  v3 = v2;
  if (v2)
  {
    -[MRBaseComponentHandler setComponentName:](v2, "setComponentName:", CFSTR("UWB"));
    v4 = (void *)objc_opt_new(CRUWBStatus);
    -[MRBaseComponentHandler setComponentAuthHandler:](v3, "setComponentAuthHandler:", v4);

    -[MRBaseComponentHandler setComponentId:](v3, "setComponentId:", 7);
    -[MRBaseComponentHandler setPopUpNotificationTitle:](v3, "setPopUpNotificationTitle:", CFSTR("UWB_FOLLOWUP_TITLE"));
    if (-[MRBaseComponentHandler deviceClass](v3, "deviceClass") == 3)
    {
      -[MRBaseComponentHandler setFollowUpInfoMessage:](v3, "setFollowUpInfoMessage:", CFSTR("UWB_FOLLOWUP_INFO_IPAD"));
      -[MRBaseComponentHandler setPopUpNotificationMessage:](v3, "setPopUpNotificationMessage:", CFSTR("UWB_POPUP_INFO_IPAD"));
      v5 = (void *)objc_opt_new(CRRepairHistory);
      v6 = objc_msgSend(v5, "isSupportedIPad");

      if ((v6 & 1) == 0)
      {
        -[MRBaseComponentHandler setUnlockCheckActivityRequired:](v3, "setUnlockCheckActivityRequired:", 0);
        -[MRBaseComponentHandler setDisplayNotification:](v3, "setDisplayNotification:", 0);
        -[MRBaseComponentHandler setDisplayModalPopup:](v3, "setDisplayModalPopup:", 0);
        -[MRBaseComponentHandler setDisplayFollowup:](v3, "setDisplayFollowup:", 0);
      }
    }
    else
    {
      -[MRBaseComponentHandler setFollowUpInfoMessage:](v3, "setFollowUpInfoMessage:", CFSTR("UWB_FOLLOWUP_INFO"));
      -[MRBaseComponentHandler setPopUpNotificationMessage:](v3, "setPopUpNotificationMessage:", CFSTR("UWB_POPUP_INFO"));
    }
  }
  return v3;
}

+ (id)sharedSingleton
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004FEC;
  block[3] = &unk_1000185F8;
  block[4] = a1;
  if (qword_10001EA28 != -1)
    dispatch_once(&qword_10001EA28, block);
  return (id)qword_10001EA20;
}

+ (void)handleSUCase
{
  id v3;

  v3 = (id)objc_opt_new(CRUWBStatus);
  objc_msgSend(a1, "handleComponentSUCase:lastAUthCheckBuildVersion:followUpItemID:queryString:suCasekey:startBuildVersion:componentAuth:", CFSTR("hasDisplayedFollowupForSHCUWB"), CFSTR("LastUWBAuthCompleteBuildVersion"), CFSTR("com.apple.mobilerepair.UWBRepair"), CFSTR("UWB"), CFSTR("SUcaseForUWB"), CFSTR("19F1"), v3);

}

@end
