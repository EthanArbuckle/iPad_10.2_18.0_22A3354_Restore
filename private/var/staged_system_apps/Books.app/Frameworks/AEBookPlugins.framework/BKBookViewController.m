@implementation BKBookViewController

+ (void)initialize
{
  id v3;
  id v4;
  void *v5;
  id v6;

  objc_opt_class(BKBookViewController);
  if (v3 == a1)
  {
    v4 = objc_alloc((Class)NSDictionary);
    v6 = objc_msgSend(v4, "initWithObjectsAndKeys:", BKBookHidePageControls[0], &__kCFBooleanFalse, BKLeftTapTurnToNextDefault[0], &__kCFBooleanFalse, BKReadAloudAutoPageTurn[0], &__kCFBooleanTrue, CFSTR("BKUseLegacyCurlAnimation"), &off_1CD2F8, BKDefaultHighlightColor[0], &__kCFBooleanFalse, BKDefaultUnderlineState, &__kCFBooleanTrue, CFSTR("BKAllowOnlineContent"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v5, "registerDefaults:", v6);

  }
}

- (BKBookViewController)initWithBook:(id)a3 storeID:(id)a4
{
  id v6;
  id v7;
  BKBookViewController *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *contentViewControllers;
  IMPerformSelectorProxy *v20;
  IMPerformSelectorProxy *performSelectorProxy;
  uint64_t v22;
  AEAnnotationProvider *annotationProvider;
  uint64_t v24;
  NSHashTable *bookmarkObservers;
  BCDisplaySleepController *v26;
  BCDisplaySleepController *displaySleepController;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  objc_super v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;

  v6 = a3;
  v7 = a4;
  v44.receiver = self;
  v44.super_class = (Class)BKBookViewController;
  v8 = -[BKViewController initWithNibName:bundle:](&v44, "initWithNibName:bundle:", 0, 0);
  if (v8)
  {
    v9 = _AEBookPluginsLifeCycleLog();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_opt_class(v8);
      v12 = v11;
      v13 = v11;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assetLogID"));
      *(_DWORD *)buf = 138543618;
      v46 = v12;
      v47 = 2114;
      v48 = v14;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Initializing BVC:%{public}@ logID:%{public}@", buf, 0x16u);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v15, "addObserver:selector:name:object:", v8, "saveBook", UIApplicationDidEnterBackgroundNotification, 0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v16, "addObserver:selector:name:object:", v8, "_contentReady:", BKContentReadyNotification, 0);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v17, "addObserver:selector:name:object:", v8, "_contentReady:", BKContentFAILNotification, 0);

    v18 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    contentViewControllers = v8->_contentViewControllers;
    v8->_contentViewControllers = v18;

    v8->_controlsVisible = 0;
    v20 = (IMPerformSelectorProxy *)objc_msgSend(objc_alloc((Class)IMPerformSelectorProxy), "initWithTarget:", v8);
    performSelectorProxy = v8->_performSelectorProxy;
    v8->_performSelectorProxy = v20;

    v22 = objc_claimAutoreleasedReturnValue(+[AEAnnotationProvider sharedInstance](AEAnnotationProvider, "sharedInstance"));
    annotationProvider = v8->_annotationProvider;
    v8->_annotationProvider = (AEAnnotationProvider *)v22;

    v24 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 517));
    bookmarkObservers = v8->_bookmarkObservers;
    v8->_bookmarkObservers = (NSHashTable *)v24;

    if ((BUIsRunningTests() & 1) == 0)
    {
      v26 = (BCDisplaySleepController *)objc_alloc_init((Class)BCDisplaySleepController);
      displaySleepController = v8->_displaySleepController;
      v8->_displaySleepController = v26;

    }
    -[BKBookViewController setBook:](v8, "setBook:", v6);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[BCAudioMuxingCoordinator sharedInstance](BCAudioMuxingCoordinator, "sharedInstance"));
    objc_msgSend(v28, "addAudioMuxingObserver:", v8);

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sampleContent"));
    if (objc_msgSend(v29, "BOOLValue"))
    {
      -[BKBookViewController setExperienceManager:](v8, "setExperienceManager:", 0);
    }
    else
    {
      v30 = +[BCAugmentedExperienceManager newAugmentedExperienceManager](BCAugmentedExperienceManager, "newAugmentedExperienceManager");
      -[BKBookViewController setExperienceManager:](v8, "setExperienceManager:", v30);

    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController experienceManager](v8, "experienceManager"));

    if (v31)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController experienceManager](v8, "experienceManager"));
      -[BKBookViewController setBookPositionProcessor:](v8, "setBookPositionProcessor:", v32);

      v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController experienceManager](v8, "experienceManager"));
      objc_msgSend(v33, "setPresentationViewController:", v8);

      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storeId"));
      v35 = objc_msgSend(v34, "longLongValue");
      if ((uint64_t)v35 < 1)
        v36 = v7;
      else
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storeId"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController experienceManager](v8, "experienceManager"));
      objc_msgSend(v37, "setStoreID:", v36);

      if ((uint64_t)v35 >= 1)
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController _createEndOfBookExperience](v8, "_createEndOfBookExperience"));
      if (v38)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController experienceManager](v8, "experienceManager"));
        objc_msgSend(v39, "addExperience:", v38);

      }
    }
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](v8, "book"));
    v8->_layout = -[BKBookViewController validLayoutForBook:desiredLayout:](v8, "validLayoutForBook:desiredLayout:", v40, -[BKBookViewController defaultLayoutToUse](v8, "defaultLayoutToUse"));

    v41 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v42 = -[BKBookViewController registerForTraitChanges:withAction:](v8, "registerForTraitChanges:withAction:", v41, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v8;
}

- (NSURL)storeShortURL
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  *(_QWORD *)&v3 = objc_opt_class(self).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "propertySourceFromBook:", v6));

  v8 = objc_msgSend(objc_alloc((Class)AEAssetActivityItemProviderSource), "initWithPropertySource:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "propertyProvider"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "storeURLPreferShort"));

  return (NSURL *)v10;
}

- (NSString)lastLayoutUsedKey
{
  return (NSString *)CFSTR("BKEpubLayout");
}

- (unint64_t)defaultLayoutToUse
{
  return -[BKBookViewController lastLayoutUsed](self, "lastLayoutUsed");
}

- (unint64_t)lastLayoutUsed
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  int v7;
  unint64_t v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController lastLayoutUsedKey](self, "lastLayoutUsedKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", v4));

  if (v5)
  {
    v6 = objc_msgSend(v5, "intValue");
    if (v6 <= 1)
      v7 = 1;
    else
      v7 = v6;
    v8 = v7;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)setLayout:(unint64_t)a3
{
  unint64_t v5;
  id v6;
  NSObject *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;

  if (self->_layout != a3)
  {
    self->_layout = a3;
    v5 = -[BKBookViewController layout](self, "layout");
    v6 = _AEBookPluginsLifeCycleLog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (v5 & 0xFFFFFFFFFFFFFFFELL) == 2;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "assetLogID"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v8));
      v15 = 138543874;
      v16 = v9;
      v17 = 2114;
      v18 = v11;
      v19 = 2114;
      v20 = v12;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "SetLayout:%{public}@, logID:%{public}@, Scroll:%{public}@", (uint8_t *)&v15, 0x20u);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController lastLayoutUsedKey](self, "lastLayoutUsedKey"));
    objc_msgSend(v13, "setInteger:forKey:", a3, v14);

  }
}

- (unint64_t)validLayoutForBook:(id)a3 desiredLayout:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  unint64_t v10;
  int v12;
  void *v13;

  v6 = a3;
  if ((objc_msgSend(v6, "isScrollModeDisabled") & 1) == 0)
  {
    if (a4 - 2 < 2)
    {
      v10 = -[BKBookViewController scrollLayoutForBook:](self, "scrollLayoutForBook:", v6);
      goto LABEL_9;
    }
    if (a4 == 4 || !a4)
    {
      v7 = BCIMLog();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
        v12 = 138412290;
        v13 = v9;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Unexpected layout request value (%@). Falling back to paged layout", (uint8_t *)&v12, 0xCu);

      }
    }
  }
  v10 = 1;
LABEL_9:

  return v10;
}

- (BOOL)allowsScrollMode
{
  return 1;
}

- (unint64_t)scrollLayoutForBook:(id)a3
{
  void *v4;
  id v5;

  if (!-[BKBookViewController allowsScrollMode](self, "allowsScrollMode", a3))
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v5 = objc_msgSend(v4, "scrollModeOrientation");

  if (v5)
    return 2;
  else
    return 3;
}

- (id)_createEndOfBookExperience
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  uint8_t buf[4];
  void *v47;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endOfBookLocation"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "endOfBookValidRange"));

  if (objc_msgSend(v4, "length"))
  {
    v45 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BCCFI cfiWithString:error:](BCCFI, "cfiWithString:error:", v4, &v45));
    v8 = v45;
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  v43 = v6;
  if (objc_msgSend(v6, "length"))
  {
    v44 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[BCCFI cfiWithString:error:](BCCFI, "cfiWithString:error:", v6, &v44));
    v41 = v44;
  }
  else
  {
    v9 = 0;
    v41 = 0;
  }
  v10 = 0;
  v42 = v8;
  if (v7 && !v8)
  {
    v11 = ((uint64_t (*)(void))BCAugmentedExperienceLog)();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v47 = v4;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Valid end of book: %@", buf, 0xCu);
    }

    if (v9)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "headCFI"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tailCFI"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[BCEPubBookPosition positionWithCFI:](BCEPubBookPosition, "positionWithCFI:", v13));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[BCEPubBookPosition positionWithCFI:](BCEPubBookPosition, "positionWithCFI:", v14));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[BCBookSection bookSectionWithStartPosition:endPosition:](BCBookSection, "bookSectionWithStartPosition:endPosition:", v15, v16));

    }
    else
    {
      v17 = 0;
    }
    v10 = objc_alloc_init((Class)BCAugmentedExperiencePoint);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[BCEPubBookPosition positionWithCFI:](BCEPubBookPosition, "positionWithCFI:", v7));
    objc_msgSend(v10, "setExperiencePoint:", v18);

    objc_msgSend(v10, "setValidRange:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "endOfBookConfidence"));
    objc_msgSend(v20, "floatValue");
    objc_msgSend(v10, "setConfidence:");

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[BCAugmentedExperienceRegistry sharedRegistry](BCAugmentedExperienceRegistry, "sharedRegistry"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "presenterForExperienceType:", 0));
  if (v22)
  {
    v23 = objc_alloc_init((Class)BCAugmentedExperience);
    objc_msgSend(v23, "setPresenter:", v22);
    objc_msgSend(v23, "setLocation:", v10);
    objc_msgSend(v23, "setDelay:", 0.0);
    objc_msgSend(v23, "setKind:", 0);
    objc_msgSend(v23, "setEnabled:", 1);
    objc_msgSend(v23, "setSkipToast:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "endOfBookVersion"));
    objc_msgSend(v23, "setVersion:", v25);

    v26 = BCAugmentedExperienceLog(objc_msgSend(v23, "setPageProgressionIsRTL:", -[BKBookViewController pageProgressionDirection](self, "pageProgressionDirection") == 1));
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      sub_11C768();

    v29 = BCAugmentedExperienceLog(v28);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "Created end of book experience for EPUB", buf, 2u);
    }
  }
  else
  {
    v31 = ((uint64_t (*)(void))BCAugmentedExperienceLog)();
    v30 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      sub_11C700(v30, v32, v33, v34, v35, v36, v37, v38);
    v23 = 0;
  }

  v39 = v23;
  return v39;
}

- (void)pageViewControllersDidChange
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController experienceManager](self, "experienceManager"));
  objc_msgSend(v3, "presentingViewControllerDidChangeLayout:", self);

}

- (id)visibleCFIRange
{
  return 0;
}

- (void)bookSectionChanged:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController bookPositionProcessor](self, "bookPositionProcessor"));
    objc_msgSend(v5, "emitter:bookSectionChanged:", self, v6);

  }
}

- (void)bookMilestoneReached:(int64_t)a3
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));

  if (v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController bookPositionProcessor](self, "bookPositionProcessor"));
    objc_msgSend(v6, "emitter:bookMilestoneReached:", self, a3);

  }
}

- (void)bookPositionChanged:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController bookPositionProcessor](self, "bookPositionProcessor"));
    objc_msgSend(v5, "emitter:bookPositionChanged:", self, v6);

  }
}

- (BOOL)isOnLastPage
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  BOOL v9;
  BOOL v10;

  v3 = -[BKBookViewController currentPages](self, "currentPages");
  v5 = v4;
  if ((-[BKBookViewController layout](self, "layout") & 0xFFFFFFFFFFFFFFFELL) == 2)
    v5 = 2;
  v6 = -[BKBookViewController pageCountIncludingUpsell](self, "pageCountIncludingUpsell");
  if (v3 == (id)0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v9 = v6 >= (unint64_t)v3 && v6 - (unint64_t)v3 < v5;
  v10 = v6 != 0x7FFFFFFFFFFFFFFFLL && v9;
  return v6 && v10;
}

- (BOOL)inLiveResize
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));
  v3 = objc_msgSend(v2, "inLiveResize");

  return v3;
}

- (void)readingLocationChanged
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (-[BKBookViewController section](self, "section")
    || !+[BCAugmentedExperienceManager endOfBookExperienceFeatureEnabled](BCAugmentedExperienceManager, "endOfBookExperienceFeatureEnabled"))
  {
    goto LABEL_9;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sampleContent"));
  if (objc_msgSend(v4, "BOOLValue"))
    goto LABEL_4;
  v5 = -[BKBookViewController isRotationInProgress](self, "isRotationInProgress");

  if ((v5 & 1) == 0)
  {
    -[BKBookViewController currentPages](self, "currentPages");
    -[BKBookViewController layout](self, "layout");
    if (!-[BKBookViewController isOnLastPage](self, "isOnLastPage"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController visibleCFIRange](self, "visibleCFIRange"));
      v3 = v7;
      if (!v7)
      {
        -[BKBookViewController bookSectionChanged:](self, "bookSectionChanged:", 0);
        goto LABEL_5;
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "headCFI"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[BCEPubBookPosition positionWithCFI:](BCEPubBookPosition, "positionWithCFI:", v8));

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tailCFI"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[BCEPubBookPosition positionWithCFI:](BCEPubBookPosition, "positionWithCFI:", v9));

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[BCBookSection bookSectionWithStartPosition:endPosition:](BCBookSection, "bookSectionWithStartPosition:endPosition:", v4, v10));
      -[BKBookViewController bookSectionChanged:](self, "bookSectionChanged:", v11);

LABEL_4:
LABEL_5:

      goto LABEL_9;
    }
    -[BKBookViewController bookMilestoneReached:](self, "bookMilestoneReached:", 2);
  }
LABEL_9:
  -[BKBookViewController writeAnnotationsToWebProcessPlugin](self, "writeAnnotationsToWebProcessPlugin");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController searchResult](self, "searchResult"));

  if (v6)
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController searchResult](self, "searchResult"));
    -[BKBookViewController highlightSearchResult:](self, "highlightSearchResult:", v12);

  }
}

- (void)didPurchaseWithProductProfile:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  if (objc_msgSend(a3, "isPreorder"))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_49144;
    v9[3] = &unk_1BF2A0;
    v9[4] = self;
    v10 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);

  }
  else
  {
    v7 = objc_retainBlock(v6);
    v8 = v7;
    if (v7)
      (*((void (**)(id))v7 + 2))(v7);

  }
}

- (void)setAssetIsPreordered:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  objc_msgSend(v5, "setIsPreorder:", v4);

}

- (BOOL)simulateManualPageTurn:(BOOL)a3 time:(double)a4
{
  return 0;
}

- (BOOL)_performScrollTest:(id)a3 iterations:(int)a4 delta:(int)a5
{
  return 0;
}

- (void)_performScrollTest:(id)a3 completionHandler:(id)a4
{
  void (**v4)(void);
  void (**v5)(void);

  v4 = (void (**)(void))objc_retainBlock(a4);
  if (v4)
  {
    v5 = v4;
    v4[2]();
    v4 = v5;
  }

}

- (void)releaseViews
{
  AENotePopoverEditorController *noteEditor;
  AEHighlightColorEditorController *colorEditor;
  void *v5;
  objc_super v6;

  -[BKBookViewController stopFetchingBookmarks](self, "stopFetchingBookmarks");
  -[AENotePopoverEditorController setDelegate:](self->_noteEditor, "setDelegate:", 0);
  noteEditor = self->_noteEditor;
  self->_noteEditor = 0;

  -[AEHighlightColorEditorController setDelegate:](self->_colorEditor, "setDelegate:", 0);
  colorEditor = self->_colorEditor;
  self->_colorEditor = 0;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController activityViewController](self, "activityViewController"));
  if (v5)
    -[BKBookViewController dismissCurrentPopoverAnimated:](self, "dismissCurrentPopoverAnimated:", 0);
  v6.receiver = self;
  v6.super_class = (Class)BKBookViewController;
  -[BKViewController releaseViews](&v6, "releaseViews");
}

- (void)cleanupPopovers
{
  objc_super v3;

  -[BKBookViewController setBrightnessController:](self, "setBrightnessController:", 0);
  -[BKBookViewController setAudioController:](self, "setAudioController:", 0);
  v3.receiver = self;
  v3.super_class = (Class)BKBookViewController;
  -[BKViewController cleanupPopovers](&v3, "cleanupPopovers");
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  BKBookViewController *v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BCAudioMuxingCoordinator sharedInstance](BCAudioMuxingCoordinator, "sharedInstance"));
  objc_msgSend(v3, "removeAudioMuxingObserver:", self);

  -[BKBookViewController releaseViews](self, "releaseViews");
  -[BKViewController hideOverlayViewControllerWithCompletion:](self, "hideOverlayViewControllerWithCompletion:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
  objc_msgSend(v5, "cancelPagination");

  -[BKBookViewController setPaginationController:](self, "setPaginationController:", 0);
  -[BKBookViewController setBook:](self, "setBook:", 0);
  -[BKBookViewController p_releaseDictionary](self, "p_releaseDictionary");
  -[BKBookViewController _cleanupFootnoteViewController](self, "_cleanupFootnoteViewController");
  -[BKPageNavigationViewController setDelegate:](self->_pageNavigationViewController, "setDelegate:", 0);
  -[BKSearchViewController setSearchDelegate:](self->_searchViewController, "setSearchDelegate:", 0);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_contentViewControllers, "allValues"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), "setDelegate:", 0);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  v11 = (BKBookViewController *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController delegate](self->_expandedContentViewController, "delegate"));
  if (v11 == self)
    -[BKExpandedContentViewController setDelegate:](self->_expandedContentViewController, "setDelegate:", 0);
  -[BKUpsell setDelegate:](self->_upsellContentViewController, "setDelegate:", 0);
  -[BKBookViewController stopReadAloud](self, "stopReadAloud");
  -[BKBookViewController stopSoundtrack](self, "stopSoundtrack");
  -[IMAVPlayer setDelegate:](self->_readPlayer, "setDelegate:", 0);
  -[IMPerformSelectorProxy teardown](self->_performSelectorProxy, "teardown");
  -[BKActionController setDelegate:](self->_actionController, "setDelegate:", 0);
  v12.receiver = self;
  v12.super_class = (Class)BKBookViewController;
  -[BKViewController dealloc](&v12, "dealloc");
}

- (void)didReceiveMemoryWarning
{
  objc_super v3;

  -[BKBookViewController clearInactiveContentViewControllers](self, "clearInactiveContentViewControllers");
  v3.receiver = self;
  v3.super_class = (Class)BKBookViewController;
  -[BKBookViewController didReceiveMemoryWarning](&v3, "didReceiveMemoryWarning");
}

- (void)willMoveToParentViewController:(id)a3
{
  BCUIHoverInteraction *hoverInteraction;
  void *v5;
  BCUIHoverInteraction *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKBookViewController;
  -[BKBookViewController willMoveToParentViewController:](&v7, "willMoveToParentViewController:", a3);
  hoverInteraction = self->_hoverInteraction;
  if (hoverInteraction)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCUIHoverInteraction view](hoverInteraction, "view"));
    objc_msgSend(v5, "removeInteraction:", self->_hoverInteraction);

    v6 = self->_hoverInteraction;
    self->_hoverInteraction = 0;

  }
}

- (void)didMoveToParentViewController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKBookViewController;
  -[BKBookViewController didMoveToParentViewController:](&v4, "didMoveToParentViewController:", a3);
  -[BKBookViewController _updateHoverInteraction](self, "_updateHoverInteraction");
}

- (void)_updateHoverInteraction
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  BCUIHoverInteraction *v7;
  BCUIHoverInteraction *hoverInteraction;
  void *v9;
  void *v10;

  if (!self->_hoverInteraction)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController navigationController](self, "navigationController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));

    if (v4)
    {
      v5 = objc_alloc((Class)BCUIHoverInteraction);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController view](self, "view"));
      v7 = (BCUIHoverInteraction *)objc_msgSend(v5, "initWithDelegate:view:", self, v6);
      hoverInteraction = self->_hoverInteraction;
      self->_hoverInteraction = v7;

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController navigationController](self, "navigationController"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
      objc_msgSend(v10, "addInteraction:", self->_hoverInteraction);

      -[BKBookViewController rebuildHoverRegions](self, "rebuildHoverRegions");
    }
  }
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v10;

  -[BKBookViewController updateUIForSmartInvert](self, "updateUIForSmartInvert");
  v10.receiver = self;
  v10.super_class = (Class)BKBookViewController;
  v3 = -[BKBookViewController viewDidLoad](&v10, "viewDidLoad");
  if ((BUIsRunningTests(v3) & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenuSystem mainSystem](UIMenuSystem, "mainSystem"));
    objc_msgSend(v4, "setNeedsRebuild");

  }
  -[BKBookViewController _updateHoverInteraction](self, "_updateHoverInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "handleVoiceOverStatusChanged:", UIAccessibilityVoiceOverStatusDidChangeNotification, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "handleSwitchControlStatusChanged:", UIAccessibilitySwitchControlStatusDidChangeNotification, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:", self, "handleInvertColorsStatusChanged:", UIAccessibilityInvertColorsStatusDidChangeNotification, 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  if ((char *)objc_msgSend(v8, "orientation") - 3 >= (_BYTE *)&dword_0 + 2)
    v9 = 1;
  else
    v9 = 2;
  -[BKBookViewController setLastAnalyticsDeviceOrientationReported:](self, "setLastAnalyticsDeviceOrientationReported:", v9);

}

- (int64_t)themeInterfaceStyle
{
  void *v2;
  int64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController theme](self, "theme"));
  if (objc_msgSend(v2, "shouldInvertContent"))
    v3 = 2;
  else
    v3 = 1;

  return v3;
}

- (void)viewIsAppearing:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;

  v3 = a3;
  v5 = _AEBookPluginsLifeCycleLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_opt_class(self);
    v8 = v7;
    v9 = v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "assetLogID"));
    *(_DWORD *)buf = 138543618;
    v20 = v8;
    v21 = 2114;
    v22 = v11;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "viewWillAppear BVC:%{public}@ logID:%{public}@", buf, 0x16u);

  }
  v18.receiver = self;
  v18.super_class = (Class)BKBookViewController;
  -[BKBookViewController viewIsAppearing:](&v18, "viewIsAppearing:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BCThemeCoordinator shared](BCThemeCoordinator, "shared"));
  objc_msgSend(v12, "addObserver:", self);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "storeChangedNotification:", kAEStoreEnabledChangedNotification, 0);

  -[BKBookViewController startFetchingBookmarks](self, "startFetchingBookmarks");
  -[BKBookViewController updateBookmarkButton:](self, "updateBookmarkButton:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  self->_autoTurn = objc_msgSend(v14, "BOOLForKey:", BKReadAloudAutoPageTurn[0]);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("soundtrackState")));

  if (v16)
    self->_isPlayingSoundTrack = objc_msgSend(v16, "BOOLValue");
  else
    self->_isPlayingSoundTrack = 1;
  if (-[BKBookViewController bkaxNeedsPersistentControls](self, "bkaxNeedsPersistentControls"))
    -[BKBookViewController setControlsVisible:animated:](self, "setControlsVisible:animated:", 1, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController displaySleepController](self, "displaySleepController"));
  objc_msgSend(v17, "userInteractionOccurred");

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BKBookViewController;
  -[BKBookViewController viewDidAppear:](&v13, "viewDidAppear:", a3);
  -[BKBookViewController setSafeToShowToolbarItems:](self, "setSafeToShowToolbarItems:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = objc_msgSend(v4, "launchedToTest");

  if ((v5 & 1) == 0)
    -[BKBookViewController promptForRemoteResourcesIfNecessary](self, "promptForRemoteResourcesIfNecessary");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController openingLocation](self, "openingLocation"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController openingLocation](self, "openingLocation"));
    -[BKBookViewController recordedJumpToLocation:animated:completion:](self, "recordedJumpToLocation:animated:completion:", v7, 0, 0);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));

  if (v8)
    +[IMSleepManager startSleepTimer](IMSleepManager, "startSleepTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
  objc_msgSend(v9, "bookViewDidAppear:", self);

  -[BKBookViewController updateProgressKitForNewLocation](self, "updateProgressKitForNewLocation");
  -[BKBookViewController bc_analyticsVisibilityUpdateSubtree](self, "bc_analyticsVisibilityUpdateSubtree");
  -[BKBookViewController _updateHoverInteraction](self, "_updateHoverInteraction");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "window"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController displaySleepController](self, "displaySleepController"));
  objc_msgSend(v12, "setWindow:", v11);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKBookViewController;
  -[BKBookViewController viewWillDisappear:](&v7, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BCThemeCoordinator shared](BCThemeCoordinator, "shared"));
  objc_msgSend(v4, "removeObserver:", self);

  -[BKBookViewController cancelPendingHidePageControls](self, "cancelPendingHidePageControls");
  -[BKBookViewController pauseReadAloud](self, "pauseReadAloud");
  +[IMSleepManager stopSleepTimer](IMSleepManager, "stopSleepTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, kAEStoreEnabledChangedNotification, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
  objc_msgSend(v6, "bookViewWillDisappear:", self);

  -[BKBookViewController bc_analyticsVisibilitySubtreeWillDisappear](self, "bc_analyticsVisibilitySubtreeWillDisappear");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKBookViewController;
  -[BKBookViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[BKBookViewController bc_analyticsVisibilitySubtreeDidDisappear](self, "bc_analyticsVisibilitySubtreeDidDisappear");
}

- (BOOL)shouldAutorotate
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentViewControllers](self, "contentViewControllers", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "currentlyHighlighting") & 1) != 0)
        {
          v8 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_11:

  return v8;
}

- (unint64_t)supportedInterfaceOrientations
{
  if (isPad(self, a2))
    return 30;
  else
    return 26;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  objc_super v17;
  _QWORD v18[5];

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = -[BKBookViewController setRotationInProgress:](self, "setRotationInProgress:", 1);
  if (isPad(v8, v9))
    -[AENotePopoverEditorController hide](self->_noteEditor, "hide");
  -[AEHighlightColorEditorController hide](self->_colorEditor, "hide");
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_4A0A8;
  v18[3] = &unk_1BE8C8;
  v18[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v18);
  v17.receiver = self;
  v17.super_class = (Class)BKBookViewController;
  -[BKBookViewController viewWillTransitionToSize:withTransitionCoordinator:](&v17, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController referenceLibraryViewController](self, "referenceLibraryViewController"));
  v11 = v10;
  if (v10 && objc_msgSend(v10, "_isInPopoverPresentation"))
    -[BKBookViewController dismissCurrentPopoverAnimated:](self, "dismissCurrentPopoverAnimated:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController translationViewController](self, "translationViewController"));
  v13 = v12;
  if (v12 && objc_msgSend(v12, "_isInPopoverPresentation"))
    -[BKBookViewController dismissCurrentPopoverAnimated:](self, "dismissCurrentPopoverAnimated:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController footnoteController](self, "footnoteController"));
  v15 = v14;
  if (v14 && objc_msgSend(v14, "_isInPopoverPresentation"))
    -[BKBookViewController dismissCurrentPopoverAnimated:](self, "dismissCurrentPopoverAnimated:", 0);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_4A0B0;
  v16[3] = &unk_1BE8C8;
  v16[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v16);

}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5;

  -[BKBookViewController createPaginationControllerIfNeeded:](self, "createPaginationControllerIfNeeded:", 1, a4);
  if ((-[BKBookViewController im_isCompactWidth](self, "im_isCompactWidth") & 1) == 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController footnoteController](self, "footnoteController"));
    objc_msgSend(v5, "dismissCurrentPopover");

  }
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));
  objc_msgSend(v10, "assetViewController:presentViewController:animated:completion:", self, v9, v5, v8);

}

- (void)setBook:(id)a3
{
  BEProtocolCacheItem *currentBookCacheItem;
  void *v6;
  AEBookInfo *book;
  NSManagedObjectContext *bookMoc;
  void *v9;
  NSManagedObjectContext *v10;
  NSManagedObjectContext *v11;
  void *v12;
  id v13;

  v13 = a3;
  currentBookCacheItem = self->_currentBookCacheItem;
  self->_currentBookCacheItem = 0;

  -[BKBookViewController setPaginationController:](self, "setPaginationController:", 0);
  if (self->_bookMoc)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "removeObserver:name:object:", self, NSManagedObjectContextDidSaveNotification, 0);

    -[NSManagedObjectContext refreshObject:mergeChanges:](self->_bookMoc, "refreshObject:mergeChanges:", self->_book, 0);
    book = self->_book;
    self->_book = 0;

    if (-[NSManagedObjectContext hasChanges](self->_bookMoc, "hasChanges"))
      -[NSManagedObjectContext save:](self->_bookMoc, "save:", 0);
    -[NSManagedObjectContext reset](self->_bookMoc, "reset");
    bookMoc = self->_bookMoc;
    self->_bookMoc = 0;

  }
  v9 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&self->_book, a3);
    -[BKViewController setLayoutDirection:](self, "setLayoutDirection:", -[BKBookViewController pageProgressionDirection](self, "pageProgressionDirection") == 1);
    self->_layout = -[BKBookViewController validLayoutForBook:desiredLayout:](self, "validLayoutForBook:desiredLayout:", v13, -[BKBookViewController defaultLayoutToUse](self, "defaultLayoutToUse"));
    v10 = (NSManagedObjectContext *)objc_claimAutoreleasedReturnValue(-[AEBookInfo managedObjectContext](self->_book, "managedObjectContext"));
    v11 = self->_bookMoc;
    self->_bookMoc = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v12, "addObserver:selector:name:object:", self, "managedObjectContextDidSave:", NSManagedObjectContextDidSaveNotification, 0);

    -[BKBookViewController restoreSavedLocation](self, "restoreSavedLocation");
    v9 = v13;
  }

}

- (void)setPageCountIncludingUpsell:(int64_t)a3
{
  if (self->_pageCountIncludingUpsell != a3)
  {
    self->_pageCountIncludingUpsell = a3;
    -[BKBookViewController pageCountDidUpdate](self, "pageCountDidUpdate");
    -[BKBookViewController updateTouchBarController](self, "updateTouchBarController");
  }
}

- (void)createPaginationControllerIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  id v9;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));

  if (!v5)
  {
    v9 = +[BKPaginationController newPaginationControllerForBook:delegate:](BKPaginationController, "newPaginationControllerForBook:delegate:", self->_book, self);
    -[BKBookViewController setPaginationController:](self, "setPaginationController:");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v7 = BKPaginationCompleteForBookNotification;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
    objc_msgSend(v6, "addObserver:selector:name:object:", self, "_paginationComplete:", v7, v8);

    if (v3)
      -[BKBookViewController paginationUpdateRequired](self, "paginationUpdateRequired");

  }
}

- (void)_setAudioSessionMix:(BOOL)a3
{
  void *v3;
  unsigned int v4;
  void *v5;
  unsigned int v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  if (a3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v4 = objc_msgSend(v3, "hasMediaOverlayElements");

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
      v11 = 0;
      v6 = objc_msgSend(v5, "setCategory:error:", AVAudioSessionCategoryPlayback, &v11);
      v7 = v11;

      if (v6)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
        v10 = v7;
        objc_msgSend(v8, "setActive:error:", 1, &v10);
        v9 = v10;

        v7 = v9;
      }

    }
  }
}

- (BEProtocolCacheItem)currentBookCacheItem
{
  BEProtocolCacheItem *currentBookCacheItem;
  void *v4;
  BEProtocolCacheItem *v5;
  BEProtocolCacheItem *v6;

  currentBookCacheItem = self->_currentBookCacheItem;
  if (!currentBookCacheItem)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v5 = (BEProtocolCacheItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cacheItem"));
    v6 = self->_currentBookCacheItem;
    self->_currentBookCacheItem = v5;

    currentBookCacheItem = self->_currentBookCacheItem;
  }
  return currentBookCacheItem;
}

- (int64_t)readerType
{
  return 0;
}

- (AEAsset)asset
{
  return (AEAsset *)self->_book;
}

- (void)open:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));
    objc_msgSend(v6, "assetViewController:willOpen:", self, v3);

  }
  -[BKBookViewController _setAudioSessionMix:](self, "_setAudioSessionMix:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentViewControllers](self, "contentViewControllers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allValues"));
  objc_msgSend(v8, "makeObjectsPerformSelector:", "resume");

  -[BKBookViewController updateUIForSmartInvert](self, "updateUIForSmartInvert");
}

- (void)jumpToBeginningAnimated:(BOOL)a3
{
  -[BKBookViewController turnToFirstPage:](self, "turnToFirstPage:", a3);
}

