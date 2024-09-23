@implementation THWWebView

- (THWWebView)initWithfilteredOutURLSchemes:(id)a3 requestScope:(id)a4
{
  id v6;
  THWWebView *v7;
  THWWebView *v8;
  id v9;
  PFDURLRequestScope *requestScope;
  _QWORD v12[4];
  THWWebView *v13;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)THWWebView;
  v7 = -[THWWebView initWithFrame:](&v14, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v8 = v7;
  if (v7)
  {
    v7->_shouldEnableScrolling = 1;
    objc_storeStrong((id *)&v7->_requestScope, a4);
    v9 = -[NSSet copy](v8->_filteredOutURLSchemes, "copy");
    requestScope = v8->_requestScope;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_5CC88;
    v12[3] = &unk_427DB8;
    v13 = v8;
    -[THWWebView _createWebViewWithContentBlockers:requestScope:completion:](v13, "_createWebViewWithContentBlockers:requestScope:completion:", v9, requestScope, v12);

  }
  return v8;
}

- (THWWebView)initWithfilteredOutURLSchemes:(id)a3
{

  return 0;
}

- (void)loadURL:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSURLRequest requestWithURL:](NSURLRequest, "requestWithURL:", a3));
  -[THWWebView loadRequest:](self, "loadRequest:", v4);

}

- (void)loadRequest:(id)a3
{
  id v4;

  v4 = objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v4, "setAttribution:", 1);
  -[THWWebView setRequest:](self, "setRequest:", v4);

}

- (void)setFrame:(CGRect)a3 naturalSize:(CGSize)a4
{
  -[THWWebView setFrame:naturalSize:completion:](self, "setFrame:naturalSize:completion:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.width, a4.height);
}

- (void)setFrame:(CGRect)a3 naturalSize:(CGSize)a4 completion:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v18;
  double MidX;
  void (**v20)(_QWORD);
  CGFloat v22;
  CGAffineTransform v23;
  CGAffineTransform v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a5;
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v22 = height;
  v25.size.height = height;
  v26 = CGRectIntegral(v25);
  v11 = v26.size.width;
  v12 = v26.size.height;
  v13 = CGRectZero.origin.y;
  v29.size.width = CGRectZero.size.width;
  v29.size.height = CGRectZero.size.height;
  v29.origin.x = CGRectZero.origin.x;
  v29.origin.y = v13;
  v14 = 1.0;
  if (CGRectEqualToRect(v26, v29))
  {
    v15 = a4.width;
    v16 = a4.height;
  }
  else
  {
    v15 = a4.width;
    v16 = a4.height;
    if (a4.width != CGSizeZero.width || a4.height != CGSizeZero.height)
    {
      v18 = THScaleNeededToFitSizeInSize(a4.width, a4.height, v11, v12);
      v15 = a4.width;
      v16 = a4.height;
      v14 = v18;
    }
  }
  -[THWWebView setBounds:](self, "setBounds:", CGRectZero.origin.x, v13, v15, v16);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = v22;
  MidX = CGRectGetMidX(v27);
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = v22;
  -[THWWebView setCenter:](self, "setCenter:", MidX, CGRectGetMidY(v28));
  CGAffineTransformMakeScale(&v24, v14, v14);
  v23 = v24;
  -[THWWebView setTransform:](self, "setTransform:", &v23);
  v20 = (void (**)(_QWORD))objc_retainBlock(v10);

  if (v20)
    v20[2](v20);

}

- (void)hide
{
  id v3;

  -[THWWebView setAlpha:](self, "setAlpha:", 0.0);
  v3 = (id)objc_claimAutoreleasedReturnValue(-[THWWebView webView](self, "webView"));
  objc_msgSend(v3, "setAlpha:", 0.0);

}

