@implementation BKBookBloomOpenAnimator

- (id)initOpening:(BOOL)a3
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKBookBloomOpenAnimator;
  v3 = -[BKBookOpenAnimator initOpening:](&v7, "initOpening:", a3);
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v5 = (void *)v3[40];
    v3[40] = v4;

  }
  return v3;
}

- (id)_zoomSpring
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  id v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator toViewController](self, "toViewController"));
  if ((objc_msgSend(v3, "im_isCompactWidth") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator toViewController](self, "toViewController"));
    v4 = objc_msgSend(v5, "im_isCompactHeight");

  }
  v6 = objc_alloc((Class)UISpringTimingParameters);
  v7 = 300.0;
  if (!v4)
    v7 = 200.0;
  v8 = 30.0;
  if (v4)
    v8 = 35.0;
  v9 = objc_msgSend(v6, "initWithMass:stiffness:damping:initialVelocity:", 1.0, v7, v8, 0.0, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator adjustSpring:](self, "adjustSpring:", v9));

  return v10;
}

- (id)_revealSpring
{
  id v3;
  void *v4;

  v3 = objc_msgSend(objc_alloc((Class)UISpringTimingParameters), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 325.0, 30.0, 0.0, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator adjustSpring:](self, "adjustSpring:", v3));

  return v4;
}

- (id)_closeSpring
{
  id v3;
  void *v4;

  v3 = objc_msgSend(objc_alloc((Class)UISpringTimingParameters), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 325.0, 30.0, 0.0, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator adjustSpring:](self, "adjustSpring:", v3));

  return v4;
}

- (id)_customTimingFunction
{
  double v2;
  double v3;
  double v4;
  double v5;

  LODWORD(v2) = 1051371084;
  LODWORD(v4) = 1045220557;
  LODWORD(v3) = 0;
  LODWORD(v5) = 1.0;
  return +[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v2, v3, v4, v5);
}

- (double)duration
{
  double v3;
  double v4;
  double v5;
  double result;

  if (-[BKBookOpenAnimator opening](self, "opening"))
  {
    -[BKBookBloomOpenAnimator zoomDuration](self, "zoomDuration");
    v4 = v3;
    -[BKBookBloomOpenAnimator revealDuration](self, "revealDuration");
    return v4 + v5;
  }
  else
  {
    -[BKBookBloomOpenAnimator closeDuration](self, "closeDuration");
  }
  return result;
}

- (double)zoomDuration
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator _zoomSpring](self, "_zoomSpring"));
  objc_msgSend(v2, "settlingDuration");
  v4 = v3;

  return v4;
}

- (double)revealDuration
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator _revealSpring](self, "_revealSpring"));
  objc_msgSend(v2, "settlingDuration");
  v4 = v3;

  return v4;
}

- (double)closeDuration
{
  double result;
  void *v4;
  double v5;
  double v6;

  if (-[BKBookOpenAnimator fadeInCover](self, "fadeInCover"))
  {
    -[BKBookOpenAnimator adjustDuration:](self, "adjustDuration:", 0.32);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator _closeSpring](self, "_closeSpring"));
    objc_msgSend(v4, "settlingDuration");
    v6 = v5;

    return v6;
  }
  return result;
}

- (double)minSecondHalfDelayOnOpen
{
  return 0.4;
}

- (double)minSecondHalfDelayOnClose
{
  return 0.0;
}

- (double)slowModeExtraDurationMultiplier
{
  return 1.0;
}

- (id)bookshelfTintColor
{
  return +[BKBookBloomOpenAnimator backgroundColorForZoomedBookCover](BKBookBloomOpenAnimator, "backgroundColorForZoomedBookCover");
}

- (BOOL)bookshelfTintCoversBars
{
  return 1;
}

- (UIEdgeInsets)_insetsFromContentSize:(CGSize)a3 toCoverSize:(CGSize)a4 containerSize:(CGSize)a5 isCompact:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
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
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat x;
  CGFloat y;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  UIEdgeInsets result;
  CGRect v44;

  v6 = a6;
  height = a5.height;
  width = a5.width;
  v9 = a4.height;
  v10 = a4.width;
  if (-[BKBookBloomOpenAnimator _contentViewIsShowingCover](self, "_contentViewIsShowingCover"))
  {
    CGRectMakeWithSize(v10, v9);
  }
  else
  {
    v11 = CGRectMakeWithSize(width, height);
    +[BKBookBloomOpenAnimator zoomedFrameForCoverWithSize:isCompact:containerViewBounds:](BKBookBloomOpenAnimator, "zoomedFrameForCoverWithSize:isCompact:containerViewBounds:", v6, v10, v9, v11, v12, v13, v14);
    v19 = v18;
    v20 = v15;
    v21 = v16;
    v22 = v17;
    v23 = 0.1;
    if (!v6)
      v23 = 0.0;
    if (width <= height)
      v24 = v23;
    else
      v24 = -0.3;
    v25 = v19;
    v26 = v24 * CGRectGetWidth(*(CGRect *)(&v15 - 1));
    v40.origin.x = v19;
    v40.origin.y = v20;
    v40.size.width = v21;
    v40.size.height = v22;
    v41 = CGRectInset(v40, v26, 0.0);
    x = v41.origin.x;
    v39 = v41.size.width;
    y = v41.origin.y;
    v38 = v41.size.height;
    +[BKBookBloomOpenAnimator _availableRectForFittingZoomedCoverInContainerViewBounds:isCompact:](BKBookBloomOpenAnimator, "_availableRectForFittingZoomedCoverInContainerViewBounds:isCompact:", v6, CGRectMakeWithSize(width, height));
    v44.origin.x = v29;
    v44.origin.y = v30;
    v44.size.width = v31;
    v44.size.height = v32;
    v42.origin.x = x;
    v42.origin.y = y;
    v42.size.height = v38;
    v42.size.width = v39;
    CGRectIntersection(v42, v44);
  }
  v33 = sub_1000A6140();
  BCNormalizedInsetsForRects(v33);
  result.right = v37;
  result.bottom = v36;
  result.left = v35;
  result.top = v34;
  return result;
}

- (uint64_t)_frameOfContentWithAspectRatio:thatFitsCoverOfAspectRatio:withFrame:insetsContentToCover:
{
  uint64_t v0;

  v0 = sub_1000A6140();
  return BCRectByUnapplyingNormalizedInsets(v0);
}

