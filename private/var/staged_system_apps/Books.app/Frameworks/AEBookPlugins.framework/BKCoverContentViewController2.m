@implementation BKCoverContentViewController2

- (BKCoverContentViewController2)init
{
  BKCoverContentViewController2 *v2;
  BKCoverContentViewController2 *v3;
  dispatch_queue_attr_t v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *dispatchQueue;
  void *v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BKCoverContentViewController2;
  v2 = -[BKContentViewController init](&v11, "init");
  v3 = v2;
  if (v2)
  {
    v2->super._ordinal = -[BKCoverContentViewController2 ordinal](v2, "ordinal");
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = dispatch_queue_create("com.apple.iBooks.BKContentCoverViewController2", v5);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v9 = -[BKCoverContentViewController2 registerForTraitChanges:withAction:](v3, "registerForTraitChanges:withAction:", v8, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v3;
}

- (void)releaseViews
{
  WKWebView *coverWebView;
  objc_super v4;

  coverWebView = self->_coverWebView;
  self->_coverWebView = 0;

  -[BKCoverContentViewController2 setCoverImage:](self, "setCoverImage:", 0);
  -[BKCoverContentViewController2 setActivityIndicator:](self, "setActivityIndicator:", 0);
  v4.receiver = self;
  v4.super_class = (Class)BKCoverContentViewController2;
  -[BKContentViewController releaseViews](&v4, "releaseViews");
}

- (BOOL)isReusable
{
  return 0;
}

- (BOOL)isTOCContent
{
  return 1;
}

- (BOOL)contentNeedsFilter
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKCoverContentViewController2 coverImage](self, "coverImage"));

  return v2 == 0;
}

- (int64_t)ordinal
{
  return -102;
}

- (id)currentLocation
{
  return -[BKLocation initWithOrdinal:]([BKLocation alloc], "initWithOrdinal:", -101);
}

- (BOOL)isAnnotationVisible:(id)a3
{
  return 0;
}

- (CGRect)cachedRectForAnnotation:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)cachedVisibleRectForAnnotation:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCoverImage:(id)a3 isUndesirable:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t ImageWithTemplate;
  const void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;

  v4 = a4;
  v6 = a3;
  if (!v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController configuration](self, "configuration"));
    objc_msgSend(v10, "layoutSize");

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pageProgressionDirection"));
    v12 = objc_msgSend(v11, "isEqualToString:", AEHelperStringMetadataPageProgressionRightToLeftValue);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bookLanguage"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "coverWritingModeString"));
    v15 = BKGenericBookCoverLayoutFromLanguageAndVerticality(v13, objc_msgSend(v14, "imIsVerticalWritingMode"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v16, "scale");
    v18 = v17;
    v19 = v12;

    v21 = CGSizeScale(v20);
    v23 = v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "genericCoverTemplate"));
    v25 = BKGenericBookCoverTemplateNameValid();

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "shortBookTitle"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bookAuthor"));
    if (v25)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "genericCoverTemplate"));
      ImageWithTemplate = BKGenericBookCoverCreateImageWithTemplate(v26, v27, v18, v19, v15, v28, v21, v23);
    }
    else
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "databaseKey"));
      ImageWithTemplate = BKGenericBookCoverCreateImageWithItemIDAndLayout(v26, v27, v18, v19, v28, v15, v21, v23);
    }
    v30 = (const void *)ImageWithTemplate;

    if (v30)
    {
      v35 = (id)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", v30));
      CFRelease(v30);
      if (!v4)
        goto LABEL_13;
    }
    else
    {
      v35 = 0;
      if (!v4)
      {
LABEL_13:

        goto LABEL_14;
      }
    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "embeddedArtHrefRejected"));

    if (!v32)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
      objc_msgSend(v33, "setEmbeddedArtHrefRejected:", &__kCFBooleanTrue);

    }
    goto LABEL_13;
  }
  v35 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "embeddedArtHrefRejected"));

  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
    objc_msgSend(v9, "setEmbeddedArtHrefRejected:", &__kCFBooleanFalse);
LABEL_14:

  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKCoverContentViewController2 coverImage](self, "coverImage"));
  objc_msgSend(v34, "setImage:", v35);

  -[BKContentViewController contentReady](self, "contentReady");
}

