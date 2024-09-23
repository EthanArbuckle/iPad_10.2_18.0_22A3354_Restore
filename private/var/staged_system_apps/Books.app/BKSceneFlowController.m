@implementation BKSceneFlowController

- (id)currentSceneController
{
  void *v3;
  void *v4;
  unsigned int v5;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint8_t v19[8];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController lastCurrentSceneController](self, "lastCurrentSceneController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scene"));
  v5 = objc_msgSend(v4, "_isKeyWindowScene");

  if (v5)
    return (id)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController lastCurrentSceneController](self, "lastCurrentSceneController"));
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_10004E418;
  v25 = sub_10004E280;
  v26 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000C24C;
  v20[3] = &unk_1008EB5B8;
  v20[4] = &v21;
  v7 = -[BKSceneFlowController enumerateSceneController:includeHidden:](self, "enumerateSceneController:includeHidden:", v20, 0);
  if (!v22[5])
  {
    v8 = BCSceneLog(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "keyWindowScene not found. Returning a sceneController as fallback.", v19, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController primarySceneController](self, "primarySceneController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "scene"));

    if (v11)
    {
      v12 = objc_claimAutoreleasedReturnValue(-[BKSceneFlowController primarySceneController](self, "primarySceneController"));
      v13 = (void *)v22[5];
      v22[5] = v12;
LABEL_10:

      goto LABEL_11;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController bookSceneControllers](self, "bookSceneControllers"));
    v15 = objc_msgSend(v14, "count");

    if (v15)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController bookSceneControllers](self, "bookSceneControllers"));
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", 0));
      v17 = (void *)v22[5];
      v22[5] = v16;

      goto LABEL_10;
    }
  }
LABEL_11:
  -[BKSceneFlowController setLastCurrentSceneController:](self, "setLastCurrentSceneController:", v22[5]);
  v18 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v18;
}

- (BKSceneControlling)lastCurrentSceneController
{
  return (BKSceneControlling *)objc_loadWeakRetained((id *)&self->_lastCurrentSceneController);
}

- (BKSceneController)primarySceneController
{
  BKSceneController *primarySceneController;
  BKSceneController *v4;
  void *v5;
  void *v6;
  BKSceneController *v7;
  BKSceneController *v8;

  primarySceneController = self->_primarySceneController;
  if (!primarySceneController)
  {
    v4 = [BKSceneController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController launchCoordinator](self, "launchCoordinator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController criticalAlertCoordinator](self, "criticalAlertCoordinator"));
    v7 = -[BKSceneController initWithSceneType:launchCoordinator:criticalAlertCoordinator:](v4, "initWithSceneType:launchCoordinator:criticalAlertCoordinator:", 1, v5, v6);
    v8 = self->_primarySceneController;
    self->_primarySceneController = v7;

    primarySceneController = self->_primarySceneController;
  }
  return primarySceneController;
}

- (void)routeScene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *i;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  unsigned int v35;
  void *v36;
  void *v37;
  unsigned int v38;
  void *v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  void *v43;
  id v44;
  unsigned int v45;
  unsigned int v46;
  unsigned int v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  BKSceneController *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  uint64_t v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  char v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  unsigned int v79;
  BKSceneController *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  char v84;
  void *v85;
  uint64_t v86;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  uint8_t v95[128];
  uint8_t buf[4];
  uint64_t v97;
  __int16 v98;
  void *v99;
  __int16 v100;
  id v101;
  __int16 v102;
  int v103;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v8;
  v12 = v10;
  v13 = objc_opt_class(UIWindowScene);
  v14 = BUDynamicCast(v13, v8);
  v86 = objc_claimAutoreleasedReturnValue(v14);
  HIDWORD(v83) = -[BKSceneFlowController _areConnectionOptionsForIntents:](self, "_areConnectionOptionsForIntents:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "session"));
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "persistentIdentifier"));

  v18 = BCSceneLog(v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "delegate"));
    *(_DWORD *)buf = 138544130;
    v97 = v16;
    v98 = 2114;
    v99 = v20;
    v100 = 2114;
    v101 = v12;
    v102 = 1024;
    v103 = HIDWORD(v83);
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "route scene willConnectToSession: sceneIdentifier=%{public}@, sceneDelegate=%{public}@, connectionOptions=%{public}@, forIntent=%d", buf, 0x26u);

  }
  v87 = (void *)v16;
  v88 = v12;
  if (+[BKSceneUtilities hasMultiWindowEnabled](BKSceneUtilities, "hasMultiWindowEnabled"))
  {
    v89 = v11;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "userActivities"));
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v91, v95, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v92;
      v25 = BCContinuationActivityReadBookType;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(_QWORD *)v92 != v24)
            objc_enumerationMutation(v21);
          v27 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * (_QWORD)i);
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "activityType"));
          v29 = objc_msgSend(v28, "isEqualToString:", v25);

          if (v29)
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController pendingUserActivitiesMap](self, "pendingUserActivitiesMap"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "persistentIdentifier"));
            objc_msgSend(v30, "setObject:forKeyedSubscript:", v27, v31);

          }
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v91, v95, 16);
      }
      while (v23);
    }

    v12 = v88;
    v11 = v89;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController pendingUserActivitiesMap](self, "pendingUserActivitiesMap"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "persistentIdentifier"));
  v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", v33));

  if (+[BKSceneUtilities connectionOptions:hasActivityType:](BKSceneUtilities, "connectionOptions:hasActivityType:", v12, CFSTR("BKAccountInfoSceneActivityType")))
  {
    v35 = 1;
  }
  else
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stateRestorationActivity"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "activityType"));
    v35 = objc_msgSend(v37, "isEqualToString:", CFSTR("com.apple.iBooks.sceneStateRestorationForAccountInfo"));

  }
  if (+[BKSceneUtilities connectionOptions:hasActivityType:](BKSceneUtilities, "connectionOptions:hasActivityType:", v12, CFSTR("BKEndOfBookSceneActivityType")))
  {
    v38 = 1;
  }
  else
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stateRestorationActivity"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "activityType"));
    v38 = objc_msgSend(v40, "isEqualToString:", CFSTR("com.apple.iBooks.sceneStateRestorationForEndOfBook"));

  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController pendingBookSceneRequestAssetIDs](self, "pendingBookSceneRequestAssetIDs"));
  v85 = (void *)v34;
  v42 = ((unint64_t)objc_msgSend(v41, "count") | v34) == 0;

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController pendingPrimarySceneCompletionBlocks](self, "pendingPrimarySceneCompletionBlocks"));
  v44 = objc_msgSend(v43, "count");

  v45 = -[BKSceneFlowController _isStateRestorationAndCanRestoreToAuxiliaryScene:](self, "_isStateRestorationAndCanRestoreToAuxiliaryScene:", v9);
  v46 = -[BKSceneFlowController _hasLaunchActionsInConnectionOptions:](self, "_hasLaunchActionsInConnectionOptions:", v12);
  v47 = 0;
  LODWORD(v83) = v46;
  if (v45 && (v46 & 1) == 0)
    v47 = +[BKSceneUtilities hasMultiWindowEnabled](BKSceneUtilities, "hasMultiWindowEnabled");
  v48 = objc_opt_class(_BKRoutingWindowSceneDelegate);
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "delegate"));
  v50 = BUDynamicCast(v48, v49);
  v90 = (void *)objc_claimAutoreleasedReturnValue(v50);

  if (v35)
  {
    v51 = (BKSceneController *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController accountSceneController](self, "accountSceneController"));
    v52 = v88;
    v53 = (void *)v86;
    goto LABEL_30;
  }
  v52 = v88;
  v53 = (void *)v86;
  if (v38)
  {
    v54 = objc_claimAutoreleasedReturnValue(-[BKSceneFlowController endOfBookSceneController](self, "endOfBookSceneController"));
LABEL_29:
    v51 = (BKSceneController *)v54;
    goto LABEL_30;
  }
  if (HIDWORD(v83)
    || v42
    && ((v76 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController primarySceneController](self, "primarySceneController")),
         v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "scene")),
         v78 = v77,
         !v44)
      ? (v79 = v47)
      : (v79 = 0),
        (v77, v76, !v78) && !v79))
  {
    v54 = objc_claimAutoreleasedReturnValue(-[BKSceneFlowController primarySceneController](self, "primarySceneController", v83, v85));
    goto LABEL_29;
  }
  v80 = [BKSceneController alloc];
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController launchCoordinator](self, "launchCoordinator"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController criticalAlertCoordinator](self, "criticalAlertCoordinator"));
  v51 = -[BKSceneController initWithSceneType:launchCoordinator:criticalAlertCoordinator:](v80, "initWithSceneType:launchCoordinator:criticalAlertCoordinator:", 0, v81, v82);

