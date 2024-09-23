@implementation CRAlert

- (void)_setAlert:(__CFUserNotification *)a3
{
  __CFUserNotification *alert;

  if (a3)
    CFRetain(a3);
  alert = self->_alert;
  if (alert)
    CFRelease(alert);
  self->_alert = a3;
}

- (BOOL)allowInCar
{
  return 0;
}

- (double)alertDismissal
{
  return 0.0;
}

- (BOOL)requiresUnlockedDevice
{
  return 1;
}

- (id)lockscreenTitle
{
  return (id)CRLocalizedStringForKey(CFSTR("CARPLAY_LOCKSCREEN_TITLE"), a2);
}

- (id)lockscreenMessage
{
  return 0;
}

- (BOOL)dismissOnUnlock
{
  return 0;
}

- (id)alertTitle
{
  return 0;
}

- (id)alertMessage
{
  return 0;
}

- (id)alertAcceptButtonTitle
{
  return 0;
}

- (id)alertDeclineButtonTitle
{
  return 0;
}

- (id)alertOtherButtonTitle
{
  return 0;
}

- (id)iconImagePath
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = CRFrameworkBundle(self, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundlePath"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("CarPlayNotificationIcon.png")));
  return v5;
}

- (BOOL)_isDeviceUnlocked
{
  int v2;

  v2 = MKBGetDeviceLockState(0, a2);
  return !v2 || v2 == 3;
}

- (id)_alertContents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, SBUserNotificationDismissOnLock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[CRAlert dismissOnUnlock](self, "dismissOnUnlock") ^ 1));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, SBUserNotificationDontDismissOnUnlock);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CRAlert allowInCar](self, "allowInCar")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, SBUserNotificationAllowInCarKey);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRAlert alertTitle](self, "alertTitle"));
  if (v6)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, kCFUserNotificationAlertHeaderKey);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRAlert alertMessage](self, "alertMessage"));
  if (v7)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, kCFUserNotificationAlertMessageKey);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRAlert alertAcceptButtonTitle](self, "alertAcceptButtonTitle"));
  if (v8)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, kCFUserNotificationDefaultButtonTitleKey);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRAlert alertDeclineButtonTitle](self, "alertDeclineButtonTitle"));
  if (v9)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, kCFUserNotificationAlternateButtonTitleKey);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRAlert alertOtherButtonTitle](self, "alertOtherButtonTitle"));
  if (v10)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, kCFUserNotificationOtherButtonTitleKey);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRAlert lockscreenMessage](self, "lockscreenMessage"));
  v12 = v11 != 0;
  if (v11)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, SBUserNotificationLockScreenAlertMessageKey);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRAlert lockscreenTitle](self, "lockscreenTitle"));
  if (v13)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, SBUserNotificationLockScreenAlertHeaderKey);
    v12 = 1;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRAlert iconImagePath](self, "iconImagePath"));
  if (v14)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, SBUserNotificationIconImagePath);
LABEL_18:
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kCFUserNotificationAlertTopMostKey);
    goto LABEL_19;
  }
  if (v12)
    goto LABEL_18;
LABEL_19:

  return v3;
}

- (BOOL)presentAlertWithCompletion:(id)a3
{
  id v4;
  const __CFDictionary *v5;
  CFUserNotificationRef v6;
  CFUserNotificationRef v7;
  dispatch_queue_global_t global_queue;
  NSObject *v9;
  double v10;
  void *v11;
  BOOL v12;
  _QWORD v14[5];
  _QWORD block[5];
  id v16;
  CFUserNotificationRef v17;
  SInt32 error;

  v4 = a3;
  error = 0;
  -[CRAlert setAlertAutoDismissed:](self, "setAlertAutoDismissed:", 0);
  v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(-[CRAlert _alertContents](self, "_alertContents"));
  if (v5 && (v6 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 3uLL, &error, v5)) != 0)
  {
    v7 = v6;
    -[CRAlert _setAlert:](self, "_setAlert:", v6);
    global_queue = dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005CAC;
    block[3] = &unk_1000B5168;
    v17 = v7;
    block[4] = self;
    v16 = v4;
    dispatch_async(v9, block);

    -[CRAlert alertDismissal](self, "alertDismissal");
    if (v10 > 0.0)
    {
      -[CRAlert alertDismissal](self, "alertDismissal");
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100005E48;
      v14[3] = &unk_1000B5190;
      v14[4] = self;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v14));
      -[CRAlert setAlertDismissTimer:](self, "setAlertDismissTimer:", v11);

    }
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)dismissAlert
{
  __CFUserNotification *alert;

  alert = self->_alert;
  if (alert)
    LOBYTE(alert) = CFUserNotificationCancel(alert) == 0;
  return (char)alert;
}

- (NSTimer)alertDismissTimer
{
  return self->_alertDismissTimer;
}

- (void)setAlertDismissTimer:(id)a3
{
  objc_storeStrong((id *)&self->_alertDismissTimer, a3);
}

- (BOOL)alertAutoDismissed
{
  return self->_alertAutoDismissed;
}

- (void)setAlertAutoDismissed:(BOOL)a3
{
  self->_alertAutoDismissed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertDismissTimer, 0);
}

@end
