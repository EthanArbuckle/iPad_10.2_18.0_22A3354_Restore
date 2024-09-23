@implementation THCanvasExitTransformDelegate

- (THCanvasExitTransformDelegate)initWithBookViewController:(id)a3
{
  THCanvasExitTransformDelegate *v4;
  THCanvasExitTransformDelegate *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THCanvasExitTransformDelegate;
  v4 = -[THCanvasExitTransformDelegate init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    v4->mBookViewController = (THBookViewController *)a3;
    v4->mDocumentViewController = (THDocumentViewController *)objc_msgSend(a3, "documentViewController");
    v5->mChapterBrowserController = -[THBookViewController chapterBrowserController](v5->mBookViewController, "chapterBrowserController");
  }
  return v5;
}

- (CGRect)shadowBoundsForFreeTransformController:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[THDocumentViewController shadowBoundsForCanvasExitTransformDelegate:](self->mDocumentViewController, "shadowBoundsForCanvasExitTransformDelegate:", self);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)p_shouldShowShroudForVisibleSize:(CGSize)a3
{
  double height;
  double width;
  BOOL result;
  double v7;
  double v8;
  double v9;
  double v10;

  height = a3.height;
  width = a3.width;
  if ((TSUPhoneUI(self, a2) & 1) != 0)
    return 1;
  objc_msgSend(objc_msgSend(-[THDocumentViewController view](self->mDocumentViewController, "view"), "window"), "statusBarMinDimension");
  v8 = v7;
  -[THDocumentViewController paginatedSpreadSize](self->mDocumentViewController, "paginatedSpreadSize");
  result = 0;
  if (v9 > 0.0 && width > 0.0)
    return vabdd_f64(v10 / v9, (height - v8) / width) >= 0.00999999978;
  return result;
}

- (BOOL)freeTransformControllerShouldBegin:(id)a3
{
  return !-[THDocumentViewController showingExpandedWidgetView](self->mDocumentViewController, "showingExpandedWidgetView", a3);
}

- (void)freeTransformControllerDidBegin:(id)a3
{
  uint64_t v4;
  double v5;
  double v6;
  id v7;
  NSUInteger v8;

  -[THDocumentViewController currentRelativePageIndexRange](self->mDocumentViewController, "currentRelativePageIndexRange", a3);
  if (v4 == 2)
  {
    self->_savedPagingState = objc_msgSend(-[THDocumentViewController canvasScrollView](self->mDocumentViewController, "canvasScrollView"), "isPagingEnabled");
    objc_msgSend(-[THDocumentViewController canvasScrollView](self->mDocumentViewController, "canvasScrollView"), "setPagingEnabled:", 0);
  }
  -[THBookViewController hideNavigationHistory](self->mBookViewController, "hideNavigationHistory");
  -[THBookViewController temporarilySetHUDViewHidden:](self->mBookViewController, "temporarilySetHUDViewHidden:", 1);
  objc_msgSend(-[THDocumentViewController view](self->mDocumentViewController, "view"), "frame");
  if (!-[THCanvasExitTransformDelegate p_shouldShowShroudForVisibleSize:](self, "p_shouldShowShroudForVisibleSize:", v5, v6))-[THTOCViewController setShroudedFraction:](self->mChapterBrowserController, "setShroudedFraction:", 0.0);
  self->mChapterIndex = -[THDocumentViewController currentChapter](self->mDocumentViewController, "currentChapter");
  v7 = -[THDocumentViewController currentRelativePageIndexRange](self->mDocumentViewController, "currentRelativePageIndexRange");
  self->mAnimatingPageIndexRange.location = (NSUInteger)v7;
  self->mAnimatingPageIndexRange.length = v8;
  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THCanvasExitTransformDelegate freeTransformControllerDidBegin:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THCanvasExitTransformDelegate.m"), 108, CFSTR("Current page index is bogus"));
  -[THBookViewController putTOCInBack](self->mBookViewController, "putTOCInBack");
  -[THChapterBrowserController willTransitionFromChapterIndex:](self->mChapterBrowserController, "willTransitionFromChapterIndex:", self->mChapterIndex);
  -[THChapterBrowserController hidePageThumbnailAtIndex:chapterIndex:scrollIfNecessary:](self->mChapterBrowserController, "hidePageThumbnailAtIndex:chapterIndex:scrollIfNecessary:", self->mAnimatingPageIndexRange.location, self->mChapterIndex, 1);
  if (self->mAnimatingPageIndexRange.length == 2)
    -[THChapterBrowserController hidePageThumbnailAtIndex:chapterIndex:scrollIfNecessary:](self->mChapterBrowserController, "hidePageThumbnailAtIndex:chapterIndex:scrollIfNecessary:", self->mAnimatingPageIndexRange.location + 1, self->mChapterIndex, 0);
  -[THChapterBrowserController scrollToThumbnailAtIndex:](self->mChapterBrowserController, "scrollToThumbnailAtIndex:", self->mAnimatingPageIndexRange.location);
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self->mDocumentViewController, "interactiveCanvasController"), "didBeginFreeTransform");
}

