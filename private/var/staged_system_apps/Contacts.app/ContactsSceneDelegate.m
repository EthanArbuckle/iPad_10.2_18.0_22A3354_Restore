@implementation ContactsSceneDelegate

- (ContactsSceneDelegate)initWithApplication:(id)a3 capabilitiesManager:(id)a4 schedulerProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  ContactsSceneDelegate *v12;
  ContactsSceneDelegate *v13;
  ContactsSplitViewController *v14;
  ContactsSplitViewController *splitViewController;
  id v16;
  void *v17;
  void *v18;
  CNVCardImportController *v19;
  CNVCardImportController *vCardImportController;
  NSBundle *v21;
  uint64_t v22;
  NSBundle *bundle;
  id v24;
  void *v25;
  void *v26;
  CNUIUserActivityRestorer *v27;
  CNUIUserActivityRestorer *activityRestorer;
  CNUserActivityRestorerDelegate *v29;
  void *v30;
  CNUserActivityRestorerDelegate *v31;
  CNUserActivityRestorerDelegate *activityRestorerDelegate;
  void *v33;
  uint64_t v34;
  NSMutableArray *actionsDelayedUntilSceneInitialization;
  ContactsSceneDelegate *v36;
  objc_super v38;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v38.receiver = self;
  v38.super_class = (Class)ContactsSceneDelegate;
  v12 = -[ContactsSceneDelegate init](&v38, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_capabilitiesManager, a4);
    objc_storeStrong((id *)&v13->_application, a3);
    objc_storeStrong((id *)&v13->_schedulerProvider, a5);
    v14 = -[ContactsSplitViewController initWithStyle:]([ContactsSplitViewController alloc], "initWithStyle:", 2);
    splitViewController = v13->_splitViewController;
    v13->_splitViewController = v14;

    v16 = objc_alloc((Class)CNVCardImportController);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate splitViewController](v13, "splitViewController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "store"));
    v19 = (CNVCardImportController *)objc_msgSend(v16, "initWithContactStore:presentationDelegate:", v18, v13);
    vCardImportController = v13->_vCardImportController;
    v13->_vCardImportController = v19;

    -[CNVCardImportController setDelegate:](v13->_vCardImportController, "setDelegate:", v13);
    v21 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v13));
    v22 = objc_claimAutoreleasedReturnValue(v21);
    bundle = v13->_bundle;
    v13->_bundle = (NSBundle *)v22;

    v24 = objc_alloc((Class)CNUIUserActivityRestorer);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate splitViewController](v13, "splitViewController"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "store"));
    v27 = (CNUIUserActivityRestorer *)objc_msgSend(v24, "initWithContactStore:", v26);
    activityRestorer = v13->_activityRestorer;
    v13->_activityRestorer = v27;

    v29 = [CNUserActivityRestorerDelegate alloc];
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate splitViewController](v13, "splitViewController"));
    v31 = -[CNUserActivityRestorerDelegate initWithContactsSplitViewController:](v29, "initWithContactsSplitViewController:", v30);
    activityRestorerDelegate = v13->_activityRestorerDelegate;
    v13->_activityRestorerDelegate = v31;

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate activityRestorerDelegate](v13, "activityRestorerDelegate"));
    -[CNUIUserActivityRestorer setDelegate:](v13->_activityRestorer, "setDelegate:", v33);

    v34 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    actionsDelayedUntilSceneInitialization = v13->_actionsDelayedUntilSceneInitialization;
    v13->_actionsDelayedUntilSceneInitialization = (NSMutableArray *)v34;

    v36 = v13;
  }

  return v13;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_opt_class(UIWindowScene);
  if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0)
    v12 = v8;
  else
    v12 = 0;
  v13 = v12;
  v14 = objc_msgSend((id)objc_opt_class(self), "log");
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    sub_10000F2F8(v13, v15);

  if (v13)
  {
    v16 = objc_msgSend(objc_alloc((Class)UIWindow), "initWithWindowScene:", v13);
    -[ContactsSceneDelegate setSceneWindow:](self, "setSceneWindow:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate splitViewController](self, "splitViewController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate sceneWindow](self, "sceneWindow"));
    objc_msgSend(v18, "setRootViewController:", v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[CNUIColorRepository contactsApplicationTintColor](CNUIColorRepository, "contactsApplicationTintColor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate sceneWindow](self, "sceneWindow"));
    objc_msgSend(v20, "setTintColor:", v19);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate sceneWindow](self, "sceneWindow"));
    objc_msgSend(v21, "makeKeyAndVisible");

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userActivities"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "anyObject"));
    objc_msgSend(v22, "_cn_addNonNilObject:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stateRestorationActivity"));
    objc_msgSend(v22, "_cn_addNonNilObject:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "shortcutItem"));
    if (v26)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "shortcutItem"));
      -[ContactsSceneDelegate executeShortcutIfNecessary:completionHandler:](self, "executeShortcutIfNecessary:completionHandler:", v27, 0);
    }
    else
    {
      v28 = CNIsSetEmpty;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URLContexts"));
      LOBYTE(v28) = (*(uint64_t (**)(uint64_t, void *))(v28 + 16))(v28, v29);

      if ((v28 & 1) != 0)
      {
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_10000B86C;
        v34[3] = &unk_10001C718;
        v34[4] = self;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "_cn_firstObjectPassingTest:", v34));
        -[ContactsSceneDelegate setViewingContactActivityForRestoration:](self, "setViewingContactActivityForRestoration:", v27);
      }
      else
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URLContexts"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "allObjects"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "firstObject"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "URL"));
        -[ContactsSceneDelegate openContactsURL:](self, "openContactsURL:", v32);

      }
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate splitViewController](self, "splitViewController"));
    +[CNContactsAppIntentDependencyManager setupAppIntentDependenciesWithActionPerformer:](CNContactsAppIntentDependencyManager, "setupAppIntentDependenciesWithActionPerformer:", v33);

  }
}

