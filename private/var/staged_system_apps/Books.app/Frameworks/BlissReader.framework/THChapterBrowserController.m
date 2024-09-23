@implementation THChapterBrowserController

- (THChapterBrowserController)initWithNibName:(id)a3 bundle:(id)a4 bookPropertiesDelegate:(id)a5 delegate:(id)a6
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  THChapterBrowserController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  objc_super v20;

  v8 = a5;
  v9 = a6;
  v10 = THBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v20.receiver = self;
  v20.super_class = (Class)THChapterBrowserController;
  v12 = -[THTOCViewController initWithNibName:bundle:bookPropertiesDelegate:delegate:](&v20, "initWithNibName:bundle:bookPropertiesDelegate:delegate:", CFSTR("THChapterBrowserController"), v11, v8, v9);

  if (v12)
  {
    -[THChapterBrowserController p_configureThumbsAndUpdateLayout:](v12, "p_configureThumbsAndUpdateLayout:", 0);
    -[THChapterBrowserController setPreviousChapterIndex:](v12, "setPreviousChapterIndex:", 0x7FFFFFFFFFFFFFFFLL);
    v12->mChapterIndex = 0;
    v12->mPreservedThumbnailOffset = CGPointZero;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    -[THChapterBrowserController setThumbnailsHiddenForPinch:](v12, "setThumbnailsHiddenForPinch:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    -[THChapterBrowserController setContentNodesAskedToLoad:](v12, "setContentNodesAskedToLoad:", v14);

    v12->mCBCIsOnscreen = 0;
    v12->mDeferPagesScrollViewScrolls = 0;
    v12->mDeferBackgroundScrollViewScrolls = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController bottomWrapperView](v12, "bottomWrapperView"));
    objc_msgSend(v15, "setAcceptsHits:", 0);

    v12->mDidPurgeIntroMediaController = 0;
    v12->mDidAutoHideToolbar = 0;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[THChapterBrowserController setThumbnailViewsInTransition:](v12, "setThumbnailViewsInTransition:", v16);

    bzero(&v12->_flags, 1uLL);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v18 = -[THChapterBrowserController registerForTraitChanges:withAction:](v12, "registerForTraitChanges:withAction:", v17, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v12;
}

- (void)p_releaseOutlets
{
  UIView *thumbnailTrackBackgroundView;
  void *v4;
  void *v5;
  UIView *mWrapperView;
  THScrollView *mBackgroundScrollView;
  void *v8;
  void *v9;
  UIView *mIntroMediaContainerView;
  uint64_t v11;
  THChapterViewController **mChapterViewControllers;
  THChapterViewController *v13;
  THChapterViewController *v14;
  THiOSIntroMediaViewController *mIntroMediaViewController;
  UIView *mBackgroundsView;
  THScrollViewWithPassthrough *mPagesScrollView;
  THChapterBrowserScrubbablePageControl *mChapterPageControl;
  UIView *mChapterPageControlWrapper;
  TSWPassThroughView *mBottomWrapperView;
  UIView *mPageAreaBackground;

  -[UIView removeFromSuperview](self->_thumbnailTrackBackgroundView, "removeFromSuperview");
  thumbnailTrackBackgroundView = self->_thumbnailTrackBackgroundView;
  self->_thumbnailTrackBackgroundView = 0;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController pagesScrollView](self, "pagesScrollView"));
  objc_msgSend(v4, "setDelegate:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController backgroundScrollView](self, "backgroundScrollView"));
  objc_msgSend(v5, "setDelegate:", 0);

  mWrapperView = self->mWrapperView;
  self->mWrapperView = 0;

  mBackgroundScrollView = self->mBackgroundScrollView;
  self->mBackgroundScrollView = 0;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController thumbnailSubviews](self, "thumbnailSubviews"));
  objc_msgSend(v8, "makeObjectsPerformSelector:", "teardown");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController introMediaViewController](self, "introMediaViewController"));
  objc_msgSend(v9, "setDelegate:", 0);

  mIntroMediaContainerView = self->mIntroMediaContainerView;
  self->mIntroMediaContainerView = 0;

  v11 = 0;
  mChapterViewControllers = self->mChapterViewControllers;
  do
  {
    v13 = mChapterViewControllers[v11];
    if (v13)
    {
      -[THChapterViewController teardown](v13, "teardown");
      v14 = mChapterViewControllers[v11];
      mChapterViewControllers[v11] = 0;

    }
    ++v11;
  }
  while (v11 != 3);
  mIntroMediaViewController = self->mIntroMediaViewController;
  self->mIntroMediaViewController = 0;

  self->mDidPurgeIntroMediaController = 1;
  mBackgroundsView = self->mBackgroundsView;
  self->mBackgroundsView = 0;

  mPagesScrollView = self->mPagesScrollView;
  self->mPagesScrollView = 0;

  mChapterPageControl = self->mChapterPageControl;
  self->mChapterPageControl = 0;

  mChapterPageControlWrapper = self->mChapterPageControlWrapper;
  self->mChapterPageControlWrapper = 0;

  mBottomWrapperView = self->mBottomWrapperView;
  self->mBottomWrapperView = 0;

  mPageAreaBackground = self->mPageAreaBackground;
  self->mPageAreaBackground = 0;

  -[THChapterBrowserController setContentNodesAskedToLoad:](self, "setContentNodesAskedToLoad:", 0);
  -[THChapterBrowserController setPageAreaBackgroundColor:](self, "setPageAreaBackgroundColor:", 0);
  -[THChapterBrowserController setThumbnailViewsInTransition:](self, "setThumbnailViewsInTransition:", 0);
  -[THChapterBrowserController setShowToolbarRecognizer:](self, "setShowToolbarRecognizer:", 0);
  -[THChapterBrowserController setThumbnailsHiddenForPinch:](self, "setThumbnailsHiddenForPinch:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[THChapterBrowserController p_releaseOutlets](self, "p_releaseOutlets");
  v3.receiver = self;
  v3.super_class = (Class)THChapterBrowserController;
  -[THTOCViewController dealloc](&v3, "dealloc");
}

- (void)p_updateThumbLayout
{
  unint64_t v3;
  unint64_t mChapterIndex;

  v3 = -[THChapterBrowserController p_firstVisibleThumbnailPageIndexInCurrentChapter](self, "p_firstVisibleThumbnailPageIndexInCurrentChapter");
  -[THChapterBrowserController flushThumbnails](self, "flushThumbnails");
  -[THChapterBrowserController p_updateChapterWidths](self, "p_updateChapterWidths");
  -[THChapterBrowserController p_configureThumbCaps](self, "p_configureThumbCaps");
  mChapterIndex = self->mChapterIndex;
  self->mChapterIndex = 0x7FFFFFFFFFFFFFFFLL;
  -[THChapterBrowserController setChapterIndex:](self, "setChapterIndex:", mChapterIndex);
  -[THChapterBrowserController p_offsetForThumbnailAtIndex:chapterIndex:](self, "p_offsetForThumbnailAtIndex:chapterIndex:", v3, self->mChapterIndex);
  -[THChapterBrowserController p_scrollPageScrollViewToOffset:](self, "p_scrollPageScrollViewToOffset:");
}

- (void)p_configureThumbsAndUpdateLayout:(BOOL)a3
{
  void *v5;
  void *v6;
  unsigned int v7;
  double v8;
  double v9;
  int32x2_t v10;
  int64x2_t v11;
  int8x16_t v12;
  CGSize v13;
  CGFloat v14;
  double v15;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
  if ((objc_msgSend(v5, "isCompactWidthForChapterBrowserController:", self) & 1) != 0)
  {
    v15 = 0.85;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
    v7 = objc_msgSend(v6, "isCompactHeightForChapterBrowserController:", self);
    v8 = 0.85;
    if (!v7)
      v8 = 1.0;
    v15 = v8;

  }
  -[THChapterBrowserController thumbScale](self, "thumbScale");
  if (vabdd_f64(v9, v15) >= 0.00999999978)
  {
    -[THChapterBrowserController setThumbScale:](self, "setThumbScale:", v15);
    v10 = vdup_n_s32(-[THChapterBrowserController p_isTOCLandscape](self, "p_isTOCLandscape"));
    v11.i64[0] = v10.u32[0];
    v11.i64[1] = v10.u32[1];
    v12 = (int8x16_t)vcltzq_s64(vshlq_n_s64(v11, 0x3FuLL));
    self->_thumbSize = (CGSize)vrndaq_f64(vmulq_n_f64((float64x2_t)vbslq_s8(v12, (int8x16_t)xmmword_314270, (int8x16_t)xmmword_314260), v15));
    v13 = (CGSize)vrndaq_f64(vmulq_n_f64((float64x2_t)vbslq_s8(v12, (int8x16_t)xmmword_314290, (int8x16_t)xmmword_314280), v15));
    self->_firstThumbSize = v13;
    v14 = self->_firstThumbSize.height - self->_thumbSize.height;
    self->_firstThumbOverlap.width = v13.width - self->_thumbSize.width;
    self->_firstThumbOverlap.height = v14;
    if (a3)
      -[THChapterBrowserController p_updateThumbLayout](self, "p_updateThumbLayout");
  }
}

- (void)p_configureThumbCaps
{
  double v3;
  double v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController view](self, "view"));
  objc_msgSend(v5, "frame");
  -[THChapterBrowserController p_configureThumbCapsForSize:updateImmediately:](self, "p_configureThumbCapsForSize:updateImmediately:", 0, v3, v4);

}

- (void)p_configureThumbCapsForSize:(CGSize)a3 updateImmediately:(BOOL)a4
{
  _BOOL8 v4;
  double width;
  double v7;
  uint64_t v8;

  v4 = a4;
  width = a3.width;
  -[THChapterBrowserController thumbSize](self, "thumbSize", a3.width, a3.height);
  *(float *)&v7 = width / v7;
  v8 = (uint64_t)(float)(ceilf(*(float *)&v7) + 3.0);
  -[THChapterBrowserController setMaximumNumberOfThumbsToRightOfLeftmostDuringBackgroundDrag:](self, "setMaximumNumberOfThumbsToRightOfLeftmostDuringBackgroundDrag:", v8);
  -[THChapterBrowserController setMaximumNumberOfThumbsToLeftOfLeftmostDuringBackgroundDrag:](self, "setMaximumNumberOfThumbsToLeftOfLeftmostDuringBackgroundDrag:", v8);
  -[THChapterBrowserController p_updatePageThumbnails:](self, "p_updatePageThumbnails:", v4);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double mChapterIndex;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)THChapterBrowserController;
  -[THChapterBrowserController viewWillAppear:](&v11, "viewWillAppear:", a3);
  if (-[THChapterBrowserController isViewLoaded](self, "isViewLoaded")
    && self->mChapterIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController dataSource](self, "dataSource"));
    v5 = objc_msgSend(v4, "toc:numberOfTilesInDivision:", self, 0);

    -[THChapterBrowserController chapterWidth](self, "chapterWidth");
    v7 = v6 * (double)(unint64_t)v5;
    -[THScrollView bounds](self->mBackgroundScrollView, "bounds");
    -[THScrollView setContentSize:](self->mBackgroundScrollView, "setContentSize:", v7, v8);
    ++self->mSuspendThumbViewUpdates;
    if (!-[THChapterBrowserController introMediaControllerIsActive](self, "introMediaControllerIsActive"))
    {
      mChapterIndex = (double)self->mChapterIndex;
      -[THChapterBrowserController chapterWidth](self, "chapterWidth");
      -[THScrollView setContentOffset:](self->mBackgroundScrollView, "setContentOffset:", v10 * mChapterIndex, 0.0);
    }
    -[THChapterBrowserController p_updatePagesScrollView](self, "p_updatePagesScrollView");
    --self->mSuspendThumbViewUpdates;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  unint64_t mChapterIndex;
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
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)THChapterBrowserController;
  -[THChapterBrowserController viewDidAppear:](&v25, "viewDidAppear:", a3);
  -[THChapterBrowserController p_updatePageScrubberControlForSizeClassChange](self, "p_updatePageScrubberControlForSizeClassChange");
  -[THChapterBrowserController _configurePagesScrollView](self, "_configurePagesScrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
  objc_msgSend(v4, "setupDVCForTOCController:", self);

  +[CATransaction begin](CATransaction, "begin");
  self->mDeferPagesScrollViewScrolls = 1;
  if (-[THChapterBrowserController isViewLoaded](self, "isViewLoaded"))
  {
    mChapterIndex = self->mChapterIndex;
    if (mChapterIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[THChapterBrowserController p_setupChapterViewControllerAtIndex:withChapterIndex:allowThumbnail:](self, "p_setupChapterViewControllerAtIndex:withChapterIndex:allowThumbnail:", 1, mChapterIndex, self->mIsPinchingDownFromCanvas);
      -[THChapterBrowserController p_fixupChapterViewFrames](self, "p_fixupChapterViewFrames");
      -[THChapterBrowserController p_updateChapterBackgroundsView](self, "p_updateChapterBackgroundsView");
      -[THChapterBrowserController p_updatePageControl](self, "p_updatePageControl");
      if (self->mDidPurgeIntroMediaController)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController introMediaViewController](self, "introMediaViewController"));

        if (!v6)
        {
          v7 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "introMediaViewControllerForChapterBrowserController:", self));
          -[THChapterBrowserController setIntroMediaViewController:showIt:](self, "setIntroMediaViewController:showIt:", v8, 0);

          self->mDidPurgeIntroMediaController = 0;
        }
      }
    }
  }
  -[THChapterBrowserController p_configureThumbCaps](self, "p_configureThumbCaps");
  if (!self->mChapterViewControllers[1])
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterBrowserController viewDidAppear:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterBrowserController.mm"));
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, v11, 367, CFSTR("The current chapter view should not be nil."));

  }
  -[THChapterBrowserController p_resetPagesScrollViewAndCapThumbCount:firstVisibleRelativePage:resetContentOffset:](self, "p_resetPagesScrollViewAndCapThumbCount:firstVisibleRelativePage:resetContentOffset:", 0, 0, 0);
  if (!self->mChapterViewControllers[1])
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterBrowserController viewDidAppear:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterBrowserController.mm"));
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, v14, 375, CFSTR("The current chapter view is nil, likely caused by memory issues."));

    -[THChapterBrowserController p_setupChapterViewControllerAtIndex:withChapterIndex:allowThumbnail:](self, "p_setupChapterViewControllerAtIndex:withChapterIndex:allowThumbnail:", 1, self->mChapterIndex, self->mIsPinchingDownFromCanvas);
  }
  if (!self->mDeferExtendedLayout)
    -[THChapterBrowserController p_updateAdjacentChapterViews](self, "p_updateAdjacentChapterViews");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController thumbnailSubviews](self, "thumbnailSubviews"));
  objc_msgSend(v15, "makeObjectsPerformSelector:", "updateFreeTransformUnmovingParentView");

  self->mDeferPagesScrollViewScrolls = 0;
  -[THScrollView contentOffset](self->mBackgroundScrollView, "contentOffset");
  v17 = v16;
  v18 = 0.0;
  if (v17 <= 0.0)
    -[THScrollView contentOffset](self->mBackgroundScrollView, "contentOffset", 0.0);
  v19 = -v18;
  -[THChapterBrowserController chapterWidth](self, "chapterWidth");
  if (vabdd_f64(v19, v20) >= 0.00999999978)
    -[THChapterBrowserScrubbablePageControl setAlpha:](self->mChapterPageControl, "setAlpha:", 1.0);
  if (!self->mIsPinchingDownFromCanvas)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
    objc_msgSend(v21, "chapterBrowserController:updateTitleForChapterIndex:", self, self->mChapterIndex);

  }
  -[THScrollViewWithPassthrough contentOffset](self->mPagesScrollView, "contentOffset");
  if (v23 == self->mPreservedThumbnailOffset.x && v22 == self->mPreservedThumbnailOffset.y)
    -[THChapterBrowserController p_updatePageThumbnails:](self, "p_updatePageThumbnails:", 1);
  else
    -[THChapterBrowserController p_scrollPageScrollViewToOffset:](self, "p_scrollPageScrollViewToOffset:");
  self->mCBCIsOnscreen = 1;
  self->mIgnoringThumbnailTaps = 0;
  self->mBackgroundSwipeDidInitiateScroll = 0;
  self->mBackgroundSwipeBeginningChapter = 0;
  +[CATransaction commit](CATransaction, "commit");
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
  objc_msgSend(v24, "tocIsReadyToPresent:", self);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THChapterBrowserController;
  -[THChapterBrowserController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController introMediaViewController](self, "introMediaViewController"));
  objc_msgSend(v4, "stop");

  self->mDeferPagesScrollViewScrolls = 1;
}

- (void)didReceiveMemoryWarning
{
  void *v3;
  THChapterViewController *v4;
  void *v5;
  objc_super v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THChapterBrowserController;
  -[THChapterBrowserController didReceiveMemoryWarning](&v7, "didReceiveMemoryWarning");
  if (!self->mCBCIsOnscreen)
  {
    -[THChapterViewController viewWillDisappear:](self->mChapterViewControllers[1], "viewWillDisappear:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterViewController view](self->mChapterViewControllers[1], "view"));
    objc_msgSend(v3, "removeFromSuperview");

    -[THChapterViewController viewDidDisappear:](self->mChapterViewControllers[1], "viewDidDisappear:", 0);
    -[THChapterViewController teardown](self->mChapterViewControllers[1], "teardown");
    v4 = self->mChapterViewControllers[1];
    self->mChapterViewControllers[1] = 0;

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController thumbnailSubviews](self, "thumbnailSubviews"));
    objc_msgSend(v5, "makeObjectsPerformSelector:", "teardown");
    objc_msgSend(v5, "makeObjectsPerformSelector:", "removeFromSuperview");

  }
  v6.receiver = self;
  v6.super_class = (Class)THChapterBrowserController;
  -[THChapterBrowserController didReceiveMemoryWarning](&v6, "didReceiveMemoryWarning");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THChapterBrowserController;
  -[THChapterBrowserController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  self->mCBCIsOnscreen = 0;
  self->mIsPinchingDownFromCanvas = 0;
  -[THChapterBrowserController p_removeAdjacentChapterViews](self, "p_removeAdjacentChapterViews");
}

- (BOOL)p_hasPageScrubberControl
{
  return !-[THChapterBrowserController p_verticalSpaceLimited](self, "p_verticalSpaceLimited");
}

- (void)p_updateBottomWrapperFrame
{
  unsigned int v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  CGRect v13;

  v3 = -[THChapterBrowserController p_hasPageScrubberControl](self, "p_hasPageScrubberControl");
  -[TSWPassThroughView frame](self->mBottomWrapperView, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  if (v3)
  {
    -[UIView frame](self->mChapterPageControlWrapper, "frame");
    v10 = CGRectGetMinY(v13) - v9;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController view](self, "view"));
    objc_msgSend(v11, "bounds");
    v10 = v12 - v9;

  }
  -[TSWPassThroughView setFrame:](self->mBottomWrapperView, "setFrame:", v5, v10, v7, v9);
}

- (void)p_updatePageAreaBackgroundFrame
{
  unsigned int v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double MinY;
  void *v11;
  double v12;
  CGRect v13;

  v3 = -[THChapterBrowserController p_hasPageScrubberControl](self, "p_hasPageScrubberControl");
  -[UIView frame](self->mPageAreaBackground, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  if (v3)
  {
    -[UIView frame](self->mChapterPageControlWrapper, "frame");
    MinY = CGRectGetMinY(v13);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController view](self, "view"));
    objc_msgSend(v11, "bounds");
    MinY = v12;

  }
  -[UIView setFrame:](self->mPageAreaBackground, "setFrame:", v5, v7, v9, MinY);
}

- (void)p_updatePageScrubberFrame
{
  unsigned int v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;

  v3 = -[THChapterBrowserController im_isCompactWidth](self, "im_isCompactWidth");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController view](self, "view"));
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController view](self, "view"));
  objc_msgSend(v7, "safeAreaInsets");
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController view](self, "view"));
  objc_msgSend(v10, "bounds");
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController view](self, "view"));
  objc_msgSend(v13, "safeAreaInsets");
  v14 = v6 + -48.0 - v9;
  v16 = v15 + 48.0;

  -[UIView setFrame:](self->mChapterPageControlWrapper, "setFrame:", 0.0, v14, v12, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController view](self, "view"));
  objc_msgSend(v17, "frame");
  if (v3)
    v19 = 32.0;
  else
    v19 = 77.0;
  v20 = v18 + v19 * -2.0;

  -[THChapterBrowserScrubbablePageControl setFrame:](self->mChapterPageControl, "setFrame:", v19, 0.0, v20, v16);
}

- (void)p_updatePageScrubberControlForSizeClassChange
{
  void *v3;
  void *v4;

  if (-[THChapterBrowserController p_hasPageScrubberControl](self, "p_hasPageScrubberControl"))
  {
    -[THChapterBrowserController p_updatePageScrubberFrame](self, "p_updatePageScrubberFrame");
    -[THChapterBrowserController p_updatePageControl](self, "p_updatePageControl");
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self->mChapterPageControlWrapper, "superview"));

    if (!v3)
      -[UIView addSubview:](self->mWrapperView, "addSubview:", self->mChapterPageControlWrapper);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self->mChapterPageControlWrapper, "superview"));

    if (v4)
      -[UIView removeFromSuperview](self->mChapterPageControlWrapper, "removeFromSuperview");
  }
  -[THChapterBrowserController p_updateBottomWrapperFrame](self, "p_updateBottomWrapperFrame");
  -[THChapterBrowserController p_updatePageAreaBackgroundFrame](self, "p_updatePageAreaBackgroundFrame");
}

- (void)tapToShowToolbarGesture:(id)a3
{
  if (!-[THChapterBrowserController introMediaControllerIsActive](self, "introMediaControllerIsActive", a3))
    -[THChapterBrowserController chapterViewControllerWasTapped:](self, "chapterViewControllerWasTapped:", 0);
}

- (void)_configurePagesScrollView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double MaxY;
  double Height;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double MinY;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  if (isPhone(self, a2))
  {
    if (-[THChapterBrowserController p_verticalSpaceLimited](self, "p_verticalSpaceLimited"))
    {
      -[TSWPassThroughView frame](self->mBottomWrapperView, "frame");
      v4 = v3;
      v6 = v5;
      v8 = v7;
      v37 = (id)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController view](self, "view"));
      objc_msgSend(v37, "frame");
      MaxY = CGRectGetMaxY(v44);
      -[TSWPassThroughView frame](self->mBottomWrapperView, "frame");
      Height = CGRectGetHeight(v45);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController view](self, "view"));
      objc_msgSend(v11, "safeAreaInsets");
      v13 = MaxY - Height + -8.0 - v12;

      -[TSWPassThroughView setFrame:](self->mBottomWrapperView, "setFrame:", v4, v13, v6, v8);
      v38 = (id)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController thumbnailTrackBackgroundView](self, "thumbnailTrackBackgroundView"));
      objc_msgSend(v38, "frame");
      v15 = v14;
      v17 = v16;
      v19 = v18;

      v20 = self->_firstThumbSize.height;
      v39 = (id)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController view](self, "view"));
      objc_msgSend(v39, "safeAreaInsets");
      v22 = v21;

      v40 = (id)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController view](self, "view"));
      objc_msgSend(v40, "bounds");
      v23 = CGRectGetMaxY(v46);
      v24 = v20 + 16.0 + v22;
      v47.origin.x = v15;
      v47.origin.y = v17;
      v47.size.width = v19;
      v47.size.height = v24;
      v25 = v23 - CGRectGetHeight(v47);

      v41 = (id)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController thumbnailTrackBackgroundView](self, "thumbnailTrackBackgroundView"));
      objc_msgSend(v41, "setFrame:", v15, v25, v19, v24);

      v42 = (id)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController thumbnailTrackBackgroundView](self, "thumbnailTrackBackgroundView"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "layer"));
      LODWORD(v27) = 1.0;
      objc_msgSend(v26, "setOpacity:", v27);

    }
    else
    {
      v43 = (id)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController thumbnailTrackBackgroundView](self, "thumbnailTrackBackgroundView"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "layer"));
      LODWORD(v29) = 0;
      objc_msgSend(v28, "setOpacity:", v29);

      -[TSWPassThroughView frame](self->mBottomWrapperView, "frame");
      v31 = v30;
      v33 = v32;
      v35 = v34;
      -[UIView frame](self->mChapterPageControlWrapper, "frame");
      MinY = CGRectGetMinY(v48);
      -[TSWPassThroughView frame](self->mBottomWrapperView, "frame");
      -[TSWPassThroughView setFrame:](self->mBottomWrapperView, "setFrame:", v31, MinY - CGRectGetHeight(v49), v33, v35);
    }
  }
}