- (void)openToLocation:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a4;
  v11 = a3;
  -[BKBookViewController setOpeningLocation:](self, "setOpeningLocation:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  objc_msgSend(v11, "updateOrdinalForBookInfo:", v6);

  if (-[BKBookViewController isVisible](self, "isVisible"))
  {
    if (-[BKBookViewController section](self, "section"))
    {
      -[BKBookViewController setResumeLocation:](self, "setResumeLocation:", v11);
      -[BKBookViewController setSection:animated:adjustScrollToReveal:](self, "setSection:animated:adjustScrollToReveal:", 0, v4, 0);
      -[BKBookViewController setResumeLocation:](self, "setResumeLocation:", 0);
    }
    else if (!-[BKBookViewController isLocationOnCurrentPage:](self, "isLocationOnCurrentPage:", v11))
    {
      -[BKBookViewController recordedJumpToLocation:animated:completion:](self, "recordedJumpToLocation:animated:completion:", v11, v4, 0);
    }
  }
  else
  {
    -[BKBookViewController setLocation:](self, "setLocation:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));
      objc_msgSend(v8, "assetViewController:willOpen:", self, v4);

    }
    -[BKBookViewController _setAudioSessionMix:](self, "_setAudioSessionMix:", 1);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentViewControllers](self, "contentViewControllers"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allValues"));
  objc_msgSend(v10, "makeObjectsPerformSelector:", "resume");

}

- (void)requestClose:(BOOL)a3
{
  void *v5;
  void *v6;
  _QWORD v7[5];
  BOOL v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
  objc_msgSend(v5, "postEvent:sender:", kBETestDriverOpenAnimationStart, self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
  objc_msgSend(v6, "postEvent:sender:", kBETestDriverOpenAnimationSetupStart, self);

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_4A870;
  v7[3] = &unk_1BFD40;
  v7[4] = self;
  v8 = a3;
  -[BKViewController dismissCurrentPopoverWithCompletion:](self, "dismissCurrentPopoverWithCompletion:", v7);
}

- (void)close:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentData](self, "contentData"));
  -[BKBookViewController setCachedContentData:](self, "setCachedContentData:", v5);

  -[BKBookViewController bookMilestoneReached:](self, "bookMilestoneReached:", 10);
  -[BKBookViewController stopPlayingMedia:](self, "stopPlayingMedia:", 0);
  -[BKViewController hideOverlayViewControllerWithCompletion:](self, "hideOverlayViewControllerWithCompletion:", 0);
  -[BKBookViewController stopFetchingBookmarks](self, "stopFetchingBookmarks");
  -[BKBookViewController _setAudioSessionMix:](self, "_setAudioSessionMix:", 0);
  -[BKBookViewController saveStateClosing:](self, "saveStateClosing:", 1);
  -[BKBookViewController stopSoundtrack](self, "stopSoundtrack");
  -[BKBookViewController setReadAloudState:](self, "setReadAloudState:", 0);
  -[BKBookViewController saveBook](self, "saveBook");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo baseURL](self->_book, "baseURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "absoluteString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
  +[BKTextIndex removeTextIndexWithName:](BKTextIndex, "removeTextIndexWithName:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentViewControllers](self, "contentViewControllers"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allValues"));
  objc_msgSend(v10, "makeObjectsPerformSelector:", "suspend");

  v11 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));
  objc_msgSend(v11, "assetViewController:willClose:", self, v3);

}

- (void)assetViewControllerUpdateToolbarsAfterOpenAnimation
{
  -[BKBookViewController setControlsVisible:animated:](self, "setControlsVisible:animated:", -[BKBookViewController shouldControlsBeVisibleOnOpen](self, "shouldControlsBeVisibleOnOpen"), 1);
}

- (void)assetViewControllerUpdateToolbarsForOpenAnimation
{
  -[BKBookViewController setControlsVisible:animated:](self, "setControlsVisible:animated:", -[BKBookViewController shouldControlsBeVisibleOnOpen](self, "shouldControlsBeVisibleOnOpen"), 0);
}

- (void)assetViewControllerPrepareForReload
{
  -[BKBookViewController saveStateClosing:](self, "saveStateClosing:", 0);
}

- (BOOL)shouldControlsBeVisibleOnOpen
{
  unsigned int v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;

  v3 = -[BKBookViewController controlsVisible](self, "controlsVisible");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sampleContent"));
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BRCConfigurationManager sharedInstance](BRCConfigurationManager, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForKey:fromNamespace:", BRCBooksDefaultsKeyReadingExperienceSamplesShowChromeOnOpen, BRCBooksDefaultsNamespace));

    v3 |= objc_msgSend(v8, "BOOLValue");
  }
  return v3;
}

- (void)saveStateClosing:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;

  v3 = a3;
  if (a3)
  {
    v5 = _AEBookPluginsLifeCycleLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_opt_class(self);
      v8 = v7;
      v9 = v7;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "assetLogID"));
      v12 = 138543618;
      v13 = v8;
      v14 = 2114;
      v15 = v11;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "SaveState while Closing BVC:%{public}@ logID:%{public}@", (uint8_t *)&v12, 0x16u);

    }
  }
  -[BKBookViewController saveStateClosing:suspending:](self, "saveStateClosing:suspending:", v3, 0);
}

- (void)saveStateClosing:(BOOL)a3 suspending:(BOOL)a4
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book", a3, a4));
  if (v6 && (objc_msgSend(v6, "isDeleted") & 1) == 0 && objc_msgSend(v6, "exists"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController savableLocation](self, "savableLocation"));
    if (v5)
      -[BKBookViewController saveReadingLocation:](self, "saveReadingLocation:", v5);

  }
  -[BKBookViewController setOpeningLocation:](self, "setOpeningLocation:", 0);

}

- (BOOL)dismissShouldBegin:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  unsigned __int8 v7;

  v3 = a3;
  objc_msgSend(v3, "velocity");
  v5 = v4;
  objc_msgSend(v3, "velocity");
  if (v5 >= v6)
    v7 = 0;
  else
    v7 = objc_msgSend(v3, "proposedBeginState");

  return v7;
}

- (void)saveBook
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));
  v5 = objc_msgSend(v4, "hasChanges");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "managedObjectContext"));
    v14 = 0;
    v8 = objc_msgSend(v7, "save:", &v14);
    v9 = v14;

    if ((v8 & 1) == 0)
    {
      if (v9)
      {
        v10 = BCIMLog();
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v16 = "-[BKBookViewController saveBook]";
          v17 = 2080;
          v18 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/BKBookViewController.m";
          v19 = 1024;
          v20 = 1263;
          _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
        }

        v12 = BCIMLog();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "[error description]", buf, 2u);
        }

      }
    }
  }
}

- (void)paginationCompleted
{
  -[BKBookViewController updatePageCount](self, "updatePageCount");
  -[BKBookViewController updateTouchBarController](self, "updateTouchBarController");
}

- (int64_t)pageCountExcludingUpsell
{
  int64_t v3;
  int64_t v4;

  v3 = -[BKBookViewController pageCountIncludingUpsell](self, "pageCountIncludingUpsell");
  v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
    return v3 - (-[BKBookViewController upsellOrdinal](self, "upsellOrdinal") != 0x7FFFFFFFFFFFFFFFLL);
  return v4;
}

- (void)updatePageCount
{
  int64_t v3;
  uint64_t v4;
  int64_t v5;

  v3 = -[BKBookViewController calculatePageCountExcludingUpsell](self, "calculatePageCountExcludingUpsell");
  v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v3;
    if (-[BKBookViewController upsellOrdinal](self, "upsellOrdinal") == 0x7FFFFFFFFFFFFFFFLL)
      v4 = v5;
    else
      v4 = v5 + 1;
  }
  -[BKBookViewController setPageCountIncludingUpsell:](self, "setPageCountIncludingUpsell:", v4);
}

- (int64_t)calculatePageCountExcludingUpsell
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));

  if (!v3)
    return 0x7FFFFFFFFFFFFFFFLL;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
  v5 = objc_msgSend(v4, "pageTotal");

  return (int64_t)v5;
}

- (BOOL)hidesPageControlsOnOpen
{
  void *v2;
  void *v3;
  unsigned int v4;

  if (-[BKBookViewController controlsVisible](self, "controlsVisible"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    if (objc_msgSend(v2, "BOOLForKey:", BKBookHidePageControls[0]))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v4 = objc_msgSend(v3, "BOOLForKey:", BKBookDisableAutoHidePageControls[0]) ^ 1;

    }
    else
    {
      LOBYTE(v4) = 0;
    }

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (double)hidesPageControlsOnOpenDelay
{
  return 2.0;
}

- (void)cancelPendingHidePageControls
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController performSelectorProxy](self, "performSelectorProxy"));
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", v3, "hidePageControls:", self);

}

- (void)delayedHidePageControls
{
  id v3;

  -[BKBookViewController cancelPendingHidePageControls](self, "cancelPendingHidePageControls");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController performSelectorProxy](self, "performSelectorProxy"));
  -[BKBookViewController hidesPageControlsOnOpenDelay](self, "hidesPageControlsOnOpenDelay");
  objc_msgSend(v3, "performSelector:withObject:afterDelay:", "hidePageControls:", self);

}

- (void)transitionDidFinish:(BOOL)a3
{
  if (a3)
  {
    if (-[BKBookViewController hidesPageControlsOnOpen](self, "hidesPageControlsOnOpen"))
      -[BKBookViewController delayedHidePageControls](self, "delayedHidePageControls");
  }
}

- (BKLocation)savableLocation
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController currentLocation](self, "currentLocation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController savableLocationForLocation:](self, "savableLocationForLocation:", v3));

  return (BKLocation *)v4;
}

- (id)savableLocationForLocation:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  if (((unint64_t)objc_msgSend(v4, "ordinal") & 0x8000000000000000) != 0)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[BKBookViewController resumeLocation](self, "resumeLocation"));
  }
  else
  {
    v5 = objc_msgSend(v4, "ordinal");
    if (v5 != (id)-[BKBookViewController upsellOrdinal](self, "upsellOrdinal"))
      goto LABEL_6;
    v6 = objc_claimAutoreleasedReturnValue(-[BKBookViewController pageLocationForPageNumber:](self, "pageLocationForPageNumber:", -[BKBookViewController pageCountExcludingUpsell](self, "pageCountExcludingUpsell")));
  }
  v7 = (void *)v6;

  v4 = v7;
LABEL_6:
  if (((unint64_t)objc_msgSend(v4, "ordinal") & 0x8000000000000000) != 0)
  {

    v4 = 0;
  }
  return v4;
}

- (void)restoreSavedLocation
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;

  v3 = _AEBookPluginsLifeCycleLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_opt_class(self);
    v6 = v5;
    v7 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetLogID"));
    v12 = 138543618;
    v13 = v6;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "restoreSavedLocation BVC:%{public}@ for logID:%{public}@ ", (uint8_t *)&v12, 0x16u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "readingLocation"));
  -[BKBookViewController setLocation:](self, "setLocation:", v11);

}

- (void)_promptToLoadExternalContent:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;

  v4 = a3;
  v5 = AEBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Allow Online Content?"), &stru_1C3088, 0));

  v7 = AEBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("This book needs to access online content, or it may not display as the publisher intended."), &stru_1C3088, 0));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v21, v20, 1));
  v10 = AEBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Don’t Allow"), &stru_1C3088, 0));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_4B59C;
  v24[3] = &unk_1BFD68;
  v13 = v4;
  v24[4] = self;
  v25 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v12, 1, v24));
  objc_msgSend(v9, "addAction:", v14);

  v15 = AEBundle();
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Allow"), &stru_1C3088, 0));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_4B5E0;
  v22[3] = &unk_1BFD68;
  v22[4] = self;
  v23 = v13;
  v18 = v13;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v17, 0, v22));
  objc_msgSend(v9, "addAction:", v19);

  -[BKBookViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
}

- (void)promptForRemoteResourcesIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  if (-[BKBookViewController hasRemoteResources](self, "hasRemoteResources"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[BEDocumentExternalLoadApprovalCache sharedInstance](BEDocumentExternalLoadApprovalCache, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetID"));

    if ((objc_msgSend(v3, "hasCachedLoadExternalContentApprovalForBookID:", v5) & 1) == 0)
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_4B6FC;
      v6[3] = &unk_1BFD90;
      v7 = v3;
      v8 = v5;
      -[BKBookViewController _promptToLoadExternalContent:](self, "_promptToLoadExternalContent:", v6);

    }
  }
}

- (BOOL)hasRemoteResources
{
  BOOL v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  if (self->_hasCheckedForRemoteResources)
    return self->_hasRemoteResources;
  self->_hasCheckedForRemoteResources = 1;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedDocuments"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "manifestProperties"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "componentsSeparatedByString:", CFSTR(" ")));
        v12 = objc_msgSend(v11, "containsObject:", CFSTR("remote-resources"));

        if ((v12 & 1) != 0)
        {
          v3 = 1;
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  v3 = 0;
LABEL_13:

  self->_hasRemoteResources = v3;
  return v3;
}

- (void)reloadExternalWebFrames
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentViewControllers](self, "contentViewControllers", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v7);
        objc_opt_class(BKHTMLContentViewController);
        if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
        {
          v10 = v8;
          if (objc_msgSend(v10, "isContentLoaded"))
            objc_msgSend(v10, "reloadExternalWebFrames");

        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (BOOL)hasSpreadPages
{
  return 0;
}

- (void)setTheme:(id)a3
{
  id v4;
  id v5;
  id v6;
  dispatch_time_t v7;
  id v8;
  void **v9;
  uint64_t v10;
  id (*v11)(uint64_t);
  void *v12;
  BKBookViewController *v13;
  id v14;
  objc_super v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BKBookViewController;
  v5 = -[BKBookViewController theme](&v16, "theme");
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);

  if (v6 != v4)
  {
    v15.receiver = self;
    v15.super_class = (Class)BKBookViewController;
    -[BKBookViewController setTheme:](&v15, "setTheme:", v4);
    -[BKBookViewController setSelectionHighlightType:](self, "setSelectionHighlightType:", +[BKTextHighlightView bkTextHighlightTypeForIMTextHighlightType:](BKTextHighlightView, "bkTextHighlightTypeForIMTextHighlightType:", objc_msgSend(v4, "textHighlightType")));
  }
  v7 = dispatch_time(0, (uint64_t)(*(double *)&BKBookViewControllerThemeTransitionDuration * 0.5 * 1000000000.0));
  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_4BB20;
  v12 = &unk_1BFDB8;
  v13 = self;
  v14 = v4;
  v8 = v4;
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, &v9);
  -[BKBookViewController updateUIForSmartInvert](self, "updateUIForSmartInvert", v9, v10, v11, v12, v13);

}

- (int)pageProgressionDirection
{
  void *v2;
  int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v3 = objc_msgSend(v2, "bkPageProgressionDirection");

  return v3;
}

- (BOOL)isPageProgressionRTL
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v3 = objc_msgSend(v2, "isPageProgressionRTL");

  return v3;
}

- (void)clearInactiveContentViewControllers
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentViewControllers](self, "contentViewControllers"));
  v4 = objc_msgSend(v3, "copy");

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v10));
        if (!objc_msgSend(v11, "isViewLoaded")
          || (v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view")),
              v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "window")),
              v13,
              v12,
              !v13))
        {
          objc_msgSend(v11, "setDelegate:", 0);
          objc_msgSend(v11, "removeFromParentViewController");
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentViewControllers](self, "contentViewControllers"));
          objc_msgSend(v14, "removeObjectForKey:", v10);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

- (void)storeChangedNotification:(id)a3
{
  if (-[BKBookViewController upsellOrdinal](self, "upsellOrdinal", a3) != 0x7FFFFFFFFFFFFFFFLL)
    -[BKBookViewController updatePageCount](self, "updatePageCount");
}

- (unint64_t)upsellOrdinal
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v4 = objc_msgSend(v3, "hasUpsellPage");

  if (!v4)
    return 0x7FFFFFFFFFFFFFFFLL;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v6 = objc_msgSend(v5, "readingDocumentCount");

  return (unint64_t)v6;
}

- (int64_t)upsellPageNumber
{
  if (-[BKBookViewController upsellOrdinal](self, "upsellOrdinal") == 0x7FFFFFFFFFFFFFFFLL)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return -[BKBookViewController pageCountIncludingUpsell](self, "pageCountIncludingUpsell");
}

- (BKUpsell)upsellContentViewController
{
  BKUpsell *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  BKSampleUpsellContentViewController *v7;
  BKUpsell *upsellContentViewController;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  if (-[BKBookViewController upsellOrdinal](self, "upsellOrdinal") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    if (!self->_upsellContentViewController)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sampleContent"));
      v6 = objc_msgSend(v5, "BOOLValue");

      if (v6)
      {
        v7 = objc_alloc_init(BKSampleUpsellContentViewController);
        -[BKSampleUpsellContentViewController setBuyDelegate:](v7, "setBuyDelegate:", self);
      }
      else
      {
        v7 = objc_alloc_init(BKFinishedContentViewController);
      }
      upsellContentViewController = self->_upsellContentViewController;
      self->_upsellContentViewController = (BKUpsell *)v7;

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
      -[BKUpsell setBook:](self->_upsellContentViewController, "setBook:", v9);

      -[BKUpsell setOrdinal:](self->_upsellContentViewController, "setOrdinal:", -[BKBookViewController upsellOrdinal](self, "upsellOrdinal"));
      -[BKUpsell setDelegate:](self->_upsellContentViewController, "setDelegate:", self);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sampleContent"));
    v12 = objc_msgSend(v11, "BOOLValue");

    if (v12)
    {
      objc_opt_class(BKSampleUpsellContentViewController);
      v14 = BUDynamicCast(v13, self->_upsellContentViewController);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "assetViewControllerProductProfile:", self));
      objc_msgSend(v15, "setProfileFuture:", v17);

    }
    v3 = self->_upsellContentViewController;
  }
  return v3;
}

- (void)showLibrary:(id)a3
{
  -[BKBookViewController books_close:](self, "books_close:", a3);
}

- (void)resume:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_4C018;
  v3[3] = &unk_1BEA38;
  v3[4] = self;
  -[BKViewController dismissCurrentPopoverWithCompletion:](self, "dismissCurrentPopoverWithCompletion:", v3);
}

- (void)_resume
{
  void *v3;
  _QWORD v4[5];

  -[BKBookViewController setSection:animated:adjustScrollToReveal:](self, "setSection:animated:adjustScrollToReveal:", 0, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController resumeLocation](self, "resumeLocation"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_4C0DC;
  v4[3] = &unk_1BEA38;
  v4[4] = self;
  -[BKBookViewController jumpToLocation:animated:completion:](self, "jumpToLocation:animated:completion:", v3, 1, v4);

}

- (void)showTOC:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_4C174;
  v3[3] = &unk_1BEA38;
  v3[4] = self;
  -[BKViewController dismissCurrentPopoverWithCompletion:](self, "dismissCurrentPopoverWithCompletion:", v3);
}

- (void)toggleShowPageControls:(id)a3
{
  void *v4;
  unsigned __int8 v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController expandedContentViewController](self, "expandedContentViewController", a3));
  v5 = objc_msgSend(v4, "isVisible");

  if ((v5 & 1) == 0)
    -[BKBookViewController setControlsVisible:animated:](self, "setControlsVisible:animated:", -[BKBookViewController controlsVisible](self, "controlsVisible") ^ 1, 1);
}

- (void)setStatusBarHidden:(BOOL)a3 animated:(BOOL)a4
{
  -[BKBookViewController setStatusBarHidden:animated:completion:](self, "setStatusBarHidden:animated:completion:", a3, a4, 0);
}

- (void)setStatusBarHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  -[BKBookViewController setStatusBarHidden:animated:animations:completion:](self, "setStatusBarHidden:animated:animations:completion:", a3, a4, 0, a5);
}

- (void)setStatusBarHidden:(BOOL)a3 animated:(BOOL)a4 animations:(id)a5 completion:(id)a6
{
  _BOOL4 v7;
  void (**v9)(_QWORD);
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  _QWORD v13[4];
  void (**v14)(_QWORD);
  _QWORD v15[5];
  void (**v16)(_QWORD);
  BOOL v17;

  v7 = a4;
  v9 = (void (**)(_QWORD))a5;
  v10 = (void (**)(_QWORD))a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "window"));

  if (v7)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_4C444;
    v15[3] = &unk_1BFDE0;
    v17 = v12 != 0;
    v15[4] = self;
    v16 = v9;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_4C490;
    v13[3] = &unk_1BFE08;
    v14 = v10;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v15, v13, 0.15, 0.0);

  }
  else
  {
    if (v12)
    {
      -[BKBookViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
      -[BKBookViewController setNeedsUpdateOfHomeIndicatorAutoHidden](self, "setNeedsUpdateOfHomeIndicatorAutoHidden");
    }
    if (v9)
      v9[2](v9);
    if (v10)
      v10[2](v10);
  }

}

- (BOOL)prefersStatusBarHidden
{
  if ((-[BKBookViewController im_isCompactHeight](self, "im_isCompactHeight") & 1) != 0)
    return 1;
  else
    return !-[BKBookViewController controlsVisible](self, "controlsVisible");
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 1;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return !-[BKBookViewController controlsVisible](self, "controlsVisible");
}

- (void)setControlsVisible:(BOOL)a3 animated:(BOOL)a4
{
  -[BKBookViewController setControlsVisible:animated:completion:](self, "setControlsVisible:animated:completion:", a3, a4, 0);
}

- (void)setControlsVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  -[BKBookViewController setControlsVisible:animated:animations:completion:](self, "setControlsVisible:animated:animations:completion:", a3, a4, 0, a5);
}

- (void)setControlsVisible:(BOOL)a3 animated:(BOOL)a4 animations:(id)a5 completion:(id)a6
{
  _BOOL8 v7;
  _BOOL4 v8;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v7 = a4;
  v8 = a3;
  v10 = a5;
  v11 = a6;
  self->_controlsEnabledViaHover = 0;
  -[BKBookViewController cancelPendingHidePageControls](self, "cancelPendingHidePageControls");
  if (v8
    || !-[BKBookViewController bkaxNeedsPersistentControls](self, "bkaxNeedsPersistentControls")
    || -[BKBookViewController bkaxAccessibilityUserIsRequestingControlsVisibilityToggle](self, "bkaxAccessibilityUserIsRequestingControlsVisibilityToggle"))
  {
    self->_controlsVisible = v8;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_4C60C;
    v12[3] = &unk_1BEC70;
    v13 = v10;
    -[BKBookViewController setStatusBarHidden:animated:animations:completion:](self, "setStatusBarHidden:animated:animations:completion:", !v8, v7, v12, v11);
    -[BKBookViewController delayedSavePageControlVisibility](self, "delayedSavePageControlVisibility");
    -[BKBookViewController writeControlVisibilityStateToWebProcessPlugin](self, "writeControlVisibilityStateToWebProcessPlugin");

  }
}

- (void)setControlsVisible:(BOOL)a3
{
  -[BKBookViewController setControlsVisible:animated:](self, "setControlsVisible:animated:", a3, 0);
}

- (void)hidePageControls:(id)a3
{
  -[BKBookViewController setControlsVisible:animated:](self, "setControlsVisible:animated:", 0, 1);
}

- (void)showBrightness:(id)a3
{
  id v4;
  void ***v5;
  void *v6;
  void ***v7;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  BKBookViewController *v12;
  id v13;

  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_4C6DC;
  v11 = &unk_1BFDB8;
  v12 = self;
  v13 = a3;
  v4 = v13;
  v5 = objc_retainBlock(&v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController brightnessController](self, "brightnessController", v8, v9, v10, v11, v12));
  if (v6)
    v7 = 0;
  else
    v7 = v5;
  -[BKViewController dismissCurrentPopoverWithCompletion:](self, "dismissCurrentPopoverWithCompletion:", v7);

}

- (void)showAudio:(id)a3
{
  id v4;
  void ***v5;
  void **v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  BKBookViewController *v10;
  id v11;

  v6 = _NSConcreteStackBlock;
  v7 = 3221225472;
  v8 = sub_4C81C;
  v9 = &unk_1BFDB8;
  v10 = self;
  v11 = a3;
  v4 = v11;
  v5 = objc_retainBlock(&v6);
  -[BKViewController dismissCurrentPopoverWithCompletion:](self, "dismissCurrentPopoverWithCompletion:", v5, v6, v7, v8, v9, v10);

}

- (void)buy:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate", a3));
  objc_msgSend(v4, "assetViewControllerRequestToBuy:completion:", self, 0);

}

- (void)buyWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));
  v7 = v5;
  if (v5)
  {
    objc_msgSend(v5, "assetViewControllerRequestToBuy:completion:", self, v4);
  }
  else
  {
    v6 = objc_retainBlock(v4);

    if (v6)
      (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
    v4 = v6;
  }

}

- (BOOL)onlySupportsScrollingLayout
{
  return 0;
}

- (void)presentAppearanceViewControllerFromItem:(id)a3
{
  id v3;
  _QWORD v4[4];
  BKBookViewController *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_4CA6C;
  v4[3] = &unk_1BFDB8;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[BKViewController dismissCurrentPopoverWithCompletion:](v5, "dismissCurrentPopoverWithCompletion:", v4);

}

- (id)appearanceMenuItems
{
  const __CFString *v3;

  v3 = CFSTR("BKAppearanceMenuItemBrightness");
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

- (void)setupAppearanceViewController
{
  Class v3;
  BKAppearanceViewController *v4;
  BKAppearanceViewController *appearanceViewController;
  void *v6;
  UINavigationController *v7;
  UINavigationController *appearanceNavigationController;
  void *v9;
  void *v10;
  IMViewController *v11;
  IMViewController *appearanceContainerViewController;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;

  if (!self->_appearanceViewController)
  {
    objc_opt_class(BKAppearanceViewController);
    v4 = (BKAppearanceViewController *)objc_msgSend([v3 alloc], "initWithNibName:bundle:", 0, 0);
    appearanceViewController = self->_appearanceViewController;
    self->_appearanceViewController = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController appearanceMenuItems](self, "appearanceMenuItems"));
    -[BKAppearanceViewController setMenuItems:](self->_appearanceViewController, "setMenuItems:", v6);

    v7 = (UINavigationController *)objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", self->_appearanceViewController);
    appearanceNavigationController = self->_appearanceNavigationController;
    self->_appearanceNavigationController = v7;

    -[UINavigationController setNavigationBarHidden:](self->_appearanceNavigationController, "setNavigationBarHidden:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController theme](self, "theme"));
    -[BKAppearanceViewController setTheme:](self->_appearanceViewController, "setTheme:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    -[BKAppearanceViewController setBook:](self->_appearanceViewController, "setBook:", v10);

    -[BKAppearanceViewController setDelegate:](self->_appearanceViewController, "setDelegate:", self);
    -[BKAppearanceViewController setLayout:](self->_appearanceViewController, "setLayout:", -[BKBookViewController layout](self, "layout"));
    -[BKAppearanceViewController setAppearanceStyle:](self->_appearanceViewController, "setAppearanceStyle:", 0);
    v11 = objc_opt_new(IMViewController);
    appearanceContainerViewController = self->_appearanceContainerViewController;
    self->_appearanceContainerViewController = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController theme](self, "theme"));
    -[IMViewController setTheme:](self->_appearanceContainerViewController, "setTheme:", v13);

    -[IMViewController addChildViewController:](self->_appearanceContainerViewController, "addChildViewController:", self->_appearanceNavigationController);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewController view](self->_appearanceContainerViewController, "view"));
    objc_msgSend(v14, "bounds");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_appearanceNavigationController, "view"));
    objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewController view](self->_appearanceContainerViewController, "view"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_appearanceNavigationController, "view"));
    objc_msgSend(v24, "addSubview:", v25);

    -[BKAppearanceViewController preferredContentSize](self->_appearanceViewController, "preferredContentSize");
    -[IMViewController setPreferredContentSize:](self->_appearanceContainerViewController, "setPreferredContentSize:");
    -[BEAppearanceViewController setScrollSwitchEnabled:](self->_appearanceViewController, "setScrollSwitchEnabled:", -[BKBookViewController onlySupportsScrollingLayout](self, "onlySupportsScrollingLayout") ^ 1);
  }
}

- (void)handleAppearanceViewControllerDismissal
{
  BKAppearanceViewController *appearanceViewController;
  UINavigationController *appearanceNavigationController;
  IMViewController *appearanceContainerViewController;
  id v6;

  -[BKAppearanceViewController setDelegate:](self->_appearanceViewController, "setDelegate:", 0);
  appearanceViewController = self->_appearanceViewController;
  self->_appearanceViewController = 0;

  appearanceNavigationController = self->_appearanceNavigationController;
  self->_appearanceNavigationController = 0;

  appearanceContainerViewController = self->_appearanceContainerViewController;
  self->_appearanceContainerViewController = 0;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
  objc_msgSend(v6, "resume");

}

- (void)appearanceViewController:(id)a3 didChangeLayout:(unint64_t)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v8 = -[BKBookViewController validLayoutForBook:desiredLayout:](self, "validLayoutForBook:desiredLayout:", v7, a4);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController readingSessionData](self, "readingSessionData"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentData](self, "contentData"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "style"));

  objc_msgSend(v13, "fontSize");
  objc_msgSend(v9, "emitReadingScrollViewSettingChangeEventWithTracker:readingSessionData:contentData:fontSize:isOn:", v10, v11, v12, v8 != 1);

  -[BKBookViewController setLayout:](self, "setLayout:", v8);
}

- (void)appearanceViewController:(id)a3 didChangeFont:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController readingSessionData](self, "readingSessionData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentData](self, "contentData"));
  objc_msgSend(v9, "emitReadingFontChangeEventWithTracker:readingSessionData:contentData:fontName:", v6, v7, v8, v5);

}

- (void)appearanceViewController:(id)a3 didChangeFontSize:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  double v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController readingSessionData](self, "readingSessionData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentData](self, "contentData"));
  *(float *)&v9 = a4;
  objc_msgSend(v10, "emitReadingFontSizeChangeEventWithTracker:readingSessionData:contentData:fontSize:", v6, v7, v8, v9);

}

- (void)appearanceViewController:(id)a3 didChangeAutoNightMode:(BOOL)a4 previousValue:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (a4 != a5)
  {
    v5 = a4;
    v10 = (id)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter", a3));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController readingSessionData](self, "readingSessionData"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentData](self, "contentData"));
    objc_msgSend(v10, "emitReadingAutoNightSettingChangeEventWithTracker:readingSessionData:contentData:isOn:", v7, v8, v9, v5);

  }
}

- (void)appearanceViewController:(id)a3 didChangeTheme:(unint64_t)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = BABackgroundColorDataFromBCAppearanceStyle(a4, a2, a3);
  v10 = (id)objc_claimAutoreleasedReturnValue(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController readingSessionData](self, "readingSessionData"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentData](self, "contentData"));
  objc_msgSend(v6, "emitReadingBackgroundColorChangeEventWithTracker:readingSessionData:contentData:backgroundColorData:", v7, v8, v9, v10);

}

- (BOOL)autoNightModeForAppearanceViewController:(id)a3
{
  return 0;
}

- (void)appearanceViewControllerShouldDismiss
{
  -[BKViewController hideOverlayViewControllerWithCompletion:](self, "hideOverlayViewControllerWithCompletion:", 0);
}

- (void)coordinator:(id)a3 observer:(id)a4 didChangeLayout:(unint64_t)a5
{
  -[BKBookViewController appearanceViewController:didChangeLayout:](self, "appearanceViewController:didChangeLayout:", 0, a5);
}

- (void)coordinator:(id)a3 observer:(id)a4 didChangeStyle:(unint64_t)a5
{
  -[BKBookViewController appearanceViewController:didChangeTheme:](self, "appearanceViewController:didChangeTheme:", 0, a5);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  unsigned int v7;
  unsigned __int8 v8;
  char v9;
  void *v10;
  void *v11;
  _BOOL4 isEqual;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BKBookViewController;
  v7 = -[BKBookViewController canPerformAction:withSender:](&v14, "canPerformAction:withSender:", a3, v6);
  if (!sel_isEqual(a3, "copy:"))
  {
    if (sel_isEqual(a3, "books_showContent:"))
    {
      if (v7)
      {
        v8 = -[BKBookViewController canShowContent](self, "canShowContent");
        goto LABEL_21;
      }
    }
    else if (sel_isEqual(a3, "books_pageForward:"))
    {
      if (v7)
      {
        v8 = -[BKBookViewController canGoToNextPage](self, "canGoToNextPage");
        goto LABEL_21;
      }
    }
    else if (sel_isEqual(a3, "books_pageBackward:"))
    {
      if (v7)
      {
        v8 = -[BKBookViewController canGoToPreviousPage](self, "canGoToPreviousPage");
        goto LABEL_21;
      }
    }
    else if (sel_isEqual(a3, "books_chapterLeft:")
           || sel_isEqual(a3, "books_chapterRight:")
           || sel_isEqual(a3, "books_chapterForward:")
           || sel_isEqual(a3, "books_chapterBackward:")
           || sel_isEqual(a3, "books_chapterStart:")
           || sel_isEqual(a3, "books_chapterEnd:"))
    {
      if (v7)
      {
        v8 = -[BKBookViewController canNavigateByChapter](self, "canNavigateByChapter");
        goto LABEL_21;
      }
    }
    else if (sel_isEqual(a3, "books_toggleBookmark:"))
    {
      if (-[BKBookViewController bookCanBeBookmarked](self, "bookCanBeBookmarked"))
      {
        v8 = -[BKBookViewController shouldBookmarkButtonsBeEnabled](self, "shouldBookmarkButtonsBeEnabled");
        goto LABEL_21;
      }
    }
    else if (sel_isEqual(a3, "books_search:"))
    {
      if (v7 && -[BKBookViewController canSearch](self, "canSearch"))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController _searchQueryFromSender:](self, "_searchQueryFromSender:", v6));
        v9 = objc_msgSend(v10, "length") != 0;

        goto LABEL_36;
      }
    }
    else
    {
      if (!sel_isEqual(a3, "books_find:"))
      {
        if (sel_isEqual(a3, "books_findNext:"))
        {
          if (!v7)
            goto LABEL_35;
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController nextSearchResult](self, "nextSearchResult"));
        }
        else
        {
          isEqual = sel_isEqual(a3, "books_findPrevious:");
          if ((isEqual & v7) != 1)
          {
            v9 = v7 & ~isEqual;
            goto LABEL_36;
          }
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController previousSearchResult](self, "previousSearchResult"));
        }
        v9 = v11 != 0;

        goto LABEL_36;
      }
      if (v7)
      {
        v8 = -[BKBookViewController canSearch](self, "canSearch");
        goto LABEL_21;
      }
    }
