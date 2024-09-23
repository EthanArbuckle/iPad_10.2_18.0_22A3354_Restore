@implementation BKBookOpenAnimator

- (id)initOpening:(BOOL)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKBookOpenAnimator;
  result = -[BKBookOpenAnimator init](&v5, "init");
  if (result)
  {
    *((_BYTE *)result + 11) = a3;
    *((_BYTE *)result + 10) = 0;
  }
  return result;
}

- (BKBookOpenAnimator)init
{
  return (BKBookOpenAnimator *)-[BKBookOpenAnimator initOpening:](self, "initOpening:", 0);
}

- (void)animateNonInteractive
{
  NSString *v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  id v7;

  v3 = NSStringFromSelector(a2);
  v7 = (id)objc_claimAutoreleasedReturnValue(v3);
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKBookOpenAnimator.m", 154, "-[BKBookOpenAnimator animateNonInteractive]", "NO", CFSTR("Missing implementation. method: class: %@ - %@"));

}

- (double)duration
{
  NSString *v3;
  void *v4;
  objc_class *v5;
  NSString *v6;
  void *v8;

  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (objc_class *)objc_opt_class(self);
  v6 = NSStringFromClass(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v6);
  BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKBookOpenAnimator.m", 159, "-[BKBookOpenAnimator duration]", "NO", CFSTR("Missing implementation. method: class: %@ - %@"));

  return 0.0;
}

- (UIViewController)bookshelfViewController
{
  void *v3;

  if (-[BKBookOpenAnimator opening](self, "opening"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator fromViewController](self, "fromViewController"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator toViewController](self, "toViewController"));
  return (UIViewController *)v3;
}

- (NSArray)bookshelfContentViews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookshelfViewController](self, "bookshelfViewController"));
  v4 = objc_opt_class(UIViewController);
  v5 = BUClassAndProtocolCast(v3, v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transitionContentViews", &OBJC_PROTOCOL___BKBookshelfOpenTransitioning));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookshelfViewController](self, "bookshelfViewController", &OBJC_PROTOCOL___BKBookshelfOpenTransitioning));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));

    if (v10)
    {
      v12 = v10;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    }
    else
    {
      BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKBookOpenAnimator.m", 179, "-[BKBookOpenAnimator bookshelfContentViews]", "bookshelfView", 0);
      v8 = &__NSArray0__struct;
    }

  }
  return (NSArray *)v8;
}

- (BKBookOpenTransitioning)bookViewController
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (-[BKBookOpenAnimator opening](self, "opening"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator toViewController](self, "toViewController"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator fromViewController](self, "fromViewController"));
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "im_firstVisibleChildConformingToProtocol:", &OBJC_PROTOCOL___BKBookOpenTransitioning));
  v6 = objc_opt_class(UIViewController);
  v7 = BUClassAndProtocolCast(v5, v6, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (!v8)
  {
    objc_opt_class(v4);
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKBookOpenAnimator.m", 195, "-[BKBookOpenAnimator bookViewController]", "bookTransitioningVC", CFSTR("Go implement <BKBookOpenTransitioning> for %@!"));
  }

  return (BKBookOpenTransitioning *)v8;
}

- (BOOL)rightToLeft
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookViewController](self, "bookViewController"));
  if ((objc_opt_respondsToSelector(v2, "transitionRightToLeft") & 1) != 0)
    v3 = objc_msgSend(v2, "transitionRightToLeft");
  else
    v3 = 0;

  return v3;
}

- (CGRect)zoomedCoverFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
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
  double v32;
  double v33;
  double v34;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator containerView](self, "containerView"));
  v4 = IMActionSafeRectForRect(objc_msgSend(v3, "bounds"));
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverImage](self, "coverImage"));
  objc_msgSend(v11, "size");
  v13 = v12;
  v15 = v14;

  v16 = CGSizeScaleThatFitsInCGSize(v13, v15, v8, v10);
  v17 = CGSizeScale(v13, v15, v16);
  v19 = CGRectMakeWithSize(v17, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverContainerView](self, "coverContainerView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "superview"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator containerView](self, "containerView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "superview"));
  objc_msgSend(v21, "convertRect:fromView:", v23, v4, v6, v8, v10);
  v24 = CGRectCenterRectInRect(v19);
  v26 = v25;
  v28 = v27;
  v30 = v29;

  v31 = v24;
  v32 = v26;
  v33 = v28;
  v34 = v30;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (double)coverAspectRatio
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  NSString *v8;
  void *v9;
  CGSize v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverImage](self, "coverImage"));
  objc_msgSend(v2, "size");
  v4 = v3;
  v6 = v5;

  if (v4 > 0.0 && v6 > 0.0)
    return v4 / v6;
  v10.width = v4;
  v10.height = v6;
  v8 = NSStringFromCGSize(v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKBookOpenAnimator.m", 229, "-[BKBookOpenAnimator coverAspectRatio]", "coverImageSize.width > 0.0 && coverImageSize.height > 0.0", CFSTR("Invalid cover image size: %@"));

  return 1.0;
}

- (BOOL)animatesCoverBounds
{
  return 0;
}

- (BOOL)wantsCoverShadow
{
  return 1;
}

- (UIColor)bookshelfTintColor
{
  return +[UIColor blackColor](UIColor, "blackColor");
}

- (int64_t)coverContentMode
{
  return 2;
}

- (BOOL)bookshelfTintCoversBars
{
  return 0;
}

- (BOOL)defersBookViewSetupForOpening
{
  return 0;
}

- (void)setBookshelfAlpha:(double)a3
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];

  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookshelfSnapshots](self, "bookshelfSnapshots"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v9), "setAlpha:", a3);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookshelfLiveViews](self, "bookshelfLiveViews", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v14), "setAlpha:", a3);
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (void)setBookshelfTransform:(CGAffineTransform *)a3
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  _OWORD v19[3];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _OWORD v24[3];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];

  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookshelfSnapshots](self, "bookshelfSnapshots"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v9);
        v11 = *(_OWORD *)&a3->c;
        v24[0] = *(_OWORD *)&a3->a;
        v24[1] = v11;
        v24[2] = *(_OWORD *)&a3->tx;
        objc_msgSend(v10, "setTransform:", v24);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v7);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookshelfLiveViews](self, "bookshelfLiveViews"));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v16);
        v18 = *(_OWORD *)&a3->c;
        v19[0] = *(_OWORD *)&a3->a;
        v19[1] = v18;
        v19[2] = *(_OWORD *)&a3->tx;
        objc_msgSend(v17, "setTransform:", v19);
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
    }
    while (v14);
  }

}

