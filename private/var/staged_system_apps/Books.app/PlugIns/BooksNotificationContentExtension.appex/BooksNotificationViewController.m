@implementation BooksNotificationViewController

- (BooksNotificationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  BooksNotificationViewController *v4;
  id v5;
  TUISyncLayoutController *v6;
  TUISyncLayoutController *syncLayoutController;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BooksNotificationViewController;
  v4 = -[BooksNotificationViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc((Class)BCAppAnalyticsExtensionManager), "initWithUploadsEnabled:", 0);
    -[BooksNotificationViewController setAnalyticsManager:](v4, "setAnalyticsManager:", v5);

    v6 = (TUISyncLayoutController *)objc_msgSend(objc_alloc((Class)TUISyncLayoutController), "initWithDelegate:", v4);
    syncLayoutController = v4->_syncLayoutController;
    v4->_syncLayoutController = v6;

  }
  return v4;
}

- (void)viewDidLoad
{
  void *v3;
  double Width;
  void *v5;
  double v6;
  double v7;
  void *v8;
  objc_super v9;
  CGRect v10;

  v9.receiver = self;
  v9.super_class = (Class)BooksNotificationViewController;
  -[BooksNotificationViewController viewDidLoad](&v9, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BooksNotificationViewController view](self, "view"));
  objc_msgSend(v3, "frame");
  Width = CGRectGetWidth(v10);

  v5 = (void *)objc_opt_new(BSUIPlaceholderViewController);
  objc_msgSend(v5, "expectedContentSize");
  v7 = v6;

  -[BooksNotificationViewController setPreferredContentSize:](self, "setPreferredContentSize:", Width, v7);
  +[BAEventReporter setupLibraryAnalyticsDataProvider](BAEventReporter, "setupLibraryAnalyticsDataProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BooksNotificationViewController analyticsManager](self, "analyticsManager"));
  objc_msgSend(v8, "setupTrackingForRootViewController:", self);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)BooksNotificationViewController;
  -[BooksNotificationViewController viewDidLayoutSubviews](&v15, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BooksNotificationViewController feedViewController](self, "feedViewController"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BooksNotificationViewController view](self, "view"));
    objc_msgSend(v4, "frame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BooksNotificationViewController feedViewController](self, "feedViewController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));
    objc_msgSend(v14, "setFrame:", v6, v8, v10, v12);

  }
  -[TUISyncLayoutController flush](self->_syncLayoutController, "flush");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BooksNotificationViewController;
  -[BooksNotificationViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BooksNotificationViewController analyticsManager](self, "analyticsManager"));
  objc_msgSend(v4, "startSession");

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BooksNotificationViewController;
  -[BooksNotificationViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[BooksNotificationViewController bc_analyticsVisibilityUpdateSubtree](self, "bc_analyticsVisibilityUpdateSubtree");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BooksNotificationViewController;
  -[BooksNotificationViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[BooksNotificationViewController bc_analyticsVisibilitySubtreeWillDisappear](self, "bc_analyticsVisibilitySubtreeWillDisappear");
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BooksNotificationViewController;
  -[BooksNotificationViewController viewDidDisappear:](&v9, "viewDidDisappear:", a3);
  v4 = BooksNotificationLog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "viewDidDisappear", buf, 2u);
  }

  -[BooksNotificationViewController bc_analyticsVisibilitySubtreeDidDisappear](self, "bc_analyticsVisibilitySubtreeDidDisappear");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000321C;
  v7[3] = &unk_1000084A8;
  v7[4] = self;
  objc_msgSend(v6, "performExpiringActivityWithReason:usingBlock:", CFSTR("uploading metrics"), v7);

}

