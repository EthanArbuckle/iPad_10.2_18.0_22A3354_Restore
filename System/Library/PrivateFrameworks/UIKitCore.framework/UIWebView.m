@implementation UIWebView

- (BOOL)isElementAccessibilityExposedToInterfaceBuilder
{
  return 0;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    _UIApplicationLoadWebKit();
}

- (BOOL)keyboardDisplayRequiresUserAction
{
  return !-[UIWebBrowserView inputViewObeysDOMFocus](self->_internal->browserView, "inputViewObeysDOMFocus");
}

- (void)setKeyboardDisplayRequiresUserAction:(BOOL)keyboardDisplayRequiresUserAction
{
  -[UIWebBrowserView setInputViewObeysDOMFocus:](self->_internal->browserView, "setInputViewObeysDOMFocus:", !keyboardDisplayRequiresUserAction);
}

- (void)_didRotate:(id)a3
{
  UIWebViewInternal *internal;

  internal = self->_internal;
  if ((*((_BYTE *)internal + 40) & 4) == 0)
  {
    if (-[UIView window](internal->browserView, "window", a3))
      -[UIWebDocumentView sendOrientationEventForOrientation:](self->_internal->browserView, "sendOrientationEventForOrientation:", objc_msgSend((id)UIApp, "_sceneInterfaceOrientationFromWindow:", -[UIView window](self->_internal->browserView, "window")));
  }
}

- (void)_setScalesPageToFitViewportSettings
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[UIView bounds](self, "bounds");
  v4 = v3;
  -[UIWebDocumentView _restoreViewportSettingsWithSize:](self->_internal->browserView, "_restoreViewportSettingsWithSize:", v3, v5);
  LODWORD(v6) = -1.0;
  -[UIWebDocumentView setInitialScale:forDocumentTypes:](self->_internal->browserView, "setInitialScale:forDocumentTypes:", 16, v6);
  LODWORD(v7) = 0.25;
  -[UIWebDocumentView setMinimumScale:forDocumentTypes:](self->_internal->browserView, "setMinimumScale:forDocumentTypes:", 16, v7);
  -[UIWebDocumentView setViewportSize:forDocumentTypes:](self->_internal->browserView, "setViewportSize:forDocumentTypes:", 16, 980.0, -1.0);
  LODWORD(v8) = -1.0;
  -[UIWebDocumentView setInitialScale:forDocumentTypes:](self->_internal->browserView, "setInitialScale:forDocumentTypes:", 8, v8);
  -[UIWebDocumentView setViewportSize:forDocumentTypes:](self->_internal->browserView, "setViewportSize:forDocumentTypes:", 8, v4, -1.0);
}

- (void)_setRichTextReaderViewportSettings
{
  double v2;
  double v4;
  double v5;
  UIWebBrowserView *browserView;
  double v7;

  LODWORD(v2) = 1.0;
  -[UIWebDocumentView setInitialScale:forDocumentTypes:](self->_internal->browserView, "setInitialScale:forDocumentTypes:", 0xFFFFFFLL, v2);
  LODWORD(v4) = 1.0;
  -[UIWebDocumentView setMinimumScale:forDocumentTypes:](self->_internal->browserView, "setMinimumScale:forDocumentTypes:", 0xFFFFFFLL, v4);
  LODWORD(v5) = 1.0;
  -[UIWebDocumentView setMaximumScale:forDocumentTypes:](self->_internal->browserView, "setMaximumScale:forDocumentTypes:", 0xFFFFFFLL, v5);
  -[UIWebDocumentView setAllowsUserScaling:forDocumentTypes:](self->_internal->browserView, "setAllowsUserScaling:forDocumentTypes:", 0, 0xFFFFFFLL);
  browserView = self->_internal->browserView;
  -[UIView bounds](self, "bounds");
  -[UIWebDocumentView setViewportSize:forDocumentTypes:](browserView, "setViewportSize:forDocumentTypes:", 0xFFFFFFLL, v7, -1.0);
}

- (void)_updateViewSettings
{
  UIScrollView *scroller;
  double v4;
  double v5;
  double v6;
  double v7;
  UIWebViewInternal *internal;
  double v9;
  double v10;
  double v11;
  double v12;
  UIWebViewInternal *v13;
  UIWebBrowserView *browserView;
  double v15;
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
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  UIWebViewInternal *v31;
  UIWebBrowserView *v32;
  _BOOL8 v33;
  double x;
  double y;
  double width;
  double height;
  double MaxX;
  double v39;
  double MaxY;
  char isKindOfClass;
  UIWebViewInternal *v42;
  UIScrollView *v43;
  uint64_t v44;
  CGRect v45;
  CGRect v46;

  if (-[UIWebPDFViewHandler pdfView](self->_internal->pdfHandler, "pdfView"))
  {
    scroller = self->_internal->scroller;
    -[UIView bounds](self, "bounds");
    -[UIScrollView setFrame:](scroller, "setFrame:");
    -[UIWebPDFViewHandler updateViewSettings](self->_internal->pdfHandler, "updateViewSettings");
  }
  else
  {
    -[UIView bounds](self, "bounds");
    internal = self->_internal;
    if (v6 == 0.0 || (v9 = v7, v7 == 0.0))
    {
      -[UIWebTiledView removeAllTiles](internal->browserView, "removeAllTiles");
    }
    else
    {
      v10 = v4;
      v11 = v5;
      v12 = v6;
      if ((*((_BYTE *)internal + 40) & 1) != 0)
        -[UIWebView _setScalesPageToFitViewportSettings](self, "_setScalesPageToFitViewportSettings");
      else
        -[UIWebView _setRichTextReaderViewportSettings](self, "_setRichTextReaderViewportSettings");
      -[UIScrollView setFrame:](self->_internal->scroller, "setFrame:", v10, v11, v12, v9);
      -[UIWebView _updateScrollViewInsetAdjustmentBehavior](self, "_updateScrollViewInsetAdjustmentBehavior");
      v13 = self->_internal;
      browserView = v13->browserView;
      v15 = 0.0;
      v16 = 0.0;
      v17 = 0.0;
      v18 = 0.0;
      if ((*((_BYTE *)v13 + 41) & 1) == 0)
        -[UIView safeAreaInsets](self, "safeAreaInsets", 0.0, 0.0, 0.0, 0.0);
      -[UIWebBrowserView _setUnobscuredSafeAreaInsets:](browserView, "_setUnobscuredSafeAreaInsets:", v15, v16, v17, v18);
      -[UIScrollView adjustedContentInset](self->_internal->scroller, "adjustedContentInset");
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;
      -[UIScrollView keyboardBottomInsetAdjustmentDelta](self->_internal->scroller, "keyboardBottomInsetAdjustmentDelta");
      v28 = v9 - (v20 + v24 - v27);
      v29 = fmax(v12 - (v22 + v26), 1.0);
      v30 = fmax(v28, 1.0);
      -[UIWebView _updateBrowserViewExposedScrollViewRect](self, "_updateBrowserViewExposedScrollViewRect");
      v31 = self->_internal;
      v32 = v31->browserView;
      v33 = (*((_BYTE *)v31 + 40) & 1) == 0 && -[UIWebDocumentView documentType](v32, "documentType") == 4;
      -[UIWebDocumentView setMinimumSize:updateCurrentViewportConfigurationSize:](v32, "setMinimumSize:updateCurrentViewportConfigurationSize:", v33, v29, v30);
      -[UIView frame](self->_internal->browserView, "frame");
      x = v45.origin.x;
      y = v45.origin.y;
      width = v45.size.width;
      height = v45.size.height;
      MaxX = CGRectGetMaxX(v45);
      if (MaxX < v29)
        MaxX = v29;
      v39 = round(MaxX);
      v46.origin.x = x;
      v46.origin.y = y;
      v46.size.width = width;
      v46.size.height = height;
      MaxY = CGRectGetMaxY(v46);
      if (MaxY < v30)
        MaxY = v30;
      -[UIScrollView setContentSize:](self->_internal->scroller, "setContentSize:", v39, round(MaxY));
      -[UIView setFrame:](self->_internal->checkeredPatternView, "setFrame:", x, y, width, height);
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v42 = self->_internal;
      v43 = v42->scroller;
      v44 = *((_BYTE *)v42 + 40) & 1;
      if ((isKindOfClass & 1) != 0)
        -[UIScrollView _weaklySetBouncesHorizontally:](v43, "_weaklySetBouncesHorizontally:", v44);
      else
        -[UIScrollView setBouncesHorizontally:](v43, "setBouncesHorizontally:", v44);
      WebThreadLock();
      objc_msgSend((id)objc_msgSend(-[UIWebDocumentView webView](self->_internal->browserView, "webView"), "mainFrame"), "_setTextAutosizingWidth:", v12);
      -[UIWebTiledView layoutTilesNow](self->_internal->browserView, "layoutTilesNow");
    }
  }
}

- (void)_updateScrollViewInsetAdjustmentBehavior
{
  id v3;
  uint64_t v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = -[UIWebView _scrollView](self, "_scrollView");
    if ((objc_msgSend(v3, "_contentInsetAdjustmentBehaviorWasExternallyOverridden") & 1) == 0)
    {
      if ((*((_BYTE *)self->_internal + 41) & 1) != 0)
        v4 = 3;
      else
        v4 = 2;
      objc_msgSend(v3, "_setContentInsetAdjustmentBehaviorInternal:", v4);
    }
  }
}

- (void)_updateBrowserViewExposedScrollViewRect
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
  double v12;
  double v13;
  double v14;
  double v15;

  v3 = -[UIWebView _scrollView](self, "_scrollView");
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "adjustedContentInset");
  objc_msgSend(-[UIWebView _browserView](self, "_browserView"), "setExposedScrollViewRect:", v5 + v12, v7 + v13, v9 - (v12 + v14), v11 - (v13 + v15));
}

