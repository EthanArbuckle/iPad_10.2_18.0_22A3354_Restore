@implementation MTNotificationBadgeMigrationController

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D3FD4;
  block[3] = &unk_1004A65A0;
  block[4] = a1;
  if (qword_1005674A0 != -1)
    dispatch_once(&qword_1005674A0, block);
  return (id)qword_1005674A8;
}

- (id)_initShared
{
  MTNotificationBadgeMigrationController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int64_t state;
  MTNotificationBadgeMigrationController *v11;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MTNotificationBadgeMigrationController;
  v2 = -[MTNotificationBadgeMigrationController init](&v16, "init");
  if (!v2)
    goto LABEL_6;
  v3 = dispatch_queue_create(0, 0);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v3;

  objc_initWeak(&location, v2);
  v5 = objc_msgSend((id)objc_opt_class(v2), "hasPerformedLegacyBadgeMigration");
  v6 = 2;
  if (!v5)
    v6 = 0;
  v2->_state = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v9 = MTApplicationDidBecomeActiveNotification;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000D41AC;
  v13[3] = &unk_1004A72B8;
  objc_copyWeak(&v14, &location);
  v2->_appActivateObserver = objc_msgSend(v7, "addObserverForName:object:queue:usingBlock:", v9, 0, v8, v13);

  state = v2->_state;
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  if (state == 2)
    v11 = 0;
  else
LABEL_6:
    v11 = v2;

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[MTNotificationBadgeMigrationController stopObservingApplicationState](self, "stopObservingApplicationState");
  v3.receiver = self;
  v3.super_class = (Class)MTNotificationBadgeMigrationController;
  -[MTNotificationBadgeMigrationController dealloc](&v3, "dealloc");
}

+ (id)hasPerformedLegacyBadgeMigrationKey
{
  return CFSTR("com.apple.podcasts.notifications.badgeSettingCleared");
}

+ (BOOL)hasPerformedLegacyBadgeMigration
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSharedUserDefaults](NSUserDefaults, "_applePodcastsFoundationSharedUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "hasPerformedLegacyBadgeMigrationKey"));
  v5 = objc_msgSend(v3, "BOOLForKey:", v4);

  return v5;
}

+ (void)commitHasPerformedLegacyBadgeMigration
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSharedUserDefaults](NSUserDefaults, "_applePodcastsFoundationSharedUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "hasPerformedLegacyBadgeMigrationKey"));
  objc_msgSend(v4, "setBool:forKey:", 1, v3);

}

- (void)performMigrationIfNecessary
{
  NSObject *queue;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000D439C;
  v4[3] = &unk_1004A6F38;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(queue, v4);
  if (*((_BYTE *)v6 + 24))
    -[MTNotificationBadgeMigrationController performMigration](self, "performMigration");
  _Block_object_dispose(&v5, 8);
}

- (void)performMigration
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000D4484;
  v4[3] = &unk_1004A8FB0;
  v4[4] = self;
  objc_msgSend(v3, "getDeliveredNotificationsWithCompletionHandler:", v4);

}

- (void)stopObservingApplicationState
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D4668;
  block[3] = &unk_1004A6200;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (id)appActivateObserver
{
  return self->_appActivateObserver;
}

- (void)setAppActivateObserver:(id)a3
{
  self->_appActivateObserver = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