LABEL_35:
    v9 = 0;
    goto LABEL_36;
  }
  if (!v7)
    goto LABEL_35;
  v8 = -[BKBookViewController canCopy](self, "canCopy");
LABEL_21:
  v9 = v8;
LABEL_36:

  return v9;
}

- (void)books_close:(id)a3
{
  -[BKBookViewController requestClose:](self, "requestClose:", 1);
}

- (void)books_showContent:(id)a3
{
  -[BKBookViewController resume:](self, "resume:", a3);
}

- (void)books_search:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController _searchQueryFromSender:](self, "_searchQueryFromSender:", v4));
  -[BKBookViewController showSearchWithString:sender:](self, "showSearchWithString:sender:", v5, v4);

}

- (void)books_find:(id)a3
{
  -[BKBookViewController showSearch:](self, "showSearch:", a3);
}

- (void)books_findNext:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController nextSearchResult](self, "nextSearchResult", a3));
  -[BKBookViewController revealSearchResult:animated:](self, "revealSearchResult:animated:", v4, 1);

}

- (void)books_findPrevious:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController previousSearchResult](self, "previousSearchResult", a3));
  -[BKBookViewController revealSearchResult:animated:](self, "revealSearchResult:animated:", v4, 1);

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)resetKeyWindow
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController view](self, "view"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  objc_msgSend(v2, "makeKeyAndVisible");

}

- (BOOL)canShowContent
{
  BOOL v3;
  void *v4;

  if (-[BKBookViewController section](self, "section"))
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKViewController currentOverlayViewController](self, "currentOverlayViewController"));
  v3 = v4 != 0;

  return v3;
}

- (BOOL)canGoToNextPage
{
  return 1;
}

- (BOOL)canGoToPreviousPage
{
  return 1;
}

- (BOOL)canNavigateByChapter
{
  return 1;
}

- (BOOL)canSearch
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController searchButtonItem](self, "searchButtonItem"));
  v4 = v3;
  v5 = (!v3 || objc_msgSend(v3, "isEnabled")) && -[BKBookViewController section](self, "section") == 0;

  return v5;
}

- (id)_contentControllerThatHasCopyableSelection
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentViewControllers](self, "contentViewControllers", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v6)
        objc_enumerationMutation(v3);
      v8 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v7);
      objc_opt_class(BKHTMLContentViewController);
      v10 = BUDynamicCast(v9, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      if (objc_msgSend(v11, "canCopyContent"))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "selectedText"));
        v13 = objc_msgSend(v12, "length");

        if (v13)
          break;
      }

      if (v5 == (id)++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v11 = 0;
  }

  return v11;
}

- (BOOL)canCopy
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController _contentControllerThatHasCopyableSelection](self, "_contentControllerThatHasCopyableSelection"));
  v3 = v2 != 0;

  return v3;
}

- (void)copy:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController _contentControllerThatHasCopyableSelection](self, "_contentControllerThatHasCopyableSelection", a3));
  objc_msgSend(v3, "copyContent");

}

- (id)keyCommands
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSString *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)BKBookViewController;
  v3 = -[BKBookViewController keyCommands](&v23, "keyCommands");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8 = v7;

  v9 = AEBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Next Page"), &stru_1C3088, 0));
  if (-[BKBookViewController isPageProgressionRTL](self, "isPageProgressionRTL"))
    v12 = UIKeyInputLeftArrow;
  else
    v12 = UIKeyInputRightArrow;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v11, 0, "books_pageForward:", v12, 0, 0));

  objc_msgSend(v13, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(v13, "setAllowsAutomaticMirroring:", 0);
  objc_msgSend(v8, "addObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR(" "), 0, "books_pageForward:"));
  objc_msgSend(v14, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(v14, "setAttributes:", (unint64_t)objc_msgSend(v14, "attributes") | 4);
  objc_msgSend(v8, "addObject:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", UIKeyInputPageDown, 0, "books_pageForward:"));
  objc_msgSend(v15, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(v15, "setAttributes:", (unint64_t)objc_msgSend(v15, "attributes") | 4);
  objc_msgSend(v8, "addObject:", v15);

  v16 = AEBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Previous Page"), &stru_1C3088, 0));
  if (-[BKBookViewController isPageProgressionRTL](self, "isPageProgressionRTL"))
    v19 = UIKeyInputRightArrow;
  else
    v19 = UIKeyInputLeftArrow;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v18, 0, "books_pageBackward:", v19, 0, 0));

  objc_msgSend(v20, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(v20, "setAllowsAutomaticMirroring:", 0);
  objc_msgSend(v8, "addObject:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", UIKeyInputPageUp, 0, "books_pageBackward:"));
  objc_msgSend(v21, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(v21, "setAttributes:", (unint64_t)objc_msgSend(v21, "attributes") | 4);
  objc_msgSend(v8, "addObject:", v21);

  return v8;
}

- (void)validateCommand:(id)a3
{
  id v4;
  const char *v5;
  unsigned __int8 v6;
  id v7;
  void *v8;
  const __CFString *v9;
  id v10;
  void *v11;
  unsigned int v12;
  id v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BKBookViewController;
  -[BKBookViewController validateCommand:](&v14, "validateCommand:", v4);
  v5 = (const char *)objc_msgSend(v4, "action");
  v6 = -[BKBookViewController isPageProgressionRTL](self, "isPageProgressionRTL");
  if (sel_isEqual(v5, "books_chapterLeft:"))
  {
    v7 = AEBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if ((v6 & 1) != 0)
    {
LABEL_3:
      v9 = CFSTR("Next Chapter");
      goto LABEL_7;
    }
LABEL_6:
    v9 = CFSTR("Previous Chapter");
    goto LABEL_7;
  }
  if (sel_isEqual(v5, "books_chapterRight:"))
  {
    v10 = AEBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((v6 & 1) == 0)
      goto LABEL_3;
    goto LABEL_6;
  }
  if (!sel_isEqual(v5, "books_toggleBookmark:"))
    goto LABEL_8;
  v12 = -[BKBookViewController isPageBookmarked](self, "isPageBookmarked");
  v13 = AEBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if (v12)
    v9 = CFSTR("Remove Bookmark");
  else
    v9 = CFSTR("Bookmark Page");
LABEL_7:
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v9, &stru_1C3088, 0));
  objc_msgSend(v4, "setTitle:", v11);

LABEL_8:
}

- (void)books_chapterStart:(id)a3
{
  -[BKBookViewController recordedTurnToBeginningOfChapter](self, "recordedTurnToBeginningOfChapter", a3);
}

- (void)books_chapterEnd:(id)a3
{
  -[BKBookViewController recordedTurnToEndOfChapter](self, "recordedTurnToEndOfChapter", a3);
}

- (void)books_chapterForward:(id)a3
{
  -[BKBookViewController recordedTurnToNextChapter](self, "recordedTurnToNextChapter", a3);
}

- (void)books_chapterBackward:(id)a3
{
  -[BKBookViewController recordedTurnToPreviousChapter](self, "recordedTurnToPreviousChapter", a3);
}

- (void)books_toggleBookmark:(id)a3
{
  -[BKBookViewController toggleBookmark:](self, "toggleBookmark:", self);
}

- (void)books_chapterLeft:(id)a3
{
  id v4;

  v4 = a3;
  if (-[BKBookViewController isPageProgressionRTL](self, "isPageProgressionRTL"))
    -[BKBookViewController books_chapterForward:](self, "books_chapterForward:", v4);
  else
    -[BKBookViewController books_chapterBackward:](self, "books_chapterBackward:", v4);

}

- (void)books_chapterRight:(id)a3
{
  id v4;

  v4 = a3;
  if (-[BKBookViewController isPageProgressionRTL](self, "isPageProgressionRTL"))
    -[BKBookViewController books_chapterBackward:](self, "books_chapterBackward:", v4);
  else
    -[BKBookViewController books_chapterForward:](self, "books_chapterForward:", v4);

}

- (BOOL)shouldSavePageControlVisibility
{
  return 1;
}

- (void)savePageControlVisibility
{
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));

  if (v4)
  {
    if (-[BKBookViewController shouldSavePageControlVisibility](self, "shouldSavePageControlVisibility"))
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v5 = -[BKBookViewController controlsVisible](self, "controlsVisible");
      objc_msgSend(v6, "setBool:forKey:", v5 ^ 1, BKBookHidePageControls[0]);

    }
  }
}

- (void)cancelPendingSavePageControlVisibility
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController performSelectorProxy](self, "performSelectorProxy"));
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", v2, "savePageControlVisibility", 0);

}

- (double)savePageControlVisibilityDelay
{
  return 10.0;
}

- (void)delayedSavePageControlVisibility
{
  id v3;

  -[BKBookViewController cancelPendingSavePageControlVisibility](self, "cancelPendingSavePageControlVisibility");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController performSelectorProxy](self, "performSelectorProxy"));
  -[BKBookViewController savePageControlVisibilityDelay](self, "savePageControlVisibilityDelay");
  objc_msgSend(v3, "performSelector:withObject:afterDelay:", "savePageControlVisibility", 0);

}

- (void)clearSearchResult
{
  void *v3;
  id v4;

  -[BKBookViewController setSearchResult:](self, "setSearchResult:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentViewControllers](self, "contentViewControllers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allValues"));
  objc_msgSend(v3, "makeObjectsPerformSelector:withObject:", "clearSearchLocation", 0);

}

- (void)clearSelection
{
  void *v3;
  id v4;

  -[BKBookViewController setSearchResult:](self, "setSearchResult:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentViewControllers](self, "contentViewControllers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allValues"));
  objc_msgSend(v3, "makeObjectsPerformSelector:withObject:", "clearSelection", 0);

}

- (void)clearSelectedAnnotation
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentViewControllers](self, "contentViewControllers"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allValues"));
  objc_msgSend(v2, "makeObjectsPerformSelector:", "clearSelectedAnnotation");

}

- (void)clearCurrentHighlighting
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentViewControllers](self, "contentViewControllers"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allValues"));
  objc_msgSend(v2, "makeObjectsPerformSelector:", "clearCurrentHighlighting");

}

- (BOOL)hasTextSelected
{
  return 0;
}

- (BOOL)hasHighlightedText
{
  return 0;
}

- (void)forceReload
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController currentLocation](self, "currentLocation"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentViewControllers](self, "contentViewControllers", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allValues"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9);
        objc_opt_class(BKHTMLContentViewController);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
        {
          v12 = v10;
          if (objc_msgSend(v12, "isContentLoaded"))
            objc_msgSend(v12, "reload");

        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[BKPaginationController releasePaginationInfo](self->_paginationController, "releasePaginationInfo");
  -[BKBookViewController setPageCountIncludingUpsell:](self, "setPageCountIncludingUpsell:", 0x7FFFFFFFFFFFFFFFLL);
  -[BKBookViewController paginationUpdateRequired](self, "paginationUpdateRequired");
  -[BKBookViewController jumpToLocation:animated:completion:](self, "jumpToLocation:animated:completion:", v3, 0, 0);

}

- (void)forceRepagination
{
  -[BKPaginationController releasePaginationInfo](self->_paginationController, "releasePaginationInfo");
  -[BKBookViewController setPageCountIncludingUpsell:](self, "setPageCountIncludingUpsell:", 0x7FFFFFFFFFFFFFFFLL);
  -[BKBookViewController paginationUpdateRequired](self, "paginationUpdateRequired");
}

- (void)paginationUpdateRequired
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController navigationHistory](self, "navigationHistory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
  objc_msgSend(v4, "setNavigationHistory:", v3);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
  objc_msgSend(v5, "repaginateWithStyle:geometry:", 0, 0);

}

- (id)titleForChapterAtPageNumber:(int64_t)a3
{
  void *v3;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;

  v3 = 0;
  if (a3 && a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
    v7 = objc_msgSend(v6, "pageTotal");

    if ((uint64_t)v7 >= a3)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "titleForChapterAtPageNumber:", a3));
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sampleContent"));
      v10 = objc_msgSend(v9, "BOOLValue");

      v11 = AEBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = v12;
      if (v10)
        v14 = CFSTR("Buy Book");
      else
        v14 = CFSTR("End of Book");
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_1C3088, 0));
    }
    v3 = (void *)v15;

  }
  return v3;
}

- (id)getViewSnapshot
{
  return 0;
}

- (void)managedObjectContextDidSave:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  NSManagedObjectContext *v7;
  BOOL v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  _QWORD block[4];
  _QWORD *v13;
  _QWORD v14[4];
  NSManagedObjectContext *v15;
  id v16;

  v4 = a3;
  v5 = (NSManagedObjectContext *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v6 = self->_bookMoc;
  v7 = v6;
  if (v6)
    v8 = v6 == v5;
  else
    v8 = 1;
  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSManagedObjectContext persistentStoreCoordinator](v6, "persistentStoreCoordinator"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSManagedObjectContext persistentStoreCoordinator](v5, "persistentStoreCoordinator"));

    if (v9 == v10)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_4E528;
      v14[3] = &unk_1BFDB8;
      v15 = v7;
      v16 = v4;
      v11 = objc_retainBlock(v14);
      if (v11)
      {
        if (+[NSThread isMainThread](NSThread, "isMainThread"))
        {
          ((void (*)(_QWORD *))v11[2])(v11);
        }
        else
        {
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_4E534;
          block[3] = &unk_1BEC70;
          v13 = v11;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

        }
      }

    }
  }

}

- (id)searchButtonItem
{
  return 0;
}

- (id)nextSearchResult
{
  return -[BKBookViewController _searchResultOffsetByDistance:](self, "_searchResultOffsetByDistance:", 1);
}

- (id)previousSearchResult
{
  return -[BKBookViewController _searchResultOffsetByDistance:](self, "_searchResultOffsetByDistance:", -1);
}

- (id)_searchResultOffsetByDistance:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController searchResult](self, "searchResult"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController searchViewControllerIfLoaded](self, "searchViewControllerIfLoaded"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "results"));

  v9 = 0;
  if (v5 && v8)
  {
    v10 = objc_msgSend(v8, "indexOfObject:", v5);
    if (v10 == (id)0x7FFFFFFFFFFFFFFFLL
      || (v11 = (uint64_t)v10 + a3, v11 < 0)
      || v11 >= (unint64_t)objc_msgSend(v8, "count"))
    {
      v9 = 0;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v11));
    }
  }

  return v9;
}

- (int64_t)currentPageNumber
{
  int64_t result;
  uint64_t v3;

  result = (int64_t)-[BKBookViewController currentPages](self, "currentPages");
  if (result != 0x7FFFFFFFFFFFFFFFLL)
    return v3 + result - 1;
  return result;
}

- (id)documentForLocation:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_opt_class(BKAnchorPathLocation);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "documentAtPath:", v8));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "documentWithOrdinal:", objc_msgSend(v4, "ordinal")));
  }

  return v9;
}

- (_NSRange)currentPages
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = 0;
  v3 = 0;
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)turnToPageNumber:(int64_t)a3 animated:(BOOL)a4
{
  -[BKBookViewController dismissCurrentPopover](self, "dismissCurrentPopover", a3, a4);
  -[BKBookViewController didChangeLocationClosing:suspending:](self, "didChangeLocationClosing:suspending:", 0, 0);
}

- (void)recordJumpFromCurrentLocation
{
  -[BKBookViewController setUserNavigated:](self, "setUserNavigated:", 1);
}

- (void)jumpToLocation:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  void (**v5)(void);
  void (**v6)(void);

  v5 = (void (**)(void))objc_retainBlock(a5);
  if (v5)
  {
    v6 = v5;
    v5[2]();
    v5 = v6;
  }

}

- (void)recordedJumpToLocation:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  unsigned int v27;
  uint64_t v28;
  id v29;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v29 = v9;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController documentForLocation:](self, "documentForLocation:", v8));
    v11 = v10;
    if (v10)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "documentOrdinal"));
      if (objc_msgSend(v12, "integerValue") == (id)-1)
      {
LABEL_6:

LABEL_7:
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "urlForDocument:", v11));

        objc_opt_class(BKAnchorLocation);
        if ((objc_opt_isKindOfClass(v8, v16) & 1) != 0)
        {
          v17 = v8;
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "anchor"));

          if (v18)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "anchor"));
            v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "URLByAppendingPathComponent:", v19));

            v15 = (void *)v20;
          }

        }
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[BKExpandedContentResource resourceForURL:](BKExpandedContentResource, "resourceForURL:", v15));
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "cacheItem"));
        objc_msgSend(v21, "setCacheItem:", v23);

        -[BKBookViewController showExpandedContentForResource:atLocation:completion:](self, "showExpandedContentForResource:atLocation:completion:", v21, v8, v29);
LABEL_19:

        goto LABEL_20;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nonlinearElement"));
      if (objc_msgSend(v13, "BOOLValue"))
      {

        goto LABEL_6;
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "documentOrdinal"));

      if (!v25)
        goto LABEL_7;
    }
    if (self->_isReading)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController currentLocation](self, "currentLocation"));
      v27 = objc_msgSend(v8, "isEqual:", v26);

      if (v27)
        -[BKBookViewController startReadAloud](self, "startReadAloud");
    }
    v28 = objc_claimAutoreleasedReturnValue(-[BKBookViewController _normalizedLocation:](self, "_normalizedLocation:", v8));

    -[BKBookViewController recordJumpFromCurrentLocation](self, "recordJumpFromCurrentLocation");
    -[BKBookViewController jumpToLocation:animated:completion:](self, "jumpToLocation:animated:completion:", v28, v6, v29);
    v8 = (id)v28;
    goto LABEL_19;
  }
  v24 = objc_retainBlock(v9);
  v8 = v24;
  if (v24)
    (*((void (**)(id))v24 + 2))(v24);
LABEL_20:

}

- (id)locationForPath:(id)a3 fragment:(id)a4
{
  id v6;
  id v7;
  BKAnchorLocation *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (v7
    && +[BKNavigationInfo isExcludedFromSampleHash:](BKNavigationInfo, "isExcludedFromSampleHash:", v7))
  {
    v8 = -[BKLocation initWithOrdinal:]([BKLocation alloc], "initWithOrdinal:", -[BKBookViewController upsellOrdinal](self, "upsellOrdinal"));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "documentsWithPath:sortBy:limit:", v6, CFSTR("documentOrdinal"), 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastObject"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "documentOrdinal"));
    v13 = objc_msgSend(v12, "integerValue");

    v8 = -[BKAnchorLocation initWithOrdinal:andAnchor:]([BKAnchorLocation alloc], "initWithOrdinal:andAnchor:", v13, v7);
  }

  return v8;
}

- (id)_normalizedLocation:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  char *v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  NSObject *v29;
  char *v30;
  void *v31;
  void *v32;
  void *v33;
  char *v34;
  id v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  const char *v39;
  NSObject *v40;
  uint32_t v41;
  char *v43;
  void *v44;
  char *v45;
  id v46;
  NSObject *v47;
  void *v48;
  void *v49;
  id v50;
  char *v51;
  id v52;
  uint8_t buf[4];
  id v54;
  __int16 v55;
  id v56;

  v4 = a3;
  objc_opt_class(BKAnchorPathLocation);
  v6 = BUDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v4;
  if (v7)
  {
    v9 = _AECaptureLocationLog();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v54 = v4;
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
    v12 = objc_msgSend(v11, "length");

    if (v12)
    {
      v13 = _AECaptureLocationLog();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Had path - using locationForPath:fragment:", buf, 2u);
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
      v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "anchor"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController locationForPath:fragment:](self, "locationForPath:fragment:", v15, v16));
      v17 = v4;
      goto LABEL_27;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "anchor"));
    v18 = _AECaptureLocationLog();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v54 = v15;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "We had no path - Attempting to parse the anchor: %{public}@", buf, 0xCu);
    }

    v52 = 0;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("(\\d+)"), 1, &v52));
    v16 = v52;
    if (v16 || !v15)
    {
      v35 = _AECaptureLocationLog();
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v54 = v15;
        v55 = 2114;
        v56 = v16;
        _os_log_impl(&dword_0, v36, OS_LOG_TYPE_ERROR, "Failed to create regular expression to get page number from %{public}@ - %{public}@", buf, 0x16u);
      }

    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstMatchInString:options:range:", v15, 2, 0, objc_msgSend(v15, "length")));
      v21 = objc_msgSend(v20, "range");
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "substringWithRange:", v21, v22));
      v24 = (char *)objc_msgSend(v23, "integerValue");
      v25 = _AECaptureLocationLog();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v51 = v24;
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v24));
        *(_DWORD *)buf = 138543618;
        v54 = v23;
        v55 = 2114;
        v56 = v27;
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "Parsing page - Captured substring: %{public}@ and got value: %{public}@", buf, 0x16u);

        v24 = v51;
      }

      if (v24 != (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        if (objc_msgSend(v15, "containsString:", CFSTR("page(")))
        {
          v28 = _AECaptureLocationLog();
          v29 = objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            v30 = v24;
            v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v24));
            *(_DWORD *)buf = 138543362;
            v54 = v31;
            _os_log_impl(&dword_0, v29, OS_LOG_TYPE_DEFAULT, "Parsing page - %{public}@", buf, 0xCu);

            v24 = v30;
          }

          v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
          v33 = v32;
          v34 = v24;
          goto LABEL_26;
        }
        if (objc_msgSend(v15, "containsString:", CFSTR("chapter(")))
        {
          v43 = v24;
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
          v45 = (char *)objc_msgSend(v44, "pageRangeForChapterAtIndex:", v43 - 1);

          v46 = _AECaptureLocationLog();
          v47 = objc_claimAutoreleasedReturnValue(v46);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v43));
            v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v45));
            *(_DWORD *)buf = 138543618;
            v54 = v48;
            v55 = 2114;
            v56 = v49;
            _os_log_impl(&dword_0, v47, OS_LOG_TYPE_DEFAULT, "Parsing chapter - Captured chapterNumber: %{public}@ and got startPage: %{public}@", buf, 0x16u);

          }
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
          v33 = v32;
          v34 = v45;
          goto LABEL_26;
        }
        v50 = _AECaptureLocationLog();
        v38 = objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v54 = v15;
          v40 = v38;
          v41 = 12;
          goto LABEL_24;
        }
        goto LABEL_25;
      }
    }
    v37 = _AECaptureLocationLog();
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v54 = v17;
      v55 = 2114;
      v56 = v15;
      v40 = v38;
      v41 = 22;
LABEL_24:
      _os_log_impl(&dword_0, v40, OS_LOG_TYPE_ERROR, v39, buf, v41);
    }
LABEL_25:

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
    v33 = v32;
    v34 = 0;
LABEL_26:
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "pageLocationForPageNumber:", v34, v51));

LABEL_27:
  }

  return v8;
}

- (void)goToPath:(id)a3 fragment:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;

  v5 = a5;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController locationForPath:fragment:](self, "locationForPath:fragment:", a3, a4));
  -[BKBookViewController recordedJumpToLocation:animated:completion:](self, "recordedJumpToLocation:animated:completion:", v7, v5, 0);

}

- (void)jumpBackAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController navigationHistory](self, "navigationHistory"));
  v6 = objc_msgSend(v5, "isAtTopOfStack");

  if (v6)
    -[BKBookViewController recordJumpFromCurrentLocation](self, "recordJumpFromCurrentLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController navigationHistory](self, "navigationHistory"));
  objc_msgSend(v7, "rewind");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController navigationHistory](self, "navigationHistory"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentEntity"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "location"));
  -[BKBookViewController jumpToLocation:animated:completion:](self, "jumpToLocation:animated:completion:", v9, v3, 0);

}

- (void)jumpAheadAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController navigationHistory](self, "navigationHistory"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nextEntity"));

  v6 = v12;
  if (v12)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController navigationHistory](self, "navigationHistory"));
    objc_msgSend(v7, "skip");

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController navigationHistory](self, "navigationHistory"));
    v9 = objc_msgSend(v8, "isAtTopOfStack");

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController navigationHistory](self, "navigationHistory"));
      objc_msgSend(v10, "truncateHistory");

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "location"));
    -[BKBookViewController jumpToLocation:animated:completion:](self, "jumpToLocation:animated:completion:", v11, v3, 0);

    v6 = v12;
  }

}

- (BOOL)_currentChapterInfo:(id *)a3 uniqueID:(id *)a4
{
  id v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v20;
  void *v21;

  v7 = -[BKBookViewController currentPages](self, "currentPages");
  v9 = -[BKBookViewController pageNumberFromRange:](self, "pageNumberFromRange:", v7, v8);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
  v12 = objc_msgSend(v11, "numberOfChapters");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
  v14 = v13;
  if (!v12)
  {
    v18 = objc_msgSend(v13, "pageTotal");

    if (v18 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
      *a4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "hrefForPageNumber:", v10));

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "physicalPageTitlesForPageNumber:", v10));
      *a3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "firstObject"));

      goto LABEL_8;
    }
    return 0;
  }
  v15 = objc_msgSend(v13, "chapterIndexForPageNumber:", v10);

  if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
  *a4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "hrefForChapterAtPageNumber:", v10));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
  *a3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "titleForChapterAtPageNumber:", v10));
LABEL_8:

  return 1;
}

- (void)updateProgressKitForNewLocation
{
  unsigned int v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v12 = 0;
  v13 = 0;
  v3 = -[BKBookViewController _currentChapterInfo:uniqueID:](self, "_currentChapterInfo:uniqueID:", &v13, &v12);
  v4 = v13;
  v5 = v12;
  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BCProgressKitController sharedController](BCProgressKitController, "sharedController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetID"));
    objc_msgSend(v6, "activateChapterForBook:chapterID:title:completion:", v8, v5, v4, 0);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BCProgressKitController sharedController](BCProgressKitController, "sharedController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "assetID"));
  objc_msgSend(v9, "updateBookProgress:completion:", v11, 0);

}

- (void)writeAnnotationsToWebProcessPlugin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  int *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController visiblePageBookmarks](self, "visiblePageBookmarks"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController visiblePageHighlights](self, "visiblePageHighlights"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation dictionaryRepresentationsForAnnotations:](AEAnnotation, "dictionaryRepresentationsForAnnotations:", v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentViewControllers](self, "contentViewControllers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allValues"));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v8)
  {
    v9 = v8;
    v27 = v4;
    v28 = v3;
    v10 = 0;
    v11 = *(_QWORD *)v38;
    v12 = &OBJC_IVAR___BKThumbnailBookViewController__pageDirectory;
    v29 = v7;
    v30 = *(_QWORD *)v38;
    do
    {
      v13 = 0;
      v32 = v9;
      do
      {
        if (*(_QWORD *)v38 != v11)
          objc_enumerationMutation(v7);
        v14 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v13);
        objc_opt_class(v12 + 288);
        if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
        {
          v16 = v10;
          v17 = v12;
          objc_opt_class(v12 + 288);
          v19 = BUDynamicCast(v18, v14);
          v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v21 = v31;
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v34;
            do
            {
              for (i = 0; i != v23; i = (char *)i + 1)
              {
                if (*(_QWORD *)v34 != v24)
                  objc_enumerationMutation(v21);
                v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForMatchingAnnotation:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i), v27));
                if (v26)
                  objc_msgSend(v5, "addObject:", v26);

              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
            }
            while (v23);
          }

          v10 = v20;
          v7 = v29;
          v11 = v30;
          v12 = v17;
          v9 = v32;
        }
        v13 = (char *)v13 + 1;
      }
      while (v13 != v9);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v9);

    if (!v10)
    {
      v4 = v27;
      v3 = v28;
      goto LABEL_24;
    }
    v3 = v28;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation dictionaryRepresentationsForAnnotations:](AEAnnotation, "dictionaryRepresentationsForAnnotations:", v28));
    objc_msgSend(v10, "writeAnnotationsToWebProcessPlugin:andHighlights:", v7, v5);
    v4 = v27;
  }
  else
  {
    v10 = 0;
  }

LABEL_24:
}

- (void)writeControlVisibilityStateToWebProcessPlugin
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentViewControllers](self, "contentViewControllers", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allValues"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_opt_class(BKHTMLContentViewController);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
        {
          objc_opt_class(BKHTMLContentViewController);
          v12 = BUDynamicCast(v11, v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
          objc_msgSend(v13, "writeControlVisibilityStateToWebProcessPlugin:", self->_controlsVisible);

          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)didChangeLocationClosing:(BOOL)a3 suspending:(BOOL)a4
{
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  float v19;
  float v20;
  float v21;
  float v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;

  if (!a3)
    -[BKBookViewController setUserNavigated:](self, "setUserNavigated:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sampleContent"));
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((v8 & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController readingLocationHighwaterMark](self, "readingLocationHighwaterMark"));

    if (!v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController annotationProvider](self, "annotationProvider"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uiManagedObjectContext"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "readingLocationAnnotation:moc:", 0, v12));
      objc_msgSend(v13, "readingProgressHighWaterMark");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[BKBookViewController setReadingLocationHighwaterMark:](self, "setReadingLocationHighwaterMark:", v14);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController readingProgress](self, "readingProgress"));
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));
      v25 = BCAssetReadingProgressKey;
      v26 = v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
      objc_msgSend(v16, "assetViewController:assetPropertyChanged:", self, v17);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController readingLocationHighwaterMark](self, "readingLocationHighwaterMark"));
      objc_msgSend(v18, "floatValue");
      v20 = v19;
      v21 = kAEAnnotationReadingLocationSignificantHighwaterMark;

      if (v20 < v21)
      {
        -[BKBookViewController setReadingLocationHighwaterMark:](self, "setReadingLocationHighwaterMark:", v15);
        objc_msgSend(v15, "floatValue");
        if (v22 > v21)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));
          objc_msgSend(v23, "assetViewControllerSignificantReadingLocationChange:", self);

        }
      }
    }
    if (!a4)
      -[BKBookViewController updateProgressKitForNewLocation](self, "updateProgressKitForNewLocation");
    -[BKBookViewController readingLocationChanged](self, "readingLocationChanged");

  }
  -[BKBookViewController updateTouchBarController](self, "updateTouchBarController");
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController displaySleepController](self, "displaySleepController"));
  objc_msgSend(v24, "userInteractionOccurred");

}

- (void)setLocation:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;

  v5 = a3;
  objc_storeStrong((id *)&self->_location, a3);
  v6 = _AEBookPluginsLifeCycleLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_opt_class(self);
    v9 = v8;
    v10 = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "assetLogID"));
    v13 = 138543874;
    v14 = v9;
    v15 = 2114;
    v16 = v5;
    v17 = 2114;
    v18 = v12;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "SetLocation BVC:%{public}@.  Location:%{public}@ logID:%{public}@ ", (uint8_t *)&v13, 0x20u);

  }
}

- (id)currentLocation
{
  return 0;
}

- (id)currentPageLocation
{
  return 0;
}

- (id)pageLocationForPageNumber:(int64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pageLocationForPageNumber:", a3));

  return v5;
}

- (int64_t)pageNumberFromRange:(_NSRange)a3
{
  return a3.location;
}

- (BKLocation)resumeLocation
{
  BKLocation *resumeLocation;

  resumeLocation = self->_resumeLocation;
  if (resumeLocation)
    return resumeLocation;
  else
    return (BKLocation *)(id)objc_claimAutoreleasedReturnValue(-[BKBookViewController currentLocation](self, "currentLocation"));
}

- (BOOL)shouldSyncLocation:(id)a3
{
  return 1;
}

- (void)saveReadingLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void **v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
      if (objc_msgSend(v6, "isDeleted"))
      {

      }
      else
      {
        v7 = -[BKBookViewController userNavigated](self, "userNavigated");

        if (v7)
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
          v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "readingLocation"));

          v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController reportedLocation](self, "reportedLocation"));
          if (!v10
            || (v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController reportedLocation](self, "reportedLocation")),
                v12 = objc_msgSend(v4, "isEqual:", v11),
                v11,
                v10,
                (v12 & 1) == 0))
          {
            -[BKBookViewController setReportedLocation:](self, "setReportedLocation:", v4);
            v13 = v4;

            v14 = _AEBookPluginsLifeCycleLog();
            v15 = objc_claimAutoreleasedReturnValue(v14);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "databaseKey"));
              v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "assetLogID"));
              *(_DWORD *)buf = 138543874;
              v28 = v13;
              v29 = 2112;
              v30 = v17;
              v31 = 2114;
              v32 = v19;
              _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Saving location into global annotation:%{public}@ assetID:%@ logID:%{public}@", buf, 0x20u);

            }
            objc_initWeak((id *)buf, self);
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
            v21 = _NSConcreteStackBlock;
            v22 = 3221225472;
            v23 = sub_5002C;
            v24 = &unk_1BFE30;
            objc_copyWeak(&v26, (id *)buf);
            v9 = v13;
            v25 = v9;
            objc_msgSend(v20, "setSingletonAnnotationType:location:modificationHandler:", 3, v9, &v21);

            objc_destroyWeak(&v26);
            objc_destroyWeak((id *)buf);
          }
          -[BKBookViewController setLocation:](self, "setLocation:", v9, v21, v22, v23, v24);

        }
      }
    }
  }

}