- (void)showAnimated:(BOOL)a3 duration:(double)a4 completion:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebView layer](self, "layer"));
  objc_msgSend(v8, "setShouldRasterize:", 1);

  v11 = TSUScreenScale(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebView layer](self, "layer"));
  objc_msgSend(v12, "setRasterizationScale:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebView webView](self, "webView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layer"));
  objc_msgSend(v14, "setShouldRasterize:", 1);

  v17 = TSUScreenScale(v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebView webView](self, "webView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "layer"));
  objc_msgSend(v19, "setRasterizationScale:", v17);

  v22 = v7;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_5D138;
  v23[3] = &unk_426D30;
  v23[4] = self;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_5D184;
  v21[3] = &unk_427DE0;
  v21[4] = self;
  v20 = v7;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v23, v21, a4);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;
  id v12;
  char v13;
  id v14;
  unsigned int v15;
  void *v16;
  id v17;
  objc_super v19;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)THWWebView;
  v8 = -[THWWebView hitTest:withEvent:](&v19, "hitTest:withEvent:", v7, x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  WeakRetained = objc_loadWeakRetained((id *)&self->_webViewDelegate);
  if (WeakRetained)
  {
    v11 = WeakRetained;
    v12 = objc_loadWeakRetained((id *)&self->_webViewDelegate);
    v13 = objc_opt_respondsToSelector(v12, "webView:shouldAcceptHitAtPoint:onView:withEvent:");

    if ((v13 & 1) != 0)
    {
      v14 = objc_loadWeakRetained((id *)&self->_webViewDelegate);
      v15 = objc_msgSend(v14, "webView:shouldAcceptHitAtPoint:onView:withEvent:", self, v9, v7, x, y);

      if (v15)
        v16 = v9;
      else
        v16 = 0;
      v17 = v16;

      v9 = v17;
    }
  }

  return v9;
}

- (void)disableScrolling
{
  -[THWWebView setShouldEnableScrolling:](self, "setShouldEnableScrolling:", 0);
}

- (id)stringByEvaluatingJavaScriptFromString:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebView webView](self, "webView"));
  objc_msgSend(v5, "evaluateJavaScript:completionHandler:", v4, &stru_427E20);

  return CFSTR("0");
}

- (void)setShouldEnableScrolling:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  self->_shouldEnableScrolling = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[THWWebView webView](self, "webView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "scrollView"));
  objc_msgSend(v4, "setScrollEnabled:", v3);

}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
  -[THWWebView _attemptURLLoad](self, "_attemptURLLoad");
}

- (void)setWebView:(id)a3
{
  WKWebView *v4;
  WKWebView *webView;
  void *v6;
  WKWebView *v7;
  void *v8;
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
  WKWebView *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];

  v4 = (WKWebView *)a3;
  webView = self->_webView;
  if (webView)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView superview](webView, "superview"));

    if (v6)
      -[WKWebView removeFromSuperview](self->_webView, "removeFromSuperview");
  }
  v7 = self->_webView;
  self->_webView = v4;
  v19 = v4;

  -[WKWebView setNavigationDelegate:](self->_webView, "setNavigationDelegate:", self);
  -[WKWebView setUIDelegate:](self->_webView, "setUIDelegate:", self);
  -[THWWebView addSubview:](self, "addSubview:", self->_webView);
  -[WKWebView setTranslatesAutoresizingMaskIntoConstraints:](self->_webView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView leadingAnchor](self->_webView, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebView leadingAnchor](self, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
  v22[0] = v18;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView trailingAnchor](self->_webView, "trailingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebView trailingAnchor](self, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v8));
  v22[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView topAnchor](self->_webView, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebView topAnchor](self, "topAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
  v22[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView bottomAnchor](self->_webView, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebView bottomAnchor](self, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
  v22[3] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

  -[THWWebView _attemptURLLoad](self, "_attemptURLLoad");
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD);
  id WeakRetained;
  char v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  unsigned int v16;
  _QWORD v17[5];

  v7 = a4;
  v8 = (void (**)(id, _QWORD))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_webViewDelegate);
  v10 = objc_opt_respondsToSelector(WeakRetained, "webView:shouldStartLoadWithURL:navigationType:deferredResponseHandler:");

  if ((v10 & 1) != 0)
  {
    v11 = objc_msgSend(v7, "navigationType");
    if ((unint64_t)v11 >= 5)
      v12 = 5;
    else
      v12 = (uint64_t)v11;
    v13 = objc_loadWeakRetained((id *)&self->_webViewDelegate);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "request"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "URL"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_5D7F4;
    v17[3] = &unk_426DA8;
    v17[4] = self;
    v16 = objc_msgSend(v13, "webView:shouldStartLoadWithURL:navigationType:deferredResponseHandler:", self, v15, v12, v17);

    v8[2](v8, v16);
  }
  else
  {
    v8[2](v8, 1);
  }

}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  THWWebViewDelegate **p_webViewDelegate;
  id WeakRetained;
  char v7;
  id v8;

  p_webViewDelegate = &self->_webViewDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_webViewDelegate);
  v7 = objc_opt_respondsToSelector(WeakRetained, "webViewDidFinishLoad:");

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_webViewDelegate);
    objc_msgSend(v8, "webViewDidFinishLoad:", self);

  }
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id WeakRetained;
  char v7;
  id v8;
  id v9;

  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_webViewDelegate);
  v7 = objc_opt_respondsToSelector(WeakRetained, "webView:didFailLoadWithError:");

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_webViewDelegate);
    objc_msgSend(v8, "webView:didFailLoadWithError:", self, v9);

  }
}

