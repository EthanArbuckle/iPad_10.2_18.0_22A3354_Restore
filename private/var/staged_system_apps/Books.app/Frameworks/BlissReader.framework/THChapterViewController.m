@implementation THChapterViewController

- (THChapterViewController)initWithDelegate:(id)a3 pageControlHeight:(double)a4 presentationType:(id)a5
{
  uint64_t v9;
  THChapterViewController *v10;
  THChapterViewController *v11;
  CGSize *p_mPageSize;
  objc_class *v13;
  CGFloat v14;
  objc_super v16;

  v9 = THBundle();
  v16.receiver = self;
  v16.super_class = (Class)THChapterViewController;
  v10 = -[THChapterViewController initWithNibName:bundle:](&v16, "initWithNibName:bundle:", CFSTR("THChapterViewController"), v9);
  v11 = v10;
  if (v10)
  {
    v10->mDelegate = (THChapterViewControllerDelegate *)a3;
    v10->mChapterIndex = 0x7FFFFFFFFFFFFFFFLL;
    v10->_pageControlHeight = a4;
    p_mPageSize = &v10->mPageSize;
    objc_msgSend(a5, "pageSize");
    *(_QWORD *)&p_mPageSize->width = v13;
    v11->mPageSize.height = v14;
    -[THChapterViewController setSectionController:](v11, "setSectionController:", -[THSectionController initWithDelegate:pagePositionController:presentationType:]([THSectionController alloc], "initWithDelegate:pagePositionController:presentationType:", v11, +[THPagePositionController paginatedPositionerWithDelegate:](THPagePositionController, "paginatedPositionerWithDelegate:", v11), a5));
    -[THChapterViewController registerForTraitChanges:withAction:](v11, "registerForTraitChanges:withAction:", +[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"), "_traitCollectionDidChange:previousTraitCollection:");
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[THChapterViewController p_releaseOutlets](self, "p_releaseOutlets");

  v3.receiver = self;
  v3.super_class = (Class)THChapterViewController;
  -[THChapterViewController dealloc](&v3, "dealloc");
}

- (void)teardown
{
  -[THChapterViewController p_teardownCanvas](self, "p_teardownCanvas");
  self->mDelegate = 0;
}

- (void)p_teardownCanvas
{
  -[THInteractiveCanvasController teardown](self->mInteractiveCanvasController, "teardown");
  -[THiOSCanvasViewController teardown](self->mCanvasViewController, "teardown");
  -[THSectionController teardown](self->mSectionController, "teardown");
  self->_torndown = 1;
}

- (void)p_releaseOutlets
{
  if (!self->_torndown)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterViewController p_releaseOutlets]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterViewController.m"), 114, CFSTR("%@ chapterIndex=%lu - not torndown before dealloc"), self, -[THChapterViewController chapterIndex](self, "chapterIndex"));
    if (!self->_torndown)
      -[THChapterViewController p_teardownCanvas](self, "p_teardownCanvas");
  }

  self->mInteractiveCanvasController = 0;
  self->mCanvasViewController = 0;

  self->mFallbackImageView = 0;
  self->_traitsCache = 0;
}

- (void)viewDidLayoutSubviews
{
  double v3;
  double v4;

  objc_msgSend(-[THChapterViewController view](self, "view"), "bounds");
  -[THChapterViewController updateCanvasViewWithSize:](self, "updateCanvasViewWithSize:", v3, v4);
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  -[THiOSTraitsCache updateTraitsWithCollection:](-[THChapterViewController traitsCache](self, "traitsCache", a3, a4), "updateTraitsWithCollection:", -[THChapterViewController traitCollection](self, "traitCollection"));
}

- (void)updateCanvasViewWithSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  UIImage *v23;
  UIImage *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  UIImageView *mFallbackImageView;
  double v35;

  height = a3.height;
  width = a3.width;
  v6 = 0.0;
  if (-[THChapterViewControllerDelegate paginatedTOCShowsStatusBar](self->mDelegate, "paginatedTOCShowsStatusBar"))
  {
    objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(-[THChapterViewController view](self, "view"), "window"), "windowScene"), "statusBarManager"), "defaultStatusBarHeightInOrientation:", objc_msgSend(objc_msgSend(objc_msgSend(-[THChapterViewController view](self, "view"), "window"), "windowScene"), "interfaceOrientation"));
    v6 = v7;
  }
  v8 = -[THSectionController pageSize](self->mSectionController, "pageSize");
  v10 = v9;
  v12 = v11 - self->_pageControlHeight;
  v13 = v6 + CGRectZero.origin.y;
  v14 = height - v6;
  TSDScaleSizeWithinSize(v8);
  v15 = TSDCenterOfRect(CGRectZero.origin.x, v13, width, v14);
  v16 = TSDRectWithCenterAndSize(v15);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(-[THiOSCanvasViewController view](-[THChapterViewController canvasViewController](self, "canvasViewController"), "view"), "setFrame:", v16, v17, v19, v21);
  -[THInteractiveCanvasController setViewScale:](-[THChapterViewController interactiveCanvasController](self, "interactiveCanvasController"), "setViewScale:", THScaleNeededToFitSizeInSize(v10, v12, width, v14));
  -[UIImageView setFrame:](self->mFallbackImageView, "setFrame:", v16, v18, v20, v22);
  v23 = -[UIImageView image](self->mFallbackImageView, "image");
  if (v23)
  {
    v24 = v23;
    -[UIImage size](v23, "size");
    v26 = v25;
    -[UIImage size](v24, "size");
    v28 = v27;
    -[UIImageView frame](self->mFallbackImageView, "frame");
    v30 = v29 / v26;
    -[UIImageView frame](self->mFallbackImageView, "frame");
    if (v30 > v31 / v28)
    {
      -[UIImageView frame](self->mFallbackImageView, "frame");
      v33 = -(v32 - v28 * v30) * 0.5;
      mFallbackImageView = self->mFallbackImageView;
      -[UIImageView frameY](mFallbackImageView, "frameY");
      -[UIImageView setFrameY:](mFallbackImageView, "setFrameY:", v35 + v33);
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THChapterViewController;
  -[THChapterViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[THiOSTraitsCache updateTraitsWithCollection:](-[THChapterViewController traitsCache](self, "traitsCache"), "updateTraitsWithCollection:", -[THChapterViewController traitCollection](self, "traitCollection"));
  -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, "contentSizeCategoryDidChange", UIContentSizeCategoryDidChangeNotification, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THChapterViewController;
  -[THChapterViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, UIContentSizeCategoryDidChangeNotification, 0);
}

- (void)viewDidLoad
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  UIImageView *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)THChapterViewController;
  -[THChapterViewController viewDidLoad](&v11, "viewDidLoad");
  v4 = (void *)objc_opt_new(THiOSTraitsCache, v3);
  -[THChapterViewController setTraitsCache:](self, "setTraitsCache:", v4);

  self->_torndown = 0;
  objc_msgSend(-[THChapterViewController view](self, "view"), "setClipsToBounds:", 1);
  objc_msgSend(-[THChapterViewController view](self, "view"), "setBackgroundColor:", -[THChapterViewControllerDelegate pageAreaBackgroundColor](self->mDelegate, "pageAreaBackgroundColor"));
  -[THChapterViewControllerDelegate frameForChapterViewController:](self->mDelegate, "frameForChapterViewController:", self);
  objc_msgSend(-[THChapterViewController view](self, "view"), "setFrame:", v5, v6, v7, v8);
  -[THInteractiveCanvasController setDelegate:](-[THChapterViewController interactiveCanvasController](self, "interactiveCanvasController"), "setDelegate:", self);
  -[THiOSCanvasViewController setTakeFirstResponderOnTap:](-[THChapterViewController canvasViewController](self, "canvasViewController"), "setTakeFirstResponderOnTap:", 0);
  v9 = objc_alloc((Class)UIImageView);
  objc_msgSend(-[THInteractiveCanvasController canvasView](-[THChapterViewController interactiveCanvasController](self, "interactiveCanvasController"), "canvasView"), "frame");
  v10 = (UIImageView *)objc_msgSend(v9, "initWithFrame:");
  self->mFallbackImageView = v10;
  -[UIImageView setHidden:](v10, "setHidden:", 1);
  objc_msgSend(-[THChapterViewController view](self, "view"), "insertSubview:aboveSubview:", self->mFallbackImageView, -[THInteractiveCanvasController canvasView](-[THChapterViewController interactiveCanvasController](self, "interactiveCanvasController"), "canvasView"));
  -[THChapterViewController reloadViewsAndShowThumbnail:](self, "reloadViewsAndShowThumbnail:", 1);
}

