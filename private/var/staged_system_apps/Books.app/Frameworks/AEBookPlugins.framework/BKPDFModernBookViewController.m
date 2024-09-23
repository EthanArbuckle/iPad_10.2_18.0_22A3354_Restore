@implementation BKPDFModernBookViewController

+ (void)setupModernPDF
{
  +[PDFView EnableAnnotationKit](PDFView, "EnableAnnotationKit");
}

- (PDFDocument)pdfDocument
{
  PDFDocument *pdfDocument;

  pdfDocument = self->_pdfDocument;
  if (!pdfDocument)
  {
    -[BKPDFModernBookViewController reloadPDFDocument](self, "reloadPDFDocument");
    pdfDocument = self->_pdfDocument;
  }
  return pdfDocument;
}

- (UIScrollView)pdfScrollView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "documentScrollView"));

  return (UIScrollView *)v3;
}

- (void)loadAKToolbarView
{
  UIView *akToolbarView;
  UIView *v4;
  void *v5;
  UIView *v6;
  UIView *v7;
  UIView *v8;
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
  id v30;

  akToolbarView = self->_akToolbarView;
  if (akToolbarView)
  {
    -[UIView removeFromSuperview](akToolbarView, "removeFromSuperview");
    v4 = self->_akToolbarView;
    self->_akToolbarView = 0;

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  v6 = (UIView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "akToolbarView"));
  v7 = self->_akToolbarView;
  self->_akToolbarView = v6;

  v8 = self->_akToolbarView;
  if (v8)
  {
    -[UIView setAlpha:](v8, "setAlpha:", 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController theme](self, "theme"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "backgroundColorForTraitEnvironment:", self));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
    objc_msgSend(v11, "setAkToolbarViewTintColor:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController theme](self, "theme"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tintColorForNavbarButtons"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
    objc_msgSend(v14, "setAkToolbarViewItemTintColor:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tintColor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
    objc_msgSend(v17, "setInteractionTintColor:", v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController view](self, "view"));
    objc_msgSend(v18, "addSubview:", self->_akToolbarView);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_akToolbarView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leftAnchor](self->_akToolbarView, "leftAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController view](self, "view"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "leftAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v21));
    objc_msgSend(v22, "setActive:", 1);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIView rightAnchor](self->_akToolbarView, "rightAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController view](self, "view"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "rightAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v25));
    objc_msgSend(v26, "setActive:", 1);

    v30 = (id)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_akToolbarView, "bottomAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController view](self, "view"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bottomAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v28));
    objc_msgSend(v29, "setActive:", 1);

  }
}

- (void)reloadPDFDocument
{
  -[BKPDFModernBookViewController reloadPDFDocumentCompletion:](self, "reloadPDFDocumentCompletion:", 0);
}

- (void)reloadPDFDocumentCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD *v9;
  void (**v10)(_QWORD);
  _QWORD v11[4];
  void (**v12)(_QWORD);
  _QWORD v13[5];
  id v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "url"));

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_DDB04;
  v13[3] = &unk_1C13A0;
  v13[4] = self;
  v7 = v6;
  v14 = v7;
  v8 = v4;
  v15 = v8;
  v9 = objc_retainBlock(v13);
  v10 = objc_retainBlock(v9);
  if (v10)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      v10[2](v10);
    }
    else
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_DDE18;
      v11[3] = &unk_1BEC70;
      v12 = v10;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);

    }
  }

}

- (BKPDFModernBookViewController)initWithBook:(id)a3 storeID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BKPDFModernBookViewController *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AEPdfCache sharedInstance](AEPdfCache, "sharedInstance"));
  v9 = -[BKPDFModernBookViewController initWithBook:storeID:pdfDocumentCache:](self, "initWithBook:storeID:pdfDocumentCache:", v7, v6, v8);

  return v9;
}

- (BKPDFModernBookViewController)initWithBook:(id)a3 storeID:(id)a4 pdfDocumentCache:(id)a5
{
  id v8;
  id v9;
  BKPDFModernBookViewController *v10;
  BKPDFModernBookViewController *v11;
  void *v12;
  dispatch_queue_attr_t v13;
  NSObject *v14;
  dispatch_queue_global_t global_queue;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *writeQueue;
  id v19;
  void *v20;
  PDFDocument *v21;
  PDFDocument *pdfDocument;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSUndoManager *pdfUndoManager;
  void *v28;
  id v29;
  objc_super v31;

  v8 = a3;
  v9 = a5;
  v31.receiver = self;
  v31.super_class = (Class)BKPDFModernBookViewController;
  v10 = -[BKThumbnailBookViewController initWithBook:storeID:](&v31, "initWithBook:storeID:", v8, a4);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_pdfDocumentCache, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "url"));
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    global_queue = dispatch_get_global_queue(0, 0);
    v16 = objc_claimAutoreleasedReturnValue(global_queue);
    v17 = dispatch_queue_create_with_target_V2("com.apple.iBooks.pdfwrite", v14, v16);
    writeQueue = v11->_writeQueue;
    v11->_writeQueue = (OS_dispatch_queue *)v17;

    v11->_accessLock._os_unfair_lock_opaque = 0;
    v19 = -[AEPdfCache copyCacheObjectForURL:](v11->_pdfDocumentCache, "copyCacheObjectForURL:", v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "document"));
    if (v20)
    {
      objc_storeStrong((id *)&v11->_pdfDocument, v20);
      -[BKPDFModernBookViewController startCountingAnnotations](v11, "startCountingAnnotations");
    }
    else
    {
      v21 = (PDFDocument *)objc_msgSend(objc_alloc((Class)PDFDocument), "initWithURL:", v12);
      pdfDocument = v11->_pdfDocument;
      v11->_pdfDocument = v21;

      v24 = BKModernPDFLog(v23);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        sub_11D390();

    }
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "pdfUndoManager"));
    pdfUndoManager = v11->_pdfUndoManager;
    v11->_pdfUndoManager = (NSUndoManager *)v26;

    v11->_targetPageNumber = -1;
    v11->_initialZoomFactor = -1.0;
    -[PDFDocument setPDFAKControllerDelegate:](v11->_pdfDocument, "setPDFAKControllerDelegate:", v11);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v29 = -[BKPDFModernBookViewController registerForTraitChanges:withAction:](v11, "registerForTraitChanges:withAction:", v28, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v11;
}

- (void)dealloc
{
  AEPdfCache *pdfDocumentCache;
  void *v4;
  UITapGestureRecognizer *controlsTapRecognizer;
  void *v6;
  objc_super v7;

  pdfDocumentCache = self->_pdfDocumentCache;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo url](self->super.super._book, "url"));
  -[AEPdfCache removeCacheObjectForURL:](pdfDocumentCache, "removeCacheObjectForURL:", v4);

  -[PDFDocument setPDFAKControllerDelegate:](self->_pdfDocument, "setPDFAKControllerDelegate:", 0);
  -[UITapGestureRecognizer setDelegate:](self->_controlsTapRecognizer, "setDelegate:", 0);
  -[UITapGestureRecognizer removeTarget:action:](self->_controlsTapRecognizer, "removeTarget:action:", self, 0);
  controlsTapRecognizer = self->_controlsTapRecognizer;
  self->_controlsTapRecognizer = 0;

  -[IMPerformSelectorProxy teardown](self->_performSelectorProxy, "teardown");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "removeObserver:", self);

  -[PDFView setDocument:](self->_pdfView, "setDocument:", 0);
  v7.receiver = self;
  v7.super_class = (Class)BKPDFModernBookViewController;
  -[BKThumbnailBookViewController dealloc](&v7, "dealloc");
}

- (id)lastLayoutUsedKey
{
  return CFSTR("BKPDFLayout");
}

- (IMPerformSelectorProxy)performSelectorProxy
{
  IMPerformSelectorProxy *performSelectorProxy;
  IMPerformSelectorProxy *v4;
  IMPerformSelectorProxy *v5;

  performSelectorProxy = self->_performSelectorProxy;
  if (!performSelectorProxy)
  {
    v4 = (IMPerformSelectorProxy *)objc_msgSend(objc_alloc((Class)IMPerformSelectorProxy), "initWithTarget:", self);
    v5 = self->_performSelectorProxy;
    self->_performSelectorProxy = v4;

    performSelectorProxy = self->_performSelectorProxy;
  }
  return performSelectorProxy;
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[BKPDFModernBookViewController _enableMarkupMode:](self, "_enableMarkupMode:", 0);
  v5.receiver = self;
  v5.super_class = (Class)BKPDFModernBookViewController;
  -[BKThumbnailBookViewController viewWillDisappear:](&v5, "viewWillDisappear:", v3);
  -[BKPDFModernBookViewController clearSelection](self, "clearSelection");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)BKPDFModernBookViewController;
  v7 = a4;
  -[BKThumbnailBookViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_DE34C;
  v8[3] = &unk_1C1A60;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", &stru_1C1A38, v8);

}

- (BOOL)prepareForContentScaling
{
  BKPDFModernBookViewController *v2;
  void *v3;
  double v4;
  double v5;
  double v6;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  objc_msgSend(v3, "scaleFactor");
  v5 = v4;
  -[BKPDFModernBookViewController initialZoomFactor](v2, "initialZoomFactor");
  LOBYTE(v2) = v5 == v6;

  return (char)v2;
}

+ (void)_minScaleFactorForPageBounds:(CGFloat)a3 viewBounds:(CGFloat)a4 safeAreaInsets:(double)a5 pageBreakMargins:(double)a6
{
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v27 = a5 + a10 + a14;
  v28 = a6 + a9 + a13;
  v29 = a7 - (a10 + a12) - (a14 + a16);
  v30 = a8 - (a9 + a11) - (a13 + a15);
  v33.origin.x = v27;
  v33.origin.y = v28;
  v33.size.width = v29;
  v33.size.height = v30;
  CGRectGetWidth(v33);
  v34.origin.x = a1;
  v34.origin.y = a2;
  v34.size.width = a3;
  v34.size.height = a4;
  CGRectGetWidth(v34);
  v35.origin.x = v27;
  v35.origin.y = v28;
  v35.size.width = v29;
  v35.size.height = v30;
  CGRectGetHeight(v35);
  v36.origin.x = a1;
  v36.origin.y = a2;
  v36.size.height = a4;
  v36.size.width = a3;
  CGRectGetHeight(v36);
}

- (void)handleContentScaling:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  objc_msgSend(v5, "autoScaleFactor");
  v7 = v6;

  -[BKPDFModernBookViewController setInitialZoomFactor:](self, "setInitialZoomFactor:", v7);
  if (!-[BKPDFModernBookViewController isScrolling](self, "isScrolling"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
    objc_msgSend(v8, "setMinScaleFactor:", v7);

    if (v3)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
      objc_msgSend(v9, "scaleFactor");
      v11 = v10;

      if (v11 != v7)
      {
        v12 = (id)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
        objc_msgSend(v12, "setScaleFactor:", v7);

      }
    }
  }
}

- (void)updateContentScale
{
  -[BKPDFModernBookViewController handleContentScaling:](self, "handleContentScaling:", -[BKPDFModernBookViewController prepareForContentScaling](self, "prepareForContentScaling"));
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  unsigned int v4;
  double v5;
  _BOOL8 v6;
  objc_super v7;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfScrollView](self, "pdfScrollView"));
  v4 = objc_msgSend(v3, "isZooming");

  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)BKPDFModernBookViewController;
    -[BKThumbnailBookViewController viewWillLayoutSubviews](&v8, "viewWillLayoutSubviews");
  }
  else
  {
    -[BKPDFModernBookViewController initialZoomFactor](self, "initialZoomFactor");
    v6 = v5 < 0.0 && (char *)-[BKBookViewController layout](self, "layout") == (char *)&dword_0 + 2
      || -[BKPDFModernBookViewController prepareForContentScaling](self, "prepareForContentScaling");
    v7.receiver = self;
    v7.super_class = (Class)BKPDFModernBookViewController;
    -[BKThumbnailBookViewController viewWillLayoutSubviews](&v7, "viewWillLayoutSubviews");
    -[BKPDFModernBookViewController handleContentScaling:](self, "handleContentScaling:", v6);
  }
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKPDFModernBookViewController;
  -[BKThumbnailBookViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  -[BKPDFModernBookViewController contentViewReady](self, "contentViewReady");
}

