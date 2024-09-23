@implementation WFAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a3, "setShortcutItems:", 0, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
  objc_msgSend(v5, "setDelegate:", self);

  +[WFFileStorageUtilities createDocumentsDirectoryIfNecessary](WFFileStorageUtilities, "createDocumentsDirectoryIfNecessary");
  if (+[CSSearchableIndex isIndexingAvailable](CSSearchableIndex, "isIndexingAvailable"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSSearchableIndex defaultSearchableIndex](CSSearchableIndex, "defaultSearchableIndex"));
    objc_msgSend(v6, "deleteSearchableItemsWithDomainIdentifiers:completionHandler:", &off_1000C4798, 0);

  }
  +[WFLinkActions register](_TtC9Shortcuts13WFLinkActions, "register");
  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v6;
  id v7;
  void *v8;
  UISceneSessionRole v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;

  v6 = a5;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "configuration"));
  v9 = (UISceneSessionRole)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "role"));

  if (v9 == UIWindowSceneSessionRoleApplication)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userActivities"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "anyObject"));

    v12 = CFSTR("Main");
    if (v11)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[WFWindowSceneManager workflowIdentifierFromUserActivity:](WFWindowSceneManager, "workflowIdentifierFromUserActivity:", v11));

      if (v13)
        v12 = CFSTR("Workflow");
    }
    v14 = objc_claimAutoreleasedReturnValue(+[UISceneConfiguration configurationWithName:sessionRole:](UISceneConfiguration, "configurationWithName:sessionRole:", v12, v9));

    v8 = (void *)v14;
  }

  return v8;
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[WFApplicationContext sharedContext](WFApplicationContext, "sharedContext"));
  objc_msgSend(v6, "setProvider:", v5);

  LODWORD(v6) = objc_msgSend(v5, "launchedToTest");
  if ((_DWORD)v6
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults")),
        v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("WFUsePPTPerformanceContent")),
        v7,
        (v8 & 1) == 0))
  {
    self->_initializationResult = (int64_t)+[WFInitialization initializeProcessWithDatabase:](WFInitialization, "initializeProcessWithDatabase:", 0);
    +[WFPPTDispatcher setupDatabaseForTesting](WFPPTDispatcher, "setupDatabaseForTesting");
  }
  else
  {
    self->_initializationResult = (int64_t)+[WFInitialization initializeProcessWithDatabase:](WFInitialization, "initializeProcessWithDatabase:", 1);
  }
  +[WFHandoffSimulator registerHandoffURLRequestHandler:](WFHandoffSimulator, "registerHandoffURLRequestHandler:", &stru_1000C3F90);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults workflowUserDefaults](NSUserDefaults, "workflowUserDefaults"));
  objc_msgSend(v9, "wf_loadValuesFromCloudKitWithCompletion:", &stru_1000C3FD0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[WFHomeManager sharedManager](WFHomeManager, "sharedManager"));
  objc_msgSend(v10, "reloadData");

  WFWorkflowIconDrawerGloballyCacheDrawerContext(+[WFKeyboard beginObservingKeyboardNotifications](WFKeyboard, "beginObservingKeyboardNotifications"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[WFHomeScreenController sharedInstance](WFHomeScreenController, "sharedInstance"));
  objc_msgSend(v11, "startListeningForDatabaseChanges");

  +[WFDebugUtilities startLogStream](WFDebugUtilities, "startLogStream");
  return 1;
}

- (int64_t)initializationResult
{
  return self->_initializationResult;
}

- (void)applicationWillEnterForeground:(id)a3
{
  NSDate *v4;

  v4 = objc_opt_new(NSDate);
  -[WFAppDelegate setLastForegroundDate:](self, "setLastForegroundDate:", v4);

}

- (void)applicationDidEnterBackground:(id)a3
{
  void *v4;
  NSDate *v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WFAppDelegate lastForegroundDate](self, "lastForegroundDate", a3));

  if (v4)
  {
    v5 = objc_opt_new(NSDate);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[WFAppDelegate lastForegroundDate](self, "lastForegroundDate"));
    -[NSDate timeIntervalSinceDate:](v5, "timeIntervalSinceDate:", v6);
    v8 = v7;

    v9 = (id)objc_opt_new(WFAppSessionCompletedEvent);
    objc_msgSend(v9, "setSource:", WFWorkflowRunSourceMyWorkflows);
    objc_msgSend(v9, "setDuration:", v8);
    objc_msgSend(v9, "track");

  }
}

- (void)applicationShouldRequestHealthAuthorization:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[HKHealthStore wf_shortcutsAppHealthStore](HKHealthStore, "wf_shortcutsAppHealthStore", a3));
  objc_msgSend(v3, "handleAuthorizationForExtensionWithCompletion:", &stru_1000C4010);

}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "notification", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "request"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "content"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
  v9 = WFTriggerIDFromNotificationUserInfo();
  v17 = (id)objc_claimAutoreleasedReturnValue(v9);

  v10 = v17;
  if (v17)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[WFWindowSceneManager mainScene](WFWindowSceneManager, "mainScene"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "delegate"));

    if (v12)
    {
      v13 = objc_opt_class(WFMainSceneDelegate);
      if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        v14 = v12;
      else
        v14 = 0;
    }
    else
    {
      v14 = 0;
    }
    v15 = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "rootViewController"));
    objc_msgSend(v16, "highlightAutomationWithTriggerID:", v17);

    v10 = v17;
  }

}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  (*((void (**)(id, uint64_t))a5 + 2))(a5, 26);
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  return +[WFPPTDispatcher dispatchTest:](WFPPTDispatcher, "dispatchTest:", a4);
}

- (void)setInitializationResult:(int64_t)a3
{
  self->_initializationResult = a3;
}

- (NSDate)lastForegroundDate
{
  return self->_lastForegroundDate;
}

- (void)setLastForegroundDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastForegroundDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastForegroundDate, 0);
}

@end
