@implementation ICCloudContext

- (void)applicationDidFinishLaunching
{
  NSObject *v3;

  v3 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_1000221A0();

  -[ICCloudContext syncWithReason:completionHandler:](self, "syncWithReason:completionHandler:", CFSTR("DidFinishLaunching"), 0);
}

- (void)applicationDidEnterBackground
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _BOOL8 v8;
  unsigned __int8 v9;
  NSObject *v10;
  _QWORD v11[5];
  unsigned __int8 v12;
  _QWORD v13[5];
  BOOL v14;

  v3 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_100404814();

  -[ICCloudContext setQualityOfService:](self, "setQualityOfService:", 9);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentUser"));
  v6 = objc_msgSend(v5, "userType");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100044B3C;
  v13[3] = &unk_100550360;
  v14 = v6 == (id)1;
  v13[4] = self;
  qword_1005DDD20 = (uint64_t)objc_msgSend(v7, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("Background Sync"), v13);

  if (qword_1005DDD20 != UIBackgroundTaskInvalid)
  {
    v8 = v6 != (id)1;
    v9 = -[ICCloudContext syncOnlyIfReachable](self, "syncOnlyIfReachable");
    -[ICCloudContext setSyncOnlyIfReachable:](self, "setSyncOnlyIfReachable:", v8);
    -[ICCloudContext updateCloudContextState](self, "updateCloudContextState");
    v10 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      sub_1004047E8();

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100044CB0;
    v11[3] = &unk_100550BC0;
    v11[4] = self;
    v12 = v9;
    -[ICCloudContext processPendingCloudObjectsWithCompletionHandler:](self, "processPendingCloudObjectsWithCompletionHandler:", v11);
  }
}

- (void)applicationWillTerminate
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v2, "endBackgroundTask:", qword_1005DDD20);

  qword_1005DDD20 = UIBackgroundTaskInvalid;
}

- (void)applicationWillEnterForeground
{
  NSObject *v3;
  _QWORD v4[5];

  v3 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_100404A18();

  -[ICCloudContext setQualityOfService:](self, "setQualityOfService:", 17);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100044E48;
  v4[3] = &unk_100550110;
  v4[4] = self;
  dispatchMainAfterDelay(v4, 1.0);
}

- (BOOL)isInForeground
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100044FE0;
  v4[3] = &unk_100550C10;
  v4[4] = &v5;
  performBlockOnMainThreadAndWait(v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

@end