- (NSUserActivity)viewingContactActivityForRestoration
{
  return self->_viewingContactActivityForRestoration;
}

- (ContactsSplitViewController)splitViewController
{
  return self->_splitViewController;
}

- (void)setViewingContactActivityForRestoration:(id)a3
{
  objc_storeStrong((id *)&self->_viewingContactActivityForRestoration, a3);
}

- (void)setSceneWindow:(id)a3
{
  objc_storeStrong((id *)&self->_sceneWindow, a3);
}

- (void)setDidExecuteSceneInitializationTasks:(BOOL)a3
{
  self->_didExecuteSceneInitializationTasks = a3;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (UIWindow)sceneWindow
{
  return self->_sceneWindow;
}

- (void)sceneWillEnterForeground:(id)a3
{
  _QWORD v4[5];
  _QWORD v5[5];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100004834;
  v5[3] = &unk_10001C488;
  v5[4] = self;
  -[ContactsSceneDelegate executeSceneInitializationTasksOnce:](self, "executeSceneInitializationTasksOnce:", v5);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100004800;
  v4[3] = &unk_10001C488;
  v4[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)sceneDidBecomeActive:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate schedulerProvider](self, "schedulerProvider", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "backgroundScheduler"));
  v4 = objc_msgSend(v3, "afterDelay:performBlock:", &stru_10001C738, 4.0);

}

- (void)performMigrationOfFacebookContactsToLocalStoreIfNecessary
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate splitViewController](self, "splitViewController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contactNavigationController"));
  objc_msgSend(v2, "checkForFacebookContactsWithDelay:allowAlert:", 1, 0.5);

}

- (ContactsSceneDelegate)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  ContactsSceneDelegate *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CNCapabilitiesManager defaultCapabilitiesManager](CNCapabilitiesManager, "defaultCapabilitiesManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "defaultSchedulerProvider"));
  v7 = -[ContactsSceneDelegate initWithApplication:capabilitiesManager:schedulerProvider:](self, "initWithApplication:capabilitiesManager:schedulerProvider:", v3, v4, v6);

  return v7;
}

- (void)executeSceneInitializationTasksOnce:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  if (!-[ContactsSceneDelegate didExecuteSceneInitializationTasks](self, "didExecuteSceneInitializationTasks"))
  {
    v4[2]();
    -[ContactsSceneDelegate setDidExecuteSceneInitializationTasks:](self, "setDidExecuteSceneInitializationTasks:", 1);
  }

}

- (void)executeAllDelayedActions
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate actionsDelayedUntilSceneInitialization](self, "actionsDelayedUntilSceneInitialization"));
  objc_msgSend(v3, "_cn_each:", &stru_10001C778);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate actionsDelayedUntilSceneInitialization](self, "actionsDelayedUntilSceneInitialization"));
  objc_msgSend(v4, "removeAllObjects");

}