LABEL_30:
  -[BKSceneFlowController _setupSizeRestrictionsForWindowScene:sceneType:](self, "_setupSizeRestrictionsForWindowScene:sceneType:", v53, -[_BKBaseSceneController sceneType](v51, "sceneType", v83));
  objc_msgSend(v90, "setSceneController:", v51);
  -[BKSceneController scene:willConnectToSession:options:](v51, "scene:willConnectToSession:options:", v11, v9, v52);
  if (!-[_BKBaseSceneController sceneType](v51, "sceneType"))
  {
    v55 = objc_opt_class(BKSceneController);
    v56 = BUDynamicCast(v55, v51);
    v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController bookSceneControllers](self, "bookSceneControllers"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "arrayByAddingObject:", v57));
    -[BKSceneFlowController setBookSceneControllers:](self, "setBookSceneControllers:", v59);

    -[BKSceneFlowController _consumePendingBookSceneRequestAssetID:](self, "_consumePendingBookSceneRequestAssetID:", v57);
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController pendingUserActivitiesMap](self, "pendingUserActivitiesMap"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "objectForKeyedSubscript:", v87));

    if (v61)
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController pendingUserActivitiesMap](self, "pendingUserActivitiesMap"));
      objc_msgSend(v62, "removeObjectForKey:", v87);

      objc_msgSend(v57, "handleCreateSceneUserActivityWhenReady:", v61);
    }

  }
  -[BKSceneFlowController _handleSceneConnectionOptionsActions:sceneController:](self, "_handleSceneConnectionOptionsActions:sceneController:", v52, v51);
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "dictionaryForKey:", CFSTR("PPTStateRestoration")));

  if (!v64)
    goto LABEL_39;
  v65 = objc_msgSend(objc_alloc((Class)NSUserActivity), "initWithActivityType:", CFSTR("com.apple.iBooks.sceneStateRestoration"));
  v66 = BCSceneLog(objc_msgSend(v65, "setUserInfo:", v64));
  v67 = objc_claimAutoreleasedReturnValue(v66);
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stateRestorationActivity"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "userInfo"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "userInfo"));
    *(_DWORD *)buf = 138412546;
    v97 = (uint64_t)v69;
    v98 = 2112;
    v99 = v70;
    _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "Overriding scene restoration activity: %@ with: %@", buf, 0x16u);

    v53 = (void *)v86;
    v52 = v88;
  }

  if (v65)
  {
    v71 = v65;
    v72 = v71;
  }
  else
  {
LABEL_39:
    v71 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stateRestorationActivity"));
    v72 = 0;
  }
  if (-[_BKBaseSceneController isStateRestorationDisabled](v51, "isStateRestorationDisabled")
    || ((v73 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneController rootBarCoordinator](v51, "rootBarCoordinator"))) != 0
      ? (v74 = v84)
      : (v74 = 0),
        (v73, (v74 & 1) != 0) || !v71))
  {
    -[BKSceneFlowController _finishSceneRequest:](self, "_finishSceneRequest:", v11);
  }
  else
  {
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "activityType"));
    -[_BKBaseSceneController scene:willContinueUserActivityWithType:](v51, "scene:willContinueUserActivityWithType:", v11, v75);

    -[_BKBaseSceneController scene:continueUserActivity:](v51, "scene:continueUserActivity:", v11, v71);
  }
  -[BKSceneFlowController _attachDebugViewControllerToSceneIfNeeded:](self, "_attachDebugViewControllerToSceneIfNeeded:", v11);

}

- (void)requestTabBarSceneController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController launchCoordinator](self, "launchCoordinator"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004DD08;
  v7[3] = &unk_1008E8058;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "appLaunchCoordinatorOnConditionMask:blockID:performBlock:", 64, CFSTR("requestTabBarSceneController"), v7);

}

- (BKAppLaunchCoordinator)launchCoordinator
{
  return self->_launchCoordinator;
}

- (id)_lastKnownStateRestorationUserInfoForSceneSession:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_alloc_init((Class)NSDictionary);
  if ((objc_msgSend((id)objc_opt_class(self), "isStateRestorationDisabledForThisLaunch") & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stateRestorationActivity"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));

    v5 = (id)v7;
  }

  return v5;
}

+ (BOOL)isStateRestorationDisabledForThisLaunch
{
  void *v2;
  unsigned __int8 v3;
  unsigned int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("BKDisableSceneStateRestoration"));

  if ((v3 & 1) != 0)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    v4 = objc_msgSend(UIApp, "launchedToTest");
    if (v4)
      LOBYTE(v4) = +[BCPPTConfig hasExtendedLaunchTypeSet](BCPPTConfig, "hasExtendedLaunchTypeSet") ^ 1;
  }
  return v4;
}

- (void)enumerateSceneController:(id)a3 includeHidden:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  char v25;
  _BYTE v26[128];

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    v25 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController primarySceneController](self, "primarySceneController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "scene"));

    if (!v8 && !v4)
      goto LABEL_7;
    v9 = objc_retainBlock(v6);
    v10 = v9;
    if (v9)
      (*((void (**)(id, void *, char *))v9 + 2))(v9, v7, &v25);

    if (!v25)
    {
LABEL_7:
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController bookSceneControllers](self, "bookSceneControllers", 0));
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v22;
LABEL_9:
        v15 = 0;
        while (1)
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "scene"));

          if (v17 || v4)
          {
            v19 = objc_retainBlock(v6);
            v20 = v19;
            if (v19)
              (*((void (**)(id, void *, char *))v19 + 2))(v19, v16, &v25);

            if (v25)
              break;
          }
          if (v13 == (id)++v15)
          {
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
            if (v13)
              goto LABEL_9;
            break;
          }
        }
      }

    }
  }

}

- (NSArray)bookSceneControllers
{
  return self->_bookSceneControllers;
}