- (void)moveCoverToFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v8;
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
  void *v22;
  void *v23;
  double v24;
  double v25;
  CGFloat v26;
  void *v27;
  CGAffineTransform v28;
  CGAffineTransform v29;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[BKBookOpenAnimator animatesCoverBounds](self, "animatesCoverBounds");
  if (v8)
  {
    -[BKBookOpenAnimator _sanitizedFrameWithCenteredFrame:ofSize:name:](self, "_sanitizedFrameWithCenteredFrame:ofSize:name:", CFSTR("cover.coverContainerView.frame"), x, y, width, height, CGSizeZero.width, CGSizeZero.height);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverContainerView](self, "coverContainerView"));
    objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

    -[BKBookOpenAnimator _adjustShadowForCurrentCoverBounds](self, "_adjustShadowForCurrentCoverBounds");
  }
  else
  {
    -[BKBookOpenAnimator _sanitizedCenterPoint:name:](self, "_sanitizedCenterPoint:name:", CFSTR("cover.coverContainerView.center"), CGRectGetCenterNoRounding(v8, x, y, width, height));
    v19 = v18;
    v21 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverContainerView](self, "coverContainerView"));
    objc_msgSend(v22, "setCenter:", v19, v21);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverImage](self, "coverImage"));
    objc_msgSend(v23, "size");
    v26 = CGSizeScaleThatFitsInCGSize(v24, v25, width, height);

    CGAffineTransformMakeScale(&v29, v26, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverContainerView](self, "coverContainerView"));
    v28 = v29;
    objc_msgSend(v27, "setTransform:", &v28);

    -[BKBookOpenAnimator _adjustShadowForCurrentCoverBounds](self, "_adjustShadowForCurrentCoverBounds");
  }
}

- (void)teardownViews:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookshelfTintView](self, "bookshelfTintView"));
  objc_msgSend(v5, "removeFromSuperview");

  -[BKBookOpenAnimator setBookshelfTintView:](self, "setBookshelfTintView:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverImageView](self, "coverImageView"));
  objc_msgSend(v6, "removeFromSuperview");

  -[BKBookOpenAnimator setCoverImageView:](self, "setCoverImageView:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverShadowView](self, "coverShadowView"));
  objc_msgSend(v7, "removeFromSuperview");

  -[BKBookOpenAnimator setCoverShadowView:](self, "setCoverShadowView:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverContainerView](self, "coverContainerView"));
  objc_msgSend(v8, "removeFromSuperview");

  -[BKBookOpenAnimator setCoverContainerView:](self, "setCoverContainerView:", 0);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookshelfSnapshots](self, "bookshelfSnapshots", 0));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), "removeFromSuperview");
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }

  -[BKBookOpenAnimator setBookshelfSnapshots:](self, "setBookshelfSnapshots:", 0);
  -[BKBookOpenAnimator setBookshelfLiveViews:](self, "setBookshelfLiveViews:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookshelfViewState](self, "bookshelfViewState"));
  objc_msgSend(v14, "restore");

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookViewState](self, "bookViewState"));
  objc_msgSend(v15, "restore");

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator minifiedBarAnimator](self, "minifiedBarAnimator"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "minifiedBarAnimatorContainerView"));

  if (v17)
  {
    objc_msgSend(v17, "setAlpha:", 1.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator minibarContainerViewState](self, "minibarContainerViewState"));
    objc_msgSend(v18, "restore");

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookContainerView](self, "bookContainerView"));
  objc_msgSend(v19, "removeFromSuperview");

  -[BKBookOpenAnimator setBookContainerView:](self, "setBookContainerView:", 0);
  if (v3)
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator fromViewController](self, "fromViewController"));
  else
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator toViewController](self, "toViewController"));
  v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "view"));
  objc_msgSend(v22, "removeFromSuperview");

}

- (void)_adjustShadowForCurrentCoverBounds
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double CenterNoRounding;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  void *v37;
  CGAffineTransform v38;
  CGAffineTransform v39;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverShadowView](self, "coverShadowView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverShadowImage](self, "coverShadowImage"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverShadowView](self, "coverShadowView"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));
      objc_msgSend(v6, "bounds");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;

      CenterNoRounding = CGRectGetCenterNoRounding(v15, v8, v10, v12, v14);
      v18 = v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverShadowView](self, "coverShadowView"));
      objc_msgSend(v19, "setCenter:", CenterNoRounding, v18);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverShadowImage](self, "coverShadowImage"));
      objc_msgSend(v20, "alignmentRectInsets");
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverShadowImage](self, "coverShadowImage"));
      objc_msgSend(v29, "size");
      CGRectMakeWithSize(v30, v31);
      v33 = v32 - (v24 + v28);
      v35 = v34 - (v22 + v26);

      v36 = CGSizeScaleThatFitsInCGSize(v33, v35, v12, v14);
      CGAffineTransformMakeScale(&v39, v36, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverShadowView](self, "coverShadowView"));
      v38 = v39;
      objc_msgSend(v37, "setTransform:", &v38);

    }
  }
}

- (BOOL)fitCoverImageIntoClosedCoverFrame
{
  return 1;
}

- (void)setupShadowForCoverView:(id)a3
{
  id v4;
  id v5;
  id v6;
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
  id v17;

  v4 = a3;
  v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
  objc_msgSend(v4, "bounds");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:")));
  objc_msgSend(v17, "setShadowPath:", objc_msgSend(v5, "CGPath"));

  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
  objc_msgSend(v17, "setShadowColor:", objc_msgSend(v6, "CGColor"));

  LODWORD(v7) = 1041865114;
  objc_msgSend(v17, "setShadowOpacity:", v7);
  -[BKBookOpenAnimator closedCoverFrame](self, "closedCoverFrame");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v4, "bounds");
  v13 = v12;
  v15 = v14;

  v16 = CGSizeScaleThatFitsInCGSize(v9, v11, v13, v15);
  objc_msgSend(v17, "setShadowOffset:", CGSizeScale(0.0, 0.0, v16));
  objc_msgSend(v17, "setShadowRadius:", v16 * 4.0);

}