+ (id)_relativePathFromAbsolutePath:(id)a3 removingPathComponents:(unint64_t)a4
{
  void *v5;
  unint64_t v6;
  unint64_t v7;
  __CFString *v8;

  v5 = (void *)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("/"));
  v6 = objc_msgSend(v5, "count");
  if (v6 <= a4)
    return &stru_1E16EDF20;
  v7 = v6;
  v8 = &stru_1E16EDF20;
  do
    v8 = (__CFString *)-[__CFString stringByAppendingPathComponent:](v8, "stringByAppendingPathComponent:", objc_msgSend(v5, "objectAtIndex:", a4++));
  while (v7 != a4);
  return v8;
}

+ (void)_fixPathsForSandboxDirectoryChange
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  NSString *v8;
  uint64_t v9;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = *MEMORY[0x1E0DD9830];
  v4 = objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0DD9830]);
  v5 = (_QWORD *)MEMORY[0x1E0DD97E0];
  v6 = objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0DD97E0]);
  if (v4 | v6)
  {
    v7 = (void *)v6;
    if (objc_msgSend((id)v4, "hasPrefix:", CFSTR("/var/mobile/Applications/")))
    {
      objc_msgSend(v2, "removeObjectForKey:", v3);
      v4 = 0;
    }
    if (objc_msgSend(v7, "hasPrefix:", CFSTR("/var/mobile/Applications/")))
    {
      objc_msgSend(v2, "removeObjectForKey:", *v5);
      v7 = 0;
    }
    v8 = NSHomeDirectory();
    if (objc_msgSend((id)v4, "isEqualToString:", v8))
    {
      objc_msgSend(v2, "removeObjectForKey:", v3);
      v4 = 0;
    }
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      objc_msgSend(v2, "removeObjectForKey:", *v5);
      v7 = 0;
    }
    v9 = -[NSArray count](-[NSString componentsSeparatedByString:](v8, "componentsSeparatedByString:", CFSTR("/")), "count");
    if (v4 && objc_msgSend((id)v4, "rangeOfString:options:", v8, 8) == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v2, "setObject:forKey:", -[NSString stringByAppendingPathComponent:](v8, "stringByAppendingPathComponent:", +[UIWebView _relativePathFromAbsolutePath:removingPathComponents:](UIWebView, "_relativePathFromAbsolutePath:removingPathComponents:", v4, v9)), v3);
    if (v7)
    {
      if (objc_msgSend(v7, "rangeOfString:options:", v8, 8) == 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v2, "setObject:forKey:", -[NSString stringByAppendingPathComponent:](v8, "stringByAppendingPathComponent:", +[UIWebView _relativePathFromAbsolutePath:removingPathComponents:](UIWebView, "_relativePathFromAbsolutePath:removingPathComponents:", v7, v9)), *v5);
    }
  }
}

+ (void)_updatePersistentStoragePaths
{
  if (_updatePersistentStoragePaths_updatePaths != -1)
    dispatch_once(&_updatePersistentStoragePaths_updatePaths, &__block_literal_global_686);
}

void __42__UIWebView__updatePersistentStoragePaths__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *global_queue;
  _QWORD v12[6];

  if ((objc_msgSend(_UIMainBundleIdentifier(), "isEqualToString:", CFSTR("com.apple.webapp")) & 1) == 0)
  {
    if (_sandbox_in_a_container())
      +[UIWebView _fixPathsForSandboxDirectoryChange](UIWebView, "_fixPathsForSandboxDirectoryChange");
    v0 = -[NSArray objectAtIndex:](NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1), "objectAtIndex:", 0);
    v1 = objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("Caches"));
    v2 = objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("WebKit/LocalStorage"));
    v3 = objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("WebKit/Databases"));
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = *MEMORY[0x1E0DD9830];
    v6 = (void *)objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DD9830]);
    v7 = (_QWORD *)MEMORY[0x1E0DD97E0];
    v8 = (void *)objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DD97E0]);
    v9 = objc_msgSend(v4, "objectForKey:", CFSTR("WebKitStoreWebDataForBackup"));
    if (v9)
    {
      v10 = (void *)v9;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (!objc_msgSend(v10, "BOOLValue"))
          v2 = v1;
        if ((objc_msgSend(v6, "isEqualToString:", v2) & 1) == 0)
          objc_msgSend(v4, "setObject:forKey:", v2, v5);
        if ((objc_msgSend(v8, "isEqualToString:", v2) & 1) == 0)
          objc_msgSend(v4, "setObject:forKey:", v2, *v7);
      }
    }
    else if (!v6 || !v8)
    {
      objc_msgSend(v4, "setObject:forKey:", v1, v5);
      objc_msgSend(v4, "setObject:forKey:", v1, *v7);
      objc_msgSend(v4, "synchronize");
      if ((_UIIsPrivateMainBundle() & 1) == 0)
      {
        global_queue = dispatch_get_global_queue(-2, 0);
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __42__UIWebView__updatePersistentStoragePaths__block_invoke_2;
        v12[3] = &unk_1E16C3CF0;
        v12[4] = v2;
        v12[5] = v3;
        dispatch_async(global_queue, v12);
      }
    }
  }
}

uint64_t __42__UIWebView__updatePersistentStoragePaths__block_invoke_2(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtPath:error:", *(_QWORD *)(a1 + 32), 0);
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtPath:error:", *(_QWORD *)(a1 + 40), 0);
}

- (void)_webViewCommonInitWithWebView:(id)a3 scalesPageToFit:(BOOL)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIWebBrowserView *v15;
  UIWebBrowserView *v16;
  _UIWebViewScrollView *v17;
  id v18;
  void *v19;
  id v20;

  +[UIWebView _updatePersistentStoragePaths](UIWebView, "_updatePersistentStoragePaths");
  self->_internal = objc_alloc_init(UIWebViewInternal);
  WebThreadLock();
  -[UIView bounds](self, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = [UIWebBrowserView alloc];
  if (a3)
    v16 = -[UIWebBrowserView initWithWebView:frame:](v15, "initWithWebView:frame:", a3, v8, v10, v12, v14);
  else
    v16 = -[UIWebBrowserView initWithFrame:](v15, "initWithFrame:", v8, v10, v12, v14);
  self->_internal->browserView = v16;
  -[UIWebBrowserView set_editingDelegateForEverythingExceptForms:](self->_internal->browserView, "set_editingDelegateForEverythingExceptForms:", self);
  v17 = -[_UIWebViewScrollView initWithFrame:]([_UIWebViewScrollView alloc], "initWithFrame:", v8, v10, v12, v14);
  self->_internal->scroller = &v17->super.super;
  -[_UIWebViewScrollView _setWebView:](v17, "_setWebView:", self);
  -[UIScrollView _forceDelegateScrollViewDidZoom:](self->_internal->scroller, "_forceDelegateScrollViewDidZoom:", 1);
  -[UIView addSubview:](self->_internal->scroller, "addSubview:", self->_internal->browserView);
  -[UIView setAutoresizingMask:](self->_internal->scroller, "setAutoresizingMask:", 16);
  *((_BYTE *)self->_internal + 40) = *((_BYTE *)self->_internal + 40) & 0xFE | a4;
  self->_internal->checkeredPatternView = -[UICheckeredPatternView initWithFrame:]([UICheckeredPatternView alloc], "initWithFrame:", v8, v10, v12, v14);
  *((_BYTE *)self->_internal + 40) &= ~8u;
  -[UIWebView _updateCheckeredPattern](self, "_updateCheckeredPattern");
  -[UIWebTiledView setTilingEnabled:](self->_internal->browserView, "setTilingEnabled:", 1);
  -[UIWebView _setDrawInWebThread:](self, "_setDrawInWebThread:", 1);
  *((_BYTE *)self->_internal + 41) |= 1u;
  -[UIWebDocumentView setAutoresizes:](self->_internal->browserView, "setAutoresizes:", 1);
  -[UIView setContentsPosition:](self->_internal->browserView, "setContentsPosition:", 7);
  -[UIWebDocumentView setDelegate:](self->_internal->browserView, "setDelegate:", self);
  -[UIWebDocumentView setSmoothsFonts:](self->_internal->browserView, "setSmoothsFonts:", 1);
  -[UIWebView _updateOpaqueAndBackgroundColor](self, "_updateOpaqueAndBackgroundColor");
  v18 = -[UIWebDocumentView webView](self->_internal->browserView, "webView");
  self->_internal->webViewDelegate = -[UIWebViewWebViewDelegate initWithUIWebView:]([UIWebViewWebViewDelegate alloc], "initWithUIWebView:", self);
  objc_msgSend(v18, "setFrameLoadDelegate:", self->_internal->webViewDelegate);
  objc_msgSend(v18, "setPolicyDelegate:", self->_internal->webViewDelegate);
  objc_msgSend(v18, "setUIDelegate:", self->_internal->webViewDelegate);
  objc_msgSend(v18, "setResourceLoadDelegate:", self->_internal->webViewDelegate);
  objc_msgSend(v18, "_setFontFallbackPrefersPictographs:", 0);
  objc_msgSend(v18, "_setUseDarkAppearance:useElevatedUserInterfaceLevel:", -[UIWebView _effectiveAppearanceIsDark](self, "_effectiveAppearanceIsDark"), -[UIWebView _effectiveTraitsUseElevatedUserInterfaceLevel](self, "_effectiveTraitsUseElevatedUserInterfaceLevel"));
  objc_msgSend((id)objc_msgSend(v18, "window"), "setRootLayer:", -[UIView layer](self, "layer"));
  v19 = (void *)objc_msgSend(v18, "preferences");
  objc_msgSend(v19, "setOfflineWebApplicationCacheEnabled:", 1);
  objc_msgSend(v19, "_setLocalStorageDatabasePath:", objc_msgSend(MEMORY[0x1E0DD97A0], "_storageDirectoryPath"));
  WebKitGetMinimumZoomFontSize();
  objc_msgSend(v19, "_setMinimumZoomFontSize:");
  objc_msgSend(v19, "_setAllowMultiElementImplicitFormSubmission:", 0);
  -[UIView addSubview:](self, "addSubview:", self->_internal->scroller);
  -[UIWebView _updateViewSettings](self, "_updateViewSettings");
  -[UIWebDocumentView _setDocumentType:](self->_internal->browserView, "_setDocumentType:", 4);
  -[UIWebDocumentView setDetectsPhoneNumbers:](self->_internal->browserView, "setDetectsPhoneNumbers:", 1);
  *((_BYTE *)self->_internal + 40) |= 0x10u;
  if (!_webViewCommonInitWithWebView_scalesPageToFit__backgroundColor)
    _webViewCommonInitWithWebView_scalesPageToFit__backgroundColor = +[UIColor _webContentBackgroundColor](UIColor, "_webContentBackgroundColor");
  if (!-[UIView backgroundColor](self, "backgroundColor"))
    -[UIWebView setBackgroundColor:](self, "setBackgroundColor:", _webViewCommonInitWithWebView_scalesPageToFit__backgroundColor);
  if (!objc_msgSend(MEMORY[0x1E0DD9758], "optionalSharedHistory"))
  {
    v20 = objc_alloc_init(MEMORY[0x1E0DD9758]);
    objc_msgSend(MEMORY[0x1E0DD9758], "setOptionalSharedHistory:", v20);

  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel__didRotate_, CFSTR("UIWindowDidRotateNotification"), 0);
  *((_BYTE *)self->_internal + 40) &= ~4u;
  self->_internal->pdfHandler = objc_alloc_init(UIWebPDFViewHandler);
  -[UIWebPDFViewHandler setScalesPageToFit:](self->_internal->pdfHandler, "setScalesPageToFit:", *((_BYTE *)self->_internal + 40) & 1);
  -[UIWebPDFViewHandler setShowPageLabels:](self->_internal->pdfHandler, "setShowPageLabels:", 1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v18, "_installVisualIdentificationOverlayForViewIfNeeded:kind:", self, CFSTR("UIWebView"));
}