- (void)displayContactIfNecessary
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate splitViewController](self, "splitViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "traitCollection"));
  v5 = objc_msgSend(v4, "horizontalSizeClass");

  if (v5 != (id)1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate splitViewController](self, "splitViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayedContact"));
    if (v7)
    {

    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate viewingContactActivityForRestoration](self, "viewingContactActivityForRestoration"));

      if (!v8)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate splitViewController](self, "splitViewController"));
        objc_msgSend(v11, "showCardForContact:fallbackToFirstContact:", 0, 1);

        v12 = (id)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate splitViewController](self, "splitViewController"));
        objc_msgSend(v12, "showContactList");
        goto LABEL_7;
      }
    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate viewingContactActivityForRestoration](self, "viewingContactActivityForRestoration"));

  if (v9)
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate activityRestorer](self, "activityRestorer"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate viewingContactActivityForRestoration](self, "viewingContactActivityForRestoration"));
    objc_msgSend(v12, "restoreUserActivity:", v10);

LABEL_7:
  }
}

- (BOOL)didExecuteSceneInitializationTasks
{
  return self->_didExecuteSceneInitializationTasks;
}

- (void)createShowMeCardApplicationShortcutIfNecessary
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate capabilitiesManager](self, "capabilitiesManager"));
  v4 = objc_msgSend(v3, "hasForceTouchCapability");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate application](self, "application"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "connectedScenes"));
  v7 = objc_msgSend(v6, "count");

  if (v4 && v7 == (id)1)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate showMeCardShortcutItem](self, "showMeCardShortcutItem"));
    v9 = (void *)v8;
    if (v8)
    {
      v12 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    }
    else
    {
      v10 = &__NSArray0__struct;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate application](self, "application"));
    objc_msgSend(v11, "setShortcutItems:", v10);

    if (v9)
  }
}

- (id)contactStoreDataSource
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate splitViewController](self, "splitViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "contactNavigationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataSource"));

  v5 = objc_opt_class(CNContactStoreDataSource);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = v4;
  else
    v6 = 0;

  return v6;
}

- (void)checkInLaunchTasksIfNecessary
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  uint64_t v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment"));
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "launchCheckinRegistrar"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate splitViewController](self, "splitViewController"));
  v5 = objc_msgSend(v4, "_isCollapsed");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate viewingContactActivityForRestoration](self, "viewingContactActivityForRestoration"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate viewingContactActivityForRestoration](self, "viewingContactActivityForRestoration"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activityType"));
    v9 = objc_msgSend(v8, "isEqualToString:", CNUIActivityTypeViewingList);

    v10 = v9 & v5;
  }
  else
  {
    v10 = v5;
  }

  if (v10)
    v11 = 60;
  else
    v11 = 2;
  if (((v10 | v5) & 1) != 0)
  {
    v12 = (void *)v15;
LABEL_11:
    objc_msgSend(v12, "checkInLaunchTasks:", v11);
    v14 = (void *)v15;
    goto LABEL_12;
  }
  v13 = -[ContactsSceneDelegate splitViewControllerIsDisplayingList](self, "splitViewControllerIsDisplayingList", v11);
  v14 = (void *)v15;
  if ((v13 & 1) == 0)
  {
    v11 = 2;
    v12 = (void *)v15;
    goto LABEL_11;
  }
LABEL_12:

}

- (CNCapabilitiesManager)capabilitiesManager
{
  return self->_capabilitiesManager;
}

- (UIApplication)application
{
  return self->_application;
}

- (CNUserActivityRestorerDelegate)activityRestorerDelegate
{
  return self->_activityRestorerDelegate;
}

- (NSMutableArray)actionsDelayedUntilSceneInitialization
{
  return self->_actionsDelayedUntilSceneInitialization;
}

+ (OS_os_log)log
{
  if (qword_100025B80 != -1)
    dispatch_once(&qword_100025B80, &stru_10001C6F0);
  return (OS_os_log *)(id)qword_100025B88;
}

- (void)executeShortcutIfNecessary:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, _BOOL8);
  void *v7;
  _BOOL8 v8;
  id v9;
  NSObject *v10;

  v6 = (void (**)(id, _BOOL8))a4;
  if (a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "type"));
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.contacts.create-new-contact")))
    {
      -[ContactsSceneDelegate showNewContact](self, "showNewContact");
      v8 = 1;
      if (!v6)
        goto LABEL_12;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.contacts.show-me")))
    {
      v8 = -[ContactsSceneDelegate showMeContact](self, "showMeContact");
      if (!v6)
        goto LABEL_12;
    }
    else
    {
      v9 = objc_msgSend((id)objc_opt_class(self), "log");
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_10000F3B8((uint64_t)v7, v10);

      v8 = 0;
      if (!v6)
        goto LABEL_12;
    }
    v6[2](v6, v8);
LABEL_12:

  }
}

