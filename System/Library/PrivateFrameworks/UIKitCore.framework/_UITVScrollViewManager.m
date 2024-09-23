@implementation _UITVScrollViewManager

- (_UITVScrollViewManager)initWithScrollView:(id)a3 scrollStyle:(int64_t)a4
{
  id v7;
  _UITVScrollViewManager *v8;
  _UITVScrollViewManager *v9;
  id v10;
  id v11;
  void *v12;
  id WeakRetained;
  void *v15;
  objc_super v16;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITVScrollViewManager.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scrollView != nil"));

  }
  v16.receiver = self;
  v16.super_class = (Class)_UITVScrollViewManager;
  v8 = -[_UITVScrollViewManager init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    v10 = objc_storeWeak((id *)&v8->_scrollView, v7);
    v9->_scrollStyle = a4;
    v11 = v10;
    objc_msgSend(v7, "_addScrollViewScrollObserver:", v9);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&v9->_scrollView);
    objc_msgSend(v12, "addObserver:selector:name:object:", v9, sel__scrollAnimationDidEnd_, 0x1E17891E0, WeakRetained);

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, 0x1E17891E0, 0);

  -[_UITVScrollViewManager scrollView](self, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, sel_allowsWeakReference);

  v6 = 0;
  if (v5)
  {
    -[_UITVScrollViewManager scrollView](self, "scrollView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7;
    if (v7)
    {
      objc_msgSend(v7, "_removeScrollViewScrollObserver:", self);
      -[_UITVScrollViewManager _tearDown:](self, "_tearDown:", v6);
    }
  }

  v8.receiver = self;
  v8.super_class = (Class)_UITVScrollViewManager;
  -[_UITVScrollViewManager dealloc](&v8, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  _UITVScrollViewManagerDelegate **p_delegate;
  id v5;

  p_delegate = &self->_delegate;
  v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  LOBYTE(p_delegate) = objc_opt_respondsToSelector();

  self->_delegateScrollViewManagerDidFinishScrolling = p_delegate & 1;
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  double y;
  double x;
  void *v8;
  unsigned int v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  -[_UITVScrollViewManager scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, sel_allowsWeakReference);

  if (v9)
  {
    -[_UITVScrollViewManager scrollView](self, "scrollView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v22 = v10;
      objc_msgSend(v10, "contentOffset");
      if (v12 == x && v11 == y)
      {
        if (!self->_delegateScrollViewManagerDidFinishScrolling)
        {
LABEL_19:
          v10 = v22;
          goto LABEL_20;
        }
        -[_UITVScrollViewManager delegate](self, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_scrollViewManagerDidFinishScrolling:", self);
      }
      else
      {
        -[_UITVScrollViewManager setTargetOffset:](self, "setTargetOffset:", x, y);
        objc_msgSend(v22, "contentOffset");
        v15 = v14;
        objc_msgSend(v22, "frame");
        v17 = v16;
        if (-[_UITVScrollViewManager scrollStyle](self, "scrollStyle") != 1)
        {
          -[_UITVScrollViewManager scrollAnimation](self, "scrollAnimation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "_animateScrollToContentOffset:animationCurve:animationAdjustsForContentOffsetDelta:animation:", 0, 1, v21, x, y);

          goto LABEL_19;
        }
        if ((uint64_t)vcvtpd_s64_f64(v15 / v17) >= 4 && v4)
        {
          -[_UITVScrollViewManager _scroll:toContentOffset:](self, "_scroll:toContentOffset:", v22, x, y);
          goto LABEL_19;
        }
        if (!v4)
        {
          objc_msgSend(v22, "setContentOffset:animated:", 0, x, y);
          goto LABEL_19;
        }
        +[_UIFocusSystemSceneComponent sceneComponentForEnvironment:](_UIFocusSystemSceneComponent, "sceneComponentForEnvironment:", v22);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "scrollManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "cancelScrollingForScrollableContainer:", v22);

        -[_UITVScrollViewManager scrollAnimation](self, "scrollAnimation");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "_animateScrollToContentOffset:animationCurve:animationAdjustsForContentOffsetDelta:animation:", 0, 1, v20, x, y);

      }
      goto LABEL_19;
    }
  }
  else
  {
    v10 = 0;
  }
LABEL_20:

}

- (CASpringAnimation)scrollAnimation
{
  CASpringAnimation *scrollAnimation;
  CASpringAnimation *v4;
  CASpringAnimation *v5;

  scrollAnimation = self->_scrollAnimation;
  if (!scrollAnimation)
  {
    v4 = (CASpringAnimation *)objc_alloc_init(MEMORY[0x1E0CD2848]);
    v5 = self->_scrollAnimation;
    self->_scrollAnimation = v4;

    -[CASpringAnimation setMass:](self->_scrollAnimation, "setMass:", 1.0);
    -[CASpringAnimation setStiffness:](self->_scrollAnimation, "setStiffness:", 100.0);
    -[CASpringAnimation setDamping:](self->_scrollAnimation, "setDamping:", 20.0);
    -[CASpringAnimation setInitialVelocity:](self->_scrollAnimation, "setInitialVelocity:", 0.0);
    -[CASpringAnimation settlingDuration](self->_scrollAnimation, "settlingDuration");
    -[CASpringAnimation setDuration:](self->_scrollAnimation, "setDuration:");
    scrollAnimation = self->_scrollAnimation;
  }
  return scrollAnimation;
}

- (void)_tearDown:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_UITVScrollViewManager _removeScreenshotViewIfNeeded](self, "_removeScreenshotViewIfNeeded");
  if (-[_UITVScrollViewManager useCustomMaskForScrolling](self, "useCustomMaskForScrolling"))
  {
    objc_msgSend(v5, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMask:", 0);

  }
}

- (void)_scrollAnimationDidEnd:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  id WeakRetained;
  void *v8;

  if (-[_UITVScrollViewManager ignoreScrollAnimationDidEnd](self, "ignoreScrollAnimationDidEnd", a3))
    return;
  -[_UITVScrollViewManager scrollView](self, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, sel_allowsWeakReference);

  if (!v5)
  {
    v6 = 0;
    goto LABEL_8;
  }
  -[_UITVScrollViewManager scrollView](self, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
LABEL_8:

    return;
  }
  v8 = v6;
  if (self->_delegateScrollViewManagerDidFinishScrolling)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "_scrollViewManagerDidFinishScrolling:", self);

  }
  -[_UITVScrollViewManager targetOffset](self, "targetOffset");
  objc_msgSend(v8, "setContentOffset:");

}