- (id)_initWithFrame:(CGRect)a3 enableReachability:(BOOL)a4
{
  UIWebView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIWebView;
  v5 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    if (!a4)
      objc_msgSend(MEMORY[0x1E0DD97A8], "_doNotStartObservingNetworkReachability");
    -[UIWebView _webViewCommonInitWithWebView:scalesPageToFit:](v5, "_webViewCommonInitWithWebView:scalesPageToFit:", 0, 0);
  }
  return v5;
}

- (UIWebView)initWithFrame:(CGRect)a3
{
  UIWebView *v3;
  UIWebView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIWebView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[UIWebView _webViewCommonInitWithWebView:scalesPageToFit:](v3, "_webViewCommonInitWithWebView:scalesPageToFit:", 0, 0);
  return v4;
}

- (UIWebView)initWithCoder:(id)a3
{
  UIWebView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIWebView;
  v4 = -[UIView initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    -[UIWebView _webViewCommonInitWithWebView:scalesPageToFit:](v4, "_webViewCommonInitWithWebView:scalesPageToFit:", 0, objc_msgSend(a3, "decodeBoolForKey:", CFSTR("UIScalesPageToFit")));
    v4->_internal->delegate = (UIWebViewDelegate *)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("UIDelegate"));
    -[UIWebDocumentView setDataDetectorTypes:](v4->_internal->browserView, "setDataDetectorTypes:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("UIDataDetectorTypes")));
  }
  return v4;
}

- (void)_populateArchivedSubviews:(id)a3
{
  UIWebViewInternal *internal;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIWebView;
  -[UIView _populateArchivedSubviews:](&v6, sel__populateArchivedSubviews_);
  internal = self->_internal;
  if (internal)
  {
    if (internal->scroller)
      objc_msgSend(a3, "removeObject:");
  }
}

- (void)encodeWithCoder:(id)a3
{
  UIWebViewInternal *internal;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIWebView;
  -[UIView encodeWithCoder:](&v7, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeConditionalObject:forKey:", self->_internal->delegate, CFSTR("UIDelegate"));
  internal = self->_internal;
  if ((*((_BYTE *)internal + 40) & 1) != 0)
  {
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("UIScalesPageToFit"));
    internal = self->_internal;
  }
  v6 = -[UIWebDocumentView dataDetectorTypes](internal->browserView, "dataDetectorTypes");
  if (v6)
    objc_msgSend(a3, "encodeInteger:forKey:", v6, CFSTR("UIDataDetectorTypes"));
}

- (void)dealloc
{
  id v3;
  objc_super v4;

  WebThreadLock();
  v3 = -[UIWebDocumentView webView](self->_internal->browserView, "webView");
  objc_msgSend(v3, "_clearDelegates");
  -[UIWebViewWebViewDelegate _clearUIWebView](self->_internal->webViewDelegate, "_clearUIWebView");

  objc_msgSend((id)objc_msgSend(v3, "window"), "setRootLayer:", 0);
  -[UIScrollView setDelegate:](self->_internal->scroller, "setDelegate:", 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[UIScrollView _setWebView:](self->_internal->scroller, "_setWebView:", 0);

  -[UIWebBrowserView set_editingDelegateForEverythingExceptForms:](self->_internal->browserView, "set_editingDelegateForEverythingExceptForms:", 0);
  -[UIWebDocumentView setDelegate:](self->_internal->browserView, "setDelegate:", 0);

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("UIWindowDidRotateNotification"), 0);
  v4.receiver = self;
  v4.super_class = (Class)UIWebView;
  -[UIView dealloc](&v4, sel_dealloc);
}

- (BOOL)_shouldUseViewForSceneDraggingBehavior
{
  return 0;
}

- (NSString)stringByEvaluatingJavaScriptFromString:(NSString *)script
{
  NSString *v5;

  WebThreadLock();
  v5 = (NSString *)objc_msgSend(-[UIWebDocumentView webView](self->_internal->browserView, "webView"), "stringByEvaluatingJavaScriptFromString:", script);
  -[UIWebBrowserView _startURLificationIfNeededCoalesce:](self->_internal->browserView, "_startURLificationIfNeededCoalesce:", 1);
  return v5;
}

- (void)setDetectsPhoneNumbers:(BOOL)detectsPhoneNumbers
{
  -[UIWebDocumentView setDetectsPhoneNumbers:](self->_internal->browserView, "setDetectsPhoneNumbers:", detectsPhoneNumbers);
}

- (BOOL)detectsPhoneNumbers
{
  return -[UIWebDocumentView detectsPhoneNumbers](self->_internal->browserView, "detectsPhoneNumbers");
}

- (void)setDataDetectorTypes:(UIDataDetectorTypes)dataDetectorTypes
{
  -[UIWebDocumentView setDataDetectorTypes:](self->_internal->browserView, "setDataDetectorTypes:", dataDetectorTypes);
}

- (UIDataDetectorTypes)dataDetectorTypes
{
  return -[UIWebDocumentView dataDetectorTypes](self->_internal->browserView, "dataDetectorTypes");
}

- (void)setAllowsInlineMediaPlayback:(BOOL)allowsInlineMediaPlayback
{
  -[UIWebBrowserView setAllowsInlineMediaPlayback:](self->_internal->browserView, "setAllowsInlineMediaPlayback:", allowsInlineMediaPlayback);
}

- (BOOL)allowsInlineMediaPlayback
{
  return -[UIWebBrowserView allowsInlineMediaPlayback](self->_internal->browserView, "allowsInlineMediaPlayback");
}

- (void)setMediaPlaybackRequiresUserAction:(BOOL)mediaPlaybackRequiresUserAction
{
  -[UIWebBrowserView setMediaPlaybackRequiresUserAction:](self->_internal->browserView, "setMediaPlaybackRequiresUserAction:", mediaPlaybackRequiresUserAction);
}

- (BOOL)mediaPlaybackRequiresUserAction
{
  return -[UIWebBrowserView mediaPlaybackRequiresUserAction](self->_internal->browserView, "mediaPlaybackRequiresUserAction");
}

- (void)setMediaPlaybackAllowsAirPlay:(BOOL)mediaPlaybackAllowsAirPlay
{
  -[UIWebDocumentView setMediaPlaybackAllowsAirPlay:](self->_internal->browserView, "setMediaPlaybackAllowsAirPlay:", mediaPlaybackAllowsAirPlay);
}

- (BOOL)mediaPlaybackAllowsAirPlay
{
  return -[UIWebDocumentView mediaPlaybackAllowsAirPlay](self->_internal->browserView, "mediaPlaybackAllowsAirPlay");
}

- (void)setAllowsPictureInPictureMediaPlayback:(BOOL)allowsPictureInPictureMediaPlayback
{
  -[UIWebBrowserView setAllowsPictureInPictureVideo:](self->_internal->browserView, "setAllowsPictureInPictureVideo:", allowsPictureInPictureMediaPlayback);
}

- (BOOL)allowsPictureInPictureMediaPlayback
{
  return -[UIWebBrowserView allowsPictureInPictureVideo](self->_internal->browserView, "allowsPictureInPictureVideo");
}

- (void)setAllowsLinkPreview:(BOOL)allowsLinkPreview
{
  -[UIWebBrowserView setAllowsLinkPreview:](self->_internal->browserView, "setAllowsLinkPreview:", allowsLinkPreview);
}

- (BOOL)allowsLinkPreview
{
  return -[UIWebBrowserView allowsLinkPreview](self->_internal->browserView, "allowsLinkPreview");
}

- (void)setScalesPageToFit:(BOOL)scalesPageToFit
{
  UIWebViewInternal *internal;
  char v4;

  internal = self->_internal;
  v4 = *((_BYTE *)internal + 40);
  if (((((v4 & 1) == 0) ^ scalesPageToFit) & 1) == 0)
  {
    *((_BYTE *)internal + 40) = v4 & 0xFE | scalesPageToFit;
    -[UIWebPDFViewHandler setScalesPageToFit:](self->_internal->pdfHandler, "setScalesPageToFit:", *((_BYTE *)self->_internal + 40) & 1);
    -[UIWebView _updateViewSettings](self, "_updateViewSettings");
  }
}

