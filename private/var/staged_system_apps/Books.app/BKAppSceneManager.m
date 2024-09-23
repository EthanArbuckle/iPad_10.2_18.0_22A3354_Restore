@implementation BKAppSceneManager

- (id)_primarySceneControllerObject
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_opt_class(BKSceneController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager primarySceneController](self, "primarySceneController"));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (void)_setupURLHandler
{
  BKAppURLHandler *v3;
  void *v4;
  NSObject *v5;
  BKAppURLHandler *v6;

  v3 = [BKAppURLHandler alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager mainLibrary](self, "mainLibrary"));
  v6 = -[BKAppURLHandler initWithLibraryAssetProvider:](v3, "initWithLibraryAssetProvider:", v4);

  -[BKAppURLHandler setDelegate:](v6, "setDelegate:", self);
  -[BKAppSceneManager setUrlHandler:](self, "setUrlHandler:", v6);
  v5 = objc_claimAutoreleasedReturnValue(-[BKAppSceneManager urlHandlingQueue](self, "urlHandlingQueue"));
  dispatch_activate(v5);

}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v5 = a5;
  v17 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "viewIfLoaded"));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window"));
  if (!v10)
    goto LABEL_6;
  v11 = (void *)v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "parentViewController"));
  v13 = objc_opt_class(BSUIRootBarWrapperViewController);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) == 0)
  {

    goto LABEL_6;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "transitionCoordinator"));

  if (v14)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager rootBarCoordinator](self, "rootBarCoordinator"));
    objc_msgSend(v9, "dismissCardStackForCurrentlySelected");
LABEL_6:

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager _primarySceneControllerObject](self, "_primarySceneControllerObject"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mainFlowController"));
  objc_msgSend(v16, "navigationController:willShowViewController:animated:", v17, v8, v5);

}

- (void)setScriptDataSource:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  void *v20;
  int v21;
  const char *v22;

  v6 = a3;
  v7 = a4;
  v8 = byte_1009F5010;
  if (byte_1009F5010 == 1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[JSAHotReloadController sharedController](JSAHotReloadController, "sharedController"));
    v10 = objc_msgSend(v9, "isHotReloading") ^ 1;

  }
  else
  {
    v10 = 1;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1009F5008, "value"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "context"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "virtualMachine"));
  objc_msgSend(v13, "removeManagedReference:withOwner:", qword_1009F5008, self);

  v14 = objc_claimAutoreleasedReturnValue(+[JSManagedValue managedValueWithValue:andOwner:](JSManagedValue, "managedValueWithValue:andOwner:", v6, self));
  v15 = (void *)qword_1009F5008;
  qword_1009F5008 = v14;

  if ((v8 & 1) == 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v16, "addObserver:selector:name:object:", self, "_bagDidUpdate:", AMSBagChangedNotification, 0);

    byte_1009F5010 = 1;
  }
  if (v10)
  {
    v17 = JSALog();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136446210;
      v22 = "-[BKAppSceneManager(BKTabBarControllerJSApp) setScriptDataSource:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}s Reloading RootBarItems due to new JS", (uint8_t *)&v21, 0xCu);
    }

    -[BKAppSceneManager reloadStandardItemsWithAnimated:completion:](self, "reloadStandardItemsWithAnimated:completion:", 1, v7);
  }
  else
  {
    v19 = objc_retainBlock(v7);
    v20 = v19;
    if (v19)
      (*((void (**)(id))v19 + 2))(v19);

  }
}

- (id)classRegistrations
{
  _QWORD v3[30];
  _QWORD v4[30];

  v3[0] = CFSTR("AdjustGoalModalViewController");
  v4[0] = objc_opt_class(BKAdjustGoalModalViewController);
  v3[1] = CFSTR("AlertController");
  v4[1] = objc_opt_class(BSUIAlertController);
  v3[2] = CFSTR("CloudRatingsManager");
  v4[2] = objc_opt_class(BSUICloudAssetRatingsManager);
  v3[3] = CFSTR("ContentTasteController");
  v4[3] = objc_opt_class(BSUIContentTasteController);
  v3[4] = CFSTR("ContextMenuProvider");
  v4[4] = objc_opt_class(BKContextMenuProvider);
  v3[5] = CFSTR("ContinueReadingBooksProvider");
  v4[5] = objc_opt_class(BKContinueReadingBooksProvider);
  v3[6] = CFSTR("DynamicArray");
  v4[6] = objc_opt_class(BSUIDynamicArray);
  v3[7] = CFSTR("DynamicValue");
  v4[7] = objc_opt_class(BSUIDynamicValue);
  v3[8] = CFSTR("FeedDataRequest");
  v4[8] = objc_opt_class(BSUIFeedDataRequest);
  v3[9] = CFSTR("FeedViewController");
  v4[9] = objc_opt_class(BSUIFeedViewController);
  v3[10] = CFSTR("GoalPickerViewController");
  v4[10] = objc_opt_class(BKGoalPickerViewController);
  v3[11] = CFSTR("LanguageUtilities");
  v4[11] = objc_opt_class(BKLanguageUtilities);
  v3[12] = CFSTR("LibraryProvider");
  v4[12] = objc_opt_class(BKLibraryProvider);
  v3[13] = CFSTR("NoticeViewController");
  v4[13] = objc_opt_class(BSUINoticeViewController);
  v3[14] = CFSTR("NotificationManager");
  v4[14] = objc_opt_class(BKNotificationManager);
  v3[15] = CFSTR("OSFeatureFlags");
  v4[15] = objc_opt_class(_TtC5JSApp17JSAOSFeatureFlags);
  v3[16] = CFSTR("PPT");
  v4[16] = objc_opt_class(BCPPTConfig);
  v3[17] = CFSTR("PreviouslyReadBooksProvider");
  v4[17] = objc_opt_class(BKPreviouslyReadBooksProvider);
  v3[18] = CFSTR("PurchaseManager");
  v4[18] = objc_opt_class(BSUIPurchaseManager);
  v3[19] = CFSTR("QueryableLibraryItemStateWorker");
  v4[19] = objc_opt_class(BKScriptQueryableLibraryItemStateWorker);
  v3[20] = CFSTR("ReadingNowConfiguration");
  v4[20] = objc_opt_class(BCJSConfiguration);
  v3[21] = CFSTR("RecentBooksProvider");
  v4[21] = objc_opt_class(BKRecentBooksProvider);
  v3[22] = CFSTR("RemoteConfigurationManager");
  v4[22] = objc_opt_class(BRCConfigurationManager);
  v3[23] = CFSTR("SearchFeedViewController");
  v4[23] = objc_opt_class(_TtC11BookStoreUI28BSUISearchFeedViewController);
  v3[24] = CFSTR("ScreenShotViewController");
  v4[24] = objc_opt_class(BSUIScreenshotViewController);
  v3[25] = CFSTR("SharedWithYouProvider");
  v4[25] = objc_opt_class(_TtC5Books23BKSharedWithYouProvider);
  v3[26] = CFSTR("StoreServices");
  v4[26] = objc_opt_class(BSUIStoreServices);
  v3[27] = CFSTR("Transaction");
  v4[27] = objc_opt_class(TUITransaction);
  v3[28] = CFSTR("VCStack");
  v4[28] = objc_opt_class(BSUIVCStackManager);
  v3[29] = CFSTR("VideoStateProvider");
  v4[29] = objc_opt_class(BSUIVideoStateProvider);
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 30));
}