- (void)viewDidLoad
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
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
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  objc_super v26;
  NSAttributedStringKey v27;
  void *v28;

  v26.receiver = self;
  v26.super_class = (Class)BKPDFModernBookViewController;
  -[BKThumbnailBookViewController viewDidLoad](&v26, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  v4 = objc_opt_respondsToSelector(v3, "setShowsScrollIndicators:");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
    objc_msgSend(v5, "setShowsScrollIndicators:", 0);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController topToolbar](self, "topToolbar"));
  objc_msgSend(v7, "setBarTintColor:", v6);

  v27 = NSForegroundColorAttributeName;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksLabelColor](UIColor, "bc_booksLabelColor"));
  v28 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController topToolbar](self, "topToolbar"));
  objc_msgSend(v10, "setTitleTextAttributes:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksLabelColor](UIColor, "bc_booksLabelColor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController topToolbar](self, "topToolbar"));
  objc_msgSend(v12, "setTintColor:", v11);

  -[BKPDFModernBookViewController updateLayout](self, "updateLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "visiblePageDidChange:", PDFViewPageChangedNotification, v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  objc_msgSend(v15, "addObserver:selector:name:object:", self, "scrollerViewPageDidChange:", PDFViewVisiblePagesChangedNotification, v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v18 = PDFViewAnnotationsDidChangeNotification;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  objc_msgSend(v17, "addObserver:selector:name:object:", self, "annotationsDidChange:", v18, v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v21 = PDFTextSelectionMenuWillChangeScrollPosition;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  objc_msgSend(v20, "addObserver:selector:name:object:", self, "beginScroll:", v21, v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v24 = PDFTextSelectionMenuDidChangeScrollPosition;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  objc_msgSend(v23, "addObserver:selector:name:object:", self, "endScroll:", v24, v25);

  -[BKPDFModernBookViewController setIgnoreKeyboardInteraction:](self, "setIgnoreKeyboardInteraction:", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKPDFModernBookViewController;
  -[BKBookViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[BKPDFModernBookViewController updateContentInsets](self, "updateContentInsets");
}

- (void)resetPDFDocument
{
  UIView *akToolbarView;
  NSUndoManager *pdfUndoManager;
  PDFDocument *pdfDocument;

  -[PDFView setDocument:](self->_pdfView, "setDocument:", 0);
  -[UIView removeFromSuperview](self->_akToolbarView, "removeFromSuperview");
  akToolbarView = self->_akToolbarView;
  self->_akToolbarView = 0;

  pdfUndoManager = self->_pdfUndoManager;
  self->_pdfUndoManager = 0;

  -[PDFDocument setPDFAKControllerDelegate:](self->_pdfDocument, "setPDFAKControllerDelegate:", 0);
  pdfDocument = self->_pdfDocument;
  self->_pdfDocument = 0;

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKPDFModernBookViewController;
  -[BKBookViewController viewDidDisappear:](&v7, "viewDidDisappear:", a3);
  if (-[BKPDFModernBookViewController stateShouldClose](self, "stateShouldClose"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[BCProgressKitController sharedController](BCProgressKitController, "sharedController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController asset](self, "asset"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "assetID"));
    objc_msgSend(v4, "didCloseBookWithAssetID:completion:", v6, 0);

    -[BKPDFModernBookViewController resetPDFDocument](self, "resetPDFDocument");
    -[BKPDFModernBookViewController setStateShouldClose:](self, "setStateShouldClose:", 0);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9[2];
  id location;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BKPDFModernBookViewController;
  -[BKPDFModernBookViewController viewWillAppear:](&v11, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentPage"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfDocument](self, "pdfDocument"));
  v7 = objc_msgSend(v6, "indexForPage:", v5);

  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_DECA8;
  v8[3] = &unk_1C1A88;
  objc_copyWeak(v9, &location);
  v8[4] = self;
  v9[1] = v7;
  -[BKPDFModernBookViewController reloadPDFDocumentCompletion:](self, "reloadPDFDocumentCompletion:", v8);
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);

}

- (void)open:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));

  if (v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));
    objc_msgSend(v6, "assetViewController:willOpen:", self, v3);

  }
}

- (void)openToLocation:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  BKPageLocation *v14;
  id v15;

  v4 = a4;
  v15 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));
    objc_msgSend(v7, "assetViewController:willOpen:", self, v4);

    objc_opt_class(BKAnchorPathLocation);
    v9 = BUDynamicCast(v8, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "anchor"));
    v12 = -[BKPDFModernBookViewController _pageNumberForAnchor:](self, "_pageNumberForAnchor:", v11);

    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));

      if (v13)
      {
        -[BKPDFModernBookViewController turnToPageNumber:animated:](self, "turnToPageNumber:animated:", v12, 0);
      }
      else
      {
        v14 = -[BKPageLocation initWithOrdinal:andOffset:]([BKPageLocation alloc], "initWithOrdinal:andOffset:", 0, +[BKPDFModernBookViewController pageIndexForPageNumber:](BKPDFModernBookViewController, "pageIndexForPageNumber:", v12));
        -[BKBookViewController setLocation:](self, "setLocation:", v14);

      }
    }

  }
}

- (void)close:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));
  objc_msgSend(v5, "assetViewController:willClose:", self, v3);

  -[BKPDFModernBookViewController setStateShouldClose:](self, "setStateShouldClose:", 1);
}

- (unint64_t)_pageNumberForAnchor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4));

  if (objc_msgSend(v5, "hasPrefix:", CFSTR("page("))
    && objc_msgSend(v5, "hasSuffix:", CFSTR(")")))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringWithRange:", 5, (char *)objc_msgSend(v5, "length") - 6));
    v7 = (unint64_t)objc_msgSend(v6, "integerValue");

  }
  else
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (void)contentViewReady
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentOpenAnimator](self, "contentOpenAnimator"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentOpenAnimator](self, "contentOpenAnimator"));
    objc_msgSend(v4, "bookContentDidLoad");

    -[BKBookViewController setContentOpenAnimator:](self, "setContentOpenAnimator:", 0);
    v5 = -[BKPDFModernBookViewController assetReloading](self, "assetReloading")
      || UIAccessibilityIsVoiceOverRunning()
      || UIAccessibilityIsSwitchControlRunning();
    -[BKBookViewController setControlsVisible:animated:](self, "setControlsVisible:animated:", v5, 0);
  }
}

- (void)loadView
{
  void *v3;
  void *v4;
  id v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double left;
  double bottom;
  double right;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;
  UIPageViewControllerOptionsKey v32;
  _UNKNOWN **v33;

  v31.receiver = self;
  v31.super_class = (Class)BKPDFModernBookViewController;
  -[BKPDFModernBookViewController loadView](&v31, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfDocument](self, "pdfDocument"));
  objc_msgSend(v3, "setShowsAnnotations:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController view](self, "view"));
  v5 = objc_alloc((Class)PDFView);
  objc_msgSend(v4, "bounds");
  v6 = objc_msgSend(v5, "initWithFrame:");
  -[BKPDFModernBookViewController setPdfView:](self, "setPdfView:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  objc_msgSend(v7, "setAutoresizingMask:", 18);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  objc_msgSend(v9, "setDelegate:", self);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  objc_msgSend(v10, "setAutoScales:", 1);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  objc_msgSend(v11, "setMaxScaleFactor:", 32.0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  objc_msgSend(v12, "setDisplaysBookmarksForPages:", 1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  objc_msgSend(v13, "setDisplayDirection:", 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  v32 = UIPageViewControllerOptionInterPageSpacingKey;
  v33 = &off_1CD6E8;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
  objc_msgSend(v14, "usePageViewController:withViewOptions:", 1, v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "documentViewController"));
  -[BKPDFModernBookViewController addChildViewController:](self, "addChildViewController:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  objc_msgSend(v4, "addSubview:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "documentViewController"));
  objc_msgSend(v20, "didMoveToParentViewController:", self);

  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  objc_msgSend(v24, "setPageBreakMargins:", UIEdgeInsetsZero.top, left, bottom, right);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfDocument](self, "pdfDocument"));
  objc_msgSend(v25, "setDocument:", v26);

  -[BKPDFModernBookViewController _setupGestureRecognizers](self, "_setupGestureRecognizers");
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  objc_msgSend(v27, "setDisplaysRTL:", objc_msgSend(v28, "writingDirection") == (char *)&dword_0 + 1);

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[IMTheme themeWithIdentifier:](IMTheme, "themeWithIdentifier:", kIMThemeIdentifierDynamicTheme));
  -[BKBookViewController setTheme:](self, "setTheme:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  objc_msgSend(v30, "setAkAnnotationEditingEnabled:", 0);

  -[BKPDFModernBookViewController loadAKToolbarView](self, "loadAKToolbarView");
}

- (BOOL)isPageProgressionRTL
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  v3 = objc_msgSend(v2, "displaysRTL");

  return v3;
}

- (void)setLayout:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKPDFModernBookViewController;
  -[BKThumbnailBookViewController setLayout:](&v4, "setLayout:", a3);
  -[BKPDFModernBookViewController updateLayout](self, "updateLayout");
}

- (void)updateLayout
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
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
  double left;
  double bottom;
  double right;
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
  UIPageViewControllerOptionsKey v32;
  _UNKNOWN **v33;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentPage"));

  v5 = -[BKBookViewController layout](self, "layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  v7 = v6;
  if (v5 == 2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "documentViewController"));
    objc_msgSend(v8, "willMoveToParentViewController:", 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "documentViewController"));
    objc_msgSend(v10, "removeFromParentViewController");

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
    objc_msgSend(v11, "usePageViewController:withViewOptions:", 0, 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
    objc_msgSend(v12, "setDisplayDirection:", 0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
    objc_msgSend(v13, "setDisplayMode:", 1);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfScrollView](self, "pdfScrollView"));
    objc_msgSend(v14, "setContentInsetAdjustmentBehavior:", 2);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
    objc_msgSend(v15, "setAutoScales:", 1);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
    objc_msgSend(v16, "setPageBreakMargins:", 4.75, 4.0, 4.75, 4.0);
  }
  else
  {
    v32 = UIPageViewControllerOptionInterPageSpacingKey;
    v33 = &off_1CD6E8;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
    objc_msgSend(v7, "usePageViewController:withViewOptions:", 1, v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
    objc_msgSend(v18, "setDisplayDirection:", 1);

    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
    objc_msgSend(v22, "setPageBreakMargins:", UIEdgeInsetsZero.top, left, bottom, right);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "documentViewController"));
    -[BKPDFModernBookViewController addChildViewController:](self, "addChildViewController:", v24);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "documentViewController"));
    objc_msgSend(v25, "didMoveToParentViewController:", self);

  }
  -[BKPDFModernBookViewController updateContentInsets](self, "updateContentInsets");
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  objc_msgSend(v26, "layoutDocumentView");

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController controlsTapRecognizer](self, "controlsTapRecognizer"));
  objc_msgSend(v27, "removeGestureRecognizer:", v28);

  -[BKPDFModernBookViewController _setupGestureRecognizers](self, "_setupGestureRecognizers");
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  objc_msgSend(v29, "goToPage:", v4);

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  objc_msgSend(v31, "setBackgroundColor:", v30);

}