- (BOOL)freeTransformControllerShouldMoveFreeTransformViewAboveStatusBar:(id)a3
{
  return 0;
}

- (id)p_shadowFadeInAnimation:(double)a3
{
  CABasicAnimation *v4;
  double v5;
  double v6;

  v4 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("shadowOpacity"));
  -[CABasicAnimation setTimingFunction:](v4, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseIn));
  -[CABasicAnimation setDuration:](v4, "setDuration:", 0.15);
  LODWORD(v5) = 0;
  -[CABasicAnimation setFromValue:](v4, "setFromValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5));
  *(float *)&v6 = a3;
  -[CABasicAnimation setToValue:](v4, "setToValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6));
  -[CABasicAnimation setRemovedOnCompletion:](v4, "setRemovedOnCompletion:", 0);
  return v4;
}

- (id)p_shadowFadeOutAnimation:(double)a3
{
  CABasicAnimation *v4;
  double v5;
  double v6;

  v4 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("shadowOpacity"));
  -[CABasicAnimation setTimingFunction:](v4, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut));
  -[CABasicAnimation setDuration:](v4, "setDuration:", 0.15);
  *(float *)&v5 = a3;
  -[CABasicAnimation setFromValue:](v4, "setFromValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5));
  LODWORD(v6) = 0;
  -[CABasicAnimation setToValue:](v4, "setToValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6));
  -[CABasicAnimation setFillMode:](v4, "setFillMode:", kCAFillModeForwards);
  -[CABasicAnimation setRemovedOnCompletion:](v4, "setRemovedOnCompletion:", 0);
  return v4;
}

- (void)p_showThumbUsingTinyThumb:(BOOL)a3 freeTransformController:(id)a4
{
  _BOOL8 v5;
  id v7;
  UIView *mThumbView;
  id v9;
  UIView *v10;
  NSArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  char **__ptr32 *v16;
  id v17;
  unsigned int v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  NSUInteger location;
  id v28;
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  float v35;
  float v36;
  _QWORD v37[5];
  _QWORD v38[5];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];

  v5 = a3;
  v7 = -[THDocumentViewController canvasScrollView](self->mDocumentViewController, "canvasScrollView");
  mThumbView = self->mThumbView;
  if (!mThumbView)
  {
    v9 = objc_alloc((Class)UIView);
    objc_msgSend(v7, "frame");
    v10 = (UIView *)objc_msgSend(v9, "initWithFrame:");
    self->mThumbView = v10;
    -[UIView setAlpha:](v10, "setAlpha:", 0.0);
    objc_msgSend(objc_msgSend(v7, "superview"), "addSubview:", self->mThumbView);
    mThumbView = self->mThumbView;
  }
  if (self->mUsingTinyThumb == v5)
  {
    if (-[NSArray count](-[UIView subviews](mThumbView, "subviews"), "count"))
      goto LABEL_26;
    mThumbView = self->mThumbView;
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v11 = -[UIView subviews](mThumbView, "subviews");
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v40 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i), "removeFromSuperview");
      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v13);
  }
  v16 = &off_313000;
  if (self->mAnimatingPageIndexRange.length == 1)
  {
    v17 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", -[THChapterBrowserController thumbnailImageForPageAtIndex:chapterIndex:tinyThumb:](self->mChapterBrowserController, "thumbnailImageForPageAtIndex:chapterIndex:tinyThumb:", self->mAnimatingPageIndexRange.location, self->mChapterIndex, v5));
    v18 = -[THDocumentViewController is2UpForCanvasExitTransformDelegate:](self->mDocumentViewController, "is2UpForCanvasExitTransformDelegate:", self);
    -[UIView bounds](self->mThumbView, "bounds");
    if (v18)
    {
      v22 = v21 * 0.5;
      v19 = (v21 - v21 * 0.5) * 0.5;
      v20 = 0.0;
    }
    else
    {
      v22 = v21;
    }
    objc_msgSend(v17, "setFrame:", v19, v20, v22);
    -[UIView addSubview:](self->mThumbView, "addSubview:", v17);

  }
  else
  {
    -[UIView bounds](self->mThumbView, "bounds");
    v24 = v23;
    v26 = v25;
    location = self->mAnimatingPageIndexRange.location;
    v28 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", -[THChapterBrowserController thumbnailImageForPageAtIndex:chapterIndex:tinyThumb:](self->mChapterBrowserController, "thumbnailImageForPageAtIndex:chapterIndex:tinyThumb:", location, self->mChapterIndex, v5));
    v29 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", -[THChapterBrowserController thumbnailImageForPageAtIndex:chapterIndex:tinyThumb:](self->mChapterBrowserController, "thumbnailImageForPageAtIndex:chapterIndex:tinyThumb:", location + 1, self->mChapterIndex, v5));
    v30 = v24 * 0.5;
    if (self->mAnimatingPageIndexRange.location)
    {
      v31 = 0.0;
      objc_msgSend(v28, "setFrame:", 0.0, 0.0, v30, v26);
      v32 = v30;
    }
    else
    {
      v33 = v26 * 1.08;
      v34 = (v26 - v26 * 1.08) * 0.5;
      objc_msgSend(v28, "setFrame:", 0.0, v34, v30 * 1.08, v26 * 1.08);
      v32 = v30 * 0.92;
      v26 = v26 * 0.92;
      v31 = v33 + v34 - v26;
      v30 = v30 * 1.08;
    }
    objc_msgSend(v29, "setFrame:", v30, v31, v32, v26);
    -[UIView addSubview:](self->mThumbView, "addSubview:", v28);
    -[UIView addSubview:](self->mThumbView, "addSubview:", v29);

    v16 = &off_313000;
    if (!self->mAnimatingPageIndexRange.location)
    {
      if (self->_targetLayerShadowOpacity == 0.0)
      {
        objc_msgSend(objc_msgSend(a4, "shadowLayer"), "shadowOpacity");
        self->_targetLayerShadowOpacity = v35;
        objc_msgSend(objc_msgSend(a4, "shadowLayer"), "shadowOpacity");
        objc_msgSend(objc_msgSend(a4, "shadowLayer"), "addAnimation:forKey:", -[THCanvasExitTransformDelegate p_shadowFadeOutAnimation:](self, "p_shadowFadeOutAnimation:", v36), CFSTR("kCanvasExitTransformFadeOutAnimationName"));
      }
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_A3E58;
      v38[3] = &unk_426DD0;
      v38[4] = v7;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v38, 0.15);
    }
  }
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_A3E64;
  v37[3] = &unk_426DD0;
  v37[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v37, *((double *)v16 + 416));