- (void)didReceiveNotification:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  BooksNotificationViewController *v15;
  id v16;
  objc_super v17;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(self), "userNotificationFromNotification:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "videoUrl"));

    if (v8)
    {
      v17.receiver = self;
      v17.super_class = (Class)BooksNotificationViewController;
      -[BooksNotificationViewController didReceiveNotification:](&v17, "didReceiveNotification:", v4);
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[BUBag defaultBag](BUBag, "defaultBag"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ixStoreSheetBooks"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100003420;
      v13[3] = &unk_1000084F8;
      v14 = v7;
      v15 = self;
      v16 = v4;
      objc_msgSend(v12, "valueWithCompletion:", v13);

    }
  }
  else
  {
    v9 = BooksNotificationLog();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10000511C((uint64_t)self, v10);

  }
}

- (void)didReceiveNotificationResponse:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  objc_class *v41;
  NSString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  NSObject *v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  NSObject *v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  void (**v62)(_QWORD, _QWORD);
  void *v63;
  objc_super v64;
  _QWORD v65[5];
  id v66;
  id v67;
  id v68;
  void (**v69)(_QWORD, _QWORD);
  uint64_t v70;
  _QWORD v71[5];
  id v72;
  void (**v73)(_QWORD, _QWORD);
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[3];
  _QWORD v80[3];
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  uint64_t v84;
  _BYTE v85[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_class(self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "notification"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userNotificationFromNotification:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionIdentifier"));
  LODWORD(v9) = objc_msgSend(v11, "isEqualToString:", UNNotificationDefaultActionIdentifier);

  v61 = v7;
  v63 = v10;
  if ((_DWORD)v9)
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "defaultAction"));
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionIdentifier"));
    v14 = objc_msgSend(v13, "isEqualToString:", UNNotificationDismissActionIdentifier);

    if ((v14 & 1) != 0)
    {
      v12 = 0;
    }
    else
    {
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "buttonActions"));
      v12 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
      if (v12)
      {
        v16 = *(_QWORD *)v76;
        while (2)
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(_QWORD *)v76 != v16)
              objc_enumerationMutation(v15);
            v18 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)i);
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier", v61));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionIdentifier"));
            v21 = objc_msgSend(v19, "isEqualToString:", v20);

            if (v21)
            {
              v12 = v18;
              goto LABEL_15;
            }
          }
          v12 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
          if (v12)
            continue;
          break;
        }
LABEL_15:
        v10 = v63;
      }

    }
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "defaultURL", v61));
  if ((objc_msgSend(v22, "bc_isBookStoreAddToWantToReadURL") & 1) != 0)
  {
    v23 = 3;
LABEL_29:
    v25 = BooksNotificationLog();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138543618;
      v82 = v27;
      v83 = 2048;
      v84 = v23;
      v28 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: didReceiveNotificationResponse:completionHandler: Report Figaro metrics for action type %ld", buf, 0x16u);

    }
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "metricsEvent"));
    -[BooksNotificationViewController _reportMetricsEvent:](self, "_reportMetricsEvent:", v29);
    goto LABEL_32;
  }
  if ((objc_msgSend(v22, "bc_isBookStoreBuyNowURL") & 1) != 0)
  {
    v23 = 2;
    goto LABEL_29;
  }
  if ((objc_msgSend(v22, "bc_isBookStoreViewInStoreURL") & 1) != 0)
  {
    v23 = 4;
    goto LABEL_29;
  }
  if ((objc_msgSend(v22, "bc_isBookStoreStartReadingURL") & 1) != 0)
  {
    v23 = 5;
    goto LABEL_29;
  }
  v23 = 6;
  if (objc_msgSend(v22, "bc_isBookStoreStartListeningURL"))
    v24 = 6;
  else
    v24 = 0;
  if ((unint64_t)(v24 - 2) <= 4)
    goto LABEL_29;
  v58 = BooksNotificationLog();
  v29 = objc_claimAutoreleasedReturnValue(v58);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v59 = (void *)objc_opt_class(self);
    *(_DWORD *)buf = 138543618;
    v82 = v59;
    v83 = 2048;
    v84 = v24;
    v60 = v59;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: didReceiveNotificationResponse:completionHandler: Skip Figaro metrics reporting for action type %ld", buf, 0x16u);

  }
  v23 = 0;
