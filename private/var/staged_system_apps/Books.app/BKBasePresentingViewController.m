@implementation BKBasePresentingViewController

+ (id)lastKnownSuccessfullyOpenBookID
{
  return _objc_msgSend(a1, "_successfullyOpenedBookWithKey:successKey:deleteOnFailure:", CFSTR("BKMainViewControllerLastBook"), CFSTR("BKMainViewControllerSuccessfullyOpenedBook"), 0);
}

+ (id)_successfullyOpenedBookWithKey:(id)a3 successKey:(id)a4 deleteOnFailure:(BOOL)a5
{
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_lastOpenedBookWithKey:", a3, a4, a5));
  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKLastOpenBookManager sharedInstance](BKLastOpenBookManager, "sharedInstance"));
    v7 = objc_msgSend(v6, "shouldAutoOpenAsset:", v5);

    if ((v7 & 1) == 0)
    {

      v5 = 0;
    }
  }
  return v5;
}

+ (id)_lastOpenedBookWithKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  void *v11;
  __int16 v12;
  id v13;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v3));

  v7 = BCCurrentBookLog(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = 138412546;
    v11 = v5;
    v12 = 2112;
    v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Last known assetID: %@ (for key %@)", (uint8_t *)&v10, 0x16u);
  }

  return v5;
}

+ (void)initialize
{
  void *v2;
  id v3;

  if ((id)objc_opt_class(BKAssetPresentingViewController) == a1)
  {
    v3 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", CFSTR("BKMainViewControllerSuccessfullyOpenedBook"), &stru_10091C438, CFSTR("BKMainViewControllerLastBook"), &__kCFBooleanTrue, CFSTR("kSuccessfullyOpenedCurrentBook"), &stru_10091C438, CFSTR("kLastCurrentBookKey"), 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v2, "registerDefaults:", v3);

  }
}

+ (id)holdAnimationAssertion
{
  return objc_alloc_init(BKAssetPresentingViewControllerHoldAnimationAssertion);
}

- (id)backItemForCoverView
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  __CFString *v18;

  if (-[BKBasePresentingViewController _isHostedInAuxiliaryScene](self, "_isHostedInAuxiliaryScene"))
  {
    v3 = objc_opt_class(BKSceneController);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController _sceneControllerCurrentlyHostingAssetPresenter](self, "_sceneControllerCurrentlyHostingAssetPresenter"));
    v5 = BUDynamicCast(v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rootBarCoordinator"));
    if (!v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController im_ancestorFlowControllerConformingToProtocol:](self, "im_ancestorFlowControllerConformingToProtocol:", &OBJC_PROTOCOL___BKSceneHosting));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentSceneController"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bk_window"));
      objc_msgSend(v10, "bounds");
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v13, "bounds");
      v15 = v14;

      if (v12 >= v15)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Library"), &stru_10091C438, 0));

        if (v18)
        {
LABEL_8:
          v16 = objc_msgSend(objc_alloc((Class)UINavigationItem), "initWithTitle:", v18);

          return v16;
        }
      }
      else
      {

      }
    }
    v18 = &stru_10091C438;
    goto LABEL_8;
  }
  v16 = 0;
  return v16;
}

- (BOOL)showBackChevronForCoverView
{
  return !-[BKBasePresentingViewController _isHostedInAuxiliaryScene](self, "_isHostedInAuxiliaryScene");
}

- (BOOL)shouldCloseDueToAssetDeletion
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
  if ((objc_opt_respondsToSelector(v2, "shouldCloseDueToAssetDeletion") & 1) != 0)
    v3 = objc_msgSend(v2, "shouldCloseDueToAssetDeletion");
  else
    v3 = 1;

  return v3;
}

- (BKBasePresentingViewController)initWithAssetIdentifier:(id)a3 assetViewController:(id)a4 helper:(id)a5 libraryAssetProvider:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BKBasePresentingViewController *v14;
  BKBasePresentingViewController *v15;
  void *v16;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)BKBasePresentingViewController;
  v14 = -[BKBasePresentingViewController initWithNibName:bundle:](&v18, "initWithNibName:bundle:", 0, 0);
  v15 = v14;
  if (v14)
  {
    -[BKBasePresentingViewController setAssetViewController:](v14, "setAssetViewController:", v11);
    -[BKBasePresentingViewController setAssetHelper:](v15, "setAssetHelper:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](v15, "assetViewController"));
    objc_msgSend(v16, "setAssetViewControllerDelegate:", v15);

    -[BKBasePresentingViewController _commonInitWithIdentifier:libraryAssetProvider:](v15, "_commonInitWithIdentifier:libraryAssetProvider:", v10, v13);
  }

  return v15;
}

- (BKBasePresentingViewController)initWithAssetIdentifier:(id)a3 placeholderViewController:(id)a4 holdAnimationAssertion:(id)a5 libraryAssetProvider:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BKBasePresentingViewController *v14;
  BKBasePresentingViewController *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)BKBasePresentingViewController;
  v14 = -[BKBasePresentingViewController initWithNibName:bundle:](&v20, "initWithNibName:bundle:", 0, 0);
  v15 = v14;
  if (v14)
  {
    -[BKBasePresentingViewController setPlaceholderViewController:](v14, "setPlaceholderViewController:", v11);
    v16 = objc_opt_class(BKAssetPresentingViewControllerHoldAnimationAssertion);
    v17 = BUDynamicCast(v16, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    -[BKBasePresentingViewController setHoldAnimationAssertion:](v15, "setHoldAnimationAssertion:", v18);

    -[BKBasePresentingViewController _commonInitWithIdentifier:libraryAssetProvider:](v15, "_commonInitWithIdentifier:libraryAssetProvider:", v10, v13);
  }

  return v15;
}

- (id)previewActionItems
{
  return -[BKBasePresentingViewController bk_previewActionItems](self, "bk_previewActionItems");
}

- (void)_commonInitWithIdentifier:(id)a3 libraryAssetProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BKLibraryAssetIdentifier *v12;
  BKLibraryAssetIdentifier *assetIdentifier;
  BCMutableFutureValue *v14;
  BCMutableFutureValue *sampleProfileFuture;
  BKTransitioningViewController *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  BKFrontmostAssetTracker *v26;
  void *v27;
  BKFrontmostAssetTracker *v28;
  BKFrontmostAssetTracker *frontmostTracker;
  void *v30;
  id v31;
  void **v32;
  uint64_t v33;
  void (*v34)(uint64_t, int);
  void *v35;
  id v36;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "addObserver:selector:name:object:", self, "_applicationDidBecomeActiveNotification:", UIApplicationDidBecomeActiveNotification, 0);
  objc_msgSend(v8, "addObserver:selector:name:object:", self, "_applicationWillResignActiveNotification:", UIApplicationWillResignActiveNotification, 0);
  objc_msgSend(v8, "addObserver:selector:name:object:", self, "_downloadStatusNotification:", BKLibraryDownloadStatusNotification, 0);
  v9 = BKLibraryOwnershipDidChangeNotification;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  objc_msgSend(v8, "addObserver:selector:name:object:", self, "_libraryOwnershipNotification:", v9, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[BCBookReadingTimeTracker sharedInstance](BCBookReadingTimeTracker, "sharedInstance"));
  objc_msgSend(v11, "addPromotionObserver:", self);

  v12 = (BKLibraryAssetIdentifier *)objc_msgSend(v6, "copy");
  assetIdentifier = self->_assetIdentifier;
  self->_assetIdentifier = v12;

  -[BKBasePresentingViewController setLibraryAssetProvider:](self, "setLibraryAssetProvider:", v7);
  v14 = objc_opt_new(BCMutableFutureValue);
  sampleProfileFuture = self->_sampleProfileFuture;
  self->_sampleProfileFuture = v14;

  v16 = -[BKTransitioningViewController initWithContentViewController:]([BKTransitioningViewController alloc], "initWithContentViewController:", 0);
  -[BKBasePresentingViewController setTransitioningViewController:](self, "setTransitioningViewController:", v16);

  -[BKBasePresentingViewController setStateShouldOpen:](self, "setStateShouldOpen:", 1);
  -[BKBasePresentingViewController bc_setNavBarVisible:](self, "bc_setNavBarVisible:", 0);
  -[BKBasePresentingViewController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
  -[BKBasePresentingViewController setModalPresentationCapturesStatusBarAppearance:](self, "setModalPresentationCapturesStatusBarAppearance:", 1);
  v17 = objc_opt_class(BKAudiobookPreviewHelper);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetHelper](self, "assetHelper"));
  v19 = BUDynamicCast(v17, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "mAsset"));
    v22 = objc_alloc((Class)BAAppAnalyticsAdditionalData);
    v23 = objc_msgSend(v21, "supportsUnifiedProductPage");
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "editionKind"));
    v25 = objc_msgSend(v22, "initWithSupportsUnifiedProductPage:editionKind:", v23, v24);
    -[BKBasePresentingViewController setAppAnalyticsAdditionalData:](self, "setAppAnalyticsAdditionalData:", v25);

  }
  objc_initWeak(&location, self);
  v26 = [BKFrontmostAssetTracker alloc];
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "permanentOrTemporaryAssetID"));
  v32 = _NSConcreteStackBlock;
  v33 = 3221225472;
  v34 = sub_1000836F4;
  v35 = &unk_1008E7A08;
  objc_copyWeak(&v36, &location);
  v28 = -[BKFrontmostAssetTracker initWithAssetID:window:onFrontmostChanged:](v26, "initWithAssetID:window:onFrontmostChanged:", v27, 0, &v32);
  frontmostTracker = self->_frontmostTracker;
  self->_frontmostTracker = v28;

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits", v32, v33, v34, v35));
  v31 = -[BKBasePresentingViewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v30, "_traitCollectionDidChange:previousTraitCollection:");

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);

}

- (void)dealloc
{
  void *v3;
  BCReadingStatisticsController *readingStatisticsController;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  -[BKFrontmostAssetTracker setOnFrontmostChanged:](self->_frontmostTracker, "setOnFrontmostChanged:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  -[BKBasePresentingViewController _cancelInteractionTimerIfNeeded](self, "_cancelInteractionTimerIfNeeded");
  -[BKBasePresentingViewController _cancelSuccessfullyOpenedTimerIfNeeded](self, "_cancelSuccessfullyOpenedTimerIfNeeded");
  -[BCReadingStatisticsController removeObserver:](self->_readingStatisticsController, "removeObserver:", self);
  readingStatisticsController = self->_readingStatisticsController;
  self->_readingStatisticsController = 0;

  -[BKBasePresentingViewController setProgressStatus:](self, "setProgressStatus:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController sampleProfileFuture](self, "sampleProfileFuture"));
  objc_msgSend(v5, "cancel");

  -[BKBasePresentingViewController _finalizeAssetVCState](self, "_finalizeAssetVCState");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController filePresenter](self, "filePresenter"));
  objc_msgSend(v6, "deactivate");

  -[BKBasePresentingViewController setFilePresenter:](self, "setFilePresenter:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController buyButtonItem](self, "buyButtonItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "customView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewWithTag:", 7));

  objc_msgSend(v9, "removeTarget:action:forControlEvents:", self, "requestToBuy:", 64);
  v10.receiver = self;
  v10.super_class = (Class)BKBasePresentingViewController;
  -[BKBasePresentingViewController dealloc](&v10, "dealloc");
}

- (BOOL)_isAudiobook
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AEAudiobookPlugin associatedAssetType](AEAudiobookPlugin, "associatedAssetType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "asset"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "assetType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lowercaseString"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
    LOBYTE(v9) = objc_msgSend(v7, "isEqualToString:", v8);

LABEL_3:
    goto LABEL_4;
  }
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    LOBYTE(v9) = 0;
    goto LABEL_4;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](self, "assetIdentifier"));

  if (v9)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController libraryAssetProvider](self, "libraryAssetProvider"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](self, "assetIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "libraryAssetOnMainQueueWithAssetIdentifier:", v11));

    LOBYTE(v9) = objc_msgSend(v6, "isAudiobook");
    goto LABEL_3;
  }
LABEL_4:

  return (char)v9;
}

- (BOOL)_shouldTrackReadingSession
{
  void *v3;
  void *v4;
  unsigned int v5;

  if (-[BKBasePresentingViewController successfullyOpened](self, "successfullyOpened"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](self, "assetIdentifier"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "permanentAssetID"));
    if (objc_msgSend(v4, "length") && !-[BKBasePresentingViewController _isAudiobook](self, "_isAudiobook"))
      v5 = !-[BKBasePresentingViewController isSupplementalContent](self, "isSupplementalContent");
    else
      LOBYTE(v5) = 0;

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)removeFromParentViewController
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKBasePresentingViewController;
  -[BKBasePresentingViewController removeFromParentViewController](&v3, "removeFromParentViewController");
  -[BKBasePresentingViewController _finalizeAssetVCState](self, "_finalizeAssetVCState");
}

- (void)_clearCacheForBook:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  dispatch_time_t v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](self, "assetIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "permanentAssetID"));
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "asset"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "assetID"));

  }
  if (objc_msgSend(v8, "length"))
  {
    v11 = dispatch_time(0, 1000000000);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100083BD0;
    v14[3] = &unk_1008E7680;
    v15 = v8;
    v16 = v4;
    dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, v14);

  }
  else
  {
    v12 = objc_retainBlock(v4);
    v13 = v12;
    if (v12)
      (*((void (**)(id))v12 + 2))(v12);

  }
}

- (void)_finalizeAssetVCState
{
  void *v3;
  void *v4;
  void *v5;
  BCReadingStatisticsController *readingStatisticsController;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));

  if (v3)
  {
    if (-[BKBasePresentingViewController assetState](self, "assetState") < 3)
    {
      if (!-[BKBasePresentingViewController willTerminate](self, "willTerminate"))
        -[BKBasePresentingViewController _updateLastOpenBookWithAssetID:](self, "_updateLastOpenBookWithAssetID:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
      objc_msgSend(v4, "saveStateClosing:", 1);

      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
      objc_msgSend(v5, "close:", 0);

      -[BKBasePresentingViewController setAssetState:](self, "setAssetState:", 3);
      -[BCReadingStatisticsController removeObserver:](self->_readingStatisticsController, "removeObserver:", self);
      readingStatisticsController = self->_readingStatisticsController;
      self->_readingStatisticsController = 0;

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](self, "assetIdentifier"));
    v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "permanentAssetID"));

    if (-[BKBasePresentingViewController assetState](self, "assetState") <= 3)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController minifiedPresenter](self, "minifiedPresenter"));
      objc_msgSend(v8, "minifiedPresenterDidCloseAssetID:finishedConsuming:", v16, -[BKBasePresentingViewController finishedConsuming](self, "finishedConsuming"));

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
      v10 = objc_opt_respondsToSelector(v9, "assetViewControllerDidCloseAnimated:");

      if ((v10 & 1) != 0)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
        objc_msgSend(v11, "assetViewControllerDidCloseAnimated:", 0);

      }
      -[BKBasePresentingViewController setAssetState:](self, "setAssetState:", 4);
      -[BKBasePresentingViewController _clearCacheForBook:](self, "_clearCacheForBook:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController libraryAssetProvider](self, "libraryAssetProvider"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController libraryAssetProvider](self, "libraryAssetProvider"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](self, "assetIdentifier"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "libraryAssetOnMainQueueWithAssetIdentifier:", v14));
      objc_msgSend(v12, "didCloseLibraryAsset:", v15);

    }
    -[BKBasePresentingViewController setSampleToPurchasedMonitor:](self, "setSampleToPurchasedMonitor:", 0);
    -[BKBasePresentingViewController setImportInPlaceMonitor:](self, "setImportInPlaceMonitor:", 0);

  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)BKBasePresentingViewController;
  -[BKBasePresentingViewController viewDidLoad](&v28, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController view](self, "view"));
    objc_msgSend(v4, "setOpaque:", 0);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController transitioningViewController](self, "transitioningViewController"));
    v7 = objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
LABEL_7:
    v9 = (void *)v7;
    objc_msgSend(v6, "setContentViewController:", v7);

    goto LABEL_8;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController placeholderViewController](self, "placeholderViewController"));

  if (v8)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController transitioningViewController](self, "transitioningViewController"));
    v7 = objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController placeholderViewController](self, "placeholderViewController"));
    goto LABEL_7;
  }
LABEL_8:
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController transitioningViewController](self, "transitioningViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
  objc_msgSend(v11, "setAutoresizingMask:", 18);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController transitioningViewController](self, "transitioningViewController"));
  -[BKBasePresentingViewController addChildViewController:](self, "addChildViewController:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController transitioningViewController](self, "transitioningViewController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "view"));
  objc_msgSend(v13, "addSubview:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController view](self, "view"));
  objc_msgSend(v16, "bounds");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController transitioningViewController](self, "transitioningViewController"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "view"));
  objc_msgSend(v26, "setFrame:", v18, v20, v22, v24);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController transitioningViewController](self, "transitioningViewController"));
  objc_msgSend(v27, "didMoveToParentViewController:", self);

}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BKBasePresentingViewController;
  v4 = a3;
  -[BKBasePresentingViewController preferredContentSizeDidChangeForChildContentContainer:](&v9, "preferredContentSizeDidChangeForChildContentContainer:", v4);
  objc_msgSend(v4, "preferredContentSize", v9.receiver, v9.super_class);
  v6 = v5;
  v8 = v7;

  -[BKBasePresentingViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
}