- (void)contentSizeCategoryDidChange
{
  -[THChapterViewTableController contentSizeCategoryDidChange](-[THChapterViewController chapterViewTableController](self, "chapterViewTableController"), "contentSizeCategoryDidChange");
}

- (CGRect)visibleScaledBoundsForClippingRepsOnCanvas:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(-[THInteractiveCanvasController canvasView](-[THChapterViewController interactiveCanvasController](self, "interactiveCanvasController", a3), "canvasView"), "bounds");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (THModelLink)chapterLink
{
  return -[THTOCTileModel firstModelLink](self->mTileModel, "firstModelLink");
}

- (void)p_hideFallbackImageView
{
  -[UIImageView setHidden:](self->mFallbackImageView, "setHidden:", 1);
  -[UIImageView setImage:](self->mFallbackImageView, "setImage:", 0);
}

- (BOOL)p_updateVisibleInfos
{
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSArray *v12;
  id v13;

  if (-[THChapterViewController tileModel](self, "tileModel")
    && -[THChapterViewController isViewLoaded](self, "isViewLoaded")
    && objc_msgSend(-[THChapterViewController view](self, "view"), "superview"))
  {
    objc_msgSend(-[THChapterViewController view](self, "view"), "bounds");
    -[THChapterViewController updateCanvasViewWithSize:](self, "updateCanvasViewWithSize:", v3, v4);
    -[THSectionController setCurrentNavigationUnit:](-[THChapterViewController sectionController](self, "sectionController"), "setCurrentNavigationUnit:", +[THNavigationUnit navigationUnitWithContext:andModelNode:](THNavigationUnit, "navigationUnitWithContext:andModelNode:", -[THTOCTileModel context](-[THChapterViewController tileModel](self, "tileModel"), "context"), -[THTOCTileModel browserPageNode](-[THChapterViewController tileModel](self, "tileModel"), "browserPageNode")));
    v6 = objc_opt_class(THSectionInfo, v5);
    v7 = (void *)TSUDynamicCast(v6, -[THSectionController displaySectionInfoForRelativePageIndex:](-[THChapterViewController sectionController](self, "sectionController"), "displaySectionInfoForRelativePageIndex:", 0));
    v9 = objc_opt_class(THSectionInfo, v8);
    v10 = (void *)TSUDynamicCast(v9, objc_msgSend(-[THInteractiveCanvasController infosToDisplay](-[THChapterViewController interactiveCanvasController](self, "interactiveCanvasController"), "infosToDisplay"), "lastObject"));
    v11 = objc_msgSend(objc_msgSend(v7, "pages"), "lastObject");
    if (v11 != objc_msgSend(objc_msgSend(v10, "pages"), "lastObject"))
    {
      v12 = +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v7);
LABEL_8:
      -[THInteractiveCanvasController setInfosToDisplay:](-[THChapterViewController interactiveCanvasController](self, "interactiveCanvasController"), "setInfosToDisplay:", v12);
      LOBYTE(v13) = 1;
      return (char)v13;
    }
    LOBYTE(v13) = 0;
  }
  else
  {
    v13 = objc_msgSend(-[THInteractiveCanvasController infosToDisplay](-[THChapterViewController interactiveCanvasController](self, "interactiveCanvasController"), "infosToDisplay"), "count");
    if (v13)
    {
      v12 = +[NSArray array](NSArray, "array");
      goto LABEL_8;
    }
  }
  return (char)v13;
}