- (void)sceneDidDisconnect:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate sceneWindow](self, "sceneWindow", a3));
  objc_msgSend(v4, "setHidden:", 1);

  -[ContactsSceneDelegate setSceneWindow:](self, "setSceneWindow:", 0);
}

- (void)sceneWillResignActive:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate contactStoreDataSource](self, "contactStoreDataSource", a3));
  objc_msgSend(v3, "setShouldRevalidateFilterOnStoreChange:", 1);

}

- (BOOL)splitViewControllerIsDisplayingList
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate splitViewController](self, "splitViewController"));
  if (objc_msgSend(v3, "displayMode") == (id)2)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate splitViewController](self, "splitViewController"));
    if (objc_msgSend(v5, "displayMode") == (id)4)
    {
      v4 = 1;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate splitViewController](self, "splitViewController"));
      v4 = objc_msgSend(v6, "displayMode") == (id)6;

    }
  }

  return v4;
}

- (void)executeActionDelayedUntilSceneInitialization:(id)a3
{
  void *v4;
  id v5;
  id v6;
  void (**v7)(void);

  v7 = (void (**)(void))a3;
  if (-[ContactsSceneDelegate didExecuteSceneInitializationTasks](self, "didExecuteSceneInitializationTasks"))
  {
    v7[2]();
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate actionsDelayedUntilSceneInitialization](self, "actionsDelayedUntilSceneInitialization"));
    v5 = objc_msgSend(v7, "copy");
    v6 = objc_retainBlock(v5);
    objc_msgSend(v4, "addObject:", v6);

  }
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  -[ContactsSceneDelegate executeShortcutIfNecessary:completionHandler:](self, "executeShortcutIfNecessary:completionHandler:", a4, a5);
}

- (id)stateRestorationActivityForScene:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unsigned int v12;
  void *v13;
  void *v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate splitViewController](self, "splitViewController", a3));
  v5 = objc_msgSend(v4, "isShowingListView");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate splitViewController](self, "splitViewController"));
  v7 = v6;
  if (v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contactNavigationController"));
    objc_msgSend(v8, "createUserActivity");

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate splitViewController](self, "splitViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contactNavigationController"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userActivity"));
  }
  else
  {
    v12 = objc_msgSend(v6, "isShowingGroups");

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate splitViewController](self, "splitViewController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contactNavigationController"));
    v10 = v13;
    if (v12)
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "userActivityRepresentingGroupsView"));
    else
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "userActivityRepresentingCurrentlyDisplayedContact"));
  }
  v14 = (void *)v11;

  return v14;
}

- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate activityRestorer](self, "activityRestorer"));
  objc_msgSend(v6, "shouldEnableActivityIndicatorWhenRestoringUserActivityWithType:", v5);

}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate activityRestorer](self, "activityRestorer"));
  objc_msgSend(v6, "restoreUserActivity:", v5);

}

- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate activityRestorer](self, "activityRestorer"));
  objc_msgSend(v7, "shouldEnableActivityIndicatorWhenRestoringUserActivityWithType:", v6);

}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "allObjects", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URL"));
  -[ContactsSceneDelegate openContactsURL:](self, "openContactsURL:", v6);

}

- (BOOL)openContactsURL:(id)a3
{
  id v4;
  void *v5;
  ContactsURLParser *v6;
  unsigned __int8 v7;
  ContactsURLParser *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  ContactsSceneDelegate *v13;
  ContactsURLParser *v14;
  uint64_t v15;
  BOOL v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate splitViewController](self, "splitViewController"));
  objc_msgSend(v5, "cancelSearch");

  if (objc_msgSend(v4, "isFileURL"))
  {
    v6 = (ContactsURLParser *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate vCardImportController](self, "vCardImportController"));
    v7 = -[ContactsURLParser enqueueContactsAtURL:](v6, "enqueueContactsAtURL:", v4);