- (void)_flushPendingSceneRequestCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *m;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *i;
  void (**v39)(id, void *);
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  void *j;
  void (**v48)(id, void *);
  void *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  uint64_t v55;
  void *k;
  void (**v57)(id, void *);
  void *v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController primarySceneController](self, "primarySceneController"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "scene"));

  if (v6 == v4)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController pendingPrimarySceneCompletionBlocks](self, "pendingPrimarySceneCompletionBlocks"));
    v33 = objc_msgSend(v32, "copy");

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController pendingPrimarySceneCompletionBlocks](self, "pendingPrimarySceneCompletionBlocks"));
    objc_msgSend(v34, "removeAllObjects");

    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v17 = v33;
    v35 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v73;
      do
      {
        for (i = 0; i != v36; i = (char *)i + 1)
        {
          if (*(_QWORD *)v73 != v37)
            objc_enumerationMutation(v17);
          v39 = (void (**)(id, void *))objc_retainBlock(*(id *)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)i));
          if (v39)
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController primarySceneController](self, "primarySceneController"));
            v39[2](v39, v40);

          }
        }
        v36 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
      }
      while (v36);
    }
    goto LABEL_47;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController accountSceneController](self, "accountSceneController"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "scene"));

  if (v8 == v4)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController pendingAccountSceneCompletionBlocks](self, "pendingAccountSceneCompletionBlocks"));
    v42 = objc_msgSend(v41, "copy");

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController pendingAccountSceneCompletionBlocks](self, "pendingAccountSceneCompletionBlocks"));
    objc_msgSend(v43, "removeAllObjects");

    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v17 = v42;
    v44 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v69;
      do
      {
        for (j = 0; j != v45; j = (char *)j + 1)
        {
          if (*(_QWORD *)v69 != v46)
            objc_enumerationMutation(v17);
          v48 = (void (**)(id, void *))objc_retainBlock(*(id *)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)j));
          if (v48)
          {
            v49 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController accountSceneController](self, "accountSceneController"));
            v48[2](v48, v49);

          }
        }
        v45 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
      }
      while (v45);
    }
    goto LABEL_47;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController endOfBookSceneController](self, "endOfBookSceneController"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scene"));

  if (v10 == v4)
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController pendingEndOfBookSceneCompletionBlocks](self, "pendingEndOfBookSceneCompletionBlocks"));
    v51 = objc_msgSend(v50, "copy");

    v52 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController pendingEndOfBookSceneCompletionBlocks](self, "pendingEndOfBookSceneCompletionBlocks"));
    objc_msgSend(v52, "removeAllObjects");

    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v17 = v51;
    v53 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
    if (v53)
    {
      v54 = v53;
      v55 = *(_QWORD *)v65;
      do
      {
        for (k = 0; k != v54; k = (char *)k + 1)
        {
          if (*(_QWORD *)v65 != v55)
            objc_enumerationMutation(v17);
          v57 = (void (**)(id, void *))objc_retainBlock(*(id *)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)k));
          if (v57)
          {
            v58 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController endOfBookSceneController](self, "endOfBookSceneController"));
            v57[2](v57, v58);

          }
        }
        v54 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
      }
      while (v54);
    }
LABEL_47:
    v13 = v17;
    goto LABEL_48;
  }
  v11 = objc_opt_class(_BCWindowScene);
  v12 = BUDynamicCast(v11, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = objc_opt_class(BKSceneController);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "controller"));
  v16 = BUDynamicCast(v14, v15);
  v17 = (id)objc_claimAutoreleasedReturnValue(v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "sceneInfo"));
  v19 = BUProtocolCast(&OBJC_PROTOCOL___BKBookPresentingSceneInfo, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "openBookAssetID"));
  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController pendingBookSceneCompletionBlocksByAssetID](self, "pendingBookSceneCompletionBlocksByAssetID"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v21));

    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController pendingBookSceneCompletionBlocksByAssetID](self, "pendingBookSceneCompletionBlocksByAssetID"));
      objc_msgSend(v24, "removeObjectForKey:", v21);

      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v59 = v23;
      v25 = v23;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v61;
        do
        {
          for (m = 0; m != v27; m = (char *)m + 1)
          {
            if (*(_QWORD *)v61 != v28)
              objc_enumerationMutation(v25);
            v30 = objc_retainBlock(*(id *)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)m));
            v31 = v30;
            if (v30)
              (*((void (**)(id, id))v30 + 2))(v30, v17);

          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
        }
        while (v27);
      }

      v23 = v59;
    }

  }
LABEL_48:

}

- (NSMutableArray)pendingPrimarySceneCompletionBlocks
{
  return self->_pendingPrimarySceneCompletionBlocks;
}

- (void)updateAllAssetPresenterCloseStateTypes
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000638A0;
  v2[3] = &unk_1008EB7E0;
  v2[4] = self;
  -[BKSceneFlowController enumerateSceneController:includeHidden:](self, "enumerateSceneController:includeHidden:", v2, 1);
}

- (void)setLastCurrentSceneController:(id)a3
{
  objc_storeWeak((id *)&self->_lastCurrentSceneController, a3);
}

- (NSMutableDictionary)pendingUserActivitiesMap
{
  return self->_pendingUserActivitiesMap;
}

- (NSMutableArray)pendingBookSceneRequestAssetIDs
{
  return self->_pendingBookSceneRequestAssetIDs;
}

- (BKSceneFlowController)initWithLaunchCoordinator:(id)a3 criticalAlertCoordinator:(id)a4
{
  id v7;
  id v8;
  BKSceneFlowController *v9;
  BKSceneFlowController *v10;
  NSArray *bookSceneControllers;
  NSMutableArray *v12;
  NSMutableArray *pendingPrimarySceneCompletionBlocks;
  NSMutableArray *v14;
  NSMutableArray *pendingBookSceneRequestAssetIDs;
  NSMutableDictionary *v16;
  NSMutableDictionary *pendingBookSceneCompletionBlocksByAssetID;
  NSMutableArray *v18;
  NSMutableArray *pendingEndOfBookSceneCompletionBlocks;
  NSMutableDictionary *v20;
  NSMutableDictionary *pendingUserActivitiesMap;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)BKSceneFlowController;
  v9 = -[BKSceneFlowController init](&v23, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_launchCoordinator, a3);
    objc_storeStrong((id *)&v10->_criticalAlertCoordinator, a4);
    bookSceneControllers = v10->_bookSceneControllers;
    v10->_bookSceneControllers = (NSArray *)&__NSArray0__struct;

    v12 = objc_opt_new(NSMutableArray);
    pendingPrimarySceneCompletionBlocks = v10->_pendingPrimarySceneCompletionBlocks;
    v10->_pendingPrimarySceneCompletionBlocks = v12;

    v14 = objc_opt_new(NSMutableArray);
    pendingBookSceneRequestAssetIDs = v10->_pendingBookSceneRequestAssetIDs;
    v10->_pendingBookSceneRequestAssetIDs = v14;

    v16 = objc_opt_new(NSMutableDictionary);
    pendingBookSceneCompletionBlocksByAssetID = v10->_pendingBookSceneCompletionBlocksByAssetID;
    v10->_pendingBookSceneCompletionBlocksByAssetID = v16;

    v18 = objc_opt_new(NSMutableArray);
    pendingEndOfBookSceneCompletionBlocks = v10->_pendingEndOfBookSceneCompletionBlocks;
    v10->_pendingEndOfBookSceneCompletionBlocks = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pendingUserActivitiesMap = v10->_pendingUserActivitiesMap;
    v10->_pendingUserActivitiesMap = v20;

  }
  return v10;
}

- (BKCriticalAlertCoordinating)criticalAlertCoordinator
{
  return self->_criticalAlertCoordinator;
}

- (int64_t)closeTypeForSceneController:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int64_t v9;

  v4 = a3;
  v5 = objc_opt_class(BKSceneController);
  v6 = BUDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootBarCoordinator"));
  if (v8)
  {
    v9 = 2;
  }
  else if (-[BKSceneFlowController _canReparentRootBar](self, "_canReparentRootBar"))
  {
    v9 = 4;
  }
  else
  {
    v9 = 3;
  }

  return v9;
}