- (void)_scroll:(id)a3 toContentOffset:(CGPoint)a4
{
  double y;
  double x;
  _UITVScrollViewManager *v7;
  _UITVScrollViewManager *v8;
  _UITVScrollViewManager *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  y = a4.y;
  x = a4.x;
  v26 = a3;
  if (-[_UITVScrollViewManager allowsWeakReference](self, sel_allowsWeakReference))
    v7 = self;
  else
    v7 = 0;
  v8 = v7;
  v9 = v8;
  if (v8)
  {
    -[_UITVScrollViewManager _removeScreenshotViewIfNeeded](v8, "_removeScreenshotViewIfNeeded");
    objc_msgSend(v26, "snapshotViewAfterScreenUpdates:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITVScrollViewManager setSnapshotViewForWindow:](v9, "setSnapshotViewForWindow:", v10);

    -[_UITVScrollViewManager snapshotViewForWindow](v9, "snapshotViewForWindow");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v26, "bounds");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      -[_UITVScrollViewManager snapshotViewForWindow](v9, "snapshotViewForWindow");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setFrame:", 0.0, 0.0, v15, v17);

      objc_msgSend(v26, "window");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITVScrollViewManager snapshotViewForWindow](v9, "snapshotViewForWindow");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addSubview:", v20);

      objc_msgSend(v26, "layer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "mask");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITVScrollViewManager setUseCustomMaskForScrolling:](v9, "setUseCustomMaskForScrolling:", v22 == 0);

      if (-[_UITVScrollViewManager useCustomMaskForScrolling](v9, "useCustomMaskForScrolling"))
      {
        -[_UITVScrollViewManager _customScrollingMaskForScrollView:frame:](v9, "_customScrollingMaskForScrollView:frame:", v26, v13, v17 * 3.0, v15, v17);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "layer");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setMask:", v23);

      }
      -[_UITVScrollViewManager setIgnoreScrollAnimationDidEnd:](self, "setIgnoreScrollAnimationDidEnd:", 1);
      objc_msgSend(v26, "_setContentOffset:animated:animationCurve:animationAdjustsForContentOffsetDelta:animation:", 0, 3, 1, 0, x, v17 * 3.0);
      -[_UITVScrollViewManager setIgnoreScrollAnimationDidEnd:](self, "setIgnoreScrollAnimationDidEnd:", 0);
    }
    -[_UITVScrollViewManager scrollAnimation](self, "scrollAnimation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_animateScrollToContentOffset:animationCurve:animationAdjustsForContentOffsetDelta:animation:", 0, 1, v25, x, y);

  }
}