LABEL_32:

  -[BooksNotificationViewController _emitNotificationEngagementEventForResponse:notificationAction:actionType:](self, "_emitNotificationEngagementEventForResponse:notificationAction:actionType:", v6, v12, v23);
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metricsEvent"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("details")));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("contentAdamId")));

  v33 = objc_opt_class(NSString);
  v34 = BUDynamicCast(v33, v32);
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  v36 = v35;
  if (v35)
  {
    v37 = v35;
  }
  else
  {
    v38 = objc_opt_class(NSNumber);
    v39 = BUDynamicCast(v38, v32);
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    v37 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "stringValue"));

  }
  v79[0] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
  v79[1] = FBSOpenApplicationOptionKeyUnlockDevice;
  v80[0] = &__kCFBooleanTrue;
  v80[1] = &__kCFBooleanTrue;
  v79[2] = FBSOpenApplicationOptionKeyLaunchOrigin;
  v41 = (objc_class *)objc_opt_class(self);
  v42 = NSStringFromClass(v41);
  v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
  v80[2] = v43;
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v80, v79, 3));

  if ((unint64_t)(v23 - 4) < 3)
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[BooksNotificationViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_100003E6C;
    v65[3] = &unk_100008520;
    v65[4] = self;
    v66 = v37;
    v70 = v23;
    v67 = v22;
    v68 = v44;
    v46 = v62;
    v69 = v62;
    +[BNBookDataStoreServices addStoreIDToWantToRead:tracker:completion:](BNBookDataStoreServices, "addStoreIDToWantToRead:tracker:completion:", v66, v45, v65);

    v47 = v66;
LABEL_40:

    goto LABEL_41;
  }
  if (v23 == 2)
  {
    v49 = BooksNotificationLog();
    v50 = objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      v51 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138543618;
      v82 = v51;
      v83 = 2048;
      v84 = 2;
      v52 = v51;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%{public}@: didReceiveNotificationResponse:completionHandler: handling URL for action type %ld", buf, 0x16u);

    }
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    objc_msgSend(v53, "openSensitiveURL:withOptions:", v22, v44);

    v46 = v62;
    v62[2](v62, 1);
  }
  else
  {
    if (v23 == 3)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[BooksNotificationViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
      v71[0] = _NSConcreteStackBlock;
      v71[1] = 3221225472;
      v71[2] = sub_100003D80;
      v71[3] = &unk_100008458;
      v71[4] = self;
      v72 = v37;
      v74 = 3;
      v73 = v62;
      +[BNBookDataStoreServices addStoreIDToWantToRead:tracker:completion:](BNBookDataStoreServices, "addStoreIDToWantToRead:tracker:completion:", v72, v48, v71);

      v46 = v62;
      v47 = v72;
      goto LABEL_40;
    }
    v54 = BooksNotificationLog();
    v55 = objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      v56 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138543618;
      v82 = v56;
      v83 = 2048;
      v84 = v23;
      v57 = v56;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%{public}@: didReceiveNotificationResponse:completionHandler: Let superclass to handle URL for action type %ld", buf, 0x16u);

    }
    v64.receiver = self;
    v64.super_class = (Class)BooksNotificationViewController;
    v46 = v62;
    -[BooksNotificationViewController didReceiveNotificationResponse:completionHandler:](&v64, "didReceiveNotificationResponse:completionHandler:", v6, v62);
  }
LABEL_41:

}

- (id)appGroupIdentifierForBridge:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BUAppGroup books](BUAppGroup, "books", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  return v4;
}

- (id)windowProviderForBridge:(id)a3
{
  return +[BNJSAWindowProvider sharedInstance](BNJSAWindowProvider, "sharedInstance", a3);
}

