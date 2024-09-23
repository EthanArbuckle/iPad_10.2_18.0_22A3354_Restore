@implementation THGlossaryEntryViewController

- (THGlossaryEntryViewController)initWithDocumentRoot:(id)a3 bookNavigator:(id)a4
{
  THGlossaryEntryViewController *v6;
  THGlossaryEntryViewController *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  TSDInteractiveCanvasController *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)THGlossaryEntryViewController;
  v6 = -[THGlossaryEntryViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
  {
    -[THGlossaryEntryViewController set_documentRoot:](v6, "set_documentRoot:", a3);
    v7->_bookNavigator = (THBookNavigation *)a4;
    v9 = (void *)objc_opt_class(THGlossaryInteractiveCanvasController, v8);
    v11 = (void *)objc_opt_class(THGlossaryiOSCanvasViewController, v10);
    THCanvasCreateWithClass(v7, (id *)&v7->mICC, &v7->mCVC, v9, v11);
    -[TSDInteractiveCanvasController disableNormalGestures](-[THGlossaryEntryViewController interactiveCanvasController](v7, "interactiveCanvasController"), "disableNormalGestures");
    v12 = -[THGlossaryEntryViewController interactiveCanvasController](v7, "interactiveCanvasController");
    -[TSDInteractiveCanvasController enableGestureKinds:](v12, "enableGestureKinds:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", TSWPImmediateSingleTap));
    objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](-[THGlossaryEntryViewController interactiveCanvasController](v7, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "setAllowsPinchZoom:", 0);
    -[THGlossaryEntryViewController setExtendedLayoutIncludesOpaqueBars:](v7, "setExtendedLayoutIncludesOpaqueBars:", 1);
    -[THGlossaryEntryViewController setEdgesForExtendedLayout:](v7, "setEdgesForExtendedLayout:", 15);
    -[THGlossaryEntryViewController registerForTraitChanges:withAction:](v7, "registerForTraitChanges:withAction:", +[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"), "_traitCollectionDidChange:previousTraitCollection:");
  }
  return v7;
}

- (void)teardown
{
  self->_bookNavigator = 0;
  -[THGlossaryInteractiveCanvasController teardown](self->mICC, "teardown");
  -[THGlossaryiOSCanvasViewController teardown](self->mCVC, "teardown");
}

- (void)dealloc
{
  id mUnloadCallback;
  objc_super v4;

  if (self->mEntry)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THGlossaryEntryViewController dealloc]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THGlossaryEntryViewController.m"), 111, CFSTR("Unload Entry should be called before dealloc."));
  -[THGlossaryEntryViewController unloadEntryOnComplete:](self, "unloadEntryOnComplete:", 0);

  self->mICC = 0;
  self->mCVC = 0;
  -[TSKScrollView setDelegate:](self->mScrollView, "setDelegate:", 0);

  self->mScrollView = 0;
  mUnloadCallback = self->mUnloadCallback;
  if (mUnloadCallback)
  {
    _Block_release(mUnloadCallback);
    self->mUnloadCallback = 0;
  }
  -[THGlossaryEntryViewController set_documentRoot:](self, "set_documentRoot:", 0);

  self->_theme = 0;
  v4.receiver = self;
  v4.super_class = (Class)THGlossaryEntryViewController;
  -[THGlossaryEntryViewController dealloc](&v4, "dealloc");
}

- (BOOL)interactiveCanvasController:(id)a3 allowsEditMenuForRep:(id)a4
{
  return 0;
}

- (void)setLinkHandler:(id)a3
{
  -[THGlossaryInteractiveCanvasController setLinkHandler:](self->mICC, "setLinkHandler:", a3);
}

- (THDocumentRoot)documentRoot
{
  if (-[THGlossaryEntryViewController _documentRoot](self, "_documentRoot"))
    return (THDocumentRoot *)-[THGlossaryEntryViewController _documentRoot](self, "_documentRoot");
  else
    return (THDocumentRoot *)-[THModelGlossaryEntry documentRoot](self->mEntry, "documentRoot");
}

- (BOOL)isCanvasInteractive
{
  return 1;
}

- (BOOL)interactiveCanvasController:(id)a3 shouldBeginEditingTHWPRep:(id)a4 withGesture:(id)a5
{
  return 0;
}