- (void)loadViewUIImage
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *dispatchQueue;
  id v16;
  _QWORD v17[4];
  id v18;
  BKCoverContentViewController2 *v19;
  id v20;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKCoverContentViewController2 coverImage](self, "coverImage"));

  if (!v3)
  {
    v4 = objc_alloc((Class)UIImageView);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKCoverContentViewController2 view](self, "view"));
    objc_msgSend(v5, "bounds");
    v6 = objc_msgSend(v4, "initWithFrame:");
    -[BKCoverContentViewController2 setCoverImage:](self, "setCoverImage:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKCoverContentViewController2 coverImage](self, "coverImage"));
  objc_msgSend(v8, "setBackgroundColor:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKCoverContentViewController2 coverImage](self, "coverImage"));
  objc_msgSend(v9, "setOpaque:", 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKCoverContentViewController2 coverImage](self, "coverImage"));
  objc_msgSend(v10, "setContentMode:", 1);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKCoverContentViewController2 coverImage](self, "coverImage"));
  objc_msgSend(v11, "setAutoresizingMask:", 18);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKCoverContentViewController2 view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKCoverContentViewController2 coverImage](self, "coverImage"));
  objc_msgSend(v12, "addSubview:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKCoverContentViewController2 _getURLToLoad](self, "_getURLToLoad"));
  objc_initWeak(&location, self);
  dispatchQueue = self->_dispatchQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_37E14;
  v17[3] = &unk_1BF660;
  objc_copyWeak(&v20, &location);
  v18 = v14;
  v19 = self;
  v16 = v14;
  dispatch_async(dispatchQueue, v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (id)_getURLToLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "embeddedArtHrefMinusSubpath"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "baseURL"));

  v7 = 0;
  if (v4 && v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", v4, v6));
    v9 = BEURLHandleriBooksImgUrlFromiBooksURL(v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v9);

  }
  return v7;
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[BKCoverContentViewController2 setActivityIndicatorVisible:animated:afterDelay:](self, "setActivityIndicatorVisible:animated:afterDelay:", 0, a3, 0.0);
  v5.receiver = self;
  v5.super_class = (Class)BKCoverContentViewController2;
  -[BKContentViewController viewWillDisappear:](&v5, "viewWillDisappear:", v3);
}

- (void)viewDidLoad
{
  void *v3;
  BKActivityIndicatorOverlayView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BKActivityIndicatorOverlayView *v10;
  BKActivityIndicatorOverlayView *activityIndicator;
  void *v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  double v19;
  id v20;
  void *v21;
  int64_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  WKWebView *v34;
  WKWebView *coverWebView;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  WKWebView *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  objc_super v58;
  _QWORD v59[4];

  v58.receiver = self;
  v58.super_class = (Class)BKCoverContentViewController2;
  -[BKContentViewController viewDidLoad](&v58, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKCoverContentViewController2 _getURLToLoad](self, "_getURLToLoad"));
  v4 = [BKActivityIndicatorOverlayView alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKCoverContentViewController2 theme](self, "theme"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentTextColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "colorWithAlphaComponent:", 0.7));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKCoverContentViewController2 theme](self, "theme"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "backgroundColorForTraitEnvironment:", self));
  v10 = -[BKActivityIndicatorOverlayView initWithBackgroundColor:foregroundColor:](v4, "initWithBackgroundColor:foregroundColor:", v7, v9);
  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = v10;

  if (v3 && !BEDoesURLPointToAnImageFile(v3))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController configuration](self, "configuration"));
    objc_msgSend(v12, "layoutSize");
    v14 = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
    v16 = objc_alloc((Class)BEWebViewFactoryPaginationOptions);
    v17 = objc_msgSend(v15, "obeyPageBreaks");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController configuration](self, "configuration"));
    objc_msgSend(v18, "gutterWidth");
    v55 = objc_msgSend(v16, "initWithMode:usePaginationLineGrid:respectPageBreaks:isHorizontalScroll:contentLayoutSize:gapBetweenPages:viewportWidth:fixedLayoutSize:pageLength:fontSize:developerExtrasEnabled:", 0, 0, v17, 0, objc_msgSend(v15, "shouldAllowRemoteInspection"), CGSizeZero.width, CGSizeZero.height, v19, v14, CGSizeZero.width, CGSizeZero.height, v14, 0.0);

    v20 = objc_alloc((Class)BECFIUtilitiesJSOptions);
    v56 = v15;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "assetID"));
    v22 = -[BKCoverContentViewController2 ordinal](self, "ordinal");
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "spineIndexInPackage"));
    v54 = objc_msgSend(v20, "initWithManifestId:assetId:chapterIndex:spineIndex:", 0, v21, v22, objc_msgSend(v23, "unsignedIntegerValue"));

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKCoverContentViewController2 view](self, "view"));
    objc_msgSend(v24, "bounds");
    v26 = v25;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKCoverContentViewController2 view](self, "view"));
    objc_msgSend(v27, "bounds");
    v29 = v28;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "assetID"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
    v57 = v3;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "cacheItem"));
    v34 = (WKWebView *)objc_claimAutoreleasedReturnValue(+[BEWebViewFactory viewConfiguredForCoverContent:bookID:protocolCacheItem:paginationOptions:cfiOptions:](BEWebViewFactory, "viewConfiguredForCoverContent:bookID:protocolCacheItem:paginationOptions:cfiOptions:", v31, v33, v55, v54, 0.0, 0.0, v26, v29));
    coverWebView = self->_coverWebView;
    self->_coverWebView = v34;

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView be_navigationHandler](self->_coverWebView, "be_navigationHandler"));
    objc_msgSend(v36, "setDelegate:", self);

    -[WKWebView setTranslatesAutoresizingMaskIntoConstraints:](self->_coverWebView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[BKCoverContentViewController2 view](self, "view"));
    objc_msgSend(v37, "addSubview:", self->_coverWebView);
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView leftAnchor](self->_coverWebView, "leftAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "leftAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v52));
    v59[0] = v51;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView rightAnchor](self->_coverWebView, "rightAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "rightAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v49));
    v59[1] = v48;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView topAnchor](self->_coverWebView, "topAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "topAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v39));
    v59[2] = v40;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView bottomAnchor](self->_coverWebView, "bottomAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "bottomAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v42));
    v59[3] = v43;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v59, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v44);

    v3 = v57;
    v45 = self->_coverWebView;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLRequest requestWithURL:](NSURLRequest, "requestWithURL:", v57));
    v47 = -[WKWebView loadRequest:](v45, "loadRequest:", v46);

  }
  else
  {
    -[BKCoverContentViewController2 loadViewUIImage](self, "loadViewUIImage");
  }

}

