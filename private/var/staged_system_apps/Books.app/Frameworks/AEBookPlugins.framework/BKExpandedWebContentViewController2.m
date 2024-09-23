@implementation BKExpandedWebContentViewController2

+ (BOOL)supportsResource:(id)a3
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  uint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "resource"));
  objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class(NSURL);
    isKindOfClass = objc_opt_isKindOfClass(v3, v6);
  }

  return isKindOfClass & 1;
}

- (BKExpandedWebContentViewController2)initWithResource:(id)a3
{
  id v4;
  BKExpandedWebContentViewController2 *v5;
  BKExpandedWebContentViewController2 *v6;
  void *v7;
  uint64_t v8;
  NSURL *v9;
  NSURL *url;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BKExpandedWebContentViewController2;
  v5 = -[BKExpandedContentViewController initWithResource:](&v14, "initWithResource:", v4);
  v6 = v5;
  if (v5)
  {
    v5->_showOriginal = 1;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resource"));
    objc_opt_class(NSURL);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    {
      v9 = v7;
      url = v6->_url;
      v6->_url = v9;
    }
    else
    {
      objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v7, v11) & 1) == 0)
      {
LABEL_7:

        goto LABEL_8;
      }
      objc_storeStrong((id *)&v6->_content, v7);
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentType"));
      url = (NSURL *)v6->_contentType;
      v6->_contentType = (NSString *)v12;
    }

    goto LABEL_7;
  }
LABEL_8:

  return v6;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKExpandedWebContentViewController2;
  -[BKExpandedContentViewController viewDidLoad](&v3, "viewDidLoad");
  -[BKExpandedWebContentViewController2 setModalPresentationStyle:](self, "setModalPresentationStyle:", 4);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKExpandedWebContentViewController2;
  -[BKExpandedContentViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedWebContentViewController2 webView](self, "webView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scrollView"));
  objc_msgSend(v5, "flashScrollIndicators");

  -[BKExpandedWebContentViewController2 setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedWebContentViewController2 view](self, "view"));
  objc_msgSend(v8, "setNeedsUpdateConstraints");

  v9.receiver = self;
  v9.super_class = (Class)BKExpandedWebContentViewController2;
  -[BKExpandedWebContentViewController2 viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);

}

- (void)releaseViews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKExpandedWebContentViewController2;
  -[BKExpandedContentViewController releaseViews](&v4, "releaseViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedWebContentViewController2 webView](self, "webView"));
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("title"), off_20D9C0);

  -[BKExpandedWebContentViewController2 setWebView:](self, "setWebView:", 0);
}

- (BOOL)wantsDoubleTapGestureRecognizer
{
  return 0;
}

- (BOOL)wantsTapToHideToolbarGestureRecognizer
{
  return 0;
}

- (id)contentView
{
  WKWebView *webView;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _BOOL8 v14;
  void *v15;
  _BOOL8 imageFilteringEnabled;
  void *v17;
  void *v18;
  void *v19;
  WKWebView *v20;
  WKWebView *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;

  webView = self->_webView;
  if (!webView)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController resource](self, "resource"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedWebContentViewController2 view](self, "view"));
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = -[BKExpandedWebContentViewController2 allowsRemoteInspection](self, "allowsRemoteInspection");
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bookID"));
    v28 = v4;
    imageFilteringEnabled = self->_imageFilteringEnabled;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cacheItem"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedWebContentViewController2 cleanupOptions](self, "cleanupOptions"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedWebContentViewController2 _stylesheetSet](self, "_stylesheetSet"));
    v20 = (WKWebView *)objc_claimAutoreleasedReturnValue(+[BEWebViewFactory viewConfiguredForPreview:enableDeveloperExtras:bookID:imageFilterMode:protocolCacheItem:cleanupOptions:stylesheetSet:](BEWebViewFactory, "viewConfiguredForPreview:enableDeveloperExtras:bookID:imageFilterMode:protocolCacheItem:cleanupOptions:stylesheetSet:", v14, v15, imageFilteringEnabled, v17, v18, v19, v7, v9, v11, v13));
    v21 = self->_webView;
    self->_webView = v20;

    -[WKWebView setTranslatesAutoresizingMaskIntoConstraints:](self->_webView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[WKWebView setBackgroundColor:](self->_webView, "setBackgroundColor:", v22);

    -[WKWebView setOpaque:](self->_webView, "setOpaque:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView be_navigationHandler](self->_webView, "be_navigationHandler"));
    objc_msgSend(v23, "setDelegate:", self);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView be_uiHandler](self->_webView, "be_uiHandler"));
    objc_msgSend(v24, "setDelegate:", self);

    -[WKWebView addObserver:forKeyPath:options:context:](self->_webView, "addObserver:forKeyPath:options:context:", self, CFSTR("title"), 0, off_20D9C0);
    if (self->_imageFilteringEnabled)
      -[BKExpandedWebContentViewController2 _swapImageProtocols](self, "_swapImageProtocols");
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView scrollView](self->_webView, "scrollView"));
    objc_msgSend(v25, "_setShowsBackgroundShadow:", 0);
    objc_msgSend(v25, "setShowsHorizontalScrollIndicator:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    objc_msgSend(v25, "setBackgroundColor:", v26);

    objc_msgSend(v25, "setOpaque:", 0);
    -[BKExpandedWebContentViewController2 _updateMetaViewportArguments](self, "_updateMetaViewportArguments");
    -[BKExpandedWebContentViewController2 _updateContent](self, "_updateContent");
    -[BKExpandedContentViewController setInnerView:](self, "setInnerView:", self->_webView);

    webView = self->_webView;
  }
  return webView;
}