- (void)loadView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double y;
  TSKScrollView *v8;
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)THGlossaryEntryViewController;
  -[THGlossaryEntryViewController loadView](&v10, "loadView");
  objc_msgSend(-[THGlossaryEntryViewController view](self, "view"), "frame");
  v4 = v3;
  v6 = v5;
  y = CGPointZero.y;
  v8 = (TSKScrollView *)objc_msgSend(objc_alloc((Class)TSKScrollView), "initWithFrame:", CGPointZero.x, y, v3, v5);
  self->mScrollView = v8;
  -[TSKScrollView setAutoresizingMask:](v8, "setAutoresizingMask:", 18);
  -[TSKScrollView setBackgroundColor:](self->mScrollView, "setBackgroundColor:", +[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
  -[TSKScrollView setDecelerationRate:](self->mScrollView, "setDecelerationRate:", UIScrollViewDecelerationRateFast);
  objc_msgSend(-[THGlossaryEntryViewController view](self, "view"), "addSubview:", self->mScrollView);
  v9 = -[THGlossaryInteractiveCanvasController canvasView](self->mICC, "canvasView");
  objc_msgSend(v9, "setAutoresizingMask:", 0);
  objc_msgSend(v9, "setBackgroundColor:", +[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
  -[TSKScrollView addSubview:](self->mScrollView, "addSubview:", v9);
  objc_msgSend(v9, "setFrame:", 0.0, y, v4, v6);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)THGlossaryEntryViewController;
  -[THGlossaryEntryViewController viewWillAppear:](&v5, "viewWillAppear:");
  -[THGlossaryiOSCanvasViewController viewWillAppear:](self->mCVC, "viewWillAppear:", v3);
  -[THGlossaryEntryViewController _stylizeForTheme](self, "_stylizeForTheme");
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)THGlossaryEntryViewController;
  -[THGlossaryEntryViewController viewDidAppear:](&v5, "viewDidAppear:");
  -[THGlossaryiOSCanvasViewController viewDidAppear:](self->mCVC, "viewDidAppear:", v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)THGlossaryEntryViewController;
  -[THGlossaryEntryViewController viewWillDisappear:](&v5, "viewWillDisappear:");
  -[THGlossaryiOSCanvasViewController viewWillDisappear:](self->mCVC, "viewWillDisappear:", v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)THGlossaryEntryViewController;
  -[THGlossaryEntryViewController viewDidDisappear:](&v5, "viewDidDisappear:");
  -[THGlossaryiOSCanvasViewController viewDidDisappear:](self->mCVC, "viewDidDisappear:", v3);
}

- (void)setTheme:(id)a3
{
  id v5;

  if ((-[IMTheme isEqual:](self->_theme, "isEqual:") & 1) == 0)
  {
    v5 = a3;

    self->_theme = (IMTheme *)a3;
    -[THGlossaryEntryViewController _stylizeForTheme](self, "_stylizeForTheme");
  }
}

- (void)_stylizeForTheme
{
  id v3;

  v3 = -[IMTheme backgroundColorForTraitEnvironment:](-[THGlossaryEntryViewController theme](self, "theme"), "backgroundColorForTraitEnvironment:", self);
  if (!v3)
    v3 = +[UIColor bc_booksBackground](UIColor, "bc_booksBackground");
  if (-[THGlossaryEntryViewController viewIfLoaded](self, "viewIfLoaded"))
  {
    -[TSKScrollView setBackgroundColor:](-[THGlossaryEntryViewController scrollView](self, "scrollView"), "setBackgroundColor:", v3);
    objc_msgSend(-[THGlossaryEntryViewController view](self, "view"), "setBackgroundColor:", v3);
  }
  objc_msgSend(-[THGlossaryInteractiveCanvasController canvasView](self->mICC, "canvasView"), "setBackgroundColor:", v3);
}

- (void)p_didLayoutOnComplete:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  if (self->mLoadCancelled)
  {
    -[THGlossaryEntryViewController p_unloadEntry](self, "p_unloadEntry");
  }
  else
  {
    v5 = -[THGlossaryInteractiveCanvasController layoutForInfo:](self->mICC, "layoutForInfo:", self->mInfo);
    objc_msgSend(v5, "frame");
    objc_msgSend(objc_msgSend(-[THGlossaryInteractiveCanvasController canvasView](self->mICC, "canvasView"), "canvasLayer"), "setUnscaledSize:", v6, v7);
    objc_msgSend(v5, "frame");
    -[TSKScrollView setContentSize:](self->mScrollView, "setContentSize:", v8, v9);
    -[TSKScrollView setDelegate:](self->mScrollView, "setDelegate:", self->mICC);
  }
  -[THGlossaryEntryViewController setLoading:](self, "setLoading:", 0);
  (*((void (**)(id, THGlossaryEntryViewController *))a3 + 2))(a3, self);
}

