@implementation MRBasebandComponentHandler

- (MRBasebandComponentHandler)init
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
  MRBasebandComponentHandler *v2;
  MRBasebandComponentHandler *v3;
  void *v4;
  unsigned int v5;
  const __CFString *v6;
  const __CFString *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MRBasebandComponentHandler;
  v2 = -[MRSystemHealthComponentHandler initWithComponentName:](&v9, "initWithComponentName:", CFSTR("Baseband"));
  v3 = v2;
  if (v2)
  {
    -[MRBaseComponentHandler setComponentName:](v2, "setComponentName:", CFSTR("Baseband"));
    v4 = (void *)objc_opt_new(CRBasebandStatus);
    -[MRBaseComponentHandler setComponentAuthHandler:](v3, "setComponentAuthHandler:", v4);

    -[MRBaseComponentHandler setComponentId:](v3, "setComponentId:", 5);
    -[MRBaseComponentHandler setPopUpNotificationTitle:](v3, "setPopUpNotificationTitle:", CFSTR("CELLULAR_FOLLOWUP_TITLE"));
    v5 = -[MRBaseComponentHandler deviceClass](v3, "deviceClass");
    if (v5 == 3)
      v6 = CFSTR("BASEBAND_POPUP_INFO_IPAD");
    else
      v6 = CFSTR("BASEBAND_POPUP_INFO");
    if (v5 == 3)
      v7 = CFSTR("BASEBAND_FOLLOWUP_INFO_IPAD");
    else
      v7 = CFSTR("BASEBAND_FOLLOWUP_INFO");
    -[MRBaseComponentHandler setPopUpNotificationMessage:](v3, "setPopUpNotificationMessage:", v6);
    -[MRBaseComponentHandler setFollowUpInfoMessage:](v3, "setFollowUpInfoMessage:", v7);
    -[MRBaseComponentHandler setUnlockCheckActivityRequired:](v3, "setUnlockCheckActivityRequired:", 0);
    -[MRBaseComponentHandler setDisplayNotification:](v3, "setDisplayNotification:", 0);
    -[MRBaseComponentHandler setDisplayModalPopup:](v3, "setDisplayModalPopup:", 0);
    -[MRBaseComponentHandler setDisplayFollowup:](v3, "setDisplayFollowup:", 0);
  }
  return v3;
}

+ (id)sharedSingleton
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B218;
  block[3] = &unk_1000185F8;
  block[4] = a1;
  if (qword_10001EAB8 != -1)
    dispatch_once(&qword_10001EAB8, block);
  return (id)qword_10001EAB0;
}

+ (void)handleSUCase
{
  id v3;

  v3 = (id)objc_opt_new(CRBasebandStatus);
  objc_msgSend(a1, "handleComponentSUCase:lastAUthCheckBuildVersion:followUpItemID:queryString:suCasekey:startBuildVersion:componentAuth:", CFSTR("hasDisplayedFollowupForSHCBaseband"), CFSTR("LastBasebandAuthCompleteBuildVersion"), CFSTR("com.apple.mobilerepair.BasebandRepair"), CFSTR("Baseband"), CFSTR("SUcaseForBaseband"), CFSTR("19F1"), v3);

}

@end