- (id)_currentReadingProgress
{
  uint64_t v3;
  _UNKNOWN **v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  double v8;

  v3 = -[BKBookViewController pageCountIncludingUpsell](self, "pageCountIncludingUpsell");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 0;
  }
  else
  {
    v5 = v3;
    if (v3 < 1)
    {
      v4 = &off_1CD6A8;
    }
    else
    {
      v7 = -[BKBookViewController currentPages](self, "currentPages");
      v4 = 0;
      if (v7 != (id)0x7FFFFFFFFFFFFFFFLL && v6)
      {
        *(float *)&v8 = (float)((uint64_t)v7 + v6 - 1) / (float)v5;
        v4 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v8));
      }
    }
  }
  return v4;
}

- (BOOL)isLocationOnCurrentPage:(id)a3
{
  return 0;
}

- (void)isLocationVisible:(id)a3 completion:(id)a4
{
  id v4;
  id v5;

  v4 = objc_retainBlock(a4);
  if (v4)
  {
    v5 = v4;
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
    v4 = v5;
  }

}

- (id)pageTitleForPageNumber:(int64_t)a3
{
  return 0;
}

- (BOOL)isPageBookmarked
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController visiblePageBookmarks](self, "visiblePageBookmarks"));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)shouldBookmarkButtonsBeEnabled
{
  return 1;
}

- (BOOL)bookCanBeBookmarked
{
  unsigned int v3;
  void *v4;
  void *v5;

  if ((isPad(self, a2) & 1) != 0)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sampleContent"));
    v3 = objc_msgSend(v5, "BOOLValue") ^ 1;

  }
  return v3;
}

- (id)_allAnnotationsForType:(int)a3
{
  NSMutableArray *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = objc_opt_new(NSMutableArray);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSFetchedResultsController fetchedObjects](self->_pageBookmarksFRC, "fetchedObjects", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "annotationType") == a3)
          -[NSMutableArray addObject:](v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_visibleAnnotationsForType:(int)a3
{
  NSMutableArray *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v5 = objc_opt_new(NSMutableArray);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSFetchedResultsController fetchedObjects](self->_pageBookmarksFRC, "fetchedObjects", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10);
        v12 = objc_autoreleasePoolPush();
        if (objc_msgSend(v11, "annotationType") == a3
          && -[BKBookViewController isAnnotationVisible:](self, "isAnnotationVisible:", v11))
        {
          -[NSMutableArray addObject:](v5, "addObject:", v11);
        }
        objc_autoreleasePoolPop(v12);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)visiblePageBookmarks
{
  return -[BKBookViewController _visibleAnnotationsForType:](self, "_visibleAnnotationsForType:", 1);
}

- (id)visiblePageHighlights
{
  return -[BKBookViewController _visibleAnnotationsForType:](self, "_visibleAnnotationsForType:", 2);
}

- (BOOL)isAnnotationVisible:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[BKBookViewController isAnnotationVisible:]"));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v4, 0));

  objc_exception_throw(v5);
}

- (void)bookmarkPage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v4 = objc_msgSend(objc_alloc((Class)BAViewData), "initWithType:action:location:", 2, 5, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentDataForSearchViewController:](self, "contentDataForSearchViewController:", 0));
  objc_msgSend(v5, "emitAnnotationActionEventWithTracker:contentData:viewData:", v6, v7, v4);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_506D4;
  v8[3] = &unk_1BEA38;
  v8[4] = self;
  -[BKViewController dismissCurrentPopoverWithCompletion:](self, "dismissCurrentPopoverWithCompletion:", v8);

}

- (void)unbookmarkPage:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_50928;
  v3[3] = &unk_1BEA38;
  v3[4] = self;
  -[BKViewController dismissCurrentPopoverWithCompletion:](self, "dismissCurrentPopoverWithCompletion:", v3);
}

- (void)toggleBookmark:(id)a3
{
  id v4;

  v4 = a3;
  if (-[BKBookViewController isPageBookmarked](self, "isPageBookmarked"))
    -[BKBookViewController unbookmarkPage:](self, "unbookmarkPage:", v4);
  else
    -[BKBookViewController bookmarkPage:](self, "bookmarkPage:", v4);

  -[BKBookViewController updateBookmarkButton:](self, "updateBookmarkButton:", 1);
}

- (void)updateBookmarkButton:(BOOL)a3
{
  -[BKBookViewController updateToolbarController](self, "updateToolbarController", a3);
  -[BKBookViewController updateTouchBarController](self, "updateTouchBarController");
}

- (id)bookmarksFetchRequestForBook:(id)a3 moc:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v21;
  _QWORD v22[3];

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)NSFetchRequest);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assetID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation pageBookmarksPredicate:](AEAnnotation, "pageBookmarksPredicate:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assetID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation predicateForGlobalAnnotationWithAssetID:](AEAnnotation, "predicateForGlobalAnnotationWithAssetID:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assetID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation highlightsPredicate:](AEAnnotation, "highlightsPredicate:", v12));

  v14 = objc_alloc((Class)NSCompoundPredicate);
  v22[0] = v9;
  v22[1] = v11;
  v22[2] = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 3));
  v16 = objc_msgSend(v14, "initWithType:subpredicates:", 2, v15);

  objc_msgSend(v7, "setPredicate:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", CFSTR("AEAnnotation"), v5));

  objc_msgSend(v7, "setEntity:", v17);
  v18 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("plLocationRangeStart"), 1);
  v21 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
  objc_msgSend(v7, "setSortDescriptors:", v19);

  return v7;
}

- (void)startFetchingBookmarks
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSFetchedResultsController *v7;
  NSFetchedResultsController *pageBookmarksFRC;
  NSFetchedResultsController *v9;
  unsigned __int8 v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  NSObject *v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  void *j;
  NSObject *v37;
  id v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  Class v56;
  uint64_t v57;
  id v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  id v82;
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  void *v86;
  __int16 v87;
  void *v88;
  _BYTE v89[128];
  _BYTE v90[128];

  if (!self->_pageBookmarksFRC)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "annotationProvider"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uiManagedObjectContext"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController bookmarksFetchRequestForBook:moc:](self, "bookmarksFetchRequestForBook:moc:", v3, v5));
    v7 = (NSFetchedResultsController *)objc_msgSend(objc_alloc((Class)IMUbiquitousFetchedResultsController), "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v6, v5, 0, 0);
    pageBookmarksFRC = self->_pageBookmarksFRC;
    self->_pageBookmarksFRC = v7;

    -[NSFetchedResultsController setDelegate:](self->_pageBookmarksFRC, "setDelegate:", self);
    v9 = self->_pageBookmarksFRC;
    v82 = 0;
    v10 = -[NSFetchedResultsController performFetch:](v9, "performFetch:", &v82);
    v11 = v82;
    v12 = v11;
    if ((v10 & 1) != 0)
    {
      v70 = v11;
      v71 = v6;
      v72 = v3;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "assetID"));
      v14 = objc_claimAutoreleasedReturnValue(+[AEAnnotation predicateForGlobalAnnotationWithAssetID:](AEAnnotation, "predicateForGlobalAnnotationWithAssetID:", v13));

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSFetchedResultsController fetchedObjects](self->_pageBookmarksFRC, "fetchedObjects"));
      v69 = (void *)v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "filteredArrayUsingPredicate:", v14));

      v80 = 0u;
      v81 = 0u;
      v78 = 0u;
      v79 = 0u;
      v17 = v16;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
      if (v18)
      {
        v19 = v18;
        v20 = 0;
        v21 = *(_QWORD *)v79;
        do
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(_QWORD *)v79 != v21)
              objc_enumerationMutation(v17);
            v23 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * (_QWORD)i);
            if (!v20)
              goto LABEL_10;
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * (_QWORD)i), "locationModificationDate"));
            objc_msgSend(v24, "timeIntervalSinceReferenceDate");
            v26 = v25;
            v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject locationModificationDate](v20, "locationModificationDate"));
            objc_msgSend(v27, "timeIntervalSinceReferenceDate");
            v29 = v28;

            if (v26 > v29)
            {
LABEL_10:
              v30 = v23;

              v20 = v30;
            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
        }
        while (v19);
      }
      else
      {
        v20 = 0;
      }

      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      v32 = v17;
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v74, v89, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v75;
        do
        {
          for (j = 0; j != v34; j = (char *)j + 1)
          {
            if (*(_QWORD *)v75 != v35)
              objc_enumerationMutation(v32);
            if (v20)
            {
              v37 = *(NSObject **)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)j);
              if (v37 != v20)
                -[NSObject setAnnotationDeleted:](v37, "setAnnotationDeleted:", 1);
            }
          }
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v74, v89, 16);
        }
        while (v34);
      }

      if (objc_msgSend(v5, "hasChanges"))
      {
        v73 = 0;
        objc_msgSend(v5, "save:", &v73);
        v38 = v73;
        if (v38)
        {
          v39 = BKMobileCloudSyncAnnotationsLog();
          v40 = objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            sub_11C7D4();

        }
      }
      v41 = objc_claimAutoreleasedReturnValue(-[NSObject location](v20, "location"));
      if (v41
        && (v42 = (void *)v41,
            v43 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController openingLocation](self, "openingLocation")),
            v43,
            v42,
            !v43))
      {
        v58 = _AEBookPluginsLifeCycleLog();
        v59 = objc_claimAutoreleasedReturnValue(v58);
        v3 = v72;
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          v60 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject location](v20, "location"));
          v68 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "databaseKey"));
          v62 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
          v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "assetLogID"));
          *(_DWORD *)buf = 138543874;
          v84 = v60;
          v85 = 2112;
          v86 = v61;
          v87 = 2114;
          v88 = v63;
          _os_log_impl(&dword_0, v59, OS_LOG_TYPE_DEFAULT, "Restoring location from global annotation:%{public}@ for assetID:%@ logID:%{public}@", buf, 0x20u);

        }
        v64 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject location](v20, "location"));
        -[BKBookViewController setLocation:](self, "setLocation:", v64);

        v65 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController location](self, "location"));
        -[BKBookViewController setReportedLocation:](self, "setReportedLocation:", v65);

        -[BKBookViewController setUserNavigated:](self, "setUserNavigated:", 0);
      }
      else
      {
        v3 = v72;
        if (!v20)
        {
          v44 = _AEBookPluginsLifeCycleLog();
          v45 = objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            v66 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "databaseKey"));
            v47 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
            v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "assetLogID"));
            *(_DWORD *)buf = 138412546;
            v84 = v46;
            v85 = 2114;
            v86 = v48;
            _os_log_impl(&dword_0, v45, OS_LOG_TYPE_DEFAULT, "%@ logID:%{public}@ No global annotation to restore from", buf, 0x16u);

          }
        }
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController openingLocation](self, "openingLocation"));

        if (v49)
        {
          v50 = _AEBookPluginsLifeCycleLog();
          v51 = objc_claimAutoreleasedReturnValue(v50);
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            v67 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "databaseKey"));
            v53 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
            v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "assetLogID"));
            v55 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController openingLocation](self, "openingLocation"));
            *(_DWORD *)buf = 138412802;
            v84 = v52;
            v85 = 2114;
            v86 = v54;
            v87 = 2112;
            v88 = v55;
            _os_log_impl(&dword_0, v51, OS_LOG_TYPE_DEFAULT, "%@ logID:%{public}@ Have existing openingLocation: %@", buf, 0x20u);

          }
        }
        else
        {
          v56 = NSClassFromString(CFSTR("BKPictureBookViewController"));
          objc_opt_class(v56);
          if ((objc_opt_isKindOfClass(self, v57) & 1) != 0)
            -[BKBookViewController setLocation:](self, "setLocation:", 0);
        }
      }

      v12 = v70;
      v6 = v71;
    }
    else
    {
      v31 = BKMobileCloudSyncAnnotationsLog();
      v20 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_11C834();
    }

  }
}

- (void)stopFetchingBookmarks
{
  NSFetchedResultsController *pageBookmarksFRC;

  -[NSFetchedResultsController setDelegate:](self->_pageBookmarksFRC, "setDelegate:", 0);
  pageBookmarksFRC = self->_pageBookmarksFRC;
  self->_pageBookmarksFRC = 0;

}

- (void)controllerWillChangeContent:(id)a3
{
  -[BKBookViewController setAnnotationChangeRequiresPaginationUpdate:](self, "setAnnotationChangeRequiresPaginationUpdate:", 0);
}

- (BOOL)shouldAcceptLocationUpdateFromGlobalAnnotation:(id)a3
{
  return 1;
}

- (void)_updateLocationFromAnnotation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  uint64_t v19;
  _BOOL4 v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;

  v4 = a3;
  if (!-[BKBookViewController section](self, "section"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController openingLocation](self, "openingLocation"));

    if (v5)
    {
      v6 = BKMobileCloudSyncAnnotationsLog();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "annotationLocation"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController openingLocation](self, "openingLocation"));
        v27 = 138412546;
        v28 = v8;
        v29 = 2112;
        v30 = v9;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Ignoring updated global location %@ because we have an openingLocation location: %@", (uint8_t *)&v27, 0x16u);

      }
      goto LABEL_21;
    }
    if (-[BKBookViewController shouldAcceptLocationUpdateFromGlobalAnnotation:](self, "shouldAcceptLocationUpdateFromGlobalAnnotation:", v4))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController savableLocation](self, "savableLocation"));
      v11 = objc_msgSend(v4, "isLocationSame:", v10);

      if ((v11 & 1) != 0)
      {
        v12 = BKMobileCloudSyncAnnotationsLog();
        v7 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "annotationLocation"));
          v27 = 138543362;
          v28 = v13;
          v14 = "_updateLocationFromAnnotation Ignoring updated location because it is the same as the current savable lo"
                "cation %{public}@";
LABEL_14:
          _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v27, 0xCu);
          goto LABEL_15;
        }
      }
      else
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "location"));
        v18 = -[BKBookViewController isLocationOnCurrentPage:](self, "isLocationOnCurrentPage:", v17);

        v19 = BKMobileCloudSyncAnnotationsLog();
        v7 = objc_claimAutoreleasedReturnValue(v19);
        v20 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
        if ((v18 & 1) == 0)
        {
          if (v20)
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "annotationLocation"));
            v27 = 138543362;
            v28 = v21;
            _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "_updateLocationFromAnnotation Jumping to location from annotation location: %{public}@", (uint8_t *)&v27, 0xCu);

          }
          v22 = _AEBookPluginsLifeCycleLog();
          v23 = objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "assetLogID"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "annotationLocation"));
            v27 = 138543618;
            v28 = v25;
            v29 = 2114;
            v30 = v26;
            _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "_updateLocationFromAnnotation logID:%{public}@ Jumping to location from annotation location: %{public}@", (uint8_t *)&v27, 0x16u);

          }
          v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "location"));
          -[BKBookViewController recordedJumpToLocation:animated:completion:](self, "recordedJumpToLocation:animated:completion:", v7, 1, 0);
          goto LABEL_21;
        }
        if (v20)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "annotationLocation"));
          v27 = 138543362;
          v28 = v13;
          v14 = "_updateLocationFromAnnotation Ignoring updated location because it is already visible %{public}@";
          goto LABEL_14;
        }
      }
    }
    else
    {
      v15 = BKMobileCloudSyncAnnotationsLog();
      v7 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "annotationLocation"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController savableLocation](self, "savableLocation"));
        v27 = 138412546;
        v28 = v16;
        v29 = 2112;
        v30 = v13;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Ignoring updated global location %@ because we have a newer local location: %@", (uint8_t *)&v27, 0x16u);

LABEL_15:
      }
    }
LABEL_21:

  }
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  NSFetchedResultsController *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  unsigned int v17;
  void *v18;
  _QWORD v19[5];

  v12 = (NSFetchedResultsController *)a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (self->_pageBookmarksFRC == v12)
  {
    if (a6 == 1)
      -[BKBookViewController setAnnotationChangeRequiresPaginationUpdate:](self, "setAnnotationChangeRequiresPaginationUpdate:", 1);
    v16 = v13;
    v17 = objc_msgSend(v16, "annotationType");
    if (v17 == 1)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "location"));
      if (v18)
      {
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_518FC;
        v19[3] = &unk_1BEA88;
        v19[4] = self;
        -[BKBookViewController isLocationOnVisiblePages:completion:](self, "isLocationOnVisiblePages:completion:", v18, v19);
      }
      else
      {
        -[BKBookViewController updateBookmarkButton:](self, "updateBookmarkButton:", 1);
      }

    }
    else if (v17 == 3)
    {
      -[BKBookViewController _updateLocationFromAnnotation:](self, "_updateLocationFromAnnotation:", v16);
    }

  }
}

- (void)controllerDidChangeContent:(id)a3
{
  if (-[BKBookViewController annotationChangeRequiresPaginationUpdate](self, "annotationChangeRequiresPaginationUpdate", a3))
  {
    -[BKBookViewController setAnnotationChangeRequiresPaginationUpdate:](self, "setAnnotationChangeRequiresPaginationUpdate:", 0);
    -[BKBookViewController paginationUpdateRequired](self, "paginationUpdateRequired");
  }
  -[BKBookViewController writeAnnotationsToWebProcessPlugin](self, "writeAnnotationsToWebProcessPlugin");
  -[BKBookViewController _notifyBookmarkObservers](self, "_notifyBookmarkObservers");
}

- (void)scrubberTouchDown:(id)a3
{
  -[BKBookViewController cancelPendingHidePageControls](self, "cancelPendingHidePageControls", a3);
  -[BKBookViewController setPageNumberBeforeScrubbing:](self, "setPageNumberBeforeScrubbing:", -[BKBookViewController currentPageNumber](self, "currentPageNumber"));
}

- (void)scrub:(id)a3
{
  id v4;

  v4 = objc_msgSend(a3, "pageNumber");
  -[BKBookViewController turnToPageNumber:animated:](self, "turnToPageNumber:animated:", v4, 1);
  -[BKBookViewController emitScrubEventStartPosition:endPosition:totalLength:](self, "emitScrubEventStartPosition:endPosition:totalLength:", -[BKBookViewController pageNumberBeforeScrubbing](self, "pageNumberBeforeScrubbing"), v4, -[BKBookViewController pageCountIncludingUpsell](self, "pageCountIncludingUpsell"));
  -[BKBookViewController setPageNumberBeforeScrubbing:](self, "setPageNumberBeforeScrubbing:", 0x7FFFFFFFFFFFFFFFLL);
}

- (BOOL)touchBarWantsHistoryNav
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v3 = objc_msgSend(v2, "isFixedLayout") ^ 1;

  return v3;
}

- (BOOL)touchBarWantsScroller
{
  return 1;
}

- (BOOL)touchBarWantsSearch
{
  return 1;
}

- (BOOL)touchBarWantsReadAloud
{
  return (-[BKBookViewController readAloudState](self, "readAloudState") & 0x80000000) == 0
      || -[BKBookViewController trackState](self, "trackState") >= 0;
}

- (int64_t)pageNumberForTouchBarPosition:(double)a3
{
  uint64_t v5;
  int64_t result;
  double v7;
  double v8;

  v5 = -[BKBookViewController pageCountIncludingUpsell](self, "pageCountIncludingUpsell");
  result = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 && v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[BKBookViewController pagePositionForTouchBarPosition:](self, "pagePositionForTouchBarPosition:", a3);
    v8 = fmax(v7 * (double)(v5 - 1) + 1.0, 1.0);
    if (v8 >= (double)v5)
      return (uint64_t)(double)v5;
    return (uint64_t)v8;
  }
  return result;
}

- (double)touchBarPositionForPageNumber:(int64_t)a3
{
  int64_t v5;
  double result;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    return -1.0;
  v5 = -[BKBookViewController pageCountIncludingUpsell](self, "pageCountIncludingUpsell");
  if (!v5 || v5 == 0x7FFFFFFFFFFFFFFFLL)
    return -1.0;
  -[BKBookViewController touchBarPositionForPagePosition:](self, "touchBarPositionForPagePosition:", fmin(fmax((double)(a3 - 1) / (double)(v5 - 1), 0.0), 1.0));
  return result;
}

- (double)pagePositionForTouchBarPosition:(double)a3
{
  unsigned int v4;
  double result;

  v4 = -[BKBookViewController touchBarScrollerBookIsRightToLeft](self, "touchBarScrollerBookIsRightToLeft");
  result = 1.0 - a3;
  if (!v4)
    return a3;
  return result;
}

- (void)touchBarHandleBackRequest:(id)a3
{
  void *v4;
  void *v5;

  -[BKBookViewController dismissCurrentPopover](self, "dismissCurrentPopover", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController navigationHistory](self, "navigationHistory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "previousEntity"));

  if (v5)
    -[BKBookViewController jumpBackAnimated:](self, "jumpBackAnimated:", 1);
}

- (void)touchBarHandleForwardRequest:(id)a3
{
  void *v4;
  void *v5;

  -[BKBookViewController dismissCurrentPopover](self, "dismissCurrentPopover", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController navigationHistory](self, "navigationHistory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nextEntity"));

  if (v5)
    -[BKBookViewController jumpAheadAnimated:](self, "jumpAheadAnimated:", 1);
}

- (void)touchBarHandleSearchRequest:(id)a3
{
  -[BKBookViewController showSearch:](self, "showSearch:", a3);
}

- (void)touchBarHandleReadAloudRequest:(id)a3
{
  if (-[BKBookViewController isReadAloudPaused](self, "isReadAloudPaused", a3))
    -[BKBookViewController resumeReadAloud](self, "resumeReadAloud");
  else
    -[BKBookViewController setReadAloudState:](self, "setReadAloudState:", !self->_isReading);
}

- (void)touchBarScrollerDidEnd:(double)a3 completion:(id)a4
{
  void (**v6)(double);

  v6 = (void (**)(double))a4;
  -[BKBookViewController turnToPageNumber:animated:](self, "turnToPageNumber:animated:", -[BKBookViewController pageNumberForTouchBarPosition:](self, "pageNumberForTouchBarPosition:", a3), 1);
  v6[2](a3);

}

- (void)touchBarScrollerDidIdle:(double)a3
{
  -[BKBookViewController turnToPageNumber:animated:](self, "turnToPageNumber:animated:", -[BKBookViewController pageNumberForTouchBarPosition:](self, "pageNumberForTouchBarPosition:", a3), 1);
}

- (void)touchBarScrollerJumpToBookmark:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_opt_class(AEAnnotation);
  v6 = BUDynamicCast(v5, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue(v6);

  v7 = v9;
  if (v9)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "location"));
    -[BKBookViewController recordedJumpToLocation:animated:completion:](self, "recordedJumpToLocation:animated:completion:", v8, 1, &stru_1BFE50);

    v7 = v9;
  }

}

- (id)touchBarScrollerChapters
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chapters"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allObjects"));

  return v4;
}

- (double)touchBarScrollerPositionForChapter:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;

  v4 = a3;
  objc_opt_class(BKNavigationInfo);
  v6 = BUDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController _locationForChapter:](self, "_locationForChapter:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
    v10 = (uint64_t)objc_msgSend(v9, "pageNumberForLocation:", v8);

  }
  else
  {
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  -[BKBookViewController touchBarPositionForPageNumber:](self, "touchBarPositionForPageNumber:", v10);
  v12 = v11;

  return v12;
}

- (double)touchBarScrollerPositionForBookmark:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  double v13;
  double v14;

  v4 = a3;
  objc_opt_class(AEAnnotation);
  v6 = BUDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
    v9 = objc_msgSend(v8, "pageRangeForAnnotation:", v7);
    v11 = v10;

    v12 = -[BKBookViewController pageNumberFromRange:](self, "pageNumberFromRange:", v9, v11);
  }
  else
  {
    v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
  -[BKBookViewController touchBarPositionForPageNumber:](self, "touchBarPositionForPageNumber:", v12);
  v14 = v13;

  return v14;
}

- (double)touchBarScrollerEndScrollPositionForPosition:(double)a3
{
  double result;

  -[BKBookViewController touchBarPositionForPageNumber:](self, "touchBarPositionForPageNumber:", -[BKBookViewController pageNumberForTouchBarPosition:](self, "pageNumberForTouchBarPosition:", a3));
  return result;
}

- (id)touchBarScrollerAccessibilityLabelForChapter:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char *v11;
  void *v12;
  void *v13;

  v3 = a3;
  objc_opt_class(BKNavigationInfo);
  v5 = BUDynamicCast(v4, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v6)
  {
    v7 = AEBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Chapter %1$lu, %2$@"), &stru_1C3088, 0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "absoluteOrder"));
    v11 = (char *)objc_msgSend(v10, "integerValue") + 1;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v11, v12));

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)touchBarScrollerAccessibilityLabelForBookmark:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_opt_class(AEAnnotation);
  v5 = BUDynamicCast(v4, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessibilityLabel"));
  return v7;
}

- (id)touchBarScrollerAccessibilityLabelForCurrentScrollPosition
{
  return 0;
}

- (void)registerBookmarkObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController bookmarkObservers](self, "bookmarkObservers"));
  objc_msgSend(v5, "addObject:", v4);

}

- (void)unregisterBookmarkObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController bookmarkObservers](self, "bookmarkObservers"));
  objc_msgSend(v5, "removeObject:", v4);

}

- (unint64_t)numberOfBookmarks
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController allBookmarkIdentifiers](self, "allBookmarkIdentifiers"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (id)allBookmarkIdentifiers
{
  return -[BKBookViewController _allAnnotationsForType:](self, "_allAnnotationsForType:", 1);
}

- (void)_notifyBookmarkObservers
{
  NSHashTable *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  -[BKBookViewController updateTouchBarController](self, "updateTouchBarController");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = self->_bookmarkObservers;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "bookmarksUpdated", (_QWORD)v8);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)contentViewControllerAnnotationCacheDidChange:(id)a3
{
  -[BKBookViewController writeAnnotationsToWebProcessPlugin](self, "writeAnnotationsToWebProcessPlugin", a3);
  -[BKBookViewController _notifyBookmarkObservers](self, "_notifyBookmarkObservers");
}

- (id)protocolCacheItemForAEBookInfo:(id)a3
{
  return objc_msgSend(a3, "cacheItem");
}

- (void)contentViewController:(id)a3 setEndOfBookToLocation:(id)a4 range:(id)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a4;
  objc_opt_class(BKEpubCFILocation);
  v8 = BUDynamicCast(v7, v6);
  v16 = (id)objc_claimAutoreleasedReturnValue(v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "cfiString"));
  if (objc_msgSend(v9, "length"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    objc_msgSend(v10, "setEndOfBookLocation:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    objc_msgSend(v11, "setEndOfBookValidRange:", 0);

    if (-[NSManagedObjectContext hasChanges](self->_bookMoc, "hasChanges"))
      -[NSManagedObjectContext save:](self->_bookMoc, "save:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController experienceManager](self, "experienceManager"));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController _createEndOfBookExperience](self, "_createEndOfBookExperience"));
      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController experienceManager](self, "experienceManager"));
        objc_msgSend(v14, "removeExperienceOfType:", 0);

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController experienceManager](self, "experienceManager"));
        objc_msgSend(v15, "addExperience:", v13);

      }
    }
  }

}

- (void)contentViewController:(id)a3 goToLocation:(id)a4
{
  uint64_t v5;
  id v6;

  v6 = a4;
  objc_opt_class(BKPageLocation);
  if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0)
  {
    -[BKBookViewController recordedJumpToLocation:animated:completion:](self, "recordedJumpToLocation:animated:completion:", v6, 1, 0);
  }
  else
  {
    -[BKBookViewController saveReadingLocation:](self, "saveReadingLocation:", v6);
    -[BKBookViewController turnToInitialPage:](self, "turnToInitialPage:", 1);
  }

}

- (void)mediaPlaybackStarted:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[BCAudioMuxingCoordinator sharedInstance](BCAudioMuxingCoordinator, "sharedInstance", a3));
  objc_msgSend(v4, "notifyPlaybackWillStart:", self);

}

- (id)directorySwitcher
{
  return 0;
}

- (void)setFinishedForAssetID:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));
  if ((objc_opt_respondsToSelector(v4, "setFinishedForAssetID:") & 1) != 0)
    objc_msgSend(v4, "setFinishedForAssetID:", v5);

}

- (void)contentViewController:(id)a3 setFinishedAndCloseForAssetID:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));
  if ((objc_opt_respondsToSelector(v5, "assetViewController:setFinishedAndCloseForAssetID:") & 1) != 0)
    objc_msgSend(v5, "assetViewController:setFinishedAndCloseForAssetID:", self, v6);

}

- (BOOL)isTOCURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "bc_pathWithoutPrecedingSlash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByRemovingURLFragment"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tocPageHref"));
  v8 = objc_msgSend(v5, "isEqual:", v7);

  return v8;
}

- (id)documentForURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "bc_pathWithoutPrecedingSlash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByRemovingURLFragment"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "documentAtPath:", v5));

  return v7;
}

- (void)contentViewController:(id)a3 goToURL:(id)a4 likelyUserInitiated:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a5;
  v12 = a4;
  if (!-[BKBookViewController isTOCURL:](self, "isTOCURL:"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController documentForURL:](self, "documentForURL:", v12));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bc_pathWithoutPrecedingSlash"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByRemovingURLFragment"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fragment"));
      -[BKBookViewController goToPath:fragment:animated:](self, "goToPath:fragment:animated:", v9, v10, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));

    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));

      if (!v11)
      {
LABEL_8:

        goto LABEL_9;
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));
      objc_msgSend(v8, "assetViewController:requestOpenURL:likelyUserInitiated:", self, v12, v5);
    }

    goto LABEL_8;
  }
  -[BKBookViewController showTOC:](self, "showTOC:", self);
LABEL_9:

}

- (void)contentViewReady:(id)a3
{
  id v4;

  v4 = a3;
  -[BKBookViewController readAloudViewControllerReady:](self, "readAloudViewControllerReady:", v4);
  -[BKBookViewController signalBookContentDidLoad:](self, "signalBookContentDidLoad:", v4);
  objc_msgSend(v4, "resume");

}

- (void)readAloudViewControllerReady:(id)a3
{
  id v4;
  NSMutableArray *loadedPages;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  id v14;
  NSMutableArray *v15;
  id v16;

  v4 = a3;
  v16 = v4;
  if (self->_isReading)
  {
    -[BKBookViewController _markupDocumentElementForMediaOverlay:](self, "_markupDocumentElementForMediaOverlay:", v4);
    -[BKBookViewController _installClickHandlers:](self, "_installClickHandlers:", v16);
    v4 = v16;
  }
  else if (!self->_isPlayingSoundTrack)
  {
    goto LABEL_14;
  }
  loadedPages = self->_loadedPages;
  if (!loadedPages)
  {
    v6 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
    v7 = self->_loadedPages;
    self->_loadedPages = v6;

    v4 = v16;
    loadedPages = self->_loadedPages;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v4, "ordinal")));
  -[NSMutableArray addObject:](loadedPages, "addObject:", v8);

  v9 = (char *)-[BKBookViewController currentPages](self, "currentPages");
  if (v10)
  {
    v11 = v10;
    v12 = v9 - 1;
    while (1)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v12));
      if ((-[NSMutableArray containsObject:](self->_loadedPages, "containsObject:", v13) & 1) == 0)
      {
        v14 = objc_msgSend(v13, "unsignedIntegerValue");
        if (v14 != (id)-[BKBookViewController upsellOrdinal](self, "upsellOrdinal"))
          break;
      }

      ++v12;
      if (!--v11)
        goto LABEL_11;
    }

  }
  else
  {
LABEL_11:
    v15 = self->_loadedPages;
    self->_loadedPages = 0;

    -[BKBookViewController continueReadAloudAfterReady](self, "continueReadAloudAfterReady");
  }
  v4 = v16;
LABEL_14:

}

- (void)continueReadAloudAfterReady
{
  id v3;
  uint64_t v4;

  if (self->_isReading && !-[BKBookViewController section](self, "section"))
  {
    v3 = -[BKBookViewController currentPages](self, "currentPages");
    -[BKBookViewController readPages:from:to:waitOnEmpty:](self, "readPages:from:to:waitOnEmpty:", v3, v4, -[BKBookViewController _itemIndexForCurrentPage](self, "_itemIndexForCurrentPage"), -1, 1);
  }
  if (self->_isPlayingSoundTrack)
    -[BKBookViewController playCurrentSoundtrack](self, "playCurrentSoundtrack");
}

- (void)signalBookContentDidLoad:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;

  v4 = a3;
  v5 = _AEBookOpenLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentOpenAnimator](self, "contentOpenAnimator"));
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "SignalBookContentDidLoad - animator: %@ content: %@", (uint8_t *)&v9, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentOpenAnimator](self, "contentOpenAnimator"));
  objc_msgSend(v8, "bookContentDidLoad");

  -[BKBookViewController setContentOpenAnimator:](self, "setContentOpenAnimator:", 0);
}

- (void)contentViewController:(id)a3 showNoteForAnnotation:(id)a4
{
  -[BKBookViewController showNoteEditorForAnnotation:](self, "showNoteEditorForAnnotation:", a4);
}

- (void)contentViewController:(id)a3 showAlertController:(id)a4 fromRect:(CGRect)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  double y;
  double x;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  id v26;

  v6 = a6;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v26 = a3;
  v13 = a4;
  if (!objc_msgSend(v13, "preferredStyle"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController view](self, "view"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "view"));
    objc_msgSend(v14, "convertRect:fromView:", v15, x, y, width, height);
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "popoverPresentationController"));
    objc_msgSend(v24, "setPermittedArrowDirections:", 15);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController view](self, "view"));
    objc_msgSend(v24, "setSourceView:", v25);

    objc_msgSend(v24, "setSourceRect:", v17, v19, v21, v23);
  }
  -[BKBookViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, v6, 0);

}

- (void)contentViewController:(id)a3 stopMediaPlay:(id)a4
{
  id v5;
  unsigned int v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v5 = a4;
  v12 = 0;
  v13 = 0;
  v6 = -[BKBookViewController _currentChapterInfo:uniqueID:](self, "_currentChapterInfo:uniqueID:", &v13, &v12);
  v7 = v13;
  v8 = v12;
  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[BCProgressKitController sharedController](BCProgressKitController, "sharedController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "assetID"));
    objc_msgSend(v9, "updateMediaForBook:chapter:mediaCFI:progress:completion:", v11, v8, v5, &off_1CD6A8, 0);

  }
}