- (void)_swapImageProtocols
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKExpandedWebContentViewController2 webView](self, "webView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BEContentSupportJS javascriptForSwappingAllImages](BEContentSupportJS, "javascriptForSwappingAllImages"));
  objc_msgSend(v3, "evaluateJavaScript:completionHandler:", v2, &stru_1C09D0);

}

- (id)leftToolbarItems
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v9;

  if (!self->_imageFilteringEnabled)
    return 0;
  v3 = BookEPUBBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Invert"), &stru_1C3088, 0));

  v6 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", v5, 0, self, "_invert:");
  v9 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

  return v7;
}

- (void)_invert:(id)a3
{
  -[BKExpandedWebContentViewController2 _prepareImageShowOriginal:](self, "_prepareImageShowOriginal:", !self->_showOriginal);
}

- (void)showInvertedImage
{
  self->_imageFilteringEnabled = 1;
  self->_showOriginal = 0;
}

- (void)_prepareImageShowOriginal:(BOOL)a3
{
  if (self->_imageFilteringEnabled && self->_showOriginal != a3)
  {
    self->_showOriginal = a3;
    -[BKExpandedWebContentViewController2 _applyImageFilter:](self, "_applyImageFilter:", !a3);
  }
}

- (void)_applyImageFilter:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringValue"));
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("__ibooks_image_filter.refetchVisibleImages(%@)"), v5));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedWebContentViewController2 webView](self, "webView"));
  objc_msgSend(v6, "evaluateJavaScript:completionHandler:", v7, &stru_1C09F0);

}

- (BEContentCleanupJSOptions)cleanupOptions
{
  BEContentCleanupJSOptions *cleanupOptions;
  BEContentCleanupJSOptions *v4;
  BEContentCleanupJSOptions *v5;

  cleanupOptions = self->_cleanupOptions;
  if (!cleanupOptions)
  {
    v4 = (BEContentCleanupJSOptions *)objc_claimAutoreleasedReturnValue(+[BEContentCleanupJSOptions expandedContentOptions](BEContentCleanupJSOptions, "expandedContentOptions"));
    v5 = self->_cleanupOptions;
    self->_cleanupOptions = v4;

    cleanupOptions = self->_cleanupOptions;
  }
  return cleanupOptions;
}

- (id)previewCssTemplate
{
  uint64_t v3;

  v3 = 0;
  return objc_autoreleaseReturnValue((id)objc_claimAutoreleasedReturnValue(+[AEMinimalTemplate templateWithString:error:](AEMinimalTemplate, "templateWithString:error:", CFSTR("{{if contentBackgroundColor}}\n:root, body {\n    background-color: {{.contentBackgroundColor.bc_rgbaString}} !important;\n}\n{{end contentBackgroundColor}}\n\n{{if contentColor}}\n\n:root * {\n    color: {{.contentColor.bc_rgbaString}} !important;\n}\n\n:root svg|text {\n    fill: {{.contentColor.bc_rgbaString}} !important;\n    stroke: none !important;\n}\n\n{{end contentColor}}\n\n* {\n    -webkit-user-select: none;\n    -webkit-touch-callout: none;\n}"),
                                             &v3)));
}