LABEL_26:
  self->mUsingTinyThumb = v5;
}

- (void)freeTransformControllerDidContinue:(id)a3 withScale:(double)a4
{
  double v7;
  double v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[6];

  objc_msgSend(-[THDocumentViewController view](self->mDocumentViewController, "view"), "frame");
  if (-[THCanvasExitTransformDelegate p_shouldShowShroudForVisibleSize:](self, "p_shouldShowShroudForVisibleSize:", v7, v8))
  {
    -[THTOCViewController setShroudedFraction:](self->mChapterBrowserController, "setShroudedFraction:", TSUClamp(a4, 0.0, 1.0));
  }
  if (a4 >= 0.5)
  {
    if (self->mThumbView && !self->_thumbFadeOutAnimationInProgress)
    {
      self->_thumbFadeOutAnimationInProgress = 1;
      if (self->_targetLayerShadowOpacity > 0.0)
      {
        objc_msgSend(objc_msgSend(a3, "shadowLayer"), "removeAllAnimations");
        objc_msgSend(objc_msgSend(a3, "shadowLayer"), "addAnimation:forKey:", -[THCanvasExitTransformDelegate p_shadowFadeInAnimation:](self, "p_shadowFadeInAnimation:", self->_targetLayerShadowOpacity), CFSTR("kCanvasExitTransformFadeInAnimationName"));
        self->_targetLayerShadowOpacity = 0.0;
      }
      v9 = -[THDocumentViewController canvasScrollView](self->mDocumentViewController, "canvasScrollView");
      v10[4] = self;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_A3FF4;
      v11[3] = &unk_426E28;
      v11[4] = v9;
      v11[5] = self;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_A4028;
      v10[3] = &unk_427130;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v11, v10, 0.15);
    }
  }
  else
  {
    -[THCanvasExitTransformDelegate p_showThumbUsingTinyThumb:freeTransformController:](self, "p_showThumbUsingTinyThumb:freeTransformController:", a4 < 0.25, a3);
  }
}