- (id)_webView:(id)a3 adjustedDataInteractionItemProvidersForItemProvider:(id)a4 representingObjects:(id)a5 additionalData:(id)a6
{
  return &__NSArray0__struct;
}

- (void)_attemptURLLoad
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = objc_claimAutoreleasedReturnValue(-[THWWebView webView](self, "webView"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebView request](self, "request"));

    if (v5)
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(-[THWWebView webView](self, "webView"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebView request](self, "request"));
      v7 = objc_msgSend(v8, "loadRequest:", v6);

    }
  }
}

- (void)_createWebViewWithContentBlockers:(id)a3 requestScope:(id)a4 completion:(id)a5
{
  id v7;
  _QWORD v8[4];
  THWWebView *v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_5DA54;
  v8[3] = &unk_427E48;
  v9 = self;
  v10 = a5;
  v7 = v10;
  -[THWWebView _createConfigurationWithfilteredOutURLSchemes:requestScope:completion:](v9, "_createConfigurationWithfilteredOutURLSchemes:requestScope:completion:", a3, a4, v8);

}

- (void)_createContentBlockingRulesWithfilteredOutURLSchemes:(id)a3 toRuleListStore:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_5DDB4;
  v23[3] = &unk_427E70;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v9, "count")));
  v24 = v10;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v23);

  if (objc_msgSend(v10, "count"))
  {
    v22 = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v10, 4, &v22));
    v12 = v22;
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWWebView _createContentBlockingRulesWithfilteredOutURLSchemes:toRuleListStore:completion:]"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Web/THWWebView.m"));
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, v15, 378, CFSTR("expected nil value for '%s'"), "jsonError");

    }
    if (!v11)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWWebView _createContentBlockingRulesWithfilteredOutURLSchemes:toRuleListStore:completion:]"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Web/THWWebView.m"));
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, v18, 379, CFSTR("invalid nil value for '%s'"), "contentRuleListData");

    }
    v19 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v11, 4);
    if (!v7)
      v7 = (id)objc_claimAutoreleasedReturnValue(+[WKContentRuleListStore defaultStore](WKContentRuleListStore, "defaultStore"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_5DEB0;
    v20[3] = &unk_427E98;
    v21 = v8;
    objc_msgSend(v7, "compileContentRuleListForIdentifier:encodedContentRuleList:completionHandler:", CFSTR("filteredOutURLSchemes"), v19, v20);

  }
  else if (v8)
  {
    (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
  }

}

- (void)_createConfigurationWithfilteredOutURLSchemes:(id)a3 requestScope:(id)a4 completion:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  PFDUrlSchemeHandler *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];

  v43 = a3;
  v7 = a4;
  v38 = a5;
  v9 = (void *)objc_opt_new(WKWebViewConfiguration, v8);
  objc_msgSend(v9, "setMediaTypesRequiringUserActionForPlayback:", 0);
  objc_msgSend(v9, "setAllowsInlineMediaPlayback:", 1);
  objc_msgSend(v9, "setAllowsPictureInPictureMediaPlayback:", 0);
  v10 = objc_alloc_init((Class)WKWebpagePreferences);
  objc_msgSend(v10, "_setMouseEventPolicy:", 1);
  v40 = v10;
  objc_msgSend(v9, "setDefaultWebpagePreferences:", v10);
  v12 = (void *)objc_opt_new(WKPreferences, v11);
  objc_msgSend(v12, "_setDeveloperExtrasEnabled:", +[BCDevice isInternalInstall](BCDevice, "isInternalInstall"));
  objc_msgSend(v12, "_setDiagnosticLoggingEnabled:", 0);
  objc_msgSend(v12, "_setLogsPageMessagesToSystemConsoleEnabled:", 0);
  objc_msgSend(v12, "_setLargeImageAsyncDecodingEnabled:", 0);
  objc_msgSend(v9, "setPreferences:", v12);
  v42 = v7;
  v13 = -[PFDUrlSchemeHandler initWithRequestScope:]([PFDUrlSchemeHandler alloc], "initWithRequestScope:", v7);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PFDUrlSchemeHandler supportedSchemes](v13, "supportedSchemes"));
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v49 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(v9, "setURLSchemeHandler:forURLScheme:", v13, *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i), v38);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v16);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userContentController"));
  v20 = THBundle();
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "pathForResource:ofType:", CFSTR("AppleWidgetController"), CFSTR("js")));

  if (!objc_msgSend(v22, "length"))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWWebView _createConfigurationWithfilteredOutURLSchemes:requestScope:completion:]"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Web/THWWebView.m"));
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, v25, 443, CFSTR("Could not find AppleWidgetController.js!"));

  }
  if (objc_msgSend(v22, "length", v38))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v22));
    if (!objc_msgSend(v26, "length"))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWWebView _createConfigurationWithfilteredOutURLSchemes:requestScope:completion:]"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Web/THWWebView.m"));
      objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, v29, 446, CFSTR("Could not load AppleWidgetController.js!"));

    }
    if (objc_msgSend(v26, "length"))
    {
      v30 = objc_alloc((Class)WKUserScript);
      v31 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v26, 4);
      v32 = objc_msgSend(v30, "initWithSource:injectionTime:forMainFrameOnly:", v31, 0, 1);

      objc_msgSend(v19, "addUserScript:", v32);
    }

  }
  v33 = objc_msgSend(objc_alloc((Class)_WKUserStyleSheet), "initWithSource:forMainFrameOnly:", CFSTR("@media (inverted-colors) {   img:not(picture>img), picture { filter: invert(0); }   video { filter: invert(0) !important; }}"),
          0);
  objc_msgSend(v19, "_addUserStyleSheet:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[WKContentRuleListStore defaultStore](WKContentRuleListStore, "defaultStore"));
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_5E438;
  v44[3] = &unk_427EC0;
  v46 = v9;
  v47 = v39;
  v45 = v19;
  v35 = v9;
  v36 = v39;
  v37 = v19;
  -[THWWebView _createContentBlockingRulesWithfilteredOutURLSchemes:toRuleListStore:completion:](self, "_createContentBlockingRulesWithfilteredOutURLSchemes:toRuleListStore:completion:", v43, v34, v44);

}

