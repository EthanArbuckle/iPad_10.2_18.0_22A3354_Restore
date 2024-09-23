@implementation MRAudioComponentHandler

- (MRAudioComponentHandler)init
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
  MRAudioComponentHandler *v2;
  MRAudioComponentHandler *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MRAudioComponentHandler;
  v2 = -[MRSystemHealthComponentHandler initWithComponentName:](&v6, "initWithComponentName:", CFSTR("Audio"));
  v3 = v2;
  if (v2)
  {
    -[MRBaseComponentHandler setComponentName:](v2, "setComponentName:", CFSTR("Audio"));
    v4 = (void *)objc_opt_new(CRAudioStatus);
    -[MRBaseComponentHandler setComponentAuthHandler:](v3, "setComponentAuthHandler:", v4);

    -[MRBaseComponentHandler setComponentId:](v3, "setComponentId:", 8);
    -[MRBaseComponentHandler setPopUpNotificationTitle:](v3, "setPopUpNotificationTitle:", CFSTR("SPEAKER_FOLLOWUP_TITLE"));
    -[MRBaseComponentHandler setFollowUpInfoMessage:](v3, "setFollowUpInfoMessage:", CFSTR("AUDIO_FOLLOWUP_INFO"));
    -[MRBaseComponentHandler setPopUpNotificationMessage:](v3, "setPopUpNotificationMessage:", CFSTR("AUDIO_POPUP_INFO"));
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
  block[2] = sub_10000608C;
  block[3] = &unk_1000185F8;
  block[4] = a1;
  if (qword_10001EA78 != -1)
    dispatch_once(&qword_10001EA78, block);
  return (id)qword_10001EA70;
}

@end