- (void)viewDidLoad
{
  void *v2;
  void *v3;
  void *v5;
  UITapGestureRecognizer *v6;
  UITapGestureRecognizer *showToolbarRecognizer;
  double x;
  double y;
  double width;
  double height;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  double v18;
  double v19;
  double v20;
  UIView *v21;
  UIView *mIntroMediaContainerView;
  void *v23;
  THChapterBrowserScrubbablePageControl *v24;
  THChapterBrowserScrubbablePageControl *mChapterPageControl;
  void *v26;
  void *v27;
  id v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  UIView *v34;
  UIView *mChapterPageControlWrapper;
  void *v36;
  id v37;
  uint64_t v38;
  UIView *v39;
  UIView *thumbnailTrackBackgroundView;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  THScrollView *mBackgroundScrollView;
  void *v49;
  objc_super v50;
  CGRect v51;
  CGRect v52;

  v50.receiver = self;
  v50.super_class = (Class)THChapterBrowserController;
  -[THChapterBrowserController viewDidLoad](&v50, "viewDidLoad");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController view](self, "view"));
  -[THChapterBrowserController setShowToolbarRecognizer:](self, "setShowToolbarRecognizer:", 0);
  v6 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "tapToShowToolbarGesture:");
  showToolbarRecognizer = self->_showToolbarRecognizer;
  self->_showToolbarRecognizer = v6;

  -[UITapGestureRecognizer setCancelsTouchesInView:](self->_showToolbarRecognizer, "setCancelsTouchesInView:", 1);
  -[UITapGestureRecognizer setDelegate:](self->_showToolbarRecognizer, "setDelegate:", self);
  objc_msgSend(v5, "addGestureRecognizer:", self->_showToolbarRecognizer);
  objc_msgSend(v5, "setAutoresizingMask:", 18);
  objc_msgSend(v5, "bounds");
  x = v51.origin.x;
  y = v51.origin.y;
  width = v51.size.width;
  height = v51.size.height;
  v12 = CGRectGetHeight(v51);
  v52.origin.x = x;
  v52.origin.y = y;
  v52.size.width = width;
  v52.size.height = height;
  v13 = CGRectGetWidth(v52);
  -[THChapterBrowserController setChapterWidth:](self, "setChapterWidth:");
  if (-[THChapterBrowserController p_isTOCLandscape](self, "p_isTOCLandscape"))
    v14 = 141.0;
  else
    v14 = 189.0;
  -[TSWPassThroughView setFrame:](self->mBottomWrapperView, "setFrame:", 0.0, v12 - v14, v13, v14);
  -[THScrollViewWithPassthrough setFrame:](self->mPagesScrollView, "setFrame:", 0.0, 0.0, v13, v14);
  -[UIView setFrame:](self->mWrapperView, "setFrame:", x, y, width, height);
  -[UIView setFrame:](self->mBackgroundsView, "setFrame:", -v13, 0.0, v13 * 3.0, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[THScrollViewWithPassthrough setBackgroundColor:](self->mPagesScrollView, "setBackgroundColor:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController pageAreaBackgroundColor](self, "pageAreaBackgroundColor"));
  -[UIView setBackgroundColor:](self->mPageAreaBackground, "setBackgroundColor:", v16);

  -[THScrollViewWithPassthrough setContentInsetAdjustmentBehavior:](self->mPagesScrollView, "setContentInsetAdjustmentBehavior:", 1);
  -[THScrollView setPreventBounceAnimation:](self->mBackgroundScrollView, "setPreventBounceAnimation:", 1);
  -[THScrollView setDelaysContentTouches:](self->mBackgroundScrollView, "setDelaysContentTouches:", 0);
  -[THScrollView setContentInsetAdjustmentBehavior:](self->mBackgroundScrollView, "setContentInsetAdjustmentBehavior:", 2);
  -[THChapterBrowserController showBackground](self, "showBackground");
  -[THChapterBrowserController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", 15);
  -[THChapterBrowserController setExtendedLayoutIncludesOpaqueBars:](self, "setExtendedLayoutIncludesOpaqueBars:", 1);
  self->mDeferExtendedLayout = 0;
  v17 = objc_alloc((Class)UIView);
  -[THChapterBrowserController chapterWidth](self, "chapterWidth");
  v19 = v18;
  -[THChapterBrowserController chapterWidth](self, "chapterWidth");
  v21 = (UIView *)objc_msgSend(v17, "initWithFrame:", -v19, 0.0, v20, v12);
  mIntroMediaContainerView = self->mIntroMediaContainerView;
  self->mIntroMediaContainerView = v21;

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  -[UIView setBackgroundColor:](self->mIntroMediaContainerView, "setBackgroundColor:", v23);

  -[UIView setClipsToBounds:](self->mIntroMediaContainerView, "setClipsToBounds:", 1);
  v24 = -[THChapterBrowserScrubbablePageControl initWithFrame:]([THChapterBrowserScrubbablePageControl alloc], "initWithFrame:", 77.0, 0.0, v13 + -154.0, 48.0);
  mChapterPageControl = self->mChapterPageControl;
  self->mChapterPageControl = v24;

  -[THChapterBrowserScrubbablePageControl setAutoresizingMask:](self->mChapterPageControl, "setAutoresizingMask:", 0);
  -[THChapterBrowserScrubbablePageControl addTarget:action:forControlEvents:](self->mChapterPageControl, "addTarget:action:forControlEvents:", self, "draggingStartedFromPageControl:", 1);
  -[THChapterBrowserScrubbablePageControl addTarget:action:forControlEvents:](self->mChapterPageControl, "addTarget:action:forControlEvents:", self, "takeDragInsideFromPageControl:", 4);
  -[THChapterBrowserScrubbablePageControl addTarget:action:forControlEvents:](self->mChapterPageControl, "addTarget:action:forControlEvents:", self, "takeTouchUpFromPageControl:", 64);
  -[THChapterBrowserScrubbablePageControl addTarget:action:forControlEvents:](self->mChapterPageControl, "addTarget:action:forControlEvents:", self, "takeTouchUpFromPageControl:", 128);
  -[THChapterBrowserScrubbablePageControl addTarget:action:forControlEvents:](self->mChapterPageControl, "addTarget:action:forControlEvents:", self, "takeChapterIndexFrom:", 4096);
  -[THChapterBrowserScrubbablePageControl setExclusiveTouch:](self->mChapterPageControl, "setExclusiveTouch:", 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "introMediaViewControllerForChapterBrowserController:", self));
  if (v27)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "introMediaViewControllerForChapterBrowserController:", self));
    v28 = objc_msgSend(v3, "isMovie");
  }
  else
  {
    v28 = 0;
  }
  -[THChapterBrowserScrubbablePageControl setFirstDotSpecialRendering:](self->mChapterPageControl, "setFirstDotSpecialRendering:", v28);
  if (v27)
  {

  }
  -[THChapterBrowserScrubbablePageControl frame](self->mChapterPageControl, "frame");
  v30 = v29;
  objc_msgSend(v5, "safeAreaInsets");
  v32 = v31;
  objc_msgSend(v5, "safeAreaInsets");
  v34 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, v12 + -48.0 - v32, v13, v30 + v33);
  mChapterPageControlWrapper = self->mChapterPageControlWrapper;
  self->mChapterPageControlWrapper = v34;

  v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  -[UIView setBackgroundColor:](self->mChapterPageControlWrapper, "setBackgroundColor:", v36);

  v37 = -[UIView addSubview:](self->mChapterPageControlWrapper, "addSubview:", self->mChapterPageControl);
  if (isPhone(v37, v38))
  {
    v39 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    thumbnailTrackBackgroundView = self->_thumbnailTrackBackgroundView;
    self->_thumbnailTrackBackgroundView = v39;

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "TOCViewControllerToolbarBackgroundColor:", self));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController thumbnailTrackBackgroundView](self, "thumbnailTrackBackgroundView"));
    objc_msgSend(v43, "setBackgroundColor:", v42);

    v44 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController thumbnailTrackBackgroundView](self, "thumbnailTrackBackgroundView"));
    objc_msgSend(v44, "setAutoresizingMask:", 10);

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController thumbnailTrackBackgroundView](self, "thumbnailTrackBackgroundView"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "layer"));
    LODWORD(v47) = 1.0;
    objc_msgSend(v46, "setOpacity:", v47);

    mBackgroundScrollView = self->mBackgroundScrollView;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController thumbnailTrackBackgroundView](self, "thumbnailTrackBackgroundView"));
    -[THScrollView addSubview:](mBackgroundScrollView, "addSubview:", v49);

  }
}

- (BOOL)prefersStatusBarHidden
{
  unsigned __int8 v3;

  v3 = -[THChapterBrowserController introMediaControllerIsActive](self, "introMediaControllerIsActive");
  return !-[THChapterBrowserController paginatedTOCShowsStatusBar](self, "paginatedTOCShowsStatusBar") | v3;
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  void *v3;

  if (-[THChapterBrowserController p_showingIntroMedia](self, "p_showingIntroMedia"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController introMediaViewController](self, "introMediaViewController"));
  else
    v3 = 0;
  return v3;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
  v3 = objc_msgSend(v2, "isToolbarHidden");

  return v3;
}

- (void)relinquishIntroMediaViewController
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[THChapterBrowserController setIntroMediaViewController:](self, "setIntroMediaViewController:", 0);
  self->mDeferBackgroundScrollViewScrolls = 1;
  -[THScrollView contentOffset](self->mBackgroundScrollView, "contentOffset");
  v4 = v3;
  v6 = v5;
  -[THScrollView setContentInset:](self->mBackgroundScrollView, "setContentInset:", 0.0, 0.0, 0.0, 0.0);
  -[THScrollView setContentOffset:](self->mBackgroundScrollView, "setContentOffset:", v4, v6);
  self->mDeferBackgroundScrollViewScrolls = 0;
}

- (void)setIntroMediaViewController:(id)a3
{
  THiOSIntroMediaViewController *v5;
  THiOSIntroMediaViewController **p_mIntroMediaViewController;
  THiOSIntroMediaViewController *mIntroMediaViewController;
  THChapterBrowserController *v8;
  THiOSIntroMediaViewController *v9;

  v5 = (THiOSIntroMediaViewController *)a3;
  p_mIntroMediaViewController = &self->mIntroMediaViewController;
  mIntroMediaViewController = self->mIntroMediaViewController;
  v9 = v5;
  if (mIntroMediaViewController != v5)
  {
    v8 = (THChapterBrowserController *)objc_claimAutoreleasedReturnValue(-[THiOSIntroMediaViewController delegate](mIntroMediaViewController, "delegate"));

    if (v8 == self)
      -[THiOSIntroMediaViewController setDelegate:](*p_mIntroMediaViewController, "setDelegate:", 0);
    objc_storeStrong((id *)&self->mIntroMediaViewController, a3);
    -[THiOSIntroMediaViewController setDelegate:](*p_mIntroMediaViewController, "setDelegate:", self);
  }

}

- (void)setIntroMediaViewController:(id)a3 showIt:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
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
  void *v22;
  void *v23;
  void *v24;
  UIView *mIntroMediaContainerView;
  void *v26;
  void *v27;
  double v28;
  id v29;

  v4 = a4;
  v29 = a3;
  if (!v29)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterBrowserController setIntroMediaViewController:showIt:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterBrowserController.mm"));
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 719, CFSTR("use relinquishIntroMediaViewController instead"));

  }
  -[THChapterBrowserController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[THScrollView addSubview:](self->mBackgroundScrollView, "addSubview:", self->mIntroMediaContainerView);
  -[THChapterBrowserController setIntroMediaViewController:](self, "setIntroMediaViewController:", v29);
  self->mDeferBackgroundScrollViewScrolls = 1;
  -[THScrollView contentOffset](self->mBackgroundScrollView, "contentOffset");
  v10 = v9;
  v12 = v11;
  -[THChapterBrowserController chapterWidth](self, "chapterWidth");
  -[THScrollView setContentInset:](self->mBackgroundScrollView, "setContentInset:", 0.0, v13, 0.0, 0.0);
  -[THScrollView setContentOffset:](self->mBackgroundScrollView, "setContentOffset:", v10, v12);
  self->mDeferBackgroundScrollViewScrolls = 0;
  -[THChapterBrowserController setHasIntroPage:](self, "setHasIntroPage:", 1);
  if (v4 || -[THChapterBrowserController chapterIndex](self, "chapterIndex") <= 1)
  {
    -[UIView bounds](self->mIntroMediaContainerView, "bounds");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController introMediaViewController](self, "introMediaViewController"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "view"));
    objc_msgSend(v23, "setFrame:", v15, v17, v19, v21);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController introMediaViewController](self, "introMediaViewController"));
    -[THChapterBrowserController addChildViewController:](self, "addChildViewController:", v24);

    mIntroMediaContainerView = self->mIntroMediaContainerView;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController introMediaViewController](self, "introMediaViewController"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "view"));
    -[UIView addSubview:](mIntroMediaContainerView, "addSubview:", v27);

    if (v4)
    {
      -[THChapterBrowserController chapterWidth](self, "chapterWidth");
      -[THScrollView setContentOffset:](self->mBackgroundScrollView, "setContentOffset:", -v28, 0.0);
      -[UIView setAlpha:](self->mChapterPageControlWrapper, "setAlpha:", 0.0);
    }
  }

}

- (void)willTransitionFromChapterIndex:(unint64_t)a3
{
  double v5;

  self->mIsPinchingDownFromCanvas = 1;
  self->mDeferExtendedLayout = 1;
  if (self->mChapterIndex != a3)
  {
    -[THChapterBrowserController setChapterIndex:](self, "setChapterIndex:", a3);
    -[THChapterBrowserController p_setupChapterViewControllerAtIndex:withChapterIndex:allowThumbnail:](self, "p_setupChapterViewControllerAtIndex:withChapterIndex:allowThumbnail:", 1, a3, 1);
    -[THChapterBrowserController p_resetPagesScrollViewAndCapThumbCount:firstVisibleRelativePage:resetContentOffset:](self, "p_resetPagesScrollViewAndCapThumbCount:firstVisibleRelativePage:resetContentOffset:", 0, 0, 1);
  }
  -[THChapterBrowserController chapterWidth](self, "chapterWidth");
  -[THScrollView setContentOffset:](self->mBackgroundScrollView, "setContentOffset:", v5 * (double)a3, 0.0);
}

- (void)didTransitionFromCanvas
{
  void *v3;
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_968F8;
  block[3] = &unk_428C00;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  self->mIsPinchingDownFromCanvas = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
  objc_msgSend(v3, "chapterBrowserController:updateTitleForChapterIndex:", self, self->mChapterIndex);

}

- (id)thumbnailImageForPageAtIndex:(unint64_t)a3 chapterIndex:(unint64_t)a4 tinyThumb:(BOOL)a5
{
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CGImage *v15;

  v8 = a5 && TSUScreenScale(self, a2) <= 1.0;
  if (self->mChapterIndex == a4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "chapterBrowserController:tocTileModelAtIndex:", self, a4));

    if (v8)
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tinyThumbs"));
    else
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "largerThumbs"));
    v13 = v11;
    if ((unint64_t)objc_msgSend(v11, "count") <= a3)
    {
      v14 = 0;
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", a3));
      if (v14)
      {
        v15 = CGImageRetain((CGImageRef)+[TSDBitmapImageProvider CGImageForImageData:](TSDBitmapImageProvider, "CGImageForImageData:", v14));
        if (v15)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", v15));
          CGImageRelease(v15);
LABEL_15:

          return v12;
        }
      }
    }
    v12 = 0;
    goto LABEL_15;
  }
  v12 = 0;
  return v12;
}

- (void)hidePageThumbnailAtIndex:(unint64_t)a3
{
  -[THChapterBrowserController hidePageThumbnailAtIndex:chapterIndex:scrollIfNecessary:](self, "hidePageThumbnailAtIndex:chapterIndex:scrollIfNecessary:", a3, self->mChapterIndex, 0);
}

- (CGPoint)p_offsetForThumbnailAtIndex:(unint64_t)a3 chapterIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  BOOL v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  unint64_t v25;
  double v26;
  float v27;
  float v28;
  double MinX;
  float v30;
  double v31;
  float v32;
  double v33;
  double MaxX;
  double v35;
  double v36;
  float v37;
  double v38;
  double v39;
  double v40;
  float v41;
  float v42;
  CGPoint result;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  if (self->mChapterIndex != a4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterBrowserController p_offsetForThumbnailAtIndex:chapterIndex:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterBrowserController.mm"));
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, v9, 816, CFSTR("Current chapter index %lu doesn't match page chapter index:%lu"), self->mChapterIndex, a4);

  }
  -[THChapterBrowserController frameForPageThumbAtIndex:chapterIndex:](self, "frameForPageThumbAtIndex:chapterIndex:", a3, a4);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[THScrollViewWithPassthrough bounds](self->mPagesScrollView, "bounds");
  v51.origin.x = v11;
  v51.origin.y = v13;
  v51.size.width = v15;
  v51.size.height = v17;
  v18 = CGRectContainsRect(v44, v51);
  -[THChapterBrowserController thumbSize](self, "thumbSize");
  v20 = v19;
  -[THChapterBrowserController firstThumbOverlap](self, "firstThumbOverlap");
  v22 = v21;
  -[THChapterBrowserController firstThumbSize](self, "firstThumbSize");
  v24 = v23;
  v25 = self->mChapterInfo[1].numberOfPages - 1;
  -[THScrollViewWithPassthrough frame](self->mPagesScrollView, "frame");
  v27 = v26;
  v28 = v24 + (double)v25 * v20;
  if (v28 < v27)
  {
LABEL_4:
    -[THChapterBrowserController frameForPageThumbAtIndex:chapterIndex:](self, "frameForPageThumbAtIndex:chapterIndex:", 0, a4);
    MinX = CGRectGetMinX(v45);
LABEL_16:
    v33 = 0.0;
    goto LABEL_17;
  }
  v30 = v15 * (double)(v25 - a3);
  v31 = v22 + (double)a3 * v15;
  v32 = v31;
  if (!v18)
  {
    v42 = v31;
    v37 = v27 * 0.5 - v15 * 0.5;
    if (v30 > v37)
    {
      v47.origin.x = v11;
      v47.origin.y = v13;
      v47.size.width = v15;
      v47.size.height = v17;
      MinX = CGRectGetMinX(v47);
      if (v42 > v37)
        MinX = v15 * 0.5 + MinX + (float)(v27 * -0.5);
      goto LABEL_16;
    }
    v48.origin.x = v11;
    v48.origin.y = v13;
    v48.size.width = v15;
    v48.size.height = v17;
    v38 = CGRectGetMinX(v48);
    -[THScrollViewWithPassthrough frame](self->mPagesScrollView, "frame");
    v40 = v39;
    v49.origin.x = v11;
    v49.origin.y = v13;
    v49.size.width = v15;
    v49.size.height = v17;
    if (CGRectGetMinX(v49) < v42)
      goto LABEL_4;
    v36 = v15 + v38 - v40;
LABEL_15:
    v41 = v36;
    MinX = v41;
    goto LABEL_16;
  }
  -[THScrollViewWithPassthrough contentOffset](self->mPagesScrollView, "contentOffset");
  if (v30 == 0.0)
  {
    v46.origin.x = v11;
    v46.origin.y = v13;
    v46.size.width = v15;
    v46.size.height = v17;
    MaxX = CGRectGetMaxX(v46);
    -[THScrollViewWithPassthrough frame](self->mPagesScrollView, "frame");
    v36 = MaxX - v35;
    goto LABEL_15;
  }
  if (v32 == 0.0)
  {
    v50.origin.x = v11;
    v50.origin.y = v13;
    v50.size.width = v15;
    v50.size.height = v17;
    v36 = CGRectGetMinX(v50);
    goto LABEL_15;
  }
LABEL_17:
  result.y = v33;
  result.x = MinX;
  return result;
}

- (void)prepareToScrollToThumbnailAtIndex:(unint64_t)a3 chapterIndex:(unint64_t)a4
{
  CGFloat v5;
  CGFloat v6;

  -[THChapterBrowserController p_offsetForThumbnailAtIndex:chapterIndex:](self, "p_offsetForThumbnailAtIndex:chapterIndex:", a3, a4);
  self->mPreservedThumbnailOffset.x = v5;
  self->mPreservedThumbnailOffset.y = v6;
}

- (void)hidePageThumbnailAtIndex:(unint64_t)a3 chapterIndex:(unint64_t)a4 scrollIfNecessary:(BOOL)a5
{
  _BOOL4 v5;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;

  v5 = a5;
  if (self->mChapterIndex != a4)
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterBrowserController hidePageThumbnailAtIndex:chapterIndex:scrollIfNecessary:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterBrowserController.mm"));
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 922, CFSTR("Current chapter index %lu doesn't match page chapter index:%lu"), self->mChapterIndex, a4);

  }
  if (v5)
    -[THChapterBrowserController prepareToScrollToThumbnailAtIndex:chapterIndex:](self, "prepareToScrollToThumbnailAtIndex:chapterIndex:", a3, a4);
  v15 = (id)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController thumbnailsHiddenForPinch](self, "thumbnailsHiddenForPinch"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  objc_msgSend(v15, "addObject:", v11);

  v16 = (id)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController p_pageThumbnailViewForPageIndex:](self, "p_pageThumbnailViewForPageIndex:", a3));
  if (v16)
    objc_msgSend(v16, "setHidden:", 1);
  if (a3 >= 2)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController p_pageThumbnailViewForPageIndex:](self, "p_pageThumbnailViewForPageIndex:", a3 - 1));
    objc_msgSend(v12, "setHasRightBorder:", 1);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController p_pageThumbnailViewForPageIndex:](self, "p_pageThumbnailViewForPageIndex:", a3 + 1));
  objc_msgSend(v13, "setHasLeftBorder:", 1);

}

- (void)showPageThumbnailAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController thumbnailsHiddenForPinch](self, "thumbnailsHiddenForPinch"));
  objc_msgSend(v5, "removeAllObjects");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController p_pageThumbnailViewForPageIndex:](self, "p_pageThumbnailViewForPageIndex:", a3));
  objc_msgSend(v6, "setHidden:", 0);
  objc_msgSend(v6, "setBorderVisible:", 0);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_97144;
  v10[3] = &unk_428C00;
  v7 = v6;
  v11 = v7;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v10, 0.15);
  if (a3 >= 2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController p_pageThumbnailViewForPageIndex:](self, "p_pageThumbnailViewForPageIndex:", a3 - 1));
    objc_msgSend(v8, "setHasRightBorder:", 0);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController p_pageThumbnailViewForPageIndex:](self, "p_pageThumbnailViewForPageIndex:", a3 + 1));
  objc_msgSend(v9, "setHasLeftBorder:", 0);

}

- (void)scrollToThumbnailAtIndex:(unint64_t)a3
{
  -[THChapterBrowserController p_scrollToThumbnailAtIndex:animated:](self, "p_scrollToThumbnailAtIndex:animated:", a3, 0);
}