- (BOOL)scalesPageToFit
{
  return *((_BYTE *)self->_internal + 40) & 1;
}

- (BOOL)isLoading
{
  return (*((unsigned __int8 *)self->_internal + 40) >> 1) & 1;
}

- (void)setDelegate:(id)delegate
{
  self->_internal->delegate = (UIWebViewDelegate *)delegate;
}

- (id)delegate
{
  return self->_internal->delegate;
}

- (UIScrollView)scrollView
{
  return self->_internal->scroller;
}

- (void)loadRequest:(NSURLRequest *)request
{
  -[UIWebDocumentView loadRequest:](self->_internal->browserView, "loadRequest:", request);
}

- (void)loadHTMLString:(NSString *)string baseURL:(NSURL *)baseURL
{
  -[UIWebDocumentView loadHTMLString:baseURL:](self->_internal->browserView, "loadHTMLString:baseURL:", string, baseURL);
}

- (void)loadData:(NSData *)data MIMEType:(NSString *)MIMEType textEncodingName:(NSString *)textEncodingName baseURL:(NSURL *)baseURL
{
  -[UIWebDocumentView loadData:MIMEType:textEncodingName:baseURL:](self->_internal->browserView, "loadData:MIMEType:textEncodingName:baseURL:", data, MIMEType, textEncodingName, baseURL);
}

- (NSURLRequest)request
{
  return self->_internal->request;
}

- (void)reload
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = -[UIWebDocumentView webView](self->_internal->browserView, "webView");
  if (v2)
  {
    v3 = v2;
    WebThreadLock();
    if (objc_msgSend(v3, "mainFrameURL"))
    {
      objc_msgSend(v3, "reload:", 0);
    }
    else
    {
      v4 = objc_msgSend((id)objc_msgSend(v3, "backForwardList"), "currentItem");
      if (v4)
        objc_msgSend(v3, "goToBackForwardItem:", v4);
    }
  }
}

- (void)stopLoading
{
  -[UIWebDocumentView stopLoading:](self->_internal->browserView, "stopLoading:", 0);
}

- (void)goBack
{
  objc_msgSend(-[UIWebDocumentView webView](self->_internal->browserView, "webView"), "goBack:", 0);
}

- (void)goForward
{
  objc_msgSend(-[UIWebDocumentView webView](self->_internal->browserView, "webView"), "goForward:", 0);
}

- (BOOL)canGoBack
{
  WebThreadLock();
  return objc_msgSend(-[UIWebDocumentView webView](self->_internal->browserView, "webView"), "canGoBack");
}

- (BOOL)canGoForward
{
  WebThreadLock();
  return objc_msgSend(-[UIWebDocumentView webView](self->_internal->browserView, "webView"), "canGoForward");
}

- (BOOL)suppressesIncrementalRendering
{
  return -[UIWebDocumentView suppressesIncrementalRendering](self->_internal->browserView, "suppressesIncrementalRendering");
}

- (void)setSuppressesIncrementalRendering:(BOOL)suppressesIncrementalRendering
{
  -[UIWebDocumentView setSuppressesIncrementalRendering:](self->_internal->browserView, "setSuppressesIncrementalRendering:", suppressesIncrementalRendering);
}

- (void)_updateCheckeredPattern
{
  UIWebViewInternal *internal;
  uint64_t v4;

  internal = self->_internal;
  if ((*((_BYTE *)internal + 40) & 8) != 0
    && (v4 = -[UIWebPDFViewHandler pdfView](internal->pdfHandler, "pdfView"), internal = self->_internal, !v4))
  {
    -[UIView insertSubview:atIndex:](internal->scroller, "insertSubview:atIndex:", internal->checkeredPatternView, 0);
  }
  else
  {
    -[UIView removeFromSuperview](internal->checkeredPatternView, "removeFromSuperview");
  }
}

- (BOOL)_effectiveAppearanceIsDark
{
  return -[UITraitCollection userInterfaceStyle](-[UIView traitCollection](self, "traitCollection"), "userInterfaceStyle") == UIUserInterfaceStyleDark;
}

- (BOOL)_effectiveTraitsUseElevatedUserInterfaceLevel
{
  return -[UITraitCollection userInterfaceLevel](-[UIView traitCollection](self, "traitCollection"), "userInterfaceLevel") == UIUserInterfaceLevelElevated;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  WebThreadLock();
  objc_msgSend(-[UIWebDocumentView webView](self->_internal->browserView, "webView"), "_setUseDarkAppearance:useElevatedUserInterfaceLevel:", -[UIWebView _effectiveAppearanceIsDark](self, "_effectiveAppearanceIsDark"), -[UIWebView _effectiveTraitsUseElevatedUserInterfaceLevel](self, "_effectiveTraitsUseElevatedUserInterfaceLevel"));
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UIScrollView contentSize](self->_internal->scroller, "contentSize", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_beginRotation
{
  -[UIView setAutoresizesSubviews:](self, "setAutoresizesSubviews:", 0);
  *((_BYTE *)self->_internal + 40) |= 0x40u;
  *((_BYTE *)self->_internal + 40) &= ~0x80u;
  -[UIWebDocumentView willRotateInteractionSheet](self->_internal->browserView, "willRotateInteractionSheet");
}

- (void)_finishRotation
{
  *((_BYTE *)self->_internal + 40) &= ~0x40u;
  -[UIWebBrowserView redrawScaledDocument](self->_internal->browserView, "redrawScaledDocument");
  -[UIWebView _updateViewSettings](self, "_updateViewSettings");
  -[UIView setAutoresizesSubviews:](self, "setAutoresizesSubviews:", 1);
  -[UIWebDocumentView didRotateInteractionSheet](self->_internal->browserView, "didRotateInteractionSheet");
}

- (void)_rescaleDocument
{
  UIWebViewInternal *internal;
  int v3;
  UIWebBrowserView *browserView;

  internal = self->_internal;
  v3 = *((char *)internal + 40);
  if ((v3 & 0x80000000) == 0)
  {
    *((_BYTE *)internal + 40) = v3 | 0x80;
    browserView = self->_internal->browserView;
    -[UIView bounds](self, "bounds");
    -[UIWebBrowserView rotateEnclosingScrollViewToFrame:](browserView, "rotateEnclosingScrollViewToFrame:");
  }
}

- (void)_frameOrBoundsChanged
{
  UIWebViewInternal *internal;
  UIWebViewInternal *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  internal = self->_internal;
  if (internal)
  {
    if (-[UIWebPDFViewHandler pdfView](internal->pdfHandler, "pdfView"))
    {
      -[UIView bounds](self, "bounds");
      v4 = self->_internal;
      if ((*((_BYTE *)v4 + 40) & 0x40) != 0)
      {
        -[UIWebPDFViewHandler rotateEnclosingScrollViewToFrame:](v4->pdfHandler, "rotateEnclosingScrollViewToFrame:");
      }
      else
      {
        -[UIScrollView setFrame:](v4->scroller, "setFrame:");
        -[UIWebPDFViewHandler updateViewSettings](self->_internal->pdfHandler, "updateViewSettings");
      }
    }
    else if ((*((_BYTE *)self->_internal + 40) & 0x40) != 0)
    {
      -[UIWebView _rescaleDocument](self, "_rescaleDocument");
    }
    else
    {
      -[UIView bounds](self, "bounds");
      v6 = v5;
      v8 = v7;
      -[UIView frame](self->_internal->browserView, "frame");
      if (v10 < v6 || v9 < v8)
        -[UIWebBrowserView setFrame:](self->_internal->browserView, "setFrame:");
      else
        -[UIWebView _updateViewSettings](self, "_updateViewSettings");
      -[UIWebDocumentView updateInteractionElements](self->_internal->browserView, "updateInteractionElements");
    }
  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)UIWebView;
  -[UIView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (v9 != width || v11 != height)
    -[UIWebView _frameOrBoundsChanged](self, "_frameOrBoundsChanged");
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)UIWebView;
  -[UIView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (v9 != width || v11 != height)
    -[UIWebView _frameOrBoundsChanged](self, "_frameOrBoundsChanged");
}

- (void)_updateOpaqueAndBackgroundColor
{
  UIWebViewInternal *internal;
  uint64_t v4;
  UIWebPDFView *browserView;
  UIColor *v6;

  internal = self->_internal;
  if ((*((_BYTE *)internal + 40) & 8) != 0
    && (v4 = -[UIWebPDFViewHandler pdfView](internal->pdfHandler, "pdfView"), internal = self->_internal, !v4))
  {
    -[UIWebDocumentView setOpaque:](internal->browserView, "setOpaque:", 0);
    browserView = (UIWebPDFView *)self->_internal->browserView;
    v6 = +[UIColor clearColor](UIColor, "clearColor");
  }
  else
  {
    -[UIWebDocumentView setOpaque:](internal->browserView, "setOpaque:", -[UIView isOpaque](self, "isOpaque"));
    -[UIView setBackgroundColor:](self->_internal->browserView, "setBackgroundColor:", -[UIView backgroundColor](self, "backgroundColor"));
    browserView = -[UIWebPDFViewHandler pdfView](self->_internal->pdfHandler, "pdfView");
    -[UIView setOpaque:](browserView, "setOpaque:", -[UIView isOpaque](self, "isOpaque"));
    v6 = -[UIView backgroundColor](self, "backgroundColor");
  }
  -[UIView setBackgroundColor:](browserView, "setBackgroundColor:", v6);
  -[UIWebDocumentView setDrawsBackground:](self->_internal->browserView, "setDrawsBackground:", -[UIView isOpaque](self, "isOpaque"));
}

- (void)setOpaque:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  objc_super v6;

  v3 = a3;
  v5 = -[UIView isOpaque](self, "isOpaque");
  v6.receiver = self;
  v6.super_class = (Class)UIWebView;
  -[UIView setOpaque:](&v6, sel_setOpaque_, v3);
  if (self->_internal)
  {
    if (v5 != -[UIView isOpaque](self, "isOpaque"))
      -[UIWebView _updateOpaqueAndBackgroundColor](self, "_updateOpaqueAndBackgroundColor");
  }
}

- (void)setBackgroundColor:(id)a3
{
  UIColor *v5;
  objc_super v6;

  v5 = -[UIView backgroundColor](self, "backgroundColor");
  v6.receiver = self;
  v6.super_class = (Class)UIWebView;
  -[UIView setBackgroundColor:](&v6, sel_setBackgroundColor_, a3);
  if (self->_internal)
  {
    if (!-[UIColor isEqual:](v5, "isEqual:", -[UIView backgroundColor](self, "backgroundColor")))
      -[UIWebView _updateOpaqueAndBackgroundColor](self, "_updateOpaqueAndBackgroundColor");
  }
}

- (BOOL)_appliesExclusiveTouchToSubviewTree
{
  return 1;
}

- (BOOL)_webView:(id)a3 previewIsAllowedForPosition:(CGPoint)a4
{
  double y;
  double x;

  y = a4.y;
  x = a4.x;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[UIWebViewDelegate uiWebView:previewIsAllowedForPosition:](self->_internal->delegate, "uiWebView:previewIsAllowedForPosition:", self, x, y);
  else
    return objc_msgSend(a3, "_previewAllowedForPosition:", x, y);
}

- (id)_webView:(id)a3 previewViewControllerForURL:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)-[UIWebViewDelegate uiWebView:previewViewControllerForURL:](self->_internal->delegate, "uiWebView:previewViewControllerForURL:", self, a4);
  else
    return 0;
}