- (void)_setupSharedViewsWithCompletion:(id)a3
{
  id v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
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
  void *v27;
  void *v28;
  void *v29;
  double (**v30)(void);
  void *v31;
  void *v32;
  double x;
  double v34;
  double y;
  double v36;
  double width;
  double v38;
  double height;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  id v54;
  double v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  void *v60;
  id v61;
  double MaxY;
  double v63;
  double v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  id v75;
  id v76;
  void *v77;
  void *v78;
  double v79;
  double v80;
  _BOOL4 IsEmpty;
  id v82;
  void *v83;
  double v84;
  double v85;
  id v86;
  double v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  BKCustomAnimationPropertiesView *v92;
  void *v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  void *v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  void *v111;
  BKCustomAnimationPropertiesView *v112;
  void *v113;
  double v114;
  double v115;
  id v116;
  void *v117;
  id v118;
  void *v119;
  double v120;
  double v121;
  void *v122;
  void *v123;
  double v124;
  double v125;
  double v126;
  id v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;

  v4 = a3;
  if (-[BKBookOpenAnimator opening](self, "opening"))
    v5 = -[BKBookOpenAnimator defersBookViewSetupForOpening](self, "defersBookViewSetupForOpening");
  else
    v5 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator containerView](self, "containerView"));
  if (-[BKBookOpenAnimator opening](self, "opening"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BCStatusBarBackgroundController backgroundControllerForWindow:](BCStatusBarBackgroundController, "backgroundControllerForWindow:", v7));
    objc_msgSend(v8, "setOpacity:animated:", 1, 0.0);

  }
  v9 = objc_alloc((Class)UIView);
  objc_msgSend(v6, "bounds");
  v10 = objc_msgSend(v9, "initWithFrame:");
  -[BKBookOpenAnimator setBookContainerView:](self, "setBookContainerView:", v10);
  objc_msgSend(v6, "addSubview:", v10);
  objc_msgSend(v10, "setAlpha:", (double)(-[BKBookOpenAnimator opening](self, "opening") ^ 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator fromViewController](self, "fromViewController"));
  -[BKBookOpenAnimator _setupViewController:](self, "_setupViewController:", v11);

  if ((v5 & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator toViewController](self, "toViewController"));
    -[BKBookOpenAnimator _setupViewController:](self, "_setupViewController:", v12);

  }
  v13 = objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator preTransitionBlock](self, "preTransitionBlock"));
  v14 = (void *)v13;
  if (v13)
    (*(void (**)(uint64_t))(v13 + 16))(v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator minifiedBarAnimator](self, "minifiedBarAnimator"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "minifiedBarAnimatorContainerView"));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[IMViewState saveStateForView:flags:](IMViewState, "saveStateForView:flags:", v16, 3));
    -[BKBookOpenAnimator setMinibarContainerViewState:](self, "setMinibarContainerViewState:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "layer"));
    objc_msgSend(v18, "setZPosition:", 1.0);

    objc_msgSend(v6, "addSubview:", v16);
  }
  objc_msgSend(v6, "bounds");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookshelfViewController](self, "bookshelfViewController"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "view"));
  objc_msgSend(v28, "setFrame:", v20, v22, v24, v26);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookshelfViewController](self, "bookshelfViewController"));
  v30 = (double (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "view"));
  objc_msgSend(v6, "addSubview:", v30);

  if (!-[BKBookOpenAnimator opening](self, "opening"))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookContainerView](self, "bookContainerView"));
    objc_msgSend(v6, "addSubview:", v31);

  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator closedCoverFrameBlock](self, "closedCoverFrameBlock"));
  if (v32)
  {
    v30 = (double (**)(void))objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator closedCoverFrameBlock](self, "closedCoverFrameBlock"));
    x = v30[2]();
    y = v34;
    width = v36;
    height = v38;
  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookshelfViewController](self, "bookshelfViewController"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "view"));
  objc_msgSend(v6, "convertRect:fromView:", v41, x, y, width, height);
  v43 = v42;
  v45 = v44;
  v47 = v46;
  v49 = v48;

  if (v32)
  v50 = v49;
  v51 = v47;
  v52 = v45;
  v53 = v43;
  if (-[BKBookOpenAnimator fitCoverImageIntoClosedCoverFrame](self, "fitCoverImageIntoClosedCoverFrame"))
  {
    v54 = -[UIImage size](self->_coverImage, "size");
    v128.origin.x = CGRectFitRectInRect(v54, 0.0, 0.0, v55, v56, v43, v45, v47, v49);
    v57 = v128.origin.x;
    v126 = v49;
    v58 = v47;
    v59 = v128.origin.y;
    v51 = v128.size.width;
    v50 = v128.size.height;
    v53 = v43 + CGRectGetMinX(v128);
    v129.origin.x = v57;
    v129.origin.y = v59;
    v47 = v58;
    v49 = v126;
    v129.size.width = v51;
    v129.size.height = v50;
    v52 = v45 + CGRectGetMinY(v129);
  }
  -[BKBookOpenAnimator setClosedCoverFrame:](self, "setClosedCoverFrame:", v53, v52, v51, v50);
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverSource](self, "coverSource"));
  v61 = objc_msgSend(v60, "coverAnimationSourceAlignment");

  if (v61 == (id)2)
  {
    v130.origin.x = v43;
    v130.origin.y = v45;
    v130.size.width = v47;
    v130.size.height = v49;
    MaxY = CGRectGetMaxY(v130);
    v131.origin.x = v53;
    v131.origin.y = v52;
    v131.size.width = v51;
    v131.size.height = v50;
    v63 = MaxY - CGRectGetHeight(v131);
    v132.origin.x = v53;
    v132.origin.y = v52;
    v132.size.width = v51;
    v132.size.height = v50;
    v64 = round(v63 - CGRectGetMinY(v132));
    if (v64 > 0.0)
      -[BKBookOpenAnimator setClosedCoverFrame:](self, "setClosedCoverFrame:", v53, v52 + v64, v51, v50);
  }
  -[BKBookOpenAnimator closedCoverFrame](self, "closedCoverFrame");
  if (CGRectIsEmpty(v133))
  {
    -[BKBookOpenAnimator closedCoverFrame](self, "closedCoverFrame");
    v136.origin.x = CGRectZero.origin.x;
    v136.origin.y = CGRectZero.origin.y;
    v136.size.width = CGRectZero.size.width;
    v136.size.height = CGRectZero.size.height;
    if (!CGRectEqualToRect(v134, v136))
      BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKBookOpenAnimator.m", 481, "-[BKBookOpenAnimator _setupSharedViewsWithCompletion:]", "CGRectEqualToRect(self.closedCoverFrame, CGRectZero)", CFSTR("closedCoverFrame should either be a non-empty rect or CGRectZero"));
    -[BKBookOpenAnimator setFadeInCover:](self, "setFadeInCover:", 1);
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator containerView](self, "containerView"));
    IMActionSafeRectForRect(objc_msgSend(v65, "bounds"));

    v66 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverImage](self, "coverImage"));
    objc_msgSend(v66, "size");
    v68 = v67;
    v70 = v69;

    v71 = CGSizeScaleThatFitsInCGSize(v68, v70, 10.0, 10.0);
    v72 = CGSizeScale(v68, v70, v71);
    v74 = CGRectMakeWithSize(v72, v73);
    -[BKBookOpenAnimator setClosedCoverFrame:](self, "setClosedCoverFrame:", CGRectCenterRectInRect(v74));
  }
  -[BKBookOpenAnimator bookshelfTintCoversBars](self, "bookshelfTintCoversBars");
  v127 = v6;
  v75 = objc_alloc((Class)UIView);
  objc_msgSend(v127, "bounds");
  v76 = objc_msgSend(v75, "initWithFrame:");
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookshelfTintColor](self, "bookshelfTintColor"));
  objc_msgSend(v76, "setBackgroundColor:", v77);
  objc_msgSend(v76, "setAlpha:", 0.0);
  objc_msgSend(v127, "addSubview:", v76);
  -[BKBookOpenAnimator setBookshelfTintView:](self, "setBookshelfTintView:", v76);
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverImage](self, "coverImage"));
  objc_msgSend(v78, "size");
  v135.origin.x = CGRectMakeWithSize(v79, v80);
  IsEmpty = CGRectIsEmpty(v135);

  if (IsEmpty)
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKBookOpenAnimator.m", 506, "-[BKBookOpenAnimator _setupSharedViewsWithCompletion:]", "!CGRectIsEmpty(CGRectMakeWithSize(self.coverImage.size))", CFSTR("coverImage is nil or has a bad size."));
  v82 = objc_alloc((Class)UIView);
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverImage](self, "coverImage"));
  objc_msgSend(v83, "size");
  v86 = objc_msgSend(v82, "initWithFrame:", CGRectMakeWithSize(v84, v85));

  -[BKBookOpenAnimator setCoverContainerView:](self, "setCoverContainerView:", v86);
  v87 = 1.0;
  if (-[BKBookOpenAnimator opening](self, "opening"))
  {
    if (-[BKBookOpenAnimator fadeInCover](self, "fadeInCover"))
      v87 = 0.0;
    else
      v87 = 1.0;
  }
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverContainerView](self, "coverContainerView"));
  objc_msgSend(v88, "setAlpha:", v87);

  if (-[BKBookOpenAnimator wantsCoverShadow](self, "wantsCoverShadow"))
  {
    v89 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverShadowImage](self, "coverShadowImage"));

    if (v89)
    {
      v90 = objc_alloc((Class)UIImageView);
      v91 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverShadowImage](self, "coverShadowImage"));
      v92 = (BKCustomAnimationPropertiesView *)objc_msgSend(v90, "initWithImage:", v91);

      v93 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverShadowImage](self, "coverShadowImage"));
      objc_msgSend(v93, "alignmentRectInsets");
      v95 = v94;
      v97 = v96;
      v99 = v98;
      v101 = v100;

      v102 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverShadowImage](self, "coverShadowImage"));
      objc_msgSend(v102, "size");
      v104 = v103;
      v106 = v105;

      CGRectMakeWithSize(v104, v106);
      v109 = (v97 + (v107 - (v97 + v101)) * 0.5) / v104;
      v110 = (v95 + (v108 - (v95 + v99)) * 0.5) / v106;
      v111 = (void *)objc_claimAutoreleasedReturnValue(-[BKCustomAnimationPropertiesView layer](v92, "layer"));
      objc_msgSend(v111, "setAnchorPoint:", v109, v110);

    }
    else
    {
      v112 = [BKCustomAnimationPropertiesView alloc];
      v113 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverImage](self, "coverImage"));
      objc_msgSend(v113, "size");
      v92 = -[BKCustomAnimationPropertiesView initWithFrame:](v112, "initWithFrame:", CGRectMakeWithSize(v114, v115));

      -[BKCustomAnimationPropertiesView setAutoresizingMask:](v92, "setAutoresizingMask:", 18);
      -[BKCustomAnimationPropertiesView addAnimatablePropertyWithKey:](v92, "addAnimatablePropertyWithKey:", CFSTR("shadowPath"));
      -[BKCustomAnimationPropertiesView addAnimatablePropertyWithKey:](v92, "addAnimatablePropertyWithKey:", CFSTR("shadowRadius"));
      -[BKCustomAnimationPropertiesView addAnimatablePropertyWithKey:](v92, "addAnimatablePropertyWithKey:", CFSTR("shadowOffset"));
    }
    -[BKBookOpenAnimator setCoverShadowView:](self, "setCoverShadowView:", v92);
    objc_msgSend(v86, "addSubview:", v92);
    -[BKBookOpenAnimator _adjustShadowForCurrentCoverBounds](self, "_adjustShadowForCurrentCoverBounds");

  }
  v116 = objc_alloc((Class)UIImageView);
  v117 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverImage](self, "coverImage"));
  v118 = objc_msgSend(v116, "initWithImage:", v117);

  -[BKBookOpenAnimator setCoverImageView:](self, "setCoverImageView:", v118);
  objc_msgSend(v118, "setAccessibilityIgnoresInvertColors:", 1);
  objc_msgSend(v118, "setAutoresizingMask:", 18);
  v119 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverImage](self, "coverImage"));
  objc_msgSend(v119, "scale");
  v121 = v120;
  v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "layer"));
  objc_msgSend(v122, "setContentsScale:", v121);

  objc_msgSend(v118, "setClipsToBounds:", 1);
  objc_msgSend(v118, "setContentMode:", -[BKBookOpenAnimator coverContentMode](self, "coverContentMode"));
  v123 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverImage](self, "coverImage"));
  objc_msgSend(v123, "size");
  objc_msgSend(v118, "setFrame:", CGRectMakeWithSize(v124, v125));

  objc_msgSend(v86, "addSubview:", v118);
  if (-[BKBookOpenAnimator opening](self, "opening"))
  {
    objc_msgSend(v127, "addSubview:", v86);
    -[BKBookOpenAnimator closedCoverFrame](self, "closedCoverFrame");
    -[BKBookOpenAnimator moveCoverToFrame:](self, "moveCoverToFrame:");
  }
  -[BKBookOpenAnimator performAdditionSetup](self, "performAdditionSetup");
  -[BKBookOpenAnimator _prepareHostWithCompletion:](self, "_prepareHostWithCompletion:", v4);

}

