@implementation BKFootnoteViewController2

- (BKFootnoteViewController2)initWithResource:(id)a3 stylesheetSet:(id)a4 backgroundColor:(id)a5 textColor:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  char isKindOfClass;
  BKFootnoteViewController2 *v17;
  BKFootnoteViewController2 *v18;
  id *p_resource;
  void *v20;
  uint64_t v21;
  void *v22;
  double height;
  void *v24;
  id v25;
  id v27;
  objc_super v28;

  v11 = a3;
  v27 = a4;
  v12 = a5;
  v13 = a6;
  if (!v11)
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/BKFootnoteViewController2.m", 65, "-[BKFootnoteViewController2 initWithResource:stylesheetSet:backgroundColor:textColor:]", "resource", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "resource"));
  objc_opt_class(NSString);
  isKindOfClass = objc_opt_isKindOfClass(v14, v15);

  if ((isKindOfClass & 1) == 0)
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/BKFootnoteViewController2.m", 66, "-[BKFootnoteViewController2 initWithResource:stylesheetSet:backgroundColor:textColor:]", "[resource.resource isKindOfClass:[NSString class]]", CFSTR("Unexpected resource type!"));
  v28.receiver = self;
  v28.super_class = (Class)BKFootnoteViewController2;
  v17 = -[BKViewController initWithNibName:bundle:](&v28, "initWithNibName:bundle:", 0, 0);
  v18 = v17;
  if (v17)
  {
    p_resource = (id *)&v17->_resource;
    objc_storeStrong((id *)&v17->_resource, a3);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_resource, "sourceURL"));
    v21 = BEURLHandleriBooksImgUrlFromiBooksURL(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    objc_msgSend(*p_resource, "setSourceURL:", v22);

    objc_storeStrong((id *)&v18->_stylesheetSet, a4);
    objc_storeStrong((id *)&v18->_backgroundColor, a5);
    objc_storeStrong((id *)&v18->_textColor, a6);
    height = 667.0;
    if (CGSizeZero.height <= 667.0)
      height = CGSizeZero.height;
    -[BKFootnoteViewController2 setPreferredContentSize:](v18, "setPreferredContentSize:", 375.0, height);
    -[BKFootnoteViewController2 setModalPresentationStyle:](v18, "setModalPresentationStyle:", 7);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v25 = -[BKFootnoteViewController2 registerForTraitChanges:withAction:](v18, "registerForTraitChanges:withAction:", v24, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v18;
}

- (void)releaseViews
{
  void *v3;
  void *v4;
  WKWebView *webView;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView be_navigationHandler](self->_webView, "be_navigationHandler"));
  objc_msgSend(v3, "setDelegate:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView be_uiHandler](self->_webView, "be_uiHandler"));
  objc_msgSend(v4, "setDelegate:", 0);

  -[WKWebView stopLoading](self->_webView, "stopLoading");
  webView = self->_webView;
  self->_webView = 0;

  v6.receiver = self;
  v6.super_class = (Class)BKFootnoteViewController2;
  -[BKViewController releaseViews](&v6, "releaseViews");
}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  WKWebView *v16;
  WKWebView *webView;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  IMFadeView *v22;
  IMFadeView *headerMask;
  IMFadeView *v24;
  IMFadeView *footerMask;
  UIButton *v26;
  UIButton *doneButton;
  double v28;
  double v29;
  UIButton *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)BKFootnoteViewController2;
  -[BKFootnoteViewController2 viewDidLoad](&v36, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKFootnoteViewController2 view](self, "view"));
  objc_msgSend(v3, "setFrame:", 0.0, 0.0, 375.0, 0.0);
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = -[BKFootnoteViewController2 allowsRemoteInspection](self, "allowsRemoteInspection");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentResource bookID](self->_resource, "bookID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentResource cacheItem](self->_resource, "cacheItem"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[BEContentCleanupJSOptions expandedContentOptions](BEContentCleanupJSOptions, "expandedContentOptions"));
  v16 = (WKWebView *)objc_claimAutoreleasedReturnValue(+[BEWebViewFactory viewConfiguredForPreview:enableDeveloperExtras:bookID:imageFilterMode:protocolCacheItem:cleanupOptions:stylesheetSet:](BEWebViewFactory, "viewConfiguredForPreview:enableDeveloperExtras:bookID:imageFilterMode:protocolCacheItem:cleanupOptions:stylesheetSet:", v12, v13, 0, v14, v15, self->_stylesheetSet, v5, v7, v9, v11));
  webView = self->_webView;
  self->_webView = v16;

  -[WKWebView setTranslatesAutoresizingMaskIntoConstraints:](self->_webView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView be_navigationHandler](self->_webView, "be_navigationHandler"));
  objc_msgSend(v18, "setDelegate:", self);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView be_uiHandler](self->_webView, "be_uiHandler"));
  objc_msgSend(v19, "setDelegate:", self);

  -[BKExpandedContentResource zoomScale](self->_resource, "zoomScale");
  if (v20 > 0.0)
  {
    -[BKExpandedContentResource zoomScale](self->_resource, "zoomScale");
    -[WKWebView _setTextZoomFactor:](self->_webView, "_setTextZoomFactor:");
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView scrollView](self->_webView, "scrollView"));
  objc_msgSend(v21, "_setShowsBackgroundShadow:", 0);
  objc_msgSend(v21, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(v21, "setAlwaysBounceVertical:", 0);
  v22 = (IMFadeView *)objc_alloc_init((Class)IMFadeView);
  headerMask = self->_headerMask;
  self->_headerMask = v22;

  -[IMFadeView setTranslatesAutoresizingMaskIntoConstraints:](self->_headerMask, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v24 = (IMFadeView *)objc_alloc_init((Class)IMFadeView);
  footerMask = self->_footerMask;
  self->_footerMask = v24;

  -[IMFadeView setTranslatesAutoresizingMaskIntoConstraints:](self->_footerMask, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[IMFadeView setDirection:](self->_footerMask, "setDirection:", 1);
  v26 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
  doneButton = self->_doneButton;
  self->_doneButton = v26;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_doneButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v28) = 1148846080;
  -[UIButton setContentCompressionResistancePriority:forAxis:](self->_doneButton, "setContentCompressionResistancePriority:forAxis:", 0, v28);
  LODWORD(v29) = 1148846080;
  -[UIButton setContentCompressionResistancePriority:forAxis:](self->_doneButton, "setContentCompressionResistancePriority:forAxis:", 1, v29);
  v30 = self->_doneButton;
  v31 = AEBundle();
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("Done"), &stru_1C3088, 0));
  -[UIButton setTitle:forState:](v30, "setTitle:forState:", v33, 0);

  -[UIButton addTarget:action:forControlEvents:](self->_doneButton, "addTarget:action:forControlEvents:", self, "_doneButtonTapped:", 64);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_doneButton, "titleLabel"));
  objc_msgSend(v35, "setFont:", v34);

  objc_msgSend(v3, "addSubview:", self->_doneButton);
  objc_msgSend(v3, "addSubview:", self->_webView);
  objc_msgSend(v3, "addSubview:", self->_headerMask);
  objc_msgSend(v3, "addSubview:", self->_footerMask);
  -[BKFootnoteViewController2 _constructAndActivateConstraints](self, "_constructAndActivateConstraints");
  -[BKFootnoteViewController2 _applyCurrentTheme](self, "_applyCurrentTheme");
  -[BKFootnoteViewController2 _generateAndLoadContent](self, "_generateAndLoadContent");
  objc_msgSend(v3, "setNeedsUpdateConstraints");

}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  -[BKFootnoteViewController2 _updateDoneButton](self, "_updateDoneButton", a3, a4);
  -[BKFootnoteViewController2 _applyCurrentTheme](self, "_applyCurrentTheme");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKFootnoteViewController2;
  -[BKFootnoteViewController2 viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[BKFootnoteViewController2 _updateDoneButton](self, "_updateDoneButton");
}