- (CGRect)freeTransformControllerRectForCompletionAnimation:(id)a3
{
  double v5;
  CGFloat x;
  double v7;
  CGFloat y;
  double v9;
  CGFloat width;
  double v11;
  CGFloat height;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect v21;
  CGRect v22;
  CGRect result;
  CGRect v24;

  -[THChapterBrowserController rectForPageThumbnailAtIndex:chapterIndex:inLayer:](self->mChapterBrowserController, "rectForPageThumbnailAtIndex:chapterIndex:inLayer:", self->mAnimatingPageIndexRange.location, self->mChapterIndex, objc_msgSend(objc_msgSend(a3, "freeTransformLayer"), "superlayer"));
  x = v5;
  y = v7;
  width = v9;
  height = v11;
  if (self->mAnimatingPageIndexRange.length == 2)
  {
    -[THChapterBrowserController rectForPageThumbnailAtIndex:chapterIndex:inLayer:](self->mChapterBrowserController, "rectForPageThumbnailAtIndex:chapterIndex:inLayer:", self->mAnimatingPageIndexRange.location + 1, self->mChapterIndex, objc_msgSend(objc_msgSend(a3, "freeTransformLayer"), "superlayer"));
    v24.origin.x = v13;
    v24.origin.y = v14;
    v24.size.width = v15;
    v24.size.height = v16;
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    v22 = CGRectUnion(v21, v24);
    x = v22.origin.x;
    y = v22.origin.y;
    width = v22.size.width;
    height = v22.size.height;
  }
  v17 = x;
  v18 = y;
  v19 = width;
  v20 = height;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (BOOL)freeTransformControllerShouldFadeShadowOut:(id)a3
{
  return 1;
}

- (void)freeTransformControllerWillBeginCompletionAnimation:(id)a3 passedThreshold:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  if (a4 && !self->mThumbView)
    -[THCanvasExitTransformDelegate p_showThumbUsingTinyThumb:freeTransformController:](self, "p_showThumbUsingTinyThumb:freeTransformController:", 1, a3);
  -[THTOCViewController setShrouded:animated:duration:](self->mChapterBrowserController, "setShrouded:animated:duration:", !v4, 1, 0.25);
}

