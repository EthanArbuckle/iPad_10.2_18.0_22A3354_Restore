@implementation BKApplication

- (id)osBuildVersion
{
  void *v3;
  NSString *v4;
  NSString *osBuildVersion;

  if (!-[NSString length](self->_osBuildVersion, "length"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "buildVersion"));
    osBuildVersion = self->_osBuildVersion;
    self->_osBuildVersion = v4;

  }
  return self->_osBuildVersion;
}

+ (BOOL)isRunningInStoreDemoMode
{
  return +[UIApplication isRunningInStoreDemoMode](UIApplication, "isRunningInStoreDemoMode");
}

- (BOOL)isRunningInStoreDemoMode
{
  return +[BKApplication isRunningInStoreDemoMode](BKApplication, "isRunningInStoreDemoMode");
}

+ (int64_t)intValueForProcessArgument:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  char *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  int64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arguments"));

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v5;
  v7 = (char *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v18;
LABEL_3:
    v11 = 0;
    v12 = &v8[(_QWORD)v9];
    while (1)
    {
      if (*(_QWORD *)v18 != v10)
        objc_enumerationMutation(v6);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11), "isEqualToString:", v3, (_QWORD)v17) & 1) != 0)
        break;
      if (v8 == (char *)++v11)
      {
        v8 = (char *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        v9 = v12;
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }

    if (&v9[v11] >= (char *)objc_msgSend(v6, "count") - 1)
    {
      v13 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_16;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", &v9[v11 + 1]));
    v14 = v15;
    if (v15)
      v13 = (int)objc_msgSend(v15, "intValue");
    else
      v13 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
LABEL_9:
    v13 = 0x7FFFFFFFFFFFFFFFLL;
    v14 = v6;
  }

LABEL_16:
  return v13;
}

- (void)presentViewController:(id)a3 transaction:(id)a4 animated:(BOOL)a5 completion:(id)a6
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
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "defaultSceneControllerForTransaction:", v10));

  objc_msgSend(v13, "presentViewController:animated:completion:", v11, v6, v9);
}

- (void)presentViewControllerOverMainCanvas:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  BOOL v15;

  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100098338;
  v12[3] = &unk_1008E84A0;
  v15 = a4;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v9, "requestPrimaryScene:", v12);

}

- (id)_mainViewControllerForTransaction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "defaultSceneControllerForTransaction:", v3));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_mainViewControllerForModalPresenting"));
  return v6;
}

- (id)clientApplicationController
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v2 = objc_opt_class(BKAppDelegate);
  v3 = BCGetUnsafeAppDelegateReference();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = BUDynamicCast(v2, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storeController"));
  return v7;
}

- (BOOL)isConnectedToInternet
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKApplication delegate](self, "delegate"));
  v3 = objc_msgSend(v2, "isConnectedToInternet");

  return v3;
}