- (CGRect)zoomedCoverFrame
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
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
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookViewController](self, "bookViewController"));
  if ((objc_msgSend(v3, "im_isCompactWidth") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookViewController](self, "bookViewController"));
    v4 = (uint64_t)objc_msgSend(v5, "im_isCompactHeight");

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator containerView](self, "containerView"));
  IMActionSafeRectForRect(objc_msgSend(v6, "bounds"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverImage](self, "coverImage"));
  objc_msgSend(v7, "size");
  +[BKBookBloomOpenAnimator zoomedFrameForCoverWithSize:isCompact:containerViewBounds:](BKBookBloomOpenAnimator, "zoomedFrameForCoverWithSize:isCompact:containerViewBounds:", v4);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverContainerView](self, "coverContainerView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "superview"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator containerView](self, "containerView"));
  objc_msgSend(v17, "convertRect:fromView:", v18, v9, v11, v13, v15);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  v27 = v20;
  v28 = v22;
  v29 = v24;
  v30 = v26;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (void)performAdditionSetup
{
  _BOOL4 useShadowEffects;
  BKCustomAnimationPropertiesView *v4;
  void *v5;
  BKCustomAnimationPropertiesView *v6;
  void *v7;
  BKCustomAnimationPropertiesView *v8;
  void *v9;
  BKCustomAnimationPropertiesView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)BKBookBloomOpenAnimator;
  -[BKBookOpenAnimator performAdditionSetup](&v27, "performAdditionSetup");
  useShadowEffects = self->_useShadowEffects;
  v4 = [BKCustomAnimationPropertiesView alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator containerView](self, "containerView"));
  objc_msgSend(v5, "bounds");
  v6 = -[BKCustomAnimationPropertiesView initWithFrame:](v4, "initWithFrame:");
  -[BKBookBloomOpenAnimator setBlurredCoverContainer:](self, "setBlurredCoverContainer:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator blurredCoverContainer](self, "blurredCoverContainer"));
  objc_msgSend(v7, "addAnimatablePropertyWithKey:", CFSTR("filters.gaussianBlur.inputRadius"));

  v8 = [BKCustomAnimationPropertiesView alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator blurredCoverContainer](self, "blurredCoverContainer"));
  objc_msgSend(v9, "bounds");
  v10 = -[BKCustomAnimationPropertiesView initWithFrame:](v8, "initWithFrame:");
  -[BKBookBloomOpenAnimator setBlurredShadowContainer:](self, "setBlurredShadowContainer:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator blurredShadowContainer](self, "blurredShadowContainer"));
  objc_msgSend(v11, "addAnimatablePropertyWithKey:", CFSTR("filters.gaussianBlur.inputRadius"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator blurredShadowContainer](self, "blurredShadowContainer"));
  objc_msgSend(v12, "addAnimatablePropertyWithKey:", CFSTR("filters.colorBrightness.inputAmount"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator blurredCoverContainer](self, "blurredCoverContainer"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator blurredShadowContainer](self, "blurredShadowContainer"));
  objc_msgSend(v13, "addSubview:", v14);

  v15 = -[BKBookOpenAnimator skipZoomPhase](self, "skipZoomPhase");
  if (useShadowEffects && v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator blurredShadowContainer](self, "blurredShadowContainer"));
    +[BKBookBloomOpenAnimator setBlurRadius:forView:](BKBookBloomOpenAnimator, "setBlurRadius:forView:", v16, 60.0);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator blurredShadowContainer](self, "blurredShadowContainer"));
    +[BKBookBloomOpenAnimator setBrightnessFilter:forView:](BKBookBloomOpenAnimator, "setBrightnessFilter:forView:", v17, -0.6);

    -[BKBookBloomOpenAnimator _adjustShadowForCurrentCoverBounds](self, "_adjustShadowForCurrentCoverBounds");
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator blurredCoverContainer](self, "blurredCoverContainer"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverContainerView](self, "coverContainerView"));
  objc_msgSend(v18, "addSubview:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator blurredShadowContainer](self, "blurredShadowContainer"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverShadowView](self, "coverShadowView"));
  objc_msgSend(v20, "addSubview:", v21);

  -[BKBookBloomOpenAnimator _adjustShadowForCurrentCoverBounds](self, "_adjustShadowForCurrentCoverBounds");
  if (!-[BKBookOpenAnimator opening](self, "opening"))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator blurredCoverContainer](self, "blurredCoverContainer"));
    objc_msgSend(v22, "setHidden:", 1);

  }
  v23 = -[BKBookOpenAnimator skipZoomPhase](self, "skipZoomPhase");
  if (!useShadowEffects && v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator blurredShadowContainer](self, "blurredShadowContainer"));
    objc_msgSend(v24, "setHidden:", 1);

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator containerView](self, "containerView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator blurredCoverContainer](self, "blurredCoverContainer"));
  objc_msgSend(v25, "addSubview:", v26);

}

- (void)_teardownContentViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator fullBookSnapshot](self, "fullBookSnapshot"));
  objc_msgSend(v3, "removeFromSuperview");

  -[BKBookBloomOpenAnimator setFullBookSnapshot:](self, "setFullBookSnapshot:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator contentSnapshot](self, "contentSnapshot"));
  objc_msgSend(v4, "removeFromSuperview");

  -[BKBookBloomOpenAnimator setContentSnapshot:](self, "setContentSnapshot:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator contentBackgroundView](self, "contentBackgroundView"));
  objc_msgSend(v5, "removeFromSuperview");

  -[BKBookBloomOpenAnimator setContentBackgroundView:](self, "setContentBackgroundView:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator contentContainerView](self, "contentContainerView"));
  objc_msgSend(v6, "removeFromSuperview");

  -[BKBookBloomOpenAnimator setContentContainerView:](self, "setContentContainerView:", 0);
}

- (void)teardownViews:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_super v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a3;
  -[BKBookBloomOpenAnimator _teardownContentViews](self, "_teardownContentViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator blurredShadowSnapshot](self, "blurredShadowSnapshot"));
  objc_msgSend(v5, "removeFromSuperview");

  -[BKBookBloomOpenAnimator setBlurredShadowSnapshot:](self, "setBlurredShadowSnapshot:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator blurredShadowContainer](self, "blurredShadowContainer"));
  objc_msgSend(v6, "removeFromSuperview");

  -[BKBookBloomOpenAnimator setBlurredShadowContainer:](self, "setBlurredShadowContainer:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator blurredCoverContainer](self, "blurredCoverContainer"));
  objc_msgSend(v7, "removeFromSuperview");

  -[BKBookBloomOpenAnimator setBlurredCoverContainer:](self, "setBlurredCoverContainer:", 0);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator viewsToBeCleanedUp](self, "viewsToBeCleanedUp"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v12), "removeFromSuperview");
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator viewsToBeCleanedUp](self, "viewsToBeCleanedUp"));
  objc_msgSend(v13, "removeAllObjects");

  v14.receiver = self;
  v14.super_class = (Class)BKBookBloomOpenAnimator;
  -[BKBookZoomRevealOpenAnimator teardownViews:](&v14, "teardownViews:", v3);
}

- (void)setupViewsForZoom
{
  void *v3;
  void *v4;
  id v5;

  if (-[BKBookOpenAnimator opening](self, "opening"))
  {
    -[BKBookBloomOpenAnimator _teardownContentViews](self, "_teardownContentViews");
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookContainerView](self, "bookContainerView"));
    objc_msgSend(v3, "setAlpha:", 0.0);

    v5 = (id)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator containerView](self, "containerView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator blurredCoverContainer](self, "blurredCoverContainer"));
    objc_msgSend(v5, "addSubview:", v4);

  }
}

- (void)_setTargetFrame:(CGRect)a3 forView:(id)a4 baseFrame:(CGRect)a5 extraTransform:(CGAffineTransform *)a6
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v11;
  CGFloat v12;
  id v13;
  __int128 v14;
  CGAffineTransform *v15;
  CGAffineTransform v16;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v19;
  CGAffineTransform v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  memset(&v20, 0, sizeof(v20));
  v11 = a3.size.width / a5.size.width;
  v12 = a3.size.height / a5.size.height;
  v13 = a4;
  CGAffineTransformMakeScale(&v20, v11, v12);
  t1 = v20;
  v14 = *(_OWORD *)&a6->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a6->a;
  *(_OWORD *)&t2.c = v14;
  *(_OWORD *)&t2.tx = *(_OWORD *)&a6->tx;
  v15 = CGAffineTransformConcat(&v19, &t1, &t2);
  v20 = v19;
  CGRectGetCenterNoRounding(v15, x, y, width, height);
  objc_msgSend(v13, "setCenter:");
  v16 = v20;
  objc_msgSend(v13, "setTransform:", &v16);

}

- (void)_moveCoverToFrame:(CGRect)a3 extraTransform:(CGAffineTransform *)a4
{
  void *v6;
  void *v7;
  __int128 v8;
  void *v9;
  CGAffineTransform v10;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v13;

  -[BKBookOpenAnimator moveCoverToFrame:](self, "moveCoverToFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverContainerView](self, "coverContainerView"));
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "transform");
  else
    memset(&t1, 0, sizeof(t1));
  v8 = *(_OWORD *)&a4->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&t2.c = v8;
  *(_OWORD *)&t2.tx = *(_OWORD *)&a4->tx;
  CGAffineTransformConcat(&v13, &t1, &t2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverContainerView](self, "coverContainerView"));
  v10 = v13;
  objc_msgSend(v9, "setTransform:", &v10);

}