- (void)viewControllerForItem:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  dispatch_queue_global_t global_queue;
  NSObject *v31;
  id v32;
  id v33;
  uint64_t v34;
  NSObject *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  void (**v40)(id, void *);
  _QWORD v41[4];
  _QWORD v42[4];
  uint8_t buf[4];
  id v44;
  __int16 v45;
  id v46;
  _QWORD v47[9];
  _QWORD v48[9];

  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  if (objc_msgSend(v5, "isLibraryCollection"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryBookshelfController libraryViewControllerWithIdentifier:](BKLibraryBookshelfController, "libraryViewControllerWithIdentifier:", v7));
    v6[2](v6, v8);

  }
  else if (qword_1009F5008)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tabBarTitle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[BKRootBarItemsProvider HomeIdentifier](BKRootBarItemsProvider, "HomeIdentifier"));
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    if (v12)
    {
      v47[0] = BSUIFeedOptionsKeyContextMenuProvider;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[BKContextMenuProvider sharedProvider](BKContextMenuProvider, "sharedProvider"));
      v48[0] = v13;
      v47[1] = CFSTR("identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
      v48[1] = v14;
      v48[2] = &__kCFBooleanTrue;
      v47[2] = CFSTR("isInitialFeed");
      v47[3] = CFSTR("isRootFeed");
      v48[3] = &__kCFBooleanTrue;
      v48[4] = &__kCFBooleanTrue;
      v47[4] = CFSTR("deferUIUpdateUntilInitialContentReady");
      v47[5] = CFSTR("reading-now-homepage");
      v48[5] = &__kCFBooleanTrue;
      v47[6] = CFSTR("tab");
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
      v48[6] = v15;
      v48[7] = v9;
      v47[7] = CFSTR("title");
      v47[8] = CFSTR("url");
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "url"));
      v17 = v16;
      if (!v16)
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      v48[8] = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v48, v47, 9));
      if (!v16)

      v19 = objc_msgSend(objc_alloc((Class)BSUIFeedViewController), "initWithOptions:", v18);
      v20 = JSALog();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v44 = v19;
        v45 = 2114;
        v46 = v5;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "VC %{public}@ for %{public}@", buf, 0x16u);
      }

      v6[2](v6, v19);
    }
    else if (qword_1009F5008)
    {
      v41[0] = CFSTR("identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
      v42[0] = v24;
      v41[1] = CFSTR("isDefault");
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v5, "isPlaceholder")));
      v42[1] = v25;
      v41[2] = CFSTR("url");
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "url"));
      v27 = v26;
      if (!v26)
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      v41[3] = CFSTR("title");
      v42[2] = v27;
      v42[3] = v9;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v42, v41, 4));
      if (!v26)

      v29 = (id)qword_1009F5008;
      global_queue = dispatch_get_global_queue(33, 0);
      v31 = objc_claimAutoreleasedReturnValue(global_queue);
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_1001180EC;
      v36[3] = &unk_1008E8EE0;
      v37 = v29;
      v38 = v28;
      v39 = v5;
      v40 = v6;
      v32 = v28;
      v33 = v29;
      dispatch_async(v31, v36);

    }
    else
    {
      v34 = JSALog();
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v44 = v5;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "No VC for now due to lack of JS data source: %{public}@", buf, 0xCu);
      }

      v6[2](v6, 0);
    }

  }
  else
  {
    v22 = JSALog();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v44 = v5;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "No VC for now due to lack of JS data source: %{public}@", buf, 0xCu);
    }

    v6[2](v6, 0);
  }

}

- (id)objectRegistrationsForBridge:(id)a3
{
  BKJSAAppController *v4;
  void *v5;
  BKJSAAppController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  dispatch_queue_attr_t v13;
  NSObject *v14;
  dispatch_queue_attr_t v15;
  NSObject *v16;
  dispatch_queue_t v17;
  id v18;
  BKBookRecommendationProvider *v19;
  BKGenreRecommendationProvider *v20;
  BKMediaTypeRecommendationProvider *v21;
  uint64_t v22;
  NSObject *v23;
  BKMediaTypeRecommendationProvider *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  BKMediaTypeRecommendationProvider *v31;
  void *v32;
  BKGenreRecommendationProvider *v33;
  BKJSAAppController *v34;
  void *v35;
  dispatch_queue_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[14];
  _QWORD v42[14];
  uint8_t buf[4];
  BKJSAAppController *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  id v56;
  __int16 v57;
  void *v58;

  v4 = [BKJSAAppController alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager jetActionHandler](self, "jetActionHandler"));
  v6 = -[BKJSAAppController initWithSceneManager:jetActionHandler:](v4, "initWithSceneManager:jetActionHandler:", self, v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager minifiedPresenter](self, "minifiedPresenter"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentBookProvider"));

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager jsaLibraryManager](self, "jsaLibraryManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager serviceCenter](self, "serviceCenter"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "priceTrackingService"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager serviceCenter](self, "serviceCenter"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "readingActivityService"));

  v11 = objc_claimAutoreleasedReturnValue(+[BCRCDataContainer defaultContainer](BCRCDataContainer, "defaultContainer"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager serviceCenter](self, "serviceCenter"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "yearInReviewEligibilityService"));

  v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_USER_INITIATED, 0);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = dispatch_queue_create("TransactionController+JS.workQueue", v16);

  v36 = v17;
  v18 = objc_msgSend(objc_alloc((Class)TUITransactionController), "initWithQueue:", v17);
  v19 = objc_alloc_init(BKBookRecommendationProvider);
  v20 = objc_alloc_init(BKGenreRecommendationProvider);
  v21 = objc_alloc_init(BKMediaTypeRecommendationProvider);
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[BKTVAppService shared](BKTVAppService, "shared"));
  if (!v6 || !v40 || !v39 || !v9 || !v38 || !v11 || !v18 || !v19 || !v20 || !v21 || !v37)
  {
    v22 = JSALog();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138414082;
      v44 = v6;
      v45 = 2112;
      v46 = v40;
      v47 = 2112;
      v48 = v39;
      v49 = 2112;
      v50 = v9;
      v51 = 2112;
      v52 = v38;
      v53 = 2112;
      v54 = v11;
      v55 = 2112;
      v56 = v18;
      v57 = 2112;
      v58 = v37;
      _os_log_fault_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "Some of the JS native objects are nil. appController: %@, currentBookProvider: %@, jsaLibraryManager: %@,, priceTrackingService: %@ readingActivityService: %@, remoteConfigDataContainer: %@, transactionController: %@, yearInReviewEligibilityService: %@", buf, 0x52u);
    }

  }
  v41[0] = CFSTR("appController");
  v41[1] = CFSTR("bookRecommendationProvider");
  v42[0] = v6;
  v42[1] = v19;
  v42[2] = v40;
  v41[2] = CFSTR("currentBookProvider");
  v41[3] = CFSTR("engagementEventController");
  v24 = v21;
  v31 = v21;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager engagementManager](self, "engagementManager"));
  v34 = v6;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "eventController"));
  v42[3] = v26;
  v42[4] = v20;
  v33 = v20;
  v41[4] = CFSTR("genreRecommendationProvider");
  v41[5] = CFSTR("libraryInterface");
  v42[5] = v39;
  v42[6] = v24;
  v41[6] = CFSTR("mediaTypeRecommendationProvider");
  v41[7] = CFSTR("priceTrackingService");
  v42[7] = v9;
  v42[8] = v38;
  v41[8] = CFSTR("readingActivityStateProvider");
  v41[9] = CFSTR("remoteConfigDataContainer");
  v42[9] = v11;
  v41[10] = CFSTR("sessionDonor");
  v32 = (void *)v11;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager engagementManager](self, "engagementManager"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "sessionDonor"));
  v42[10] = v28;
  v42[11] = v18;
  v41[11] = CFSTR("transactionController");
  v41[12] = CFSTR("TVAppService");
  v41[13] = CFSTR("yearInReviewEligibilityService");
  v42[12] = v35;
  v42[13] = v37;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v42, v41, 14));

  return v29;
}

- (BKServiceCenter)serviceCenter
{
  return self->_serviceCenter;
}

- (BKEngagementManager)engagementManager
{
  return self->_engagementManager;
}

- (void)reloadStandardItemsWithAnimated:(BOOL)a3 completion:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v5 = a4;
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100051478;
  v14[3] = &unk_1008E7F50;
  objc_copyWeak(&v16, &location);
  v6 = v5;
  v15 = v6;
  v7 = objc_retainBlock(v14);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002F010;
  v10[3] = &unk_1008EB3A0;
  objc_copyWeak(&v13, &location);
  v8 = v7;
  v11 = v8;
  v9 = v6;
  v12 = v9;
  -[BKAppSceneManager _retrieveTabsWithCompletion:](self, "_retrieveTabsWithCompletion:", v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)_retrieveTabsWithCompletion:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];

  v3 = a3;
  v4 = JSALog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Asking bag for tabs", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BUBag defaultBag](BUBag, "defaultBag"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "booksTabs"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002EEEC;
  v9[3] = &unk_1008EB3F0;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v7, "jsa_valueWithCompletion:", v9);

}

- (id)navigationControllerForItem:(id)a3
{
  id v4;
  unsigned int v5;
  __objc2_class **v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;

  v4 = a3;
  v5 = objc_msgSend(v4, "isLibraryCollection");
  v6 = off_1008E52A8;
  if (!v5)
    v6 = (__objc2_class **)BSUIFeedNavigationController_ptr;
  v7 = (void *)objc_opt_new(*v6);
  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "setIsRoot:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager primarySceneController](self, "primarySceneController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bk_window"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rootViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ba_effectiveAnalyticsTracker"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "suggestedTrackerName"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "chainWithName:", v12));

  objc_msgSend(v7, "ba_setAnalyticsTracker:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));

  v15 = +[BKRootBarItemsProvider tabTypeFor:](BKRootBarItemsProvider, "tabTypeFor:", v14);
  objc_msgSend(v13, "pushTabDataWithType:file:line:", v15, CFSTR("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKAppSceneManager+BKTabBarControllerJSApp.m"), 202);

  return v7;
}

- (id)flowControllers
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager sceneFlowController](self, "sceneFlowController"));
  if (v4)
    objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager storeFlowController](self, "storeFlowController"));
  if (v5)
    objc_msgSend(v3, "addObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager minifiedFlowController](self, "minifiedFlowController"));
  if (v6)
    objc_msgSend(v3, "addObject:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager bookFlowController](self, "bookFlowController"));
  if (v7)
    objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager libraryCollectionsFlowController](self, "libraryCollectionsFlowController"));
  if (v8)
    objc_msgSend(v3, "addObject:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager jetActionHandler](self, "jetActionHandler"));
  if (v9)
    objc_msgSend(v3, "addObject:", v9);

  return v3;
}