- (void)freeTransformControllerDidEnd:(id)a3 passedThreshold:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  unsigned int v7;
  THBookViewController *mBookViewController;
  _QWORD v9[5];

  v4 = a4;
  if (self->_targetLayerShadowOpacity > 0.0)
  {
    objc_msgSend(objc_msgSend(a3, "shadowLayer"), "addAnimation:forKey:", -[THCanvasExitTransformDelegate p_shadowFadeInAnimation:](self, "p_shadowFadeInAnimation:"), CFSTR("kCanvasExitTransformFadeInAnimationName"));
    self->_targetLayerShadowOpacity = 0.0;
  }
  v6 = -[THDocumentViewController canvasScrollView](self->mDocumentViewController, "canvasScrollView");
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_A4380;
  v9[3] = &unk_426DD0;
  v9[4] = v6;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v9, 0.15);
  -[UIView removeFromSuperview](self->mThumbView, "removeFromSuperview");

  self->mThumbView = 0;
  if (!v4)
  {
    -[THBookViewController removeTOC](self->mBookViewController, "removeTOC");
    -[THBookViewController setCenterTitleForCurrentNavigationUnit](self->mBookViewController, "setCenterTitleForCurrentNavigationUnit");
    objc_msgSend(-[THDocumentViewController canvasViewController](self->mDocumentViewController, "canvasViewController"), "becomeFirstResponder");
    -[THBookViewController temporarilySetHUDViewHidden:](self->mBookViewController, "temporarilySetHUDViewHidden:", 0);
  }
  -[THChapterBrowserController showPageThumbnailAtIndex:](self->mChapterBrowserController, "showPageThumbnailAtIndex:", self->mAnimatingPageIndexRange.location);
  if (self->mAnimatingPageIndexRange.length == 2)
    -[THChapterBrowserController showPageThumbnailAtIndex:](self->mChapterBrowserController, "showPageThumbnailAtIndex:", self->mAnimatingPageIndexRange.location + 1);
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self->mDocumentViewController, "interactiveCanvasController"), "didEndFreeTransform");
  if (v4)
  {
    -[THBookViewController dismissActivePopover](self->mBookViewController, "dismissActivePopover");
    if (!-[THChapterBrowserController paginatedTOCShowsStatusBar](self->mChapterBrowserController, "paginatedTOCShowsStatusBar"))
    {
      v7 = -[THBookViewController isToolbarHidden](self->mBookViewController, "isToolbarHidden");
      mBookViewController = self->mBookViewController;
      if (v7)
        -[THBookViewController refreshStatusBarAppearance](mBookViewController, "refreshStatusBarAppearance");
      else
        -[THBookViewController hideToolbarAnimated:](mBookViewController, "hideToolbarAnimated:", 1);
    }
    -[THChapterBrowserController didTransitionFromCanvas](self->mChapterBrowserController, "didTransitionFromCanvas");
    -[THTOCViewControllerDelegate didTransitionFromViewController:toTOCViewController:](-[THTOCViewController delegate](self->mChapterBrowserController, "delegate"), "didTransitionFromViewController:toTOCViewController:", self->mDocumentViewController, self->mChapterBrowserController);
    -[THDocumentViewController setVisibleInfoUpdatesAllowedInLandscape:](self->mDocumentViewController, "setVisibleInfoUpdatesAllowedInLandscape:", 0);
    -[THBookViewController refreshStatusBarAppearance](self->mBookViewController, "refreshStatusBarAppearance");
    -[THBookViewController recordOutgoingMajorNavigationJump](self->mBookViewController, "recordOutgoingMajorNavigationJump");
  }
  -[THChapterBrowserController setIsPinchingDownFromCanvas:](self->mChapterBrowserController, "setIsPinchingDownFromCanvas:", 0);
  if (self->mAnimatingPageIndexRange.length == 2)
    objc_msgSend(-[THDocumentViewController canvasScrollView](self->mDocumentViewController, "canvasScrollView"), "setPagingEnabled:", self->_savedPagingState);
}