- (void)_moveContentContainerToFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  __int128 v11;
  double v12;
  double v13;
  double v14;
  _OWORD v15[3];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator contentContainerView](self, "contentContainerView"));
  -[BKBookBloomOpenAnimator revealSmallContentContainerFrame](self, "revealSmallContentContainerFrame");
  v10 = v9;
  v11 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v15[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v15[1] = v11;
  v15[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  -[BKBookBloomOpenAnimator _setTargetFrame:forView:baseFrame:extraTransform:](self, "_setTargetFrame:forView:baseFrame:extraTransform:", v8, v15, x, y, width, height, v12, v10, v13, v14);

}

- (void)animateZoomWithCompletion:(id)a3
{
  id v4;
  _BOOL4 useShadowEffects;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  __int128 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  id v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[5];
  _QWORD v49[5];
  __int128 v50;
  BOOL v51;
  _QWORD v52[9];
  __int128 v53;
  BOOL v54;
  _OWORD v55[3];

  v4 = a3;
  if (-[BKBookOpenAnimator opening](self, "opening"))
  {
    useShadowEffects = self->_useShadowEffects;
    -[BKBookOpenAnimator closedCoverFrame](self, "closedCoverFrame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[BKBookBloomOpenAnimator zoomedCoverFrame](self, "zoomedCoverFrame");
    v46 = v15;
    v47 = v14;
    v17 = v16;
    v19 = v18;
    -[BKBookBloomOpenAnimator zoomDuration](self, "zoomDuration");
    v21 = v20;
    v22 = 0.0;
    -[BKBookOpenAnimator animateNavigationBarWithDuration:delay:](self, "animateNavigationBarWithDuration:delay:", v20 * 0.5, 0.0);
    if (!-[BKBookOpenAnimator fadeInCover](self, "fadeInCover"))
      v22 = 1.0;
    v23 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v55[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v55[1] = v23;
    v55[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    -[BKBookBloomOpenAnimator _moveCoverToFrame:extraTransform:](self, "_moveCoverToFrame:extraTransform:", v55, v7, v9, v11, v13);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverContainerView](self, "coverContainerView"));
    objc_msgSend(v24, "setAlpha:", v22);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookshelfTintView](self, "bookshelfTintView"));
    objc_msgSend(v25, "setAlpha:", 0.0);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator blurredShadowContainer](self, "blurredShadowContainer"));
    objc_msgSend(v26, "setAlpha:", 1.0);

    if (useShadowEffects)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator blurredShadowContainer](self, "blurredShadowContainer"));
      +[BKBookBloomOpenAnimator setBlurRadius:forView:](BKBookBloomOpenAnimator, "setBlurRadius:forView:", v27, 0.0);

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator blurredShadowContainer](self, "blurredShadowContainer"));
      +[BKBookBloomOpenAnimator setBrightnessFilter:forView:](BKBookBloomOpenAnimator, "setBrightnessFilter:forView:", v28, 0.0);

    }
    -[BKBookOpenAnimator adjustDuration:](self, "adjustDuration:", 0.2);
    -[BKBookOpenAnimator minibarKeyFrameAnimationWithDuration:hide:show:completion:](self, "minibarKeyFrameAnimationWithDuration:hide:show:completion:", 0, v21, v29, -1.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator _zoomSpring](self, "_zoomSpring"));
    objc_msgSend(v30, "mass");
    v32 = v31;
    objc_msgSend(v30, "stiffness");
    v34 = v33;
    objc_msgSend(v30, "damping");
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_1000A6EC4;
    v52[3] = &unk_1008E8C50;
    v52[4] = self;
    v52[5] = v47;
    v52[6] = v46;
    v52[7] = v17;
    v52[8] = v19;
    v54 = useShadowEffects;
    v53 = xmmword_10070C7D0;
    +[UIView _animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:](UIView, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v52, v4, v21, 0.0, v32, v34, v35, 0.0);
    -[BKBookOpenAnimator adjustDuration:](self, "adjustDuration:", 0.3);
    v37 = v36;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator _customTimingFunction](self, "_customTimingFunction"));
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_1000A6F88;
    v49[3] = &unk_1008E8C78;
    v49[4] = self;
    __asm { FMOV            V0.2D, #1.0 }
    v50 = _Q0;
    v51 = useShadowEffects;
    +[UIView animateWithDuration:delay:timingFunction:options:animations:completion:](UIView, "animateWithDuration:delay:timingFunction:options:animations:completion:", v38, 0, v49, 0, v37, 0.0);

    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_1000A702C;
    v48[3] = &unk_1008E72C0;
    v48[4] = self;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v48, v21);

  }
  else
  {
    v44 = objc_retainBlock(v4);
    v45 = v44;
    if (v44)
      (*((void (**)(id, uint64_t))v44 + 2))(v44, 1);

  }
}

- (void)_adjustShadowForCurrentCoverBounds
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double CenterNoRounding;
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
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  CGFloat v32;
  void *v33;
  CGAffineTransform v34;
  CGAffineTransform v35;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverShadowView](self, "coverShadowView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverShadowImage](self, "coverShadowImage"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverContainerView](self, "coverContainerView"));
      v6 = objc_msgSend(v5, "frame");
      CenterNoRounding = CGRectGetCenterNoRounding(v6, v7, v8, v9, v10);
      v13 = v12;

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverShadowView](self, "coverShadowView"));
      objc_msgSend(v14, "setCenter:", CenterNoRounding, v13);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverShadowImage](self, "coverShadowImage"));
      objc_msgSend(v15, "alignmentRectInsets");
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverShadowImage](self, "coverShadowImage"));
      objc_msgSend(v24, "size");
      CGRectMakeWithSize(v25, v26);
      v28 = v27 - (v19 + v23);
      v30 = v29 - (v17 + v21);

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverContainerView](self, "coverContainerView"));
      v32 = CGSizeScaleThatFillsInCGSize(objc_msgSend(v31, "frame"), v28, v30);

      CGAffineTransformMakeScale(&v35, v32, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverShadowView](self, "coverShadowView"));
      v34 = v35;
      objc_msgSend(v33, "setTransform:", &v34);

    }
  }
}

- (void)setupSpinner
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double MaxY;
  double v32;
  double MidX;
  void *v34;
  id v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator containerView](self, "containerView"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator containerView](self, "containerView"));
  -[BKBookBloomOpenAnimator zoomedCoverFrame](self, "zoomedCoverFrame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverContainerView](self, "coverContainerView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "superview"));
  objc_msgSend(v12, "convertRect:fromView:", v22, v14, v16, v18, v20);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;

  v36.origin.x = v24;
  v36.origin.y = v26;
  v36.size.width = v28;
  v36.size.height = v30;
  MaxY = CGRectGetMaxY(v36);
  v37.origin.x = v5;
  v37.origin.y = v7;
  v37.size.width = v9;
  v37.size.height = v11;
  v32 = CGRectGetMaxY(v37);
  v38.origin.x = v5;
  v38.origin.y = v7;
  v38.size.width = v9;
  v38.size.height = v11;
  MidX = CGRectGetMidX(v38);
  v35 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
  v39.origin.x = CGRectMakeWithCenterAndSize(objc_msgSend(v35, "bounds"), MidX, MaxY + (v32 - MaxY) * 0.5);
  v40 = CGRectIntegral(v39);
  objc_msgSend(v35, "setFrame:", v40.origin.x, v40.origin.y, v40.size.width, v40.size.height);
  objc_msgSend(v35, "setAlpha:", 0.0);
  objc_msgSend(v35, "startAnimating");
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator containerView](self, "containerView"));
  objc_msgSend(v34, "addSubview:", v35);

  -[BKBookZoomRevealOpenAnimator setSpinnerView:](self, "setSpinnerView:", v35);
}