- (void)_doneButtonTapped:(id)a3
{
  void *v4;
  BKFootnoteViewController2 *v5;
  _QWORD v6[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKFootnoteViewController2 presentingViewController](self, "presentingViewController", a3));
  v5 = (BKFootnoteViewController2 *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentedViewController"));

  if (v5 == self)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_BFA50;
    v6[3] = &unk_1BEA38;
    v6[4] = self;
    -[BKFootnoteViewController2 dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v6);
  }
  else
  {
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/BKFootnoteViewController2.m", 178, "-[BKFootnoteViewController2 _doneButtonTapped:]", "self.presentingViewController.presentedViewController == self", CFSTR("Unexpected presented view controller!!"));
  }
}

- (void)ae_didDismissPopoverContainingThisViewController
{
  -[BKFootnoteViewController2 _didDismissFootnoteViewController](self, "_didDismissFootnoteViewController");
}

- (void)navigationHandler:(id)a3 handleUserRequestForFrameToLoadExternalURL:(id)a4 completion:(id)a5
{
  BEFootnoteDelegate **p_delegate;
  id v8;
  id v9;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v8 = a5;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "footnoteViewController:handleUserRequestForFrameToLoadExternalURL:completion:", self, v9, v8);

}

- (void)navigationHandler:(id)a3 handleExternalLoadRequest:(id)a4 likelyUserInitiated:(BOOL)a5
{
  _BOOL8 v5;
  BEFootnoteDelegate **p_delegate;
  id v8;
  id WeakRetained;

  v5 = a5;
  p_delegate = &self->_delegate;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "footnoteViewController:handleExternalLoadRequest:likelyUserInitiated:", self, v8, v5);

}

