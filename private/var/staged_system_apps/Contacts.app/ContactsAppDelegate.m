@implementation ContactsAppDelegate

- (ContactsAppDelegate)initWithCapabilitiesManager:(id)a3 mainBundle:(id)a4 schedulerProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  ContactsAppDelegate *v12;
  ContactsAppDelegate *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ContactsAppDelegate;
  v12 = -[ContactsAppDelegate init](&v15, "init");
  if (v12)
  {
    kdebug_trace(725483624, 0, 0, 0, 0);
    objc_storeStrong((id *)&v12->_capabilitiesManager, a3);
    objc_storeStrong((id *)&v12->_mainBundle, a4);
    objc_storeStrong((id *)&v12->_schedulerProvider, a5);
    kdebug_trace(725483628, 0, 0, 0, 0);
    v13 = v12;
  }

  return v12;
}

- (UIWindow)window
{
  return self->_window;
}

- (ContactsAppDelegate)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  ContactsAppDelegate *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CNCapabilitiesManager defaultCapabilitiesManager](CNCapabilitiesManager, "defaultCapabilitiesManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "defaultSchedulerProvider"));
  v7 = -[ContactsAppDelegate initWithCapabilitiesManager:mainBundle:schedulerProvider:](self, "initWithCapabilitiesManager:mainBundle:schedulerProvider:", v3, v4, v6);

  return v7;
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;

  v5 = a4;
  kdebug_trace(725483532, 0, 0, 0, 0);
  v6 = UIApplicationLaunchOptionsSearchResultIdentifierKey;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", UIApplicationLaunchOptionsSearchResultIdentifierKey));

  if (v7)
  {
    v8 = objc_opt_class(NSString);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));
    if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    if (((*(uint64_t (**)(_QWORD, id))(CNIsStringEmpty + 16))(CNIsStringEmpty, v11) & 1) != 0)
    {
      v12 = objc_msgSend((id)objc_opt_class(self), "log");
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10000F244((uint64_t)v11, v13);
    }
    else
    {
      v13 = objc_claimAutoreleasedReturnValue(-[ContactsAppDelegate mainSceneDelegate](self, "mainSceneDelegate"));
      -[NSObject showContactWithIdentifier:](v13, "showContactWithIdentifier:", v11);
    }

  }
  kdebug_trace(725483536, 0, 0, 0, 0);

  return 1;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v4;
  void *v5;

  v4 = a3;
  kdebug_trace(725483540, 0, 0, 0, 0);
  if (+[UIApplication shouldMakeUIForDefaultPNG](UIApplication, "shouldMakeUIForDefaultPNG"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "statusBar"));
    objc_msgSend(v5, "setAlpha:", 0.0);

  }
  kdebug_trace(725483544, 0, 0, 0, 0);

  return 1;
}

+ (OS_os_log)log
{
  if (qword_100025B58 != -1)
    dispatch_once(&qword_100025B58, &stru_10001C4A8);
  return (OS_os_log *)(id)qword_100025B60;
}

- (ContactsSceneDelegate)mainSceneDelegate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  ContactsSceneDelegate *v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "connectedScenes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allObjects"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "connectedScenes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_cn_firstObjectPassingTest:", &stru_10001C4E8));

  v9 = objc_opt_class(ContactsSceneDelegate);
  if (v8)
    v10 = v8;
  else
    v10 = v5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "delegate"));
  if ((objc_opt_isKindOfClass(v11, v9) & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  return v13;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  return objc_msgSend(a4, "configuration", a3);
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  void *v9;
  unsigned __int8 v10;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsAppDelegate mainSceneDelegate](self, "mainSceneDelegate"));
  v10 = objc_msgSend(v9, "runTest:options:", v8, v7);

  return v10;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (CNCapabilitiesManager)capabilitiesManager
{
  return self->_capabilitiesManager;
}

- (NSBundle)mainBundle
{
  return self->_mainBundle;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_mainBundle, 0);
  objc_storeStrong((id *)&self->_capabilitiesManager, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

@end