- (BKJSStoreFlowController)storeFlowController
{
  BKJSStoreFlowController *storeFlowController;
  BKJSStoreFlowController *v4;
  BKJSStoreFlowController *v5;

  storeFlowController = self->_storeFlowController;
  if (!storeFlowController)
  {
    v4 = objc_alloc_init(BKJSStoreFlowController);
    v5 = self->_storeFlowController;
    self->_storeFlowController = v4;

    storeFlowController = self->_storeFlowController;
  }
  return storeFlowController;
}

- (BKMinifiedFlowController)minifiedFlowController
{
  return self->_minifiedFlowController;
}

- (BKLibraryCollectionsFlowController)libraryCollectionsFlowController
{
  BKLibraryCollectionsFlowController *libraryCollectionsFlowController;
  BKLibraryCollectionsFlowController *v4;
  void *v5;
  BKLibraryCollectionsFlowController *v6;
  BKLibraryCollectionsFlowController *v7;

  libraryCollectionsFlowController = self->_libraryCollectionsFlowController;
  if (!libraryCollectionsFlowController)
  {
    v4 = [BKLibraryCollectionsFlowController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v6 = -[BKLibraryCollectionsFlowController initWithLibraryAssetProvider:](v4, "initWithLibraryAssetProvider:", v5);
    v7 = self->_libraryCollectionsFlowController;
    self->_libraryCollectionsFlowController = v6;

    libraryCollectionsFlowController = self->_libraryCollectionsFlowController;
  }
  return libraryCollectionsFlowController;
}

- (BKBookFlowController)bookFlowController
{
  BKBookFlowController *bookFlowController;
  BKBookFlowController *v4;
  void *v5;
  BKBookFlowController *v6;
  BKBookFlowController *v7;
  void *v8;
  void *v9;
  void *v10;

  bookFlowController = self->_bookFlowController;
  if (!bookFlowController)
  {
    v4 = [BKBookFlowController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v6 = -[BKBookFlowController initWithLibraryAssetProvider:](v4, "initWithLibraryAssetProvider:", v5);
    v7 = self->_bookFlowController;
    self->_bookFlowController = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager sceneFlowController](self, "sceneFlowController"));
    -[BKBookFlowController setSceneHosting:](self->_bookFlowController, "setSceneHosting:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager minifiedFlowController](self, "minifiedFlowController"));
    -[BKBookFlowController setMinifiedPresenter:](self->_bookFlowController, "setMinifiedPresenter:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager storePresenter](self, "storePresenter"));
    -[BKBookFlowController setStorePresenter:](self->_bookFlowController, "setStorePresenter:", v10);

    bookFlowController = self->_bookFlowController;
  }
  return bookFlowController;
}

- (id)currentSceneController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager sceneFlowController](self, "sceneFlowController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentSceneController"));

  return v3;
}

- (id)mainFlowController
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = objc_opt_class(BKSceneController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager primarySceneController](self, "primarySceneController"));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mainFlowController"));
  return v7;
}

- (id)primarySceneController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager sceneFlowController](self, "sceneFlowController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "primarySceneController"));

  return v3;
}

- (BKSceneFlowController)sceneFlowController
{
  return self->_sceneFlowController;
}

- (void)requestTabBarSceneController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager sceneFlowController](self, "sceneFlowController"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004DDB0;
  v7[3] = &unk_1008EB6F8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "requestTabBarSceneController:", v7);

}

- (void)setTabsAreLoaded:(BOOL)a3
{
  self->_tabsAreLoaded = a3;
}

- (void)routeScene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager sceneFlowController](self, "sceneFlowController"));
  objc_msgSend(v11, "routeScene:willConnectToSession:options:", v10, v9, v8);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager launchCoordinator](self, "launchCoordinator"));
  LOBYTE(v10) = objc_msgSend(v12, "appLaunchCoordinatorIsConditionSatisfied:", 6);

  if ((v10 & 1) == 0)
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager launchCoordinator](self, "launchCoordinator"));
    objc_msgSend(v13, "signalConditionSatisfied:", 6);

  }
}

- (BKAppLaunchCoordinator)launchCoordinator
{
  return self->_launchCoordinator;
}

- (BOOL)shouldOpenLastBook
{
  unsigned int v3;
  void *v4;
  void *v5;

  if ((objc_msgSend(UIApp, "launchedToTest") & 1) != 0)
  {
    LOBYTE(v3) = +[BCPPTConfig extendedLaunchTestDestinationIsBook](BCPPTConfig, "extendedLaunchTestDestinationIsBook");
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
    if ((objc_msgSend(v4, "suppressOpenLastBook") & 1) != 0)
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager primarySceneController](self, "primarySceneController"));
      v3 = objc_msgSend(v5, "willAttemptBookReopen") ^ 1;

    }
  }
  return v3;
}

- (id)rootBarCoordinatorForSceneController:(id)a3
{
  id v4;
  void *v5;
  BKRootBarCoordinator *v6;
  void *v7;
  BKRootBarCoordinator *v8;
  id v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager rootBarCoordinator](self, "rootBarCoordinator"));

  if (!v5)
  {
    v6 = [BKRootBarCoordinator alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager viewControllerProvider](self, "viewControllerProvider"));
    v8 = -[BKRootBarCoordinator initWithSceneController:presentersProvider:viewControllerProvider:](v6, "initWithSceneController:presentersProvider:viewControllerProvider:", v4, self, v7);
    -[BKAppSceneManager setRootBarCoordinator:](self, "setRootBarCoordinator:", v8);

    v9 = +[JSABridge sharedInstance](JSABridge, "sharedInstance");
    +[JSAMetricsAppLaunchEvent updateRequiredBlockingBagLoad:](JSAMetricsAppLaunchEvent, "updateRequiredBlockingBagLoad:", 0);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager rootBarCoordinator](self, "rootBarCoordinator"));

  return v10;
}

- (BKRootBarCoordinating)rootBarCoordinator
{
  return self->_rootBarCoordinator;
}

- (id)windowProviderForBridge:(id)a3
{
  return -[BKAppSceneManager windowProvider](self, "windowProvider", a3);
}

- (void)_bagDidUpdate:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  const char *v7;

  v4 = JSALog(self, a2, a3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446210;
    v7 = "-[BKAppSceneManager(BKTabBarControllerJSApp) _bagDidUpdate:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s Reloading RootBarItems due to bag change", (uint8_t *)&v6, 0xCu);
  }

  -[BKAppSceneManager reloadStandardItemsWithAnimated:completion:](self, "reloadStandardItemsWithAnimated:completion:", 1, &stru_1008EB410);
}

- (BKJSAAppWindowProvider)windowProvider
{
  return self->_windowProvider;
}

- (BKWelcomePresenting)welcomePresenter
{
  return self->_welcomePresenter;
}

- (BCTransactionQueue)userTransactionQueue
{
  return self->_userTransactionQueue;
}

- (OS_dispatch_queue)urlHandlingQueue
{
  return self->_urlHandlingQueue;
}

- (void)setWindowProvider:(id)a3
{
  objc_storeStrong((id *)&self->_windowProvider, a3);
}

- (void)setWelcomePresenter:(id)a3
{
  objc_storeStrong((id *)&self->_welcomePresenter, a3);
}

- (void)setUrlHandler:(id)a3
{
  objc_storeStrong((id *)&self->_urlHandler, a3);
}

- (void)setServiceCenter:(id)a3
{
  objc_storeStrong((id *)&self->_serviceCenter, a3);
}

- (void)setRootBarCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_rootBarCoordinator, a3);
  -[BKAppSceneManager _setupMinibarContainerView](self, "_setupMinibarContainerView");
}

- (void)setPushLargeCoverForNextHandleURLBookOpen:(BOOL)a3
{
  self->_pushLargeCoverForNextHandleURLBookOpen = a3;
}

- (void)setPendingCriticalAlertAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_pendingCriticalAlertAssertion, a3);
}

- (void)setJsaLibraryManager:(id)a3
{
  objc_storeStrong((id *)&self->_jsaLibraryManager, a3);
}

- (void)setInitialUserTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_initialUserTransaction, a3);
}

- (void)setEngagementManager:(id)a3
{
  objc_storeStrong((id *)&self->_engagementManager, a3);
}

- (BUAssertion)pendingCriticalAlertAssertion
{
  return self->_pendingCriticalAlertAssertion;
}

- (id)newTransactionWithName:(id)a3 originatingSceneController:(id)a4 targetSceneDescriptor:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager userTransactionQueue](self, "userTransactionQueue"));
  v12 = objc_msgSend(v11, "newTransactionWithName:info:context:originatingSceneController:targetSceneDescriptor:", v10, 0, 0, v9, v8);

  return v12;
}

- (id)newShowURLTransactionWithOriginatingSceneController:(id)a3 targetSceneDescriptor:(id)a4
{
  return -[BKAppSceneManager newTransactionWithName:originatingSceneController:targetSceneDescriptor:](self, "newTransactionWithName:originatingSceneController:targetSceneDescriptor:", BCTransactionNameShowURL, a3, a4);
}