- (void)_forceWebContentBackgroundColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKCoverContentViewController2 themePage](self, "themePage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKCoverContentViewController2 view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "backgroundColorForTraitEnvironment:", v4));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bc_rgbaHexValue"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("document.body.style.backgroundColor = \"#%@\"), v8));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKCoverContentViewController2 coverWebView](self, "coverWebView"));
  objc_msgSend(v7, "evaluateJavaScript:completionHandler:", v6, 0);

}

- (void)setTheme:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKCoverContentViewController2;
  -[BKContentViewController setTheme:](&v4, "setTheme:", a3);
  -[BKCoverContentViewController2 _forceWebContentBackgroundColor](self, "_forceWebContentBackgroundColor");
}

- (void)setActivityIndicatorVisible:(BOOL)a3 animated:(BOOL)a4 afterDelay:(double)a5
{
  _BOOL8 v6;
  BKActivityIndicatorOverlayView *activityIndicator;
  id v8;

  v6 = a4;
  activityIndicator = self->_activityIndicator;
  if (a3)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[BKCoverContentViewController2 view](self, "view"));
    -[BKActivityIndicatorOverlayView showIndicatorCenteredInView:animated:animationDelay:](activityIndicator, "showIndicatorCenteredInView:animated:animationDelay:", v8, v6, a5);

  }
  else
  {
    -[BKActivityIndicatorOverlayView hideIndicatorAnimated:animationDelay:](self->_activityIndicator, "hideIndicatorAnimated:animationDelay:", a4, a5);
  }
}

- (void)startActivityIndicatorAfterDelay:(double)a3
{
  -[BKCoverContentViewController2 setActivityIndicatorVisible:animated:afterDelay:](self, "setActivityIndicatorVisible:animated:afterDelay:", 1, 1, a3);
}

- (void)stopActivityIndicator:(BOOL)a3
{
  -[BKCoverContentViewController2 setActivityIndicatorVisible:animated:afterDelay:](self, "setActivityIndicatorVisible:animated:afterDelay:", 0, a3, 0.0);
}

- (void)navigationHandler:(id)a3 didStartLoadOfURL:(id)a4
{
  -[BKCoverContentViewController2 startActivityIndicatorAfterDelay:](self, "startActivityIndicatorAfterDelay:", a3, a4, 0.0);
}

- (void)navigationHandler:(id)a3 didFinishLoadOfURL:(id)a4
{
  -[BKCoverContentViewController2 stopActivityIndicator:](self, "stopActivityIndicator:", 1, a4);
  -[BKCoverContentViewController2 _forceWebContentBackgroundColor](self, "_forceWebContentBackgroundColor");
}

- (void)navigationHandler:(id)a3 failedToLoadURL:(id)a4 error:(id)a5
{
  -[BKCoverContentViewController2 stopActivityIndicator:](self, "stopActivityIndicator:", 1, a4, a5);
}

- (UIImageView)coverImage
{
  return self->_coverImage;
}

- (void)setCoverImage:(id)a3
{
  objc_storeStrong((id *)&self->_coverImage, a3);
}

- (WKWebView)coverWebView
{
  return self->_coverWebView;
}

- (void)setCoverWebView:(id)a3
{
  objc_storeStrong((id *)&self->_coverWebView, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (BKActivityIndicatorOverlayView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_coverWebView, 0);
  objc_storeStrong((id *)&self->_coverImage, 0);
}

@end
