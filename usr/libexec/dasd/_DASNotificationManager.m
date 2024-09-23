@implementation _DASNotificationManager

- (_DASNotificationManager)init
{
  _DASNotificationManager *v2;
  UNUserNotificationCenter *v3;
  UNUserNotificationCenter *unCenter;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  _QWORD v8[4];
  _DASNotificationManager *v9;
  int out_token;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_DASNotificationManager;
  v2 = -[_DASNotificationManager init](&v11, "init");
  if (v2)
  {
    v3 = (UNUserNotificationCenter *)objc_msgSend(objc_alloc((Class)UNUserNotificationCenter), "initWithBundleIdentifier:", CFSTR("com.apple.dasd-notifications"));
    unCenter = v2->_unCenter;
    v2->_unCenter = v3;

    -[UNUserNotificationCenter setDelegate:](v2->_unCenter, "setDelegate:", v2);
    -[UNUserNotificationCenter setWantsNotificationResponsesDelivered](v2->_unCenter, "setWantsNotificationResponsesDelivered");
    out_token = 0;
    global_queue = dispatch_get_global_queue(-32768, 0);
    v6 = objc_claimAutoreleasedReturnValue(global_queue);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100058B64;
    v8[3] = &unk_10015D9B8;
    v9 = v2;
    notify_register_dispatch("com.apple.dasd.notifications", &out_token, v6, v8);

  }
  return v2;
}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100058C48;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001AB830 != -1)
    dispatch_once(&qword_1001AB830, block);
  return (id)qword_1001AB838;
}

- (id)defaultNotifcationRequest
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init((Class)UNMutableNotificationContent);
  objc_msgSend(v2, "setTitle:", CFSTR("Hello DAS!"));
  objc_msgSend(v2, "setBody:", CFSTR("I seek to be sentient..."));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationIcon iconForSystemImageNamed:](UNNotificationIcon, "iconForSystemImageNamed:", CFSTR("brain")));
  objc_msgSend(v2, "setIcon:", v3);

  objc_msgSend(v2, "setCategoryIdentifier:", CFSTR("dasInfoCategory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationRequest requestWithIdentifier:content:trigger:](UNNotificationRequest, "requestWithIdentifier:content:trigger:", CFSTR("com.apple.dasd.test"), v2, 0));
  objc_msgSend(v4, "setDestinations:", 15);

  return v4;
}

- (void)postNotificationAtDate:(id)a3 withTitle:(id)a4 withTextContent:(id)a5 icon:(id)a6 url:(id)a7 expirationDate:(id)a8
{
  id v14;
  id v15;
  __CFString *v16;
  id v17;
  id v18;
  id v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  v14 = a4;
  v15 = a5;
  v16 = (__CFString *)a6;
  v17 = a7;
  v18 = a8;
  if (+[_DASConfig isInternalBuild](_DASConfig, "isInternalBuild"))
  {
    v19 = objc_alloc_init((Class)UNMutableNotificationContent);
    objc_msgSend(v19, "setCategoryIdentifier:", CFSTR("dasInfoCategory"));
    objc_msgSend(v19, "setTitle:", v14);
    objc_msgSend(v19, "setBody:", v15);
    if (-[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("TTR")))
    {
      v20 = CFSTR("ant.fill");
    }
    else if (v16)
    {
      v20 = v16;
    }
    else
    {
      v20 = CFSTR("brain");
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationIcon iconForSystemImageNamed:](UNNotificationIcon, "iconForSystemImageNamed:", v20));
    objc_msgSend(v19, "setIcon:", v21);

    if (v18)
      objc_msgSend(v19, "setExpirationDate:", v18);
    if (v17)
      objc_msgSend(v19, "setDefaultActionURL:", v17);
    if (v26)
    {
      objc_msgSend(v26, "timeIntervalSinceNow");
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[UNTimeIntervalNotificationTrigger triggerWithTimeInterval:repeats:](UNTimeIntervalNotificationTrigger, "triggerWithTimeInterval:repeats:", 0));
    }
    else
    {
      v22 = 0;
    }
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.dasd-notifications:%lf"), v23));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationRequest requestWithIdentifier:content:trigger:](UNNotificationRequest, "requestWithIdentifier:content:trigger:", v24, v19, v22));

    objc_msgSend(v25, "setDestinations:", 15);
    -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](self->_unCenter, "addNotificationRequest:withCompletionHandler:", v25, 0);

  }
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (UNUserNotificationCenter)unCenter
{
  return self->_unCenter;
}

- (void)setUnCenter:(id)a3
{
  objc_storeStrong((id *)&self->_unCenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unCenter, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