- (void)application:(id)a3 didDiscardSceneSessions:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v5 = a4;
  v19 = objc_alloc_init((Class)NSMutableSet);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKBasePresentingViewController lastKnownSuccessfullyOpenBookID](BKAssetPresentingViewController, "lastKnownSuccessfullyOpenBookID"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController _lastKnownBookPresentingSceneInfoForSceneSession:](self, "_lastKnownBookPresentingSceneInfoForSceneSession:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v11)));
        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "openBookAssetID"));
        if (v13)
        {
          v14 = (void *)v13;
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "openBookAssetID"));
          v16 = objc_msgSend(v6, "isEqualToString:", v15);

          if ((v16 & 1) == 0)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "openBookAssetID"));
            objc_msgSend(v19, "addObject:", v17);

          }
        }

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[BKLastOpenBookManager sharedInstance](BKLastOpenBookManager, "sharedInstance"));
  objc_msgSend(v18, "removeSucessfullyOpenedBookAssetIDs:", v19);

}

- (id)anySceneController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController currentSceneController](self, "currentSceneController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scene"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController currentSceneController](self, "currentSceneController"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController endOfBookSceneController](self, "endOfBookSceneController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scene"));

    if (v7)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController endOfBookSceneController](self, "endOfBookSceneController"));
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController accountSceneController](self, "accountSceneController"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "scene"));

      if (v9)
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController accountSceneController](self, "accountSceneController"));
      else
        v5 = 0;
    }
  }
  return v5;
}

- (void)_setupSizeRestrictionsForWindowScene:(id)a3 sceneType:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  id v10;

  v5 = a3;
  if (v5)
  {
    v10 = v5;
    if (a4)
    {
      if (a4 == 3)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sizeRestrictions"));
        v7 = v8;
        v9 = 801.0;
      }
      else
      {
        if (a4 == 2)
        {
          v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sizeRestrictions"));
          objc_msgSend(v6, "setMinimumSize:", 450.0, 450.0);

          v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sizeRestrictions"));
          objc_msgSend(v7, "setMaximumSize:", 450.0, 450.0);
LABEL_10:

          v5 = v10;
          goto LABEL_11;
        }
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sizeRestrictions"));
        v7 = v8;
        v9 = 1001.0;
      }
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sizeRestrictions"));
      v7 = v8;
      v9 = 500.0;
    }
    objc_msgSend(v8, "setMinimumSize:", v9, 530.0);
    goto LABEL_10;
  }
LABEL_11:

}

- (id)_lastKnownBookPresentingSceneInfoForSceneSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController _lastKnownStateRestorationUserInfoForSceneSession:](self, "_lastKnownStateRestorationUserInfoForSceneSession:", v4));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[_BKBaseSceneController sceneInfoFromSceneSession:](BKSceneController, "sceneInfoFromSceneSession:", v4));
    v7 = BUProtocolCast(&OBJC_PROTOCOL___BKBookPresentingSceneInfo, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_isStateRestorationAndCanRestoreToAuxiliaryScene:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stateRestorationActivity"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController _lastKnownBookPresentingSceneInfoForSceneSession:](self, "_lastKnownBookPresentingSceneInfoForSceneSession:", v4));
    v7 = v6;
    if (v6)
      LOBYTE(v5) = objc_msgSend(v6, "supportsOpeningToAuxiliaryScene");
    else
      LOBYTE(v5) = 0;

  }
  return (char)v5;
}

- (BOOL)_hasLaunchActionsInConnectionOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shortcutItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLContexts"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userActivities"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "notificationResponse"));

  v8 = v4 || objc_msgSend(v5, "count") || objc_msgSend(v6, "count") || v7;
  return v8;
}

- (void)_handleSceneConnectionOptionsActions:(id)a3 sceneController:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  id v35;

  v5 = a3;
  v6 = a4;
  v7 = BCSceneLog(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Incoming scene connection: %@", buf, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scene"));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "shortcutItem"));
  if (v10)
    objc_msgSend(v6, "windowScene:performActionForShortcutItem:completionHandler:", v9, v10, &stru_1008EB718);
  v28 = (void *)v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringForKey:", CFSTR("PPTLaunchURL")));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v12));
    objc_msgSend(v6, "openURL:options:", v13, &__NSDictionary0__struct);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLContexts"));
    v15 = objc_msgSend(v14, "count");

    if (!v15)
      goto LABEL_10;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLContexts"));
    objc_msgSend(v6, "scene:openURLContexts:", v9, v13);
  }

LABEL_10:
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userActivities"));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "activityType"));
        objc_msgSend(v6, "scene:willContinueUserActivityWithType:", v9, v22);

        objc_msgSend(v6, "scene:continueUserActivity:", v9, v21);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v18);
  }
  v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "notificationResponse"));
  v24 = (void *)v23;
  if (v23)
  {
    v25 = BCSceneLog(v23);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v24;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Incoming notification during scene connection: %@", buf, 0xCu);
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[BKNotificationManager sharedInstance](BKNotificationManager, "sharedInstance"));
    objc_msgSend(v27, "handleNotificationResponse:", v24);

  }
}

- (void)_finishSceneRequest:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v4 = a3;
  v5 = objc_opt_class(_BCWindowScene);
  v6 = BUDynamicCast(v5, v4);
  v14 = (id)objc_claimAutoreleasedReturnValue(v6);

  v7 = objc_opt_class(_BKBaseSceneController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "controller"));
  v9 = BUDynamicCast(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (!objc_msgSend(v10, "sceneType"))
  {
    v11 = objc_opt_class(BKSceneController);
    v12 = BUDynamicCast(v11, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[BKSceneFlowController _consumePendingBookSceneRequestAssetID:](self, "_consumePendingBookSceneRequestAssetID:", v13);

  }
  -[BKSceneFlowController _flushPendingSceneRequestCompletion:](self, "_flushPendingSceneRequestCompletion:", v14);

}

- (void)_attachDebugViewControllerToSceneIfNeeded:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id location;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  if (objc_msgSend(v4, "BOOLForKey:", CFSTR("BKShowDebugMenu")))
  {
    v5 = +[JSADevice isInternalBuild](JSADevice, "isInternalBuild");

    if (v5)
    {
      v6 = objc_opt_class(_BCWindowScene);
      v7 = BUDynamicCast(v6, v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      objc_initWeak(&location, v8);

      objc_copyWeak(&v12, &location);
      v9 = objc_loadWeakRetained(&location);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "statusBarManager", _NSConcreteStackBlock, 3221225472, sub_10011D228, &unk_1008E74C8));
      objc_msgSend(v10, "setDebugMenuHandler:", &v11);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
  else
  {

  }
}

- (id)defaultSceneControllerForTransaction:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t v14[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "targetSceneController"));

  if (v5)
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "targetSceneController"));
  else
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originatingSceneController"));
  v7 = (void *)v6;

  v8 = BUProtocolCast(&OBJC_PROTOCOL___BKSceneControlling, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (!v9)
  {
    v11 = BCSceneLog(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "sceneController not found in tx. Returning currentSceneController as fallback.", v14, 2u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController currentSceneController](self, "currentSceneController"));
  }
  return v9;
}

- (id)_rootViewControllerForViewController:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "parentViewController"));
  if (v4
    || (v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentingViewController")),
        0,
        v4 = (void *)v5,
        v6 = v3,
        v5))
  {
    v6 = v3;
    do
    {
      v7 = v6;
      v6 = v4;

      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parentViewController"));
      v9 = v8;
      if (v8)
        v10 = v8;
      else
        v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentingViewController"));
      v4 = v10;

    }
    while (v4);
  }

  return v6;
}

