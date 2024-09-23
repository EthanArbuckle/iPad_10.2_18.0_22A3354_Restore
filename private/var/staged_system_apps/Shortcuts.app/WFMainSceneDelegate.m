@implementation WFMainSceneDelegate

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  WFMainSceneDelegate *v11;
  id v12;

  v4 = a3;
  WFEnsureDaemonIsRunningForSyncIfNeeded();
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "setSuspended:", 0);

  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_100005A48;
  v10 = &unk_1000C3D20;
  v11 = self;
  v12 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v7);
  +[WFAppStorePromptController didBecomeActive](WFAppStorePromptController, "didBecomeActive", v7, v8, v9, v10, v11);

}

- (NSUserActivity)pendingUserActivity
{
  return self->_pendingUserActivity;
}

- (UIApplicationShortcutItem)pendingShortcutItem
{
  return self->_pendingShortcutItem;
}

- (NSSet)pendingOpenURLContexts
{
  return self->_pendingOpenURLContexts;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t WFGeneralLogObject;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  UIViewController *v25;
  WFRootView *rootViewController;
  WFMainViewController *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _BYTE v39[24];
  id v40;
  __int128 v41;

  v7 = a3;
  v8 = a5;
  v9 = objc_opt_class(UIWindowScene);
  v10 = v7;
  v11 = v10;
  if (v10 && (objc_opt_isKindOfClass(v10, v9) & 1) == 0)
  {
    WFGeneralLogObject = getWFGeneralLogObject();
    v14 = objc_claimAutoreleasedReturnValue(WFGeneralLogObject);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v39 = 136315906;
      *(_QWORD *)&v39[4] = "WFEnforceClass";
      *(_WORD *)&v39[12] = 2114;
      *(_QWORD *)&v39[14] = v11;
      *(_WORD *)&v39[22] = 2114;
      v40 = (id)objc_opt_class(v11);
      LOWORD(v41) = 2114;
      *(_QWORD *)((char *)&v41 + 2) = v9;
      v15 = v40;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", v39, 0x2Au);

    }
    v12 = 0;
  }
  else
  {
    v12 = v11;
  }

  v16 = objc_msgSend(objc_alloc((Class)UIWindow), "initWithWindowScene:", v12);
  -[WFMainSceneDelegate setWindow:](self, "setWindow:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[WFMainSceneDelegate window](self, "window"));
  objc_msgSend(v18, "setBackgroundColor:", v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "delegate"));

  if (v20)
  {
    v21 = objc_opt_class(WFAppDelegate);
    if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
      v22 = v20;
    else
      v22 = 0;
  }
  else
  {
    v22 = 0;
  }
  v23 = v22;

  v24 = objc_msgSend(v23, "initializationResult");
  if (v24 == (id)2)
  {
    v25 = objc_opt_new(UIViewController);
    rootViewController = (WFRootView *)objc_claimAutoreleasedReturnValue(-[WFMainSceneDelegate window](self, "window"));
    -[WFRootView setRootViewController:](rootViewController, "setRootViewController:", v25);
  }
  else
  {
    v25 = (UIViewController *)objc_claimAutoreleasedReturnValue(+[WFDatabase defaultDatabase](WFDatabase, "defaultDatabase"));
    v27 = -[WFMainViewController initWithDatabase:]([WFMainViewController alloc], "initWithDatabase:", v25);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[WFMainSceneDelegate window](self, "window"));
    objc_msgSend(v28, "setRootViewController:", v27);

    rootViewController = self->_rootViewController;
    self->_rootViewController = (WFRootView *)v27;
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[WFMainSceneDelegate window](self, "window"));
  objc_msgSend(v29, "makeKeyAndVisible");

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[WFMainSceneDelegate window](self, "window"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "rootViewController"));
  v32 = WFUserInterfaceFromViewController(v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);

  if (v24 == (id)2)
    WFPresentInitializationErrorIfNecessary(objc_msgSend(v23, "initializationResult"), v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "shortcutItem", *(_OWORD *)v39, *(_QWORD *)&v39[16], v40, v41));
  -[WFMainSceneDelegate setPendingShortcutItem:](self, "setPendingShortcutItem:", v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLContexts"));
  -[WFMainSceneDelegate setPendingOpenURLContexts:](self, "setPendingOpenURLContexts:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userActivities"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "anyObject"));
  -[WFMainSceneDelegate setPendingUserActivity:](self, "setPendingUserActivity:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[WFMainSceneDelegate window](self, "window"));
  +[WFDebugUtilities setupDebuggingForWindow:](WFDebugUtilities, "setupDebuggingForWindow:", v38);

}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (void)setPendingUserActivity:(id)a3
{
  objc_storeStrong((id *)&self->_pendingUserActivity, a3);
}

- (void)setPendingShortcutItem:(id)a3
{
  objc_storeStrong((id *)&self->_pendingShortcutItem, a3);
}