- (void)p_updateVisibleInfosOrRevealCanvas
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  _QWORD v8[6];
  _QWORD v9[5];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (!-[THChapterViewController p_updateVisibleInfos](self, "p_updateVisibleInfos"))
  {
    -[THInteractiveCanvasController setAllowLayoutAndRenderOnThread:](-[THChapterViewController interactiveCanvasController](self, "interactiveCanvasController"), "setAllowLayoutAndRenderOnThread:", 0);
    -[THInteractiveCanvasController setStaticLayoutAndRenderOnThread:](-[THChapterViewController interactiveCanvasController](self, "interactiveCanvasController"), "setStaticLayoutAndRenderOnThread:", 0);
    v3 = objc_msgSend(objc_msgSend(-[THInteractiveCanvasController canvas](-[THChapterViewController interactiveCanvasController](self, "interactiveCanvasController"), "canvas"), "topLevelReps"), "copy");
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "recursivelyPerformSelectorIfImplemented:", "canvasDidLayoutAndRenderOnBackgroundThread");
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

    v8[5] = self->mTileModel;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_A0D1C;
    v9[3] = &unk_426DD0;
    v9[4] = self;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_A0D34;
    v8[3] = &unk_4285A8;
    v8[4] = self;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v9, v8, 0.15);
  }
}