- (void)p_scrollToThumbnailAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  -[THChapterBrowserController p_offsetForThumbnailAtIndex:chapterIndex:](self, "p_offsetForThumbnailAtIndex:chapterIndex:", a3, self->mChapterIndex);
  -[THScrollViewWithPassthrough setContentOffset:animated:](self->mPagesScrollView, "setContentOffset:animated:", v4);
  if (!v4)
    -[THChapterBrowserController p_updatePageThumbnails:](self, "p_updatePageThumbnails:", 1);
}

- (void)p_scrollPageScrollViewToOffset:(CGPoint)a3
{
  if (a3.x > 0.0)
    -[THScrollViewWithPassthrough setContentOffset:animated:](self->mPagesScrollView, "setContentOffset:animated:", 0);
}

- (CGRect)rectForPageThumbnailAtIndex:(unint64_t)a3 inLayer:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[THChapterBrowserController rectForPageThumbnailAtIndex:chapterIndex:inLayer:](self, "rectForPageThumbnailAtIndex:chapterIndex:inLayer:", a3, self->mChapterIndex, a4);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)rectForPageThumbnailAtIndex:(unint64_t)a3 chapterIndex:(unint64_t)a4 inLayer:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  CGFloat y;
  double v23;
  CGFloat width;
  double v25;
  CGFloat height;
  double x;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGRect v34;
  CGRect result;
  CGRect v36;

  v7 = a5;
  -[THChapterBrowserController p_updatePageScrubberControlForSizeClassChange](self, "p_updatePageScrubberControlForSizeClassChange");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController p_pageThumbnailViewForPageIndex:](self, "p_pageThumbnailViewForPageIndex:", a3));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController p_pageThumbnailViewForPageIndex:](self, "p_pageThumbnailViewForPageIndex:", a3));
    objc_msgSend(v9, "frame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[THScrollViewWithPassthrough layer](self->mPagesScrollView, "layer"));
    objc_msgSend(v7, "convertRect:fromLayer:", v18, v11, v13, v15, v17);
    v20 = v19;
    y = v21;
    width = v23;
    height = v25;

    objc_msgSend(v7, "bounds");
    v36.origin.x = v20;
    v36.origin.y = y;
    v36.size.width = width;
    v36.size.height = height;
    if (!CGRectContainsRect(v34, v36))
    {
      -[THScrollViewWithPassthrough contentOffset](self->mPagesScrollView, "contentOffset");
      x = self->mPreservedThumbnailOffset.x;
      if (vabdd_f64(v28, x) > 1.0)
      {
        -[THScrollViewWithPassthrough contentOffset](self->mPagesScrollView, "contentOffset");
        v20 = v20 - (x - v29);
      }
    }
  }
  else
  {
    v20 = CGRectNull.origin.x;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
  }

  v30 = v20;
  v31 = y;
  v32 = width;
  v33 = height;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (unint64_t)p_firstVisibleThumbnailPageIndexInCurrentChapter
{
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  CGRect v27;
  CGRect v28;

  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController thumbnailSubviews](self, "thumbnailSubviews", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "chapterIndex") == (id)self->mChapterIndex)
        {
          -[THScrollViewWithPassthrough bounds](self->mPagesScrollView, "bounds");
          v9 = v8;
          v11 = v10;
          v13 = v12;
          v15 = v14;
          objc_msgSend(v7, "frame");
          v28.origin.x = v16;
          v28.origin.y = v17;
          v28.size.width = v18;
          v28.size.height = v19;
          v27.origin.x = v9;
          v27.origin.y = v11;
          v27.size.width = v13;
          v27.size.height = v15;
          if (CGRectIntersectsRect(v27, v28))
          {
            v20 = objc_msgSend(v7, "pageIndex");
            goto LABEL_12;
          }
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v4)
        continue;
      break;
    }
  }
  v20 = 0;
LABEL_12:

  return (unint64_t)v20;
}

- (id)visibleThumbnailIndexes
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  CGRect v27;
  CGRect v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController thumbnailSubviews](self, "thumbnailSubviews", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v23;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v7);
        -[THScrollViewWithPassthrough bounds](self->mPagesScrollView, "bounds");
        v10 = v9;
        v12 = v11;
        v14 = v13;
        v16 = v15;
        objc_msgSend(v8, "frame");
        v28.origin.x = v17;
        v28.origin.y = v18;
        v28.size.width = v19;
        v28.size.height = v20;
        v27.origin.x = v10;
        v27.origin.y = v12;
        v27.size.width = v14;
        v27.size.height = v16;
        if (CGRectIntersectsRect(v27, v28))
          objc_msgSend(v3, "addIndex:", objc_msgSend(v8, "pageIndex"));
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v5);
  }

  return v3;
}

- (void)takeChapterIndexFrom:(id)a3
{
  void *v4;
  char *v5;
  char *v6;
  unint64_t v7;
  double v8;
  double v9;
  unsigned int v10;
  double v11;
  double v12;
  void *v13;
  THChapterBrowserScrubbablePageControl *v14;

  v14 = (THChapterBrowserScrubbablePageControl *)a3;
  if (self->mChapterPageControl == v14)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
    objc_msgSend(v4, "cancelPreloadOfContentNodesForChapterBrowserController:", self);

    -[THChapterBrowserController p_cancelAllContentNodeLoading](self, "p_cancelAllContentNodeLoading");
    -[THChapterBrowserController setPreviousChapterIndex:](self, "setPreviousChapterIndex:", self->mChapterIndex);
    self->mChapterIndex = 0x7FFFFFFFFFFFFFFFLL;
    if (-[THChapterBrowserController hasIntroPage](self, "hasIntroPage"))
    {
      if (-[THChapterBrowserScrubbablePageControl currentPage](v14, "currentPage"))
        v5 = -[THChapterBrowserScrubbablePageControl currentPage](v14, "currentPage");
      else
        v5 = (_BYTE *)(&dword_0 + 1);
      v6 = v5 - 1;
    }
    else
    {
      v6 = -[THChapterBrowserScrubbablePageControl currentPage](v14, "currentPage");
    }
    +[CATransaction begin](CATransaction, "begin");
    -[THChapterBrowserController p_setChapterIndex:forScrub:stillScrolling:](self, "p_setChapterIndex:forScrub:stillScrolling:", v6, 1, 0);
    v7 = -[THChapterBrowserScrubbablePageControl currentPage](v14, "currentPage");
    -[THChapterBrowserController chapterWidth](self, "chapterWidth");
    v9 = v8;
    v10 = -[THChapterBrowserController hasIntroPage](self, "hasIntroPage");
    v11 = 0.0;
    if (v10)
      -[THChapterBrowserController chapterWidth](self, "chapterWidth", 0.0);
    -[THScrollView setContentOffset:](self->mBackgroundScrollView, "setContentOffset:", -(v11 - (double)v7 * v9), 0.0);
    +[CATransaction commit](CATransaction, "commit");
    if (self->mDraggingInScrubber)
    {
      -[THScrollView contentOffset](self->mBackgroundScrollView, "contentOffset");
      if (v12 < 0.0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController introMediaViewController](self, "introMediaViewController"));
        objc_msgSend(v13, "ensureReadyToPlay");

      }
    }
    else
    {
      -[THChapterBrowserController p_startIntroMediaIfNecessary](self, "p_startIntroMediaIfNecessary");
    }
  }

}

- (void)takeTouchUpFromPageControl:(id)a3
{
  UIScrollView **p_mUpdatingScrollView;
  UIScrollView *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  unsigned int v11;
  UIView *mChapterPageControlWrapper;
  _QWORD v13[5];

  p_mUpdatingScrollView = &self->mUpdatingScrollView;
  objc_storeStrong((id *)&self->mUpdatingScrollView, self->mBackgroundScrollView);
  self->mDraggingInScrubber = 0;
  -[THChapterBrowserController p_resetPagesScrollViewAndCapThumbCount:firstVisibleRelativePage:resetContentOffset:](self, "p_resetPagesScrollViewAndCapThumbCount:firstVisibleRelativePage:resetContentOffset:", 0, 0, 1);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_97A30;
  v13[3] = &unk_428C00;
  v13[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v13, 0.25);
  v5 = *p_mUpdatingScrollView;
  *p_mUpdatingScrollView = 0;

  -[THChapterBrowserController p_updateAdjacentChapterViews](self, "p_updateAdjacentChapterViews");
  -[THChapterBrowserController p_preloadContentNodesForVisibleThumbnails](self, "p_preloadContentNodesForVisibleThumbnails");
  -[THScrollView contentOffset](self->mBackgroundScrollView, "contentOffset");
  v7 = v6;
  -[THChapterBrowserController chapterWidth](self, "chapterWidth");
  if (v7 == -v8)
  {
    -[THChapterBrowserController p_startIntroMediaIfNecessary](self, "p_startIntroMediaIfNecessary");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "introMediaViewControllerForChapterBrowserController:", self));
    v11 = objc_msgSend(v10, "isMovie");

    mChapterPageControlWrapper = self->mChapterPageControlWrapper;
    if (v11)
    {
      -[UIView setAlpha:](mChapterPageControlWrapper, "setAlpha:", 0.0);
    }
    else
    {
      -[UIView setAlpha:](mChapterPageControlWrapper, "setAlpha:", 1.0);
      -[THChapterBrowserController refreshStatusBarAppearance](self, "refreshStatusBarAppearance");
    }
  }
}

- (void)p_cancelAllContentNodeLoading
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController contentNodesAskedToLoad](self, "contentNodesAskedToLoad", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v6), "cancelLoading");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController contentNodesAskedToLoad](self, "contentNodesAskedToLoad"));
  objc_msgSend(v7, "removeAllObjects");

}

- (void)draggingStartedFromPageControl:(id)a3
{
  id v3;

  self->mDraggingInScrubber = 1;
  v3 = (id)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController introMediaViewController](self, "introMediaViewController", a3));
  objc_msgSend(v3, "prepareControlsForTOC");

}

- (void)takeDragInsideFromPageControl:(id)a3
{
  void *v4;
  double v5;
  _QWORD v6[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "cancelPreloadOfContentNodesForChapterBrowserController:", self);

  -[THScrollViewWithPassthrough alpha](self->mPagesScrollView, "alpha");
  if (v5 == 1.0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_97C7C;
    v6[3] = &unk_428C00;
    v6[4] = self;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v6, 0.25);
  }
}

- (void)hideBackground
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController view](self, "view"));
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (void)showBackground
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController view](self, "view"));
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (void)_updateContentOffsets
{
  double v3;
  double v4;
  double v5;
  THScrollViewWithPassthrough *mPagesScrollView;
  CGFloat v7;
  THScrollViewWithPassthrough *v8;
  CGAffineTransform v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  CGAffineTransform v13;

  -[THScrollView contentOffset](self->mBackgroundScrollView, "contentOffset");
  v3 = 0.0;
  if (v4 <= 0.0)
  {
    -[THScrollView contentOffset](self->mBackgroundScrollView, "contentOffset");
    v3 = v5;
  }
  memset(&v13, 0, sizeof(v13));
  mPagesScrollView = self->mPagesScrollView;
  if (mPagesScrollView)
  {
    -[THScrollViewWithPassthrough transform](mPagesScrollView, "transform");
    v7 = *((double *)&v12 + 1);
    v8 = self->mPagesScrollView;
  }
  else
  {
    v8 = 0;
    v11 = 0uLL;
    v12 = 0uLL;
    v7 = 0.0;
    v10 = 0uLL;
  }
  CGAffineTransformMakeTranslation(&v13, -v3, v7);
  v9 = v13;
  -[THScrollViewWithPassthrough setTransform:](v8, "setTransform:", &v9);
  -[TSWPassThroughView setUserInteractionEnabled:](self->mBottomWrapperView, "setUserInteractionEnabled:", v3 >= 0.0);
}

- (void)p_addIntroMediaView
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
  UIView *mIntroMediaContainerView;
  void *v14;
  id v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController introMediaViewController](self, "introMediaViewController"));

  if (v3)
  {
    -[UIView bounds](self->mIntroMediaContainerView, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v15 = (id)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController introMediaViewController](self, "introMediaViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "view"));
    objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

    mIntroMediaContainerView = self->mIntroMediaContainerView;
    v16 = (id)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController introMediaViewController](self, "introMediaViewController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "view"));
    -[UIView addSubview:](mIntroMediaContainerView, "addSubview:", v14);

  }
}

- (void)p_removeIntroMediaView
{
  unsigned int v3;
  void *v4;
  id v5;
  id v6;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController introMediaViewController](self, "introMediaViewController"));
  v3 = objc_msgSend(v5, "isViewLoaded");

  if (v3)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController introMediaViewController](self, "introMediaViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    objc_msgSend(v4, "removeFromSuperview");

  }
}

- (void)introMediaControllerMoviePlayerWillShowControls
{
  -[UIView setAlpha:](self->mChapterPageControlWrapper, "setAlpha:", 1.0);
}

- (BOOL)p_showingIntroMedia
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[THScrollView contentOffset](self->mBackgroundScrollView, "contentOffset");
  v4 = v3;
  v5 = 0.0;
  if (v4 <= 0.0)
    -[THScrollView contentOffset](self->mBackgroundScrollView, "contentOffset", 0.0);
  v6 = -v5;
  -[THChapterBrowserController chapterWidth](self, "chapterWidth");
  return vabdd_f64(v6, v7) < 0.00999999978;
}

- (void)introMediaControllerMoviePlayerWillHideControls
{
  if (-[THChapterBrowserController p_showingIntroMedia](self, "p_showingIntroMedia"))
    -[UIView setAlpha:](self->mChapterPageControlWrapper, "setAlpha:", 0.0);
}

- (BOOL)closeButtonIsNeeded
{
  return 0;
}

- (BOOL)statusBarShouldBeHidden
{
  return 0;
}

- (void)introMediaControllerShouldAdvancePast:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  _QWORD *v8;
  _QWORD v9[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController backgroundScrollView](self, "backgroundScrollView", a3));
  objc_msgSend(v4, "contentOffset");
  v6 = v5;

  if (v6 < 0.0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController introMediaViewController](self, "introMediaViewController"));
    objc_msgSend(v7, "pause");

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_981B4;
    v9[3] = &unk_428C00;
    v9[4] = self;
    v8 = objc_retainBlock(v9);
    ((void (*)(void))v8[2])();

  }
}

- (BOOL)introMediaControllerIsActive
{
  void *v3;
  double v4;
  double v5;
  double v6;
  BOOL v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController introMediaViewController](self, "introMediaViewController"));
  if (v3)
  {
    -[THScrollView contentOffset](self->mBackgroundScrollView, "contentOffset");
    v5 = v4;
    -[THChapterBrowserController chapterWidth](self, "chapterWidth");
    v7 = fabs(v5 + v6) < 0.00999999978;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)introMediaControllerIsOffscreen
{
  double v2;

  -[THScrollView contentOffset](self->mBackgroundScrollView, "contentOffset");
  return v2 >= 0.0;
}

- (BOOL)animatesPageDuringTransition
{
  return 1;
}

- (void)p_startIntroMediaIfNecessary
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  -[THScrollView contentOffset](self->mBackgroundScrollView, "contentOffset");
  if (v3 >= 0.0)
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
    objc_msgSend(v13, "TOCViewControllerDidShowChapter:", self);

    v14 = (id)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController introMediaViewController](self, "introMediaViewController"));
    v7 = objc_msgSend(v14, "isPlaying");

    if (v7)
    {
      v15 = (id)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController introMediaViewController](self, "introMediaViewController"));
      objc_msgSend(v15, "pause");

    }
    v16 = (id)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController introMediaViewController](self, "introMediaViewController"));
    objc_msgSend(v16, "prepareMovieForTOC");

    v12 = (id)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController bc_windowForViewController](self, "bc_windowForViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "windowScene"));
    self->mCurrentSyntheticInterfaceOrientation = (int64_t)objc_msgSend(v8, "interfaceOrientation");

  }
  else
  {
    -[THScrollViewWithPassthrough contentOffset](self->mPagesScrollView, "contentOffset");
    -[THScrollViewWithPassthrough setContentOffset:](self->mPagesScrollView, "setContentOffset:", 0.0);
    self->mPageThumbScrollerStartContentOffset = 0.0;
    self->mPageThumbScrollerStartContentOffsetBeforeBackgroundDrag = 0.0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController introMediaViewController](self, "introMediaViewController"));

    if (!v4)
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterBrowserController p_startIntroMediaIfNecessary]"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterBrowserController.mm"));
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v5, v6, 1265, CFSTR("invalid nil value for '%s'"), "self.introMediaViewController");

    }
    v10 = (id)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
    objc_msgSend(v10, "TOCViewControllerDidShowIntroMedia:", self);

    -[THChapterBrowserController p_addIntroMediaView](self, "p_addIntroMediaView");
    v11 = (id)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController introMediaViewController](self, "introMediaViewController"));
    objc_msgSend(v11, "ensureReadyToPlay");

    v12 = (id)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController introMediaViewController](self, "introMediaViewController"));
    objc_msgSend(v12, "playForIntroMediaBecomesVisible");
  }

}

- (id)viewToShroud
{
  return self->mBackgroundScrollView;
}

- (void)freeTransformControllerDidBegin:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;

  v24 = a3;
  if (self->mDoingFreeTransform)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterBrowserController freeTransformControllerDidBegin:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterBrowserController.mm"));
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 1296, CFSTR("Beginning free transform while another one is active"));

  }
  self->mDoingFreeTransform = 1;
  v8 = objc_opt_class(THPageThumbnailView, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "targetLayer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "delegate"));
  v11 = TSUDynamicCast(v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (!v12)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterBrowserController freeTransformControllerDidBegin:]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterBrowserController.mm"));
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, v17, 1300, CFSTR("invalid nil value for '%s'"), "thumbnailView");

  }
  self->mUsingTinyThumb = TSUScreenScale(v13, v14) <= 1.0;
  v19 = objc_opt_class(UIView, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "freeTransformLayer"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "delegate"));
  v22 = TSUDynamicCast(v19, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

  -[THChapterBrowserController p_beginTransitionFromPageThumbnail:transformView:freeTransform:firstThumbNailToTransition:](self, "p_beginTransitionFromPageThumbnail:transformView:freeTransform:firstThumbNailToTransition:", v12, v23, 1, 1);
  objc_msgSend(v12, "setShowCanvas:animated:", 0, 0);

}

- (BOOL)freeTransformControllerShouldUseEffectsWindow:(id)a3
{
  return 0;
}

- (void)freeTransformControllerDidContinue:(id)a3 withScale:(double)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;

  v21 = a3;
  v7 = objc_opt_class(THPageThumbnailView, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "targetLayer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "delegate"));
  v10 = TSUDynamicCast(v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = objc_msgSend(v11, "setShowCanvas:animated:", a4 >= 3.0, 1);
  if (a4 < 3.0)
  {
    v14 = a4 < 1.20000005 && TSUScreenScale(v12, v13) <= 1.0;
    if (self->mUsingTinyThumb != v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController dataSource](self, "dataSource"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "toc:tileModelForChapterIndex:", self, objc_msgSend(v11, "chapterIndex")));

      if (v14)
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "tinyThumbs"));
      else
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "largerThumbs"));
      v18 = (void *)v17;
      v19 = objc_msgSend(v11, "pageIndex");
      if (v19 >= objc_msgSend(v18, "count"))
      {
        v20 = 0;
      }
      else
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndex:", objc_msgSend(v11, "pageIndex")));
        if (v20)
          objc_msgSend(v11, "setImage:", +[TSDBitmapImageProvider CGImageForImageData:](TSDBitmapImageProvider, "CGImageForImageData:", v20));
      }
      self->mUsingTinyThumb = v14;

    }
  }

}

- (CGRect)freeTransformControllerRectForCompletionAnimation:(id)a3
{
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
  void *v14;
  void *v15;
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
  CGRect result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "freeTransformLayer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superlayer"));
  -[THChapterBrowserController originalCanvasScrollViewFrame](self, "originalCanvasScrollViewFrame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController originalCanvasScrollViewSuperview](self, "originalCanvasScrollViewSuperview"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layer"));
  objc_msgSend(v5, "convertRect:fromLayer:", v15, v7, v9, v11, v13);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = v17;
  v25 = v19;
  v26 = v21;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (void)freeTransformControllerWillBeginCompletionAnimation:(id)a3 passedThreshold:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v4 = a4;
  v6 = a3;
  v8 = objc_opt_class(THPageThumbnailView, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "targetLayer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "delegate"));
  v11 = TSUDynamicCast(v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (!v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterBrowserController freeTransformControllerWillBeginCompletionAnimation:passedThreshold:]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterBrowserController.mm"));
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, v15, 1355, CFSTR("invalid nil value for '%s'"), "thumbnailView");

  }
  objc_msgSend(v12, "setShowCanvas:animated:", v4, 1);
  if (v4)
  {
    -[THTOCViewController setShrouded:animated:duration:](self, "setShrouded:animated:duration:", 1, 1, 0.25);
  }
  else
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_98D58;
    v16[3] = &unk_428C00;
    v17 = v12;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v16, 0.15);

  }
}

- (void)freeTransformControllerWillEnd:(id)a3 passedThreshold:(BOOL)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v7 = objc_opt_class(THPageThumbnailView, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "targetLayer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "delegate"));
  v10 = TSUDynamicCast(v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (v11)
  {
    if (a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterBrowserController freeTransformControllerWillEnd:passedThreshold:]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterBrowserController.mm"));
  objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, v14, 1374, CFSTR("invalid nil value for '%s'"), "thumbnailView");

  if (!a4)
  {
LABEL_5:
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
    objc_msgSend(v15, "chapterBrowserController:cancelledTransitionToPageIndex:chapterIndex:", self, objc_msgSend(v11, "pageIndex"), objc_msgSend(v11, "chapterIndex"));

  }
LABEL_6:

}

- (void)freeTransformControllerDidEnd:(id)a3 passedThreshold:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a4;
  v15 = a3;
  v7 = objc_opt_class(THPageThumbnailView, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "targetLayer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "delegate"));
  v10 = TSUDynamicCast(v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (!v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterBrowserController freeTransformControllerDidEnd:passedThreshold:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterBrowserController.mm"));
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, v14, 1386, CFSTR("invalid nil value for '%s'"), "thumbnailView");

  }
  +[CATransaction begin](CATransaction, "begin");
  if (v4)
    -[THChapterBrowserController p_animationDidStopForThumbnailView:](self, "p_animationDidStopForThumbnailView:", v11);
  -[THChapterBrowserController p_cleanupAfterTransitionFromPageThumbnail:](self, "p_cleanupAfterTransitionFromPageThumbnail:", v11);
  +[CATransaction commit](CATransaction, "commit");
  self->mDoingFreeTransform = 0;

}

- (id)unmovingParentViewForFreeTransformController:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController view](self, "view", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "superview"));

  return v4;
}

- (id)curtainColorForFreeTransformController:(id)a3
{
  return 0;
}

- (CGSize)curtainSizeForFreeTransformController:(id)a3
{
  double width;
  double height;
  CGSize result;

  width = CGSizeZero.width;
  height = CGSizeZero.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)freeTransformControllerWantsCurtainFadeOut:(id)a3
{
  return 0;
}

- (BOOL)freeTransformController:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)freeTransformControllerShouldFadeShadowOut:(id)a3
{
  return 1;
}

- ($A219A65C3B9F57E4A1EAB42BC6271E0A)shadowPropertiesForFreeTransformController:(SEL)a3 defaults:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  $A219A65C3B9F57E4A1EAB42BC6271E0A *result;

  v5 = a4;
  v7 = objc_opt_class(THPageThumbnailView, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "targetLayer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "delegate"));
  v10 = TSUDynamicCast(v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (!v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterBrowserController shadowPropertiesForFreeTransformController:defaults:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterBrowserController.mm"));
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, v14, 1437, CFSTR("invalid nil value for '%s'"), "thumbnailView");

  }
  if (!objc_msgSend(v11, "pageIndex"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterBrowserController shadowPropertiesForFreeTransformController:defaults:]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterBrowserController.mm"));
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, v17, 1438, CFSTR("Free transform controller should automatically use the shadow on the large thumbnail"));

  }
  return result;
}

