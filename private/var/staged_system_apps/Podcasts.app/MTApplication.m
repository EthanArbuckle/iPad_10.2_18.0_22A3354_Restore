@implementation MTApplication

- (void)setDelegate:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[MTApplication setStrongDelegate:](self, "setStrongDelegate:", v4);
  v5.receiver = self;
  v5.super_class = (Class)MTApplication;
  -[MTApplication setDelegate:](&v5, "setDelegate:", v4);

}

- (void)setStrongDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_strongDelegate, a3);
}

- (id)delegate
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTApplication;
  v2 = -[MTApplication delegate](&v4, "delegate");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

+ (BOOL)localLibraryUpdatesDisabled
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  _DWORD v6[2];

  v2 = +[UIApplication isRunningInStoreDemoMode](UIApplication, "isRunningInStoreDemoMode");
  v3 = _MTLogCategoryDefault(v2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6[0] = 67109120;
    v6[1] = (_DWORD)v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Local library updates disabled: %d", (uint8_t *)v6, 8u);
  }

  return (char)v2;
}

- (id)_extendLaunchTest
{
  return CFSTR("ResponsiveLaunchTest");
}

- (MTApplication)init
{
  MTApplication *v2;
  MTApplication *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTApplication;
  v2 = -[MTApplication init](&v5, "init");
  v3 = v2;
  if (v2)
    -[MTApplication subscribeToLifecycleEventNotifications](v2, "subscribeToLifecycleEventNotifications");
  return v3;
}

+ (id)sharedApplication
{
  id v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MTApplication;
  v2 = objc_msgSendSuper2(&v4, "sharedApplication");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

+ (id)appController
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "appController"));

  return v4;
}

+ (BOOL)handleTextViewURL:(id)a3 interaction:(int64_t)a4
{
  id v5;
  void *v6;

  if (!a4)
  {
    v5 = a3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v6, "openURL:options:completionHandler:", v5, &__NSDictionary0__struct, 0);

  }
  return a4 != 0;
}

- (void)dealloc
{
  objc_super v3;

  -[MTApplication unsubscribeFromLifecycleEventNotifications](self, "unsubscribeFromLifecycleEventNotifications");
  v3.receiver = self;
  v3.super_class = (Class)MTApplication;
  -[MTApplication dealloc](&v3, "dealloc");
}

- (void)openURL:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  char v17;
  id v18;
  objc_super v19;
  objc_super v20;
  _QWORD v21[5];
  id v22;
  id v23;
  char v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTApplication delegate](self, "delegate"));
  v12 = objc_msgSend(v11, "canOpenURL:", v8);

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "scheme"));
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("http")))
    {

    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "scheme"));
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("https"));

      if (!v15)
      {
        v17 = 0;
LABEL_10:
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_10007AC04;
        v21[3] = &unk_1004A7ED0;
        v24 = v17;
        v21[4] = self;
        v22 = v8;
        v23 = v10;
        v20.receiver = self;
        v20.super_class = (Class)MTApplication;
        -[MTApplication openURL:options:completionHandler:](&v20, "openURL:options:completionHandler:", v22, v9, v21);

        goto LABEL_11;
      }
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", UIApplicationOpenURLOptionUniversalLinksOnly));

    if (v16)
    {
      v17 = 1;
    }
    else
    {
      v18 = objc_msgSend(v9, "mutableCopy");
      objc_msgSend(v18, "setObject:forKey:", &__kCFBooleanTrue, UIApplicationOpenURLOptionUniversalLinksOnly);

      v17 = 1;
      v9 = v18;
    }
    goto LABEL_10;
  }
  v19.receiver = self;
  v19.super_class = (Class)MTApplication;
  -[MTApplication openURL:options:completionHandler:](&v19, "openURL:options:completionHandler:", v8, v9, v10);
LABEL_11:

}

- (void)completeOpenURLWithSuccess:(BOOL)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  BOOL v9;

  v5 = a4;
  v6 = v5;
  if (v5)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10007ACE8;
    v7[3] = &unk_1004A7EF8;
    v8 = v5;
    v9 = a3;
    +[NSThread mainThread:](NSThread, "mainThread:", v7);

  }
}

- (UIApplicationDelegate)strongDelegate
{
  return self->_strongDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strongDelegate, 0);
}

@end