- (id)reloadViewsAndShowThumbnail:(BOOL)a3
{
  _BOOL4 v3;
  THModelContentNode *v5;
  BOOL v6;
  UIImage *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIImageView *mFallbackImageView;
  double v17;
  double v18;
  UIImageView *v19;
  double v20;
  THTOCTileModel *mTileModel;
  _QWORD v22[6];

  v3 = a3;
  if (-[THChapterViewController isViewLoaded](self, "isViewLoaded") && self->mTileModel)
  {
    objc_msgSend(-[THChapterViewController view](self, "view"), "setHidden:", 0);
    v5 = -[THTOCTileModel browserPageNode](-[THChapterViewController tileModel](self, "tileModel"), "browserPageNode");
    if (-[THModelContentNode nodeBodyExists](v5, "nodeBodyExists"))
    {
      -[THModelContentNode startLoading](v5, "startLoading");
      if (-[THTOCTileModel tocThumb](self->mTileModel, "tocThumb"))
        v6 = !v3;
      else
        v6 = 1;
      if (v6)
      {
        -[THChapterViewController p_hideFallbackImageView](self, "p_hideFallbackImageView");
        -[THInteractiveCanvasController setStaticLayoutAndRenderOnThread:](-[THChapterViewController interactiveCanvasController](self, "interactiveCanvasController"), "setStaticLayoutAndRenderOnThread:", 0);
        -[THInteractiveCanvasController setAllowLayoutAndRenderOnThread:](-[THChapterViewController interactiveCanvasController](self, "interactiveCanvasController"), "setAllowLayoutAndRenderOnThread:", 0);
        -[THModelContentNode waitUntilFinishedLoading](v5, "waitUntilFinishedLoading");
        -[THChapterViewController p_updateVisibleInfos](self, "p_updateVisibleInfos");
      }
      else
      {
        v8 = +[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", +[TSDBitmapImageProvider temporaryCGImageForImageData:](TSDBitmapImageProvider, "temporaryCGImageForImageData:", -[THTOCTileModel tocThumb](self->mTileModel, "tocThumb")));
        -[UIImage size](v8, "size");
        v10 = v9;
        -[UIImage size](v8, "size");
        v12 = v11;
        -[UIImageView frame](self->mFallbackImageView, "frame");
        v14 = v13 / v10;
        -[UIImageView frame](self->mFallbackImageView, "frame");
        mFallbackImageView = self->mFallbackImageView;
        if (v14 <= v15 / v12)
        {
          -[UIImageView setContentMode:](mFallbackImageView, "setContentMode:", 1);
        }
        else
        {
          -[UIImageView setContentMode:](mFallbackImageView, "setContentMode:", 2);
          -[UIImageView frame](self->mFallbackImageView, "frame");
          v18 = -(v17 - v12 * v14) * 0.5;
          v19 = self->mFallbackImageView;
          -[UIImageView frameY](v19, "frameY");
          -[UIImageView setFrameY:](v19, "setFrameY:", v20 + v18);
        }
        -[UIImageView setImage:](self->mFallbackImageView, "setImage:", v8);
        -[UIImageView setHidden:](self->mFallbackImageView, "setHidden:", 0);
        -[UIImageView setAlpha:](self->mFallbackImageView, "setAlpha:", 1.0);
        -[THInteractiveCanvasController setStaticLayoutAndRenderOnThread:](-[THChapterViewController interactiveCanvasController](self, "interactiveCanvasController"), "setStaticLayoutAndRenderOnThread:", 1);
        -[THInteractiveCanvasController setAllowLayoutAndRenderOnThread:](-[THChapterViewController interactiveCanvasController](self, "interactiveCanvasController"), "setAllowLayoutAndRenderOnThread:", 1);
        mTileModel = self->mTileModel;
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_A0FA0;
        v22[3] = &unk_426E28;
        v22[4] = self;
        v22[5] = mTileModel;
        -[THModelContentNode performWhenFinishedLoading:onError:](v5, "performWhenFinishedLoading:onError:", v22, &stru_428D08);
      }
    }
    else
    {
      objc_msgSend(-[THChapterViewController view](self, "view"), "setHidden:", 1);
    }
  }
  else
  {
    objc_msgSend(-[THChapterViewController view](self, "view"), "setHidden:", 1);
    return 0;
  }
  return v5;
}

- (void)interactiveCanvasControllerDidLayoutAndRenderOnBackgroundThread:(id)a3
{
  if ((-[THInteractiveCanvasController currentlyWaitingOnThreadedLayoutAndRender](-[THChapterViewController interactiveCanvasController](self, "interactiveCanvasController", a3), "currentlyWaitingOnThreadedLayoutAndRender") & 1) == 0)-[THChapterViewController p_updateVisibleInfosOrRevealCanvas](self, "p_updateVisibleInfosOrRevealCanvas");
}

- (BOOL)shouldFreeTransformRecognizeSimultaneouslyWithGestureRecognizer:(id)a3
{
  return 0;
}

- (unint64_t)chapterViewTableNumberOfEntries:(id)a3
{
  return -[NSArray count](-[THTOCTileModel landscapeEntries](-[THChapterViewController tileModel](self, "tileModel", a3), "landscapeEntries"), "count");
}

- (id)chapterViewTable:(id)a3 entryForIndex:(unint64_t)a4
{
  NSArray *v5;

  v5 = -[THTOCTileModel landscapeEntries](-[THChapterViewController tileModel](self, "tileModel", a3), "landscapeEntries");
  if (-[NSArray count](v5, "count") <= a4)
    return 0;
  else
    return -[NSArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", a4);
}

- (void)chapterViewTable:(id)a3 selectedEntryWithIndex:(unint64_t)a4
{
  NSArray *v6;
  id v7;

  if (self->_chapterViewTableController == a3)
  {
    v6 = -[THTOCTileModel landscapeEntries](-[THChapterViewController tileModel](self, "tileModel"), "landscapeEntries");
    if (-[NSArray count](v6, "count") <= a4)
      v7 = 0;
    else
      v7 = -[NSArray objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", a4);
    -[THChapterViewControllerDelegate chapterViewController:followLink:](self->mDelegate, "chapterViewController:followLink:", self, objc_msgSend(v7, "modelLink"));
    -[THChapterViewTableController dismissAnimated:completion:](self->_chapterViewTableController, "dismissAnimated:completion:", +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"), 0);
    -[THChapterViewController setChapterViewTableController:](self, "setChapterViewTableController:", 0);
  }
}

- (void)chapterViewTableDoneButtonPressed:(id)a3
{
  if (self->_chapterViewTableController == a3)
  {
    objc_msgSend(a3, "dismissAnimated:completion:", +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"), 0);
    -[THChapterViewController setChapterViewTableController:](self, "setChapterViewTableController:", 0);
  }
}

- (void)presentRepExpanded:(id)a3
{
  if (-[NSArray count](-[THTOCTileModel landscapeEntries](-[THChapterViewController tileModel](self, "tileModel", a3), "landscapeEntries"), "count"))
  {
    if (!self->_chapterViewTableController)
      self->_chapterViewTableController = -[THChapterViewTableController initWithChapterTitle:delegate:]([THChapterViewTableController alloc], "initWithChapterTitle:delegate:", -[THTOCTileModel frontTitleText](-[THChapterViewController tileModel](self, "tileModel"), "frontTitleText"), self);
    -[THChapterViewTableController presentOnViewController:animated:completion:](-[THChapterViewController chapterViewTableController](self, "chapterViewTableController"), "presentOnViewController:animated:completion:", -[THChapterViewControllerDelegate presentingViewControllerForChapterViewController:](self->mDelegate, "presentingViewControllerForChapterViewController:", self), +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"), 0);
  }
}

- (BOOL)repIsPresentedExpanded:(id)a3
{
  return 0;
}

- (id)freeTransformRepHandler
{
  return 0;
}

- (BOOL)inFlowMode
{
  return 0;
}

- (CGSize)widgetHostExpandedSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  objc_msgSend(-[THChapterViewController view](self, "view"), "frame");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (BOOL)widgetHostingAllowInteractionOnPageForRep:(id)a3
{
  if ((-[THChapterViewController im_isCompactWidth](self, "im_isCompactWidth", a3) & 1) != 0)
    return 0;
  else
    return -[THChapterViewController im_isCompactHeight](self, "im_isCompactHeight") ^ 1;
}

- (BOOL)widgetHostingAllowAutoplayForRep:(id)a3
{
  return 0;
}

- (BOOL)widgetHostingShouldAllowNaturalHorizontalScrollForRep:(id)a3
{
  return 0;
}

- (id)actionForHyperlink:(id)a3 inRep:(id)a4 gesture:(id)a5
{
  return -[THChapterViewControllerDelegate chapterViewController:actionForHyperlink:inRep:gesture:](self->mDelegate, "chapterViewController:actionForHyperlink:inRep:gesture:", self, a3, a4, a5);
}

- (THDocumentRoot)documentRoot
{
  return (THDocumentRoot *)-[THChapterViewControllerDelegate documentRootForChapterViewController:](self->mDelegate, "documentRootForChapterViewController:", self);
}

- (BOOL)isCanvasInteractive
{
  return 1;
}

- (void)interactiveCanvasControllerWasTapped:(id)a3
{
  -[THChapterViewControllerDelegate chapterViewControllerWasTapped:](self->mDelegate, "chapterViewControllerWasTapped:", self);
}

- (BOOL)interactiveCanvasController:(id)a3 shouldBeginEditingTHWPRep:(id)a4 withGesture:(id)a5
{
  return 0;
}

- (BOOL)canvasViewController:(id)a3 enableSwipeGestureWithNumberOfTouches:(unint64_t)a4
{
  return a4 == 1;
}

- (id)documentRootForSectionController:(id)a3
{
  uint64_t v4;

  v4 = objc_opt_class(THDocumentRoot, a2);
  return (id)TSUDynamicCast(v4, -[THTOCTileModel documentRoot](-[THChapterViewController tileModel](self, "tileModel"), "documentRoot"));
}

- (id)rootModelControllerForSectionController:(id)a3
{
  return -[THChapterViewControllerDelegate documentRootForChapterViewController:](self->mDelegate, "documentRootForChapterViewController:", self);
}

- (void)sectionControllerNeedsLayout:(id)a3
{
  -[THInteractiveCanvasController layoutInvalidated](-[THChapterViewController interactiveCanvasController](self, "interactiveCanvasController", a3), "layoutInvalidated");
}

- (void)showCorruptDocumentAlertForSectionController:(id)a3
{
  id v4;
  UIAlertController *v5;

  v4 = objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("This book is either missing content or contains invalid content."), &stru_43D7D8, 0);
  v5 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v4, objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Try downloading the book again"), &stru_43D7D8, 0), 1);
  -[UIAlertController addAction:](v5, "addAction:", +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("OK"), &stru_43D7D8, 0), 1, 0));
  -[THChapterViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"), 0);
}

- (void)sectionControllerInfosDidChange:(id)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterViewController sectionControllerInfosDidChange:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterViewController.m"), 579, CFSTR("unsupported"));
}

- (id)flowLayoutObserverForSectionController:(id)a3
{
  return 0;
}

- (BOOL)isCompactFlowPresentationForSectionController:(id)a3
{
  return 0;
}

- (CGSize)pageSizeForPagePositionController:(id)a3
{
  double width;
  double height;
  CGSize result;

  width = self->mPageSize.width;
  height = self->mPageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)displaySinglePageChapterSeparately:(id)a3
{
  return 0;
}

- (BOOL)isTwoUpForSectionController:(id)a3
{
  return 0;
}

- (BOOL)allowsDescendersToClipForSectionController:(id)a3
{
  return 0;
}

- (id)layoutControllerForSectionController:(id)a3
{
  return 0;
}

- (BOOL)shouldAllowFinishingPartionedAttachmentLayoutForSectionController:(id)a3
{
  return 0;
}

- (BOOL)shouldScaleFlowLayoutsForSectionController:(id)a3
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return (unint64_t)-[THChapterViewControllerDelegate supportedInterfaceOrientationsForChapterViewController:](self->mDelegate, "supportedInterfaceOrientationsForChapterViewController:", self);
}

- (id)transitionContentView
{
  return -[THiOSCanvasViewController view](-[THChapterViewController canvasViewController](self, "canvasViewController"), "view");
}

- (THTOCTileModel)tileModel
{
  return self->mTileModel;
}

- (void)setTileModel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (unint64_t)chapterIndex
{
  return self->mChapterIndex;
}

- (void)setChapterIndex:(unint64_t)a3
{
  self->mChapterIndex = a3;
}

- (THInteractiveCanvasController)interactiveCanvasController
{
  return self->mInteractiveCanvasController;
}

- (void)setInteractiveCanvasController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (THiOSCanvasViewController)canvasViewController
{
  return self->mCanvasViewController;
}

- (void)setCanvasViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (THSectionController)sectionController
{
  return self->mSectionController;
}

- (void)setSectionController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (BOOL)torndown
{
  return self->_torndown;
}

- (void)setTorndown:(BOOL)a3
{
  self->_torndown = a3;
}

- (double)pageControlHeight
{
  return self->_pageControlHeight;
}

- (THChapterViewTableController)chapterViewTableController
{
  return self->_chapterViewTableController;
}

- (void)setChapterViewTableController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (THiOSTraitsCache)traitsCache
{
  return self->_traitsCache;
}

- (void)setTraitsCache:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

@end