- (void)p_layoutOnComplete:(id)a3
{
  id v5;
  id v6;
  _QWORD v7[6];
  _QWORD v8[5];

  if (!self->mLoadCancelled)
  {
    v5 = -[THDocumentRoot accessController](-[THGlossaryController documentRoot](-[THGlossaryEntryViewController glossaryController](self, "glossaryController"), "documentRoot"), "accessController");
    v6 = v5;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_B7D80;
    v8[3] = &unk_426DD0;
    v8[4] = self;
    objc_msgSend(v5, "performRead:", v8);

  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_B7D94;
  v7[3] = &unk_426E78;
  v7[4] = self;
  v7[5] = a3;
  -[NSOperationQueue addOperation:](+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"), "addOperation:", +[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v7));
}

- (void)p_setupCanvasForInfo:(id)a3 withLayoutStyleProvider:(id)a4 onComplete:(id)a5
{
  THModelGlossaryEntry *mEntry;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  id v17;
  _QWORD v18[6];

  if (self->mLoadCancelled)
  {
    -[THGlossaryEntryViewController p_unloadEntry](self, "p_unloadEntry", a3, a4);
    -[THGlossaryEntryViewController setLoading:](self, "setLoading:", 0);
    (*((void (**)(id, THGlossaryEntryViewController *))a5 + 2))(a5, self);
  }
  else
  {
    mEntry = self->mEntry;
    if (mEntry != objc_msgSend(a3, "entry"))
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THGlossaryEntryViewController p_setupCanvasForInfo:withLayoutStyleProvider:onComplete:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THGlossaryEntryViewController.m"), 326, CFSTR("Must unload a glossary entry before re-loading."));
    -[TSKScrollView setContentOffset:](self->mScrollView, "setContentOffset:", CGPointZero.x, CGPointZero.y);
    self->mInfo = (THGlossaryEntryInfo *)a3;
    -[THGlossaryInteractiveCanvasController setInfosToDisplay:](self->mICC, "setInfosToDisplay:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", a3));
    objc_msgSend(-[THGlossaryEntryViewController view](self, "view"), "frame");
    v11 = v10;
    objc_msgSend(a4, "glossaryEntryLayoutContentSize");
    -[THGlossaryInteractiveCanvasController setViewScale:](self->mICC, "setViewScale:", v11 / v12);
    -[THGlossaryInteractiveCanvasController viewScale](self->mICC, "viewScale");
    if (v13 != 1.0)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THGlossaryEntryViewController p_setupCanvasForInfo:withLayoutStyleProvider:onComplete:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THGlossaryEntryViewController.m"), 337, CFSTR("Expected glossary canvas viewScale to be 1."));
    -[THGlossaryInteractiveCanvasController recreateAllLayoutsAndReps](self->mICC, "recreateAllLayoutsAndReps");
    v15 = objc_opt_class(THGlossaryEntryLayout, v14);
    *(_QWORD *)&v16 = TSUDynamicCast(v15, -[THGlossaryInteractiveCanvasController layoutForInfo:](self->mICC, "layoutForInfo:", self->mInfo)).n128_u64[0];
    objc_msgSend(v17, "setLayoutStyleProvider:", a4, v16);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_B801C;
    v18[3] = &unk_426E78;
    v18[4] = self;
    v18[5] = a5;
    -[NSOperationQueue addOperation:](+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"), "addOperation:", +[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v18));
  }
}

- (void)loadEntry:(id)a3 withLayoutStyleProvider:(id)a4 onComplete:(id)a5
{
  THModelGlossaryEntry *mEntry;
  void *v10;
  _QWORD v11[7];

  mEntry = self->mEntry;
  if (mEntry == a3)
  {
    (*((void (**)(id, THGlossaryEntryViewController *))a5 + 2))(a5, self);
  }
  else if (mEntry)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THGlossaryEntryViewController loadEntry:withLayoutStyleProvider:onComplete:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THGlossaryEntryViewController.m"), 365, CFSTR("Must unload a glossary entry before re-loading."));
  }
  else
  {
    -[THGlossaryEntryViewController setLoading:](self, "setLoading:", 1);
    self->mEntry = (THModelGlossaryEntry *)a3;
    -[THGlossaryInteractiveCanvasController setDelegate:](self->mICC, "setDelegate:", self);
    v10 = _Block_copy(a5);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_B8180;
    v11[3] = &unk_429000;
    v11[4] = self;
    v11[5] = a4;
    v11[6] = v10;
    objc_msgSend(a3, "loadInfoOnComplete:", v11);

  }
}

- (void)p_unloadEntry
{
  void (**v3)(id, THGlossaryEntryViewController *);

  self->mInfo = 0;
  if (self->mEntry)
  {
    -[THGlossaryInteractiveCanvasController setInfosToDisplay:](self->mICC, "setInfosToDisplay:", +[NSArray array](NSArray, "array"));
    self->mEntry = 0;
  }
  if (-[THGlossaryEntryViewController unloadCallback](self, "unloadCallback"))
  {
    v3 = -[THGlossaryEntryViewController unloadCallback](self, "unloadCallback");
    v3[2](v3, self);
    _Block_release(self->mUnloadCallback);
    self->mUnloadCallback = 0;
  }
  self->mLoadCancelled = 0;
}

- (void)unloadEntryOnComplete:(id)a3
{
  id mUnloadCallback;

  mUnloadCallback = self->mUnloadCallback;
  if (mUnloadCallback)
    _Block_release(mUnloadCallback);
  self->mUnloadCallback = _Block_copy(a3);
  if (-[THGlossaryEntryViewController loading](self, "loading"))
    self->mLoadCancelled = 1;
  else
    -[THGlossaryEntryViewController p_unloadEntry](self, "p_unloadEntry");
}

- (void)scrollToLocation:(int)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  TSKScrollView **p_mScrollView;
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

  v4 = a4;
  if (a3 == 2)
  {
    p_mScrollView = &self->mScrollView;
    -[TSKScrollView contentOffset](self->mScrollView, "contentOffset");
    v8 = v10;
    v12 = v11;
    -[TSKScrollView contentSize](*p_mScrollView, "contentSize");
    v14 = v13;
    -[TSKScrollView bounds](*p_mScrollView, "bounds");
    v9 = 0.0;
    if (v14 - v15 >= 0.0)
      v9 = v14 - v15;
    if (v12 != v9)
      goto LABEL_8;
  }
  else if (a3 == 1)
  {
    p_mScrollView = &self->mScrollView;
    -[TSKScrollView contentOffset](self->mScrollView, "contentOffset");
    if (v7 != 0.0)
    {
      v8 = v6;
      v9 = 0.0;
LABEL_8:
      -[TSKScrollView setContentOffset:animated:](*p_mScrollView, "setContentOffset:animated:", v4, v8, v9);
    }
  }
}