- (id)sceneControllerForViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_10004E418;
  v25 = sub_10004E280;
  v26 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewIfLoaded"));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
      v9 = objc_claimAutoreleasedReturnValue(-[BKSceneFlowController sceneControllerForWindow:](self, "sceneControllerForWindow:", v8));
      v10 = (void *)v22[5];
      v22[5] = v9;

    }
  }
  v11 = (void *)v22[5];
  if (!v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController _rootViewControllerForViewController:](self, "_rootViewControllerForViewController:", v4));
    v13 = v12;
    if (v12)
    {
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_bk_sceneController"));
      v15 = (void *)v22[5];
      v22[5] = v14;

    }
    if (!v22[5])
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10011A668;
      v18[3] = &unk_1008EB5E0;
      v19 = v13;
      v20 = &v21;
      -[BKSceneFlowController enumerateSceneController:includeHidden:](self, "enumerateSceneController:includeHidden:", v18, 1);

    }
    v11 = (void *)v22[5];
  }
  v16 = v11;

  _Block_object_dispose(&v21, 8);
  return v16;
}

- (id)sceneControllerForWindow:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "windowScene"));
  v4 = objc_opt_class(_BCWindowScene);
  v5 = BUDynamicCast(v4, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "controller"));
  v8 = BUProtocolCast(&OBJC_PROTOCOL___BKSceneControlling, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

- (id)sceneInfoPresentingAssetID:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_10004E418;
  v14 = sub_10004E280;
  v15 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10011A868;
  v7[3] = &unk_1008EB608;
  v4 = a3;
  v8 = v4;
  v9 = &v10;
  -[BKSceneFlowController enumerateSceneInfo:](self, "enumerateSceneInfo:", v7);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (void)destroySceneForAssetID:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController sceneInfoPresentingAssetID:](self, "sceneInfoPresentingAssetID:", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKSceneUtilities sharedInstance](BKSceneUtilities, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sceneSession"));
  objc_msgSend(v3, "destroySceneWithSceneSession:withAnimationType:", v4, 1);

}

- (void)enumerateSceneInfo:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _BOOL4 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  _BYTE v38[128];

  v4 = a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = sub_10004E418;
  v36 = sub_10004E280;
  v37 = objc_alloc_init((Class)NSMutableSet);
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10011AC5C;
  v24[3] = &unk_1008EB630;
  v26 = &v32;
  v5 = v4;
  v25 = v5;
  v27 = &v28;
  -[BKSceneFlowController enumerateSceneController:includeHidden:](self, "enumerateSceneController:includeHidden:", v24, 0);
  if (!*((_BYTE *)v29 + 24))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "openSessions"));

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v38, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "role", (_QWORD)v20));
          v14 = objc_msgSend(v13, "isEqualToString:", UIWindowSceneSessionRoleApplication);

          if (v14)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "persistentIdentifier"));
            if ((objc_msgSend((id)v33[5], "containsObject:", v15) & 1) == 0)
            {
              v16 = (void *)objc_claimAutoreleasedReturnValue(+[_BKBaseSceneController sceneInfoFromSceneSession:](BKSceneController, "sceneInfoFromSceneSession:", v12));
              v17 = objc_retainBlock(v5);
              v18 = v17;
              if (v17)
                (*((void (**)(id, void *, uint64_t *))v17 + 2))(v17, v16, v29 + 3);

              v19 = *((_BYTE *)v29 + 24) == 0;
              if (!v19)
              {

                goto LABEL_17;
              }
            }

          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v38, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_17:

  }
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

}

- (BKSceneController)accountSceneController
{
  BKSceneController *accountSceneController;
  BKSceneController *v4;
  void *v5;
  void *v6;
  BKSceneController *v7;
  BKSceneController *v8;

  accountSceneController = self->_accountSceneController;
  if (!accountSceneController)
  {
    v4 = [BKSceneController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController launchCoordinator](self, "launchCoordinator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController criticalAlertCoordinator](self, "criticalAlertCoordinator"));
    v7 = -[BKSceneController initWithSceneType:launchCoordinator:criticalAlertCoordinator:](v4, "initWithSceneType:launchCoordinator:criticalAlertCoordinator:", 2, v5, v6);
    v8 = self->_accountSceneController;
    self->_accountSceneController = v7;

    accountSceneController = self->_accountSceneController;
  }
  return accountSceneController;
}

- (BKSceneController)endOfBookSceneController
{
  BKSceneController *endOfBookSceneController;
  BKSceneController *v4;
  void *v5;
  void *v6;
  BKSceneController *v7;
  BKSceneController *v8;

  endOfBookSceneController = self->_endOfBookSceneController;
  if (!endOfBookSceneController)
  {
    v4 = [BKSceneController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController launchCoordinator](self, "launchCoordinator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController criticalAlertCoordinator](self, "criticalAlertCoordinator"));
    v7 = -[BKSceneController initWithSceneType:launchCoordinator:criticalAlertCoordinator:](v4, "initWithSceneType:launchCoordinator:criticalAlertCoordinator:", 3, v5, v6);
    v8 = self->_endOfBookSceneController;
    self->_endOfBookSceneController = v7;

    endOfBookSceneController = self->_endOfBookSceneController;
  }
  return endOfBookSceneController;
}

- (id)sceneControllerForSceneType:(unint64_t)a3 assetID:(id)a4
{
  id v6;
  void *v7;
  id v8;
  __int128 v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  id v29;
  _BYTE v30[128];

  v6 = a4;
  switch(a3)
  {
    case 0uLL:
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController bookSceneControllers](self, "bookSceneControllers"));
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      if (!v8)
        goto LABEL_19;
      v10 = *(_QWORD *)v25;
      *(_QWORD *)&v9 = 138412290;
      v23 = v9;
      break;
    case 1uLL:
      v21 = objc_claimAutoreleasedReturnValue(-[BKSceneFlowController primarySceneController](self, "primarySceneController"));
      goto LABEL_17;
    case 2uLL:
      v21 = objc_claimAutoreleasedReturnValue(-[BKSceneFlowController accountSceneController](self, "accountSceneController"));
      goto LABEL_17;
    case 3uLL:
      v21 = objc_claimAutoreleasedReturnValue(-[BKSceneFlowController endOfBookSceneController](self, "endOfBookSceneController"));
LABEL_17:
      v8 = (id)v21;
      goto LABEL_20;
    default:
      v8 = 0;
      goto LABEL_20;
  }
  while (2)
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(_QWORD *)v25 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sceneInfo", v23));
      v14 = BUProtocolCast(&OBJC_PROTOCOL___BKBookPresentingSceneInfo, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

      v17 = BCSceneLog(v16);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = v23;
        v29 = v6;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "sceneControllerForSceneType with assetID=%@", buf, 0xCu);
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "openBookAssetID"));
      v20 = objc_msgSend(v19, "isEqualToString:", v6);

      if (v20)
      {
        v8 = v12;

        goto LABEL_19;
      }

    }
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (v8)
      continue;
    break;
  }
LABEL_19:

LABEL_20:
  return v8;
}