- (void)setupViewsForReveal
{
  void *v2;
  unsigned int v4;
  unsigned __int8 v5;
  _BOOL8 v6;
  uint64_t v7;
  NSObject *v8;
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
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  CGFloat x;
  double v57;
  CGFloat y;
  double v59;
  CGFloat width;
  double v61;
  CGFloat height;
  uint64_t v63;
  NSObject *v64;
  void *v65;
  id v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  double v86;
  double v87;
  double v88;
  double v89;
  void *v90;
  unsigned __int8 v91;
  uint64_t v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  void *v121;
  void *v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  void *v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  uint64_t v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  void *v154;
  id v155;
  void *v156;
  void *v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  double v175;
  double v176;
  double v177;
  double v178;
  double v179;
  double v180;
  double v181;
  double v182;
  double v183;
  void *v184;
  void *v185;
  void *v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v191;
  double v192;
  double v193;
  double v194;
  double v195;
  double v196;
  double v197;
  void *v198;
  void *v199;
  void *v200;
  double v201;
  CGFloat v202;
  double v203;
  CGFloat v204;
  double v205;
  CGFloat v206;
  double v207;
  CGFloat v208;
  void *v209;
  CGFloat v210;
  CGFloat v211;
  CGFloat v212;
  CGFloat v213;
  double v214;
  double v215;
  double v216;
  double v217;
  void *v218;
  void *v219;
  void *v220;
  NSString *v221;
  void *v222;
  double v223;
  double v224;
  double v225;
  double v226;
  double v227;
  double v228;
  double v229;
  double v230;
  double v231;
  double v232;
  uint8_t buf[4];
  void *v234;
  CGRect v235;
  CGRect v236;
  CGRect v237;
  CGRect v238;
  CGRect v239;
  CGRect v240;
  CGRect v241;
  CGRect v242;
  CGRect v243;

  v4 = -[BKBookOpenAnimator opening](self, "opening");
  v5 = -[BKBookZoomRevealOpenAnimator contentLoaded](self, "contentLoaded");
  if (v4)
  {
    if ((v5 & 1) == 0)
      BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKBookBloomOpenAnimator.m", 500, "-[BKBookBloomOpenAnimator setupViewsForReveal]", "!opening || self.contentLoaded", CFSTR("Revealing content before book is loaded!"));
    v6 = -[BKBookZoomRevealOpenAnimator contentLoaded](self, "contentLoaded");
    if (!v6)
    {
      v7 = _AEBookOpenLog(v6);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Revealing content before book is loaded!", buf, 2u);
      }

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookshelfTintView](self, "bookshelfTintView"));
    objc_msgSend(v9, "setAlpha:", 1.0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookContainerView](self, "bookContainerView"));
    objc_msgSend(v10, "setAlpha:", 0.0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator blurredCoverContainer](self, "blurredCoverContainer"));
    objc_msgSend(v11, "setHidden:", 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator blurredShadowContainer](self, "blurredShadowContainer"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "snapshotViewAfterScreenUpdates:", 0));

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator blurredShadowContainer](self, "blurredShadowContainer"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "superview"));
      objc_msgSend(v15, "addSubview:", v13);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator blurredShadowContainer](self, "blurredShadowContainer"));
      objc_msgSend(v16, "center");
      objc_msgSend(v13, "setCenter:");

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator blurredShadowContainer](self, "blurredShadowContainer"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "superview"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator blurredShadowContainer](self, "blurredShadowContainer"));
      objc_msgSend(v18, "insertSubview:belowSubview:", v13, v19);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator blurredShadowContainer](self, "blurredShadowContainer"));
      objc_msgSend(v20, "setAlpha:", 0.0);

      -[BKBookBloomOpenAnimator setBlurredShadowSnapshot:](self, "setBlurredShadowSnapshot:", v13);
    }
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookshelfTintView](self, "bookshelfTintView"));
    objc_msgSend(v21, "setAlpha:", 1.0);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookContainerView](self, "bookContainerView"));
    objc_msgSend(v22, "setAlpha:", 0.0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator blurredCoverContainer](self, "blurredCoverContainer"));
    objc_msgSend(v13, "setHidden:", 0);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator containerView](self, "containerView"));
  objc_msgSend(v23, "bounds");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;

  v235.origin.x = v25;
  v235.origin.y = v27;
  v235.size.width = v29;
  v235.size.height = v31;
  if (CGRectIsEmpty(v235))
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKBookBloomOpenAnimator.m", 532, "-[BKBookBloomOpenAnimator setupViewsForReveal]", "!CGRectIsEmpty(smallContentContainerFrame)", CFSTR("containerView should not be zero-sized. The math will not be right"));
  v32 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v25, v27, v29, v31);
  -[BKBookBloomOpenAnimator setContentContainerView:](self, "setContentContainerView:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator containerView](self, "containerView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator contentContainerView](self, "contentContainerView"));
  objc_msgSend(v33, "addSubview:", v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookViewController](self, "bookViewController"));
  v36 = objc_alloc((Class)UIView);
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator contentContainerView](self, "contentContainerView"));
  objc_msgSend(v37, "bounds");
  v38 = objc_msgSend(v36, "initWithFrame:");
  -[BKBookBloomOpenAnimator setContentBackgroundView:](self, "setContentBackgroundView:", v38);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator contentContainerView](self, "contentContainerView"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator contentBackgroundView](self, "contentBackgroundView"));
  objc_msgSend(v39, "addSubview:", v40);

  if ((objc_opt_respondsToSelector(v35, "transitionContentBackgroundColor") & 1) != 0)
    v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "transitionContentBackgroundColor"));
  else
    v41 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v42 = (void *)v41;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator contentBackgroundView](self, "contentBackgroundView"));
  objc_msgSend(v43, "setBackgroundColor:", v42);

  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "transitionContentView"));
  v229 = v27;
  v230 = v25;
  v227 = v31;
  v228 = v29;
  if (v44)
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator contentContainerView](self, "contentContainerView"));
    objc_msgSend(v44, "frame");
    v47 = v46;
    v49 = v48;
    v51 = v50;
    v53 = v52;
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "superview"));
    objc_msgSend(v45, "convertRect:fromView:", v54, v47, v49, v51, v53);
    x = v55;
    y = v57;
    width = v59;
    height = v61;

  }
  else
  {
    v63 = _AEBookOpenLog(0);
    v64 = objc_claimAutoreleasedReturnValue(v63);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      v65 = (void *)objc_opt_class(v35);
      *(_DWORD *)buf = 138412290;
      v234 = v65;
      v66 = v65;
      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "-[%@ transitionContentView] should not return nil", buf, 0xCu);

    }
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator contentContainerView](self, "contentContainerView"));
  objc_msgSend(v67, "bounds");
  v242.origin.x = x;
  v242.origin.y = y;
  v242.size.width = width;
  v242.size.height = height;
  v237 = CGRectIntersection(v236, v242);
  v68 = v237.origin.x;
  v69 = v237.origin.y;
  v70 = v237.size.width;
  v71 = v237.size.height;

  v238.origin.x = v68;
  v238.origin.y = v69;
  v238.size.width = v70;
  v238.size.height = v71;
  if (CGRectIsNull(v238))
  {
    v241.origin.x = x;
    v241.origin.y = y;
    v241.size.width = width;
    v241.size.height = height;
    v221 = NSStringFromCGRect(v241);
    v222 = (void *)objc_claimAutoreleasedReturnValue(v221);
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKBookBloomOpenAnimator.m", 564, "-[BKBookBloomOpenAnimator setupViewsForReveal]", "!CGRectIsNull(bigContentVisibleRect)", CFSTR("Unexpected: transitionContentView is offscreen: %@"));

  }
  v231 = height;
  v232 = width;
  v225 = y;
  v226 = x;
  -[BKBookOpenAnimator _sanitizedFrameWithFullsizeFrame:name:](self, "_sanitizedFrameWithFullsizeFrame:name:", CFSTR("bigContentVisibleRect"), v68, v69, v70, v71, v222);
  v73 = v72;
  v75 = v74;
  v77 = v76;
  v79 = v78;
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverImage](self, "coverImage"));
  objc_msgSend(v80, "size");
  v82 = v81;
  v84 = v83;
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator contentContainerView](self, "contentContainerView"));
  objc_msgSend(v85, "bounds");
  v87 = v86;
  v89 = v88;
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator toViewController](self, "toViewController"));
  v91 = objc_msgSend(v90, "im_isCompactWidth");
  if ((v91 & 1) != 0)
  {
    v92 = 1;
  }
  else
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator toViewController](self, "toViewController"));
    v92 = (uint64_t)objc_msgSend(v2, "im_isCompactHeight");
  }
  -[BKBookBloomOpenAnimator _insetsFromContentSize:toCoverSize:containerSize:isCompact:](self, "_insetsFromContentSize:toCoverSize:containerSize:isCompact:", v92, v77, v79, v82, v84, v87, v89);
  v94 = v93;
  v96 = v95;
  v98 = v97;
  v100 = v99;
  if ((v91 & 1) == 0)

  v223 = v96;
  v224 = v94;
  -[BKBookBloomOpenAnimator _frameOfCoverThatFitsContentWithFrame:insetsContentToCover:](self, "_frameOfCoverThatFitsContentWithFrame:insetsContentToCover:", v73, v75, v77, v79, v94, v96, v98, v100);
  v102 = v101;
  v104 = v103;
  v106 = v105;
  v108 = v107;
  v109 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverContainerView](self, "coverContainerView"));
  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "superview"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator contentContainerView](self, "contentContainerView"));
  objc_msgSend(v110, "convertRect:fromView:", v111, v102, v104, v106, v108);
  -[BKBookBloomOpenAnimator setRevealBigCoverFrame:](self, "setRevealBigCoverFrame:");

  v112 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator contentContainerView](self, "contentContainerView"));
  if (v4)
    -[BKBookBloomOpenAnimator zoomedCoverFrame](self, "zoomedCoverFrame");
  else
    -[BKBookOpenAnimator closedCoverFrame](self, "closedCoverFrame");
  v117 = v113;
  v118 = v114;
  v119 = v115;
  v120 = v116;
  v121 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverContainerView](self, "coverContainerView"));
  v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "superview"));
  objc_msgSend(v112, "convertRect:fromView:", v122, v117, v118, v119, v120);
  v124 = v123;
  v126 = v125;
  v128 = v127;
  v130 = v129;

  v131 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverImage](self, "coverImage"));
  objc_msgSend(v131, "size");
  -[BKBookBloomOpenAnimator _frameOfContentWithAspectRatio:thatFitsCoverOfAspectRatio:withFrame:insetsContentToCover:](self, "_frameOfContentWithAspectRatio:thatFitsCoverOfAspectRatio:withFrame:insetsContentToCover:", v77, v79, v132, v133, v124, v126, v128, v130, *(_QWORD *)&v224, *(_QWORD *)&v223, *(_QWORD *)&v98, *(_QWORD *)&v100);
  v135 = v134;
  v137 = v136;
  v139 = v138;
  v141 = v140;

  v143 = BCNormalizedInsetsForRects(v142);
  v147 = BCRectByApplyingNormalizedInsets(v135, v137, v139, v141, v143, v144, v145, v146);
  v149 = v148;
  v151 = v150;
  v153 = v152;
  if ((objc_opt_respondsToSelector(v35, "transitionContentViewImage") & 1) != 0)
  {
    v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "transitionContentViewImage"));
    if (v154)
    {
      v155 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v154);
      -[BKBookBloomOpenAnimator setContentSnapshot:](self, "setContentSnapshot:", v155);

    }
  }
  v156 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator contentSnapshot](self, "contentSnapshot"));

  if (!v156)
  {
    v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "snapshotViewAfterScreenUpdates:", 0));
    -[BKBookBloomOpenAnimator setContentSnapshot:](self, "setContentSnapshot:", v157);

  }
  -[BKBookOpenAnimator _sanitizedFrameWithCenteredFrame:ofSize:name:](self, "_sanitizedFrameWithCenteredFrame:ofSize:name:", CFSTR("smallContentFrame"), v147, v149, v151, v153, 1.0, 1.0);
  v159 = v158;
  v161 = v160;
  v163 = v162;
  v165 = v164;
  v166 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator contentSnapshot](self, "contentSnapshot"));
  objc_msgSend(v166, "setFrame:", v159, v161, v163, v165);

  v167 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator contentContainerView](self, "contentContainerView"));
  v168 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator contentSnapshot](self, "contentSnapshot"));
  objc_msgSend(v167, "addSubview:", v168);

  v169 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator contentContainerView](self, "contentContainerView"));
  v170 = BCNormalizedInsetsForRects(objc_msgSend(v169, "bounds"));
  v172 = v171;
  v174 = v173;
  v176 = v175;

  v177 = BCRectByApplyingNormalizedInsets(v226, v225, v232, v231, v170, v172, v174, v176);
  v179 = v178;
  v181 = v180;
  v183 = v182;
  v184 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator contentContainerView](self, "contentContainerView"));
  v185 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v184, "superview"));
  v186 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator contentContainerView](self, "contentContainerView"));
  objc_msgSend(v185, "convertRect:fromView:", v186, v177, v179, v181, v183);
  -[BKBookBloomOpenAnimator setRevealBigContentContainerFrame:](self, "setRevealBigContentContainerFrame:");

  -[BKBookBloomOpenAnimator setRevealSmallContentContainerFrame:](self, "setRevealSmallContentContainerFrame:", v230, v229, v228, v227);
  v187 = BCNormalizedInsetsForRects(-[BKBookBloomOpenAnimator revealBigContentContainerFrame](self, "revealBigContentContainerFrame"));
  v191 = BCRectByApplyingNormalizedInsets(v230, v229, v228, v227, v187, v188, v189, v190);
  v193 = v192;
  v195 = v194;
  v197 = v196;
  v198 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator contentContainerView](self, "contentContainerView"));
  v199 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator contentContainerView](self, "contentContainerView"));
  v200 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v199, "superview"));
  objc_msgSend(v198, "convertRect:fromView:", v200, v191, v193, v195, v197);
  v202 = v201;
  v204 = v203;
  v206 = v205;
  v208 = v207;

  v209 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator contentBackgroundView](self, "contentBackgroundView"));
  objc_msgSend(v209, "frame");
  v243.origin.x = v210;
  v243.origin.y = v211;
  v243.size.width = v212;
  v243.size.height = v213;
  v239.origin.x = v202;
  v239.origin.y = v204;
  v239.size.width = v206;
  v239.size.height = v208;
  v240 = CGRectUnion(v239, v243);
  v214 = v240.origin.x;
  v215 = v240.origin.y;
  v216 = v240.size.width;
  v217 = v240.size.height;
  v218 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator contentBackgroundView](self, "contentBackgroundView"));
  objc_msgSend(v218, "setFrame:", v214, v215, v216, v217);

  v219 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator containerView](self, "containerView"));
  v220 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator blurredCoverContainer](self, "blurredCoverContainer"));
  objc_msgSend(v219, "addSubview:", v220);

}