- (id)minifiedFlowControllerPresentedAssetID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager primarySceneController](self, "primarySceneController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager bookFlowController](self, "bookFlowController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bookPresenterCurrentlyOpenBookForSingleScene:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assetPresenterAssetID"));

  return v7;
}

- (id)minifiedFlowControllerMinibarContainingViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager rootBarCoordinator](self, "rootBarCoordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootViewController"));

  return v3;
}

- (id)mainLibrary
{
  return +[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager");
}

- (BKJSALibraryManager)jsaLibraryManager
{
  return self->_jsaLibraryManager;
}

- (void)enumerateSceneController:(id)a3 includeHidden:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager sceneFlowController](self, "sceneFlowController"));
  objc_msgSend(v7, "enumerateSceneController:includeHidden:", v6, v4);

}

- (BKCriticalAlertCoordinating)criticalAlertCoordinator
{
  return self->_criticalAlertCoordinator;
}

- (void)attemptToPresentStoreReview
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKAudiobookPlayer sharedInstance](BKAudiobookPlayer, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentAudiobook"));

  if (!v4)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager anySceneController](self, "anySceneController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "keyWindowAnalyticsTracker"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager appStoreReviewManager](self, "appStoreReviewManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scene"));
    objc_msgSend(v7, "attemptToPresentStoreReviewIn:tracker:", v8, v6);

  }
}

- (void)application:(id)a3 didDiscardSceneSessions:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager sceneFlowController](self, "sceneFlowController"));
  objc_msgSend(v8, "application:didDiscardSceneSessions:", v7, v6);

}

- (BKAppStoreReviewManager)appStoreReviewManager
{
  BKAppStoreReviewManager *appStoreReviewManager;
  BKAppStoreReviewManager *v4;
  BKAppStoreReviewManager *v5;

  appStoreReviewManager = self->_appStoreReviewManager;
  if (!appStoreReviewManager)
  {
    v4 = objc_alloc_init(BKAppStoreReviewManager);
    v5 = self->_appStoreReviewManager;
    self->_appStoreReviewManager = v4;

    appStoreReviewManager = self->_appStoreReviewManager;
  }
  return appStoreReviewManager;
}

- (id)anySceneController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager sceneFlowController](self, "sceneFlowController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "anySceneController"));

  return v3;
}

- (void)analyticsVisibilityUpdate
{
  -[BKAppSceneManager enumerateSceneController:includeHidden:](self, "enumerateSceneController:includeHidden:", &stru_1008EDCD8, 0);
}

- (id)_welcomeItems
{
  NSMutableArray *v2;
  BKWelcomeGDPRItem *v3;
  BKWelcomeNotificationWarmingItem *v4;

  v2 = objc_opt_new(NSMutableArray);
  v3 = objc_alloc_init(BKWelcomeGDPRItem);
  -[NSMutableArray addObject:](v2, "addObject:", v3);

  v4 = objc_alloc_init(BKWelcomeNotificationWarmingItem);
  -[NSMutableArray addObject:](v2, "addObject:", v4);

  return v2;
}

- (void)_showMainViewController
{
  uint64_t v3;
  NSObject *v4;
  unsigned __int8 v5;
  void *v6;
  _QWORD v7[5];
  unsigned __int8 v8;
  uint8_t buf[16];

  v3 = BCSceneLog(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "_showMainViewController", buf, 2u);
  }

  kdebug_trace(725353700, 0, 0, 0, 0);
  v5 = -[BKWelcomeScreenManager didShowWelcome](self->_welcomeScreenManager, "didShowWelcome");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager launchCoordinator](self, "launchCoordinator"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008DF0;
  v7[3] = &unk_1008E9C48;
  v7[4] = self;
  v8 = v5;
  objc_msgSend(v6, "signalConditionSatisfied:notifyWithTimeout:blockID:block:", 2, CFSTR("showMainViewController"), v7, 3.0);

}

- (void)_showMainViewControllerOrWelcomeScreen
{
  void *v3;
  _QWORD v4[5];

  if (self->_welcomeScreenManager)
  {
    -[BKAppSceneManager _showMainViewControllerOrWelcomeScreenNow](self, "_showMainViewControllerOrWelcomeScreenNow");
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager launchCoordinator](self, "launchCoordinator"));
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10019CB08;
    v4[3] = &unk_1008E77C8;
    v4[4] = self;
    objc_msgSend(v3, "appLaunchCoordinatorOnConditionMask:blockID:performBlock:", 2112, CFSTR("_showMainViewControllerOrWelcomeScreen"), v4);

  }
}

- (void)_showMainViewControllerOrWelcomeScreenNow
{
  uint64_t v3;
  NSObject *v4;
  BKWelcomeScreenManager *welcomeScreenManager;
  _QWORD v6[5];
  uint8_t buf[16];

  v3 = BCSceneLog(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "_showMainViewControllerOrWelcomeScreenNow", buf, 2u);
  }

  kdebug_trace(725353712, 66, 0, 0, 0);
  welcomeScreenManager = self->_welcomeScreenManager;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100017AFC;
  v6[3] = &unk_1008EDE60;
  v6[4] = self;
  -[BKWelcomeScreenManager runWithCompletion:](welcomeScreenManager, "runWithCompletion:", v6);
}

- (void)_setupWelcomeScreenWithPresenterIfNeeded:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  BOOL v11;
  _QWORD *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  BOOL v16;
  uint8_t buf[4];
  id v18;

  v4 = a3;
  if (!self->_welcomeScreenManager)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager launchCoordinator](self, "launchCoordinator"));
    v6 = objc_msgSend(v5, "appLaunchCoordinatorIsConditionSatisfied:", 2);

    if ((v6 & 1) == 0)
    {
      v8 = BCSceneLog(v7);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v18 = v4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "_setupWelcomeScreenWithPresenterIfNeeded: welcomePresenter: %{public}@", buf, 0xCu);
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v11 = objc_msgSend(v10, "userInterfaceLayoutDirection") == (id)1;

      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100018AC4;
      v14[3] = &unk_1008EDE38;
      v14[4] = self;
      v16 = v11;
      v15 = v4;
      v12 = objc_retainBlock(v14);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager _welcomeItems](self, "_welcomeItems"));
      ((void (*)(_QWORD *, void *))v12[2])(v12, v13);

    }
  }

}

- (void)_setupMinibarContainerView
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager launchCoordinator](self, "launchCoordinator"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001BE14;
  v4[3] = &unk_1008E77C8;
  v4[4] = self;
  objc_msgSend(v3, "appLaunchCoordinatorOnConditionMask:blockID:performBlock:", 65, CFSTR("_setupMinibarContainerView"), v4);

}

- (void)_setWelcomePresenterIfNoneExists:(id)a3 shouldPresent:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager welcomePresenter](self, "welcomePresenter"));

  if (!v6)
  {
    -[BKAppSceneManager setWelcomePresenter:](self, "setWelcomePresenter:", v9);
    if (v4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager welcomePresenter](self, "welcomePresenter"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeScreenManager navigationController](self->_welcomeScreenManager, "navigationController"));
      objc_msgSend(v7, "presentWelcomeViewController:completion:", v8, 0);

    }
  }

}

- (void)_setCurrentWelcomePresenterIfNeeded:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (-[BKAppSceneManager _isRunningWelcomeFlow](self, "_isRunningWelcomeFlow"))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager welcomePresenter](self, "welcomePresenter"));

    if (v5 != v4)
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_10019CA8C;
      v6[3] = &unk_1008E7338;
      v6[4] = self;
      v7 = v4;
      -[BKAppSceneManager _enqueueDismissWelcomePresenter:](self, "_enqueueDismissWelcomePresenter:", v6);

    }
  }

}

- (id)_lastKnownStateRestorationUserInfoForSceneSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager sceneFlowController](self, "sceneFlowController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_lastKnownStateRestorationUserInfoForSceneSession:", v4));

  return v6;
}

- (BOOL)_isRunningWelcomeFlow
{
  void *v2;
  unsigned int v3;

  if (self->_welcomeScreenManager)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager launchCoordinator](self, "launchCoordinator"));
    v3 = objc_msgSend(v2, "appLaunchCoordinatorIsConditionSatisfied:", 2) ^ 1;

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)_applicationDidBecomeActiveNotification:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100063928;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_afterSceneWillConnect:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "session"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persistentIdentifier"));

  v7 = BCSceneLog(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
    v10 = 138543618;
    v11 = v5;
    v12 = 2114;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "_afterSceneWillConnect: sceneIdentifier: %{public}@, sceneDelegate: %{public}@", (uint8_t *)&v10, 0x16u);

  }
}