- (void)requestPrimaryOrBookScene:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController currentSceneController](self, "currentSceneController"));

  if (v4
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController currentSceneController](self, "currentSceneController")),
        v6 = objc_msgSend(v5, "sceneType"),
        v5,
        !v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController currentSceneController](self, "currentSceneController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sceneInfo"));
    v9 = BUProtocolCast(&OBJC_PROTOCOL___BKBookPresentingSceneInfo, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "openBookAssetID"));
    -[BKSceneFlowController requestBookSceneWithAssetID:completion:](self, "requestBookSceneWithAssetID:completion:", v11, v12);

  }
  else
  {
    -[BKSceneFlowController requestPrimaryScene:](self, "requestPrimaryScene:", v12);
  }

}

- (void)requestPrimaryScene:(id)a3
{
  -[BKSceneFlowController requestPrimaryScene:completion:](self, "requestPrimaryScene:completion:", 1, a3);
}

- (void)requestPrimaryScene:(BOOL)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id buf[2];

  v6 = a4;
  v7 = BCSceneLog(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "requestPrimaryScene", (uint8_t *)buf, 2u);
  }

  v9 = +[BKSceneUtilities hasMultiWindowEnabled](BKSceneUtilities, "hasMultiWindowEnabled");
  if ((v9 & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController currentSceneController](self, "currentSceneController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController primarySceneController](self, "primarySceneController"));

    if (v10 != v11 && -[BKSceneFlowController _canReparentRootBar](self, "_canReparentRootBar"))
      -[BKSceneFlowController _reparentRootBarTo:](self, "_reparentRootBarTo:", v10);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController primarySceneController](self, "primarySceneController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "scene"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController pendingPrimarySceneCompletionBlocks](self, "pendingPrimarySceneCompletionBlocks"));
  v15 = objc_msgSend(v14, "count");

  if (!a3 && v13)
  {
    if (v15)
    {
      v16 = (id)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController pendingPrimarySceneCompletionBlocks](self, "pendingPrimarySceneCompletionBlocks"));
      v17 = objc_retainBlock(v6);
      objc_msgSend(v16, "addObject:", v17);
    }
    else
    {
      v16 = objc_retainBlock(v6);
      if (!v16)
      {
LABEL_23:

        goto LABEL_24;
      }
      v17 = (id)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController primarySceneController](self, "primarySceneController"));
      (*((void (**)(id, id))v16 + 2))(v16, v17);
    }

    goto LABEL_23;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController pendingPrimarySceneCompletionBlocks](self, "pendingPrimarySceneCompletionBlocks"));
  v19 = objc_retainBlock(v6);
  objc_msgSend(v18, "addObject:", v19);

  if (!v15)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "session"));
    v21 = v20;
    if (v20)
      v22 = v20;
    else
      v22 = (id)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController _existingSceneSessionForPrimaryScene](self, "_existingSceneSessionForPrimaryScene"));
    v16 = v22;

    if (v9)
    {
      objc_initWeak(buf, self);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[BKSceneUtilities sharedInstance](BKSceneUtilities, "sharedInstance"));
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10011B43C;
      v24[3] = &unk_1008E8198;
      objc_copyWeak(&v25, buf);
      objc_msgSend(v23, "requestWindowForSceneSession:userActivity:errorHandler:", v16, 0, v24);

      objc_destroyWeak(&v25);
      objc_destroyWeak(buf);
    }
    if (v13)
      -[BKSceneFlowController _finishSceneRequest:](self, "_finishSceneRequest:", v13);
    goto LABEL_23;
  }
LABEL_24:

}

- (void)requestBookSceneWithAssetID:(id)a3 completion:(id)a4
{
  -[BKSceneFlowController requestBookSceneWithAssetID:bringExistingToFront:completion:](self, "requestBookSceneWithAssetID:bringExistingToFront:completion:", a3, 1, a4);
}

- (void)requestBookSceneWithAssetID:(id)a3 bringExistingToFront:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  _QWORD *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id location;
  _QWORD v32[4];
  id v33;
  BKSceneFlowController *v34;
  _QWORD *v35;
  __int128 *p_buf;
  _QWORD v37[4];
  id v38;
  id v39;
  __int128 buf;
  uint64_t v41;
  char v42;

  v8 = a3;
  v9 = a5;
  v10 = BCSceneLog(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "requestBookScene with assetID=%@", (uint8_t *)&buf, 0xCu);
  }

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10011B870;
  v37[3] = &unk_1008EB658;
  v12 = v8;
  v38 = v12;
  v13 = v9;
  v39 = v13;
  v14 = objc_retainBlock(v37);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v41 = 0x2020000000;
  v42 = 0;
  if (a4)
    goto LABEL_5;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10011B8CC;
  v32[3] = &unk_1008EB680;
  v33 = v12;
  v34 = self;
  v35 = v14;
  p_buf = &buf;
  -[BKSceneFlowController enumerateSceneInfo:](self, "enumerateSceneInfo:", v32);

  if (!*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
  {
LABEL_5:
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController pendingBookSceneCompletionBlocksByAssetID](self, "pendingBookSceneCompletionBlocksByAssetID"));
    v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v12));

    if (!v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController pendingBookSceneCompletionBlocksByAssetID](self, "pendingBookSceneCompletionBlocksByAssetID"));
      v16 = objc_alloc_init((Class)NSMutableArray);
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v12);

    }
    v18 = objc_msgSend(v16, "count");
    v19 = objc_retainBlock(v14);
    objc_msgSend(v16, "addObject:", v19);

    if (!v18)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController pendingBookSceneRequestAssetIDs](self, "pendingBookSceneRequestAssetIDs"));
      objc_msgSend(v20, "addObject:", v12);

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController _existingBookSceneSessionForRequestAssetID:](self, "_existingBookSceneSessionForRequestAssetID:", v12));
      if (v21)
      {
        v22 = objc_opt_class(UIWindowScene);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "scene"));
        v24 = BUDynamicCast(v22, v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

      }
      else
      {
        v25 = 0;
      }
      if (+[BKSceneUtilities hasMultiWindowEnabled](BKSceneUtilities, "hasMultiWindowEnabled"))
      {
        objc_initWeak(&location, self);
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[BKSceneUtilities sharedInstance](BKSceneUtilities, "sharedInstance"));
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_10011B9EC;
        v27[3] = &unk_1008EB6A8;
        objc_copyWeak(&v30, &location);
        v28 = v25;
        v29 = v12;
        objc_msgSend(v26, "requestWindowForSceneSession:userActivity:errorHandler:", v21, 0, v27);

        objc_destroyWeak(&v30);
        objc_destroyWeak(&location);
      }
      if (v25)
        -[BKSceneFlowController _finishSceneRequest:](self, "_finishSceneRequest:", v25);

    }
  }
  _Block_object_dispose(&buf, 8);

}

- (void)requestAccountScene:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController pendingAccountSceneCompletionBlocks](self, "pendingAccountSceneCompletionBlocks"));
  v6 = objc_msgSend(v5, "count");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController pendingAccountSceneCompletionBlocks](self, "pendingAccountSceneCompletionBlocks"));
  v8 = objc_retainBlock(v4);
  objc_msgSend(v7, "addObject:", v8);

  if (!v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController accountSceneController](self, "accountSceneController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scene"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "session"));

    if (v11)
    {
      v12 = objc_opt_class(UIWindowScene);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "scene"));
      v14 = BUDynamicCast(v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    }
    else
    {
      v15 = 0;
    }
    v16 = objc_msgSend(objc_alloc((Class)NSUserActivity), "initWithActivityType:", CFSTR("BKAccountInfoSceneActivityType"));
    objc_initWeak(&location, self);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[BKSceneUtilities sharedInstance](BKSceneUtilities, "sharedInstance"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10011BC88;
    v18[3] = &unk_1008EB6D0;
    objc_copyWeak(&v19, &location);
    v18[4] = self;
    objc_msgSend(v17, "requestWindowForSceneSession:userActivity:errorHandler:", v11, v16, v18);

    if (v15)
      -[BKSceneFlowController _finishSceneRequest:](self, "_finishSceneRequest:", v15);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
}