- (void)animateRevealWithCompletion:(id)a3
{
  id v4;

  v4 = a3;
  if (-[BKBookOpenAnimator opening](self, "opening"))
    -[BKBookBloomOpenAnimator _animateRevealForOpeningWithCompletion:](self, "_animateRevealForOpeningWithCompletion:", v4);
  else
    -[BKBookBloomOpenAnimator _animateRevealForClosingWithCompletion:](self, "_animateRevealForClosingWithCompletion:", v4);

}

- (BOOL)_contentViewIsShowingCover
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookViewController](self, "bookViewController"));
  if ((objc_opt_respondsToSelector(v2, "transitionContentViewIsShowingCover") & 1) != 0)
    v3 = objc_msgSend(v2, "transitionContentViewIsShowingCover");
  else
    v3 = 0;

  return v3;
}

- (void)_animateRevealForOpeningWithCompletion:(id)a3
{
  id v4;
  _QWORD *v5;
  _QWORD *v6;
  unsigned int v7;
  _BOOL4 useShadowEffects;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  id v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  double v77;
  _QWORD v78[5];
  _QWORD v79[6];
  _QWORD v80[6];
  _QWORD v81[5];
  id v82;
  _QWORD v83[6];
  _QWORD v84[5];
  id v85;
  _QWORD v86[5];
  _QWORD v87[13];
  _OWORD v88[3];
  _QWORD v89[4];
  id v90;
  _QWORD *v91;
  _QWORD v92[5];
  _QWORD v93[6];

  v4 = a3;
  v93[0] = 0;
  v93[1] = v93;
  v93[2] = 0x2020000000;
  v93[3] = 0;
  v92[0] = _NSConcreteStackBlock;
  v92[1] = 3221225472;
  v92[2] = sub_1000A886C;
  v92[3] = &unk_1008E7BE8;
  v92[4] = v93;
  v5 = objc_retainBlock(v92);
  v89[0] = _NSConcreteStackBlock;
  v89[1] = 3221225472;
  v89[2] = sub_1000A8884;
  v89[3] = &unk_1008E8CA0;
  v91 = v93;
  v67 = v4;
  v90 = v67;
  v6 = objc_retainBlock(v89);
  v7 = -[BKBookBloomOpenAnimator _contentViewIsShowingCover](self, "_contentViewIsShowingCover");
  useShadowEffects = self->_useShadowEffects;
  -[BKBookBloomOpenAnimator revealDuration](self, "revealDuration");
  v77 = v9;
  -[BKBookBloomOpenAnimator zoomedCoverFrame](self, "zoomedCoverFrame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[BKBookBloomOpenAnimator revealBigCoverFrame](self, "revealBigCoverFrame");
  v75 = v19;
  v76 = v18;
  v73 = v21;
  v74 = v20;
  -[BKBookBloomOpenAnimator revealSmallContentContainerFrame](self, "revealSmallContentContainerFrame");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  -[BKBookBloomOpenAnimator revealBigContentContainerFrame](self, "revealBigContentContainerFrame");
  v71 = v31;
  v72 = v30;
  v69 = v33;
  v70 = v32;
  v34 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v88[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v88[1] = v34;
  v88[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  -[BKBookBloomOpenAnimator _moveCoverToFrame:extraTransform:](self, "_moveCoverToFrame:extraTransform:", v88, v11, v13, v15, v17);
  -[BKBookBloomOpenAnimator _moveContentContainerToFrame:](self, "_moveContentContainerToFrame:", v23, v25, v27, v29);
  if (useShadowEffects)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator blurredShadowSnapshot](self, "blurredShadowSnapshot", v67));

    if (v35)
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator blurredShadowSnapshot](self, "blurredShadowSnapshot"));
    else
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator blurredShadowContainer](self, "blurredShadowContainer"));
    objc_msgSend(v36, "setAlpha:", 1.0);

  }
  ((void (*)(_QWORD *))v5[2])(v5);
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator _revealSpring](self, "_revealSpring"));
  objc_msgSend(v37, "mass");
  v39 = v38;
  objc_msgSend(v37, "stiffness");
  v41 = v40;
  objc_msgSend(v37, "damping");
  v87[0] = _NSConcreteStackBlock;
  v87[1] = 3221225472;
  v87[2] = sub_1000A8900;
  v87[3] = &unk_1008E8450;
  v87[4] = self;
  v87[5] = v76;
  v87[6] = v75;
  v87[7] = v74;
  v87[8] = v73;
  v87[9] = v72;
  v87[10] = v71;
  v87[11] = v70;
  v87[12] = v69;
  +[UIView _animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:](UIView, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v87, v6, v77, 0.0, v39, v41, v42, 0.0);
  if (useShadowEffects)
  {
    -[BKBookOpenAnimator adjustDuration:](self, "adjustDuration:", 0.2);
    v44 = v43;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator _customTimingFunction](self, "_customTimingFunction"));
    v86[0] = _NSConcreteStackBlock;
    v86[1] = 3221225472;
    v86[2] = sub_1000A8960;
    v86[3] = &unk_1008E72C0;
    v86[4] = self;
    +[UIView animateWithDuration:delay:timingFunction:options:animations:completion:](UIView, "animateWithDuration:delay:timingFunction:options:animations:completion:", v45, 0, v86, v6, v44, 0.0);

  }
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookViewController](self, "bookViewController", v67));
  if ((objc_opt_respondsToSelector(v46, "transitionContentBackgroundColor") & 1) != 0)
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "transitionContentBackgroundColor"));
  else
    v47 = 0;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator bookshelfTintColor](self, "bookshelfTintColor"));
  v49 = v47;
  if (v7)
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverContainerView](self, "coverContainerView"));
    objc_msgSend(v50, "setAlpha:", 1.0);

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator contentContainerView](self, "contentContainerView"));
    objc_msgSend(v51, "setAlpha:", 0.0);

    if (v49)
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookshelfTintView](self, "bookshelfTintView"));
      objc_msgSend(v52, "setBackgroundColor:", v48);

      ((void (*)(_QWORD *))v5[2])(v5);
      -[BKBookOpenAnimator adjustDuration:](self, "adjustDuration:", 0.2);
      v54 = v53;
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator _customTimingFunction](self, "_customTimingFunction"));
      v84[0] = _NSConcreteStackBlock;
      v84[1] = 3221225472;
      v84[2] = sub_1000A89C4;
      v84[3] = &unk_1008E7338;
      v84[4] = self;
      v85 = v49;
      +[UIView animateWithDuration:delay:timingFunction:options:animations:completion:](UIView, "animateWithDuration:delay:timingFunction:options:animations:completion:", v55, 0, v84, v6, v54, 0.0);

    }
  }
  else
  {
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverContainerView](self, "coverContainerView"));
    objc_msgSend(v56, "setAlpha:", 1.0);

    v57 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator contentContainerView](self, "contentContainerView"));
    objc_msgSend(v57, "setAlpha:", 0.0);

    v58 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator blurredCoverContainer](self, "blurredCoverContainer"));
    +[BKBookBloomOpenAnimator setBlurRadius:forView:](BKBookBloomOpenAnimator, "setBlurRadius:forView:", v58, 0.0);

    ((void (*)(_QWORD *))v5[2])(v5);
    -[BKBookOpenAnimator adjustDuration:](self, "adjustDuration:", 0.4);
    v83[0] = _NSConcreteStackBlock;
    v83[1] = 3221225472;
    v83[2] = sub_1000A8A00;
    v83[3] = &unk_1008E8CC8;
    v83[4] = self;
    v83[5] = 0x405E000000000000;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v83, v6);
    if (v49)
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookshelfTintView](self, "bookshelfTintView"));
      objc_msgSend(v59, "setBackgroundColor:", v48);

      ((void (*)(_QWORD *))v5[2])(v5);
      -[BKBookOpenAnimator adjustDuration:](self, "adjustDuration:", 0.2);
      v61 = v60;
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator _customTimingFunction](self, "_customTimingFunction"));
      v81[0] = _NSConcreteStackBlock;
      v81[1] = 3221225472;
      v81[2] = sub_1000A8A58;
      v81[3] = &unk_1008E7338;
      v81[4] = self;
      v82 = v49;
      +[UIView animateWithDuration:delay:timingFunction:options:animations:completion:](UIView, "animateWithDuration:delay:timingFunction:options:animations:completion:", v62, 0, v81, v6, v61, 0.0);

    }
    ((void (*)(_QWORD *))v5[2])(v5);
    -[BKBookOpenAnimator adjustDuration:](self, "adjustDuration:", 0.2);
    v64 = v63;
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator _customTimingFunction](self, "_customTimingFunction"));
    v80[0] = _NSConcreteStackBlock;
    v80[1] = 3221225472;
    v80[2] = sub_1000A8A94;
    v80[3] = &unk_1008E8CC8;
    v80[4] = self;
    v80[5] = 0;
    +[UIView animateWithDuration:delay:timingFunction:options:animations:completion:](UIView, "animateWithDuration:delay:timingFunction:options:animations:completion:", v65, 0, v80, v6, v64, 0.0);

    ((void (*)(_QWORD *))v5[2])(v5);
    -[BKBookOpenAnimator adjustDuration:](self, "adjustDuration:", 0.17);
    v79[0] = _NSConcreteStackBlock;
    v79[1] = 3221225472;
    v79[2] = sub_1000A8AD4;
    v79[3] = &unk_1008E8CC8;
    v79[4] = self;
    v79[5] = 0x3FF0000000000000;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v79, v6);
  }
  ((void (*)(_QWORD *))v5[2])(v5);
  -[BKBookOpenAnimator adjustDuration:](self, "adjustDuration:", 0.2);
  -[BKBookOpenAnimator minibarKeyFrameAnimationWithDuration:hide:show:completion:](self, "minibarKeyFrameAnimationWithDuration:hide:show:completion:", v6, v77, -1.0, v66);
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = sub_1000A8B14;
  v78[3] = &unk_1008E72C0;
  v78[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v78, v77);

  _Block_object_dispose(v93, 8);
}