- (void)_webView:(id)a3 willPresentPreview:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebViewDelegate uiWebView:willPresentPreview:](self->_internal->delegate, "uiWebView:willPresentPreview:", self, a4);
}

- (void)_webView:(id)a3 didDismissPreview:(id)a4 committing:(BOOL)a5
{
  _BOOL8 v5;

  v5 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebViewDelegate uiWebView:didDismissPreview:committing:](self->_internal->delegate, "uiWebView:didDismissPreview:committing:", self, a4, v5);
}

- (void)_webView:(id)a3 commitPreview:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebViewDelegate uiWebView:commitPreview:](self->_internal->delegate, "uiWebView:commitPreview:", self, a4);
}

- (id)_webView:(id)a3 presentationSnapshotForPreview:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)-[UIWebViewDelegate uiWebView:presentationSnapshotForPreview:](self->_internal->delegate, "uiWebView:presentationSnapshotForPreview:", self, a4);
  else
    return (id)objc_msgSend(-[UIWebView _documentView](self, "_documentView"), "_presentationSnapshotForPreview");
}

- (id)_webView:(id)a3 presentationRectsForPreview:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)-[UIWebViewDelegate uiWebView:presentationRectsForPreview:](self->_internal->delegate, "uiWebView:presentationRectsForPreview:", self, a4);
  else
    return (id)objc_msgSend(-[UIWebView _documentView](self, "_documentView"), "_presentationRectsForPreview");
}

- (void)_updateScrollerViewForInputView:(id)a3
{
  objc_msgSend(-[UIWebView _browserView](self, "_browserView"), "_updateScrollerViewForInputView:", a3);
}

- (void)webViewMainFrameDidFirstVisuallyNonEmptyLayoutInFrame:(id)a3
{
  -[UIWebPDFViewHandler updateViewHierarchyForFirstNonEmptyLayoutInFrame:](self->_internal->pdfHandler, "updateViewHierarchyForFirstNonEmptyLayoutInFrame:", a3);
}

- (void)webViewMainFrameDidCommitLoad:(id)a3
{
  -[UIWebPDFViewHandler updateViewHierarchyForDocumentViewNewLoad:](self->_internal->pdfHandler, "updateViewHierarchyForDocumentViewNewLoad:", a3);
}

- (void)webViewMainFrameDidFinishLoad:(id)a3
{
  -[UIWebPDFViewHandler updateViewHierarchyForDocumentViewLoadComplete:](self->_internal->pdfHandler, "updateViewHierarchyForDocumentViewLoadComplete:", a3);
  -[UIWebView _updateCheckeredPattern](self, "_updateCheckeredPattern");
  -[UIWebView _updateOpaqueAndBackgroundColor](self, "_updateOpaqueAndBackgroundColor");
}

- (void)webViewMainFrameDidFailLoad:(id)a3 withError:(id)a4
{
  -[UIWebPDFViewHandler updateViewHierarchyForDocumentViewLoadComplete:](self->_internal->pdfHandler, "updateViewHierarchyForDocumentViewLoadComplete:", a3, a4);
}

- (void)saveStateToHistoryItem:(id)a3 forWebView:(id)a4
{
  -[UIWebPDFViewHandler saveStateToHistoryItem:forWebView:](self->_internal->pdfHandler, "saveStateToHistoryItem:forWebView:", a3, a4);
}

- (void)restoreStateFromHistoryItem:(id)a3 forWebView:(id)a4
{
  -[UIWebPDFViewHandler restoreStateFromHistoryItem:forWebView:](self->_internal->pdfHandler, "restoreStateFromHistoryItem:forWebView:", a3, a4);
}

- (void)_webView:(id)a3 didChangeAvoidsUnsafeArea:(BOOL)a4
{
  *((_BYTE *)self->_internal + 41) = *((_BYTE *)self->_internal + 41) & 0xFE | a4;
  -[UIWebView _updateViewSettings](self, "_updateViewSettings", a3);
}

- (id)viewForZoomingInScrollView:(id)a3
{
  id result;

  result = -[UIWebPDFViewHandler pdfView](self->_internal->pdfHandler, "pdfView", a3);
  if (!result)
    return self->_internal->browserView;
  return result;
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  if (!-[UIWebPDFViewHandler pdfView](self->_internal->pdfHandler, "pdfView", a3, a4))
    -[UIWebDocumentView willStartZoom](self->_internal->browserView, "willStartZoom");
}

- (void)scrollViewDidZoom:(id)a3
{
  if (!-[UIWebPDFViewHandler pdfView](self->_internal->pdfHandler, "pdfView", a3))
    -[UIWebDocumentView didZoom](self->_internal->browserView, "didZoom");
}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  if (!-[UIWebPDFViewHandler pdfView](self->_internal->pdfHandler, "pdfView", a3, a4, a5))
  {
    -[UIWebBrowserView redrawScaledDocument](self->_internal->browserView, "redrawScaledDocument");
    -[UIWebDocumentView didEndZoom](self->_internal->browserView, "didEndZoom");
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  if (!-[UIWebPDFViewHandler pdfView](self->_internal->pdfHandler, "pdfView", a3))
    -[UIWebDocumentView willStartScroll](self->_internal->browserView, "willStartScroll");
}

- (void)_didCompleteScrolling
{
  if (!-[UIWebPDFViewHandler pdfView](self->_internal->pdfHandler, "pdfView"))
    objc_msgSend(-[UIWebView _browserView](self, "_browserView"), "didEndScroll");
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[UIWebView _didCompleteScrolling](self, "_didCompleteScrolling", a3);
}

- (void)scrollViewWasRemoved:(id)a3
{
  if (!-[UIWebPDFViewHandler pdfView](self->_internal->pdfHandler, "pdfView", a3))
    objc_msgSend(-[UIWebView _browserView](self, "_browserView"), "scrollViewWasRemoved");
}

- (void)_reportError:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebViewDelegate webView:didFailLoadWithError:](self->_internal->delegate, "webView:didFailLoadWithError:", self, a3);
}