- (void)requestEndOfBookSceneWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void **v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void *v29;
  BKSceneFlowController *v30;
  id v31;
  id location;
  const __CFString *v33;
  id v34;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController currentEndOfBookSceneOptions](self, "currentEndOfBookSceneOptions"));
  v9 = objc_msgSend(v8, "isEqualToDictionary:", v6);

  v33 = CFSTR("feedOptions");
  v34 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
  if ((v9 & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController pendingEndOfBookSceneCompletionBlocks](self, "pendingEndOfBookSceneCompletionBlocks"));
    objc_msgSend(v11, "removeAllObjects");

    -[BKSceneFlowController setCurrentEndOfBookSceneOptions:](self, "setCurrentEndOfBookSceneOptions:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController endOfBookSceneController](self, "endOfBookSceneController"));
    objc_msgSend(v12, "updateEndOfBookSceneWithUserInfo:", v10);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController pendingEndOfBookSceneCompletionBlocks](self, "pendingEndOfBookSceneCompletionBlocks"));
  v14 = objc_msgSend(v13, "count") == 0;

  if (v14)
  {
    -[BKSceneFlowController setCurrentEndOfBookSceneOptions:](self, "setCurrentEndOfBookSceneOptions:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController pendingEndOfBookSceneCompletionBlocks](self, "pendingEndOfBookSceneCompletionBlocks"));
    v18 = objc_retainBlock(v7);
    objc_msgSend(v17, "addObject:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController endOfBookSceneController](self, "endOfBookSceneController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "scene"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "session"));

    if (v15)
    {
      v21 = objc_opt_class(UIWindowScene);
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "scene"));
      v23 = BUDynamicCast(v21, v22);
      v16 = (id)objc_claimAutoreleasedReturnValue(v23);

    }
    else
    {
      v16 = 0;
    }
    v24 = objc_msgSend(objc_alloc((Class)NSUserActivity), "initWithActivityType:", CFSTR("BKEndOfBookSceneActivityType"));
    objc_msgSend(v24, "setUserInfo:", v10);
    objc_initWeak(&location, self);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[BKSceneUtilities sharedInstance](BKSceneUtilities, "sharedInstance"));
    v26 = _NSConcreteStackBlock;
    v27 = 3221225472;
    v28 = sub_10011C010;
    v29 = &unk_1008EB6D0;
    objc_copyWeak(&v31, &location);
    v30 = self;
    objc_msgSend(v25, "requestWindowForSceneSession:userActivity:errorHandler:", v15, v24, &v26);

    if (v16)
      -[BKSceneFlowController _finishSceneRequest:](self, "_finishSceneRequest:", v16, v26, v27, v28, v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);

  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController pendingEndOfBookSceneCompletionBlocks](self, "pendingEndOfBookSceneCompletionBlocks"));
    v16 = objc_retainBlock(v7);
    objc_msgSend(v15, "addObject:", v16);
  }

}

- (void)_handleErrorForCompletionBlocks:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = a3;
  v4 = objc_msgSend(v3, "copy");
  objc_msgSend(v3, "removeAllObjects");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_retainBlock(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9));
        v11 = v10;
        if (v10)
          (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (id)_existingSceneSessionForPrimaryScene
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_10004E418;
  v9 = sub_10004E280;
  v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10011C258;
  v4[3] = &unk_1008EB608;
  v4[4] = self;
  v4[5] = &v5;
  -[BKSceneFlowController enumerateSceneInfo:](self, "enumerateSceneInfo:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)_existingBookSceneSessionForRequestAssetID:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_10004E418;
  v14 = sub_10004E280;
  v15 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10011C438;
  v7[3] = &unk_1008EB608;
  v4 = a3;
  v8 = v4;
  v9 = &v10;
  -[BKSceneFlowController enumerateSceneInfo:](self, "enumerateSceneInfo:", v7);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (void)requestSceneWithAssetID:(id)a3 completion:(id)a4
{
  -[BKSceneFlowController requestSceneWithAssetID:bringExistingToFront:completion:](self, "requestSceneWithAssetID:bringExistingToFront:completion:", a3, 1, a4);
}

- (void)requestSceneWithAssetID:(id)a3 bringExistingToFront:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unsigned int v17;
  _QWORD *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController primarySceneController](self, "primarySceneController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "scene"));

  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController primarySceneController](self, "primarySceneController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sceneInfo"));

    v14 = BUProtocolCast(&OBJC_PROTOCOL___BKBookPresentingSceneInfo, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "openBookAssetID"));
    v17 = objc_msgSend(v16, "isEqualToString:", v8);

    if (v17)
      *((_BYTE *)v25 + 24) = 1;

  }
  else
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10011C738;
    v21[3] = &unk_1008EB608;
    v22 = v8;
    v23 = &v24;
    -[BKSceneFlowController enumerateSceneInfo:](self, "enumerateSceneInfo:", v21);
    v13 = v22;
  }

  if (*((_BYTE *)v25 + 24))
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10011C7C0;
    v20[3] = &unk_1008EB6F8;
    v18 = v20;
    v20[4] = v9;
    -[BKSceneFlowController requestPrimaryScene:completion:](self, "requestPrimaryScene:completion:", v6, v20);
  }
  else
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10011C814;
    v19[3] = &unk_1008EB6F8;
    v18 = v19;
    v19[4] = v9;
    -[BKSceneFlowController requestBookSceneWithAssetID:bringExistingToFront:completion:](self, "requestBookSceneWithAssetID:bringExistingToFront:completion:", v8, v6, v19);
  }

  _Block_object_dispose(&v24, 8);
}

- (void)_consumePendingBookSceneRequestAssetID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController pendingBookSceneRequestAssetIDs](self, "pendingBookSceneRequestAssetIDs"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController pendingBookSceneRequestAssetIDs](self, "pendingBookSceneRequestAssetIDs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    objc_msgSend(v9, "setRequestAssetID:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController pendingBookSceneRequestAssetIDs](self, "pendingBookSceneRequestAssetIDs"));
    objc_msgSend(v8, "removeObjectAtIndex:", 0);

  }
}

- (void)didDisconnectScene:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSString *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "session"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "persistentIdentifier"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
  v8 = (objc_class *)objc_opt_class(v7);

  v10 = BCSceneLog(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = NSStringFromClass(v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    *(_DWORD *)buf = 138543618;
    v22 = v6;
    v23 = 2114;
    v24 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "didDisconnectScene: sceneIdentifier=%{public}@, sceneDelegate=%{public}@", buf, 0x16u);

  }
  -[BKSceneFlowController _flushPendingSceneRequestCompletion:](self, "_flushPendingSceneRequestCompletion:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController primarySceneController](self, "primarySceneController"));
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "scene"));

  if (v15 != v4)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController bookSceneControllers](self, "bookSceneControllers"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10011CAF8;
    v19[3] = &unk_1008EB740;
    v20 = v4;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v19));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "filteredArrayUsingPredicate:", v17));
    -[BKSceneFlowController setBookSceneControllers:](self, "setBookSceneControllers:", v18);

  }
}