- (BOOL)navigationHandler:(id)a3 handleInternalLoadRequest:(id)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  void *v9;
  unsigned __int8 v10;
  id WeakRetained;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentResource sourceURL](self->_resource, "sourceURL"));
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentResource sourceURL](self->_resource, "sourceURL"));
    v10 = objc_msgSend(v5, "be_isEquivalentToURL:ignoringFragment:", v9, 1);

    if ((v10 & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v8 = objc_msgSend(WeakRetained, "footnoteViewController:handleInternalLoadRequest:", self, v5);

    }
  }

  return v8;
}

- (void)navigationHandler:(id)a3 handleInternalLoadRequestForNewWindow:(id)a4
{
  BEFootnoteDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "footnoteViewController:handleInternalLoadRequestForNewWindow:", self, v6);

}

- (void)navigationHandler:(id)a3 didFinishLoadOfURL:(id)a4
{
  id v6;
  id v7;
  WKWebView *webView;
  _QWORD v9[4];
  id v10;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  webView = self->_webView;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_BFD48;
  v9[3] = &unk_1BF510;
  objc_copyWeak(&v10, &location);
  -[WKWebView evaluateJavaScript:completionHandler:](webView, "evaluateJavaScript:completionHandler:", CFSTR("var rect = document.documentElement.getBoundingClientRect(); JSON.stringify([rect.width, rect.height])"),
    v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)navigationHandler:(id)a3 failedToLoadURL:(id)a4 error:(id)a5
{
  -[BKFootnoteViewController2 _footnoteViewControllerPreparationForDisplayFailed:](self, "_footnoteViewControllerPreparationForDisplayFailed:", a5, a4);
}

- (void)navigationHandlerFirstSignificantPaintCompleted:(id)a3
{
  double v3;
  double v4;
  id v5;
  CGRect v6;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[WKWebView scrollView](self->_webView, "scrollView", a3));
  objc_msgSend(v5, "contentSize");
  v4 = v3;
  objc_msgSend(v5, "bounds");
  if (v4 > CGRectGetHeight(v6))
    objc_msgSend(v5, "flashScrollIndicators");

}

- (void)handler:(id)a3 presentAlertController:(id)a4 completion:(id)a5
{
  -[BKFootnoteViewController2 _presentAlertController:completion:](self, "_presentAlertController:completion:", a4, a5);
}

- (BOOL)isPageTheme
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKFootnoteViewController2 theme](self, "theme"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  if ((objc_msgSend(v4, "isEqualToString:", kIMThemeIdentifierWhitePageTheme) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKFootnoteViewController2 theme](self, "theme"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    if ((objc_msgSend(v7, "isEqualToString:", kIMThemeIdentifierSepiaPageTheme) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKFootnoteViewController2 theme](self, "theme"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
      if ((objc_msgSend(v9, "isEqualToString:", kIMThemeIdentifierGrayPageTheme) & 1) != 0)
      {
        v5 = 1;
      }
      else
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKFootnoteViewController2 theme](self, "theme"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
        v5 = objc_msgSend(v11, "isEqualToString:", kIMThemeIdentifierDefaultPageTheme);

      }
    }

  }
  return v5;
}

- (BOOL)isNightTheme
{
  BKFootnoteViewController2 *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKFootnoteViewController2 theme](self, "theme"));
  LOBYTE(v2) = objc_msgSend(v3, "isNight:", v2);

  return (char)v2;
}