- (void)webView:(id)a3 decidePolicyForNewWindowAction:(id)a4 request:(id)a5 newFrameName:(id)a6 decisionListener:(id)a7
{
  -[UIWebView webView:decidePolicyForNavigationAction:request:frame:decisionListener:](self, "webView:decidePolicyForNavigationAction:request:frame:decisionListener:", a3, a4, a5, objc_msgSend(-[UIWebDocumentView webView](self->_internal->browserView, "webView", a3, a4, a5, a6), "mainFrame"), a7);
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7
{
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;

  v11 = (void *)objc_msgSend(a5, "URL", a3);
  v12 = objc_msgSend(v11, "iTunesStoreURL");
  if (v12)
  {
    v13 = (id)objc_msgSend(a5, "mutableCopy");
    objc_msgSend(v13, "setURL:", v12);
    v14 = v13;
  }
  else
  {
    v14 = 0;
    v13 = a5;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v15 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", *MEMORY[0x1E0DD97D0]), "intValue");
    v16 = v15 >= 5 ? 5 : v15;
    if ((-[UIWebViewDelegate webView:shouldStartLoadWithRequest:navigationType:](self->_internal->delegate, "webView:shouldStartLoadWithRequest:navigationType:", self, a5, v16) & 1) == 0|| v12&& (-[UIWebViewDelegate webView:shouldStartLoadWithRequest:navigationType:](self->_internal->delegate, "webView:shouldStartLoadWithRequest:navigationType:", self, v14, v16) & 1) == 0)
    {
      goto LABEL_15;
    }
  }
  if (v12)
    v11 = (void *)v12;
  v17 = (void *)objc_msgSend(a4, "objectForKey:", *MEMORY[0x1E0DD97C8]);
  v18 = objc_msgSend(v17, "objectForKey:", *MEMORY[0x1E0DD97E8]);
  if (v18)
  {
    if (+[UIWebURLAction performDefaultActionForURL:andDOMNode:withAllowedTypes:forFrame:inView:](UIWebURLAction, "performDefaultActionForURL:andDOMNode:withAllowedTypes:forFrame:inView:", v11, v18, -3, a6, self))
    {
LABEL_15:
      objc_msgSend(a7, "ignore");
      return;
    }
  }
  if ((objc_msgSend(MEMORY[0x1E0DD97A8], "_canHandleRequest:", v13) & 1) != 0
    || !objc_msgSend(v11, "isSpringboardHandledURL"))
  {
    objc_msgSend(a7, "use");
    return;
  }
  if (!TelephonyUtilitiesLibraryCore_frameworkLibrary_1)
    TelephonyUtilitiesLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  if (!TelephonyUtilitiesLibraryCore_frameworkLibrary_1)
  {
    v20 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *TelephonyUtilitiesLibrary(void)"), CFSTR("UIWebView.m"), 78, CFSTR("%s"), 0);
    __break(1u);
    free(v21);
  }
  if (objc_msgSend(v11, "hasTelephonyScheme"))
  {
    v19 = objc_msgSend(MEMORY[0x1E0C99E98], "telephonyURLWithDestinationID:promptUser:", objc_msgSend(v11, "phoneNumber"), 1);
  }
  else
  {
    if ((objc_msgSend(v11, "isFaceTimeURL") & 1) == 0 && !objc_msgSend(v11, "isFaceTimeAudioURL"))
      goto LABEL_29;
    v19 = objc_msgSend(MEMORY[0x1E0C99E98], "faceTimePromptURLWithURL:", v11);
  }
  v11 = (void *)v19;
LABEL_29:
  objc_msgSend((id)UIApp, "_openURL:originatingView:completionHandler:", v11, self, 0);
  objc_msgSend(a7, "ignore");
}

- (void)webView:(id)a3 decidePolicyForMIMEType:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7
{
  void *v13;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIWebViewDelegate uiWebView:decidePolicyForMIMEType:request:frame:decisionListener:](self->_internal->delegate, "uiWebView:decidePolicyForMIMEType:request:frame:decisionListener:", self, a4, a5, a6, a7);
  }
  else
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0DD9740], "sharedPolicyDelegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v13, "webView:decidePolicyForMIMEType:request:frame:decisionListener:", a3, a4, a5, a6, a7);
  }
}

- (void)webView:(id)a3 unableToImplementPolicyWithError:(id)a4 frame:(id)a5
{
  -[UIWebView _reportError:](self, "_reportError:", a4);
}

- (void)webView:(id)a3 frame:(id)a4 exceededDatabaseQuotaForSecurityOrigin:(id)a5 database:(id)a6
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebViewDelegate uiWebView:frame:exceededDatabaseQuotaForSecurityOrigin:database:](self->_internal->delegate, "uiWebView:frame:exceededDatabaseQuotaForSecurityOrigin:database:", self, a4, a5, a6);
  else
    objc_msgSend((id)objc_msgSend(a5, "databaseQuotaManager"), "setQuota:", 52428800);
}

- (void)webView:(id)a3 exceededApplicationCacheOriginQuotaForSecurityOrigin:(id)a4 totalSpaceNeeded:(unint64_t)a5
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebViewDelegate uiWebView:exceededApplicationCacheOriginQuotaForSecurityOrigin:totalSpaceNeeded:](self->_internal->delegate, "uiWebView:exceededApplicationCacheOriginQuotaForSecurityOrigin:totalSpaceNeeded:", self, a4, a5);
  else
    objc_msgSend((id)objc_msgSend(a4, "applicationCacheQuotaManager"), "setQuota:", 52428800);
}

- (void)webView:(id)a3 printFrameView:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebViewDelegate uiWebView:printFrameView:](self->_internal->delegate, "uiWebView:printFrameView:", self, a4);
}

- (void)webViewSupportedOrientationsUpdated:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebViewDelegate uiWebViewSupportedOrientationsUpdated:](self->_internal->delegate, "uiWebViewSupportedOrientationsUpdated:", self);
}

- (void)_updateRequest
{
  NSURLRequest *v3;

  WebThreadLock();
  v3 = (NSURLRequest *)(id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[UIWebDocumentView webView](self->_internal->browserView, "webView"), "mainFrame"), "dataSource"), "request");

  self->_internal->request = v3;
}

- (void)webView:(id)a3 didStartProvisionalLoadForFrame:(id)a4
{
  -[UIWebView _updateRequest](self, "_updateRequest", a3, a4);
  -[UIWebBrowserView resignFirstResponder](self->_internal->browserView, "resignFirstResponder");
  *((_BYTE *)self->_internal + 40) |= 2u;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebViewDelegate webViewDidStartLoad:](self->_internal->delegate, "webViewDidStartLoad:", self);
}

- (void)webView:(id)a3 didCommitLoadForFrame:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebViewDelegate uiWebView:didCommitLoadForFrame:](self->_internal->delegate, "uiWebView:didCommitLoadForFrame:", self, a4);
}

- (void)webView:(id)a3 didReceiveTitle:(id)a4 forFrame:(id)a5
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebViewDelegate uiWebView:didReceiveTitle:forFrame:](self->_internal->delegate, "uiWebView:didReceiveTitle:forFrame:", self, a4, a5);
}

- (id)webView:(id)a3 connectionPropertiesForResource:(id)a4 dataSource:(id)a5
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)-[UIWebViewDelegate uiWebView:connectionPropertiesForResource:dataSource:](self->_internal->delegate, "uiWebView:connectionPropertiesForResource:dataSource:", self, a4, a5);
  else
    return 0;
}

- (id)webThreadWebView:(id)a3 resource:(id)a4 willSendRequest:(id)a5 redirectResponse:(id)a6 fromDataSource:(id)a7
{
  id v7;
  void *NSInvocation;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  UIWebView *v15;

  v7 = a5;
  v14 = a4;
  v15 = self;
  v12 = a6;
  v13 = a5;
  v11 = a7;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    NSInvocation = (void *)WebThreadMakeNSInvocation();
    objc_msgSend(NSInvocation, "setArgument:atIndex:", &v15, 2);
    objc_msgSend(NSInvocation, "setArgument:atIndex:", &v14, 3);
    objc_msgSend(NSInvocation, "setArgument:atIndex:", &v13, 4);
    objc_msgSend(NSInvocation, "setArgument:atIndex:", &v12, 5);
    objc_msgSend(NSInvocation, "setArgument:atIndex:", &v11, 6);
    WebThreadCallDelegate();
    v10 = 0;
    objc_msgSend(NSInvocation, "getReturnValue:", &v10);
    return v10;
  }
  return v7;
}

- (void)webView:(id)a3 didClearWindowObject:(id)a4 forFrame:(id)a5
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebViewDelegate uiWebView:didClearWindowObject:forFrame:](self->_internal->delegate, "uiWebView:didClearWindowObject:forFrame:", self, a4, a5);
}

- (void)webView:(id)a3 didFailProvisionalLoadWithError:(id)a4 forFrame:(id)a5
{
  -[UIWebView _updateRequest](self, "_updateRequest", a3, a4, a5);
  *((_BYTE *)self->_internal + 40) &= ~2u;
  -[UIWebView _reportError:](self, "_reportError:", a4);
}

- (void)webView:(id)a3 didFinishLoadForFrame:(id)a4
{
  UIWebViewInternal *internal;

  -[UIWebView _updateRequest](self, "_updateRequest");
  if ((id)objc_msgSend(a3, "mainFrame") == a4)
  {
    *((_BYTE *)self->_internal + 40) &= ~2u;
    internal = self->_internal;
    if ((*((_BYTE *)internal + 40) & 0x10) != 0
      && (-[UIWebDocumentView hasBodyElement](internal->browserView, "hasBodyElement")
       || !-[UIWebBrowserView inputViewObeysDOMFocus](self->_internal->browserView, "inputViewObeysDOMFocus")
       || !-[UIWebBrowserView _currentAssistedNode](self->_internal->browserView, "_currentAssistedNode")))
    {
      -[UIWebDocumentView resetSelectionAssistant](self->_internal->browserView, "resetSelectionAssistant");
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebViewDelegate webViewDidFinishLoad:](self->_internal->delegate, "webViewDidFinishLoad:", self);
}

- (void)webView:(id)a3 didFailLoadWithError:(id)a4 forFrame:(id)a5
{
  -[UIWebView _updateRequest](self, "_updateRequest", a3, a4, a5);
  *((_BYTE *)self->_internal + 40) &= ~2u;
  -[UIWebView _reportError:](self, "_reportError:", a4);
}

- (void)webView:(id)a3 didFirstLayoutInFrame:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebViewDelegate uiWebView:didFirstLayoutInFrame:](self->_internal->delegate, "uiWebView:didFirstLayoutInFrame:", self, a4);
}

- (void)webViewClose:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebViewDelegate uiWebViewClose:](self->_internal->delegate, "uiWebViewClose:", self);
}

- (void)webView:(id)a3 runJavaScriptAlertPanelWithMessage:(id)a4 initiatedByFrame:(id)a5
{
  UIAlertController *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v6 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", javaScriptDialogTitle(a5), a4, 1);
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7 = objc_msgSend(_UIKitBundle(), "localizedStringForKey:value:table:", CFSTR("OK java script dialog"), CFSTR("OK"), CFSTR("Localizable"));
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__UIWebView_webView_runJavaScriptAlertPanelWithMessage_initiatedByFrame___block_invoke;
  v10[3] = &unk_1E16ED298;
  v10[4] = &v11;
  -[UIAlertController addAction:](v6, "addAction:", +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v7, 0, v10));
  objc_msgSend(+[UIViewController _viewControllerForFullScreenPresentationFromView:](UIViewController, "_viewControllerForFullScreenPresentationFromView:", self), "presentViewController:animated:completion:", v6, 1, 0);
  v8 = *MEMORY[0x1E0C99748];
  while (!*((_BYTE *)v12 + 24))
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    objc_msgSend(v9, "runMode:beforeDate:", v8, objc_msgSend(MEMORY[0x1E0C99D68], "distantPast"));
  }
  _Block_object_dispose(&v11, 8);
}