- (id)_stylesheetSet
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedWebContentViewController2 theme](self, "theme"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "backgroundColorForTraitEnvironment:", self));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("contentBackgroundColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedWebContentViewController2 theme](self, "theme"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentTextColor"));
  objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("contentColor"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedWebContentViewController2 theme](self, "theme"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v8, "shouldInvertContent")));
  objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("shouldInvertContent"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedWebContentViewController2 previewCssTemplate](self, "previewCssTemplate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "evaluateWithData:error:", v5, 0));

  v12 = objc_alloc((Class)BEWebViewFactoryStylesheetSet);
  if (objc_msgSend(v11, "length"))
  {
    v16 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
    v14 = objc_msgSend(v12, "initWithAllFrameStylesheets:", v13);

  }
  else
  {
    v14 = objc_msgSend(v12, "initWithAllFrameStylesheets:", &__NSArray0__struct);
  }

  return v14;
}

- (id)_urlToLoad
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedWebContentViewController2 url](self, "url"));
  v3 = BEURLHandleriBooksImgUrlFromiBooksURL(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (void)_updateContent
{
  void *v3;
  void *v4;
  void *v5;
  WKWebView *webView;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  WKWebView *v12;
  id v13;
  id v14;

  v14 = (id)objc_claimAutoreleasedReturnValue(-[BKExpandedWebContentViewController2 _titleForPage](self, "_titleForPage"));
  -[BKExpandedContentViewController setPreviewTitle:](self, "setPreviewTitle:");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedWebContentViewController2 content](self, "content"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedWebContentViewController2 content](self, "content"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataUsingEncoding:", 4));

    webView = self->_webView;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedWebContentViewController2 contentType](self, "contentType"));
    v8 = BEUTF8StringEncodingName;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController resource](self, "resource"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sourceURL"));
    v11 = -[WKWebView loadData:MIMEType:characterEncodingName:baseURL:](webView, "loadData:MIMEType:characterEncodingName:baseURL:", v5, v7, v8, v10);

  }
  else
  {
    v12 = self->_webView;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedWebContentViewController2 _urlToLoad](self, "_urlToLoad"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLRequest requestWithURL:](NSURLRequest, "requestWithURL:", v5));
    v13 = -[WKWebView loadRequest:](v12, "loadRequest:", v7);
  }

}

- (double)_viewportWidth
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController resource](self, "resource"));
  objc_msgSend(v2, "contentSize");
  if (v3 <= 0.0)
  {
    v4 = 980.0;
  }
  else
  {
    v4 = v3;
    objc_msgSend(v2, "zoomScale");
    if (v5 != 0.0)
    {
      objc_msgSend(v2, "zoomScale");
      v4 = v4 * v6;
    }
  }

  return v4;
}

- (void)_updateMetaViewportArguments
{
  WKWebView *webView;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  _QWORD v8[4];

  -[BKExpandedWebContentViewController2 _viewportWidth](self, "_viewportWidth");
  webView = self->_webView;
  v7[0] = CFSTR("width");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringValue"));
  v8[0] = v5;
  v8[1] = CFSTR("10");
  v7[1] = CFSTR("maximum-scale");
  v7[2] = CFSTR("minimum-scale");
  v7[3] = CFSTR("shrink-to-fit");
  v8[2] = CFSTR("0.35");
  v8[3] = CFSTR("yes");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 4));
  -[WKWebView _overrideViewportWithArguments:](webView, "_overrideViewportWithArguments:", v6);

}

- (id)_titleForPage
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView title](self->_webView, "title"));
  if (!objc_msgSend(v3, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController resource](self, "resource"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));

    v3 = (void *)v5;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v6));

  if (!objc_msgSend(v7, "length"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedWebContentViewController2 _urlToLoad](self, "_urlToLoad"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));

    if (!objc_msgSend(v9, "length"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController resource](self, "resource"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sourceURL"));
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));

      v9 = (void *)v12;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByDeletingPathExtension"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "capitalizedString"));
  }
  return v7;
}

- (void)navigationHandler:(id)a3 didStartLoadOfURL:(id)a4
{
  -[BKExpandedContentViewController startActivityIndicatorAfterDelay:](self, "startActivityIndicatorAfterDelay:", a3, a4, 0.0);
}