- (BOOL)isBookTheme
{
  if (-[BKFootnoteViewController2 isPageTheme](self, "isPageTheme"))
    return 1;
  else
    return -[BKFootnoteViewController2 isNightTheme](self, "isNightTheme");
}

- (void)im_themeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKFootnoteViewController2;
  -[BKFootnoteViewController2 im_themeDidChange](&v3, "im_themeDidChange");
  -[BKFootnoteViewController2 _applyCurrentTheme](self, "_applyCurrentTheme");
}

- (void)_footnoteViewControllerReadyForDisplay
{
  id WeakRetained;

  -[BKFootnoteViewController2 setReadyForDisplay:](self, "setReadyForDisplay:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector(WeakRetained, "footnoteViewDidFinishLoad:") & 1) != 0)
    objc_msgSend(WeakRetained, "footnoteViewDidFinishLoad:", self);

}

- (void)_footnoteViewControllerPreparationForDisplayFailed:(id)a3
{
  id WeakRetained;

  -[BKFootnoteViewController2 setFailedToLoad:](self, "setFailedToLoad:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector(WeakRetained, "footnoteViewDidFinishLoad:") & 1) != 0)
    objc_msgSend(WeakRetained, "footnoteViewDidFinishLoad:", self);

}

- (void)_didDismissFootnoteViewController
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector(WeakRetained, "footnoteViewDidDisappear:") & 1) != 0)
    objc_msgSend(WeakRetained, "footnoteViewDidDisappear:", self);

}

- (void)_presentAlertController:(id)a3 completion:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector(WeakRetained, "footnoteViewController:presentAlertController:completion:") & 1) != 0)
    objc_msgSend(WeakRetained, "footnoteViewController:presentAlertController:completion:", self, v8, v6);

}

- (void)_constructAndActivateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  NSLayoutConstraint *v6;
  NSLayoutConstraint *webViewTopAnchorWhenDoneButtonVisible;
  void *v8;
  void *v9;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *webViewTopConstraint;
  NSLayoutConstraint *v12;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[15];

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[BKFootnoteViewController2 view](self, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "safeAreaLayoutGuide"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView topAnchor](self->_webView, "topAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_doneButton, "bottomAnchor"));
  v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:constant:", v5, 10.0));
  webViewTopAnchorWhenDoneButtonVisible = self->_webViewTopAnchorWhenDoneButtonVisible;
  self->_webViewTopAnchorWhenDoneButtonVisible = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView topAnchor](self->_webView, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
  webViewTopConstraint = self->_webViewTopConstraint;
  self->_webViewTopConstraint = v10;

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_doneButton, "trailingAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:constant:", v51, -16.0));
  v54[0] = v50;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_doneButton, "topAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v48));
  v12 = self->_webViewTopAnchorWhenDoneButtonVisible;
  v54[1] = v47;
  v54[2] = v12;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView leftAnchor](self->_webView, "leftAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leftAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:constant:", v45, 16.0));
  v54[3] = v44;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView rightAnchor](self->_webView, "rightAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rightAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:constant:", v42, -16.0));
  v54[4] = v41;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView bottomAnchor](self->_webView, "bottomAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v39));
  v54[5] = v38;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[IMFadeView leftAnchor](self->_headerMask, "leftAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leftAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v36));
  v54[6] = v35;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[IMFadeView rightAnchor](self->_headerMask, "rightAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rightAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
  v54[7] = v32;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[IMFadeView heightAnchor](self->_headerMask, "heightAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToConstant:", 5.0));
  v54[8] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[IMFadeView topAnchor](self->_headerMask, "topAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView topAnchor](self->_webView, "topAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v28));
  v54[9] = v27;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[IMFadeView heightAnchor](self->_headerMask, "heightAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToConstant:", 5.0));
  v54[10] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[IMFadeView leftAnchor](self->_footerMask, "leftAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leftAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v23));
  v54[11] = v22;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IMFadeView rightAnchor](self->_footerMask, "rightAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rightAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
  v54[12] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[IMFadeView bottomAnchor](self->_footerMask, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
  v54[13] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[IMFadeView heightAnchor](self->_footerMask, "heightAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToConstant:", 5.0));
  v54[14] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v54, 15));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

}