uint64_t __73__UIWebView_webView_runJavaScriptAlertPanelWithMessage_initiatedByFrame___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (BOOL)webView:(id)a3 runJavaScriptConfirmPanelWithMessage:(id)a4 initiatedByFrame:(id)a5
{
  UIAlertController *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v6 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", javaScriptDialogTitle(a5), a4, 1);
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v7 = objc_msgSend(_UIKitBundle(), "localizedStringForKey:value:table:", CFSTR("Cancel java script dialog"), CFSTR("Cancel"), CFSTR("Localizable"));
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75__UIWebView_webView_runJavaScriptConfirmPanelWithMessage_initiatedByFrame___block_invoke;
  v14[3] = &unk_1E16ED298;
  v14[4] = &v19;
  -[UIAlertController addAction:](v6, "addAction:", +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v7, 1, v14));
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __75__UIWebView_webView_runJavaScriptConfirmPanelWithMessage_initiatedByFrame___block_invoke_2;
  v13[3] = &unk_1E16ED2C0;
  v13[4] = &v19;
  v13[5] = &v15;
  -[UIAlertController addAction:](v6, "addAction:", +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", objc_msgSend(_UIKitBundle(), "localizedStringForKey:value:table:", CFSTR("OK java script dialog"), CFSTR("OK"), CFSTR("Localizable")), 0, v13));
  objc_msgSend(+[UIViewController _viewControllerForFullScreenPresentationFromView:](UIViewController, "_viewControllerForFullScreenPresentationFromView:", self), "presentViewController:animated:completion:", v6, 1, 0);
  v9 = *MEMORY[0x1E0C99748];
  while (!*((_BYTE *)v20 + 24))
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    objc_msgSend(v10, "runMode:beforeDate:", v9, objc_msgSend(MEMORY[0x1E0C99D68], "distantPast"));
  }
  v11 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  return v11;
}

uint64_t __75__UIWebView_webView_runJavaScriptConfirmPanelWithMessage_initiatedByFrame___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __75__UIWebView_webView_runJavaScriptConfirmPanelWithMessage_initiatedByFrame___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  return result;
}

- (id)webView:(id)a3 runJavaScriptTextInputPanelWithPrompt:(id)a4 defaultText:(id)a5 initiatedByFrame:(id)a6
{
  UIAlertController *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v7 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", javaScriptDialogTitle(a6), a4, 1);
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v8 = objc_msgSend(_UIKitBundle(), "localizedStringForKey:value:table:", CFSTR("Cancel java script dialog"), CFSTR("Cancel"), CFSTR("Localizable"));
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __88__UIWebView_webView_runJavaScriptTextInputPanelWithPrompt_defaultText_initiatedByFrame___block_invoke;
  v15[3] = &unk_1E16ED298;
  v15[4] = &v20;
  -[UIAlertController addAction:](v7, "addAction:", +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v8, 1, v15));
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __88__UIWebView_webView_runJavaScriptTextInputPanelWithPrompt_defaultText_initiatedByFrame___block_invoke_2;
  v14[3] = &unk_1E16ED2C0;
  v14[4] = &v20;
  v14[5] = &v16;
  -[UIAlertController addAction:](v7, "addAction:", +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", objc_msgSend(_UIKitBundle(), "localizedStringForKey:value:table:", CFSTR("OK java script dialog"), CFSTR("OK"), CFSTR("Localizable")), 0, v14));
  -[UIAlertController addTextFieldWithConfigurationHandler:](v7, "addTextFieldWithConfigurationHandler:", &__block_literal_global_264);
  objc_msgSend(+[UIViewController _viewControllerForFullScreenPresentationFromView:](UIViewController, "_viewControllerForFullScreenPresentationFromView:", self), "presentViewController:animated:completion:", v7, 1, 0);
  v10 = *MEMORY[0x1E0C99748];
  while (!*((_BYTE *)v21 + 24))
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    objc_msgSend(v11, "runMode:beforeDate:", v10, objc_msgSend(MEMORY[0x1E0C99D68], "distantPast"));
  }
  if (*((_BYTE *)v17 + 24))
    v12 = (id)objc_msgSend(-[NSArray firstObject](-[UIAlertController textFields](v7, "textFields"), "firstObject"), "text");
  else
    v12 = 0;
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  return v12;
}

uint64_t __88__UIWebView_webView_runJavaScriptTextInputPanelWithPrompt_defaultText_initiatedByFrame___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __88__UIWebView_webView_runJavaScriptTextInputPanelWithPrompt_defaultText_initiatedByFrame___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  return result;
}

- (void)webView:(id)a3 decidePolicyForGeolocationRequestFromOrigin:(id)a4 frame:(id)a5 listener:(id)a6
{
  if (self->_internal->delegate && (objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebViewDelegate uiWebView:decidePolicyForGeolocationRequestFromOrigin:frame:listener:](self->_internal->delegate, "uiWebView:decidePolicyForGeolocationRequestFromOrigin:frame:listener:", self, a4, a5, a6);
  else
    objc_msgSend(+[UIWebGeolocationPolicyDecider sharedPolicyDecider](UIWebGeolocationPolicyDecider, "sharedPolicyDecider"), "webView:decidePolicyForGeolocationRequestFromOrigin:frame:listener:", a3, a4, a5, a6);
}

- (id)webView:(id)a3 identifierForInitialRequest:(id)a4 fromDataSource:(id)a5
{
  if (self->_internal->delegate && (objc_opt_respondsToSelector() & 1) != 0)
    return (id)-[UIWebViewDelegate uiWebView:identifierForInitialRequest:fromDataSource:](self->_internal->delegate, "uiWebView:identifierForInitialRequest:fromDataSource:", self, a4, a5);
  else
    return objc_alloc_init(MEMORY[0x1E0DE7910]);
}

- (void)webView:(id)a3 resource:(id)a4 didFinishLoadingFromDataSource:(id)a5
{
  if (self->_internal->delegate)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UIWebViewDelegate uiWebView:resource:didFinishLoadingFromDataSource:](self->_internal->delegate, "uiWebView:resource:didFinishLoadingFromDataSource:", self, a4, a5);
  }
}

- (void)webView:(id)a3 resource:(id)a4 didFailLoadingWithError:(id)a5 fromDataSource:(id)a6
{
  if (self->_internal->delegate)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UIWebViewDelegate uiWebView:resource:didFailLoadingWithError:fromDataSource:](self->_internal->delegate, "uiWebView:resource:didFailLoadingWithError:fromDataSource:", self, a4, a5, a6);
  }
}

- (void)webView:(id)a3 resource:(id)a4 didReceiveAuthenticationChallenge:(id)a5 fromDataSource:(id)a6
{
  uint64_t v10;
  uint64_t v11;

  if (self->_internal->delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIWebViewDelegate uiWebView:resource:didReceiveAuthenticationChallenge:fromDataSource:](self->_internal->delegate, "uiWebView:resource:didReceiveAuthenticationChallenge:fromDataSource:", self, a4, a5, a6);
  }
  else if (!objc_msgSend(a5, "previousFailureCount", a3, a4, a5, a6))
  {
    v10 = objc_msgSend(a5, "protectionSpace");
    v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage"), "defaultCredentialForProtectionSpace:", v10);
    if (v11)
      objc_msgSend((id)objc_msgSend(a5, "sender"), "useCredential:forAuthenticationChallenge:", v11, a5);
  }
}

- (void)webView:(id)a3 resource:(id)a4 didCancelAuthenticationChallenge:(id)a5 fromDataSource:(id)a6
{
  if (self->_internal->delegate)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UIWebViewDelegate uiWebView:resource:didCancelAuthenticationChallenge:fromDataSource:](self->_internal->delegate, "uiWebView:resource:didCancelAuthenticationChallenge:fromDataSource:", self, a4, a5, a6);
  }
}

- (BOOL)webView:(id)a3 resource:(id)a4 canAuthenticateAgainstProtectionSpace:(id)a5 forDataSource:(id)a6
{
  void *v11;

  if (self->_internal->delegate && (objc_opt_respondsToSelector() & 1) != 0)
    return -[UIWebViewDelegate uiWebView:resource:canAuthenticateAgainstProtectionSpace:forDataSource:](self->_internal->delegate, "uiWebView:resource:canAuthenticateAgainstProtectionSpace:forDataSource:", self, a4, a5, a6);
  v11 = (void *)objc_msgSend(a5, "authenticationMethod", a3, a4, a5, a6);
  if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C92B38]) & 1) != 0
    || (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C92B48]) & 1) != 0
    || (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C92B50]) & 1) != 0
    || (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C92B40]) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C92B58]);
  }
}

- (void)webView:(id)a3 didChangeLocationWithinPageForFrame:(id)a4
{
  if ((id)objc_msgSend(a3, "mainFrame") == a4)
    -[UIWebPDFViewHandler handleScrollToAnchor:](self->_internal->pdfHandler, "handleScrollToAnchor:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "dataSource"), "request"), "URL"), "fragment"));
}

- (CGImage)newSnapshotWithRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  WebThreadLock();
  -[UIWebTiledView layoutTilesNow](self->_internal->browserView, "layoutTilesNow");
  v9.receiver = self;
  v9.super_class = (Class)UIWebView;
  return -[UIView newSnapshotWithRect:](&v9, sel_newSnapshotWithRect_, x, y, width, height);
}

- (id)_initWithWebView:(id)a3
{
  UIWebView *v5;
  UIWebView *v6;
  objc_super v8;

  objc_msgSend(a3, "frame");
  v8.receiver = self;
  v8.super_class = (Class)UIWebView;
  v5 = -[UIView initWithFrame:](&v8, sel_initWithFrame_);
  v6 = v5;
  if (v5)
    -[UIWebView _webViewCommonInitWithWebView:scalesPageToFit:](v5, "_webViewCommonInitWithWebView:scalesPageToFit:", a3, 0);
  return v6;
}