- (id)documentRootForChapterViewController:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "documentRootForChapterBrowserController:", self));

  return v5;
}

- (void)chapterViewController:(id)a3 displayPageForModelLink:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = objc_claimAutoreleasedReturnValue(-[THChapterBrowserController p_pageThumbnailViewForModelLink:](self, "p_pageThumbnailViewForModelLink:", a4));
  v9 = (id)v5;
  if (v5)
  {
    -[THChapterBrowserController p_beginTransitionFromPageThumbnail:transformView:freeTransform:firstThumbNailToTransition:](self, "p_beginTransitionFromPageThumbnail:transformView:freeTransform:firstThumbNailToTransition:", v5, v5, 0, 1);
    -[THChapterBrowserController p_transitionFromPageThumbnail:destinationRect:shouldShroud:](self, "p_transitionFromPageThumbnail:destinationRect:shouldShroud:", v9, 1);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterBrowserController chapterViewController:displayPageForModelLink:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterBrowserController.mm"));
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 1460, CFSTR("invalid nil value for '%s'"), "thumb");

  }
}

- (unint64_t)supportedInterfaceOrientationsForChapterViewController:(id)a3
{
  return 30;
}

- (CGRect)frameForChapterViewController:(id)a3 withSize:(CGSize)a4
{
  double height;
  double width;
  unint64_t i;
  unsigned int v8;
  double y;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  height = a4.height;
  width = a4.width;
  for (i = 0; i != 3; ++i)
  {
    if (self->mChapterViewControllers[i] == a3)
      break;
  }
  v8 = -[THChapterBrowserController p_hasPageScrubberControl](self, "p_hasPageScrubberControl");
  y = CGPointZero.y;
  v10 = -[THChapterBrowserController chapterWidth](self, "chapterWidth");
  v12 = v11;
  if (v8)
    v13 = height + -48.0;
  else
    v13 = height;
  TSDRectWithOriginAndSize(v10, CGPointZero.x, y, width, v13);
  v17 = v12 * (double)i;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v17;
  return result;
}

- (CGRect)frameForChapterViewController:(id)a3
{
  id v4;
  void *v5;
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
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController view](self, "view"));
  objc_msgSend(v5, "bounds");
  -[THChapterBrowserController frameForChapterViewController:withSize:](self, "frameForChapterViewController:withSize:", v4, v6, v7);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)chapterViewControllerWasTapped:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate", a3));
  v5 = objc_msgSend(v4, "isToolbarHidden");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "TOCShowToolbarAnimated:", 1);
  else
    objc_msgSend(v6, "TOCHideToolbarAnimated:", 1);

  -[THChapterBrowserController refreshStatusBarAppearance](self, "refreshStatusBarAppearance");
}

- (id)chapterViewController:(id)a3 actionForHyperlink:(id)a4 inRep:(id)a5 gesture:(id)a6
{
  id v9;
  id v10;
  id v11;
  THModelLink *v12;
  void *v13;
  void *v14;
  THModelLink *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  THChapterBrowserController *v25;
  THModelLink *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = [THModelLink alloc];
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "url"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "absoluteString"));
  v15 = -[THModelLink initWithTarget:context:](v12, "initWithTarget:context:", v14, 0);

  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "gestureKind"));
  v17 = (void *)v16;
  v18 = (void *)TSWPLongPress;
  if (v16 == TSWPImmediateSingleTap || v16 == TSWPLongPress)
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_9995C;
    v29[3] = &unk_428C28;
    v30 = v10;
    v31 = v9;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_99968;
    v27[3] = &unk_428C00;
    v28 = v30;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_99974;
    v23[3] = &unk_428C50;
    v24 = v28;
    v25 = self;
    v26 = v15;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[TSWPTwoPartAction actionWithStartAction:cancelAction:finishAction:](TSWPTwoPartAction, "actionWithStartAction:cancelAction:finishAction:", v29, v27, v23));
    if (v17 == v18)
      v20 = 1;
    else
      v20 = TSUSupportsTextInteraction();
    objc_msgSend(v21, "setPerformImmediately:", v20);

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (BOOL)chapterViewController:(id)a3 followLink:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
  v7 = objc_msgSend(v6, "chapterBrowserController:relativePageIndexForLink:", self, v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
  objc_msgSend(v8, "chapterBrowserController:willTransitionToPageIndex:chapterIndex:freeTransform:", self, v7, self->mChapterIndex, 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
  objc_msgSend(v9, "chapterBrowserController:didTransitionToPageIndex:chapterIndex:relativeTargetRect:", self, v7, self->mChapterIndex, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

  -[THTOCViewController setShrouded:animated:duration:](self, "setShrouded:animated:duration:", 1, 0, 0.0);
  return 1;
}

- (id)presentingViewControllerForChapterViewController:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentingViewControllerForChapterBrowserController:", self));

  return v5;
}

- (void)p_highlightThumbTargetsIfShouldInThumb:(id)a3 atPoint:(CGPoint)a4 coverFullThumb:(BOOL)a5
{
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;

  y = a4.y;
  x = a4.x;
  v22 = a3;
  if (-[THChapterBrowserController p_shouldHighlightThumbTargets](self, "p_shouldHighlightThumbTargets"))
  {
    if (a5)
    {
      v9 = 1.0;
      v10 = 0.0;
      v11 = 0.0;
      v12 = 1.0;
    }
    else
    {
      objc_msgSend(v22, "frame");
      v14 = v13;
      objc_msgSend(v22, "frame");
      v16 = v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
      objc_msgSend(v17, "chapterBrowserController:targetRelativeRectForRelativePoint:atPageIndex:chapterIndex:", self, objc_msgSend(v22, "pageIndex"), objc_msgSend(v22, "chapterIndex"), x / v14, y / v16);
      v10 = v18;
      v11 = v19;
      v9 = v20;
      v12 = v21;

    }
    objc_msgSend(v22, "setHighlightRelativeRect:", v10, v11, v9, v12);
  }

}

- (void)thumbnailWasPressed:(id)a3 atPoint:(CGPoint)a4 forLong:(BOOL)a5
{
  _BOOL4 v5;
  double y;
  double x;
  id v9;

  v5 = a5;
  y = a4.y;
  x = a4.x;
  v9 = a3;
  if (!self->mIgnoringThumbnailTaps && !self->mDoingFreeTransform)
    -[THChapterBrowserController p_highlightThumbTargetsIfShouldInThumb:atPoint:coverFullThumb:](self, "p_highlightThumbTargetsIfShouldInThumb:atPoint:coverFullThumb:", v9, !v5, x, y);

}

- (void)p_transitionThumbnailToDVC:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;

  v4 = a3;
  if (v4)
  {
    v30 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
    v6 = objc_msgSend(v5, "isTwoUpForChapterBrowserController:", self);

    if (v6
      && (v7 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate")),
          v8 = objc_msgSend(v7, "isLastPageInChapterForChapterBrowserController:pageIndex:chapterIndex:", self, objc_msgSend(v30, "pageIndex"), objc_msgSend(v30, "chapterIndex")), v7, v9 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate")), v10 = objc_msgSend(v9, "isSinglePageInChapterForChapterBrowserController:chapterIndex:", self, objc_msgSend(v30, "chapterIndex")), v9, !v10))
    {
      if (v8)
      {
        v11 = (id)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController p_pageThumbnailViewForPageIndex:](self, "p_pageThumbnailViewForPageIndex:", (char *)objc_msgSend(v30, "pageIndex") - 1));
        -[THChapterBrowserController p_beginTransitionFromPageThumbnail:transformView:freeTransform:firstThumbNailToTransition:](self, "p_beginTransitionFromPageThumbnail:transformView:freeTransform:firstThumbNailToTransition:", v11, v11, 0, 1);
        v13 = v12;
        v15 = v14;
        v17 = v16;
        v19 = v18;
        -[THChapterBrowserController p_transitionFromPageThumbnail:destinationRect:shouldShroud:](self, "p_transitionFromPageThumbnail:destinationRect:shouldShroud:", v11, 1);
        -[THChapterBrowserController p_beginTransitionFromPageThumbnail:transformView:freeTransform:firstThumbNailToTransition:](self, "p_beginTransitionFromPageThumbnail:transformView:freeTransform:firstThumbNailToTransition:", v30, v30, 0, 0);
        -[THChapterBrowserController p_transitionFromPageThumbnail:destinationRect:shouldShroud:](self, "p_transitionFromPageThumbnail:destinationRect:shouldShroud:", v30, 0, v13 + v17, v15, v17, v19);
      }
      else
      {
        if ((objc_msgSend(v30, "pageIndex") & 1) != 0)
        {
          v21 = objc_claimAutoreleasedReturnValue(-[THChapterBrowserController p_pageThumbnailViewForPageIndex:](self, "p_pageThumbnailViewForPageIndex:", (char *)objc_msgSend(v30, "pageIndex") - 1));
          v20 = v30;
          v11 = (id)v21;
        }
        else
        {
          v11 = v30;
          v20 = (id)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController p_pageThumbnailViewForPageIndex:](self, "p_pageThumbnailViewForPageIndex:", (char *)objc_msgSend(v11, "pageIndex") + 1));
        }
        -[THChapterBrowserController p_beginTransitionFromPageThumbnail:transformView:freeTransform:firstThumbNailToTransition:](self, "p_beginTransitionFromPageThumbnail:transformView:freeTransform:firstThumbNailToTransition:", v11, v11, 0, 1);
        v23 = v22;
        v25 = v24;
        v27 = v26;
        v29 = v28;
        -[THChapterBrowserController p_transitionFromPageThumbnail:destinationRect:shouldShroud:](self, "p_transitionFromPageThumbnail:destinationRect:shouldShroud:", v11, 1);
        -[THChapterBrowserController p_beginTransitionFromPageThumbnail:transformView:freeTransform:firstThumbNailToTransition:](self, "p_beginTransitionFromPageThumbnail:transformView:freeTransform:firstThumbNailToTransition:", v20, v20, 0, 0);
        -[THChapterBrowserController p_transitionFromPageThumbnail:destinationRect:shouldShroud:](self, "p_transitionFromPageThumbnail:destinationRect:shouldShroud:", v20, 0, v23 + v27, v25, v27, v29);

      }
      v4 = v30;
    }
    else
    {
      -[THChapterBrowserController p_beginTransitionFromPageThumbnail:transformView:freeTransform:firstThumbNailToTransition:](self, "p_beginTransitionFromPageThumbnail:transformView:freeTransform:firstThumbNailToTransition:", v30, v30, 0, 1);
      -[THChapterBrowserController p_transitionFromPageThumbnail:destinationRect:shouldShroud:](self, "p_transitionFromPageThumbnail:destinationRect:shouldShroud:", v30, 1);
      v4 = v30;
    }
  }

}

- (BOOL)thumbnailWasTapped:(id)a3 atPoint:(CGPoint)a4 forLong:(BOOL)a5
{
  _BOOL4 v5;
  double y;
  double x;
  id v9;
  BOOL v10;

  v5 = a5;
  y = a4.y;
  x = a4.x;
  v9 = a3;
  if (self->mIgnoringThumbnailTaps || self->mDoingFreeTransform)
  {
    v10 = 0;
  }
  else
  {
    self->mIgnoringThumbnailTaps = 1;
    -[THChapterBrowserController p_highlightThumbTargetsIfShouldInThumb:atPoint:coverFullThumb:](self, "p_highlightThumbTargetsIfShouldInThumb:atPoint:coverFullThumb:", v9, !v5, x, y);
    -[THChapterBrowserController p_transitionThumbnailToDVC:](self, "p_transitionThumbnailToDVC:", v9);
    v10 = 1;
  }

  return v10;
}

- (void)transitionPageToDVC:(unint64_t)a3 chapterIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  id v9;

  self->mIgnoringThumbnailTaps = 1;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController visibleThumbnailIndexes](self, "visibleThumbnailIndexes"));
  if ((objc_msgSend(v9, "containsIndex:", a3) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController p_pageThumbnailViewForPageIndex:](self, "p_pageThumbnailViewForPageIndex:", a3));
    -[THChapterBrowserController p_transitionThumbnailToDVC:](self, "p_transitionThumbnailToDVC:", v7);

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v8, "beginIgnoringInteractionEvents");

    -[THChapterBrowserController setTransitioningPageToDVC:](self, "setTransitioningPageToDVC:", 1);
    -[THChapterBrowserController setTransitioningThumbnailIndex:](self, "setTransitioningThumbnailIndex:", a3);
    -[THChapterBrowserController prepareToScrollToThumbnailAtIndex:chapterIndex:](self, "prepareToScrollToThumbnailAtIndex:chapterIndex:", a3, a4);
    -[THChapterBrowserController p_scrollToThumbnailAtIndex:animated:](self, "p_scrollToThumbnailAtIndex:animated:", a3, 1);
  }

}

- (void)p_updateChapterBackgroundsView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  -[THChapterBrowserController chapterWidth](self, "chapterWidth");
  v4 = v3 * (double)self->mChapterIndex;
  -[UIView frame](self->mBackgroundsView, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[THChapterBrowserController chapterWidth](self, "chapterWidth");
  -[UIView setFrame:](self->mBackgroundsView, "setFrame:", v4 - v11, v6, v8, v10);
}

- (void)p_setupChapterViewControllerAtIndex:(unint64_t)a3 withChapterIndex:(unint64_t)a4 allowThumbnail:(BOOL)a5
{
  _BOOL8 v5;
  THChapterViewController **mChapterViewControllers;
  THChapterViewController *v10;
  THChapterViewController *v11;
  void *v12;
  THChapterViewController *v13;
  THChapterViewController *v14;
  UIView *mBackgroundsView;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v5 = a5;
  mChapterViewControllers = self->mChapterViewControllers;
  v10 = self->mChapterViewControllers[a3];
  if (!v10)
  {
    v11 = [THChapterViewController alloc];
    v22 = (id)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "presentationTypeForChapterBrowserController:", self));
    v13 = -[THChapterViewController initWithDelegate:pageControlHeight:presentationType:](v11, "initWithDelegate:pageControlHeight:presentationType:", self, v12, 48.0);
    v14 = mChapterViewControllers[a3];
    mChapterViewControllers[a3] = v13;

    mBackgroundsView = self->mBackgroundsView;
    v23 = (id)objc_claimAutoreleasedReturnValue(-[THChapterViewController view](mChapterViewControllers[a3], "view"));
    -[UIView addSubview:](mBackgroundsView, "addSubview:");

    -[THChapterBrowserController addChildViewController:](self, "addChildViewController:", mChapterViewControllers[a3]);
    v24 = (id)objc_claimAutoreleasedReturnValue(-[THChapterViewController interactiveCanvasController](mChapterViewControllers[a3], "interactiveCanvasController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "gestureRecognizerWithKind:", TSWPImmediatePress));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "gestureDispatcher"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[THScrollView panGestureRecognizer](self->mBackgroundScrollView, "panGestureRecognizer"));
    objc_msgSend(v17, "allowSimultaneousRecognitionByRecognizers:", v16, v18, 0);

    v10 = mChapterViewControllers[a3];
  }
  if (-[THChapterViewController chapterIndex](v10, "chapterIndex") != a4)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
    v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "chapterBrowserController:tocTileModelAtIndex:", self, a4));

    -[THChapterViewController setTileModel:](mChapterViewControllers[a3], "setTileModel:", v25);
    -[THChapterViewController setChapterIndex:](mChapterViewControllers[a3], "setChapterIndex:", a4);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterViewController reloadViewsAndShowThumbnail:](mChapterViewControllers[a3], "reloadViewsAndShowThumbnail:", v5));
    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController contentNodesAskedToLoad](self, "contentNodesAskedToLoad"));
      objc_msgSend(v21, "addObject:", v20);

    }
  }
}

- (void)p_fixupChapterViewFrames
{
  uint64_t v3;
  THChapterViewController **mChapterViewControllers;
  THChapterViewController *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  BOOL v19;
  void *v20;
  CGRect v21;
  CGRect v22;

  v3 = 0;
  mChapterViewControllers = self->mChapterViewControllers;
  do
  {
    v5 = mChapterViewControllers[v3];
    if (v5)
    {
      -[THChapterBrowserController frameForChapterViewController:](self, "frameForChapterViewController:", v5);
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterViewController view](v5, "view"));
      objc_msgSend(v14, "frame");
      v22.origin.x = v15;
      v22.origin.y = v16;
      v22.size.width = v17;
      v22.size.height = v18;
      v21.origin.x = v7;
      v21.origin.y = v9;
      v21.size.width = v11;
      v21.size.height = v13;
      v19 = CGRectEqualToRect(v21, v22);

      if (!v19)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterViewController view](v5, "view"));
        objc_msgSend(v20, "setFrame:", v7, v9, v11, v13);

      }
    }

    ++v3;
  }
  while (v3 != 3);
}

- (void)p_setupPreviousChapterView
{
  unint64_t mChapterIndex;

  mChapterIndex = self->mChapterIndex;
  if (mChapterIndex)
  {
    -[THChapterBrowserController p_setupChapterViewControllerAtIndex:withChapterIndex:allowThumbnail:](self, "p_setupChapterViewControllerAtIndex:withChapterIndex:allowThumbnail:", 0, mChapterIndex - 1, 1);
    -[THChapterBrowserController p_removeIntroMediaView](self, "p_removeIntroMediaView");
  }
  else
  {
    -[THChapterBrowserController p_clearChapterViewAtIndex:](self, "p_clearChapterViewAtIndex:", 0);
    -[THChapterBrowserController p_addIntroMediaView](self, "p_addIntroMediaView");
  }
}

- (void)p_setupNextChapterView
{
  unint64_t mChapterIndex;
  void *v4;
  id v5;

  mChapterIndex = self->mChapterIndex;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController dataSource](self, "dataSource"));
  v5 = objc_msgSend(v4, "toc:numberOfTilesInDivision:", self, 0);

  if (mChapterIndex + 1 >= (unint64_t)v5)
    -[THChapterBrowserController p_clearChapterViewAtIndex:](self, "p_clearChapterViewAtIndex:", 2);
  else
    -[THChapterBrowserController p_setupChapterViewControllerAtIndex:withChapterIndex:allowThumbnail:](self, "p_setupChapterViewControllerAtIndex:withChapterIndex:allowThumbnail:", 2, self->mChapterIndex + 1, 1);
  if (self->mChapterIndex)
    -[THChapterBrowserController p_removeIntroMediaView](self, "p_removeIntroMediaView");
}

- (void)p_updateAdjacentChapterViews
{
  -[THChapterBrowserController p_setupPreviousChapterView](self, "p_setupPreviousChapterView");
  -[THChapterBrowserController p_setupNextChapterView](self, "p_setupNextChapterView");
  -[THChapterBrowserController p_fixupChapterViewFrames](self, "p_fixupChapterViewFrames");
}

- (void)p_clearChapterViewAtIndex:(unint64_t)a3
{
  THChapterViewController **mChapterViewControllers;
  THChapterViewController *v4;
  id v6;

  mChapterViewControllers = self->mChapterViewControllers;
  v4 = self->mChapterViewControllers[a3];
  if (v4)
  {
    -[THChapterViewController setTileModel:](v4, "setTileModel:", 0);
    -[THChapterViewController setChapterIndex:](mChapterViewControllers[a3], "setChapterIndex:", 0x7FFFFFFFFFFFFFFFLL);
    v6 = -[THChapterViewController reloadViewsAndShowThumbnail:](mChapterViewControllers[a3], "reloadViewsAndShowThumbnail:", 1);
  }
}

- (void)p_setChapterIndex:(unint64_t)a3 forScrub:(BOOL)a4 stillScrolling:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  unint64_t mChapterIndex;
  THChapterViewController *v10;
  THChapterViewController *v11;
  THChapterViewController *v12;

  v5 = a5;
  v6 = a4;
  +[CATransaction begin](CATransaction, "begin");
  mChapterIndex = self->mChapterIndex;
  if (mChapterIndex != a3)
  {
    if (mChapterIndex != 0x7FFFFFFFFFFFFFFFLL)
      -[THChapterBrowserController setPreviousChapterIndex:](self, "setPreviousChapterIndex:", self->mChapterIndex);
    self->mChapterIndex = a3;
    if (v6)
    {
      -[THChapterBrowserController p_setupChapterViewControllerAtIndex:withChapterIndex:allowThumbnail:](self, "p_setupChapterViewControllerAtIndex:withChapterIndex:allowThumbnail:", 1, a3, 1);
      -[THChapterBrowserController p_updateChapterBackgroundsView](self, "p_updateChapterBackgroundsView");
      goto LABEL_15;
    }
    -[THChapterBrowserController p_updatePageControl](self, "p_updatePageControl");
    if (mChapterIndex - 1 == a3)
    {
      v10 = self->mChapterViewControllers[2];
      v11 = v10;
      objc_storeStrong((id *)&self->mChapterViewControllers[2], self->mChapterViewControllers[1]);
      objc_storeStrong((id *)&self->mChapterViewControllers[1], self->mChapterViewControllers[0]);
      objc_storeStrong((id *)self->mChapterViewControllers, v10);
      -[THChapterBrowserController p_setupPreviousChapterView](self, "p_setupPreviousChapterView");
      -[THChapterBrowserController p_fixupChapterViewFrames](self, "p_fixupChapterViewFrames");
    }
    else
    {
      if (mChapterIndex + 1 != a3)
      {
        -[THChapterBrowserController p_setupChapterViewControllerAtIndex:withChapterIndex:allowThumbnail:](self, "p_setupChapterViewControllerAtIndex:withChapterIndex:allowThumbnail:", 1, self->mChapterIndex, 1);
        if (v5)
          -[THChapterBrowserController p_updateAdjacentChapterViews](self, "p_updateAdjacentChapterViews");
        goto LABEL_11;
      }
      v12 = self->mChapterViewControllers[0];
      v11 = v12;
      objc_storeStrong((id *)self->mChapterViewControllers, self->mChapterViewControllers[1]);
      objc_storeStrong((id *)&self->mChapterViewControllers[1], self->mChapterViewControllers[2]);
      objc_storeStrong((id *)&self->mChapterViewControllers[2], v12);
      -[THChapterBrowserController p_setupNextChapterView](self, "p_setupNextChapterView");
      -[THChapterBrowserController p_fixupChapterViewFrames](self, "p_fixupChapterViewFrames");
    }

LABEL_11:
    -[THChapterBrowserController p_updateChapterBackgroundsView](self, "p_updateChapterBackgroundsView");
  }
  if (!v6 && !v5)
    -[THChapterBrowserController p_preloadContentNodesForVisibleThumbnails](self, "p_preloadContentNodesForVisibleThumbnails");
LABEL_15:
  +[CATransaction commit](CATransaction, "commit");
}