- (id)childViewControllerForStatusBarStyle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController transitioningViewController](self, "transitioningViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "childViewControllerForStatusBarStyle"));

  return v3;
}

- (id)childViewControllerForStatusBarHidden
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentOpenAnimator"));
  v5 = BUProtocolCast(&OBJC_PROTOCOL___BKContentOpenAnimating, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
  v8 = 0;
  if (v7 && !v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController transitioningViewController](self, "transitioningViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "childViewControllerForStatusBarHidden"));

  }
  return v8;
}

- (BOOL)prefersStatusBarHidden
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "contentOpenAnimator"));
  v4 = BUProtocolCast(&OBJC_PROTOCOL___BKContentOpenAnimating, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  LOBYTE(v2) = objc_msgSend(v5, "statusBarHidden");
  return (char)v2;
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController transitioningViewController](self, "transitioningViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "childViewControllerForHomeIndicatorAutoHidden"));

  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD);
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (off_1009C8C60 == a6)
  {
    if (-[BKBasePresentingViewController autoDownload](self, "autoDownload")
      && -[BKLibraryDownloadStatus state](self->_progressStatus, "state") == (id)4)
    {
      v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController downloadProgressBlock](self, "downloadProgressBlock"));
      if (v13)
      {
        -[BKLibraryDownloadStatus progressValue](self->_progressStatus, "progressValue");
        v13[2](v13, 0);
      }

    }
    -[BKBasePresentingViewController _updateBuyButtonProgressIfNeeded](self, "_updateBuyButtonProgressIfNeeded");
  }
  else if (off_1009C8C68 == a6)
  {
    v14 = objc_opt_class(BKLibraryDownloadStatus);
    v15 = BUDynamicCast(v14, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](self, "assetIdentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "permanentAssetID"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "assetID"));
    v20 = objc_msgSend(v19, "isEqualToString:", v18);

    if (v20)
    {
      -[BKBasePresentingViewController _updateBuyButtonProgressIfNeeded](self, "_updateBuyButtonProgressIfNeeded");
      -[BKBasePresentingViewController _updateAssetStateAndDownloadStatus:](self, "_updateAssetStateAndDownloadStatus:", v16);
    }

  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)BKBasePresentingViewController;
    -[BKBasePresentingViewController observeValueForKeyPath:ofObject:change:context:](&v21, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (void)setProgressStatus:(id)a3
{
  BKLibraryDownloadStatus *v5;
  BKLibraryDownloadStatus **p_progressStatus;
  BKLibraryDownloadStatus *progressStatus;
  BKLibraryDownloadStatus *v8;

  v5 = (BKLibraryDownloadStatus *)a3;
  p_progressStatus = &self->_progressStatus;
  progressStatus = self->_progressStatus;
  v8 = v5;
  if (progressStatus != v5)
  {
    if (progressStatus)
    {
      -[BKLibraryDownloadStatus removeObserver:forKeyPath:context:](progressStatus, "removeObserver:forKeyPath:context:", self, CFSTR("progressValue"), off_1009C8C60);
      -[BKLibraryDownloadStatus removeObserver:forKeyPath:context:](*p_progressStatus, "removeObserver:forKeyPath:context:", self, CFSTR("state"), off_1009C8C68);
    }
    objc_storeStrong((id *)&self->_progressStatus, a3);
    -[BKBasePresentingViewController _updateBuyButtonProgressIfNeeded](self, "_updateBuyButtonProgressIfNeeded");
    if (*p_progressStatus)
    {
      -[BKLibraryDownloadStatus addObserver:forKeyPath:options:context:](*p_progressStatus, "addObserver:forKeyPath:options:context:", self, CFSTR("progressValue"), 0, off_1009C8C60);
      -[BKLibraryDownloadStatus addObserver:forKeyPath:options:context:](*p_progressStatus, "addObserver:forKeyPath:options:context:", self, CFSTR("state"), 0, off_1009C8C68);
    }
  }

}

- (void)_updateLibraryAssetFromMetadataWithURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  NSFileCoordinator *v15;
  void *v16;
  NSOperationQueue *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  BKBasePresentingViewController *v24;
  id v25;
  id v26[2];
  id location;
  void *v28;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
  if ((objc_opt_respondsToSelector(v8, "pageCountIncludingUpsell") & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
    v10 = (uint64_t)objc_msgSend(v9, "pageCountIncludingUpsell");

  }
  else
  {
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  objc_initWeak(&location, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileAccessIntent readingIntentWithURL:options:](NSFileAccessIntent, "readingIntentWithURL:options:", v6, 1));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URL"));
  v13 = v12 == 0;

  if (v13)
  {
    v18 = BCIMLog(v14);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_10069CB04();

    v20 = objc_retainBlock(v7);
    v21 = v20;
    if (v20)
      (*((void (**)(id))v20 + 2))(v20);

  }
  else
  {
    v15 = objc_opt_new(NSFileCoordinator);
    v28 = v11;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
    v17 = objc_opt_new(NSOperationQueue);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100084744;
    v22[3] = &unk_1008E7A30;
    objc_copyWeak(v26, &location);
    v23 = v6;
    v24 = self;
    v26[1] = (id)v10;
    v25 = v7;
    -[NSFileCoordinator coordinateAccessWithIntents:queue:byAccessor:](v15, "coordinateAccessWithIntents:queue:byAccessor:", v16, v17, v22);

    objc_destroyWeak(v26);
  }

  objc_destroyWeak(&location);
}

- (void)_willOpenBookAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableDictionary *v5;
  NSMutableDictionary *deferredURLOpenRequests;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  BKAssetPresentingFilePresenter *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  v3 = a3;
  if (!self->_deferredURLOpenRequests)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    deferredURLOpenRequests = self->_deferredURLOpenRequests;
    self->_deferredURLOpenRequests = v5;

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](self, "assetIdentifier"));
  v36 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "permanentOrTemporaryAssetID"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BEDocumentExternalLoadApprovalCache sharedInstance](BEDocumentExternalLoadApprovalCache, "sharedInstance"));
  objc_msgSend(v8, "removeCachedDisapprovalForBookID:", v36);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController libraryAssetProvider](self, "libraryAssetProvider"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uiChildContext"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController libraryAssetProvider](self, "libraryAssetProvider"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "libraryMutableAssetWithPermanentOrTemporaryAssetID:inManagedObjectContext:", v36, v10));

  objc_msgSend(v10, "refreshObject:mergeChanges:", v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[BKUserActivityManager sharedInstance](BKUserActivityManager, "sharedInstance"));
  objc_msgSend(v13, "startReadingAsset:", v12);

  -[BKBasePresentingViewController subscribeToFullScreenEvents](self, "subscribeToFullScreenEvents");
  v14 = objc_opt_class(BKLocation);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController openOptions](self, "openOptions"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("BKAssetPresentingOpenLocationKey")));
  v17 = BUDynamicCast(v14, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  -[BKBasePresentingViewController setAssetState:](self, "setAssetState:", 1);
  -[BKBasePresentingViewController setAssetPresenterIsSupplementalContent:](self, "setAssetPresenterIsSupplementalContent:", objc_msgSend(v12, "isSupplementalContent"));
  v19 = -[BKAssetPresentingFilePresenter initWithViewController:]([BKAssetPresentingFilePresenter alloc], "initWithViewController:", self);
  -[BKBasePresentingViewController setFilePresenter:](self, "setFilePresenter:", v19);

  if (objc_msgSend(v36, "length"))
    -[BKBasePresentingViewController _trackProgressForLibraryAsset:](self, "_trackProgressForLibraryAsset:", v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "assetViewControllerDelegate"));

  if (!v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
    objc_msgSend(v22, "setAssetViewControllerDelegate:", self);

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
  v24 = objc_opt_respondsToSelector(v23, "setAssetIsPreordered:");

  if ((v24 & 1) != 0)
  {
    v25 = objc_opt_class(NSNumber);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController openOptions](self, "openOptions"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", AEHelperNumberIsPreorderKey));
    v28 = BUDynamicCast(v25, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
    objc_msgSend(v30, "setAssetIsPreordered:", v29);

  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
  v32 = objc_opt_respondsToSelector(v31, "assetViewControllerWillOpen");

  if ((v32 & 1) != 0)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
    objc_msgSend(v33, "assetViewControllerWillOpen");

  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
  v35 = v34;
  if (v18)
    objc_msgSend(v34, "openToLocation:animated:", v18, v3);
  else
    objc_msgSend(v34, "open:", v3);

}

- (void)transitionContextWillCompleteTransitionInContainerView:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  CGRect v30;
  CGRect v31;

  v29 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(v29, "bounds");
  v31.origin.x = v7;
  v31.origin.y = v9;
  v31.size.width = v11;
  v31.size.height = v13;
  if (!CGRectEqualToRect(v30, v31))
  {
    v14 = objc_alloc_init((Class)IMViewControllerNullAnimationTransitionCoordinator);
    objc_msgSend(v14, "setContainerView:", v29);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
    objc_msgSend(v29, "bounds");
    objc_msgSend(v15, "viewWillTransitionToSize:withTransitionCoordinator:", v14, v16, v17);

    objc_msgSend(v29, "bounds");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "view"));
    objc_msgSend(v27, "setFrame:", v19, v21, v23, v25);

    objc_msgSend(v14, "_runAlongsideAnimations");
    objc_msgSend(v14, "_runAlongsideCompletionsAfterCommit");

  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
  objc_msgSend(v28, "assetViewControllerUpdateToolbarsAfterOpenAnimation");

}

- (void)transitionContextNeedsSetup
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
  objc_msgSend(v2, "assetViewControllerUpdateToolbarsForOpenAnimation");

}

- (void)willAddViewToHierarchy
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
  v4 = objc_opt_respondsToSelector(v3, "assetViewControllerWillAddView");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
    objc_msgSend(v5, "assetViewControllerWillAddView");

  }
}

- (void)_didOpenBookAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BKSampleToPurchaseMonitor *v14;
  BKSampleToPurchaseMonitor *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  _QWORD block[5];
  _QWORD v28[4];
  id v29;
  id location;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](self, "assetIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "permanentAssetID"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController libraryAssetProvider](self, "libraryAssetProvider"));
  v8 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v7, "updateLibraryAssetWithID:withLastOpenDate:completion:", v6, v8, 0);

  -[BKBasePresentingViewController setAssetState:](self, "setAssetState:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
  LOBYTE(v8) = objc_opt_respondsToSelector(v9, "assetViewControllerDidOpenAnimated:");

  if ((v8 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
    objc_msgSend(v10, "assetViewControllerDidOpenAnimated:", v3);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController minifiedPresenter](self, "minifiedPresenter"));
  objc_msgSend(v11, "minifiedPresenterDidOpenAssetID:", v6);

  -[BKBasePresentingViewController setNeedsWhitePointAdaptivityStyleUpdate](self, "setNeedsWhitePointAdaptivityStyleUpdate");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController libraryAssetProvider](self, "libraryAssetProvider"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "libraryAssetOnMainQueueWithPermanentOrTemporaryAssetID:", v6));

  if (objc_msgSend(v13, "isSample"))
  {
    objc_initWeak(&location, self);
    v14 = [BKSampleToPurchaseMonitor alloc];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000852D4;
    v28[3] = &unk_1008E7A58;
    objc_copyWeak(&v29, &location);
    v15 = -[BKSampleToPurchaseMonitor initWithAssetID:notify:](v14, "initWithAssetID:notify:", v6, v28);
    -[BKBasePresentingViewController setSampleToPurchasedMonitor:](self, "setSampleToPurchasedMonitor:", v15);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  -[BKBasePresentingViewController _sendDeferredURLOpenRequests](self, "_sendDeferredURLOpenRequests");
  if (-[BKBasePresentingViewController needToForcePagination](self, "needToForcePagination"))
  {
    -[BKBasePresentingViewController setNeedToForcePagination:](self, "setNeedToForcePagination:", 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100085320;
    block[3] = &unk_1008E72C0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
  v17 = BUProtocolCast(&OBJC_PROTOCOL___BKREICompatibilityBridge, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController upSellData](self, "upSellData"));

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController upSellData](self, "upSellData"));
      objc_msgSend(v18, "setUpSellData:", v20);

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController appAnalyticsAdditionalData](self, "appAnalyticsAdditionalData"));

    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController appAnalyticsAdditionalData](self, "appAnalyticsAdditionalData"));
      objc_msgSend(v18, "setAppAnalyticsAdditionalData:", v22);

    }
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v23, "postNotificationName:object:", CFSTR("BKAssetPresentingBookOpenComplete"), 0);

  -[BKBasePresentingViewController bkaxSetUpAccessibilityForPresentedBook](self, "bkaxSetUpAccessibilityForPresentedBook");
  if (+[BKUIPFeatures useUIPFluidBookOpenTransition](BKUIPFeatures, "useUIPFluidBookOpenTransition")
    && !-[BKBasePresentingViewController useLegacyAnimation](self, "useLegacyAnimation"))
  {
    objc_initWeak(&location, self);
    objc_copyWeak(&v26, &location);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController _preferredTransition](self, "_preferredTransition", _NSConcreteStackBlock, 3221225472, sub_100085384, &unk_1008E7A80));
    objc_msgSend(v24, "set_interactiveDismissShouldBeginHandler:", &v25);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  BOOL v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)BKBasePresentingViewController;
  -[BKBasePresentingViewController viewWillAppear:](&v18, "viewWillAppear:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController ba_analyticsTracker](self, "ba_analyticsTracker"));

  if (!v5)
    v6 = -[BKBasePresentingViewController ba_setupNewAnalyticsTrackerWithName:](self, "ba_setupNewAnalyticsTrackerWithName:", CFSTR("ContentReading"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController bc_windowForViewController](self, "bc_windowForViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootViewController"));

  if ((objc_msgSend(v8, "isPerformingModalTransition") & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController navigationController](self, "navigationController"));
    -[BKBasePresentingViewController setShouldRestoreNavBar:](self, "setShouldRestoreNavBar:", objc_msgSend(v9, "isNavigationBarHidden") ^ 1);

  }
  if (-[BKBasePresentingViewController stateShouldOpen](self, "stateShouldOpen"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));

    if (v10)
    {
      -[BKBasePresentingViewController _startBookSuccessfullyOpenedTimer](self, "_startBookSuccessfullyOpenedTimer");
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "asset"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "url"));

      if (v13)
      {
        objc_initWeak(&location, self);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_100085618;
        v14[3] = &unk_1008E7AA8;
        objc_copyWeak(&v15, &location);
        v16 = a3;
        -[BKBasePresentingViewController _updateLibraryAssetFromMetadataWithURL:completion:](self, "_updateLibraryAssetFromMetadataWithURL:completion:", v13, v14);
        objc_destroyWeak(&v15);
        objc_destroyWeak(&location);
      }

    }
  }

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[7];
  _QWORD v19[7];
  objc_super v20;
  _QWORD v21[2];
  _QWORD v22[2];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = BCCurrentBookLiveResizeLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BKBasePresentingViewController enteringFullScreen](self, "enteringFullScreen")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BKBasePresentingViewController inFullScreen](self, "inFullScreen")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BKBasePresentingViewController exitingFullScreen](self, "exitingFullScreen")));
    *(double *)v22 = width;
    *(double *)&v22[1] = height;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v22, "{CGSize=dd}"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController view](self, "view"));
    objc_msgSend(v14, "bounds");
    v21[0] = v15;
    v21[1] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v21, "{CGSize=dd}"));
    *(_DWORD *)buf = 138413314;
    v24 = v10;
    v25 = 2112;
    v26 = v11;
    v27 = 2112;
    v28 = v12;
    v29 = 2112;
    v30 = v13;
    v31 = 2112;
    v32 = v17;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "viewWillTransitionToSize enteringFullScreen:%@ exitingFullScreen:%@ inFullScreen:%@ size:%@ viewSize:%@", buf, 0x34u);

  }
  v20.receiver = self;
  v20.super_class = (Class)BKBasePresentingViewController;
  -[BKBasePresentingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v20, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  -[BKBasePresentingViewController setStateFlags:](self, "setStateFlags:", -[BKBasePresentingViewController stateFlags](self, "stateFlags") | 0x40);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000858D8;
  v19[3] = &unk_1008E7AD0;
  v19[4] = self;
  *(double *)&v19[5] = width;
  *(double *)&v19[6] = height;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100085B68;
  v18[3] = &unk_1008E7AD0;
  v18[4] = self;
  *(double *)&v18[5] = width;
  *(double *)&v18[6] = height;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v19, v18);

}