- (void)setScrollMode:(id)a3
{
  uint64_t v4;

  if ((char *)-[BKBookViewController layout](self, "layout", a3) == (char *)&dword_0 + 1)
    v4 = 2;
  else
    v4 = 1;
  -[BKPDFModernBookViewController setLayout:](self, "setLayout:", v4);
}

- (void)_setupGestureRecognizers
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
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

  v3 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "handleSingleTap:");
  -[BKPDFModernBookViewController setControlsTapRecognizer:](self, "setControlsTapRecognizer:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController controlsTapRecognizer](self, "controlsTapRecognizer"));
  objc_msgSend(v4, "setNumberOfTapsRequired:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController controlsTapRecognizer](self, "controlsTapRecognizer"));
  objc_msgSend(v5, "setDelegate:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController controlsTapRecognizer](self, "controlsTapRecognizer"));
  objc_msgSend(v6, "addGestureRecognizer:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "longPressGestureRecognizer"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tapGestureRecognizer"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "doubleTapGestureRecognizer"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController controlsTapRecognizer](self, "controlsTapRecognizer"));
  objc_msgSend(v13, "requireGestureRecognizerToFail:", v10);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController controlsTapRecognizer](self, "controlsTapRecognizer"));
  objc_msgSend(v14, "requireGestureRecognizerToFail:", v16);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController controlsTapRecognizer](self, "controlsTapRecognizer"));
  objc_msgSend(v15, "requireGestureRecognizerToFail:", v12);

}

- (int64_t)readerType
{
  return 4;
}

- (unint64_t)appearanceStyleForSnapshot
{
  return 0;
}

- (id)appearanceIdentifierForSnapshot
{
  return &stru_1C3088;
}

- (id)asset
{
  return self->super.super._book;
}

- (int64_t)pageCountIncludingUpsell
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfDocument](self, "pdfDocument"));
  v3 = objc_msgSend(v2, "pageCount");

  return (int64_t)v3;
}

- (id)actionController
{
  void *v3;
  unsigned __int8 v4;
  BKPDFActionController *v5;
  BKActionController *actionController;
  BKPDFActionController *v7;
  void *v8;

  if (!self->super.super._actionController)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    if (objc_msgSend(v3, "isManagedBook"))
    {
      v4 = +[AEAnnotationSerializationManager managedBooksAllowedToSync](AEAnnotationSerializationManager, "managedBooksAllowedToSync");

      if ((v4 & 1) == 0)
        return self->super.super._actionController;
    }
    else
    {

    }
    v5 = objc_opt_new(BKPDFActionController);
    actionController = self->super.super._actionController;
    self->super.super._actionController = &v5->super;
    v7 = v5;

    -[BKActionController setAncestorViewController:](self->super.super._actionController, "setAncestorViewController:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    -[BKActionController setBookInfo:](self->super.super._actionController, "setBookInfo:", v8);

    -[BKActionController setDelegate:](self->super.super._actionController, "setDelegate:", self);
  }
  return self->super.super._actionController;
}

- (void)disableEditingAndSaveIfNecessary
{
  if (-[BKPDFModernBookViewController assetEditingEnabled](self, "assetEditingEnabled"))
  {
    -[BKPDFModernBookViewController _enableMarkupMode:](self, "_enableMarkupMode:", 0);
  }
  else if (-[BKPDFModernBookViewController _needToSaveChanges](self, "_needToSaveChanges"))
  {
    -[BKPDFModernBookViewController saveStateClosing:](self, "saveStateClosing:", 0);
  }
}

- (void)actionControllerWillShow:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKPDFModernBookViewController;
  -[BKBookViewController actionControllerWillShow:](&v4, "actionControllerWillShow:", a3);
  -[BKPDFModernBookViewController disableEditingAndSaveIfNecessary](self, "disableEditingAndSaveIfNecessary");
}

- (void)setSection:(int)a3 animated:(BOOL)a4 adjustScrollToReveal:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  uint64_t v7;
  objc_super v9;

  v5 = a5;
  v6 = a4;
  v7 = *(_QWORD *)&a3;
  if (a3 == 1 && -[BKPDFModernBookViewController assetEditingEnabled](self, "assetEditingEnabled"))
    -[BKPDFModernBookViewController _enableMarkupMode:](self, "_enableMarkupMode:", 0);
  v9.receiver = self;
  v9.super_class = (Class)BKPDFModernBookViewController;
  -[BKThumbnailBookViewController setSection:animated:adjustScrollToReveal:](&v9, "setSection:animated:adjustScrollToReveal:", v7, v6, v5);
}

- (BOOL)wantsBottomToolbar
{
  return !-[BKPDFModernBookViewController assetEditingEnabled](self, "assetEditingEnabled");
}

- (void)updateBottomToolbar:(BOOL)a3
{
  double v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKPDFModernBookViewController;
  -[BKThumbnailBookViewController updateBottomToolbar:](&v6, "updateBottomToolbar:", a3);
  v4 = 0.0;
  if (-[BKPDFModernBookViewController assetEditingEnabled](self, "assetEditingEnabled"))
    v4 = (double)-[BKBookViewController controlsVisible](self, "controlsVisible");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController akToolbarView](self, "akToolbarView"));
  objc_msgSend(v5, "setAlpha:", v4);

}

- (BOOL)canDismissControls
{
  return !-[BKPDFModernBookViewController assetEditingEnabled](self, "assetEditingEnabled");
}

- (BOOL)supportsDocumentEditing
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController akToolbarView](self, "akToolbarView"));
  if (v3)
    v4 = -[BKPDFModernBookViewController canBeEdited](self, "canBeEdited");
  else
    v4 = 0;

  return v4;
}

- (BOOL)supportsDocumentEditingUndo
{
  return 1;
}

- (BOOL)supportsDocumentEditingUndoAll
{
  return 1;
}

- (BOOL)canBeEdited
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfDocument](self, "pdfDocument"));
  v3 = objc_msgSend(v2, "allowsDocumentChanges");

  return v3;
}

- (BOOL)shouldShowUndoControls
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[BKPDFModernBookViewController assetEditingEnabled](self, "assetEditingEnabled");
  if ((_DWORD)v3)
  {
    if ((isPhone(v3, v4) & 1) != 0)
      LOBYTE(v3) = 1;
    else
      LOBYTE(v3) = -[BKPDFModernBookViewController im_isCompactWidth](self, "im_isCompactWidth");
  }
  return v3;
}

- (BOOL)shouldShowBrightnessControl
{
  return 0;
}

- (id)_editToolboxBarButtonItem
{
  UIBarButtonItem *editToolboxBarButtonItem;
  AEMarkupBarButtonItem *v4;
  UIBarButtonItem *v5;

  editToolboxBarButtonItem = self->super._editToolboxBarButtonItem;
  if (!editToolboxBarButtonItem)
  {
    v4 = objc_alloc_init(AEMarkupBarButtonItem);
    -[AEMarkupBarButtonItem setAction:](v4, "setAction:", "toggleEditAssetMode:");
    -[AEMarkupBarButtonItem setTarget:](v4, "setTarget:", self);
    -[AEMarkupBarButtonItem setSelected:](v4, "setSelected:", -[BKPDFModernBookViewController assetEditingEnabled](self, "assetEditingEnabled"));
    v5 = self->super._editToolboxBarButtonItem;
    self->super._editToolboxBarButtonItem = &v4->super;

    editToolboxBarButtonItem = self->super._editToolboxBarButtonItem;
  }
  return editToolboxBarButtonItem;
}

- (id)editUndoBarButtonItem
{
  UIBarButtonItem *editUndoBarButtonItem;
  void *v4;
  void *v5;
  id v6;
  UIBarButtonItem *v7;
  UIBarButtonItem *v8;
  void *v9;
  objc_super v11;

  editUndoBarButtonItem = self->super._editUndoBarButtonItem;
  if (!editUndoBarButtonItem)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "akUndoToolbarItem"));

    v11.receiver = self;
    v11.super_class = (Class)BKPDFModernBookViewController;
    v6 = -[BKThumbnailBookViewController editUndoBarButtonItem](&v11, "editUndoBarButtonItem");
    v7 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue(v6);
    v8 = self->super._editUndoBarButtonItem;
    self->super._editUndoBarButtonItem = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "target"));
    -[UIBarButtonItem setTarget:](self->super._editUndoBarButtonItem, "setTarget:", v9);

    -[UIBarButtonItem setAction:](self->super._editUndoBarButtonItem, "setAction:", objc_msgSend(v5, "action"));
    -[UIBarButtonItem setWidth:](self->super._editUndoBarButtonItem, "setWidth:", 46.0);

    editUndoBarButtonItem = self->super._editUndoBarButtonItem;
  }
  return editUndoBarButtonItem;
}

- (id)editRedoBarButtonItem
{
  UIBarButtonItem *editRedoBarButtonItem;
  void *v4;
  void *v5;
  id v6;
  UIBarButtonItem *v7;
  UIBarButtonItem *v8;
  void *v9;
  objc_super v11;

  editRedoBarButtonItem = self->super._editRedoBarButtonItem;
  if (!editRedoBarButtonItem)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "akRedoToolbarItem"));

    v11.receiver = self;
    v11.super_class = (Class)BKPDFModernBookViewController;
    v6 = -[BKThumbnailBookViewController editRedoBarButtonItem](&v11, "editRedoBarButtonItem");
    v7 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue(v6);
    v8 = self->super._editRedoBarButtonItem;
    self->super._editRedoBarButtonItem = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "target"));
    -[UIBarButtonItem setTarget:](self->super._editRedoBarButtonItem, "setTarget:", v9);

    -[UIBarButtonItem setAction:](self->super._editRedoBarButtonItem, "setAction:", objc_msgSend(v5, "action"));
    -[UIBarButtonItem setWidth:](self->super._editRedoBarButtonItem, "setWidth:", 46.0);

    editRedoBarButtonItem = self->super._editRedoBarButtonItem;
  }
  return editRedoBarButtonItem;
}

- (void)_evaluateUndoRedoEnabled
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "akUndoToolbarItem"));
  v5 = objc_msgSend(v4, "isEnabled");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController editUndoBarButtonItem](self, "editUndoBarButtonItem"));
  objc_msgSend(v6, "setEnabled:", v5);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "akRedoToolbarItem"));
  v8 = objc_msgSend(v7, "isEnabled");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController editRedoBarButtonItem](self, "editRedoBarButtonItem"));
  objc_msgSend(v9, "setEnabled:", v8);

}

- (id)bookContentView
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pageViewForPageAtIndex:", -[BKPDFModernBookViewController currentPageIndex](self, "currentPageIndex")));

  return v4;
}

- (id)_bookContentViewImageOfPage:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController view](self, "view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));
    objc_msgSend(v8, "bounds");
    v10 = v9;
    v12 = v11;

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v7, "bounds");
    v10 = v13;
    v12 = v14;
  }

  return -[BKPDFModernBookViewController _bookContentViewImageOfPage:boundingSize:](self, "_bookContentViewImageOfPage:boundingSize:", a3, v10, v12);
}

- (id)_bookContentViewImageOfPage:(unint64_t)a3 boundingSize:(CGSize)a4
{
  double height;
  double width;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  double v27;
  void *v28;
  _QWORD v30[3];
  _QWORD v31[3];

  height = a4.height;
  width = a4.width;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfDocument](self, "pdfDocument"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pageAtIndex:", a3));

  if (v8)
  {
    objc_msgSend(v8, "boundsForBox:", 1);
    v11 = CGSizeScaledToFitInSize(v9, v10, width, height);
    v12 = BKImageSizeForScreenSize(v11);
    v14 = v13;
    objc_opt_class(UIImage);
    v16 = v15;
    v17 = CGSizeRound(v12, v14);
    v19 = v18;
    v30[0] = PDFPageImageProperty_DrawBookmark;
    v30[1] = PDFPageImageProperty_DrawAnnotations;
    v31[0] = &__kCFBooleanFalse;
    v31[1] = &__kCFBooleanFalse;
    v30[2] = PDFPageImageProperty_WithRotation;
    v31[2] = &__kCFBooleanTrue;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 3));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageOfSize:forBox:withOptions:", 1, v20, v17, v19));
    v22 = BUDynamicCast(v16, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

    v24 = objc_retainAutorelease(v23);
    v25 = objc_msgSend(v24, "CGImage");
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v26, "scale");
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v25, objc_msgSend(v24, "imageOrientation"), v27));

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (void)bookContentViewImage:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController _bookContentViewImageOfPage:](self, "_bookContentViewImageOfPage:", -[BKPDFModernBookViewController currentPageIndex](self, "currentPageIndex")));
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