- (void)navigationHandler:(id)a3 didFinishLoadOfURL:(id)a4
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = (id)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController delegate](self, "delegate", a3, a4));
  if ((objc_opt_respondsToSelector(v12, "expandedContentViewDidFinishLoad:") & 1) != 0)
    objc_msgSend(v12, "expandedContentViewDidFinishLoad:", self);
  -[BKExpandedWebContentViewController2 _viewportWidth](self, "_viewportWidth");
  v6 = v5 * 0.95;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedWebContentViewController2 cleanupOptions](self, "cleanupOptions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BEContentCleanupJS updateScriptWithOptions:pageLength:gapBetweenPages:](BEContentCleanupJS, "updateScriptWithOptions:pageLength:gapBetweenPages:", v7, v6, 0.0));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedWebContentViewController2 webView](self, "webView"));
  objc_msgSend(v9, "evaluateJavaScript:completionHandler:", v8, &stru_1C0A10);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedWebContentViewController2 webView](self, "webView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "scrollView"));
  objc_msgSend(v11, "flashScrollIndicators");

  -[BKExpandedContentViewController stopActivityIndicator:](self, "stopActivityIndicator:", 1);
}

- (void)navigationHandler:(id)a3 handleUserRequestForFrameToLoadExternalURL:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController delegate](self, "delegate"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_8023C;
  v11[3] = &unk_1C0A38;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "expandedContentViewController:handleUserRequestForFrameToLoadExternalURL:completion:", self, v8, v11);

}

- (void)navigationHandler:(id)a3 handleExternalLoadRequest:(id)a4 likelyUserInitiated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;

  v5 = a5;
  v7 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController delegate](self, "delegate"));
  objc_msgSend(v8, "expandedContentViewController:handleExternalLoadRequest:likelyUserInitiated:", self, v7, v5);

}

- (BOOL)navigationHandler:(id)a3 handleInternalLoadRequest:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  unsigned __int8 v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "absoluteURL", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController resource](self, "resource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sourceURL"));
  if (objc_msgSend(v5, "be_isEquivalentToURL:ignoringFragment:", v7, 1))
  {

    v8 = 1;
LABEL_5:

    goto LABEL_6;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedWebContentViewController2 _urlToLoad](self, "_urlToLoad"));
  v8 = 1;
  v10 = objc_msgSend(v5, "be_isEquivalentToURL:ignoringFragment:", v9, 1);

  if ((v10 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController delegate](self, "delegate"));
    v8 = objc_msgSend(v6, "expandedContentViewController:handleInternalLoadRequest:", self, v5);
    goto LABEL_5;
  }
LABEL_6:

  return v8;
}

- (void)navigationHandler:(id)a3 handleInternalLoadRequestForNewWindow:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController delegate](self, "delegate"));
  objc_msgSend(v6, "expandedContentViewController:handleInternalLoadRequestForNewWindow:", self, v5);

}

- (void)handler:(id)a3 presentAlertController:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController delegate](self, "delegate"));
  objc_msgSend(v9, "expandedContentViewController:presentAlertController:completion:", self, v8, v7);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;
  _QWORD block[4];
  id v8;
  id location;

  if (off_20D9C0 == a6)
  {
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_80654;
    block[3] = &unk_1C0788;
    objc_copyWeak(&v8, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)BKExpandedWebContentViewController2;
    -[BKExpandedWebContentViewController2 observeValueForKeyPath:ofObject:change:context:](&v6, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (BOOL)allowsRemoteInspection
{
  return self->_allowsRemoteInspection;
}

- (void)setAllowsRemoteInspection:(BOOL)a3
{
  self->_allowsRemoteInspection = a3;
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
  objc_storeStrong((id *)&self->_webView, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSString)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (BOOL)isLoadHTMLString
{
  return self->_isLoadHTMLString;
}

- (void)setIsLoadHTMLString:(BOOL)a3
{
  self->_isLoadHTMLString = a3;
}

- (void)setCleanupOptions:(id)a3
{
  objc_storeStrong((id *)&self->_cleanupOptions, a3);
}

- (BOOL)showOriginal
{
  return self->_showOriginal;
}

- (void)setShowOriginal:(BOOL)a3
{
  self->_showOriginal = a3;
}

- (BOOL)imageFilteringEnabled
{
  return self->_imageFilteringEnabled;
}

- (void)setImageFilteringEnabled:(BOOL)a3
{
  self->_imageFilteringEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cleanupOptions, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_webView, 0);
}

@end