- (void)_applyCurrentTheme
{
  void *v3;
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
  void *v15;
  _WKUserStyleSheet *v16;
  _WKUserStyleSheet *themeStylesheet;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKFootnoteViewController2 backgroundColor](self, "backgroundColor"));
  v4 = v3;
  if (v3)
  {
    v22 = v3;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKFootnoteViewController2 themePage](self, "themePage"));
    v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "backgroundColorForTraitEnvironment:", self));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKFootnoteViewController2 textColor](self, "textColor"));
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKFootnoteViewController2 themePage](self, "themePage"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentTextColor"));

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKFootnoteViewController2 doneButton](self, "doneButton"));
  objc_msgSend(v10, "setTitleColor:forState:", v8, 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView configuration](self->_webView, "configuration"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userContentController"));

  if (self->_themeStylesheet)
    objc_msgSend(v12, "_removeUserStyleSheet:");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bc_rgbaString"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bc_rgbaString"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" html { -webkit-user-select: none; -webkit-column-width: auto; width: 100%%; height: auto; background-color: %@ !important; }body { margin: 12px 16px !important; padding: auto !important; background-color: %@ !important; color: %@; overflow: visible !important; }"),
                    v13,
                    v13,
                    v14));

  v16 = (_WKUserStyleSheet *)objc_msgSend(objc_alloc((Class)_WKUserStyleSheet), "initWithSource:forMainFrameOnly:", v15, 1);
  themeStylesheet = self->_themeStylesheet;
  self->_themeStylesheet = v16;

  objc_msgSend(v12, "_addUserStyleSheet:", self->_themeStylesheet);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKFootnoteViewController2 headerMask](self, "headerMask"));
  objc_msgSend(v18, "setBackgroundColor:", v22);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKFootnoteViewController2 footerMask](self, "footerMask"));
  objc_msgSend(v19, "setBackgroundColor:", v22);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKFootnoteViewController2 webView](self, "webView"));
  objc_msgSend(v20, "setBackgroundColor:", v22);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKFootnoteViewController2 viewIfLoaded](self, "viewIfLoaded"));
  objc_msgSend(v21, "setBackgroundColor:", v22);

}

- (id)_footNoteTitleHTML
{
  void *v2;
  void *v3;
  _BOOL4 v4;
  __CFString *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentResource title](self->_resource, "title"));
  if (objc_msgSend(v2, "length"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(" *")));
    if (objc_msgSend(v2, "rangeOfCharacterFromSet:", v3) == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v4 = 0;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "invertedSet"));
      v4 = objc_msgSend(v2, "rangeOfCharacterFromSet:", v6) == (id)0x7FFFFFFFFFFFFFFFLL;

    }
    v7 = objc_alloc_init((Class)NSMutableArray);
    objc_msgSend(v7, "addObject:", CFSTR("<div"));
    if (v4)
      objc_msgSend(v7, "addObject:", CFSTR(" class=\"enhanced\"));
    objc_msgSend(v7, "addObject:", CFSTR("><span><div role=\"heading\" aria-help=\"));
    v8 = AEAXLocString(CFSTR("footnote.link"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v7, "addObject:", v9);

    objc_msgSend(v7, "addObject:", CFSTR("\">"));
    objc_msgSend(v7, "addObject:", v2);
    objc_msgSend(v7, "addObject:", CFSTR("</div></span></div>"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsJoinedByString:", &stru_1C3088));

  }
  else
  {
    v5 = &stru_1C3088;
  }

  return v5;
}

- (void)_generateAndLoadContent
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  WKWebView *webView;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;

  v3 = AEBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathForResource:ofType:", CFSTR("footnote"), CFSTR("xhtml")));
  v25 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithContentsOfFile:encoding:error:](NSString, "stringWithContentsOfFile:encoding:error:", v5, 4, &v25));
  v7 = v25;

  if (objc_msgSend(v6, "length"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 343.0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("metaviewport-width-goes-here"), v9));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKFootnoteViewController2 _footNoteTitleHTML](self, "_footNoteTitleHTML"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("<BKASIDETITLEGOESHERE/>"), v11));

    *(_QWORD *)&v13 = objc_opt_class(NSString).n128_u64[0];
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentResource resource](self->_resource, "resource", v13));
    v17 = BUDynamicCast(v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("<BKASIDEHTMLGOESHERE/>"), v18));

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataUsingEncoding:", 4));
    webView = self->_webView;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentResource contentType](self->_resource, "contentType"));
    v22 = BEUTF8StringEncodingName;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentResource sourceURL](self->_resource, "sourceURL"));
    v24 = -[WKWebView loadData:MIMEType:characterEncodingName:baseURL:](webView, "loadData:MIMEType:characterEncodingName:baseURL:", v19, v21, v22, v23);

  }
  else
  {
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/BKFootnoteViewController2.m", 472, "-[BKFootnoteViewController2 _generateAndLoadContent]", "NO", CFSTR("BKFootnoteViewController2 could not load template file!"));
    -[BKFootnoteViewController2 _footnoteViewControllerPreparationForDisplayFailed:](self, "_footnoteViewControllerPreparationForDisplayFailed:", v7);
  }

}