- (void)_setupViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  const __CFString *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  const __CFString *v26;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator containerView](self, "containerView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  v7 = (id)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator fromViewController](self, "fromViewController"));

  v8 = (id)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookshelfViewController](self, "bookshelfViewController"));
  v9 = BUProtocolCast(&OBJC_PROTOCOL___BKAssetPresenting, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if ((objc_opt_respondsToSelector(v10, "willAddViewToHierarchy") & 1) != 0)
    objc_msgSend(v10, "willAddViewToHierarchy");
  +[CATransaction begin](CATransaction, "begin");
  objc_msgSend(v5, "addSubview:", v6);
  objc_msgSend(v5, "bounds");
  objc_msgSend(v6, "setFrame:");
  if (v7 == v4)
    v11 = 725353076;
  else
    v11 = 725353084;
  v12 = kdebug_trace(v11, 0, 0, 0, 0);
  v13 = _AEBookOpenLog(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = CFSTR("to");
    if (v7 == v4)
      v15 = CFSTR("from");
    *(_DWORD *)buf = 138543362;
    v26 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Beginning layout %{public}@VC start", buf, 0xCu);
  }

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1001B37B0;
  v23[3] = &unk_1008E72C0;
  v16 = v6;
  v24 = v16;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v23);
  if (v7 == v4)
    v17 = 725353080;
  else
    v17 = 725353088;
  kdebug_trace(v17, 0, 0, 0, 0);
  if (v8 == v4)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookshelfViewController](self, "bookshelfViewController"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "view"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[IMViewState saveStateForView:flags:](IMViewState, "saveStateForView:flags:", v21, 1));
    -[BKBookOpenAnimator setBookshelfViewState:](self, "setBookshelfViewState:", v22);

  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookViewController](self, "bookViewController"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "view"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[IMViewState saveStateForView:flags:](IMViewState, "saveStateForView:flags:", v19, 1));
    -[BKBookOpenAnimator setBookViewState:](self, "setBookViewState:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookContainerView](self, "bookContainerView"));
    objc_msgSend(v21, "addSubview:", v19);
  }

  +[CATransaction commit](CATransaction, "commit");
}