- (void)restrictionsForBookStoreAllowedChanged:(BOOL)a3
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  const char *v7;

  v4 = JSALog(self, a2, a3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446210;
    v7 = "-[BKAppSceneManager(BKTabBarControllerJSApp) restrictionsForBookStoreAllowedChanged:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s Reloading RootBarItems due to BookStore restriction change", (uint8_t *)&v6, 0xCu);
  }

  -[BKAppSceneManager reloadStandardItemsWithAnimated:completion:](self, "reloadStandardItemsWithAnimated:completion:", 1, &stru_1008EB430);
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager _primarySceneControllerObject](self, "_primarySceneControllerObject"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mainFlowController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "navigationController:animationControllerForOperation:fromViewController:toViewController:", v12, a4, v11, v10));

  return v15;
}

- (void)requestAccountInfoScene
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager sceneFlowController](self, "sceneFlowController"));
  objc_msgSend(v2, "requestAccountScene:", 0);

}

- (void)handleApplicationURL:(id)a3 sourceApplication:(id)a4 annotation:(id)a5 likelyUserInitiated:(id)a6 transaction:(id)a7
{
  uint64_t v7;

  BYTE2(v7) = 1;
  LOWORD(v7) = 0;
  -[BKAppSceneManager handleApplicationURL:sourceApplication:annotation:likelyUserInitiated:canImport:openAfterImport:importInPlace:showLibraryAllCollection:switchToLibrary:transaction:completion:](self, "handleApplicationURL:sourceApplication:annotation:likelyUserInitiated:canImport:openAfterImport:importInPlace:showLibraryAllCollection:switchToLibrary:transaction:completion:", a3, a4, a5, a6, 0, 1, v7, a7, 0);
}

- (void)handleApplicationURL:(id)a3 sourceApplication:(id)a4 annotation:(id)a5 likelyUserInitiated:(id)a6 canImport:(BOOL)a7 openAfterImport:(BOOL)a8 importInPlace:(BOOL)a9 showLibraryAllCollection:(BOOL)a10 switchToLibrary:(BOOL)a11 transaction:(id)a12 completion:(id)a13
{
  _QWORD *v17;
  NSObject *v18;
  id v19;
  _QWORD *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v28;
  id v30;
  id v31;
  id v32;
  _QWORD block[4];
  id v34;
  id v35;
  id v36;
  id v37;
  BKAppSceneManager *v38;
  id v39;
  id v40;
  id v41;
  BOOL v42;
  BOOL v43;
  BOOL v44;
  BOOL v45;
  BOOL v46;
  id location;
  _QWORD v48[4];
  id v49;

  v31 = a3;
  v30 = a4;
  v28 = a5;
  v25 = a6;
  v26 = a12;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_1001267C0;
  v48[3] = &unk_1008EB968;
  v32 = a13;
  v49 = v32;
  v17 = objc_retainBlock(v48);
  objc_initWeak(&location, self);
  v18 = objc_claimAutoreleasedReturnValue(-[BKAppSceneManager urlHandlingQueue](self, "urlHandlingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100126824;
  block[3] = &unk_1008EBA08;
  objc_copyWeak(&v41, &location);
  v34 = v31;
  v35 = v30;
  v36 = v28;
  v37 = v26;
  v42 = a7;
  v43 = a8;
  v44 = a9;
  v45 = a10;
  v46 = a11;
  v38 = self;
  v39 = v25;
  v40 = v17;
  v19 = v25;
  v20 = v17;
  v21 = v26;
  v22 = v28;
  v23 = v30;
  v24 = v31;
  dispatch_async(v18, block);

  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);

}

- (void)handleImportURLs:(id)a3 transaction:(id)a4 perURLCompletion:(id)a5 completion:(id)a6
{
  -[BKAppSceneManager handleImportURLs:openAfterImport:importInPlace:showLibraryAllCollection:switchToLibrary:transaction:perURLCompletion:completion:](self, "handleImportURLs:openAfterImport:importInPlace:showLibraryAllCollection:switchToLibrary:transaction:perURLCompletion:completion:", a3, 0, 0, 0, 0, a4, a5, a6);
}

- (void)handleImportURLs:(id)a3 openAfterImport:(BOOL)a4 importInPlace:(BOOL)a5 showLibraryAllCollection:(BOOL)a6 switchToLibrary:(BOOL)a7 transaction:(id)a8 perURLCompletion:(id)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  BKAppSceneManager *v27;
  id v28;
  id v29;
  id v30;
  BOOL v31;
  BOOL v32;
  BOOL v33;
  BOOL v34;

  v16 = a3;
  v17 = a8;
  v18 = a9;
  v19 = a10;
  v20 = objc_claimAutoreleasedReturnValue(-[BKAppSceneManager urlHandlingQueue](self, "urlHandlingQueue"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100127184;
  v25[3] = &unk_1008EBA58;
  v26 = v16;
  v27 = self;
  v31 = a7;
  v32 = a6;
  v33 = a4;
  v34 = a5;
  v28 = v17;
  v29 = v18;
  v30 = v19;
  v21 = v19;
  v22 = v18;
  v23 = v17;
  v24 = v16;
  dispatch_async(v20, v25);

}

+ (NSArray)supportedFileImportTypes
{
  if (qword_1009F5048 != -1)
    dispatch_once(&qword_1009F5048, &stru_1008EBA78);
  return (NSArray *)(id)qword_1009F5040;
}

+ (NSArray)supportedAudiobookImportTypes
{
  if (qword_1009F5058 != -1)
    dispatch_once(&qword_1009F5058, &stru_1008EBA98);
  return (NSArray *)(id)qword_1009F5050;
}

+ (NSArray)supportedAudibleImportTypes
{
  if (qword_1009F5068 != -1)
    dispatch_once(&qword_1009F5068, &stru_1008EBAB8);
  return (NSArray *)(id)qword_1009F5060;
}

- (id)_audibleURLsInURLs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  __int128 v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  id v22;
  __int128 v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  NSURLResourceKey v47;

  v3 = a3;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v47 = NSURLContentTypeKey;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v47, 1));
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v36;
    *(_QWORD *)&v6 = 141558530;
    v24 = v6;
    v26 = *(_QWORD *)v36;
    v27 = v4;
    do
    {
      v9 = 0;
      v28 = v7;
      do
      {
        if (*(_QWORD *)v36 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v9);
        v11 = objc_msgSend(v10, "startAccessingSecurityScopedResource", v24);
        v34 = 0;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "resourceValuesForKeys:error:", v4, &v34));
        v13 = v34;
        v14 = v13;
        if (v13)
        {
          v15 = BKLibraryBookImportLog(v13);
          v16 = objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v24;
            v41 = 1752392040;
            v42 = 2112;
            v43 = v10;
            v44 = 2112;
            v45 = v14;
            _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "_audibleURLsinURLs: resourceValuesForKeys failed. url: %{mask.hash}@ error: %@", buf, 0x20u);
          }
        }
        else
        {
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", NSURLContentTypeKey));
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppSceneManager supportedAudibleImportTypes](BKAppSceneManager, "supportedAudibleImportTypes"));
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v31;
            while (2)
            {
              for (i = 0; i != v19; i = (char *)i + 1)
              {
                if (*(_QWORD *)v31 != v20)
                  objc_enumerationMutation(v17);
                if (-[NSObject conformsToType:](v16, "conformsToType:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i)))
                {
                  objc_msgSend(v25, "addObject:", v10);
                  goto LABEL_19;
                }
              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
              if (v19)
                continue;
              break;
            }
          }
LABEL_19:

          v8 = v26;
          v4 = v27;
          v7 = v28;
        }

        if (v11)
          objc_msgSend(v10, "stopAccessingSecurityScopedResource");

        v9 = (char *)v9 + 1;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
    }
    while (v7);
  }

  v22 = objc_msgSend(v25, "copy");
  return v22;
}

- (id)_findImportEligibleURLsAtURL:(id)a3
{
  id v3;
  void *v4;
  id v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  int v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = objc_msgSend(v3, "startAccessingSecurityScopedResource");
  v6 = (int)v5;
  if (sub_100128010((uint64_t)v5, v3))
  {
    objc_msgSend(v4, "addObject:", v3);
  }
  else if (objc_msgSend(v3, "bu_isFolder"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v3, &__NSArray0__struct, 2, &stru_1008EBAF8));

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          v15 = objc_msgSend(v14, "startAccessingSecurityScopedResource", (_QWORD)v19);
          v16 = (int)v15;
          if (sub_100128010((uint64_t)v15, v14))
            objc_msgSend(v4, "addObject:", v14);
          if (v16)
            objc_msgSend(v14, "stopAccessingSecurityScopedResource");
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v11);
    }

  }
  if (v6)
    objc_msgSend(v3, "stopAccessingSecurityScopedResource");
  v17 = objc_msgSend(v4, "copy", (_QWORD)v19);

  return v17;
}