- (void)_waitForOngoingMigrationAttemptToFinish:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  _BOOL4 v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v5 = a3;
  v6 = a4;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKAssetPresentingViewController.m", 943, "-[BKBasePresentingViewController _waitForOngoingMigrationAttemptToFinish:completion:]", "[NSThread isMainThread]", CFSTR("This operation must only be performed on the main thread!"));
  if (objc_msgSend(v5, "isSupplementalContent"))
    v7 = objc_msgSend(v5, "contentType") == 3;
  else
    v7 = 0;
  if (objc_msgSend(v5, "isStore") && !v7
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "permlink")), v8, v8))
  {
    v9 = objc_retainBlock(v6);
    v10 = v9;
    if (v9)
      (*((void (**)(id))v9 + 2))(v9);
  }
  else
  {
    v11 = objc_opt_class(BKAppDelegate);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
    v13 = BUDynamicCast(v11, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ubiquitousDocumentsController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "assetID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "temporaryAssetID"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100085E60;
    v17[3] = &unk_1008E7818;
    v18 = v6;
    objc_msgSend(v14, "waitForOngoingMigrationAttemptToFinishWithAssetID:temporaryAssetID:completion:", v15, v16, v17);

  }
}

- (void)_loadAssetVC
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD *v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;

  v3 = sub_100082F2C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](self, "assetIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "permanentOrTemporaryAssetID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController loadAssetBlock](self, "loadAssetBlock"));
    v8 = objc_retainBlock(v7);
    *(_DWORD *)buf = 141558530;
    v16 = 1752392040;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%{mask.hash}@] _loadAssetVC - localAssetBlock=%@", buf, 0x20u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController loadAssetBlock](self, "loadAssetBlock"));

  if (v9)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000860A4;
    v14[3] = &unk_1008E7AF8;
    v14[4] = self;
    v10 = objc_retainBlock(v14);
    v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController loadAssetBlock](self, "loadAssetBlock"));
    ((void (**)(_QWORD, _QWORD *))v11)[2](v11, v10);
  }
  else
  {
    v10 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](self, "assetIdentifier"));
    v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController openOptions](self, "openOptions"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000860D8;
    v13[3] = &unk_1008E7AF8;
    v13[4] = self;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKAssetLookup assetLookupWithIdentifier:options:completion:](BKAssetLookup, "assetLookupWithIdentifier:options:completion:", v10, v11, v13));
    -[BKBasePresentingViewController setAssetLookup:](self, "setAssetLookup:", v12);

  }
}

- (void)loadWithAssetWithBlock:(id)a3
{
  -[BKBasePresentingViewController setLoadAssetBlock:](self, "setLoadAssetBlock:", a3);
}

- (void)_loadWithAssetViewController:(id)a3 helper:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  _QWORD *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;

  v6 = a3;
  v7 = a4;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKAssetPresentingViewController.m", 983, "-[BKBasePresentingViewController _loadWithAssetViewController:helper:]", "[NSThread isMainThread]", CFSTR("This operation must only be performed on the main thread!"));
  v8 = sub_100082F2C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](self, "assetIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "permanentOrTemporaryAssetID"));
    *(_DWORD *)buf = 141558786;
    v40 = 1752392040;
    v41 = 2112;
    v42 = v11;
    v43 = 2112;
    v44 = v6;
    v45 = 2112;
    v46 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%{mask.hash}@] _loadWithAssetViewController - assetVC=%@, helper=%@", buf, 0x2Au);

  }
  if (v6 && v7)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController placeholderViewController](self, "placeholderViewController"));
    if ((objc_opt_respondsToSelector(v12, "coverAnimationHostTopViewsToFadeOut") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController placeholderViewController](self, "placeholderViewController"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "coverAnimationHostTopViewsToFadeOut"));

    }
    else
    {
      v14 = 0;
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController placeholderViewController](self, "placeholderViewController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](self, "assetIdentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "permanentOrTemporaryAssetID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "coverAnimationHostSourceForItem:", v18));

    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100086494;
    v35[3] = &unk_1008E7B70;
    v35[4] = self;
    v36 = v6;
    v37 = v7;
    v20 = v19;
    v38 = v20;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100086974;
    v33[3] = &unk_1008E7680;
    v33[4] = self;
    v21 = objc_retainBlock(v35);
    v34 = v21;
    v22 = objc_retainBlock(v33);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100086A14;
    v30[3] = &unk_1008E7680;
    v15 = v14;
    v31 = v15;
    v23 = v22;
    v32 = v23;
    v24 = objc_retainBlock(v30);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController holdAnimationAssertion](self, "holdAnimationAssertion"));
    v26 = v25;
    if (v25)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "future"));
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100086BFC;
      v28[3] = &unk_1008E7BC0;
      v29 = v24;
      objc_msgSend(v27, "get:", v28);

    }
    else
    {
      ((void (*)(_QWORD *))v24[2])(v24);
    }

  }
  else
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController presentingViewController](self, "presentingViewController"));
    objc_msgSend(v15, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  BKBasePresentingViewController *v5;
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char *v17;
  void *v18;
  void *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  uint64_t v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD *v45;
  id v46;
  id location;
  _QWORD v48[4];
  id v49;
  _QWORD *v50;
  _QWORD v51[5];
  _QWORD v52[5];
  BKBasePresentingViewController *v53;
  objc_super v54;
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;

  v3 = a3;
  v54.receiver = self;
  v54.super_class = (Class)BKBasePresentingViewController;
  -[BKBasePresentingViewController viewDidAppear:](&v54, "viewDidAppear:");
  -[BKBasePresentingViewController subscribeToLiveResize](self, "subscribeToLiveResize");
  if (-[BKBasePresentingViewController stateShouldOpen](self, "stateShouldOpen"))
  {
    v52[0] = 0;
    v52[1] = v52;
    v52[2] = 0x3032000000;
    v52[3] = sub_10004E320;
    v52[4] = sub_10004E210;
    v5 = self;
    v53 = v5;
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_1000871CC;
    v51[3] = &unk_1008E7C10;
    v51[4] = v52;
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_10008744C;
    v48[3] = &unk_1008E7C60;
    v50 = v52;
    v6 = objc_retainBlock(v51);
    v49 = v6;
    v7 = objc_retainBlock(v48);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController libraryAssetProvider](v5, "libraryAssetProvider"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](v5, "assetIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "libraryAssetOnMainQueueWithAssetIdentifier:", v9));

    v11 = sub_100082F2C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](v5, "assetIdentifier"));
      *(_DWORD *)buf = 141558530;
      v56 = 1752392040;
      v57 = 2112;
      v58 = v13;
      v59 = 2112;
      v60 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[%{mask.hash}@] libraryAsset: %@", buf, 0x20u);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController parentViewController](v5, "parentViewController"));

    if (v14)
      -[BKBasePresentingViewController setStateShouldOpen:](v5, "setStateShouldOpen:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](v5, "assetViewController"));

    if (v15)
    {
      -[BKBasePresentingViewController _didOpenBookAnimated:](v5, "_didOpenBookAnimated:", v3);
    }
    else if (-[BKBasePresentingViewController autoOpen](v5, "autoOpen")
           && ((objc_msgSend(v10, "isLocal") & 1) != 0 || objc_msgSend(v10, "streamable")))
    {
      if (objc_msgSend(v10, "isLocal"))
        v28 = v7;
      else
        v28 = v6;
      ((void (*)(_QWORD *, void *))v28[2])(v28, v10);
    }
    else if (-[BKBasePresentingViewController autoDownload](v5, "autoDownload"))
    {
      objc_initWeak(&location, v5);
      -[BKBasePresentingViewController setStateFlags:](v5, "setStateFlags:", -[BKBasePresentingViewController stateFlags](v5, "stateFlags") | 8);
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](v5, "assetIdentifier"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "permanentOrTemporaryAssetID"));

      v31 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryAssetStatusController sharedController](BKLibraryAssetStatusController, "sharedController"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "statusForAssetID:", v30));
      -[BKBasePresentingViewController setProgressStatus:](v5, "setProgressStatus:", v32);

      v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController progressStatus](v5, "progressStatus"));
      v34 = 0.0;
      if (objc_msgSend(v33, "state") == (id)4)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController progressStatus](v5, "progressStatus"));
        objc_msgSend(v35, "progressValue");
        v34 = v36;

      }
      v37 = objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController downloadProgressBlock](v5, "downloadProgressBlock"));
      v38 = (void *)v37;
      if (v37)
        (*(void (**)(uint64_t, _QWORD, double))(v37 + 16))(v37, 0, v34);

      v39 = sub_100082F2C();
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 141558274;
        v56 = 1752392040;
        v57 = 2112;
        v58 = v30;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "[%{mask.hash}@] Attempt to resolve to local", buf, 0x16u);
      }

      v41 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController libraryAssetProvider](v5, "libraryAssetProvider"));
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_100087A70;
      v43[3] = &unk_1008E7CB0;
      v42 = v30;
      v44 = v42;
      objc_copyWeak(&v46, &location);
      v45 = v7;
      objc_msgSend(v41, "resolveToLocalAssetWithAssetID:completion:", v42, v43);

      objc_destroyWeak(&v46);
      objc_destroyWeak(&location);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v17 = (char *)objc_msgSend(v16, "orientation");

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController bc_windowForViewController](v5, "bc_windowForViewController"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "windowScene"));
    v20 = (char *)objc_msgSend(v19, "interfaceOrientation");

    v23 = isPhone(v21, v22);
    if ((unint64_t)(v17 - 3) < 2)
      v24 = v23;
    else
      v24 = 0;
    if (v24 == 1 && (unint64_t)(v20 - 1) <= 1)
      +[UIViewController attemptRotationToDeviceOrientation](UIViewController, "attemptRotationToDeviceOrientation");
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "primarySceneController"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "primaryScenePresenting"));

    objc_msgSend(v27, "presenterDidStartReadingExperienceWithAssetPresenter:", v5);
    _Block_object_dispose(v52, 8);

  }
}

- (void)willMoveToParentViewController:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKBasePresentingViewController;
  -[BKBasePresentingViewController willMoveToParentViewController:](&v5, "willMoveToParentViewController:");
  -[BKBasePresentingViewController setStateShouldClose:](self, "setStateShouldClose:", a3 == 0);
}

- (BKMinifiedPresenting)minifiedPresenter
{
  BKMinifiedPresenting **p_minifiedPresenter;
  id WeakRetained;
  void *v5;

  p_minifiedPresenter = &self->_minifiedPresenter;
  WeakRetained = objc_loadWeakRetained((id *)&self->_minifiedPresenter);

  if (!WeakRetained)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController im_ancestorFlowControllerConformingToProtocol:](self, "im_ancestorFlowControllerConformingToProtocol:", &OBJC_PROTOCOL___BKMinifiedPresenting));
    objc_storeWeak((id *)p_minifiedPresenter, v5);

  }
  return (BKMinifiedPresenting *)objc_loadWeakRetained((id *)p_minifiedPresenter);
}

- (void)didMoveToParentViewController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKBasePresentingViewController;
  -[BKBasePresentingViewController didMoveToParentViewController:](&v4, "didMoveToParentViewController:", a3);
  -[BKBasePresentingViewController setStateShouldClose:](self, "setStateShouldClose:", 0);
}

- (void)viewWillMoveToWindow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BKBasePresentingViewController;
  -[BKBasePresentingViewController viewWillMoveToWindow:](&v12, "viewWillMoveToWindow:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));

  if (v4 && v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "asset"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayTitle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "windowScene"));
    objc_msgSend(v9, "setTitle:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController im_ancestorFlowControllerConformingToProtocol:](self, "im_ancestorFlowControllerConformingToProtocol:", &OBJC_PROTOCOL___BKSceneHosting));
    objc_msgSend(v10, "updateAllAssetPresenterCloseStateTypes");

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController frontmostTracker](self, "frontmostTracker"));
  objc_msgSend(v11, "setWindow:", v4);

}

- (void)_handleClosingCleanup:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BCReadingStatisticsController *readingStatisticsController;
  uint8_t v13[16];

  v3 = a3;
  -[BKBasePresentingViewController unsubscribeFromFullScreenEvents](self, "unsubscribeFromFullScreenEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController sessionID](self, "sessionID"));

  if (v5)
  {
    v6 = BCBookPromotionLog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Ending reading session due to another asset being opened.", v13, 2u);
    }

    -[BKBasePresentingViewController _endReadingSessionForEventType:withCompletion:](self, "_endReadingSessionForEventType:withCompletion:", 2, 0);
  }
  -[BKBasePresentingViewController setAssetState:](self, "setAssetState:", 3);
  if ((-[BKBasePresentingViewController stateFlags](self, "stateFlags") & 0x100) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
    v9 = BUProtocolCast(&OBJC_PROTOCOL___AEAssetViewController, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    objc_msgSend(v10, "saveStateClosing:", 1);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
  objc_msgSend(v11, "close:", v3);

  if (!-[BKBasePresentingViewController willTerminate](self, "willTerminate"))
    -[BKBasePresentingViewController _updateLastOpenBookWithAssetID:](self, "_updateLastOpenBookWithAssetID:", 0);
  -[BCReadingStatisticsController removeObserver:](self->_readingStatisticsController, "removeObserver:", self);
  readingStatisticsController = self->_readingStatisticsController;
  self->_readingStatisticsController = 0;

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKBasePresentingViewController;
  -[BKBasePresentingViewController viewWillDisappear:](&v9, "viewWillDisappear:");
  -[BKBasePresentingViewController unsubscribeToLiveResize](self, "unsubscribeToLiveResize");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "keyWindow"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rootViewController"));

  if (-[BKBasePresentingViewController shouldRestoreNavBar](self, "shouldRestoreNavBar")
    && (objc_msgSend(v7, "isPerformingModalTransition") & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController navigationController](self, "navigationController"));
    objc_msgSend(v8, "setNavigationBarHidden:animated:", 0, 0);

  }
  if (-[BKBasePresentingViewController stateShouldClose](self, "stateShouldClose")
    && !+[BKUIPFeatures useUIPFluidBookOpenTransition](BKUIPFeatures, "useUIPFluidBookOpenTransition"))
  {
    -[BKBasePresentingViewController _handleClosingCleanup:](self, "_handleClosingCleanup:", v3);
  }

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;

  v3 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BKBasePresentingViewController;
  -[BKBasePresentingViewController viewDidDisappear:](&v32, "viewDidDisappear:");
  if (-[BKBasePresentingViewController stateShouldClose](self, "stateShouldClose")
    && !-[BKBasePresentingViewController preparingEndOfBookExperience](self, "preparingEndOfBookExperience"))
  {
    if (+[BKUIPFeatures useUIPFluidBookOpenTransition](BKUIPFeatures, "useUIPFluidBookOpenTransition"))
      -[BKBasePresentingViewController _handleClosingCleanup:](self, "_handleClosingCleanup:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](self, "assetIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "permanentAssetID"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BCProgressKitController sharedController](BCProgressKitController, "sharedController"));
    objc_msgSend(v7, "didCloseBookWithAssetID:completion:", v6, 0);

    v8 = objc_opt_class(NSNumber);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController openOptions](self, "openOptions"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("BKBookPresentingSecure")));
    v11 = BUDynamicCast(v8, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = objc_msgSend(v12, "BOOLValue");

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "asset"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "url"));

      objc_msgSend(v16, "stopAccessingSecurityScopedResource");
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
    v18 = objc_opt_respondsToSelector(v17, "assetViewControllerDidCloseAnimated:");

    if ((v18 & 1) != 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
      objc_msgSend(v19, "assetViewControllerDidCloseAnimated:", v3);

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[BKUserActivityManager sharedInstance](BKUserActivityManager, "sharedInstance"));
    objc_msgSend(v20, "stopReadingCurrentAsset");

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController libraryAssetProvider](self, "libraryAssetProvider"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController libraryAssetProvider](self, "libraryAssetProvider"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](self, "assetIdentifier"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "libraryAssetOnMainQueueWithAssetIdentifier:", v23));
    objc_msgSend(v21, "didCloseLibraryAsset:", v24);

    if ((-[BKBasePresentingViewController stateFlags](self, "stateFlags") & 0x80) != 0)
    {
      +[BKBasePresentingViewController clearLastKnownSuccessfullyOpenBookID](BKAssetPresentingViewController, "clearLastKnownSuccessfullyOpenBookID");
      +[BKBasePresentingViewController clearLastKnownSuccessfullyOpenedCurrentBookID](BKAssetPresentingViewController, "clearLastKnownSuccessfullyOpenedCurrentBookID");
      -[BKBasePresentingViewController setStateFlags:](self, "setStateFlags:", -[BKBasePresentingViewController stateFlags](self, "stateFlags") | 0xFFFFFFFFFFFFFF7FLL);
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController minifiedPresenter](self, "minifiedPresenter"));
    objc_msgSend(v25, "minifiedPresenterUpdateCurrentBookWithCompletion:", 0);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController minifiedPresenter](self, "minifiedPresenter"));
    objc_msgSend(v26, "minifiedPresenterDidCloseAssetID:finishedConsuming:", v6, -[BKBasePresentingViewController finishedConsuming](self, "finishedConsuming"));

    -[BKBasePresentingViewController setAssetState:](self, "setAssetState:", 4);
    -[BKBasePresentingViewController _clearCacheForBook:](self, "_clearCacheForBook:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v27, "postNotificationName:object:", CFSTR("BKBookDidCloseNotificationName"), self);

    -[BKBasePresentingViewController setUpSellData:](self, "setUpSellData:", 0);
    -[BKBasePresentingViewController setAppAnalyticsAdditionalData:](self, "setAppAnalyticsAdditionalData:", 0);
    -[BKBasePresentingViewController setStateShouldOpen:](self, "setStateShouldOpen:", 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
    objc_msgSend(v28, "setAssetViewControllerDelegate:", 0);

  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "primarySceneController"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "primaryScenePresenting"));

  objc_msgSend(v31, "presenterDidEndReadingExperienceWithAssetPresenter:", self);
}