- (void)_deferredSetupBookView
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator toViewController](self, "toViewController"));
  -[BKBookOpenAnimator _setupViewController:](self, "_setupViewController:", v3);

}

- (void)_prepareHostWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator toViewController](self, "toViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "im_firstVisibleChildConformingToProtocol:", &OBJC_PROTOCOL___BCCoverAnimatingHost));

  if ((objc_opt_respondsToSelector(v6, "coverAnimationHostPrepareWithCompletion:") & 1) != 0)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001B390C;
    v12[3] = &unk_1008E7680;
    v7 = &v13;
    v12[4] = self;
    v13 = v4;
    v8 = v4;
    objc_msgSend(v6, "coverAnimationHostPrepareWithCompletion:", v12);
  }
  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001B3984;
    v10[3] = &unk_1008E7680;
    v7 = &v11;
    v10[4] = self;
    v11 = v4;
    v9 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
  }

}

- (void)_setupBookshelfAnimationViewsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)UIApp;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001B3A14;
  v7[3] = &unk_1008E7680;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "_performBlockAfterCATransactionCommits:", v7);

}

- (void)bookContentDidLoad
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = kdebug_trace(725353060, 0, 0, 0, 0);
  v3 = _AEBookOpenLog(v2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "bookContentDidLoad signaled", v5, 2u);
  }

}

- (void)configureWithFromViewController:(id)a3 toViewController:(id)a4
{
  id v6;

  v6 = a4;
  -[BKBookOpenAnimator setFromViewController:](self, "setFromViewController:", a3);
  -[BKBookOpenAnimator setToViewController:](self, "setToViewController:", v6);

}

- (id)viewControllerForStatusBarStyle
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator transitionContext](self, "transitionContext"));
  if ((objc_msgSend(v3, "transitionWasCancelled") & 1) != 0)
    v4 = objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator fromViewController](self, "fromViewController"));
  else
    v4 = objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator toViewController](self, "toViewController"));
  v5 = (void *)v4;

  return v5;
}

- (void)animationsDidFinish
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  char v11;
  _QWORD v12[5];
  char v13;
  uint8_t buf[16];

  v3 = _AEBookOpenLog(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "animationsDidFinish signaled", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator transitionContext](self, "transitionContext"));
  v6 = objc_msgSend(v5, "transitionWasCancelled") ^ 1;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001B3F64;
  v12[3] = &unk_1008E83C0;
  v12[4] = self;
  v13 = v6;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v12);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001B4230;
  v10[3] = &unk_1008E83C0;
  v11 = v6;
  v10[4] = self;
  v7 = objc_retainBlock(v10);
  v8 = objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator cleanupBlock](self, "cleanupBlock"));
  v9 = (void *)v8;
  if (v8)
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, v6);
  -[BKBookOpenAnimator setCleanupBlock:](self, "setCleanupBlock:", 0);

  ((void (*)(_QWORD *))v7[2])(v7);
}

