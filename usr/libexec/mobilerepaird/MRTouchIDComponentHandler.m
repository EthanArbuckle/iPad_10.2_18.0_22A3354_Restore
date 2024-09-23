@implementation MRTouchIDComponentHandler

- (id)_init
{
  MRTouchIDComponentHandler *v2;
  MRTouchIDComponentHandler *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MRTouchIDComponentHandler;
  v2 = -[MRSystemHealthComponentHandler initWithComponentName:](&v8, "initWithComponentName:", CFSTR("TouchID"));
  v3 = v2;
  if (v2)
  {
    -[MRBaseComponentHandler setComponentName:](v2, "setComponentName:", CFSTR("TouchID"));
    v4 = (void *)objc_opt_new(CRTouchIDStatus);
    -[MRBaseComponentHandler setComponentAuthHandler:](v3, "setComponentAuthHandler:", v4);

    -[MRBaseComponentHandler setComponentId:](v3, "setComponentId:", 12);
    -[MRBaseComponentHandler setPopUpNotificationTitle:](v3, "setPopUpNotificationTitle:", CFSTR("TOUCHID_FOLLOWUP_TITLE"));
    if (-[MRBaseComponentHandler deviceClass](v3, "deviceClass") == 3)
    {
      -[MRBaseComponentHandler setSupportsRepair:](v3, "setSupportsRepair:", 1);
      -[MRBaseComponentHandler setFinishRepairTitle:](v3, "setFinishRepairTitle:", CFSTR("FINISH_TOUCHID_REPAIR_TITLE"));
      -[MRBaseComponentHandler setFinishRepairMessage:](v3, "setFinishRepairMessage:", CFSTR("FINISH_TOUCHID_REPAIR_DESC_IPAD"));
      -[MRBaseComponentHandler setFollowUpInfoMessage:](v3, "setFollowUpInfoMessage:", CFSTR("TOUCHID_FOLLOWUP_INFO_IPAD"));
      -[MRBaseComponentHandler setPopUpNotificationMessage:](v3, "setPopUpNotificationMessage:", CFSTR("TOUCHID_POPUP_INFO_IPAD"));
      -[MRBaseComponentHandler setUnlockCheckActivityRequired:](v3, "setUnlockCheckActivityRequired:", 1);
      v5 = (void *)objc_opt_new(CRRepairHistory);
      v6 = objc_msgSend(v5, "isSupportedIPad");

      if ((v6 & 1) != 0)
        goto LABEL_7;
    }
    else
    {
      -[MRBaseComponentHandler setFollowUpInfoMessage:](v3, "setFollowUpInfoMessage:", CFSTR("TOUCHID_FOLLOWUP_INFO"));
      -[MRBaseComponentHandler setPopUpNotificationMessage:](v3, "setPopUpNotificationMessage:", CFSTR("TOUCHID_POPUP_INFO"));
    }
    -[MRBaseComponentHandler setUnlockCheckActivityRequired:](v3, "setUnlockCheckActivityRequired:", 0);
    -[MRBaseComponentHandler setDisplayNotification:](v3, "setDisplayNotification:", 0);
    -[MRBaseComponentHandler setDisplayModalPopup:](v3, "setDisplayModalPopup:", 0);
    -[MRBaseComponentHandler setDisplayFollowup:](v3, "setDisplayFollowup:", 0);
LABEL_7:
    -[MRBaseComponentHandler setComponentForceKey:](v3, "setComponentForceKey:", CFSTR("ForceTouchIDStatus"));
  }
  return v3;
}

+ (id)sharedSingleton
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004D0C;
  block[3] = &unk_1000185F8;
  block[4] = a1;
  if (qword_10001EA18 != -1)
    dispatch_once(&qword_10001EA18, block);
  return (id)qword_10001EA10;
}

@end