- (id)sceneHostingAllViewControllersConformingToProtocol:(id)a3
{
  id v4;
  id v5;
  id v6;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id v13;

  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_10011CBEC;
  v11 = &unk_1008EB768;
  v12 = a3;
  v13 = objc_alloc_init((Class)NSMutableArray);
  v4 = v13;
  v5 = v12;
  -[BKSceneFlowController enumerateSceneController:includeHidden:](self, "enumerateSceneController:includeHidden:", &v8, 1);
  v6 = objc_msgSend(v4, "copy", v8, v9, v10, v11);

  return v6;
}

- (int64_t)closeTypeForForegroundedScene
{
  int64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 2;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10011CD14;
  v4[3] = &unk_1008EB790;
  v4[4] = v9;
  v4[5] = &v5;
  -[BKSceneFlowController enumerateSceneController:includeHidden:](self, "enumerateSceneController:includeHidden:", v4, 0);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(v9, 8);
  return v2;
}

- (BOOL)_canReparentRootBar
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
  v8 = 1;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10011CE88;
  v4[3] = &unk_1008EB7B8;
  v4[4] = &v5;
  -[BKSceneFlowController enumerateSceneInfo:](self, "enumerateSceneInfo:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_reparentRootBarTo:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v4 = a3;
  v5 = objc_opt_class(BKSceneController);
  v6 = BUDynamicCast(v5, v4);
  v26 = (id)objc_claimAutoreleasedReturnValue(v6);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController primarySceneController](self, "primarySceneController"));
  v8 = v26;
  if (v26 != v7)
  {
    v9 = objc_opt_class(BKSceneController);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController primarySceneController](self, "primarySceneController"));
    v11 = BUDynamicCast(v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rootBarCoordinator"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController bookSceneControllers](self, "bookSceneControllers"));
    v15 = objc_msgSend(v14, "containsObject:", v26);

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController bookSceneControllers](self, "bookSceneControllers"));
      v17 = objc_msgSend(v16, "mutableCopy");

      objc_msgSend(v17, "removeObject:", v26);
      -[BKSceneFlowController setBookSceneControllers:](self, "setBookSceneControllers:", v17);

    }
    -[BKSceneFlowController setPrimarySceneController:](self, "setPrimarySceneController:", v26);
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "scene"));
    if (v18)
    {
      v19 = (void *)v18;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController bookSceneControllers](self, "bookSceneControllers"));
      v21 = objc_msgSend(v20, "containsObject:", v12);

      if ((v21 & 1) == 0)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneFlowController bookSceneControllers](self, "bookSceneControllers"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "arrayByAddingObject:", v12));
        -[BKSceneFlowController setBookSceneControllers:](self, "setBookSceneControllers:", v23);

      }
    }
    objc_msgSend(v12, "setRootBarCoordinator:", 0);
    objc_msgSend(v26, "setRootBarCoordinator:", v13);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "rootBarCoordinator"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[BKRootBarItemsProvider HomeIdentifier](BKRootBarItemsProvider, "HomeIdentifier"));
    objc_msgSend(v24, "selectWithIdentifier:isUserAction:", v25, 0);

    -[BKSceneFlowController updateAllAssetPresenterCloseStateTypes](self, "updateAllAssetPresenterCloseStateTypes");
    v8 = v26;
  }

}

- (void)handleCloseAssetForSceneController:(id)a3 assetPresentingViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  int64_t v9;
  void *v10;
  id v11;

  v5 = a5;
  v11 = a3;
  v8 = a4;
  v9 = -[BKSceneFlowController closeTypeForSceneController:](self, "closeTypeForSceneController:", v11);
  switch(v9)
  {
    case 2:
      goto LABEL_6;
    case 4:
      -[BKSceneFlowController _reparentRootBarTo:](self, "_reparentRootBarTo:", v11);
LABEL_6:
      objc_msgSend(v8, "im_dismissAnimated:", v5);
      break;
    case 3:
      -[BKSceneFlowController requestPrimaryScene:](self, "requestPrimaryScene:", &stru_1008EB820);
      break;
  }
  -[BKSceneFlowController updateAllAssetPresenterCloseStateTypes](self, "updateAllAssetPresenterCloseStateTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager"));
  objc_msgSend(v10, "attemptToPresentStoreReview");

}

- (void)setLaunchCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_launchCoordinator, a3);
}

- (void)setCriticalAlertCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_criticalAlertCoordinator, a3);
}

- (void)setPendingPrimarySceneCompletionBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_pendingPrimarySceneCompletionBlocks, a3);
}

- (NSMutableArray)pendingAccountSceneCompletionBlocks
{
  return self->_pendingAccountSceneCompletionBlocks;
}

- (void)setPendingAccountSceneCompletionBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_pendingAccountSceneCompletionBlocks, a3);
}

- (NSMutableArray)pendingEndOfBookSceneCompletionBlocks
{
  return self->_pendingEndOfBookSceneCompletionBlocks;
}

- (void)setPendingEndOfBookSceneCompletionBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_pendingEndOfBookSceneCompletionBlocks, a3);
}

- (NSDictionary)currentEndOfBookSceneOptions
{
  return self->_currentEndOfBookSceneOptions;
}

- (void)setCurrentEndOfBookSceneOptions:(id)a3
{
  objc_storeStrong((id *)&self->_currentEndOfBookSceneOptions, a3);
}

- (void)setPendingBookSceneRequestAssetIDs:(id)a3
{
  objc_storeStrong((id *)&self->_pendingBookSceneRequestAssetIDs, a3);
}

- (NSMutableDictionary)pendingBookSceneCompletionBlocksByAssetID
{
  return self->_pendingBookSceneCompletionBlocksByAssetID;
}

- (void)setPendingBookSceneCompletionBlocksByAssetID:(id)a3
{
  objc_storeStrong((id *)&self->_pendingBookSceneCompletionBlocksByAssetID, a3);
}

- (void)setPendingUserActivitiesMap:(id)a3
{
  objc_storeStrong((id *)&self->_pendingUserActivitiesMap, a3);
}

- (void)setPrimarySceneController:(id)a3
{
  objc_storeStrong((id *)&self->_primarySceneController, a3);
}

- (void)setAccountSceneController:(id)a3
{
  objc_storeStrong((id *)&self->_accountSceneController, a3);
}

- (void)setEndOfBookSceneController:(id)a3
{
  objc_storeStrong((id *)&self->_endOfBookSceneController, a3);
}

- (void)setBookSceneControllers:(id)a3
{
  objc_storeStrong((id *)&self->_bookSceneControllers, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lastCurrentSceneController);
  objc_storeStrong((id *)&self->_bookSceneControllers, 0);
  objc_storeStrong((id *)&self->_endOfBookSceneController, 0);
  objc_storeStrong((id *)&self->_accountSceneController, 0);
  objc_storeStrong((id *)&self->_primarySceneController, 0);
  objc_storeStrong((id *)&self->_pendingUserActivitiesMap, 0);
  objc_storeStrong((id *)&self->_pendingBookSceneCompletionBlocksByAssetID, 0);
  objc_storeStrong((id *)&self->_pendingBookSceneRequestAssetIDs, 0);
  objc_storeStrong((id *)&self->_currentEndOfBookSceneOptions, 0);
  objc_storeStrong((id *)&self->_pendingEndOfBookSceneCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_pendingAccountSceneCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_pendingPrimarySceneCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_criticalAlertCoordinator, 0);
  objc_storeStrong((id *)&self->_launchCoordinator, 0);
}

- (BOOL)_areConnectionOptionsForIntents:(id)a3
{
  id v3;
  id v5;
  BKSceneFlowController *v6;

  v3 = a3;
  v5 = a3;
  v6 = self;
  LOBYTE(v3) = sub_100364008(v3);

  return v3 & 1;
}

@end