- (void)setPendingOpenURLContexts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)sceneWillResignActive:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v3, "setSuspended:", 1);

}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v8;

  v8 = a5;
  (*((void (**)(id, BOOL))a5 + 2))(v8, -[WFMainSceneDelegate handleShortcutItem:](self, "handleShortcutItem:", a4));

}

- (BOOL)handleShortcutItem:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  const __CFString *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "type"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("create_workflow"));

  if ((v5 & 1) != 0)
  {
    v6 = CFSTR("shortcuts://create-workflow?source=3d_touch");
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "type"));
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("view_gallery"));

    if (!v8)
    {
      v11 = 0;
      goto LABEL_7;
    }
    v6 = CFSTR("shortcuts://gallery");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICManager sharedManager](ICManager, "sharedManager"));
  v11 = objc_msgSend(v10, "handleOpenURL:fromSourceApplication:errorHandler:", v9, 0, 0);

LABEL_7:
  return v11;
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activityType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "webpageURL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "interaction"));

  -[WFMainSceneDelegate scene:handleUserActivityWithType:webpageURL:userInfo:interaction:](self, "scene:handleUserActivityWithType:webpageURL:userInfo:interaction:", v7, v11, v8, v9, v10);
}

- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
  -[WFMainSceneDelegate showAlertWithError:](self, "showAlertWithError:", a5, a4);
}

- (BOOL)scene:(id)a3 handleUserActivityWithType:(id)a4 webpageURL:(id)a5 userInfo:(id)a6 interaction:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSSet *v32;
  void *v33;
  id v34;
  BOOL v35;
  WFMainSceneDelegate *v37;
  void *v38;
  void *v39;
  void *v40;
  unsigned int v41;
  unsigned __int8 v42;
  void *v43;
  WFMainSceneDelegate *v44;
  _QWORD v45[4];
  id v46;
  WFMainSceneDelegate *v47;
  _QWORD v48[5];
  _QWORD v49[5];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[WFDatabase defaultDatabase](WFDatabase, "defaultDatabase"));
  if (objc_msgSend(v12, "isEqualToString:", WFHandoffOpenURLActivityType))
  {
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", WFHandoffURLKey));
    v44 = self;
    v17 = (void *)v16;
    if (v16)
      v18 = (void *)v16;
    else
      v18 = v13;
    v19 = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppRegistry sharedRegistry](ICAppRegistry, "sharedRegistry"));
    v21 = v12;
    v22 = v14;
    v23 = v13;
    v24 = v15;
    v25 = v11;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "scheme"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "appWithURLScheme:", v26));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "scheme"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "schemeNamed:", v28));

    v11 = v25;
    v15 = v24;
    v13 = v23;
    v14 = v22;
    v12 = v21;

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[ICManager sharedManager](ICManager, "sharedManager"));
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_10008ED5C;
    v49[3] = &unk_1000C3D48;
    v49[4] = v44;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[_ICURLRequest requestWithURL:scheme:userInterface:bundleIdentifier:successHandler:failureHandler:](_ICURLRequest, "requestWithURL:scheme:userInterface:bundleIdentifier:successHandler:failureHandler:", v19, v43, 0, 0, 0, v49));

    objc_msgSend(v29, "performRequest:", v30);
    goto LABEL_11;
  }
  if (objc_msgSend(v12, "isEqualToString:", WFHandoffContinueWorkflowActivityType))
  {
    if (v14)
    {
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_10008ED68;
      v48[3] = &unk_1000C3D70;
      v48[4] = self;
      +[WFHandoffSimulator getStateForContinuingWorkflowFromUserActivityUserInfo:completionHandler:](WFHandoffSimulator, "getStateForContinuingWorkflowFromUserActivityUserInfo:completionHandler:", v14, v48);
LABEL_11:
      v35 = 1;
      goto LABEL_12;
    }
LABEL_24:
    v35 = 0;
    goto LABEL_12;
  }
  if (objc_msgSend(v12, "isEqualToString:", WFHandoffRunActionActivityType))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", WFHandoffActionRunRequestKey));
    v32 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(WFHandoffRunRequest));
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10008EDD8;
    v45[3] = &unk_1000C3DC0;
    v46 = v11;
    v47 = self;
    v34 = +[NSKeyedUnarchiver wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:](NSKeyedUnarchiver, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v31, v33, v45);

    goto LABEL_11;
  }
  if (objc_msgSend(v12, "isEqualToString:", WFViewWorkflowActivityType))
  {
    v37 = self;
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", WFViewWorkflowActivityWorkflowIDKey));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", WFViewWorkflowActivityWorkflowNameKey));
    if (!v38
      || (v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "referenceForWorkflowID:", v38))) == 0)
    {
      if (v39)
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uniqueVisibleReferenceForWorkflowName:", v39));
      else
        v40 = 0;
    }
    v42 = -[WFMainSceneDelegate openWorkflow:](v37, "openWorkflow:", v40);

    if ((v42 & 1) != 0)
      goto LABEL_11;
    goto LABEL_24;
  }
  v41 = objc_msgSend(v12, "isEqualToString:", NSUserActivityTypeBrowsingWeb);
  v35 = 0;
  if (v13 && v41)
  {
    if (-[WFMainSceneDelegate handleOpenURL:options:](self, "handleOpenURL:options:", v13, 0))
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_12:

  return v35;
}