- (void)_openExternalURL:(id)a3 sourceApplication:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  if (v16)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "scheme"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lowercaseString"));

    if (v8
      && ((objc_msgSend(v8, "isEqualToString:", CFSTR("itms-books")) & 1) != 0
       || (objc_msgSend(v8, "isEqualToString:", CFSTR("itms-bookss")) & 1) != 0
       || (objc_msgSend(v8, "isEqualToString:", CFSTR("ibooks")) & 1) != 0
       || (objc_msgSend(v8, "isEqualToString:", CFSTR("prefs")) & 1) != 0))
    {
      if (!objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.iBooks.BooksWidget")))
      {
LABEL_13:

        goto LABEL_14;
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
      objc_msgSend(v9, "openSensitiveURL:withOptions:", v16, 0);
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager currentSceneController](self, "currentSceneController"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bk_window"));

      if (!v9)
        BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKAppSceneManager+BKAppURLHandler.m", 396, "-[BKAppSceneManager(BKAppURLHandler) _openExternalURL:sourceApplication:]", "window", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rootViewController"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bc_deepestVisibleChildViewControllerIncludePresented:", 1));

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ba_effectiveAnalyticsTracker"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
      objc_msgSend(v14, "emitExitLinkTapEventWithTracker:url:", v13, v16);

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      objc_msgSend(v15, "openURL:options:completionHandler:", v16, &__NSDictionary0__struct, 0);

    }
    goto LABEL_13;
  }
LABEL_14:

}

- (void)startJavascriptAppWithLibrary:(id)a3 libraryItemStateProvider:(id)a4 downloadProgressCenter:(id)a5 serviceCenter:(id)a6 storeController:(id)a7 engagementManager:(id)a8 jetActionHandler:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  BKLibraryAudiobookProgressCenter *v37;
  void *v38;
  void *v39;
  BKJSAAppWindowProvider *v40;
  BKJSALibraryManager *v41;
  void *v42;
  void *v43;
  _QWORD v44[5];
  uint8_t buf[16];

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  v25 = JSALog(v22, v23, v24);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Starting JS App", buf, 2u);
  }

  -[BKAppSceneManager setServiceCenter:](self, "setServiceCenter:", v19);
  kdebug_trace(725353712, 62, 0, 0, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[BSUITemplate manager](BSUITemplate, "manager"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "dynamicRegistry"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stateCenter"));

  objc_msgSend(v28, "registerStateProvider:forKind:", v29, CFSTR("libraryItem"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "resourceRegistry"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[BKCoverResourceProvider sharedInstance](BKCoverResourceProvider, "sharedInstance"));
  objc_msgSend(v30, "registerImageProvider:forKind:", v31, CFSTR("libraryItem"));

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "resourceRegistry"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager minifiedFlowController](self, "minifiedFlowController"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "currentBookProvider"));
  objc_msgSend(v32, "registerImageProvider:forKind:", v34, CFSTR("currentBookSnapshot"));

  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "dynamicRegistry"));
  objc_msgSend(v35, "registerProgressProvider:forKind:", v20, CFSTR("downloadProgress"));

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "dynamicRegistry"));
  v37 = objc_alloc_init(BKLibraryAudiobookProgressCenter);
  objc_msgSend(v36, "registerProgressProvider:forKind:", v37, CFSTR("audiobookProgress"));

  kdebug_trace(725353712, 63, 0, 0, 0);
  -[BKAppSceneManager _setupURLHandler](self, "_setupURLHandler");
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager classRegistrations](self, "classRegistrations"));
  objc_msgSend(v38, "bootstrapWithObjectRegistrations:", v39);

  v40 = -[BKJSAAppWindowProvider initWithSceneManager:]([BKJSAAppWindowProvider alloc], "initWithSceneManager:", self);
  -[BKAppSceneManager setWindowProvider:](self, "setWindowProvider:", v40);

  v41 = -[BKJSALibraryManager initWithLibraryAssetProvider:presentersProvider:storeController:]([BKJSALibraryManager alloc], "initWithLibraryAssetProvider:presentersProvider:storeController:", v22, self, v18);
  -[BKAppSceneManager setJsaLibraryManager:](self, "setJsaLibraryManager:", v41);

  -[BKAppSceneManager setEngagementManager:](self, "setEngagementManager:", v17);
  -[BKAppSceneManager setJetActionHandler:](self, "setJetActionHandler:", v16);

  v42 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_1001299A0;
  v44[3] = &unk_1008E72C0;
  v44[4] = self;
  objc_msgSend(v42, "initializeEnvironmentWithDataSource:completion:", self, v44);

  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v43, "addObserver:selector:name:object:", self, "_bridgeDidReload:", JSABridgeDidReloadNotification, 0);

}

- (void)_bridgeDidReload:(id)a3
{
  void *v3;
  dispatch_time_t v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BRCConfigurationManager sharedInstance](BRCConfigurationManager, "sharedInstance", a3));
  objc_msgSend(v3, "resetForJavascript");

  v4 = dispatch_time(0, 5000000000);
  global_queue = dispatch_get_global_queue(9, 0);
  v6 = objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_after(v4, v6, &stru_1008EBB60);

}

- (id)appGroupIdentifierForBridge:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BUAppGroup books](BUAppGroup, "books", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  return v4;
}

- (BKAppSceneManager)initWithLaunchCoordinator:(id)a3 importCoordinator:(id)a4
{
  id v7;
  id v8;
  BKAppSceneManager *v9;
  BKCriticalAlertCoordinator *v10;
  BKCriticalAlertCoordinating *criticalAlertCoordinator;
  BKSceneFlowController *v12;
  BKSceneFlowController *sceneFlowController;
  BKMinifiedFlowController *v14;
  BKMinifiedFlowController *minifiedFlowController;
  void *v16;
  BCTransactionQueue *v17;
  BCTransactionQueue *userTransactionQueue;
  dispatch_queue_attr_t v19;
  NSObject *v20;
  dispatch_queue_attr_t initially_inactive;
  NSObject *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *urlHandlingQueue;
  void *v25;
  void *v26;
  BKAppSceneManager *v27;
  NSMutableArray *v28;
  NSMutableArray *pendingWelcomePresenterDismissCompletionBlocks;
  void *v30;
  void *v31;
  _QWORD block[4];
  BKAppSceneManager *v34;
  objc_super v35;

  v7 = a3;
  v8 = a4;
  v35.receiver = self;
  v35.super_class = (Class)BKAppSceneManager;
  v9 = -[BKAppSceneManager init](&v35, "init");
  if (v9)
  {
    v10 = objc_alloc_init(BKCriticalAlertCoordinator);
    criticalAlertCoordinator = v9->_criticalAlertCoordinator;
    v9->_criticalAlertCoordinator = (BKCriticalAlertCoordinating *)v10;

    v12 = -[BKSceneFlowController initWithLaunchCoordinator:criticalAlertCoordinator:]([BKSceneFlowController alloc], "initWithLaunchCoordinator:criticalAlertCoordinator:", v7, v9->_criticalAlertCoordinator);
    sceneFlowController = v9->_sceneFlowController;
    v9->_sceneFlowController = v12;

    v14 = objc_alloc_init(BKMinifiedFlowController);
    minifiedFlowController = v9->_minifiedFlowController;
    v9->_minifiedFlowController = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager sceneFlowController](v9, "sceneFlowController"));
    -[BKMinifiedFlowController setSceneHosting:](v9->_minifiedFlowController, "setSceneHosting:", v16);

    -[BKMinifiedFlowController setDelegate:](v9->_minifiedFlowController, "setDelegate:", v9);
    objc_storeStrong((id *)&v9->_launchCoordinator, a3);
    objc_storeStrong((id *)&v9->_importCoordinator, a4);
    v17 = (BCTransactionQueue *)+[BCTransactionQueue newWithOptions:queue:](BCTransactionQueue, "newWithOptions:queue:", 1, &_dispatch_main_q);
    userTransactionQueue = v9->_userTransactionQueue;
    v9->_userTransactionQueue = v17;

    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    initially_inactive = dispatch_queue_attr_make_initially_inactive(v20);
    v22 = objc_claimAutoreleasedReturnValue(initially_inactive);
    v23 = dispatch_queue_create("BKAppSceneManager.urlHandlingQueue", v22);
    urlHandlingQueue = v9->_urlHandlingQueue;
    v9->_urlHandlingQueue = (OS_dispatch_queue *)v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v25, "addObserver:selector:name:object:", v9, "_applicationDidBecomeActiveNotification:", UIApplicationDidBecomeActiveNotification, 0);

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v26, "addObserver:selector:name:object:", v9, "_applicationWillResignActiveNotification:", UIApplicationWillResignActiveNotification, 0);

    *(_WORD *)&v9->_pushLargeCoverForInitialHandleURLBookOpen = 257;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10019A8CC;
    block[3] = &unk_1008E72C0;
    v27 = v9;
    v34 = v27;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    v28 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pendingWelcomePresenterDismissCompletionBlocks = v27->_pendingWelcomePresenterDismissCompletionBlocks;
    v27->_pendingWelcomePresenterDismissCompletionBlocks = v28;

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[BURestrictionsProvider sharedInstance](BURestrictionsProvider, "sharedInstance"));
    objc_msgSend(v30, "addObserver:", v27);

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v31, "addObserver:selector:name:object:", v27, "_afterSceneWillConnect:", UISceneWillConnectNotification, 0);

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager pendingCriticalAlertAssertion](self, "pendingCriticalAlertAssertion"));
  objc_msgSend(v3, "invalidate");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BURestrictionsProvider sharedInstance](BURestrictionsProvider, "sharedInstance"));
  objc_msgSend(v4, "removeObserver:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:", self);

  dispatch_activate((dispatch_object_t)self->_urlHandlingQueue);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKReachability sharedReachabilityForInternetConnection](BKReachability, "sharedReachabilityForInternetConnection"));
  objc_msgSend(v6, "stopNotifier");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager bookFlowController](self, "bookFlowController"));
  objc_msgSend(v7, "setStorePresenter:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager bookFlowController](self, "bookFlowController"));
  objc_msgSend(v8, "setMinifiedPresenter:", 0);

  v9.receiver = self;
  v9.super_class = (Class)BKAppSceneManager;
  -[BKAppSceneManager dealloc](&v9, "dealloc");
}