- (BOOL)im_tabBarVisible
{
  return 0;
}

- (void)setAssetViewController:(id)a3
{
  AEAssetViewController **p_assetViewController;
  id v6;
  id v7;

  p_assetViewController = &self->_assetViewController;
  objc_storeStrong((id *)&self->_assetViewController, a3);
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController ba_analyticsTracker](self, "ba_analyticsTracker"));
  -[AEAssetViewController ba_setAnalyticsTracker:](*p_assetViewController, "ba_setAnalyticsTracker:", v7);

}

- (void)ba_setAnalyticsTracker:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKBasePresentingViewController;
  v4 = a3;
  -[BKBasePresentingViewController ba_setAnalyticsTracker:](&v6, "ba_setAnalyticsTracker:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController", v6.receiver, v6.super_class));
  objc_msgSend(v5, "ba_setAnalyticsTracker:", v4);

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;
  objc_super v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
  v4 = objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___BCOrientationControlling);

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
LABEL_5:
    v8 = v5;
    v9 = objc_msgSend(v5, "supportedInterfaceOrientations");

    return (unint64_t)v9;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController childModalViewController](self, "childModalViewController"));
  v7 = objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___BCOrientationControlling);

  if (v7)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController childModalViewController](self, "childModalViewController"));
    goto LABEL_5;
  }
  v11.receiver = self;
  v11.super_class = (Class)BKBasePresentingViewController;
  return -[BKBasePresentingViewController supportedInterfaceOrientations](&v11, "supportedInterfaceOrientations");
}

- (void)_applicationDidBecomeActiveNotification:(id)a3
{
  id v4;

  -[BKBasePresentingViewController setIsResigningActive:](self, "setIsResigningActive:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController filePresenter](self, "filePresenter"));
  objc_msgSend(v4, "activate");

}

- (void)_applicationWillResignActiveNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[BKBasePresentingViewController setIsResigningActive:](self, "setIsResigningActive:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController filePresenter](self, "filePresenter"));
  objc_msgSend(v4, "deactivate");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](self, "assetIdentifier"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "permanentAssetID"));

  +[BKLibraryIndexer establishBackgroundTaskForProgressUpdateOfAsset:](BKLibraryIndexer, "establishBackgroundTaskForProgressUpdateOfAsset:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
  objc_msgSend(v6, "saveStateClosing:suspending:", 0, 1);

}

- (void)assetPresenterPrepareForTermination
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = BCBookPromotionLog(-[BKBasePresentingViewController setWillTerminate:](self, "setWillTerminate:", 1));
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Ending reading session due to termination.", v5, 2u);
  }

  -[BKBasePresentingViewController _endReadingSessionForEventType:withCompletion:](self, "_endReadingSessionForEventType:withCompletion:", 2, 0);
}

- (void)_startInteractionTimer
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BCJSConfiguration sharedInstance](BCJSConfiguration, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "timeThresholdForOpenEvent"));
  v5 = objc_msgSend(v4, "longLongValue");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](self, "assetIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "permanentAssetID"));

  v8 = objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController sessionID](self, "sessionID"));
  if (v8)
  {
    v9 = (void *)v8;
    v10 = -[BKBasePresentingViewController _shouldTrackReadingSession](self, "_shouldTrackReadingSession");

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController confirmActiveTimer](self, "confirmActiveTimer"));

      if (!v11)
      {
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_100088908;
        v13[3] = &unk_1008E7CD8;
        v14 = v7;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v13, (double)(uint64_t)v5));
        -[BKBasePresentingViewController setConfirmActiveTimer:](self, "setConfirmActiveTimer:", v12);

      }
    }
  }

}

- (void)_cancelInteractionTimerIfNeeded
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController confirmActiveTimer](self, "confirmActiveTimer"));
  objc_msgSend(v3, "invalidate");

  -[BKBasePresentingViewController setConfirmActiveTimer:](self, "setConfirmActiveTimer:", 0);
}

- (void)_assetPresenterWillEnterForeground
{
  void *v3;
  char v4;
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  -[BKBasePresentingViewController assetPresenterUpdateCloseTypeState](self, "assetPresenterUpdateCloseTypeState");
  -[BKBasePresentingViewController _refreshReadingState](self, "_refreshReadingState");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
  v4 = objc_opt_respondsToSelector(v3, "assetViewControllerWillEnterForeground");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
    objc_msgSend(v5, "assetViewControllerWillEnterForeground");

  }
  v6 = -[BKBasePresentingViewController successfullyOpened](self, "successfullyOpened");
  if (v6)
  {
    v7 = BCCurrentBookLog(v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Book entered foreground, resuming existing reading session", v14, 2u);
    }

    -[BKBasePresentingViewController _beginReadingSessionForEventType:](self, "_beginReadingSessionForEventType:", 4);
    -[BKBasePresentingViewController _startInteractionTimer](self, "_startInteractionTimer");
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));

    if (v9)
    {
      v11 = BCCurrentBookLog(v10);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Book entered foreground with no current reading session yet.", buf, 2u);
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController sessionID](self, "sessionID"));
      if (v13)
        BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKAssetPresentingViewController.m", 1498, "-[BKBasePresentingViewController _assetPresenterWillEnterForeground]", "!self.sessionID", 0);
      -[BKBasePresentingViewController _startBookSuccessfullyOpenedTimer](self, "_startBookSuccessfullyOpenedTimer");
    }
  }
}

- (void)_assetPresenterDidEnterBackground
{
  _BOOL8 v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  uint8_t v9[16];

  -[BKBasePresentingViewController _cancelInteractionTimerIfNeeded](self, "_cancelInteractionTimerIfNeeded");
  -[BKBasePresentingViewController _cancelSuccessfullyOpenedTimerIfNeeded](self, "_cancelSuccessfullyOpenedTimerIfNeeded");
  v3 = -[BKBasePresentingViewController _shouldTrackReadingSession](self, "_shouldTrackReadingSession");
  if (v3)
  {
    v4 = BCBookPromotionLog(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Ending reading session due to scene backgrounding.", v9, 2u);
    }

    -[BKBasePresentingViewController _endReadingSessionForEventType:withCompletion:](self, "_endReadingSessionForEventType:withCompletion:", 3, 0);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
  v7 = objc_opt_respondsToSelector(v6, "assetViewControllerDidEnterBackground");

  if ((v7 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
    objc_msgSend(v8, "assetViewControllerDidEnterBackground");

  }
}

- (void)_refreshReadingState
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t v12[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "asset"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url"));

  if (v5)
  {
    v6 = objc_msgSend(v5, "isFileURL");
    if ((_DWORD)v6
      && (v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager")),
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path")),
          v9 = objc_msgSend(v7, "fileExistsAtPath:", v8),
          v8,
          v7,
          (v9 & 1) == 0))
    {
      -[BKBasePresentingViewController im_dismissAnimated:](self, "im_dismissAnimated:", 1);
    }
    else
    {
      v10 = BCCurrentBookLog(v6);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "No file path - doing nothing in _refreshReadingState ", v12, 2u);
      }

    }
  }

}

+ (id)animatorForAsset:(id)a3 isCurrentBook:(BOOL)a4 opening:(BOOL)a5 largeCover:(BOOL)a6 skipZoom:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL4 v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "assetType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[AEAudiobookPlugin associatedAssetType](AEAudiobookPlugin, "associatedAssetType"));
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if (v12)
  {
    if (v9 && v8)
    {
      v13 = -[BKBookOpenAnimator initOpening:]([BKAudiobookSlideOpenAnimator alloc], "initOpening:", 1);
    }
    else
    {
      v13 = -[BKBookOpenAnimator initOpening:]([BKAudiobookOpenAnimator alloc], "initOpening:", v9);
      objc_msgSend(v13, "setUseLegacyTiming:", 0);
    }
  }
  else
  {
    v13 = -[BKBookBloomOpenAnimator initOpening:]([BKBookBloomOpenAnimator alloc], "initOpening:", v9);
    v14 = objc_opt_class(BKBookBloomOpenAnimator);
    v15 = BUDynamicCast(v14, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    objc_msgSend(v16, "setUseShadowEffects:", 1);

  }
  v17 = objc_opt_class(BKBookZoomRevealOpenAnimator);
  v18 = BUDynamicCast(v17, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  objc_msgSend(v19, "setSkipZoomPhase:", v7);

  return v13;
}

+ (id)defaultAnimatorForOpening:(BOOL)a3 skipReveal:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  v5 = -[BKBookBloomOpenAnimator initOpening:]([BKBookBloomOpenAnimator alloc], "initOpening:", a3);
  objc_msgSend(v5, "setSkipReveal:", v4);
  objc_msgSend(v5, "setUseShadowEffects:", 1);
  return v5;
}

- (void)_reloadAssetCloseViewController:(BOOL)a3
{
  _BOOL8 v3;
  BKSnapshotViewController *v5;
  void *v6;
  BKSnapshotViewController *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;

  v3 = a3;
  v5 = [BKSnapshotViewController alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
  v7 = -[BKSnapshotViewController initWithViewController:](v5, "initWithViewController:", v6);

  v8 = sub_100082F2C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](self, "assetIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "permanentOrTemporaryAssetID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
    *(_DWORD *)buf = 141558530;
    v23 = 1752392040;
    v24 = 2112;
    v25 = v11;
    v26 = 2112;
    v27 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%{mask.hash}@] _reloadAssetCloseViewController close:%@", buf, 0x20u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
  v14 = objc_opt_respondsToSelector(v13, "assetViewControllerPrepareForReload");

  if ((v14 & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
    objc_msgSend(v15, "assetViewControllerPrepareForReload");

  }
  if (v3)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
    objc_msgSend(v16, "close:", 0);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
    v18 = objc_opt_respondsToSelector(v17, "assetViewControllerDidCloseAnimated:");

    if ((v18 & 1) != 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
      objc_msgSend(v19, "assetViewControllerDidCloseAnimated:", 0);

    }
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController transitioningViewController](self, "transitioningViewController"));
  objc_msgSend(v20, "setContentViewController:", v7);

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000890AC;
  v21[3] = &unk_1008E72C0;
  v21[4] = self;
  -[BKBasePresentingViewController _clearCacheForBook:](self, "_clearCacheForBook:", v21);

}

- (void)dismissLibraryBookCoverViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController im_ancestorFlowControllerConformingToProtocol:](self, "im_ancestorFlowControllerConformingToProtocol:", &OBJC_PROTOCOL___BKSceneHosting));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController _sceneControllerCurrentlyHostingAssetPresenter](self, "_sceneControllerCurrentlyHostingAssetPresenter"));
  objc_msgSend(v7, "handleCloseAssetForSceneController:assetPresentingViewController:animated:", v6, self, v4);

}

- (void)assetViewController:(id)a3 willOpen:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController viewIfLoaded](self, "viewIfLoaded"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "asset"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayTitle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController viewIfLoaded](self, "viewIfLoaded"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "windowScene"));
    objc_msgSend(v11, "setTitle:", v8);

  }
}

- (void)assetViewController:(id)a3 willClose:(BOOL)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](self, "assetIdentifier", a3, a4));
  v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "permanentAssetID"));

  if (objc_msgSend(v17, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v17));
    v7 = objc_opt_class(BKAppDelegate);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "delegate"));
    v10 = BUDynamicCast(v7, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "libraryAssetIsNewManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));
    objc_msgSend(v12, "resetIsNewForAssetIDs:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "libraryAssetIsNewManager"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));
    objc_msgSend(v14, "resetProgressHighWaterMarkForAssetIDs:", v15);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController minifiedPresenter](self, "minifiedPresenter"));
  objc_msgSend(v16, "minifiedPresenterWillCloseAsset");

}

- (double)_transitionDurationForLiveResizeOfViewController:(id)a3
{
  id v3;
  double v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector(v3, "animateLiveResizeTransitions") & 1) != 0)
  {
    if (objc_msgSend(v3, "animateLiveResizeTransitions"))
      v4 = 0.2;
    else
      v4 = 0.0;
  }
  else
  {
    v4 = 0.2;
  }

  return v4;
}

- (void)_clearLiveResizeViews
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController liveResizeWrapperView](self, "liveResizeWrapperView"));
  objc_msgSend(v3, "removeFromSuperview");

  -[BKBasePresentingViewController setLiveResizeWrapperView:](self, "setLiveResizeWrapperView:", 0);
  -[BKBasePresentingViewController setScrimLiveResizeView:](self, "setScrimLiveResizeView:", 0);
  -[BKBasePresentingViewController setScrimLiveResizeBlurView:](self, "setScrimLiveResizeBlurView:", 0);
  -[BKBasePresentingViewController setOverlayView:](self, "setOverlayView:", 0);
}

- (void)assetViewController:(id)a3 attemptClose:(BOOL)a4
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "primarySceneController"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "primaryScenePresenting"));

  objc_msgSend(v7, "presenterUpdateReadingNowAssetVisibility:assetPresenter:", 0, self);
}

- (void)assetViewController:(id)a3 cancelledClose:(BOOL)a4
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "primarySceneController"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "primaryScenePresenting"));

  objc_msgSend(v7, "presenterUpdateReadingNowAssetVisibility:assetPresenter:", 1, self);
}

- (void)didFinishUpdateForAssetViewController:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];

  if (-[BKBasePresentingViewController inLiveResize](self, "inLiveResize", a3)
    || !-[BKBasePresentingViewController scrimAppliedForLiveResize](self, "scrimAppliedForLiveResize"))
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController transitioningViewController](self, "transitioningViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));
    objc_msgSend(v12, "setAlpha:", 1.0);

  }
  else
  {
    v4 = BCCurrentBookLiveResizeLog(-[BKBasePresentingViewController setScrimAppliedForLiveResize:](self, "setScrimAppliedForLiveResize:", 0));
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      sub_10069CEDC(self);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
    -[BKBasePresentingViewController _transitionDurationForLiveResizeOfViewController:](self, "_transitionDurationForLiveResizeOfViewController:", v6);
    if (v7 == 0.0
      || (v8 = v7, -[BKBasePresentingViewController enteringFullScreen](self, "enteringFullScreen"))
      || -[BKBasePresentingViewController exitingFullScreen](self, "exitingFullScreen"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController liveResizeWrapperView](self, "liveResizeWrapperView"));
      objc_msgSend(v9, "setAlpha:", 0.0);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController transitioningViewController](self, "transitioningViewController"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
      objc_msgSend(v11, "setAlpha:", 1.0);

      -[BKBasePresentingViewController _clearLiveResizeViews](self, "_clearLiveResizeViews");
      if ((objc_opt_respondsToSelector(v6, "assetViewControllerDidFinishUpdateForLiveResize") & 1) != 0)
        objc_msgSend(v6, "assetViewControllerDidFinishUpdateForLiveResize");
    }
    else
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10008A000;
      v16[3] = &unk_1008E72C0;
      v16[4] = self;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10008A06C;
      v14[3] = &unk_1008E7D28;
      v14[4] = self;
      v15 = v6;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v16, v14, v8);

    }
  }
}

- (BOOL)assetViewControllerIsCurrentBook:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKBasePresentingViewController lastKnownOpenedCurrentBookID](BKAssetPresentingViewController, "lastKnownOpenedCurrentBookID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "asset"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "assetID"));
  v7 = objc_msgSend(v6, "isEqualToString:", v4);

  return v7;
}

- (id)_sceneControllerCurrentlyHostingAssetPresenter
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController im_ancestorFlowControllerConformingToProtocol:](self, "im_ancestorFlowControllerConformingToProtocol:", &OBJC_PROTOCOL___BKSceneHosting));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sceneControllerForViewController:", self));

  return v4;
}

- (BOOL)_isHostedInAuxiliaryScene
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController _sceneControllerCurrentlyHostingAssetPresenter](self, "_sceneControllerCurrentlyHostingAssetPresenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "primarySceneController"));
  v6 = v4 != v5;

  return v6;
}

