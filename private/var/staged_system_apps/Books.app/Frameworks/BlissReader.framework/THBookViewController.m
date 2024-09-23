@implementation THBookViewController

+ (void)initialize
{
  id v2;
  id v3;

  if ((id)objc_opt_class(THBookViewController, a2) == a1)
  {
    v2 = objc_alloc((Class)NSDictionary);
    v3 = objc_msgSend(v2, "initWithObjectsAndKeys:", &off_4690F8, qword_5431A8, 0);
    -[NSUserDefaults registerDefaults:](+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"), "registerDefaults:", v3);

  }
}

- (THBookViewController)initWithBookDescription:(id)a3
{
  THBookViewController *v4;
  THReadingStatisticsCollector *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THBookViewController;
  v4 = -[THBookViewController init](&v7, "init");
  if (v4)
  {
    v4->mBookDescription = (THBookDescription *)a3;
    v4->mIsCompleteBook = 1;
    -[THBookViewController setOpeningAbsolutePageIndexOverride:](v4, "setOpeningAbsolutePageIndexOverride:", 0x7FFFFFFFFFFFFFFFLL);
    -[THBookViewController setTheme:](v4, "setTheme:", -[THBookViewController themeForStyle:](v4, "themeForStyle:", -[THBookViewController appearanceStyle](v4, "appearanceStyle")));
    -[THBookViewController updateViewBackgroundColor](v4, "updateViewBackgroundColor");
    v5 = objc_alloc_init(THReadingStatisticsCollector);
    v4->_readingStatisticsCollector = v5;
    -[THReadingStatisticsCollector setDelegate:](v5, "setDelegate:", v4);
    v4->_performanceModeBookOpening = 1;
    if (-[THBookDescription isEpub](v4->mBookDescription, "isEpub"))
      objc_msgSend(-[THBookViewController view](v4, "view"), "setAccessibilityIgnoresInvertColors:", 1);
    -[THBookViewController registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", +[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"), "_traitCollectionDidChange:previousTraitCollection:");
  }
  return v4;
}

- (void)updateViewBackgroundColor
{
  id v3;

  v3 = +[UIColor bc_darkSystemBackgroundForTraitCollection:](UIColor, "bc_darkSystemBackgroundForTraitCollection:", -[THBookViewController traitCollection](self, "traitCollection"));
  if (-[THBookDescription isEpub](self->mBookDescription, "isEpub"))
    v3 = -[THTheme backgroundColorForTraitEnvironment:](-[THBookViewController theme](self, "theme"), "backgroundColorForTraitEnvironment:", self);
  -[THBookViewController setViewBackgroundColor:](self, "setViewBackgroundColor:", v3);
}

+ (id)themeMap
{
  if (qword_5431B8 != -1)
    dispatch_once(&qword_5431B8, &stru_428398);
  return (id)qword_5431B0;
}

- (id)childViewControllerForStatusBarHidden
{
  if (self->_settingToolbarHidden)
    return -[THBookViewController visibleViewController](self, "visibleViewController");
  else
    return 0;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return -[BCDisplayOnlyNavigationBar isHidden](-[THBookViewController titleLabelNavigationBar](self, "titleLabelNavigationBar"), "isHidden");
}

- (void)p_cleanupAfterViewUnload
{
  -[THBookViewController setVisibleViewController:](self, "setVisibleViewController:", 0);
  -[THBookViewController setFlowTocViewController:](self, "setFlowTocViewController:", 0);
  -[THTOCViewController setDelegate:](self->mChapterBrowserController, "setDelegate:", 0);
  self->mChapterBrowserController = 0;
  -[THBookViewController setBookmarkButtonItem:](self, "setBookmarkButtonItem:", 0);
  -[THBookViewController setBookmarkButton:](self, "setBookmarkButton:", 0);
  -[THBookViewController setBrightnessButtonItem:](self, "setBrightnessButtonItem:", 0);
  -[THBookViewController setAppearanceButtonItem:](self, "setAppearanceButtonItem:", 0);
  -[THBookViewController setSearchButtonItem:](self, "setSearchButtonItem:", 0);
  -[THBookViewController setNotesButtonItem:](self, "setNotesButtonItem:", 0);
  -[THBookViewController setTocGlossaryButtonItem:](self, "setTocGlossaryButtonItem:", 0);
  -[THBookViewController setCloseButtonItem:](self, "setCloseButtonItem:", 0);
  -[THBookViewController setCloseTOCButtonItem:](self, "setCloseTOCButtonItem:", 0);
  -[THBookViewController setActionlessBookmarkButton:](self, "setActionlessBookmarkButton:", 0);
  -[THBookViewController setShareButtonItem:](self, "setShareButtonItem:", 0);
  -[THNavigationBarController setDelegate:](-[THBookViewController navigationBarController](self, "navigationBarController"), "setDelegate:", 0);
  -[THBookViewController setNavigationBarController:](self, "setNavigationBarController:", 0);
  -[THBookViewController setIntroMediaViewController:](self, "setIntroMediaViewController:", 0);
  -[THNavigationHistoryStepperController setBookspotHistoryStack:](self->navigationHistoryStepperController, "setBookspotHistoryStack:", 0);
  -[THNavigationHistoryStepperController setPageIndexFormatter:](self->navigationHistoryStepperController, "setPageIndexFormatter:", 0);
  -[THNavigationHistoryStepperController setChrome:](self->navigationHistoryStepperController, "setChrome:", 0);

  self->navigationHistoryStepperController = 0;
  -[THBookViewController setNavigationOverlayView:](self, "setNavigationOverlayView:", 0);

  self->mTitleLabel = 0;
  self->mTitleLabelNavigationBar = 0;

  self->mCanvasExitTransformDelegate = 0;
  self->mCanvasExitTransformController = 0;
  -[THBookViewController p_clearNotesFullscreenViewController](self, "p_clearNotesFullscreenViewController");
  -[THBookViewController setSearchViewController:](self, "setSearchViewController:", 0);

  self->mDebugPopover = 0;
  -[NSNotificationCenter removeObserver:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:", self);
}

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  objc_super v5;

  -[THBookViewController _teardown](self, "_teardown");
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "pAutoHideNavOverlay", 0);
  objc_msgSend(+[THApplePubAssetPlugin sharedPlugin](THApplePubAssetPlugin, "sharedPlugin"), "didCloseBook:", self);

  self->mDocument = 0;
  -[THBookViewController p_cleanupAfterViewUnload](self, "p_cleanupAfterViewUnload");
  -[THBookViewController setBookDescription:](self, "setBookDescription:", 0);
  -[THBookViewController setReadingProgressHighwaterMark:](self, "setReadingProgressHighwaterMark:", 0);
  -[THDocumentViewController setToolbarDelegate:](-[THBookViewController documentViewController](self, "documentViewController"), "setToolbarDelegate:", 0);
  -[THBookViewController setDocumentViewController:](self, "setDocumentViewController:", 0);
  -[THBookViewController setBookLinkResolver:](self, "setBookLinkResolver:", 0);
  -[THBookViewController setOpeningCFIOverride:](self, "setOpeningCFIOverride:", 0);
  -[THBookViewController setOpeningLocationOverride:](self, "setOpeningLocationOverride:", 0);

  self->mGlossaryViewController = 0;
  -[THBookViewController setViewBackgroundColor:](self, "setViewBackgroundColor:", 0);
  -[THBookViewController setHUDOverlayView:](self, "setHUDOverlayView:", 0);
  -[THBookViewController setHoverInteraction:](self, "setHoverInteraction:", 0);

  self->mBookmarkViewController = 0;
  self->mTOCGlossaryViewController = 0;

  self->mDisplaySettingsViewController = 0;
  self->_searchViewController = 0;

  self->_activityViewController = 0;
  -[THBookViewController setTheme:](self, "setTheme:", 0);

  self->_readingStatisticsCollector = 0;
  v4 = objc_opt_class(THBookView, v3);
  objc_msgSend((id)BUDynamicCast(v4, -[THBookViewController viewIfLoaded](self, "viewIfLoaded")), "setBookDelegate:", 0);

  self->_analyticsReadStartDate = 0;
  v5.receiver = self;
  v5.super_class = (Class)THBookViewController;
  -[THBookViewController dealloc](&v5, "dealloc");
}

- (THBookspotHistoryStack)bookspotHistoryStack
{
  THBookspotHistoryStack *v3;

  if (!-[THBookViewController documentRoot](self, "documentRoot"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookViewController bookspotHistoryStack]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm"), 567, CFSTR("invalid nil value for '%s'"), "self.documentRoot");
  v3 = (THBookspotHistoryStack *)objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "bookspotHistoryStack");
  if (!v3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookViewController bookspotHistoryStack]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm"), 570, CFSTR("invalid nil value for '%s'"), "bookspotHistoryStack");
  return v3;
}

- (id)documentRoot
{
  id v2;

  v2 = -[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot");
  if (!v2)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookViewController documentRoot]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm"), 578, CFSTR("invalid nil value for '%s'"), "documentRoot");
  return v2;
}

- (THDocumentNavigationModel)navigationModel
{
  THDocumentNavigationModel *v2;

  v2 = (THDocumentNavigationModel *)objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot"), "navigationModel");
  if (!v2)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookViewController navigationModel]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm"), 585, CFSTR("invalid nil value for '%s'"), "navModel");
  return v2;
}

- (THChapterBrowserController)chapterBrowserController
{
  THChapterBrowserController *v4;

  if (!self->mChapterBrowserController
    && -[THBookViewController bookDescription](self, "bookDescription")
    && !-[THBookViewController isBookEpub](self, "isBookEpub"))
  {
    v4 = -[THTOCViewController initWithBookPropertiesDelegate:delegate:]([THChapterBrowserController alloc], "initWithBookPropertiesDelegate:delegate:", self, self);
    self->mChapterBrowserController = v4;
    -[THBookViewController addChildViewController:](self, "addChildViewController:", v4);
    -[THTOCViewController setDataSource:](self->mChapterBrowserController, "setDataSource:", objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "tocModel"));
    -[THChapterBrowserController setPageAreaBackgroundColor:](self->mChapterBrowserController, "setPageAreaBackgroundColor:", -[THBookViewController viewBackgroundColor](self, "viewBackgroundColor"));
  }
  return self->mChapterBrowserController;
}

- (THiOSFlowToCTableViewController)flowToCTableViewController
{
  return self->mFlowToCTableViewController;
}

- (THFlowTOCViewController)flowTocViewController
{
  THFlowTOCViewController *v3;

  if (!self->mFlowTocViewController)
  {
    v3 = -[THTOCViewController initWithBookPropertiesDelegate:delegate:]([THFlowTOCViewController alloc], "initWithBookPropertiesDelegate:delegate:", self, self);
    self->mFlowTocViewController = v3;
    -[THBookViewController addChildViewController:](self, "addChildViewController:", v3);
    -[THTOCViewController setDataSource:](self->mFlowTocViewController, "setDataSource:", objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "tocModel"));
    -[THFlowTOCViewController setZipPackage:](self->mFlowTocViewController, "setZipPackage:", objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "zipPackage"));
    -[THFlowTOCViewController setDrmContext:](self->mFlowTocViewController, "setDrmContext:", -[THBookDescription drmContext](-[THBookViewController bookDescription](self, "bookDescription"), "drmContext"));
    -[THFlowTOCViewController setHasPaginatedData:](self->mFlowTocViewController, "setHasPaginatedData:", -[THBookViewController isBookEpub](self, "isBookEpub") ^ 1);
    if (-[THBookViewController isBookEpub](self, "isBookEpub"))
      -[THFlowTOCViewController setTheme:](self->mFlowTocViewController, "setTheme:", -[THBookViewController theme](self, "theme"));
  }
  return self->mFlowTocViewController;
}

- (THNotesViewController)notesFullscreenViewController
{
  THNotesViewController *result;
  THNotesViewController *v4;

  result = self->mNotesFullscreenViewController;
  if (!result)
  {
    v4 = +[THNotesViewController newNotesViewController](THNotesViewController, "newNotesViewController");
    self->mNotesFullscreenViewController = v4;
    -[THNotesViewController setBookViewController:](v4, "setBookViewController:", self);
    -[THNotesViewController setModalPresentationStyle:](self->mNotesFullscreenViewController, "setModalPresentationStyle:", 0);
    if (-[THBookViewController isBookEpub](self, "isBookEpub"))
      -[THNotesViewController setTheme:](self->mNotesFullscreenViewController, "setTheme:", -[THBookViewController theme](self, "theme"));
    -[THNotesViewController view](self->mNotesFullscreenViewController, "view");
    return self->mNotesFullscreenViewController;
  }
  return result;
}

- (void)p_clearNotesFullscreenViewController
{
  -[THNotesViewController setBookViewController:](self->mNotesFullscreenViewController, "setBookViewController:", 0);

  self->mNotesFullscreenViewController = 0;
}

- (void)appearanceViewController:(id)a3 brightnessLevelDidChange:(float)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;

  v6 = +[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter", a3);
  v7 = -[THBookViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker");
  v8 = -[THBookViewController readingSessionData](self, "readingSessionData");
  v9 = -[THBookViewController contentData](self, "contentData");
  LODWORD(v10) = llroundf(a4 * 100.0);
  objc_msgSend(v6, "emitReadingBrightnessChangeEventWithTracker:readingSessionData:contentData:brightness:", v7, v8, v9, v10);
}

- (void)displaySettingsControllerDidChangeFontSize:(id)a3 toFlowSizeScale:(unint64_t)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  double v10;
  UIViewController *v11;

  v6 = +[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter", a3);
  v7 = -[THBookViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker");
  v8 = -[THBookViewController readingSessionData](self, "readingSessionData");
  v9 = -[THBookViewController contentData](self, "contentData");
  *(float *)&v10 = (float)a4;
  objc_msgSend(v6, "emitReadingFontSizeChangeEventWithTracker:readingSessionData:contentData:fontSize:", v7, v8, v9, v10);
  v11 = -[THBookViewController visibleViewController](self, "visibleViewController");
  if (v11 == (UIViewController *)-[THBookViewController documentViewController](self, "documentViewController"))
    -[THDocumentViewController changeFontSize:](-[THBookViewController documentViewController](self, "documentViewController"), "changeFontSize:", a4);
}

- (BOOL)shouldShowFontResizeControls:(id)a3
{
  UIViewController *v4;

  v4 = -[THBookViewController visibleViewController](self, "visibleViewController", a3);
  if (v4 != (UIViewController *)-[THBookViewController documentViewController](self, "documentViewController"))
    return 0;
  if (-[THDocumentViewController inFlowMode](-[THBookViewController documentViewController](self, "documentViewController"), "inFlowMode"))
  {
    return 1;
  }
  return -[THBookViewController isBookEpub](self, "isBookEpub");
}

- (void)displaySettingsController:(id)a3 didChangeStyle:(int64_t)a4
{
  objc_msgSend(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"), "emitReadingBackgroundColorChangeEventWithTracker:readingSessionData:contentData:backgroundColorData:", -[THBookViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"), -[THBookViewController readingSessionData](self, "readingSessionData"), -[THBookViewController contentData](self, "contentData"), BABackgroundColorDataFromBCAppearanceStyle(a4, a2, a3));
  -[THBookViewController applyAppearanceStyle:](self, "applyAppearanceStyle:", a4);
}

- (void)displaySettingsController:(id)a3 didChangeAutoNightMode:(BOOL)a4
{
  _BOOL8 v4;
  unsigned int v6;

  v4 = a4;
  objc_msgSend(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter", a3), "emitReadingAutoNightSettingChangeEventWithTracker:readingSessionData:contentData:isOn:", -[THBookViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"), -[THBookViewController readingSessionData](self, "readingSessionData"), -[THBookViewController contentData](self, "contentData"), a4);
  v6 = +[IMTheme isAutoNightModeEnabled](IMTheme, "isAutoNightModeEnabled");
  +[IMTheme setAutoNightModeEnabled:](IMTheme, "setAutoNightModeEnabled:", v4);
  if (v4)
  {
    if ((v6 & 1) == 0)
      -[THBookViewController _enableAutoNightMode](self, "_enableAutoNightMode");
  }
  else
  {
    if (v6)
      -[THBookViewController _disableAutoNightMode](self, "_disableAutoNightMode");
    -[THBookViewController applyAppearanceStyle:](self, "applyAppearanceStyle:", -[THBookViewController styleBeforeAutoNight](self, "styleBeforeAutoNight"));
  }
}

- (BOOL)shouldShowFlowModeSwitch:(id)a3
{
  return !-[THBookViewController p_isTOCViewController:](self, "p_isTOCViewController:", -[THBookViewController visibleViewController](self, "visibleViewController", a3))&& objc_msgSend(objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "properties"), "flowPresentationType") != 0;
}

- (BOOL)flowModeEnabled:(id)a3
{
  return -[THDocumentViewController showFlowModeIfAvailable](-[THBookViewController documentViewController](self, "documentViewController", a3), "showFlowModeIfAvailable");
}

- (BOOL)autoNightModeEnabled:(id)a3
{
  unsigned int v3;

  v3 = -[THBookViewController isBookEpub](self, "isBookEpub", a3);
  if (v3)
    LOBYTE(v3) = +[IMTheme isAutoNightModeEnabled](IMTheme, "isAutoNightModeEnabled");
  return v3;
}

- (void)_enableAutoNightMode
{
  BCLightLevelController *v3;
  void **v4;
  uint64_t v5;
  id (*v6)(uint64_t, uint64_t);
  void *v7;
  id v8;
  id location;

  if (-[THBookViewController isBookEpub](self, "isBookEpub"))
  {
    v3 = +[BCLightLevelController sharedInstance](BCLightLevelController, "sharedInstance");
    objc_initWeak(&location, self);
    v4 = _NSConcreteStackBlock;
    v5 = 3221225472;
    v6 = sub_76040;
    v7 = &unk_4283C0;
    objc_copyWeak(&v8, &location);
    -[BCLightLevelController addObserver:changeHandler:](v3, "addObserver:changeHandler:", self, &v4);
    -[THBookViewController _updateAppearanceFromLightLevelController:](self, "_updateAppearanceFromLightLevelController:", v3, v4, v5, v6, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)_disableAutoNightMode
{
  -[BCLightLevelController removeObserver:](+[BCLightLevelController sharedInstance](BCLightLevelController, "sharedInstance"), "removeObserver:", self);
}

- (void)_updateAppearanceFromLightLevelController:(id)a3
{
  int64_t styleBeforeAutoNight;

  if (-[THBookViewController isBookEpub](self, "isBookEpub")
    && +[IMTheme isAutoNightModeEnabled](IMTheme, "isAutoNightModeEnabled")
    && objc_msgSend(a3, "shouldMonitorLightLevel"))
  {
    styleBeforeAutoNight = self->_styleBeforeAutoNight;
    if (objc_msgSend(a3, "currentLightLevel") == (char *)&dword_0 + 2)
      -[THBookViewController applyAppearanceStyle:](self, "applyAppearanceStyle:", 3);
    else
      -[THBookViewController applyAppearanceStyle:](self, "applyAppearanceStyle:", styleBeforeAutoNight);
  }
}

- (void)displaySettingsControllerDidChangeFlowMode:(id)a3
{
  -[THBookViewController displaySettingsControllerDidChangeFlowMode:notifyingCoordinator:](self, "displaySettingsControllerDidChangeFlowMode:notifyingCoordinator:", a3, 1);
}

- (void)displaySettingsControllerDidChangeFlowMode:(id)a3 notifyingCoordinator:(BOOL)a4
{
  _BOOL4 v4;
  NSNotificationCenter *v6;
  uint64_t v7;

  v4 = a4;
  -[THDocumentReflowableLayoutConfiguration invalidate](-[THDocumentViewController configuration](-[THBookViewController documentViewController](self, "documentViewController", a3), "configuration"), "invalidate");
  -[THDocumentViewController toggleFlowPresentation](-[THBookViewController documentViewController](self, "documentViewController"), "toggleFlowPresentation");
  -[THBookViewController p_updateFromTheme:](self, "p_updateFromTheme:", 0);
  v6 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter postNotificationName:object:](v6, "postNotificationName:object:", THScrollingViewDidChangeNotification, 0);
  if (v4)
  {
    if (-[THDocumentReflowableLayoutConfiguration isScroll](-[THDocumentViewController configuration](-[THBookViewController documentViewController](self, "documentViewController"), "configuration"), "isScroll"))v7 = 2;
    else
      v7 = 1;
    objc_msgSend(+[BCThemeCoordinator shared](BCThemeCoordinator, "shared"), "observer:didChangeLayout:", self, v7);
  }
}

- (BOOL)p_isTOCViewController:(id)a3
{
  if (!a3)
    return 0;
  if (self->mFlowTocViewController == a3 || self->mChapterBrowserController == a3)
    return 1;
  return self->mFlowToCTableViewController == a3;
}

- (void)loadView
{
  THBookView *v3;
  THBookView *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THBookViewController;
  -[THBookViewController loadView](&v5, "loadView");
  v3 = [THBookView alloc];
  objc_msgSend(-[THBookViewController view](self, "view"), "frame");
  v4 = -[THBookView initWithFrame:expandedLayout:](v3, "initWithFrame:expandedLayout:", 1);
  -[THBookView setBookDelegate:](v4, "setBookDelegate:", self);
  -[THBookView setBackgroundColor:](v4, "setBackgroundColor:", -[THBookViewController defaultBackgroundColor](self, "defaultBackgroundColor"));
  -[THBookView setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
  -[THBookViewController setView:](self, "setView:", v4);
  -[THBookViewController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", 15);
  -[THBookViewController setExtendedLayoutIncludesOpaqueBars:](self, "setExtendedLayoutIncludesOpaqueBars:", 1);
  -[THBookViewController p_loadToolbar](self, "p_loadToolbar");
  -[THBookViewController p_loadNavigationOverlay](self, "p_loadNavigationOverlay");
  -[THBookViewController p_loadTitleLabel](self, "p_loadTitleLabel");
}

- (void)viewDidLoad
{
  NSNotificationCenter *v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THBookViewController;
  -[THBookViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter addObserver:selector:name:object:](v3, "addObserver:selector:name:object:", self, "p_navigationHistoryDidChange:", THNavigationHistoryDidChangeNotification, 0);
  -[NSNotificationCenter addObserver:selector:name:object:](v3, "addObserver:selector:name:object:", self, "_accessibilityInvertColorsStatusDidChange:", UIAccessibilityInvertColorsStatusDidChangeNotification, 0);
  -[NSNotificationCenter addObserver:selector:name:object:](v3, "addObserver:selector:name:object:", self, "_voiceOverSwitchControlStatusDidChange", UIAccessibilityVoiceOverStatusDidChangeNotification, 0);
  self->_smartInvertEnabled = UIAccessibilityIsInvertColorsEnabled();
  -[THBookViewController setStyleBeforeAutoNight:](self, "setStyleBeforeAutoNight:", -[THBookViewController appearanceStyle](self, "appearanceStyle"));
  if ((char *)-[UIDevice orientation](+[UIDevice currentDevice](UIDevice, "currentDevice"), "orientation")- 3 >= (_BYTE *)&dword_0 + 2)v4 = 1;
  else
    v4 = 2;
  -[THBookViewController setLastAnalyticsDeviceOrientationReported:](self, "setLastAnalyticsDeviceOrientationReported:", v4);
}

- (void)didReceiveMemoryWarning
{
  id v3;
  objc_super v4;

  if (self->mIsClosing)
  {
    v4.receiver = self;
    v4.super_class = (Class)THBookViewController;
    -[THBookViewController didReceiveMemoryWarning](&v4, "didReceiveMemoryWarning");
  }
  if (!-[THBookViewController isNotesFullscreenVisible](self, "isNotesFullscreenVisible"))
    -[THBookViewController p_clearNotesFullscreenViewController](self, "p_clearNotesFullscreenViewController");
  if (!-[THBookViewController isGlossaryVisible](self, "isGlossaryVisible"))
  {

    self->mGlossaryViewController = 0;
  }
  v3 = objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "searchController");
  if (-[THBookViewController p_isSearchVisible](self, "p_isSearchVisible"))
  {
    objc_msgSend(v3, "setUnloadRequested:", 1);
  }
  else
  {
    objc_msgSend(v3, "unloadIndex");
    -[THBookViewController setSearchViewController:](self, "setSearchViewController:", 0);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[THNavigationBarController setNavigationBarHidden:animated:](-[THBookViewController navigationBarController](self, "navigationBarController"), "setNavigationBarHidden:animated:", -[THBookViewController shouldAutohideNavigationBar](self, "shouldAutohideNavigationBar"), 0);
  objc_msgSend(+[BCThemeCoordinator shared](BCThemeCoordinator, "shared"), "addObserver:", self);
  if (!-[THBookViewController bc_contextualPresentedViewController](self, "bc_contextualPresentedViewController")
    && +[IMTheme isAutoNightModeEnabled](IMTheme, "isAutoNightModeEnabled"))
  {
    -[THBookViewController _enableAutoNightMode](self, "_enableAutoNightMode");
  }
  if (-[THBookViewController isMovingToParentViewController](self, "isMovingToParentViewController"))
  {
    -[THBookViewController p_updateToolbarButtonStates](self, "p_updateToolbarButtonStates");
    -[THBookViewController p_updateFromTheme:](self, "p_updateFromTheme:", 0);
    if (-[THBookViewController p_hasDestinationPage](self, "p_hasDestinationPage"))
      -[THBookViewController p_showDVC](self, "p_showDVC");
  }
  v5.receiver = self;
  v5.super_class = (Class)THBookViewController;
  -[THBookViewController viewWillAppear:](&v5, "viewWillAppear:", v3);
  if (self->mHaveCalledDidOpen)
    -[THBookViewController viewsAreReadyForOpenAnimation](self, "viewsAreReadyForOpenAnimation");
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THBookViewController;
  -[THBookViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v6, "viewDidMoveToWindow:shouldAppearOrDisappear:", a3, a4);
  if (a3)
    -[THBookViewController _updateCloseButtonItem](self, "_updateCloseButtonItem");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THBookViewController;
  -[THBookViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  objc_msgSend(+[BCThemeCoordinator shared](BCThemeCoordinator, "shared"), "removeObserver:", self);
  -[THBookViewController bc_analyticsVisibilitySubtreeWillDisappear](self, "bc_analyticsVisibilitySubtreeWillDisappear");
  -[NSNotificationCenter postNotificationName:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotificationName:object:", CFSTR("kTHPPT_bookControllerChange"), 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THBookViewController;
  -[THBookViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[THBookViewController bc_analyticsVisibilitySubtreeDidDisappear](self, "bc_analyticsVisibilitySubtreeDidDisappear");
  if (!-[THBookViewController presentedViewController](self, "presentedViewController"))
  {
    if (+[IMTheme isAutoNightModeEnabled](IMTheme, "isAutoNightModeEnabled"))
      -[THBookViewController _disableAutoNightMode](self, "_disableAutoNightMode");
    -[NSUserDefaults setInteger:forKey:](+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"), "setInteger:forKey:", -[THBookViewController styleBeforeAutoNight](self, "styleBeforeAutoNight"), CFSTR("THBookViewControllerStyleBeforeAutoNight"));
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  THBookOpener *mBookOpener;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THBookViewController;
  -[THBookViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  -[THBookViewController bc_analyticsVisibilityUpdateSubtree](self, "bc_analyticsVisibilityUpdateSubtree");
  objc_msgSend(objc_msgSend(-[THBookViewController view](self, "view"), "window"), "makeKeyWindow");
  -[THBookViewController p_updateCenterTitle](self, "p_updateCenterTitle");
  mBookOpener = self->mBookOpener;
  if (mBookOpener && (-[THBookOpener isFinished](mBookOpener, "isFinished") & 1) == 0)
    -[THBookViewController p_alertUserAboutFontDownload](self, "p_alertUserAboutFontDownload");
  -[NSNotificationCenter postNotificationName:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotificationName:object:", CFSTR("kTHPPT_bookControllerChange"), self);
}

- (void)p_updateTitleLabelToolbarVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void ***v6;
  void ***v7;
  void **v8;
  uint64_t v9;
  id *(*v10)(id *, int);
  void *v11;
  THBookViewController *v12;
  void **v13;
  uint64_t v14;
  id (*v15)(uint64_t);
  void *v16;
  THBookViewController *v17;
  void **v18;
  uint64_t v19;
  id (*v20)(uint64_t);
  void *v21;
  THBookViewController *v22;
  void **v23;
  uint64_t v24;
  id (*v25)(uint64_t);
  void *v26;
  THBookViewController *v27;

  v4 = a4;
  if (a3
    && objc_msgSend(-[THBookViewController currentPresentationType](self, "currentPresentationType"), "isPaginated"))
  {
    objc_msgSend(-[THBookViewController view](self, "view"), "insertSubview:belowSubview:", self->mTitleLabelNavigationBar, -[THNavigationBarController navigationBar](-[THBookViewController navigationBarController](self, "navigationBarController"), "navigationBar"));
    -[BCDisplayOnlyNavigationBar setLeftItems:rightItems:titleView:animated:](-[THBookViewController titleLabelNavigationBar](self, "titleLabelNavigationBar"), "setLeftItems:rightItems:titleView:animated:", &__NSArray0__struct, &__NSArray0__struct, -[THBookViewController titleLabel](self, "titleLabel"), 0);
    -[UILabel sizeToFit](-[THBookViewController titleLabel](self, "titleLabel"), "sizeToFit");
    objc_msgSend(-[THBookViewController view](self, "view"), "insertSubview:belowSubview:", -[THBookViewController actionlessBookmarkButton](self, "actionlessBookmarkButton"), -[THNavigationBarController navigationBar](-[THBookViewController navigationBarController](self, "navigationBarController"), "navigationBar"));
    -[THBookViewController p_syncActionlessBookmarkToolbarButtonFrame](self, "p_syncActionlessBookmarkToolbarButtonFrame");
    if (!v4)
    {
      -[BCDisplayOnlyNavigationBar setAlpha:](-[THBookViewController titleLabelNavigationBar](self, "titleLabelNavigationBar"), "setAlpha:", 1.0);
      -[BCDisplayOnlyNavigationBar setHidden:](-[THBookViewController titleLabelNavigationBar](self, "titleLabelNavigationBar"), "setHidden:", 0);
      goto LABEL_10;
    }
    v23 = _NSConcreteStackBlock;
    v24 = 3221225472;
    v25 = sub_769F4;
    v26 = &unk_426DD0;
    v27 = self;
    v18 = _NSConcreteStackBlock;
    v19 = 3221225472;
    v20 = sub_76A10;
    v21 = &unk_427130;
    v22 = self;
    v6 = &v23;
    v7 = &v18;
  }
  else
  {
    if (!v4)
    {
      -[BCDisplayOnlyNavigationBar setLeftItems:rightItems:titleView:animated:](-[THBookViewController titleLabelNavigationBar](self, "titleLabelNavigationBar"), "setLeftItems:rightItems:titleView:animated:", &__NSArray0__struct, &__NSArray0__struct, 0, 0);
      -[BCDisplayOnlyNavigationBar setAlpha:](-[THBookViewController titleLabelNavigationBar](self, "titleLabelNavigationBar"), "setAlpha:", 0.0);
      -[BCDisplayOnlyNavigationBar setHidden:](-[THBookViewController titleLabelNavigationBar](self, "titleLabelNavigationBar"), "setHidden:", 1);
      -[UIButton setAlpha:](-[THBookViewController actionlessBookmarkButton](self, "actionlessBookmarkButton"), "setAlpha:", 0.0);
      goto LABEL_10;
    }
    v12 = self;
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_76A2C;
    v16 = &unk_426DD0;
    v17 = self;
    v8 = _NSConcreteStackBlock;
    v9 = 3221225472;
    v10 = sub_76A64;
    v11 = &unk_427130;
    v6 = &v13;
    v7 = &v8;
  }
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v6, v7, 0.15, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21,
    v22,
    v23,
    v24,
    v25,
    v26,
    v27);
LABEL_10:
  -[THBookViewController setNeedsUpdateOfHomeIndicatorAutoHidden](self, "setNeedsUpdateOfHomeIndicatorAutoHidden");
}

- (void)viewWillLayoutSubviews
{
  -[THDocumentReflowableLayoutConfiguration invalidate](-[THDocumentViewController configuration](-[THBookViewController documentViewController](self, "documentViewController"), "configuration"), "invalidate");
}

- (void)viewDidLayoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  int v7;
  UIViewController *v8;
  _BOOL8 v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)THBookViewController;
  -[THBookViewController viewDidLayoutSubviews](&v10, "viewDidLayoutSubviews");
  if (!-[THBookViewController hoverInteraction](self, "hoverInteraction"))
  {
    -[THBookViewController setHoverInteraction:](self, "setHoverInteraction:", objc_msgSend(objc_alloc((Class)BCUIHoverInteraction), "initWithDelegate:view:", self, -[THBookViewController view](self, "view")));
    objc_msgSend(-[THBookViewController view](self, "view"), "addInteraction:", -[THBookViewController hoverInteraction](self, "hoverInteraction"));
  }
  -[THBookViewController buildHoverRegions](self, "buildHoverRegions");
  -[THBookViewController p_navigationOverlayFrame](self, "p_navigationOverlayFrame");
  -[THNavigationOverlayView setFrame:](-[THBookViewController navigationOverlayView](self, "navigationOverlayView"), "setFrame:", v3, v4, v5, v6);
  if (-[THBookViewController documentViewController](self, "documentViewController")
    && -[THBookViewController isBookEpub](self, "isBookEpub"))
  {
    -[UIView addSubview:](-[THDocumentViewController navigationOverlayContainer](-[THBookViewController documentViewController](self, "documentViewController"), "navigationOverlayContainer"), "addSubview:", -[THBookViewController navigationOverlayView](self, "navigationOverlayView"));
    -[THNavigationOverlayView addSubview:](-[THBookViewController navigationOverlayView](self, "navigationOverlayView"), "addSubview:", -[THDocumentViewController navOverlayPageNumberView](-[THBookViewController documentViewController](self, "documentViewController"), "navOverlayPageNumberView"));
    v7 = 1;
  }
  else
  {
    objc_msgSend(-[THBookViewController view](self, "view"), "addSubview:", -[THBookViewController navigationOverlayView](self, "navigationOverlayView"));
    v7 = 0;
  }
  if (!self->mDocumentToTOCViewTransitionView && !self->mTOCToDocumentViewTransitionView)
  {
    v9 = 0;
    if (v7)
    {
      if (objc_msgSend(-[THBookViewController currentPresentationType](self, "currentPresentationType"), "isPaginated"))
      {
        v8 = -[THBookViewController visibleViewController](self, "visibleViewController");
        if (v8 == (UIViewController *)-[THBookViewController documentViewController](self, "documentViewController")
          && !-[THDocumentViewController showingExpandedWidgetView](-[THBookViewController documentViewController](self, "documentViewController"), "showingExpandedWidgetView"))
        {
          v9 = 1;
        }
      }
    }
    -[THBookViewController p_updateTitleLabelToolbarVisible:animated:](self, "p_updateTitleLabelToolbarVisible:animated:", v9, 0);
  }
}

- (void)p_syncActionlessBookmarkToolbarButtonFrame
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v3 = -[THBookViewController view](self, "view");
  -[UIButton frame](-[THBookViewController bookmarkButton](self, "bookmarkButton"), "frame");
  objc_msgSend(v3, "convertRect:fromView:", -[UIButton superview](-[THBookViewController bookmarkButton](self, "bookmarkButton"), "superview"), v4, v5, v6, v7);
  -[UIButton setFrame:](-[THBookViewController actionlessBookmarkButton](self, "actionlessBookmarkButton"), "setFrame:", v8, v9, v10, v11);
}

- (int64_t)overrideUserInterfaceStyle
{
  int64_t result;
  uint64_t v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THBookViewController;
  result = -[THBookViewController overrideUserInterfaceStyle](&v6, "overrideUserInterfaceStyle");
  if (!result)
  {
    v5 = objc_opt_class(IMThemePage, v4);
    result = TSUDynamicCast(v5, -[THBookViewController theme](self, "theme"));
    if (result)
      return (int64_t)objc_msgSend((id)result, "userInterfaceStyle");
  }
  return result;
}

- (void)p_bookViewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  UIViewController *v5;

  v5 = -[THBookViewController visibleViewController](self, "visibleViewController", a4, a3.width, a3.height);
  if (v5 == (UIViewController *)-[THBookViewController documentViewController](self, "documentViewController"))
  {
    if (-[THBookViewController tocViewControllerMayBeShrouded:](self, "tocViewControllerMayBeShrouded:", -[THBookViewController p_selectedTocViewController](self, "p_selectedTocViewController")))
    {
      -[THTOCViewController setShrouded:animated:duration:](self->mChapterBrowserController, "setShrouded:animated:duration:", 1, 0, 0.0);
    }
  }
}

- (void)p_bookViewWillRotateTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  UIViewController *v5;
  NSNotificationCenter *v6;

  v5 = -[THBookViewController visibleViewController](self, "visibleViewController", a4, a3.width, a3.height);
  if (v5 == (UIViewController *)-[THBookViewController documentViewController](self, "documentViewController")
    && -[THBookViewController tocViewControllerMayBeShrouded:](self, "tocViewControllerMayBeShrouded:", -[THBookViewController p_selectedTocViewController](self, "p_selectedTocViewController")))
  {
    -[THTOCViewController setShrouded:animated:duration:](self->mChapterBrowserController, "setShrouded:animated:duration:", 1, 0, 0.0);
  }
  v6 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter postNotificationName:object:userInfo:](v6, "postNotificationName:object:userInfo:", TSKWillRotateToInterfaceOrientationNotification, self, +[NSDictionary dictionary](NSDictionary, "dictionary"));
}

- (void)p_bookViewWillAnimateRotationToSize:(CGSize)a3 withContext:(id)a4
{
  -[THBookViewController temporarilySetHUDViewHidden:](self, "temporarilySetHUDViewHidden:", 1, a3.width, a3.height);
  -[THBookViewController updateBookmarkButton](self, "updateBookmarkButton");
}

- (void)p_bookViewDidAnimateRotationToSize:(CGSize)a3 withContext:(id)a4
{
  -[THBookViewController temporarilySetHUDViewHidden:](self, "temporarilySetHUDViewHidden:", 0, a3.width, a3.height);
}

- (void)p_bookViewDidRotateTransitionToSize:(CGSize)a3 withContext:(id)a4
{
  UIViewController *v5;
  NSNotificationCenter *v6;

  v5 = -[THBookViewController visibleViewController](self, "visibleViewController", a4, a3.width, a3.height);
  if (v5 == (UIViewController *)-[THBookViewController documentViewController](self, "documentViewController")
    && -[THBookViewController tocViewControllerMayBeShrouded:](self, "tocViewControllerMayBeShrouded:", -[THBookViewController p_selectedTocViewController](self, "p_selectedTocViewController")))
  {
    -[THTOCViewController setShrouded:animated:duration:](self->mChapterBrowserController, "setShrouded:animated:duration:", 1, 0, 0.0);
  }
  v6 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter postNotificationName:object:userInfo:](v6, "postNotificationName:object:userInfo:", TSKDidRotateToInterfaceOrientationNotification, self, +[NSDictionary dictionary](NSDictionary, "dictionary"));
}

- (void)p_bookViewDidTransitionToSize:(CGSize)a3 withContext:(id)a4
{
  -[THBookViewController p_updateFromTheme:](self, "p_updateFromTheme:", 1, a3.width, a3.height);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  BOOL IsIdentity;
  BOOL v9;
  unsigned __int8 v10;
  UIViewController *v11;
  objc_super v12;
  _QWORD v13[8];
  BOOL v14;
  _QWORD v15[8];
  BOOL v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  CGAffineTransform v21;
  objc_super v22;

  height = a3.height;
  width = a3.width;
  if (-[AEAssetViewControllerDelegate inLiveResize](-[THBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"), "inLiveResize"))
  {
    v22.receiver = self;
    v22.super_class = (Class)THBookViewController;
    -[THBookViewController viewWillTransitionToSize:withTransitionCoordinator:](&v22, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  }
  else
  {
    -[THBookViewController dismissActivePopoverIsTransitioning:](self, "dismissActivePopoverIsTransitioning:", 1);
    if (a4)
      objc_msgSend(a4, "targetTransform");
    else
      memset(&v21, 0, sizeof(v21));
    IsIdentity = CGAffineTransformIsIdentity(&v21);
    v9 = !IsIdentity;
    if (IsIdentity)
      -[THBookViewController p_bookViewWillTransitionToSize:withTransitionCoordinator:](self, "p_bookViewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
    else
      -[THBookViewController p_bookViewWillRotateTransitionToSize:withTransitionCoordinator:](self, "p_bookViewWillRotateTransitionToSize:withTransitionCoordinator:", a4, width, height);
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_771B0;
    v15[3] = &unk_4273F0;
    v16 = v9;
    v15[4] = self;
    v15[5] = &v17;
    *(double *)&v15[6] = width;
    *(double *)&v15[7] = height;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_771F0;
    v13[3] = &unk_4283E8;
    v13[4] = self;
    v13[5] = &v17;
    v14 = v9;
    *(double *)&v13[6] = width;
    *(double *)&v13[7] = height;
    v10 = objc_msgSend(a4, "animateAlongsideTransition:completion:", v15, v13);
    *((_BYTE *)v18 + 24) = v10;
    v12.receiver = self;
    v12.super_class = (Class)THBookViewController;
    -[THBookViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
    v11 = -[THBookViewController visibleViewController](self, "visibleViewController");
    if (v11 != (UIViewController *)-[THBookViewController documentViewController](self, "documentViewController"))
      -[THDocumentViewController updateTwoUpForSize:](-[THBookViewController documentViewController](self, "documentViewController"), "updateTwoUpForSize:", width, height);
    _Block_object_dispose(&v17, 8);
  }
}

- (void)p_updateToolbarButtonStatesWithTraits:(id)a3
{
  id v5;
  _BOOL8 v6;
  id v7;
  _BOOL8 v8;
  id v9;

  v5 = -[THBookViewController im_isCompactWidth](self, "im_isCompactWidth");
  if (a3)
    v6 = objc_msgSend(a3, "horizontalSizeClass") == (char *)&dword_0 + 1;
  else
    v6 = (_BOOL8)v5;
  -[THNavigationBarController setLeftItems:rightItems:](-[THBookViewController navigationBarController](self, "navigationBarController"), "setLeftItems:rightItems:", -[THBookViewController leftToolbarItems:](self, "leftToolbarItems:", v6), -[THBookViewController rightToolbarItems:](self, "rightToolbarItems:", v6));
  -[THBookViewController updateBookmarkButton](self, "updateBookmarkButton");
  v7 = objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot"), "glossaryController"), "model");
  v8 = (-[THBookViewController isTOCButtonApplicable](self, "isTOCButtonApplicable")
     || (uint64_t)objc_msgSend(v7, "entryCount") >= 1)
    && -[THBookViewController isCompleteBook](self, "isCompleteBook");
  -[UIBarButtonItem setEnabled:](-[THBookViewController tocGlossaryButtonItem](self, "tocGlossaryButtonItem"), "setEnabled:", v8);
  if (-[THBookViewController isBookEpub](self, "isBookEpub"))
    v9 = -[THDocumentViewController isDocumentLoaded](-[THBookViewController documentViewController](self, "documentViewController"), "isDocumentLoaded");
  else
    v9 = &dword_0 + 1;
  -[UIBarButtonItem setEnabled:](-[THBookViewController searchButtonItem](self, "searchButtonItem"), "setEnabled:", v9);
}

- (void)p_updateToolbarButtonStates
{
  -[THBookViewController p_updateToolbarButtonStatesWithTraits:](self, "p_updateToolbarButtonStatesWithTraits:", 0);
}

- (void)p_updateFromTheme:(BOOL)a3
{
  _BOOL8 v3;
  THTheme *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  THBookViewController *v10;
  UIViewController *v11;
  uint64_t v12;
  uint64_t v13;
  UIViewController *v14;
  double v15;
  double v16;
  _BOOL8 v17;

  v3 = a3;
  v5 = -[THBookViewController theme](self, "theme");
  -[THNavigationOverlayView setTheme:force:](-[THBookViewController navigationOverlayView](self, "navigationOverlayView"), "setTheme:force:", v5, v3);
  -[THBookViewController p_navigationOverlayFrame](self, "p_navigationOverlayFrame");
  -[THNavigationOverlayView setFrame:](-[THBookViewController navigationOverlayView](self, "navigationOverlayView"), "setFrame:", v6, v7, v8, v9);
  if (-[THBookViewController isBookEpub](self, "isBookEpub"))
  {
    -[THTheme stylizeOuterView:](v5, "stylizeOuterView:", -[THBookViewController view](self, "view"));
    objc_msgSend(-[THBookViewController view](self, "view"), "setBackgroundColor:", -[THTheme backgroundColorForTraitEnvironment:](-[THBookViewController theme](self, "theme"), "backgroundColorForTraitEnvironment:", self));
    -[THTheme stylizeBCNavigationBar:](v5, "stylizeBCNavigationBar:", -[THBookViewController titleLabelNavigationBar](self, "titleLabelNavigationBar"));
    -[UILabel setTextColor:](-[THBookViewController titleLabel](self, "titleLabel"), "setTextColor:", -[THTheme headerTextColorDimmed](v5, "headerTextColorDimmed"));
    -[THNotesViewController setTheme:](self->mNotesFullscreenViewController, "setTheme:", -[THBookViewController theme](self, "theme"));
    -[THTOCGlossaryMenuPopoverViewController setTheme:](-[THBookViewController TOCGlossaryViewController](self, "TOCGlossaryViewController"), "setTheme:", -[THBookViewController theme](self, "theme"));
  }
  -[THBookViewController refreshStatusBarAppearance](self, "refreshStatusBarAppearance");
  v10 = self;
  if (-[UIViewController conformsToProtocol:](-[THBookViewController visibleViewController](self, "visibleViewController"), "conformsToProtocol:", &OBJC_PROTOCOL___THNavigationBarThemeDelegate))v10 = -[THBookViewController visibleViewController](self, "visibleViewController");
  -[THNavigationBarController updateViewStateWithThemeDelegate:](-[THBookViewController navigationBarController](self, "navigationBarController"), "updateViewStateWithThemeDelegate:", v10);
  if (-[THBookViewController isBookEpub](self, "isBookEpub"))
  {
    v11 = -[THBookViewController visibleViewController](self, "visibleViewController");
    v13 = objc_opt_class(THFlowTOCViewController, v12);
    if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
      -[THNavigationBarController setCenterItemTextColor:](-[THBookViewController navigationBarController](self, "navigationBarController"), "setCenterItemTextColor:", -[THTheme headerTextColor](v5, "headerTextColor"));
  }
  -[THNavigationBarController clearAutohideTimer](-[THBookViewController navigationBarController](self, "navigationBarController"), "clearAutohideTimer");
  v14 = -[THBookViewController visibleViewController](self, "visibleViewController");
  if (v14 == (UIViewController *)-[THBookViewController documentViewController](self, "documentViewController")
    && -[THBookViewController isBookEpub](self, "isBookEpub"))
  {
    -[THDocumentReflowableLayoutConfiguration chromeAnimationInterval](-[THDocumentViewController configuration](-[THBookViewController documentViewController](self, "documentViewController"), "configuration"), "chromeAnimationInterval");
    -[THNavigationOverlayView setShowHideAnimationDuration:](-[THBookViewController navigationOverlayView](self, "navigationOverlayView"), "setShowHideAnimationDuration:", v15);
    -[THDocumentReflowableLayoutConfiguration chromeAnimationInterval](-[THDocumentViewController configuration](-[THBookViewController documentViewController](self, "documentViewController"), "configuration"), "chromeAnimationInterval");
    -[THNavigationBarController setShowHideDuration:](-[THBookViewController navigationBarController](self, "navigationBarController"), "setShowHideDuration:", v16);
    v17 = -[THDocumentReflowableLayoutConfiguration toolbarSeparatorsVisible](-[THDocumentViewController configuration](-[THBookViewController documentViewController](self, "documentViewController"), "configuration"), "toolbarSeparatorsVisible");
  }
  else
  {
    -[THNavigationOverlayView setShowHideAnimationDuration:](-[THBookViewController navigationOverlayView](self, "navigationOverlayView"), "setShowHideAnimationDuration:", 0.15);
    -[THNavigationBarController setShowHideDuration:](-[THBookViewController navigationBarController](self, "navigationBarController"), "setShowHideDuration:", 0.15);
    v17 = 0;
  }
  -[THDocumentViewController updateForTheme:](-[THBookViewController documentViewController](self, "documentViewController"), "updateForTheme:", v5);
  if (-[THBookViewController isBookEpub](self, "isBookEpub"))
  {
    -[THFlowTOCViewController setTheme:](self->mFlowTocViewController, "setTheme:", v5);
    -[THiOSFlowToCTableViewController setTheme:](self->mFlowToCTableViewController, "setTheme:", v5);
    -[THNotesViewController setTheme:](self->mNotesFullscreenViewController, "setTheme:", v5);
    -[THSearchViewController setTheme:](-[THBookViewController searchViewController](self, "searchViewController"), "setTheme:", v5);
    -[THBookmarkMenuPopoverViewController setTheme:](-[THBookViewController bookmarkViewController](self, "bookmarkViewController"), "setTheme:", v5);
  }
  -[THDisplaySettingsViewController setTheme:](-[THBookViewController displaySettingsViewController](self, "displaySettingsViewController"), "setTheme:", v5);
  -[THNavigationOverlayView setSeparatorsVisible:](-[THBookViewController navigationOverlayView](self, "navigationOverlayView"), "setSeparatorsVisible:", v17);
  -[BCNavigationBar setSeparatorsVisible:](-[THNavigationBarController navigationBar](-[THBookViewController navigationBarController](self, "navigationBarController"), "navigationBar"), "setSeparatorsVisible:", v17);
  -[BCDisplayOnlyNavigationBar setSeparatorsVisible:](-[THBookViewController titleLabelNavigationBar](self, "titleLabelNavigationBar"), "setSeparatorsVisible:", v17);
}

- (BOOL)disableRotationEdgeClip
{
  if ((objc_opt_respondsToSelector(-[THBookViewController visibleViewController](self, "visibleViewController"), "disableRotationEdgeClip") & 1) != 0)return -[UIViewController disableRotationEdgeClip](-[THBookViewController visibleViewController](self, "visibleViewController"), "disableRotationEdgeClip");
  else
    return 0;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)keyCommands
{
  id v3;
  UIKeyCommand *v4;
  UIKeyCommand *v5;
  UIKeyCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THBookViewController;
  v3 = objc_msgSend(-[THBookViewController keyCommands](&v8, "keyCommands"), "mutableCopy");
  if (!v3)
    v3 = +[NSMutableArray array](NSMutableArray, "array");
  if (objc_msgSend(-[THDocumentViewController canvasViewController](-[THBookViewController documentViewController](self, "documentViewController"), "canvasViewController"), "isFirstResponder"))
  {
    v4 = +[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Next Page"), &stru_43D7D8, 0), 0, "books_pageForward:", UIKeyInputRightArrow, 0, 0);
    -[UIKeyCommand setWantsPriorityOverSystemBehavior:](v4, "setWantsPriorityOverSystemBehavior:", 1);
    -[UIKeyCommand setAllowsAutomaticMirroring:](v4, "setAllowsAutomaticMirroring:", 0);
    objc_msgSend(v3, "addObject:", v4);
    v5 = +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR(" "), 0, "books_pageForward:");
    -[UIKeyCommand setWantsPriorityOverSystemBehavior:](v5, "setWantsPriorityOverSystemBehavior:", 1);
    objc_msgSend(v3, "addObject:", v5);
    v6 = +[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Previous Page"), &stru_43D7D8, 0), 0, "books_pageBackward:", UIKeyInputLeftArrow, 0, 0);
    -[UIKeyCommand setWantsPriorityOverSystemBehavior:](v6, "setWantsPriorityOverSystemBehavior:", 1);
    -[UIKeyCommand setAllowsAutomaticMirroring:](v6, "setAllowsAutomaticMirroring:", 0);
    objc_msgSend(v3, "addObject:", v6);
  }
  return v3;
}

- (void)books_toggleBookmark:(id)a3
{
  -[THBookViewController addRemoveBookmarkCurrentPage](self, "addRemoveBookmarkCurrentPage", a3);
}

- (void)books_increaseSize:(id)a3
{
  -[THBookViewController _adjustSizeIncreasing:](self, "_adjustSizeIncreasing:", 1);
}

- (void)books_decreaseSize:(id)a3
{
  -[THBookViewController _adjustSizeIncreasing:](self, "_adjustSizeIncreasing:", 0);
}

- (void)_adjustSizeIncreasing:(BOOL)a3
{
  THDisplaySettingsViewController *v5;

  v5 = -[THBookViewController displaySettingsViewController](self, "displaySettingsViewController");
  if (!v5)
    v5 = -[THDisplaySettingsViewController initWithNibName:bundle:]([THDisplaySettingsViewController alloc], "initWithNibName:bundle:", 0, 0);
  -[THDisplaySettingsViewController setDelegate:](v5, "setDelegate:", TSUProtocolCast(&OBJC_PROTOCOL___THDisplaySettingsViewControllerDelegate, -[THBookViewController visibleViewController](self, "visibleViewController")));
  -[THDisplaySettingsViewController setTheme:](v5, "setTheme:", -[THBookViewController theme](self, "theme"));
  if (a3)
    -[THDisplaySettingsViewController increaseFontSize:](v5, "increaseFontSize:", self);
  else
    -[THDisplaySettingsViewController decreaseFontSize:](v5, "decreaseFontSize:", self);
}

- (void)books_find:(id)a3
{
  -[THBookViewController showSearchPopover](self, "showSearchPopover", a3);
}

- (void)p_insertDVCInBack
{
  -[THBookViewController p_insertDVCInBackAnimated:](self, "p_insertDVCInBackAnimated:", 0);
}

- (void)p_insertDVCInBackAnimated:(BOOL)a3
{
  -[THBookViewController p_addViewControllerInBack:animated:](self, "p_addViewControllerInBack:animated:", -[THBookViewController documentViewController](self, "documentViewController"), a3);
}

- (void)p_showDVC
{
  UIViewController *v3;

  v3 = -[THBookViewController visibleViewController](self, "visibleViewController");
  if (v3 != (UIViewController *)-[THBookViewController documentViewController](self, "documentViewController"))
  {
    -[THBookViewController p_addViewControllerInFront:reason:](self, "p_addViewControllerInFront:reason:", -[THBookViewController documentViewController](self, "documentViewController"), CFSTR("THVantageChangeReasonTransitionToDVC"));
    -[THFlowTOCViewController setReflowablePaginationController:](-[THBookViewController flowTocViewController](self, "flowTocViewController"), "setReflowablePaginationController:", -[THDocumentViewController reflowablePaginationController](-[THBookViewController documentViewController](self, "documentViewController"), "reflowablePaginationController"));
    -[THBookViewController p_setupCanvasExitTransformController](self, "p_setupCanvasExitTransformController");
    objc_msgSend(-[THBookViewController p_selectedTocViewController](self, "p_selectedTocViewController"), "setShrouded:animated:duration:", 1, 0, 0.0);
    -[THBookViewController removeTOC](self, "removeTOC");
    -[THDocumentViewController setVisibleInfoUpdatesAllowedInLandscape:](-[THBookViewController documentViewController](self, "documentViewController"), "setVisibleInfoUpdatesAllowedInLandscape:", 1);
  }
}

- (void)p_showDVCAnimated:(BOOL)a3 withLink:(id)a4
{
  id v4;
  _BOOL4 v5;
  int v7;
  int v8;
  UIViewController *v9;
  THDocumentViewController *v10;
  double v11;
  double v12;
  double v13;
  THTOCSplitTransitionView *v14;
  THTOCSplitTransitionView *v15;
  void *mFlowToCTableViewController;

  v4 = a4;
  v5 = a3;
  if (a4)
    goto LABEL_2;
  if (-[THDocumentViewController isDocumentLoaded](-[THBookViewController documentViewController](self, "documentViewController"), "isDocumentLoaded")&& -[THDocumentNavigator currentContentNode](-[THDocumentViewController documentNavigator](-[THBookViewController documentViewController](self, "documentViewController"), "documentNavigator"), "currentContentNode"))
  {
    v4 = 0;
LABEL_9:
    v8 = 0;
    v7 = 1;
    goto LABEL_10;
  }
  v4 = objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "linkForNavigationUnitIndex:", 0);
  if (!v4)
    goto LABEL_9;
LABEL_2:
  if (-[THDocumentViewController isDocumentLoaded](-[THBookViewController documentViewController](self, "documentViewController"), "isDocumentLoaded"))
  {
    -[THDocumentViewController followLink:](-[THBookViewController documentViewController](self, "documentViewController"), "followLink:", v4);
    v7 = 0;
    v8 = 1;
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
LABEL_10:
  v9 = -[THBookViewController visibleViewController](self, "visibleViewController");
  if (v9 != (UIViewController *)-[THBookViewController documentViewController](self, "documentViewController"))
  {
    -[THBookViewController p_addViewControllerInFront:reason:](self, "p_addViewControllerInFront:reason:", -[THBookViewController documentViewController](self, "documentViewController"), CFSTR("THVantageChangeReasonTransitionToDVC"));
    -[THFlowTOCViewController setReflowablePaginationController:](-[THBookViewController flowTocViewController](self, "flowTocViewController"), "setReflowablePaginationController:", -[THDocumentViewController reflowablePaginationController](-[THBookViewController documentViewController](self, "documentViewController"), "reflowablePaginationController"));
    -[THDocumentViewController setVisibleInfoUpdatesAllowedInLandscape:](-[THBookViewController documentViewController](self, "documentViewController"), "setVisibleInfoUpdatesAllowedInLandscape:", 1);
    if (((v7 | v8) & 1) == 0)
    {
      -[THDocumentViewController followLink:](-[THBookViewController documentViewController](self, "documentViewController"), "followLink:", v4);
      if (!v5)
        return;
      goto LABEL_14;
    }
    -[THBookViewController dismissActivePopover](self, "dismissActivePopover");
  }
  if (!v5)
    return;
LABEL_14:
  v10 = -[THBookViewController documentViewController](self, "documentViewController");
  -[THFlowTOCViewController bottomSeparatorYPositionForChapterIndex:lessonIndex:](self->mFlowTocViewController, "bottomSeparatorYPositionForChapterIndex:lessonIndex:", -[THDocumentViewController currentChapter](v10, "currentChapter"), -[THDocumentViewController currentTOCLessonIndex](v10, "currentTOCLessonIndex"));
  objc_msgSend(-[THFlowTOCViewController view](self->mFlowTocViewController, "view"), "convertPoint:toView:", -[THBookViewController view](self, "view"), 0.0, v11);
  v13 = v12;
  -[THBookViewController setDisallowRotate:](self, "setDisallowRotate:", 1);
  v14 = [THTOCSplitTransitionView alloc];
  objc_msgSend(-[THBookViewController view](self, "view"), "bounds");
  v15 = -[THTOCSplitTransitionView initWithFrame:](v14, "initWithFrame:");
  self->mDocumentToTOCViewTransitionView = v15;
  -[THTransitionView setDelegate:](v15, "setDelegate:", self);
  -[THTOCSplitTransitionView setSplitPositionY:](self->mDocumentToTOCViewTransitionView, "setSplitPositionY:", v13);
  mFlowToCTableViewController = self->mFlowToCTableViewController;
  if (!mFlowToCTableViewController)
    mFlowToCTableViewController = self->mFlowTocViewController;
  -[THTransitionView setFromViewController:](self->mDocumentToTOCViewTransitionView, "setFromViewController:", mFlowToCTableViewController);
  -[THTransitionView setToViewController:](self->mDocumentToTOCViewTransitionView, "setToViewController:", v10);
  -[THTOCSplitTransitionView setAnimationDuration:](self->mDocumentToTOCViewTransitionView, "setAnimationDuration:", 0.65);
  objc_msgSend(-[THBookViewController view](self, "view"), "insertSubview:belowSubview:", self->mDocumentToTOCViewTransitionView, -[THNavigationBarController view](self->mNavigationBarController, "view"));
  -[THTOCSplitTransitionView beginTransition](self->mDocumentToTOCViewTransitionView, "beginTransition");

  -[THBookViewController vantageDidChangeBy:reason:](self, "vantageDidChangeBy:reason:", self, CFSTR("THVantageChangeReasonTransitionToDVC"));
}

- (void)p_setVisibleViewControllerToViewController:(id)a3 reason:(id)a4
{
  _QWORD v7[5];

  if (-[THBookViewController visibleViewController](self, "visibleViewController") != a3)
  {
    -[THBookViewController vantageWillChangeBy:reason:](self, "vantageWillChangeBy:reason:", self, a4);
    -[THBookViewController setVisibleViewController:](self, "setVisibleViewController:", a3);
    -[THBookViewController vantageDidChangeBy:reason:](self, "vantageDidChangeBy:reason:", self, a4);
    if (-[THBookViewController isBookEpub](self, "isBookEpub"))
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_77E38;
      v7[3] = &unk_426DD0;
      v7[4] = self;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v7, 0.2);
    }
    else
    {
      -[THBookViewController p_updateFromTheme:](self, "p_updateFromTheme:", 0);
    }
    -[THBookViewController p_updateToolbarButtonStates](self, "p_updateToolbarButtonStates");
    -[THBookViewController p_updateCenterTitle](self, "p_updateCenterTitle");
    if (-[THBookViewController p_isTOCViewController:](self, "p_isTOCViewController:", -[THBookViewController visibleViewController](self, "visibleViewController")))
    {
      -[THBookViewController p_setNavigationOverlayHidden:animated:autoHides:](self, "p_setNavigationOverlayHidden:animated:autoHides:", 1, 1, 0);
    }
    -[THBookspotHistoryStack setSeekDistinctSpots:](-[THBookViewController bookspotHistoryStack](self, "bookspotHistoryStack"), "setSeekDistinctSpots:", -[THBookViewController documentViewController](self, "documentViewController") == a3);
    -[THBookViewController buildHoverRegions](self, "buildHoverRegions");
    -[THBookViewController setNeedsWhitePointAdaptivityStyleUpdate](self, "setNeedsWhitePointAdaptivityStyleUpdate");
  }
}

- (void)transitionWillBegin:(id)a3
{
  if (self->mDocumentToTOCViewTransitionView == a3)
  {
    objc_msgSend(-[THDocumentViewController interactiveCanvasController](-[THBookViewController documentViewController](self, "documentViewController"), "interactiveCanvasController"), "pushThreadedLayoutAndRenderDisabled");
    objc_msgSend(-[THDocumentViewController interactiveCanvasController](-[THBookViewController documentViewController](self, "documentViewController"), "interactiveCanvasController"), "layoutIfNeeded");
    objc_msgSend(-[THDocumentViewController interactiveCanvasController](-[THBookViewController documentViewController](self, "documentViewController"), "interactiveCanvasController"), "popThreadedLayoutAndRenderDisabled");
    objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](-[THBookViewController documentViewController](self, "documentViewController"), "interactiveCanvasController"), "layerHost"), "canvasLayer"), "pushLayoutDisabled");
    -[THNavigationBarController setNavigationBarHidden:animated:](-[THBookViewController navigationBarController](self, "navigationBarController"), "setNavigationBarHidden:animated:", 1, 0);
    +[CATransaction flush](CATransaction, "flush");
  }
  else if (self->mTOCToDocumentViewTransitionView == a3)
  {
    -[THNavigationBarController setNavigationBarHidden:animated:](-[THBookViewController navigationBarController](self, "navigationBarController"), "setNavigationBarHidden:animated:", 1, 0);
    -[THBookViewController p_updateTitleLabelToolbarVisible:animated:](self, "p_updateTitleLabelToolbarVisible:animated:", 0, 1);
  }
}

- (void)transitionDidFinish:(id)a3
{
  if (self->mDocumentToTOCViewTransitionView == a3)
  {
    objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](-[THBookViewController documentViewController](self, "documentViewController"), "interactiveCanvasController"), "layerHost"), "canvasLayer"), "popLayoutDisabled");
    -[THBookViewController hideTOC](self, "hideTOC");
    -[THBookViewController p_showDVC](self, "p_showDVC");
    self->mDocumentToTOCViewTransitionView = 0;
    -[THBookViewController p_updateTitleLabelToolbarVisible:animated:](self, "p_updateTitleLabelToolbarVisible:animated:", 1, 1);
  }
  else if (self->mTOCToDocumentViewTransitionView == a3)
  {
    if (objc_msgSend(a3, "wasReversed"))
    {
      -[THBookViewController p_showDVC](self, "p_showDVC");
      -[THBookViewController hideTOC](self, "hideTOC");
      -[THBookViewController p_updateTitleLabelToolbarVisible:animated:](self, "p_updateTitleLabelToolbarVisible:animated:", 1, 1);
    }
    else
    {
      -[THBookViewController p_removeViewController:](self, "p_removeViewController:", -[THBookViewController documentViewController](self, "documentViewController"));
      -[THBookViewController showTOC](self, "showTOC");
    }
    self->mTOCToDocumentViewTransitionView = 0;
  }
  objc_msgSend(a3, "removeFromSuperview");
  -[THBookViewController setDisallowRotate:](self, "setDisallowRotate:", 0);
}

- (void)p_setupCanvasExitTransformController
{
  id v3;
  void *v4;
  id v5;
  THWFreeTransformController *v6;

  v3 = -[THBookViewController currentPresentationType](self, "currentPresentationType");
  if (self->mDocumentViewController
    && (v4 = v3, (objc_msgSend(v3, "isFlow") & 1) == 0)
    && -[THDocumentViewController isDocumentLoaded](self->mDocumentViewController, "isDocumentLoaded")
    && !-[THBookViewController isBookEpub](self, "isBookEpub"))
  {
    if (self->mDocumentViewController
      && (objc_msgSend(v4, "isFlow") & 1) == 0
      && !self->mCanvasExitTransformDelegate
      && !self->mCanvasExitTransformController)
    {
      v5 = objc_msgSend(objc_msgSend(-[THDocumentViewController canvasViewController](-[THBookViewController documentViewController](self, "documentViewController"), "canvasViewController"), "canvasView"), "enclosingScrollView");
      self->mCanvasExitTransformDelegate = -[THCanvasExitTransformDelegate initWithBookViewController:]([THCanvasExitTransformDelegate alloc], "initWithBookViewController:", self);
      v6 = objc_alloc_init(THWFreeTransformController);
      self->mCanvasExitTransformController = v6;
      -[THWFreeTransformController setDelegate:](v6, "setDelegate:", self->mCanvasExitTransformDelegate);
      -[THWFreeTransformController setScaleThreshold:](self->mCanvasExitTransformController, "setScaleThreshold:", 0.75);
      -[THWFreeTransformController setTargetLayer:](self->mCanvasExitTransformController, "setTargetLayer:", objc_msgSend(v5, "layer"));
      -[THWFreeTransformController setSmoothEdges:](self->mCanvasExitTransformController, "setSmoothEdges:", 1);
    }
  }
  else
  {
    -[THWFreeTransformController setTargetLayer:](self->mCanvasExitTransformController, "setTargetLayer:", 0);

    self->mCanvasExitTransformDelegate = 0;
    self->mCanvasExitTransformController = 0;
  }
}

- (unint64_t)absolutePageIndexForCFI:(id)a3
{
  return (unint64_t)objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "absolutePageIndexForCFI:", a3);
}

- (id)storageForCFI:(id)a3
{
  return objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "storageForCFI:", a3);
}

- (THGlossaryViewController)glossaryViewController
{
  return self->mGlossaryViewController;
}

- (void)hideGlossaryWithDestinationViewController:(id)a3
{
  -[THBookViewController hideGlossaryWithDestinationViewController:animated:completion:](self, "hideGlossaryWithDestinationViewController:animated:completion:", a3, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"), 0);
}

- (void)p_unloadGlossaryViewControllerIfHiding
{
  if (self->mHidingGlossary)
  {
    if (self->mGlossaryViewController)
    {
      -[THGlossaryViewController unload](-[THBookViewController glossaryViewController](self, "glossaryViewController"), "unload");

      self->mGlossaryViewController = 0;
      self->mHidingGlossary = 0;
    }
  }
}

- (void)hideGlossaryWithDestinationViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  _QWORD v9[6];

  v6 = a4;
  -[THBookViewController setPresentingGlossary:](self, "setPresentingGlossary:", 0);
  if (self->mHidingGlossary || !-[THBookViewController isGlossaryVisible](self, "isGlossaryVisible"))
  {
    if (a5)
      (*((void (**)(id))a5 + 2))(a5);
  }
  else
  {
    self->mHidingGlossary = 1;
    -[THBookViewController vantageWillChangeBy:reason:](self, "vantageWillChangeBy:reason:", self, CFSTR("THVantageChangeReasonTransitionFromGlossary"));
    -[THBookViewController hideToolbarAnimated:](self, "hideToolbarAnimated:", 0);
    if (!a3 || -[THBookViewController documentViewController](self, "documentViewController") == a3)
      -[THBookViewController p_showDVC](self, "p_showDVC");
    else
      -[THBookViewController p_addViewControllerInFront:reason:](self, "p_addViewControllerInFront:reason:", a3, CFSTR("THVantageChangeReasonTransitionFromGlossary"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_7838C;
    v9[3] = &unk_426E78;
    v9[4] = self;
    v9[5] = a5;
    -[THGlossaryViewController dismissViewControllerAnimated:completion:](-[THBookViewController glossaryViewController](self, "glossaryViewController"), "dismissViewControllerAnimated:completion:", v6, v9);
    -[THBookViewController vantageDidChangeBy:reason:](self, "vantageDidChangeBy:reason:", self, CFSTR("THVantageChangeReasonTransitionFromGlossary"));
  }
}

- (void)p_ensureGlossaryViewController
{
  THGlossaryViewController *v3;

  -[THBookViewController p_unloadGlossaryViewControllerIfHiding](self, "p_unloadGlossaryViewControllerIfHiding");
  if (!self->mGlossaryViewController)
  {
    v3 = +[THGlossaryViewController newViewController](THGlossaryViewController, "newViewController");
    self->mGlossaryViewController = v3;
    -[THGlossaryViewController setTransitioningDelegate:](v3, "setTransitioningDelegate:", self);
    -[THGlossaryViewController furtherInitWithGlossaryController:](self->mGlossaryViewController, "furtherInitWithGlossaryController:", objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot"), "glossaryController"));
    -[THGlossaryViewController setBookViewController:](self->mGlossaryViewController, "setBookViewController:", self);
    -[THGlossaryViewController setModalPresentationStyle:](self->mGlossaryViewController, "setModalPresentationStyle:", 0);
    -[THGlossaryViewController setOverrideUserInterfaceStyle:](self->mGlossaryViewController, "setOverrideUserInterfaceStyle:", 1);
    -[THBookLinkResolver setGlossaryLinkResolver:](-[THBookViewController bookLinkResolver](self, "bookLinkResolver"), "setGlossaryLinkResolver:", -[THGlossaryViewController glossaryLinkResolver](self->mGlossaryViewController, "glossaryLinkResolver"));
  }
}

- (void)p_showGlossary
{
  _QWORD activity_block[5];

  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_784E8;
  activity_block[3] = &unk_426DD0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "Show Glossary", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)showGlossary:(id)a3
{
  if (-[THBookViewController isGlossaryVisible](self, "isGlossaryVisible", a3))
  {
    -[THBookViewController hideGlossaryWithDestinationViewController:](self, "hideGlossaryWithDestinationViewController:", -[THGlossaryViewController originalViewController](-[THBookViewController glossaryViewController](self, "glossaryViewController"), "originalViewController"));
  }
  else
  {
    -[THBookViewController dismissTOCGlossaryView:](self, "dismissTOCGlossaryView:", 1);
    -[THBookViewController p_ensureGlossaryViewController](self, "p_ensureGlossaryViewController");
    -[THGlossaryViewController showFirstEntry](-[THBookViewController glossaryViewController](self, "glossaryViewController"), "showFirstEntry");
    -[THBookViewController p_showGlossary](self, "p_showGlossary");
  }
}

- (void)showGlossaryEntry:(id)a3
{
  if (!-[THBookViewController isGlossaryVisible](self, "isGlossaryVisible"))
    -[THBookViewController p_showGlossary](self, "p_showGlossary");
  -[THGlossaryViewController showEntry:](-[THBookViewController glossaryViewController](self, "glossaryViewController"), "showEntry:", a3);
}

- (void)showGlossaryEntryAtPath:(id)a3
{
  if (!-[THBookViewController isGlossaryVisible](self, "isGlossaryVisible"))
    -[THBookViewController p_showGlossary](self, "p_showGlossary");
  -[THGlossaryViewController showEntryAtPath:](-[THBookViewController glossaryViewController](self, "glossaryViewController"), "showEntryAtPath:", a3);
}

- (void)introMediaControllerMoviePlayerWillShowControls
{
  UIViewController *v3;

  v3 = -[THBookViewController visibleViewController](self, "visibleViewController");
  if (v3 == (UIViewController *)self->mFlowTocViewController
    || (v3 = -[THBookViewController visibleViewController](self, "visibleViewController"),
        v3 == (UIViewController *)self->mChapterBrowserController))
  {
    -[UIViewController introMediaControllerMoviePlayerWillShowControls](v3, "introMediaControllerMoviePlayerWillShowControls");
  }
}

- (void)introMediaControllerMoviePlayerWillHideControls
{
  UIViewController *v3;

  v3 = -[THBookViewController visibleViewController](self, "visibleViewController");
  if (v3 == (UIViewController *)self->mFlowTocViewController
    || (v3 = -[THBookViewController visibleViewController](self, "visibleViewController"),
        v3 == (UIViewController *)self->mChapterBrowserController))
  {
    -[UIViewController introMediaControllerMoviePlayerWillHideControls](v3, "introMediaControllerMoviePlayerWillHideControls");
  }
}

- (void)TOCViewControllerDidShowIntroMedia:(id)a3
{
  self->mHasSeenIntroMedia = 1;
}

- (id)TOCViewControllerToolbarBackgroundColor:(id)a3
{
  return -[THBookViewController backgroundColorForNavigationBar:](self, "backgroundColorForNavigationBar:", -[THNavigationBarController navigationBar](-[THBookViewController navigationBarController](self, "navigationBarController", a3), "navigationBar"));
}

- (BOOL)p_shouldShowShroudForVisibleSize:(CGSize)a3
{
  double height;
  double width;
  BOOL result;
  double v7;
  double v8;
  double v9;
  double v10;

  height = a3.height;
  width = a3.width;
  if ((TSUPhoneUI(self, a2) & 1) != 0)
    return 1;
  objc_msgSend(objc_msgSend(-[THBookViewController view](self, "view"), "window"), "statusBarMinDimension");
  v8 = v7;
  -[THDocumentViewController paginatedSpreadSize](-[THBookViewController documentViewController](self, "documentViewController"), "paginatedSpreadSize");
  result = 0;
  if (v9 > 0.0 && width > 0.0)
    return vabdd_f64(v10 / v9, (height - v8) / width) >= 0.00999999978;
  return result;
}

- (void)p_buildIntroMediaViewController
{
  -[THBookViewController setIntroMediaViewController:](self, "setIntroMediaViewController:", -[THiOSIntroMediaViewController initWithDocumentRoot:]([THiOSIntroMediaViewController alloc], "initWithDocumentRoot:", -[THBookViewController documentRoot](self, "documentRoot")));
}

- (id)p_selectedTocViewController
{
  return -[THBookViewController p_selectedTocViewControllerCreateIfNecessary:](self, "p_selectedTocViewControllerCreateIfNecessary:", 1);
}

- (id)p_selectedTocViewControllerCreateIfNecessary:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v6;

  v3 = a3;
  if ((objc_msgSend(-[THBookViewController currentPresentationType](self, "currentPresentationType"), "isFlow") & 1) != 0|| -[THBookViewController isBookEpub](self, "isBookEpub"))
  {
    if (v3)
      return -[THBookViewController flowTocViewController](self, "flowTocViewController");
    v6 = 64;
  }
  else
  {
    if (v3)
      return -[THBookViewController chapterBrowserController](self, "chapterBrowserController");
    v6 = 80;
  }
  return *(Class *)((char *)&self->super.super.super.isa + v6);
}

- (id)p_unselectedTocViewController
{
  if ((objc_msgSend(-[THBookViewController currentPresentationType](self, "currentPresentationType"), "isFlow") & 1) != 0|| -[THBookViewController isBookEpub](self, "isBookEpub"))
  {
    return -[THBookViewController chapterBrowserController](self, "chapterBrowserController");
  }
  else
  {
    return -[THBookViewController flowTocViewController](self, "flowTocViewController");
  }
}

- (void)p_updateTOCForUpcomingPresentationModeChange
{
  -[THBookViewController p_removeViewController:](self, "p_removeViewController:", -[THBookViewController p_selectedTocViewController](self, "p_selectedTocViewController"));
}

- (BOOL)p_introMediaIsUnseenAndSeeable
{
  return !self->mHasSeenIntroMedia;
}

- (void)p_updateTOCForPresentationModeChange
{
  UIViewController *v3;
  UIViewController *v4;

  -[THBookViewController p_removeViewController:](self, "p_removeViewController:", -[THBookViewController p_unselectedTocViewController](self, "p_unselectedTocViewController"));
  v3 = -[THBookViewController p_selectedTocViewController](self, "p_selectedTocViewController");
  if (!-[UIViewController introMediaViewController](v3, "introMediaViewController")
    && -[THBookViewController introMediaViewController](self, "introMediaViewController"))
  {
    -[UIViewController setIntroMediaViewController:showIt:](v3, "setIntroMediaViewController:showIt:", -[THBookViewController introMediaViewController](self, "introMediaViewController"), -[THBookViewController p_introMediaIsUnseenAndSeeable](self, "p_introMediaIsUnseenAndSeeable"));
  }
  if (-[THBookViewController shouldKeepTOCInBackground:](self, "shouldKeepTOCInBackground:", v3)
    && -[THBookViewController visibleViewController](self, "visibleViewController") != v3
    && !-[UIView superview](-[UIViewController view](v3, "view"), "superview"))
  {
    -[THBookViewController p_addViewControllerInBack:](self, "p_addViewControllerInBack:", v3);
    -[UIViewController setShrouded:animated:duration:](v3, "setShrouded:animated:duration:", 1, 0, 0.0);
  }
  v4 = -[THBookViewController visibleViewController](self, "visibleViewController");
  if (v4 == (UIViewController *)-[THBookViewController documentViewController](self, "documentViewController"))
    -[THBookViewController p_setupCanvasExitTransformController](self, "p_setupCanvasExitTransformController");
}

- (void)putTOCInBack
{
  -[THBookViewController p_addViewControllerInBack:](self, "p_addViewControllerInBack:", -[THBookViewController p_selectedTocViewController](self, "p_selectedTocViewController"));
}

- (void)showTOC
{
  THChapterBrowserController *v3;
  UIViewController *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  _QWORD v24[6];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[13];
  __int128 v29;
  __int128 v30;
  __int128 v31;

  -[THBookViewController temporarilySetHUDViewHidden:](self, "temporarilySetHUDViewHidden:", 1);
  -[THBookViewController hideNavigationHistory](self, "hideNavigationHistory");
  v3 = -[THBookViewController p_selectedTocViewController](self, "p_selectedTocViewController");
  v4 = -[THBookViewController visibleViewController](self, "visibleViewController");
  if (v4 == (UIViewController *)-[THBookViewController documentViewController](self, "documentViewController")
    && v3 == -[THBookViewController chapterBrowserController](self, "chapterBrowserController"))
  {
    -[THDocumentViewController willStartRevealTOC](self->mDocumentViewController, "willStartRevealTOC");
    -[THDocumentViewController zoomOutIfNecessaryPriorToNavigation](-[THBookViewController documentViewController](self, "documentViewController"), "zoomOutIfNecessaryPriorToNavigation");
    if (!UIAccessibilityIsSwitchControlRunning() && !UIAccessibilityIsVoiceOverRunning())
      -[THNavigationBarController setNavigationBarHidden:animated:](-[THBookViewController navigationBarController](self, "navigationBarController"), "setNavigationBarHidden:animated:", 1, 1);
    -[THBookViewController p_addViewControllerInBack:](self, "p_addViewControllerInBack:", -[THBookViewController chapterBrowserController](self, "chapterBrowserController"));
    v5 = -[THDocumentViewController currentRelativePageIndex](self->mDocumentViewController, "currentRelativePageIndex");
    v6 = -[THDocumentViewController currentChapter](self->mDocumentViewController, "currentChapter");
    -[THChapterBrowserController willTransitionFromChapterIndex:](-[THBookViewController chapterBrowserController](self, "chapterBrowserController"), "willTransitionFromChapterIndex:", v6);
    -[THChapterBrowserController prepareToScrollToThumbnailAtIndex:chapterIndex:](-[THBookViewController chapterBrowserController](self, "chapterBrowserController"), "prepareToScrollToThumbnailAtIndex:chapterIndex:", v5, v6);
    -[THChapterBrowserController hidePageThumbnailAtIndex:chapterIndex:scrollIfNecessary:](-[THBookViewController chapterBrowserController](self, "chapterBrowserController"), "hidePageThumbnailAtIndex:chapterIndex:scrollIfNecessary:", v5, v6, 1);
    -[THChapterBrowserController scrollToThumbnailAtIndex:](-[THBookViewController chapterBrowserController](self, "chapterBrowserController"), "scrollToThumbnailAtIndex:", v5);
    -[THChapterBrowserController rectForPageThumbnailAtIndex:chapterIndex:inLayer:](-[THBookViewController chapterBrowserController](self, "chapterBrowserController"), "rectForPageThumbnailAtIndex:chapterIndex:inLayer:", v5, v6, objc_msgSend(objc_msgSend(-[THDocumentViewController view](-[THBookViewController documentViewController](self, "documentViewController"), "view"), "superview"), "layer"));
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(-[THDocumentViewController canvasScrollView](-[THBookViewController documentViewController](self, "documentViewController"), "canvasScrollView"), "frame");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v30 = 0u;
    v31 = 0u;
    v29 = 0u;
    v23 = -[THDocumentViewController canvasScrollView](-[THBookViewController documentViewController](self, "documentViewController"), "canvasScrollView");
    if (v23)
    {
      objc_msgSend(v23, "transform");
    }
    else
    {
      v30 = 0u;
      v31 = 0u;
      v29 = 0u;
    }
    objc_msgSend(-[THDocumentViewController view](self->mDocumentViewController, "view"), "setNeedsLayout");
    objc_msgSend(-[THDocumentViewController view](self->mDocumentViewController, "view"), "layoutIfNeeded");
    -[THDocumentViewController startRevealTOC](self->mDocumentViewController, "startRevealTOC");
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_78E10;
    v28[3] = &unk_428430;
    v28[5] = v8;
    v28[6] = v10;
    v28[7] = v12;
    v28[8] = v14;
    v28[9] = v16;
    v28[10] = v18;
    v28[11] = v20;
    v28[12] = v22;
    v28[4] = self;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_78F08;
    v24[3] = &unk_428458;
    v24[4] = self;
    v24[5] = v5;
    v27 = v31;
    v26 = v30;
    v25 = v29;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v28, v24, 0.300000012, 0.0);
    -[THTOCViewController setShrouded:animated:duration:](v3, "setShrouded:animated:duration:", 0, 1, 0.300000012);
  }
  else
  {
    -[THTOCViewController setShrouded:animated:duration:](v3, "setShrouded:animated:duration:", 0, 0, 0.0);
    -[THBookViewController p_addViewControllerInFront:reason:](self, "p_addViewControllerInFront:reason:", v3, CFSTR("THVantageChangeReasonTransitionToTOC"));
    if (-[THBookViewController isBookEpub](self, "isBookEpub"))
      -[THFlowTOCViewController setReflowablePaginationController:](-[THBookViewController flowTocViewController](self, "flowTocViewController"), "setReflowablePaginationController:", -[THDocumentViewController reflowablePaginationController](-[THBookViewController documentViewController](self, "documentViewController"), "reflowablePaginationController"));
  }
  -[THBookViewController dismissTOCGlossaryView:](self, "dismissTOCGlossaryView:", 1);
}

- (void)didTransitionFromViewController:(id)a3 toTOCViewController:(id)a4
{
  -[THBookViewController p_addViewControllerInFront:reason:](self, "p_addViewControllerInFront:reason:", a4, CFSTR("THVantageChangeReasonTransitionToTOC"));
  -[THBookViewController p_removeViewController:](self, "p_removeViewController:", a3);
}

- (void)removeTOC
{
  id v3;

  v3 = -[THBookViewController p_selectedTocViewController](self, "p_selectedTocViewController");
  if (!-[THBookViewController shouldKeepTOCInBackground:](self, "shouldKeepTOCInBackground:", v3))
    -[THBookViewController p_removeViewController:](self, "p_removeViewController:", v3);
}

- (void)hideTOC
{
  id v3;

  v3 = -[THBookViewController p_selectedTocViewControllerCreateIfNecessary:](self, "p_selectedTocViewControllerCreateIfNecessary:", 0);
  if (v3)
    -[THBookViewController p_removeViewController:](self, "p_removeViewController:", v3);
}

- (BOOL)shouldKeepTOCInBackground:(id)a3
{
  return a3 && self->mChapterBrowserController == a3;
}

- (BOOL)isTOCButtonApplicable
{
  UIViewController *v3;

  v3 = -[THBookViewController visibleViewController](self, "visibleViewController");
  return v3 == (UIViewController *)-[THBookViewController documentViewController](self, "documentViewController");
}

- (id)currentPresentationType
{
  return -[THDocumentViewController currentPresentationType](-[THBookViewController documentViewController](self, "documentViewController"), "currentPresentationType");
}

- (void)showFullscreenNotesView:(id)a3
{
  -[THBookViewController showFullscreenNotesView:completion:](self, "showFullscreenNotesView:completion:", a3, 0);
}

- (void)showFullscreenNotesView:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[6];

  if (-[THBookViewController isNotesFullscreenVisible](self, "isNotesFullscreenVisible")
    || (v8 = objc_opt_class(UIBarButtonItem, v7),
        v9 = (void *)TSUDynamicCast(v8, a3),
        objc_msgSend(v9, "setEnabled:", 0),
        -[THBookViewController dismissActivePopover](self, "dismissActivePopover"),
        -[THNavigationOverlayView setOverlayHidden:animated:](-[THBookViewController navigationOverlayView](self, "navigationOverlayView"), "setOverlayHidden:animated:", 1, 0), !-[THBookViewController notesFullscreenViewController](self, "notesFullscreenViewController")))
  {
    if (a4)
      (*((void (**)(id))a4 + 2))(a4);
  }
  else
  {
    -[THNotesViewController setOriginalViewController:](-[THBookViewController notesFullscreenViewController](self, "notesFullscreenViewController"), "setOriginalViewController:", -[THBookViewController visibleViewController](self, "visibleViewController"));
    -[THNotesViewController updateWithNavigationUnit:](-[THBookViewController notesFullscreenViewController](self, "notesFullscreenViewController"), "updateWithNavigationUnit:", -[THDocumentViewController currentNavigationUnit](-[THBookViewController documentViewController](self, "documentViewController"), "currentNavigationUnit"));
    -[THBookViewController vantageWillChangeBy:reason:](self, "vantageWillChangeBy:reason:", self, CFSTR("THVantageChangeReasonTransitionToNotesVC"));
    -[THNotesViewController setModalTransitionStyle:](-[THBookViewController notesFullscreenViewController](self, "notesFullscreenViewController"), "setModalTransitionStyle:", 0);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_79260;
    v10[3] = &unk_426E78;
    v10[4] = v9;
    v10[5] = a4;
    -[THBookViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", -[THBookViewController notesFullscreenViewController](self, "notesFullscreenViewController"), 1, v10);
    -[THBookViewController vantageDidChangeBy:reason:](self, "vantageDidChangeBy:reason:", self, CFSTR("THVantageChangeReasonTransitionToNotesVC"));
  }
}

- (void)hideFullscreenNotesView:(id)a3 andSearchForText:(id)a4 completion:(id)a5
{
  -[THBookViewController hideFullscreenNotesView:andSearchForText:animated:force:completion:](self, "hideFullscreenNotesView:andSearchForText:animated:force:completion:", a3, a4, 1, 0, a5);
}

- (void)hideFullscreenNotesView:(id)a3 andSearchForText:(id)a4 animated:(BOOL)a5 force:(BOOL)a6 completion:(id)a7
{
  _BOOL4 v8;
  _BOOL8 v9;
  _QWORD v13[7];

  if (!self->mHidingNotesVC
    && ((v8 = a6, v9 = a5, -[THBookViewController isNotesFullscreenVisible](self, "isNotesFullscreenVisible")) || v8))
  {
    self->mHidingNotesVC = 1;
    -[THBookViewController vantageWillChangeBy:reason:](self, "vantageWillChangeBy:reason:", self, CFSTR("THVantageChangeReasonTransitionFromStudyVC"));
    if (!a3 || -[THBookViewController documentViewController](self, "documentViewController") == a3)
      -[THBookViewController p_showDVC](self, "p_showDVC");
    else
      -[THBookViewController p_addViewControllerInFront:reason:](self, "p_addViewControllerInFront:reason:", a3, CFSTR("THVantageChangeReasonTransitionFromStudyVC"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_79400;
    v13[3] = &unk_427350;
    v13[4] = self;
    v13[5] = a4;
    v13[6] = a7;
    -[THNotesViewController dismissViewControllerAnimated:completion:](-[THBookViewController notesFullscreenViewController](self, "notesFullscreenViewController"), "dismissViewControllerAnimated:completion:", v9, v13);
    -[THBookViewController vantageDidChangeBy:reason:](self, "vantageDidChangeBy:reason:", self, CFSTR("THVantageChangeReasonTransitionFromStudyVC"));
  }
  else if (a7)
  {
    (*((void (**)(id, _QWORD))a7 + 2))(a7, 0);
  }
}

- (BOOL)navigateToAnchorInDVC:(id)a3 pulse:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  -[THBookViewController p_showDVC](self, "p_showDVC");
  LOBYTE(v4) = -[THBookViewController followAnchor:pulse:](self, "followAnchor:pulse:", a3, v4);
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self->mDocumentViewController, "interactiveCanvasController"), "layoutIfNeeded");
  +[CATransaction flush](CATransaction, "flush");
  return v4;
}

- (BOOL)navigateToAnchorInDVC:(id)a3
{
  return -[THBookViewController navigateToAnchorInDVC:pulse:](self, "navigateToAnchorInDVC:pulse:", a3, 1);
}

- (BOOL)navigateToLinkInDVC:(id)a3
{
  unint64_t v5;
  id v6;
  unint64_t v7;
  unint64_t v8;

  if (-[THBookViewController visibleViewController](self, "visibleViewController") != (UIViewController *)self->mChapterBrowserController)
    return -[THBookViewController navigateToAnchorInDVC:](self, "navigateToAnchorInDVC:", -[THBookLinkResolver anchorFromAbsoluteLink:presentationType:](-[THBookViewController bookLinkResolver](self, "bookLinkResolver"), "anchorFromAbsoluteLink:presentationType:", a3, -[THDocumentViewController currentPresentationType](-[THBookViewController documentViewController](self, "documentViewController"), "currentPresentationType")));
  -[THBookViewController p_insertDVCInBack](self, "p_insertDVCInBack");
  v5 = -[THChapterBrowserController chapterIndex](self->mChapterBrowserController, "chapterIndex");
  v6 = objc_msgSend(a3, "cachedAbsolutePageIndex");
  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL
    || (v7 = -[THDocumentNavigationModel navigationUnitRelativePageIndexForAbsolutePageIndex:forPresentationType:](-[THBookViewController navigationModel](self, "navigationModel"), "navigationUnitRelativePageIndexForAbsolutePageIndex:forPresentationType:", v6, +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot"), "context"))), v7 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v8 = -[THBookViewController chapterBrowserController:relativePageIndexForLink:](self, "chapterBrowserController:relativePageIndexForLink:", self->mChapterBrowserController, a3);
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      v7 = 0;
    else
      v7 = v8;
  }
  -[THChapterBrowserController transitionPageToDVC:chapterIndex:](self->mChapterBrowserController, "transitionPageToDVC:chapterIndex:", v7, v5);
  return 1;
}

- (void)navigateFromNotesViewToAnchorInDVC:(id)a3 completion:(id)a4
{
  unsigned __int8 v7;
  id v8;
  _QWORD v9[7];
  BOOL v10;
  unsigned __int8 v11;

  v7 = -[THBookViewController setupLoadSpinner](self, "setupLoadSpinner");
  v8 = objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "reflowablePaginationController");
  if (!v8)
    -[THBookViewController followAnchor:pulse:](self, "followAnchor:pulse:", a3, 0);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_79704;
  v9[3] = &unk_428480;
  v10 = v8 != 0;
  v9[4] = self;
  v9[5] = a3;
  v11 = v7;
  v9[6] = a4;
  -[THBookViewController hideFullscreenNotesView:andSearchForText:completion:](self, "hideFullscreenNotesView:andSearchForText:completion:", -[THBookViewController visibleViewController](self, "visibleViewController"), 0, v9);
}

- (BOOL)isStudyViewControllerVisible
{
  unsigned int v3;

  v3 = -[THiOSStudyViewController isViewLoaded](-[THBookViewController studyViewController](self, "studyViewController"), "isViewLoaded");
  if (v3)
    LOBYTE(v3) = objc_msgSend(-[THiOSStudyViewController view](-[THBookViewController studyViewController](self, "studyViewController"), "view"), "superview") != 0;
  return v3;
}

- (void)loadStudyViewControllerForAnimation:(BOOL)a3
{
  THiOSStudyViewController *v4;

  if (-[THBookViewController studyViewController](self, "studyViewController", a3))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookViewController loadStudyViewControllerForAnimation:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm"), 2572, CFSTR("expected nil value for '%s'"), "self.studyViewController");
  v4 = -[THiOSStudyViewController initWithDocumentRoot:]([THiOSStudyViewController alloc], "initWithDocumentRoot:", -[THBookViewController documentRoot](self, "documentRoot"));
  -[THiOSStudyViewController setTheme:](v4, "setTheme:", -[THBookViewController theme](self, "theme"));
  -[THiOSStudyViewController setDelegate:](v4, "setDelegate:", self);
  -[THBookViewController setStudyViewController:](self, "setStudyViewController:", v4);

}

- (void)showStudyCardsForNavigationUnit:(id)a3 useChapterTitle:(id)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  id v12;
  char *v13;
  char *v14;
  char *i;
  THBookViewController *v16;

  if (!a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookViewController showStudyCardsForNavigationUnit:useChapterTitle:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm"), 2584, CFSTR("invalid nil value for '%s'"), "navigationUnit");
  if (!-[THBookViewController studyViewController](self, "studyViewController"))
    -[THBookViewController loadStudyViewControllerForAnimation:](self, "loadStudyViewControllerForAnimation:", 0);
  objc_msgSend(objc_msgSend(-[THNotesViewController view](-[THBookViewController notesFullscreenViewController](self, "notesFullscreenViewController"), "view"), "window"), "frame");
  objc_msgSend(-[THiOSStudyViewController view](-[THBookViewController studyViewController](self, "studyViewController"), "view"), "setFrame:", v7, v8, v9, v10);
  v11 = +[NSMutableArray array](NSMutableArray, "array");
  v12 = objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot"), "glossaryController"), "model");
  v13 = (char *)objc_msgSend(v12, "entryCount");
  if (v13)
  {
    v14 = v13;
    for (i = 0; i != v14; ++i)
      objc_msgSend(v11, "addObject:", objc_msgSend(v12, "entryAtIndex:", i));
  }
  if (!a4 || !objc_msgSend(a4, "length"))
    a4 = -[THDocumentNavigationModel titleStringForNavigationUnit:](-[THBookViewController navigationModel](self, "navigationModel"), "titleStringForNavigationUnit:", a3);
  if (!objc_msgSend(a4, "length"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookViewController showStudyCardsForNavigationUnit:useChapterTitle:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm"), 2614, CFSTR("no title for current navigation unit"));
  v16 = (THBookViewController *)-[THiOSStudyViewController parentViewController](-[THBookViewController studyViewController](self, "studyViewController"), "parentViewController");
  if (v16 != self)
    -[THNotesViewController addChildViewController:](-[THBookViewController notesFullscreenViewController](self, "notesFullscreenViewController"), "addChildViewController:", -[THBookViewController studyViewController](self, "studyViewController"));
  if (-[THBookViewController isStudyViewControllerVisible](self, "isStudyViewControllerVisible"))
  {
    -[THiOSStudyViewController updateWithNavigationUnit:title:](-[THBookViewController studyViewController](self, "studyViewController"), "updateWithNavigationUnit:title:", a3, a4);
  }
  else
  {
    if (!-[THBookViewController isNotesFullscreenVisible](self, "isNotesFullscreenVisible"))
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookViewController showStudyCardsForNavigationUnit:useChapterTitle:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm"), 2625, CFSTR("expect to only navigate to study cards from notes"));
    -[THiOSStudyViewController updateWithNavigationUnit:title:](-[THBookViewController studyViewController](self, "studyViewController"), "updateWithNavigationUnit:title:", a3, a4);
    objc_msgSend(-[THNotesViewController view](-[THBookViewController notesFullscreenViewController](self, "notesFullscreenViewController"), "view"), "addSubview:", -[THiOSStudyViewController view](-[THBookViewController studyViewController](self, "studyViewController"), "view"));
    -[THBookViewController p_setVisibleViewControllerToViewController:reason:](self, "p_setVisibleViewControllerToViewController:reason:", -[THBookViewController studyViewController](self, "studyViewController"), CFSTR("THVantageChangeReasonTransitionToStudyVC"));
    if (v16 != self)
      -[THiOSStudyViewController didMoveToParentViewController:](-[THBookViewController studyViewController](self, "studyViewController"), "didMoveToParentViewController:", -[THBookViewController notesFullscreenViewController](self, "notesFullscreenViewController"));
    -[THiOSStudyViewController transitionInWithCompletion:](-[THBookViewController studyViewController](self, "studyViewController"), "transitionInWithCompletion:", 0);
  }
}

- (void)p_unloadStudyViewController
{
  THiOSStudyViewController *v3;

  v3 = -[THBookViewController studyViewController](self, "studyViewController");
  -[THiOSStudyViewController removeFromParentViewController](v3, "removeFromParentViewController");
  -[THiOSStudyViewController viewWillDisappear:](v3, "viewWillDisappear:", 0);
  objc_msgSend(-[THiOSStudyViewController view](v3, "view"), "removeFromSuperview");
  -[THiOSStudyViewController viewDidDisappear:](v3, "viewDidDisappear:", 0);
  -[THBookViewController setStudyViewController:](self, "setStudyViewController:", 0);
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

- (void)studyViewControllerIsDone:(id)a3
{
  THiOSStudyViewController *v4;
  _QWORD v5[5];

  if (!-[THBookViewController isStudyViewControllerVisible](self, "isStudyViewControllerVisible", a3))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookViewController studyViewControllerIsDone:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm"), 2669, CFSTR("study view controller needs to be visible when it is closing"));
  v4 = -[THBookViewController studyViewController](self, "studyViewController");
  -[THBookViewController p_setVisibleViewControllerToViewController:reason:](self, "p_setVisibleViewControllerToViewController:reason:", -[THBookViewController notesFullscreenViewController](self, "notesFullscreenViewController"), CFSTR("THVantageChangeReasonTransitionFromStudyVC"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_79D50;
  v5[3] = &unk_426DD0;
  v5[4] = self;
  -[THiOSStudyViewController transitionOutWithCompletion:](v4, "transitionOutWithCompletion:", v5);
}

- (BOOL)canTrustCalculatedPageNumbers
{
  id v3;
  void *v4;
  double v5;
  double v6;

  v3 = objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "reflowablePaginationController");
  if (!v3)
    return 1;
  v4 = v3;
  objc_msgSend(-[THBookViewController view](self, "view"), "bounds");
  -[THDocumentViewController reflowablePageSizeForViewSize:](-[THBookViewController documentViewController](self, "documentViewController"), "reflowablePageSizeForViewSize:", v5, v6);
  return objc_msgSend(v4, "presentationTypeMatchesPageSize:");
}

- (int64_t)pageNumberForAnnotation:(id)a3
{
  if (-[THBookViewController canTrustCalculatedPageNumbers](self, "canTrustCalculatedPageNumbers"))
    return (int64_t)objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "absolutePageIndexForAnnotation:", a3);
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)pageNumberStringForAnnotation:(id)a3
{
  if (-[THBookViewController canTrustCalculatedPageNumbers](self, "canTrustCalculatedPageNumbers"))
    return objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "pageNumberStringForAnnotation:", a3);
  else
    return objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("-"), &stru_43D7D8, 0);
}

- (int64_t)studyViewController:(id)a3 pageNumberForAnnotation:(id)a4
{
  return -[THBookViewController pageNumberForAnnotation:](self, "pageNumberForAnnotation:", a4);
}

- (id)studyViewController:(id)a3 pageNumberStringForAnnotation:(id)a4
{
  return -[THBookViewController pageNumberStringForAnnotation:](self, "pageNumberStringForAnnotation:", a4);
}

- (id)studyViewController:(id)a3 storageForCFI:(id)a4
{
  return -[THBookViewController storageForCFI:](self, "storageForCFI:", a4);
}

- (id)documentViewControllerWithDocument:(id)a3
{
  THDocumentViewController *v5;

  v5 = -[THDocumentViewController initWithDefaultView]([THDocumentViewController alloc], "initWithDefaultView");
  -[THBookViewController addChildViewController:](self, "addChildViewController:", v5);
  -[THDocumentViewController setDocument:](v5, "setDocument:", a3);
  -[THDocumentViewController setDocumentLinkResolver:](v5, "setDocumentLinkResolver:", -[THDocumentLinkResolver initWithDocumentRoot:]([THDocumentLinkResolver alloc], "initWithDocumentRoot:", -[THDocumentViewController documentRoot](v5, "documentRoot")));
  -[THDocumentViewController setToolbarDelegate:](v5, "setToolbarDelegate:", self);
  -[THDocumentViewController setBookNavigationDelegate:](v5, "setBookNavigationDelegate:", self);
  -[THDocumentViewController setUserAnnotationDelegate:](v5, "setUserAnnotationDelegate:", self);
  -[THDocumentViewController setSpinnerProvider:](v5, "setSpinnerProvider:", self);
  -[THDocumentViewController setBookPropertiesDelegate:](v5, "setBookPropertiesDelegate:", self);
  -[THDocumentViewController setRevealTOCDelegate:](v5, "setRevealTOCDelegate:", self);
  -[THDocumentViewController setThemeDelegate:](v5, "setThemeDelegate:", self);
  -[THDocumentViewController setReadingStatisticsDelegate:](v5, "setReadingStatisticsDelegate:", self);
  -[THDocumentViewController setPaginationDelegate:](v5, "setPaginationDelegate:", self);
  return v5;
}

+ (BOOL)allBodiesExist:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char *v12;
  char *v13;
  char *v14;

  if (!a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[THBookViewController allBodiesExist:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm"), 2752, CFSTR("Invalid parameter not satisfying: %s"), "node");
  v5 = objc_opt_class(THModelContentNode, a2);
  v6 = (void *)TSUDynamicCast(v5, a3);
  if (v6)
  {
    LOBYTE(v8) = objc_msgSend(v6, "nodeBodyExists");
    return v8;
  }
  v9 = objc_opt_class(THModelContainerNode, v7);
  v10 = (void *)TSUDynamicCast(v9, a3);
  if (!v10)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[THBookViewController allBodiesExist:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm"), 2771, CFSTR("Unexpected THModelNode class: %@."), objc_msgSend(a3, "description"));
    goto LABEL_13;
  }
  v11 = v10;
  v12 = (char *)objc_msgSend(v10, "count");
  if (!v12)
  {
LABEL_13:
    LOBYTE(v8) = 1;
    return v8;
  }
  v13 = 0;
  v14 = v12 - 1;
  do
  {
    v8 = objc_msgSend(a1, "allBodiesExist:", objc_msgSend(v11, "nodeAtIndex:", v13));
    if (!v8)
      break;
  }
  while (v14 != v13++);
  return v8;
}

- (void)p_kickOffIntroMediaIfNecessary
{
  if (-[THBookViewController introMediaViewController](self, "introMediaViewController")
    && !-[THBookViewController p_hasDestinationPage](self, "p_hasDestinationPage"))
  {
    if (-[THBookViewController p_introMediaIsUnseenAndSeeable](self, "p_introMediaIsUnseenAndSeeable"))
    {
      -[THiOSIntroMediaViewController ensureReadyToPlay](-[THBookViewController introMediaViewController](self, "introMediaViewController"), "ensureReadyToPlay");
      -[THiOSIntroMediaViewController playForBookOpen](-[THBookViewController introMediaViewController](self, "introMediaViewController"), "playForBookOpen");
      -[THBookViewController TOCViewControllerDidShowIntroMedia:](self, "TOCViewControllerDidShowIntroMedia:", 0);
    }
  }
}

- (void)p_bookContentDidLoad
{
  -[AEAssetOpenAnimating bookContentDidLoad](-[THBookViewController contentOpenAnimator](self, "contentOpenAnimator"), "bookContentDidLoad");
  -[THBookViewController setContentOpenAnimator:](self, "setContentOpenAnimator:", 0);
  if (-[THBookViewController snapshotBlock](self, "snapshotBlock"))
  {
    (*((void (**)(void))-[THBookViewController snapshotBlock](self, "snapshotBlock") + 2))();
    -[THBookViewController setSnapshotBlock:](self, "setSnapshotBlock:", 0);
  }
}

- (void)viewsAreReadyForOpenAnimation
{
  _QWORD v3[5];

  if (!self->mHaveCalledDidOpen)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_7A258;
    v3[3] = &unk_427790;
    v3[4] = self;
    +[THPerformanceRegressionLogger logEventWithBlock:](THPerformanceRegressionLogger, "logEventWithBlock:", v3);
    self->mHaveCalledDidOpen = 1;
  }
  -[THBookViewController p_bookContentDidLoad](self, "p_bookContentDidLoad");
}

- (void)didLoadBook:(id)a3
{
  -[UIAlertController dismissViewControllerAnimated:completion:](-[THBookViewController fontDownloadAlertController](self, "fontDownloadAlertController", a3), "dismissViewControllerAnimated:completion:", 1, 0);
  -[THBookViewController p_finishBookLoadIfReady](self, "p_finishBookLoadIfReady");
}

- (void)p_finishBookLoadIfReady
{
  if (objc_msgSend(-[THBookViewController view](self, "view"), "window"))
  {
    if (-[THBookOpener isFinished](self->mBookOpener, "isFinished"))
      -[THBookViewController p_finishBookLoad](self, "p_finishBookLoad");
  }
}

- (void)setPerformanceModeBookOpening:(BOOL)a3
{
  self->_performanceModeBookOpening = a3;
  -[THDocumentViewController setPerformanceModeBookOpening:](-[THBookViewController documentViewController](self, "documentViewController"), "setPerformanceModeBookOpening:", a3);
}

- (void)p_finishBookLoad
{
  NSError *v3;
  NSString *v4;
  char *v5;
  BOOL v6;
  id v7;
  int64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_7A900;
  v13[3] = &unk_427790;
  v13[4] = self;
  +[THPerformanceRegressionLogger logEventWithBlock:](THPerformanceRegressionLogger, "logEventWithBlock:", v13);
  -[THBookViewController setBookOpenFailed:](self, "setBookOpenFailed:", -[THBookOpener isSuccessful](self->mBookOpener, "isSuccessful") ^ 1);
  if (!-[THBookViewController bookOpenFailed](self, "bookOpenFailed"))
  {
    -[AVAudioSession setCategory:error:](+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"), "setCategory:error:", AVAudioSessionCategoryPlayback, 0);
    v7 = -[THiOSDocument documentRoot](self->mDocument, "documentRoot");
    objc_msgSend(v7, "setSuppliedAnnotationProvider:", objc_msgSend(+[THApplePubAssetPlugin sharedPlugin](THApplePubAssetPlugin, "sharedPlugin"), "sharedAnnotationProvider"));
    objc_msgSend(v7, "documentDidLoad");
    -[THBookViewController setDocumentViewController:](self, "setDocumentViewController:", -[THBookViewController documentViewControllerWithDocument:](self, "documentViewControllerWithDocument:", self->mDocument));
    if (-[THBookViewController isBookEpub](self, "isBookEpub"))
    {
      if ((char *)-[THBookViewController appearanceStyle](self, "appearanceStyle") == (char *)&dword_0 + 3)
        v8 = -[NSUserDefaults integerForKey:](+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"), "integerForKey:", CFSTR("THBookViewControllerStyleBeforeAutoNight"));
      else
        v8 = -[THBookViewController appearanceStyle](self, "appearanceStyle");
      -[THBookViewController setStyleBeforeAutoNight:](self, "setStyleBeforeAutoNight:", v8);
      if (+[IMTheme isAutoNightModeEnabled](IMTheme, "isAutoNightModeEnabled"))
        -[THBookViewController _updateAppearanceFromLightLevelController:](self, "_updateAppearanceFromLightLevelController:", +[BCLightLevelController sharedInstance](BCLightLevelController, "sharedInstance"));
      -[THBookViewController setTheme:](self, "setTheme:", -[THBookViewController themeForStyle:](self, "themeForStyle:", -[THBookViewController appearanceStyle](self, "appearanceStyle")));
    }
    -[THDocumentViewController pushMinimizeLayoutPadding](-[THBookViewController documentViewController](self, "documentViewController"), "pushMinimizeLayoutPadding");
    -[THDocumentViewController setPerformanceModeBookOpening:](-[THBookViewController documentViewController](self, "documentViewController"), "setPerformanceModeBookOpening:", self->_performanceModeBookOpening);
    if ((objc_msgSend(objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "bookDescription"), "isEpub") & 1) == 0)
    {
      -[THDocumentLinkResolver updatePaginationResults](-[THDocumentViewController documentLinkResolver](-[THBookViewController documentViewController](self, "documentViewController"), "documentLinkResolver"), "updatePaginationResults");
      objc_msgSend(objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "searchController"), "updatePaginationResults");
    }
    -[THBookViewController setBookLinkResolver:](self, "setBookLinkResolver:", -[THBookLinkResolver initWithDocumentLinkResolver:glossaryLinkResolver:]([THBookLinkResolver alloc], "initWithDocumentLinkResolver:glossaryLinkResolver:", -[THDocumentViewController documentLinkResolver](-[THBookViewController documentViewController](self, "documentViewController"), "documentLinkResolver"), +[THGlossaryLinkResolver glossaryLinkResolverWithGlossaryController:](THGlossaryLinkResolver, "glossaryLinkResolverWithGlossaryController:", objc_msgSend(v7, "glossaryController"))));
    self->mIsCompleteBook = objc_msgSend((id)objc_opt_class(self, v9), "allBodiesExist:", objc_msgSend(v7, "rootNode"));
    if (-[THBookViewController isCompleteBook](self, "isCompleteBook"))
    {
      v10 = objc_msgSend(v7, "tocModel");
      objc_msgSend(v10, "setBookTitle:", -[THBookDescription bookTitle](-[THBookViewController bookDescription](self, "bookDescription"), "bookTitle"));
      objc_msgSend(v10, "setBookSubtitle:", -[THBookDescription bookSubtitle](-[THBookViewController bookDescription](self, "bookDescription"), "bookSubtitle"));
      -[THBookViewController p_buildIntroMediaViewController](self, "p_buildIntroMediaViewController");
      -[THBookViewController setBookOpenDestinationIsTOC:](self, "setBookOpenDestinationIsTOC:", -[THBookViewController p_wantsToOpenToTOC](self, "p_wantsToOpenToTOC"));
      if (!-[THBookViewController p_hasDestinationPage](self, "p_hasDestinationPage"))
      {
        if (-[THBookViewController isBookEpub](self, "isBookEpub"))
          -[THBookViewController p_insertDVCInBack](self, "p_insertDVCInBack");
        -[THBookViewController showTOC](self, "showTOC");
      }
      if (-[THBookViewController p_restoreToLaunchPage](self, "p_restoreToLaunchPage"))
      {
        self->mHasSeenIntroMedia = 1;
        -[THBookViewController viewsAreReadyForOpenAnimation](self, "viewsAreReadyForOpenAnimation");
      }
      else
      {
        -[THBookViewController setBookOpenDestinationIsTOC:](self, "setBookOpenDestinationIsTOC:", 1);
        -[THBookViewController showTOC](self, "showTOC");
      }
      if (!-[THBookViewController introMediaViewController](self, "introMediaViewController"))
        goto LABEL_32;
      -[THiOSIntroMediaViewController setNeedsMoviePosterForOpenAnimation:](-[THBookViewController introMediaViewController](self, "introMediaViewController"), "setNeedsMoviePosterForOpenAnimation:", -[THBookViewController p_introMediaIsUnseenAndSeeable](self, "p_introMediaIsUnseenAndSeeable"));
      objc_msgSend(-[THBookViewController p_selectedTocViewController](self, "p_selectedTocViewController"), "setIntroMediaViewController:showIt:", -[THBookViewController introMediaViewController](self, "introMediaViewController"), -[THBookViewController p_introMediaIsUnseenAndSeeable](self, "p_introMediaIsUnseenAndSeeable"));
      if (-[THBookViewController openAnimationDidFinish](self, "openAnimationDidFinish"))
        -[THBookViewController p_kickOffIntroMediaIfNecessary](self, "p_kickOffIntroMediaIfNecessary");
    }
    else
    {
      -[THBookViewController p_showDVC](self, "p_showDVC");
      -[THDocumentViewController setVisibleInfoUpdatesAllowedInLandscape:](-[THBookViewController documentViewController](self, "documentViewController"), "setVisibleInfoUpdatesAllowedInLandscape:", 1);
      -[THDocumentViewController setAllowPortraitTOC:](-[THBookViewController documentViewController](self, "documentViewController"), "setAllowPortraitTOC:", 0);
      -[THDocumentViewController followLink:](-[THBookViewController documentViewController](self, "documentViewController"), "followLink:", objc_msgSend(v7, "linkForNavigationUnitIndex:", 0));
    }
    -[THBookViewController viewsAreReadyForOpenAnimation](self, "viewsAreReadyForOpenAnimation");
LABEL_32:
    -[THNavigationHistoryStepperController setPageIndexFormatter:](-[THBookViewController navigationHistoryStepperController](self, "navigationHistoryStepperController"), "setPageIndexFormatter:", -[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot"));
    -[THNavigationHistoryStepperController setBookspotHistoryStack:](-[THBookViewController navigationHistoryStepperController](self, "navigationHistoryStepperController"), "setBookspotHistoryStack:", -[THBookViewController bookspotHistoryStack](self, "bookspotHistoryStack"));
    -[THBookViewController setBookLoadedSuccessfully:](self, "setBookLoadedSuccessfully:", 1);
    -[THBookViewController _checkIfScanningReadingStatisticsCanBegin](self, "_checkIfScanningReadingStatisticsCanBegin");
    goto LABEL_33;
  }
  v3 = -[THBookOpener error](self->mBookOpener, "error");
  v4 = -[NSError domain](v3, "domain");
  if (!v3)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookViewController p_finishBookLoad]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm"), 2990, CFSTR("invalid nil value for '%s'"), "openError");
    -[NSString isEqualToString:](v4, "isEqualToString:", CFSTR("ibookserrors"));
LABEL_12:
    -[THBookViewController bookOpenTransitionDidEnd](self, "bookOpenTransitionDidEnd");
    goto LABEL_33;
  }
  v5 = (char *)-[NSError code](v3, "code") + 42597;
  if (-[NSString isEqualToString:](v4, "isEqualToString:", CFSTR("ibookserrors")))
    v6 = (unint64_t)v5 > 2;
  else
    v6 = 1;
  if (v6)
    goto LABEL_12;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_7A934;
  v12[3] = &unk_426DD0;
  v12[4] = self;
  -[THBookViewController closeDocumentWithErrorBlock:](self, "closeDocumentWithErrorBlock:", v12);
LABEL_33:

  self->mBookOpener = 0;
  -[THBookViewController p_updateToolbarButtonStates](self, "p_updateToolbarButtonStates");
  -[THBookViewController p_updateFromTheme:](self, "p_updateFromTheme:", 0);
  -[THBookViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "viewsAreReadyForOpenAnimation", 0, 3.0);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_7A9DC;
  v11[3] = &unk_427790;
  v11[4] = self;
  +[THPerformanceRegressionLogger logEventWithBlock:](THPerformanceRegressionLogger, "logEventWithBlock:", v11);
}

- (void)p_openBook
{
  THiOSDocument *v3;
  THBookOpener *v4;
  _QWORD v5[5];

  if (-[THBookViewController bookDescription](self, "bookDescription")
    && -[THAsset assetID](-[THBookDescription asset](-[THBookViewController bookDescription](self, "bookDescription"), "asset"), "assetID"))
  {
    if (!self->mDocument)
    {
      if (self->mBookOpener)
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookViewController p_openBook]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm"), 3048, CFSTR("expected nil value for '%s'"), "mBookOpener");
      v3 = -[THiOSDocument initWithBookDescription:]([THiOSDocument alloc], "initWithBookDescription:", -[THBookViewController bookDescription](self, "bookDescription"));
      self->mDocument = v3;
      if (!-[THiOSDocument context](v3, "context"))
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookViewController p_openBook]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm"), 3051, CFSTR("invalid nil value for '%s'"), "mDocument.context");
      if (!-[THiOSDocument documentRoot](self->mDocument, "documentRoot"))
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookViewController p_openBook]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm"), 3052, CFSTR("invalid nil value for '%s'"), "mDocument.documentRoot");
      v4 = -[THBookOpener initWithDocumentRoot:]([THBookOpener alloc], "initWithDocumentRoot:", -[THiOSDocument documentRoot](self->mDocument, "documentRoot"));
      self->mBookOpener = v4;
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_7AC64;
      v5[3] = &unk_426DD0;
      v5[4] = self;
      -[THBookOpener setCompletionBlock:](v4, "setCompletionBlock:", v5);
      objc_msgSend(+[THBookOpener loadingQueue](THBookOpener, "loadingQueue"), "addOperation:", self->mBookOpener);
    }
  }
  else
  {
    -[THBookViewController closeDocument](self, "closeDocument");
  }
}

- (void)setPageIndexForProofing:(int64_t)a3
{
  if (-[THBookViewController isCompleteBook](self, "isCompleteBook"))
    -[THDocumentNavigator setVisibleAbsolutePhysicalPageIndex:](-[THDocumentViewController documentNavigator](-[THBookViewController documentViewController](self, "documentViewController"), "documentNavigator"), "setVisibleAbsolutePhysicalPageIndex:", a3);
  else
    -[THDocumentViewController setCurrentNavigationUnit:withRelativePageIndex:animated:](-[THBookViewController documentViewController](self, "documentViewController"), "setCurrentNavigationUnit:withRelativePageIndex:animated:", -[NSArray objectAtIndex:](-[THDocumentNavigationModel navigationUnits](-[THBookViewController navigationModel](self, "navigationModel"), "navigationUnits"), "objectAtIndex:", 0), a3, 0);
  -[THDocumentViewController updateVisibleInfos](-[THBookViewController documentViewController](self, "documentViewController"), "updateVisibleInfos");
}

- (unint64_t)absolutePageIndexForTileEntry:(id)a3
{
  if (-[THReflowablePaginationController paginationComplete](-[THDocumentViewController reflowablePaginationController](-[THBookViewController documentViewController](self, "documentViewController"), "reflowablePaginationController"), "paginationComplete"))
  {
    return -[THDocumentNavigator absolutePageIndexForLink:](-[THBookViewController documentNavigator](self, "documentNavigator"), "absolutePageIndexForLink:", objc_msgSend(a3, "modelLink"));
  }
  else
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (unint64_t)maxAbsolutePageIndexForNodeAtTileEntry:(id)a3
{
  id v5;
  id v6;
  unint64_t v7;
  void *v8;
  id v9;

  if (!-[THReflowablePaginationController paginationComplete](-[THDocumentViewController reflowablePaginationController](-[THBookViewController documentViewController](self, "documentViewController"), "reflowablePaginationController"), "paginationComplete"))return 0x7FFFFFFFFFFFFFFFLL;
  v5 = objc_msgSend(objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "navigationModel"), "contentNodeForGUID:", objc_msgSend(a3, "nodeGUID"));
  if (!v5)
    return 0x7FFFFFFFFFFFFFFFLL;
  v6 = -[THReflowablePaginationController paginationResultForContentNode:](-[THDocumentViewController reflowablePaginationController](-[THBookViewController documentViewController](self, "documentViewController"), "reflowablePaginationController"), "paginationResultForContentNode:", v5);
  v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6)
  {
    v8 = v6;
    if (objc_msgSend(v6, "firstPageIndex") != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = objc_msgSend(v8, "firstPageIndex");
      return (unint64_t)v9 + (_QWORD)objc_msgSend(v8, "pageCount");
    }
  }
  return v7;
}

- (void)showPageForModelLink:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  -[THBookViewController recordOutgoingMajorNavigationJump](self, "recordOutgoingMajorNavigationJump");
  -[THBookViewController p_showDVCAnimated:withLink:](self, "p_showDVCAnimated:withLink:", v4, a3);
  -[THBookViewController recordCurrentLocationInHistory](self, "recordCurrentLocationInHistory");
}

- (void)p_alertUserAboutDenyingBookmarkEditing
{
  id v3;
  id v4;
  id v5;
  UIAlertController *v6;
  id v7;
  _QWORD v8[5];

  v3 = objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("OK"), &stru_43D7D8, 0);
  v4 = objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Not Now"), &stru_43D7D8, 0);
  v5 = objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("New Version Available"), &stru_43D7D8, 0);
  v6 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v5, objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("You won\\U2019t be able to delete bookmarks until you update this book."), &stru_43D7D8, 0), 1);
  if (objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "isStoreBook"))
    v7 = v4;
  else
    v7 = v3;
  -[UIAlertController addAction:](v6, "addAction:", +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v7, 1, 0));
  if (objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "isStoreBook"))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_7B020;
    v8[3] = &unk_427300;
    v8[4] = self;
    -[UIAlertController addAction:](v6, "addAction:", +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Update"), &stru_43D7D8, 0), 0, v8));
  }
  -[THBookViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
}

- (void)p_alertUserAboutAnnotationBehavior
{
  id v3;
  id v4;
  id v5;
  UIAlertController *v6;
  id v7;
  _QWORD v8[5];

  v3 = objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("OK"), &stru_43D7D8, 0);
  v4 = objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Not Now"), &stru_43D7D8, 0);
  v5 = objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("New Version Available"), &stru_43D7D8, 0);
  v6 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v5, objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("You won\\U2019t be able to add notes, highlights or bookmarks until you update this book."), &stru_43D7D8, 0), 1);
  if (objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "isStoreBook"))
    v7 = v4;
  else
    v7 = v3;
  -[UIAlertController addAction:](v6, "addAction:", +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v7, 1, 0));
  if (objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "isStoreBook"))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_7B1BC;
    v8[3] = &unk_427300;
    v8[4] = self;
    -[UIAlertController addAction:](v6, "addAction:", +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Update"), &stru_43D7D8, 0), 0, v8));
  }
  -[THBookViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
}

- (void)p_alertUserAboutFontDownload
{
  id v3;
  _QWORD v4[5];

  v3 = objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Downloading Fonts"), &stru_43D7D8, 0);
  -[THBookViewController setFontDownloadAlertController:](self, "setFontDownloadAlertController:", +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v3, objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("This book will open when the download is complete."), &stru_43D7D8, 0), 1));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_7B33C;
  v4[3] = &unk_427300;
  v4[4] = self;
  -[UIAlertController addAction:](-[THBookViewController fontDownloadAlertController](self, "fontDownloadAlertController"), "addAction:", +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_43D7D8, 0), 0, v4));
  -[UIAlertController addAction:](-[THBookViewController fontDownloadAlertController](self, "fontDownloadAlertController"), "addAction:", +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("OK"), &stru_43D7D8, 0), 1, 0));
  -[THBookViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", -[THBookViewController fontDownloadAlertController](self, "fontDownloadAlertController"), 1, 0);
}

- (void)p_alertUserAboutRetinaUpdate
{
  id v3;
  id v4;
  UIAlertController *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  if (objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "isStoreBook"))
  {
    v3 = objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Not Now"), &stru_43D7D8, 0);
    v4 = objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Retina Update Available"), &stru_43D7D8, 0);
    v5 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v4, objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Update this book to get enhanced graphics for your device\\U2019s Retina display."), &stru_43D7D8, 0), 1);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_7B4E0;
    v7[3] = &unk_427300;
    v7[4] = self;
    -[UIAlertController addAction:](v5, "addAction:", +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v3, 1, v7));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_7B4E8;
    v6[3] = &unk_427300;
    v6[4] = self;
    -[UIAlertController addAction:](v5, "addAction:", +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Update"), &stru_43D7D8, 0), 0, v6));
    -[THBookViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
  }
}

- (BOOL)p_shouldAlertAboutRetinaUpdate
{
  unsigned int v3;
  id v4;

  v3 = objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "isStoreBook");
  if (v3)
  {
    v4 = -[NSUserDefaults objectForKey:](+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"), "objectForKey:", -[THBookViewController p_retinaUpdateAlertDateKey](self, "p_retinaUpdateAlertDateKey"));
    if (v4)
      LOBYTE(v3) = objc_msgSend(v4, "compare:", +[NSDate date](NSDate, "date")) == (id)-1;
    else
      LOBYTE(v3) = 1;
  }
  return v3;
}

- (void)p_closeBookAndGoToStorePageForBook
{
  if (objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "isStoreBook"))
    objc_msgSend(objc_msgSend(+[AEAssetEngine storeMgr](AEAssetEngine, "storeMgr"), "clientApplicationController"), "openEBookProductPageForStoreID:", objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "storeItemID"));
}

- (id)p_retinaUpdateAlertDateKey
{
  return objc_msgSend(CFSTR("kTHRetinaUpdateAlertNextDate"), "stringByAppendingString:", objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "storeItemID"));
}

- (id)p_retinaUpdateAlertAttemptsKey
{
  return objc_msgSend(CFSTR("kTHRetinaUpdateAlertNumberOfAttempts"), "stringByAppendingString:", objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "storeItemID"));
}

- (void)p_postponeAlertForRetinaUpdate
{
  NSUserDefaults *v3;
  id v4;
  id v5;
  char *v6;
  char *v7;
  double v8;
  NSDate *v9;

  if (objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "isStoreBook"))
  {
    v3 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
    v4 = -[THBookViewController p_retinaUpdateAlertDateKey](self, "p_retinaUpdateAlertDateKey");
    v5 = -[THBookViewController p_retinaUpdateAlertAttemptsKey](self, "p_retinaUpdateAlertAttemptsKey");
    v6 = -[NSUserDefaults integerForKey:](v3, "integerForKey:", v5);
    v7 = v6;
    if (v6)
    {
      if ((unint64_t)v6 >= 3)
      {
        v8 = 604800.0;
        if (v6 != (_BYTE *)&dword_0 + 3)
          v8 = 0.0;
        if ((uint64_t)v6 >= 4)
        {
          v9 = +[NSDate distantFuture](NSDate, "distantFuture", v8);
          -[NSUserDefaults removeObjectForKey:](v3, "removeObjectForKey:", v5);
LABEL_12:
          -[NSUserDefaults setObject:forKey:](v3, "setObject:forKey:", v9, v4);
          -[NSUserDefaults synchronize](v3, "synchronize");
          return;
        }
      }
      else
      {
        v8 = 86400.0;
      }
    }
    else
    {
      v8 = 14400.0;
    }
    v9 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", v8);
    -[NSUserDefaults setInteger:forKey:](v3, "setInteger:forKey:", v7 + 1, v5);
    goto LABEL_12;
  }
}

- (void)p_closeBookAndGoToStoreForRetinaUpdate
{
  NSUserDefaults *v3;
  id v4;

  if (objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "isStoreBook"))
  {
    v3 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
    v4 = objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "storeItemID");
    -[NSUserDefaults removeObjectForKey:](v3, "removeObjectForKey:", -[THBookViewController p_retinaUpdateAlertDateKey](self, "p_retinaUpdateAlertDateKey"));
    -[NSUserDefaults removeObjectForKey:](v3, "removeObjectForKey:", -[THBookViewController p_retinaUpdateAlertAttemptsKey](self, "p_retinaUpdateAlertAttemptsKey"));
    -[NSUserDefaults synchronize](v3, "synchronize");
    objc_msgSend(objc_msgSend(+[AEAssetEngine storeMgr](AEAssetEngine, "storeMgr"), "clientApplicationController"), "openEBookProductPageForStoreID:", v4);
  }
}

- (int64_t)readerType
{
  return 2;
}

- (AEAsset)asset
{
  AEAsset *result;

  result = (AEAsset *)self->mBookDescription;
  if (result)
    return (AEAsset *)-[AEAsset asset](result, "asset");
  return result;
}

- (void)assetViewControllerPrepareForReload
{
  objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot"), "annotationController"), "setPlaceholder:pageHistoryDictionary:withContentNode:", 0, 0, 0);
}

- (void)open:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD v5[5];

  v3 = a3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_7B930;
  v5[3] = &unk_427790;
  v5[4] = self;
  +[THPerformanceRegressionLogger logEventWithBlock:](THPerformanceRegressionLogger, "logEventWithBlock:", v5);
  -[THBookViewController runPreloadOptimizations](self, "runPreloadOptimizations");
  if (!-[THBookViewController bookDescription](self, "bookDescription"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookViewController open:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm"), 3328, CFSTR("Invalid parameter not satisfying: %s"), "self.bookDescription != nil");
  objc_msgSend(+[THApplePubAssetPlugin sharedPlugin](THApplePubAssetPlugin, "sharedPlugin"), "willOpenBook:", self);
  -[AEAssetViewControllerDelegate assetViewController:willOpen:](-[THBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"), "assetViewController:willOpen:", self, v3);
  -[THBookViewController p_openBook](self, "p_openBook");
}

- (BOOL)p_jumpToLocation:(id)a3
{
  id v5;
  id v7;
  id v8;

  if ((objc_opt_respondsToSelector(a3, "cfiString") & 1) != 0)
  {
    v5 = objc_msgSend(a3, "performSelector:", "cfiString");
    if (v5)
      return -[THBookViewController p_jumpToBKCFIString:](self, "p_jumpToBKCFIString:", v5);
  }
  else if ((objc_opt_respondsToSelector(a3, "anchor") & 1) != 0)
  {
    v7 = objc_msgSend(a3, "performSelector:", "anchor");
    if (v7)
      return -[THBookViewController p_jumpToFragment:](self, "p_jumpToFragment:", v7);
  }
  else if ((objc_opt_respondsToSelector(a3, "pageOffset") & 1) != 0)
  {
    v8 = objc_msgSend(a3, "performSelector:", "pageOffset");
    if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
      return -[THBookViewController jumpToPageLocation:touchHistory:minor:](self, "jumpToPageLocation:touchHistory:minor:", -[THPageLocation initWithAbsolutePageIndex:]([THPageLocation alloc], "initWithAbsolutePageIndex:", v8), 1, 0);
  }
  return 0;
}

- (void)openToLocation:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _QWORD v7[6];

  v4 = a4;
  -[THBookViewController setOpeningCFIOverride:](self, "setOpeningCFIOverride:", 0);
  -[THBookViewController setOpeningFragmentOverride:](self, "setOpeningFragmentOverride:", 0);
  -[THBookViewController setOpeningAbsolutePageIndexOverride:](self, "setOpeningAbsolutePageIndexOverride:", 0x7FFFFFFFFFFFFFFFLL);
  -[THBookViewController setOpeningLocationOverride:](self, "setOpeningLocationOverride:", 0);
  if (objc_msgSend(+[THApplePubAssetPlugin sharedPlugin](THApplePubAssetPlugin, "sharedPlugin"), "existingBookViewControllerForDocumentRoot:", -[THBookViewController documentRoot](self, "documentRoot")))
  {
    if (-[THBookViewController documentViewController](self, "documentViewController"))
    {
      if (-[THDocumentViewController showingExpandedWidgetView](-[THBookViewController documentViewController](self, "documentViewController"), "showingExpandedWidgetView"))
      {
        v7[0] = _NSConcreteStackBlock;
        v7[1] = 3221225472;
        v7[2] = sub_7BC54;
        v7[3] = &unk_426E28;
        v7[4] = self;
        v7[5] = a3;
        -[THWExpandedViewController dismissExpandedAnimatedWithCompletionBlock:](-[THDocumentViewController expandedViewController](-[THBookViewController documentViewController](self, "documentViewController"), "expandedViewController"), "dismissExpandedAnimatedWithCompletionBlock:", v7);
      }
      else
      {
        -[THBookViewController p_jumpToLocation:](self, "p_jumpToLocation:", a3);
      }
    }
    else
    {
      -[THBookViewController setOpeningLocationOverride:](self, "setOpeningLocationOverride:", a3);
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector(a3, "cfiString") & 1) != 0)
    {
      -[THBookViewController setOpeningCFIOverride:](self, "setOpeningCFIOverride:", objc_msgSend(a3, "performSelector:", "cfiString"));
    }
    else if ((objc_opt_respondsToSelector(a3, "anchor") & 1) != 0)
    {
      -[THBookViewController setOpeningFragmentOverride:](self, "setOpeningFragmentOverride:", objc_msgSend(a3, "performSelector:", "anchor"));
    }
    else if ((objc_opt_respondsToSelector(a3, "pageOffset") & 1) != 0)
    {
      -[THBookViewController setOpeningAbsolutePageIndexOverride:](self, "setOpeningAbsolutePageIndexOverride:", objc_msgSend(a3, "performSelector:", "pageOffset"));
    }
    -[THBookViewController open:](self, "open:", v4);
  }
}

- (void)assetViewControllerDidOpenAnimated:(BOOL)a3
{
  id v4;
  id v5;
  uint64_t v6;
  _QWORD v7[5];

  -[THBookViewController setPerformanceModeBookOpening:](self, "setPerformanceModeBookOpening:", 0);
  -[THDocumentViewController popMinimizeLayoutPadding](-[THBookViewController documentViewController](self, "documentViewController"), "popMinimizeLayoutPadding");
  -[TSWPLoadableFonts resumeBackgroundLoading](+[TSWPLoadableFonts sharedInstance](TSWPLoadableFonts, "sharedInstance"), "resumeBackgroundLoading");
  -[THBookViewController p_kickOffIntroMediaIfNecessary](self, "p_kickOffIntroMediaIfNecessary");
  self->mOpenAnimationDidFinish = 1;
  if (-[THBookViewController openingCFIOverride](self, "openingCFIOverride"))
  {
    -[THBookViewController p_jumpToBKCFIString:](self, "p_jumpToBKCFIString:", -[THBookViewController openingCFIOverride](self, "openingCFIOverride"));
    -[THBookViewController setOpeningCFIOverride:](self, "setOpeningCFIOverride:", 0);
  }
  -[THBookViewController vantageDidChangeBy:reason:](self, "vantageDidChangeBy:reason:", self, CFSTR("THVantageChangeReasonBookOpen"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_7BE20;
  v7[3] = &unk_427790;
  v7[4] = self;
  +[THPerformanceRegressionLogger logEventWithBlock:](THPerformanceRegressionLogger, "logEventWithBlock:", v7);
  if (!objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot"), "annotationController"))objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookViewController assetViewControllerDidOpenAnimated:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm"), 3445, CFSTR("Expected an annotationController when not proofing"));
  v4 = objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot"), "properties");
  if (objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot"), "annotationController")&& !-[THBookViewController isAnnotationWriteEnabled](self, "isAnnotationWriteEnabled"))
  {
    -[THBookViewController p_alertUserAboutAnnotationBehavior](self, "p_alertUserAboutAnnotationBehavior");
  }
  else
  {
    v5 = objc_msgSend(v4, "wasThinned");
    if ((_DWORD)v5 && TSUScreenScale(v5, v6) > 1.0)
    {
      if (-[THBookViewController p_shouldAlertAboutRetinaUpdate](self, "p_shouldAlertAboutRetinaUpdate"))
        -[THBookViewController p_alertUserAboutRetinaUpdate](self, "p_alertUserAboutRetinaUpdate");
    }
  }
}

- (void)assetViewControllerUpdateToolbars
{
  -[THBookViewController p_updateToolbarButtonStatesWithTraits:](self, "p_updateToolbarButtonStatesWithTraits:", -[THBookViewController traitCollection](self, "traitCollection"));
}

- (void)assetViewControllerUpdateToolbarsAfterOpenAnimation
{
  BRCConfigurationManager *v3;
  THDocumentViewController *v4;

  if (-[THBookViewController isBookEpub](self, "isBookEpub"))
  {
    if (-[THBookViewController isToolbarHidden](self, "isToolbarHidden"))
    {
      v3 = +[BRCConfigurationManager sharedInstance](BRCConfigurationManager, "sharedInstance");
      if (objc_msgSend(-[BRCConfigurationManager valueForKey:fromNamespace:](v3, "valueForKey:fromNamespace:", BRCBooksDefaultsKeyReadingExperienceSamplesShowChromeOnOpen, BRCBooksDefaultsNamespace), "BOOLValue"))
      {
        if (-[THBookViewController p_isSampleBook](self, "p_isSampleBook"))
        {
          v4 = -[THBookViewController documentViewController](self, "documentViewController");
          if (!-[THDocumentViewController showingExpandedWidgetView](v4, "showingExpandedWidgetView"))
          {
            -[THDocumentViewController showToolbarAnimated:](v4, "showToolbarAnimated:", 1);
            -[THNavigationBarController clearAutohideTimer](-[THBookViewController navigationBarController](self, "navigationBarController"), "clearAutohideTimer");
          }
        }
      }
    }
  }
}

- (void)closeDocumentWithReadLock:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = -[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController", a3), "documentRoot");
  self->mIsClosing = 1;
  v5 = objc_msgSend(v4, "context");
  v6 = v5;
  objc_msgSend(v4, "willClose");
  -[TSWPLoadableFonts pauseBackgroundLoading](+[TSWPLoadableFonts sharedInstance](TSWPLoadableFonts, "sharedInstance"), "pauseBackgroundLoading");
  -[TSWPLoadableFonts unregisterFontsForGroup:](+[TSWPLoadableFonts sharedInstance](TSWPLoadableFonts, "sharedInstance"), "unregisterFontsForGroup:", objc_msgSend(objc_msgSend(objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "bookDescription"), "asset"), "assetID"));
  -[THFlowTOCViewController setReflowablePaginationController:](self->mFlowTocViewController, "setReflowablePaginationController:", 0);
  -[THDocumentViewController setDocument:](-[THBookViewController documentViewController](self, "documentViewController"), "setDocument:", 0);

  objc_msgSend(+[THApplePubAssetPlugin sharedPlugin](THApplePubAssetPlugin, "sharedPlugin"), "didCloseBook:", self);
}

- (void)p_cancelBookOpen
{
  THBookOpener *mBookOpener;

  mBookOpener = self->mBookOpener;
  if (mBookOpener)
  {
    -[THBookOpener cancel](mBookOpener, "cancel");

    self->mBookOpener = 0;
  }
}

- (void)close:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  UIViewController *v6;
  _QWORD v7[5];

  v3 = a3;
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "pAutoHideNavOverlay", 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_7C194;
  v7[3] = &unk_427790;
  v7[4] = self;
  +[THPerformanceRegressionLogger logEventWithBlock:](THPerformanceRegressionLogger, "logEventWithBlock:", v7);
  -[THBookViewController dismissActivePopover](self, "dismissActivePopover");
  -[THBookViewController hideFullscreenNotesView:andSearchForText:animated:force:completion:](self, "hideFullscreenNotesView:andSearchForText:animated:force:completion:", -[THBookViewController visibleViewController](self, "visibleViewController"), 0, 0, 0, 0);
  -[THBookViewController hideGlossaryWithDestinationViewController:animated:completion:](self, "hideGlossaryWithDestinationViewController:animated:completion:", -[THBookViewController visibleViewController](self, "visibleViewController"), 0, 0);
  -[THWAutoplayController stop](-[THDocumentViewController autoplayController](-[THBookViewController documentViewController](self, "documentViewController"), "autoplayController"), "stop");
  -[THNavigationBarController clearAutohideTimer](-[THBookViewController navigationBarController](self, "navigationBarController"), "clearAutohideTimer");
  v5 = -[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot");
  objc_msgSend(objc_msgSend(v5, "userDataManager"), "save:", objc_msgSend(v5, "moc"));
  v6 = -[THBookViewController visibleViewController](self, "visibleViewController");
  if (v6 == (UIViewController *)-[THBookViewController documentViewController](self, "documentViewController"))
    -[THBookViewController hideTOC](self, "hideTOC");
  -[AEAssetViewControllerDelegate assetViewController:willClose:](-[THBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"), "assetViewController:willClose:", self, v3);
  objc_msgSend(+[THApplePubAssetPlugin sharedPlugin](THApplePubAssetPlugin, "sharedPlugin"), "willCloseBook:", self);
}

- (void)requestClose:(BOOL)a3
{
  -[AEAssetViewControllerDelegate assetViewController:requestClose:error:](-[THBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"), "assetViewController:requestClose:error:", self, a3, 0);
}

- (void)_teardown
{
  id v3;
  void *v4;
  id v5;
  id v6;

  if (!self->mTornDown)
  {
    self->mTornDown = 1;
    self->mIsClosing = 1;
    -[THBookViewController p_cancelBookOpen](self, "p_cancelBookOpen");
    -[THBookViewController hideTOC](self, "hideTOC");
    -[THTOCViewController setDelegate:](self->mChapterBrowserController, "setDelegate:", 0);
    -[THBookViewController setChapterBrowserController:](self, "setChapterBrowserController:", 0);
    -[THGlossaryViewController unload](-[THBookViewController glossaryViewController](self, "glossaryViewController"), "unload");
    v3 = -[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot");
    if (v3)
    {
      v4 = v3;
      objc_msgSend(v3, "cancelApplePubRead");
      v5 = objc_msgSend(v4, "accessController");
      v6 = v5;
      objc_msgSend(v5, "performRead:withTarget:argument:", "closeDocumentWithReadLock:", self, 0);

    }
    -[THBookViewController setBookDescription:](self, "setBookDescription:", 0);
    -[THBookViewController p_removeViewController:](self, "p_removeViewController:", -[THBookViewController documentViewController](self, "documentViewController"));
  }
}

- (void)saveStateClosing:(BOOL)a3
{
  -[THBookViewController saveStateClosing:suspending:](self, "saveStateClosing:suspending:", a3, 0);
}

- (BOOL)dismissShouldBegin:(id)a3
{
  double v5;
  double v6;
  double v7;
  UIViewController *v9;

  objc_msgSend(a3, "velocity");
  v6 = v5;
  objc_msgSend(a3, "velocity");
  if (v6 >= v7)
    return 0;
  if (-[THDocumentViewController inFlowMode](-[THBookViewController documentViewController](self, "documentViewController"), "inFlowMode"))
  {
    return 0;
  }
  v9 = -[THBookViewController visibleViewController](self, "visibleViewController");
  if (v9 == (UIViewController *)-[THBookViewController documentViewController](self, "documentViewController")
    && -[THDocumentViewController showingExpandedWidgetView](-[THBookViewController documentViewController](self, "documentViewController"), "showingExpandedWidgetView"))
  {
    return 0;
  }
  else
  {
    return objc_msgSend(a3, "proposedBeginState");
  }
}

- (void)assetViewControllerReadyToAnswerReadingStatisticsQueries
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_7C3EC;
  block[3] = &unk_426DD0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)assetViewControllerViewForLiveResizeSnapshot
{
  UIViewController *v3;

  v3 = -[THBookViewController visibleViewController](self, "visibleViewController");
  if (v3 == (UIViewController *)-[THBookViewController documentViewController](self, "documentViewController"))
    return objc_msgSend(objc_msgSend(-[THDocumentViewController canvasViewController](-[THBookViewController documentViewController](self, "documentViewController"), "canvasViewController"), "canvasView"), "enclosingScrollView");
  else
    return -[UIViewController view](-[THBookViewController visibleViewController](self, "visibleViewController"), "view");
}

- (BOOL)snapshotDuringLiveResize
{
  return 1;
}

- (BOOL)aspectFitDuringLiveResize
{
  return !-[THBookViewController isBookEpub](self, "isBookEpub");
}

- (id)overlayViewColorForLiveResize
{
  if (-[THBookViewController isBookEpub](self, "isBookEpub"))
    return -[THTheme backgroundColorForTraitCollection:](-[THBookViewController theme](self, "theme"), "backgroundColorForTraitCollection:", objc_msgSend(-[THBookViewController view](self, "view"), "traitCollection"));
  else
    return +[UIColor whiteColor](UIColor, "whiteColor");
}

- (void)loadMetadata
{
  -[THBookDescription loadMetadata](self->mBookDescription, "loadMetadata");
}

- (void)paginationDidComplete
{
  if (-[THBookViewController _inAnalyticsReadSession](self, "_inAnalyticsReadSession"))
  {
    if (!-[THBookViewController analyticsReadStartProgress](self, "analyticsReadStartProgress"))
      -[THBookViewController setAnalyticsReadStartProgress:](self, "setAnalyticsReadStartProgress:", -[THBookViewController _analyticsReadingProgress](self, "_analyticsReadingProgress"));
  }
}

- (void)documentViewController:(id)a3 didChangePaginationStatus:(BOOL)a4
{
  -[THBookViewController setPaginationInProgress:](self, "setPaginationInProgress:", a4);
}

- (BOOL)p_shouldSendVantageChangedNotificationWithReason:(id)a3
{
  THDocumentViewController *v5;
  BOOL result;

  result = 0;
  if (!-[THDocumentViewController showingExpandedWidgetView](-[THBookViewController documentViewController](self, "documentViewController"), "showingExpandedWidgetView"))
  {
    if (!objc_msgSend(a3, "isEqualToString:", CFSTR("THVantageChangeReasonRotation")))
      return 1;
    if (!-[THBookViewController isNotesFullscreenVisible](self, "isNotesFullscreenVisible")
      && !-[THBookViewController isGlossaryVisible](self, "isGlossaryVisible")
      && !-[THBookViewController isStudyViewControllerVisible](self, "isStudyViewControllerVisible"))
    {
      v5 = -[THBookViewController documentViewController](self, "documentViewController");
      if (v5 == (THDocumentViewController *)-[THBookViewController visibleViewController](self, "visibleViewController"))return 1;
    }
  }
  return result;
}

- (void)vantageWillChangeBy:(id)a3 reason:(id)a4
{
  const __CFString *v7;
  id v8;

  if (-[THBookViewController p_shouldSendVantageChangedNotificationWithReason:](self, "p_shouldSendVantageChangedNotificationWithReason:", a4))
  {
    v7 = CFSTR("THVantageChangeReason");
    v8 = a4;
    -[NSNotificationCenter postNotificationName:object:userInfo:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("THVantageWillChangeNotification"), a3, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  }
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("THVantageChangeReasonPresentationMode")))
    -[THBookViewController p_updateTOCForUpcomingPresentationModeChange](self, "p_updateTOCForUpcomingPresentationModeChange");
}

- (void)vantageChangeWasCancelledBy:(id)a3 reason:(id)a4
{
  const __CFString *v6;
  id v7;

  if (-[THBookViewController p_shouldSendVantageChangedNotificationWithReason:](self, "p_shouldSendVantageChangedNotificationWithReason:", a4))
  {
    v6 = CFSTR("THVantageChangeReason");
    v7 = a4;
    -[NSNotificationCenter postNotificationName:object:userInfo:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("THVantageChangeWasCancelledNotification"), a3, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  }
}

- (void)vantageDidChangeBy:(id)a3 reason:(id)a4
{
  const __CFString *v7;
  id v8;

  if (-[THBookViewController p_shouldSendVantageChangedNotificationWithReason:](self, "p_shouldSendVantageChangedNotificationWithReason:", a4))
  {
    v7 = CFSTR("THVantageChangeReason");
    v8 = a4;
    -[NSNotificationCenter postNotificationName:object:userInfo:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("THVantageDidChangeNotification"), a3, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  }
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("THVantageChangeReasonPresentationMode")))
    -[THBookViewController p_updateTOCForPresentationModeChange](self, "p_updateTOCForPresentationModeChange");
  -[THBookViewController p_placeholderLocationDidChange](self, "p_placeholderLocationDidChange");
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return +[NSNull null](NSNull, "null", a3, a4);
}

- (BOOL)bookIsPaginatedForPortrait
{
  THBookDescription *v3;

  v3 = -[THBookViewController bookDescription](self, "bookDescription");
  if (v3)
    LOBYTE(v3) = -[THBookDescription orientationLock](-[THBookViewController bookDescription](self, "bookDescription"), "orientationLock") == 1;
  return (char)v3;
}

- (BOOL)bookIsPaginatedForLandscape
{
  return !-[THBookViewController bookIsPaginatedForPortrait](self, "bookIsPaginatedForPortrait");
}

- (BOOL)allowCopy
{
  return -[THBookDescription allowCopy](-[THBookViewController bookDescription](self, "bookDescription"), "allowCopy");
}

- (id)activityItemProviderWithCachedAnnotation:(id)a3
{
  return objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "activityItemProviderWithAnnotation:", a3);
}

- (id)activityItemProviderWithCachedAnnotations:(id)a3
{
  return objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "activityItemProviderWithAnnotations:", a3);
}

- (id)htmlGeneratorWithAnnotations:(id)a3
{
  id v5;
  THBookDescription *v6;
  id v7;
  NSString *v8;
  NSString *v9;

  v5 = objc_alloc_init((Class)AEAnnotationGroupHTMLGenerator);
  v6 = -[THBookViewController bookDescription](self, "bookDescription");
  v7 = objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "bookMetadata");
  objc_msgSend(v5, "setDataSource:", self);
  objc_msgSend(v5, "setStoreId:", -[THBookDescription storeID](v6, "storeID"));
  v8 = (NSString *)objc_msgSend(v7, "objectForKey:", CFSTR("itemName"));
  if (!v8)
    v8 = -[THBookDescription bookTitle](v6, "bookTitle");
  objc_msgSend(v5, "setTitle:", v8);
  v9 = (NSString *)objc_msgSend(v7, "objectForKey:", CFSTR("artistName"));
  if (!v9)
    v9 = -[THBookDescription bookAuthor](v6, "bookAuthor");
  objc_msgSend(v5, "setAuthor:", v9);
  objc_msgSend(v5, "setPublisherName:", objc_msgSend(v7, "objectForKey:", CFSTR("publisher")));
  objc_msgSend(v5, "setPublisherYear:", objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "yearFromReleaseDate"));
  objc_msgSend(v5, "setContentProtected:", -[PFDContext kiUanAfQBD5qIUraolUj](-[THBookDescription drmContext](v6, "drmContext"), "kiUanAfQBD5qIUraolUj"));
  objc_msgSend(v5, "setCitationsAllowed:", -[THBookViewController allowCopy](self, "allowCopy"));
  objc_msgSend(v5, "setAnnotations:", a3);
  return v5;
}

- (id)annotationID
{
  return objc_msgSend(objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "bookDescription"), "annotationID");
}

- (BOOL)followAnchor:(id)a3 pulse:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  THDocumentViewController *v8;

  v4 = a4;
  -[THDocumentViewController zoomOutIfNecessaryPriorToNavigation](-[THBookViewController documentViewController](self, "documentViewController"), "zoomOutIfNecessaryPriorToNavigation");
  if (objc_msgSend(a3, "contentNode"))
  {
    if (-[THBookViewController isGlossaryVisible](self, "isGlossaryVisible"))
    {
      if (!-[THGlossaryViewController shouldDismissAfterRotate](-[THBookViewController glossaryViewController](self, "glossaryViewController"), "shouldDismissAfterRotate"))
      {
        -[THBookViewController p_showDVC](self, "p_showDVC");
        -[THBookViewController hideGlossaryWithDestinationViewController:](self, "hideGlossaryWithDestinationViewController:", -[THBookViewController visibleViewController](self, "visibleViewController"));
      }
    }
    else
    {
      -[THBookViewController p_showDVC](self, "p_showDVC");
    }
    v8 = -[THBookViewController documentViewController](self, "documentViewController");
    goto LABEL_9;
  }
  v7 = objc_msgSend(a3, "glossaryEntry");
  if (v7)
  {
    -[THBookViewController p_showGlossary](self, "p_showGlossary");
    v8 = -[THBookViewController glossaryViewController](self, "glossaryViewController");
LABEL_9:
    LOBYTE(v7) = -[THDocumentViewController followAnchor:pulse:](v8, "followAnchor:pulse:", a3, v4);
  }
  return (char)v7;
}

- (void)willFollowAnchor:(id)a3 pulse:(BOOL)a4
{
  UIViewController *v5;

  if (objc_msgSend(a3, "contentNode"))
  {
    v5 = -[THBookViewController visibleViewController](self, "visibleViewController");
    if (v5 != (UIViewController *)-[THBookViewController documentViewController](self, "documentViewController"))
      -[THBookViewController p_showDVC](self, "p_showDVC");
  }
}

- (BOOL)followLink:(id)a3
{
  return -[THBookViewController followLink:animated:](self, "followLink:animated:", a3, 1);
}

- (BOOL)followLink:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _BOOL8 v7;

  v4 = a4;
  v6 = -[THBookViewController anchorFromLink:](self, "anchorFromLink:", a3);
  v7 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
  +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", v4);
  LOBYTE(v4) = -[THBookViewController followAnchor:pulse:](self, "followAnchor:pulse:", v6, 1);
  +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", v7);
  return v4;
}

- (id)anchorFromLink:(id)a3
{
  return -[THBookLinkResolver anchorFromAbsoluteLink:presentationType:](-[THBookViewController bookLinkResolver](self, "bookLinkResolver"), "anchorFromAbsoluteLink:presentationType:", a3, -[THDocumentViewController currentPresentationType](-[THBookViewController documentViewController](self, "documentViewController"), "currentPresentationType"));
}

- (void)followAbsolutePageIndex:(unint64_t)a3
{
  -[THBookViewController p_showDVC](self, "p_showDVC");
  -[THBookViewController hideGlossaryWithDestinationViewController:](self, "hideGlossaryWithDestinationViewController:", -[THBookViewController visibleViewController](self, "visibleViewController"));
  -[THDocumentViewController followAbsolutePageIndex:](-[THBookViewController documentViewController](self, "documentViewController"), "followAbsolutePageIndex:", a3);
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self->mDocumentViewController, "interactiveCanvasController"), "layoutIfNeeded");
  +[CATransaction flush](CATransaction, "flush");
}

- (BOOL)isNotesFullscreenVisible
{
  unsigned int v3;

  if (self->mNotesFullscreenViewController
    && !-[THBookViewController isStudyViewControllerVisible](self, "isStudyViewControllerVisible"))
  {
    v3 = -[THNotesViewController isViewLoaded](-[THBookViewController notesFullscreenViewController](self, "notesFullscreenViewController"), "isViewLoaded");
    if (v3)
      LOBYTE(v3) = objc_msgSend(-[THNotesViewController view](-[THBookViewController notesFullscreenViewController](self, "notesFullscreenViewController"), "view"), "superview") != 0;
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)isGlossaryVisible
{
  THGlossaryViewController *v3;

  v3 = -[THBookViewController glossaryViewController](self, "glossaryViewController");
  if (v3)
    LOBYTE(v3) = -[THGlossaryViewController isGlossaryVisible](-[THBookViewController glossaryViewController](self, "glossaryViewController"), "isGlossaryVisible");
  return (char)v3;
}

- (BOOL)isTOCVisible
{
  THiOSFlowToCTableViewController *v3;
  BOOL v4;

  v3 = -[THBookViewController visibleViewController](self, "visibleViewController");
  if (!v3)
    return 0;
  v4 = v3 == (THiOSFlowToCTableViewController *)self->mFlowTocViewController
    || v3 == (THiOSFlowToCTableViewController *)self->mChapterBrowserController
    || v3 == self->mFlowToCTableViewController;
  if (-[THBookViewController isGlossaryVisible](self, "isGlossaryVisible")
    || -[THBookViewController isNotesFullscreenVisible](self, "isNotesFullscreenVisible")
    || -[THBookViewController isStudyViewControllerVisible](self, "isStudyViewControllerVisible"))
  {
    return 0;
  }
  return v4;
}

- (BOOL)isGlossaryPresenting
{
  _BOOL4 v3;

  v3 = -[THBookViewController presentingGlossary](self, "presentingGlossary");
  if (v3)
    LOBYTE(v3) = -[THBookViewController glossaryViewController](self, "glossaryViewController") != 0;
  return v3;
}

- (THBookLinkResolver)bookLinkResolver
{
  return self->mBookLinkResolver;
}

- (void)willJumpToPageLocation:(id)a3
{
  -[THBookViewController vantageWillChangeBy:reason:](self, "vantageWillChangeBy:reason:", self, CFSTR("THVantageChangeReasonNavigation"));
  -[THBookViewController p_showDVC](self, "p_showDVC");
}

- (void)didJumpToPageLocation:(id)a3
{
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self->mDocumentViewController, "interactiveCanvasController", a3), "layoutIfNeeded");
  +[CATransaction flush](CATransaction, "flush");
  -[THBookViewController vantageDidChangeBy:reason:](self, "vantageDidChangeBy:reason:", self, CFSTR("THVantageChangeReasonNavigation"));
}

- (void)showBookmarksView:(id)a3
{
  -[THBookViewController p_showBookmarkMenu](self, "p_showBookmarkMenu", a3);
}

- (void)books_setThemeWhite:(id)a3
{
  -[THBookViewController applyAppearanceStyle:](self, "applyAppearanceStyle:", 0);
}

- (void)books_setThemeSepia:(id)a3
{
  -[THBookViewController applyAppearanceStyle:](self, "applyAppearanceStyle:", 1);
}

- (void)books_setThemeGray:(id)a3
{
  -[THBookViewController applyAppearanceStyle:](self, "applyAppearanceStyle:", 2);
}

- (void)books_setThemeNight:(id)a3
{
  -[THBookViewController applyAppearanceStyle:](self, "applyAppearanceStyle:", 3);
}

- (BOOL)canIncreaseFontSize
{
  return -[THBookViewController shouldShowFontResizeControls:](self, "shouldShowFontResizeControls:", -[THBookViewController displaySettingsViewController](self, "displaySettingsViewController"));
}

- (BOOL)canDecreaseFontSize
{
  return -[THBookViewController shouldShowFontResizeControls:](self, "shouldShowFontResizeControls:", -[THBookViewController displaySettingsViewController](self, "displaySettingsViewController"));
}

- (void)increaseFontSize:(id)a3
{
  -[THBookViewController p_setupDisplaySettingsIfNeeded](self, "p_setupDisplaySettingsIfNeeded", a3);
  -[THDisplaySettingsViewController increaseFontSize:](-[THBookViewController displaySettingsViewController](self, "displaySettingsViewController"), "increaseFontSize:", self);
  -[THBookViewController setDisplaySettingsViewController:](self, "setDisplaySettingsViewController:", 0);
}

- (void)decreaseFontSize:(id)a3
{
  -[THBookViewController p_setupDisplaySettingsIfNeeded](self, "p_setupDisplaySettingsIfNeeded", a3);
  -[THDisplaySettingsViewController decreaseFontSize:](-[THBookViewController displaySettingsViewController](self, "displaySettingsViewController"), "decreaseFontSize:", self);
  -[THBookViewController setDisplaySettingsViewController:](self, "setDisplaySettingsViewController:", 0);
}

- (void)navigateToSearchResult:(id)a3
{
  -[THBookViewController followAnchor:pulse:](self, "followAnchor:pulse:", a3, 1);
}

- (void)searchFinished:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v5;

  v5 = a3;
  if (-[THBookViewController p_isSearchVisible](self, "p_isSearchVisible"))
    -[THBookViewController dismissSearchPopover:completion:](self, "dismissSearchPopover:completion:", v5, a4);
}

- (BOOL)canRevealTOC
{
  THChapterBrowserController *v3;
  THChapterBrowserController *mChapterBrowserController;
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL result;

  v3 = -[THBookViewController p_selectedTocViewController](self, "p_selectedTocViewController");
  mChapterBrowserController = self->mChapterBrowserController;
  v5 = objc_msgSend(-[THBookViewController view](self, "view"), "bounds");
  v7 = 1.0;
  if (v8 > 0.0)
  {
    objc_msgSend(-[THBookViewController view](self, "view"), "bounds");
    v10 = v9;
    v5 = objc_msgSend(-[THBookViewController view](self, "view"), "bounds");
    v7 = v10 / v11;
  }
  if (v3 != mChapterBrowserController)
    return 0;
  if ((TSUPhoneUI(v5, v6) & 1) != 0)
    return 1;
  result = -[THBookViewController im_isCompactWidth](self, "im_isCompactWidth");
  if (v7 >= 0.5)
    return 0;
  return result;
}

- (void)willRevealTOC
{
  unint64_t v3;
  unint64_t v4;

  -[THDocumentViewController willStartRevealTOC](self->mDocumentViewController, "willStartRevealTOC");
  v3 = -[THDocumentViewController currentChapter](self->mDocumentViewController, "currentChapter");
  v4 = -[THDocumentViewController currentRelativePageIndex](self->mDocumentViewController, "currentRelativePageIndex");
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookViewController willRevealTOC]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm"), 4174, CFSTR("Current page index is bogus"));
  -[THChapterBrowserController setIsPinchingDownFromCanvas:](self->mChapterBrowserController, "setIsPinchingDownFromCanvas:", 1);
  -[THChapterBrowserController setChapterIndex:](self->mChapterBrowserController, "setChapterIndex:", v3);
  -[THTOCViewController setShroudedFraction:](self->mChapterBrowserController, "setShroudedFraction:", 1.0);
  -[THBookViewController p_addViewControllerInBack:](self, "p_addViewControllerInBack:", self->mChapterBrowserController);
  -[THChapterBrowserController willTransitionFromChapterIndex:](self->mChapterBrowserController, "willTransitionFromChapterIndex:", v3);
  -[THChapterBrowserController hidePageThumbnailAtIndex:chapterIndex:scrollIfNecessary:](self->mChapterBrowserController, "hidePageThumbnailAtIndex:chapterIndex:scrollIfNecessary:", v4, v3, 1);
  -[THChapterBrowserController scrollToThumbnailAtIndex:](self->mChapterBrowserController, "scrollToThumbnailAtIndex:", -[THDocumentViewController currentRelativePageIndex](self->mDocumentViewController, "currentRelativePageIndex"));
  -[THDocumentViewController startRevealTOC](self->mDocumentViewController, "startRevealTOC");
}

- (CGRect)pageTargetRectForRevealingTOC
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[THChapterBrowserController rectForPageThumbnailAtIndex:inLayer:](self->mChapterBrowserController, "rectForPageThumbnailAtIndex:inLayer:", -[THDocumentViewController currentRelativePageIndex](self->mDocumentViewController, "currentRelativePageIndex"), objc_msgSend(-[THBookViewController unmovingViewForRevealingTOC](self, "unmovingViewForRevealingTOC"), "layer"));
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)revealTOCByAmount:(double)a3
{
  -[THTOCViewController setShroudedFraction:](self->mChapterBrowserController, "setShroudedFraction:", 1.0 - a3);
}

- (void)revealTOCAnimated:(BOOL)a3 duration:(double)a4
{
  _BOOL8 v5;

  v5 = a3;
  -[THDocumentViewController showPageThumbnailsForPageIndexes:animated:duration:](self->mDocumentViewController, "showPageThumbnailsForPageIndexes:animated:duration:", +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", -[THDocumentViewController currentRelativePageIndex](self->mDocumentViewController, "currentRelativePageIndex")), 1, a4);
  -[THTOCViewController setShrouded:animated:duration:](self->mChapterBrowserController, "setShrouded:animated:duration:", 0, v5, a4);
}

- (void)unrevealTOCAnimated:(BOOL)a3 duration:(double)a4
{
  _BOOL8 v5;

  v5 = a3;
  -[THDocumentViewController hidePageThumbnailsAnimated:duration:](self->mDocumentViewController, "hidePageThumbnailsAnimated:duration:");
  -[THTOCViewController setShrouded:animated:duration:](self->mChapterBrowserController, "setShrouded:animated:duration:", 1, v5, a4);
}

- (void)didRevealTOC
{
  -[THBookViewController dismissActivePopover](self, "dismissActivePopover");
  if (!-[THChapterBrowserController paginatedTOCShowsStatusBar](self->mChapterBrowserController, "paginatedTOCShowsStatusBar")&& !-[THBookViewController isToolbarHidden](self, "isToolbarHidden"))
  {
    -[THBookViewController hideToolbarAnimated:](self, "hideToolbarAnimated:", 1);
  }
  -[THBookViewController refreshStatusBarAppearance](self, "refreshStatusBarAppearance");
  -[THChapterBrowserController didTransitionFromCanvas](self->mChapterBrowserController, "didTransitionFromCanvas");
  -[THTOCViewControllerDelegate didTransitionFromViewController:toTOCViewController:](-[THTOCViewController delegate](self->mChapterBrowserController, "delegate"), "didTransitionFromViewController:toTOCViewController:", -[THDocumentViewController canvasViewController](self->mDocumentViewController, "canvasViewController"), self->mChapterBrowserController);
  objc_msgSend(-[THDocumentViewController view](self->mDocumentViewController, "view"), "removeFromSuperview");
  -[THDocumentViewController setVisibleInfoUpdatesAllowedInLandscape:](self->mDocumentViewController, "setVisibleInfoUpdatesAllowedInLandscape:", 0);
  -[THDocumentViewController hidePageThumbnailsAnimated:duration:](self->mDocumentViewController, "hidePageThumbnailsAnimated:duration:", 0, 0.0);
  -[THBookViewController recordOutgoingMajorNavigationJump](self, "recordOutgoingMajorNavigationJump");
}

- (void)endRevealTOC
{
  -[THChapterBrowserController showPageThumbnailAtIndex:](self->mChapterBrowserController, "showPageThumbnailAtIndex:", -[THDocumentViewController currentRelativePageIndex](self->mDocumentViewController, "currentRelativePageIndex"));
  -[THDocumentViewController endRevealTOC](self->mDocumentViewController, "endRevealTOC");
}

- (void)viewsDidResize
{
  -[AEAssetViewControllerDelegate didFinishUpdateForAssetViewController:](-[THBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"), "didFinishUpdateForAssetViewController:", self);
}

- (void)recordOutgoingMajorNavigationJump
{
  -[THBookspotHistoryStack recordOutgoingMajorNavigationJump](-[THBookViewController bookspotHistoryStack](self, "bookspotHistoryStack"), "recordOutgoingMajorNavigationJump");
}

- (void)willJumpToTOC
{
  -[THBookspotHistoryStack recordOutgoingMajorNavigationJumpSuppressingToolbar:](-[THBookViewController bookspotHistoryStack](self, "bookspotHistoryStack"), "recordOutgoingMajorNavigationJumpSuppressingToolbar:", 1);
}

- (void)updateNavigationAffordances
{
  -[THNavigationHistoryStepperController updateHistoryNavigation](-[THBookViewController navigationHistoryStepperController](self, "navigationHistoryStepperController"), "updateHistoryNavigation");
  -[THBookViewController updatePageNumberWidth](self, "updatePageNumberWidth");
}

- (void)updatePageNumberWidth
{
  CGFloat v3;
  CGFloat v4;
  double MinX;
  CGFloat v6;
  THNavigationOverlayView *v7;
  CGFloat v8;
  double v9;
  double v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  -[THNavigationOverlayView layoutIfNeeded](-[THBookViewController navigationOverlayView](self, "navigationOverlayView"), "layoutIfNeeded");
  -[THNavigationOverlayView frame](-[THBookViewController navigationOverlayView](self, "navigationOverlayView"), "frame");
  v3 = CGRectGetWidth(v11) * 0.5;
  -[UIButton frame](-[THNavigationOverlayView prevButton](-[THBookViewController navigationOverlayView](self, "navigationOverlayView"), "prevButton"), "frame");
  v4 = v3 - CGRectGetMaxX(v12);
  -[UIButton frame](-[THNavigationOverlayView nextButton](-[THBookViewController navigationOverlayView](self, "navigationOverlayView"), "nextButton"), "frame");
  MinX = CGRectGetMinX(v13);
  -[THNavigationOverlayView frame](-[THBookViewController navigationOverlayView](self, "navigationOverlayView"), "frame");
  v6 = MinX - CGRectGetWidth(v14) * 0.5;
  v7 = -[THBookViewController navigationOverlayView](self, "navigationOverlayView");
  if (v4 >= v6)
  {
    -[UIButton frame](-[THNavigationOverlayView nextButton](v7, "nextButton"), "frame");
    v10 = CGRectGetMinX(v17);
    -[THNavigationOverlayView frame](-[THBookViewController navigationOverlayView](self, "navigationOverlayView"), "frame");
    v9 = v10 + CGRectGetWidth(v18) * -0.5;
  }
  else
  {
    -[THNavigationOverlayView frame](v7, "frame");
    v8 = CGRectGetWidth(v15) * 0.5;
    -[UIButton frame](-[THNavigationOverlayView prevButton](-[THBookViewController navigationOverlayView](self, "navigationOverlayView"), "prevButton"), "frame");
    v9 = v8 - CGRectGetMaxX(v16);
  }
  -[THPageNumberView updateMaxWidth:](-[THDocumentViewController navOverlayPageNumberView](-[THBookViewController documentViewController](self, "documentViewController"), "navOverlayPageNumberView"), "updateMaxWidth:", v9 + v9);
}

- (void)tocIsReadyToPresent:(id)a3
{
  if (-[THBookViewController bookOpenDestinationIsTOC](self, "bookOpenDestinationIsTOC", a3))
    -[THBookViewController viewsAreReadyForOpenAnimation](self, "viewsAreReadyForOpenAnimation");
}

- (void)setupDVCForTOCController:(id)a3
{
  UIViewController *v4;

  v4 = -[THBookViewController visibleViewController](self, "visibleViewController", a3);
  if (v4 != (UIViewController *)-[THBookViewController documentViewController](self, "documentViewController"))
    -[THBookViewController p_insertDVCInBack](self, "p_insertDVCInBack");
}

- (id)navigationUnitForChapterBrowserController:(id)a3 chapterIndex:(unint64_t)a4
{
  return -[THDocumentViewController navigationUnitForChapterIndex:](-[THBookViewController documentViewController](self, "documentViewController", a3), "navigationUnitForChapterIndex:", a4);
}

- (id)presentationTypeForChapterBrowserController:(id)a3
{
  return objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController", a3), "documentRoot"), "properties"), "chapterBrowserPagePresentationType");
}

- (void)p_updateCanvasWithPendingPageIndexPath
{
  if (self->mPendingPageIndexPath)
  {
    -[THDocumentViewController setVisibleInfoUpdatesAllowedInLandscape:](-[THBookViewController documentViewController](self, "documentViewController"), "setVisibleInfoUpdatesAllowedInLandscape:", 1);
    -[THDocumentViewController updateVisibleInfosWithPageIndex:](-[THBookViewController documentViewController](self, "documentViewController"), "updateVisibleInfosWithPageIndex:", -[NSIndexPath indexAtPosition:](self->mPendingPageIndexPath, "indexAtPosition:", 1));

    self->mPendingPageIndexPath = 0;
  }
}

- (void)preloadContentNodesForPageRange:(_NSRange)a3 chapterIndex:(unint64_t)a4
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  NSMutableSet *i;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[7];
  _QWORD v16[6];
  _QWORD v17[5];
  THDocumentViewController *v18;

  if ((id)a3.location != NSInvalidRange[0] || a3.length != (_QWORD)NSInvalidRange[1])
  {
    length = a3.length;
    location = a3.location;
    v9 = +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", objc_msgSend(objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "rootNode"), "context"));
    v10 = -[THDocumentViewController navigationUnitForChapterIndex:](-[THBookViewController documentViewController](self, "documentViewController"), "navigationUnitForChapterIndex:", a4);
    for (i = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet); length; --length)
    {
      v12 = objc_msgSend(v10, "contentNodeForRelativePageIndex:forPresentationType:", location, v9);
      if (v12)
      {
        v13 = v12;
        -[NSMutableSet addObject:](i, "addObject:", v12);
        objc_msgSend(v13, "startLoading");
        v17[0] = 0;
        v17[1] = v17;
        v17[2] = 0x3052000000;
        v17[3] = sub_7D8C8;
        v17[4] = sub_7D8D8;
        v18 = 0;
        v18 = -[THBookViewController documentViewController](self, "documentViewController");
        v15[6] = v17;
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_7D8E4;
        v16[3] = &unk_426E28;
        v16[4] = i;
        v16[5] = v13;
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_7D8F0;
        v15[3] = &unk_427D90;
        v15[4] = i;
        v15[5] = v13;
        objc_msgSend(v13, "performWhenFinishedLoading:onError:", v16, v15);
        _Block_object_dispose(v17, 8);
      }
      ++location;
    }
    v14 = -[NSMutableSet mutableCopy](self->mPreloadingContentNodes, "mutableCopy");
    objc_msgSend(v14, "minusSet:", i);
    objc_msgSend(v14, "makeObjectsPerformSelector:", "cancelLoading");

    self->mPreloadingContentNodes = i;
  }
}

- (void)cancelPreloadOfContentNodes
{
  NSMutableSet *mPreloadingContentNodes;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  mPreloadingContentNodes = self->mPreloadingContentNodes;
  self->mPreloadingContentNodes = 0;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](mPreloadingContentNodes, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(mPreloadingContentNodes);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "cancelLoading");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](mPreloadingContentNodes, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
  -[NSMutableSet removeAllObjects](mPreloadingContentNodes, "removeAllObjects");

}

- (void)cancelPreloadOfContentNodesForChapterBrowserController:(id)a3
{
  -[THBookViewController cancelPreloadOfContentNodes](self, "cancelPreloadOfContentNodes", a3);
}

- (void)chapterBrowserController:(id)a3 preloadContentNodesForPageRange:(_NSRange)a4 chapterIndex:(unint64_t)a5
{
  -[THBookViewController preloadContentNodesForPageRange:chapterIndex:](self, "preloadContentNodesForPageRange:chapterIndex:", a4.location, a4.length, a5);
}

- (void)chapterBrowserController:(id)a3 willTransitionToPageIndex:(unint64_t)a4 chapterIndex:(unint64_t)a5 freeTransform:(BOOL)a6
{
  _BOOL4 v6;
  NSIndexPath *v10;
  id v11;
  _QWORD v12[7];
  _QWORD v13[9];
  _QWORD v14[6];
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  THDocumentViewController *v18;
  _QWORD v19[2];

  v6 = a6;
  -[THBookViewController setDisallowRotate:](self, "setDisallowRotate:", 1);
  if (!v6)
    -[THNavigationBarController setNavigationBarHidden:animated:](-[THBookViewController navigationBarController](self, "navigationBarController"), "setNavigationBarHidden:animated:", 1, 1);
  -[THBookViewController p_insertDVCInBackAnimated:](self, "p_insertDVCInBackAnimated:", 1);
  -[THDocumentViewController switchToNavigationUnitForChapterIndex:](-[THBookViewController documentViewController](self, "documentViewController"), "switchToNavigationUnitForChapterIndex:", a5);
  -[THBookLinkResolver setDocumentLinkResolver:](-[THBookViewController bookLinkResolver](self, "bookLinkResolver"), "setDocumentLinkResolver:", -[THDocumentViewController documentLinkResolver](-[THBookViewController documentViewController](self, "documentViewController"), "documentLinkResolver"));
  -[THDocumentNavigator setVisitedPagesAfterOpening:](-[THDocumentViewController documentNavigator](-[THBookViewController documentViewController](self, "documentViewController"), "documentNavigator"), "setVisitedPagesAfterOpening:", 1);
  v19[0] = a5;
  v19[1] = a4;
  v10 = (NSIndexPath *)objc_msgSend(objc_alloc((Class)NSIndexPath), "initWithIndexes:length:", v19, 2);
  if (self->mPendingPageIndexPath)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookViewController chapterBrowserController:willTransitionToPageIndex:chapterIndex:freeTransform:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm"), 4421, CFSTR("expected nil value for '%s'"), "mPendingPageIndexPath");
  self->mPendingPageIndexPath = v10;
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](-[THBookViewController documentViewController](self, "documentViewController"), "interactiveCanvasController"), "setSuppressRevealScrollViewOnLayoutAndRender:", !v6);
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](-[THBookViewController documentViewController](self, "documentViewController"), "interactiveCanvasController"), "didBeginFreeTransform");
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](-[THBookViewController documentViewController](self, "documentViewController"), "interactiveCanvasController"), "beginStaticLayoutAndRender");
  v11 = -[THDocumentViewController contentNodeForPageIndex:](-[THBookViewController documentViewController](self, "documentViewController"), "contentNodeForPageIndex:", a4);
  objc_msgSend(v11, "startLoading");
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3052000000;
  v17[3] = sub_7D8C8;
  v17[4] = sub_7D8D8;
  v18 = 0;
  v18 = -[THBookViewController documentViewController](self, "documentViewController");
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3052000000;
  v15[3] = sub_7D8C8;
  v15[4] = sub_7D8D8;
  v16 = 0;
  v16 = -[THDocumentViewController interactiveCanvasController](-[THBookViewController documentViewController](self, "documentViewController"), "interactiveCanvasController");
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3052000000;
  v14[3] = sub_7D8C8;
  v14[4] = sub_7D8D8;
  v14[5] = self;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_7DD50;
  v13[3] = &unk_4284A8;
  v13[4] = self;
  v13[5] = v10;
  v13[6] = v17;
  v13[7] = v14;
  v13[8] = a4;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_7DDC4;
  v12[3] = &unk_427AC8;
  v12[4] = self;
  v12[5] = v15;
  v12[6] = v17;
  objc_msgSend(v11, "performWhenFinishedLoading:onError:", v13, v12);
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
}

- (void)chapterBrowserController:(id)a3 didTransitionToPageIndex:(unint64_t)a4 chapterIndex:(unint64_t)a5 relativeTargetRect:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  unsigned int v13;
  id v14;
  double v15;
  id v16;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v13 = -[THBookViewController setupLoadSpinner](self, "setupLoadSpinner", a3, a4, a5);
  objc_msgSend(-[THDocumentViewController contentNodeForPageIndex:](-[THBookViewController documentViewController](self, "documentViewController"), "contentNodeForPageIndex:", a4), "waitUntilFinishedLoadingAndPaginating");
  +[CATransaction begin](CATransaction, "begin");
  -[THBookViewController p_updateCanvasWithPendingPageIndexPath](self, "p_updateCanvasWithPendingPageIndexPath");
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](-[THBookViewController documentViewController](self, "documentViewController"), "interactiveCanvasController"), "layoutIfNeeded");
  v14 = objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](-[THBookViewController documentViewController](self, "documentViewController"), "interactiveCanvasController"), "canvasView"), "enclosingScrollView"), "layer");
  LODWORD(v15) = 1.0;
  objc_msgSend(v14, "setOpacity:", v15);
  +[CATransaction commit](CATransaction, "commit");
  -[THDocumentViewController updateVisibleInfos](-[THBookViewController documentViewController](self, "documentViewController"), "updateVisibleInfos");
  if (v13)
    -[THBookViewController hideLoadSpinner](self, "hideLoadSpinner");
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](-[THBookViewController documentViewController](self, "documentViewController"), "interactiveCanvasController"), "endStaticLayoutAndRender:", 0);
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](-[THBookViewController documentViewController](self, "documentViewController"), "interactiveCanvasController"), "didEndFreeTransform");
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](-[THBookViewController documentViewController](self, "documentViewController"), "interactiveCanvasController"), "setSuppressRevealScrollViewOnLayoutAndRender:", 0);
  if (-[THBookViewController shouldKeepTOCInBackground:](self, "shouldKeepTOCInBackground:", a3))
    -[THBookViewController p_addViewControllerInBack:](self, "p_addViewControllerInBack:", a3);
  else
    -[THBookViewController hideTOC](self, "hideTOC");
  -[THBookViewController hideToolbarAnimated:](self, "hideToolbarAnimated:", 0);
  -[THBookViewController p_showDVC](self, "p_showDVC");
  v16 = objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "searchController");
  if ((objc_msgSend(v16, "indexLoaded") & 1) == 0
    && (objc_msgSend(v16, "unloadRequested") & 1) == 0
    && (TSUPadIsFirstGen() & 1) == 0)
  {
    objc_msgSend(v16, "loadIndex");
  }
  -[THBookViewController recordCurrentLocationInHistory](self, "recordCurrentLocationInHistory");
  -[THDocumentViewController zoomToRelativeTargetRect:atPageIndex:](-[THBookViewController documentViewController](self, "documentViewController"), "zoomToRelativeTargetRect:atPageIndex:", a4, x, y, width, height);
  -[THBookViewController setDisallowRotate:](self, "setDisallowRotate:", 0);
  -[THBookViewController refreshStatusBarAppearance](self, "refreshStatusBarAppearance");
}

- (void)chapterBrowserController:(id)a3 cancelledTransitionToPageIndex:(unint64_t)a4 chapterIndex:(unint64_t)a5
{
  THDocumentViewController *v7;

  v7 = -[THBookViewController documentViewController](self, "documentViewController", a3, a4, a5);
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](v7, "interactiveCanvasController"), "endStaticLayoutAndRender:", 1);
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](v7, "interactiveCanvasController"), "didEndFreeTransform");
  objc_msgSend(-[THDocumentViewController contentNodeForPageIndex:](v7, "contentNodeForPageIndex:", a4), "cancelLoading");
  -[THBookViewController p_removeViewController:](self, "p_removeViewController:", v7);
  -[THDocumentViewController setVisibleInfoUpdatesAllowedInLandscape:](v7, "setVisibleInfoUpdatesAllowedInLandscape:", 0);

  self->mPendingPageIndexPath = 0;
  -[THBookViewController setDisallowRotate:](self, "setDisallowRotate:", 0);
}

- (CGRect)chapterBrowserController:(id)a3 rectForRelativePageIndex:(unint64_t)a4 chapterIndex:(unint64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[THDocumentViewController rectForRelativePageIndex:chapterIndex:](-[THBookViewController documentViewController](self, "documentViewController", a3), "rectForRelativePageIndex:chapterIndex:", a4, a5);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void)chapterBrowserController:(id)a3 updateTitleForChapterIndex:(unint64_t)a4
{
  -[THNavigationBarController updateViewStateWithThemeDelegate:](-[THBookViewController navigationBarController](self, "navigationBarController", a3, a4), "updateViewStateWithThemeDelegate:", a3);
}

- (id)chapterBrowserController:(id)a3 pageNumberStringForRelativePageIndex:(unint64_t)a4 andChapterIndex:(unint64_t)a5
{
  return -[THDocumentNavigationModel pageNumberStringForAbsolutePageIndex:forPresentationType:](-[THBookViewController navigationModel](self, "navigationModel"), "pageNumberStringForAbsolutePageIndex:forPresentationType:", (char *)objc_msgSend(-[THDocumentViewController navigationUnitForChapterIndex:](-[THBookViewController documentViewController](self, "documentViewController"), "navigationUnitForChapterIndex:", a5), "absolutePageIndexForRelativePageIndex:forPresentationType:", 0, -[THBookViewController presentationTypeForChapterBrowserController:](self, "presentationTypeForChapterBrowserController:", a3))+ a4, -[THBookViewController presentationTypeForChapterBrowserController:](self, "presentationTypeForChapterBrowserController:", a3));
}

- (BOOL)chapterBrowserController:(id)a3 isCurrentlyDisplayedPageForRelativePageIndex:(unint64_t)a4 andChapterIndex:(unint64_t)a5
{
  return -[THDocumentViewController currentChapter](-[THBookViewController documentViewController](self, "documentViewController", a3), "currentChapter") == a5&& -[THDocumentViewController currentRelativePageIndex](-[THBookViewController documentViewController](self, "documentViewController"), "currentRelativePageIndex") == a4;
}

- (unint64_t)chapterCountForChapterBrowserController:(id)a3
{
  return (unint64_t)objc_msgSend(objc_msgSend(objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot", a3), "tocModel"), "tiles"), "count");
}

- (id)chapterBrowserController:(id)a3 tocTileModelAtIndex:(unint64_t)a4
{
  return objc_msgSend(objc_msgSend(objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot", a3), "tocModel"), "tiles"), "objectAtIndex:", a4);
}

- (id)canvasScrollViewForChapterBrowserController:(id)a3
{
  return objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](-[THBookViewController documentViewController](self, "documentViewController", a3), "interactiveCanvasController"), "canvasView"), "enclosingScrollView");
}

- (unint64_t)chapterBrowserController:(id)a3 relativePageIndexForLink:(id)a4
{
  THDocumentViewController *v5;

  v5 = -[THBookViewController documentViewController](self, "documentViewController", a3);
  -[THDocumentViewController ensureDocumentIsLoaded](v5, "ensureDocumentIsLoaded");
  return -[THDocumentNavigator relativePageIndexForLink:](-[THDocumentViewController documentNavigator](v5, "documentNavigator"), "relativePageIndexForLink:", a4);
}

- (CGRect)chapterBrowserController:(id)a3 targetRelativeRectForPoint:(CGPoint)a4 atPageIndex:(unint64_t)a5 chapterIndex:(unint64_t)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  -[THDocumentViewController targetRelativeRectForPoint:atPageIndex:chapterIndex:waitForContentNodeLoad:](-[THBookViewController documentViewController](self, "documentViewController", a3), "targetRelativeRectForPoint:atPageIndex:chapterIndex:waitForContentNodeLoad:", a5, a6, 0, a4.x, a4.y);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)chapterBrowserController:(id)a3 targetRelativeRectForRelativePoint:(CGPoint)a4 atPageIndex:(unint64_t)a5 chapterIndex:(unint64_t)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  -[THDocumentViewController targetRelativeRectForRelativePoint:atPageIndex:chapterIndex:waitForContentNodeLoad:](-[THBookViewController documentViewController](self, "documentViewController", a3), "targetRelativeRectForRelativePoint:atPageIndex:chapterIndex:waitForContentNodeLoad:", a5, a6, 0, a4.x, a4.y);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (BOOL)chapterBrowserController:(id)a3 shouldShowShroudForVisibleSize:(CGSize)a4
{
  double height;
  double width;

  height = a4.height;
  width = a4.width;
  if (-[THBookViewController visibleViewController](self, "visibleViewController") == a3
    || -[THBookViewController transitioningTOCSize](self, "transitioningTOCSize"))
  {
    return 0;
  }
  else
  {
    return -[THBookViewController p_shouldShowShroudForVisibleSize:](self, "p_shouldShowShroudForVisibleSize:", width, height);
  }
}

- (BOOL)chapterBrowserController:(id)a3 navigateToLinkInDVC:(id)a4
{
  return -[THBookViewController navigateToLinkInDVC:](self, "navigateToLinkInDVC:", a4);
}

- (BOOL)isTwoUpForChapterBrowserController:(id)a3
{
  return -[THDocumentViewController isTwoUp](-[THBookViewController documentViewController](self, "documentViewController", a3), "isTwoUp");
}

- (BOOL)isLastPageInChapterForChapterBrowserController:(id)a3 pageIndex:(unint64_t)a4 chapterIndex:(unint64_t)a5
{
  return -[THDocumentViewController isLastPageInChapterForRelativePageIndex:chapterIndex:](-[THBookViewController documentViewController](self, "documentViewController", a3), "isLastPageInChapterForRelativePageIndex:chapterIndex:", a4, a5);
}

- (BOOL)isSinglePageInChapterForChapterBrowserController:(id)a3 chapterIndex:(unint64_t)a4
{
  return -[THDocumentViewController isSinglePageChapterForChapterIndex:](-[THBookViewController documentViewController](self, "documentViewController", a3), "isSinglePageChapterForChapterIndex:", a4);
}

- (void)TOCShowToolbarAnimated:(BOOL)a3
{
  _BOOL8 v3;
  UIViewController *v5;

  v3 = a3;
  v5 = -[THBookViewController visibleViewController](self, "visibleViewController");
  if (v5 == (UIViewController *)-[THBookViewController chapterBrowserController](self, "chapterBrowserController"))
    -[THBookViewController showToolbarAnimated:](self, "showToolbarAnimated:", v3);
}

- (void)TOCHideToolbarAnimated:(BOOL)a3
{
  _BOOL8 v3;
  UIViewController *v5;

  v3 = a3;
  v5 = -[THBookViewController visibleViewController](self, "visibleViewController");
  if (v5 == (UIViewController *)-[THBookViewController chapterBrowserController](self, "chapterBrowserController"))
    -[THBookViewController hideToolbarAnimated:](self, "hideToolbarAnimated:", v3);
}

- (BOOL)isPageBookmarkedForDocumentViewController:(id)a3
{
  if (-[THBookViewController documentViewController](self, "documentViewController") == a3)
    return -[THBookViewController isPageBookmarked](self, "isPageBookmarked");
  else
    return 0;
}

- (void)setPageBookmarked:(BOOL)a3 forDocumentViewController:(id)a4
{
  _BOOL8 v4;

  v4 = a3;
  if (-[THBookViewController documentViewController](self, "documentViewController") == a4)
    -[THBookViewController setPageBookmarked:](self, "setPageBookmarked:", v4);
}

- (BOOL)setupLoadSpinner
{
  UIView *mSpinnerView;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unsigned int v13;
  double v14;
  _QWORD v16[5];
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  mSpinnerView = self->mSpinnerView;
  if (!mSpinnerView)
  {
    +[CATransaction begin](CATransaction, "begin");
    self->mSpinnerView = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 112.0, 112.0);
    objc_msgSend(-[THBookViewController view](self, "view"), "bounds");
    -[UIView setCenter:](self->mSpinnerView, "setCenter:", TSDCenterOfRect(v4, v5, v6, v7));
    -[UIView frame](self->mSpinnerView, "frame");
    v18 = CGRectIntegral(v17);
    -[UIView setFrame:](self->mSpinnerView, "setFrame:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
    -[CALayer setCornerRadius:](-[UIView layer](self->mSpinnerView, "layer"), "setCornerRadius:", 8.0);
    -[UIView setBackgroundColor:](self->mSpinnerView, "setBackgroundColor:", +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.800000012));
    v8 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 101);
    -[UIView bounds](self->mSpinnerView, "bounds");
    objc_msgSend(v8, "setCenter:", TSDCenterOfRect(v9, v10, v11, v12));
    objc_msgSend(v8, "frame");
    v20 = CGRectIntegral(v19);
    objc_msgSend(v8, "setFrame:", v20.origin.x, v20.origin.y, v20.size.width, v20.size.height);
    objc_msgSend(v8, "setColor:", +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.899999976));
    objc_msgSend(v8, "startAnimating");
    -[UIView addSubview:](self->mSpinnerView, "addSubview:", v8);

    -[CALayer setZPosition:](-[UIView layer](self->mSpinnerView, "layer"), "setZPosition:", 10.0);
    objc_msgSend(-[THBookViewController view](self, "view"), "addSubview:", self->mSpinnerView);
    -[UIView setAlpha:](self->mSpinnerView, "setAlpha:", 0.0);
    v13 = -[THBookViewController isBookEpub](self, "isBookEpub");
    v14 = 3.0;
    if (!v13)
      v14 = 2.0;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_7E6DC;
    v16[3] = &unk_426DD0;
    v16[4] = self;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v16, 0, 0.15, v14);
    +[CATransaction commit](CATransaction, "commit");
  }
  return mSpinnerView == 0;
}

- (void)hideLoadSpinner
{
  UIView *mSpinnerView;

  mSpinnerView = self->mSpinnerView;
  if (!mSpinnerView)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookViewController hideLoadSpinner]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm"), 4741, CFSTR("invalid nil value for '%s'"), "mSpinnerView");
    mSpinnerView = self->mSpinnerView;
  }
  -[UIView removeFromSuperview](mSpinnerView, "removeFromSuperview");

  self->mSpinnerView = 0;
}

- (void)p_loadToolbar
{
  id v3;

  v3 = objc_msgSend(objc_alloc((Class)BCNavigationBar), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v3, "setSeparatorsVisible:", 0);
  objc_msgSend(v3, "setTranslucent:", 0);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(-[THBookViewController view](self, "view"), "addSubview:", v3);
  -[THBookViewController setNavigationBarController:](self, "setNavigationBarController:", objc_alloc_init(THNavigationBarController));
  objc_msgSend(v3, "setDelegate:", -[THBookViewController navigationBarController](self, "navigationBarController"));
  -[THNavigationBarController setNavigationBar:](-[THBookViewController navigationBarController](self, "navigationBarController"), "setNavigationBar:", v3);
  -[THNavigationBarController setDelegate:](-[THBookViewController navigationBarController](self, "navigationBarController"), "setDelegate:", self);
  -[THNavigationBarController setAutohideTimeout:](-[THBookViewController navigationBarController](self, "navigationBarController"), "setAutohideTimeout:", 6.0);
  -[THNavigationBarController buildConstraintsFromParent:layoutGuide:](-[THBookViewController navigationBarController](self, "navigationBarController"), "buildConstraintsFromParent:layoutGuide:", -[THBookViewController view](self, "view"), objc_msgSend(-[THBookViewController view](self, "view"), "safeAreaLayoutGuide"));

}

- (void)closeDocument
{
  id v3;
  id v4;

  v3 = +[AETestDriver shared](AETestDriver, "shared");
  objc_msgSend(v3, "postEvent:sender:", kBETestDriverOpenAnimationStart, self);
  v4 = +[AETestDriver shared](AETestDriver, "shared");
  objc_msgSend(v4, "postEvent:sender:", kBETestDriverOpenAnimationSetupStart, self);
  -[THBookViewController closeDocumentWithErrorBlock:](self, "closeDocumentWithErrorBlock:", 0);
}

- (void)closeDocumentWithErrorBlock:(id)a3
{
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_7EA90;
  v8[3] = &unk_427790;
  v8[4] = self;
  +[THPerformanceRegressionLogger logEventWithBlock:](THPerformanceRegressionLogger, "logEventWithBlock:", v8);
  -[THBookViewController p_bookContentDidLoad](self, "p_bookContentDidLoad");
  -[THBookViewController dismissActivePopover](self, "dismissActivePopover");
  -[THBookViewController p_savePlaceholder](self, "p_savePlaceholder");
  v6[4] = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_7EAC4;
  v7[3] = &unk_426DD0;
  v7[4] = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_7EADC;
  v6[3] = &unk_427130;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v7, v6, 0.15);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_7EAF4;
  v5[3] = &unk_427790;
  v5[4] = self;
  +[THPerformanceRegressionLogger logEventWithBlock:](THPerformanceRegressionLogger, "logEventWithBlock:", v5);
  -[THBookViewController vantageWillChangeBy:reason:](self, "vantageWillChangeBy:reason:", self, CFSTR("THVantageChangeReasonBookClose"));
  -[AEAssetViewControllerDelegate assetViewController:requestClose:finishedConsuming:error:withErrorBlock:](-[THBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"), "assetViewController:requestClose:finishedConsuming:error:withErrorBlock:", self, 1, 0, 0, a3);
  -[THBookViewController vantageDidChangeBy:reason:](self, "vantageDidChangeBy:reason:", self, CFSTR("THVantageChangeReasonBookClose"));
}

- (void)closeTOC
{
  -[THBookViewController p_showDVCAnimated:withLink:](self, "p_showDVCAnimated:withLink:", 1, 0);
}

- (void)runPreloadOptimizations
{
  -[TSWPLoadableFonts pauseBackgroundLoading](+[TSWPLoadableFonts sharedInstance](TSWPLoadableFonts, "sharedInstance"), "pauseBackgroundLoading");
}

- (BOOL)p_showBuyButton
{
  _BOOL4 v3;

  v3 = -[THBookViewController p_isSampleBook](self, "p_isSampleBook");
  if (v3)
    LOBYTE(v3) = !-[THBookViewController p_isPreorderBook](self, "p_isPreorderBook");
  return v3;
}

- (id)rightToolbarItems:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  UIBarButtonItem *v6;
  UIBarButtonItem *v7;
  THiOSFlowToCTableViewController *v8;

  v3 = a3;
  v5 = +[NSMutableArray array](NSMutableArray, "array");
  if (-[THBookViewController documentViewController](self, "documentViewController"))
  {
    if (-[THBookViewController p_shouldShowAppearanceImage](self, "p_shouldShowAppearanceImage"))
      v6 = -[THBookViewController appearanceButtonItem](self, "appearanceButtonItem");
    else
      v6 = -[THBookViewController brightnessButtonItem](self, "brightnessButtonItem");
    v7 = v6;
    v8 = -[THBookViewController visibleViewController](self, "visibleViewController");
    if (v8 == (THiOSFlowToCTableViewController *)self->mFlowTocViewController
      || v8 == self->mFlowToCTableViewController)
    {
      objc_msgSend(v5, "tsu_addObjects:", -[THBookViewController closeTOCButtonItem](self, "closeTOCButtonItem"), -[THBookViewController searchButtonItem](self, "searchButtonItem"), 0);
    }
    else
    {
      if (!v3 || !-[THBookViewController p_showBuyButton](self, "p_showBuyButton"))
        objc_msgSend(v5, "addObject:", -[THBookViewController bookmarkButtonItem](self, "bookmarkButtonItem"));
      objc_msgSend(v5, "addObject:", -[THBookViewController searchButtonItem](self, "searchButtonItem"));
      if (v7)
        objc_msgSend(v5, "addObject:", v7);
    }
  }
  return v5;
}

- (UIButton)bookmarkButton
{
  UIButton *result;
  THTintableButton *v4;

  result = self->_bookmarkButton;
  if (!result)
  {
    v4 = +[THTintableButton buttonWithType:](THTintableButton, "buttonWithType:", 0);
    self->_bookmarkButton = &v4->super;
    -[THTintableButton setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton addTarget:action:forControlEvents:](self->_bookmarkButton, "addTarget:action:forControlEvents:", self, "p_showBookmarkMenu", 64);
    -[UIButton setImage:forState:](self->_bookmarkButton, "setImage:forState:", -[UIImage imageWithConfiguration:](+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("bookmark")), "imageWithConfiguration:", +[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 5, 3, 17.0)), 0);
    -[UIButton sizeToFit](self->_bookmarkButton, "sizeToFit");
    return self->_bookmarkButton;
  }
  return result;
}

- (UIBarButtonItem)bookmarkButtonItem
{
  UIBarButtonItem *result;
  id v4;
  UIBarButtonItem *v5;
  double Width;
  double v7;
  CGRect v8;
  CGRect v9;

  result = self->_bookmarkButtonItem;
  if (!result)
  {
    v4 = objc_msgSend(objc_alloc((Class)BCUIFullHeightNavWrapper), "initWithView:", -[THBookViewController bookmarkButton](self, "bookmarkButton"));
    objc_msgSend(v4, "setCursorInsets:", 2.0, 0.0, 2.0, 0.0);
    v5 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithCustomView:", v4);
    self->_bookmarkButtonItem = v5;
    -[THBookViewController p_applyAccessibilityLabelForButton:withImageNamed:](self, "p_applyAccessibilityLabelForButton:withImageNamed:", v5, CFSTR("bookmark"));
    -[UIButton frame](-[THBookViewController bookmarkButton](self, "bookmarkButton"), "frame");
    Width = CGRectGetWidth(v8);
    v7 = 47.0;
    if (Width >= 47.0)
    {
      -[UIButton frame](-[THBookViewController bookmarkButton](self, "bookmarkButton"), "frame");
      v7 = CGRectGetWidth(v9);
    }
    -[UIBarButtonItem setWidth:](self->_bookmarkButtonItem, "setWidth:", v7);

    return self->_bookmarkButtonItem;
  }
  return result;
}

- (UIBarButtonItem)appearanceButtonItem
{
  UIBarButtonItem *appearanceButtonItem;
  double Width;
  double v5;
  CGRect v7;
  CGRect v8;

  appearanceButtonItem = self->_appearanceButtonItem;
  if (!appearanceButtonItem)
  {
    self->_appearanceButtonItem = (UIBarButtonItem *)-[THBookViewController createButtonItemConfigurationWithImageName:forSelector:](self, "createButtonItemConfigurationWithImageName:forSelector:", CFSTR("textformat.size"), "showDisplaySettingsPopover:");
    -[UIButton frame](-[THBookViewController bookmarkButton](self, "bookmarkButton"), "frame");
    Width = CGRectGetWidth(v7);
    v5 = 47.0;
    if (Width >= 47.0)
    {
      -[UIButton frame](-[THBookViewController bookmarkButton](self, "bookmarkButton"), "frame");
      v5 = CGRectGetWidth(v8);
    }
    -[UIBarButtonItem setWidth:](self->_appearanceButtonItem, "setWidth:", v5);
    appearanceButtonItem = self->_appearanceButtonItem;
  }
  -[THBookViewController p_applyAccessibilityLabelForButton:withImageNamed:](self, "p_applyAccessibilityLabelForButton:withImageNamed:", appearanceButtonItem, CFSTR("textformat.size"));
  return self->_appearanceButtonItem;
}

- (UIBarButtonItem)brightnessButtonItem
{
  double Width;
  double v4;
  CGRect v6;
  CGRect v7;

  if (!self->_brightnessButtonItem
    && +[BEAppearanceViewController canChangeBrightness](BEAppearanceViewController, "canChangeBrightness"))
  {
    self->_brightnessButtonItem = (UIBarButtonItem *)-[THBookViewController createButtonItemConfigurationWithImageName:forSelector:](self, "createButtonItemConfigurationWithImageName:forSelector:", CFSTR("sun.max"), "showDisplaySettingsPopover:");
    -[UIButton frame](-[THBookViewController bookmarkButton](self, "bookmarkButton"), "frame");
    Width = CGRectGetWidth(v6);
    v4 = 47.0;
    if (Width >= 47.0)
    {
      -[UIButton frame](-[THBookViewController bookmarkButton](self, "bookmarkButton"), "frame");
      v4 = CGRectGetWidth(v7);
    }
    -[UIBarButtonItem setWidth:](self->_brightnessButtonItem, "setWidth:", v4);
    -[THBookViewController p_applyAccessibilityLabelForButton:withImageNamed:](self, "p_applyAccessibilityLabelForButton:withImageNamed:", self->_brightnessButtonItem, CFSTR("sun.max"));
  }
  return self->_brightnessButtonItem;
}

- (UIBarButtonItem)searchButtonItem
{
  UIBarButtonItem *searchButtonItem;
  double Width;
  double v5;
  CGRect v7;
  CGRect v8;

  searchButtonItem = self->_searchButtonItem;
  if (!searchButtonItem)
  {
    self->_searchButtonItem = (UIBarButtonItem *)-[THBookViewController createButtonItemConfigurationWithImageName:forSelector:](self, "createButtonItemConfigurationWithImageName:forSelector:", CFSTR("magnifyingglass"), "showSearchPopover");
    -[UIBarButtonItem setEnabled:](self->_searchButtonItem, "setEnabled:", -[THBookViewController isCompleteBook](self, "isCompleteBook"));
    -[UIButton frame](-[THBookViewController bookmarkButton](self, "bookmarkButton"), "frame");
    Width = CGRectGetWidth(v7);
    v5 = 47.0;
    if (Width >= 47.0)
    {
      -[UIButton frame](-[THBookViewController bookmarkButton](self, "bookmarkButton"), "frame");
      v5 = CGRectGetWidth(v8);
    }
    -[UIBarButtonItem setWidth:](self->_searchButtonItem, "setWidth:", v5);
    searchButtonItem = self->_searchButtonItem;
  }
  -[THBookViewController p_applyAccessibilityLabelForButton:withImageNamed:](self, "p_applyAccessibilityLabelForButton:withImageNamed:", searchButtonItem, CFSTR("magnifyingglass"));
  return self->_searchButtonItem;
}

- (UIBarButtonItem)closeTOCButtonItem
{
  UIBarButtonItem *result;

  result = self->_closeTOCButtonItem;
  if (!result)
  {
    result = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Resume"), &stru_43D7D8, 0), 2, self, "closeTOC");
    self->_closeTOCButtonItem = result;
  }
  return result;
}

- (void)_updateCloseButtonItem
{
  UIBarButtonItem *closeButtonItem;
  uint64_t v4;
  char isKindOfClass;
  UIBarButtonItem *v6;
  id v7;
  __CFString *v8;

  closeButtonItem = self->_closeButtonItem;
  if (!closeButtonItem)
  {
    v6 = 0;
    goto LABEL_6;
  }
  v4 = objc_opt_class(UIBarButtonItem, a2);
  isKindOfClass = objc_opt_isKindOfClass(closeButtonItem, v4);
  v6 = self->_closeButtonItem;
  if ((isKindOfClass & 1) == 0)
  {
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v7 = -[UIBarButtonItem image](v6, "image");
  v6 = self->_closeButtonItem;
  if (v7)
  {
    v8 = &stru_43D7D8;
  }
  else
  {
    v8 = (__CFString *)-[UIBarButtonItem title](v6, "title");
    v6 = self->_closeButtonItem;
  }
LABEL_7:

  self->_closeButtonItem = (UIBarButtonItem *)-[AEAssetViewControllerDelegate libraryButtonItemForViewController:selector:](-[THBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"), "libraryButtonItemForViewController:selector:", self, "closeDocument");
  if (-[AEAssetViewControllerDelegate canUpdateLibraryBarButtonItem:withOldString:](-[THBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"), "canUpdateLibraryBarButtonItem:withOldString:", self->_closeButtonItem, v8))-[THBookViewController assetViewControllerUpdateToolbars](self, "assetViewControllerUpdateToolbars");
  -[THBookViewController p_applyAccessibilityLabelForButton:withImageNamed:](self, "p_applyAccessibilityLabelForButton:withImageNamed:", self->_closeButtonItem, CFSTR("chevron.backward"));

}

- (UIBarButtonItem)closeButtonItem
{
  UIBarButtonItem *result;

  result = self->_closeButtonItem;
  if (!result)
  {
    -[THBookViewController _updateCloseButtonItem](self, "_updateCloseButtonItem");
    return self->_closeButtonItem;
  }
  return result;
}

- (UIBarButtonItem)tocGlossaryButtonItem
{
  UIBarButtonItem *tocGlossaryButtonItem;

  tocGlossaryButtonItem = self->_tocGlossaryButtonItem;
  if (!tocGlossaryButtonItem)
  {
    self->_tocGlossaryButtonItem = (UIBarButtonItem *)-[THBookViewController createButtonItemConfigurationWithImageName:forSelector:](self, "createButtonItemConfigurationWithImageName:forSelector:", CFSTR("list.bullet"), "showTOCGlossaryPopover:");
    -[UIBarButtonItem setEnabled:](self->_tocGlossaryButtonItem, "setEnabled:", -[THBookViewController isCompleteBook](self, "isCompleteBook"));
    tocGlossaryButtonItem = self->_tocGlossaryButtonItem;
  }
  -[THBookViewController p_applyAccessibilityLabelForButton:withImageNamed:](self, "p_applyAccessibilityLabelForButton:withImageNamed:", tocGlossaryButtonItem, CFSTR("list.bullet"));
  return self->_tocGlossaryButtonItem;
}

- (UIBarButtonItem)notesButtonItem
{
  UIBarButtonItem *notesButtonItem;

  notesButtonItem = self->_notesButtonItem;
  if (!notesButtonItem)
  {
    notesButtonItem = -[THBookViewController createButtonItemConfigurationWithImageName:forSelector:](self, "createButtonItemConfigurationWithImageName:forSelector:", CFSTR("rectangle.on.rectangle.angled"), "showFullscreenNotesView:");
    self->_notesButtonItem = notesButtonItem;
  }
  -[THBookViewController p_applyAccessibilityLabelForButton:withImageNamed:](self, "p_applyAccessibilityLabelForButton:withImageNamed:", notesButtonItem, CFSTR("rectangle.on.rectangle.angled"));
  return self->_notesButtonItem;
}

- (UIBarButtonItem)shareButtonItem
{
  UIBarButtonItem *result;

  result = self->_shareButtonItem;
  if (!result)
  {
    self->_shareButtonItem = (UIBarButtonItem *)-[THBookViewController createButtonItemConfigurationWithImageName:forSelector:](self, "createButtonItemConfigurationWithImageName:forSelector:", CFSTR("square.and.arrow.up"), "showSharePopover:");
    -[UIBarButtonItem setAccessibilityLabel:](self->_shareButtonItem, "setAccessibilityLabel:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Share"), &stru_43D7D8, 0));
    return self->_shareButtonItem;
  }
  return result;
}

- (id)createButtonItemConfigurationWithImageName:(id)a3 forSelector:(SEL)a4
{
  id v7;

  v7 = +[UIBarButtonItem bc_readingExperienceBarItem:target:action:](UIBarButtonItem, "bc_readingExperienceBarItem:target:action:", a3, self, a4);
  -[THBookViewController p_applyAccessibilityLabelForButton:withImageNamed:](self, "p_applyAccessibilityLabelForButton:withImageNamed:", v7, a3);
  return v7;
}

- (id)leftToolbarItems:(BOOL)a3
{
  id v4;
  THiOSFlowToCTableViewController *v5;
  UIBarButtonItem *v6;
  id v7;
  uint64_t v9;

  v4 = +[NSMutableArray array](NSMutableArray, "array", a3);
  if (!-[THBookViewController documentViewController](self, "documentViewController"))
  {
    v6 = -[THBookViewController closeTOCButtonItem](self, "closeTOCButtonItem");
LABEL_14:
    objc_msgSend(v4, "addObject:", v6);
    return v4;
  }
  v5 = -[THBookViewController visibleViewController](self, "visibleViewController");
  if (v5 == (THiOSFlowToCTableViewController *)self->mFlowTocViewController || v5 == self->mFlowToCTableViewController)
  {
    objc_msgSend(v4, "tsu_addObjects:", -[THBookViewController closeButtonItem](self, "closeButtonItem"), -[THBookViewController shareButtonItem](self, "shareButtonItem"), 0);
  }
  else
  {
    objc_msgSend(v4, "tsu_addObjects:", -[THBookViewController closeButtonItem](self, "closeButtonItem"), 0);
    if (-[THBookViewController isTOCVisible](self, "isTOCVisible"))
      objc_msgSend(v4, "tsu_addObjects:", -[THBookViewController shareButtonItem](self, "shareButtonItem"), 0, v9);
    else
      objc_msgSend(v4, "tsu_addObjects:", -[THBookViewController tocGlossaryButtonItem](self, "tocGlossaryButtonItem"), -[THBookViewController notesButtonItem](self, "notesButtonItem"), 0);
    v7 = -[AEAssetViewControllerDelegate assetViewControllerMinifiedBarButtonItem:](-[THBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"), "assetViewControllerMinifiedBarButtonItem:", self);
    if (v7)
      objc_msgSend(v4, "insertObject:atIndex:", v7, 1);
  }
  if (-[THBookViewController p_showBuyButton](self, "p_showBuyButton")
    && -[THBookViewController buyButtonItem](self, "buyButtonItem"))
  {
    v6 = -[THBookViewController buyButtonItem](self, "buyButtonItem");
    goto LABEL_14;
  }
  return v4;
}

- (void)setApplicationToolbarHiddenFromMode:(int64_t)a3 toMode:(int64_t)a4 animated:(BOOL)a5
{
  -[THBookViewController hideToolbarAnimated:](self, "hideToolbarAnimated:", 1, a4, a5);
}

- (UIBarButtonItem)buyButtonItem
{
  return (UIBarButtonItem *)-[AEAssetViewControllerDelegate assetViewControllerBuyButtonItem:isSample:isPreorder:storeID:](-[THBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"), "assetViewControllerBuyButtonItem:isSample:isPreorder:storeID:", self, -[THBookDescription isSample](-[THBookViewController bookDescription](self, "bookDescription"), "isSample"), -[THBookDescription isPreorderBook](-[THBookViewController bookDescription](self, "bookDescription"), "isPreorderBook"), -[THBookDescription storeID](-[THBookViewController bookDescription](self, "bookDescription"), "storeID"));
}

- (BOOL)p_isSampleBook
{
  return -[THBookDescription isSample](-[THBookViewController bookDescription](self, "bookDescription"), "isSample");
}

- (BOOL)p_isPreorderBook
{
  return -[THBookDescription isPreorderBook](-[THBookViewController bookDescription](self, "bookDescription"), "isPreorderBook");
}

- (BOOL)p_shouldShowAppearanceImage
{
  return -[THBookViewController shouldShowFlowModeSwitch:](self, "shouldShowFlowModeSwitch:", 0);
}

- (id)p_popoverPassthroughViews
{
  return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", -[THNavigationBarController navigationBar](-[THBookViewController navigationBarController](self, "navigationBarController"), "navigationBar"), 0);
}

- (void)p_setupDisplaySettingsIfNeeded
{
  THDisplaySettingsViewController *v3;

  if (!-[THBookViewController displaySettingsViewController](self, "displaySettingsViewController"))
  {
    v3 = -[THDisplaySettingsViewController initWithDelegate:]([THDisplaySettingsViewController alloc], "initWithDelegate:", self);
    -[THDisplaySettingsViewController setOverrideUserInterfaceStyle:](v3, "setOverrideUserInterfaceStyle:", -[THBookViewController overrideUserInterfaceStyle](self, "overrideUserInterfaceStyle"));
    if (-[THBookViewController isBookEpub](self, "isBookEpub"))
    {
      -[THDisplaySettingsViewController setAppearanceStyle:](v3, "setAppearanceStyle:", -[THBookViewController appearanceStyle](self, "appearanceStyle"));
      -[THDisplaySettingsViewController setTheme:](v3, "setTheme:", -[THBookViewController theme](self, "theme"));
    }
    -[THDisplaySettingsViewController setTheme:](v3, "setTheme:", -[THBookViewController theme](self, "theme"));
    -[THBookViewController setDisplaySettingsViewController:](self, "setDisplaySettingsViewController:", v3);

  }
}

- (void)showDisplaySettingsPopover:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  THDisplaySettingsViewController *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];

  if (objc_msgSend(-[THDisplaySettingsViewController view](-[THBookViewController displaySettingsViewController](self, "displaySettingsViewController"), "view"), "window"))
  {
    -[THBookViewController dismissDisplaySettings:](self, "dismissDisplaySettings:", 1);
  }
  else
  {
    v6 = objc_opt_class(UIControl, v5);
    objc_msgSend((id)BUDynamicCast(v6, a3), "setEnabled:", 0);
    -[THBookViewController dismissActivePopover](self, "dismissActivePopover");
    -[THToolbarDelegate userWillInteractInToolbar](-[THDocumentViewController toolbarDelegate](-[THBookViewController documentViewController](self, "documentViewController"), "toolbarDelegate"), "userWillInteractInToolbar");
    -[THBookViewController p_setupDisplaySettingsIfNeeded](self, "p_setupDisplaySettingsIfNeeded");
    v7 = -[THBookViewController displaySettingsViewController](self, "displaySettingsViewController");
    -[THDisplaySettingsViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 7);
    v9 = objc_opt_class(UIBarButtonItem, v8);
    if (BUDynamicCast(v9, a3))
    {
      v10 = -[THDisplaySettingsViewController popoverPresentationController](v7, "popoverPresentationController");
      objc_msgSend(v10, "setBarButtonItem:", a3);
      objc_msgSend(v10, "setPermittedArrowDirections:", 1);
      objc_msgSend(v10, "setDelegate:", self);
      objc_msgSend(v10, "setPassthroughViews:", -[THBookViewController p_popoverPassthroughViews](self, "p_popoverPassthroughViews"));
      objc_msgSend(v10, "bc_applyTraitOverridesWithOverrideUserInterfaceStyleFromViewController:", v7);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_7F7D0;
      v11[3] = &unk_426DD0;
      v11[4] = a3;
      -[THBookViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, v11);
    }
  }
}

- (void)dismissDisplaySettings:(BOOL)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_7F86C;
  v3[3] = &unk_426DD0;
  v3[4] = self;
  -[THDisplaySettingsViewController dismissViewControllerAnimated:completion:](-[THBookViewController displaySettingsViewController](self, "displaySettingsViewController"), "dismissViewControllerAnimated:completion:", a3, v3);
}

- (void)p_displaySettingsDidHide
{
  -[THToolbarDelegate userDidInteractInToolbar](-[THDocumentViewController toolbarDelegate](-[THBookViewController documentViewController](self, "documentViewController"), "toolbarDelegate"), "userDidInteractInToolbar");
  -[THBookViewController setDisplaySettingsViewController:](self, "setDisplaySettingsViewController:", 0);
}

- (BOOL)p_isSearchVisible
{
  return objc_msgSend(-[THSearchViewController view](-[THBookViewController searchViewController](self, "searchViewController"), "view"), "window") != 0;
}

- (void)showSearchPopoverFromBarButtonItem:(id)a3
{
  -[THBookViewController showSearchPopoverFromBarButtonItem:withText:](self, "showSearchPopoverFromBarButtonItem:withText:", a3, 0);
}

- (void)showSearchPopoverFromBarButtonItem:(id)a3 withText:(id)a4
{
  THSearchViewController *v7;
  THSearchViewController *v8;
  double v9;
  double v10;
  THSearchViewController *v11;
  id v12;

  v7 = -[THBookViewController searchViewController](self, "searchViewController");
  v8 = v7;
  if (a4 || !v7)
  {
    -[THBookViewController dismissActivePopover](self, "dismissActivePopover");
    if (!v8)
    {
      v8 = -[THSearchViewController initWithSearchController:]([THSearchViewController alloc], "initWithSearchController:", objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "searchController"));
      -[THSearchViewController setTheme:](v8, "setTheme:", -[THBookViewController theme](self, "theme"));
      -[THSearchViewController setDelegate:](v8, "setDelegate:", self);
      objc_msgSend(-[THSearchViewController view](v8, "view"), "frame");
      -[THSearchViewController setPreferredContentSize:](v8, "setPreferredContentSize:", v9, v10);
      -[THBookViewController setSearchViewController:](self, "setSearchViewController:", v8);
      v11 = v8;
    }
  }
  else
  {
    if (-[THBookViewController p_isSearchVisible](self, "p_isSearchVisible"))
    {
      -[THBookViewController dismissSearchPopover:completion:](self, "dismissSearchPopover:completion:", 1, 0);
      return;
    }
    -[THBookViewController dismissActivePopover](self, "dismissActivePopover");
  }
  -[THSearchViewController setSearchingForPredeterminedString:](v8, "setSearchingForPredeterminedString:", objc_msgSend(a4, "length") != 0);
  -[THSearchViewController setModalPresentationStyle:](v8, "setModalPresentationStyle:", 7);
  -[THSearchViewController setOverrideUserInterfaceStyle:](v8, "setOverrideUserInterfaceStyle:", -[THBookViewController overrideUserInterfaceStyle](self, "overrideUserInterfaceStyle"));
  if ((-[THBookViewController im_isCompactWidth](self, "im_isCompactWidth") & 1) == 0
    && (-[THBookViewController im_isCompactHeight](self, "im_isCompactHeight") & 1) == 0)
  {
    -[THToolbarDelegate userWillInteractInToolbar](-[THDocumentViewController toolbarDelegate](-[THBookViewController documentViewController](self, "documentViewController"), "toolbarDelegate"), "userWillInteractInToolbar");
  }
  v12 = -[THSearchViewController popoverPresentationController](v8, "popoverPresentationController");
  objc_msgSend(v12, "setBackgroundColor:", -[THTheme popoverBackgroundColor](-[THBookViewController theme](self, "theme"), "popoverBackgroundColor"));
  objc_msgSend(v12, "setBarButtonItem:", a3);
  objc_msgSend(v12, "setPermittedArrowDirections:", 1);
  objc_msgSend(v12, "setDelegate:", self);
  objc_msgSend(v12, "setPassthroughViews:", -[THBookViewController p_popoverPassthroughViews](self, "p_popoverPassthroughViews"));
  objc_msgSend(v12, "bc_applyTraitOverridesWithOverrideUserInterfaceStyleFromViewController:", v8);
  -[THBookViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, &stru_4284C8);
  if (a4)
  {
    if (objc_msgSend(a4, "length"))
      -[THSearchViewController searchForString:](v8, "searchForString:", a4);
  }
}

- (void)p_searchDidHide
{
  id v3;

  -[THToolbarDelegate userDidInteractInToolbar](-[THDocumentViewController toolbarDelegate](-[THBookViewController documentViewController](self, "documentViewController"), "toolbarDelegate"), "userDidInteractInToolbar");
  v3 = objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "searchController");
  if (objc_msgSend(v3, "unloadRequested"))
  {
    objc_msgSend(v3, "unloadIndex");
    -[THBookViewController setSearchViewController:](self, "setSearchViewController:", 0);
  }
}

- (void)dismissSearchPopover:(BOOL)a3 completion:(id)a4
{
  _QWORD v4[6];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_7FBBC;
  v4[3] = &unk_427290;
  v4[4] = self;
  v4[5] = a4;
  -[THSearchViewController dismissViewControllerAnimated:completion:](-[THBookViewController searchViewController](self, "searchViewController"), "dismissViewControllerAnimated:completion:", a3, v4);
}

- (CGRect)p_navigationOverlayFrame
{
  CGFloat x;
  double y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect result;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  if (-[THBookViewController isBookEpub](self, "isBookEpub"))
  {
    if (-[THDocumentViewController configuration](-[THBookViewController documentViewController](self, "documentViewController"), "configuration"))
    {
      -[THDocumentReflowableLayoutConfiguration bottomFullWidthToolbarFrame](-[THDocumentViewController configuration](-[THBookViewController documentViewController](self, "documentViewController"), "configuration"), "bottomFullWidthToolbarFrame");
      width = v7;
      height = v8;
      x = CGPointZero.x;
      y = CGPointZero.y;
    }
  }
  else
  {
    objc_msgSend(-[THBookViewController viewIfLoaded](self, "viewIfLoaded"), "bounds");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    objc_msgSend(-[THBookViewController viewIfLoaded](self, "viewIfLoaded"), "safeAreaInsets");
    v18 = v10 + v17;
    v20 = v12 + v19;
    v22 = v14 - (v17 + v21);
    v24 = v16 - (v19 + v23);
    v29.origin.x = v10 + v17;
    v29.origin.y = v20;
    v29.size.width = v22;
    v29.size.height = v24;
    x = CGRectGetMinX(v29);
    v30.origin.x = v18;
    v30.origin.y = v20;
    v30.size.width = v22;
    v30.size.height = v24;
    y = CGRectGetMaxY(v30) + -64.0;
    v31.origin.x = v18;
    v31.origin.y = v20;
    v31.size.width = v22;
    v31.size.height = v24;
    width = CGRectGetWidth(v31);
    height = 64.0;
  }
  if (-[THBookViewController HUDOverlayView](self, "HUDOverlayView"))
    v25 = y + -50.0;
  else
    v25 = y;
  v26 = x;
  v27 = width;
  v28 = height;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v25;
  result.origin.x = v26;
  return result;
}

- (void)p_loadNavigationOverlay
{
  unsigned int v3;
  THNavigationOverlayView *v4;
  THNavigationOverlayView *v5;
  uint64_t v6;
  THNavigationHistoryStepperController *v7;
  UIView *v8;

  v3 = -[THBookViewController isBookEpub](self, "isBookEpub");
  v4 = -[THNavigationOverlayView initWithFrame:blissClassicStyle:]([THNavigationOverlayView alloc], "initWithFrame:blissClassicStyle:", v3 ^ 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = v4;
  if (v3)
    v6 = 0;
  else
    v6 = 10;
  -[THNavigationOverlayView setAutoresizingMask:](v4, "setAutoresizingMask:", v6);
  -[THNavigationOverlayView setTransparentMode:](v5, "setTransparentMode:", -[THBookViewController isBookEpub](self, "isBookEpub") ^ 1);
  v7 = objc_alloc_init(THNavigationHistoryStepperController);
  -[THNavigationHistoryStepperController setChrome:](v7, "setChrome:", v5);
  -[UIButton addTarget:action:forControlEvents:](-[THNavigationOverlayView prevButton](v5, "prevButton"), "addTarget:action:forControlEvents:", v7, "jumpToPrev:", 64);
  -[UIButton addTarget:action:forControlEvents:](-[THNavigationOverlayView nextButton](v5, "nextButton"), "addTarget:action:forControlEvents:", v7, "jumpToNext:", 64);
  -[UIButton addTarget:action:forControlEvents:](-[THNavigationOverlayView prevButton](v5, "prevButton"), "addTarget:action:forControlEvents:", self, "userWillInteractInToolbar", 4095);
  -[UIButton addTarget:action:forControlEvents:](-[THNavigationOverlayView nextButton](v5, "nextButton"), "addTarget:action:forControlEvents:", self, "userWillInteractInToolbar", 4095);
  -[THNavigationOverlayView setOverlayHidden:animated:](v5, "setOverlayHidden:animated:", 1, 0);
  -[THBookViewController setNavigationOverlayView:](self, "setNavigationOverlayView:", v5);
  -[THBookViewController setNavigationHistoryStepperController:](self, "setNavigationHistoryStepperController:", v7);
  if ((v3 & 1) != 0)
    v8 = -[THDocumentViewController navigationOverlayContainer](-[THBookViewController documentViewController](self, "documentViewController"), "navigationOverlayContainer");
  else
    v8 = (UIView *)-[THBookViewController view](self, "view");
  -[UIView addSubview:](v8, "addSubview:", v5);
}

- (void)p_loadTitleLabel
{
  BCDisplayOnlyNavigationBar *v3;
  UIImage *v4;
  UIButton *v5;

  if (!self->mTitleLabel)
  {
    if (-[THBookViewController isBookEpub](self, "isBookEpub"))
    {
      v3 = (BCDisplayOnlyNavigationBar *)objc_msgSend(objc_alloc((Class)BCDisplayOnlyNavigationBar), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      self->mTitleLabelNavigationBar = v3;
      -[BCDisplayOnlyNavigationBar setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[BCDisplayOnlyNavigationBar setTranslucent:](self->mTitleLabelNavigationBar, "setTranslucent:", 0);
      -[BCDisplayOnlyNavigationBar setDelegate:](self->mTitleLabelNavigationBar, "setDelegate:", self);
      objc_msgSend(-[THBookViewController view](self, "view"), "insertSubview:belowSubview:", self->mTitleLabelNavigationBar, -[THNavigationBarController navigationBar](-[THBookViewController navigationBarController](self, "navigationBarController"), "navigationBar"));
      objc_msgSend(objc_msgSend(-[BCDisplayOnlyNavigationBar leftAnchor](self->mTitleLabelNavigationBar, "leftAnchor"), "constraintEqualToAnchor:", objc_msgSend(-[THBookViewController view](self, "view"), "leftAnchor")), "setActive:", 1);
      objc_msgSend(objc_msgSend(-[BCDisplayOnlyNavigationBar rightAnchor](self->mTitleLabelNavigationBar, "rightAnchor"), "constraintEqualToAnchor:", objc_msgSend(-[THBookViewController view](self, "view"), "rightAnchor")), "setActive:", 1);
      objc_msgSend(objc_msgSend(-[BCDisplayOnlyNavigationBar topAnchor](self->mTitleLabelNavigationBar, "topAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(-[THBookViewController view](self, "view"), "safeAreaLayoutGuide"), "topAnchor")), "setActive:", 1);
      self->mTitleLabel = (UILabel *)objc_alloc_init((Class)UILabel);
      -[UILabel setBackgroundColor:](self->mTitleLabel, "setBackgroundColor:", +[UIColor clearColor](UIColor, "clearColor"));
      -[UILabel setOpaque:](self->mTitleLabel, "setOpaque:", 0);
      -[UILabel setFont:](self->mTitleLabel, "setFont:", +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 17.0));
      -[UILabel setMinimumScaleFactor:](self->mTitleLabel, "setMinimumScaleFactor:", 0.588235294);
      -[UILabel setAutoresizingMask:](self->mTitleLabel, "setAutoresizingMask:", 2);
      -[UILabel setAdjustsFontSizeToFitWidth:](self->mTitleLabel, "setAdjustsFontSizeToFitWidth:", 0);
      -[UILabel setTextAlignment:](self->mTitleLabel, "setTextAlignment:", 1);
      -[UILabel setBaselineAdjustment:](self->mTitleLabel, "setBaselineAdjustment:", 1);
      -[UILabel setText:](self->mTitleLabel, "setText:", -[THBookDescription bookTitle](-[THBookViewController bookDescription](self, "bookDescription"), "bookTitle"));
      -[UILabel setLineBreakMode:](self->mTitleLabel, "setLineBreakMode:", 5);
      -[UILabel sizeToFit](self->mTitleLabel, "sizeToFit");
      v4 = -[UIImage imageWithConfiguration:](+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("bookmark.fill")), "imageWithConfiguration:", +[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 5, 3, 17.0));
      v5 = +[UIButton buttonWithType:](UIButton, "buttonWithType:", 0);
      self->mActionlessBookmarkButton = v5;
      -[UIButton setImage:forState:](v5, "setImage:forState:", v4, 0);
      -[UIButton setUserInteractionEnabled:](self->mActionlessBookmarkButton, "setUserInteractionEnabled:", 0);
      -[UIButton setTintColor:](self->mActionlessBookmarkButton, "setTintColor:", +[UIColor systemRedColor](UIColor, "systemRedColor"));
    }
  }
}

- (int64_t)positionForBar:(id)a3
{
  if (self->mTitleLabelNavigationBar == a3)
    return 3;
  else
    return 0;
}

- (BOOL)p_isPageLocationApplicable
{
  return -[THDocumentViewController currentPresentationType](-[THBookViewController documentViewController](self, "documentViewController"), "currentPresentationType") != 0;
}

- (void)p_savePlaceholder
{
  -[THDocumentNavigator savePlaceholder](-[THDocumentViewController documentNavigator](-[THBookViewController documentViewController](self, "documentViewController"), "documentNavigator"), "savePlaceholder");
}

- (BOOL)p_isPageLocationValid:(id)a3
{
  id v5;
  BOOL v6;
  unint64_t v7;
  id v8;
  id v9;

  if (!a3)
  {
    LOBYTE(v5) = 0;
    return (char)v5;
  }
  if (-[THBookViewController isBookEpub](self, "isBookEpub"))
  {
    v5 = objc_msgSend(a3, "storageUID");
    if (!v5)
      return (char)v5;
    v6 = objc_msgSend(a3, "range") == (id)0x7FFFFFFFFFFFFFFFLL;
LABEL_5:
    LOBYTE(v5) = !v6;
    return (char)v5;
  }
  v7 = -[THDocumentNavigationModel pageCount](-[THBookViewController navigationModel](self, "navigationModel"), "pageCount");
  v8 = objc_msgSend(a3, "absolutePhysicalPageIndex");
  LOBYTE(v5) = 0;
  if (v8 != (id)0x7FFFFFFFFFFFFFFFLL && v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = objc_msgSend(a3, "absolutePhysicalPageIndex");
    if (v9 >= (id)-[THDocumentNavigationModel pageCount](-[THBookViewController navigationModel](self, "navigationModel"), "pageCount"))
    {
      LOBYTE(v5) = 0;
      return (char)v5;
    }
    if (objc_msgSend(objc_msgSend(a3, "storageUID"), "length"))
    {
      LOBYTE(v5) = 1;
      return (char)v5;
    }
    v6 = objc_msgSend(objc_msgSend(a3, "contentNodeGUID"), "length") == 0;
    goto LABEL_5;
  }
  return (char)v5;
}

- (BOOL)p_hasDestinationPage
{
  unsigned __int8 v3;
  char v4;
  BOOL result;

  v3 = -[THBookViewController p_isPageLocationValid:](self, "p_isPageLocationValid:", objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot"), "annotationController"), "placeholder"));
  result = -[THBookViewController openingCFIOverride](self, "openingCFIOverride")
        || -[THBookViewController openingFragmentOverride](self, "openingFragmentOverride")
        || (-[THBookViewController openingAbsolutePageIndexOverride](self, "openingAbsolutePageIndexOverride") != 0x7FFFFFFFFFFFFFFFLL
          ? (v4 = 1)
          : (v4 = v3),
            (v4 & 1) != 0)
        || -[THBookViewController openingLocationOverride](self, "openingLocationOverride") != 0;
  return result;
}

- (BOOL)p_wantsToOpenToTOC
{
  unsigned __int8 v3;

  v3 = -[THBookViewController p_hasDestinationPage](self, "p_hasDestinationPage");
  if (-[THBookViewController introMediaViewController](self, "introMediaViewController"))
    return 0;
  else
    return v3 ^ 1;
}

- (id)p_THCFIReaderStringFromBKCFIString:(id)a3
{
  uint64_t v4;
  BOOL v5;

  if (objc_msgSend(a3, "rangeOfString:", CFSTR("epubcfi(/")))
    v5 = 1;
  else
    v5 = v4 == 0;
  if (v5)
    return a3;
  else
    return objc_msgSend(CFSTR("#"), "stringByAppendingString:", a3);
}

- (BOOL)p_jumpToBKCFIString:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  void *v7;
  unint64_t v8;
  THPageLocation *v9;
  id v10;
  uint64_t v11;
  uint64_t v13;

  if (!a3)
    return 0;
  v4 = -[THBookViewController p_THCFIReaderStringFromBKCFIString:](self, "p_THCFIReaderStringFromBKCFIString:");
  v13 = 0;
  v5 = objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "modelStorageAnchorForCfi:error:", v4, &v13);
  v6 = v5 != 0;
  if (v5)
  {
    v7 = v5;
    -[THBookViewController navigateToAnchorInDVC:pulse:](self, "navigateToAnchorInDVC:pulse:", v5, 1);
    v8 = -[THBookViewController absolutePageIndexForCFI:](self, "absolutePageIndexForCFI:", v4);
    v9 = [THPageLocation alloc];
    v10 = objc_msgSend(v7, "range");
    -[THBookspotHistoryStack gotoBookspot:minor:](-[THBookViewController bookspotHistoryStack](self, "bookspotHistoryStack"), "gotoBookspot:minor:", -[THPageLocation initWithAbsolutePageIndex:range:storageUID:contentNodeGUID:](v9, "initWithAbsolutePageIndex:range:storageUID:contentNodeGUID:", v8, v10, v11, objc_msgSend(v7, "storageUID"), objc_msgSend(objc_msgSend(v7, "contentNode"), "nodeGUID")), 0);
  }
  return v6;
}

- (BOOL)p_jumpToFragment:(id)a3
{
  id v5;
  THModelStorageAnchor *v6;
  THModelStorageAnchor *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  if (!a3)
    return 0;
  v5 = -[THDocumentNavigationModel contentNodeForGUID:](-[THBookViewController navigationModel](self, "navigationModel"), "contentNodeForGUID:", a3);
  if (v5)
    v6 = -[THModelStorageAnchor initWithContentNode:storageUID:range:]([THModelStorageAnchor alloc], "initWithContentNode:storageUID:range:", v5, a3, 0, 0);
  else
    v6 = -[THDocumentLinkResolver anchorFromCustomLink:presentationType:](-[THBookLinkResolver documentLinkResolver](-[THBookViewController bookLinkResolver](self, "bookLinkResolver"), "documentLinkResolver"), "anchorFromCustomLink:presentationType:", -[THModelLink initWithTarget:context:]([THModelLink alloc], "initWithTarget:context:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ibooks://#%@"), a3), objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "context")), +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "context")));
  v8 = v6;
  if (!v6)
    return 0;
  -[THBookViewController navigateToAnchorInDVC:pulse:](self, "navigateToAnchorInDVC:pulse:", v6, 0);
  v9 = objc_msgSend(v5, "absolutePageIndexForRelativePageIndex:forPresentationType:", 0, +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", objc_msgSend(objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "rootNode"), "context")));
  v11 = objc_opt_class(THModelStorageAnchor, v10);
  if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0)
  {
    v13 = objc_opt_class(THModelStorageAnchor, v12);
    v14 = (void *)TSUDynamicCast(v13, v8);
    v15 = (uint64_t)objc_msgSend(v14, "range");
    v17 = v16;
    v18 = objc_msgSend(v14, "storageUID");
  }
  else
  {
    v18 = 0;
    v17 = 0;
    v15 = 0x7FFFFFFFFFFFFFFFLL;
  }
  -[THBookspotHistoryStack gotoBookspot:minor:](-[THBookViewController bookspotHistoryStack](self, "bookspotHistoryStack"), "gotoBookspot:minor:", -[THPageLocation initWithAbsolutePageIndex:range:storageUID:contentNodeGUID:]([THPageLocation alloc], "initWithAbsolutePageIndex:range:storageUID:contentNodeGUID:", v9, v15, v17, v18, objc_msgSend(v5, "nodeGUID")), 0);
  return 1;
}

- (BOOL)p_restoreToLaunchPage
{
  unsigned __int8 v3;
  unsigned __int8 v4;
  unsigned __int8 v5;
  unsigned int v6;
  char v7;
  id v8;
  unsigned __int8 v9;
  BOOL result;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;

  if (-[THBookViewController isBookEpub](self, "isBookEpub"))
    -[THDocumentViewController ensureDocumentIsLoaded](-[THBookViewController documentViewController](self, "documentViewController"), "ensureDocumentIsLoaded");
  if (-[THBookViewController openingCFIOverride](self, "openingCFIOverride"))
  {
    v3 = -[THBookViewController p_jumpToBKCFIString:](self, "p_jumpToBKCFIString:", -[THBookViewController openingCFIOverride](self, "openingCFIOverride"));
    -[THBookViewController setOpeningCFIOverride:](self, "setOpeningCFIOverride:", 0);
    if ((v3 & 1) == 0)
      return 0;
LABEL_20:
    objc_msgSend(-[THBookViewController view](self, "view"), "bounds");
    objc_msgSend(-[THDocumentViewController view](-[THBookViewController documentViewController](self, "documentViewController"), "view"), "setFrame:", v11, v12, v13, v14);
    return 1;
  }
  if (-[THBookViewController openingFragmentOverride](self, "openingFragmentOverride"))
  {
    v4 = -[THBookViewController p_jumpToFragment:](self, "p_jumpToFragment:", -[THBookViewController openingFragmentOverride](self, "openingFragmentOverride"));
    -[THBookViewController setOpeningFragmentOverride:](self, "setOpeningFragmentOverride:", 0);
    if ((v4 & 1) == 0)
      return 0;
    goto LABEL_20;
  }
  if (-[THBookViewController openingLocationOverride](self, "openingLocationOverride"))
  {
    v5 = -[THBookViewController p_jumpToLocation:](self, "p_jumpToLocation:", -[THBookViewController openingLocationOverride](self, "openingLocationOverride"));
    -[THBookViewController setOpeningLocationOverride:](self, "setOpeningLocationOverride:", 0);
    if ((v5 & 1) == 0)
      return 0;
    goto LABEL_20;
  }
  if (-[THBookViewController openingAbsolutePageIndexOverride](self, "openingAbsolutePageIndexOverride") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = -[THBookViewController jumpToPageLocation:touchHistory:minor:](self, "jumpToPageLocation:touchHistory:minor:", -[THPageLocation initWithAbsolutePageIndex:]([THPageLocation alloc], "initWithAbsolutePageIndex:", -[THBookViewController openingAbsolutePageIndexOverride](self, "openingAbsolutePageIndexOverride")), 1, 0);
    -[THBookViewController setOpeningAbsolutePageIndexOverride:](self, "setOpeningAbsolutePageIndexOverride:", 0x7FFFFFFFFFFFFFFFLL);
    result = 0;
    if ((v9 & 1) == 0)
      return result;
    goto LABEL_20;
  }
  v15 = 0;
  v16 = 0;
  objc_msgSend(objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "annotationController"), "getPlaceholder:andPageHistory:", &v16, &v15);
  if (-[THBookViewController p_isPageLocationValid:](self, "p_isPageLocationValid:", v16))
  {
    v6 = -[THBookViewController jumpToPageLocation:touchHistory:minor:](self, "jumpToPageLocation:touchHistory:minor:", v16, v15 == 0, 1);
    v7 = v6;
    if (v15)
    {
      if (!-[THDocumentViewController documentNavigator](-[THBookViewController documentViewController](self, "documentViewController"), "documentNavigator"))objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookViewController p_restoreToLaunchPage]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm"), 5618, CFSTR("invalid nil value for '%s'"), "self.documentViewController.documentNavigator");
      v8 = -[THBookViewController documentRoot](self, "documentRoot");
      objc_msgSend(v8, "resetWithDictionaryRepresentation:", v15);
      if ((v7 & 1) == 0)
        return 0;
      goto LABEL_20;
    }
    if (v6)
      goto LABEL_20;
  }
  return 0;
}

- (void)p_placeholderLocationDidChange
{
  NSNumber *v3;
  id v4;
  void *v5;
  AEAssetViewControllerDelegate *v6;
  float v7;
  float v8;
  float v9;
  uint64_t v10;
  void *v11;

  v3 = -[THBookViewController readingProgressHighwaterMark](self, "readingProgressHighwaterMark");
  if (!v3)
  {
    v3 = (NSNumber *)objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot"), "annotationController"), "readingProgressHighwaterMark");
    -[THBookViewController setReadingProgressHighwaterMark:](self, "setReadingProgressHighwaterMark:", v3);
  }
  v4 = -[THDocumentNavigator readingProgress](-[THBookViewController documentNavigator](self, "documentNavigator"), "readingProgress");
  if (v4)
  {
    v5 = v4;
    v6 = -[THBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate");
    v10 = BCAssetReadingProgressKey;
    v11 = v5;
    -[AEAssetViewControllerDelegate assetViewController:assetPropertyChanged:](v6, "assetViewController:assetPropertyChanged:", self, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
    -[NSNumber floatValue](v3, "floatValue");
    v7 = kAEAnnotationReadingLocationSignificantHighwaterMark;
    if (v8 < kAEAnnotationReadingLocationSignificantHighwaterMark)
    {
      -[THBookViewController setReadingProgressHighwaterMark:](self, "setReadingProgressHighwaterMark:", v5);
      objc_msgSend(v5, "floatValue");
      if (v9 > v7)
        -[AEAssetViewControllerDelegate assetViewControllerSignificantReadingLocationChange:](-[THBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"), "assetViewControllerSignificantReadingLocationChange:", self);
    }
  }
  objc_msgSend(+[BCProgressKitController sharedController](BCProgressKitController, "sharedController"), "updateBookProgress:completion:", objc_msgSend(objc_msgSend(objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "bookDescription"), "asset"), "assetID"), 0);
}

- (void)dismissTOCGlossaryView:(BOOL)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_80ADC;
  v3[3] = &unk_426DD0;
  v3[4] = self;
  -[THTOCGlossaryMenuPopoverViewController dismissViewControllerAnimated:completion:](-[THBookViewController TOCGlossaryViewController](self, "TOCGlossaryViewController"), "dismissViewControllerAnimated:completion:", a3, v3);
}

- (void)p_TOCGlossaryPopoverDidHide
{
  -[THToolbarDelegate userDidInteractInToolbar](-[THDocumentViewController toolbarDelegate](-[THBookViewController documentViewController](self, "documentViewController"), "toolbarDelegate"), "userDidInteractInToolbar");
  -[THBookViewController setTOCGlossaryViewController:](self, "setTOCGlossaryViewController:", 0);
}

- (void)showSharePopover:(id)a3
{
  _QWORD v5[5];
  _QWORD v6[6];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_80C04;
  v6[3] = &unk_428538;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  v6[5] = a3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_80E90;
  v5[3] = &unk_428560;
  v5[4] = v6;
  objc_msgSend(+[BCProgressKitController sharedController](BCProgressKitController, "sharedController"), "activeContextWithCompletion:", v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)dismissSharePopover:(BOOL)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_80F64;
  v3[3] = &unk_426DD0;
  v3[4] = self;
  -[UIViewController dismissViewControllerAnimated:completion:](-[THBookViewController activityViewController](self, "activityViewController"), "dismissViewControllerAnimated:completion:", a3, v3);
}

- (void)p_shareDidHide
{
  -[THToolbarDelegate userDidInteractInToolbar](-[THDocumentViewController toolbarDelegate](-[THBookViewController documentViewController](self, "documentViewController"), "toolbarDelegate"), "userDidInteractInToolbar");
  -[THBookViewController setActivityViewController:](self, "setActivityViewController:", 0);
}

- (void)showBookmarkMenu:(BOOL)a3 fromItem:(id)a4
{
  _BOOL8 v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  THNavigationController *v11;
  id v12;
  THBookmarkMenuPopoverViewController *v13;

  v5 = a3;
  if (objc_msgSend(-[THBookmarkMenuPopoverViewController view](-[THBookViewController bookmarkViewController](self, "bookmarkViewController"), "view"), "window"))
  {
    -[THBookViewController dismissBookmarkMenu:completion:](self, "dismissBookmarkMenu:completion:", v5, 0);
  }
  else
  {
    -[THBookViewController dismissActivePopover](self, "dismissActivePopover");
    v13 = objc_alloc_init(THBookmarkMenuPopoverViewController);
    -[THBookmarkMenuPopoverViewController setTitle:](v13, "setTitle:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Bookmarks"), &stru_43D7D8, 0));
    -[THBookmarkMenuPopoverViewController setDelegate:](v13, "setDelegate:", self);
    -[THBookmarkMenuPopoverViewController setReflowablePaginationController:](v13, "setReflowablePaginationController:", -[THDocumentViewController reflowablePaginationController](-[THBookViewController documentViewController](self, "documentViewController"), "reflowablePaginationController"));
    -[THBookmarkMenuPopoverViewController setOverrideUserInterfaceStyle:](v13, "setOverrideUserInterfaceStyle:", -[THBookViewController overrideUserInterfaceStyle](self, "overrideUserInterfaceStyle"));
    -[THBookViewController setBookmarkViewController:](self, "setBookmarkViewController:", v13);
    -[THBookmarkMenuPopoverViewController setDelegate:](-[THBookViewController bookmarkViewController](self, "bookmarkViewController"), "setDelegate:", self);
    -[THBookmarkMenuPopoverViewController setTheme:](-[THBookViewController bookmarkViewController](self, "bookmarkViewController"), "setTheme:", -[THBookViewController theme](self, "theme"));
    -[THBookmarkMenuPopoverViewController setViewDelegate:](-[THBookViewController bookmarkViewController](self, "bookmarkViewController"), "setViewDelegate:", self);
    -[THToolbarDelegate userWillInteractInToolbar](-[THDocumentViewController toolbarDelegate](-[THBookViewController documentViewController](self, "documentViewController"), "toolbarDelegate"), "userWillInteractInToolbar");
    v8 = objc_opt_class(UIView, v7);
    v9 = BUDynamicCast(v8, a4);
    if (v9)
    {
      v10 = (void *)v9;
      v11 = -[THNavigationController initWithRootViewController:]([THNavigationController alloc], "initWithRootViewController:", -[THBookViewController bookmarkViewController](self, "bookmarkViewController"));
      -[THNavigationController setModalPresentationStyle:](v11, "setModalPresentationStyle:", 7);
      v12 = -[THNavigationController popoverPresentationController](v11, "popoverPresentationController");
      objc_msgSend(v12, "setSourceView:", v10);
      objc_msgSend(v10, "bounds");
      objc_msgSend(v12, "setSourceRect:");
      objc_msgSend(v12, "setPermittedArrowDirections:", 1);
      objc_msgSend(v12, "setDelegate:", self);
      objc_msgSend(v12, "setPassthroughViews:", -[THBookViewController p_popoverPassthroughViews](self, "p_popoverPassthroughViews"));
      objc_msgSend(v12, "bc_applyTraitOverridesWithOverrideUserInterfaceStyleFromViewController:", -[THBookViewController bookmarkViewController](self, "bookmarkViewController"));
      -[THBookViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, v5, 0);

    }
  }
}

- (void)p_bookmarkPopoverDidHide
{
  -[THToolbarDelegate userDidInteractInToolbar](-[THDocumentViewController toolbarDelegate](-[THBookViewController documentViewController](self, "documentViewController"), "toolbarDelegate"), "userDidInteractInToolbar");
  -[THBookmarkMenuPopoverViewController teardown](-[THBookViewController bookmarkViewController](self, "bookmarkViewController"), "teardown");
  -[THBookmarkMenuPopoverViewController setReflowablePaginationController:](-[THBookViewController bookmarkViewController](self, "bookmarkViewController"), "setReflowablePaginationController:", 0);
  -[THBookmarkMenuPopoverViewController setDelegate:](-[THBookViewController bookmarkViewController](self, "bookmarkViewController"), "setDelegate:", 0);
  -[THBookViewController setBookmarkViewController:](self, "setBookmarkViewController:", 0);
}

- (void)dismissBookmarkMenu:(BOOL)a3 completion:(id)a4
{
  _QWORD v4[6];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_81278;
  v4[3] = &unk_427290;
  v4[4] = self;
  v4[5] = a4;
  -[THBookmarkMenuPopoverViewController dismissViewControllerAnimated:completion:](-[THBookViewController bookmarkViewController](self, "bookmarkViewController"), "dismissViewControllerAnimated:completion:", a3, v4);
}

- (void)p_dismissBookmarkMenu
{
  -[THBookViewController dismissBookmarkMenu:completion:](self, "dismissBookmarkMenu:completion:", 1, 0);
}

- (void)p_showBookmarkMenu
{
  -[THBookViewController showBookmarkMenu:fromItem:](self, "showBookmarkMenu:fromItem:", 1, -[THBookViewController bookmarkButton](self, "bookmarkButton"));
}

- (void)prepareForPopoverPresentation:(id)a3
{
  THBookmarkMenuPopoverViewController *v4;
  id v5;

  v4 = -[THBookViewController bookmarkViewController](self, "bookmarkViewController");
  v5 = objc_msgSend(a3, "presentedViewController");
  if (v5 == -[THBookmarkMenuPopoverViewController navigationController](v4, "navigationController"))
    objc_msgSend(-[THBookmarkMenuPopoverViewController navigationItem](v4, "navigationItem"), "setRightBarButtonItem:animated:", 0, 0);
}

- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4
{
  THBookmarkMenuPopoverViewController *v6;
  id v7;
  id v8;

  v6 = -[THBookViewController bookmarkViewController](self, "bookmarkViewController", a3, a4);
  v7 = objc_msgSend(a3, "presentedViewController");
  if (v7 == -[THBookmarkMenuPopoverViewController navigationController](v6, "navigationController"))
  {
    v8 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "p_dismissBookmarkMenu");
    objc_msgSend(-[THBookmarkMenuPopoverViewController navigationItem](v6, "navigationItem"), "setRightBarButtonItem:animated:", v8, 0);

  }
  return 0;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  THSearchViewController *v4;

  v4 = (THSearchViewController *)objc_msgSend(a3, "presentedViewController");
  if (v4 == -[THBookmarkMenuPopoverViewController navigationController](-[THBookViewController bookmarkViewController](self, "bookmarkViewController"), "navigationController"))
  {
    -[THBookViewController p_bookmarkPopoverDidHide](self, "p_bookmarkPopoverDidHide");
  }
  else if (v4 == (THSearchViewController *)-[THBookViewController TOCGlossaryViewController](self, "TOCGlossaryViewController"))
  {
    -[THBookViewController p_TOCGlossaryPopoverDidHide](self, "p_TOCGlossaryPopoverDidHide");
  }
  else if (v4 == (THSearchViewController *)-[THBookViewController displaySettingsViewController](self, "displaySettingsViewController"))
  {
    -[THBookViewController p_displaySettingsDidHide](self, "p_displaySettingsDidHide");
  }
  else if (v4 == -[THBookViewController searchViewController](self, "searchViewController"))
  {
    -[THBookViewController p_searchDidHide](self, "p_searchDidHide");
    objc_msgSend(-[THDocumentViewController interactiveCanvasController](-[THBookViewController documentViewController](self, "documentViewController"), "interactiveCanvasController"), "resumeEditing");
  }
  else if (v4 == (THSearchViewController *)-[THBookViewController activityViewController](self, "activityViewController"))
  {
    -[THBookViewController p_shareDidHide](self, "p_shareDidHide");
  }
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -[THBookViewController adaptivePresentationStyleForPresentationController:traitCollection:](self, "adaptivePresentationStyleForPresentationController:traitCollection:", a3, -[THBookViewController traitCollection](self, "traitCollection"));
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v4;
  char *v7;
  char *v8;
  _BOOL4 v10;
  THSearchViewController *v11;

  v4 = a4;
  if (a4 || (v4 = -[THBookViewController traitCollection](self, "traitCollection")) != 0)
  {
    v7 = (char *)objc_msgSend(v4, "horizontalSizeClass");
    v8 = (char *)objc_msgSend(v4, "verticalSizeClass");
    v10 = v7 == (_BYTE *)&dword_0 + 1 || v8 == (_BYTE *)&dword_0 + 1;
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookViewController adaptivePresentationStyleForPresentationController:traitCollection:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm"), 5898, CFSTR("invalid nil value for '%s'"), "traitCollection");
    v10 = 1;
  }
  v11 = (THSearchViewController *)objc_msgSend(a3, "presentedViewController");
  if (v11 == (THSearchViewController *)-[THBookViewController TOCGlossaryViewController](self, "TOCGlossaryViewController")|| v11 == (THSearchViewController *)-[THBookViewController displaySettingsViewController](self, "displaySettingsViewController"))
  {
    return -1;
  }
  if (v11 == -[THBookViewController searchViewController](self, "searchViewController")
    || v11 == (THSearchViewController *)-[THBookViewController activityViewController](self, "activityViewController"))
  {
    if (!v10)
      return 7;
  }
  else if (v11 != -[THBookmarkMenuPopoverViewController navigationController](-[THBookViewController bookmarkViewController](self, "bookmarkViewController"), "navigationController")|| !v10)
  {
    return 7;
  }
  return 0;
}

- (id)pageNumberStringForLocation:(id)a3
{
  return objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "pageNumberStringForLocation:", a3);
}

- (CGImage)thumbnailImageForAbsolutePageIndex:(unint64_t)a3
{
  return (CGImage *)objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "thumbnailImageForAbsolutePageIndex:", a3);
}

- (id)sectionTitleStringForLocation:(id)a3
{
  return objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "sectionTitleStringForLocation:", a3);
}

- (id)sectionNumberStringForLocation:(id)a3
{
  return objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "sectionNumberStringForLocation:", a3);
}

- (BOOL)hasThumbnailImageForAbsolutePageIndex:(unint64_t)a3
{
  return !-[THBookViewController isBookEpub](self, "isBookEpub", a3);
}

- (BOOL)isAnnotationWriteEnabled
{
  return objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot"), "annotationController"), "canModifyAnnotations");
}

- (id)bookmarkFetchedResultsController
{
  return objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot"), "annotationController"), "allBookmarksFetchedResultsController");
}

- (void)addRemoveBookmarkCurrentPage
{
  -[THBookViewController setPageBookmarked:](self, "setPageBookmarked:", -[THBookViewController isPageBookmarked](self, "isPageBookmarked") ^ 1);
}

- (BOOL)isCurrentPageBookmarkedForBookmarkMenuPopoverViewController:(id)a3
{
  if (-[THBookViewController bookmarkViewController](self, "bookmarkViewController") == a3)
    return -[THBookViewController isPageBookmarked](self, "isPageBookmarked");
  else
    return 0;
}

- (void)setCurrentPageBookmarked:(BOOL)a3 forBookmarkMenuPopoverViewController:(id)a4
{
  _BOOL8 v4;

  v4 = a3;
  if (-[THBookViewController bookmarkViewController](self, "bookmarkViewController") == a4)
    -[THBookViewController setPageBookmarked:](self, "setPageBookmarked:", v4);
}

- (void)removeBookmark:(id)a3
{
  objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot"), "annotationController"), "removeBookmark:", a3);
  -[THBookViewController updateBookmarkButton](self, "updateBookmarkButton");
}

- (void)p_navigationHistoryDidChange:(id)a3
{
  id v4;
  unsigned __int8 v5;
  unsigned int v6;

  v4 = objc_msgSend(a3, "object");
  v5 = objc_msgSend(objc_msgSend(v4, "objectForKey:", CFSTR("minor")), "BOOLValue");
  v6 = objc_msgSend(objc_msgSend(v4, "objectForKey:", CFSTR("suppressToolbar")), "BOOLValue");
  if ((v5 & 1) == 0)
  {
    if (((!-[THBookViewController isBookEpub](self, "isBookEpub") | v6) & 1) != 0)
      -[THBookViewController p_setNavigationOverlayHidden:animated:autoHides:](self, "p_setNavigationOverlayHidden:animated:autoHides:", 0, 1, 1);
    else
      -[THNavigationBarController setNavigationBarHidden:animated:](-[THBookViewController navigationBarController](self, "navigationBarController"), "setNavigationBarHidden:animated:", 0, 1);
  }
}

- (id)_currentLocation
{
  if (-[THBookViewController currentAbsolutePageIndex](self, "currentAbsolutePageIndex") == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return -[THDocumentNavigator currentBookspotLocation](-[THDocumentViewController documentNavigator](-[THBookViewController documentViewController](self, "documentViewController"), "documentNavigator"), "currentBookspotLocation");
}

- (void)recordCurrentLocationInHistory
{
  -[THBookspotHistoryStack gotoBookspot:minor:](-[THBookViewController bookspotHistoryStack](self, "bookspotHistoryStack"), "gotoBookspot:minor:", -[THBookViewController _currentLocation](self, "_currentLocation"), 1);
}

- (BOOL)jumpToPageLocation:(id)a3 touchHistory:(BOOL)a4 minor:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  unsigned int v9;
  uint64_t v10;
  THDocumentNavigationModel *v11;
  id v12;
  void *v13;
  THModelStorageAnchor *v14;
  id v15;
  id v16;
  NSNotificationCenter *v17;
  __CFString *v18;
  _QWORD v20[2];
  _QWORD v21[2];

  v5 = a5;
  v6 = a4;
  v9 = -[THBookViewController isBookEpub](self, "isBookEpub");
  if ((v9 & 1) == 0)
  {
    v10 = (uint64_t)objc_msgSend(a3, "absolutePhysicalPageIndex");
    if (!v6)
      goto LABEL_6;
    goto LABEL_5;
  }
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6)
LABEL_5:
    -[THBookViewController recordCurrentLocationInHistory](self, "recordCurrentLocationInHistory");
LABEL_6:
  -[THBookViewController p_insertDVCInBack](self, "p_insertDVCInBack");
  -[THDocumentViewController zoomOutIfNecessaryPriorToNavigation](-[THBookViewController documentViewController](self, "documentViewController"), "zoomOutIfNecessaryPriorToNavigation");
  v11 = -[THBookViewController navigationModel](self, "navigationModel");
  if (v9)
    v12 = -[THDocumentNavigationModel contentNodeForBodyStorageID:](v11, "contentNodeForBodyStorageID:", objc_msgSend(a3, "storageUID"));
  else
    v12 = -[THDocumentNavigationModel contentNodeForAbsolutePageIndex:](v11, "contentNodeForAbsolutePageIndex:", v10);
  v13 = v12;
  if (v12)
  {
    -[THBookViewController vantageWillChangeBy:reason:](self, "vantageWillChangeBy:reason:", self, CFSTR("THVantageChangeReasonNavigation"));
    if (objc_msgSend(a3, "storageUID"))
    {
      v14 = +[THModelStorageAnchor storageAnchorWithContentNode:pageLocation:](THModelStorageAnchor, "storageAnchorWithContentNode:pageLocation:", v13, a3);
      -[THModelStorageAnchor setAbsolutePageIndex:](v14, "setAbsolutePageIndex:", v10);
    }
    else
    {
      v15 = +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", objc_msgSend(objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "rootNode"), "context"));
      v14 = -[THModelPageAnchor initWithContentNode:relativePageIndex:presentationType:]([THModelPageAnchor alloc], "initWithContentNode:relativePageIndex:presentationType:", v13, objc_msgSend(v13, "relativePageIndexForAbsolutePageIndex:forPresentationType:", v10, v15), v15);
    }
    -[THBookViewController navigateToAnchorInDVC:pulse:](self, "navigateToAnchorInDVC:pulse:", v14, 0);
    v16 = objc_msgSend(a3, "copy");
    if (v6)
      -[THBookspotHistoryStack gotoBookspot:minor:](-[THBookViewController bookspotHistoryStack](self, "bookspotHistoryStack"), "gotoBookspot:minor:", v16, v5);
    -[THBookViewController vantageDidChangeBy:reason:](self, "vantageDidChangeBy:reason:", self, CFSTR("THVantageChangeReasonNavigation"));
    v17 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    v18 = THNavigationHistoryDidChangeNotification;
    v20[0] = CFSTR("pageLocation");
    v20[1] = CFSTR("minor");
    v21[0] = v16;
    v21[1] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5);
    -[NSNotificationCenter postNotificationName:object:](v17, "postNotificationName:object:", v18, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
    -[THBookViewController removeTOC](self, "removeTOC");
  }
  return v13 != 0;
}

- (BOOL)isPageBookmarked
{
  unsigned int v3;
  id v4;

  v3 = -[THBookViewController isBookmarkApplicable](self, "isBookmarkApplicable");
  if (v3)
  {
    v4 = objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot"), "annotationController");
    if (-[THBookViewController isBookEpub](self, "isBookEpub"))
      LOBYTE(v3) = objc_msgSend(v4, "isPageInfoBookmarked:", -[THBookViewController currentPageInfoForBookmarks](self, "currentPageInfoForBookmarks"));
    else
      LOBYTE(v3) = objc_msgSend(v4, "isAbsolutePhysicalPageBookmarked:", -[THBookViewController currentAbsolutePageIndexForBookmarks](self, "currentAbsolutePageIndexForBookmarks"));
  }
  return v3;
}

- (id)_storageAnchorForPageBookmark
{
  THDocumentViewController *v2;

  v2 = -[THBookViewController documentViewController](self, "documentViewController");
  return -[THDocumentNavigator storageAnchorForBookmarksUsingViewCenter:](-[THDocumentViewController documentNavigator](v2, "documentNavigator"), "storageAnchorForBookmarksUsingViewCenter:", -[THDocumentViewController isTwoUp](v2, "isTwoUp") ^ 1);
}

- (void)setPageBookmarked:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  id v6;
  id v7;
  unint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;

  v3 = a3;
  if (-[THBookViewController isBookmarkApplicable](self, "isBookmarkApplicable")
    && -[THBookViewController isPageBookmarked](self, "isPageBookmarked") != v3)
  {
    v5 = objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot"), "annotationController");
    if (-[THBookViewController isBookEpub](self, "isBookEpub"))
    {
      v6 = -[THBookViewController currentPageInfoForBookmarks](self, "currentPageInfoForBookmarks");
      if (v3)
      {
        v7 = -[THBookViewController _storageAnchorForPageBookmark](self, "_storageAnchorForPageBookmark");
        if (v7)
          objc_msgSend(v5, "bookmarkPageInfo:anchor:", v6, v7);
        goto LABEL_14;
      }
      v10 = v5;
      v11 = v6;
      v12 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v8 = -[THBookViewController currentAbsolutePageIndexForBookmarks](self, "currentAbsolutePageIndexForBookmarks");
      if (v3)
      {
        v9 = -[THBookViewController _storageAnchorForPageBookmark](self, "_storageAnchorForPageBookmark");
        if (v9)
          objc_msgSend(v5, "bookmarkAbsolutePhysicalPage:anchor:", v8, v9);
        goto LABEL_14;
      }
      v10 = v5;
      v11 = 0;
      v12 = v8;
    }
    objc_msgSend(v10, "unbookmarkPageInfo:absolutePageIndex:", v11, v12);
LABEL_14:
    -[THBookViewController updateBookmarkButton](self, "updateBookmarkButton");
  }
}

- (unint64_t)currentAbsolutePageIndex
{
  return -[THDocumentNavigator currentAbsolutePageIndex](-[THBookViewController documentNavigator](self, "documentNavigator"), "currentAbsolutePageIndex");
}

- (unint64_t)currentAbsolutePageIndexForBookmarks
{
  THDocumentNavigator *v3;
  id v4;

  v3 = -[THBookViewController documentNavigator](self, "documentNavigator");
  if (-[THDocumentViewController isTwoUp](-[THBookViewController documentViewController](self, "documentViewController"), "isTwoUp"))
  {
    v4 = objc_msgSend(-[THBookViewController currentPresentationType](self, "currentPresentationType"), "isFlow");
  }
  else
  {
    v4 = &dword_0 + 1;
  }
  return -[THDocumentNavigator currentAbsolutePageIndexForBookmarksUsingViewCenter:](v3, "currentAbsolutePageIndexForBookmarksUsingViewCenter:", v4);
}

- (id)currentPageInfoForBookmarks
{
  unint64_t v3;
  THDocumentNavigator *v5;
  id v6;
  unint64_t v7;
  id v8;

  if (objc_msgSend(-[THBookViewController currentPresentationType](self, "currentPresentationType"), "isFlow")&& -[THBookViewController isBookEpub](self, "isBookEpub"))
  {
    v3 = -[THBookViewController currentAbsolutePageIndex](self, "currentAbsolutePageIndex");
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return 0;
    }
    else
    {
      v7 = v3;
      v8 = +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot"), "context"));
      return objc_msgSend(-[THDocumentViewController currentNavigationUnit](-[THBookViewController documentViewController](self, "documentViewController"), "currentNavigationUnit"), "pageInfoForRelativePageIndex:forPresentationType:", objc_msgSend(-[THDocumentViewController currentNavigationUnit](-[THBookViewController documentViewController](self, "documentViewController"), "currentNavigationUnit"), "relativePageIndexForAbsolutePageIndex:forPresentationType:", v7, v8), v8);
    }
  }
  else
  {
    v5 = -[THBookViewController documentNavigator](self, "documentNavigator");
    if (-[THDocumentViewController isTwoUp](-[THBookViewController documentViewController](self, "documentViewController"), "isTwoUp"))
    {
      v6 = objc_msgSend(-[THBookViewController currentPresentationType](self, "currentPresentationType"), "isFlow");
    }
    else
    {
      v6 = &dword_0 + 1;
    }
    return -[THDocumentNavigator currentPageInfoForBookmarksUsingViewCenter:](v5, "currentPageInfoForBookmarksUsingViewCenter:", v6);
  }
}

- (BOOL)isBookmarkApplicable
{
  _BOOL4 v3;
  UIViewController *v4;
  BOOL v5;

  v3 = -[THBookViewController isAnnotationWriteEnabled](self, "isAnnotationWriteEnabled");
  if (v3)
  {
    v4 = -[THBookViewController visibleViewController](self, "visibleViewController");
    if (v4 != (UIViewController *)-[THBookViewController documentViewController](self, "documentViewController"))
    {
      LOBYTE(v3) = 0;
      return v3;
    }
    if (!-[THBookViewController isBookEpub](self, "isBookEpub"))
    {
      v5 = -[THBookViewController currentAbsolutePageIndexForBookmarks](self, "currentAbsolutePageIndexForBookmarks") == 0x7FFFFFFFFFFFFFFFLL;
LABEL_9:
      LOBYTE(v3) = !v5;
      return v3;
    }
    if ((objc_msgSend(-[THBookViewController currentPresentationType](self, "currentPresentationType"), "isPaginated") & 1) != 0|| (v3 = -[THReflowablePaginationController paginationComplete](-[THDocumentViewController reflowablePaginationController](-[THBookViewController documentViewController](self, "documentViewController"), "reflowablePaginationController"), "paginationComplete")))
    {
      v5 = -[THBookViewController currentPageInfoForBookmarks](self, "currentPageInfoForBookmarks") == 0;
      goto LABEL_9;
    }
  }
  return v3;
}

- (BOOL)isBookPortraitOnly
{
  return objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot"), "isPortraitOnlyBook");
}

- (BOOL)isBookEpub
{
  return -[THBookDescription isEpub](-[THBookViewController bookDescription](self, "bookDescription"), "isEpub");
}

- (id)cachedAnnotationForFetchedObject:(id)a3
{
  return objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot"), "annotationController"), "cachedAnnotationForFetchedObject:", a3);
}

- (void)denyBookmarkEdit
{
  -[THBookViewController p_alertUserAboutDenyingBookmarkEditing](self, "p_alertUserAboutDenyingBookmarkEditing");
}

- (void)showTOCGlossaryPopover:(id)a3
{
  THTOCGlossaryMenuPopoverViewController *v5;
  id v6;
  _QWORD v7[5];

  if (-[THBookViewController TOCGlossaryViewController](self, "TOCGlossaryViewController"))
  {
    -[THBookViewController dismissTOCGlossaryView:](self, "dismissTOCGlossaryView:", 1);
  }
  else
  {
    -[THBookViewController dismissActivePopover](self, "dismissActivePopover");
    if (objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot"), "glossaryController"), "model"), "entryCount"))
    {
      objc_msgSend(a3, "setEnabled:", 0);
      -[THToolbarDelegate userWillInteractInToolbar](-[THDocumentViewController toolbarDelegate](-[THBookViewController documentViewController](self, "documentViewController"), "toolbarDelegate"), "userWillInteractInToolbar");
      v5 = objc_alloc_init(THTOCGlossaryMenuPopoverViewController);
      if (-[THBookViewController isBookEpub](self, "isBookEpub"))
        -[THTOCGlossaryMenuPopoverViewController setTheme:](v5, "setTheme:", -[THBookViewController theme](self, "theme"));
      -[THTOCGlossaryMenuPopoverViewController setDelegate:](v5, "setDelegate:", self);
      -[THBookViewController setTOCGlossaryViewController:](self, "setTOCGlossaryViewController:", v5);
      -[THTOCGlossaryMenuPopoverViewController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 7);
      -[THTOCGlossaryMenuPopoverViewController setOverrideUserInterfaceStyle:](v5, "setOverrideUserInterfaceStyle:", -[THBookViewController overrideUserInterfaceStyle](self, "overrideUserInterfaceStyle"));
      v6 = -[THTOCGlossaryMenuPopoverViewController popoverPresentationController](v5, "popoverPresentationController");
      objc_msgSend(v6, "setBarButtonItem:", a3);
      objc_msgSend(v6, "setPermittedArrowDirections:", 1);
      objc_msgSend(v6, "setDelegate:", self);
      objc_msgSend(v6, "setPassthroughViews:", -[THBookViewController p_popoverPassthroughViews](self, "p_popoverPassthroughViews"));
      objc_msgSend(v6, "bc_applyTraitOverridesWithOverrideUserInterfaceStyleFromViewController:", v5);
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_82140;
      v7[3] = &unk_426DD0;
      v7[4] = a3;
      -[THBookViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, v7);

    }
    else
    {
      -[THBookViewController showTOC](self, "showTOC");
    }
  }
}

- (void)p_updateCenterTitle
{
  if (-[THBookViewController p_isTOCViewController:](self, "p_isTOCViewController:", -[THBookViewController visibleViewController](self, "visibleViewController")))
  {
    -[THBookViewController p_setCenterTitleForTOC](self, "p_setCenterTitleForTOC");
  }
  else if (-[THBookViewController isBookEpub](self, "isBookEpub"))
  {
    -[THBookViewController p_setCenterTitleToBookTitle](self, "p_setCenterTitleToBookTitle");
  }
  else
  {
    -[THBookViewController setCenterTitleForCurrentNavigationUnit](self, "setCenterTitleForCurrentNavigationUnit");
  }
}

- (void)setCenterTitle:(id)a3
{
  -[THNavigationBarController setCenterTitle:](-[THBookViewController navigationBarController](self, "navigationBarController"), "setCenterTitle:", a3);
}

- (void)p_setCenterTitleForTOC
{
  const __CFString *v3;

  if (-[THBookViewController shouldShowChapterTitle](self, "shouldShowChapterTitle"))
    v3 = (const __CFString *)objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Table of Contents"), &stru_43D7D8, 0);
  else
    v3 = &stru_43D7D8;
  -[THBookViewController setCenterTitle:](self, "setCenterTitle:", v3);
}

- (void)p_setCenterTitleForNavigationUnit:(id)a3
{
  const __CFString *v5;

  if (-[THBookViewController shouldShowChapterTitle](self, "shouldShowChapterTitle"))
    v5 = (const __CFString *)objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot"), "navigationModel"), "titleStringForNavigationUnit:", a3);
  else
    v5 = &stru_43D7D8;
  -[THBookViewController setCenterTitle:](self, "setCenterTitle:", v5);
}

- (void)setCenterTitleForCurrentNavigationUnit
{
  THDocumentViewController *v3;

  v3 = -[THBookViewController documentViewController](self, "documentViewController");
  if (-[THDocumentViewController currentNavigationUnit](v3, "currentNavigationUnit"))
    -[THBookViewController p_setCenterTitleForNavigationUnit:](self, "p_setCenterTitleForNavigationUnit:", -[THDocumentViewController currentNavigationUnit](v3, "currentNavigationUnit"));
}

- (void)p_setCenterTitleToBookTitle
{
  NSString *v3;
  const __CFString *v4;

  v3 = -[THBookDescription bookTitle](-[THBookViewController bookDescription](self, "bookDescription"), "bookTitle");
  if (v3)
    v4 = (const __CFString *)v3;
  else
    v4 = &stru_43D7D8;
  -[THBookViewController setCenterTitle:](self, "setCenterTitle:", v4);
}

- (void)hideNavigationHistory
{
  -[THBookViewController p_setNavigationOverlayHidden:animated:autoHides:](self, "p_setNavigationOverlayHidden:animated:autoHides:", 1, 1, 0);
}

- (void)pAutoHideNavOverlay
{
  -[THBookViewController p_setNavigationOverlayHidden:animated:autoHides:](self, "p_setNavigationOverlayHidden:animated:autoHides:", 1, 1, 0);
}

- (void)p_setNavigationOverlayHidden:(BOOL)a3 animated:(BOOL)a4 autoHides:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  THBookViewController *v8;
  UIViewController *v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  THBookspotHistoryStack *v12;

  v5 = a5;
  v6 = a4;
  v8 = self;
  v9 = -[THBookViewController visibleViewController](self, "visibleViewController");
  if (v9 == (UIViewController *)-[THBookViewController documentViewController](self, "documentViewController"))
    v10 = -[THDocumentViewController showingExpandedWidgetView](-[THBookViewController documentViewController](self, "documentViewController"), "showingExpandedWidgetView");
  else
    v10 = 0;
  if (-[THBookViewController isTOCVisible](self, "isTOCVisible")
    || (v10 & 1) != 0
    || -[THBookViewController isStudyViewControllerVisible](self, "isStudyViewControllerVisible")
    || -[THBookViewController isGlossaryPresenting](self, "isGlossaryPresenting")
    || -[THBookViewController isGlossaryVisible](self, "isGlossaryVisible")
    || (v11 = -[THBookViewController isNotesFullscreenVisible](self, "isNotesFullscreenVisible"), a3)
    || (v11 & 1) != 0)
  {
    -[THNavigationOverlayView setOverlayHidden:animated:](-[THBookViewController navigationOverlayView](self, "navigationOverlayView"), "setOverlayHidden:animated:", 1, v6);
  }
  else
  {
    -[THNavigationHistoryStepperController updateHistoryNavigation](-[THBookViewController navigationHistoryStepperController](self, "navigationHistoryStepperController"), "updateHistoryNavigation");
    v12 = -[THNavigationHistoryStepperController bookspotHistoryStack](-[THBookViewController navigationHistoryStepperController](self, "navigationHistoryStepperController"), "bookspotHistoryStack");
    if ((-[THBookspotHistoryStack hasPrevBookspot](v12, "hasPrevBookspot") & 1) != 0
      || (-[THBookspotHistoryStack hasNextBookspot](v12, "hasNextBookspot") & 1) != 0
      || objc_msgSend(objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "bookDescription"), "isEpub"))
    {
      -[THNavigationOverlayView setOverlayHidden:animated:](-[THBookViewController navigationOverlayView](self, "navigationOverlayView"), "setOverlayHidden:animated:", 0, v6);
      +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "pAutoHideNavOverlay", 0);
      if (v5)
        -[THBookViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "pAutoHideNavOverlay", 0, 4.0);
    }
  }
  -[THBookViewController updatePageNumberWidth](self, "updatePageNumberWidth");

}

- (BOOL)shouldAutohideNavigationBar
{
  return !-[THBookViewController p_isSearchVisible](self, "p_isSearchVisible")
      && !-[THBookViewController bookmarkViewController](self, "bookmarkViewController")
      && !-[THBookViewController TOCGlossaryViewController](self, "TOCGlossaryViewController")
      && !-[THBookViewController displaySettingsViewController](self, "displaySettingsViewController")
      && -[THBookViewController activityViewController](self, "activityViewController") == 0;
}

- (BOOL)shouldShowChapterTitle
{
  CGRect v4;

  if (!-[THBookViewController im_isCompactWidth](self, "im_isCompactWidth"))
    return 1;
  objc_msgSend(-[THBookViewController view](self, "view"), "bounds");
  return CGRectGetWidth(v4) >= kIMConfigurationSize_largePhone[1];
}

- (void)willSetNavigationBarHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;

  v4 = a4;
  v5 = a3;
  -[THBookViewController setSettingToolbarHidden:](self, "setSettingToolbarHidden:");
  -[THBookViewController refreshStatusBarAppearance](self, "refreshStatusBarAppearance");
  -[THBookViewController p_setNavigationOverlayHidden:animated:autoHides:](self, "p_setNavigationOverlayHidden:animated:autoHides:", v5, v4, 0);
}

- (void)settingNavigationBarHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v7;
  id v8;
  UIColor *v9;
  double v10;
  _QWORD v11[6];
  _QWORD v12[6];

  v4 = a4;
  v5 = a3;
  v7 = -[THBookViewController view](self, "view");
  v8 = objc_msgSend(-[THBookViewController p_selectedTocViewControllerCreateIfNecessary:](self, "p_selectedTocViewControllerCreateIfNecessary:", 0), "shroudOverlayView");
  v9 = -[THBookViewController viewBackgroundColor](self, "viewBackgroundColor");
  if (v4)
    v10 = 0.15;
  else
    v10 = 0.0;
  if (v7)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_82694;
    v12[3] = &unk_426E28;
    v12[4] = v7;
    v12[5] = v9;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v12, v10);
  }
  if (v8)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_8269C;
    v11[3] = &unk_426E28;
    v11[4] = v8;
    v11[5] = v9;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v11, v10);
  }
  -[THDocumentViewController settingToolbarHidden:animated:](-[THBookViewController documentViewController](self, "documentViewController"), "settingToolbarHidden:animated:", v5, v4);
}

- (void)didSetNavigationBarHidden:(BOOL)a3 animated:(BOOL)a4
{
  if (-[THDocumentViewController showingExpandedWidgetView](-[THBookViewController documentViewController](self, "documentViewController", a3, a4), "showingExpandedWidgetView"))
  {
    objc_msgSend(-[THBookViewController view](self, "view"), "bringSubviewToFront:", -[THWExpandedViewController view](-[THDocumentViewController expandedViewController](-[THBookViewController documentViewController](self, "documentViewController"), "expandedViewController"), "view"));
  }
  -[THDocumentViewController setNeedsStatusBarAppearanceUpdate](-[THBookViewController documentViewController](self, "documentViewController"), "setNeedsStatusBarAppearanceUpdate");
  -[THDocumentViewController setNeedsUpdateOfHomeIndicatorAutoHidden](-[THBookViewController documentViewController](self, "documentViewController"), "setNeedsUpdateOfHomeIndicatorAutoHidden");
}

- (void)userWillInteractInToolbar
{
  -[THNavigationBarController resetAutohideTimer](-[THBookViewController navigationBarController](self, "navigationBarController"), "resetAutohideTimer");
}

- (void)showToolbarAnimated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[THBookViewController userWillInteractInToolbar](self, "userWillInteractInToolbar");
  -[THNavigationBarController setNavigationBarHidden:animated:](-[THBookViewController navigationBarController](self, "navigationBarController"), "setNavigationBarHidden:animated:", 0, v3);
}

- (void)hideToolbarAnimated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[THBookViewController dismissActivePopoverIsTransitioning:](self, "dismissActivePopoverIsTransitioning:", 0);
  -[THNavigationBarController setNavigationBarHidden:animated:](-[THBookViewController navigationBarController](self, "navigationBarController"), "setNavigationBarHidden:animated:", 1, v3);
}

- (BOOL)isToolbarHidden
{
  return -[BCNavigationBar isHidden](-[THNavigationBarController navigationBar](-[THBookViewController navigationBarController](self, "navigationBarController"), "navigationBar"), "isHidden");
}

- (void)updateBookmarkButton
{
  unsigned int v3;
  char v4;
  const __CFString *v5;
  uint64_t v6;
  double v7;
  char v8;
  double v9;
  _QWORD v10[5];
  char v11;

  v3 = -[THBookViewController isPageBookmarked](self, "isPageBookmarked");
  v4 = v3;
  if (v3)
    v5 = CFSTR("bookmark.fill");
  else
    v5 = CFSTR("bookmark");
  if (-[BCNavigationBar isMinibar](-[THNavigationBarController navigationBar](-[THBookViewController navigationBarController](self, "navigationBarController"), "navigationBar"), "isMinibar"))v6 = 2;
  else
    v6 = 3;
  -[UIButton setImage:forState:](-[THBookViewController bookmarkButton](self, "bookmarkButton"), "setImage:forState:", -[UIImage imageWithConfiguration:](+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v5), "imageWithConfiguration:", +[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 5, v6, 17.0)), 0);
  if ((v4 & 1) != 0)
  {
    -[UIButton setTintColor:](-[THBookViewController bookmarkButton](self, "bookmarkButton"), "setTintColor:", +[UIColor systemRedColor](UIColor, "systemRedColor"));
    -[UIButton setImage:forState:](-[THBookViewController actionlessBookmarkButton](self, "actionlessBookmarkButton"), "setImage:forState:", -[UIImage imageWithRenderingMode:](-[UIImage imageWithConfiguration:](+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("bookmark.fill")), "imageWithConfiguration:", +[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 5, v6, 17.0)), "imageWithRenderingMode:", 2), 0);
    if (objc_msgSend(-[THBookViewController currentPresentationType](self, "currentPresentationType"), "isPaginated"))
    {
      -[UIButton alpha](-[THBookViewController actionlessBookmarkButton](self, "actionlessBookmarkButton"), "alpha");
      if (v7 != 0.0)
        goto LABEL_15;
      v8 = 1;
      goto LABEL_14;
    }
  }
  else
  {
    -[UIButton setTintColor:](-[THBookViewController bookmarkButton](self, "bookmarkButton"), "setTintColor:", 0);
    -[UIButton setImage:forState:](-[THBookViewController actionlessBookmarkButton](self, "actionlessBookmarkButton"), "setImage:forState:", -[UIImage imageWithRenderingMode:](-[UIImage imageWithConfiguration:](+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("bookmark.fill")), "imageWithConfiguration:", +[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 5, v6, 17.0)), "imageWithRenderingMode:", 2), 0);
  }
  -[UIButton alpha](-[THBookViewController actionlessBookmarkButton](self, "actionlessBookmarkButton"), "alpha");
  if (v9 != 1.0)
    goto LABEL_15;
  v8 = 0;
LABEL_14:
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_82A10;
  v10[3] = &unk_427268;
  v10[4] = self;
  v11 = v8;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v10, 0, 0.2);
LABEL_15:
  if (-[THBookViewController p_isPageLocationApplicable](self, "p_isPageLocationApplicable"))
    objc_msgSend(-[THDocumentViewController interactiveCanvasController](-[THBookViewController documentViewController](self, "documentViewController"), "interactiveCanvasController"), "updateBookmarkStatusAnimated:", 1);
}

- (void)showSearchPopover
{
  -[THBookViewController showSearchPopoverWithText:](self, "showSearchPopoverWithText:", 0);
}

- (void)showSearchPopoverWithText:(id)a3
{
  THNavigationBarController *v5;
  uint64_t v6;
  uint64_t v7;

  -[THBookViewController userWillInteractInToolbar](self, "userWillInteractInToolbar", _NSConcreteStackBlock, 3221225472, sub_82B40, &unk_426E28, self, a3);
  if (!-[THBookViewController isToolbarHidden](self, "isToolbarHidden")
    || (-[THBookViewController im_isCompactWidth](self, "im_isCompactWidth") & 1) != 0
    || (-[THBookViewController im_isCompactHeight](self, "im_isCompactHeight") & 1) != 0)
  {
    if (-[THBookViewController isToolbarHidden](self, "isToolbarHidden")
      || !-[THBookViewController im_isCompactWidth](self, "im_isCompactWidth")
      || UIAccessibilityIsVoiceOverRunning())
    {
      -[THBookViewController showSearchPopoverFromBarButtonItem:withText:](self, "showSearchPopoverFromBarButtonItem:withText:", -[THBookViewController searchButtonItem](self, "searchButtonItem"), a3);
      return;
    }
    v5 = -[THBookViewController navigationBarController](self, "navigationBarController");
    v6 = 1;
  }
  else
  {
    v5 = -[THBookViewController navigationBarController](self, "navigationBarController");
    v6 = 0;
  }
  -[THNavigationBarController setNavigationBarHidden:animated:completion:](v5, "setNavigationBarHidden:animated:completion:", v6, 1, &v7);
}

- (double)toolbarHeight
{
  double result;

  objc_msgSend(-[THNavigationBarController view](-[THBookViewController navigationBarController](self, "navigationBarController"), "view"), "frameHeight");
  return result;
}

- (BOOL)useWhiteTheme
{
  UIViewController *v3;

  v3 = -[THBookViewController visibleViewController](self, "visibleViewController");
  if (v3 == (UIViewController *)-[THBookViewController documentViewController](self, "documentViewController"))
    return -[THBookViewController isBookEpub](self, "isBookEpub");
  else
    return 0;
}

- (void)textForPagesLeftInChapterDidChangeTo:(id)a3
{
  const __CFString *v3;

  if (a3)
    v3 = (const __CFString *)a3;
  else
    v3 = &stru_43D7D8;
  -[THNavigationOverlayView setAlternativeNextCaption:](-[THBookViewController navigationOverlayView](self, "navigationOverlayView"), "setAlternativeNextCaption:", v3);
}

- (void)setToolbarHiddenFromAccessibility:(BOOL)a3
{
  -[BCNavigationBar setAccessibilityElementsHidden:](-[THNavigationBarController navigationBar](-[THBookViewController navigationBarController](self, "navigationBarController"), "navigationBar"), "setAccessibilityElementsHidden:", a3);
}

- (double)topBarHeight
{
  double v2;

  objc_msgSend(objc_msgSend(-[THBookViewController navigationController](self, "navigationController"), "navigationBar"), "intrinsicContentSize");
  return v2;
}

- (double)bottomBarHeight
{
  double result;

  -[THBookViewController topBarHeight](self, "topBarHeight");
  return result;
}

- (BOOL)isScrubberDisabled
{
  return 0;
}

- (id)foregroundTintColorForNavigationBar:(id)a3
{
  if (-[THNavigationBarController navigationBar](-[THBookViewController navigationBarController](self, "navigationBarController"), "navigationBar") == a3)return -[THTheme foregroundTintColorForNavigationBar:](-[THBookViewController theme](self, "theme"), "foregroundTintColorForNavigationBar:", a3);
  else
    return 0;
}

- (id)backgroundColorForNavigationBar:(id)a3
{
  return -[THTheme backgroundColorForNavigationBar:](-[THBookViewController theme](self, "theme"), "backgroundColorForNavigationBar:", a3);
}

- (id)titleColorForNavigationBar:(id)a3
{
  return -[THTheme titleColorForNavigationBar:](-[THBookViewController theme](self, "theme"), "titleColorForNavigationBar:", a3);
}

- (BOOL)navigationBarIsTranslucent:(id)a3
{
  return -[THTheme navigationBarIsTranslucent:](-[THBookViewController theme](self, "theme"), "navigationBarIsTranslucent:", a3);
}

- (id)storeURLForHTMLGenerator:(id)a3
{
  return objc_msgSend(objc_msgSend(+[AEAssetEngine storeMgr](AEAssetEngine, "storeMgr", a3), "clientApplicationController"), "bookUrlForStoreId:", objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "storeItemID"));
}

- (id)tellAFriendBaseURLForHTMLGenerator:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = objc_msgSend(+[AEAssetEngine storeMgr](AEAssetEngine, "storeMgr", a3), "clientApplicationController");
  v5 = objc_opt_class(NSURL, v4);
  return (id)BUDynamicCast(v5, objc_msgSend(v3, "tellAFriendEmailBodyURLBase"));
}

- (int64_t)appearanceStyle
{
  NSUserDefaults *v2;
  int64_t result;

  if (!-[THBookViewController isBookEpub](self, "isBookEpub"))
    return 4;
  v2 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
  result = -[NSUserDefaults integerForKey:](v2, "integerForKey:", qword_5431A8);
  if ((unint64_t)result >= 4)
    return 0;
  return result;
}

- (void)setAppearanceStyle:(int64_t)a3
{
  NSUserDefaults *v5;
  NSUserDefaults *v6;

  if (-[THBookViewController isBookEpub](self, "isBookEpub")
    && -[THBookViewController appearanceStyle](self, "appearanceStyle") != a3)
  {
    if (a3 != 0x7FFFFFFFFFFFFFFFLL && a3)
    {
      v6 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
      -[NSUserDefaults setInteger:forKey:](v6, "setInteger:forKey:", a3, qword_5431A8);
    }
    else
    {
      v5 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
      -[NSUserDefaults removeObjectForKey:](v5, "removeObjectForKey:", qword_5431A8);
    }
    if (a3 != 3)
      self->_styleBeforeAutoNight = -[THBookViewController appearanceStyle](self, "appearanceStyle");
    -[BCNavigationBar setOverrideUserInterfaceStyle:](-[THNavigationBarController navigationBar](-[THBookViewController navigationBarController](self, "navigationBarController"), "navigationBar"), "setOverrideUserInterfaceStyle:", -[THBookViewController overrideUserInterfaceStyle](self, "overrideUserInterfaceStyle"));
    if (-[THDisplaySettingsViewController appearanceStyle](self->mDisplaySettingsViewController, "appearanceStyle") != a3)
    {
      -[THDisplaySettingsViewController setAppearanceStyle:](self->mDisplaySettingsViewController, "setAppearanceStyle:", a3);
      -[THDisplaySettingsViewController setAutoNightModeSwitch:](self->mDisplaySettingsViewController, "setAutoNightModeSwitch:", 1);
    }
  }
}

- (void)applyAppearanceStyle:(int64_t)a3
{
  _QWORD v5[5];

  -[THBookViewController setTheme:](self, "setTheme:", -[THBookViewController themeForStyle:](self, "themeForStyle:"));
  -[THBookViewController setAppearanceStyle:](self, "setAppearanceStyle:", a3);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_82F74;
  v5[3] = &unk_426DD0;
  v5[4] = self;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v5, &stru_428580, 0.1);
}

- (id)themeForStyle:(int64_t)a3
{
  return objc_msgSend(+[THBookViewController themeMap](THBookViewController, "themeMap"), "objectForKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3));
}

- (void)coordinator:(id)a3 observer:(id)a4 didChangeLayout:(unint64_t)a5
{
  if (-[THBookViewController shouldShowFlowModeSwitch:](self, "shouldShowFlowModeSwitch:", -[THBookViewController displaySettingsViewController](self, "displaySettingsViewController", a3, a4, a5)))
  {
    -[THBookViewController displaySettingsControllerDidChangeFlowMode:notifyingCoordinator:](self, "displaySettingsControllerDidChangeFlowMode:notifyingCoordinator:", -[THBookViewController displaySettingsViewController](self, "displaySettingsViewController"), 0);
  }
}

- (void)coordinator:(id)a3 observer:(id)a4 didChangeStyle:(unint64_t)a5
{
  -[THBookViewController displaySettingsController:didChangeStyle:](self, "displaySettingsController:didChangeStyle:", -[THBookViewController displaySettingsViewController](self, "displaySettingsViewController", a3, a4), a5);
}

- (void)coordinator:(id)a3 observerDidIncreaseFontSize:(id)a4
{
  if (!-[THBookViewController displaySettingsViewController](self, "displaySettingsViewController", a3, a4))
    -[THBookViewController displaySettingsControllerDidChangeFontSize:toFlowSizeScale:](self, "displaySettingsControllerDidChangeFontSize:toFlowSizeScale:", -[THBookViewController displaySettingsViewController](self, "displaySettingsViewController"), objc_msgSend(+[THApplicationSettings sharedSettings](THApplicationSettings, "sharedSettings"), "flowSizeScale"));
}

- (void)coordinator:(id)a3 observerDidDecreaseFontSize:(id)a4
{
  if (!-[THBookViewController displaySettingsViewController](self, "displaySettingsViewController", a3, a4))
    -[THBookViewController displaySettingsControllerDidChangeFontSize:toFlowSizeScale:](self, "displaySettingsControllerDidChangeFontSize:toFlowSizeScale:", -[THBookViewController displaySettingsViewController](self, "displaySettingsViewController"), objc_msgSend(+[THApplicationSettings sharedSettings](THApplicationSettings, "sharedSettings"), "flowSizeScale"));
}

- (void)_accessibilityInvertColorsStatusDidChange:(id)a3
{
  _BOOL4 IsInvertColorsEnabled;

  IsInvertColorsEnabled = UIAccessibilityIsInvertColorsEnabled();
  if (self->_smartInvertEnabled != IsInvertColorsEnabled)
  {
    self->_smartInvertEnabled = IsInvertColorsEnabled;
    -[THBookViewController setTheme:](self, "setTheme:", -[THBookViewController themeForStyle:](self, "themeForStyle:", -[THBookViewController appearanceStyle](self, "appearanceStyle")));
    -[THBookViewController p_updateFromTheme:](self, "p_updateFromTheme:", 1);
  }
}

- (void)dismissActivePopoverIsTransitioning:(BOOL)a3
{
  if (!a3)
  {
    -[THBookViewController dismissBookmarkMenu:completion:](self, "dismissBookmarkMenu:completion:", 0, 0);
    -[THBookViewController dismissTOCGlossaryView:](self, "dismissTOCGlossaryView:", 0);
    -[THBookViewController dismissDisplaySettings:](self, "dismissDisplaySettings:", 0);
    -[THBookViewController dismissSearchPopover:completion:](self, "dismissSearchPopover:completion:", 0, 0);
    -[THBookViewController dismissSharePopover:](self, "dismissSharePopover:", 0);
  }
  +[THWPHighlightController dismissActivePopoverEditor](THWPHighlightController, "dismissActivePopoverEditor");
}

- (void)dismissActivePopover
{
  -[THBookViewController dismissActivePopoverIsTransitioning:](self, "dismissActivePopoverIsTransitioning:", 0);
}

- (THDocumentNavigator)documentNavigator
{
  return -[THDocumentViewController documentNavigator](-[THBookViewController documentViewController](self, "documentViewController"), "documentNavigator");
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  -[THBookViewController updateViewBackgroundColor](self, "updateViewBackgroundColor", a3);
  if ((!-[THBookDescription isEpub](self->mBookDescription, "isEpub")
     || -[THTheme isNight:](-[THBookViewController theme](self, "theme"), "isNight:", self))
    && (objc_msgSend(-[THBookViewController traitCollection](self, "traitCollection"), "bc_knownPropertiesEqual:", a4) & 1) == 0)
  {
    -[THBookViewController p_updateFromTheme:](self, "p_updateFromTheme:", 1);
    -[THBookViewController settingNavigationBarHidden:animated:](self, "settingNavigationBarHidden:animated:", -[THBookViewController settingToolbarHidden](self, "settingToolbarHidden"), 0);
  }
  -[THBookViewController p_updateCenterTitle](self, "p_updateCenterTitle");
  -[THBookViewController p_updateToolbarButtonStatesWithTraits:](self, "p_updateToolbarButtonStatesWithTraits:", -[THBookViewController traitCollection](self, "traitCollection"));
}

- (void)showHUDForVendor:(id)a3
{
  UIView *v5;
  UIView *v6;
  UIView *v7;
  double v8;
  _QWORD v9[6];
  _QWORD v10[5];

  v5 = (UIView *)objc_msgSend(a3, "viewForHUD");
  if (v5)
  {
    v6 = v5;
    if (-[THBookViewController HUDOverlayView](self, "HUDOverlayView") != v5)
    {
      v7 = -[THBookViewController HUDOverlayView](self, "HUDOverlayView");
      -[THBookViewController setHUDVendor:](self, "setHUDVendor:", a3);
      -[THBookViewController setHUDOverlayView:](self, "setHUDOverlayView:", v6);
      v8 = 0.0;
      -[UIView setAlpha:](-[THBookViewController HUDOverlayView](self, "HUDOverlayView"), "setAlpha:", 0.0);
      objc_msgSend(-[THBookViewController view](self, "view"), "addSubview:", -[THBookViewController HUDOverlayView](self, "HUDOverlayView"));
      if (-[THBookViewController navigationOverlayView](self, "navigationOverlayView"))
      {
        if (-[THNavigationOverlayView superview](-[THBookViewController navigationOverlayView](self, "navigationOverlayView"), "superview"))
        {
          v8 = 0.2;
        }
        else
        {
          v8 = 0.0;
        }
      }
      v9[5] = v6;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_833CC;
      v10[3] = &unk_426DD0;
      v10[4] = self;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_83400;
      v9[3] = &unk_4285A8;
      v9[4] = v7;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v10, v9, v8);
    }
  }
}

- (void)hideHUDForVendor:(id)a3
{
  if (-[THBookViewController HUDVendor](self, "HUDVendor") == a3)
    -[THBookViewController p_hideHUDView](self, "p_hideHUDView");
}

- (void)temporarilySetHUDViewHidden:(BOOL)a3
{
  -[UIView setAlpha:](-[THBookViewController HUDOverlayView](self, "HUDOverlayView"), "setAlpha:", (double)!a3);
}

- (void)p_hideHUDView
{
  UIView *v3;
  UIView *v4;
  _QWORD v5[6];
  _QWORD v6[5];

  if (-[THBookViewController HUDOverlayView](self, "HUDOverlayView"))
  {
    v3 = -[THBookViewController HUDOverlayView](self, "HUDOverlayView");
    -[THBookViewController setHUDOverlayView:](self, "setHUDOverlayView:", 0);
    -[THBookViewController setHUDVendor:](self, "setHUDVendor:", 0);
    v4 = -[UIView superview](v3, "superview");
    if (v4 == -[THBookViewController viewIfLoaded](self, "viewIfLoaded"))
    {
      v5[5] = self;
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_8362C;
      v6[3] = &unk_426DD0;
      v6[4] = v3;
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_83638;
      v5[3] = &unk_4285A8;
      v5[4] = v3;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v6, v5, 0.2);
    }
  }
}

- (CGRect)frameForHUDFromVendor:(id)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect result;

  objc_msgSend(-[THBookViewController view](self, "view", a3), "bounds");
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  v7 = CGRectGetMaxX(v13) + -40.0;
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  v8 = CGRectGetMinX(v14) + 20.0;
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v9 = CGRectGetMaxY(v15) + -30.0 + -20.0;
  v10 = 30.0;
  v11 = v8;
  v12 = v7;
  result.size.height = v10;
  result.size.width = v12;
  result.origin.y = v9;
  result.origin.x = v11;
  return result;
}

- (void)bookOpenTransitionDidEnd
{
  UIAlertController *v3;
  _QWORD v4[5];

  if (-[THBookViewController bookOpenFailed](self, "bookOpenFailed"))
  {
    v3 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Unable to open book."), &stru_43D7D8, 0), 0, 1);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_838A8;
    v4[3] = &unk_427300;
    v4[4] = self;
    -[UIAlertController addAction:](v3, "addAction:", +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("OK"), &stru_43D7D8, 0), 1, v4));
    -[THBookViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);
  }
}

- (id)transitionContentView
{
  UIViewController *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = -[THBookViewController visibleViewController](self, "visibleViewController");
  v5 = objc_opt_class(UIViewController, v4);
  v6 = (void *)TSUClassAndProtocolCast(v3, v5, 1);
  if (v6)
    return objc_msgSend(v6, "transitionContentView");
  else
    return -[UIViewController contentScrollView](-[THBookViewController visibleViewController](self, "visibleViewController", &OBJC_PROTOCOL___BKBookOpenTransitioning), "contentScrollView");
}

- (id)transitionContentBackgroundColor
{
  UIViewController *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = -[THBookViewController visibleViewController](self, "visibleViewController");
  v5 = objc_opt_class(UIViewController, v4);
  v6 = (void *)TSUClassAndProtocolCast(v3, v5, 1);
  if ((objc_opt_respondsToSelector(v6, "transitionContentBackgroundColor") & 1) != 0)
    return objc_msgSend(v6, "transitionContentBackgroundColor");
  else
    return -[THBookViewController viewBackgroundColor](self, "viewBackgroundColor");
}

- (BOOL)shouldAutorotate
{
  THWExpandedViewController *v4;

  if (-[THBookViewController disallowRotate](self, "disallowRotate")
    || +[THWFreeTransformController isFreeTransformInProgress](THWFreeTransformController, "isFreeTransformInProgress"))
  {
    return 0;
  }
  if (-[THDocumentViewController showingExpandedWidgetView](-[THBookViewController documentViewController](self, "documentViewController"), "showingExpandedWidgetView"))
  {
    v4 = -[THDocumentViewController expandedViewController](-[THBookViewController documentViewController](self, "documentViewController"), "expandedViewController");
    return -[THWExpandedViewController shouldAutorotate](v4, "shouldAutorotate");
  }
  if (-[THBookViewController visibleViewController](self, "visibleViewController"))
  {
    v4 = -[THBookViewController visibleViewController](self, "visibleViewController");
    return -[THWExpandedViewController shouldAutorotate](v4, "shouldAutorotate");
  }
  return 1;
}

- (void)p_addViewControllerInFront:(id)a3 reason:(id)a4
{
  UIViewController *v7;
  THBookViewController *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  if (-[THBookViewController visibleViewController](self, "visibleViewController") != a3)
  {
    objc_msgSend(a3, "beginAppearanceTransition:animated:", 1, 0);
    if (-[THBookViewController visibleViewController](self, "visibleViewController"))
    {
      v7 = -[THBookViewController visibleViewController](self, "visibleViewController");
      if (v7 == (UIViewController *)-[THBookViewController studyViewController](self, "studyViewController"))
        -[THBookViewController p_unloadStudyViewController](self, "p_unloadStudyViewController");
    }
    v8 = (THBookViewController *)objc_msgSend(a3, "parentViewController");
    if (v8 != self)
      -[THBookViewController addChildViewController:](self, "addChildViewController:", a3);
    objc_msgSend(-[THBookViewController view](self, "view"), "bounds");
    objc_msgSend(objc_msgSend(a3, "view"), "setFrame:", v9, v10, v11, v12);
    objc_msgSend(-[THBookViewController view](self, "view"), "insertSubview:belowSubview:", objc_msgSend(a3, "view"), -[THNavigationBarController view](-[THBookViewController navigationBarController](self, "navigationBarController"), "view"));
    if (v8 != self)
      objc_msgSend(a3, "didMoveToParentViewController:", self);
    objc_msgSend(a3, "endAppearanceTransition");
    -[THBookViewController p_setVisibleViewControllerToViewController:reason:](self, "p_setVisibleViewControllerToViewController:reason:", a3, a4);
  }
}

- (void)p_addViewControllerInBack:(id)a3
{
  -[THBookViewController p_addViewControllerInBack:animated:](self, "p_addViewControllerInBack:animated:", a3, 0);
}

- (void)p_addViewControllerInBack:(id)a3 animated:(BOOL)a4
{
  THBookViewController *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  objc_msgSend(a3, "beginAppearanceTransition:animated:", 1, 0);
  if (-[THBookViewController visibleViewController](self, "visibleViewController") == a3)
    -[THBookViewController setVisibleViewController:](self, "setVisibleViewController:", 0);
  v6 = (THBookViewController *)objc_msgSend(a3, "parentViewController");
  if (v6 == self)
    -[THBookViewController addChildViewController:](self, "addChildViewController:", a3);
  objc_msgSend(-[THBookViewController view](self, "view"), "bounds");
  objc_msgSend(objc_msgSend(a3, "view"), "setFrame:", v7, v8, v9, v10);
  objc_msgSend(-[THBookViewController view](self, "view"), "insertSubviewAtBack:", objc_msgSend(a3, "view"));
  if (v6 == self)
    objc_msgSend(a3, "didMoveToParentViewController:", self);
  objc_msgSend(a3, "endAppearanceTransition");
}

- (void)p_removeViewController:(id)a3
{
  id v5;

  if (objc_msgSend(a3, "isViewLoaded"))
  {
    v5 = objc_msgSend(objc_msgSend(a3, "view"), "superview");
    if (v5 == -[THBookViewController viewIfLoaded](self, "viewIfLoaded"))
    {
      objc_msgSend(a3, "beginAppearanceTransition:animated:", 0, 0);
      if (-[THBookViewController visibleViewController](self, "visibleViewController") == a3)
        -[THBookViewController setVisibleViewController:](self, "setVisibleViewController:", 0);
      objc_msgSend(objc_msgSend(a3, "view"), "removeFromSuperview");
      if (-[THBookViewController documentViewController](self, "documentViewController") == a3)
        -[THBookViewController p_hideHUDView](self, "p_hideHUDView");
      objc_msgSend(a3, "endAppearanceTransition");
    }
  }
}

- (void)bookView:(id)a3 didMoveToWindow:(id)a4
{
  if (a4)
  {
    if (self->mBookOpener)
      -[THBookViewController p_finishBookLoadIfReady](self, "p_finishBookLoadIfReady", a3);
  }
}

- (void)readingStatisticsCollector:(id)a3 didShowContentWithCFIs:(id)a4
{
  if (-[THBookViewController readingStatisticsCollector](self, "readingStatisticsCollector") == a3)
    -[AEAssetViewControllerDelegate assetViewController:didShowContentWithCFIs:](-[THBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"), "assetViewController:didShowContentWithCFIs:", self, a4);
}

- (void)readingStatisticsCollector:(id)a3 willHideContentWithCFIs:(id)a4
{
  if (-[THBookViewController readingStatisticsCollector](self, "readingStatisticsCollector") == a3)
    -[AEAssetViewControllerDelegate assetViewController:willHideContentWithCFIs:](-[THBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"), "assetViewController:willHideContentWithCFIs:", self, a4);
}

- (BOOL)readingStatisticsCollector:(id)a3 needTextNodeCharacterCountsForOrdinal:(int64_t)a4
{
  if (-[THBookViewController readingStatisticsCollector](self, "readingStatisticsCollector") == a3)
    return -[AEAssetViewControllerDelegate needTextNodeCharacterCountsForOrdinal:](-[THBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"), "needTextNodeCharacterCountsForOrdinal:", a4);
  else
    return 0;
}

- (void)readingStatisticsCollector:(id)a3 addTextNodeCharacterCounts:(id)a4 ordinal:(int64_t)a5 completion:(id)a6
{
  if (-[THBookViewController readingStatisticsCollector](self, "readingStatisticsCollector") == a3)
    -[AEAssetViewControllerDelegate addTextNodeCharacterCounts:ordinal:completion:](-[THBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"), "addTextNodeCharacterCounts:ordinal:completion:", a4, a5, a6);
}

- (BOOL)readingStatisticsCollector:(id)a3 needTOCEntriesForOrdinal:(int64_t)a4
{
  if (-[THBookViewController readingStatisticsCollector](self, "readingStatisticsCollector") == a3)
    return -[AEAssetViewControllerDelegate needTOCEntriesForOrdinal:](-[THBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"), "needTOCEntriesForOrdinal:", a4);
  else
    return 0;
}

- (void)readingStatisticsCollector:(id)a3 addTOCEntries:(id)a4 ordinal:(int64_t)a5 completion:(id)a6
{
  if (-[THBookViewController readingStatisticsCollector](self, "readingStatisticsCollector") == a3)
    -[AEAssetViewControllerDelegate addTOCEntries:ordinal:completion:](-[THBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"), "addTOCEntries:ordinal:completion:", a4, a5, a6);
}

- (void)documentViewController:(id)a3 bodyReps:(id)a4 visibleRectIs:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  if (-[THBookViewController documentViewController](self, "documentViewController") == a3)
    -[THReadingStatisticsCollector bodyReps:visibleRectIs:](-[THBookViewController readingStatisticsCollector](self, "readingStatisticsCollector"), "bodyReps:visibleRectIs:", a4, x, y, width, height);
}

- (void)_checkIfScanningReadingStatisticsCanBegin
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (-[THBookViewController bookLoadedSuccessfully](self, "bookLoadedSuccessfully")
    && -[THBookViewController readingStatisticsControllerLoaded](self, "readingStatisticsControllerLoaded")
    && !-[THBookViewController startedScanningReadingStatistics](self, "startedScanningReadingStatistics"))
  {
    -[THBookViewController setStartedScanningReadingStatistics:](self, "setStartedScanningReadingStatistics:", 1);
    -[THReadingStatisticsCollector scanReadingStatisticsWithDocumentRoot:](-[THBookViewController readingStatisticsCollector](self, "readingStatisticsCollector"), "scanReadingStatisticsWithDocumentRoot:", -[THBookViewController documentRoot](self, "documentRoot"));
  }
}

- (id)contentSubType
{
  return +[BAContentSubType rmt](BAContentSubType, "rmt");
}

- (void)bc_analyticsVisibilityDidAppear
{
  _QWORD v3[5];

  if (-[THBookViewController analyticsReadStartDate](self, "analyticsReadStartDate"))
  {

    -[THBookViewController setAnalyticsReadStartDate:](self, "setAnalyticsReadStartDate:", 0);
  }
  -[THBookViewController setAnalyticsReadStartDate:](self, "setAnalyticsReadStartDate:", +[NSDate date](NSDate, "date"));
  -[THBookViewController setAnalyticsReadStartProgress:](self, "setAnalyticsReadStartProgress:", -[THBookViewController _analyticsReadingProgress](self, "_analyticsReadingProgress"));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_8415C;
  v3[3] = &unk_427130;
  v3[4] = self;
  +[BADoNotDisturbHelper fetchCurrentState:](BADoNotDisturbHelper, "fetchCurrentState:", v3);
}

- (void)bc_analyticsVisibilityWillDisappear
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  double v9;
  _QWORD v10[12];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  NSDate *v16;
  _QWORD v17[5];
  id v18;

  v3 = -[THBookViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker");
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3052000000;
  v17[3] = sub_7D8C8;
  v17[4] = sub_7D8D8;
  v18 = 0;
  v18 = objc_msgSend(v3, "newSessionAssertion");
  v4 = -[THBookViewController contentData](self, "contentData");
  v5 = -[THBookViewController _analyticsContentSettingsData](self, "_analyticsContentSettingsData");
  v6 = -[THBookViewController _analyticsReadingSettingsData](self, "_analyticsReadingSettingsData");
  v7 = -[THBookViewController readingSessionData](self, "readingSessionData");
  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = sub_7D8C8;
  v15 = sub_7D8D8;
  v16 = 0;
  v16 = -[THBookViewController analyticsReadStartDate](self, "analyticsReadStartDate");
  v8 = (id)v12[5];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_84348;
  v10[3] = &unk_4285F0;
  v10[4] = v3;
  v10[5] = self;
  v10[6] = v7;
  v10[7] = v4;
  v10[8] = v6;
  v10[9] = v5;
  v10[10] = &v11;
  v10[11] = v17;
  +[BADoNotDisturbHelper fetchCurrentState:](BADoNotDisturbHelper, "fetchCurrentState:", v10);
  -[NSDate timeIntervalSinceNow](-[THBookViewController analyticsReadStartDate](self, "analyticsReadStartDate"), "timeIntervalSinceNow");
  objc_msgSend(-[THBookViewController _analyticsSessionHost](self, "_analyticsSessionHost"), "readSessionDidEnd:readTime:", -[AEAsset assetID](-[THBookViewController asset](self, "asset"), "assetID"), -v9);
  -[THBookViewController setAnalyticsReadStartDate:](self, "setAnalyticsReadStartDate:", 0);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(v17, 8);
}

- (void)emitReadingOrientationChangeEventIfNeeded
{
  void *v3;

  if ((char *)-[UIDevice orientation](+[UIDevice currentDevice](UIDevice, "currentDevice"), "orientation")- 3 >= (_BYTE *)&dword_0 + 2)v3 = &dword_0 + 1;
  else
    v3 = &dword_0 + 2;
  if ((void *)-[THBookViewController lastAnalyticsDeviceOrientationReported](self, "lastAnalyticsDeviceOrientationReported") != v3)
  {
    objc_msgSend(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"), "emitReadingOrientationChangeEventWithTracker:readingSessionData:contentData:", -[THBookViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"), -[THBookViewController readingSessionDataForSearchViewController:](self, "readingSessionDataForSearchViewController:", 0), -[THBookViewController contentDataForSearchViewController:](self, "contentDataForSearchViewController:", 0));
    -[THBookViewController setLastAnalyticsDeviceOrientationReported:](self, "setLastAnalyticsDeviceOrientationReported:", v3);
  }
}

- (id)readingSessionData
{
  return objc_msgSend(objc_alloc((Class)BAReadingSessionData), "initWithPercentCompletionStart:percentCompletionEnd:isFreeSample:deviceOrientation:", -[THBookViewController analyticsReadStartProgress](self, "analyticsReadStartProgress"), -[THBookViewController _analyticsReadingProgress](self, "_analyticsReadingProgress"), +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[THBookViewController p_isSampleBook](self, "p_isSampleBook")), -[THBookViewController lastAnalyticsDeviceOrientationReported](self, "lastAnalyticsDeviceOrientationReported"));
}

- (id)contentData
{
  return -[AEAssetViewControllerDelegate analyticsContentDataForAssetViewController:contentSubType:tracker:](-[THBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"), "analyticsContentDataForAssetViewController:contentSubType:tracker:", self, -[THBookViewController contentSubType](self, "contentSubType"), -[THBookViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
}

- (BOOL)_inAnalyticsReadSession
{
  return -[THBookViewController analyticsReadStartDate](self, "analyticsReadStartDate") != 0;
}

- (id)_analyticsReadingProgress
{
  if (-[THBookViewController p_isSampleBook](self, "p_isSampleBook"))
    return -[THDocumentNavigator readingProgressAllowSample:](-[THBookViewController documentNavigator](self, "documentNavigator"), "readingProgressAllowSample:", 1);
  else
    return objc_msgSend(objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "annotationController"), "readingProgress");
}

- (id)_analyticsSessionHost
{
  return objc_msgSend(-[THBookViewController im_ancestorViewControllerConformingToProtocol:](self, "im_ancestorViewControllerConformingToProtocol:", &OBJC_PROTOCOL___BASessionHostProviding), "analyticsSessionHost");
}

- (BOOL)bc_analyticsVisibilityOfSelf
{
  return -[THBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate") != 0;
}

- (BOOL)bc_analyticsVisibilityIsObscuredWhenPresented
{
  return 1;
}

- (id)_analyticsContentSettingsData
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot"), "annotationController");
  v3 = objc_msgSend(v2, "numberOfBookmarks");
  v4 = objc_msgSend(v2, "allAnnotations");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "annotationType") == 2)
        {
          if (objc_msgSend(v11, "annotationNote"))
            ++v8;
          else
            ++v7;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  return objc_msgSend(objc_alloc((Class)BAContentSettingsData), "initWithBookmarkCount:noteCount:highlightCount:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v3), +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v8), +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
}

- (id)_analyticsReadingSettingsData
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  NSNumber *v6;
  double v7;
  double v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;

  v3 = -[THBookDescription isEpub](-[THBookViewController bookDescription](self, "bookDescription"), "isEpub");
  v4 = -[THDocumentViewController inFlowMode](-[THBookViewController documentViewController](self, "documentViewController"), "inFlowMode");
  v5 = v4;
  if ((v3 & 1) != 0 || v4)
  {
    -[THDocumentReflowableLayoutConfiguration fontSize](-[THDocumentViewController configuration](-[THBookViewController documentViewController](self, "documentViewController"), "configuration"), "fontSize");
    v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  }
  else
  {
    v6 = 0;
  }
  -[UIScreen brightness](+[UIScreen mainScreen](UIScreen, "mainScreen"), "brightness");
  v8 = v7;
  if (v3)
  {
    if (+[IMTheme isAutoNightModeEnabled](IMTheme, "isAutoNightModeEnabled"))
      v9 = 1;
    else
      v9 = 2;
    v10 = +[BAUtilities backgroundColorFromThemeIdentifier:](BAUtilities, "backgroundColorFromThemeIdentifier:", -[THTheme themeIdentifier](-[THBookViewController theme](self, "theme"), "themeIdentifier"));
  }
  else
  {
    v9 = 0;
    v10 = &dword_4;
  }
  if (v5)
    v11 = 1;
  else
    v11 = 2;
  v12 = objc_alloc((Class)BAReadingSettingsData);
  if (!v6)
    v6 = (NSNumber *)&off_469110;
  return objc_msgSend(v12, "initWithScrollViewStatus:autoNightThemeStatus:backgroundColor:font:fontSize:brightnessLevel:", v11, v9, v10, &stru_43D7D8, v6, +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8));
}

- (BOOL)shouldAllowToolbarHover
{
  UIViewController *v4;

  if (-[THBookViewController isNotesFullscreenVisible](self, "isNotesFullscreenVisible")
    || -[THBookViewController isGlossaryVisible](self, "isGlossaryVisible")
    || -[THBookViewController isStudyViewControllerVisible](self, "isStudyViewControllerVisible"))
  {
    return 0;
  }
  v4 = -[THBookViewController p_selectedTocViewController](self, "p_selectedTocViewController");
  if (v4 == -[THBookViewController visibleViewController](self, "visibleViewController"))
    return -[UIViewController introMediaControllerIsActive](v4, "introMediaControllerIsActive") ^ 1;
  else
    return 1;
}

- (void)hoverInteraction:(id)a3 didChangeStateForRegionWithKeys:(id)a4
{
  if (self->_hoverInteraction == a3
    && objc_msgSend(a3, "isHovering")
    && -[THBookViewController shouldAllowToolbarHover](self, "shouldAllowToolbarHover")
    && objc_msgSend(a4, "containsObject:", CFSTR("control")))
  {
    if (objc_msgSend(a3, "stateForRegionWithKey:", CFSTR("control")))
    {
      -[THBookViewController showToolbarAnimated:](self, "showToolbarAnimated:", 1);
      -[THDocumentViewController setScrubberHiddenAnimated:](-[THBookViewController documentViewController](self, "documentViewController"), "setScrubberHiddenAnimated:", 0);
      self->_toolbarEnabledViaHover = 1;
    }
  }
}

- (void)hoverInteractionDidSettle:(id)a3
{
  if ((objc_msgSend(a3, "stateForRegionWithKey:", CFSTR("control")) & 1) == 0
    && objc_msgSend(a3, "isHovering")
    && -[THBookViewController shouldAllowToolbarHover](self, "shouldAllowToolbarHover")
    && self->_toolbarEnabledViaHover)
  {
    -[THBookViewController hideToolbarAnimated:](self, "hideToolbarAnimated:", 1);
    -[THDocumentViewController setScrubberHiddenAnimated:](-[THBookViewController documentViewController](self, "documentViewController"), "setScrubberHiddenAnimated:", 1);
    self->_toolbarEnabledViaHover = 0;
  }
}

- (void)buildHoverRegions
{
  BCUIHoverInteraction *hoverInteraction;
  _QWORD v3[5];

  hoverInteraction = self->_hoverInteraction;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_84BFC;
  v3[3] = &unk_428618;
  v3[4] = self;
  -[BCUIHoverInteraction rebuildRegionWithKey:block:](hoverInteraction, "rebuildRegionWithKey:block:", CFSTR("control"), v3);
}

- (BOOL)_isShowingContent
{
  UIViewController *v3;

  v3 = -[THBookViewController visibleViewController](self, "visibleViewController");
  return v3 == (UIViewController *)-[THBookViewController documentViewController](self, "documentViewController");
}

- (BOOL)_canSearch
{
  _BOOL4 v3;

  v3 = -[THBookViewController _isShowingContent](self, "_isShowingContent");
  if (v3)
    LOBYTE(v3) = -[THBookViewController presentedViewController](self, "presentedViewController") == 0;
  return v3;
}

- (BOOL)_canShowGlossaryOrStudyCards
{
  return (uint64_t)objc_msgSend(objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "glossary"), "entryCount") > 0;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  objc_super v8;

  if (-[UIViewController canPerformAction:withSender:](-[THBookViewController visibleViewController](self, "visibleViewController"), "canPerformAction:withSender:", a3, a4))return -[THBookViewController visibleViewController](self, "visibleViewController");
  v8.receiver = self;
  v8.super_class = (Class)THBookViewController;
  return -[THBookViewController targetForAction:withSender:](&v8, "targetForAction:withSender:", a3, a4);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  unsigned int v6;
  _BOOL4 isEqual;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)THBookViewController;
  v6 = -[THBookViewController canPerformAction:withSender:](&v9, "canPerformAction:withSender:", a3, a4);
  if (sel_isEqual(a3, "books_toggleBookmark:"))
  {
    if (v6)
      return -[THBookViewController isBookmarkApplicable](self, "isBookmarkApplicable");
    return 0;
  }
  if (sel_isEqual(a3, "books_setThemeWhite:")
    || sel_isEqual(a3, "books_setThemeSepia:")
    || sel_isEqual(a3, "books_setThemeGray:")
    || sel_isEqual(a3, "books_setThemeNight:"))
  {
    if (v6)
      return objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "isEPUB");
    return 0;
  }
  if (sel_isEqual(a3, "books_find:"))
  {
    if (v6)
      return -[THBookViewController _canSearch](self, "_canSearch");
    return 0;
  }
  if (sel_isEqual(a3, "books_increaseSize:"))
  {
    if (v6)
      return -[THBookViewController canIncreaseFontSize](self, "canIncreaseFontSize");
    return 0;
  }
  if (sel_isEqual(a3, "books_decreaseSize:"))
  {
    if (v6)
      return -[THBookViewController canDecreaseFontSize](self, "canDecreaseFontSize");
    return 0;
  }
  if (!sel_isEqual(a3, "books_showStudyCards:"))
  {
    isEqual = sel_isEqual(a3, "books_showGlossary:");
    if ((isEqual & v6 & 1) == 0)
      return v6 & ~isEqual;
    return -[THBookViewController _canShowGlossaryOrStudyCards](self, "_canShowGlossaryOrStudyCards");
  }
  if (v6)
    return -[THBookViewController _canShowGlossaryOrStudyCards](self, "_canShowGlossaryOrStudyCards");
  return 0;
}

- (void)validateCommand:(id)a3
{
  const char *v5;
  THTheme *v6;
  THTheme *v7;
  id v8;
  _QWORD *v9;
  unsigned int v10;
  void *v11;
  const __CFString *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)THBookViewController;
  -[THBookViewController validateCommand:](&v13, "validateCommand:");
  v5 = (const char *)objc_msgSend(a3, "action");
  v6 = -[THBookViewController theme](self, "theme");
  if (v5 == "books_toggleBookmark:")
  {
    v10 = -[THBookViewController isPageBookmarked](self, "isPageBookmarked");
    v11 = (void *)THBundle();
    if (v10)
      v12 = CFSTR("Remove Bookmark");
    else
      v12 = CFSTR("Bookmark Page");
    objc_msgSend(a3, "setTitle:", objc_msgSend(v11, "localizedStringForKey:value:table:", v12, &stru_43D7D8, 0));
  }
  else
  {
    v7 = v6;
    if (sel_isEqual(v5, "books_setThemeWhite:"))
    {
      v8 = -[THTheme themeIdentifier](v7, "themeIdentifier");
      v9 = &kIMThemeIdentifierWhitePageTheme;
    }
    else if (sel_isEqual(v5, "books_setThemeSepia:"))
    {
      v8 = -[THTheme themeIdentifier](v7, "themeIdentifier");
      v9 = &kIMThemeIdentifierSepiaPageTheme;
    }
    else if (sel_isEqual(v5, "books_setThemeGray:"))
    {
      v8 = -[THTheme themeIdentifier](v7, "themeIdentifier");
      v9 = &kIMThemeIdentifierGrayPageTheme;
    }
    else
    {
      if (!sel_isEqual(v5, "books_setThemeNight:"))
        return;
      v8 = -[THTheme themeIdentifier](v7, "themeIdentifier");
      v9 = &kIMThemeIdentifierNightPageTheme;
    }
    objc_msgSend(a3, "setState:", objc_msgSend(v8, "isEqualToString:", *v9));
  }
}

- (THBookDescription)bookDescription
{
  return self->mBookDescription;
}

- (void)setBookDescription:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (AEAssetViewControllerDelegate)assetViewControllerDelegate
{
  return (AEAssetViewControllerDelegate *)objc_loadWeak((id *)&self->mAssetViewControllerDelegate);
}

- (void)setAssetViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->mAssetViewControllerDelegate, a3);
}

- (void)setFlowToCTableViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (void)setFlowTocViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (THiOSStudyViewController)studyViewController
{
  return self->mStudyViewController;
}

- (void)setStudyViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (void)setChapterBrowserController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (THBookmarkMenuPopoverViewController)bookmarkViewController
{
  return self->mBookmarkViewController;
}

- (void)setBookmarkViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (THNavigationHistoryStepperController)navigationHistoryStepperController
{
  return self->navigationHistoryStepperController;
}

- (void)setNavigationHistoryStepperController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 296);
}

- (THNavigationOverlayView)navigationOverlayView
{
  return self->navigationOverlayView;
}

- (void)setNavigationOverlayView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 304);
}

- (UILabel)titleLabel
{
  return self->mTitleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 312);
}

- (BCDisplayOnlyNavigationBar)titleLabelNavigationBar
{
  return self->mTitleLabelNavigationBar;
}

- (void)setTitleLabelNavigationBar:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 320);
}

- (UIButton)actionlessBookmarkButton
{
  return self->mActionlessBookmarkButton;
}

- (void)setActionlessBookmarkButton:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 328);
}

- (THNavigationBarController)navigationBarController
{
  return self->mNavigationBarController;
}

- (void)setNavigationBarController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (THDocumentViewController)documentViewController
{
  return self->mDocumentViewController;
}

- (void)setDocumentViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (void)setNotesFullscreenViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (THTOCGlossaryMenuPopoverViewController)TOCGlossaryViewController
{
  return self->mTOCGlossaryViewController;
}

- (void)setTOCGlossaryViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (THDisplaySettingsViewController)displaySettingsViewController
{
  return self->mDisplaySettingsViewController;
}

- (void)setDisplaySettingsViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (void)setBookLinkResolver:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

- (NSString)openingCFIOverride
{
  return self->mOpeningCFIOverride;
}

- (void)setOpeningCFIOverride:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 176);
}

- (NSString)openingFragmentOverride
{
  return self->mOpeningFragmentOverride;
}

- (void)setOpeningFragmentOverride:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 184);
}

- (unint64_t)openingAbsolutePageIndexOverride
{
  return self->mOpeningAbsolutePageIndexOverride;
}

- (void)setOpeningAbsolutePageIndexOverride:(unint64_t)a3
{
  self->mOpeningAbsolutePageIndexOverride = a3;
}

- (BKLocation)openingLocationOverride
{
  return self->mOpeningLocationOverride;
}

- (void)setOpeningLocationOverride:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 200);
}

- (THiOSIntroMediaViewController)introMediaViewController
{
  return self->mIntroMediaViewController;
}

- (void)setIntroMediaViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 216);
}

- (BOOL)isCompleteBook
{
  return self->mIsCompleteBook;
}

- (BOOL)openAnimationDidFinish
{
  return self->mOpenAnimationDidFinish;
}

- (THWFreeTransformController)canvasExitFreeTransformController
{
  return self->mCanvasExitTransformController;
}

- (AEAssetOpenAnimating)contentOpenAnimator
{
  return self->mContentOpenAnimator;
}

- (void)setContentOpenAnimator:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 336);
}

- (THTheme)theme
{
  return self->mTheme;
}

- (void)setTheme:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 264);
}

- (NSObject)bookPositionProcessor
{
  return self->mBookPositionProcessor;
}

- (void)setBookPositionProcessor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 344);
}

- (UIAlertController)fontDownloadAlertController
{
  return self->mFontDownloadAlertController;
}

- (void)setFontDownloadAlertController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 352);
}

- (THSearchViewController)searchViewController
{
  return self->_searchViewController;
}

- (void)setSearchViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 360);
}

- (UIColor)viewBackgroundColor
{
  return self->_viewBackgroundColor;
}

- (void)setViewBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 368);
}

- (BOOL)paginationInProgress
{
  return self->_paginationInProgress;
}

- (void)setPaginationInProgress:(BOOL)a3
{
  self->_paginationInProgress = a3;
}

- (BCUIHoverInteraction)hoverInteraction
{
  return self->_hoverInteraction;
}

- (void)setHoverInteraction:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 376);
}

- (BOOL)bookOpenFailed
{
  return self->_bookOpenFailed;
}

- (void)setBookOpenFailed:(BOOL)a3
{
  self->_bookOpenFailed = a3;
}

- (BOOL)toolbarEnabledViaHover
{
  return self->_toolbarEnabledViaHover;
}

- (void)setToolbarEnabledViaHover:(BOOL)a3
{
  self->_toolbarEnabledViaHover = a3;
}

- (BOOL)performanceModeBookOpening
{
  return self->_performanceModeBookOpening;
}

- (id)snapshotBlock
{
  return self->_snapshotBlock;
}

- (void)setSnapshotBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (int64_t)doNotDisturbStatusAtStart
{
  return self->_doNotDisturbStatusAtStart;
}

- (void)setDoNotDisturbStatusAtStart:(int64_t)a3
{
  self->_doNotDisturbStatusAtStart = a3;
}

- (int64_t)lastAnalyticsDeviceOrientationReported
{
  return self->_lastAnalyticsDeviceOrientationReported;
}

- (void)setLastAnalyticsDeviceOrientationReported:(int64_t)a3
{
  self->_lastAnalyticsDeviceOrientationReported = a3;
}

- (UIViewController)visibleViewController
{
  return self->_visibleViewController;
}

- (void)setVisibleViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 408);
}

- (THiOSDocument)document
{
  return self->_document;
}

- (void)setBookmarkButtonItem:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 424);
}

- (void)setBookmarkButton:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 432);
}

- (void)setBrightnessButtonItem:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 440);
}

- (void)setAppearanceButtonItem:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 448);
}

- (void)setSearchButtonItem:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 456);
}

- (void)setNotesButtonItem:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 464);
}

- (void)setTocGlossaryButtonItem:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 472);
}

- (void)setCloseButtonItem:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 480);
}

- (void)setCloseTOCButtonItem:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 488);
}

- (void)setShareButtonItem:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 496);
}

- (UIViewController)activityViewController
{
  return self->_activityViewController;
}

- (void)setActivityViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 504);
}

- (int64_t)styleBeforeAutoNight
{
  return self->_styleBeforeAutoNight;
}

- (void)setStyleBeforeAutoNight:(int64_t)a3
{
  self->_styleBeforeAutoNight = a3;
}

- (BOOL)bookOpenDestinationIsTOC
{
  return self->_bookOpenDestinationIsTOC;
}

- (void)setBookOpenDestinationIsTOC:(BOOL)a3
{
  self->_bookOpenDestinationIsTOC = a3;
}

- (BOOL)presentingGlossary
{
  return self->_presentingGlossary;
}

- (void)setPresentingGlossary:(BOOL)a3
{
  self->_presentingGlossary = a3;
}

- (BOOL)settingToolbarHidden
{
  return self->_settingToolbarHidden;
}

- (void)setSettingToolbarHidden:(BOOL)a3
{
  self->_settingToolbarHidden = a3;
}

- (BOOL)transitioningTOCSize
{
  return self->_transitioningTOCSize;
}

- (void)setTransitioningTOCSize:(BOOL)a3
{
  self->_transitioningTOCSize = a3;
}

- (BOOL)disallowRotate
{
  return self->_disallowRotate;
}

- (void)setDisallowRotate:(BOOL)a3
{
  self->_disallowRotate = a3;
}

- (UIView)HUDOverlayView
{
  return self->_HUDOverlayView;
}

- (void)setHUDOverlayView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 520);
}

- (THHUDVending)HUDVendor
{
  return self->_HUDVendor;
}

- (void)setHUDVendor:(id)a3
{
  self->_HUDVendor = (THHUDVending *)a3;
}

- (NSNumber)readingProgressHighwaterMark
{
  return self->_readingProgressHighwaterMark;
}

- (void)setReadingProgressHighwaterMark:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 536);
}

- (THReadingStatisticsCollector)readingStatisticsCollector
{
  return self->_readingStatisticsCollector;
}

- (void)setReadingStatisticsCollector:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 544);
}

- (BOOL)bookLoadedSuccessfully
{
  return self->_bookLoadedSuccessfully;
}

- (void)setBookLoadedSuccessfully:(BOOL)a3
{
  self->_bookLoadedSuccessfully = a3;
}

- (BOOL)readingStatisticsControllerLoaded
{
  return self->_readingStatisticsControllerLoaded;
}

- (void)setReadingStatisticsControllerLoaded:(BOOL)a3
{
  self->_readingStatisticsControllerLoaded = a3;
}

- (BOOL)startedScanningReadingStatistics
{
  return self->_startedScanningReadingStatistics;
}

- (void)setStartedScanningReadingStatistics:(BOOL)a3
{
  self->_startedScanningReadingStatistics = a3;
}

- (NSDate)analyticsReadStartDate
{
  return self->_analyticsReadStartDate;
}

- (void)setAnalyticsReadStartDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 552);
}

- (NSNumber)analyticsReadStartProgress
{
  return self->_analyticsReadStartProgress;
}

- (void)setAnalyticsReadStartProgress:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 560);
}

- (BOOL)smartInvertEnabled
{
  return self->_smartInvertEnabled;
}

- (void)setSmartInvertEnabled:(BOOL)a3
{
  self->_smartInvertEnabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mAssetViewControllerDelegate);
}

@end