- (id)newShowAssetTransactionWithOriginatingSceneController:(id)a3 targetSceneDescriptor:(id)a4
{
  return -[BKAppSceneManager newTransactionWithName:originatingSceneController:targetSceneDescriptor:](self, "newTransactionWithName:originatingSceneController:targetSceneDescriptor:", BCTransactionNameShowAsset, a3, a4);
}

- (id)defaultSceneControllerForTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager sceneFlowController](self, "sceneFlowController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "defaultSceneControllerForTransaction:", v4));

  return v6;
}

- (id)sceneControllerForViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager sceneFlowController](self, "sceneFlowController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sceneControllerForViewController:", v4));

  return v6;
}

- (id)sceneControllerForWindow:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager sceneFlowController](self, "sceneFlowController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sceneControllerForWindow:", v4));

  return v6;
}

- (void)enumerateSceneInfo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager sceneFlowController](self, "sceneFlowController"));
  objc_msgSend(v5, "enumerateSceneInfo:", v4);

}

- (void)requestPrimaryScene:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager sceneFlowController](self, "sceneFlowController"));
  objc_msgSend(v5, "requestPrimaryScene:", v4);

}

- (void)forceTransaction:(id)a3 ontoPrimarySceneWithContinuation:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10019AC34;
  v8[3] = &unk_1008EB658;
  v9 = a3;
  v10 = a4;
  v6 = v10;
  v7 = v9;
  -[BKAppSceneManager requestPrimaryScene:](self, "requestPrimaryScene:", v8);

}

- (void)requestBookSceneWithAssetID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager sceneFlowController](self, "sceneFlowController"));
  objc_msgSend(v8, "requestBookSceneWithAssetID:completion:", v7, v6);

}

- (void)requestSceneWithAssetID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager sceneFlowController](self, "sceneFlowController"));
  objc_msgSend(v8, "requestSceneWithAssetID:completion:", v7, v6);

}

- (void)requestEndOfBookSceneWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager sceneFlowController](self, "sceneFlowController"));
  objc_msgSend(v8, "requestEndOfBookSceneWithOptions:completion:", v7, v6);

}

- (void)requestPrimaryOrBookScene:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager sceneFlowController](self, "sceneFlowController"));
  objc_msgSend(v5, "requestPrimaryOrBookScene:", v4);

}

- (id)newBookSceneControllerProviderWithRequestAssetID:(id)a3
{
  id v4;
  _BKBookSceneControllerProvider *v5;

  v4 = a3;
  v5 = -[_BKBookSceneControllerProvider initWithSceneManager:requestAssetID:]([_BKBookSceneControllerProvider alloc], "initWithSceneManager:requestAssetID:", self, v4);

  return v5;
}

- (id)sceneInfoPresentingAssetID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager sceneFlowController](self, "sceneFlowController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sceneInfoPresentingAssetID:", v4));

  return v6;
}

- (void)destroySceneForAssetID:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager sceneInfoPresentingAssetID:](self, "sceneInfoPresentingAssetID:", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKSceneUtilities sharedInstance](BKSceneUtilities, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sceneSession"));
  objc_msgSend(v3, "destroySceneWithSceneSession:withAnimationType:", v4, 1);

}

- (id)windowFromSceneType:(unint64_t)a3 assetID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager sceneFlowController](self, "sceneFlowController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sceneControllerForSceneType:assetID:", a3, v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bk_window"));
  return v9;
}

- (void)saveStateClosing:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10019B020;
  v3[3] = &unk_1008EDC38;
  v4 = a3;
  -[BKAppSceneManager enumerateSceneController:includeHidden:](self, "enumerateSceneController:includeHidden:", v3, 1);
}

- (void)analyticsForceEndSession
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  -[BKAppSceneManager enumerateSceneController:includeHidden:](self, "enumerateSceneController:includeHidden:", &stru_1008EDC78, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager minifiedPresenter](self, "minifiedPresenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "minifiedPresenterAssetCurrentPresenters"));

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
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9), "minifiedAssetPresenterAssetViewControllerFuture", (_QWORD)v12));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "getNonBlockingError:", 0));
        objc_msgSend(v11, "bc_analyticsSubtreeForceEndSession");

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)analyticsVisibilityWillDisappear
{
  -[BKAppSceneManager enumerateSceneController:includeHidden:](self, "enumerateSceneController:includeHidden:", &stru_1008EDC98, 0);
}

- (void)analyticsVisibilityDidDisappear
{
  -[BKAppSceneManager enumerateSceneController:includeHidden:](self, "enumerateSceneController:includeHidden:", &stru_1008EDCB8, 0);
}

- (void)_applicationWillResignActiveNotification:(id)a3
{
  -[BKAppSceneManager setPushLargeCoverForNextHandleURLBookOpen:](self, "setPushLargeCoverForNextHandleURLBookOpen:", 1);
}

- (void)carPlayScene:(id)a3 didConnectInterfaceController:(id)a4
{
  void *v5;
  unsigned __int8 v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager launchCoordinator](self, "launchCoordinator", a3, a4));
  v6 = objc_msgSend(v5, "appLaunchCoordinatorIsConditionSatisfied:", 8);

  if ((v6 & 1) == 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager launchCoordinator](self, "launchCoordinator"));
    objc_msgSend(v7, "signalConditionSatisfied:", 8);

  }
}

- (void)_didFinishSceneStateRestoration:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager sceneFlowController](self, "sceneFlowController"));
  objc_msgSend(v5, "_didFinishSceneStateRestoration:", v4);

}

- (id)minifiedFlowControllerTabBarView
{
  return 0;
}

- (double)minifiedFlowControllerMinibarBottomGuideWithViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double Height;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double MinY;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  CGRect v20;
  CGRect v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager rootBarCoordinator](self, "rootBarCoordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hostingViewController"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v7, "bounds");
  Height = CGRectGetHeight(v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v9, "safeAreaInsets");
  v11 = v10;

  if (!v4)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager rootBarCoordinator](self, "rootBarCoordinator"));
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "selectedTopViewController"));

  }
  MinY = Height - v11;
  v14 = objc_opt_class(UITabBarController);
  v15 = BUDynamicCast(v14, v6);
  v16 = (id)objc_claimAutoreleasedReturnValue(v15);
  v17 = v16;
  if (v16 && (v16 == v4 || objc_msgSend(v16, "im_isAncestorOfChildViewController:", v4)))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "tabBar"));
    objc_msgSend(v18, "frame");
    MinY = CGRectGetMinY(v21);

  }
  return MinY;
}

- (void)minifiedFlowControllerRequestShowStoreForStoreID:(id)a3 fromViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager sceneControllerForViewController:](self, "sceneControllerForViewController:", a4));
  v7 = objc_msgSend(v9, "newShowURLTransaction");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager storePresenter](self, "storePresenter"));
  objc_msgSend(v8, "storeShowBookWithStoreID:resourceType:transaction:", v6, 3, v7);

}

- (void)_sceneForReportingErrorWithContentType:(signed __int16)a3 assetID:(id)a4 completion:(id)a5
{
  -[BKAppSceneManager requestSceneWithAssetID:completion:](self, "requestSceneWithAssetID:completion:", a4, a5);
}