LABEL_10:
    v16 = v7;
    goto LABEL_11;
  }
  v8 = [ContactsURLParser alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate splitViewController](self, "splitViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contactNavigationController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dataSource"));
  v6 = -[ContactsURLParser initWithURL:dataSource:](v8, "initWithURL:dataSource:", v4, v11);

  v12 = -[ContactsURLParser actionFound](v6, "actionFound");
  if (v12 != (id)3)
  {
    if (v12 == (id)2)
    {
      v13 = self;
      v14 = v6;
      v15 = 1;
    }
    else
    {
      if (v12 != (id)1)
      {
        v16 = 0;
        goto LABEL_11;
      }
      v13 = self;
      v14 = v6;
      v15 = 0;
    }
    v7 = -[ContactsSceneDelegate showContactFromURLReader:setEditing:](v13, "showContactFromURLReader:setEditing:", v14, v15);
    goto LABEL_10;
  }
  -[ContactsSceneDelegate createNewContact](self, "createNewContact");
  v16 = 1;
LABEL_11:

  return v16;
}

- (BOOL)showContactFromURLReader:(id)a3 setEditing:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned __int8 v14;
  BOOL v15;

  v4 = a4;
  v6 = a3;
  v7 = CNIsStringEmpty;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifierFound"));
  LOBYTE(v7) = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  if ((v7 & 1) != 0)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "legacyIdentifierFound"));
    if (!v9
      || (v10 = (void *)v9,
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "legacyIdentifierFound")),
          v12 = objc_msgSend(v11, "intValue"),
          v11,
          v10,
          (v12 & 0x80000000) != 0))
    {
      v15 = 0;
      goto LABEL_8;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "legacyIdentifierFound"));
    v14 = -[ContactsSceneDelegate showContactWithLegacyIdentifier:setEditing:](self, "showContactWithLegacyIdentifier:setEditing:", objc_msgSend(v13, "intValue"), v4);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifierFound"));
    v14 = -[ContactsSceneDelegate showContactWithIdentifier:setEditing:](self, "showContactWithIdentifier:setEditing:", v13, v4);
  }
  v15 = v14;

LABEL_8:
  return v15;
}

- (id)showMeCardShortcutItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate splitViewController](self, "splitViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contactNavigationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contactListViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredForNameMeContact"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate bundle](self, "bundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("QUICKACTION_TITLE_SHOW_ME"), 0, CFSTR("InfoPlist")));

    v9 = objc_msgSend(objc_alloc((Class)UIMutableApplicationShortcutItem), "initWithType:localizedTitle:", CFSTR("com.apple.contacts.show-me"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplicationShortcutIcon iconWithContact:](UIApplicationShortcutIcon, "iconWithContact:", v6));
    objc_msgSend(v9, "setIcon:", v10);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ContactsTestingManager defaultTestingManager](ContactsTestingManager, "defaultTestingManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate splitViewController](self, "splitViewController"));
  v10 = objc_msgSend(v8, "runTest:options:splitViewController:", v7, v6, v9);

  return v10;
}

- (void)createNewContact
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate splitViewController](self, "splitViewController"));
  objc_msgSend(v2, "createNewContact");

}

- (BOOL)showMeContact
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate splitViewController](self, "splitViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contactNavigationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredForNameMeContactIdentifier"));

  if (((*(uint64_t (**)(_QWORD, void *))(CNIsStringEmpty + 16))(CNIsStringEmpty, v6) & 1) != 0)
    v7 = 0;
  else
    v7 = -[ContactsSceneDelegate showContactWithIdentifier:setEditing:](self, "showContactWithIdentifier:setEditing:", v6, 0);

  return v7;
}

- (void)showNewContact
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10000C2BC;
  v2[3] = &unk_10001C488;
  v2[4] = self;
  -[ContactsSceneDelegate executeActionDelayedUntilSceneInitialization:](self, "executeActionDelayedUntilSceneInitialization:", v2);
}

- (void)showContact:(id)a3
{
  -[ContactsSceneDelegate showContact:setEditing:](self, "showContact:setEditing:", a3, 0);
}

- (void)showContact:(id)a3 setEditing:(BOOL)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  BOOL v11;

  v6 = a3;
  if (!v6)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, CFSTR("contact passed to showContact is nil"), 0));
    objc_exception_throw(v8);
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000C3A8;
  v9[3] = &unk_10001C7A0;
  v11 = a4;
  v9[4] = self;
  v10 = v6;
  v7 = v6;
  -[ContactsSceneDelegate executeActionDelayedUntilSceneInitialization:](self, "executeActionDelayedUntilSceneInitialization:", v9);

}

- (BOOL)showContactWithIdentifier:(id)a3
{
  return -[ContactsSceneDelegate showContactWithIdentifier:setEditing:](self, "showContactWithIdentifier:setEditing:", a3, 0);
}