- (void)p_removeAdjacentChapterViews
{
  uint64_t i;
  void *v4;
  THChapterViewController *v5;

  for (i = 0; i != 3; ++i)
  {
    if (i != 1)
    {
      -[THChapterViewController removeFromParentViewController](self->mChapterViewControllers[i], "removeFromParentViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterViewController view](self->mChapterViewControllers[i], "view"));
      objc_msgSend(v4, "removeFromSuperview");

      -[THChapterViewController teardown](self->mChapterViewControllers[i], "teardown");
      v5 = self->mChapterViewControllers[i];
      self->mChapterViewControllers[i] = 0;

    }
  }
}

- (void)setChapterIndex:(unint64_t)a3
{
  void *v5;
  double v6;
  double v7;

  if (a3 != 0x7FFFFFFFFFFFFFFFLL && self->mChapterIndex != a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController view](self, "view"));

    if (v5)
    {
      -[THChapterBrowserController p_setChapterIndex:forScrub:stillScrolling:](self, "p_setChapterIndex:forScrub:stillScrolling:", a3, 0, 0);
      self->mPreservedThumbnailOffset.x = 0.0;
      -[THChapterBrowserController p_resetPagesScrollViewAndCapThumbCount:firstVisibleRelativePage:resetContentOffset:](self, "p_resetPagesScrollViewAndCapThumbCount:firstVisibleRelativePage:resetContentOffset:", 0, 0, 1);
      -[THScrollView contentOffset](self->mBackgroundScrollView, "contentOffset");
      if (v6 >= 0.0)
      {
        -[THChapterBrowserController chapterWidth](self, "chapterWidth");
        -[THScrollView setContentOffset:](self->mBackgroundScrollView, "setContentOffset:", v7 * (double)a3, 0.0);
      }
    }
  }
}

- (id)previousChapterViewController
{
  return self->mChapterViewControllers[0];
}

- (THChapterViewController)chapterViewController
{
  return self->mChapterViewControllers[1];
}

- (id)nextChapterViewController
{
  return self->mChapterViewControllers[2];
}

- (void)p_resetPagesScrollViewAndCapThumbCount:(BOOL)a3 firstVisibleRelativePage:(unint64_t)a4 resetContentOffset:(BOOL)a5
{
  uint64_t v6;
  uint64_t v7;
  double v8;
  char **v9;
  unint64_t mChapterIndex;
  int v11;
  void *v12;
  id v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  void *v16;
  CGSize size;
  char **v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  char *v24;
  unint64_t v25;
  unint64_t v26;
  int64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  unsigned __int8 *v37;
  unsigned __int8 *v38;
  CGFloat v39;
  CGFloat v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  double MaxX;
  double v52;
  CGFloat v55;
  _BOOL4 v56;
  double MinX;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v56 = a3;
  v6 = 0;
  v7 = 0;
  v8 = 0.0;
  v9 = &selRef__accessibilityElementsInDirection_withCount_originalElement_;
  do
  {
    mChapterIndex = self->mChapterIndex;
    if (!(v6 | mChapterIndex))
    {
      v11 = *((_DWORD *)v9 + 1004);
LABEL_5:
      v14 = &self->super.IMViewController_opaque[v6 + v11];
      *(_QWORD *)v14 = 0x7FFFFFFFFFFFFFFFLL;
      v15 = &self->super.IMViewController_opaque[v11 + v6];
      v16 = (void *)*((_QWORD *)v15 + 6);
      *((_QWORD *)v15 + 6) = 0;

      *((_QWORD *)v15 + 1) = 0;
      size = CGRectZero.size;
      *((_OWORD *)v15 + 1) = CGRectZero.origin;
      *((CGSize *)v15 + 2) = size;
      *((_QWORD *)v14 + 7) = 0;
      goto LABEL_19;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController dataSource](self, "dataSource"));
    v13 = objc_msgSend(v12, "toc:numberOfTilesInDivision:", self, 0);

    v11 = *((_DWORD *)v9 + 1004);
    if (v7 + mChapterIndex > (unint64_t)v13)
      goto LABEL_5;
    v18 = v9;
    v19 = v7 + self->mChapterIndex - 1;
    v20 = v6 + v11;
    *(_QWORD *)&self->super.IMViewController_opaque[v20] = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController dataSource](self, "dataSource"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "toc:tileModelForChapterIndex:", self, v19));

    objc_storeStrong((id *)((char *)&self->super.mBookPropertiesDelegate + v20), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "tinyThumbs"));
    v24 = (char *)objc_msgSend(v23, "count");

    if (v56)
    {
      if (v6 == 64)
      {
        v25 = a4;
        if (-[THChapterBrowserController maximumNumberOfThumbsToLeftOfLeftmostDuringBackgroundDrag](self, "maximumNumberOfThumbsToLeftOfLeftmostDuringBackgroundDrag") <= a4)v25 = -[THChapterBrowserController maximumNumberOfThumbsToLeftOfLeftmostDuringBackgroundDrag](self, "maximumNumberOfThumbsToLeftOfLeftmostDuringBackgroundDrag");
        *(TSWPassThroughView **)((char *)&self->mBottomWrapperView + v11) = (TSWPassThroughView *)(a4 - v25);
        v26 = -[THChapterBrowserController maximumNumberOfThumbsToRightOfLeftmostDuringBackgroundDrag](self, "maximumNumberOfThumbsToRightOfLeftmostDuringBackgroundDrag");
        v27 = (int64_t)&v24[-a4];
        if (v26 < (unint64_t)&v24[-a4])
          v27 = -[THChapterBrowserController maximumNumberOfThumbsToRightOfLeftmostDuringBackgroundDrag](self, "maximumNumberOfThumbsToRightOfLeftmostDuringBackgroundDrag");
      }
      else
      {
        v27 = -[THChapterBrowserController maximumNumberOfThumbsToRightOfLeftmostDuringBackgroundDrag](self, "maximumNumberOfThumbsToRightOfLeftmostDuringBackgroundDrag");
        v25 = 0;
      }
      if (v25 + v27 < (unint64_t)v24)
        v24 = (char *)(v25 + v27);
    }
    else
    {
      *(THUIState **)((char *)&self->super.mUIState + v6 + v11) = 0;
    }
    v9 = v18;
    -[THChapterBrowserController thumbSize](self, "thumbSize");
    v29 = v28;
    -[THChapterBrowserController firstThumbOverlap](self, "firstThumbOverlap");
    v31 = v30;
    -[THChapterBrowserController thumbSize](self, "thumbSize");
    v33 = v32;
    -[THChapterBrowserController chapterWidth](self, "chapterWidth");
    v35 = v34;
    v36 = v31 + (double)(unint64_t)v24 * v29;
    if (v35 > v36)
      -[THChapterBrowserController chapterWidth](self, "chapterWidth");
    v37 = &self->super.IMViewController_opaque[v11 + v6];
    *((_QWORD *)v37 + 1) = v24;
    *((double *)v37 + 2) = v8;
    *((_QWORD *)v37 + 3) = 0;
    *((double *)v37 + 4) = v36;
    *((_QWORD *)v37 + 5) = v33;
    v8 = v8 + v36;

LABEL_19:
    ++v7;
    v6 += 64;
  }
  while (v6 != 192);
  ++self->mSuspendThumbViewUpdates;
  -[THScrollViewWithPassthrough bounds](self->mPagesScrollView, "bounds");
  -[THScrollViewWithPassthrough setContentSize:](self->mPagesScrollView, "setContentSize:", v8 + 1.0, CGRectGetHeight(v58));
  v38 = &self->super.IMViewController_opaque[v11];
  v39 = -CGRectGetMinX(*(CGRect *)(v38 + 80));
  -[THScrollViewWithPassthrough setContentInset:](self->mPagesScrollView, "setContentInset:", 0.0, v39, 0.0, -CGRectGetWidth(*(CGRect *)(v38 + 144)));
  -[THScrollViewWithPassthrough bounds](self->mPagesScrollView, "bounds");
  if (a5)
    goto LABEL_23;
  v44 = *((double *)v38 + 12);
  v45 = *((double *)v38 + 10);
  v46 = *((double *)v38 + 11);
  v47 = v40;
  v48 = v41;
  v49 = v42;
  v50 = v43;
  v55 = *((double *)v38 + 13);
  MinX = CGRectGetMinX(*(CGRect *)&v40);
  v59.origin.x = v45;
  v59.origin.y = v46;
  v59.size.width = v44;
  v59.size.height = v55;
  if (MinX < CGRectGetMinX(v59))
    goto LABEL_23;
  v60.origin.x = v47;
  v60.origin.y = v48;
  v60.size.width = v49;
  v60.size.height = v50;
  MaxX = CGRectGetMaxX(v60);
  v61.origin.x = v45;
  v61.origin.y = v46;
  v61.size.width = v44;
  v61.size.height = v55;
  if (MaxX > CGRectGetMaxX(v61))
LABEL_23:
    -[THScrollViewWithPassthrough setContentOffset:](self->mPagesScrollView, "setContentOffset:", CGRectGetWidth(*(CGRect *)(v38 + 16)), 0.0);
  -[THScrollViewWithPassthrough contentOffset](self->mPagesScrollView, "contentOffset");
  self->mPageThumbScrollerStartContentOffset = v52;
  --self->mSuspendThumbViewUpdates;
  if (!self->mDeferPagesScrollViewScrolls)
    -[THChapterBrowserController p_updatePageThumbnails:](self, "p_updatePageThumbnails:", 1);
}

- (double)p_updateChapterWidths
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  unint64_t mChapterIndex;
  void *v7;
  id v8;
  $DDEFF0282EF51F97FF1616E639F089D2 *v9;
  $DDEFF0282EF51F97FF1616E639F089D2 *v10;
  THTOCTileModel *tileModel;
  CGSize size;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  $DDEFF0282EF51F97FF1616E639F089D2 *v27;

  v3 = 0;
  v4 = 0;
  v5 = 0.0;
  do
  {
    mChapterIndex = self->mChapterIndex;
    if ((v3 * 64) | mChapterIndex
      && (v7 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController dataSource](self, "dataSource")),
          v8 = objc_msgSend(v7, "toc:numberOfTilesInDivision:", self, 0),
          v7,
          v4 + mChapterIndex <= (unint64_t)v8))
    {
      v13 = v4 + self->mChapterIndex - 1;
      self->mChapterInfo[v3].chapterNumber = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController dataSource](self, "dataSource"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "toc:tileModelForChapterIndex:", self, v13));

      objc_storeStrong((id *)&self->mChapterInfo[v3].tileModel, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tinyThumbs"));
      v17 = objc_msgSend(v16, "count");

      if (self->mBackgroundSwipeDidInitiateScroll
        && v17 >= (id)-[THChapterBrowserController maximumNumberOfThumbsToRightOfLeftmostDuringBackgroundDrag](self, "maximumNumberOfThumbsToRightOfLeftmostDuringBackgroundDrag"))
      {
        v17 = -[THChapterBrowserController maximumNumberOfThumbsToRightOfLeftmostDuringBackgroundDrag](self, "maximumNumberOfThumbsToRightOfLeftmostDuringBackgroundDrag");
      }
      -[THChapterBrowserController thumbSize](self, "thumbSize");
      v19 = v18;
      -[THChapterBrowserController firstThumbOverlap](self, "firstThumbOverlap");
      v21 = v20;
      -[THChapterBrowserController thumbSize](self, "thumbSize");
      v23 = v22;
      self->mChapterInfo[v3].numberOfPages = (unint64_t)v17;
      -[THChapterBrowserController chapterWidth](self, "chapterWidth");
      v25 = v24;
      v26 = v21 + (double)(unint64_t)v17 * v19;
      if (v25 > v26)
        -[THChapterBrowserController chapterWidth](self, "chapterWidth");
      v27 = &self->mChapterInfo[v3];
      v27->frame.origin.x = v5;
      v27->frame.origin.y = 0.0;
      v27->frame.size.width = v26;
      v27->frame.size.height = v23;
      self->mChapterInfo[v3].firstRelativePageToShowDuringBackgroundScroll = 0;
      v5 = v5 + v26;

    }
    else
    {
      v9 = &self->mChapterInfo[v3];
      v9->chapterNumber = 0x7FFFFFFFFFFFFFFFLL;
      v10 = &self->mChapterInfo[v3];
      tileModel = v10->tileModel;
      v10->tileModel = 0;

      v10->numberOfPages = 0;
      size = CGRectZero.size;
      v10->frame.origin = CGRectZero.origin;
      v10->frame.size = size;
      v9->firstRelativePageToShowDuringBackgroundScroll = 0;
    }
    ++v4;
    ++v3;
  }
  while (v3 != 3);
  return v5;
}

- (void)p_updatePagesScrollView
{
  $DDEFF0282EF51F97FF1616E639F089D2 *mChapterInfo;
  unint64_t mChapterIndex;
  double MinX;
  unint64_t chapterNumber;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  double v20;
  double v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  CGRect v27;

  mChapterInfo = self->mChapterInfo;
  mChapterIndex = self->mChapterIndex;
  if (self->mChapterInfo[1].chapterNumber != mChapterIndex || !self->mChapterInfo[1].tileModel)
  {
    if (mChapterIndex == self->mChapterInfo[2].chapterNumber)
    {
      MinX = -CGRectGetMinX(self->mChapterInfo[1].frame);
      mChapterIndex = self->mChapterIndex;
    }
    else
    {
      MinX = 0.0;
    }
    chapterNumber = mChapterInfo->chapterNumber;
    -[THChapterBrowserController p_updateChapterWidths](self, "p_updateChapterWidths");
    v8 = v7;
    if (mChapterIndex == chapterNumber)
      MinX = CGRectGetMinX(mChapterInfo[1].frame);
    -[THScrollViewWithPassthrough contentOffset](self->mPagesScrollView, "contentOffset");
    v10 = v9;
    v12 = v11;
    ++self->mSuspendThumbViewUpdates;
    -[THScrollViewWithPassthrough bounds](self->mPagesScrollView, "bounds");
    -[THScrollViewWithPassthrough setContentSize:](self->mPagesScrollView, "setContentSize:", v8 + 1.0, CGRectGetHeight(v27));
    v13 = -CGRectGetMinX(mChapterInfo[1].frame);
    -[THScrollViewWithPassthrough setContentInset:](self->mPagesScrollView, "setContentInset:", 0.0, v13, 0.0, -CGRectGetWidth(mChapterInfo[2].frame));
    v14 = MinX + v10;
    -[THScrollViewWithPassthrough setContentOffset:](self->mPagesScrollView, "setContentOffset:", v14, v12);
    self->mPreservedThumbnailOffset.x = v14;
    self->mPreservedThumbnailOffset.y = v12;
    if (MinX != 0.0)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController thumbnailSubviews](self, "thumbnailSubviews", 0));
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(_QWORD *)v23 != v17)
              objc_enumerationMutation(v15);
            v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v19, "frame");
            objc_msgSend(v19, "setFrame:", MinX + v20);
          }
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v16);
      }

    }
    -[THScrollViewWithPassthrough contentOffset](self->mPagesScrollView, "contentOffset");
    self->mPageThumbScrollerStartContentOffset = v21;
    --self->mSuspendThumbViewUpdates;
  }
}

- (id)p_thumbShownForChapter:(unint64_t)a3 index:(unint64_t)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController thumbnailSubviews](self, "thumbnailSubviews", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "chapterIndex") == (id)a3 && objc_msgSend(v10, "pageIndex") == (id)a4)
        {
          v11 = v10;
          goto LABEL_12;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (CGRect)frameForPageThumbAtIndex:(unint64_t)a3 chapterIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  double x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v14;
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
  CGRect v26;
  CGRect result;

  if (self->mChapterIndex != a4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterBrowserController frameForPageThumbAtIndex:chapterIndex:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterBrowserController.mm"));
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, v9, 2130, CFSTR("chapter %lu index should match the current mChapterIndex: %lu."), a4, self->mChapterIndex);

  }
  x = self->mChapterInfo[1].frame.origin.x;
  y = self->mChapterInfo[1].frame.origin.y;
  width = self->mChapterInfo[1].frame.size.width;
  height = self->mChapterInfo[1].frame.size.height;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[THChapterBrowserController thumbSize](self, "thumbSize");
    v15 = v14;
    -[THChapterBrowserController firstThumbOverlap](self, "firstThumbOverlap");
    v17 = v16;
    -[THChapterBrowserController thumbSize](self, "thumbSize");
    v19 = v18;
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    v20 = CGRectGetMinX(v26) + (double)a3 * v15;
    v21 = -0.0;
    if (a3)
      v21 = v17;
    x = v21 + v20;
    y = 0.0;
    width = v15;
    height = v19;
  }
  v22 = x;
  v23 = y;
  v24 = width;
  v25 = height;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void)p_updatePageThumbnails:(BOOL)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double Width;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat y;
  CGFloat v23;
  CGFloat height;
  void *v25;
  id v26;
  uint64_t v27;
  void *i;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  void *j;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  $DDEFF0282EF51F97FF1616E639F089D2 *v39;
  CGFloat *p_x;
  double MinX;
  double v42;
  $DDEFF0282EF51F97FF1616E639F089D2 *v43;
  unint64_t firstRelativePageToShowDuringBackgroundScroll;
  unint64_t *p_firstRelativePageToShowDuringBackgroundScroll;
  unint64_t v46;
  float v47;
  float v48;
  unint64_t v49;
  unint64_t *p_numberOfPages;
  unint64_t numberOfPages;
  double v52;
  unint64_t v53;
  void *v54;
  uint64_t v55;
  CGFloat *v56;
  double v57;
  double v58;
  unint64_t v59;
  unint64_t v60;
  float v61;
  float v62;
  unint64_t v63;
  double v64;
  unint64_t v65;
  uint64_t v66;
  double v67;
  void *v68;
  double v69;
  double v70;
  unint64_t v71;
  double v72;
  THPageThumbnailView *v73;
  double v74;
  uint64_t v75;
  double v76;
  double v77;
  THScrollViewWithPassthrough *mPagesScrollView;
  void *v79;
  unsigned __int8 v80;
  void *v81;
  void *v82;
  BOOL v83;
  id v84;
  void *v85;
  void *v86;
  id v87;
  uint64_t v88;
  double v89;
  id v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  _BOOL8 v96;
  void *v97;
  double v98;
  id v99;
  id v100;
  uint64_t v101;
  void *k;
  id v103;
  id v104;
  uint64_t v105;
  void *m;
  void *v107;
  id v108;
  id v109;
  double v110;
  CGFloat r1;
  _BOOL4 v112;
  double v113;
  $DDEFF0282EF51F97FF1616E639F089D2 *mChapterInfo;
  uint64_t v115;
  id *p_tileModel;
  $DDEFF0282EF51F97FF1616E639F089D2 *v117;
  unint64_t *v118;
  double v119;
  CGFloat rect1;
  $DDEFF0282EF51F97FF1616E639F089D2 *rect1_8;
  unint64_t *rect1_16;
  THChapterBrowserController *rect1_24;
  id v124;
  id v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  _QWORD v134[5];
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;

  v112 = a3;
  if (self->mSuspendThumbViewUpdates || self->mDraggingInScrubber)
    return;
  -[THChapterBrowserController thumbSize](self, "thumbSize");
  v5 = v4;
  -[THChapterBrowserController thumbSize](self, "thumbSize");
  r1 = v6;
  -[THChapterBrowserController firstThumbSize](self, "firstThumbSize");
  v113 = v7;
  -[THChapterBrowserController firstThumbSize](self, "firstThumbSize");
  v110 = v8;
  -[THChapterBrowserController firstThumbOverlap](self, "firstThumbOverlap");
  v119 = v9;
  -[THScrollViewWithPassthrough frame](self->mPagesScrollView, "frame");
  Width = CGRectGetWidth(v147);
  -[THScrollViewWithPassthrough frame](self->mPagesScrollView, "frame");
  v11 = CGRectGetWidth(v148);
  rect1_24 = self;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController view](self, "view"));
  objc_msgSend(v12, "safeAreaInsets");
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController view](rect1_24, "view"));
  objc_msgSend(v15, "safeAreaInsets");
  v17 = v14 - (v11 - v5 * (double)(unint64_t)ceil((Width + 2.0) / v5)) + v16;

  -[THScrollViewWithPassthrough contentOffset](rect1_24->mPagesScrollView, "contentOffset");
  v19 = v18 + v17 * -0.5;
  -[THScrollViewWithPassthrough frame](rect1_24->mPagesScrollView, "frame");
  v20 = v17 + CGRectGetWidth(v149);
  -[THScrollViewWithPassthrough contentSize](rect1_24->mPagesScrollView, "contentSize");
  v164.size.width = v21;
  v150.origin.y = 0.0;
  v164.origin.x = 0.0;
  v164.origin.y = 0.0;
  v150.origin.x = v19;
  v150.size.width = v20;
  v150.size.height = r1;
  v164.size.height = r1;
  v151 = CGRectIntersection(v150, v164);
  rect1 = v151.origin.x;
  y = v151.origin.y;
  v23 = v151.size.width;
  height = v151.size.height;
  v124 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 8);
  v125 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
  v141 = 0u;
  v142 = 0u;
  v139 = 0u;
  v140 = 0u;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController thumbnailSubviews](rect1_24, "thumbnailSubviews"));
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v139, v146, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v140;
    do
    {
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(_QWORD *)v140 != v27)
          objc_enumerationMutation(v25);
        v29 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v29, "pageIndex"))
          v30 = v124;
        else
          v30 = v125;
        objc_msgSend(v30, "addObject:", v29);
      }
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v139, v146, 16);
    }
    while (v26);
  }

  v137 = 0u;
  v138 = 0u;
  v135 = 0u;
  v136 = 0u;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[THScrollViewWithPassthrough subviews](rect1_24->mPagesScrollView, "subviews"));
  v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v135, v145, 16);
  if (v33)
  {
    v34 = *(_QWORD *)v136;
    while (2)
    {
      for (j = 0; j != v33; j = (char *)j + 1)
      {
        if (*(_QWORD *)v136 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * (_QWORD)j);
        v37 = objc_opt_class(THPageThumbnailView, v32);
        if ((objc_opt_isKindOfClass(v36, v37) & 1) == 0)
        {
          v108 = v36;
          goto LABEL_23;
        }
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v135, v145, 16);
      if (v33)
        continue;
      break;
    }
  }
  v108 = 0;