- (void)_loadStateFromContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[BKBookOpenAnimator setTransitionContext:](self, "setTransitionContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextFromViewControllerKey));
  -[BKBookOpenAnimator setFromViewController:](self, "setFromViewController:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextToViewControllerKey));
  -[BKBookOpenAnimator setToViewController:](self, "setToViewController:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
  -[BKBookOpenAnimator setContainerView:](self, "setContainerView:", v7);

  v8 = objc_msgSend(v4, "isInteractive");
  -[BKBookOpenAnimator setInteractive:](self, "setInteractive:", v8);
}

- (double)transitionDuration:(id)a3
{
  double result;

  -[BKBookOpenAnimator _loadStateFromContext:](self, "_loadStateFromContext:", a3);
  if (-[BKBookOpenAnimator opening](self, "opening"))
    return 1.0e10;
  -[BKBookOpenAnimator duration](self, "duration");
  return result;
}

- (void)animateTransition:(id)a3
{
  id asyncPrepareWithCompletion;
  void (**v5)(id, _QWORD *);
  id v6;
  _QWORD v7[5];

  -[BKBookOpenAnimator _loadStateFromContext:](self, "_loadStateFromContext:", a3);
  asyncPrepareWithCompletion = self->_asyncPrepareWithCompletion;
  if (asyncPrepareWithCompletion)
  {
    v5 = (void (**)(id, _QWORD *))objc_retainBlock(asyncPrepareWithCompletion);
    v6 = self->_asyncPrepareWithCompletion;
    self->_asyncPrepareWithCompletion = 0;

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1001B4520;
    v7[3] = &unk_1008E72C0;
    v7[4] = self;
    v5[2](v5, v7);

  }
  else
  {
    -[BKBookOpenAnimator _animateTransition](self, "_animateTransition");
  }
}

- (void)_animateTransition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator toViewController](self, "toViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "transitionCoordinator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator containerView](self, "containerView"));
  objc_msgSend(v4, "animateAlongsideTransitionInView:animation:completion:", v5, &stru_1008EE4C0, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverSource](self, "coverSource"));
  objc_msgSend(v6, "coverAnimationSourcePrepare");

  v7 = kdebug_trace(725353048, 0, 0, 0, 0);
  v8 = _AEBookOpenLog(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Open animator setup", buf, 2u);
  }

  if (-[BKBookOpenAnimator opening](self, "opening")
    && -[BKBookOpenAnimator defersBookViewSetupForOpening](self, "defersBookViewSetupForOpening"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookViewController](self, "bookViewController"));
    if ((objc_opt_respondsToSelector(v10, "bookOpenTransitionWillBegin") & 1) != 0)
      objc_msgSend(v10, "bookOpenTransitionWillBegin");

  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001B469C;
  v11[3] = &unk_1008E72C0;
  v11[4] = self;
  -[BKBookOpenAnimator _setupSharedViewsWithCompletion:](self, "_setupSharedViewsWithCompletion:", v11);
}

- (id)minifiedBarAnimator
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator toViewController](self, "toViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "im_ancestorFlowControllerConformingToProtocol:", &OBJC_PROTOCOL___BKMinifiedBarAnimating));

  return v3;
}

- (void)minibarKeyFrameAnimationWithDuration:(double)a3 hide:(double)a4 show:(double)a5 completion:(id)a6
{
  id v10;
  id v11;
  unsigned int v12;
  void (**v13)(id, uint64_t);
  double v14;
  _QWORD v15[4];
  id v16;
  BKBookOpenAnimator *v17;
  double v18;
  double v19;
  double v20;
  _QWORD v21[4];
  id v22;
  BKBookOpenAnimator *v23;

  v10 = a6;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001B49E8;
  v21[3] = &unk_1008E7338;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator minifiedBarAnimator](self, "minifiedBarAnimator"));
  v22 = v11;
  v23 = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v21);
  v12 = -[BKBookOpenAnimator opening](self, "opening");
  if (-[BKBookOpenAnimator opening](self, "opening"))
  {
    v13 = (void (**)(id, uint64_t))objc_retainBlock(v10);

    if (v13)
      v13[2](v13, 1);

  }
  else
  {
    if (v12)
      v14 = a4;
    else
      v14 = a5;
    if (!v12)
      a5 = a4;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001B4A28;
    v15[3] = &unk_1008EE4E8;
    v18 = v14;
    v19 = a3;
    v16 = v11;
    v17 = self;
    v20 = a5;
    +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v15, v10, a3, 0.0);

  }
}

- (BOOL)isContentRevealed
{
  return 1;
}

+ (BOOL)_isSlowModeEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("BKBookOpenAnimatorSlowModeEnabled"));

  return v3;
}

- (double)slowModeExtraDurationMultiplier
{
  return 1.0;
}

- (double)_debugDragCoefficient
{
  double v3;
  double v4;
  double v5;

  if (objc_msgSend((id)objc_opt_class(self), "_isSlowModeEnabled"))
    v3 = 3.0;
  else
    v3 = 1.0;
  v4 = AudiobookNowPlayingTouchViewController.transitionToolbarAlpha()() * v3;
  -[BKBookOpenAnimator slowModeExtraDurationMultiplier](self, "slowModeExtraDurationMultiplier");
  return v4 * v5;
}

- (double)adjustDuration:(double)a3
{
  double v4;

  -[BKBookOpenAnimator _debugDragCoefficient](self, "_debugDragCoefficient");
  return v4 * a3;
}

- (id)adjustSpring:(id)a3
{
  id v4;
  double v5;
  double v6;
  id v7;
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

  v4 = a3;
  -[BKBookOpenAnimator _debugDragCoefficient](self, "_debugDragCoefficient");
  v6 = v5;
  v7 = objc_alloc((Class)UISpringTimingParameters);
  objc_msgSend(v4, "mass");
  v9 = v8;
  objc_msgSend(v4, "stiffness");
  v11 = v10 / (v6 * v6);
  objc_msgSend(v4, "damping");
  v13 = v12 / v6;
  objc_msgSend(v4, "initialVelocity");
  v15 = v14;
  v17 = v16;

  return objc_msgSend(v7, "initWithMass:stiffness:damping:initialVelocity:", v9, v11, v13, v15, v17);
}