- (void)prepareForDefaultImageSnapshotForScreen:(id)a3
{
  id v4;
  void *v5;
  _QWORD block[5];
  objc_super v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("BKApplicationWillTakeSnapshot"), self);

  v7.receiver = self;
  v7.super_class = (Class)BKApplication;
  -[BKApplication prepareForDefaultImageSnapshotForScreen:](&v7, "prepareForDefaultImageSnapshotForScreen:", v4);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100098514;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  +[AETestDriver prewarm](AETestDriver, "prewarm");
  +[BKTestDriver prewarm](BKTestDriver, "prewarm");
  +[BKTestDriverDispatcher prewarm](BKTestDriverDispatcher, "prewarm");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PPTRunner shared](_TtC5Books9PPTRunner, "shared"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
  objc_msgSend(v9, "setTestStateProvider:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[PPTRunner shared](_TtC5Books9PPTRunner, "shared"));
  v11 = objc_claimAutoreleasedReturnValue(+[BETestDriver shared](BETestDriver, "shared"));
  objc_msgSend((id)v11, "setTestStateProvider:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[PPTRunner shared](_TtC5Books9PPTRunner, "shared"));
  LOBYTE(v11) = objc_msgSend(v12, "runTestWithName:options:", v6, v7);

  if ((v11 & 1) != 0)
  {
    v13 = 1;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)BKApplication;
    v13 = -[BKApplication runTest:options:](&v15, "runTest:options:", v6, v7);
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osBuildVersion, 0);
}

- (void)accessibilityInitialize
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMCommonCoreAccessibility sharedInstance](IMCommonCoreAccessibility, "sharedInstance"));
  objc_msgSend(v3, "loadAccessibilitySupport");

  v4 = IMAccessibilityInitialize();
  AEAccessibilityInitialize(v4);
  qword_100A1E230 = 0x1000000000000;
  qword_100A1E238 = 0x400000000000;
  dword_100A1E240 = 1007;
  if (CFPreferencesGetAppBooleanValue(CFSTR("ReportValidationErrors"), CFSTR("com.apple.Accessibility"), 0))
  {
    __IMAccessibilityValidateClass(CFSTR("BKWebViewController"));
    __IMAccessibilityValidateIsKindOfClass(CFSTR("BKPictureBookContentViewController"), CFSTR("UIViewController"));
    __IMAccessibilityValidateIsKindOfClass(CFSTR("BKPageScrollerViewController"), CFSTR("BKPageNavigationViewController"));
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("PaginatingWebView"), CFSTR("bkWebViewDelegate"), "@");
    __IMAccessibilityValidateIvar(CFSTR("PaginatingWebView"), "_internal");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKPageNavigationViewController"), CFSTR("pageOffset"), "i");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKPageNavigationViewController"), CFSTR("turnToPageNumber:animated:"), "v");
    __IMAccessibilityValidateClassMethodComplete(CFSTR("BKLibraryManager"), CFSTR("defaultManager"), "@");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKLibraryManager"), CFSTR("countOfSeriesLibraryAssetsWithSeriesID:total:purchased:context:"), "v");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKLibraryManager"), CFSTR("libraryAssetOnMainQueueWithAssetID:"), "@");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKLibraryManager"), CFSTR("uiChildContext"), "@");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKLibraryAsset"), CFSTR("isCloud"), "B");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKLibraryAsset"), CFSTR("isLocal"), "B");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKLibraryAsset"), CFSTR("isContainer"), "B");
    __IMAccessibilityValidateProtocolMethod(CFSTR("BKLibraryAsset"), CFSTR("seriesID"), 1, 1);
    __IMAccessibilityValidateProtocolMethod(CFSTR("BKLibraryAsset"), CFSTR("title"), 1, 1);
    __IMAccessibilityValidateIsKindOfClass(CFSTR("BKLibraryBooksDataSource"), CFSTR("IMLibraryBooksDataSource"));
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKBookInfo"), CFSTR("contentType"), "s");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("IMLibraryBooksDataSource"), CFSTR("objectAtIndexPath:"), "@");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKAppearanceFontViewController"), CFSTR("tableView:cellForRowAtIndexPath:"), "@");
    __IMAccessibilityValidateInstanceMethod(CFSTR("BKAppearanceFontViewController"), CFSTR("tableView:setSelectionState:cell:"));
    __IMAccessibilityValidateInstanceMethod(CFSTR("BKBookViewController"), CFSTR("scrubValueChanged:"));
    __IMAccessibilityValidateInstanceMethod(CFSTR("BKBookController"), CFSTR("existingViewController"));
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKBookViewController"), CFSTR("bkaxNeedsPersistentControls"), "B");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKBookViewController"), CFSTR("editorController:deleteAnnotation:"), "v");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKBookViewController"), CFSTR("editorController:editNote:"), "v");
    __IMAccessibilityValidateInstanceMethod(CFSTR("BKBookViewController"), CFSTR("turnPages:animated:"));
    __IMAccessibilityValidateInstanceMethod(CFSTR("PaginatingWebView"), CFSTR("initWithFrame:forNonDisplayPurposesOnly:"));
    __IMAccessibilityValidateInstanceMethod(CFSTR("BKBookViewController"), CFSTR("pageCount"));
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKBookViewController"), CFSTR("currentPages"), "{_NSRange=QQ}");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKLibraryBookCoverViewController"), CFSTR("backButton"), "@");
    __IMAccessibilityValidateIsKindOfClass(CFSTR("BKLibraryBookCoverViewController"), CFSTR("UIViewController"));
    __IMAccessibilityValidateInstanceMethod(CFSTR("BKAppearanceViewController"), CFSTR("viewDidAppear:"));
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKAppearanceViewController"), CFSTR("themeContainer"), "@");
    __IMAccessibilityValidateIvarType(CFSTR("BKAppearanceViewController"), "_themeWhiteLabel", "UILabel");
    __IMAccessibilityValidateIvarType(CFSTR("BKAppearanceViewController"), "_themeSepiaLabel", "UILabel");
    __IMAccessibilityValidateIvarType(CFSTR("BKAppearanceViewController"), "_themeNightLabel", "UILabel");
    __IMAccessibilityValidateIvarType(CFSTR("BKAppearanceViewController"), "_themeContainer", "UIView");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKAppearanceViewController"), CFSTR("tableView:cellForRowAtIndexPath:"), "@");
    __IMAccessibilityValidateInstanceMethod(CFSTR("BKBrightnessController"), CFSTR("viewWillAppear:"));
    __IMAccessibilityValidateInstanceMethod(CFSTR("UITextSelectionView"), CFSTR("showSelectionCommands"));
    __IMAccessibilityValidateInstanceMethod(CFSTR("DOMRange"), CFSTR("boundingBox"));
    __IMAccessibilityValidateInstanceMethod(CFSTR("BKPaginationController"), CFSTR("pageRangeForChapterAtIndex:"));
    __IMAccessibilityValidateInstanceMethod(CFSTR("BKBookViewController"), CFSTR("turnToPageNumber:animated:"));
    __IMAccessibilityValidateInstanceMethod(CFSTR("BKBookViewController"), CFSTR("paginationController"));
    __IMAccessibilityValidateInstanceMethod(CFSTR("IMGridView"), CFSTR("indexForCell:"));
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("IMGridView"), CFSTR("rangeOfVisibleCells"), "{_NSRange=QQ}");
    __IMAccessibilityValidateInstanceMethod(CFSTR("BKAppearanceViewController"), CFSTR("_changeAppearanceStyle:"));
    __IMAccessibilityValidateInstanceMethod(CFSTR("BKAppearanceViewController"), CFSTR("increaseFontSize:"));
    __IMAccessibilityValidateInstanceMethod(CFSTR("BKAppearanceViewController"), CFSTR("decreaseFontSize:"));
    __IMAccessibilityValidateInstanceMethod(CFSTR("BKAppearanceViewController"), CFSTR("appearanceShouldDismissPopover"));
    __IMAccessibilityValidateInstanceMethod(CFSTR("BKThumbnailDirectory"), CFSTR("configureCell:atIndex:"));
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKBookViewController"), CFSTR("showLibrary:"), "v");
    __IMAccessibilityValidateInstanceMethod(CFSTR("BKBookViewController"), CFSTR("showTOC:"));
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("THBookViewController"), CFSTR("removeTOC"), "v");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("THBookViewController"), CFSTR("donePressedFromToolbar:"), "v");
    __IMAccessibilityValidateInstanceMethod(CFSTR("BKBookViewController"), CFSTR("resume:"));
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKPageThumbnailView"), CFSTR("pageNumber"), "q");
    __IMAccessibilityValidateIsKindOfClass(CFSTR("BKThumbnailDirectoryCell"), CFSTR("IMGridViewCell"));
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKThumbnailDirectoryCell"), CFSTR("contentRectForBounds:"), "{CGRect={CGPoint=dd}{CGSize=dd}}");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKThumbnailDirectoryCell"), CFSTR("hasRibbon"), "B");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKThumbnailDirectoryCell"), CFSTR("pageView"), "@");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKBookViewController"), CFSTR("visiblePageBookmarks"), "@");
    __IMAccessibilityValidateInstanceMethod(CFSTR("BKBookViewController"), CFSTR("bookmarkPage:"));
    __IMAccessibilityValidateInstanceMethod(CFSTR("BKBookViewController"), CFSTR("unbookmarkPage:"));
    __IMAccessibilityValidateInstanceMethod(CFSTR("BKWebView"), CFSTR("webView:didFinishLoadForFrame:"));
    __IMAccessibilityValidateInstanceMethod(CFSTR("BKBookViewController"), CFSTR("scrub:"));
    __IMAccessibilityValidateInstanceMethod(CFSTR("BKAudioController"), CFSTR("viewDidLoad"));
    __IMAccessibilityValidateInstanceMethod(CFSTR("BKWebView"), CFSTR("bkWebViewDelegate"));
    __IMAccessibilityValidateInstanceMethod(CFSTR("AEAnnotationPopoverViewController"), CFSTR("hide"));
    __IMAccessibilityValidateInstanceMethod(CFSTR("BKBookViewController"), CFSTR("asset"));
    __IMAccessibilityValidateInstanceMethod(CFSTR("BKBookViewController"), CFSTR("goToPath:fragment:animated:"));
    __IMAccessibilityValidateInstanceMethod(CFSTR("BKScrubberCalloutView"), CFSTR("title"));
    __IMAccessibilityValidateInstanceMethod(CFSTR("BKSpreadThumbnailDirectoryCell"), CFSTR("spreadView"));
    __IMAccessibilityValidateInstanceMethod(CFSTR("BKSpreadThumbnailView"), CFSTR("leftPageView"));
    __IMAccessibilityValidateInstanceMethod(CFSTR("BKSpreadThumbnailView"), CFSTR("rightPageView"));
    __IMAccessibilityValidateInstanceMethod(CFSTR("BKPageThumbnailView"), CFSTR("pageNumber"));
    __IMAccessibilityValidateInstanceMethod(CFSTR("UICalloutBar"), CFSTR("fade"));
    __IMAccessibilityValidateInstanceMethod(CFSTR("UICalloutBar"), CFSTR("appear"));
    __IMAccessibilityValidateInstanceMethod(CFSTR("UIWebPlugInView"), CFSTR("webPlugInStart"));
    __IMAccessibilityValidateIsKindOfClass(CFSTR("BKAssetPresentingViewController"), CFSTR("UIViewController"));
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKAssetPresentingViewController"), CFSTR("assetViewController"), "@");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKAssetPresentingViewController"), CFSTR("assetViewController:requestClose:"), "B");
    __IMAccessibilityValidateInstanceMethod(CFSTR("BKBookViewController"), CFSTR("directoryContent:didSelectLocation:"));
    __IMAccessibilityValidateInstanceMethod(CFSTR("BKBookViewController"), CFSTR("tocViewController:didSelectChapter:"));
    __IMAccessibilityValidateIsKindOfClass(CFSTR("BKLibrarySearchBar"), CFSTR("UISearchBar"));
    __IMAccessibilityValidateIsKindOfClass(CFSTR("BKLibraryViewController"), CFSTR("UIViewController"));
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKLibraryViewController"), CFSTR("_applyCurrentThemeAnimated:"), "v");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKLibraryViewController"), CFSTR("backBarButtonItem"), "@");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKLibraryViewController"), CFSTR("_backBarButtonItemTintedToSeries:"), "@");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKLibraryViewController"), CFSTR("backButtonPressed:"), "v");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKLibraryViewController"), CFSTR("collectionsBarButton"), "@");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKLibraryViewController"), CFSTR("_collectionsBarButtonForSeries:"), "@");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("UIBarButtonItem"), CFSTR("customView"), "@");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKLibraryViewController"), CFSTR("editBarButtonItem"), "@");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKLibraryViewController"), CFSTR("embeddedHeaderSearchField"), "@");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKLibraryViewController"), CFSTR("embeddedHeaderToolbar"), "@");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKLibraryViewController"), CFSTR("nightDarkenView"), "@");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKLibraryViewController"), CFSTR("searchBarTextDidBeginEditing:"), "v");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKLibraryViewController"), CFSTR("searchBarTextDidEndEditing:"), "v");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKLibraryViewController"), CFSTR("setCollectionsBarButtonTitle:tintForSeries:"), "v");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKLibraryViewController"), CFSTR("_theme_updateViewTypeToggleBarButtonItem"), "v");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKLibraryViewController"), CFSTR("toolbar"), "@");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKLibraryViewController"), CFSTR("topViewController"), "@");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKLibraryViewController"), CFSTR("_updateViewTypeSwitch"), "v");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKLibraryViewController"), CFSTR("viewDidLoad"), "v");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKLibraryViewController"), CFSTR("viewType"), "q");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKLibraryViewController"), CFSTR("_viewTypeToggleBarButtonItem"), "@");
    __IMAccessibilityValidateInstanceMethod(CFSTR("UIImage"), CFSTR("imageWithRenderingMode:"));
    __IMAccessibilityValidateIsKindOfClass(CFSTR("BKCollectionsListCell"), CFSTR("UITableViewCell"));
    __IMAccessibilityValidateIsKindOfClass(CFSTR("PaginatingWebView"), CFSTR("BKWebView"));
    __IMAccessibilityValidateIsKindOfClass(CFSTR("BKBookViewController"), CFSTR("UIViewController"));
    __IMAccessibilityValidateIvarType(CFSTR("UICalloutBar"), "m_systemButtons", "NSMutableArray");
    __IMAccessibilityValidateIvarType(CFSTR("UICalloutBar"), "m_extraButtons", "NSMutableArray");
    __IMAccessibilityValidateIvar(CFSTR("BKAudioController"), "_volumeSlider");
    __IMAccessibilityValidateIvar(CFSTR("BKPictureBookViewController"), "_topToolbar");
    __IMAccessibilityValidateIvar(CFSTR("BKPaginationController"), "_chapterInfo");
    __IMAccessibilityValidateIvar(CFSTR("UITextInteractionAssistant"), "_selectionView");
    __IMAccessibilityValidateIvar(CFSTR("UIWebDocumentView"), "_textSelectionAssistant");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("IMGridView"), CFSTR("indexForCell:"), "q");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("IMGridViewCell"), CFSTR("contentView"), "@");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("IMGridViewCell"), CFSTR("isEditing"), "B");
    __IMAccessibilityValidateProtocolMethod(CFSTR("BKLibraryProgressStatus"), CFSTR("progressValue"), 1, 1);
    __IMAccessibilityValidateProtocolMethod(CFSTR("BKLibraryProgressStatus"), CFSTR("assetID"), 1, 1);
    __IMAccessibilityValidateProtocolMethod(CFSTR("AEAssetAudiobookStatus"), CFSTR("assetAudiobookStatusTrackProgress"), 1, 1);
    __IMAccessibilityValidateProtocolMethod(CFSTR("AEAssetAudiobookStatus"), CFSTR("assetAudiobookStatusTogglePlayPause"), 1, 1);
    __IMAccessibilityValidateIvarType(CFSTR("BKScrubberCalloutView"), "_title", "UILabel");
    __IMAccessibilityValidateIvarType(CFSTR("BKScrubberControl"), "_pageNumber", "NSInteger");
    __IMAccessibilityValidateIvar(CFSTR("BKBrightnessController"), "_slider");
    __IMAccessibilityValidateIvar(CFSTR("BKAppearanceViewController"), "_sizeSmallerButton");
    __IMAccessibilityValidateIvar(CFSTR("BKAppearanceViewController"), "_sizeLargerButton");
    __IMAccessibilityValidateIvar(CFSTR("BKAppearanceViewController"), "_brightnessSlider");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKAppearanceViewController"), CFSTR("scrollSwitch"), "@");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKAppearanceViewController"), CFSTR("tableView"), "@");
    __IMAccessibilityValidateIvar(CFSTR("BKLibraryViewController"), "_viewTypeToggleBarButtonItem");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKSearchViewcontroller"), CFSTR("revealSearchResult:animated:"), "v");
    __IMAccessibilityValidateIvarType(CFSTR("BKSearchViewController"), "_searchDelegate", "@");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("THBookViewController"), CFSTR("isTOCVisible"), "B");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("THBookViewController"), CFSTR("showTOC"), "v");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("THBookViewController"), CFSTR("theme"), "@");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("UIImage"), CFSTR("imageMaskWithColor:"), "@");
    __IMAccessibilityValidateInstanceMethod(CFSTR("UIPDFDocument"), CFSTR("numberOfPages"));
    __IMAccessibilityValidateInstanceMethod(CFSTR("UIPDFDocument"), CFSTR("pageAtIndex:"));
    __IMAccessibilityValidateInstanceMethod(CFSTR("WebAccessibilityObjectWrapper"), CFSTR("nextMarkerForMarker:"));
    __IMAccessibilityValidateInstanceMethod(CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityPostProcessHitTest:"));
    __IMAccessibilityValidateInstanceMethod(CFSTR("WebAccessibilityObjectWrapper"), CFSTR("_accessibilityActivate"));
    __IMAccessibilityValidateInstanceMethod(CFSTR("NSObject"), CFSTR("setIsAccessibilityScrollAncestor:"));
    __IMAccessibilityValidateIsKindOfClass(CFSTR("BKLibraryBookshelfCollectionViewCell"), CFSTR("UICollectionViewCell"));
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKLibraryBookshelfCollectionViewCell"), CFSTR("handleTapIfPossible"), "v");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKLibraryBookshelfGridBookCell"), CFSTR("_accessibilityDidTriggerShowMenuAction"), "B");
    __IMAccessibilityValidateInstanceMethodComplete(CFSTR("BKLibraryBookshelfGridBookCell"), CFSTR("_presentMenuAtLocation:"), "v");
  }
  IMAccessibilityInstallSafeCategory(CFSTR("BKViewAccessibility"));
  IMAccessibilityInstallSafeCategory(CFSTR("BKUITableViewAccessibility"));
  IMAccessibilityInstallSafeCategory(CFSTR("BKLibraryAccessibility"));
  IMAccessibilityInstallSafeCategory(CFSTR("BKLibraryBookshelfCollectionViewCellAccessibility"));
  IMAccessibilityInstallSafeCategory(CFSTR("BKLibraryBookshelfGridBookCellAccessibility"));
  IMAccessibilityInstallSafeCategory(CFSTR("BKAudioControllerAccessibility"));
  IMAccessibilityInstallSafeCategory(CFSTR("BKLibraryViewControllerAccessibility"));
  IMAccessibilityInstallSafeCategory(CFSTR("PaginatingWebViewAccessibility"));
  IMAccessibilityInstallSafeCategory(CFSTR("BKBookViewControllerAccessibility"));
  IMAccessibilityInstallSafeCategory(CFSTR("BKAppearanceViewControllerAccessibility"));
  IMAccessibilityInstallSafeCategory(CFSTR("BKAppearanceFontViewControllerAccessibility"));
  IMAccessibilityInstallSafeCategory(CFSTR("BKAssetPresentingViewControllerAccessibility"));
  IMAccessibilityInstallSafeCategory(CFSTR("BKLibraryBookCoverViewControllerAccessibility"));
  IMAccessibilityInstallSafeCategory(CFSTR("BKBrightnessControllerAccessibility"));
  IMAccessibilityInstallSafeCategory(CFSTR("BKThumbnailDirectoryAccessibility"));
  IMAccessibilityInstallSafeCategory(CFSTR("BKToolbarAccessibility"));
  IMAccessibilityInstallSafeCategory(CFSTR("BKThumbnailDirectoryCellAccessibility"));
  IMAccessibilityInstallSafeCategory(CFSTR("BKUISliderAccessibility"));
  IMAccessibilityInstallSafeCategory(CFSTR("BKCollectionsListCellAccessibility"));
  IMAccessibilityInstallSafeCategory(CFSTR("BKUIToolbarButtonAccessibility"));
  IMAccessibilityInstallSafeCategory(CFSTR("BKZoomingScrollViewAccessibility"));
  IMAccessibilityInstallSafeCategory(CFSTR("BooksSUWebViewAccessibility"));
  IMAccessibilityInstallSafeCategory(CFSTR("BKWebViewAccessibility"));
  IMAccessibilityInstallSafeCategory(CFSTR("BooksDOMNodeAccessibility"));
  IMAccessibilityInstallSafeCategory(CFSTR("BKPictureBookWebViewAccessibility"));
  IMAccessibilityInstallSafeCategory(CFSTR("BKSearchViewControllerAccessibility"));
  IMAccessibilityInstallSafeCategory(CFSTR("BKSpreadThumbnailDirectoryCellAccessibility"));
  IMAccessibilityInstallSafeCategory(CFSTR("BKUICalloutBarAccessibility"));
  IMAccessibilityInstallSafeCategory(CFSTR("BKUIWebPlugInViewAccessibility"));
  IMAccessibilityInstallSafeCategory(CFSTR("BKAXUILabelAccessibility"));
  IMAccessibilityInstallSafeCategory(CFSTR("BKUIButtonAccessibility"));
  IMAccessibilityInstallSafeCategory(CFSTR("BKUIPickerComponentAccessibility"));
  IMAccessibilityInstallSafeCategory(CFSTR("BKAVRouteButtonAccessibility"));
  IMAccessibilityInstallSafeCategory(CFSTR("BKUITransitionViewAccessibility"));
  v5 = -[objc_class imaxValueForKey:](NSClassFromString(CFSTR("THAccessibility")), "imaxValueForKey:", CFSTR("sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v6, "imaxValueForKey:", CFSTR("loadAccessibilitySupport"));

  -[BKApplication _loadWebKitOverrides](self, "_loadWebKitOverrides");
}

- (void)_loadWebKitOverrides
{
  dispatch_time_t v2;

  v2 = dispatch_time(0, 6000000000);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, &stru_1008E84C0);
}

- (void)_accessibilitySetUpQuickSpeak
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BKApplication;
  -[BKApplication _accessibilitySetUpQuickSpeak](&v2, "_accessibilitySetUpQuickSpeak");
  +[THAccessibility2 loadQuickSpeakSupport](THAccessibility2, "loadQuickSpeakSupport");
}

- (id)_accessibilitySpeakThisPreferredHighlightColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMCommonCoreAccessibility sharedInstance](IMCommonCoreAccessibility, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "preferredSpeakScreenHighlightColor"));

  return v3;
}

- (id)_accessibilitySpeakThisPreferredUnderlineColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMCommonCoreAccessibility sharedInstance](IMCommonCoreAccessibility, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "preferredSpeakScreenUnderlineColor"));

  return v3;
}

@end