- (void)makeContentVisible
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKPDFModernBookViewController;
  -[BKThumbnailBookViewController makeContentVisible](&v3, "makeContentVisible");
  -[BKThumbnailBookViewController assetViewControllerUpdateToolbars](self, "assetViewControllerUpdateToolbars");
  -[BKBookViewController setControlsVisible:animated:](self, "setControlsVisible:animated:", 1, 1);
}

- (void)_updateToolbarVisibilityAnimated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[UIBarButtonItem setSelected:](self->super._editToolboxBarButtonItem, "setSelected:", -[BKPDFModernBookViewController assetEditingEnabled](self, "assetEditingEnabled"));
  -[BKThumbnailBookViewController updateTopToolbar:](self, "updateTopToolbar:", v3);
  -[BKPDFModernBookViewController updateBottomToolbar:](self, "updateBottomToolbar:", v3);
}

- (void)updateHUDVisibilityAnimated:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKPDFModernBookViewController;
  -[BKThumbnailBookViewController updateHUDVisibilityAnimated:](&v4, "updateHUDVisibilityAnimated:", a3);
  -[BKPDFModernBookViewController updateContentScale](self, "updateContentScale");
}

- (BOOL)shouldShowHUDs
{
  objc_super v4;

  if (-[BKPDFModernBookViewController assetEditingEnabled](self, "assetEditingEnabled"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)BKPDFModernBookViewController;
  return -[BKThumbnailBookViewController shouldShowHUDs](&v4, "shouldShowHUDs");
}

- (void)setDefaultMarkupTool
{
  void *v2;
  UIButton *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfDocument](self, "pdfDocument"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "akController"));

  v3 = objc_opt_new(UIButton);
  -[UIButton setTag:](v3, "setTag:", 764017);
  objc_msgSend(v4, "performActionForSender:", v3);

}

- (void)dismissCurrentPopoverWithCompletion:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a4;
  v6 = a3;
  if (-[BKPDFModernBookViewController assetEditingEnabled](self, "assetEditingEnabled"))
    -[BKPDFModernBookViewController _enableMarkupMode:](self, "_enableMarkupMode:", 0);
  v7.receiver = self;
  v7.super_class = (Class)BKPDFModernBookViewController;
  -[BKBookViewController dismissCurrentPopoverWithCompletion:animated:](&v7, "dismissCurrentPopoverWithCompletion:animated:", v6, v4);

}

- (void)_enableMarkupMode:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  uint64_t v6;
  id v7;

  v3 = a3;
  if (-[BKPDFModernBookViewController canBeEdited](self, "canBeEdited"))
  {
    if (-[BKPDFModernBookViewController assetEditingEnabled](self, "assetEditingEnabled") != v3)
    {
      v5 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
      -[BKPDFModernBookViewController setAssetEditingEnabled:](self, "setAssetEditingEnabled:", v3);
      if (v3)
        -[BKPDFModernBookViewController setDefaultMarkupTool](self, "setDefaultMarkupTool");
      -[BKPDFModernBookViewController _updateToolbarVisibilityAnimated:](self, "_updateToolbarVisibilityAnimated:", v5);
      -[BKPDFModernBookViewController updateHUDVisibilityAnimated:](self, "updateHUDVisibilityAnimated:", v5);
      if (!-[BKPDFModernBookViewController assetEditingEnabled](self, "assetEditingEnabled")
        && -[BKPDFModernBookViewController _needToSaveChanges](self, "_needToSaveChanges"))
      {
        -[BKPDFModernBookViewController saveStateClosing:](self, "saveStateClosing:", 0);
      }
      if (v3)
        -[BKBookViewController setControlsVisible:animated:](self, "setControlsVisible:animated:", 1, 1);
    }
    v6 = -[BKPDFModernBookViewController assetEditingEnabled](self, "assetEditingEnabled") ^ 1;
    v7 = (id)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController controlsTapRecognizer](self, "controlsTapRecognizer"));
    objc_msgSend(v7, "setEnabled:", v6);

  }
}

- (void)scalePDFContent:(double)a3 animated:(BOOL)a4
{
  -[BKPDFModernBookViewController scalePDFContent:locationInView:animated:](self, "scalePDFContent:locationInView:animated:", a4, a3, CGPointZero.x, CGPointZero.y);
}

- (void)scalePDFContent:(double)a3 locationInView:(CGPoint)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  CGFloat y;
  CGFloat x;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  _QWORD *v16;
  void *v17;
  double v18;
  double v19;
  _QWORD v20[8];

  v5 = a5;
  y = a4.y;
  x = a4.x;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  objc_msgSend(v10, "minScaleFactor");
  v12 = v11;

  if (v12 <= a3)
    v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  objc_msgSend(v13, "maxScaleFactor");
  v15 = v14;

  if (v12 < v15)
    v15 = v12;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_E0830;
  v20[3] = &unk_1C1AB0;
  *(CGFloat *)&v20[5] = x;
  *(CGFloat *)&v20[6] = y;
  v20[4] = self;
  *(double *)&v20[7] = v15;
  v16 = objc_retainBlock(v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  objc_msgSend(v17, "scaleFactor");
  v19 = v18;

  if (v19 != v15)
  {
    if (v5)
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v16, 0.2);
    else
      ((void (*)(_QWORD *))v16[2])(v16);
  }

}

- (void)handleSingleTap:(id)a3
{
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  unsigned int v18;
  uint64_t v19;
  id v20;
  CGRect v21;

  v20 = a3;
  if (!-[BKPDFModernBookViewController assetEditingRequested](self, "assetEditingRequested"))
  {
    if (-[BKPDFModernBookViewController assetEditingEnabled](self, "assetEditingEnabled")
      || (char *)-[BKBookViewController layout](self, "layout") != (char *)&dword_0 + 1)
    {
      goto LABEL_10;
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController view](self, "view"));
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController controlsTapRecognizer](self, "controlsTapRecognizer"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
    objc_msgSend(v13, "locationInView:", v14);
    v16 = v15;

    v21.origin.x = v6;
    v21.origin.y = v8;
    v21.size.width = v10;
    v21.size.height = v12;
    v17 = CGRectGetWidth(v21) * 0.2;
    v18 = -[BKPDFModernBookViewController isPageProgressionRTL](self, "isPageProgressionRTL");
    if (v16 <= v17)
      v19 = v18 ^ 1;
    else
      v19 = v16 >= v10 - v17 ? v18 : -1;
    if (!-[BKPDFModernBookViewController turnPageInDirection:](self, "turnPageInDirection:", v19))
LABEL_10:
      -[BKThumbnailBookViewController toggleControls:](self, "toggleControls:", v20);
  }

}

- (void)toggleEditAssetMode:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKPDFModernBookViewController;
  v4 = -[BKThumbnailBookViewController toggleEditAssetMode:](&v7, "toggleEditAssetMode:", a3);
  v5 = BKModernPDFLog(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_11D3BC();

  -[BKPDFModernBookViewController _enableMarkupMode:](self, "_enableMarkupMode:", -[BKPDFModernBookViewController assetEditingRequested](self, "assetEditingRequested") ^ 1);
}

- (void)setAssetEditingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v5 = BKModernPDFLog(self);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_11D3F4(v3, v6, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  objc_msgSend(v8, "setAkAnnotationEditingEnabled:", v3);

  -[BKPDFModernBookViewController setAssetEditingRequested:](self, "setAssetEditingRequested:", v3);
  if (!v3)
    -[BKPDFModernBookViewController becomeFirstResponder](self, "becomeFirstResponder");
}

- (BOOL)assetEditingEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  v3 = objc_msgSend(v2, "akAnnotationEditingEnabled");

  return v3;
}

- (BOOL)_needToSaveChanges
{
  os_unfair_lock_s *p_accessLock;
  _QWORD *v4;
  uint64_t v5;
  NSObject *writeQueue;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  char v10;
  _QWORD v12[6];
  _QWORD v13[2];
  id (*v14)(uint64_t);
  void *v15;
  BKPDFModernBookViewController *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  _QWORD v23[2];
  char v24;

  v22 = 0;
  v23[0] = &v22;
  v23[1] = 0x2020000000;
  v24 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  p_accessLock = &self->_accessLock;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v14 = sub_E0CB0;
  v15 = &unk_1C1AD8;
  v16 = self;
  v17 = &v18;
  v4 = v13;
  os_unfair_lock_lock(p_accessLock);
  v14((uint64_t)v4);
  os_unfair_lock_unlock(p_accessLock);

  if (!*((_BYTE *)v19 + 24))
  {
    writeQueue = self->_writeQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_E0CE0;
    v12[3] = &unk_1C1AD8;
    v12[4] = self;
    v12[5] = &v22;
    dispatch_sync(writeQueue, v12);
  }
  v7 = BKModernPDFLog(v5);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_11D478((uint64_t)v23, v8, v9);

  v10 = *(_BYTE *)(v23[0] + 24);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  return v10;
}

- (void)saveStateClosing:(BOOL)a3
{
  -[BKPDFModernBookViewController saveStateClosing:suspending:](self, "saveStateClosing:suspending:", a3, 0);
}

- (void)saveStateClosing:(BOOL)a3 suspending:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  os_unfair_lock_s *p_accessLock;
  void *v8;
  NSObject *writeQueue;
  id v10;
  _QWORD block[4];
  id v12;
  BKPDFModernBookViewController *v13;
  objc_super v14;
  _QWORD v15[5];

  v4 = a4;
  v5 = a3;
  p_accessLock = &self->_accessLock;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_E0E88;
  v15[3] = &unk_1BEA38;
  v15[4] = self;
  os_unfair_lock_lock(&self->_accessLock);
  sub_E0E88((uint64_t)v15);
  os_unfair_lock_unlock(p_accessLock);
  -[BKThumbnailBookViewController didChangeLocationClosing:suspending:](self, "didChangeLocationClosing:suspending:", v5, v4);
  v14.receiver = self;
  v14.super_class = (Class)BKPDFModernBookViewController;
  -[BKBookViewController saveStateClosing:suspending:](&v14, "saveStateClosing:suspending:", v5, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfDocument](self, "pdfDocument"));
  writeQueue = self->_writeQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_E0E94;
  block[3] = &unk_1BFDB8;
  v12 = v8;
  v13 = self;
  v10 = v8;
  dispatch_async(writeQueue, block);

}

- (BOOL)dismissShouldBegin:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  unsigned __int8 v8;

  v4 = a3;
  if (-[BKPDFModernBookViewController assetEditingEnabled](self, "assetEditingEnabled")
    || (objc_msgSend(v4, "velocity"), v6 = v5, objc_msgSend(v4, "velocity"), v6 >= v7))
  {
    v8 = 0;
  }
  else
  {
    v8 = objc_msgSend(v4, "proposedBeginState");
  }

  return v8;
}