- (void)_animateRevealForClosingWithCompletion:(id)a3
{
  id v4;
  _QWORD *v5;
  id v6;
  _QWORD *v7;
  double v8;
  unsigned __int8 v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  double v67;
  _QWORD v68[5];
  _QWORD v69[6];
  _QWORD v70[6];
  _QWORD v71[6];
  _QWORD v72[6];
  _QWORD v73[13];
  _OWORD v74[3];
  _QWORD v75[4];
  id v76;
  _QWORD *v77;
  _QWORD v78[5];
  _QWORD v79[5];

  v4 = a3;
  v79[0] = 0;
  v79[1] = v79;
  v79[2] = 0x2020000000;
  v79[3] = 0;
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = sub_1000A9124;
  v78[3] = &unk_1008E7BE8;
  v78[4] = v79;
  v5 = objc_retainBlock(v78);
  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472;
  v75[2] = sub_1000A913C;
  v75[3] = &unk_1008E8CA0;
  v77 = v79;
  v6 = v4;
  v76 = v6;
  v7 = objc_retainBlock(v75);
  -[BKBookBloomOpenAnimator closeDuration](self, "closeDuration");
  v67 = v8;
  v9 = -[BKBookOpenAnimator fadeInCover](self, "fadeInCover");
  -[BKBookBloomOpenAnimator revealBigCoverFrame](self, "revealBigCoverFrame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[BKBookOpenAnimator closedCoverFrame](self, "closedCoverFrame");
  v65 = v19;
  v66 = v18;
  v63 = v21;
  v64 = v20;
  -[BKBookBloomOpenAnimator revealBigContentContainerFrame](self, "revealBigContentContainerFrame");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  -[BKBookBloomOpenAnimator revealSmallContentContainerFrame](self, "revealSmallContentContainerFrame");
  v61 = v31;
  v62 = v30;
  v59 = v33;
  v60 = v32;
  v34 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v74[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v74[1] = v34;
  v74[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  -[BKBookBloomOpenAnimator _moveCoverToFrame:extraTransform:](self, "_moveCoverToFrame:extraTransform:", v74, v11, v13, v15, v17);
  -[BKBookBloomOpenAnimator _moveContentContainerToFrame:](self, "_moveContentContainerToFrame:", v23, v25, v27, v29);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverContainerView](self, "coverContainerView"));
  objc_msgSend(v35, "setAlpha:", 0.0);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator blurredCoverContainer](self, "blurredCoverContainer"));
  +[BKBookBloomOpenAnimator setBlurRadius:forView:](BKBookBloomOpenAnimator, "setBlurRadius:forView:", v36, 120.0);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookshelfTintView](self, "bookshelfTintView"));
  objc_msgSend(v37, "setAlpha:", 1.0);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator contentContainerView](self, "contentContainerView"));
  objc_msgSend(v38, "setAlpha:", 1.0);

  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = sub_1000A91B8;
  v73[3] = &unk_1008E8450;
  v73[4] = self;
  v73[5] = v66;
  v73[6] = v65;
  v73[7] = v64;
  v73[8] = v63;
  v73[9] = v62;
  v73[10] = v61;
  v73[11] = v60;
  v73[12] = v59;
  v39 = objc_retainBlock(v73);
  ((void (*)(_QWORD *))v5[2])(v5);
  if ((v9 & 1) != 0)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator _customTimingFunction](self, "_customTimingFunction"));
    +[UIView animateWithDuration:delay:timingFunction:options:animations:completion:](UIView, "animateWithDuration:delay:timingFunction:options:animations:completion:", v40, 0, v39, v7, v67, 0.0);
  }
  else
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator _closeSpring](self, "_closeSpring"));
    objc_msgSend(v40, "mass");
    v42 = v41;
    objc_msgSend(v40, "stiffness");
    v44 = v43;
    objc_msgSend(v40, "damping");
    +[UIView _animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:](UIView, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v39, v7, v67, 0.0, v42, v44, v45, 0.0);
  }

  ((void (*)(_QWORD *))v5[2])(v5);
  -[BKBookOpenAnimator adjustDuration:](self, "adjustDuration:", 0.32);
  v47 = v46;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator _customTimingFunction](self, "_customTimingFunction"));
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_1000A9218;
  v72[3] = &unk_1008E8CC8;
  v72[4] = self;
  v72[5] = 0x3FF0000000000000;
  +[UIView animateWithDuration:delay:timingFunction:options:animations:completion:](UIView, "animateWithDuration:delay:timingFunction:options:animations:completion:", v48, 0, v72, v7, v47, 0.0);

  ((void (*)(_QWORD *))v5[2])(v5);
  -[BKBookOpenAnimator adjustDuration:](self, "adjustDuration:", 0.15);
  v50 = v49;
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator _customTimingFunction](self, "_customTimingFunction"));
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = sub_1000A9258;
  v71[3] = &unk_1008E8CC8;
  v71[4] = self;
  v71[5] = 0;
  +[UIView animateWithDuration:delay:timingFunction:options:animations:completion:](UIView, "animateWithDuration:delay:timingFunction:options:animations:completion:", v51, 0, v71, v7, v50, 0.0);

  ((void (*)(_QWORD *))v5[2])(v5);
  -[BKBookOpenAnimator adjustDuration:](self, "adjustDuration:", 0.2);
  v53 = v52;
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator _customTimingFunction](self, "_customTimingFunction"));
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472;
  v70[2] = sub_1000A92B0;
  v70[3] = &unk_1008E8CC8;
  v70[4] = self;
  v70[5] = 0;
  +[UIView animateWithDuration:delay:timingFunction:options:animations:completion:](UIView, "animateWithDuration:delay:timingFunction:options:animations:completion:", v54, 0, v70, v7, v53, 0.0);

  ((void (*)(_QWORD *))v5[2])(v5);
  -[BKBookOpenAnimator adjustDuration:](self, "adjustDuration:", 0.32);
  v56 = v55;
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookBloomOpenAnimator _customTimingFunction](self, "_customTimingFunction"));
  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472;
  v69[2] = sub_1000A92F0;
  v69[3] = &unk_1008E8CC8;
  v69[4] = self;
  v69[5] = 0;
  +[UIView animateWithDuration:delay:timingFunction:options:animations:completion:](UIView, "animateWithDuration:delay:timingFunction:options:animations:completion:", v57, 0, v69, v7, v56, 0.0);

  ((void (*)(_QWORD *))v5[2])(v5);
  -[BKBookOpenAnimator adjustDuration:](self, "adjustDuration:", 0.2);
  -[BKBookOpenAnimator minibarKeyFrameAnimationWithDuration:hide:show:completion:](self, "minibarKeyFrameAnimationWithDuration:hide:show:completion:", v7, v67, -1.0, v58);
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = sub_1000A9330;
  v68[3] = &unk_1008E72C0;
  v68[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v68, v67);

  _Block_object_dispose(v79, 8);
}