- (id)unmovingParentViewForFreeTransformController:(id)a3
{
  return -[THBookViewController view](self->mBookViewController, "view", a3);
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

- ($A219A65C3B9F57E4A1EAB42BC6271E0A)shadowPropertiesForFreeTransformController:(SEL)a3 defaults:(id)a4
{
  double Width;
  double v8;
  double v9;
  $A219A65C3B9F57E4A1EAB42BC6271E0A *result;
  CGRect v11;
  CGRect v12;

  objc_msgSend(a4, "completionTargetRect");
  Width = CGRectGetWidth(v11);
  objc_msgSend(objc_msgSend(a4, "targetLayer"), "frame");
  v8 = CGRectGetWidth(v12);
  if (-[THDocumentViewController is2UpForCanvasExitTransformDelegate:](self->mDocumentViewController, "is2UpForCanvasExitTransformDelegate:", self)&& self->mAnimatingPageIndexRange.length == 1)
  {
    v8 = v8 * 0.5;
  }
  v9 = 160.0;
  if (Width != 0.0)
    v9 = Width;
  TSDMultiplySizeScalar(0.0, 0.0, v8 / v9);
  return result;
}

- (CGRect)freeTransformControllerOriginalTargetLayerFrame:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[THDocumentViewController shadowBoundsForCanvasExitTransformDelegate:](self->mDocumentViewController, "shadowBoundsForCanvasExitTransformDelegate:", self);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)freeTransformControllerShouldDelayRecognizeUntilScaleChange:(id)a3
{
  return 1;
}

- (BOOL)freeTransformControllerShouldAllowPinchDown:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;

  v3 = objc_msgSend(-[THDocumentViewController canvasViewController](self->mDocumentViewController, "canvasViewController", a3), "canvasLayer");
  if (!objc_msgSend(v3, "allowsPinchZoom"))
    return 1;
  objc_msgSend(v3, "viewScale");
  v5 = v4;
  objc_msgSend(v3, "minimumPinchViewScale");
  return vabdd_f64(v5, v6) < 0.00999999978;
}

- (BOOL)freeTransformControllerShouldAllowPinchUp:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;

  v3 = objc_msgSend(-[THDocumentViewController canvasViewController](self->mDocumentViewController, "canvasViewController", a3), "canvasLayer");
  if (!objc_msgSend(v3, "allowsPinchZoom"))
    return 1;
  objc_msgSend(v3, "minimumPinchViewScale");
  v5 = v4;
  objc_msgSend(v3, "maximumPinchViewScale");
  return vabdd_f64(v5, v6) < 0.00999999978;
}

- (double)targetLayerShadowOpacity
{
  return self->_targetLayerShadowOpacity;
}

- (void)setTargetLayerShadowOpacity:(double)a3
{
  self->_targetLayerShadowOpacity = a3;
}

- (BOOL)thumbFadeOutAnimationInProgress
{
  return self->_thumbFadeOutAnimationInProgress;
}

- (void)setThumbFadeOutAnimationInProgress:(BOOL)a3
{
  self->_thumbFadeOutAnimationInProgress = a3;
}

- (BOOL)savedPagingState
{
  return self->_savedPagingState;
}

- (void)setSavedPagingState:(BOOL)a3
{
  self->_savedPagingState = a3;
}

@end