LABEL_23:

  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  v38 = 0;
  mChapterInfo = rect1_24->mChapterInfo;
  do
  {
    v39 = &mChapterInfo[v38];
    if (v39->tileModel)
    {
      p_x = &v39->frame.origin.x;
      v152.origin.x = rect1;
      v152.origin.y = y;
      v152.size.width = v23;
      v152.size.height = height;
      if (CGRectIntersectsRect(v152, v39->frame))
      {
        v153.origin.x = rect1;
        v153.origin.y = y;
        v153.size.width = v23;
        v153.size.height = height;
        MinX = CGRectGetMinX(v153);
        v154.origin.x = *p_x;
        v154.origin.y = v39->frame.origin.y;
        v154.size.width = v39->frame.size.width;
        v154.size.height = v39->frame.size.height;
        v42 = MinX - CGRectGetMinX(v154);
        v43 = &mChapterInfo[v38];
        p_firstRelativePageToShowDuringBackgroundScroll = &v43->firstRelativePageToShowDuringBackgroundScroll;
        firstRelativePageToShowDuringBackgroundScroll = v43->firstRelativePageToShowDuringBackgroundScroll;
        if (v42 >= v113)
        {
          v47 = (v42 - v119) / v5;
          v48 = floorf(v47);
          if (v48 < 0.0)
            v48 = 0.0;
          v46 = (uint64_t)(float)(v48 + (float)firstRelativePageToShowDuringBackgroundScroll);
        }
        else
        {
          v46 = 0;
        }
        numberOfPages = v43->numberOfPages;
        p_numberOfPages = &v43->numberOfPages;
        v49 = numberOfPages;
        while (v46 < firstRelativePageToShowDuringBackgroundScroll + v49)
        {
          v155.origin.x = *p_x;
          v155.origin.y = v39->frame.origin.y;
          v155.size.width = v39->frame.size.width;
          v155.size.height = v39->frame.size.height;
          v52 = CGRectGetMinX(v155);
          v156.origin.x = rect1;
          v156.origin.y = y;
          v156.size.width = v23;
          v156.size.height = height;
          if (v119 + v52 + (double)(v46 - firstRelativePageToShowDuringBackgroundScroll) * v5 >= CGRectGetMaxX(v156))
            break;
          if (v46 == *p_firstRelativePageToShowDuringBackgroundScroll)
            v53 = 0;
          else
            v53 = v46;
          v54 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController p_thumbShownForChapter:index:](rect1_24, "p_thumbShownForChapter:index:", v39->chapterNumber, v53, v108));
          if (v54)
          {
            objc_msgSend(v125, "removeObjectIdenticalTo:", v54);
            objc_msgSend(v124, "removeObjectIdenticalTo:", v54);
          }

          v46 = v53 + 1;
          v49 = *p_numberOfPages;
          firstRelativePageToShowDuringBackgroundScroll = *p_firstRelativePageToShowDuringBackgroundScroll;
        }
      }
    }
    ++v38;
  }
  while (v38 != 3);
  v55 = 0;
  do
  {
    v115 = v55;
    rect1_8 = &mChapterInfo[v55];
    p_tileModel = (id *)&rect1_8->tileModel;
    if (rect1_8->tileModel)
    {
      v56 = &rect1_8->frame.origin.x;
      v157.origin.x = rect1;
      v157.origin.y = y;
      v157.size.width = v23;
      v157.size.height = height;
      if (CGRectIntersectsRect(v157, rect1_8->frame))
      {
        v158.origin.x = rect1;
        v158.origin.y = y;
        v158.size.width = v23;
        v158.size.height = height;
        v57 = CGRectGetMinX(v158);
        v159.origin.x = *v56;
        v159.origin.y = rect1_8->frame.origin.y;
        v159.size.width = rect1_8->frame.size.width;
        v159.size.height = rect1_8->frame.size.height;
        v58 = v57 - CGRectGetMinX(v159);
        v117 = &mChapterInfo[v115];
        v59 = v117->firstRelativePageToShowDuringBackgroundScroll;
        rect1_16 = &v117->firstRelativePageToShowDuringBackgroundScroll;
        if (v58 >= v113)
        {
          v61 = (v58 - v119) / v5;
          v62 = floorf(v61);
          if (v62 < 0.0)
            v62 = 0.0;
          v60 = (uint64_t)(float)(v62 + (float)v59);
        }
        else
        {
          v60 = 0;
        }
        v63 = v117->numberOfPages;
        v118 = &v117->numberOfPages;
        while (1)
        {
          if (v60 >= v59 + v63)
            goto LABEL_92;
          v160.origin.x = *v56;
          v160.origin.y = rect1_8->frame.origin.y;
          v160.size.width = rect1_8->frame.size.width;
          v160.size.height = rect1_8->frame.size.height;
          v64 = CGRectGetMinX(v160);
          v161.origin.x = rect1;
          v161.origin.y = y;
          v161.size.width = v23;
          v161.size.height = height;
          if (v119 + v64 + (double)(v60 - v59) * v5 >= CGRectGetMaxX(v161))
            goto LABEL_92;
          v65 = *rect1_16;
          v66 = v60 == *rect1_16 ? 0 : v60;
          v162.origin.x = *v56;
          v162.origin.y = rect1_8->frame.origin.y;
          v162.size.width = rect1_8->frame.size.width;
          v162.size.height = rect1_8->frame.size.height;
          v67 = CGRectGetMinX(v162);
          v68 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController view](rect1_24, "view"));
          objc_msgSend(v68, "safeAreaInsets");
          v70 = v69;
          if (v60 == v65)
          {
            v71 = 0;
            v72 = -0.0;
          }
          else
          {
            v71 = v60 - *rect1_16;
            v72 = v119;
          }

          v73 = (THPageThumbnailView *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController p_thumbShownForChapter:index:](rect1_24, "p_thumbShownForChapter:index:", rect1_8->chapterNumber, v66));
          v74 = v72 + v67 + v70 + (double)v71 * v5;
          if (!v73)
            break;
LABEL_87:
          v97 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](rect1_24, "delegate", v108));
          -[THPageThumbnailView setIsCurrentPage:](v73, "setIsCurrentPage:", objc_msgSend(v97, "chapterBrowserController:isCurrentlyDisplayedPageForRelativePageIndex:andChapterIndex:", rect1_24, v66, rect1_8->chapterNumber));

          -[THPageThumbnailView frame](v73, "frame");
          if (v98 != v74)
            -[THPageThumbnailView setFrame:](v73, "setFrame:", v74);
          if (!v66)
            v60 = *rect1_16;

          ++v60;
          v63 = *v118;
          v59 = *rect1_16;
        }
        if (v60 == v65)
        {
          v75 = objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "lastObject"));
          v76 = v113;
          v77 = v110;
          if (v75)
          {
            v73 = (THPageThumbnailView *)v75;
            objc_msgSend(v125, "removeLastObject");
            goto LABEL_69;
          }
        }
        else
        {
          v73 = (THPageThumbnailView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "lastObject"));
          v76 = v5;
          v77 = r1;
          if (v73)
          {
            objc_msgSend(v124, "removeLastObject");
            goto LABEL_69;
          }
        }
        -[THScrollViewWithPassthrough bounds](rect1_24->mPagesScrollView, "bounds", v108);
        v73 = -[THPageThumbnailView initWithFrame:isFirstThumbnail:delegate:]([THPageThumbnailView alloc], "initWithFrame:isFirstThumbnail:delegate:", v60 == v65, rect1_24, v74, CGRectGetHeight(v163) - v77, v76, v77);
        mPagesScrollView = rect1_24->mPagesScrollView;
        if (v108)
          -[THScrollViewWithPassthrough insertSubview:belowSubview:](mPagesScrollView, "insertSubview:belowSubview:", v73);
        else
          -[THScrollViewWithPassthrough addSubview:](mPagesScrollView, "addSubview:", v73);
        v79 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](rect1_24, "delegate"));
        v80 = objc_msgSend(v79, "isTwoUpForChapterBrowserController:", rect1_24);

        if ((v80 & 1) == 0)
          -[THPageThumbnailView setupFreeTransformWithDelegate:](v73, "setupFreeTransformWithDelegate:", rect1_24);
LABEL_69:
        -[THPageThumbnailView setPageIndex:](v73, "setPageIndex:", v66, v108);
        v81 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController thumbnailsHiddenForPinch](rect1_24, "thumbnailsHiddenForPinch"));
        v134[0] = _NSConcreteStackBlock;
        v134[1] = 3221225472;
        v134[2] = sub_9C514;
        v134[3] = &unk_428C70;
        v134[4] = v66;
        v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "objectsPassingTest:", v134));
        v83 = objc_msgSend(v82, "count") != 0;

        -[THPageThumbnailView setHidden:](v73, "setHidden:", (v115 == 1) & v83);
        -[THPageThumbnailView setChapterIndex:](v73, "setChapterIndex:", rect1_8->chapterNumber);
        v84 = *p_tileModel;
        v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "displayPageNumberForPageIndex:", (char *)objc_msgSend(v84, "pageIndex") + v66));
        if (!v85)
        {
          v86 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](rect1_24, "delegate"));
          v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "chapterBrowserController:pageNumberStringForRelativePageIndex:andChapterIndex:", rect1_24, v66, rect1_8->chapterNumber));

        }
        v87 = -[THPageThumbnailView setPageNumberText:](v73, "setPageNumberText:", v85);
        v89 = TSUScreenScale(v87, v88);
        v90 = *p_tileModel;
        if (v89 <= 1.0)
        {
          v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "tinyThumbs"));
          if (v66 < (unint64_t)objc_msgSend(v91, "count"))
          {
            v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_tileModel, "tinyThumbs"));
            v93 = objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "objectAtIndex:", v66));
            goto LABEL_76;
          }
        }
        else
        {
          v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "largerThumbs"));
          if (v66 < (unint64_t)objc_msgSend(v91, "count"))
          {
            v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_tileModel, "largerThumbs"));
            v93 = objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "objectAtIndex:", v66));
LABEL_76:
            v94 = (void *)v93;

LABEL_78:
            if (v94)
            {
              v95 = v60 == v65 || v112;
              -[THPageThumbnailView setImageData:immediate:](v73, "setImageData:immediate:", v94, v95);
            }
            v96 = v66 >= 1 && v66 == *v118 + *rect1_16 - 1;
            -[THPageThumbnailView setHasRightBorder:](v73, "setHasRightBorder:", v96);

            goto LABEL_87;
          }
        }
        v94 = 0;
        goto LABEL_78;
      }
    }
LABEL_92:
    v55 = v115 + 1;
  }
  while (v115 != 2);
  v132 = 0u;
  v133 = 0u;
  v130 = 0u;
  v131 = 0u;
  v99 = v125;
  v100 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v130, v144, 16);
  if (v100)
  {
    v101 = *(_QWORD *)v131;
    do
    {
      for (k = 0; k != v100; k = (char *)k + 1)
      {
        if (*(_QWORD *)v131 != v101)
          objc_enumerationMutation(v99);
        objc_msgSend(*(id *)(*((_QWORD *)&v130 + 1) + 8 * (_QWORD)k), "removeFromSuperview", v108);
      }
      v100 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v130, v144, 16);
    }
    while (v100);
  }

  v128 = 0u;
  v129 = 0u;
  v126 = 0u;
  v127 = 0u;
  v103 = v124;
  v104 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v126, v143, 16);
  if (v104)
  {
    v105 = *(_QWORD *)v127;
    do
    {
      for (m = 0; m != v104; m = (char *)m + 1)
      {
        if (*(_QWORD *)v127 != v105)
          objc_enumerationMutation(v103);
        objc_msgSend(*(id *)(*((_QWORD *)&v126 + 1) + 8 * (_QWORD)m), "removeFromSuperview", v108);
      }
      v104 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v126, v143, 16);
    }
    while (v104);
  }

  +[CATransaction commit](CATransaction, "commit");
  if (v108)
  {
    -[THScrollViewWithPassthrough bringSubviewToFront:](rect1_24->mPagesScrollView, "bringSubviewToFront:", v108);
    v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "layer"));
    objc_msgSend(v107, "setZPosition:", 2.0);

  }
  objc_msgSend(v103, "makeObjectsPerformSelector:", "teardown", v108);
  objc_msgSend(v99, "makeObjectsPerformSelector:", "teardown");

}

- (BOOL)p_isTOCLandscape
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController bookPropertiesDelegate](self, "bookPropertiesDelegate"));
  v3 = objc_msgSend(v2, "bookIsPaginatedForLandscape");

  return v3;
}

- (int)p_chapterIndexForCurrentScrollPosition
{
  double v3;
  double v4;
  double v5;

  -[THScrollView contentOffset](self->mBackgroundScrollView, "contentOffset");
  v4 = v3;
  -[THChapterBrowserController chapterWidth](self, "chapterWidth");
  return (int)(v4 / v5 + 0.5);
}

- (void)p_recoverFromFastScrollingDesynchronization
{
  if (-[THChapterViewController chapterIndex](self->mChapterViewControllers[1], "chapterIndex") != self->mChapterIndex)
    -[THChapterBrowserController p_setupChapterViewControllerAtIndex:withChapterIndex:allowThumbnail:](self, "p_setupChapterViewControllerAtIndex:withChapterIndex:allowThumbnail:", 1);
}

- (void)p_backgroundScrollingDidEnd
{
  uint64_t v3;
  unint64_t mBackgroundSwipeBeginningChapter;
  UIScrollView **p_mUpdatingScrollView;
  double mPageThumbScrollerStartContentOffsetBeforeBackgroundDrag;
  UIScrollView *v7;

  self->mBackgroundSwipeDidInitiateScroll = 0;
  v3 = -[THChapterBrowserController p_chapterIndexForCurrentScrollPosition](self, "p_chapterIndexForCurrentScrollPosition");
  mBackgroundSwipeBeginningChapter = self->mBackgroundSwipeBeginningChapter;
  -[THChapterBrowserController p_setChapterIndex:forScrub:stillScrolling:](self, "p_setChapterIndex:forScrub:stillScrolling:", v3, 0, 0);
  -[THChapterBrowserController p_recoverFromFastScrollingDesynchronization](self, "p_recoverFromFastScrollingDesynchronization");
  p_mUpdatingScrollView = &self->mUpdatingScrollView;
  objc_storeStrong((id *)&self->mUpdatingScrollView, self->mBackgroundScrollView);
  if (self->mPullThroughInProgress)
  {
    -[THChapterBrowserController p_updatePagesScrollView](self, "p_updatePagesScrollView");
  }
  else
  {
    -[THChapterBrowserController p_resetPagesScrollViewAndCapThumbCount:firstVisibleRelativePage:resetContentOffset:](self, "p_resetPagesScrollViewAndCapThumbCount:firstVisibleRelativePage:resetContentOffset:", 0, 0, 1);
    if (mBackgroundSwipeBeginningChapter == v3
      && (mPageThumbScrollerStartContentOffsetBeforeBackgroundDrag = self->mPageThumbScrollerStartContentOffsetBeforeBackgroundDrag,
          mPageThumbScrollerStartContentOffsetBeforeBackgroundDrag > 0.0))
    {
      -[THScrollViewWithPassthrough contentOffset](self->mPagesScrollView, "contentOffset");
      -[THScrollViewWithPassthrough setContentOffset:](self->mPagesScrollView, "setContentOffset:", mPageThumbScrollerStartContentOffsetBeforeBackgroundDrag);
      self->mPageThumbScrollerStartContentOffset = self->mPageThumbScrollerStartContentOffsetBeforeBackgroundDrag;
      self->mPreservedThumbnailOffset.x = self->mPageThumbScrollerStartContentOffsetBeforeBackgroundDrag;
    }
    else
    {
      self->mPreservedThumbnailOffset.x = 0.0;
      self->mPageThumbScrollerStartContentOffset = 0.0;
      self->mPageThumbScrollerStartContentOffsetBeforeBackgroundDrag = 0.0;
    }
  }
  v7 = *p_mUpdatingScrollView;
  *p_mUpdatingScrollView = 0;

  if (!self->mDraggingInScrubber)
  {
    -[THChapterBrowserController p_startIntroMediaIfNecessary](self, "p_startIntroMediaIfNecessary");
    if (!(_DWORD)v3)
      -[THChapterBrowserController p_updatePageControl](self, "p_updatePageControl");
  }
  -[THScrollViewWithPassthrough setUserInteractionEnabled:](self->mPagesScrollView, "setUserInteractionEnabled:", 1);
  -[THChapterBrowserScrubbablePageControl setUserInteractionEnabled:](self->mChapterPageControl, "setUserInteractionEnabled:", 1);
}

- (double)p_pagesScrollViewNextChapterThreshhold
{
  double v3;
  double v4;
  unsigned int v5;
  double result;

  -[THChapterBrowserController thumbSize](self, "thumbSize");
  v4 = v3;
  v5 = -[THChapterBrowserController im_isCompactWidth](self, "im_isCompactWidth");
  result = v4 * 0.5;
  if (!v5)
    return v4;
  return result;
}

- (void)p_pageThumbScrollingDidEnd
{
  unint64_t mChapterIndex;
  double v4;
  double v5;
  CGFloat MinX;
  double MaxX;
  double v8;
  double v9;
  double v10;
  double v12;
  double v13;
  void *v14;
  char *v15;
  double v16;
  THScrollView *mBackgroundScrollView;
  double v18;

  mChapterIndex = self->mChapterIndex;
  -[THScrollViewWithPassthrough contentOffset](self->mPagesScrollView, "contentOffset");
  v5 = v4;
  MinX = CGRectGetMinX(self->mChapterInfo[1].frame);
  MaxX = CGRectGetMaxX(self->mChapterInfo[1].frame);
  -[THChapterBrowserController p_pagesScrollViewNextChapterThreshhold](self, "p_pagesScrollViewNextChapterThreshhold");
  v9 = v8;
  if (v5 < MinX)
  {
    v10 = MinX - v8;
    if (self->mChapterIndex && v5 < v10)
    {
      --mChapterIndex;
      self->mPageThumbScrollerStartContentOffset = MinX;
    }
  }
  -[THChapterBrowserController chapterWidth](self, "chapterWidth");
  if (v5 + v12 >= MaxX)
  {
    -[THChapterBrowserController chapterWidth](self, "chapterWidth");
    if (v5 + v13 >= MaxX + v9)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController dataSource](self, "dataSource"));
      v15 = (char *)objc_msgSend(v14, "toc:numberOfTilesInDivision:", self, 0);

      if (mChapterIndex < (unint64_t)(v15 - 1))
      {
        ++mChapterIndex;
        -[THChapterBrowserController chapterWidth](self, "chapterWidth");
        self->mPageThumbScrollerStartContentOffset = MaxX - v16;
      }
    }
  }
  if (mChapterIndex != self->mChapterIndex)
  {
    self->mPullThroughInProgress = 1;
    -[THScrollView setScrollEnabled:](self->mBackgroundScrollView, "setScrollEnabled:", 0);
    mBackgroundScrollView = self->mBackgroundScrollView;
    -[THChapterBrowserController chapterWidth](self, "chapterWidth");
    -[THScrollView setContentOffset:animated:](mBackgroundScrollView, "setContentOffset:animated:", 1, v18 * (double)mChapterIndex, 0.0);
    -[THScrollView setScrollEnabled:](self->mBackgroundScrollView, "setScrollEnabled:", 1);
  }
}

- (void)p_updatePageControl
{
  void *v3;
  char *v4;
  char *v5;
  double v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController dataSource](self, "dataSource"));
  v4 = (char *)objc_msgSend(v3, "toc:numberOfTilesInDivision:", self, 0);
  v5 = &v4[-[THChapterBrowserController hasIntroPage](self, "hasIntroPage")];

  -[THChapterBrowserScrubbablePageControl setNumberOfPages:](self->mChapterPageControl, "setNumberOfPages:", v5);
  -[THScrollView contentOffset](self->mBackgroundScrollView, "contentOffset");
  -[THChapterBrowserScrubbablePageControl setCurrentPage:](self->mChapterPageControl, "setCurrentPage:", (char *)-[THChapterBrowserController chapterIndex](self, "chapterIndex")+ -[THChapterBrowserController hasIntroPage](self, "hasIntroPage")- (v6 < 0.0));
  -[THChapterBrowserScrubbablePageControl centerHorizontallyInSuperview](self->mChapterPageControl, "centerHorizontallyInSuperview");
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v4;
  THScrollViewWithPassthrough *mPagesScrollView;
  double v6;
  double v7;
  double MinX;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  float v14;
  float v15;
  double v16;
  double v17;
  double v18;
  THScrollView *v19;

  v19 = (THScrollView *)a3;
  if (self->mBackgroundScrollView == v19)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
    objc_msgSend(v4, "cancelPreloadOfContentNodesForChapterBrowserController:", self);

    self->mBackgroundSwipeDidInitiateScroll = 1;
    mPagesScrollView = self->mPagesScrollView;
    -[THScrollViewWithPassthrough contentOffset](mPagesScrollView, "contentOffset");
    -[THScrollViewWithPassthrough setContentOffset:animated:](mPagesScrollView, "setContentOffset:animated:", 0);
    if ((-[THScrollView isDecelerating](v19, "isDecelerating") & 1) == 0)
    {
      self->mBackgroundSwipeBeginningChapter = self->mChapterIndex;
      -[THScrollViewWithPassthrough contentOffset](self->mPagesScrollView, "contentOffset");
      v7 = v6;
      MinX = CGRectGetMinX(self->mChapterInfo[1].frame);
      -[THScrollViewWithPassthrough contentOffset](self->mPagesScrollView, "contentOffset");
      self->mPageThumbScrollerStartContentOffset = v9;
      self->mPageThumbScrollerStartContentOffsetBeforeBackgroundDrag = v9;
      -[THChapterBrowserController thumbSize](self, "thumbSize");
      v11 = v10;
      -[THChapterBrowserController firstThumbOverlap](self, "firstThumbOverlap");
      v12 = v7 - MinX;
      *(float *)&v13 = (v12 - v13) / v11;
      v14 = floorf(*(float *)&v13);
      if (v14 > 0.0)
        v15 = v14;
      else
        v15 = 0.0;
      v16 = 0.0;
      if (-[THChapterBrowserController maximumNumberOfThumbsToLeftOfLeftmostDuringBackgroundDrag](self, "maximumNumberOfThumbsToLeftOfLeftmostDuringBackgroundDrag") <= (uint64_t)v15)v16 = (double)((uint64_t)v15- -[THChapterBrowserController maximumNumberOfThumbsToLeftOfLeftmostDuringBackgroundDrag](self, "maximumNumberOfThumbsToLeftOfLeftmostDuringBackgroundDrag"));
      ++self->mSuspendThumbViewUpdates;
      -[THChapterBrowserController p_resetPagesScrollViewAndCapThumbCount:firstVisibleRelativePage:resetContentOffset:](self, "p_resetPagesScrollViewAndCapThumbCount:firstVisibleRelativePage:resetContentOffset:", 1, (uint64_t)v15, 1);
      --self->mSuspendThumbViewUpdates;
      v17 = CGRectGetMinX(self->mChapterInfo[1].frame);
      -[THScrollViewWithPassthrough contentOffset](self->mPagesScrollView, "contentOffset");
      -[THScrollViewWithPassthrough setContentOffset:](self->mPagesScrollView, "setContentOffset:", v12 + v17 - v11 * v16);
      -[THScrollViewWithPassthrough contentOffset](self->mPagesScrollView, "contentOffset");
      self->mPageThumbScrollerStartContentOffset = v18;
      -[THChapterBrowserController p_updatePageThumbnails:](self, "p_updatePageThumbnails:", 1);
    }
    -[THScrollViewWithPassthrough setUserInteractionEnabled:](self->mPagesScrollView, "setUserInteractionEnabled:", 0);
  }
  -[THChapterBrowserScrubbablePageControl setUserInteractionEnabled:](self->mChapterPageControl, "setUserInteractionEnabled:", 0);

}

- (void)scrollViewDidScroll:(id)a3
{
  THScrollViewWithPassthrough *v4;
  UIScrollView **p_mUpdatingScrollView;
  unint64_t mChapterIndex;
  double v7;
  UIScrollView *v8;
  double v9;
  double v10;
  unint64_t v11;
  double v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  double v16;
  double v17;
  UIScrollView **v18;
  uint64_t v19;
  unint64_t v20;
  $DDEFF0282EF51F97FF1616E639F089D2 *mChapterInfo;
  unint64_t v22;
  unint64_t chapterNumber;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  _BOOL4 mBackgroundSwipeDidInitiateScroll;
  void *v29;
  id v30;
  unint64_t v31;
  _BOOL4 v32;
  void *v33;
  THChapterViewController *v34;
  UIView *mBackgroundsView;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  _BOOL4 v47;
  BOOL v48;
  UIScrollView *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  unsigned int v57;
  void *v58;
  void *v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  unint64_t v64;
  THScrollViewWithPassthrough *v65;

  v4 = (THScrollViewWithPassthrough *)a3;
  v65 = v4;
  if ((THScrollViewWithPassthrough *)self->mBackgroundScrollView != v4 || self->mDeferBackgroundScrollViewScrolls)
  {
    if (self->mPagesScrollView == v4 && !self->mDeferPagesScrollViewScrolls)
    {
      -[THChapterBrowserController p_updatePageThumbnails:](self, "p_updatePageThumbnails:", 1);
      if (self->mPullThroughInProgress)
      {
        p_mUpdatingScrollView = &self->mUpdatingScrollView;
        if (self->mUpdatingScrollView != (UIScrollView *)self->mBackgroundScrollView)
        {
          objc_storeStrong((id *)&self->mUpdatingScrollView, self->mPagesScrollView);
          mChapterIndex = self->mChapterIndex;
          -[THChapterBrowserController chapterWidth](self, "chapterWidth");
          -[THScrollView setContentOffset:](self->mBackgroundScrollView, "setContentOffset:", v7 * (double)mChapterIndex, 0.0);
          v8 = *p_mUpdatingScrollView;
          *p_mUpdatingScrollView = 0;
LABEL_75:

          goto LABEL_76;
        }
      }
    }
    goto LABEL_76;
  }
  -[THScrollViewWithPassthrough contentOffset](v4, "contentOffset");
  v10 = v9;
  v11 = self->mChapterIndex;
  if (v11)
  {
    -[THChapterBrowserController chapterWidth](self, "chapterWidth");
    if (v10 < v12 * (double)(v11 - 1))
    {
LABEL_14:
      -[THChapterBrowserController p_setChapterIndex:forScrub:stillScrolling:](self, "p_setChapterIndex:forScrub:stillScrolling:", -[THChapterBrowserController p_chapterIndexForCurrentScrollPosition](self, "p_chapterIndexForCurrentScrollPosition"), 0, 1);
      goto LABEL_16;
    }
    v13 = self->mChapterIndex;
  }
  else
  {
    v13 = 0;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController dataSource](self, "dataSource"));
  if (v13 + 1 >= (unint64_t)objc_msgSend(v14, "toc:numberOfTilesInDivision:", self, 0))
  {

    goto LABEL_16;
  }
  v15 = self->mChapterIndex;
  -[THChapterBrowserController chapterWidth](self, "chapterWidth");
  v17 = v16 * (double)(v15 + 1);

  if (v10 > v17)
    goto LABEL_14;
