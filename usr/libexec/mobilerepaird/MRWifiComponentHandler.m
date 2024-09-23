@implementation MRWifiComponentHandler

- (MRWifiComponentHandler)init
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
  MRWifiComponentHandler *v3;
  MRWifiComponentHandler *v4;
  void *v5;
  unsigned int v6;
  BOOL v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  MRWifiComponentHandler *v11;
  void *v12;
  unsigned int v13;
  const __CFString *v14;
  objc_super v16;
  objc_super v17;

  if (MGGetBoolAnswer(CFSTR("wapi"), a2))
  {
    v17.receiver = self;
    v17.super_class = (Class)MRWifiComponentHandler;
    v3 = -[MRSystemHealthComponentHandler initWithComponentName:](&v17, "initWithComponentName:", CFSTR("WLAN"));
    v4 = v3;
    if (!v3)
      return v4;
    -[MRBaseComponentHandler setComponentName:](v3, "setComponentName:", CFSTR("WLAN"));
    v5 = (void *)objc_opt_new(CRWifiStatus);
    -[MRBaseComponentHandler setComponentAuthHandler:](v4, "setComponentAuthHandler:", v5);

    -[MRBaseComponentHandler setComponentId:](v4, "setComponentId:", 4);
    -[MRBaseComponentHandler setPopUpNotificationTitle:](v4, "setPopUpNotificationTitle:", CFSTR("WLAN_FOLLOWUP_TITLE"));
    v6 = -[MRBaseComponentHandler deviceClass](v4, "deviceClass");
    v7 = v6 == 3;
    if (v6 == 3)
      v8 = CFSTR("WLAN_FOLLOWUP_INFO_IPAD");
    else
      v8 = CFSTR("WLAN_FOLLOWUP_INFO");
    v9 = CFSTR("WLAN_POPUP_INFO");
    v10 = CFSTR("WLAN_POPUP_INFO_IPAD");
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)MRWifiComponentHandler;
    v11 = -[MRSystemHealthComponentHandler initWithComponentName:](&v16, "initWithComponentName:", CFSTR("Wifi"));
    v4 = v11;
    if (!v11)
      return v4;
    -[MRBaseComponentHandler setComponentName:](v11, "setComponentName:", CFSTR("Wifi"));
    v12 = (void *)objc_opt_new(CRWifiStatus);
    -[MRBaseComponentHandler setComponentAuthHandler:](v4, "setComponentAuthHandler:", v12);

    -[MRBaseComponentHandler setComponentId:](v4, "setComponentId:", 4);
    -[MRBaseComponentHandler setPopUpNotificationTitle:](v4, "setPopUpNotificationTitle:", CFSTR("WIFI_FOLLOWUP_TITLE"));
    v13 = -[MRBaseComponentHandler deviceClass](v4, "deviceClass");
    v7 = v13 == 3;
    if (v13 == 3)
      v8 = CFSTR("WIFI_FOLLOWUP_INFO_IPAD");
    else
      v8 = CFSTR("WIFI_FOLLOWUP_INFO");
    v9 = CFSTR("WIFI_POPUP_INFO");
    v10 = CFSTR("WIFI_POPUP_INFO_IPAD");
  }
  if (v7)
    v14 = v10;
  else
    v14 = v9;
  -[MRBaseComponentHandler setFollowUpInfoMessage:](v4, "setFollowUpInfoMessage:", v8);
  -[MRBaseComponentHandler setPopUpNotificationMessage:](v4, "setPopUpNotificationMessage:", v14);
  -[MRBaseComponentHandler setUnlockCheckActivityRequired:](v4, "setUnlockCheckActivityRequired:", 0);
  -[MRBaseComponentHandler setDisplayNotification:](v4, "setDisplayNotification:", 0);
  -[MRBaseComponentHandler setDisplayModalPopup:](v4, "setDisplayModalPopup:", 0);
  -[MRBaseComponentHandler setDisplayFollowup:](v4, "setDisplayFollowup:", 0);
  return v4;
}

+ (id)sharedSingleton
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000055F0;
  block[3] = &unk_1000185F8;
  block[4] = a1;
  if (qword_10001EA48 != -1)
    dispatch_once(&qword_10001EA48, block);
  return (id)qword_10001EA40;
}

@end