- (BOOL)showContactWithIdentifier:(id)a3 setEditing:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  id v18;
  id v19;
  void *v20;

  v4 = a4;
  v6 = a3;
  if ((*(unsigned int (**)(_QWORD, id))(CNIsStringEmpty + 16))(CNIsStringEmpty, v6))
  {
    v18 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, CFSTR("identifier passed to showContactWithIdentifier is empty"), 0));
    objc_exception_throw(v18);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate splitViewController](self, "splitViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "store"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactViewController descriptorForRequiredKeys](CNContactViewController, "descriptorForRequiredKeys"));
  v20 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  v19 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "unifiedContactWithIdentifier:keysToFetch:error:", v6, v10, &v19));
  v12 = v19;

  if (v12)
    v13 = 1;
  else
    v13 = v11 == 0;
  v14 = !v13;
  if (v13)
  {
    v15 = objc_msgSend((id)objc_opt_class(self), "log");
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10000F428((uint64_t)v6, (uint64_t)v12, v16);

  }
  else
  {
    -[ContactsSceneDelegate showContact:setEditing:](self, "showContact:setEditing:", v11, v4);
  }

  return v14;
}

- (BOOL)showContactWithLegacyIdentifier:(int)a3
{
  return -[ContactsSceneDelegate showContactWithLegacyIdentifier:setEditing:](self, "showContactWithLegacyIdentifier:setEditing:", *(_QWORD *)&a3, 0);
}

- (BOOL)showContactWithLegacyIdentifier:(int)a3 setEditing:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  BOOL v16;
  id v18;
  id v19;
  void *v20;

  if (a3 < 0)
  {
    v18 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, CFSTR("legacyIdentifier cannot be negative"), 0));
    objc_exception_throw(v18);
  }
  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate splitViewController](self, "splitViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "store"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CNContact predicateForLegacyIdentifier:](CNContact, "predicateForLegacyIdentifier:", v5));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactViewController descriptorForRequiredKeys](CNContactViewController, "descriptorForRequiredKeys"));
  v20 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  v19 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "unifiedContactsMatchingPredicate:keysToFetch:error:", v9, v11, &v19));
  v13 = v19;

  if (v13 || ((*(uint64_t (**)(_QWORD, void *))(CNIsArrayEmpty + 16))(CNIsArrayEmpty, v12) & 1) != 0)
  {
    v14 = objc_msgSend((id)objc_opt_class(self), "log");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10000F4A8((uint64_t)v13, v5, v15);
    v16 = 0;
  }
  else
  {
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
    -[ContactsSceneDelegate showContact:setEditing:](self, "showContact:setEditing:", v15, v4);
    v16 = 1;
  }

  return v16;
}

- (void)vCardImportController:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5
{
  id v6;
  _QWORD v7[4];
  ContactsSceneDelegate *v8;
  id v9;
  BOOL v10;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000C828;
  v7[3] = &unk_10001C7A0;
  v8 = self;
  v9 = a4;
  v10 = a5;
  v6 = v9;
  -[ContactsSceneDelegate executeActionDelayedUntilSceneInitialization:](v8, "executeActionDelayedUntilSceneInitialization:", v7);

}

- (void)vCardImportController:(id)a3 didSaveContacts:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "firstObject", a3));
  -[ContactsSceneDelegate showContact:](self, "showContact:", v5);

}

- (void)searchForString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ContactsSceneDelegate splitViewController](self, "splitViewController"));
  objc_msgSend(v5, "searchForString:", v4);

}

- (NSBundle)mainBundle
{
  return self->_mainBundle;
}

- (CNUIUserActivityRestorer)activityRestorer
{
  return self->_activityRestorer;
}

- (CNVCardImportController)vCardImportController
{
  return self->_vCardImportController;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionsDelayedUntilSceneInitialization, 0);
  objc_storeStrong((id *)&self->_sceneWindow, 0);
  objc_storeStrong((id *)&self->_viewingContactActivityForRestoration, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_vCardImportController, 0);
  objc_storeStrong((id *)&self->_activityRestorerDelegate, 0);
  objc_storeStrong((id *)&self->_activityRestorer, 0);
  objc_storeStrong((id *)&self->_splitViewController, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_mainBundle, 0);
  objc_storeStrong((id *)&self->_capabilitiesManager, 0);
  objc_storeStrong((id *)&self->_application, 0);
}

@end