LABEL_16:
  v18 = &self->mUpdatingScrollView;
  if (self->mUpdatingScrollView == &self->mPagesScrollView->super
    || self->mSuspendThumbViewUpdates
    || self->mDraggingInScrubber)
  {
    goto LABEL_60;
  }
  objc_storeStrong((id *)&self->mUpdatingScrollView, self->mBackgroundScrollView);
  v19 = 0;
  v20 = 0;
  mChapterInfo = self->mChapterInfo;
  v22 = 0xFFFFFFFFLL;
  do
  {
    chapterNumber = mChapterInfo[v19].chapterNumber;
    if (v22 >= chapterNumber)
      v24 = mChapterInfo[v19].chapterNumber;
    else
      v24 = v22;
    if (v20 <= chapterNumber)
      v25 = mChapterInfo[v19].chapterNumber;
    else
      v25 = v20;
    if (chapterNumber != 0x7FFFFFFFFFFFFFFFLL)
    {
      v20 = v25;
      v22 = v24;
    }
    ++v19;
  }
  while (v19 != 3);
  v26 = self->mChapterIndex;
  if (v26 <= v20 && v26 >= v22)
  {
    if (mChapterInfo->chapterNumber != 0x7FFFFFFFFFFFFFFFLL
      || self->mPullThroughInProgress
      || (mBackgroundSwipeDidInitiateScroll = self->mBackgroundSwipeDidInitiateScroll))
    {
      -[THChapterBrowserController p_updatePagesScrollView](self, "p_updatePagesScrollView");
      goto LABEL_39;
    }
  }
  else
  {
    mBackgroundSwipeDidInitiateScroll = self->mBackgroundSwipeDidInitiateScroll;
  }
  -[THChapterBrowserController p_resetPagesScrollViewAndCapThumbCount:firstVisibleRelativePage:resetContentOffset:](self, "p_resetPagesScrollViewAndCapThumbCount:firstVisibleRelativePage:resetContentOffset:", mBackgroundSwipeDidInitiateScroll, 0, 1);
LABEL_39:
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController dataSource](self, "dataSource"));
  v30 = objc_msgSend(v29, "toc:numberOfTilesInDivision:", self, 0);

  v31 = self->mChapterInfo[1].chapterNumber;
  v64 = (unint64_t)v30;
  if (v31)
  {
    v32 = 1;
  }
  else
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController introMediaViewController](self, "introMediaViewController"));
    v32 = v33 != 0;

  }
  v34 = self->mChapterViewControllers[1];
  if (v34)
  {
    mBackgroundsView = self->mBackgroundsView;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterViewController view](v34, "view"));
    objc_msgSend(v36, "frame");
    v38 = v37;
    v40 = v39;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController view](self, "view"));
    -[UIView convertPoint:toView:](mBackgroundsView, "convertPoint:toView:", v41, v38, v40);
    v43 = v42;

    -[THChapterBrowserController chapterWidth](self, "chapterWidth");
    v45 = v43 / v44;
    if (self->mPullThroughInProgress)
      v46 = self->mPageThumbScrollerStartContentOffset - v43;
    else
      v46 = v45 >= 0.0
          ? (1.0 - v45) * self->mPageThumbScrollerStartContentOffset
          : self->mPageThumbScrollerStartContentOffset
          - v45 * (CGRectGetMaxX(self->mChapterInfo[1].frame) - self->mPageThumbScrollerStartContentOffset);
    v47 = v45 >= 0.0 && v32;
    v48 = v45 > 0.0 || v31 + 1 >= v64;
    if (!v48 || v47)
      -[THScrollViewWithPassthrough setContentOffset:](self->mPagesScrollView, "setContentOffset:", v46, 0.0);
  }
  v50 = *v18;
  *v18 = 0;

LABEL_60:
  -[THChapterBrowserController _updateContentOffsets](self, "_updateContentOffsets", v64, v65);
  -[THScrollView contentOffset](self->mBackgroundScrollView, "contentOffset");
  v51 = 0.0;
  if (v52 <= 0.0)
  {
    -[THScrollView contentOffset](self->mBackgroundScrollView, "contentOffset");
    v51 = v53;
  }
  -[THChapterBrowserController chapterWidth](self, "chapterWidth");
  if (vabdd_f64(-v51, v54) >= 0.00999999978)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController introMediaViewController](self, "introMediaViewController"));
    objc_msgSend(v59, "prepareControlsForTOC");

    -[UIView setAlpha:](self->mChapterPageControlWrapper, "setAlpha:", 1.0);
    -[THChapterBrowserController chapterWidth](self, "chapterWidth");
    if (v51 >= v60 * -0.5)
    {
      self->mDidAutoHideToolbar = 0;
    }
    else if (!self->mDidAutoHideToolbar && !self->_flags.transitioning)
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
      objc_msgSend(v61, "TOCHideToolbarAnimated:", 1);

      self->mDidAutoHideToolbar = 1;
    }
  }
  else
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "introMediaViewControllerForChapterBrowserController:", self));
    v57 = objc_msgSend(v56, "isMovie");

    if (v57 && !self->mDraggingInScrubber)
      -[UIView setAlpha:](self->mChapterPageControlWrapper, "setAlpha:", 0.0);
    if (!self->mDidAutoHideToolbar)
    {
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
      objc_msgSend(v58, "TOCHideToolbarAnimated:", 0);

      self->mDidAutoHideToolbar = 1;
    }
  }
  if (-[THChapterBrowserController hasIntroPage](self, "hasIntroPage"))
  {
    -[THScrollView contentOffset](self->mBackgroundScrollView, "contentOffset");
    v63 = v62;
    v8 = (UIScrollView *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController backgroundScrollView](self, "backgroundScrollView"));
    -[UIScrollView setBounces:](v8, "setBounces:", v63 >= 0.0);
    goto LABEL_75;
  }
LABEL_76:

}

- (_NSRange)p_chapterRelativePageIndexesCurrentlyVisibleInRect:(CGRect)a3 forChapterFrame:(CGRect)a4 chapterPageCount:(unint64_t)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double MinX;
  double MaxX;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  NSUInteger v23;
  unint64_t v24;
  NSUInteger v25;
  CGFloat rect;
  _NSRange result;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3.size.height;
  v11 = a3.size.width;
  v12 = a3.origin.y;
  v13 = a3.origin.x;
  if (!CGRectIntersectsRect(a3, a4))
    goto LABEL_7;
  v29.origin.x = v13;
  v29.origin.y = v12;
  v29.size.width = v11;
  v29.size.height = v10;
  rect = height;
  MinX = CGRectGetMinX(v29);
  v30.origin.x = v13;
  v30.origin.y = v12;
  v30.size.width = v11;
  v30.size.height = v10;
  MaxX = CGRectGetMaxX(v30);
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = rect;
  v17 = CGRectGetMinX(v31);
  -[THChapterBrowserController thumbSize](self, "thumbSize");
  v19 = v18;
  -[THChapterBrowserController firstThumbOverlap](self, "firstThumbOverlap");
  v21 = v17 + v20;
  if (v21 >= MaxX || a5 == 0)
  {
LABEL_7:
    v23 = 0;
    v25 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v23 = 0;
    v24 = 1;
    v25 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      if (v21 >= MinX)
        ++v23;
      if (v21 >= MinX && v25 == 0x7FFFFFFFFFFFFFFFLL)
        v25 = v24 - 1;
      v21 = v19 + v21;
    }
    while (v21 < MaxX && v24++ < a5);
  }
  result.length = v23;
  result.location = v25;
  return result;
}

- (void)p_preloadContentNodesForVisibleThumbnails
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double x;
  double y;
  double width;
  double height;
  uint64_t v15;
  $DDEFF0282EF51F97FF1616E639F089D2 *mChapterInfo;
  unint64_t chapterNumber;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  CGFloat v23;
  CGFloat v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  -[THChapterBrowserController thumbSize](self, "thumbSize");
  v4 = v3;
  -[THChapterBrowserController thumbSize](self, "thumbSize");
  v6 = v5;
  -[THScrollViewWithPassthrough contentOffset](self->mPagesScrollView, "contentOffset");
  v8 = v7 + v4 * -0.5;
  -[THScrollViewWithPassthrough frame](self->mPagesScrollView, "frame");
  v9 = v4 + CGRectGetWidth(v25);
  -[THScrollViewWithPassthrough contentSize](self->mPagesScrollView, "contentSize");
  v28.size.width = v10;
  v26.origin.y = 0.0;
  v28.origin.x = 0.0;
  v28.origin.y = 0.0;
  v26.origin.x = v8;
  v26.size.width = v9;
  v26.size.height = v6;
  v28.size.height = v6;
  v27 = CGRectIntersection(v26, v28);
  x = v27.origin.x;
  y = v27.origin.y;
  width = v27.size.width;
  height = v27.size.height;
  v15 = 0;
  mChapterInfo = self->mChapterInfo;
  do
  {
    chapterNumber = mChapterInfo[v15].chapterNumber;
    if (chapterNumber != 0x7FFFFFFFFFFFFFFFLL)
    {
      v18 = -[THChapterBrowserController p_chapterRelativePageIndexesCurrentlyVisibleInRect:forChapterFrame:chapterPageCount:](self, "p_chapterRelativePageIndexesCurrentlyVisibleInRect:forChapterFrame:chapterPageCount:", mChapterInfo[v15].numberOfPages, x, y, width, height, mChapterInfo[v15].frame.origin.x, mChapterInfo[v15].frame.origin.y, mChapterInfo[v15].frame.size.width, mChapterInfo[v15].frame.size.height);
      if (v18 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v20 = v18;
        v21 = v19;
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
        objc_msgSend(v22, "chapterBrowserController:preloadContentNodesForPageRange:chapterIndex:", self, v20, v21, chapterNumber);

      }
    }
    ++v15;
  }
  while (v15 != 3);
  -[THScrollViewWithPassthrough contentOffset](self->mPagesScrollView, "contentOffset");
  self->mPreservedThumbnailOffset.x = v23;
  self->mPreservedThumbnailOffset.y = v24;
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  _BOOL4 v4;
  THScrollViewWithPassthrough *v6;
  double v7;
  double v8;
  double MinX;
  double MaxX;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  double v15;
  THScrollViewWithPassthrough *v16;

  v4 = a4;
  v6 = (THScrollViewWithPassthrough *)a3;
  v16 = v6;
  if ((THScrollViewWithPassthrough *)self->mBackgroundScrollView == v6)
  {
    if (!v4)
      -[THChapterBrowserController p_backgroundScrollingDidEnd](self, "p_backgroundScrollingDidEnd");
  }
  else if (self->mPagesScrollView == v6)
  {
    if (v4)
    {
      -[THScrollViewWithPassthrough contentOffset](v6, "contentOffset");
      v8 = v7;
      MinX = CGRectGetMinX(self->mChapterInfo[1].frame);
      MaxX = CGRectGetMaxX(self->mChapterInfo[1].frame);
      -[THChapterBrowserController p_pagesScrollViewNextChapterThreshhold](self, "p_pagesScrollViewNextChapterThreshhold");
      v12 = v11;
      v13 = MinX - v11;
      if (self->mChapterIndex)
        v14 = v8 < v13;
      else
        v14 = 0;
      if (v14
        || self->mChapterInfo[2].chapterNumber != 0x7FFFFFFFFFFFFFFFLL
        && (-[THChapterBrowserController chapterWidth](self, "chapterWidth"), v8 + v15 >= MaxX + v12))
      {
        self->mPullThroughInProgress = 1;
      }
    }
    else
    {
      -[THChapterBrowserController p_preloadContentNodesForVisibleThumbnails](self, "p_preloadContentNodesForVisibleThumbnails");
      -[THChapterBrowserScrubbablePageControl setUserInteractionEnabled:](self->mChapterPageControl, "setUserInteractionEnabled:", 1);
    }
  }

}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  double v4;
  THScrollViewWithPassthrough *v5;

  v5 = (THScrollViewWithPassthrough *)a3;
  if (self->mPullThroughInProgress && self->mPagesScrollView == v5)
  {
    -[THScrollViewWithPassthrough contentOffset](v5, "contentOffset");
    -[THScrollViewWithPassthrough setContentOffset:animated:](v5, "setContentOffset:animated:", 0);
    -[THScrollViewWithPassthrough contentOffset](self->mPagesScrollView, "contentOffset");
    self->mPageThumbScrollerStartContentOffset = v4;
    -[THChapterBrowserController p_pageThumbScrollingDidEnd](self, "p_pageThumbScrollingDidEnd");
  }

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  THScrollViewWithPassthrough *v4;
  THScrollViewWithPassthrough *v5;

  v4 = (THScrollViewWithPassthrough *)a3;
  v5 = v4;
  if ((THScrollViewWithPassthrough *)self->mBackgroundScrollView == v4)
  {
    -[THChapterBrowserController p_backgroundScrollingDidEnd](self, "p_backgroundScrollingDidEnd");
  }
  else if (self->mPagesScrollView == v4)
  {
    if (!self->mBackgroundSwipeDidInitiateScroll)
      -[THChapterBrowserController p_preloadContentNodesForVisibleThumbnails](self, "p_preloadContentNodesForVisibleThumbnails");
    -[THChapterBrowserScrubbablePageControl setUserInteractionEnabled:](self->mChapterPageControl, "setUserInteractionEnabled:", 1);
  }

}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  THChapterBrowserController *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_9D950;
  v5[3] = &unk_428C28;
  v6 = a3;
  v7 = self;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (id)p_pageThumbnailViewForPageIndex:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController thumbnailSubviews](self, "thumbnailSubviews", 0));
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v8)
        objc_enumerationMutation(v5);
      v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9);
      v11 = objc_opt_class(THPageThumbnailView, v6);
      v12 = TSUDynamicCast(v11, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = v13;
      if (v13)
      {
        if (objc_msgSend(v13, "chapterIndex") == (id)self->mChapterIndex && objc_msgSend(v14, "pageIndex") == (id)a3)
          break;
      }

      if (v7 == (id)++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    v14 = 0;
  }

  return v14;
}

- (id)p_pageThumbnailViewForModelLink:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
  v6 = objc_msgSend(v5, "chapterBrowserController:relativePageIndexForLink:", self, v4);

  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
    v7 = 0;
  else
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController p_pageThumbnailViewForPageIndex:](self, "p_pageThumbnailViewForPageIndex:", v6));

  return v7;
}

- (CGRect)p_beginTransitionFromPageThumbnail:(id)a3 transformView:(id)a4 freeTransform:(BOOL)a5 firstThumbNailToTransition:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  THPageThumbnailViewInTransition *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  unsigned int v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  _BOOL4 v64;
  CGAffineTransform v65;
  CGAffineTransform v66;
  CGRect result;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  if (v6)
  {
    -[NSMutableArray removeAllObjects](self->_thumbnailViewsInTransition, "removeAllObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[TSKLowPriorityThreadDispatcher sharedLowPriorityDispatcher](TSKLowPriorityThreadDispatcher, "sharedLowPriorityDispatcher"));
    objc_msgSend(v12, "suspend");

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController introMediaViewController](self, "introMediaViewController"));
    objc_msgSend(v13, "stop");

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
    objc_msgSend(v14, "chapterBrowserController:willTransitionToPageIndex:chapterIndex:freeTransform:", self, objc_msgSend(v10, "pageIndex"), objc_msgSend(v10, "chapterIndex"), v7);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
  objc_msgSend(v15, "chapterBrowserController:rectForRelativePageIndex:chapterIndex:", self, objc_msgSend(v10, "pageIndex"), objc_msgSend(v10, "chapterIndex"));
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController dataSource](self, "dataSource"));
  v64 = v7;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "toc:tileModelForChapterIndex:", self, objc_msgSend(v10, "chapterIndex")));

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "canvasScrollViewForChapterBrowserController:", self));

  if (v6)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "superview"));
    -[THChapterBrowserController setOriginalCanvasScrollViewSuperview:](self, "setOriginalCanvasScrollViewSuperview:", v28);

    objc_msgSend(v27, "frame");
    -[THChapterBrowserController setOriginalCanvasScrollViewFrame:](self, "setOriginalCanvasScrollViewFrame:");
  }
  v29 = objc_alloc_init(THPageThumbnailViewInTransition);
  -[THPageThumbnailViewInTransition setThumbnailView:](v29, "setThumbnailView:", v10);
  objc_msgSend(v10, "frame");
  -[THPageThumbnailViewInTransition setOriginalThumbnailFrame:](v29, "setOriginalThumbnailFrame:");
  -[NSMutableArray addObject:](self->_thumbnailViewsInTransition, "addObject:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController view](self, "view"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "superview"));
  objc_msgSend(v11, "center");
  v33 = v32;
  v35 = v34;
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "superview"));
  objc_msgSend(v31, "convertPoint:fromView:", v36, v33, v35);
  objc_msgSend(v11, "setCenter:");

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController view](self, "view"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "superview"));
  objc_msgSend(v38, "addSubview:", v11);

  v39 = objc_msgSend(v10, "pageIndex");
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "largerThumbs"));
  if (v39 >= objc_msgSend(v40, "count"))
  {

    v42 = 0;
  }
  else
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "largerThumbs"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectAtIndex:", objc_msgSend(v10, "pageIndex")));

    if (v42)
      objc_msgSend(v10, "setImage:", +[TSDBitmapImageProvider CGImageForImageData:](TSDBitmapImageProvider, "CGImageForImageData:", v42));
  }
  objc_msgSend(v10, "bounds");
  objc_msgSend(v27, "setCenter:", TSDCenterOfRect(v43, v44, v45, v46));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
  if ((objc_msgSend(v47, "isTwoUpForChapterBrowserController:", self) & 1) != 0)
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
    v49 = objc_msgSend(v48, "isSinglePageInChapterForChapterBrowserController:chapterIndex:", self, objc_msgSend(v10, "chapterIndex"));

    if (v49)
      v50 = 2.0;
    else
      v50 = 1.0;
  }
  else
  {

    v50 = 1.0;
  }
  objc_msgSend(v10, "bounds");
  v52 = v51;
  objc_msgSend(v27, "bounds");
  v54 = v53;
  objc_msgSend(v10, "bounds");
  v56 = v55;
  objc_msgSend(v27, "bounds");
  CGAffineTransformMakeScale(&v66, v50 * v56 / v57, v52 / v54);
  v65 = v66;
  objc_msgSend(v27, "setTransform:", &v65);
  objc_msgSend(v10, "setBorderVisible:", 0);
  objc_msgSend(v10, "setCanvasScrollView:rasterize:", v27, v64);
  if ((unint64_t)objc_msgSend(v10, "pageIndex") >= 2)
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController p_pageThumbnailViewForPageIndex:](self, "p_pageThumbnailViewForPageIndex:", (char *)objc_msgSend(v10, "pageIndex") - 1));
    objc_msgSend(v58, "setHasRightBorder:", 1);

  }
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController p_pageThumbnailViewForPageIndex:](self, "p_pageThumbnailViewForPageIndex:", (char *)objc_msgSend(v10, "pageIndex") + 1));
  objc_msgSend(v59, "setHasLeftBorder:", 1);

  v60 = v17;
  v61 = v19;
  v62 = v21;
  v63 = v23;
  result.size.height = v63;
  result.size.width = v62;
  result.origin.y = v61;
  result.origin.x = v60;
  return result;
}

- (void)p_cleanupAfterTransitionFromPageThumbnail:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  NSMutableArray *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  BOOL v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _OWORD v37[3];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  CGRect v43;

  v4 = a3;
  v5 = (char *)-[NSMutableArray count](self->_thumbnailViewsInTransition, "count");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvasScrollViewForChapterBrowserController:", self));

  objc_msgSend(v4, "clearHighlightRect");
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v7 = self->_thumbnailViewsInTransition;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v39;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v39 != v9)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v10);
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "thumbnailView"));
      v13 = v12 == v4;

      if (v13)
        break;
      if (v8 == (id)++v10)
      {
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v14 = v11;

    v15 = v14;
    if (v14)
      goto LABEL_12;
  }
  else
  {
LABEL_9:

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterBrowserController p_cleanupAfterTransitionFromPageThumbnail:]"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterBrowserController.mm"));
  objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, v18, 2996, CFSTR("invalid nil value for '%s'"), "thumbnailInTransition");

  v15 = 0;
LABEL_12:
  if (v5 == (_BYTE *)&dword_0 + 1)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController originalCanvasScrollViewSuperview](self, "originalCanvasScrollViewSuperview"));
    objc_msgSend(v19, "addSubview:", v36);

    v20 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v37[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v37[1] = v20;
    v37[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    objc_msgSend(v36, "setTransform:", v37);
    -[THChapterBrowserController originalCanvasScrollViewFrame](self, "originalCanvasScrollViewFrame");
    objc_msgSend(v36, "setFrame:");
    -[THChapterBrowserController setOriginalCanvasScrollViewFrame:](self, "setOriginalCanvasScrollViewFrame:", CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
    -[THChapterBrowserController setOriginalCanvasScrollViewSuperview:](self, "setOriginalCanvasScrollViewSuperview:", 0);
  }
  v21 = (id)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController p_pageThumbnailViewForPageIndex:](self, "p_pageThumbnailViewForPageIndex:", objc_msgSend(v4, "pageIndex")));
  v22 = v21;
  if (v21 && v21 != v4)
  {
    objc_msgSend(v21, "teardown");
    objc_msgSend(v22, "removeFromSuperview");
  }
  -[THScrollViewWithPassthrough addSubview:](self->mPagesScrollView, "addSubview:", v4);
  objc_msgSend(v15, "originalThumbnailFrame");
  if (!CGRectIsNull(v43))
  {
    objc_msgSend(v15, "originalThumbnailFrame");
    objc_msgSend(v4, "setFrame:");
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController dataSource](self, "dataSource"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "toc:tileModelForChapterIndex:", self, objc_msgSend(v4, "chapterIndex")));

  if (TSUScreenScale(v25, v26) <= 1.0)
  {
    v31 = objc_msgSend(v4, "pageIndex");
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "tinyThumbs"));
    if (v31 < objc_msgSend(v28, "count"))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "tinyThumbs"));
      v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectAtIndex:", objc_msgSend(v4, "pageIndex")));
      goto LABEL_24;
    }
  }
  else
  {
    v27 = objc_msgSend(v4, "pageIndex");
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "largerThumbs"));
    if (v27 < objc_msgSend(v28, "count"))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "largerThumbs"));
      v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectAtIndex:", objc_msgSend(v4, "pageIndex")));
LABEL_24:
      v32 = (void *)v30;

      goto LABEL_26;
    }
  }
  v32 = 0;