- (id)_closeBarButtonTitle
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController im_ancestorFlowControllerConformingToProtocol:](self, "im_ancestorFlowControllerConformingToProtocol:", &OBJC_PROTOCOL___BKSceneHosting));
  if (objc_msgSend(v2, "closeTypeForForegroundedScene"))
  {
    v3 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Library"), &stru_10091C438, 0));

  }
  return v3;
}

- (BOOL)assetViewController:(id)a3 requestOpenURL:(id)a4 likelyUserInitiated:(BOOL)a5
{
  _BOOL8 v5;
  NSMutableDictionary *deferredURLOpenRequests;
  id v7;
  void *v8;
  id v10;
  void *v11;
  id v12;

  v5 = a5;
  deferredURLOpenRequests = self->_deferredURLOpenRequests;
  if (deferredURLOpenRequests)
  {
    v7 = a4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5));
    -[NSMutableDictionary setObject:forKey:](deferredURLOpenRequests, "setObject:forKey:", v8, v7);
  }
  else
  {
    v10 = a4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sceneControllerForViewController:", self));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5));
    v12 = objc_msgSend(v7, "newShowURLTransaction");
    objc_msgSend(v8, "handleApplicationURL:sourceApplication:annotation:likelyUserInitiated:transaction:", v10, CFSTR("__self__"), 0, v11, v12);

  }
  return 1;
}

- (BOOL)assetViewController:(id)a3 requestClose:(BOOL)a4 error:(id)a5
{
  return -[BKBasePresentingViewController assetViewController:requestClose:finishedConsuming:error:withErrorBlock:](self, "assetViewController:requestClose:finishedConsuming:error:withErrorBlock:", a3, a4, 0, a5, 0);
}

- (BOOL)assetViewController:(id)a3 requestClose:(BOOL)a4 finishedConsuming:(BOOL)a5 error:(id)a6 withErrorBlock:(id)a7
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  unint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  id v22;
  void *v23;
  int v25;
  unint64_t v26;

  v9 = a5;
  v10 = a4;
  v12 = a3;
  v13 = a6;
  v14 = a7;
  if (v13)
    -[BKBasePresentingViewController setStateFlags:](self, "setStateFlags:", -[BKBasePresentingViewController stateFlags](self, "stateFlags") | 0x80);
  -[BKBasePresentingViewController setFinishedConsuming:](self, "setFinishedConsuming:", v9);
  if (objc_msgSend(v12, "conformsToProtocol:", &OBJC_PROTOCOL___AEAssetViewController))
  {
    -[BKBasePresentingViewController setStateFlags:](self, "setStateFlags:", -[BKBasePresentingViewController stateFlags](self, "stateFlags") | 0x100);
    objc_msgSend(v12, "saveStateClosing:", 1);
  }
  v15 = -[BKBasePresentingViewController stateFlags](self, "stateFlags");
  if ((v15 & 1) != 0)
  {
    v18 = BCCurrentBookLog(v15);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v25 = 134217984;
      v26 = -[BKBasePresentingViewController stateFlags](self, "stateFlags");
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Asset requested to close but delaying it due to state: %ld", (uint8_t *)&v25, 0xCu);
    }

    -[BKBasePresentingViewController setStateFlags:](self, "setStateFlags:", -[BKBasePresentingViewController stateFlags](self, "stateFlags") | 2);
    -[BKBasePresentingViewController setErrorCloseBlock:](self, "setErrorCloseBlock:", v14);
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController im_ancestorFlowControllerConformingToProtocol:](self, "im_ancestorFlowControllerConformingToProtocol:", &OBJC_PROTOCOL___BKSceneHosting));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController _sceneControllerCurrentlyHostingAssetPresenter](self, "_sceneControllerCurrentlyHostingAssetPresenter"));
    if (v17)
    {
      objc_msgSend(v16, "handleCloseAssetForSceneController:assetPresentingViewController:animated:", v17, self, v10);
    }
    else
    {
      v20 = sub_100082F2C();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Don't need to close asset view controller because it is already disconnected from its scene controller", (uint8_t *)&v25, 2u);
      }

    }
    v22 = objc_retainBlock(v14);
    v23 = v22;
    if (v22)
      (*((void (**)(id))v22 + 2))(v22);

  }
  return 1;
}

- (void)requestToBuy:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  BKBasePresentingViewController *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController _buyButton](self, "_buyButton", a3));
  objc_msgSend(v4, "setDisableInteraction:", 1);
  objc_msgSend(v4, "setModeState:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008A670;
  v7[3] = &unk_1008E73F0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[BKBasePresentingViewController assetViewControllerRequestToBuy:completion:](self, "assetViewControllerRequestToBuy:completion:", v5, v7);

}

- (void)assetViewController:(id)a3 handleFamilyChangeError:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneControllerForViewController:](BKAppDelegate, "sceneControllerForViewController:", a3));
  v11 = v7;
  if (!v7)
  {
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKAssetPresentingViewController.m", 1944, "-[BKBasePresentingViewController assetViewController:handleFamilyChangeError:]", "sceneController", 0);
    v7 = 0;
  }
  v8 = objc_msgSend(v7, "newShowAssetTransaction");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController im_ancestorFlowControllerConformingToProtocol:](self, "im_ancestorFlowControllerConformingToProtocol:", &OBJC_PROTOCOL___BKBookPresenting));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](self, "assetIdentifier"));
  objc_msgSend(v9, "handleFamilyChangeErrorWithTransaction:error:assetIdentifier:", v8, v6, v10);

}

- (void)assetViewControllerSignificantReadingLocationChange:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(a3, "saveStateClosing:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](self, "assetIdentifier"));
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "permanentAssetID"));

  if (objc_msgSend(v15, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v15));
    v6 = objc_opt_class(BKAppDelegate);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delegate"));
    v9 = BUDynamicCast(v6, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "libraryAssetIsNewManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
    objc_msgSend(v11, "resetIsNewForAssetIDs:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "libraryAssetIsNewManager"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
    objc_msgSend(v13, "resetProgressHighWaterMarkForAssetIDs:", v14);

  }
}

- (void)assetViewController:(id)a3 assetPropertyChanged:(id)a4
{
  void *v5;
  _QWORD v6[5];

  if (+[BKLibraryAsset hasBookReachedReadThreshold:](BKLibraryAsset, "hasBookReachedReadThreshold:", a4))
  {
    if ((-[BKBasePresentingViewController stateFlags](self, "stateFlags") & 0x10) == 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController libraryAssetProvider](self, "libraryAssetProvider"));
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_10008AA78;
      v6[3] = &unk_1008E7DA0;
      v6[4] = self;
      objc_msgSend(v5, "performBlockOnWorkerQueue:", v6);

    }
  }
}

- (id)assetViewControllerMinifiedBarButtonItem:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController minifiedPresenter](self, "minifiedPresenter", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "minifiedPresenterBarButtonItem"));

  return v4;
}

- (id)_fetchSampleProfileFuture
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKAssetPresentingViewController.m", 1986, "-[BKBasePresentingViewController _fetchSampleProfileFuture]", "[NSThread isMainThread]", CFSTR("This operation must only be performed on the main thread!"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController sampleProfileFuture](self, "sampleProfileFuture"));
  if (!-[BKBasePresentingViewController didFetchProfile](self, "didFetchProfile"))
  {
    -[BKBasePresentingViewController setDidFetchProfile:](self, "setDidFetchProfile:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](self, "assetIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "permanentAssetID"));

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10008AC54;
    v7[3] = &unk_1008E7D50;
    v8 = v3;
    -[BKBasePresentingViewController _fetchProfileForStoreID:completion:](self, "_fetchProfileForStoreID:completion:", v5, v7);

  }
  return v3;
}

- (id)assetViewControllerBuyButtonItem:(id)a3 isSample:(BOOL)a4 isPreorder:(BOOL)a5 storeID:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id location;

  v8 = a4;
  v10 = a3;
  v11 = a6;
  v12 = v11;
  v13 = 0;
  if (v8 && !a5)
  {
    if (objc_msgSend(v11, "length"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController buyButtonItem](self, "buyButtonItem"));

      if (!v14)
      {
        v15 = -[BKBasePresentingViewController _newBarButtonItemWithBuyButton](self, "_newBarButtonItemWithBuyButton");
        -[BKBasePresentingViewController setBuyButtonItem:](self, "setBuyButtonItem:", v15);

        v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController _buyButton](self, "_buyButton"));
        objc_msgSend(v16, "setModeState:", 0);
        objc_msgSend(v16, "addTarget:action:forControlEvents:", self, "requestToBuy:", 64);
        -[BKBasePresentingViewController setStoreID:](self, "setStoreID:", v12);
        objc_initWeak(&location, self);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController sampleProfileFuture](self, "sampleProfileFuture"));
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_10008AEE8;
        v21[3] = &unk_1008E7DC8;
        objc_copyWeak(&v23, &location);
        v18 = v16;
        v22 = v18;
        objc_msgSend(v17, "get:", v21);

        v19 = -[BKBasePresentingViewController _fetchSampleProfileFuture](self, "_fetchSampleProfileFuture");
        objc_destroyWeak(&v23);
        objc_destroyWeak(&location);

      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController buyButtonItem](self, "buyButtonItem"));
    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (void)assetViewController:(id)a3 didShowContentWithCFIs:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController readingStatisticsController](self, "readingStatisticsController"));
  objc_msgSend(v6, "cfisDidAppear:", v5);

}

- (void)assetViewController:(id)a3 willHideContentWithCFIs:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController readingStatisticsController](self, "readingStatisticsController"));
  objc_msgSend(v6, "cfisWillDisappear:", v5);

}

- (void)setFinishedForAssetID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  BKBasePresentingViewController *v14;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serviceCenter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "readingActivityService"));

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10008B174;
    v10[3] = &unk_1008E7DF0;
    v11 = (id)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController libraryAssetProvider](self, "libraryAssetProvider"));
    v12 = v4;
    v13 = v7;
    v14 = self;
    v8 = v7;
    v9 = v11;
    objc_msgSend(v9, "performBlockOnWorkerQueue:", v10);

  }
}

- (void)assetViewController:(id)a3 setFinishedAndCloseForAssetID:(id)a4
{
  id v6;

  v6 = a3;
  -[BKBasePresentingViewController setFinishedForAssetID:](self, "setFinishedForAssetID:", a4);
  if (a4)
    -[BKBasePresentingViewController assetViewController:requestClose:error:](self, "assetViewController:requestClose:error:", v6, 1, 0);

}

- (BOOL)needTextNodeCharacterCountsForOrdinal:(int64_t)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController readingStatisticsController](self, "readingStatisticsController"));
  LOBYTE(a3) = objc_msgSend(v4, "needTextNodeCharacterCountsForOrdinal:", a3);

  return a3;
}

- (void)addTextNodeCharacterCounts:(id)a3 ordinal:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController readingStatisticsController](self, "readingStatisticsController"));
  objc_msgSend(v10, "addTextNodeCharacterCounts:ordinal:completion:", v9, a4, v8);

}

- (BOOL)needTOCEntriesForOrdinal:(int64_t)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController readingStatisticsController](self, "readingStatisticsController"));
  LOBYTE(a3) = objc_msgSend(v4, "needTOCEntriesForOrdinal:", a3);

  return a3;
}

- (void)addTOCEntries:(id)a3 ordinal:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController readingStatisticsController](self, "readingStatisticsController"));
  objc_msgSend(v10, "addTOCEntries:ordinal:completion:", v9, a4, v8);

  -[BKBasePresentingViewController setNeedToRebuildContextTree:](self, "setNeedToRebuildContextTree:", 1);
}

- (void)assetViewControllerPaginationCompletedForBook:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](self, "assetIdentifier", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "permanentAssetID"));

  v6 = (id)objc_claimAutoreleasedReturnValue(+[BCProgressKitController sharedController](BCProgressKitController, "sharedController"));
  if (!objc_msgSend(v6, "isTrackingAssetID:", v5))
    goto LABEL_4;
  v7 = -[BKBasePresentingViewController needToRebuildContextTree](self, "needToRebuildContextTree");

  if (v7)
  {
    -[BKBasePresentingViewController setNeedToRebuildContextTree:](self, "setNeedToRebuildContextTree:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
    v9 = BUProtocolCast(&OBJC_PROTOCOL___BCProgressContextTreeBuilding, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController readingStatisticsController](self, "readingStatisticsController"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10008B764;
    v12[3] = &unk_1008E7310;
    v13 = v10;
    v6 = v10;
    objc_msgSend(v11, "tocCFIMapWithCompletion:", v12);

LABEL_4:
  }

}

- (void)assetViewController:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v6 = a5;
  v9 = a6;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager"));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sceneControllerForViewController:", v11));

  objc_msgSend(v13, "presentViewController:animated:completion:", v10, v6, v9);
}

- (void)assetViewController:(id)a3 presentModalViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  id v10;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sceneControllerForViewController:", v8));

  objc_msgSend(v10, "presentModalViewController:animated:", v7, v5);
}

- (id)libraryButtonItemForViewController:(id)a3 selector:(SEL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController im_ancestorFlowControllerConformingToProtocol:](self, "im_ancestorFlowControllerConformingToProtocol:", &OBJC_PROTOCOL___BKSceneHosting));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController _sceneControllerCurrentlyHostingAssetPresenter](self, "_sceneControllerCurrentlyHostingAssetPresenter"));
  if (objc_msgSend(v7, "closeTypeForSceneController:", v8) == (id)3)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController _closeBarButtonTitle](self, "_closeBarButtonTitle"));
    if (objc_msgSend(v9, "length"))
      v10 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", v9, 2, v6, a4);
    else
      v10 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 6, 3, 17.0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 6, 2, 17.0));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("chevron.backward")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageWithConfiguration:", v9));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageWithConfiguration:", v11));
    v10 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithImage:landscapeImagePhone:style:target:action:", v13, v14, 0, v6, a4);
    objc_msgSend(v10, "setLargeContentSizeImageInsets:", 42.0, 0.0, 0.0, 0.0);
    objc_msgSend(v10, "setWidth:", 32.0);

  }
  return v10;
}

- (BOOL)canUpdateLibraryBarButtonItem:(id)a3 withOldString:(id)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;

  if (!a3 || !a4)
    return (a3 != 0) ^ (a4 != 0);
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "title"));
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  return v7 ^ 1;
}

- (BOOL)readingStatisticsEnabled
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController readingStatisticsController](self, "readingStatisticsController"));
  v3 = v2 != 0;

  return v3;
}

- (id)contextMenuWithAssetViewController:(id)a3 sourceView:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  BKBasePresentingViewController *v17;
  id v18;
  id v19;
  id location;
  void *v21;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_10008BD1C;
  v16 = &unk_1008E7E18;
  objc_copyWeak(&v19, &location);
  v17 = self;
  v8 = v7;
  v18 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIDeferredMenuElement elementWithUncachedProvider:](UIDeferredMenuElement, "elementWithUncachedProvider:", &v13));
  v21 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1, v13, v14, v15, v16, v17));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", &stru_10091C438, v10));

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v11;
}

- (id)analyticsAssetPropertyProviderForAssetViewController:(id)a3 fromSourceView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKContextMenuProvider sharedProvider](BKContextMenuProvider, "sharedProvider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController dataModelWithSourceView:](self, "dataModelWithSourceView:", v5));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "analyticsAssetPropertyProviderForDataModel:", v7));
  return v8;
}

- (id)dataModelWithSourceView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  v5 = objc_alloc((Class)BSUIContextActionDataAssetModel);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](self, "assetIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "permanentOrTemporaryAssetID"));
  v8 = objc_msgSend(v5, "initWithAdamID:", v7);

  v9 = objc_msgSend(objc_alloc((Class)BSUIContextActionDataModel), "initWithAssetModel:sourceView:", v8, v4);
  return v9;
}

- (void)assetViewController:(id)a3 openSupplementalAssetWithIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  NSMutableDictionary *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  NSMutableDictionary *v19;
  id v20;
  BKBasePresentingViewController *v21;
  id v22;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "libraryAssetOnMainQueueWithAssetIdentifier:", v5));

  v8 = objc_opt_new(NSMutableDictionary);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sceneControllerForViewController:", self));
  v11 = objc_msgSend(v10, "newShowAssetTransaction");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController im_ancestorFlowControllerConformingToProtocol:](self, "im_ancestorFlowControllerConformingToProtocol:", &OBJC_PROTOCOL___BKBookPresenting));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10008C058;
  v17[3] = &unk_1008E7E68;
  v18 = v11;
  v19 = v8;
  v20 = v7;
  v21 = self;
  v22 = v5;
  v13 = v5;
  v14 = v7;
  v15 = v8;
  v16 = v11;
  objc_msgSend(v12, "preflightShowAssetWithTransaction:assetIdentifier:completion:", v16, v13, v17);

}