- (void)contentViewController:(id)a3 handleUserRequestForFrameToLoadExternalURL:(id)a4 completion:(id)a5
{
  -[BKBookViewController _promptToLoadExternalContent:](self, "_promptToLoadExternalContent:", a5, a4);
}

- (void)contentViewController:(id)a3 presentAlertController:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v7 = a5;
  v10 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bookTitle"));
  objc_msgSend(v10, "setTitle:", v9);

  -[BKBookViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"), v7);
}

- (void)contentViewController:(id)a3 showLookupForString:(id)a4 fromView:(id)a5 onClose:(id)a6
{
  -[BKBookViewController showLookupForString:fromView:onClose:](self, "showLookupForString:fromView:onClose:", a4, a5, a6);
}

- (void)contentViewController:(id)a3 showTranslateForText:(id)a4 fromView:(id)a5 onClose:(id)a6
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  BKBookViewController *v12;
  id v13;
  id v14;
  id v15;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_52EF8;
  v11[3] = &unk_1BF728;
  v12 = self;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v8 = v14;
  v9 = v15;
  v10 = v13;
  -[BKBookViewController dismissCurrentPopoverWithCompletion:animated:](v12, "dismissCurrentPopoverWithCompletion:animated:", v11, 0);

}

- (void)contentViewController:(id)a3 searchForString:(id)a4
{
  -[BKBookViewController showSearchWithString:sender:](self, "showSearchWithString:sender:", a4, a3);
}

- (void)contentViewController:(id)a3 setSearchString:(id)a4
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController searchModuleWithSearchString:](self, "searchModuleWithSearchString:", a4));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchController"));
  objc_msgSend(v4, "cancelSearch");

}

- (void)resumeReadAloudForContentViewController:(id)a3
{
  -[BKBookViewController resumeReadAloud](self, "resumeReadAloud", a3);
}

- (void)preloadContentViewController:(id)a3 highPriority:(BOOL)a4
{
  -[BKBookViewController preloadContentController:highPriority:](self, "preloadContentController:highPriority:", a3, a4);
}

- (id)contentViewController:(id)a3 fullScreenNoteEditorForAnnotation:(id)a4
{
  return -[BKBookViewController fullScreenNoteEditorForAnnotation:](self, "fullScreenNoteEditorForAnnotation:", a4);
}

- (void)contentViewController:(id)a3 setTurnState:(BOOL)a4
{
  -[BKBookViewController setTurnState:](self, "setTurnState:", a4);
}

- (void)contentViewController:(id)a3 setReadAloudState:(BOOL)a4
{
  -[BKBookViewController setReadAloudState:](self, "setReadAloudState:", a4);
}

- (void)contentViewController:(id)a3 expandAnnotation:(id)a4 location:(id)a5 selectedText:(id)a6 representativeText:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  -[BKBookViewController _emitAnnotationActionEventIfNeededForAnnotationType:](self, "_emitAnnotationActionEventIfNeededForAnnotationType:", objc_msgSend(v14, "annotationType"));
  -[BKBookViewController expandAnnotation:location:selectedText:representativeText:](self, "expandAnnotation:location:selectedText:representativeText:", v14, v13, v12, v11);

}

- (id)contentViewController:(id)a3 addAnnotation:(int)a4 location:(id)a5 selectedText:(id)a6 representativeText:(id)a7
{
  uint64_t v9;
  id v11;
  id v12;
  id v13;
  void *v14;

  v9 = *(_QWORD *)&a4;
  v11 = a7;
  v12 = a6;
  v13 = a5;
  -[BKBookViewController _emitAnnotationActionEventIfNeededForAnnotationType:](self, "_emitAnnotationActionEventIfNeededForAnnotationType:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController addAnnotation:location:selectedText:representativeText:](self, "addAnnotation:location:selectedText:representativeText:", v9, v13, v12, v11));

  return v14;
}

- (void)_emitAnnotationActionEventIfNeededForAnnotationType:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (a3 == 2)
  {
    v7 = objc_msgSend(objc_alloc((Class)BAViewData), "initWithType:action:location:", 4, 5, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentDataForSearchViewController:](self, "contentDataForSearchViewController:", 0));
    objc_msgSend(v4, "emitAnnotationActionEventWithTracker:contentData:viewData:", v5, v6, v7);

  }
}

- (BOOL)turnPages:(int64_t)a3 animated:(BOOL)a4
{
  return 0;
}

- (void)showSearchFromToolbar:(id)a3
{
  -[BKBookViewController showSearch:](self, "showSearch:", a3);
}

- (id)_searchQueryFromSender:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  objc_opt_class(NSString);
  v5 = BUDynamicCast(v4, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (!v6)
  {
    v7 = BUProtocolCast(&OBJC_PROTOCOL___BCAppIntentsSearchQueryProvider, v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "appIntentsSearchQuery"));

  }
  return v6;
}

- (BCAppIntentsAssetViewControllerInfo)appIntentsInfo
{
  BCAppIntentsAssetViewControllerInfo *v3;
  void *v4;
  void *v5;

  v3 = objc_opt_new(BCAppIntentsAssetViewControllerInfo);
  -[BCAppIntentsAssetViewControllerInfo setSupportsTheming:](v3, "setSupportsTheming:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController asset](self, "asset"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetID"));
  -[BCAppIntentsAssetViewControllerInfo setAssetID:](v3, "setAssetID:", v5);

  return v3;
}

- (void)didChangeCurrentOverlayViewController
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKBookViewController;
  -[BKViewController didChangeCurrentOverlayViewController](&v3, "didChangeCurrentOverlayViewController");
  -[BKBookViewController notifyAppIntentsInfoChanged](self, "notifyAppIntentsInfoChanged");
}

- (int64_t)bookToolbarTransparency
{
  return 2;
}

- (int64_t)bookToolbarMode
{
  void *v3;
  unsigned __int8 v4;

  if (!-[BKBookViewController safeToShowToolbarItems](self, "safeToShowToolbarItems"))
    return 7;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController expandedContentViewController](self, "expandedContentViewController"));
  v4 = objc_msgSend(v3, "isVisible");

  if ((v4 & 1) != 0)
    return 3;
  if (-[BKBookViewController section](self, "section"))
    return 0;
  return 9;
}

- (BOOL)isBookToolbarAppearanceDark
{
  void *v3;
  char *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController themePage](self, "themePage"));
  v4 = (char *)objc_msgSend(v3, "userInterfaceStyle");

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController viewIfLoaded](self, "viewIfLoaded"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "traitCollection"));
    v4 = (char *)objc_msgSend(v7, "userInterfaceStyle");

  }
  return v4 == (_BYTE *)&dword_0 + 2;
}

- (id)bookToolbarThemeID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController theme](self, "theme"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "themeIdentifier"));

  return v3;
}

- (BOOL)shouldDisplayTitleWhenActive
{
  return 1;
}

- (BOOL)shouldDisplayTitleWhenInactive
{
  return 1;
}

- (BOOL)shouldDisplayReadaloudControls
{
  return 0;
}

- (BOOL)shouldDisplaySearchControls
{
  return 1;
}

- (BOOL)shouldDisplayShareControls
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v3 = objc_msgSend(v2, "isStoreBook");

  return v3;
}

- (BOOL)shouldDisplaySettingsControls
{
  return 0;
}

- (BOOL)shouldDisplayBuyButton
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sampleContent"));
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)shouldGroupModeControls
{
  return 1;
}

- (BOOL)shouldDisplayContentsButton
{
  return 0;
}

- (BOOL)shouldDisplayPageThumbnailsButton
{
  return 0;
}

- (BOOL)shouldDisplayBookmarksButton
{
  return 0;
}

- (BOOL)shouldDisplayGlossaryButton
{
  return 0;
}

- (BOOL)shouldDisplayHighlightsButton
{
  return 0;
}

- (BOOL)shouldDisplayStudyCardsButton
{
  return 0;
}

- (BOOL)usePrimarySidebar
{
  return 0;
}

- (BOOL)autoHidesToolbarInFullscreen
{
  return 1;
}

- (BOOL)wantsToolbarVisible
{
  return 0;
}

- (id)bookToolbarTitle
{
  return 0;
}

- (id)bookToolbarShareURL
{
  return 0;
}

- (id)bookToolbarCurrentPageString
{
  return 0;
}

- (BOOL)shouldDisplayBookmarkMenu
{
  return 0;
}

- (id)itemProvidersForSharing
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController storeShortURL](self, "storeShortURL"));
  if (v2 && (v3 = objc_msgSend(objc_alloc((Class)NSItemProvider), "initWithContentsOfURL:", v2)) != 0)
  {
    v4 = v3;
    v7 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)canTurnPagesAutomaticallyWhileReadingAloudForToolbar:(id)a3
{
  return -[BKBookViewController canTurnPagesAutomatically](self, "canTurnPagesAutomatically", a3);
}

- (BOOL)isSoundtrackPlayingForToolbar:(id)a3
{
  return -[BKBookViewController isSoundtrackPlaying](self, "isSoundtrackPlaying", a3);
}

- (id)titleMutedColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController theme](self, "theme"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "headerTextColorDimmed"));

  return v3;
}

- (id)titleColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController theme](self, "theme"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "toolbarTitleColor"));

  return v3;
}

- (id)chapterColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController theme](self, "theme"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "headerTextColorDimmed"));

  return v3;
}

- (id)tintColorForNavbarButtons
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController theme](self, "theme"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "tintColorForNavbarButtons"));

  return v3;
}

- (id)buttonColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController themePage](self, "themePage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "buttonColor"));

  return v3;
}

- (id)buttonTitleColor
{
  return +[UIColor whiteColor](UIColor, "whiteColor");
}

- (id)profileFuture
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "assetViewControllerProductProfileProtocol:", self));

  return v4;
}

- (BOOL)isPreordered
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "isPreorder"));
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)bookmarkToolTip
{
  id v2;
  void *v3;
  void *v4;

  v2 = AEBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Show Bookmarks"), &stru_1C3088, 0));

  return v4;
}

- (id)tocToolTip
{
  id v2;
  void *v3;
  void *v4;

  v2 = AEBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Show the table of contents"), &stru_1C3088, 0));

  return v4;
}

- (void)popoverDidClose:(id)a3 fromToolbar:(id)a4
{
  IMViewController *v5;
  void *v6;
  IMViewController *v7;
  IMViewController *v8;
  IMViewController *v9;

  v9 = (IMViewController *)a3;
  v5 = (IMViewController *)objc_claimAutoreleasedReturnValue(-[BKBookViewController brightnessController](self, "brightnessController"));

  if (v5 == v9
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController audioController](self, "audioController")),
        v7 = (IMViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "navigationController")),
        v7,
        v6,
        v8 = v9,
        v7 == v9))
  {
    -[BKBookViewController cleanupPopovers](self, "cleanupPopovers");
    goto LABEL_6;
  }
  if (self->_appearanceContainerViewController == v9)
  {
    -[BKBookViewController handleAppearanceViewControllerDismissal](self, "handleAppearanceViewControllerDismissal");
LABEL_6:
    v8 = v9;
  }

}

- (void)showOverlayViewController:(id)a3 fromView:(id)a4 popoverOnPhone:(BOOL)a5 popoverBackgroundColor:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[BKBookViewController cancelPendingHidePageControls](self, "cancelPendingHidePageControls");
  -[BKViewController showOverlayViewController:fromItem:popoverOnPhone:passthroughViews:popoverBackgroundColor:](self, "showOverlayViewController:fromItem:popoverOnPhone:passthroughViews:popoverBackgroundColor:", v12, v11, v6, &__NSArray0__struct, v10);

}

- (void)setExpandedContentViewController:(id)a3
{
  BKExpandedContentViewController *v5;
  BKExpandedContentViewController *expandedContentViewController;
  BKBookViewController *v7;
  BKExpandedContentViewController *v8;

  v5 = (BKExpandedContentViewController *)a3;
  expandedContentViewController = self->_expandedContentViewController;
  if (expandedContentViewController != v5)
  {
    v8 = v5;
    v7 = (BKBookViewController *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController delegate](expandedContentViewController, "delegate"));

    if (v7 == self)
      -[BKExpandedContentViewController setDelegate:](self->_expandedContentViewController, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_expandedContentViewController, a3);
    -[BKBookViewController updateToolbarController](self, "updateToolbarController");
    v5 = v8;
  }

}

- (void)contentViewController:(id)a3 showExpandedContentForResource:(id)a4 atLocation:(id)a5
{
  -[BKBookViewController showExpandedContentForResource:atLocation:completion:](self, "showExpandedContentForResource:atLocation:completion:", a4, a5, 0);
}

- (void)showExpandedContentForResource:(id)a3 atLocation:(id)a4 completion:(id)a5
{
  -[BKBookViewController _showExpandedContentForResource:atLocation:presentingFromTOC:completion:](self, "_showExpandedContentForResource:atLocation:presentingFromTOC:completion:", a3, a4, 0, 0);
}

- (void)_showExpandedContentForResource:(id)a3 atLocation:(id)a4 presentingFromTOC:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  BKARQuicklookViewController *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _BOOL8 v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id location;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController expandedContentViewController](self, "expandedContentViewController"));
  objc_msgSend(v13, "close:", 0);

  if (!v7)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController currentLocation](self, "currentLocation"));
    -[BKBookViewController setResumeLocation:](self, "setResumeLocation:", v14);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sourceURL"));
  v16 = BEDoesURLPointToUSDZFile(v15);

  if (v16)
  {
    v17 = objc_alloc_init(BKARQuicklookViewController);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sourceURL"));
    -[BKARQuicklookViewController setARModelDataURL:](v17, "setARModelDataURL:", v18);

    -[BKARQuicklookViewController setDataSource:](v17, "setDataSource:", v17);
    -[BKBookViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);

  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[BKExpandedContentViewController expandedContentControllerForResource:](BKExpandedContentViewController, "expandedContentControllerForResource:", v10));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController theme](self, "theme"));
    objc_msgSend(v19, "setTheme:", v20);

    objc_msgSend(v19, "setDelegate:", self);
    objc_opt_class(BKExpandedWebContentViewController2);
    v22 = BUDynamicCast(v21, v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
      objc_msgSend(v23, "setAllowsRemoteInspection:", objc_msgSend(v24, "shouldAllowRemoteInspection"));

    }
    -[BKBookViewController setExpandedContentViewController:](self, "setExpandedContentViewController:", v19);
    objc_msgSend(v19, "setPresentingFromTOC:", v7);
    objc_initWeak(&location, self);
    v25 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_53E6C;
    v26[3] = &unk_1BFE78;
    objc_copyWeak(&v28, &location);
    v27 = v12;
    -[BKBookViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v19, v25, v26);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);

  }
}

- (CGRect)frameForLocation:(id)a3 inView:(id)a4 expandedContentViewController:(id)a5
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)expandedContentViewController:(id)a3 handleUserRequestForFrameToLoadExternalURL:(id)a4 completion:(id)a5
{
  if (self->_expandedContentViewController == a3)
    -[BKBookViewController _promptToLoadExternalContent:](self, "_promptToLoadExternalContent:", a5, a4);
  else
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/BKBookViewController.m", 4548, "-[BKBookViewController expandedContentViewController:handleUserRequestForFrameToLoadExternalURL:completion:]", "_expandedContentViewController == controller", CFSTR("Unexpected BKExpandedWebContentViewControllerDelegate message!"));
}

- (void)expandedContentViewController:(id)a3 handleExternalLoadRequest:(id)a4 likelyUserInitiated:(BOOL)a5
{
  if (self->_expandedContentViewController == a3)
    -[BKBookViewController _handleExternalLoadRequest:likelyUserInitiated:](self, "_handleExternalLoadRequest:likelyUserInitiated:", a4, a5);
  else
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/BKBookViewController.m", 4555, "-[BKBookViewController expandedContentViewController:handleExternalLoadRequest:likelyUserInitiated:]", "_expandedContentViewController == controller", CFSTR("Unexpected BKExpandedWebContentViewControllerDelegate message!"));
}

- (BOOL)expandedContentViewController:(id)a3 handleInternalLoadRequest:(id)a4
{
  if (self->_expandedContentViewController == a3)
    return -[BKBookViewController _controller:handleInternalRequestForURL:](self, "_controller:handleInternalRequestForURL:");
  BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/BKBookViewController.m", 4561, "-[BKBookViewController expandedContentViewController:handleInternalLoadRequest:]", "_expandedContentViewController == controller", CFSTR("Unexpected BKExpandedWebContentViewControllerDelegate message!"));
  return 0;
}

- (void)expandedContentViewController:(id)a3 handleInternalLoadRequestForNewWindow:(id)a4
{
  if (self->_expandedContentViewController == a3)
    -[BKBookViewController _controller:handleInternalRequestForURL:](self, "_controller:handleInternalRequestForURL:");
  else
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/BKBookViewController.m", 4567, "-[BKBookViewController expandedContentViewController:handleInternalLoadRequestForNewWindow:]", "_expandedContentViewController == controller", CFSTR("Unexpected BKExpandedWebContentViewControllerDelegate message!"));
}

- (void)expandedContentViewDidDisappear:(id)a3
{
  void *v4;
  BKExpandedContentViewController *v5;

  v5 = (BKExpandedContentViewController *)a3;
  if (self->_expandedContentViewController == v5)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController searchResult](self, "searchResult"));
    -[BKBookViewController clearSelection](self, "clearSelection");
    -[BKBookViewController setExpandedContentViewController:](self, "setExpandedContentViewController:", 0);
    if (!-[BKExpandedContentViewController presentingFromTOC](v5, "presentingFromTOC"))
      -[BKBookViewController setResumeLocation:](self, "setResumeLocation:", 0);
    if (v4)
      -[BKBookViewController highlightSearchResult:](self, "highlightSearchResult:", v4);

  }
  else
  {
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/BKBookViewController.m", 4573, "-[BKBookViewController expandedContentViewDidDisappear:]", "_expandedContentViewController == controller", CFSTR("Unexpected BKExpandedWebContentViewControllerDelegate message!"));
  }

}

- (BOOL)expandedContentView:(id)a3 shouldStartLoadWithRequest:(id)a4
{
  BKExpandedContentViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;

  v6 = (BKExpandedContentViewController *)a3;
  if (self->_expandedContentViewController != v6)
  {
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/BKBookViewController.m", 4591, "-[BKBookViewController expandedContentView:shouldStartLoadWithRequest:]", "_expandedContentViewController == controller", CFSTR("Unexpected BKExpandedWebContentViewControllerDelegate message!"));
    LOBYTE(self) = 0;
    goto LABEL_14;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "URL"));
  if ((BEURLHandlerSchemeIsOkForBookToLoad() & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bc_pathWithoutPrecedingSlash"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByRemovingURLFragment"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "documentAtPath:", v9));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "documentOrdinal"));
    if (objc_msgSend(v12, "integerValue") == (id)-1)
    {
      LOBYTE(self) = 1;
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nonlinearElement"));
      v14 = objc_msgSend(v13, "BOOLValue");

      if ((v14 & 1) != 0)
      {
        LOBYTE(self) = 1;
LABEL_12:

        goto LABEL_13;
      }
      if (v8)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fragment"));
        -[BKExpandedContentViewController close:](v6, "close:", 1);
        -[BKBookViewController goToPath:fragment:animated:](self, "goToPath:fragment:animated:", v8, v12, 1);
        LOBYTE(self) = 0;
      }
      else
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));
        LODWORD(self) = objc_msgSend(v12, "assetViewController:requestOpenURL:likelyUserInitiated:", self, v7, 0) ^ 1;
      }
    }

    goto LABEL_12;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));
  objc_msgSend(v8, "assetViewController:requestOpenURL:likelyUserInitiated:", self, v7, 0);
  LOBYTE(self) = 0;
LABEL_13:

LABEL_14:
  return (char)self;
}

- (void)expandedContentViewController:(id)a3 presentAlertController:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v8 = a5;
  if (self->_expandedContentViewController == a3)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bookTitle"));
    objc_msgSend(v11, "setTitle:", v10);

    -[BKBookViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"), v8);
  }
  else
  {
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/BKBookViewController.m", 4629, "-[BKBookViewController expandedContentViewController:presentAlertController:completion:]", "_expandedContentViewController == controller", CFSTR("Unexpected BKExpandedWebContentViewControllerDelegate message!"));
  }

}

- (BKNavigationHistory)navigationHistory
{
  void *v3;
  unsigned int v4;
  BKNavigationHistory *v5;
  BKNavigationHistory *navigationHistory;

  if (!self->_navigationHistory)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v4 = objc_msgSend(v3, "wantsJumpBackHistory");

    if (v4)
    {
      v5 = objc_alloc_init(BKNavigationHistory);
      navigationHistory = self->_navigationHistory;
      self->_navigationHistory = v5;

    }
  }
  return self->_navigationHistory;
}

- (void)fixupNavigationHistoryForUpsellPageNumber:(int64_t)a3
{
  unint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v5 = -[BKBookViewController upsellOrdinal](self, "upsellOrdinal");
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = (id)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentLookupKey"));

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController navigationHistory](self, "navigationHistory", 0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allObjects"));

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "location"));
          v17 = objc_msgSend(v16, "ordinal");

          if (v17 == v6)
            objc_msgSend(v15, "setPage:forLookupKey:", a3, v8);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

  }
}

- (void)setPaginationController:(id)a3
{
  BKPaginationController *v5;
  BKPaginationController **p_paginationController;
  BKPaginationController *paginationController;
  void *v8;
  BKPaginationController *v9;
  void *v10;
  BKPaginationController *v11;

  v5 = (BKPaginationController *)a3;
  p_paginationController = &self->_paginationController;
  paginationController = self->_paginationController;
  v11 = v5;
  if (paginationController != v5)
  {
    if (paginationController)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v8, "removeObserver:name:object:", self, BKPaginationDataLoadedNotification, *p_paginationController);

      v9 = *p_paginationController;
    }
    else
    {
      v9 = 0;
    }
    -[BKPaginationController removeObserver:forKeyPath:](v9, "removeObserver:forKeyPath:", self, CFSTR("progress"));
    -[BKPaginationController quit](*p_paginationController, "quit");
    objc_storeStrong((id *)&self->_paginationController, a3);
    -[BKPaginationController addObserver:forKeyPath:options:context:](*p_paginationController, "addObserver:forKeyPath:options:context:", self, CFSTR("progress"), 4, 0);
    -[BKSearchViewController setPaginationController:](self->_searchViewController, "setPaginationController:", *p_paginationController);
    if (*p_paginationController)
    {
      -[BKBookViewController updatePageCount](self, "updatePageCount");
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v10, "addObserver:selector:name:object:", self, "paginationCompleted", BKPaginationDataLoadedNotification, *p_paginationController);

    }
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("progress")))
  {
    -[BKPaginationController progress](self->_paginationController, "progress");
    -[BKBookViewController updatePaginationProgress:](self, "updatePaginationProgress:");
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)BKBookViewController;
    -[BKBookViewController observeValueForKeyPath:ofObject:change:context:](&v13, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (BOOL)needTextNodeCharacterCountsForOrdinal:(int64_t)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));
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
  v10 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));
  objc_msgSend(v10, "addTextNodeCharacterCounts:ordinal:completion:", v9, a4, v8);

}

- (BOOL)needTOCEntriesForOrdinal:(int64_t)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));
  LOBYTE(a3) = objc_msgSend(v4, "needTOCEntriesForOrdinal:", a3);

  return a3;
}

- (void)addTOCEntries:(id)a3 ordinal:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));
  objc_msgSend(v10, "addTOCEntries:ordinal:completion:", v9, a4, v8);

}

- (id)environmentOverrideViewForPaginationController:(id)a3
{
  return -[BKBookViewController environmentOverrideView](self, "environmentOverrideView", a3);
}

- (unint64_t)searchStringLengthLimit
{
  return BKBookSearchStringLengthLimit;
}

- (id)searchViewController
{
  BKSearchViewController *searchViewController;
  BKSearchViewController *v4;
  BKSearchViewController *v5;
  void *v6;

  searchViewController = self->_searchViewController;
  if (!searchViewController)
  {
    v4 = objc_alloc_init(BKSearchViewController);
    v5 = self->_searchViewController;
    self->_searchViewController = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController theme](self, "theme"));
    -[BKSearchViewController setTheme:](self->_searchViewController, "setTheme:", v6);

    -[BKSearchViewController setSearchDelegate:](self->_searchViewController, "setSearchDelegate:", self);
    -[BKSearchViewController setPaginationController:](self->_searchViewController, "setPaginationController:", self->_paginationController);
    searchViewController = self->_searchViewController;
  }
  return searchViewController;
}

- (id)searchViewControllerIfLoaded
{
  return self->_searchViewController;
}

- (void)showSearchWithString:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController searchModuleWithSearchString:](self, "searchModuleWithSearchString:", v6));
  -[BKBookViewController cancelPendingHidePageControls](self, "cancelPendingHidePageControls");
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_54A9C;
  v9[3] = &unk_1BF560;
  objc_copyWeak(&v10, &location);
  v9[4] = v8;
  -[BKBookViewController setControlsVisible:animated:completion:](self, "setControlsVisible:animated:completion:", 1, 1, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)showSearch:(id)a3
{
  -[BKBookViewController showSearchWithString:sender:](self, "showSearchWithString:sender:", 0, a3);
}

- (BOOL)shouldForceJumpOnSearch
{
  return 0;
}

- (id)environmentOverrideView
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController viewIfLoaded](self, "viewIfLoaded"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "window"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIViewController bc_presentingViewController](UIViewController, "bc_presentingViewController"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));

    v2 = (void *)v5;
  }
  return v2;
}

- (id)searchModuleWithSearchString:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = -[BKBookViewController searchStringLengthLimit](self, "searchStringLengthLimit");
  if ((unint64_t)objc_msgSend(v4, "length") > v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringToIndex:", v5));

    v4 = (id)v6;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController searchViewController](self, "searchViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchController"));
  objc_msgSend(v9, "setSearchBook:", v8);

  objc_msgSend(v7, "setSearchString:", v4);
  return v7;
}

- (void)revealSearchResult:(id)a3 animated:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  BOOL v14;
  id location;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "location"));
    objc_initWeak(&location, self);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_54D60;
    v10[3] = &unk_1BFEC8;
    objc_copyWeak(&v13, &location);
    v9 = v8;
    v11 = v9;
    v14 = a4;
    v12 = v7;
    -[BKBookViewController isLocationVisible:completion:](self, "isLocationVisible:completion:", v9, v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

  }
}

- (void)searchViewController:(id)a3 revealSearchResult:(id)a4 animated:(BOOL)a5
{
  -[BKBookViewController revealSearchResult:animated:](self, "revealSearchResult:animated:", a4, a5);
  -[BKBookViewController _dismissSearchViewController](self, "_dismissSearchViewController");
}

- (void)searchViewController:(id)a3 turnToPageNumber:(int64_t)a4 animated:(BOOL)a5
{
  -[BKBookViewController turnToPageNumber:animated:](self, "turnToPageNumber:animated:", a4, a5);
  -[BKBookViewController _dismissSearchViewController](self, "_dismissSearchViewController");
}

- (void)searchViewController:(id)a3 turnToLocation:(id)a4 animated:(BOOL)a5
{
  _QWORD v5[5];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_550F4;
  v5[3] = &unk_1BEA38;
  v5[4] = self;
  -[BKBookViewController recordedJumpToLocation:animated:completion:](self, "recordedJumpToLocation:animated:completion:", a4, a5, v5);
}

- (void)_dismissSearchViewController
{
  -[BKViewController hideOverlayViewControllerWithCompletion:](self, "hideOverlayViewControllerWithCompletion:", 0);
}

- (int64_t)searchViewController:(id)a3 pageNumberForDocumentOrdinal:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  int64_t v8;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "paginationController"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "paginationController"));
    v8 = (int64_t)objc_msgSend(v7, "pageNumberForDocumentOrdinal:", a4);

  }
  else
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (id)searchViewController:(id)a3 chapterNameForSearchResult:(id)a4 pageNumber:(int64_t)a5
{
  void *v5;
  void *v7;

  if (a5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "paginationController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "titleForChapterAtPageNumber:", a5));

  }
  return v5;
}

- (void)emitReadingOrientationChangeEventIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  if ((char *)objc_msgSend(v3, "orientation") - 3 >= (_BYTE *)&dword_0 + 2)
    v4 = &dword_0 + 1;
  else
    v4 = &dword_0 + 2;

  if ((void *)-[BKBookViewController lastAnalyticsDeviceOrientationReported](self, "lastAnalyticsDeviceOrientationReported") != v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController readingSessionDataForSearchViewController:](self, "readingSessionDataForSearchViewController:", 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentDataForSearchViewController:](self, "contentDataForSearchViewController:", 0));
    objc_msgSend(v5, "emitReadingOrientationChangeEventWithTracker:readingSessionData:contentData:", v6, v7, v8);

    -[BKBookViewController setLastAnalyticsDeviceOrientationReported:](self, "setLastAnalyticsDeviceOrientationReported:", v4);
  }
}

- (id)readingSessionDataForSearchViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController _currentReadingProgress](self, "_currentReadingProgress", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sampleContent"));
  v7 = objc_msgSend(v6, "BOOLValue");

  v8 = objc_alloc((Class)BAReadingSessionData);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController analyticsReadStartProgress](self, "analyticsReadStartProgress"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7));
  v11 = objc_msgSend(v8, "initWithPercentCompletionStart:percentCompletionEnd:isFreeSample:deviceOrientation:", v9, v4, v10, -[BKBookViewController lastAnalyticsDeviceOrientationReported](self, "lastAnalyticsDeviceOrientationReported"));

  return v11;
}

- (id)contentDataForSearchViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentSubType](self, "contentSubType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "analyticsContentDataForAssetViewController:contentSubType:tracker:", self, v5, v6));

  return v7;
}

- (id)environmentOverrideViewForSearchViewController:(id)a3
{
  return -[BKBookViewController environmentOverrideView](self, "environmentOverrideView", a3);
}

- (void)p_releaseDictionary
{
  BCDDParsecCollectionViewController *referenceLibraryViewController;

  -[BCDDParsecCollectionViewController setDelegate:](self->_referenceLibraryViewController, "setDelegate:", 0);
  referenceLibraryViewController = self->_referenceLibraryViewController;
  self->_referenceLibraryViewController = 0;

}

- (void)showLookupForString:(id)a3 fromView:(id)a4 onClose:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  BKBookViewController *v14;
  id v15;
  id v16;

  v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_55510;
  v12[3] = &unk_1BFF18;
  v13 = a4;
  v14 = self;
  v15 = v8;
  v16 = a5;
  v9 = v16;
  v10 = v8;
  v11 = v13;
  -[BKBookViewController dismissCurrentPopoverWithCompletion:animated:](self, "dismissCurrentPopoverWithCompletion:animated:", v12, 0);

}

- (void)dismissCurrentPopoverWithCompletion:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController referenceLibraryViewController](self, "referenceLibraryViewController"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController referenceLibraryViewController](self, "referenceLibraryViewController"));
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 0, 0);

    -[BKBookViewController p_releaseDictionary](self, "p_releaseDictionary");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController translationViewController](self, "translationViewController"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController translationViewController](self, "translationViewController"));
    objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 0, 0);

    -[BKBookViewController setTranslationViewController:](self, "setTranslationViewController:", 0);
  }
  v11.receiver = self;
  v11.super_class = (Class)BKBookViewController;
  -[BKViewController dismissCurrentPopoverWithCompletion:animated:](&v11, "dismissCurrentPopoverWithCompletion:animated:", v6, v4);

}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  UIViewController *v5;
  UIViewController *activityViewController;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  IMViewController *v16;
  IMViewController *appearanceContainerViewController;
  objc_super v18;

  v4 = a3;
  v5 = (UIViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentedViewController"));
  activityViewController = self->_activityViewController;

  if (v5 == activityViewController)
  {
    -[BKBookViewController setActivityViewController:](self, "setActivityViewController:", 0);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentedViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController referenceLibraryViewController](self, "referenceLibraryViewController"));

    if (v7 == v8)
    {
      -[BKBookViewController clearSelection](self, "clearSelection");
      -[BKBookViewController p_releaseDictionary](self, "p_releaseDictionary");
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentedViewController"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController translationViewController](self, "translationViewController"));

      if (v9 == v10)
      {
        -[BKBookViewController clearSelection](self, "clearSelection");
        -[BKBookViewController setTranslationViewController:](self, "setTranslationViewController:", 0);
      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentedViewController"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController brightnessController](self, "brightnessController"));

        if (v11 == v12
          || (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentedViewController")),
              v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController audioController](self, "audioController")),
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "navigationController")),
              v15,
              v14,
              v13,
              v13 == v15))
        {
          -[BKBookViewController cleanupPopovers](self, "cleanupPopovers");
        }
        else if (self->_appearanceContainerViewController)
        {
          v16 = (IMViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentedViewController"));
          appearanceContainerViewController = self->_appearanceContainerViewController;

          if (v16 == appearanceContainerViewController)
            -[BKBookViewController handleAppearanceViewControllerDismissal](self, "handleAppearanceViewControllerDismissal");
        }
      }
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)BKBookViewController;
  -[BKViewController presentationControllerDidDismiss:](&v18, "presentationControllerDidDismiss:", v4);

}