- (THPageAffordanceHosting)canvasPageAffordanceHost
{
  return (THPageAffordanceHosting *)objc_loadWeakRetained((id *)&self->_canvasPageAffordanceHost);
}

- (void)setCanvasPageAffordanceHost:(id)a3
{
  objc_storeWeak((id *)&self->_canvasPageAffordanceHost, a3);
}

- (THWWebViewDelegate)webViewDelegate
{
  return (THWWebViewDelegate *)objc_loadWeakRetained((id *)&self->_webViewDelegate);
}

- (void)setWebViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_webViewDelegate, a3);
}

- (NSSet)filteredOutURLSchemes
{
  return self->_filteredOutURLSchemes;
}

- (void)setFilteredOutURLSchemes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (WKWebView)webView
{
  return self->_webView;
}

- (NSURLRequest)request
{
  return self->_request;
}

- (BOOL)finishedLoadingContent
{
  return self->_finishedLoadingContent;
}

- (void)setFinishedLoadingContent:(BOOL)a3
{
  self->_finishedLoadingContent = a3;
}

- (BOOL)shouldEnableScrolling
{
  return self->_shouldEnableScrolling;
}

- (PFDURLRequestScope)requestScope
{
  return self->_requestScope;
}

- (void)setRequestScope:(id)a3
{
  objc_storeStrong((id *)&self->_requestScope, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestScope, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_filteredOutURLSchemes, 0);
  objc_destroyWeak((id *)&self->_webViewDelegate);
  objc_destroyWeak((id *)&self->_canvasPageAffordanceHost);
}

@end