- (double)_contentAspectRatio
{
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  objc_super v12;

  -[BKPDFModernBookViewController aspectRatioFromPDF](self, "aspectRatioFromPDF");
  if (v3 != 0.0)
    return v3;
  v12.receiver = self;
  v12.super_class = (Class)BKPDFModernBookViewController;
  -[BKThumbnailBookViewController _contentAspectRatio](&v12, "_contentAspectRatio");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfDocument](self, "pdfDocument"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pageAtIndex:", -[BKPDFModernBookViewController pageCountIncludingUpsell](self, "pageCountIncludingUpsell") > 1));
  v8 = v7;
  if (v7)
  {
    PDFPageGetBoxRectWithRotation(v7, 1);
    if (v10 > 0.0)
      v5 = v9 / v10;
  }
  -[BKPDFModernBookViewController setAspectRatioFromPDF:](self, "setAspectRatioFromPDF:", v5);

  return v5;
}

- (BOOL)canShowControlsDuringOpenClose
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKPDFModernBookViewController;
  if (-[BKThumbnailBookViewController canShowControlsDuringOpenClose](&v4, "canShowControlsDuringOpenClose"))
    return 1;
  else
    return -[BKPDFModernBookViewController assetReloading](self, "assetReloading");
}

- (id)existingContentViewControllerForPageNumber:(int64_t)a3
{
  return 0;
}

- (id)contentViewControllerForPageNumber:(int64_t)a3
{
  return 0;
}

- (id)contentViewControllerForLocation:(id)a3
{
  return 0;
}

- (void)clearSelection
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKPDFModernBookViewController;
  -[BKBookViewController clearSelection](&v4, "clearSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  objc_msgSend(v3, "clearSelection");

}

- (id)transitionContentView
{
  uint64_t v3;
  void *v4;
  void *v5;

  if (-[BKThumbnailBookViewController directoryTOCIsVisible](self, "directoryTOCIsVisible"))
    v3 = objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController directoryTOCViewControllerView](self, "directoryTOCViewControllerView"));
  else
    v3 = objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController bookContentView](self, "bookContentView"));
  v4 = (void *)v3;
  if (!v3)
  {
    -[BKPDFModernBookViewController reloadPDFDocument](self, "reloadPDFDocument");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pageViewForPageAtIndex:", -[BKPDFModernBookViewController currentPageIndex](self, "currentPageIndex")));

    if (!v4)
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController view](self, "view"));
  }
  return v4;
}

- (id)transitionContentHostingView
{
  void *v3;

  if (-[BKThumbnailBookViewController directoryTOCIsVisible](self, "directoryTOCIsVisible"))
    v3 = 0;
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  return v3;
}

- (BOOL)transitionContentViewIsShowingCover
{
  return -[BKPDFModernBookViewController currentPageIndex](self, "currentPageIndex") == 0;
}

- (id)transitionContentViewImage
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  if (-[BKThumbnailBookViewController directoryTOCIsVisible](self, "directoryTOCIsVisible"))
  {
    v3 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController transitionContentView](self, "transitionContentView"));
    objc_msgSend(v4, "bounds");
    objc_msgSend(v4, "convertRect:toView:", 0);
    v6 = v5;
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController view](self, "view"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window"));
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController view](self, "view"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "window"));
      objc_msgSend(v12, "bounds");
      v14 = v13;
      v16 = v15;

    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v11, "bounds");
      v14 = v17;
      v16 = v18;
    }

    v19 = CGSizeScaledToFitInSize(v6, v8, v14, v16);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController _bookContentViewImageOfPage:boundingSize:](self, "_bookContentViewImageOfPage:boundingSize:", -[BKPDFModernBookViewController currentPageIndex](self, "currentPageIndex"), v19, v20));

  }
  return v3;
}

- (unint64_t)upsellOrdinal
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController theme](self, "theme", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController searchViewControllerIfLoaded](self, "searchViewControllerIfLoaded"));
  objc_msgSend(v5, "setTheme:", v6);

}

- (BOOL)turnPages:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;

  v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
  objc_msgSend(v7, "postEvent:sender:", kBETestDriverPageTurnStart, self);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
  objc_msgSend(v8, "postEvent:sender:", kBETestDriverPageTurnSetupStart, self);

  -[BKPDFModernBookViewController turnToPageNumber:animated:](self, "turnToPageNumber:animated:", (char *)+[BKPDFModernBookViewController pageNumberForPageIndex:](BKPDFModernBookViewController, "pageNumberForPageIndex:", -[BKPDFModernBookViewController currentPageIndex](self, "currentPageIndex"))+ a3, v4);
  return 1;
}

- (void)turnToPageNumber:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  int64_t v6;

  v4 = a4;
  if (a3 < 1
    || (v6 = a3, -[BKPDFModernBookViewController pageCountIncludingUpsell](self, "pageCountIncludingUpsell") < a3))
  {
    v6 = 1;
  }
  -[BKPDFModernBookViewController scrollToPageNumber:animate:](self, "scrollToPageNumber:animate:", v6, -[BKPDFModernBookViewController isVisible](self, "isVisible") & v4);
}

- (id)searchViewController
{
  BKSearchViewController *searchViewController;
  id v4;
  void *v5;
  objc_super v7;

  searchViewController = self->super.super._searchViewController;
  if (!searchViewController)
  {
    v7.receiver = self;
    v7.super_class = (Class)BKPDFModernBookViewController;
    v4 = -[BKBookViewController searchViewController](&v7, "searchViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self->super.super._searchViewController, "searchController"));
    objc_msgSend(v5, "setPageCount:", -[BKPDFModernBookViewController pageCountIncludingUpsell](self, "pageCountIncludingUpsell"));

    searchViewController = self->super.super._searchViewController;
  }
  return searchViewController;
}

- (void)highlightSearchResult:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[BKPDFModernBookViewController initialZoomFactor](self, "initialZoomFactor");
  -[BKPDFModernBookViewController scalePDFContent:locationInView:animated:](self, "scalePDFContent:locationInView:animated:", 1);
  objc_opt_class(BKPDFSearchResult);
  v6 = BUDynamicCast(v5, v4);
  v11 = (id)objc_claimAutoreleasedReturnValue(v6);

  v7 = v11;
  if (v11)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "selection"));
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor yellowColor](UIColor, "yellowColor"));
      objc_msgSend(v8, "setColor:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
      objc_msgSend(v10, "setCurrentSelection:animate:", v8, 1);

    }
    v7 = v11;
  }

}

- (id)searchViewController:(id)a3 chapterNameForSearchResult:(id)a4 pageNumber:(int64_t)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;

  v7 = a3;
  v8 = a4;
  objc_opt_class(BKPDFSearchResult);
  v10 = BUDynamicCast(v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "selection"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfDocument](self, "pdfDocument"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "outlineItemForSelection:", v12));

    v15 = -3;
    do
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "parent"));

      if (!v16)
        break;
      if (!v15)
      {
        v16 = 0;
        break;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "label"));
      v18 = objc_msgSend(v17, "length");

      if (v18)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "label"));
      }
      else
      {
        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "parent"));

        v16 = 0;
        v14 = (void *)v19;
      }
      ++v15;
    }
    while (!v16);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (int64_t)searchViewController:(id)a3 pageNumberForDocumentOrdinal:(int64_t)a4
{
  return 1;
}

- (id)pageLocationForPageIndex:(unint64_t)a3
{
  unint64_t v3;

  if (a3 == -1)
    v3 = 0;
  else
    v3 = a3;
  return -[BKPageLocation initWithOrdinal:andOffset:]([BKPageLocation alloc], "initWithOrdinal:andOffset:", 0, v3);
}

- (id)pageLocationForPageNumber:(int64_t)a3
{
  return -[BKPDFModernBookViewController pageLocationForPageIndex:](self, "pageLocationForPageIndex:", +[BKPDFModernBookViewController pageIndexForPageNumber:](BKPDFModernBookViewController, "pageIndexForPageNumber:", a3));
}

- (int64_t)pageNumberFromRange:(_NSRange)a3
{
  int64_t v4;
  int64_t result;

  v4 = +[BKPDFModernBookViewController pageNumberForPageIndex:](BKPDFModernBookViewController, "pageNumberForPageIndex:", a3.location, a3.length);
  result = -[BKPDFModernBookViewController pageCountIncludingUpsell](self, "pageCountIncludingUpsell");
  if (v4 < result)
    return v4;
  return result;
}

- (void)_willScrollPDFViewToPageNumber:(int64_t)a3
{
  void *v4;
  id v5;

  -[BKPDFModernBookViewController setTargetPageNumber:](self, "setTargetPageNumber:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
  objc_msgSend(v4, "postEvent:sender:", kBETestDriverPageTurnSetupEnd, self);

  v5 = (id)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
  objc_msgSend(v5, "postEvent:sender:", kBETestDriverPageTurnAnimationStart, self);

}

- (void)_didScrollPDFViewToPage
{
  -[BKBookViewController setLocation:](self, "setLocation:", 0);
  -[BKBookViewController setResumeLocation:](self, "setResumeLocation:", 0);
}

- (void)scrollToPageNumber:(int64_t)a3 animate:(BOOL)a4
{
  _BOOL8 v4;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  int64_t v19;
  _BOOL8 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;

  v4 = a4;
  v7 = +[BKPDFModernBookViewController pageIndexForPageNumber:](BKPDFModernBookViewController, "pageIndexForPageNumber:");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentPage"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfDocument](self, "pdfDocument"));
    v11 = (uint64_t)objc_msgSend(v10, "indexForPage:", v9);

  }
  else
  {
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v12 = _AEBookPluginsLifeCycleLog();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    v25 = v11;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v11));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v26 = v9;
    v18 = v7;
    v19 = a3;
    v20 = v4;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "assetLogID"));
    *(_DWORD *)buf = 138544130;
    v28 = v14;
    v29 = 2114;
    v30 = v15;
    v31 = 2114;
    v32 = v16;
    v33 = 2114;
    v34 = v21;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Scroll to page number:%{public}@, currentIndex:%{public}@, targetIndex:%{public}@, culogID:%{public}@", buf, 0x2Au);

    v4 = v20;
    a3 = v19;
    v7 = v18;
    v9 = v26;

    v11 = v25;
  }

  if (v7 != v11)
  {
    -[BKPDFModernBookViewController _willScrollPDFViewToPageNumber:](self, "_willScrollPDFViewToPageNumber:", a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfDocument](self, "pdfDocument"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "pageAtIndex:", v7));

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
    objc_msgSend(v24, "goToPage:animated:", v23, v4);

    -[BKPDFModernBookViewController _didScrollPDFViewToPage](self, "_didScrollPDFViewToPage");
  }

}

- (id)currentPageLocation
{
  return -[BKPDFModernBookViewController pageLocationForPageNumber:](self, "pageLocationForPageNumber:", +[BKPDFModernBookViewController pageNumberForPageIndex:](BKPDFModernBookViewController, "pageNumberForPageIndex:", -[BKPDFModernBookViewController currentPageIndex](self, "currentPageIndex")));
}

- (unint64_t)currentPageIndex
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentPage"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfDocument](self, "pdfDocument"));
    v6 = objc_msgSend(v5, "indexForPage:", v4);
  }
  else
  {
    *(_QWORD *)&v7 = objc_opt_class(BKPageLocation).n128_u64[0];
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController location](self, "location", v7));
    v11 = BUDynamicCast(v9, v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v11);

    v6 = objc_msgSend(v5, "pageOffset");
  }
  v12 = (unint64_t)v6;

  return v12;
}

- (int64_t)directoryContent:(id)a3 pageNumberForLocation:(id)a4
{
  return -[BKPDFModernBookViewController pageNumberForLocation:](self, "pageNumberForLocation:", a4);
}