- (void)minifiedFlowControllerHandleAssetPresentationError:(id)a3 assetID:(id)a4 isRetry:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD *v11;
  id v12;
  _QWORD *v13;
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  id v17;
  _QWORD *v18;
  id v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  id v26;
  _QWORD *v27;
  _QWORD *v28;
  void *v29;
  _QWORD *v30;
  BKAppSceneManager *v31;
  _BOOL4 v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  _QWORD *v37;
  id v38;
  BOOL v39;
  _QWORD v40[5];
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  Block_layout *v45;
  id v46;
  _QWORD v47[4];
  id v48;
  Block_layout *v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  _QWORD v54[4];
  id v55;
  _QWORD *v56;
  id v57;
  _QWORD v58[5];
  id v59;
  id location;
  uint8_t buf[4];
  id v62;
  __int16 v63;
  id v64;
  __int16 v65;
  _BOOL4 v66;

  v32 = a5;
  v7 = a3;
  v8 = a4;
  v31 = self;
  objc_initWeak(&location, self);
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x3032000000;
  v58[3] = sub_10004E4D8;
  v58[4] = sub_10004E2E0;
  v59 = 0;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "libraryAssetOnMainQueueWithAssetID:", v8));
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_10019B974;
  v54[3] = &unk_1008EDD28;
  v56 = v58;
  objc_copyWeak(&v57, &location);
  v10 = v8;
  v55 = v10;
  v11 = objc_retainBlock(v54);
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_10019BC30;
  v51[3] = &unk_1008E7680;
  v12 = v9;
  v52 = v12;
  v30 = v11;
  v53 = v30;
  v13 = objc_retainBlock(v51);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_10019BEA0;
  v47[3] = &unk_1008EDD98;
  v49 = &stru_1008EDD48;
  v14 = v7;
  v48 = v14;
  v15 = v13;
  v50 = v15;
  v16 = objc_retainBlock(v47);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_10019C190;
  v41[3] = &unk_1008EDDE8;
  v17 = v12;
  v42 = v17;
  v18 = v16;
  v44 = v18;
  v45 = &stru_1008EDD48;
  v19 = v14;
  v43 = v19;
  v20 = v15;
  v46 = v20;
  v21 = objc_retainBlock(v41);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10019C3A0;
  v40[3] = &unk_1008E7BE8;
  v40[4] = v58;
  v22 = objc_retainBlock(v40);
  v23 = BCSceneLog(v22);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v62 = v10;
    v63 = 2112;
    v64 = v19;
    v65 = 1024;
    v66 = v32;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Asset %@ did not open, error=%@ retry=%{BOOL}d.  Fetching scene controller", buf, 0x1Cu);
  }

  v25 = objc_msgSend(v17, "contentType");
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10019C574;
  v33[3] = &unk_1008EDE10;
  objc_copyWeak(&v38, &location);
  v37 = v58;
  v26 = v19;
  v34 = v26;
  v39 = v32;
  v27 = v21;
  v35 = v27;
  v28 = v22;
  v36 = v28;
  -[BKAppSceneManager _sceneForReportingErrorWithContentType:assetID:completion:](v31, "_sceneForReportingErrorWithContentType:assetID:completion:", v25, v10, v33);

  objc_destroyWeak(&v38);
  objc_destroyWeak(&v57);

  _Block_object_dispose(v58, 8);
  objc_destroyWeak(&location);

}

- (NSString)figaroPageContext
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager rootBarCoordinator](self, "rootBarCoordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "selectedItem"));

  if ((objc_msgSend(v3, "isStandardItem") & 1) != 0)
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  else
    v4 = objc_claimAutoreleasedReturnValue(+[BKRootBarItemsProvider LibraryAllIdentifier](BKRootBarItemsProvider, "LibraryAllIdentifier"));
  v5 = (void *)v4;

  return (NSString *)v5;
}

- (BOOL)isPresentingWelcome
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager welcomePresenter](self, "welcomePresenter"));
  v3 = objc_msgSend(v2, "welcomePresenterIsPresentingWelcome");

  return v3;
}

- (void)_enqueueDismissWelcomePresenter:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD *v11;
  void *v12;
  id v13;
  _QWORD *v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD v18[5];
  uint8_t buf[16];

  v4 = a3;
  v5 = BCSceneLog(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "_enqueueDismissWelcomePresenter", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager pendingWelcomePresenterDismissCompletionBlocks](self, "pendingWelcomePresenterDismissCompletionBlocks"));
  v8 = objc_msgSend(v7, "count");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager pendingWelcomePresenterDismissCompletionBlocks](self, "pendingWelcomePresenterDismissCompletionBlocks"));
  v10 = objc_retainBlock(v4);

  objc_msgSend(v9, "addObject:", v10);
  if (!v8)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10019C8B0;
    v18[3] = &unk_1008E72C0;
    v18[4] = self;
    v11 = objc_retainBlock(v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager welcomePresenter](self, "welcomePresenter"));

    if (v12)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10019C9F4;
      v15[3] = &unk_1008E7680;
      v16 = (id)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager welcomePresenter](self, "welcomePresenter"));
      v17 = v11;
      v13 = v16;
      objc_msgSend(v13, "welcomePresenterFinishOngoingModalTransitionAnimations:", v15);

    }
    else
    {
      v14 = objc_retainBlock(v11);
      v13 = v14;
      if (v14)
        ((void (*)(_QWORD *))v14[2])(v14);
    }

  }
}

- (void)_welcomePresenterDidDisconnect:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  if (-[BKAppSceneManager _isRunningWelcomeFlow](self, "_isRunningWelcomeFlow"))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[BKAppSceneManager welcomePresenter](self, "welcomePresenter"));

    if (v4 == v5)
      -[BKAppSceneManager _setCurrentWelcomePresenterIfNeeded:](self, "_setCurrentWelcomePresenterIfNeeded:", 0);
  }

}

- (void)setStoreFlowController:(id)a3
{
  objc_storeStrong((id *)&self->_storeFlowController, a3);
}

- (void)setBookFlowController:(id)a3
{
  objc_storeStrong((id *)&self->_bookFlowController, a3);
}

- (void)setAppStoreReviewManager:(id)a3
{
  objc_storeStrong((id *)&self->_appStoreReviewManager, a3);
}

- (void)setCriticalAlertCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_criticalAlertCoordinator, a3);
}

- (void)setLibraryCollectionsFlowController:(id)a3
{
  objc_storeStrong((id *)&self->_libraryCollectionsFlowController, a3);
}

- (BCTransaction)initialUserTransaction
{
  return self->_initialUserTransaction;
}

- (void)setLaunchCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_launchCoordinator, a3);
}

- (BKAppImportCoordinator)importCoordinator
{
  return self->_importCoordinator;
}

- (void)setImportCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_importCoordinator, a3);
}

- (void)setUserTransactionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_userTransactionQueue, a3);
}

- (BKWelcomeScreenManager)welcomeScreenManager
{
  return self->_welcomeScreenManager;
}

- (void)setWelcomeScreenManager:(id)a3
{
  objc_storeStrong((id *)&self->_welcomeScreenManager, a3);
}

- (NSMutableArray)pendingWelcomePresenterDismissCompletionBlocks
{
  return self->_pendingWelcomePresenterDismissCompletionBlocks;
}

- (void)setPendingWelcomePresenterDismissCompletionBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_pendingWelcomePresenterDismissCompletionBlocks, a3);
}

- (BKAppURLHandling)urlHandler
{
  return self->_urlHandler;
}

- (void)setUrlHandlingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_urlHandlingQueue, a3);
}

- (BOOL)pushLargeCoverForInitialHandleURLBookOpen
{
  return self->_pushLargeCoverForInitialHandleURLBookOpen;
}

- (void)setPushLargeCoverForInitialHandleURLBookOpen:(BOOL)a3
{
  self->_pushLargeCoverForInitialHandleURLBookOpen = a3;
}

- (BOOL)pushLargeCoverForNextHandleURLBookOpen
{
  return self->_pushLargeCoverForNextHandleURLBookOpen;
}

- (BSUIJetActionHandling)jetActionHandler
{
  return self->_jetActionHandler;
}

- (void)setJetActionHandler:(id)a3
{
  objc_storeStrong((id *)&self->_jetActionHandler, a3);
}

- (BOOL)tabsAreLoaded
{
  return self->_tabsAreLoaded;
}

- (void)setSceneFlowController:(id)a3
{
  objc_storeStrong((id *)&self->_sceneFlowController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootBarCoordinator, 0);
  objc_storeStrong((id *)&self->_sceneFlowController, 0);
  objc_storeStrong((id *)&self->_jetActionHandler, 0);
  objc_storeStrong((id *)&self->_serviceCenter, 0);
  objc_storeStrong((id *)&self->_windowProvider, 0);
  objc_storeStrong((id *)&self->_urlHandlingQueue, 0);
  objc_storeStrong((id *)&self->_urlHandler, 0);
  objc_storeStrong((id *)&self->_pendingWelcomePresenterDismissCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_welcomePresenter, 0);
  objc_storeStrong((id *)&self->_welcomeScreenManager, 0);
  objc_storeStrong((id *)&self->_userTransactionQueue, 0);
  objc_storeStrong((id *)&self->_importCoordinator, 0);
  objc_storeStrong((id *)&self->_launchCoordinator, 0);
  objc_storeStrong((id *)&self->_initialUserTransaction, 0);
  objc_storeStrong((id *)&self->_libraryCollectionsFlowController, 0);
  objc_storeStrong((id *)&self->_pendingCriticalAlertAssertion, 0);
  objc_storeStrong((id *)&self->_criticalAlertCoordinator, 0);
  objc_storeStrong((id *)&self->_appStoreReviewManager, 0);
  objc_storeStrong((id *)&self->_engagementManager, 0);
  objc_storeStrong((id *)&self->_bookFlowController, 0);
  objc_storeStrong((id *)&self->_jsaLibraryManager, 0);
  objc_storeStrong((id *)&self->_storeFlowController, 0);
  objc_storeStrong((id *)&self->_minifiedFlowController, 0);
}

- (void)processAccountSwitchWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  BKAppSceneManager *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_100909A78, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_1004962CC((uint64_t)sub_10004DE24, v5);

  swift_release(v5);
}

@end