- (id)assetViewController:(id)a3 supplementalContentPickerForAssetWithPlaylistID:(id)a4
{
  return +[BKLibraryBookshelfController supplementalContentPDFPickerWithPlaylistID:fromActionMenu:](BKLibraryBookshelfController, "supplementalContentPDFPickerWithPlaylistID:fromActionMenu:", a4, 1);
}

- (BOOL)assetViewControllerIsPresentingSupplementalContent:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController bc_contextualPresentedViewController](self, "bc_contextualPresentedViewController", a3));
  v4 = objc_opt_class(BKAssetPresentingViewController);
  v5 = BUDynamicCast(v4, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v6, "isSupplementalContent");

  return v7;
}

- (void)readingStatisticsDidChangeOnController:(id)a3 changes:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = BCReadingStatisticsLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 134218242;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Reading statistics changed on controller %p changes=%@", (uint8_t *)&v9, 0x16u);
  }

}

- (void)timeTracker:(id)a3 didPromoteAsset:(id)a4 deletedFromWantToRead:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  _QWORD v15[4];
  _QWORD *v16;
  _QWORD v17[5];

  v5 = a5;
  +[BKBasePresentingViewController _markBookAsCurrent:](BKAssetPresentingViewController, "_markBookAsCurrent:", a4);
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController libraryAssetProvider](self, "libraryAssetProvider"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](self, "assetIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "libraryAssetOnMainQueueWithAssetIdentifier:", v9));

    if (v10 && v7)
    {
      v11 = +[BAUtilities contentTypeFromAssetType:](BAUtilities, "contentTypeFromAssetType:", (int)objc_msgSend(v10, "contentType"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "assetID"));
      objc_msgSend(v12, "emitRemoveFromWantListEventWithTracker:contentID:contentType:", v7, v13, v11);

    }
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10008C4C0;
  v17[3] = &unk_1008E72C0;
  v17[4] = self;
  v14 = objc_retainBlock(v17);
  if (v14)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v14[2])(v14);
    }
    else
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10008C610;
      v15[3] = &unk_1008E7818;
      v16 = v14;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);

    }
  }

}

- (void)_confirmBookSuccessfullyOpened
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t v20[16];
  uint8_t buf[16];

  v3 = BCCurrentBookLog(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Book was confirmed successfully open.", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](self, "assetIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "permanentAssetID"));

  -[BKBasePresentingViewController _updateLastOpenBookWithAssetID:](self, "_updateLastOpenBookWithAssetID:", v6);
  -[BKBasePresentingViewController _maybeUpdateSuccessfullyOpenedCurrentBook:](self, "_maybeUpdateSuccessfullyOpenedCurrentBook:", v6);
  -[BKBasePresentingViewController setSuccessfullyOpened:](self, "setSuccessfullyOpened:", 1);
  if (!-[BKBasePresentingViewController isSupplementalContent](self, "isSupplementalContent"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKLastOpenBookManager sharedInstance](BKLastOpenBookManager, "sharedInstance"));
    objc_msgSend(v7, "updateSuccessfullyOpenedBookForAssetID:successfullyOpenedBook:", v6, 1);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v9 = objc_msgSend(v8, "applicationState");

  v11 = BCCurrentBookLog(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if (v9 == (id)2)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10069CFBC((uint64_t)v6, v13, v14, v15, v16, v17, v18, v19);

  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Book was confirmed successfully open, start tracking.", v20, 2u);
    }

    -[BKBasePresentingViewController _beginReadingSessionForEventType:](self, "_beginReadingSessionForEventType:", 0);
  }

}

- (void)_startBookSuccessfullyOpenedTimer
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id buf[2];

  v3 = BCCurrentBookLog(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Scheduling successfully opened timer", (uint8_t *)buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BCJSConfiguration sharedInstance](BCJSConfiguration, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timeThresholdForOpenEvent"));
  v7 = objc_msgSend(v6, "longLongValue");

  objc_initWeak(buf, self);
  -[BKBasePresentingViewController _cancelSuccessfullyOpenedTimerIfNeeded](self, "_cancelSuccessfullyOpenedTimerIfNeeded");
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10008C908;
  v9[3] = &unk_1008E7EB0;
  objc_copyWeak(&v10, buf);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v9, (double)(uint64_t)v7));
  -[BKBasePresentingViewController setSuccessfullyOpenedTimer:](self, "setSuccessfullyOpenedTimer:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);
}

- (void)_cancelSuccessfullyOpenedTimerIfNeeded
{
  uint64_t v3;
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint8_t v11[16];

  v3 = objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController successfullyOpenedTimer](self, "successfullyOpenedTimer"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController successfullyOpenedTimer](self, "successfullyOpenedTimer"));
    v6 = objc_msgSend(v5, "isValid");

    if (v6)
    {
      v8 = BCCurrentBookLog(v7);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Cancelling successfully opened timer", v11, 2u);
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController successfullyOpenedTimer](self, "successfullyOpenedTimer"));
      objc_msgSend(v10, "invalidate");

      -[BKBasePresentingViewController setSuccessfullyOpenedTimer:](self, "setSuccessfullyOpenedTimer:", 0);
    }
  }
}

+ (void)startingOpenOfMinifedCurrentBook:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  v3 = a3;
  v4 = BCCurrentBookLog(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Starting open of book as minified & current %@.", (uint8_t *)&v8, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v6, "setBool:forKey:", 0, CFSTR("kSuccessfullyOpenedCurrentBook"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v7, "synchronize");

}

+ (void)_markBookAsCurrent:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;

  v3 = a3;
  v4 = BCCurrentBookLog(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Marking book as current %@.", (uint8_t *)&v7, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v6, "setObject:forKey:", v3, CFSTR("kLastCurrentBookKey"));
  objc_msgSend(v6, "setBool:forKey:", 1, CFSTR("kSuccessfullyOpenedCurrentBook"));
  objc_msgSend(v6, "synchronize");

}

+ (void)markCarPlayBackgroundBookAsCurrent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("BKMainViewControllerLastBook"));
  objc_msgSend(v5, "setBool:forKey:", 1, CFSTR("BKMainViewControllerSuccessfullyOpenedBook"));
  objc_msgSend(a1, "_markBookAsCurrent:", v4);

}

- (void)_maybeUpdateSuccessfullyOpenedCurrentBook:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  id v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringForKey:", CFSTR("kLastCurrentBookKey")));
  v6 = objc_msgSend(v5, "isEqualToString:", v3);
  if ((_DWORD)v6)
  {
    v7 = BCCurrentBookLog(v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Current book successfully opened %@.", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(v4, "setBool:forKey:", 1, CFSTR("kSuccessfullyOpenedCurrentBook"));
    objc_msgSend(v4, "synchronize");
  }

}

- (void)_updateLastOpenBookWithAssetID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (v4)
  {
    v5 = 0;
  }
  else
  {
    if (-[BKBasePresentingViewController willTerminate](self, "willTerminate")
      || -[BKBasePresentingViewController isResigningActive](self, "isResigningActive"))
    {
      goto LABEL_11;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](self, "assetIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "permanentAssetID"));

    v4 = 0;
  }
  if (objc_msgSend(v4, "length")
    && !-[BKBasePresentingViewController isSupplementalContent](self, "isSupplementalContent"))
  {
    v6 = v9;
  }
  else
  {
    v6 = 0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKLastOpenBookManager sharedInstance](BKLastOpenBookManager, "sharedInstance"));
  objc_msgSend(v8, "updateLastOpenBookByRemovingAssetID:addingAssetID:", v5, v6);

LABEL_11:
}

+ (void)clearLastKnownSuccessfullyOpenBookID
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v2 = BCCurrentBookLog(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Clearing last known book.", v5, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKLastOpenBookManager sharedInstance](BKLastOpenBookManager, "sharedInstance"));
  objc_msgSend(v4, "clearAllLastOpenBooks");

}

+ (id)lastKnownOpenedCurrentBookID
{
  return objc_msgSend(a1, "_lastOpenedBookWithKey:", CFSTR("kLastCurrentBookKey"));
}

+ (id)lastKnownSuccessfullyOpenedCurrentBookID
{
  return _objc_msgSend(a1, "_successfullyOpenedBookWithKey:successKey:deleteOnFailure:", CFSTR("kLastCurrentBookKey"), CFSTR("kSuccessfullyOpenedCurrentBook"), 0);
}

+ (void)clearLastKnownSuccessfullyOpenedCurrentBookID
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  v2 = BCCurrentBookLog(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Asked to clear current spread. Actually clearing Current Book.", v6, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("kSuccessfullyOpenedCurrentBook"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("kLastCurrentBookKey"));

}

+ (id)futureViewControllerWithAssetIdentifier:(id)a3 libraryAssetProvider:(id)a4 options:(id)a5
{
  BCMutableFutureValue *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  BCMutableFutureValue *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  BCMutableFutureValue *v21;

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10008D0E0;
  v17[3] = &unk_1008E7ED8;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v7 = objc_opt_new(BCMutableFutureValue);
  v21 = v7;
  v8 = v20;
  v9 = v19;
  v10 = v18;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10008D190;
  v15[3] = &unk_1008E7F00;
  v16 = (id)objc_claimAutoreleasedReturnValue(+[BKAssetLookup assetLookupWithIdentifier:options:completion:](BKAssetLookup, "assetLookupWithIdentifier:options:completion:", v10, v8, v17));
  v11 = v16;
  -[BCMutableFutureValue get:](v7, "get:", v15);
  v12 = v16;
  v13 = v7;

  return v13;
}

- (NSString)assetPresenterAssetID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](self, "assetIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "permanentAssetID"));

  return (NSString *)v3;
}

- (NSString)assetPresenterPermanentOrTemporaryAssetID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](self, "assetIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "permanentOrTemporaryAssetID"));

  return (NSString *)v3;
}

- (void)assetPresenterOpenToLocation:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
  objc_msgSend(v7, "openToLocation:animated:", v6, v4);

}

- (void)assetPresenterJumpToBeginningAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
  objc_msgSend(v4, "jumpToBeginningAnimated:", v3);

}

- (void)assetPresenterPrepareForDismissal
{
  -[BKBasePresentingViewController setStateShouldClose:](self, "setStateShouldClose:", 1);
  -[BKBasePresentingViewController _cancelInteractionTimerIfNeeded](self, "_cancelInteractionTimerIfNeeded");
  -[BKBasePresentingViewController _cancelSuccessfullyOpenedTimerIfNeeded](self, "_cancelSuccessfullyOpenedTimerIfNeeded");
}

- (void)assetPresenterDismissalTransitionWillBegin
{
  -[BKBasePresentingViewController setStateDismissInProgress:](self, "setStateDismissInProgress:", 1);
}

- (void)assetPresenterDismissalDidEnd:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[BKBasePresentingViewController setStateDismissInProgress:](self, "setStateDismissInProgress:", 0);
  -[BKBasePresentingViewController setStateShouldClose:](self, "setStateShouldClose:", 0);
  if (v3)
  {
    -[BKBasePresentingViewController _finalizeAssetVCState](self, "_finalizeAssetVCState");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));

    if (v5)
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController im_ancestorFlowControllerConformingToProtocol:](self, "im_ancestorFlowControllerConformingToProtocol:", &OBJC_PROTOCOL___BKSceneHosting));
      objc_msgSend(v6, "updateAllAssetPresenterCloseStateTypes");

    }
  }
}

- (void)assetPresenterUpdateToolbars
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
  objc_msgSend(v2, "assetViewControllerUpdateToolbars");

}

- (BOOL)assetPresenterKeepOpenWithoutBundle
{
  _BOOL8 v3;

  if ((-[BKBasePresentingViewController stateFlags](self, "stateFlags") & 8) != 0)
    LOBYTE(v3) = 1;
  else
    return (-[BKBasePresentingViewController stateFlags](self, "stateFlags") >> 2) & 1;
  return v3;
}

- (id)assetPresenterCoverAnimationSource
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController openOptions](self, "openOptions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("BKBookPresentingCoverAnimationSource")));
  v4 = BUProtocolCast(&OBJC_PROTOCOL___BCCoverAnimatingSource, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (id)assetPresenterCoverImage
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_opt_class(UIImage);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController openOptions](self, "openOptions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BKBookPresentingCoverImage")));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (id)assetPresenterCoverShadowImage
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_opt_class(UIImage);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController openOptions](self, "openOptions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BKBookPresentingCoverShadowImage")));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (BOOL)minifiedBarVisibilityStyleIsHidden
{
  return -[BKBasePresentingViewController minifiedBarHidden](self, "minifiedBarHidden");
}

- (void)im_dismissAnimated:(BOOL)a3 immediate:(BOOL)a4
{
  unint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _BOOL8 v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  BOOL v22;
  uint8_t v23[16];
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[5];
  BOOL v28;
  BOOL v29;
  uint8_t buf[4];
  unint64_t v31;

  v7 = -[BKBasePresentingViewController stateFlags](self, "stateFlags");
  if ((v7 & 1) != 0
    || (v7 = -[BKBasePresentingViewController stateShouldClose](self, "stateShouldClose"), (v7 & 1) != 0))
  {
    v8 = BCCurrentBookLog(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v31 = -[BKBasePresentingViewController stateFlags](self, "stateFlags");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Ignored dismiss of asset due to state: %ld", buf, 0xCu);
    }

  }
  else
  {
    -[BKBasePresentingViewController setAutoOpen:](self, "setAutoOpen:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetLookup](self, "assetLookup"));
    objc_msgSend(v10, "cancel");

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10008D844;
    v27[3] = &unk_1008E7F28;
    v28 = a3;
    v29 = a4;
    v27[4] = self;
    v11 = objc_retainBlock(v27);
    objc_initWeak((id *)buf, self);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10008D884;
    v24[3] = &unk_1008E7F50;
    objc_copyWeak(&v26, (id *)buf);
    v12 = v11;
    v25 = v12;
    v13 = objc_retainBlock(v24);
    v14 = -[BKBasePresentingViewController _shouldTrackReadingSession](self, "_shouldTrackReadingSession");
    if (v14)
    {
      v15 = BCBookPromotionLog(v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Ending reading session due to being dismissed to current book.", v23, 2u);
      }

    }
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10008D99C;
    v19[3] = &unk_1008E8008;
    v19[4] = self;
    v22 = a4;
    v17 = v12;
    v20 = v17;
    v18 = v13;
    v21 = v18;
    -[BKBasePresentingViewController _endReadingSessionForEventType:withCompletion:](self, "_endReadingSessionForEventType:withCompletion:", 2, v19);

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);

  }
}

- (void)updatePromotionStateWithCompletion:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];

  v4 = a3;
  v5 = -[BKBasePresentingViewController _shouldTrackReadingSession](self, "_shouldTrackReadingSession");
  if (v5)
  {
    v6 = BCBookPromotionLog(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Ending reading session due to another asset being promoted.", buf, 2u);
    }

  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10008DE84;
  v9[3] = &unk_1008E8058;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  -[BKBasePresentingViewController _endReadingSessionForEventType:withCompletion:](self, "_endReadingSessionForEventType:withCompletion:", 2, v9);

}

- (id)_buyButton
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = objc_opt_class(IMButtonAndRadialProgress);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController buyButtonItem](self, "buyButtonItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "customView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewWithTag:", 7));
  v7 = BUDynamicCast(v3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (void)_updateBuyButtonProgressIfNeeded
{
  _QWORD *v3;
  _QWORD v4[4];
  _QWORD *v5;
  _QWORD v6[5];

  if (-[BKLibraryDownloadStatus state](self->_progressStatus, "state") == (id)4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10008E27C;
    v6[3] = &unk_1008E72C0;
    v6[4] = self;
    v3 = objc_retainBlock(v6);
    if (v3)
    {
      if (+[NSThread isMainThread](NSThread, "isMainThread"))
      {
        ((void (*)(_QWORD *))v3[2])(v3);
      }
      else
      {
        v4[0] = _NSConcreteStackBlock;
        v4[1] = 3221225472;
        v4[2] = sub_10008E350;
        v4[3] = &unk_1008E7818;
        v5 = v3;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

      }
    }

  }
}

- (void)_configureBuyButton:(id)a3 color:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  UIImage *ImageFromCurrentImageContext;
  void *v11;
  UIImage *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  CGSize v18;
  CGSize v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "setTitleColor:forState:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "colorWithAlphaComponent:", 0.25));
  objc_msgSend(v6, "setTitleColor:forState:", v7, 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "colorWithAlphaComponent:", 0.25));
  objc_msgSend(v6, "setTitleColor:forState:", v8, 2);

  v18.width = 10.0;
  v18.height = 10.0;
  UIGraphicsBeginImageContextWithOptions(v18, 0, 0.0);
  objc_msgSend(v5, "setStroke");
  v20.origin.x = 0.0;
  v20.origin.y = 0.0;
  v20.size.width = 10.0;
  v20.size.height = 10.0;
  v21 = CGRectInset(v20, 1.0, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height, 2.0));
  objc_msgSend(v9, "stroke");

  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v17 = (id)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  v19.width = 10.0;
  v19.height = 10.0;
  UIGraphicsBeginImageContextWithOptions(v19, 0, 0.0);
  objc_msgSend(v5, "setStroke");

  v22.origin.x = 0.0;
  v22.origin.y = 0.0;
  v22.size.width = 10.0;
  v22.size.height = 10.0;
  v23 = CGRectInset(v22, 1.0, 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v23.origin.x, v23.origin.y, v23.size.width, v23.size.height, 2.0));
  objc_msgSend(v11, "strokeWithBlendMode:alpha:", 0, 0.25);

  v12 = UIGraphicsGetImageFromCurrentImageContext();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  UIGraphicsEndImageContext();
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "resizableImageWithCapInsets:", 4.0, 4.0, 4.0, 4.0));
  objc_msgSend(v6, "setBackgroundImage:forState:", v14, 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "resizableImageWithCapInsets:", 4.0, 4.0, 4.0, 4.0));
  objc_msgSend(v6, "setBackgroundImage:forState:", v15, 1);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "resizableImageWithCapInsets:", 4.0, 4.0, 4.0, 4.0));
  objc_msgSend(v6, "setBackgroundImage:forState:", v16, 2);

}