LABEL_26:

  if (v32)
    objc_msgSend(v4, "setImage:", +[TSDBitmapImageProvider CGImageForImageData:](TSDBitmapImageProvider, "CGImageForImageData:", v32));
  objc_msgSend(v4, "setBorderVisible:", 1);
  if ((unint64_t)objc_msgSend(v4, "pageIndex") >= 2)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController p_pageThumbnailViewForPageIndex:](self, "p_pageThumbnailViewForPageIndex:", (char *)objc_msgSend(v4, "pageIndex") - 1));
    objc_msgSend(v33, "setHasRightBorder:", 0);

  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController p_pageThumbnailViewForPageIndex:](self, "p_pageThumbnailViewForPageIndex:", (char *)objc_msgSend(v4, "pageIndex") + 1));
  objc_msgSend(v34, "setHasLeftBorder:", 0);
  -[NSMutableArray removeObject:](self->_thumbnailViewsInTransition, "removeObject:", v15);
  if (v5 == (_BYTE *)&dword_0 + 1)
  {
    self->mIgnoringThumbnailTaps = 0;
    -[THChapterBrowserController refreshStatusBarAppearance](self, "refreshStatusBarAppearance");
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[TSKLowPriorityThreadDispatcher sharedLowPriorityDispatcher](TSKLowPriorityThreadDispatcher, "sharedLowPriorityDispatcher"));
    objc_msgSend(v35, "resume");

  }
}

- (void)p_animationDidStopForThumbnailView:(id)a3
{
  id v4;
  double x;
  double y;
  double width;
  double height;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  __int128 v14;
  _OWORD v15[3];

  v4 = a3;
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  if (-[THChapterBrowserController p_shouldHighlightThumbTargets](self, "p_shouldHighlightThumbTargets"))
  {
    objc_msgSend(v4, "highlightedRelativeRect");
    x = v9;
    y = v10;
    width = v11;
    height = v12;
  }
  if (-[NSMutableArray count](self->_thumbnailViewsInTransition, "count") == (char *)&dword_0 + 1)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
    objc_msgSend(v13, "chapterBrowserController:didTransitionToPageIndex:chapterIndex:relativeTargetRect:", self, objc_msgSend(v4, "pageIndex"), objc_msgSend(v4, "chapterIndex"), x, y, width, height);

  }
  v14 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v15[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v15[1] = v14;
  v15[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  objc_msgSend(v4, "setTransform:", v15);

}

- (void)p_thumbnailAnimationDidStopWithContext:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = objc_opt_class(THPageThumbnailView, v4);
  v6 = TSUDynamicCast(v5, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[THChapterBrowserController p_animationDidStopForThumbnailView:](self, "p_animationDidStopForThumbnailView:", v7);
  -[THChapterBrowserController p_cleanupAfterTransitionFromPageThumbnail:](self, "p_cleanupAfterTransitionFromPageThumbnail:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v8, "endIgnoringInteractionEvents");

}

- (void)p_transitionFromPageThumbnail:(id)a3 destinationRect:(CGRect)a4 shouldShroud:(BOOL)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;
  THChapterBrowserController *v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  uint64_t v23;
  BOOL v24;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v12, "beginIgnoringInteractionEvents");

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_9EB5C;
  v16[3] = &unk_428C98;
  v19 = x;
  v20 = y;
  v21 = width;
  v22 = height;
  v24 = a5;
  v17 = v11;
  v18 = self;
  v23 = 0x3FD3333333333333;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_9EBE8;
  v14[3] = &unk_428CC0;
  v14[4] = self;
  v13 = v17;
  v15 = v13;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v16, v14, 0.3);

}

- (void)scrollToContentOffset:(CGPoint)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  THTOCTileModel *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  -[THScrollViewWithPassthrough setContentOffset:animated:](self->mPagesScrollView, "setContentOffset:animated:", 0, a3.x, a3.y);
  v22 = self->mChapterInfo[1].tileModel;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController thumbnailSubviews](self, "thumbnailSubviews"));
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v24;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v8);
        v10 = objc_opt_class(THPageThumbnailView, v5);
        v11 = TSUDynamicCast(v10, v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        v13 = v12;
        if (v12)
        {
          v14 = objc_msgSend(v12, "chapterIndex");
          if (v14 == (id)self->mChapterIndex)
          {
            if (TSUScreenScale(v14, v15) <= 1.0)
            {
              v20 = objc_msgSend(v13, "pageIndex");
              v17 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCTileModel tinyThumbs](v22, "tinyThumbs"));
              if (v20 >= objc_msgSend(v17, "count"))
                goto LABEL_14;
              v18 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCTileModel tinyThumbs](v22, "tinyThumbs"));
              v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndex:", objc_msgSend(v13, "pageIndex")));
LABEL_13:
              v21 = (void *)v19;

            }
            else
            {
              v16 = objc_msgSend(v13, "pageIndex");
              v17 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCTileModel largerThumbs](v22, "largerThumbs"));
              if (v16 < objc_msgSend(v17, "count"))
              {
                v18 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCTileModel largerThumbs](v22, "largerThumbs"));
                v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndex:", objc_msgSend(v13, "pageIndex")));
                goto LABEL_13;
              }
LABEL_14:
              v21 = 0;
            }

            if (v21)
              objc_msgSend(v13, "setImageData:immediate:", v21, 1);

          }
        }

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v6);
  }

}

- (void)flushThumbnails
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController thumbnailSubviews](self, "thumbnailSubviews", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "teardown");
        objc_msgSend(v6, "removeFromSuperview");
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (BOOL)followAnchor:(id)a3 pulse:(BOOL)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
  LOBYTE(v4) = objc_msgSend(v7, "followAnchor:pulse:", v6, v4);

  return v4;
}

- (BOOL)followLink:(id)a3
{
  return -[THChapterBrowserController followLink:animated:](self, "followLink:animated:", a3, 1);
}

- (BOOL)followLink:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
  LOBYTE(self) = objc_msgSend(v6, "chapterBrowserController:navigateToLinkInDVC:", self, v5);

  return (char)self;
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (NSArray)thumbnailSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THScrollViewWithPassthrough subviews](self->mPagesScrollView, "subviews", 0));
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8);
        v10 = objc_opt_class(THPageThumbnailView, v5);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
          objc_msgSend(v3, "addObject:", v9);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController view](self, "view"));
  objc_msgSend(v3, "bounds");
  -[THChapterBrowserController p_adjustViewsForSize:](self, "p_adjustViewsForSize:", v4, v5);

  -[THChapterBrowserController p_updateChapterWidths](self, "p_updateChapterWidths");
  -[THChapterBrowserController p_configureThumbCaps](self, "p_configureThumbCaps");
  -[THChapterBrowserController refreshStatusBarAppearance](self, "refreshStatusBarAppearance");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  self->_flags.transitioning = 1;
  self->mDeferBackgroundScrollViewScrolls = 1;
  v10.receiver = self;
  v10.super_class = (Class)THChapterBrowserController;
  -[THChapterBrowserController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_9F3A4;
  v9[3] = &unk_428CE8;
  v9[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_9F420;
  v8[3] = &unk_428CE8;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, v8);

}

- (void)p_adjustViewsForSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  unsigned int v9;
  void *v10;
  id v11;
  __int128 v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double mChapterIndex;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  uint64_t i;
  THChapterViewController *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  _OWORD v45[3];

  height = a3.height;
  width = a3.width;
  -[THChapterBrowserController cachedFrameSize](self, "cachedFrameSize");
  if (v7 != width || v6 != height)
  {
    -[THChapterBrowserController setCachedFrameSize:](self, "setCachedFrameSize:", width, height);
    -[THChapterBrowserController setChapterIndex:](self, "setChapterIndex:", self->mChapterIndex);
    v9 = -[THChapterBrowserController introMediaControllerIsActive](self, "introMediaControllerIsActive");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController dataSource](self, "dataSource"));
    v11 = objc_msgSend(v10, "toc:numberOfTilesInDivision:", self, 0);

    -[THChapterBrowserController setChapterWidth:](self, "setChapterWidth:", width);
    self->mDeferBackgroundScrollViewScrolls = 1;
    v12 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v45[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v45[1] = v12;
    v45[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    -[THScrollView setTransform:](self->mBackgroundScrollView, "setTransform:", v45);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController view](self, "view"));
    objc_msgSend(v13, "bounds");
    -[THScrollView setFrame:](self->mBackgroundScrollView, "setFrame:");

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController introMediaViewController](self, "introMediaViewController"));
    if (v14)
    {
      -[THChapterBrowserController chapterWidth](self, "chapterWidth");
      -[THScrollView setContentInset:](self->mBackgroundScrollView, "setContentInset:", 0.0, v15, 0.0, 0.0);
    }
    -[THChapterBrowserController chapterWidth](self, "chapterWidth");
    -[THScrollView setContentSize:](self->mBackgroundScrollView, "setContentSize:", v16 * (double)(unint64_t)v11, height);
    if (v9)
    {
      -[THChapterBrowserController chapterWidth](self, "chapterWidth");
      v18 = -v17;
    }
    else
    {
      mChapterIndex = (double)self->mChapterIndex;
      -[THChapterBrowserController chapterWidth](self, "chapterWidth");
      v18 = v20 * mChapterIndex;
    }
    -[THScrollView setContentOffset:](self->mBackgroundScrollView, "setContentOffset:", v18, 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController thumbnailTrackBackgroundView](self, "thumbnailTrackBackgroundView"));

    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController thumbnailTrackBackgroundView](self, "thumbnailTrackBackgroundView"));
      objc_msgSend(v22, "frame");
      v24 = v23;
      v26 = v25;

      -[THScrollView contentSize](self->mBackgroundScrollView, "contentSize");
      v28 = v27;
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController thumbnailTrackBackgroundView](self, "thumbnailTrackBackgroundView"));
      objc_msgSend(v29, "setFrame:", 0.0, v24, v28, v26);

    }
    self->mDeferBackgroundScrollViewScrolls = 0;
    -[THChapterBrowserController chapterWidth](self, "chapterWidth");
    -[UIView setFrame:](self->mBackgroundsView, "setFrame:", 0.0, 0.0, v30 * 3.0, height);
    -[THChapterBrowserController p_updateChapterBackgroundsView](self, "p_updateChapterBackgroundsView");
    for (i = 0; i != 3; ++i)
    {
      v32 = self->mChapterViewControllers[i];
      if (v32)
      {
        -[THChapterBrowserController frameForChapterViewController:](self, "frameForChapterViewController:", v32);
        v34 = v33;
        v36 = v35;
        v38 = v37;
        v40 = v39;
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterViewController view](v32, "view"));
        objc_msgSend(v41, "setFrame:", v34, v36, v38, v40);

      }
    }
    -[THChapterBrowserController chapterWidth](self, "chapterWidth");
    v43 = -v42;
    -[THChapterBrowserController chapterWidth](self, "chapterWidth");
    -[UIView setFrame:](self->mIntroMediaContainerView, "setFrame:", v43, 0.0, v44, height);
    -[THChapterBrowserController _updateContentOffsets](self, "_updateContentOffsets");
    -[THChapterBrowserController p_updatePageScrubberFrame](self, "p_updatePageScrubberFrame");
    -[THChapterBrowserController p_updatePageControl](self, "p_updatePageControl");
    -[THChapterBrowserController p_updateThumbLayout](self, "p_updateThumbLayout");
  }
}

- (BOOL)p_verticalSpaceLimited
{
  THChapterBrowserController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
  LOBYTE(v2) = objc_msgSend(v3, "isCompactHeightForChapterBrowserController:", v2);

  return (char)v2;
}

- (BOOL)paginatedTOCShowsStatusBar
{
  return !-[THChapterBrowserController p_verticalSpaceLimited](self, "p_verticalSpaceLimited");
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  _BOOL4 v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGPoint v13;
  CGRect v14;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController showToolbarRecognizer](self, "showToolbarRecognizer"));
  if (v5 == v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserScrubbablePageControl superview](self->mChapterPageControl, "superview"));

    if (v7)
    {
      objc_msgSend(v4, "locationInView:", self->mChapterPageControl);
      v9 = v8;
      v11 = v10;
      -[THChapterBrowserScrubbablePageControl bounds](self->mChapterPageControl, "bounds");
      v13.x = v9;
      v13.y = v11;
      v6 = !CGRectContainsPoint(v14, v13);
      goto LABEL_6;
    }
  }
  else
  {

  }
  LOBYTE(v6) = 1;
LABEL_6:

  return v6;
}

- (BOOL)passthroughView:(id)a3 shouldAcceptHitAtPoint:(CGPoint)a4 onView:(id)a5 withEvent:(id)a6
{
  double y;
  double x;
  TSWPassThroughView *v11;
  THScrollViewWithPassthrough *v12;
  id v13;
  char isKindOfClass;
  THScrollViewWithPassthrough *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;

  y = a4.y;
  x = a4.x;
  v11 = (TSWPassThroughView *)a3;
  v12 = (THScrollViewWithPassthrough *)a5;
  v13 = a6;
  if (self->mBottomWrapperView == v11)
  {
    -[THScrollViewWithPassthrough convertPoint:fromView:](self->mPagesScrollView, "convertPoint:fromView:", v11, x, y);
    v15 = (THScrollViewWithPassthrough *)objc_claimAutoreleasedReturnValue(-[THScrollViewWithPassthrough hitTest:withEvent:](self->mPagesScrollView, "hitTest:withEvent:", v13));
    -[THScrollView convertPoint:fromView:](self->mBackgroundScrollView, "convertPoint:fromView:", self->mBottomWrapperView, x, y);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[THScrollView hitTest:withEvent:](self->mBackgroundScrollView, "hitTest:withEvent:", v13));
    if (v17 && (v15 != v12 || self->mPagesScrollView == v12))
    {
      v18 = objc_opt_class(TSDCanvasView, v16);
      isKindOfClass = objc_opt_isKindOfClass(v17, v18);
    }
    else
    {
      isKindOfClass = 1;
    }

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)didRotateFromFlowInPortraitLockedBook
{
  -[THChapterBrowserController p_updateChapterBackgroundsView](self, "p_updateChapterBackgroundsView");
  -[THChapterBrowserController p_updatePageControl](self, "p_updatePageControl");
}

- (id)p_tintAndTitleColor
{
  return +[UIColor whiteColor](UIColor, "whiteColor");
}

- (id)foregroundTintColorForNavigationBar:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController p_tintAndTitleColor](self, "p_tintAndTitleColor", a3));
}

- (id)backgroundColorForNavigationBar:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", a3, 0.121568627, 0.125490196, 0.129411765, 1.0));
}

- (id)titleColorForNavigationBar:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController p_tintAndTitleColor](self, "p_tintAndTitleColor", a3));
}

- (BOOL)navigationBarIsTranslucent:(id)a3
{
  return 0;
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  -[THChapterBrowserController p_configureThumbsAndUpdateLayout:](self, "p_configureThumbsAndUpdateLayout:", 1, a4);
  -[THChapterBrowserController p_updatePageScrubberControlForSizeClassChange](self, "p_updatePageScrubberControlForSizeClassChange");
  -[THChapterBrowserController _configurePagesScrollView](self, "_configurePagesScrollView");
  -[THChapterBrowserController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  -[THChapterBrowserController setNeedsUpdateOfHomeIndicatorAutoHidden](self, "setNeedsUpdateOfHomeIndicatorAutoHidden");
}

- (id)transitionContentView
{
  void *v3;
  uint64_t v4;
  void *v5;

  if (-[THChapterBrowserController introMediaControllerIsActive](self, "introMediaControllerIsActive"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController introMediaViewController](self, "introMediaViewController"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterBrowserController chapterViewController](self, "chapterViewController"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "transitionContentView"));
  }
  v5 = (void *)v4;

  return v5;
}

- (THiOSIntroMediaViewController)introMediaViewController
{
  return self->mIntroMediaViewController;
}

- (UIView)wrapperView
{
  return self->mWrapperView;
}

- (void)setWrapperView:(id)a3
{
  objc_storeStrong((id *)&self->mWrapperView, a3);
}

- (THScrollView)backgroundScrollView
{
  return self->mBackgroundScrollView;
}

- (void)setBackgroundScrollView:(id)a3
{
  objc_storeStrong((id *)&self->mBackgroundScrollView, a3);
}

- (UIView)backgroundsView
{
  return self->mBackgroundsView;
}

- (void)setBackgroundsView:(id)a3
{
  objc_storeStrong((id *)&self->mBackgroundsView, a3);
}

- (TSWPassThroughView)bottomWrapperView
{
  return self->mBottomWrapperView;
}

- (void)setBottomWrapperView:(id)a3
{
  objc_storeStrong((id *)&self->mBottomWrapperView, a3);
}

- (THScrollViewWithPassthrough)pagesScrollView
{
  return self->mPagesScrollView;
}

- (void)setPagesScrollView:(id)a3
{
  objc_storeStrong((id *)&self->mPagesScrollView, a3);
}

- (THChapterBrowserScrubbablePageControl)chapterPageControl
{
  return self->mChapterPageControl;
}

- (void)setChapterPageControl:(id)a3
{
  objc_storeStrong((id *)&self->mChapterPageControl, a3);
}

- (UIView)chapterPageControlWrapper
{
  return self->mChapterPageControlWrapper;
}

- (void)setChapterPageControlWrapper:(id)a3
{
  objc_storeStrong((id *)&self->mChapterPageControlWrapper, a3);
}

- (BOOL)hasIntroPage
{
  return self->hasIntroPage;
}

- (void)setHasIntroPage:(BOOL)a3
{
  self->hasIntroPage = a3;
}

- (NSMutableSet)contentNodesAskedToLoad
{
  return self->contentNodesAskedToLoad;
}

- (void)setContentNodesAskedToLoad:(id)a3
{
  objc_storeStrong((id *)&self->contentNodesAskedToLoad, a3);
}

- (BOOL)isPinchingDownFromCanvas
{
  return self->mIsPinchingDownFromCanvas;
}

- (void)setIsPinchingDownFromCanvas:(BOOL)a3
{
  self->mIsPinchingDownFromCanvas = a3;
}

- (double)chapterWidth
{
  return self->mChapterWidth;
}

- (void)setChapterWidth:(double)a3
{
  self->mChapterWidth = a3;
}

- (unint64_t)chapterIndex
{
  return self->mChapterIndex;
}

- (UIColor)pageAreaBackgroundColor
{
  return self->_pageAreaBackgroundColor;
}

- (void)setPageAreaBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_pageAreaBackgroundColor, a3);
}

- (UITapGestureRecognizer)showToolbarRecognizer
{
  return self->_showToolbarRecognizer;
}

- (void)setShowToolbarRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_showToolbarRecognizer, a3);
}

- (int64_t)maximumNumberOfThumbsToRightOfLeftmostDuringBackgroundDrag
{
  return self->_maximumNumberOfThumbsToRightOfLeftmostDuringBackgroundDrag;
}

- (void)setMaximumNumberOfThumbsToRightOfLeftmostDuringBackgroundDrag:(int64_t)a3
{
  self->_maximumNumberOfThumbsToRightOfLeftmostDuringBackgroundDrag = a3;
}

- (int64_t)maximumNumberOfThumbsToLeftOfLeftmostDuringBackgroundDrag
{
  return self->_maximumNumberOfThumbsToLeftOfLeftmostDuringBackgroundDrag;
}

- (void)setMaximumNumberOfThumbsToLeftOfLeftmostDuringBackgroundDrag:(int64_t)a3
{
  self->_maximumNumberOfThumbsToLeftOfLeftmostDuringBackgroundDrag = a3;
}

- (unint64_t)previousChapterIndex
{
  return self->_previousChapterIndex;
}

- (void)setPreviousChapterIndex:(unint64_t)a3
{
  self->_previousChapterIndex = a3;
}

- (CGSize)cachedFrameSize
{
  double width;
  double height;
  CGSize result;

  width = self->_cachedFrameSize.width;
  height = self->_cachedFrameSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCachedFrameSize:(CGSize)a3
{
  self->_cachedFrameSize = a3;
}

- (CGSize)thumbSize
{
  double width;
  double height;
  CGSize result;

  width = self->_thumbSize.width;
  height = self->_thumbSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)firstThumbSize
{
  double width;
  double height;
  CGSize result;

  width = self->_firstThumbSize.width;
  height = self->_firstThumbSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)firstThumbOverlap
{
  double width;
  double height;
  CGSize result;

  width = self->_firstThumbOverlap.width;
  height = self->_firstThumbOverlap.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)thumbScale
{
  return self->_thumbScale;
}

- (void)setThumbScale:(double)a3
{
  self->_thumbScale = a3;
}

- (UIView)originalCanvasScrollViewSuperview
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_originalCanvasScrollViewSuperview);
}

- (void)setOriginalCanvasScrollViewSuperview:(id)a3
{
  objc_storeWeak((id *)&self->_originalCanvasScrollViewSuperview, a3);
}

- (CGRect)originalCanvasScrollViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_originalCanvasScrollViewFrame.origin.x;
  y = self->_originalCanvasScrollViewFrame.origin.y;
  width = self->_originalCanvasScrollViewFrame.size.width;
  height = self->_originalCanvasScrollViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setOriginalCanvasScrollViewFrame:(CGRect)a3
{
  self->_originalCanvasScrollViewFrame = a3;
}

- (NSMutableArray)thumbnailViewsInTransition
{
  return self->_thumbnailViewsInTransition;
}

- (void)setThumbnailViewsInTransition:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailViewsInTransition, a3);
}

- (BOOL)transitioningPageToDVC
{
  return self->_transitioningPageToDVC;
}

- (void)setTransitioningPageToDVC:(BOOL)a3
{
  self->_transitioningPageToDVC = a3;
}

- (unint64_t)transitioningThumbnailIndex
{
  return self->_transitioningThumbnailIndex;
}

- (void)setTransitioningThumbnailIndex:(unint64_t)a3
{
  self->_transitioningThumbnailIndex = a3;
}

- (NSMutableSet)thumbnailsHiddenForPinch
{
  return self->_thumbnailsHiddenForPinch;
}

- (void)setThumbnailsHiddenForPinch:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailsHiddenForPinch, a3);
}

- (UIView)thumbnailTrackBackgroundView
{
  return self->_thumbnailTrackBackgroundView;
}

- (void)setThumbnailTrackBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailTrackBackgroundView, a3);
}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t j;

  objc_storeStrong((id *)&self->_thumbnailTrackBackgroundView, 0);
  objc_storeStrong((id *)&self->_thumbnailsHiddenForPinch, 0);
  objc_storeStrong((id *)&self->_thumbnailViewsInTransition, 0);
  objc_destroyWeak((id *)&self->_originalCanvasScrollViewSuperview);
  objc_storeStrong((id *)&self->_showToolbarRecognizer, 0);
  objc_storeStrong((id *)&self->_pageAreaBackgroundColor, 0);
  objc_storeStrong((id *)&self->contentNodesAskedToLoad, 0);
  objc_storeStrong((id *)&self->mChapterPageControlWrapper, 0);
  objc_storeStrong((id *)&self->mIntroMediaContainerView, 0);
  objc_storeStrong((id *)&self->mIntroMediaViewController, 0);
  for (i = 176; i != -16; i -= 64)

  for (j = 2; j != -1; --j)
    objc_storeStrong((id *)&self->mChapterViewControllers[j], 0);
  objc_storeStrong((id *)&self->mUpdatingScrollView, 0);
  objc_storeStrong((id *)&self->mFreeTransformController, 0);
  objc_storeStrong((id *)&self->mChapterPageControl, 0);
  objc_storeStrong((id *)&self->mPageAreaBackground, 0);
  objc_storeStrong((id *)&self->mPagesScrollView, 0);
  objc_storeStrong((id *)&self->mBottomWrapperView, 0);
  objc_storeStrong((id *)&self->mBackgroundsView, 0);
  objc_storeStrong((id *)&self->mBackgroundScrollView, 0);
  objc_storeStrong((id *)&self->mWrapperView, 0);
}

- (id).cxx_construct
{
  uint64_t i;

  for (i = 48; i != 240; i += 64)
    *(_QWORD *)((char *)self + i + 224) = 0;
  return self;
}

@end
