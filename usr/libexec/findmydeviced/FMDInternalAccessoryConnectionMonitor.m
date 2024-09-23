@implementation FMDInternalAccessoryConnectionMonitor

+ (id)sharedMonitor
{
  if (qword_1003068D0 != -1)
    dispatch_once(&qword_1003068D0, &stru_1002C4CC0);
  return (id)qword_1003068C8;
}

- (void)accessoryDidUpdate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  v8 = objc_alloc_init((Class)FMAlert);
  objc_msgSend(v8, "setMsgTitle:", CFSTR("Accessory connected"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("'%@' connected at %@"), v4, v5));
  objc_msgSend(v8, "setMsgText:", v6);

  objc_msgSend(v8, "setDefaultButtonTitle:", CFSTR("OK"));
  objc_msgSend(v8, "setShowMsgInLockScreen:", 1);
  objc_msgSend(v8, "setDismissMsgOnUnlock:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMAlertManager sharedInstance](FMAlertManager, "sharedInstance"));
  objc_msgSend(v7, "activateAlert:", v8);

}

- (void)accessoryDidDisconnect:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  v8 = objc_alloc_init((Class)FMAlert);
  objc_msgSend(v8, "setMsgTitle:", CFSTR("Accessory disconnected"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("'%@' disconnected at %@"), v4, v5));
  objc_msgSend(v8, "setMsgText:", v6);

  objc_msgSend(v8, "setDefaultButtonTitle:", CFSTR("OK"));
  objc_msgSend(v8, "setShowMsgInLockScreen:", 1);
  objc_msgSend(v8, "setDismissMsgOnUnlock:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMAlertManager sharedInstance](FMAlertManager, "sharedInstance"));
  objc_msgSend(v7, "activateAlert:", v8);

}

@end