- (id)_newBarButtonItemWithBuyButton
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v18;
  _QWORD v19[2];

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0980392157, 0.670588235, 0.125490196, 1.0));
  v3 = objc_msgSend(objc_alloc((Class)IMButtonAndRadialProgress), "initWithFrame:", 0.0, 0.0, 54.0, 26.0);
  -[BKBasePresentingViewController _configureBuyButton:color:](self, "_configureBuyButton:color:", v3, v18);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "titleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 14.0));
  objc_msgSend(v4, "setFont:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "titleLabel"));
  objc_msgSend(v6, "setAdjustsFontSizeToFitWidth:", 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "titleLabel"));
  objc_msgSend(v7, "setMinimumScaleFactor:", 0.5);

  objc_msgSend(v3, "setTag:", 7);
  v8 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v8, "addSubview:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "centerXAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "centerXAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  v19[0] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "heightAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToConstant:", 26.0));
  v19[1] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

  -[BKBasePresentingViewController _resizeBuyButton:](self, "_resizeBuyButton:", v3);
  v15 = objc_msgSend(objc_alloc((Class)BCUIFullHeightNavWrapper), "initWithView:", v8);
  objc_msgSend(v15, "setCursorInsets:", 2.0, -8.0, 2.0, -8.0);
  v16 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithCustomView:", v15);

  return v16;
}

- (void)_resizeBuyButton:(id)a3
{
  double Width;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v19 = a3;
  objc_msgSend(v19, "sizeToFit");
  objc_msgSend(v19, "frame");
  Width = CGRectGetWidth(v20);
  +[BCNavigationBar padding](BCNavigationBar, "padding");
  v6 = v5;
  v7 = v5 * 0.5;
  v8 = Width + v5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "superview"));
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;
  v21.origin.y = 0.0;
  v21.size.height = 26.0;
  v21.origin.x = v6 * 0.5;
  v21.size.width = Width + v6;
  v14 = v6 + CGRectGetWidth(v21);
  if (-[BKBasePresentingViewController im_isCompactWidth](self, "im_isCompactWidth"))
    v15 = 100.0;
  else
    v15 = 140.0;
  v16 = v14 - v15;
  if (v14 - v15 <= 0.0)
  {
    v15 = v14;
LABEL_10:
    v18 = Width + v6;
    goto LABEL_11;
  }
  if (v16 <= v7)
  {
    v15 = v14 - v16;
    goto LABEL_10;
  }
  v17 = v6 - (v16 - v7);
  if (v17 <= 0.0)
  {
    v8 = v15 - v7;
    v22.size.height = 26.0;
    v22.origin.x = v11;
    v22.origin.y = v13;
    v22.size.width = v15 - v7;
    v18 = CGRectGetWidth(v22);
    v7 = 0.0;
  }
  else
  {
    v15 = v14 - v7 - v17;
    v7 = v17 * 0.5;
    v18 = Width + v17;
  }
LABEL_11:
  -[UIBarButtonItem setWidth:](self->_buyButtonItem, "setWidth:", v15);
  objc_msgSend(v19, "setFrame:", v7, 0.0, v18, 26.0);
  objc_msgSend(v9, "setFrame:", v11, v13, v8, 26.0);

}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController _buyButton](self, "_buyButton", a3, a4));
  -[BKBasePresentingViewController _resizeBuyButton:](self, "_resizeBuyButton:", v5);

}

- (id)traitCollection
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKBasePresentingViewController;
  v3 = -[BKBasePresentingViewController traitCollection](&v7, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController im_traitCollectionAdjustedForMedusaLevels:](self, "im_traitCollectionAdjustedForMedusaLevels:", v4));

  return v5;
}

- (void)_configureBuyButtonForPricing:(id)a3 profile:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unsigned __int8 v14;
  id v15;

  v15 = a3;
  v6 = a4;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKAssetPresentingViewController.m", 2858, "-[BKBasePresentingViewController _configureBuyButtonForPricing:profile:]", "[NSThread isMainThread]", CFSTR("This operation must only be performed on the main thread!"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionTextWithType:", 0));
  objc_msgSend(v15, "setTitle:forState:", v7, 0);
  -[BKBasePresentingViewController _resizeBuyButton:](self, "_resizeBuyButton:", v15);
  if (objc_msgSend(v6, "isPreorder"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemOrangeColor](UIColor, "systemOrangeColor"));
    -[BKBasePresentingViewController _configureBuyButton:color:](self, "_configureBuyButton:color:", v15, v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "buyParameters"));
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
    if (objc_msgSend(v11, "isStoreAccountManagedAppleID"))
    {

LABEL_11:
      v12 = 3;
      goto LABEL_12;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[BURestrictionsProvider sharedInstance](BURestrictionsProvider, "sharedInstance"));
    v14 = objc_msgSend(v13, "isBookStoreAllowed");

    if ((v14 & 1) == 0)
      goto LABEL_11;
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }
LABEL_12:
  objc_msgSend(v15, "setModeState:", v12);

}

- (void)_fetchProfileForStoreID:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AEUserPublishing sharedInstance](AEUserPublishing, "sharedInstance"));
  v14 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10008ECD4;
  v11[3] = &unk_1008E8080;
  v12 = v5;
  v13 = v6;
  v9 = v5;
  v10 = v6;
  objc_msgSend(v7, "productProfilesForStoreIDs:completion:", v8, v11);

}

- (void)_downloadStatusNotification:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  _QWORD block[4];
  _QWORD *v21;
  _QWORD v22[5];
  id v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v4 = a3;
  v5 = objc_opt_class(NSSet);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", BKLibraryDownloadStatusKey));
  v8 = BUDynamicCast(v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "assetID"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](self, "assetIdentifier"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "permanentOrTemporaryAssetID"));

        if (objc_msgSend(v18, "isEqualToString:", v16))
        {
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_10008F09C;
          v22[3] = &unk_1008E7928;
          v22[4] = self;
          v23 = v18;
          v24 = v15;
          v19 = objc_retainBlock(v22);
          if (v19)
          {
            if (+[NSThread isMainThread](NSThread, "isMainThread"))
            {
              ((void (*)(_QWORD *))v19[2])(v19);
            }
            else
            {
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_10008F118;
              block[3] = &unk_1008E7818;
              v21 = v19;
              dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

            }
          }

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v12);
  }

}

- (void)_libraryOwnershipNotification:(id)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  BKLibraryDownloadStatus *progressStatus;
  double v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", BKLibraryOwnershipAssetsKey));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    v8 = BKLibraryOwnershipAssetIDKey;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "objectForKeyedSubscript:", v8));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](self, "assetIdentifier"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "permanentAssetID"));

        if (objc_msgSend(v10, "isEqualToString:", v12))
        {
          if (self->_progressStatus)
          {
            -[BKBasePresentingViewController _updateAssetStateAndDownloadStatus:](self, "_updateAssetStateAndDownloadStatus:");
            progressStatus = self->_progressStatus;
          }
          else
          {
            progressStatus = 0;
          }
          if (-[BKLibraryDownloadStatus state](progressStatus, "state") == (id)5)
          {
            -[BKLibraryDownloadStatus progressValue](self->_progressStatus, "progressValue");
            if (v14 >= 1.0)
              -[BKBasePresentingViewController setProgressStatus:](self, "setProgressStatus:", 0);
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

}

- (void)_updateAssetStateAndDownloadStatus:(id)a3
{
  id v4;
  void *v5;
  char v6;
  _QWORD v7[4];
  id v8;
  BKBasePresentingViewController *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
  v6 = objc_opt_respondsToSelector(v5, "setDownloadState:assetState:progressValue:");

  if ((v6 & 1) != 0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10008F398;
    v7[3] = &unk_1008E7338;
    v8 = v4;
    v9 = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);

  }
}

- (void)_sendDeferredURLOpenRequests
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  void *v9;
  id v10;
  NSMutableDictionary *deferredURLOpenRequests;
  id obj;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sceneControllerForViewController:", self));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_deferredURLOpenRequests, "allKeys"));
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deferredURLOpenRequests, "objectForKeyedSubscript:", v8));
        v10 = objc_msgSend(v3, "newShowURLTransaction");
        objc_msgSend(v13, "handleApplicationURL:sourceApplication:annotation:likelyUserInitiated:transaction:", v8, CFSTR("__self__"), 0, v9, v10);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  deferredURLOpenRequests = self->_deferredURLOpenRequests;
  self->_deferredURLOpenRequests = 0;

}

- (id)analyticsContentDataForAssetViewController:(id)a3 contentSubType:(id)a4 tracker:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  signed int v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unsigned int v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  BOOL v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v39;
  signed int v40;
  void *v41;
  id v42;
  uint64_t v43;
  id v44;
  id v45;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController libraryAssetProvider](self, "libraryAssetProvider"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](self, "assetIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "libraryAssetOnMainQueueWithAssetIdentifier:", v10));

  if (v11)
  {
    v12 = objc_msgSend(v11, "contentType");
    v44 = +[BAUtilities contentTypeFromAssetType:](BAUtilities, "contentTypeFromAssetType:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "storeID"));
    v14 = objc_msgSend(v13, "length");
    v15 = 1;
    if (!v14)
      v15 = 2;
    v43 = v15;

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](self, "assetIdentifier"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "permanentAssetID"));

    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentPrivateIDForContentID:", v17));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentUserIDForContentID:", v17));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
    v42 = objc_msgSend(v20, "seriesTypeForContentID:", v17);

    v45 = v7;
    if (objc_msgSend(v11, "isAudiobook"))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hasRACSupport"));
      v22 = objc_msgSend(v21, "BOOLValue");
      v23 = 1;
      if (!v22)
        v23 = 2;
      v39 = v23;

    }
    else
    {
      v39 = 0;
    }
    v25 = objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController appAnalyticsAdditionalData](self, "appAnalyticsAdditionalData"));
    v41 = (void *)v19;
    if (v25
      && (v26 = (void *)v25, v27 = _os_feature_enabled_impl("Books", "unifiedProductPage"), v26, v27))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController appAnalyticsAdditionalData](self, "appAnalyticsAdditionalData"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v28, "supportsUnifiedProductPage")));

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController appAnalyticsAdditionalData](self, "appAnalyticsAdditionalData"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "editionKind"));

    }
    else
    {
      v29 = 0;
      v31 = 0;
    }
    v32 = objc_alloc((Class)BAContentData);
    v33 = v12 == 3;
    v40 = v12;
    v34 = (void *)v18;
    if (v33)
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v11, "pageCount")));
    else
      v35 = 0;
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "supplementalContentAssets"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v36, "count")));
    v24 = objc_msgSend(v32, "initWithContentID:contentType:contentPrivateID:contentUserID:contentAcquisitionType:contentSubType:contentLength:supplementalContentCount:seriesType:productionType:isUnified:contentKind:", v17, v44, v34, v41, v43, v45, v35, v37, v42, v39, v29, v31);

    if (v40 == 3)
    v7 = v45;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (BOOL)isTranslateAvailableForAssetViewController:(id)a3
{
  return +[LTUITranslationViewController isAvailable](LTUITranslationViewController, "isAvailable", a3);
}

- (void)assetViewController:(id)a3 presentTranslationForText:(id)a4 fromRect:(CGRect)a5 onClose:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  v16 = objc_alloc_init((Class)LTUITranslationViewController);
  v17 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v14);

  objc_msgSend(v16, "setText:", v17);
  objc_msgSend(v16, "setIsSourceEditable:", 0);
  objc_msgSend(v16, "setOverrideUserInterfaceStyle:", objc_msgSend(v15, "preferredUserInterfaceStyle"));
  objc_msgSend(v16, "setModalPresentationStyle:", 7);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10008FBEC;
  v21[3] = &unk_1008E7818;
  v22 = v13;
  v18 = v13;
  objc_msgSend(v16, "setDismissCompletionHandler:", v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "popoverPresentationController"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "view"));
  objc_msgSend(v19, "setSourceView:", v20);

  objc_msgSend(v19, "setSourceRect:", x, y, width, height);
  objc_msgSend(v19, "setPermittedArrowDirections:", 15);
  objc_msgSend(v19, "bc_applyTraitOverridesWithOverrideUserInterfaceStyleFromViewController:", v15);
  -[BKBasePresentingViewController assetViewController:presentViewController:animated:completion:](self, "assetViewController:presentViewController:animated:completion:", v15, v16, 1, 0);

}

- (BOOL)_requiresCustomPresentationController
{
  return 1;
}

- (void)_beginReadingSessionForEventType:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](self, "assetIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "permanentAssetID"));

  if ((a3 | 4) == 4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController sessionID](self, "sessionID"));
    if (v8)
    {

    }
    else if (-[BKBasePresentingViewController _shouldTrackReadingSession](self, "_shouldTrackReadingSession"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      -[BKBasePresentingViewController setSessionID:](self, "setSessionID:", v11);

      v13 = BCCurrentBookLog(v12);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138412290;
        v20 = v6;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Starting reading session for book with assetID: %@", (uint8_t *)&v19, 0xCu);
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
      if (objc_msgSend(v15, "readerType") == (id)6)
        v16 = 2;
      else
        v16 = 1;

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[BCBookReadingTimeTracker sharedInstance](BCBookReadingTimeTracker, "sharedInstance"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController sessionID](self, "sessionID"));
      objc_msgSend(v17, "trackReadingSessionBeganWithAssetID:sessionID:trackerEventType:readingFeatureFlags:completion:", v6, v18, a3, v16, 0);

    }
  }
  else
  {
    v9 = BCCurrentBookLog(v7);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10069D020((uint64_t)v6, a3);

  }
}

- (void)_endReadingSessionForEventType:(unint64_t)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void (**v19)(id, id);
  void *v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  void *v24;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](self, "assetIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "permanentAssetID"));

  if (v8
    && (v9 = objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController sessionID](self, "sessionID"))) != 0
    && (v10 = (void *)v9,
        v11 = -[BKBasePresentingViewController _shouldTrackReadingSession](self, "_shouldTrackReadingSession"),
        v10,
        v11))
  {
    v13 = BCCurrentBookLog(v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Ending reading session for book with assetID: %@", buf, 0xCu);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
    if (objc_msgSend(v15, "readerType") == (id)6)
      v16 = 2;
    else
      v16 = 1;

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[BCBookReadingTimeTracker sharedInstance](BCBookReadingTimeTracker, "sharedInstance"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController sessionID](self, "sessionID"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10009000C;
    v21[3] = &unk_1008E80A8;
    v22 = v6;
    objc_msgSend(v17, "trackReadingSessionEndedWithAssetID:sessionID:trackerEventType:readingFeatureFlags:completion:", v8, v18, a3, v16, v21);

    -[BKBasePresentingViewController setSessionID:](self, "setSessionID:", 0);
  }
  else
  {
    v19 = (void (**)(id, id))objc_retainBlock(v6);
    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[BKBasePresentingViewController lastKnownSuccessfullyOpenedCurrentBookID](BKAssetPresentingViewController, "lastKnownSuccessfullyOpenedCurrentBookID"));
      v19[2](v19, objc_msgSend(v8, "isEqualToString:", v20));

    }
  }

}

- (void)assetPresenterUpdateCloseTypeState
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
  objc_msgSend(v2, "assetViewControllerUpdateCloseStateTypeIfNeeded");

}

- (BOOL)bc_analyticsVisibilityIsObscuredWhenPresented
{
  return 1;
}