- (id)objectRegistrationsForBridge:(id)a3
{
  dispatch_queue_attr_t v4;
  NSObject *v5;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[13];
  _QWORD v16[13];

  v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_USER_INITIATED, 0);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = dispatch_queue_create("TransactionController+JS.workQueue", v7);

  v9 = objc_msgSend(objc_alloc((Class)TUITransactionController), "initWithQueue:", v8);
  v16[0] = CFSTR("notification-extension");
  v15[0] = CFSTR("applicationContext");
  v15[1] = CFSTR("analyticsController");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BooksNotificationViewController analyticsManager](self, "analyticsManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "analyticsController"));
  v16[1] = v11;
  v15[2] = CFSTR("remoteConfigDataContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BCRCDataContainer defaultContainer](BCRCDataContainer, "defaultContainer"));
  v16[2] = v12;
  v16[3] = v9;
  v15[3] = CFSTR("transactionController");
  v15[4] = CFSTR("AlertController");
  v16[4] = objc_opt_class(BSUIAlertController);
  v15[5] = CFSTR("DynamicArray");
  v16[5] = objc_opt_class(BSUIDynamicArray);
  v15[6] = CFSTR("DynamicValue");
  v16[6] = objc_opt_class(BSUIDynamicValue);
  v15[7] = CFSTR("FeedDataRequest");
  v16[7] = objc_opt_class(BSUIFeedDataRequest);
  v15[8] = CFSTR("FeedViewController");
  v16[8] = objc_opt_class(BNFeedViewController);
  v15[9] = CFSTR("NoticeViewController");
  v16[9] = objc_opt_class(BSUINoticeViewController);
  v15[10] = CFSTR("OSFeatureFlags");
  v16[10] = objc_opt_class(_TtC5JSApp17JSAOSFeatureFlags);
  v15[11] = CFSTR("Transaction");
  v16[11] = objc_opt_class(TUITransaction);
  v15[12] = CFSTR("VCStack");
  v16[12] = objc_opt_class(BSUIVCStackManager);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 13));

  return v13;
}

- (void)_setupWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v4 = a3;
  v5 = BSUIGetLibraryItemStateProvider();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BSUITemplate manager](BSUITemplate, "manager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dynamicRegistry"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stateCenter"));
  objc_msgSend(v8, "registerStateProvider:forKind:", v9, CFSTR("libraryItem"));

  v10 = +[BCAnalyticsVisibilityPresentationNotifier sharedInstance](BCAnalyticsVisibilityPresentationNotifier, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100004388;
  v14[3] = &unk_100008570;
  v15 = v7;
  v16 = v4;
  v12 = v4;
  v13 = v7;
  objc_msgSend(v11, "initializeEnvironmentWithDataSource:completion:", self, v14);

}

- (void)_renderUserNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BNFeedViewController *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  const __CFString *v19;
  void *v20;
  uint8_t buf[4];
  BooksNotificationViewController *v22;
  __int16 v23;
  void *v24;

  v4 = a3;
  v5 = BooksNotificationLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "logKey"));
    *(_DWORD *)buf = 138543618;
    v22 = self;
    v23 = 2114;
    v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Will render notification", buf, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "createUNNotificationActions"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BooksNotificationViewController extensionContext](self, "extensionContext"));
    objc_msgSend(v9, "setNotificationActions:", v8);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "defaultAction"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "defaultURL"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "absoluteString"));

  v19 = CFSTR("url");
  v20 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
  v14 = -[BNFeedViewController initWithOptions:]([BNFeedViewController alloc], "initWithOptions:", v13);
  -[BooksNotificationViewController setFeedViewController:](self, "setFeedViewController:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BooksNotificationViewController feedViewController](self, "feedViewController"));
  objc_msgSend(v15, "setModalPresentationStyle:", 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BooksNotificationViewController feedViewController](self, "feedViewController"));
  objc_msgSend(v16, "setNotificationDelegate:", self);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BooksNotificationViewController feedViewController](self, "feedViewController"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000469C;
  v18[3] = &unk_100008598;
  v18[4] = self;
  -[BooksNotificationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 0, v18);

}