- (id)_browserView
{
  return self->_internal->browserView;
}

- (id)_documentView
{
  return self->_internal->browserView;
}

- (id)_scrollView
{
  return self->_internal->scroller;
}

- (id)_pdfViewHandler
{
  return self->_internal->pdfHandler;
}

- (void)_setOverridesOrientationChangeEventHandling:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self->_internal + 40) = *((_BYTE *)self->_internal + 40) & 0xFB | v3;
}

- (void)_setDrawsCheckeredPattern:(BOOL)a3
{
  UIWebViewInternal *internal;
  char v4;
  char v6;

  internal = self->_internal;
  v4 = *((_BYTE *)internal + 40);
  if (((((v4 & 8) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v6 = 8;
    else
      v6 = 0;
    *((_BYTE *)internal + 40) = v4 & 0xF7 | v6;
    -[UIWebView _updateCheckeredPattern](self, "_updateCheckeredPattern");
    -[UIWebView _updateOpaqueAndBackgroundColor](self, "_updateOpaqueAndBackgroundColor");
  }
}

- (void)_setSelectionEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self->_internal + 40) = *((_BYTE *)self->_internal + 40) & 0xEF | v3;
}

- (void)_setDrawInWebThread:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self->_internal + 40) = *((_BYTE *)self->_internal + 40) & 0xDF | v3;
  -[UIWebTiledView setLayoutTilesInMainThread:](self->_internal->browserView, "setLayoutTilesInMainThread:", (*((_BYTE *)self->_internal + 40) & 0x20) == 0);
}

- (UIWebPaginationMode)paginationMode
{
  unsigned int v3;

  WebThreadLock();
  v3 = objc_msgSend(-[UIWebDocumentView webView](self->_internal->browserView, "webView"), "_paginationMode") - 1;
  if (v3 > 3)
    return 0;
  else
    return qword_186685B48[v3];
}

- (void)setPaginationMode:(UIWebPaginationMode)paginationMode
{
  uint64_t v4;
  uint64_t v5;

  v4 = 0;
  v5 = 0;
  switch(paginationMode)
  {
    case UIWebPaginationModeUnpaginated:
      goto LABEL_6;
    case UIWebPaginationModeLeftToRight:
      v4 = 1;
      v5 = 1;
      goto LABEL_6;
    case UIWebPaginationModeTopToBottom:
      v5 = 1;
      v4 = 3;
      goto LABEL_6;
    case UIWebPaginationModeBottomToTop:
      v5 = 1;
      v4 = 4;
      goto LABEL_6;
    case UIWebPaginationModeRightToLeft:
      v5 = 1;
      v4 = 2;
LABEL_6:
      WebThreadLock();
      -[UIWebDocumentView setShouldIgnoreCustomViewport:](self->_internal->browserView, "setShouldIgnoreCustomViewport:", v5);
      objc_msgSend(-[UIWebDocumentView webView](self->_internal->browserView, "webView"), "_setPaginationMode:", v4);
      break;
    default:
      return;
  }
}

- (BOOL)_paginationBehavesLikeColumns
{
  return -[UIWebView paginationBreakingMode](self, "paginationBreakingMode") == UIWebPaginationBreakingModeColumn;
}

- (UIWebPaginationBreakingMode)paginationBreakingMode
{
  WebThreadLock();
  return (unint64_t)objc_msgSend(-[UIWebDocumentView webView](self->_internal->browserView, "webView"), "_paginationBehavesLikeColumns");
}

- (void)_setPaginationBehavesLikeColumns:(BOOL)a3
{
  -[UIWebView setPaginationBreakingMode:](self, "setPaginationBreakingMode:", a3);
}

- (void)setPaginationBreakingMode:(UIWebPaginationBreakingMode)paginationBreakingMode
{
  WebThreadLock();
  objc_msgSend(-[UIWebDocumentView webView](self->_internal->browserView, "webView"), "_setPaginationBehavesLikeColumns:", paginationBreakingMode == UIWebPaginationBreakingModeColumn);
}

- (CGFloat)pageLength
{
  CGFloat result;

  WebThreadLock();
  objc_msgSend(-[UIWebDocumentView webView](self->_internal->browserView, "webView"), "_pageLength");
  return result;
}

- (void)setPageLength:(CGFloat)pageLength
{
  WebThreadLock();
  objc_msgSend(-[UIWebDocumentView webView](self->_internal->browserView, "webView"), "_setPageLength:", pageLength);
}

- (CGFloat)gapBetweenPages
{
  CGFloat result;

  WebThreadLock();
  objc_msgSend(-[UIWebDocumentView webView](self->_internal->browserView, "webView"), "_gapBetweenPages");
  return result;
}

- (void)setGapBetweenPages:(CGFloat)gapBetweenPages
{
  WebThreadLock();
  objc_msgSend(-[UIWebDocumentView webView](self->_internal->browserView, "webView"), "_setGapBetweenPages:", gapBetweenPages);
}

- (NSUInteger)pageCount
{
  WebThreadLock();
  return objc_msgSend(-[UIWebDocumentView webView](self->_internal->browserView, "webView"), "_pageCount");
}

- (void)_setAlwaysConstrainsScale:(BOOL)a3
{
  -[UIWebDocumentView setAlwaysConstrainsScale:](self->_internal->browserView, "setAlwaysConstrainsScale:", a3);
}

- (BOOL)_alwaysConstrainsScale
{
  return -[UIWebDocumentView alwaysConstrainsScale](self->_internal->browserView, "alwaysConstrainsScale");
}

- (void)_setAlwaysDispatchesScrollEvents:(BOOL)a3
{
  -[UIWebBrowserView setAlwaysDispatchesScrollEvents:](self->_internal->browserView, "setAlwaysDispatchesScrollEvents:", a3);
}

- (BOOL)_alwaysDispatchesScrollEvents
{
  return -[UIWebBrowserView alwaysDispatchesScrollEvents](self->_internal->browserView, "alwaysDispatchesScrollEvents");
}

- (void)_setAudioSessionCategoryOverride:(unint64_t)a3
{
  -[UIWebBrowserView setAudioSessionCategoryOverride:](self->_internal->browserView, "setAudioSessionCategoryOverride:", a3);
}

- (unint64_t)_audioSessionCategoryOverride
{
  return -[UIWebBrowserView audioSessionCategoryOverride](self->_internal->browserView, "audioSessionCategoryOverride");
}

- (void)_setAllowsPictureInPictureVideo:(BOOL)a3
{
  -[UIWebBrowserView setAllowsPictureInPictureVideo:](self->_internal->browserView, "setAllowsPictureInPictureVideo:", a3);
}

- (BOOL)_allowsPictureInPictureVideo
{
  return -[UIWebBrowserView allowsPictureInPictureVideo](self->_internal->browserView, "allowsPictureInPictureVideo");
}

- (void)_setNetworkInterfaceName:(id)a3
{
  -[UIWebBrowserView setNetworkInterfaceName:](self->_internal->browserView, "setNetworkInterfaceName:", a3);
}

- (id)_networkInterfaceName
{
  return -[UIWebBrowserView networkInterfaceName](self->_internal->browserView, "networkInterfaceName");
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  return -[UIWebBrowserView canPerformAction:withSender:](self->_internal->browserView, "canPerformAction:withSender:", a3, a4);
}

- (void)copy:(id)a3
{
  -[UIWebBrowserView copy:](self->_internal->browserView, "copy:", a3);
}

- (void)select:(id)a3
{
  -[UIWebDocumentView select:](self->_internal->browserView, "select:", a3);
}

- (void)selectAll:(id)a3
{
  -[UIWebDocumentView selectAll:](self->_internal->browserView, "selectAll:", a3);
}

- (void)_define:(id)a3
{
  -[UIWebDocumentView _define:](self->_internal->browserView, "_define:", a3);
}

- (void)_translate:(id)a3
{
  -[UIWebDocumentView _translate:](self->_internal->browserView, "_translate:", a3);
}

- (void)_share:(id)a3
{
  -[UIWebDocumentView _share:](self->_internal->browserView, "_share:", a3);
}

- (void)_addShortcut:(id)a3
{
  -[UIWebDocumentView _addShortcut:](self->_internal->browserView, "_addShortcut:", a3);
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  id v5;
  void *v6;
  objc_super v7;

  WebThreadLock();
  v5 = -[UIWebDocumentView webView](self->_internal->browserView, "webView");
  if (v5)
  {
    v6 = v5;
    -[UIWebDocumentView saveStateToCurrentHistoryItem](self->_internal->browserView, "saveStateToCurrentHistoryItem");
    objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend((id)objc_msgSend(v6, "backForwardList"), "dictionaryRepresentation"), CFSTR("kBackForwardDictionaryKey"));
  }
  v7.receiver = self;
  v7.super_class = (Class)UIWebView;
  -[UIResponder encodeRestorableStateWithCoder:](&v7, sel_encodeRestorableStateWithCoder_, a3);
}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v15;

  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0), CFSTR("kBackForwardDictionaryKey"));
  if (v9)
  {
    v10 = v9;
    WebThreadLock();
    v11 = -[UIWebDocumentView webView](self->_internal->browserView, "webView");
    if (v11)
    {
      v12 = v11;
      objc_msgSend((id)objc_msgSend(v11, "backForwardList"), "setToMatchDictionaryRepresentation:", v10);
      v13 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "backForwardList"), "currentItem"), "URL");
      if (v13)
      {
        v14 = v13;

        self->_internal->request = (NSURLRequest *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C80]), "initWithURL:", v14);
      }
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)UIWebView;
  -[UIResponder decodeRestorableStateWithCoder:](&v15, sel_decodeRestorableStateWithCoder_, a3);
}

@end