- (void)_scrollToRect:(CGRect)a3 inPageAtIndex:(int64_t)a4
{
  uint64_t v4;
  NSObject *v5;
  double y;
  double x;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = BKModernPDFLog(self);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_11D504();
  }
  else
  {
    y = a3.origin.y;
    x = a3.origin.x;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfDocument](self, "pdfDocument", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height));
    v11 = objc_msgSend(v10, "pageCount");

    if ((unint64_t)v11 > a4)
    {
      -[BKPDFModernBookViewController _willScrollPDFViewToPageNumber:](self, "_willScrollPDFViewToPageNumber:", +[BKPDFModernBookViewController pageNumberForPageIndex:](BKPDFModernBookViewController, "pageNumberForPageIndex:", a4));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
      objc_msgSend(v13, "constrainedScrollToPoint:", x, y);

      -[BKPDFModernBookViewController _didScrollPDFViewToPage](self, "_didScrollPDFViewToPage");
      return;
    }
    v14 = BKModernPDFLog(v12);
    v5 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_11D530();
  }

}

- (void)jumpToLocation:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[BKPDFModernBookViewController clearSelection](self, "clearSelection");
  if ((char *)-[BKBookViewController layout](self, "layout") == (char *)&dword_0 + 2)
    -[BKPDFModernBookViewController _jumpToLocationForVerticalScroll:animated:](self, "_jumpToLocationForVerticalScroll:animated:", v9, v5);
  else
    -[BKPDFModernBookViewController _jumpToLocationPaged:animated:](self, "_jumpToLocationPaged:animated:", v9, v5);

  v11 = objc_retainBlock(v8);
  v10 = v11;
  if (v11)
  {
    (*((void (**)(id))v11 + 2))(v11);
    v10 = v11;
  }

}

- (void)_jumpToLocationPaged:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  v4 = a4;
  v11 = a3;
  v6 = -[BKPDFModernBookViewController pageNumberForLocation:](self, "pageNumberForLocation:");
  if (v6 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    objc_opt_class(BKPageLocation);
    v8 = BUDynamicCast(v7, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = objc_msgSend(v9, "ordinal");
    v6 = (char *)objc_msgSend(v9, "pageOffset") + (_QWORD)v10 + 1;

  }
  -[BKPDFModernBookViewController scrollToPageNumber:animate:](self, "scrollToPageNumber:animate:", v6, v4);

}

- (void)_jumpToLocationForVerticalScroll:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  id v45;

  v4 = a4;
  v45 = a3;
  v6 = -[BKPDFModernBookViewController pageIndexForLocation:](self, "pageIndexForLocation:");
  if (v6 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    objc_opt_class(BKPageLocation);
    v8 = BUDynamicCast(v7, v45);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (char *)objc_msgSend(v9, "ordinal");
    v6 = &v10[(_QWORD)objc_msgSend(v9, "pageOffset")];

  }
  objc_opt_class(BKPDFLocation);
  v12 = BUDynamicCast(v11, v45);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if (v13)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "selection"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "pages"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController view](self, "view"));
    objc_msgSend(v18, "frame");
    v20 = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
    objc_msgSend(v15, "boundsForPage:", v17);
    objc_msgSend(v21, "convertRect:fromPage:", v17);
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "documentView"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
    objc_msgSend(v31, "convertRect:fromView:", v32, v23, v25 + (v20 - v29) * -0.5, v27, v20);
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v40 = v39;

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "documentView"));
    objc_msgSend(v42, "bounds");
    v44 = v43 - v36;

    -[BKPDFModernBookViewController _scrollToRect:inPageAtIndex:](self, "_scrollToRect:inPageAtIndex:", v6, v34, v44, v38, v40);
  }
  else
  {
    -[BKPDFModernBookViewController scrollToPageNumber:animate:](self, "scrollToPageNumber:animate:", +[BKPDFModernBookViewController pageNumberForPageIndex:](BKPDFModernBookViewController, "pageNumberForPageIndex:", v6), v4);
  }

}

- (int64_t)pageNumberForLocation:(id)a3
{
  return +[BKPDFModernBookViewController pageNumberForPageIndex:](BKPDFModernBookViewController, "pageNumberForPageIndex:", -[BKPDFModernBookViewController pageIndexForLocation:](self, "pageIndexForLocation:", a3));
}

- (unint64_t)pageIndexForLocation:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a3;
  objc_opt_class(BKPageLocation);
  v5 = BUDynamicCast(v4, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = objc_msgSend(v6, "pageOffset");
  return (unint64_t)v7;
}

- (_NSRange)currentPages
{
  unint64_t v3;
  int64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  _NSRange result;

  v3 = -[BKPDFModernBookViewController currentPageIndex](self, "currentPageIndex");
  v4 = -[BKPDFModernBookViewController pageCountIncludingUpsell](self, "pageCountIncludingUpsell");
  if (v3 >= v4 - 1)
    v5 = v4 - 1;
  else
    v5 = v3;
  v6 = 1;
  result.length = v6;
  result.location = v5;
  return result;
}

- (id)_currentReadingProgress
{
  uint64_t v3;
  _UNKNOWN **v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  double v8;

  v3 = -[BKPDFModernBookViewController pageCountIncludingUpsell](self, "pageCountIncludingUpsell");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 0;
  }
  else
  {
    v5 = v3;
    if (v3 < 1)
    {
      v4 = &off_1CD6F8;
    }
    else
    {
      v7 = -[BKPDFModernBookViewController currentPages](self, "currentPages");
      v4 = 0;
      if (v7 != (id)0x7FFFFFFFFFFFFFFFLL && v6)
      {
        *(float *)&v8 = (float)((uint64_t)v7 + v6) / (float)v5;
        v4 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v8));
      }
    }
  }
  return v4;
}

- (unint64_t)directoryTypeForPageThumbnails
{
  return 4;
}

- (unint64_t)directoryTypeForTOC
{
  return 5;
}

- (unint64_t)directoryTypeForBookmarks
{
  return 6;
}

- (BOOL)isLocationOnCurrentPage:(id)a3
{
  id v4;
  double v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  unint64_t v9;
  id v10;
  unint64_t v11;

  v4 = a3;
  if (v4
    && ((*(_QWORD *)&v5 = objc_opt_class(BKLocation).n128_u64[0],
         !objc_msgSend(v4, "isMemberOfClass:", v6, v5))
     || -[BKThumbnailBookViewController canOrdinalOnlyLocationsBeVisible](self, "canOrdinalOnlyLocationsBeVisible"))
    && (v7 = -[BKPDFModernBookViewController pageIndexForLocation:](self, "pageIndexForLocation:", v4),
        v7 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v9 = v7;
    v10 = -[BKPDFModernBookViewController currentPages](self, "currentPages");
    v8 = v9 >= (unint64_t)v10 && v9 - (unint64_t)v10 < v11;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)turnPageInDirection:(int64_t)a3
{
  unint64_t v5;
  int64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  int64_t v10;
  BOOL v12;

  v5 = -[BKPDFModernBookViewController currentPageIndex](self, "currentPageIndex");
  v6 = +[BKPDFModernBookViewController pageNumberForPageIndex:](BKPDFModernBookViewController, "pageNumberForPageIndex:", v5);
  if (a3 == 1)
  {
    v7 = -1;
  }
  else
  {
    if (a3)
      return 0;
    v7 = 1;
  }
  v8 = +[BKPDFModernBookViewController pageNumberForPageIndex:](BKPDFModernBookViewController, "pageNumberForPageIndex:", v5 + v7);
  if (v8 != v6)
  {
    v9 = v8;
    v10 = -[BKPDFModernBookViewController pageCountIncludingUpsell](self, "pageCountIncludingUpsell");
    if (v9 >= 1 && v9 <= v10)
    {
      v12 = 1;
      -[BKPDFModernBookViewController setIgnoreKeyboardInteraction:](self, "setIgnoreKeyboardInteraction:", 1);
      -[BKPDFModernBookViewController scrollToPageNumber:animate:](self, "scrollToPageNumber:animate:", v9, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));
      return v12;
    }
  }
  return 0;
}

- (BOOL)canGoToNextPage
{
  return !-[BKPDFModernBookViewController assetEditingEnabled](self, "assetEditingEnabled");
}

- (BOOL)canGoToPreviousPage
{
  return !-[BKPDFModernBookViewController assetEditingEnabled](self, "assetEditingEnabled");
}

- (BOOL)canNavigateByChapter
{
  return 0;
}

- (void)books_pageRight:(id)a3
{
  id v4;

  v4 = a3;
  if (-[BKPDFModernBookViewController isPageProgressionRTL](self, "isPageProgressionRTL"))
    -[BKPDFModernBookViewController books_pageBackward:](self, "books_pageBackward:", v4);
  else
    -[BKPDFModernBookViewController books_pageForward:](self, "books_pageForward:", v4);

}

- (void)books_pageLeft:(id)a3
{
  id v4;

  v4 = a3;
  if (-[BKPDFModernBookViewController isPageProgressionRTL](self, "isPageProgressionRTL"))
    -[BKPDFModernBookViewController books_pageForward:](self, "books_pageForward:", v4);
  else
    -[BKPDFModernBookViewController books_pageBackward:](self, "books_pageBackward:", v4);

}

- (void)books_pageForward:(id)a3
{
  if (!-[BKPDFModernBookViewController assetEditingEnabled](self, "assetEditingEnabled", a3)
    && !-[BKPDFModernBookViewController ignoreKeyboardInteraction](self, "ignoreKeyboardInteraction"))
  {
    -[BKPDFModernBookViewController turnPageInDirection:](self, "turnPageInDirection:", 0);
  }
}

- (void)books_pageBackward:(id)a3
{
  if (!-[BKPDFModernBookViewController assetEditingEnabled](self, "assetEditingEnabled", a3)
    && !-[BKPDFModernBookViewController ignoreKeyboardInteraction](self, "ignoreKeyboardInteraction"))
  {
    -[BKPDFModernBookViewController turnPageInDirection:](self, "turnPageInDirection:", 1);
  }
}

- (void)startCountingAnnotations
{
  id v3;
  BKPDFAnnotationCounter *v4;
  BKPDFAnnotationCounter *annotationCounter;
  BKPDFAnnotationCounter *v6;
  _QWORD v7[4];
  id v8;
  id location;

  if (-[BKBookViewController _inAnalyticsReadSession](self, "_inAnalyticsReadSession"))
  {
    v3 = -[PDFDocument copy](self->_pdfDocument, "copy");
    objc_initWeak(&location, self);
    v4 = -[BKPDFAnnotationCounter initWithDocument:]([BKPDFAnnotationCounter alloc], "initWithDocument:", objc_msgSend(v3, "documentRef"));
    annotationCounter = self->_annotationCounter;
    self->_annotationCounter = v4;

    v6 = self->_annotationCounter;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_E29B8;
    v7[3] = &unk_1C1B28;
    objc_copyWeak(&v8, &location);
    -[BKPDFAnnotationCounter countMarkupAnnotationsWithCompletion:](v6, "countMarkupAnnotationsWithCompletion:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);

  }
}

- (id)analyticsContentSettingData
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (-[BKBookViewController _inAnalyticsReadSession](self, "_inAnalyticsReadSession") && self->_annotationCountResults)
  {
    v3 = objc_alloc((Class)BAContentSettingsData);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDFDocument bookmarkedPages](self->_pdfDocument, "bookmarkedPages"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BKPDFAnnotationCounterResult numberOfMarkupAnnotationsWithPopups](self->_annotationCountResults, "numberOfMarkupAnnotationsWithPopups")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BKPDFAnnotationCounterResult numberOfMarkupAnnotations](self->_annotationCountResults, "numberOfMarkupAnnotations")));
    v8 = objc_msgSend(v3, "initWithBookmarkCount:noteCount:highlightCount:", v5, v6, v7);

  }
  else
  {
    v8 = objc_msgSend(objc_alloc((Class)BAContentSettingsData), "initWithBookmarkCount:noteCount:highlightCount:", &off_1CD370, &off_1CD370, &off_1CD370);
  }
  return v8;
}