- (id)_footnoteViewController2ForResource:(id)a3 stylesheetSet:(id)a4
{
  id v6;
  id v7;
  BKFootnoteViewController2 *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[BKFootnoteViewController2 initWithResource:stylesheetSet:backgroundColor:textColor:]([BKFootnoteViewController2 alloc], "initWithResource:stylesheetSet:backgroundColor:textColor:", v7, v6, 0, 0);

  -[BKFootnoteViewController2 setAllowsRemoteInspection:](v8, "setAllowsRemoteInspection:", -[AEBookInfo shouldAllowRemoteInspection](self->_book, "shouldAllowRemoteInspection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController theme](self, "theme"));
  -[BKFootnoteViewController2 setTheme:](v8, "setTheme:", v9);

  objc_storeStrong((id *)&self->_footnoteController, v8);
  return v8;
}

- (void)showFootnoteInContentViewController:(id)a3 resource:(id)a4 fromView:(id)a5 stylesheetSet:(id)a6
{
  UIView *v9;
  id v10;
  id v11;
  UIView *footnoteSourceView;
  BKFootnoteViewController2 *v13;
  BKFootnoteViewController2 *footnoteController;
  UIView *v15;

  v9 = (UIView *)a5;
  v10 = a6;
  v11 = a4;
  -[BKBookViewController dismissCurrentPopover](self, "dismissCurrentPopover");
  -[BKBookViewController _cleanupFootnoteViewController](self, "_cleanupFootnoteViewController");
  footnoteSourceView = self->_footnoteSourceView;
  self->_footnoteSourceView = v9;
  v15 = v9;

  v13 = (BKFootnoteViewController2 *)objc_claimAutoreleasedReturnValue(-[BKBookViewController _footnoteViewController2ForResource:stylesheetSet:](self, "_footnoteViewController2ForResource:stylesheetSet:", v11, v10));
  footnoteController = self->_footnoteController;
  self->_footnoteController = v13;

  -[BKFootnoteViewController2 setDelegate:](self->_footnoteController, "setDelegate:", self);
  -[BKFootnoteViewController2 prepareForDisplay](self->_footnoteController, "prepareForDisplay");

}

- (void)toggleBookmarkForContentViewController:(id)a3
{
  -[BKBookViewController toggleBookmark:](self, "toggleBookmark:", 0);
}

- (void)toggleControlsForContentViewController:(id)a3
{
  -[BKBookViewController bkaxToggleControls:](self, "bkaxToggleControls:", 0);
}

- (void)_cleanupFootnoteViewController
{
  BKFootnoteViewController2 *footnoteController;
  UIView *footnoteSourceView;

  -[BKFootnoteViewController2 setDelegate:](self->_footnoteController, "setDelegate:", 0);
  footnoteController = self->_footnoteController;
  self->_footnoteController = 0;

  footnoteSourceView = self->_footnoteSourceView;
  self->_footnoteSourceView = 0;

}

- (void)footnoteViewController:(id)a3 handleUserRequestForFrameToLoadExternalURL:(id)a4 completion:(id)a5
{
  if (self->_footnoteController == a3)
    -[BKBookViewController _promptToLoadExternalContent:](self, "_promptToLoadExternalContent:", a5, a4);
  else
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/BKBookViewController.m", 5174, "-[BKBookViewController footnoteViewController:handleUserRequestForFrameToLoadExternalURL:completion:]", "_footnoteController == controller", CFSTR("Unexpected BKFootnoteViewController2Delegate message!"));
}

- (void)footnoteViewController:(id)a3 handleExternalLoadRequest:(id)a4 likelyUserInitiated:(BOOL)a5
{
  if (self->_footnoteController == a3)
    -[BKBookViewController _handleExternalLoadRequest:likelyUserInitiated:](self, "_handleExternalLoadRequest:likelyUserInitiated:", a4, a5);
  else
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/BKBookViewController.m", 5181, "-[BKBookViewController footnoteViewController:handleExternalLoadRequest:likelyUserInitiated:]", "_footnoteController == controller", CFSTR("Unexpected BKFootnoteViewController2Delegate message!"));
}

- (BOOL)footnoteViewController:(id)a3 handleInternalLoadRequest:(id)a4
{
  if (self->_footnoteController == a3)
    return -[BKBookViewController _controller:handleInternalRequestForURL:](self, "_controller:handleInternalRequestForURL:");
  BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/BKBookViewController.m", 5187, "-[BKBookViewController footnoteViewController:handleInternalLoadRequest:]", "_footnoteController == controller", CFSTR("Unexpected BKFootnoteViewController2Delegate message!"));
  return 0;
}

- (void)footnoteViewController:(id)a3 handleInternalLoadRequestForNewWindow:(id)a4
{
  -[BKBookViewController _controller:handleInternalRequestForURL:](self, "_controller:handleInternalRequestForURL:", a3, a4);
}

- (void)footnoteViewDidFinishLoad:(id)a3
{
  if (self->_footnoteController == a3)
    -[BKBookViewController showOverlayViewController:fromView:popoverOnPhone:popoverBackgroundColor:](self, "showOverlayViewController:fromView:popoverOnPhone:popoverBackgroundColor:");
  else
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/BKBookViewController.m", 5199, "-[BKBookViewController footnoteViewDidFinishLoad:]", "_footnoteController == controller", CFSTR("Unexpected BKFootnoteViewController2Delegate message!"));
}

- (void)footnoteViewDidDisappear:(id)a3
{
  if (self->_footnoteController == a3)
  {
    -[BKBookViewController _cleanupFootnoteViewController](self, "_cleanupFootnoteViewController");
    -[BKBookViewController clearSelection](self, "clearSelection");
  }
  else
  {
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/BKBookViewController.m", 5205, "-[BKBookViewController footnoteViewDidDisappear:]", "_footnoteController == controller", CFSTR("Unexpected BKFootnoteViewController2Delegate message!"));
  }
}

- (void)footnoteViewController:(id)a3 presentAlertController:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v8 = a5;
  if (self->_footnoteController == a3)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bookTitle"));
    objc_msgSend(v11, "setTitle:", v10);

    -[BKBookViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"), v8);
  }
  else
  {
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/BKBookViewController.m", 5213, "-[BKBookViewController footnoteViewController:presentAlertController:completion:]", "_footnoteController == controller", CFSTR("Unexpected BKFootnoteViewController2Delegate message!"));
  }

}

- (id)existingContentViewControllerForPageNumber:(int64_t)a3
{
  return 0;
}

- (id)contentViewControllerForPageNumber:(int64_t)a3
{
  return 0;
}

- (void)pageNavigationDidTryToSwipePastEndOfBook:(id)a3
{
  -[BKBookViewController bookMilestoneReached:](self, "bookMilestoneReached:", 3);
}

- (void)pageNavigationDidSwipeToNextPage:(id)a3
{
  -[BKBookViewController bookMilestoneReached:](self, "bookMilestoneReached:", 9);
}

- (BOOL)pageNavigationController:(id)a3 shouldDelayChangeToPageOffset:(int64_t)a4 completion:(id)a5
{
  return 0;
}

- (void)pageNavigationDidChangeLocation:(id)a3
{
  NSRange v4;

  v4.location = (NSUInteger)-[BKBookViewController currentPages](self, "currentPages", a3);
  if (!NSIntersectionRange(v4, (NSRange)self[240]).length)
    -[BKBookViewController stopReadAloud](self, "stopReadAloud");
}

- (int64_t)pageNavigationCurrentReadAloudPageOffset:(id)a3
{
  id v4;
  unint64_t previousReadingOrdinal;

  v4 = a3;
  previousReadingOrdinal = self->_previousReadingOrdinal;
  if (previousReadingOrdinal == -1)
  {
    if (self->_isReading)
      previousReadingOrdinal = (unint64_t)-[BKBookViewController currentPages](self, "currentPages");
    else
      previousReadingOrdinal = 0x7FFFFFFFFFFFFFFFLL;
  }

  return previousReadingOrdinal;
}

- (void)setSection:(int)a3
{
  -[BKBookViewController setSection:animated:adjustScrollToReveal:](self, "setSection:animated:adjustScrollToReveal:", *(_QWORD *)&a3, 0, 0);
}

- (void)setSection:(int)a3 animated:(BOOL)a4 adjustScrollToReveal:(BOOL)a5
{
  void *v6;

  if (self->_section != a3)
  {
    self->_section = a3;
    if (a3)
    {
      -[BKBookViewController bookMilestoneReached:](self, "bookMilestoneReached:", 7, a4, a5);
      -[BKBookViewController updateToolbarController](self, "updateToolbarController");
    }
    else
    {
      -[BKBookViewController updateToolbarController](self, "updateToolbarController", *(_QWORD *)&a3, a4, a5);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController displaySleepController](self, "displaySleepController"));
      objc_msgSend(v6, "userInteractionOccurred");

    }
    -[BKBookViewController notifyAppIntentsInfoChanged](self, "notifyAppIntentsInfoChanged");
  }
}

- (void)directoryContent:(id)a3 didSelectLocation:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[BKBookViewController directoryContent:didSelectLocation:animated:](self, "directoryContent:didSelectLocation:animated:", v7, v6, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));

}

- (void)directoryContent:(id)a3 didSelectLocation:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v5 = a5;
  v22 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController documentForLocation:](self, "documentForLocation:"));
  v8 = v7;
  if (!v7)
    goto LABEL_4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "documentOrdinal"));
  if (objc_msgSend(v9, "integerValue") == (id)-1)
  {

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nonlinearElement"));
    v11 = objc_msgSend(v10, "BOOLValue");

    if (!v11)
    {
LABEL_4:
      -[BKBookViewController recordJumpFromCurrentLocation](self, "recordJumpFromCurrentLocation");
      if (v22)
        -[BKBookViewController setResumeLocation:](self, "setResumeLocation:", v22);
      -[BKBookViewController setSection:animated:adjustScrollToReveal:](self, "setSection:animated:adjustScrollToReveal:", 0, v5, 1);
      -[BKBookViewController setResumeLocation:](self, "setResumeLocation:", 0);
      -[BKBookViewController clearSearchResult](self, "clearSearchResult");
      goto LABEL_13;
    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "urlForDocument:", v8));

  objc_opt_class(BKAnchorLocation);
  if ((objc_opt_isKindOfClass(v22, v14) & 1) != 0)
  {
    v15 = v22;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "anchor"));

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "anchor"));
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "URLByAppendingPathComponent:", v17));

      v13 = (void *)v18;
    }

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[BKExpandedContentResource resourceForURL:](BKExpandedContentResource, "resourceForURL:", v13));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "cacheItem"));
  objc_msgSend(v19, "setCacheItem:", v21);

  -[BKBookViewController _showExpandedContentForResource:atLocation:presentingFromTOC:completion:](self, "_showExpandedContentForResource:atLocation:presentingFromTOC:completion:", v19, v22, 1, 0);
LABEL_13:

}

- (int64_t)directoryContent:(id)a3 pageNumberForLocation:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
  v7 = objc_msgSend(v6, "pageNumberForLocation:", v5);

  return (int64_t)v7;
}

- (id)directoryContent:(id)a3 locationForPageNumber:(int64_t)a4
{
  return -[BKBookViewController pageLocationForPageNumber:](self, "pageLocationForPageNumber:", a4);
}

- (id)_locationForChapter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "href"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLFragmentString"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "href"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByRemovingURLFragment"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController locationForPath:fragment:](self, "locationForPath:fragment:", v8, v6));
  return v9;
}

- (void)tocViewController:(id)a3 didSelectChapter:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v6 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController _locationForChapter:](self, "_locationForChapter:", a4));
  objc_opt_class(BKDirectoryContent);
  v8 = BUDynamicCast(v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  -[BKBookViewController directoryContent:didSelectLocation:](self, "directoryContent:didSelectLocation:", v9, v10);
}

- (id)tocViewController:(id)a3 chapterTitleForAnnotation:(id)a4
{
  return -[BKBookViewController chapterTitleForAnnotation:](self, "chapterTitleForAnnotation:", a4);
}

- (id)directoryContent:(id)a3 pageTitleForPageNumber:(int64_t)a4
{
  return -[BKBookViewController pageTitleForPageNumber:](self, "pageTitleForPageNumber:", a4);
}

- (id)tocViewController:(id)a3 pageTitleForChapter:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
  v7 = objc_msgSend(v6, "pageRangeForChapter:", v5);
  v9 = v8;

  v10 = -[BKBookViewController pageNumberFromRange:](self, "pageNumberFromRange:", v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController pageTitleForPageNumber:](self, "pageTitleForPageNumber:", v10));
  if (!objc_msgSend(v11, "length") && v7 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), v10));
LABEL_6:
    v14 = (void *)v12;

    v11 = v14;
    return v11;
  }
  if (!v11)
  {
    v13 = AEBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("-"), &stru_1C3088, 0));
    goto LABEL_6;
  }
  return v11;
}

- (id)tocViewController:(id)a3 pageTitleForAnnotation:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  void *v11;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
  v7 = objc_msgSend(v6, "pageRangeForAnnotation:", v5);
  v9 = v8;

  v10 = -[BKBookViewController pageNumberFromRange:](self, "pageNumberFromRange:", v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController pageTitleForPageNumber:](self, "pageTitleForPageNumber:", v10));
  if (!v11 && v7 != (id)0x7FFFFFFFFFFFFFFFLL)
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), v10));
  return v11;
}

- (int64_t)tocViewController:(id)a3 pageNumberForAnnotation:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
  v7 = objc_msgSend(v6, "pageRangeForAnnotation:", v5);
  v9 = v8;

  return -[BKBookViewController pageNumberFromRange:](self, "pageNumberFromRange:", v7, v9);
}

- (int64_t)tocViewController:(id)a3 pageNumberForChapter:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
  v7 = objc_msgSend(v6, "pageRangeForChapter:", v5);

  return (int64_t)v7;
}

- (id)tocViewControllerTocIdCssRules:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tocIdCssRules"));

  return v4;
}

- (id)tocViewControllerCurrentLocation:(id)a3
{
  return -[BKBookViewController tocCurrentLocation](self, "tocCurrentLocation", a3);
}

- (id)contentViewControllerForLocation:(id)a3
{
  return 0;
}

- (id)contentViewControllerForAnnotation:(id)a3
{
  return 0;
}

- (void)_contentReady:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  if (-[NSMutableArray containsObject:](self->_contentLoadQueue, "containsObject:"))
  {
    -[NSMutableArray removeObject:](self->_contentLoadQueue, "removeObject:", v5);
    if (-[NSMutableArray count](self->_contentLoadQueue, "count"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_contentLoadQueue, "objectAtIndex:", 0));
      objc_msgSend(v4, "load");

    }
  }

}

- (void)preloadContentController:(id)a3 highPriority:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  unsigned __int8 v8;
  NSMutableArray *contentLoadQueue;
  NSMutableArray *v10;
  NSMutableArray *v11;
  id v12;
  id v13;
  NSMutableArray *v15;
  id v16;
  char *v17;
  id v18;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v18 = v6;
    v8 = objc_msgSend(v6, "isContentLoaded");
    v7 = v18;
    if ((v8 & 1) == 0)
    {
      contentLoadQueue = self->_contentLoadQueue;
      if (!contentLoadQueue)
      {
        v10 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 12);
        v11 = self->_contentLoadQueue;
        self->_contentLoadQueue = v10;

        v7 = v18;
        contentLoadQueue = self->_contentLoadQueue;
      }
      v12 = -[NSMutableArray indexOfObject:](contentLoadQueue, "indexOfObject:", v7);
      if (v12 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        if (v4 && -[NSMutableArray count](self->_contentLoadQueue, "count"))
          -[NSMutableArray insertObject:atIndex:](self->_contentLoadQueue, "insertObject:atIndex:", v18, 1);
        else
          -[NSMutableArray addObject:](self->_contentLoadQueue, "addObject:", v18);
      }
      else
      {
        v13 = v12;
        if ((uint64_t)v12 >= 2 && v4)
        {
          v15 = self->_contentLoadQueue;
          v16 = v18;
          -[NSMutableArray removeObjectAtIndex:](v15, "removeObjectAtIndex:", v13);
          -[NSMutableArray insertObject:atIndex:](self->_contentLoadQueue, "insertObject:atIndex:", v16, 1);

        }
      }
      v17 = (char *)-[NSMutableArray count](self->_contentLoadQueue, "count");
      v7 = v18;
      if (v17 == (_BYTE *)&dword_0 + 1)
      {
        objc_msgSend(v18, "load");
        v7 = v18;
      }
    }
  }

}

- (void)cancelPreloadForContent:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = -[NSMutableArray indexOfObject:](self->_contentLoadQueue, "indexOfObject:", a3);
  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v4;
    -[NSMutableArray removeObjectAtIndex:](self->_contentLoadQueue, "removeObjectAtIndex:", v4);
    if (!v5)
    {
      if (-[NSMutableArray count](self->_contentLoadQueue, "count"))
      {
        v6 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_contentLoadQueue, "objectAtIndex:", 0));
        objc_msgSend(v6, "load");

      }
    }
  }
}

+ (id)valueOfAnnotationProperty:(id)a3 activityType:(id)a4 book:(id)a5
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t ImageWithTemplate;
  void *v33;
  const void *v34;
  void *v36;
  unsigned int v37;
  id v38;
  id v39;

  v6 = a3;
  v38 = a5;
  v7 = objc_alloc((Class)NSSet);
  v39 = objc_msgSend(v7, "initWithObjects:", AEAssetActivityItemProviderPropertyStoreId, AEAssetActivityItemProviderPropertyEpubId, AEAssetActivityItemProviderPropertyTitle, AEAssetActivityItemProviderPropertyAuthor, AEAssetActivityItemProviderPropertyPublisherLocation, AEAssetActivityItemProviderPropertyPublisherName, AEAssetActivityItemProviderPropertyPublisherYear, AEAssetActivityItemProviderPropertyLanguage, AEAssetActivityItemProviderPropertyGenre, AEAssetActivityItemProviderPropertyIsContentProtected, 0);
  if (objc_msgSend(v39, "containsObject:", v6))
  {
    v8 = objc_alloc((Class)NSDictionary);
    v9 = objc_msgSend(v8, "initWithObjectsAndKeys:", CFSTR("storeId"), AEAssetActivityItemProviderPropertyStoreId, CFSTR("bookEpubId"), AEAssetActivityItemProviderPropertyEpubId, CFSTR("bookTitle"), AEAssetActivityItemProviderPropertyTitle, CFSTR("bookAuthor"), AEAssetActivityItemProviderPropertyAuthor, CFSTR("publisherLocation"), AEAssetActivityItemProviderPropertyPublisherLocation, CFSTR("publisherName"), AEAssetActivityItemProviderPropertyPublisherName, CFSTR("publisherYear"), AEAssetActivityItemProviderPropertyPublisherYear, CFSTR("bookLanguage"), AEAssetActivityItemProviderPropertyLanguage, CFSTR("genre"),
           AEAssetActivityItemProviderPropertyGenre,
           CFSTR("isProtected"),
           AEAssetActivityItemProviderPropertyIsContentProtected,
           0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v6));
    v11 = v38;
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "valueForKey:", v10));
LABEL_3:
    v13 = (void *)v12;
LABEL_21:

    goto LABEL_22;
  }
  v11 = v38;
  if (objc_msgSend(v6, "isEqualToString:", AEAssetActivityItemProviderPropertyAssetCover))
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "url"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[AEPluginRegistry sharedInstance](AEPluginRegistry, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pluginForURL:", v9));

    if (!v10
      || (v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "helperForURL:withOptions:", v9, 0)),
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "helperCoverImage")),
          v15,
          !v13))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "pageProgressionDirection"));
      v17 = objc_msgSend(v16, "isEqualToString:", AEHelperStringMetadataPageProgressionRightToLeftValue);

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "bookLanguage"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "coverWritingModeString"));
      v37 = BKGenericBookCoverLayoutFromLanguageAndVerticality(v18, objc_msgSend(v36, "imIsVerticalWritingMode"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v19, "scale");
      v21 = v20;
      v22 = v17;

      v24 = CGSizeScale(v23);
      v26 = v25;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "genericCoverTemplate"));
      v28 = BKGenericBookCoverTemplateNameValid();

      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "shortBookTitle"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "bookAuthor"));
      if (v28)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "genericCoverTemplate"));
        ImageWithTemplate = BKGenericBookCoverCreateImageWithTemplate(v29, v30, v21, v22, v37, v31, v24, v26);
      }
      else
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "databaseKey"));
        ImageWithTemplate = BKGenericBookCoverCreateImageWithItemIDAndLayout(v29, v30, v21, v22, v31, v37, v24, v26);
      }
      v34 = (const void *)ImageWithTemplate;

      if (v34)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", v34));
        CFRelease(v34);
      }
      else
      {
        v13 = 0;
      }

    }
    goto LABEL_21;
  }
  if (objc_msgSend(v6, "isEqualToString:", AEAssetActivityItemProviderPropertyAssetType))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "assetType"));
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", AEAssetActivityItemProviderPropertyStoreUrl))
    {
      if (objc_msgSend(v6, "isEqualToString:", AEAssetActivityItemProviderPropertyStoreShortUrl))
      {
        if (objc_msgSend(v38, "isStoreBook"))
        {
          v9 = (id)objc_claimAutoreleasedReturnValue(+[AEUserPublishing sharedInstance](AEUserPublishing, "sharedInstance"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "storeId"));
          v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "storeShortURLForStoreId:dataSource:", v10, 0));
          goto LABEL_3;
        }
      }
      else
      {
        if (objc_msgSend(v6, "isEqualToString:", AEAssetActivityItemProviderPropertyBookDescription))
        {
          v9 = (id)objc_claimAutoreleasedReturnValue(+[AEAssetEngine libraryMgr](AEAssetEngine, "libraryMgr"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "assetID"));
          v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bookDescriptionForAssetID:", v10));
          goto LABEL_3;
        }
        if (objc_msgSend(v6, "isEqualToString:", AEAssetActivityItemProviderPropertySeriesTitle))
        {
          v9 = (id)objc_claimAutoreleasedReturnValue(+[AEAssetEngine libraryMgr](AEAssetEngine, "libraryMgr"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "assetID"));
          v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "seriesTitleForAssetID:", v10));
          goto LABEL_3;
        }
      }
      v13 = 0;
      goto LABEL_22;
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "storeId"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[AEBookInfo storeURLForBookStoreId:isAudiobook:](AEBookInfo, "storeURLForBookStoreId:isAudiobook:", v33, objc_msgSend(v38, "contentType") == 4));

  }
LABEL_22:

  return v13;
}

+ (id)propertySourceFromBook:(id)a3
{
  id v4;
  void ***v5;
  id v6;
  void **v8;
  uint64_t v9;
  id (*v10)(uint64_t, uint64_t, uint64_t);
  void *v11;
  id v12;
  id v13;

  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_56FD8;
  v11 = &unk_1BFF40;
  v12 = a3;
  v13 = a1;
  v4 = v12;
  v5 = objc_retainBlock(&v8);
  v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11);

  return v6;
}

+ (BOOL)areCitationsAllowedForBook:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;

  v3 = a3;
  if (objc_msgSend(v3, "isProtected")
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(+[AEAssetEngine storeMgr](AEAssetEngine, "storeMgr")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clientApplicationController")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "storeFrontId")),
        v7 = objc_msgSend(v5, "citationAllowedForStoreFrontID:", objc_msgSend(v6, "unsignedLongLongValue")), v6, v5, v4, !v7))
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sampleContent"));
    v9 = objc_msgSend(v8, "BOOLValue") ^ 1;

  }
  return v9;
}

- (BOOL)isSharingSupported
{
  return 1;
}

- (void)shareAnnotation:(id)a3 fromRect:(CGRect)a4 inView:(id)a5 completion:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  id v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a6;
  v14 = a5;
  v15 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", a3));
  -[BKBookViewController shareAnnotations:fromRect:inView:excerpt:completion:](self, "shareAnnotations:fromRect:inView:excerpt:completion:", v15, v14, 1, v13, x, y, width, height);

}

- (void)shareAnnotations:(id)a3 fromBarButtonItem:(id)a4 excerpt:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  BOOL v18;

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_5724C;
  v14[3] = &unk_1BFFB8;
  v14[4] = self;
  v15 = a3;
  v18 = a5;
  v16 = a4;
  v17 = a6;
  v10 = v16;
  v11 = v17;
  v12 = v15;
  v13 = objc_retainBlock(v14);
  -[BKViewController dismissCurrentPopoverWithCompletion:](self, "dismissCurrentPopoverWithCompletion:", v13);

}

- (void)shareAnnotations:(id)a3 fromRect:(CGRect)a4 inView:(id)a5 excerpt:(BOOL)a6 completion:(id)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  BOOL v28;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v15 = a3;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_57964;
  v20[3] = &unk_1BFFE0;
  v20[4] = self;
  v21 = a5;
  v24 = x;
  v25 = y;
  v26 = width;
  v27 = height;
  v28 = a6;
  v22 = v15;
  v23 = a7;
  v16 = v23;
  v17 = v15;
  v18 = v21;
  v19 = objc_retainBlock(v20);
  -[BKViewController dismissCurrentPopoverWithCompletion:](self, "dismissCurrentPopoverWithCompletion:", v19);

}

- (void)expandAnnotation:(id)a3 location:(id)a4 selectedText:(id)a5 representativeText:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  if (a4)
  {
    v10 = a6;
    v11 = a5;
    v12 = a4;
    v13 = a3;
    v14 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    objc_msgSend(v14, "expandAnnotation:location:selectedText:representativeText:", v13, v12, v11, v10);

  }
}

- (id)addAnnotation:(int)a3 location:(id)a4 selectedText:(id)a5 representativeText:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  if (a4)
  {
    v8 = *(_QWORD *)&a3;
    v10 = a6;
    v11 = a5;
    v12 = a4;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "addAnnotation:location:selectedText:representativeText:", v8, v12, v11, v10));

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (void)contentViewController:(id)a3 showHighlightingMenuForAnnotation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21[2];
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController theme](self, "theme"));
  v9 = objc_msgSend(v8, "annotationPageTheme");

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationTheme themeForAnnotationStyle:pageTheme:isUnderline:](AEAnnotationTheme, "themeForAnnotationStyle:pageTheme:isUnderline:", objc_msgSend(v7, "annotationStyle"), v9, objc_msgSend(v7, "annotationIsUnderline")));
  objc_initWeak(&location, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_58348;
  v17[3] = &unk_1C0008;
  objc_copyWeak(v21, &location);
  v11 = v6;
  v18 = v11;
  v12 = v10;
  v19 = v12;
  v21[1] = v9;
  v13 = v7;
  v20 = v13;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_584B4;
  v15[3] = &unk_1C0030;
  v14 = objc_retainBlock(v17);
  v16 = v14;
  objc_msgSend(v11, "rectForAnnotation:withCompletion:", v13, v15);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);

}

- (void)contentViewController:(id)a3 shareAnnotation:(id)a4 annotationRects:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  id v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "firstObject"));
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "rectValue");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
    -[BKBookViewController shareAnnotation:fromRect:inView:completion:](self, "shareAnnotation:fromRect:inView:completion:", v11, v23, v12, v16, v18, v20, v22);
LABEL_5:

    goto LABEL_6;
  }
  if (objc_msgSend(v11, "conformsToProtocol:", &OBJC_PROTOCOL___BKBookmark))
  {
    v24 = v11;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "location"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_58648;
    v26[3] = &unk_1C0058;
    v26[4] = self;
    v27 = v24;
    v28 = v10;
    v29 = v12;
    v23 = v24;
    objc_msgSend(v28, "visibleRectForLocation:completion:", v25, v26);

    goto LABEL_5;
  }
LABEL_6:

}

- (id)_readPlayer
{
  IMAVPlayer *readPlayer;
  IMAVPlayer *v4;
  IMAVPlayer *v5;
  void *v6;
  void *v7;

  readPlayer = self->_readPlayer;
  if (!readPlayer)
  {
    v4 = (IMAVPlayer *)objc_alloc_init((Class)IMAVPlayer);
    v5 = self->_readPlayer;
    self->_readPlayer = v4;

    -[IMAVPlayer setUsesExternalPlaybackWhileExternalScreenIsActive:](self->_readPlayer, "setUsesExternalPlaybackWhileExternalScreenIsActive:", 0);
    -[IMAVPlayer setDelegate:](self->_readPlayer, "setDelegate:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("AudioVolume")));

    if (v7)
    {
      objc_msgSend(v7, "floatValue");
      -[IMAVPlayer setVolume:](self->_readPlayer, "setVolume:");
    }

    readPlayer = self->_readPlayer;
  }
  return readPlayer;
}

- (id)_trackPlayer
{
  IMAVPlayer *trackPlayer;
  IMAVPlayer *v4;
  IMAVPlayer *v5;
  void *v6;
  void *v7;

  trackPlayer = self->_trackPlayer;
  if (!trackPlayer)
  {
    v4 = (IMAVPlayer *)objc_alloc_init((Class)IMAVPlayer);
    v5 = self->_trackPlayer;
    self->_trackPlayer = v4;

    -[IMAVPlayer setUsesExternalPlaybackWhileExternalScreenIsActive:](self->_trackPlayer, "setUsesExternalPlaybackWhileExternalScreenIsActive:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("AudioVolume")));

    if (v7)
    {
      objc_msgSend(v7, "floatValue");
      -[IMAVPlayer setVolume:](self->_trackPlayer, "setVolume:");
    }

    trackPlayer = self->_trackPlayer;
  }
  return trackPlayer;
}

- (BOOL)isReading
{
  return -[BKBookViewController readAloudState](self, "readAloudState") != -1 && self->_isReading;
}

- (BOOL)canTurnPagesAutomatically
{
  return -[BKBookViewController readAloudState](self, "readAloudState") >= 0;
}

- (BOOL)hasSoundtrack
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController currentSoundtrack](self, "currentSoundtrack"));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isSoundtrackPlaying
{
  _BOOL4 v3;

  v3 = -[BKBookViewController hasSoundtrack](self, "hasSoundtrack");
  if (v3)
    LOBYTE(v3) = self->_isPlayingSoundTrack;
  return v3;
}

- (BOOL)canTurnPagesAutomaticallyForToolbarItem:(id)a3
{
  return -[BKBookViewController canTurnPagesAutomatically](self, "canTurnPagesAutomatically", a3);
}

- (BOOL)isSoundtrackPlayingForToolbarItem:(id)a3
{
  return -[BKBookViewController isSoundtrackPlaying](self, "isSoundtrackPlaying", a3);
}

- (void)setReadAloudState:(BOOL)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  void *v9;

  if (self->_isReading != a3)
  {
    if (a3)
    {
      self->_isReading = 1;
      -[BKBookViewController startReadAloud](self, "startReadAloud");
      -[BKBookViewController dismissCurrentPopover](self, "dismissCurrentPopover");
      if (!-[BKBookViewController bkaxNeedsPersistentControls](self, "bkaxNeedsPersistentControls"))
        -[BKBookViewController hidePageControls:](self, "hidePageControls:", 0);
    }
    else
    {
      -[BKBookViewController stopReadAloud](self, "stopReadAloud");
      -[BKBookViewController _nextPageHint:](self, "_nextPageHint:", 0);
      self->_isReading = 0;
      v4 = -[BKBookViewController currentPages](self, "currentPages");
      v6 = v5;
      v7 = -[BKBookViewController pageNumberFromRange:](self, "pageNumberFromRange:", v4, v5);
      if (v6)
      {
        v8 = v7;
        do
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentViewControllerForPageNumber:](self, "contentViewControllerForPageNumber:", v8));
          -[BKBookViewController _removeClickHandlers:](self, "_removeClickHandlers:", v9);
          -[BKBookViewController _cleanDocumentElementForMediaOverlay:](self, "_cleanDocumentElementForMediaOverlay:", v9);

          ++v8;
          --v6;
        }
        while (v6);
      }
    }
    -[BKBookViewController updateToolbarController](self, "updateToolbarController");
    -[BKBookViewController updateTouchBarController](self, "updateTouchBarController");
  }
}

- (int)readAloudState
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v4 = objc_msgSend(v3, "hasMediaOverlayElements");

  if (v4)
    return self->_isReading;
  else
    return -1;
}

- (void)setTrackState:(BOOL)a3
{
  -[BKBookViewController setTrackState:persistSetting:](self, "setTrackState:persistSetting:", a3, 1);
}

- (void)setTrackState:(BOOL)a3 persistSetting:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;

  v4 = a4;
  if (a3)
  {
    self->_isPlayingSoundTrack = 1;
    -[BKBookViewController playCurrentSoundtrack](self, "playCurrentSoundtrack");
    if (!v4)
      goto LABEL_6;
    goto LABEL_5;
  }
  -[BKBookViewController stopSoundtrack](self, "stopSoundtrack");
  self->_isPlayingSoundTrack = 0;
  if (v4)
  {
LABEL_5:
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isPlayingSoundTrack));
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("soundtrackState"));

  }
LABEL_6:
  -[BKBookViewController updateToolbarController](self, "updateToolbarController");
}

- (int)trackState
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController currentSoundtrack](self, "currentSoundtrack"));

  if (v3)
    return self->_isPlayingSoundTrack;
  else
    return -1;
}

- (void)setTurnState:(BOOL)a3
{
  void *v4;
  void *v5;

  self->_autoTurn = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_autoTurn));
  objc_msgSend(v4, "setObject:forKey:", v5, BKReadAloudAutoPageTurn[0]);

  -[BKBookViewController updateToolbarController](self, "updateToolbarController");
}

- (BOOL)turnState
{
  return self->_autoTurn;
}

- (void)setVolume:(float)a3
{
  double v5;
  double v6;
  void *v7;
  id v8;

  -[IMAVPlayer setVolume:](self->_readPlayer, "setVolume:");
  *(float *)&v5 = a3;
  -[IMAVPlayer setVolume:](self->_trackPlayer, "setVolume:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  *(float *)&v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6));
  objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("AudioVolume"));

}

- (float)volume
{
  void *v2;
  float v3;
  float v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController _readPlayer](self, "_readPlayer"));
  objc_msgSend(v2, "volume");
  v4 = v3;

  return v4;
}

- (void)dismissPopover
{
  -[BKBookViewController dismissCurrentPopoverAnimated:](self, "dismissCurrentPopoverAnimated:", 1);
}