- (Class)wpEditorClassOverride
{
  return (Class)objc_opt_class(THWPEditingController, a2);
}

- (BOOL)editorAllowsHyperlinkInteraction
{
  return 0;
}

- (BOOL)editorAllowsMagnifier
{
  return 0;
}

- (BOOL)editorAllowsCaret
{
  return 0;
}

- (BOOL)allowCopy
{
  return -[THBookDescription allowCopy](-[THDocumentRoot bookDescription](-[THGlossaryController documentRoot](-[THGlossaryEntryViewController glossaryController](self, "glossaryController"), "documentRoot"), "bookDescription"), "allowCopy");
}

- (THGlossaryController)glossaryController
{
  return self->mGlossaryController;
}

- (void)setGlossaryController:(id)a3
{
  self->mGlossaryController = (THGlossaryController *)a3;
}

- (THModelGlossaryEntry)entry
{
  return self->mEntry;
}

- (BOOL)loading
{
  return self->mLoading;
}

- (void)setLoading:(BOOL)a3
{
  self->mLoading = a3;
}

- (id)unloadCallback
{
  return self->mUnloadCallback;
}

- (void)setUnloadCallback:(id)a3
{
  self->mUnloadCallback = a3;
}

- (TSDInteractiveCanvasController)interactiveCanvasController
{
  return (TSDInteractiveCanvasController *)self->mICC;
}

- (TSKScrollView)scrollView
{
  return self->mScrollView;
}

- (THGlossaryEntryInfo)info
{
  return self->mInfo;
}

- (THModalViewControllerProvider)modalViewControllerProvider
{
  return self->_modalViewControllerProvider;
}

- (void)setModalViewControllerProvider:(id)a3
{
  self->_modalViewControllerProvider = (THModalViewControllerProvider *)a3;
}

- (IMTheme)theme
{
  return self->_theme;
}

- (THBookNavigation)bookNavigator
{
  return self->_bookNavigator;
}

- (TSKDocumentRoot)_documentRoot
{
  return self->__documentRoot;
}

- (void)set_documentRoot:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

@end