- (BOOL)_sanityCheckPoint:(CGPoint)a3
{
  CGFloat y;
  uint64_t IsValid;
  uint64_t v5;
  __n128 v6;

  y = a3.y;
  IsValid = CGFloatIsValid(self, a2, (__n128)a3);
  if ((_DWORD)IsValid)
  {
    v6.n128_f64[0] = y;
    LOBYTE(IsValid) = CGFloatIsValid(IsValid, v5, v6);
  }
  return IsValid;
}

- (BOOL)_shouldFallbackForFailedSanityCheck
{
  return 1;
}

- (CGRect)_sanitizedFrameWithFallbackFrame:(CGRect)a3 fallbackFrame:(CGRect)a4 name:(id)a5 fallbackName:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  double v11;
  double v12;
  double v13;
  double v14;
  id v16;
  id v17;
  NSString *v18;
  void *v19;
  NSString *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  CGRect v26;
  CGRect v27;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3.size.height;
  v12 = a3.size.width;
  v13 = a3.origin.y;
  v14 = a3.origin.x;
  v16 = a5;
  v17 = a6;
  if (!-[BKBookOpenAnimator _sanityCheckRect:](self, "_sanityCheckRect:", v14, v13, v12, v11))
  {
    v26.origin.x = v14;
    v26.origin.y = v13;
    v26.size.width = v12;
    v26.size.height = v11;
    v18 = NSStringFromCGRect(v26);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    v20 = NSStringFromCGRect(v27);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v20);
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKBookOpenAnimator.m", 1034, "-[BKBookOpenAnimator _sanitizedFrameWithFallbackFrame:fallbackFrame:name:fallbackName:]", "NO", CFSTR("Invalid rect - %@: %@. Using %@: %@ as fallback in production."));

    if (-[BKBookOpenAnimator _shouldFallbackForFailedSanityCheck](self, "_shouldFallbackForFailedSanityCheck", v16, v19, v17, v25))
    {
      v11 = height;
      v12 = width;
      v13 = y;
      v14 = x;
    }
  }

  v21 = v14;
  v22 = v13;
  v23 = v12;
  v24 = v11;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGRect)_fullsizeRectForFallback
{
  void *v2;
  void *v3;
  double v4;
  CGFloat x;
  double v6;
  CGFloat y;
  double v8;
  CGFloat width;
  double v10;
  CGFloat height;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect v21;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator containerView](self, "containerView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "window"));

  if (v3)
  {
    objc_msgSend(v3, "bounds");
    x = v4;
    y = v6;
    width = v8;
    height = v10;
  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  if (CGRectIsEmpty(v21))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v12, "bounds");
    x = v13;
    y = v14;
    width = v15;
    height = v16;

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

- (CGRect)_sanitizedFrameWithFullsizeFrame:(CGRect)a3 name:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  NSString *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  CGRect v20;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  if (!-[BKBookOpenAnimator _sanityCheckRect:](self, "_sanityCheckRect:", x, y, width, height))
  {
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    v10 = NSStringFromCGRect(v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v10);
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKBookOpenAnimator.m", 1066, "-[BKBookOpenAnimator _sanitizedFrameWithFullsizeFrame:name:]", "NO", CFSTR("Invalid rect - %@: %@. Using full-sized rect as fallback in production."));

    if (-[BKBookOpenAnimator _shouldFallbackForFailedSanityCheck](self, "_shouldFallbackForFailedSanityCheck", v9, v19))
    {
      -[BKBookOpenAnimator _fullsizeRectForFallback](self, "_fullsizeRectForFallback");
      x = v11;
      y = v12;
      width = v13;
      height = v14;
    }
  }

  v15 = x;
  v16 = y;
  v17 = width;
  v18 = height;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)_sanitizedFrameWithCenteredFrame:(CGRect)a3 ofSize:(CGSize)a4 name:(id)a5
{
  CGFloat height;
  CGFloat width;
  double v7;
  double v8;
  double y;
  double x;
  id v12;
  NSString *v13;
  void *v14;
  NSString *v15;
  double Center;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  CGSize v27;
  CGRect v28;
  CGRect result;

  height = a4.height;
  width = a4.width;
  v7 = a3.size.height;
  v8 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a5;
  if (!-[BKBookOpenAnimator _sanityCheckRect:](self, "_sanityCheckRect:", x, y, v8, v7))
  {
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = v8;
    v28.size.height = v7;
    v13 = NSStringFromCGRect(v28);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v27.width = width;
    v27.height = height;
    v15 = NSStringFromCGSize(v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v15);
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKBookOpenAnimator.m", 1082, "-[BKBookOpenAnimator _sanitizedFrameWithCenteredFrame:ofSize:name:]", "NO", CFSTR("Invalid rect - %@: %@. Using centered rect of size %@ as fallback in production."));

    if (-[BKBookOpenAnimator _shouldFallbackForFailedSanityCheck](self, "_shouldFallbackForFailedSanityCheck", v12, v14, v26))
    {
      Center = CGRectGetCenter(-[BKBookOpenAnimator _fullsizeRectForFallback](self, "_fullsizeRectForFallback"));
      x = CGRectMakeWithCenterAndSize(v17, Center, v18);
      y = v19;
      v8 = v20;
      v7 = v21;
    }
  }

  v22 = x;
  v23 = y;
  v24 = v8;
  v25 = v7;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGPoint)_sanitizedCenterPoint:(CGPoint)a3 name:(id)a4
{
  double y;
  double x;
  id v7;
  NSString *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  CGPoint v13;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (!-[BKBookOpenAnimator _sanityCheckPoint:](self, "_sanityCheckPoint:", x, y))
  {
    v13.x = x;
    v13.y = y;
    v8 = NSStringFromCGPoint(v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v8);
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKBookOpenAnimator.m", 1099, "-[BKBookOpenAnimator _sanitizedCenterPoint:name:]", "NO", CFSTR("Invalid center point - %@: %@. Using window center as fallback in production."));

    if (-[BKBookOpenAnimator _shouldFallbackForFailedSanityCheck](self, "_shouldFallbackForFailedSanityCheck", v7, v12))
    {
      x = CGRectGetCenter(-[BKBookOpenAnimator _fullsizeRectForFallback](self, "_fullsizeRectForFallback"));
      y = v9;
    }
  }

  v10 = x;
  v11 = y;
  result.y = v11;
  result.x = v10;
  return result;
}

- (id)closedCoverFrameBlock
{
  return self->_coverClosedFrameBlock;
}