- (void)dismissCurrentPopover
{
  -[BKBookViewController dismissCurrentPopoverAnimated:](self, "dismissCurrentPopoverAnimated:", 1);
}

- (void)dismissCurrentPopoverAnimated:(BOOL)a3
{
  _BOOL8 v3;
  IMViewController *v5;
  IMViewController *appearanceContainerViewController;
  objc_super v7;

  v3 = a3;
  if (self->_appearanceContainerViewController)
  {
    v5 = (IMViewController *)objc_claimAutoreleasedReturnValue(-[BKBookViewController presentedViewController](self, "presentedViewController"));
    appearanceContainerViewController = self->_appearanceContainerViewController;

    if (v5 == appearanceContainerViewController)
      -[BKBookViewController handleAppearanceViewControllerDismissal](self, "handleAppearanceViewControllerDismissal");
  }
  -[BKBookViewController setActivityViewController:](self, "setActivityViewController:", 0);
  -[BKBookViewController _cleanupFootnoteViewController](self, "_cleanupFootnoteViewController");
  v7.receiver = self;
  v7.super_class = (Class)BKBookViewController;
  -[BKViewController dismissCurrentPopoverAnimated:](&v7, "dismissCurrentPopoverAnimated:", v3);
}

- (void)playerStateChanged:(id)a3
{
  if (self->_readPlayer == a3)
    -[BKBookViewController updateTouchBarController](self, "updateTouchBarController");
}

- (void)playerCurrentItemEnded:(id)a3
{
  IMAVPlayer *v4;
  NSDictionary *currentMapItem;
  void *v6;
  NSDictionary *v7;
  unint64_t currentMapIndex;
  void *v9;
  void *v10;
  id v11;
  unint64_t v12;
  id v13;
  unint64_t v14;
  unint64_t previousReadingOrdinal;
  void *v16;
  IMAVPlayer *v17;

  v4 = (IMAVPlayer *)a3;
  if (self->_readPlayer == v4)
  {
    v17 = v4;
    currentMapItem = self->_currentMapItem;
    if (currentMapItem)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary valueForKey:](currentMapItem, "valueForKey:", CFSTR("smil")));
      -[BKBookViewController _removeHighlightOnElement:](self, "_removeHighlightOnElement:", v6);
      v7 = self->_currentMapItem;
      self->_currentMapItem = 0;

    }
    currentMapIndex = self->_currentMapIndex;
    if (currentMapIndex >= -[NSArray count](self->_smilMap, "count"))
    {
      v9 = (void *)(self->_pagesForMap.location + self->_pagesForMap.length - 1);
      if (v9 == (void *)-[BKBookViewController pageCountIncludingUpsell](self, "pageCountIncludingUpsell"))
      {
        -[BKBookViewController setReadAloudState:](self, "setReadAloudState:", 0);
        goto LABEL_8;
      }
      ++self->_currentMapIndex;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController performSelectorProxy](self, "performSelectorProxy"));
      +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", v10, "_playNextItem", 0);

      v11 = -[BKBookViewController currentPages](self, "currentPages");
      if (self->_autoTurn)
      {
        v13 = v11;
        v14 = v12;
        if (!-[BKBookViewController _isFocusedOnSecondPageOfSpread](self, "_isFocusedOnSecondPageOfSpread"))
        {
          previousReadingOrdinal = self->_previousReadingOrdinal;
          if ((id)(previousReadingOrdinal + 1) == v13 && v14 >= 2)
          {
            -[BKBookViewController _focusOnPage:](self, "_focusOnPage:", previousReadingOrdinal + 2);
            -[BKBookViewController clearSelection](self, "clearSelection");
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController performSelectorProxy](self, "performSelectorProxy"));
            objc_msgSend(v16, "performSelector:withObject:afterDelay:", "_playNextItem", 0, 3.0);

            goto LABEL_8;
          }
        }
      }
    }
    -[BKBookViewController _playNextItem](self, "_playNextItem");
LABEL_8:
    v4 = v17;
  }

}

- (void)player:(id)a3 callbackForTime:(double)a4
{
  id v6;
  id v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  BKBookViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  unsigned int v21;
  void *v22;
  signed int v23;
  id v24;
  NSArray *obj;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v24 = a3;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = self->_smilMap;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v6)
  {
    v7 = v6;
    v26 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v26)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKey:", CFSTR("smil")));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "audioHref"));

        if (v11)
        {
          v12 = self;
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "basePlusContentPath"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "audioHref"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingPathComponent:", v15));

          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v16, 0));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "audioStart"));
          objc_msgSend(v18, "doubleValue");
          if (vabdd_f64(v19, a4) >= 0.001)
          {

          }
          else
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "assetURL"));
            v21 = objc_msgSend(v17, "isEqual:", v20);

            if (v21)
            {
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKey:", CFSTR("ordinal")));
              v23 = objc_msgSend(v22, "intValue");

              if (v12->_previousReadingOrdinal != v23)
              {
                v12->_previousReadingOrdinal = v23;
                -[BKBookViewController _focusOnPage:](v12, "_focusOnPage:", v23 + 1);
                -[BKBookViewController clearSelection](v12, "clearSelection");
              }
              -[BKBookViewController _highlightElement:](v12, "_highlightElement:", v10);

              goto LABEL_18;
            }
          }

          self = v12;
        }

      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_18:

}

- (void)startReadAloud
{
  -[BKBookViewController _startReadAloud:](self, "_startReadAloud:", 0);
}

- (BOOL)isReadAloudPaused
{
  void *v2;
  BOOL v3;

  if (!self->_isReading)
    return 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController _readPlayer](self, "_readPlayer"));
  v3 = objc_msgSend(v2, "state") == 3;

  return v3;
}

- (void)_startReadAloud:(BOOL)a3
{
  char v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  if (a3 && -[BKBookViewController isReadAloudPaused](self, "isReadAloudPaused"))
  {
    v4 = 1;
  }
  else
  {
    -[BKBookViewController stopReadAloud](self, "stopReadAloud");
    v4 = 0;
  }
  v5 = -[BKBookViewController currentPages](self, "currentPages");
  v7 = v6;
  v8 = -[BKBookViewController pageNumberFromRange:](self, "pageNumberFromRange:", v5, v6);
  if (v7)
  {
    v9 = v8;
    v10 = v7;
    do
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentViewControllerForPageNumber:](self, "contentViewControllerForPageNumber:", v9));
      -[BKBookViewController _installClickHandlers:](self, "_installClickHandlers:", v11);
      -[BKBookViewController _markupDocumentElementForMediaOverlay:](self, "_markupDocumentElementForMediaOverlay:", v11);

      ++v9;
      --v10;
    }
    while (v10);
  }
  if ((v4 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController _readPlayer](self, "_readPlayer"));
    objc_msgSend(v12, "play");
  }
  else
  {
    if (!self->_autoTurn
      || !-[BKBookViewController _isPageEmpty:](self, "_isPageEmpty:", v5, v7)
      && !-[BKBookViewController _isPageAllZeros:](self, "_isPageAllZeros:", v5, v7))
    {
      -[BKBookViewController readPages:from:to:waitOnEmpty:](self, "readPages:from:to:waitOnEmpty:", v5, v7, -[BKBookViewController _itemIndexForCurrentPage](self, "_itemIndexForCurrentPage"), -1, 0);
      goto LABEL_16;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
    -[BKBookViewController readNextPages:](self, "readNextPages:", v12);
  }

LABEL_16:
  self->_isAutoTurning = 1;
  v13 = (id)objc_claimAutoreleasedReturnValue(+[BCAudioMuxingCoordinator sharedInstance](BCAudioMuxingCoordinator, "sharedInstance"));
  objc_msgSend(v13, "notifyPlaybackWillStart:", self);

}

- (void)stopReadAloud
{
  -[BKBookViewController stopReadAloudAndReload:](self, "stopReadAloudAndReload:", 0);
}

- (void)stopReadAloudAndReload:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  NSArray *smilMap;
  NSDictionary *currentMapItem;
  id v9;

  v3 = a3;
  -[BKBookViewController pauseReadAloud](self, "pauseReadAloud");
  -[IMAVPlayer setCurrentTime:](self->_readPlayer, "setCurrentTime:", 0.0);
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMAVPlayer assetURL](self->_readPlayer, "assetURL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AVAsset assetWithURL:](AVAsset, "assetWithURL:", v5));
    -[IMAVPlayer setAsset:](self->_readPlayer, "setAsset:", v6);

  }
  smilMap = self->_smilMap;
  self->_smilMap = 0;

  currentMapItem = self->_currentMapItem;
  self->_currentMapItem = 0;

  self->_currentMapIndex = -1;
  self->_maxMapIndex = -1;
  self->_previousReadingOrdinal = -1;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_nextDelayedPageHint:", v9);

}

- (void)pauseReadAloud
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (self->_isReading && !-[BKBookViewController isReadAloudPaused](self, "isReadAloudPaused"))
  {
    -[IMAVPlayer pause](self->_readPlayer, "pause");
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = self->_smilMap;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "valueForKey:", CFSTR("smil"), (_QWORD)v11));
          -[BKBookViewController _removeHighlightOnElement:](self, "_removeHighlightOnElement:", v8);

        }
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v5);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController performSelectorProxy](self, "performSelectorProxy"));
    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", v9, "readNextPages:", 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController performSelectorProxy](self, "performSelectorProxy"));
    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", v10, "_playNextItem", 0);

    self->_isAutoTurning = 0;
    +[IMSleepManager stopSleepTimer](IMSleepManager, "stopSleepTimer");
  }
}

- (void)resumeReadAloud
{
  id v3;

  if (self->_playNextItemAbortedWhileInactive)
  {
    self->_playNextItemAbortedWhileInactive = 0;
    v3 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController performSelectorProxy](self, "performSelectorProxy"));
    objc_msgSend(v3, "performSelector:withObject:afterDelay:", "_playNextItem", 0, 1.0);

  }
  else if (-[BKBookViewController isReadAloudPaused](self, "isReadAloudPaused"))
  {
    if (self->_smilMap)
      -[BKBookViewController _startReadAloud:](self, "_startReadAloud:", 1);
  }
}

- (void)_playNextItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  char *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  unint64_t currentMapIndex;
  int64_t maxMapIndex;
  unint64_t v14;
  BOOL v15;
  unint64_t v16;
  void *v17;
  NSDictionary *v18;
  NSDictionary *currentMapItem;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  unint64_t v27;
  void *v28;
  NSDictionary *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  NSDictionary *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  id v46;
  id v47;

  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_nextDelayedPageHint:", &__kCFBooleanTrue);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController performSelectorProxy](self, "performSelectorProxy"));
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", v3, "readNextPages:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController viewIfLoaded](self, "viewIfLoaded"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "windowScene"));
  v7 = objc_msgSend(v6, "activationState");

  if (v7)
  {
    self->_playNextItemAbortedWhileInactive = 1;
  }
  else
  {
    self->_playNextItemAbortedWhileInactive = 0;
    v8 = (char *)-[BKBookViewController currentPages](self, "currentPages");
    v10 = v9;
    if (-[BKBookViewController _isPageEmpty:](self, "_isPageEmpty:", v8, v9)
      || -[BKBookViewController _isPageAllZeros:](self, "_isPageAllZeros:", v8, v10))
    {
      if (&v8[v10 - 1] == (char *)-[BKBookViewController pageCountIncludingUpsell](self, "pageCountIncludingUpsell"))
      {
        -[BKBookViewController setReadAloudState:](self, "setReadAloudState:", 0);
      }
      else if (self->_isAutoTurning || self->_autoTurn || v10 == 1)
      {
        if (self->_autoTurn)
        {
          if (!-[BKBookViewController _isFocusedOnSecondPageOfSpread](self, "_isFocusedOnSecondPageOfSpread")
            && v10 != 1)
          {
            -[BKBookViewController _focusOnPage:](self, "_focusOnPage:", (char *)-[BKBookViewController pageNumberFromRange:](self, "pageNumberFromRange:", v8, v10) + 1);
          }
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController performSelectorProxy](self, "performSelectorProxy"));
          objc_msgSend(v11, "performSelector:withObject:afterDelay:", "readNextPages:", 0, 3.0);

        }
        else
        {
          -[BKBookViewController _nextPageHint:](self, "_nextPageHint:", 1);
        }
        self->_isAutoTurning = 0;
      }
      else
      {
        -[BKBookViewController stopReadAloud](self, "stopReadAloud");
        -[BKBookViewController _nextPageHint:afterDelay:](self, "_nextPageHint:afterDelay:", 1, 1.0);
      }
    }
    else
    {
      currentMapIndex = self->_currentMapIndex;
      if (currentMapIndex >= -[NSArray count](self->_smilMap, "count"))
      {
        v14 = self->_previousReadingOrdinal + 1;
        v15 = v14 >= (unint64_t)v8;
        v16 = v14 - (_QWORD)v8;
        if (v15 && v16 < v10)
        {
          self->_isAutoTurning = 0;
          if (self->_autoTurn)
          {
            v46 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
            -[BKBookViewController readNextPages:](self, "readNextPages:", v46);

          }
          else
          {
            -[BKBookViewController stopReadAloud](self, "stopReadAloud");
            -[BKBookViewController _nextPageHint:](self, "_nextPageHint:", 1);
          }
        }
      }
      else
      {
        maxMapIndex = self->_maxMapIndex;
        if (maxMapIndex < 0 || self->_currentMapIndex <= maxMapIndex)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController _readPlayer](self, "_readPlayer"));
          objc_msgSend(v17, "removeAllTimeObservers");
          v18 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_smilMap, "objectAtIndex:", self->_currentMapIndex));
          currentMapItem = self->_currentMapItem;
          self->_currentMapItem = v18;

          ++self->_currentMapIndex;
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_currentMapItem, "objectForKey:", CFSTR("smil")));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "audioStart"));
          objc_msgSend(v21, "doubleValue");
          v23 = v22;

          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "audioEnd"));
          objc_msgSend(v24, "doubleValue");
          v26 = v25;

          objc_msgSend(v17, "addTimeObserver:", v23);
          v27 = self->_currentMapIndex;
          v47 = v20;
          if (v27 < -[NSArray count](self->_smilMap, "count"))
          {
            while (1)
            {
              v28 = v17;
              v29 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_smilMap, "objectAtIndex:", v27));
              v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v29, "objectForKey:", CFSTR("smil")));
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "audioStart"));
              objc_msgSend(v31, "doubleValue");
              v33 = v32;

              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "audioHref"));
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "audioHref"));
              if (!objc_msgSend(v34, "isEqualToString:", v35))
                break;

              if (vabdd_f64(v33, v26) >= 2.0)
                goto LABEL_35;
              v17 = v28;
              objc_msgSend(v28, "addTimeObserver:", v33);
              v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "audioEnd"));
              objc_msgSend(v36, "doubleValue");
              v26 = v37;

              v38 = self->_currentMapItem;
              self->_currentMapItem = v29;

              ++self->_currentMapIndex;
              if (++v27 >= -[NSArray count](self->_smilMap, "count"))
                goto LABEL_36;
            }

LABEL_35:
            v17 = v28;
          }
LABEL_36:
          objc_msgSend(v17, "addTimeObserver:", v26);
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "audioHref"));

          if (v39)
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "basePlusContentPath"));
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "audioHref"));
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "stringByAppendingPathComponent:", v42));

            if (v43)
            {
              v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v43, 0));
              objc_msgSend(v17, "setAssetURL:", v44);

              if (v23 == v26)
              {
                -[BKBookViewController _playNextItem](self, "_playNextItem");
              }
              else
              {
                objc_msgSend(v17, "setEndTime:", v26);
                if (!objc_msgSend(v17, "isPlaying")
                  || (objc_msgSend(v17, "currentTime"), vabdd_f64(v23, v45) >= 2.0))
                {
                  objc_msgSend(v17, "playFrom:", v23);
                }
              }
            }

          }
        }
        else
        {
          -[BKBookViewController stopReadAloud](self, "stopReadAloud");
        }
        self->_isAutoTurning = 0;
      }
    }
  }
}

- (void)readNextPages:(id)a3
{
  unsigned __int8 v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v11;
  int64_t v12;
  BOOL v13;
  char *v14;

  v4 = objc_msgSend(a3, "BOOLValue");
  v5 = -[BKBookViewController currentPages](self, "currentPages");
  v7 = v6;
  if (-[BKBookViewController _isManualCurlInProgress](self, "_isManualCurlInProgress")
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentMode")),
        v10 = objc_msgSend(v9, "isEqualToString:", UITrackingRunLoopMode),
        v9,
        v8,
        (v10 & 1) != 0))
  {
    -[BKBookViewController stopReadAloud](self, "stopReadAloud");
  }
  else
  {
    v11 = (uint64_t)v5 + v7;
    v12 = -[BKBookViewController pageCountIncludingUpsell](self, "pageCountIncludingUpsell");
    if ((v4 & 1) != 0)
    {
      if (v11 <= v12)
      {
        while (-[BKBookViewController _isPageEmpty:](self, "_isPageEmpty:", v11, 1))
        {
          v13 = v11++ < -[BKBookViewController pageCountIncludingUpsell](self, "pageCountIncludingUpsell");
          if (!v13)
            return;
        }
        -[BKBookViewController turnToPageNumber:animated:](self, "turnToPageNumber:animated:", v11, 1);
        self->_isAutoTurning = 1;
      }
    }
    else
    {
      if (v11 <= v12)
      {
        while (-[BKBookViewController _isPageAllZeros:](self, "_isPageAllZeros:", v11, 1))
        {
          v14 = (char *)(v11 + 1);
          v13 = v11++ < -[BKBookViewController pageCountIncludingUpsell](self, "pageCountIncludingUpsell");
          if (!v13)
            goto LABEL_13;
        }
      }
      v14 = (char *)v11;
LABEL_13:
      if (-[BKBookViewController _isPageEmpty:](self, "_isPageEmpty:", v14, 1))
        -[BKBookViewController stopReadAloud](self, "stopReadAloud");
      -[BKBookViewController turnToPageNumber:animated:](self, "turnToPageNumber:animated:", v14, 1);
      self->_isAutoTurning = 1;
      if (v14 == (char *)-[BKBookViewController upsellOrdinal](self, "upsellOrdinal") + 1)
        -[BKBookViewController setReadAloudState:](self, "setReadAloudState:", 0);
    }
  }
}

- (void)contentView:(id)a3 didSelectMediaOverlayElement:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  BKBookViewController *v23;
  void *v24;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v5 = a4;
  v22 = -[BKBookViewController currentPages](self, "currentPages");
  v23 = self;
  v21 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController smilMapOnPages:](self, "smilMapOnPages:"));
  v24 = v5;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "elementId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "documentHref"));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForKey:", CFSTR("smil")));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "documentHref"));
        if ((objc_msgSend(v15, "isEqualToString:", v8) & 1) != 0)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "elementId"));
          v17 = objc_msgSend(v16, "isEqualToString:", v25);

          if (v17)
          {
            v18 = objc_msgSend(obj, "indexOfObject:", v13);
            v19 = v18;
            if ((v23->_currentMapIndex & 0x8000000000000000) == 0 && v23->_maxMapIndex < 0)
            {
              v20 = -1;
            }
            else if (v23->_autoTurn)
            {
              v20 = -1;
            }
            else
            {
              v20 = (uint64_t)v18;
            }
            -[BKBookViewController stopReadAloud](v23, "stopReadAloud");
            -[BKBookViewController _nextPageHint:](v23, "_nextPageHint:", 0);
            if (!-[BKBookViewController bkaxNeedsPersistentControls](v23, "bkaxNeedsPersistentControls"))
              -[BKBookViewController hidePageControls:](v23, "hidePageControls:", 0);
            -[BKBookViewController readPages:from:to:waitOnEmpty:](v23, "readPages:from:to:waitOnEmpty:", v22, v21, v19, v20, 0);

            goto LABEL_22;
          }
        }
        else
        {

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_22:

}

- (void)readPages:(_NSRange)a3 from:(int64_t)a4 to:(int64_t)a5 waitOnEmpty:(BOOL)a6
{
  _BOOL4 v6;
  NSUInteger length;
  NSUInteger location;
  NSDictionary *currentMapItem;
  NSArray *v11;
  NSArray *smilMap;
  double v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  if (self->_isReading)
  {
    v6 = a6;
    length = a3.length;
    location = a3.location;
    self->_currentMapIndex = a4;
    self->_maxMapIndex = a5;
    currentMapItem = self->_currentMapItem;
    self->_currentMapItem = 0;

    v11 = (NSArray *)objc_claimAutoreleasedReturnValue(-[BKBookViewController smilMapOnPages:](self, "smilMapOnPages:", location, length));
    smilMap = self->_smilMap;
    self->_smilMap = v11;

    if (v6)
      v13 = 0.5;
    else
      v13 = 0.0;
    if (!length)
      goto LABEL_20;
    if (length == 1)
    {
      v14 = 0;
      if (!v6)
      {
LABEL_18:
        if (length == 1)
          -[BKBookViewController pauseReadAloud](self, "pauseReadAloud");
LABEL_20:
        +[IMSleepManager startSleepTimer](IMSleepManager, "startSleepTimer");
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController performSelectorProxy](self, "performSelectorProxy"));
        +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", v17, "_playNextItem", 0);

        if (v13 == 0.0)
        {
          -[BKBookViewController _playNextItem](self, "_playNextItem");
        }
        else
        {
          v18 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController performSelectorProxy](self, "performSelectorProxy"));
          objc_msgSend(v18, "performSelector:withObject:afterDelay:", "_playNextItem", 0, v13);

        }
        return;
      }
    }
    else
    {
      v14 = -[BKBookViewController _isFocusedOnSecondPageOfSpread](self, "_isFocusedOnSecondPageOfSpread");
      if (!v6)
        goto LABEL_18;
    }
    if ((v14 & 1) == 0)
    {
      if (-[NSArray count](self->_smilMap, "count"))
      {
        if (self->_autoTurn)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_smilMap, "objectAtIndex:", 0));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("ordinal")));
          if (location - 1 != (int)objc_msgSend(v16, "intValue"))
            v13 = 3.0;

        }
      }
      else
      {
        v13 = 3.0;
      }
    }
    goto LABEL_18;
  }
}

- (id)smilMapOnPages:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  _NSRange *p_pagesForMap;
  BOOL v7;
  NSArray *v8;

  length = a3.length;
  location = a3.location;
  p_pagesForMap = &self->_pagesForMap;
  v7 = a3.location == self->_pagesForMap.location && a3.length == self->_pagesForMap.length;
  if (!v7 || (v8 = self->_smilMap) == 0)
  {
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue(-[BKBookViewController _prepareSmilMapOn:](self, "_prepareSmilMapOn:", location, length));
    p_pagesForMap->location = location;
    p_pagesForMap->length = length;
  }
  return v8;
}

- (id)contentViewControllerForMediaOverlayElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentViewControllers](self, "contentViewControllers", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "document"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "href"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "documentHref"));
        v14 = objc_msgSend(v12, "isEqualToString:", v13);

        if (v14)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)_removeHighlightOnElement:(id)a3
{
  id v4;
  BKMediaOverlayElement *highlightedElement;
  id v6;

  if (self->_highlightedElement == a3)
  {
    v4 = a3;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentViewControllerForMediaOverlayElement:](self, "contentViewControllerForMediaOverlayElement:", v4));
    objc_msgSend(v6, "clearMediaOverlayElement:", v4);

    highlightedElement = self->_highlightedElement;
    self->_highlightedElement = 0;

  }
}

- (void)_highlightElement:(id)a3
{
  BKMediaOverlayElement *v4;
  BKMediaOverlayElement *highlightedElement;
  BKMediaOverlayElement *v6;
  id v7;

  v4 = (BKMediaOverlayElement *)a3;
  -[BKBookViewController _removeHighlightOnElement:](self, "_removeHighlightOnElement:", self->_highlightedElement);
  highlightedElement = self->_highlightedElement;
  self->_highlightedElement = v4;
  v6 = v4;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentViewControllerForMediaOverlayElement:](self, "contentViewControllerForMediaOverlayElement:", v6));
  objc_msgSend(v7, "highlightMediaOverlayElement:", v6);

}

- (unint64_t)_itemIndexForCurrentPage
{
  return 0;
}

- (BOOL)_isPageEmpty:(_NSRange)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController smilMapOnPages:](self, "smilMapOnPages:", a3.location, a3.length));
  v4 = objc_msgSend(v3, "count") == 0;

  return v4;
}

- (BOOL)_isPageAllZeros:(_NSRange)a3
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController smilMapOnPages:](self, "smilMapOnPages:", a3.location, a3.length));
  if (objc_msgSend(v3, "count"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v4);
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "objectForKey:", CFSTR("smil"), (_QWORD)v15));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "audioStart"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "audioEnd"));
          v12 = objc_msgSend(v10, "isEqualToNumber:", v11);

          if (!v12)
          {
            v13 = 0;
            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v6)
          continue;
        break;
      }
    }
    v13 = 1;
LABEL_12:

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_prepareSmilMapOn:(_NSRange)a3
{
  return 0;
}

- (void)_nextDelayedPageHint:(id)a3
{
  -[BKBookViewController _nextPageHint:](self, "_nextPageHint:", objc_msgSend(a3, "BOOLValue"));
}

- (void)_nextPageHint:(BOOL)a3 afterDelay:(double)a4
{
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  -[BKBookViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_nextDelayedPageHint:", v6, a4);

}

- (BOOL)_isManualCurlInProgress
{
  return 0;
}

- (BOOL)_isFocusedOnSecondPageOfSpread
{
  return 0;
}

- (void)playCurrentSoundtrack
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (self->_isPlayingSoundTrack)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController currentSoundtrack](self, "currentSoundtrack"));
    if (v10)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "basePlusContentPath"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", v10));

      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByStandardizingPath"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v6, 0));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController _trackPlayer](self, "_trackPlayer"));
      objc_msgSend(v8, "setAssetURL:", v7);

      -[IMAVPlayer setLoops:](self->_trackPlayer, "setLoops:", 0xFFFFFFFFLL);
      -[IMAVPlayer play](self->_trackPlayer, "play");
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[BCAudioMuxingCoordinator sharedInstance](BCAudioMuxingCoordinator, "sharedInstance"));
      objc_msgSend(v9, "notifyPlaybackWillStart:", self);

    }
    else
    {
      -[BKBookViewController stopSoundtrack](self, "stopSoundtrack");
    }

  }
}

- (void)stopSoundtrack
{
  -[BKBookViewController stopSoundtrackAndReload:](self, "stopSoundtrackAndReload:", 0);
}

- (void)stopSoundtrackAndReload:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[IMAVPlayer pause](self->_trackPlayer, "pause");
  if (v3)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[IMAVPlayer assetURL](self->_trackPlayer, "assetURL"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[AVAsset assetWithURL:](AVAsset, "assetWithURL:", v6));
    -[IMAVPlayer setAsset:](self->_trackPlayer, "setAsset:", v5);

  }
}

- (id)currentSoundtrack
{
  return 0;
}

- (void)audioPlaybackWillStart:(id)a3
{
  if (a3 != self)
  {
    -[BKBookViewController setReadAloudState:](self, "setReadAloudState:", 0);
    -[BKBookViewController setTrackState:persistSetting:](self, "setTrackState:persistSetting:", 0, 0);
    -[BKBookViewController stopPlayingMedia:](self, "stopPlayingMedia:", 0);
  }
}

- (void)_reportLoadFailedAlertForError:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  BKBookViewController *v18;
  id v19;

  v4 = a3;
  v5 = AEBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Failed to load book because the requested resource is missing."), &stru_1C3088, 0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v7, 0, 1));
  v9 = AEBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1C3088, 0));
  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_5ACBC;
  v17 = &unk_1C0080;
  v18 = self;
  v19 = v4;
  v12 = v4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 0, &v14));
  objc_msgSend(v8, "addAction:", v13, v14, v15, v16, v17, v18);

  -[BKBookViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
}

- (void)_reportResourceUnavailableForBookWithTitle:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v24[5];
  id v25;

  v6 = a3;
  v7 = a4;
  v8 = AEBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Cannot Open Book"), &stru_1C3088, 0));

  if (objc_msgSend(v6, "length"))
  {
    v11 = AEBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Cannot Open “%@”"), &stru_1C3088, 0));
    v14 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v6));

    v10 = (void *)v14;
  }
  v15 = AEBundle();
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("It is formatted incorrectly, or is not a format that Apple Books can open."), &stru_1C3088, 0));

  v18 = AEBundle();
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Close"), &stru_1C3088, 0));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v10, v17, 1));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_5AF08;
  v24[3] = &unk_1C0080;
  v24[4] = self;
  v25 = v7;
  v22 = v7;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v20, 1, v24));
  objc_msgSend(v21, "addAction:", v23);

  -[BKBookViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v21, 1, 0);
}

- (void)contentFailedToLoadWithError:(id)a3
{
  char *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  char *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  char *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  unsigned int v21;
  _QWORD block[5];
  char *v23;
  char *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;

  v4 = (char *)a3;
  v5 = BCIMLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v26 = "-[BKBookViewController contentFailedToLoadWithError:]";
    v27 = 2080;
    v28 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/BKBookViewController.m";
    v29 = 1024;
    v30 = 6933;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
  }

  v7 = BCIMLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v4;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "@\"Showing Load Failed Alert -- %@\", buf, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
  if (objc_msgSend(v9, "isEqualToString:", NSURLErrorDomain))
  {
    v10 = objc_msgSend(v4, "code");

    if (v10 == (id)-1008)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
      v12 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bookTitle"));

      v13 = BCIMLog();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v26 = "-[BKBookViewController contentFailedToLoadWithError:]";
        v27 = 2080;
        v28 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/BKBookViewController.m";
        v29 = 1024;
        v30 = 6938;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
      }

      v15 = BCIMLog();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v12;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "@\"Load Failed Alert for book: %@\", buf, 0xCu);
      }

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_5B294;
      block[3] = &unk_1C00A8;
      block[4] = self;
      v23 = v12;
      v24 = v4;
      v17 = v12;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      goto LABEL_17;
    }
  }
  else
  {

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
  v19 = objc_msgSend(v18, "isEqualToString:", kCFErrorDomainCFNetwork);

  if (!v19
    && (v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain")),
        v21 = objc_msgSend(v20, "isEqualToString:", NSURLErrorDomain),
        v20,
        !v21)
    || objc_msgSend(v4, "code") != (id)-999)
  {
    -[BKBookViewController performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "_reportLoadFailedAlertForError:", v4, 0);
  }
LABEL_17:

}

- (void)contentViewFailedToLoad:(id)a3 error:(id)a4
{
  -[BKBookViewController contentFailedToLoadWithError:](self, "contentFailedToLoadWithError:", a4);
}

- (id)noteEditorHighlightedTextFont
{
  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 12.0);
}

- (id)fullScreenNoteEditorForAnnotation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _BOOL8 v8;
  id v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController theme](self, "theme"));
  v6 = objc_msgSend(v5, "shouldInvertContent");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "annotationNote"));
  v8 = objc_msgSend(v7, "length") == 0;

  v9 = objc_alloc_init((Class)AENoteFullscreenEditorController);
  objc_msgSend(v9, "setEditsOnLaunch:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController noteEditorHighlightedTextFont](self, "noteEditorHighlightedTextFont"));
  objc_msgSend(v9, "setHighlightedTextFont:", v10);

  objc_msgSend(v9, "setAnnotation:", v4);
  objc_msgSend(v9, "setDelegate:", self);
  objc_msgSend(v9, "setShouldDim:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController theme](self, "theme"));
  objc_msgSend(v9, "setTheme:", v11);

  return v9;
}

- (void)showNoteEditorForAnnotation:(id)a3
{
  id v4;
  AENotePopoverEditorController *noteEditor;
  AENotePopoverEditorController *v6;
  AENotePopoverEditorController *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  BKBookViewController *v18;

  v4 = a3;
  -[AENotePopoverEditorController setDelegate:](self->_noteEditor, "setDelegate:", 0);
  noteEditor = self->_noteEditor;
  self->_noteEditor = 0;

  v6 = (AENotePopoverEditorController *)objc_alloc_init((Class)AENotePopoverEditorController);
  v7 = self->_noteEditor;
  self->_noteEditor = v6;

  -[AENotePopoverEditorController setAnnotation:](self->_noteEditor, "setAnnotation:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController theme](self, "theme"));
  v9 = objc_msgSend(v8, "annotationPageTheme");

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationTheme themeForAnnotationStyle:pageTheme:isUnderline:](AEAnnotationTheme, "themeForAnnotationStyle:pageTheme:isUnderline:", objc_msgSend(v4, "annotationStyle"), v9, objc_msgSend(v4, "annotationIsUnderline")));
  -[AENotePopoverEditorController setAnnotationTheme:](self->_noteEditor, "setAnnotationTheme:", v10);

  if ((objc_opt_respondsToSelector(self->_noteEditor, "setTheme:") & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController theme](self, "theme"));
    -[AENotePopoverEditorController setTheme:](self->_noteEditor, "setTheme:", v11);

  }
  -[AENotePopoverEditorController setDelegate:](self->_noteEditor, "setDelegate:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "annotationNote"));
  v13 = objc_msgSend(v12, "length") == 0;

  -[AENotePopoverEditorController setEditsOnLaunch:](self->_noteEditor, "setEditsOnLaunch:", v13);
  if ((-[BKBookViewController im_isCompactWidth](self, "im_isCompactWidth") & 1) != 0
    || (-[BKBookViewController im_isCompactHeight](self, "im_isCompactHeight") & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController fullScreenNoteEditorForAnnotation:](self, "fullScreenNoteEditorForAnnotation:", v4));
    -[BKBookViewController setControlsVisible:animated:](self, "setControlsVisible:animated:", 1, 1);
    -[BKBookViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentViewControllerForAnnotation:](self, "contentViewControllerForAnnotation:", v4));
    v14 = v15;
    if (v15)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_5B5BC;
      v16[3] = &unk_1BF2F0;
      v17 = v15;
      v18 = self;
      objc_msgSend(v17, "rectForAnnotation:withCompletion:", v4, v16);

    }
  }

}