- (BOOL)openWorkflow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  _QWORD v9[5];

  if (!a3)
    return 0;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICManager sharedManager](ICManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "externalURLForViewing"));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10008ED50;
  v9[3] = &unk_1000C3D48;
  v9[4] = self;
  v7 = objc_msgSend(v5, "handleOpenURL:fromSourceApplication:errorHandler:", v6, 0, v9);

  return v7;
}

- (BOOL)openFile:(id)a3 sourceApplication:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unsigned int v12;
  id v13;
  _QWORD v15[5];
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "wfType"));
  v12 = +[WFShortcutExtractor isShortcutFileType:](WFShortcutExtractor, "isShortcutFileType:", v11);

  if (v12)
  {
    v13 = objc_msgSend(objc_alloc((Class)WFShortcutExtractor), "initWithFile:suggestedName:sourceApplication:", v8, 0, v9);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10008EBC4;
    v15[3] = &unk_1000C3E38;
    v15[4] = self;
    v16 = v10;
    objc_msgSend(v13, "extractShortcutWithCompletion:", v15);

  }
  else
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

  return v12;
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URL"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "options"));
        -[WFMainSceneDelegate handleOpenURL:options:](self, "handleOpenURL:options:", v11, v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (BOOL)handleOpenURL:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  void *v9;
  NSFileCoordinator *v10;
  unsigned __int8 v11;
  void *v12;
  NSFileCoordinator *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  void *v18;
  _QWORD v20[5];
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];
  NSFileCoordinator *v24;
  id v25;
  WFMainSceneDelegate *v26;
  id v27;
  id v28;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "openInPlace");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sourceApplication"));

  if (objc_msgSend(v6, "isFileURL"))
  {
    if (v8)
    {
      objc_msgSend(v6, "startAccessingSecurityScopedResource");
      v10 = objc_opt_new(NSFileCoordinator);
      v28 = v6;
      v11 = 1;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10008E900;
      v23[3] = &unk_1000C3EB0;
      v24 = v10;
      v25 = v6;
      v26 = self;
      v27 = v9;
      v13 = v10;
      -[NSFileCoordinator prepareForReadingItemsAtURLs:options:writingItemsAtURLs:options:error:byAccessor:](v13, "prepareForReadingItemsAtURLs:options:writingItemsAtURLs:options:error:byAccessor:", v12, 0, &__NSArray0__struct, 0, 0, v23);

    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
      v13 = (NSFileCoordinator *)objc_claimAutoreleasedReturnValue(+[WFTemporaryFileManager proposedTemporaryFileURLForFilename:](WFTemporaryFileManager, "proposedTemporaryFileURLForFilename:", v14));

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v22 = 0;
      v16 = objc_msgSend(v15, "moveItemAtURL:toURL:error:", v6, v13, &v22);
      v17 = v22;

      if ((v16 & 1) != 0)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[WFFileRepresentation fileWithURL:options:](WFFileRepresentation, "fileWithURL:options:", v13, 1));
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_10008EA40;
        v21[3] = &unk_1000C3D48;
        v21[4] = self;
        v11 = -[WFMainSceneDelegate openFile:sourceApplication:completionHandler:](self, "openFile:sourceApplication:completionHandler:", v18, v9, v21);

      }
      else
      {
        -[WFMainSceneDelegate showAlertWithError:](self, "showAlertWithError:", v17);
        v11 = 0;
      }

    }
  }
  else
  {
    v13 = (NSFileCoordinator *)objc_claimAutoreleasedReturnValue(+[ICManager sharedManager](ICManager, "sharedManager"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10008EA94;
    v20[3] = &unk_1000C3D48;
    v20[4] = self;
    v11 = -[NSFileCoordinator handleOpenURL:fromSourceApplication:errorHandler:](v13, "handleOpenURL:fromSourceApplication:errorHandler:", v6, v9, v20);
  }

  return v11;
}

- (id)topViewController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WFMainSceneDelegate window](self, "window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootViewController"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentedViewController"));
  if (v4)
  {
    do
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentedViewController"));

      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentedViewController"));
      v3 = v5;
    }
    while (v6);
  }
  else
  {
    v5 = v3;
  }
  return v5;
}

- (void)showAlertWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WFMainSceneDelegate topViewController](self, "topViewController"));
  v6 = WFUserInterfaceFromViewController(v5);
  v8 = (id)objc_claimAutoreleasedReturnValue(v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[WFAlert alertWithError:](WFAlert, "alertWithError:", v4));
  objc_msgSend(v8, "presentAlert:", v7);

}

- (WFRootView)rootViewController
{
  return self->_rootViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingUserActivity, 0);
  objc_storeStrong((id *)&self->_pendingOpenURLContexts, 0);
  objc_storeStrong((id *)&self->_pendingShortcutItem, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

@end