- (void)setClosedCoverFrameBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UIImage)coverImage
{
  return self->_coverImage;
}

- (void)setCoverImage:(id)a3
{
  objc_storeStrong((id *)&self->_coverImage, a3);
}

- (UIImage)coverShadowImage
{
  return self->_coverShadowImage;
}

- (void)setCoverShadowImage:(id)a3
{
  objc_storeStrong((id *)&self->_coverShadowImage, a3);
}

- (BCCoverAnimatingSource)coverSource
{
  return self->_coverSource;
}

- (void)setCoverSource:(id)a3
{
  objc_storeStrong((id *)&self->_coverSource, a3);
}

- (id)cleanupBlock
{
  return self->_cleanupBlock;
}

- (void)setCleanupBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)assertions
{
  return self->_assertions;
}

- (void)setAssertions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)preTransitionBlock
{
  return self->_preTransitionBlock;
}

- (void)setPreTransitionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)skipZoomPhase
{
  return self->_skipZoomPhase;
}

- (void)setSkipZoomPhase:(BOOL)a3
{
  self->_skipZoomPhase = a3;
}

- (BOOL)crossfadeOnCloseCompletion
{
  return self->_crossfadeOnCloseCompletion;
}

- (void)setCrossfadeOnCloseCompletion:(BOOL)a3
{
  self->_crossfadeOnCloseCompletion = a3;
}

- (BOOL)statusBarHidden
{
  return self->_statusBarHidden;
}

- (id)asyncPrepareWithCompletion
{
  return self->_asyncPrepareWithCompletion;
}

- (void)setAsyncPrepareWithCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)opening
{
  return self->_opening;
}

- (BOOL)interactive
{
  return self->_interactive;
}

- (void)setInteractive:(BOOL)a3
{
  self->_interactive = a3;
}

- (UIViewController)fromViewController
{
  return self->_fromViewController;
}

- (void)setFromViewController:(id)a3
{
  objc_storeStrong((id *)&self->_fromViewController, a3);
}

- (UIViewController)toViewController
{
  return self->_toViewController;
}

- (void)setToViewController:(id)a3
{
  objc_storeStrong((id *)&self->_toViewController, a3);
}

- (UIViewControllerContextTransitioning)transitionContext
{
  return self->_transitionContext;
}

- (void)setTransitionContext:(id)a3
{
  objc_storeStrong((id *)&self->_transitionContext, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UIView)bookContainerView
{
  return self->_bookContainerView;
}

- (void)setBookContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_bookContainerView, a3);
}

- (UIView)bookshelfTintView
{
  return self->_bookshelfTintView;
}

- (void)setBookshelfTintView:(id)a3
{
  objc_storeStrong((id *)&self->_bookshelfTintView, a3);
}

- (CGRect)closedCoverFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_closedCoverFrame.origin.x;
  y = self->_closedCoverFrame.origin.y;
  width = self->_closedCoverFrame.size.width;
  height = self->_closedCoverFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setClosedCoverFrame:(CGRect)a3
{
  self->_closedCoverFrame = a3;
}

- (BOOL)fadeInCover
{
  return self->_fadeInCover;
}

- (void)setFadeInCover:(BOOL)a3
{
  self->_fadeInCover = a3;
}

- (UIView)coverContainerView
{
  return self->_coverContainerView;
}

- (void)setCoverContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_coverContainerView, a3);
}

- (UIView)coverShadowView
{
  return self->_coverShadowView;
}

- (void)setCoverShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_coverShadowView, a3);
}

- (UIView)coverImageView
{
  return self->_coverImageView;
}

- (void)setCoverImageView:(id)a3
{
  objc_storeStrong((id *)&self->_coverImageView, a3);
}

- (NSArray)bookshelfLiveViews
{
  return self->_bookshelfLiveViews;
}

- (void)setBookshelfLiveViews:(id)a3
{
  objc_storeStrong((id *)&self->_bookshelfLiveViews, a3);
}

- (NSArray)bookshelfSnapshots
{
  return self->_bookshelfSnapshots;
}

- (void)setBookshelfSnapshots:(id)a3
{
  objc_storeStrong((id *)&self->_bookshelfSnapshots, a3);
}

- (IMViewState)bookshelfViewState
{
  return self->_bookshelfViewState;
}

- (void)setBookshelfViewState:(id)a3
{
  objc_storeStrong((id *)&self->_bookshelfViewState, a3);
}

- (IMViewState)bookViewState
{
  return self->_bookViewState;
}

- (void)setBookViewState:(id)a3
{
  objc_storeStrong((id *)&self->_bookViewState, a3);
}

- (IMViewState)overlayViewState
{
  return self->_overlayViewState;
}

- (void)setOverlayViewState:(id)a3
{
  objc_storeStrong((id *)&self->_overlayViewState, a3);
}

- (IMViewState)minibarContainerViewState
{
  return self->_minibarContainerViewState;
}

- (void)setMinibarContainerViewState:(id)a3
{
  objc_storeStrong((id *)&self->_minibarContainerViewState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minibarContainerViewState, 0);
  objc_storeStrong((id *)&self->_overlayViewState, 0);
  objc_storeStrong((id *)&self->_bookViewState, 0);
  objc_storeStrong((id *)&self->_bookshelfViewState, 0);
  objc_storeStrong((id *)&self->_bookshelfSnapshots, 0);
  objc_storeStrong((id *)&self->_bookshelfLiveViews, 0);
  objc_storeStrong((id *)&self->_coverImageView, 0);
  objc_storeStrong((id *)&self->_coverShadowView, 0);
  objc_storeStrong((id *)&self->_coverContainerView, 0);
  objc_storeStrong((id *)&self->_bookshelfTintView, 0);
  objc_storeStrong((id *)&self->_bookContainerView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_toViewController, 0);
  objc_storeStrong((id *)&self->_fromViewController, 0);
  objc_storeStrong(&self->_asyncPrepareWithCompletion, 0);
  objc_storeStrong(&self->_preTransitionBlock, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
  objc_storeStrong(&self->_cleanupBlock, 0);
  objc_storeStrong((id *)&self->_coverSource, 0);
  objc_storeStrong((id *)&self->_coverShadowImage, 0);
  objc_storeStrong((id *)&self->_coverImage, 0);
  objc_storeStrong(&self->_coverClosedFrameBlock, 0);
}

@end