- (id)bc_childCardPresentingViewController
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController presentedViewController](self, "presentedViewController"));
  v3 = BUProtocolCast(&OBJC_PROTOCOL___BKAugmentedExperienceCardPresenting, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (void)_willEnterFullScreen:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;

  v4 = BCCurrentBookLiveResizeLog(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_10069D090();

  -[BKBasePresentingViewController setEnteringFullScreen:](self, "setEnteringFullScreen:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
  if ((objc_opt_respondsToSelector(v6, "assetViewControllerWillEnterFullScreen") & 1) != 0)
    objc_msgSend(v6, "assetViewControllerWillEnterFullScreen");

}

- (void)_didEnterFullScreen:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v4 = BCCurrentBookLiveResizeLog(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_10069D0BC();

  -[BKBasePresentingViewController setEnteringFullScreen:](self, "setEnteringFullScreen:", 0);
  -[BKBasePresentingViewController setInFullScreen:](self, "setInFullScreen:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenuSystem mainSystem](UIMenuSystem, "mainSystem"));
  objc_msgSend(v6, "setNeedsRebuild");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
  if ((objc_opt_respondsToSelector(v7, "assetViewControllerDidEnterFullScreen") & 1) != 0)
    objc_msgSend(v7, "assetViewControllerDidEnterFullScreen");

}

- (void)_willExitFullScreen:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;

  v4 = BCCurrentBookLiveResizeLog(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_10069D0E8();

  -[BKBasePresentingViewController setExitingFullScreen:](self, "setExitingFullScreen:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
  if ((objc_opt_respondsToSelector(v6, "assetViewControllerWillExitFullScreen") & 1) != 0)
    objc_msgSend(v6, "assetViewControllerWillExitFullScreen");

}

- (void)_didExitFullScreen:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v4 = BCCurrentBookLiveResizeLog(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_10069D114();

  -[BKBasePresentingViewController setExitingFullScreen:](self, "setExitingFullScreen:", 0);
  -[BKBasePresentingViewController setInFullScreen:](self, "setInFullScreen:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenuSystem mainSystem](UIMenuSystem, "mainSystem"));
  objc_msgSend(v6, "setNeedsRebuild");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
  if ((objc_opt_respondsToSelector(v7, "assetViewControllerDidExitFullScreen") & 1) != 0)
    objc_msgSend(v7, "assetViewControllerDidExitFullScreen");

}

- (id)coordinatedViewControllersFor:(id)a3
{
  return &__NSArray0__struct;
}

- (id)donationItemFor:(id)a3 intent:(int64_t)a4
{
  return 0;
}

- (id)donationTargets
{
  return &__NSArray0__struct;
}

- (void)bkaxSetUpAccessibilityForPresentedBook
{
  objc_class *v2;
  NSString *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v15 = (id)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController view](self, "view"));
  v2 = (objc_class *)objc_opt_class(v15);
  v3 = NSStringFromClass(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("UITransitionView"));

  if ((v5 & 1) != 0)
  {
    v6 = v15;
LABEL_6:
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[BKBasePresentingViewController bkaxPresentedAssetTransitionViewIdentifier](BKAssetPresentingViewController, "bkaxPresentedAssetTransitionViewIdentifier"));
    objc_msgSend(v6, "setAccessibilityIdentifier:", v13);

    v14 = v6;
  }
  else
  {
    v7 = v15;
    while (1)
    {
      v16 = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "superview"));

      if (!v8)
        break;
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "superview"));

      v9 = (objc_class *)objc_opt_class(v6);
      v10 = NSStringFromClass(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("UITransitionView"));

      v7 = v6;
      if (v12)
        goto LABEL_6;
    }
    v14 = v16;
  }

}

+ (id)bkaxPresentedAssetTransitionViewIdentifier
{
  return CFSTR("Presented Book Transition View");
}

- (BKContentOpenAnimating)assetPresenterAnimator
{
  return (BKContentOpenAnimating *)objc_loadWeakRetained((id *)&self->_assetPresenterAnimator);
}

- (void)setAssetPresenterAnimator:(id)a3
{
  objc_storeWeak((id *)&self->_assetPresenterAnimator, a3);
}

- (double)assetPresenterCoverAspect
{
  return self->_assetPresenterCoverAspect;
}

- (void)setAssetPresenterCoverAspect:(double)a3
{
  self->_assetPresenterCoverAspect = a3;
}

- (NSDictionary)openOptions
{
  return self->_openOptions;
}

- (void)setOpenOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)inLiveResize
{
  return self->_inLiveResize;
}

- (void)setInLiveResize:(BOOL)a3
{
  self->_inLiveResize = a3;
}

- (BCCoverAnimatingHost)placeholderViewController
{
  return self->_placeholderViewController;
}

- (void)setPlaceholderViewController:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderViewController, a3);
}

- (BOOL)autoDownload
{
  return self->_autoDownload;
}

- (void)setAutoDownload:(BOOL)a3
{
  self->_autoDownload = a3;
}

- (BOOL)autoOpen
{
  return self->_autoOpen;
}

- (void)setAutoOpen:(BOOL)a3
{
  self->_autoOpen = a3;
}

- (NSArray)bk_previewActionItems
{
  return self->_bk_previewActionItems;
}

- (void)setBk_previewActionItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int64_t)assetState
{
  return self->_assetState;
}

- (void)setAssetState:(int64_t)a3
{
  self->_assetState = a3;
}

- (BAUpSellData)upSellData
{
  return self->_upSellData;
}

- (void)setUpSellData:(id)a3
{
  objc_storeStrong((id *)&self->_upSellData, a3);
}

- (BAAppAnalyticsAdditionalData)appAnalyticsAdditionalData
{
  return self->_appAnalyticsAdditionalData;
}

- (void)setAppAnalyticsAdditionalData:(id)a3
{
  objc_storeStrong((id *)&self->_appAnalyticsAdditionalData, a3);
}

- (BOOL)useLegacyAnimation
{
  return self->_useLegacyAnimation;
}

- (void)setUseLegacyAnimation:(BOOL)a3
{
  self->_useLegacyAnimation = a3;
}

- (id)downloadProgressBlock
{
  return self->_downloadProgressBlock;
}

- (void)setDownloadProgressBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)minifiedBarHidden
{
  return self->_minifiedBarHidden;
}

- (void)setMinifiedBarHidden:(BOOL)a3
{
  self->_minifiedBarHidden = a3;
}

- (BOOL)finishedConsuming
{
  return self->_finishedConsuming;
}

- (void)setFinishedConsuming:(BOOL)a3
{
  self->_finishedConsuming = a3;
}

- (BKTransitioningViewController)transitioningViewController
{
  return self->_transitioningViewController;
}

- (void)setTransitioningViewController:(id)a3
{
  objc_storeStrong((id *)&self->_transitioningViewController, a3);
}

- (AEHelper)assetHelper
{
  return self->_assetHelper;
}

- (void)setAssetHelper:(id)a3
{
  objc_storeStrong((id *)&self->_assetHelper, a3);
}

- (BKLibraryAssetIdentifier)assetIdentifier
{
  return self->_assetIdentifier;
}

- (void)setAssetIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSTimer)confirmActiveTimer
{
  return self->_confirmActiveTimer;
}

- (void)setConfirmActiveTimer:(id)a3
{
  objc_storeStrong((id *)&self->_confirmActiveTimer, a3);
}

- (BOOL)isSupplementalContent
{
  return self->_assetPresenterIsSupplementalContent;
}

- (void)setAssetPresenterIsSupplementalContent:(BOOL)a3
{
  self->_assetPresenterIsSupplementalContent = a3;
}

- (BOOL)isResigningActive
{
  return self->_isResigningActive;
}

- (void)setIsResigningActive:(BOOL)a3
{
  self->_isResigningActive = a3;
}

- (BOOL)preparingEndOfBookExperience
{
  return self->_preparingEndOfBookExperience;
}

- (void)setPreparingEndOfBookExperience:(BOOL)a3
{
  self->_preparingEndOfBookExperience = a3;
}

- (BOOL)successfullyOpened
{
  return self->_successfullyOpened;
}

- (void)setSuccessfullyOpened:(BOOL)a3
{
  self->_successfullyOpened = a3;
}

- (NSTimer)successfullyOpenedTimer
{
  return self->_successfullyOpenedTimer;
}

- (void)setSuccessfullyOpenedTimer:(id)a3
{
  objc_storeStrong((id *)&self->_successfullyOpenedTimer, a3);
}

- (BKAssetPresentingFilePresenter)filePresenter
{
  return self->_filePresenter;
}

- (void)setFilePresenter:(id)a3
{
  objc_storeStrong((id *)&self->_filePresenter, a3);
}

- (BKAssetLookup)assetLookup
{
  return self->_assetLookup;
}

- (void)setAssetLookup:(id)a3
{
  objc_storeStrong((id *)&self->_assetLookup, a3);
}

- (unint64_t)stateFlags
{
  return self->_stateFlags;
}

- (void)setStateFlags:(unint64_t)a3
{
  self->_stateFlags = a3;
}

- (BOOL)willTerminate
{
  return self->_willTerminate;
}

- (void)setWillTerminate:(BOOL)a3
{
  self->_willTerminate = a3;
}

- (BKLibraryAssetProvider)libraryAssetProvider
{
  return (BKLibraryAssetProvider *)objc_loadWeakRetained((id *)&self->_libraryAssetProvider);
}

- (void)setLibraryAssetProvider:(id)a3
{
  objc_storeWeak((id *)&self->_libraryAssetProvider, a3);
}

- (id)errorCloseBlock
{
  return self->_errorCloseBlock;
}

- (void)setErrorCloseBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void)setMinifiedPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_minifiedPresenter, a3);
}

- (BKLibraryDownloadStatus)progressStatus
{
  return self->_progressStatus;
}

- (BKSampleToPurchaseMonitor)sampleToPurchasedMonitor
{
  return self->_sampleToPurchasedMonitor;
}

- (void)setSampleToPurchasedMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_sampleToPurchasedMonitor, a3);
}

- (BKImportInPlaceMonitor)importInPlaceMonitor
{
  return self->_importInPlaceMonitor;
}

- (void)setImportInPlaceMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_importInPlaceMonitor, a3);
}

- (id)loadAssetBlock
{
  return self->_loadAssetBlock;
}

- (void)setLoadAssetBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (id)transitionCompletedBlock
{
  return self->_transitionCompletedBlock;
}

- (void)setTransitionCompletedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (BOOL)shouldRestoreNavBar
{
  return self->_shouldRestoreNavBar;
}

- (void)setShouldRestoreNavBar:(BOOL)a3
{
  self->_shouldRestoreNavBar = a3;
}

- (BKAssetPresentingViewControllerHoldAnimationAssertion)holdAnimationAssertion
{
  return (BKAssetPresentingViewControllerHoldAnimationAssertion *)objc_loadWeakRetained((id *)&self->_holdAnimationAssertion);
}

- (void)setHoldAnimationAssertion:(id)a3
{
  objc_storeWeak((id *)&self->_holdAnimationAssertion, a3);
}

- (UIBarButtonItem)buyButtonItem
{
  return self->_buyButtonItem;
}

- (void)setBuyButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_buyButtonItem, a3);
}

- (BOOL)didFetchProfile
{
  return self->_didFetchProfile;
}

- (void)setDidFetchProfile:(BOOL)a3
{
  self->_didFetchProfile = a3;
}

- (NSString)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(id)a3
{
  objc_storeStrong((id *)&self->_storeID, a3);
}

- (BCReadingStatisticsController)readingStatisticsController
{
  return self->_readingStatisticsController;
}

- (void)setReadingStatisticsController:(id)a3
{
  objc_storeStrong((id *)&self->_readingStatisticsController, a3);
}

- (BOOL)needToRebuildContextTree
{
  return self->_needToRebuildContextTree;
}

- (void)setNeedToRebuildContextTree:(BOOL)a3
{
  self->_needToRebuildContextTree = a3;
}

- (BOOL)needToForcePagination
{
  return self->_needToForcePagination;
}

- (void)setNeedToForcePagination:(BOOL)a3
{
  self->_needToForcePagination = a3;
}

- (NSMutableDictionary)deferredURLOpenRequests
{
  return self->_deferredURLOpenRequests;
}

- (void)setDeferredURLOpenRequests:(id)a3
{
  objc_storeStrong((id *)&self->_deferredURLOpenRequests, a3);
}

- (BOOL)stateShouldClose
{
  return self->_stateShouldClose;
}

- (void)setStateShouldClose:(BOOL)a3
{
  self->_stateShouldClose = a3;
}

- (BOOL)stateShouldOpen
{
  return self->_stateShouldOpen;
}

- (void)setStateShouldOpen:(BOOL)a3
{
  self->_stateShouldOpen = a3;
}

- (BOOL)stateDismissInProgress
{
  return self->_stateDismissInProgress;
}

- (void)setStateDismissInProgress:(BOOL)a3
{
  self->_stateDismissInProgress = a3;
}

- (BOOL)scrimAppliedForLiveResize
{
  return self->_scrimAppliedForLiveResize;
}

- (void)setScrimAppliedForLiveResize:(BOOL)a3
{
  self->_scrimAppliedForLiveResize = a3;
}

- (CGRect)liveResizeViewOriginalFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_liveResizeViewOriginalFrame.origin.x;
  y = self->_liveResizeViewOriginalFrame.origin.y;
  width = self->_liveResizeViewOriginalFrame.size.width;
  height = self->_liveResizeViewOriginalFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLiveResizeViewOriginalFrame:(CGRect)a3
{
  self->_liveResizeViewOriginalFrame = a3;
}

- (UIView)liveResizeWrapperView
{
  return self->_liveResizeWrapperView;
}

- (void)setLiveResizeWrapperView:(id)a3
{
  objc_storeStrong((id *)&self->_liveResizeWrapperView, a3);
}

- (UIView)scrimLiveResizeView
{
  return self->_scrimLiveResizeView;
}

- (void)setScrimLiveResizeView:(id)a3
{
  objc_storeStrong((id *)&self->_scrimLiveResizeView, a3);
}

- (UIVisualEffectView)scrimLiveResizeBlurView
{
  return self->_scrimLiveResizeBlurView;
}

- (void)setScrimLiveResizeBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_scrimLiveResizeBlurView, a3);
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_overlayView, a3);
}

- (BOOL)enteringFullScreen
{
  return self->_enteringFullScreen;
}

- (void)setEnteringFullScreen:(BOOL)a3
{
  self->_enteringFullScreen = a3;
}

- (BOOL)exitingFullScreen
{
  return self->_exitingFullScreen;
}

- (void)setExitingFullScreen:(BOOL)a3
{
  self->_exitingFullScreen = a3;
}

- (BOOL)inFullScreen
{
  return self->_inFullScreen;
}

- (void)setInFullScreen:(BOOL)a3
{
  self->_inFullScreen = a3;
}

- (BOOL)aspectFitDuringResize
{
  return self->_aspectFitDuringResize;
}

- (void)setAspectFitDuringResize:(BOOL)a3
{
  self->_aspectFitDuringResize = a3;
}

- (BKFrontmostAssetTracker)frontmostTracker
{
  return self->_frontmostTracker;
}

- (BCMutableFutureValue)sampleProfileFuture
{
  return self->_sampleProfileFuture;
}

- (void)setSampleProfileFuture:(id)a3
{
  objc_storeStrong((id *)&self->_sampleProfileFuture, a3);
}

- (AEAssetViewController)assetViewController
{
  return self->_assetViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetViewController, 0);
  objc_storeStrong((id *)&self->_sampleProfileFuture, 0);
  objc_storeStrong((id *)&self->_frontmostTracker, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_scrimLiveResizeBlurView, 0);
  objc_storeStrong((id *)&self->_scrimLiveResizeView, 0);
  objc_storeStrong((id *)&self->_liveResizeWrapperView, 0);
  objc_storeStrong((id *)&self->_deferredURLOpenRequests, 0);
  objc_storeStrong((id *)&self->_readingStatisticsController, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_buyButtonItem, 0);
  objc_destroyWeak((id *)&self->_holdAnimationAssertion);
  objc_storeStrong(&self->_transitionCompletedBlock, 0);
  objc_storeStrong(&self->_loadAssetBlock, 0);
  objc_storeStrong((id *)&self->_importInPlaceMonitor, 0);
  objc_storeStrong((id *)&self->_sampleToPurchasedMonitor, 0);
  objc_storeStrong((id *)&self->_progressStatus, 0);
  objc_destroyWeak((id *)&self->_minifiedPresenter);
  objc_storeStrong(&self->_errorCloseBlock, 0);
  objc_destroyWeak((id *)&self->_libraryAssetProvider);
  objc_storeStrong((id *)&self->_assetLookup, 0);
  objc_storeStrong((id *)&self->_filePresenter, 0);
  objc_storeStrong((id *)&self->_successfullyOpenedTimer, 0);
  objc_storeStrong((id *)&self->_confirmActiveTimer, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
  objc_storeStrong((id *)&self->_assetHelper, 0);
  objc_storeStrong((id *)&self->_transitioningViewController, 0);
  objc_storeStrong(&self->_downloadProgressBlock, 0);
  objc_storeStrong((id *)&self->_appAnalyticsAdditionalData, 0);
  objc_storeStrong((id *)&self->_upSellData, 0);
  objc_storeStrong((id *)&self->_bk_previewActionItems, 0);
  objc_storeStrong((id *)&self->_placeholderViewController, 0);
  objc_storeStrong((id *)&self->_openOptions, 0);
  objc_destroyWeak((id *)&self->_assetPresenterAnimator);
}

@end