- (void)_updateDoneButton
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKFootnoteViewController2 presentingViewController](self, "presentingViewController"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKFootnoteViewController2 presentationController](self, "presentationController"));
    v3 = objc_msgSend(v4, "im_isFullScreen");

  }
  -[NSLayoutConstraint setActive:](self->_webViewTopAnchorWhenDoneButtonVisible, "setActive:", v3);
  v5 = v3 ^ 1;
  -[NSLayoutConstraint setActive:](self->_webViewTopConstraint, "setActive:", v5);
  -[UIButton setHidden:](self->_doneButton, "setHidden:", v5);
}

- (void)setResource:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_resource, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sourceURL"));

  if (v5)
    -[BKFootnoteViewController2 _generateAndLoadContent](self, "_generateAndLoadContent");

}

- (BOOL)failedToLoad
{
  return self->failedToLoad;
}

- (void)setFailedToLoad:(BOOL)a3
{
  self->failedToLoad = a3;
}

- (BOOL)readyForDisplay
{
  return self->readyForDisplay;
}

- (void)setReadyForDisplay:(BOOL)a3
{
  self->readyForDisplay = a3;
}

- (BOOL)allowsRemoteInspection
{
  return self->_allowsRemoteInspection;
}

- (void)setAllowsRemoteInspection:(BOOL)a3
{
  self->_allowsRemoteInspection = a3;
}

- (BEFootnotePresenter)presenter
{
  return self->_presenter;
}

- (void)setPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_presenter, a3);
}

- (BEFootnoteDelegate)delegate
{
  return (BEFootnoteDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (IMFadeView)headerMask
{
  return self->_headerMask;
}

- (void)setHeaderMask:(id)a3
{
  objc_storeStrong((id *)&self->_headerMask, a3);
}

- (IMFadeView)footerMask
{
  return self->_footerMask;
}

- (void)setFooterMask:(id)a3
{
  objc_storeStrong((id *)&self->_footerMask, a3);
}

- (UIButton)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
  objc_storeStrong((id *)&self->_doneButton, a3);
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
  objc_storeStrong((id *)&self->_webView, a3);
}

- (BKExpandedContentResource)resource
{
  return self->_resource;
}

- (BEWebViewFactoryStylesheetSet)stylesheetSet
{
  return self->_stylesheetSet;
}

- (void)setStylesheetSet:(id)a3
{
  objc_storeStrong((id *)&self->_stylesheetSet, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
}

- (_WKUserStyleSheet)themeStylesheet
{
  return self->_themeStylesheet;
}

- (void)setThemeStylesheet:(id)a3
{
  objc_storeStrong((id *)&self->_themeStylesheet, a3);
}

- (NSLayoutConstraint)webViewTopAnchorWhenDoneButtonVisible
{
  return self->_webViewTopAnchorWhenDoneButtonVisible;
}

- (void)setWebViewTopAnchorWhenDoneButtonVisible:(id)a3
{
  objc_storeStrong((id *)&self->_webViewTopAnchorWhenDoneButtonVisible, a3);
}

- (NSLayoutConstraint)webViewTopConstraint
{
  return self->_webViewTopConstraint;
}

- (void)setWebViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_webViewTopConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_webViewTopAnchorWhenDoneButtonVisible, 0);
  objc_storeStrong((id *)&self->_themeStylesheet, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_stylesheetSet, 0);
  objc_storeStrong((id *)&self->_resource, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_footerMask, 0);
  objc_storeStrong((id *)&self->_headerMask, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_presenter, 0);
}

@end