- (void)_removeScreenshotViewIfNeeded
{
  void *v3;

  -[UIView superview](self->_snapshotViewForWindow, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[UIView removeFromSuperview](self->_snapshotViewForWindow, "removeFromSuperview");
}

- (id)_customScrollingMaskForScrollView:(id)a3 frame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  objc_class *v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  id v21;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = (objc_class *)MEMORY[0x1E0CD2840];
  v9 = a3;
  v10 = objc_alloc_init(v8);
  objc_msgSend(v9, "contentSize");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v9, "frame");
  v16 = v15;
  v18 = v17;

  objc_msgSend(v10, "setFrame:", v16, v18, v12, v14);
  +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", x, y, width, height);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v16, v18, v12, v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "appendPath:", v20);

  v21 = objc_retainAutorelease(v19);
  objc_msgSend(v10, "setPath:", objc_msgSend(v21, "CGPath"));
  objc_msgSend(v10, "setFillRule:", *MEMORY[0x1E0CD2B70]);

  return v10;
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  CGFloat v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double MinY;
  id v26;
  CGRect v27;
  CGRect v28;

  v26 = a3;
  -[_UITVScrollViewManager snapshotViewForWindow](self, "snapshotViewForWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v26, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = v12 * 3.0;
    objc_msgSend(v26, "contentOffset");
    v16 = v14 - v15;
    -[_UITVScrollViewManager snapshotViewForWindow](self, "snapshotViewForWindow");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "frame");
    v19 = v18;
    v21 = v20;
    v23 = v22;

    -[_UITVScrollViewManager snapshotViewForWindow](self, "snapshotViewForWindow");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFrame:", v19, v16, v21, v23);

    v27.origin.x = v19;
    v27.origin.y = v16;
    v27.size.width = v21;
    v27.size.height = v23;
    MinY = CGRectGetMinY(v27);
    v28.origin.x = v7;
    v28.origin.y = v9;
    v28.size.width = v11;
    v28.size.height = v13;
    if (MinY > CGRectGetMaxY(v28))
      -[_UITVScrollViewManager _tearDown:](self, "_tearDown:", v26);
  }

}

- (_UITVScrollViewManagerDelegate)delegate
{
  return (_UITVScrollViewManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_scrollView);
}

- (void)setScrollView:(id)a3
{
  objc_storeWeak((id *)&self->_scrollView, a3);
}

- (int64_t)scrollStyle
{
  return self->_scrollStyle;
}

- (void)setScrollStyle:(int64_t)a3
{
  self->_scrollStyle = a3;
}

- (void)setScrollAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_scrollAnimation, a3);
}

- (UIView)snapshotViewForWindow
{
  return self->_snapshotViewForWindow;
}

- (void)setSnapshotViewForWindow:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotViewForWindow, a3);
}

- (BOOL)useCustomMaskForScrolling
{
  return self->_useCustomMaskForScrolling;
}

- (void)setUseCustomMaskForScrolling:(BOOL)a3
{
  self->_useCustomMaskForScrolling = a3;
}

- (BOOL)ignoreScrollAnimationDidEnd
{
  return self->_ignoreScrollAnimationDidEnd;
}

- (void)setIgnoreScrollAnimationDidEnd:(BOOL)a3
{
  self->_ignoreScrollAnimationDidEnd = a3;
}

- (CGPoint)targetOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_targetOffset.x;
  y = self->_targetOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTargetOffset:(CGPoint)a3
{
  self->_targetOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotViewForWindow, 0);
  objc_storeStrong((id *)&self->_scrollAnimation, 0);
  objc_destroyWeak((id *)&self->_scrollView);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