+ (double)maxCoverScale:(BOOL)a3
{
  double v3;

  objc_msgSend(a1, "marginPercentage:", a3);
  return v3 * -2.0 + 1.0;
}

+ (double)marginPercentage:(BOOL)a3
{
  double result;

  result = 0.13;
  if (a3)
    return 0.1;
  return result;
}

+ (CGRect)_availableRectForFittingZoomedCoverInContainerViewBounds:(CGRect)a3 isCompact:(BOOL)a4
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend((id)objc_opt_class(a1), "marginPercentage:", a4);
  v9 = width * v8;
  v10 = height * v8;
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  return CGRectInset(v11, v9, v10);
}

+ (CGRect)zoomedFrameForCoverWithSize:(CGSize)a3 isCompact:(BOOL)a4 containerViewBounds:(CGRect)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  objc_msgSend(a1, "_availableRectForFittingZoomedCoverInContainerViewBounds:isCompact:", a4, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  sub_1000A6140();
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

+ (id)backgroundColorForZoomedBookCover
{
  return +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
}

+ (void)setBlurRadius:(double)a3 forView:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "layer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKeyPath:", CFSTR("filters.gaussianBlur")));

  if (v6)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
    objc_msgSend(v5, "setValue:forKeyPath:", v7, CFSTR("filters.gaussianBlur.inputRadius"));
  }
  else
  {
    v8 = objc_alloc((Class)CAFilter);
    v7 = objc_msgSend(v8, "initWithType:", kCAFilterGaussianBlur);
    objc_msgSend(v7, "setName:", CFSTR("gaussianBlur"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
    objc_msgSend(v7, "setValue:forKey:", v9, kCIInputRadiusKey);

    objc_msgSend(v7, "setValue:forKey:", CFSTR("low"), CFSTR("inputQuality"));
    objc_msgSend(v7, "setValue:forKey:", CFSTR("low"), CFSTR("inputIntermediateBitDepth"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "filters"));
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "filters"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "arrayByAddingObject:", v7));
      objc_msgSend(v5, "setFilters:", v12);

    }
    else
    {
      v13 = v7;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
      objc_msgSend(v5, "setFilters:", v11);
    }

  }
}

