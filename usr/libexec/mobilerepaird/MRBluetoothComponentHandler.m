@implementation MRBluetoothComponentHandler

- (MRBluetoothComponentHandler)init
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
  MRBluetoothComponentHandler *v2;
  MRBluetoothComponentHandler *v3;
  void *v4;
  unsigned int v5;
  const __CFString *v6;
  const __CFString *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MRBluetoothComponentHandler;
  v2 = -[MRSystemHealthComponentHandler initWithComponentName:](&v9, "initWithComponentName:", CFSTR("Bluetooth"));
  v3 = v2;
  if (v2)
  {
    -[MRBaseComponentHandler setComponentName:](v2, "setComponentName:", CFSTR("Bluetooth"));
    v4 = (void *)objc_opt_new(CRBluetoothStatus);
    -[MRBaseComponentHandler setComponentAuthHandler:](v3, "setComponentAuthHandler:", v4);

    -[MRBaseComponentHandler setComponentId:](v3, "setComponentId:", 3);
    -[MRBaseComponentHandler setPopUpNotificationTitle:](v3, "setPopUpNotificationTitle:", CFSTR("BLUETOOTH_FOLLOWUP_TITLE"));
    v5 = -[MRBaseComponentHandler deviceClass](v3, "deviceClass");
    if (v5 == 3)
      v6 = CFSTR("BLUETOOTH_FOLLOWUP_INFO_IPAD");
    else
      v6 = CFSTR("BLUETOOTH_FOLLOWUP_INFO");
    if (v5 == 3)
      v7 = CFSTR("BLUETOOTH_POPUP_INFO_IPAD");
    else
      v7 = CFSTR("BLUETOOTH_POPUP_INFO");
    -[MRBaseComponentHandler setFollowUpInfoMessage:](v3, "setFollowUpInfoMessage:", v6);
    -[MRBaseComponentHandler setPopUpNotificationMessage:](v3, "setPopUpNotificationMessage:", v7);
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
  block[2] = sub_1000052D0;
  block[3] = &unk_1000185F8;
  block[4] = a1;
  if (qword_10001EA38 != -1)
    dispatch_once(&qword_10001EA38, block);
  return (id)qword_10001EA30;
}

@end