- (BOOL)_isURLValid:(id)a3 hostPatterns:(id)a4 pathPatterns:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned __int8 v13;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "host"));
  v11 = objc_msgSend(v10, "bc_hasMatchInRegexPatterns:", v9);

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
    v13 = objc_msgSend(v12, "bc_hasMatchInRegexPatterns:", v8);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)_reportMetricsEvent:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[5];

  if (a3)
  {
    v4 = a3;
    v5 = objc_alloc_init((Class)AMSMetrics);
    objc_msgSend(v5, "enqueueEvent:", v4);

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "flush"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100004864;
    v7[3] = &unk_1000085C0;
    v7[4] = self;
    objc_msgSend(v6, "addFinishBlock:", v7);

  }
}

- (void)_emitNotificationEngagementEventForResponse:(id)a3 notificationAction:(id)a4 actionType:(int64_t)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  __CFString *v36;
  __CFString *v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "notification"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "request"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "content"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "metricsEvent"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "underlyingDictionary"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("details")));
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("contentAdamId")));

  v14 = objc_opt_class(NSString);
  v15 = BUDynamicCast(v14, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v47 = (void *)v13;
  if (v16
    || (v17 = objc_opt_class(NSNumber),
        v18 = BUDynamicCast(v17, v13),
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18),
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringValue")),
        v19,
        v16))
  {
    v52 = v16;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v52, 1));
  }
  else
  {
    v20 = &__NSArray0__struct;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "metricsEvent"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "underlyingDictionary"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("notificationId")));
  v24 = v23;
  v49 = v8;
  if (v23)
    v25 = v23;
  else
    v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v26 = v25;

  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "body"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "metricsEvent"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "underlyingDictionary"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("details")));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("notificationSubtype")));

  v48 = v9;
  if ((objc_msgSend(v30, "isEqualToString:", CFSTR("newBookAuthor")) & 1) != 0)
    v31 = 2;
  else
    v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("newBookSeries"));
  v44 = v26;
  v32 = objc_msgSend(objc_alloc((Class)BANotificationData), "initWithNotificationContentID:notificationID:notificationType:recoType:goalType:titleCode:title:messageCode:message:", v20, v26, 1, v31, 0, &stru_100008A68, v51, &stru_100008A68, v50);
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "defaultURL"));
  v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "absoluteString"));
  v35 = (void *)v34;
  if (v34)
    v36 = (__CFString *)v34;
  else
    v36 = &stru_100008A68;
  v37 = v36;

  v38 = 0;
  if ((unint64_t)(a5 - 1) <= 3)
    v38 = qword_1000067B0[a5 - 1];
  v39 = objc_msgSend(objc_alloc((Class)BANotificationEngagementData), "initWithActionType:actionUrl:targetID:targetType:", a5, v37, v20, v38);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[BooksNotificationViewController analyticsManager](self, "analyticsManager"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "analyticsController"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "applicationTracker"));

  v43 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
  objc_msgSend(v43, "emitNotificationEngagementEventWithTracker:engagementData:notificationData:", v42, v39, v32);

}

- (void)feedViewController:(id)a3 willTransitionToContentHeight:(double)a4
{
  id v6;
  CGRect v7;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BooksNotificationViewController viewIfLoaded](self, "viewIfLoaded", a3));
  objc_msgSend(v6, "frame");
  -[BooksNotificationViewController setPreferredContentSize:](self, "setPreferredContentSize:", CGRectGetWidth(v7), a4);

}

- (void)syncLayoutControllerNeedsFlushing:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BooksNotificationViewController view](self, "view", a3));
  objc_msgSend(v3, "setNeedsLayout");

}

- (TUISyncLayoutController)syncLayoutController
{
  return self->_syncLayoutController;
}

- (BNFeedViewController)feedViewController
{
  return self->_feedViewController;
}

- (void)setFeedViewController:(id)a3
{
  objc_storeStrong((id *)&self->_feedViewController, a3);
}

- (BCAppAnalyticsExtensionManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_feedViewController, 0);
  objc_storeStrong((id *)&self->_syncLayoutController, 0);
}

@end