+ (void)setBrightnessFilter:(double)a3 forView:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "layer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKeyPath:", CFSTR("filters.colorBrightness.inputAmount")));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
    objc_msgSend(v5, "setValue:forKeyPath:", v7, CFSTR("filters.colorBrightness.inputAmount"));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", kCAFilterColorBrightness));
    objc_msgSend(v7, "setName:", CFSTR("colorBrightness"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
    objc_msgSend(v7, "setValue:forKey:", v8, CFSTR("inputAmount"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "filters"));
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "filters"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "arrayByAddingObject:", v7));
      objc_msgSend(v5, "setFilters:", v11);

    }
    else
    {
      v12 = v7;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
      objc_msgSend(v5, "setFilters:", v10);
    }

  }
}

- (BOOL)useShadowEffects
{
  return self->_useShadowEffects;
}

- (void)setUseShadowEffects:(BOOL)a3
{
  self->_useShadowEffects = a3;
}

- (UIView)blurredCoverContainer
{
  return self->_blurredCoverContainer;
}

- (void)setBlurredCoverContainer:(id)a3
{
  objc_storeStrong((id *)&self->_blurredCoverContainer, a3);
}

- (UIView)blurredShadowContainer
{
  return self->_blurredShadowContainer;
}

- (void)setBlurredShadowContainer:(id)a3
{
  objc_storeStrong((id *)&self->_blurredShadowContainer, a3);
}

- (UIView)blurredShadowSnapshot
{
  return self->_blurredShadowSnapshot;
}

- (void)setBlurredShadowSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_blurredShadowSnapshot, a3);
}

- (UIView)contentSnapshot
{
  return self->_contentSnapshot;
}

- (void)setContentSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_contentSnapshot, a3);
}

- (UIView)fullBookSnapshot
{
  return self->_fullBookSnapshot;
}

- (void)setFullBookSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_fullBookSnapshot, a3);
}

- (UIView)contentContainerView
{
  return self->_contentContainerView;
}

- (void)setContentContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_contentContainerView, a3);
}

- (UIView)contentBackgroundView
{
  return self->_contentBackgroundView;
}

- (void)setContentBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_contentBackgroundView, a3);
}

- (CGRect)revealSmallContentContainerFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_revealSmallContentContainerFrame.origin.x;
  y = self->_revealSmallContentContainerFrame.origin.y;
  width = self->_revealSmallContentContainerFrame.size.width;
  height = self->_revealSmallContentContainerFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRevealSmallContentContainerFrame:(CGRect)a3
{
  self->_revealSmallContentContainerFrame = a3;
}

- (CGRect)revealBigCoverFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_revealBigCoverFrame.origin.x;
  y = self->_revealBigCoverFrame.origin.y;
  width = self->_revealBigCoverFrame.size.width;
  height = self->_revealBigCoverFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRevealBigCoverFrame:(CGRect)a3
{
  self->_revealBigCoverFrame = a3;
}

- (CGRect)revealBigContentContainerFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_revealBigContentContainerFrame.origin.x;
  y = self->_revealBigContentContainerFrame.origin.y;
  width = self->_revealBigContentContainerFrame.size.width;
  height = self->_revealBigContentContainerFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRevealBigContentContainerFrame:(CGRect)a3
{
  self->_revealBigContentContainerFrame = a3;
}

- (CGRect)closedContentContainerFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_closedContentContainerFrame.origin.x;
  y = self->_closedContentContainerFrame.origin.y;
  width = self->_closedContentContainerFrame.size.width;
  height = self->_closedContentContainerFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setClosedContentContainerFrame:(CGRect)a3
{
  self->_closedContentContainerFrame = a3;
}

- (NSMutableArray)viewsToBeCleanedUp
{
  return self->_viewsToBeCleanedUp;
}

- (void)setViewsToBeCleanedUp:(id)a3
{
  objc_storeStrong((id *)&self->_viewsToBeCleanedUp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewsToBeCleanedUp, 0);
  objc_storeStrong((id *)&self->_contentBackgroundView, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);
  objc_storeStrong((id *)&self->_fullBookSnapshot, 0);
  objc_storeStrong((id *)&self->_contentSnapshot, 0);
  objc_storeStrong((id *)&self->_blurredShadowSnapshot, 0);
  objc_storeStrong((id *)&self->_blurredShadowContainer, 0);
  objc_storeStrong((id *)&self->_blurredCoverContainer, 0);
}

@end