- (BOOL)isPageBookmarked
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentPage"));

  if (v3)
    v4 = objc_msgSend(v3, "isBookmarked");
  else
    v4 = 0;

  return v4;
}

- (id)visiblePageBookmarks
{
  uint64_t v2;
  NSObject *v3;

  v2 = BKModernPDFLog(self);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_11D55C();

  return 0;
}

- (void)updateBookmarkButton:(BOOL)a3
{
  void *v4;
  id v5;
  unsigned int v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  UIButton *bookmarkButton;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfDocument](self, "pdfDocument", a3));
  v5 = objc_msgSend(v4, "allowsDocumentAssembly");

  v6 = -[BKPDFModernBookViewController isPageBookmarked](self, "isPageBookmarked");
  v7 = CFSTR("bookmark");
  if (v6)
    v7 = CFSTR("bookmark.fill");
  v8 = v7;
  if (-[BKPDFModernBookViewController im_isCompactHeight](self, "im_isCompactHeight"))
    v9 = 2;
  else
    v9 = 3;
  -[UIButton setEnabled:](self->super._bookmarkButton, "setEnabled:", v5);
  bookmarkButton = self->super._bookmarkButton;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v8));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 5, v9, 17.0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imageWithConfiguration:", v12));
  -[UIButton setImage:forState:](bookmarkButton, "setImage:forState:", v13, 0);

  if (-[BKPDFModernBookViewController isPageBookmarked](self, "isPageBookmarked"))
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    -[UIButton setTintColor:](self->super._bookmarkButton, "setTintColor:", v14);

  }
  else
  {
    -[UIButton setTintColor:](self->super._bookmarkButton, "setTintColor:", 0);
  }
}

- (void)toggleBookmark:(id)a3
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_E2D94;
  v4[3] = &unk_1BEA38;
  v4[4] = self;
  -[BKViewController dismissCurrentPopoverWithCompletion:](self, "dismissCurrentPopoverWithCompletion:", v4);
  -[BKPDFModernBookViewController updateBookmarkButton:](self, "updateBookmarkButton:", 1);
}

- (BOOL)canCopy
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentSelection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "string"));
  v5 = objc_msgSend(v4, "length") != 0;

  return v5;
}

- (void)copy:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[2];
  NSAttributedStringDocumentAttributeKey v22;
  NSAttributedStringDocumentType v23;
  void *v24;
  void *v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentSelection"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "string"));
  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeUTF8PlainText, "identifier"));
    v24 = v6;
    v25 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributedString"));
    v9 = v8;
    if (v8)
    {
      v10 = objc_msgSend(v8, "length");
      v22 = NSDocumentTypeDocumentAttribute;
      v23 = NSRTFTextDocumentType;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dataFromRange:documentAttributes:error:", 0, v10, v11, 0));

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeRTF, "identifier"));
      v19 = v13;
      v14 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v12, 4);
      v20 = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
      v21[0] = v15;
      v21[1] = v7;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 2));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard"));
      objc_msgSend(v17, "setItems:", v16);

    }
    else
    {
      v18 = v7;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard"));
      objc_msgSend(v13, "setItems:", v12);
    }

  }
}

- (void)scrub:(id)a3
{
  -[BKPDFModernBookViewController scrub:isScrubbing:](self, "scrub:isScrubbing:", a3, 0);
}

- (void)scrubValueChanged:(id)a3
{
  id v4;
  dispatch_time_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKPDFModernBookViewController;
  -[BKThumbnailBookViewController scrubValueChanged:](&v11, "scrubValueChanged:", v4);
  objc_initWeak(&location, self);
  v5 = dispatch_time(0, 100000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_E3238;
  block[3] = &unk_1BF560;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)scrub:(id)a3 isScrubbing:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  v4 = a4;
  v6 = a3;
  objc_opt_class(BKScrubberControl);
  v8 = BUDynamicCast(v7, v6);
  v11 = (id)objc_claimAutoreleasedReturnValue(v8);

  v9 = v11;
  if (v11)
  {
    v10 = objc_msgSend(v11, "pageNumber");
    -[BKPDFModernBookViewController setScrubbing:](self, "setScrubbing:", v4);
    -[BKPDFModernBookViewController turnToPageNumber:animated:](self, "turnToPageNumber:animated:", v10, 0);
    -[BKPDFModernBookViewController setScrubbing:](self, "setScrubbing:", 0);
    v9 = v11;
    if (!v4)
    {
      -[BKBookViewController emitScrubEventStartPosition:endPosition:totalLength:](self, "emitScrubEventStartPosition:endPosition:totalLength:", -[BKBookViewController pageNumberBeforeScrubbing](self, "pageNumberBeforeScrubbing"), v10, -[BKPDFModernBookViewController pageCountIncludingUpsell](self, "pageCountIncludingUpsell"));
      v9 = v11;
    }
  }

}

- (void)updateScrubber:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  int64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  length = a3.length;
  location = a3.location;
  v6 = -[BKPDFModernBookViewController pageCountIncludingUpsell](self, "pageCountIncludingUpsell");
  if (v6)
  {
    v7 = v6;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (-[BKBookViewController controlsVisible](self, "controlsVisible"))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController scrubber](self, "scrubber"));
        objc_msgSend(v8, "setPageCount:", v7);

        v9 = -[BKPDFModernBookViewController pageNumberFromRange:](self, "pageNumberFromRange:", location, length);
        if (v9 >= v7)
          v10 = v7;
        else
          v10 = v9;
        if (v10 <= 1)
          v11 = 1;
        else
          v11 = v10;
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController scrubber](self, "scrubber"));
        objc_msgSend(v12, "setPageNumber:", v11);

        v13 = (id)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController scrubber](self, "scrubber"));
        objc_msgSend(v13, "setProgress:", 1.0);

      }
    }
  }
}

- (BOOL)thumbnailDirectoryWantsPageNumber:(id)a3
{
  return 1;
}

- (id)imageCache
{
  IMThumbnailRenderingCache **p_imageCache;
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  AEPdfRenderingCache *v8;
  void *v9;
  void *v10;
  AEPdfRenderingCache *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  void *v18;

  p_imageCache = &self->super._imageCache;
  if (!self->super._imageCache)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfDocument](self, "pdfDocument"));
      v6 = objc_msgSend(v5, "isLocked");

      if (v6)
        v7 = 7340032;
      else
        v7 = 0x100000;
      v8 = [AEPdfRenderingCache alloc];
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "databaseKey"));
      v11 = -[AEPdfRenderingCache initWithIdentifier:memorySize:](v8, "initWithIdentifier:memorySize:", v10, v7);

      objc_storeStrong((id *)p_imageCache, v11);
      +[BKThumbnailDirectory defaultCellSize](BKThumbnailDirectory, "defaultCellSize");
      -[IMThumbnailRenderingCache setPrimaryImageSize:](*p_imageCache, "setPrimaryImageSize:");
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[AEPdfRenderingCache persistentCachePath](v11, "persistentCachePath"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "persistentCachePath"));
      v15 = objc_msgSend(v12, "isEqualToString:", v14);

      if ((v15 & 1) == 0)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
        objc_msgSend(v16, "resetPersistentCache");

        v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[AEPdfRenderingCache persistentCachePath](v11, "persistentCachePath"));
        objc_msgSend(v17, "setPersistentCachePath:", v18);

        -[NSManagedObjectContext save:](self->super.super._bookMoc, "save:", 0);
      }

    }
  }
  return *p_imageCache;
}

+ (int64_t)pageNumberForPageIndex:(unint64_t)a3
{
  if (a3 == -1)
    return 1;
  else
    return a3 + 1;
}

+ (unint64_t)pageIndexForPageNumber:(int64_t)a3
{
  if (a3 <= 0)
    return 0;
  else
    return a3 - 1;
}

- (void)beginScroll:(id)a3
{
  -[BKPDFModernBookViewController setScrolling:](self, "setScrolling:", 1);
}

- (void)endScroll:(id)a3
{
  -[BKPDFModernBookViewController setScrolling:](self, "setScrolling:", 0);
  -[BKPDFModernBookViewController updateContentScale](self, "updateContentScale");
}

- (void)visiblePageDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  int64_t v11;
  void *v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentPage"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfDocument](self, "pdfDocument"));
  v7 = objc_msgSend(v6, "indexForPage:", v5);

  v9 = BKModernPDFLog(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_11D620((uint64_t)v7, v5);

  v11 = +[BKPDFModernBookViewController pageNumberForPageIndex:](BKPDFModernBookViewController, "pageNumberForPageIndex:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController scrubber](self, "scrubber"));
  objc_msgSend(v12, "setPageNumber:", v11);

  v13 = -[BKPDFModernBookViewController pageCountIncludingUpsell](self, "pageCountIncludingUpsell");
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = v13;
    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[BKPDFModernBookViewController currentPages](self, "currentPages");
      -[BKThumbnailBookViewController setPageNumberHudTextLabelForValidatedPageNumber:visiblePageCount:validatedPageCount:](self, "setPageNumberHudTextLabelForValidatedPageNumber:visiblePageCount:validatedPageCount:", v11, v15, v14);
      -[BKBookViewController setUserNavigated:](self, "setUserNavigated:", 1);
    }
  }
  -[BKPDFModernBookViewController updateBookmarkButton:](self, "updateBookmarkButton:", 1);
  -[BKPDFModernBookViewController updateProgressKitForNewLocation](self, "updateProgressKitForNewLocation");

}

- (void)scrollerViewPageDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView", a3));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentPage"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfDocument](self, "pdfDocument"));
  v6 = objc_msgSend(v5, "indexForPage:", v10);

  v7 = +[BKPDFModernBookViewController pageNumberForPageIndex:](BKPDFModernBookViewController, "pageNumberForPageIndex:", v6);
  if (v7 == (void *)-[BKPDFModernBookViewController targetPageNumber](self, "targetPageNumber"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
    objc_msgSend(v8, "postEvent:sender:", kBETestDriverPageTurnAnimationEnd, self);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
    objc_msgSend(v9, "postEvent:sender:", kBETestDriverPageTurnEnd, self);

  }
  -[BKPDFModernBookViewController setIgnoreKeyboardInteraction:](self, "setIgnoreKeyboardInteraction:", 0);

}

- (void)annotationsDidChange:(id)a3
{
  id v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  NSObject *v21;

  v4 = a3;
  *(_QWORD *)&v5 = objc_opt_class(NSDictionary).n128_u64[0];
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo", v5));

  v9 = BUDynamicCast(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  *(_QWORD *)&v11 = objc_opt_class(PDFPage).n128_u64[0];
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("page"), v11));
  v15 = BUDynamicCast(v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfDocument](self, "pdfDocument"));
    v18 = objc_msgSend(v17, "indexForPage:", v16);

    if (v18 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if (!v18)
        v19 = -[BKPDFModernBookViewController setCoverNeedsUpdate:](self, "setCoverNeedsUpdate:", 1);
      v20 = BKModernPDFLog(v19);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        sub_11D6EC((uint64_t)v18, v21);

    }
  }
  -[BKPDFModernBookViewController _evaluateUndoRedoEnabled](self, "_evaluateUndoRedoEnabled");

}

- (id)PDFViewParentViewController
{
  return self;
}

- (void)PDFViewWillClickOnLink:(id)a3 withURL:(id)a4
{
  -[BKBookViewController contentViewController:goToURL:likelyUserInitiated:](self, "contentViewController:goToURL:likelyUserInitiated:", 0, a4, 1);
}

- (id)menuItems:(id)a3 forPage:(id)a4
{
  NSMutableArray *v4;
  _QWORD *v5;
  id v6;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  _QWORD v11[4];
  NSMutableArray *v12;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_E3A78;
  v11[3] = &unk_1C1B50;
  v4 = objc_opt_new(NSMutableArray);
  v12 = v4;
  v5 = objc_retainBlock(v11);
  v6 = AEBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Search"), &stru_1C3088, 0));
  ((void (*)(_QWORD *, void *, const char *))v5[2])(v5, v8, "searchPDFUsingSelection:");

  v9 = v4;
  return v9;
}