- (BOOL)isEditingAnnotation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "annotationUuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AENotePopoverEditorController annotation](self->_noteEditor, "annotation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "annotationUuid"));
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  return v7;
}

- (void)didHideAnnotationEditor:(id)a3
{
  AENotePopoverEditorController *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  AENotePopoverEditorController **p_noteEditor;
  AENotePopoverEditorController *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;

  v4 = (AENotePopoverEditorController *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AENotePopoverEditorController annotation](v4, "annotation"));
  if (objc_msgSend(v5, "isInserted")
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "annotationNote")),
        v7 = objc_msgSend(v6, "length"),
        v6,
        !v7))
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    objc_msgSend(v10, "deleteAnnotation:", v5);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "managedObjectContext"));
    v17 = 0;
    v9 = objc_msgSend(v8, "save:", &v17);
    v10 = v17;

    if ((v9 & 1) == 0 && v10)
    {
      v11 = BCIMLog();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v19 = "-[BKBookViewController didHideAnnotationEditor:]";
        v20 = 2080;
        v21 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/BKBookViewController.m";
        v22 = 1024;
        v23 = 7074;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
      }

      v13 = BCIMLog();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v19 = (const char *)v10;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "@\"Save Error: %@\", buf, 0xCu);
      }

    }
  }

  p_noteEditor = &self->_noteEditor;
  if (self->_noteEditor == v4)
  {
    -[AENotePopoverEditorController setDelegate:](v4, "setDelegate:", 0);
    goto LABEL_15;
  }
  p_noteEditor = &self->_colorEditor;
  if (self->_colorEditor == v4)
  {
    -[AENotePopoverEditorController removeFromParentViewController](v4, "removeFromParentViewController");
LABEL_15:
    v16 = *p_noteEditor;
    *p_noteEditor = 0;

  }
  -[BKBookViewController clearSelectedAnnotation](self, "clearSelectedAnnotation");

}

- (void)editorController:(id)a3 editNote:(id)a4
{
  -[BKBookViewController showNoteEditorForAnnotation:](self, "showNoteEditorForAnnotation:", a4);
}

- (void)editorController:(id)a3 setTheme:(id)a4 forAnnotation:(id)a5
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a5;
  v7 = a4;
  v8 = objc_msgSend(v7, "annotationStyle");
  v9 = objc_msgSend(v7, "isUnderline");

  v12 = v6;
  objc_msgSend(v12, "setAnnotationStyle:", v8);
  objc_msgSend(v12, "setAnnotationIsUnderline:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v10, "setInteger:forKey:", (int)v8, BKDefaultHighlightColor[0]);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v11, "setBool:forKey:", v9, BKDefaultUnderlineState);

}

- (void)editorController:(id)a3 deleteAnnotation:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  objc_msgSend(v6, "deleteAnnotation:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController searchResult](self, "searchResult"));
  if (v7)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController searchResult](self, "searchResult"));
    -[BKBookViewController highlightSearchResult:](self, "highlightSearchResult:", v8);

  }
}

- (_NSRange)pageRangeForAnnotation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___BKBookmark))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
    v6 = (uint64_t)objc_msgSend(v5, "pageRangeForAnnotation:", v4);
    v8 = v7;

  }
  else
  {
    v8 = 0;
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v9 = v6;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (id)chapterTitleForAnnotation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  int64_t v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___BKBookmark))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
    v6 = objc_msgSend(v5, "pageRangeForAnnotation:", v4);
    v8 = -[BKBookViewController pageNumberFromRange:](self, "pageNumberFromRange:", v6, v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController titleForChapterAtPageNumber:](self, "titleForChapterAtPageNumber:", v8));
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)editorController:(id)a3 editedAnnotation:(id)a4 toText:(id)a5
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;

  v6 = a4;
  v7 = a5;
  v8 = BKMobileCloudSyncAnnotationsLog(objc_msgSend(v6, "setAnnotationNote:", v7));
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "annotationAssetID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "annotationUuid"));
    v15 = 138412546;
    v16 = v10;
    v17 = 2112;
    v18 = v11;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "edit annotation note: assetID: %@, uuid: %@", (uint8_t *)&v15, 0x16u);

  }
  v13 = BKMobileCloudSyncAnnotationsLog(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    sub_11C894();

}

- (void)editorController:(id)a3 shareAnnotation:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  _QWORD v17[5];

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "presentationRect");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "presentationView"));

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_5BE30;
  v17[3] = &unk_1C00D0;
  v17[4] = self;
  -[BKBookViewController shareAnnotation:fromRect:inView:completion:](self, "shareAnnotation:fromRect:inView:completion:", v6, v16, v17, v9, v11, v13, v15);

}

- (BOOL)editorController:(id)a3 isSharingEnabledForAnnotation:(id)a4
{
  id v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v5 = a4;
  if (-[BKBookViewController isSharingSupported](self, "isSharingSupported"))
  {
    *(_QWORD *)&v6 = objc_opt_class(self).n128_u64[0];
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book", v6));
    if (objc_msgSend(v8, "areCitationsAllowedForBook:", v9))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "annotationSelectedText"));
      v11 = objc_msgSend(v10, "length") != 0;

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  return 0;
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  return 0;
}

- (id)transitionContentBackgroundColor
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController theme](self, "theme"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "backgroundColorForTraitEnvironment:", self));

  return v4;
}

- (id)transitionContentView
{
  BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/BKBookViewController.m", 7208, "-[BKBookViewController transitionContentView]", "NO", CFSTR("Unexpected call to transitionContentView. You probably wanted a more specific view. Consider overriding in subclass."));
  return -[BKBookViewController view](self, "view");
}

- (BOOL)transitionRightToLeft
{
  return -[BKBookViewController pageProgressionDirection](self, "pageProgressionDirection") == 1;
}

- (void)_paginationComplete:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  int v15;
  BKBookViewController *v16;
  __int16 v17;
  void *v18;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));

  v6 = _AEPaginationLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4 != v5)
  {
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
      v15 = 138412546;
      v16 = self;
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "IGNORING paginationComplete BVC:%@ paginationController:%@", (uint8_t *)&v15, 0x16u);

    }
    goto LABEL_4;
  }
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
    v15 = 138412546;
    v16 = self;
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Received paginationComplete BVC:%@ paginationController:%@", (uint8_t *)&v15, 0x16u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));
  v12 = objc_opt_respondsToSelector(v11, "assetViewControllerPaginationCompletedForBook:");

  if ((v12 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));
    objc_msgSend(v13, "assetViewControllerPaginationCompletedForBook:", self);

  }
  if (-[BKBookViewController _inAnalyticsReadSession](self, "_inAnalyticsReadSession"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController analyticsReadStartProgress](self, "analyticsReadStartProgress"));

    if (!v14)
    {
      v7 = objc_claimAutoreleasedReturnValue(-[BKBookViewController _currentReadingProgress](self, "_currentReadingProgress"));
      -[BKBookViewController setAnalyticsReadStartProgress:](self, "setAnalyticsReadStartProgress:", v7);
LABEL_4:

    }
  }
}

- (void)buildContextTree:(id)a3
{
  NSMutableArray *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  NSMutableArray *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id obj;
  uint64_t v30;
  BKBookViewController *v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  _QWORD v49[4];
  _BYTE v50[128];
  _BYTE v51[128];

  v39 = a3;
  v4 = objc_opt_new(NSMutableArray);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v31 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sortedDocuments"));

  obj = v6;
  v32 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
  if (v32)
  {
    v7 = 0;
    v30 = *(_QWORD *)v45;
    v38 = BCProgressContextTreeKey_uniqueID;
    v37 = BCProgressContextTreeKey_title;
    v36 = BCProgressContextTreeKey_displayOrder;
    v35 = BCProgressContextTreeKey_cfi;
    do
    {
      for (i = 0; i != v32; i = (char *)i + 1)
      {
        if (*(_QWORD *)v45 != v30)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](v31, "book"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "navigationInfosForDocument:", v9));

        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v34 = v11;
        v12 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
        if (v12)
        {
          v13 = v12;
          v33 = i;
          v14 = *(_QWORD *)v41;
          do
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              v16 = v4;
              if (*(_QWORD *)v41 != v14)
                objc_enumerationMutation(v34);
              v17 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)j);
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "valueForKey:", CFSTR("href")));
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "valueForKey:", CFSTR("name")));
              v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", v18));
              v21 = (void *)v20;
              v22 = &stru_1C3088;
              if (v20)
                v22 = (__CFString *)v20;
              v23 = v22;

              v48[0] = v38;
              v48[1] = v37;
              v49[0] = v18;
              v49[1] = v19;
              v48[2] = v36;
              v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)j + v7));
              v48[3] = v35;
              v49[2] = v24;
              v49[3] = v23;
              v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v49, v48, 4));

              v4 = v16;
              -[NSMutableArray addObject:](v16, "addObject:", v25);

            }
            v13 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
            v7 += (uint64_t)j;
          }
          while (v13);
          i = v33;
        }

      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    }
    while (v32);
  }

  if (-[NSMutableArray count](v4, "count"))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[BCProgressKitController sharedController](BCProgressKitController, "sharedController"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](v31, "book"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "assetID"));
    objc_msgSend(v26, "buildContextTree:forBook:completion:", v4, v28, 0);

  }
}

- (void)_handleExternalLoadRequest:(id)a3 likelyUserInitiated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));
  objc_msgSend(v7, "assetViewController:requestOpenURL:likelyUserInitiated:", self, v6, v4);

}

- (BOOL)_controller:(id)a3 handleInternalRequestForURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  BKBookViewController *v19;
  _QWORD v20[5];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bc_pathWithoutPrecedingSlash"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByRemovingURLFragment"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "documentAtPath:", v9));

  if (-[BKBookViewController isTOCURL:](self, "isTOCURL:", v7))
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_5C72C;
    v20[3] = &unk_1BEA38;
    v20[4] = self;
    -[BKViewController hideOverlayViewControllerWithCompletion:](self, "hideOverlayViewControllerWithCompletion:", v20);
    goto LABEL_9;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "documentOrdinal"));
  if (objc_msgSend(v12, "integerValue") == (id)-1)
  {

    goto LABEL_8;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nonlinearElement"));
  v14 = objc_msgSend(v13, "BOOLValue");

  if (v14)
  {
LABEL_8:
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_5C738;
    v17[3] = &unk_1BFDB8;
    v18 = v7;
    v19 = self;
    -[BKViewController hideOverlayViewControllerWithCompletion:](self, "hideOverlayViewControllerWithCompletion:", v17);

    goto LABEL_9;
  }
  if (v8)
  {
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fragment"));
    -[BKBookViewController goToPath:fragment:animated:](self, "goToPath:fragment:animated:", v8, v15, 1);

  }
LABEL_9:

  return 0;
}

- (void)hoverInteraction:(id)a3 didChangeStateForRegionWithKeys:(id)a4
{
  id v6;
  BCUIHoverInteraction *v7;

  v7 = (BCUIHoverInteraction *)a3;
  v6 = a4;
  if (self->_hoverInteraction == v7
    && -[BCUIHoverInteraction isHovering](v7, "isHovering")
    && self->_section != 1
    && objc_msgSend(v6, "containsObject:", CFSTR("control"))
    && -[BCUIHoverInteraction stateForRegionWithKey:](v7, "stateForRegionWithKey:", CFSTR("control")))
  {
    -[BKBookViewController setControlsVisible:animated:](self, "setControlsVisible:animated:", 1, 1);
    self->_controlsEnabledViaHover = 1;
  }

}

- (void)hoverInteractionDidSettle:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "stateForRegionWithKey:", CFSTR("control")) & 1) == 0
    && objc_msgSend(v4, "isHovering")
    && !self->_section
    && self->_controlsEnabledViaHover
    && -[BKBookViewController canDismissControls](self, "canDismissControls"))
  {
    -[BKBookViewController setControlsVisible:animated:](self, "setControlsVisible:animated:", 0, 1);
    self->_controlsEnabledViaHover = 0;
  }

}

- (void)rebuildHoverRegions
{
  BCUIHoverInteraction *hoverInteraction;
  _QWORD v3[5];

  hoverInteraction = self->_hoverInteraction;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_5C9D4;
  v3[3] = &unk_1C00F8;
  v3[4] = self;
  -[BCUIHoverInteraction rebuildRegionWithKey:block:](hoverInteraction, "rebuildRegionWithKey:block:", CFSTR("control"), v3);
}

- (BOOL)canDismissControls
{
  return 1;
}

- (id)analyticsReadingSettingsData
{
  return 0;
}

- (id)readingSessionData
{
  return -[BKBookViewController readingSessionDataForSearchViewController:](self, "readingSessionDataForSearchViewController:", 0);
}

- (id)contentData
{
  return -[BKBookViewController contentDataForSearchViewController:](self, "contentDataForSearchViewController:", 0);
}

- (id)contentSubType
{
  return +[BAContentSubType unknown](BAContentSubType, "unknown");
}

- (BAContentSettingsData)analyticsContentSettingData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *i;
  void *v15;
  unsigned int v16;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  _BYTE v30[128];

  if (!-[BKBookViewController _inAnalyticsReadSession](self, "_inAnalyticsReadSession"))
    return (BAContentSettingsData *)objc_msgSend(objc_alloc((Class)BAContentSettingsData), "initWithBookmarkCount:noteCount:highlightCount:", &off_1CD310, &off_1CD310, &off_1CD310);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "annotationProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uiManagedObjectContext"));

  v29 = 0;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController bookmarksFetchRequestForBook:moc:](self, "bookmarksFetchRequestForBook:moc:", v3, v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "executeFetchRequest:error:"));
  v23 = v29;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v7);
        v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v16 = objc_msgSend(v15, "annotationType", v23);
        if (v16 == 2)
        {
          if (objc_msgSend(v15, "annotationHasNote"))
            ++v11;
          else
            ++v12;
        }
        else if (v16 == 1)
        {
          ++v10;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
  }

  v18 = objc_alloc((Class)BAContentSettingsData);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v11));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v12));
  v22 = objc_msgSend(v18, "initWithBookmarkCount:noteCount:highlightCount:", v19, v20, v21);

  return (BAContentSettingsData *)v22;
}

- (void)emitScrubEventStartPosition:(int64_t)a3 endPosition:(int64_t)a4 totalLength:(int64_t)a5
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController analyticsReadingSettingsData](self, "analyticsReadingSettingsData"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentDataForSearchViewController:](self, "contentDataForSearchViewController:", 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a5));
  objc_msgSend(v9, "emitScrubEventWithTracker:contentData:readingSettingsData:startPosition:endPosition:totalLength:", v10, v11, v15, v12, v13, v14);

}

- (void)bc_analyticsVisibilityDidAppear
{
  void *v3;
  void *v4;
  void *v5;
  void **v6;
  uint64_t v7;
  void (*v8)(uint64_t, int);
  void *v9;
  id v10;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
  if (objc_msgSend(v3, "optedIn"))
  {
    objc_initWeak(&location, self);
    v6 = _NSConcreteStackBlock;
    v7 = 3221225472;
    v8 = sub_5CEB0;
    v9 = &unk_1C0120;
    objc_copyWeak(&v10, &location);
    +[BADoNotDisturbHelper fetchCurrentState:](BADoNotDisturbHelper, "fetchCurrentState:", &v6);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    -[BKBookViewController setDoNotDisturbStatusAtStart:](self, "setDoNotDisturbStatusAtStart:", 0);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date", v6, v7, v8, v9));
  -[BKBookViewController setAnalyticsReadStartDate:](self, "setAnalyticsReadStartDate:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController _currentReadingProgress](self, "_currentReadingProgress"));
  -[BKBookViewController setAnalyticsReadStartProgress:](self, "setAnalyticsReadStartProgress:", v5);

}

- (void)bc_analyticsVisibilityWillDisappear
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  int64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  NSObject *v19;
  BKBookViewController *v20;
  id v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;
  uint8_t buf[8];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = sub_5D184;
  v26[4] = sub_5D194;
  v27 = objc_msgSend(v3, "newSessionAssertion");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentData](self, "contentData"));
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController cachedContentData](self, "cachedContentData"));
  v7 = v6;

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_5D184;
  v24[4] = sub_5D194;
  v25 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController analyticsReadStartDate](self, "analyticsReadStartDate"));
  if (v7)
  {
    v8 = -[BKBookViewController doNotDisturbStatusAtStart](self, "doNotDisturbStatusAtStart");
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_5D19C;
    v18[3] = &unk_1C01C0;
    v19 = v3;
    v20 = self;
    v22 = v24;
    v23 = v26;
    v21 = v7;
    -[BKBookViewController _newBADoNotDisturbDataWithStartStatus:tracker:completion:](self, "_newBADoNotDisturbDataWithStartStatus:tracker:completion:", v8, v19, v18);

    v9 = v19;
  }
  else
  {
    v10 = BCCurrentBookLog();
    v9 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));
      sub_11C910(v11, buf, v9);
    }
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController analyticsReadStartDate](self, "analyticsReadStartDate"));
  objc_msgSend(v12, "timeIntervalSinceNow");
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController _analyticsSessionHost](self, "_analyticsSessionHost"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController asset](self, "asset"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "assetID"));
  objc_msgSend(v15, "readSessionDidEnd:readTime:", v17, -v14);

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);

}

- (id)_contentSettingsDataFromReadingSessionData:(id)a3 optedIn:(BOOL)a4
{
  id v5;
  void *v6;
  float v7;
  float v8;
  void *v9;
  float v10;
  float v11;
  BOOL v12;
  void *v13;

  if (!a4)
    return 0;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "percentCompletionStart"));
  objc_msgSend(v6, "floatValue");
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "percentCompletionEnd"));
  objc_msgSend(v9, "floatValue");
  v11 = v10;

  v12 = v11 >= 0.5 && v8 < 0.5;
  if (v12 || (v13 = 0, v11 >= 0.9) && v8 < 0.9)
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController analyticsContentSettingData](self, "analyticsContentSettingData"));
  return v13;
}

- (void)_newBADoNotDisturbDataWithStartStatus:(int64_t)a3 tracker:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  int64_t v12;

  v7 = a4;
  v8 = a5;
  if (v8)
  {
    if ((objc_msgSend(v7, "optedIn") & 1) != 0)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_5D6B8;
      v10[3] = &unk_1C01E8;
      v12 = a3;
      v11 = v8;
      +[BADoNotDisturbHelper fetchCurrentState:](BADoNotDisturbHelper, "fetchCurrentState:", v10);

    }
    else
    {
      v9 = objc_msgSend(objc_alloc((Class)BADoNotDisturbData), "initWithStartStatus:endStatus:", 0, 0);
      (*((void (**)(id, id))v8 + 2))(v8, v9);

    }
  }

}

- (BOOL)bc_analyticsVisibilityOfSelf
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)bc_analyticsVisibilityIsObscuredWhenPresented
{
  return 1;
}

- (BOOL)_inAnalyticsReadSession
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController analyticsReadStartDate](self, "analyticsReadStartDate"));
  v3 = v2 != 0;

  return v3;
}

- (id)_analyticsSessionHost
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController im_ancestorViewControllerConformingToProtocol:](self, "im_ancestorViewControllerConformingToProtocol:", &OBJC_PROTOCOL___BASessionHostProviding));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "analyticsSessionHost"));

  return v3;
}

- (void)handleVoiceOverStatusChanged:(id)a3
{
  if (UIAccessibilityIsVoiceOverRunning())
    -[BKBookViewController setControlsVisible:animated:](self, "setControlsVisible:animated:", 1, 0);
}

- (void)handleSwitchControlStatusChanged:(id)a3
{
  if (UIAccessibilityIsSwitchControlRunning())
    -[BKBookViewController setControlsVisible:animated:](self, "setControlsVisible:animated:", 1, 0);
}

- (void)updateUIForSmartInvert
{
  id v3;
  id v4;

  v3 = +[IMTheme isAutoNightModeEnabled](IMTheme, "isAutoNightModeEnabled");
  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController viewIfLoaded](self, "viewIfLoaded"));
  objc_msgSend(v4, "setAccessibilityIgnoresInvertColors:", v3);

}

- (BOOL)bkaxNeedsPersistentControls
{
  if (UIAccessibilityIsVoiceOverRunning()
    || UIAccessibilityIsSwitchControlRunning()
    || _AXSCommandAndControlEnabled())
  {
    return 1;
  }
  else
  {
    return IMAccessibilityIsFKAEnabledWithKeyboardAttached();
  }
}

+ (BOOL)useEnhancedEditMenu
{
  return 1;
}

- (IMPerformSelectorProxy)performSelectorProxy
{
  return self->_performSelectorProxy;
}

- (void)setPerformSelectorProxy:(id)a3
{
  objc_storeStrong((id *)&self->_performSelectorProxy, a3);
}

- (UIViewController)activityViewController
{
  return self->_activityViewController;
}

- (void)setActivityViewController:(id)a3
{
  objc_storeStrong((id *)&self->_activityViewController, a3);
}

- (AENotePopoverEditorController)noteEditor
{
  return self->_noteEditor;
}

- (AEAssetOpenAnimating)contentOpenAnimator
{
  return self->_contentOpenAnimator;
}

- (void)setContentOpenAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_contentOpenAnimator, a3);
}

- (NSObject)bookPositionProcessor
{
  return self->bookPositionProcessor;
}

- (void)setBookPositionProcessor:(id)a3
{
  objc_storeStrong((id *)&self->bookPositionProcessor, a3);
}

- (AEBookInfo)book
{
  return self->_book;
}

- (AEAssetViewControllerDelegate)assetViewControllerDelegate
{
  return (AEAssetViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_assetViewControllerDelegate);
}

- (void)setAssetViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_assetViewControllerDelegate, a3);
}

- (NSMutableDictionary)contentViewControllers
{
  return self->_contentViewControllers;
}

- (BOOL)controlsVisible
{
  return self->_controlsVisible;
}

- (int64_t)pageCountIncludingUpsell
{
  return self->_pageCountIncludingUpsell;
}

- (BKLocation)location
{
  return self->_location;
}

- (BOOL)playNextItemAbortedWhileInactive
{
  return self->_playNextItemAbortedWhileInactive;
}

- (void)setPlayNextItemAbortedWhileInactive:(BOOL)a3
{
  self->_playNextItemAbortedWhileInactive = a3;
}

- (BOOL)isRotationInProgress
{
  return self->_rotationInProgress;
}

- (void)setRotationInProgress:(BOOL)a3
{
  self->_rotationInProgress = a3;
}

- (int)selectionHighlightType
{
  return self->_selectionHighlightType;
}

- (void)setSelectionHighlightType:(int)a3
{
  self->_selectionHighlightType = a3;
}

- (BKSearchResult)searchResult
{
  return self->_searchResult;
}

- (void)setSearchResult:(id)a3
{
  objc_storeStrong((id *)&self->_searchResult, a3);
}

- (BKActionController)actionController
{
  return self->_actionController;
}

- (void)setActionController:(id)a3
{
  objc_storeStrong((id *)&self->_actionController, a3);
}

- (void)setResumeLocation:(id)a3
{
  objc_storeStrong((id *)&self->_resumeLocation, a3);
}

- (BKExpandedContentViewController)expandedContentViewController
{
  return self->_expandedContentViewController;
}

- (void)setNavigationHistory:(id)a3
{
  objc_storeStrong((id *)&self->_navigationHistory, a3);
}

- (BKPaginationController)paginationController
{
  return self->_paginationController;
}

- (BKPageNavigationViewController)pageNavigationViewController
{
  return self->_pageNavigationViewController;
}

- (void)setPageNavigationViewController:(id)a3
{
  objc_storeStrong((id *)&self->_pageNavigationViewController, a3);
}

- (int)section
{
  return self->_section;
}

- (unint64_t)layout
{
  return self->_layout;
}

- (BKFootnoteViewController2)footnoteController
{
  return self->_footnoteController;
}

- (void)setFootnoteController:(id)a3
{
  objc_storeStrong((id *)&self->_footnoteController, a3);
}

- (BOOL)userNavigated
{
  return self->_userNavigated;
}

- (void)setUserNavigated:(BOOL)a3
{
  self->_userNavigated = a3;
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

- (BCTouchBarController)touchBarController
{
  return self->_touchBarController;
}

- (void)setTouchBarController:(id)a3
{
  objc_storeStrong((id *)&self->_touchBarController, a3);
}

- (BOOL)bkaxAccessibilityUserIsRequestingControlsVisibilityToggle
{
  return self->_bkaxAccessibilityUserIsRequestingControlsVisibilityToggle;
}

- (void)setBkaxAccessibilityUserIsRequestingControlsVisibilityToggle:(BOOL)a3
{
  self->_bkaxAccessibilityUserIsRequestingControlsVisibilityToggle = a3;
}

- (AEAnnotationProvider)annotationProvider
{
  return self->_annotationProvider;
}

- (void)setAnnotationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_annotationProvider, a3);
}

- (NSNumber)analyticsReadStartProgress
{
  return self->_analyticsReadStartProgress;
}

- (void)setAnalyticsReadStartProgress:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsReadStartProgress, a3);
}

- (BKLocation)tocCurrentLocation
{
  return self->_tocCurrentLocation;
}

- (void)setTocCurrentLocation:(id)a3
{
  objc_storeStrong((id *)&self->_tocCurrentLocation, a3);
}

- (unint64_t)pageNumberBeforeScrubbing
{
  return self->_pageNumberBeforeScrubbing;
}

- (void)setPageNumberBeforeScrubbing:(unint64_t)a3
{
  self->_pageNumberBeforeScrubbing = a3;
}

- (BOOL)safeToShowToolbarItems
{
  return self->_safeToShowToolbarItems;
}

- (void)setSafeToShowToolbarItems:(BOOL)a3
{
  self->_safeToShowToolbarItems = a3;
}

- (UIView)footnoteSourceView
{
  return self->_footnoteSourceView;
}

- (void)setFootnoteSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_footnoteSourceView, a3);
}

- (BKLocation)openingLocation
{
  return self->_openingLocation;
}

- (void)setOpeningLocation:(id)a3
{
  objc_storeStrong((id *)&self->_openingLocation, a3);
}

- (BOOL)annotationChangeRequiresPaginationUpdate
{
  return self->_annotationChangeRequiresPaginationUpdate;
}

- (void)setAnnotationChangeRequiresPaginationUpdate:(BOOL)a3
{
  self->_annotationChangeRequiresPaginationUpdate = a3;
}

- (NSNumber)readingLocationHighwaterMark
{
  return self->_readingLocationHighwaterMark;
}

- (void)setReadingLocationHighwaterMark:(id)a3
{
  objc_storeStrong((id *)&self->_readingLocationHighwaterMark, a3);
}

- (BKBrightnessController)brightnessController
{
  return self->_brightnessController;
}

- (void)setBrightnessController:(id)a3
{
  objc_storeStrong((id *)&self->_brightnessController, a3);
}

- (BKAudioController)audioController
{
  return self->_audioController;
}

- (void)setAudioController:(id)a3
{
  objc_storeStrong((id *)&self->_audioController, a3);
}

- (BCDisplaySleepController)displaySleepController
{
  return self->_displaySleepController;
}

- (NSString)buyParameters
{
  return self->_buyParameters;
}

- (void)setBuyParameters:(id)a3
{
  objc_storeStrong((id *)&self->_buyParameters, a3);
}

- (NSString)priceString
{
  return self->_priceString;
}

- (void)setPriceString:(id)a3
{
  objc_storeStrong((id *)&self->_priceString, a3);
}

- (BKLocation)reportedLocation
{
  return self->_reportedLocation;
}

- (void)setReportedLocation:(id)a3
{
  objc_storeStrong((id *)&self->_reportedLocation, a3);
}

- (void)setCurrentBookCacheItem:(id)a3
{
  objc_storeStrong((id *)&self->_currentBookCacheItem, a3);
}

- (BCAugmentedExperienceManager)experienceManager
{
  return self->_experienceManager;
}

- (void)setExperienceManager:(id)a3
{
  objc_storeStrong((id *)&self->_experienceManager, a3);
}

- (int64_t)lastAnalyticsDeviceOrientationReported
{
  return self->_lastAnalyticsDeviceOrientationReported;
}

- (void)setLastAnalyticsDeviceOrientationReported:(int64_t)a3
{
  self->_lastAnalyticsDeviceOrientationReported = a3;
}

- (BAContentData)cachedContentData
{
  return self->_cachedContentData;
}

- (void)setCachedContentData:(id)a3
{
  objc_storeStrong((id *)&self->_cachedContentData, a3);
}

- (NSHashTable)bookmarkObservers
{
  return self->_bookmarkObservers;
}

- (void)setBookmarkObservers:(id)a3
{
  objc_storeStrong((id *)&self->_bookmarkObservers, a3);
}

- (void)setHasRemoteResources:(BOOL)a3
{
  self->_hasRemoteResources = a3;
}

- (BOOL)hasCheckedForRemoteResources
{
  return self->_hasCheckedForRemoteResources;
}

- (void)setHasCheckedForRemoteResources:(BOOL)a3
{
  self->_hasCheckedForRemoteResources = a3;
}

- (BCDDParsecCollectionViewController)referenceLibraryViewController
{
  return self->_referenceLibraryViewController;
}

- (void)setReferenceLibraryViewController:(id)a3
{
  objc_storeStrong((id *)&self->_referenceLibraryViewController, a3);
}

- (LTUITranslationViewController)translationViewController
{
  return self->_translationViewController;
}

- (void)setTranslationViewController:(id)a3
{
  objc_storeStrong((id *)&self->_translationViewController, a3);
}

- (int64_t)doNotDisturbStatusAtStart
{
  return self->_doNotDisturbStatusAtStart;
}

- (void)setDoNotDisturbStatusAtStart:(int64_t)a3
{
  self->_doNotDisturbStatusAtStart = a3;
}

- (NSDate)analyticsReadStartDate
{
  return self->_analyticsReadStartDate;
}

- (void)setAnalyticsReadStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsReadStartDate, a3);
}

- (BCUIHoverInteraction)hoverInteraction
{
  return self->_hoverInteraction;
}

- (BOOL)controlsEnabledViaHover
{
  return self->_controlsEnabledViaHover;
}

- (void)setControlsEnabledViaHover:(BOOL)a3
{
  self->_controlsEnabledViaHover = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hoverInteraction, 0);
  objc_storeStrong((id *)&self->_analyticsReadStartDate, 0);
  objc_storeStrong((id *)&self->_translationViewController, 0);
  objc_storeStrong((id *)&self->_referenceLibraryViewController, 0);
  objc_storeStrong((id *)&self->_bookmarkObservers, 0);
  objc_storeStrong((id *)&self->_cachedContentData, 0);
  objc_storeStrong((id *)&self->_experienceManager, 0);
  objc_storeStrong((id *)&self->_currentBookCacheItem, 0);
  objc_storeStrong((id *)&self->_reportedLocation, 0);
  objc_storeStrong((id *)&self->_priceString, 0);
  objc_storeStrong((id *)&self->_buyParameters, 0);
  objc_storeStrong((id *)&self->_displaySleepController, 0);
  objc_storeStrong((id *)&self->_audioController, 0);
  objc_storeStrong((id *)&self->_brightnessController, 0);
  objc_storeStrong((id *)&self->_readingLocationHighwaterMark, 0);
  objc_storeStrong((id *)&self->_openingLocation, 0);
  objc_storeStrong((id *)&self->_footnoteSourceView, 0);
  objc_storeStrong((id *)&self->_tocCurrentLocation, 0);
  objc_storeStrong((id *)&self->_analyticsReadStartProgress, 0);
  objc_storeStrong((id *)&self->_annotationProvider, 0);
  objc_storeStrong((id *)&self->_touchBarController, 0);
  objc_storeStrong((id *)&self->_appAnalyticsAdditionalData, 0);
  objc_storeStrong((id *)&self->_upSellData, 0);
  objc_storeStrong((id *)&self->_footnoteController, 0);
  objc_destroyWeak((id *)&self->_assetViewControllerDelegate);
  objc_storeStrong((id *)&self->bookPositionProcessor, 0);
  objc_storeStrong((id *)&self->_contentOpenAnimator, 0);
  objc_storeStrong((id *)&self->_activityViewController, 0);
  objc_storeStrong((id *)&self->_performSelectorProxy, 0);
  objc_storeStrong((id *)&self->_appearanceContainerViewController, 0);
  objc_storeStrong((id *)&self->_appearanceNavigationController, 0);
  objc_storeStrong((id *)&self->_appearanceViewController, 0);
  objc_storeStrong((id *)&self->_colorEditor, 0);
  objc_storeStrong((id *)&self->_noteEditor, 0);
  objc_storeStrong((id *)&self->_pageBookmarksFRC, 0);
  objc_storeStrong((id *)&self->_highlightedElement, 0);
  objc_storeStrong((id *)&self->_loadedPages, 0);
  objc_storeStrong((id *)&self->_currentMapItem, 0);
  objc_storeStrong((id *)&self->_smilMap, 0);
  objc_storeStrong((id *)&self->_trackPlayer, 0);
  objc_storeStrong((id *)&self->_readPlayer, 0);
  objc_storeStrong((id *)&self->_contentLoadQueue, 0);
  objc_storeStrong((id *)&self->_actionController, 0);
  objc_storeStrong((id *)&self->_expandedContentViewController, 0);
  objc_storeStrong((id *)&self->_navigationHistory, 0);
  objc_storeStrong((id *)&self->_resumeLocation, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_searchViewController, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_upsellContentViewController, 0);
  objc_storeStrong((id *)&self->_contentViewControllers, 0);
  objc_storeStrong((id *)&self->_paginationController, 0);
  objc_storeStrong((id *)&self->_pageNavigationViewController, 0);
  objc_storeStrong((id *)&self->_bookMoc, 0);
  objc_storeStrong((id *)&self->_book, 0);
}

@end