- (UIEdgeInsets)pdfViewContentInset
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
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  UIEdgeInsets result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController topToolbar](self, "topToolbar"));
  objc_msgSend(v12, "alpha");
  if (v13 > 0.0)
  {
    objc_msgSend(v12, "frame");
    v5 = v5 + CGRectGetHeight(v18);
  }

  v14 = v5;
  v15 = v7;
  v16 = v9;
  v17 = v11;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (void)searchPDFUsingSelection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentSelection"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "string"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  objc_msgSend(v7, "clearSelection");

  -[BKBookViewController showSearchWithString:sender:](self, "showSearchWithString:sender:", v6, v4);
}

- (void)viewSafeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKPDFModernBookViewController;
  -[BKPDFModernBookViewController viewSafeAreaInsetsDidChange](&v3, "viewSafeAreaInsetsDidChange");
  -[BKPDFModernBookViewController updateContentInsets](self, "updateContentInsets");
}

- (void)updateContentInsets
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfScrollView](self, "pdfScrollView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController view](self, "view"));
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController view](self, "view"));
  objc_msgSend(v6, "safeAreaInsets");
  objc_msgSend(v7, "setContentInset:", v5, 0.0);

}

- (id)_uniqueIDForOutline:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  uint64_t v7;

  v3 = a3;
  if (v3)
  {
    v4 = v3;
    v5 = &stru_1C3088;
    do
    {
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld/%@"), objc_msgSend(v4, "index"), v5));

      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parent"));
      v5 = v6;
      v4 = (void *)v7;
    }
    while (v7);
  }
  else
  {
    v6 = &stru_1C3088;
  }
  return v6;
}

- (void)buildContextTree:(id)a3
{
  NSMutableArray *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  _QWORD v26[4];

  v4 = objc_opt_new(NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfDocument](self, "pdfDocument"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "outlineRoot"));

  if (objc_msgSend(v6, "numberOfChildren"))
  {
    v7 = 0;
    v24 = BCProgressContextTreeKey_uniqueID;
    v23 = BCProgressContextTreeKey_title;
    v22 = BCProgressContextTreeKey_displayOrder;
    v21 = BCProgressContextTreeKey_cfi;
    do
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "childAtIndex:", v7));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "label"));
      v10 = (void *)v9;
      v11 = &stru_1C3088;
      if (v9)
        v11 = (__CFString *)v9;
      v12 = v11;

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController _uniqueIDForOutline:](self, "_uniqueIDForOutline:", v8));
      v14 = +[BKPDFModernBookViewController pageNumberForPageIndex:](BKPDFModernBookViewController, "pageNumberForPageIndex:", -[BKPDFModernBookViewController _pageIndexForOutline:](self, "_pageIndexForOutline:", v8));
      v25[0] = v24;
      v25[1] = v23;
      v26[0] = v13;
      v26[1] = v12;
      v25[2] = v22;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v7));
      v26[2] = v15;
      v25[3] = v21;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("page(%lu)"), v14));
      v26[3] = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 4));

      -[NSMutableArray addObject:](v4, "addObject:", v17);
      ++v7;
    }
    while (v7 < (unint64_t)objc_msgSend(v6, "numberOfChildren"));
  }
  if (-[NSMutableArray count](v4, "count"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[BCProgressKitController sharedController](BCProgressKitController, "sharedController"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "assetID"));
    objc_msgSend(v18, "buildContextTree:forBook:completion:", v4, v20, 0);

  }
}

- (void)updateProgressKitForNewLocation
{
  unint64_t v3;
  void *v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  char *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v3 = -[BKPDFModernBookViewController currentPageIndex](self, "currentPageIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfDocument](self, "pdfDocument"));
  v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "outlineRoot"));

  v5 = (char *)objc_msgSend(v26, "numberOfChildren");
  v6 = v5 - 1;
  if ((uint64_t)v5 >= 1)
  {
    v7 = v5;
    v8 = 0;
    v9 = -1;
    do
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "childAtIndex:", v8));
      v11 = -[BKPDFModernBookViewController _pageIndexForOutline:](self, "_pageIndexForOutline:", v10);

      if (v11 > v3)
      {
        if (v8 <= 1)
          v12 = 1;
        else
          v12 = v8;
        v9 = v12 - 1;
        goto LABEL_13;
      }
      if (v6 == (char *)v8)
        v9 = v8;
      ++v8;
    }
    while (v7 != (char *)v8);
    if (v9 < 0)
      goto LABEL_20;
LABEL_13:
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "childAtIndex:", v9));
    if (v9 >= (uint64_t)v6)
      v14 = 0;
    else
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "childAtIndex:", v9 + 1));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController _uniqueIDForOutline:](self, "_uniqueIDForOutline:", v13));
    v15 = -[BKPDFModernBookViewController _pageIndexForOutline:](self, "_pageIndexForOutline:", v13);
    if (v14)
    {
      v16 = -[BKPDFModernBookViewController _pageIndexForOutline:](self, "_pageIndexForOutline:", v14);
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfDocument](self, "pdfDocument"));
      v16 = (char *)objc_msgSend(v17, "pageCount");

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[BCProgressKitController sharedController](BCProgressKitController, "sharedController"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "assetID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "label"));
    objc_msgSend(v18, "activateChapterForBook:chapterID:title:currentPage:chapterRange:completion:", v20, v25, v21, v3, v15, &v16[-v15], 0);

  }
LABEL_20:
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[BCProgressKitController sharedController](BCProgressKitController, "sharedController"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "assetID"));
  objc_msgSend(v22, "updateBookProgress:currentPage:completion:", v24, -[BKPDFModernBookViewController currentPageIndex](self, "currentPageIndex"), 0);

}

- (unint64_t)_pageIndexForOutline:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "destination"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "page"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfDocument](self, "pdfDocument"));
  v7 = objc_msgSend(v6, "indexForPage:", v5);

  return (unint64_t)v7;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  BOOL v3;
  void *v4;
  void *v5;

  if (self->_controlsTapRecognizer != a3)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFModernBookViewController pdfView](self, "pdfView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentSelection"));
  v3 = v5 == 0;

  return v3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  unsigned __int8 v9;

  v6 = a4;
  if (self->_controlsTapRecognizer == a3
    && (objc_opt_class(UITextTapRecognizer), (objc_opt_isKindOfClass(v6, v7) & 1) != 0))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("UITextInteractionNameSingleTap"));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)assetReloading
{
  return self->assetReloading;
}

- (void)setAssetReloading:(BOOL)a3
{
  self->assetReloading = a3;
}

- (BCCoverResetting)sharedBookCoverResetter
{
  return self->_sharedBookCoverResetter;
}

- (void)setSharedBookCoverResetter:(id)a3
{
  objc_storeStrong((id *)&self->_sharedBookCoverResetter, a3);
}

- (PDFView)pdfView
{
  return self->_pdfView;
}

- (void)setPdfView:(id)a3
{
  objc_storeStrong((id *)&self->_pdfView, a3);
}

- (AEPdfCache)pdfDocumentCache
{
  return self->_pdfDocumentCache;
}

- (void)setPdfDocumentCache:(id)a3
{
  objc_storeStrong((id *)&self->_pdfDocumentCache, a3);
}

- (void)setPdfDocument:(id)a3
{
  objc_storeStrong((id *)&self->_pdfDocument, a3);
}

- (UIView)akToolbarView
{
  return self->_akToolbarView;
}

- (void)setAkToolbarView:(id)a3
{
  objc_storeStrong((id *)&self->_akToolbarView, a3);
}

- (UITapGestureRecognizer)controlsTapRecognizer
{
  return self->_controlsTapRecognizer;
}

- (void)setControlsTapRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_controlsTapRecognizer, a3);
}

- (NSUndoManager)pdfUndoManager
{
  return self->_pdfUndoManager;
}

- (void)setPdfUndoManager:(id)a3
{
  objc_storeStrong((id *)&self->_pdfUndoManager, a3);
}

- (double)initialZoomFactor
{
  return self->_initialZoomFactor;
}

- (void)setInitialZoomFactor:(double)a3
{
  self->_initialZoomFactor = a3;
}

- (double)aspectRatioFromPDF
{
  return self->_aspectRatioFromPDF;
}

- (void)setAspectRatioFromPDF:(double)a3
{
  self->_aspectRatioFromPDF = a3;
}

- (void)setPerformSelectorProxy:(id)a3
{
  objc_storeStrong((id *)&self->_performSelectorProxy, a3);
}

- (BOOL)isScrubbing
{
  return self->_scrubbing;
}

- (void)setScrubbing:(BOOL)a3
{
  self->_scrubbing = a3;
}

- (BOOL)isScrolling
{
  return self->_scrolling;
}

- (void)setScrolling:(BOOL)a3
{
  self->_scrolling = a3;
}

- (BOOL)coverNeedsUpdate
{
  return self->_coverNeedsUpdate;
}

- (void)setCoverNeedsUpdate:(BOOL)a3
{
  self->_coverNeedsUpdate = a3;
}

- (BOOL)assetEditingRequested
{
  return self->_assetEditingRequested;
}

- (void)setAssetEditingRequested:(BOOL)a3
{
  self->_assetEditingRequested = a3;
}

- (BOOL)stateShouldClose
{
  return self->_stateShouldClose;
}

- (void)setStateShouldClose:(BOOL)a3
{
  self->_stateShouldClose = a3;
}

- (BOOL)ignoreKeyboardInteraction
{
  return self->_ignoreKeyboardInteraction;
}

- (void)setIgnoreKeyboardInteraction:(BOOL)a3
{
  self->_ignoreKeyboardInteraction = a3;
}

- (BOOL)isSaving
{
  return self->_isSaving;
}

- (void)setIsSaving:(BOOL)a3
{
  self->_isSaving = a3;
}

- (BOOL)currentlyAtMinimumScaleFactor
{
  return self->_currentlyAtMinimumScaleFactor;
}

- (void)setCurrentlyAtMinimumScaleFactor:(BOOL)a3
{
  self->_currentlyAtMinimumScaleFactor = a3;
}

- (double)minimumScaleWithToolBars
{
  return self->_minimumScaleWithToolBars;
}

- (void)setMinimumScaleWithToolBars:(double)a3
{
  self->_minimumScaleWithToolBars = a3;
}

- (int64_t)targetPageNumber
{
  return self->_targetPageNumber;
}

- (void)setTargetPageNumber:(int64_t)a3
{
  self->_targetPageNumber = a3;
}

- (BKPDFAnnotationCounter)annotationCounter
{
  return self->_annotationCounter;
}

- (void)setAnnotationCounter:(id)a3
{
  objc_storeStrong((id *)&self->_annotationCounter, a3);
}

- (BKPDFAnnotationCounterResult)annotationCountResults
{
  return self->_annotationCountResults;
}

- (void)setAnnotationCountResults:(id)a3
{
  objc_storeStrong((id *)&self->_annotationCountResults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationCountResults, 0);
  objc_storeStrong((id *)&self->_annotationCounter, 0);
  objc_storeStrong((id *)&self->_performSelectorProxy, 0);
  objc_storeStrong((id *)&self->_pdfUndoManager, 0);
  objc_storeStrong((id *)&self->_controlsTapRecognizer, 0);
  objc_storeStrong((id *)&self->_akToolbarView, 0);
  objc_storeStrong((id *)&self->_pdfDocument, 0);
  objc_storeStrong((id *)&self->_pdfDocumentCache, 0);
  objc_storeStrong((id *)&self->_pdfView, 0);
  objc_storeStrong((id *)&self->_sharedBookCoverResetter, 0);
  objc_storeStrong((id *)&self->_writeQueue, 0);
}

@end
