@implementation PLExpandedPlatterPresentationView

- (PLExpandedPlatterPresentationView)initWithFrame:(CGRect)a3
{
  PLExpandedPlatterPresentationView *v3;
  PLExpandedPlatterPresentationView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLExpandedPlatterPresentationView;
  v3 = -[PLExpandedPlatterPresentationView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PLExpandedPlatterPresentationView setAutoresizesSubviews:](v3, "setAutoresizesSubviews:", 1);
    -[PLExpandedPlatterPresentationView _setIgnoresLayerTransformForSafeAreaInsets:](v4, "_setIgnoresLayerTransformForSafeAreaInsets:", 1);
  }
  return v4;
}

- (PLExpandedPlatter)expandedPlatterView
{
  -[PLExpandedPlatterPresentationView _configureExpandedPlatterViewIfNecessary](self, "_configureExpandedPlatterViewIfNecessary");
  return self->_expandedPlatterView;
}

- (UIScrollView)scrollView
{
  -[PLExpandedPlatterPresentationView _configureScrollViewIfNecessary](self, "_configureScrollViewIfNecessary");
  return self->_scrollView;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  -[PLExpandedPlatterPresentationView contentSizeForSize:](self, "contentSizeForSize:", a3.width, a3.height);
  -[PLExpandedPlatterPresentationView sizeThatFitsContentWithSize:](self, "sizeThatFitsContentWithSize:");
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  PLExpandedPlatter *expandedPlatterView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLExpandedPlatterPresentationView;
  -[PLExpandedPlatterPresentationView layoutSubviews](&v4, sel_layoutSubviews);
  -[PLExpandedPlatterPresentationView _configureScrollViewIfNecessary](self, "_configureScrollViewIfNecessary");
  -[PLExpandedPlatterPresentationView _configureExpandedPlatterViewIfNecessary](self, "_configureExpandedPlatterViewIfNecessary");
  expandedPlatterView = self->_expandedPlatterView;
  -[UIScrollView bounds](self->_scrollView, "bounds");
  -[PLExpandedPlatter setFrame:](expandedPlatterView, "setFrame:");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  PLExpandedPlatterPresentationView *v5;
  PLExpandedPlatterPresentationView *v6;
  PLExpandedPlatterPresentationView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PLExpandedPlatterPresentationView;
  -[PLExpandedPlatterPresentationView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (PLExpandedPlatterPresentationView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v5 = 0;
  v7 = v5;

  return v7;
}

- (CGSize)sizeThatFitsContentWithSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PLExpandedPlatterPresentationView _configureExpandedPlatterViewIfNecessary](self, "_configureExpandedPlatterViewIfNecessary");
  -[PLExpandedPlatter sizeThatFitsContentWithSize:](self->_expandedPlatterView, "sizeThatFitsContentWithSize:", width, height);
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)contentSizeForSize:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = *MEMORY[0x1E0C9D820];
  v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (width > 0.0 && height > 0.0)
  {
    -[PLExpandedPlatterPresentationView _configureExpandedPlatterViewIfNecessary](self, "_configureExpandedPlatterViewIfNecessary", v5, v6);
    -[PLExpandedPlatter contentSizeForSize:](self->_expandedPlatterView, "contentSizeForSize:", width, height);
  }
  result.height = v6;
  result.width = v5;
  return result;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v5;
  id WeakRetained;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLExpandedPlatterPresentationView;
  if (-[PLExpandedPlatterPresentationView respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    v5 = 1;
  }
  else if (-[UIView pl_isScrollViewDelegateMethod:](self, "pl_isScrollViewDelegateMethod:", a3))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_opt_respondsToSelector();

  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  id WeakRetained;
  objc_super v6;

  v4 = a3;
  if (-[UIView pl_isScrollViewDelegateMethod:](self, "pl_isScrollViewDelegateMethod:", objc_msgSend(v4, "selector")))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "invokeWithTarget:", WeakRetained);
    }
    else
    {
      v6.receiver = self;
      v6.super_class = (Class)PLExpandedPlatterPresentationView;
      -[PLExpandedPlatterPresentationView forwardInvocation:](&v6, sel_forwardInvocation_, v4);
    }

  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id WeakRetained;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  id v13;
  CGRect v14;

  v13 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentableViewController);
  objc_msgSend(v13, "contentOffset");
  if (v5 < 0.0 && (objc_msgSend(WeakRetained, "isBeingDismissed") & 1) == 0)
  {
    objc_msgSend(v13, "contentOffset");
    v7 = v6 >= 0.0 ? v6 : -v6;
    -[PLExpandedPlatterPresentationView bounds](self, "bounds");
    v8 = fmax(v7 / CGRectGetHeight(v14), 0.0);
    if (v8 < 1.0)
    {
      objc_msgSend(v13, "contentOffset");
      v10 = fmin(fmax(1.0 - (v9 + 60.0) / 60.0, 0.0), 1.0);
      objc_msgSend(WeakRetained, "expandedPlatterPresentationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hintDismissalWithCommitProgress:overallProgress:", v10, v8);

    }
  }
  v12 = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v12, "scrollViewDidScroll:", v13);

}

- (double)_translationWithVelocity:(double)a3 acceleration:(double)a4
{
  float v4;
  double v5;
  double v6;

  v4 = a3;
  v5 = (float)-(float)(v4 * v4) / (a4 + a4);
  if (a3 <= 0.0)
    v6 = -v5;
  else
    v6 = v5;
  return v6 / PLMainScreenScale();
}

- (void)_dismissExpandedPlatterWithTrigger:(int64_t)a3
{
  id v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_presentableViewController);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = WeakRetained;
    objc_msgSend(v4, "dismisser");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "expandedPlatterPresentable:requestsDismissalWithTrigger:", v4, a3);
  }
  else
  {
    objc_msgSend(WeakRetained, "presenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "clickPresentationInteractionManager");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
    objc_msgSend(v4, "_dismissIfPossibleWithTrigger:", a3);
  }

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  _BOOL8 v4;
  double v6;
  double v7;
  id WeakRetained;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;

  v4 = a4;
  v19 = a3;
  objc_msgSend(v19, "contentOffset");
  v7 = v6 + 60.0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentableViewController);
  if (v7 < 0.0 || !v4)
  {
    if (v7 >= 0.0)
      goto LABEL_8;
    goto LABEL_7;
  }
  objc_msgSend(v19, "panGestureRecognizer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "expandedPlatterPresentationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "containerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "velocityInView:", v13);
  v15 = v14;

  -[PLExpandedPlatterPresentationView _translationWithVelocity:acceleration:](self, "_translationWithVelocity:acceleration:", v15, *MEMORY[0x1E0CEBBA8] * -10000.0);
  v17 = v16;
  objc_msgSend(v19, "contentOffset");
  if (v18 - v17 + 60.0 < 0.0)
LABEL_7:
    -[PLExpandedPlatterPresentationView _dismissExpandedPlatterWithTrigger:](self, "_dismissExpandedPlatterWithTrigger:", 1);
LABEL_8:
  v10 = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "scrollViewDidEndDragging:willDecelerate:", v19, v4);

}

- (void)_configureScrollViewIfNecessary
{
  id v3;
  UIScrollView *v4;
  UIScrollView *scrollView;

  if (!self->_scrollView)
  {
    v3 = objc_alloc(MEMORY[0x1E0CEA970]);
    -[PLExpandedPlatterPresentationView bounds](self, "bounds");
    v4 = (UIScrollView *)objc_msgSend(v3, "initWithFrame:");
    scrollView = self->_scrollView;
    self->_scrollView = v4;

    -[UIScrollView setAutoresizingMask:](self->_scrollView, "setAutoresizingMask:", 18);
    -[UIScrollView setAlwaysBounceHorizontal:](self->_scrollView, "setAlwaysBounceHorizontal:", 0);
    -[UIScrollView setShowsVerticalScrollIndicator:](self->_scrollView, "setShowsVerticalScrollIndicator:", 0);
    -[UIScrollView setShowsHorizontalScrollIndicator:](self->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
    -[UIScrollView setClipsToBounds:](self->_scrollView, "setClipsToBounds:", 0);
    -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
    -[UIScrollView setBounces:](self->_scrollView, "setBounces:", 1);
    -[UIScrollView setAlwaysBounceVertical:](self->_scrollView, "setAlwaysBounceVertical:", 1);
    -[PLExpandedPlatterPresentationView addSubview:](self, "addSubview:", self->_scrollView);
  }
}

- (void)_configureExpandedPlatterViewIfNecessary
{
  PLExpandedPlatter *v3;
  PLExpandedPlatter *expandedPlatterView;
  PLExpandedPlatter *v5;
  PLExpandedPlatter *v6;
  PLExpandedPlatter *v7;
  void *v8;
  id WeakRetained;

  if (!self->_expandedPlatterView)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "expandedPlatterViewForPresentationView:", self);
      v3 = (PLExpandedPlatter *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
    expandedPlatterView = self->_expandedPlatterView;
    self->_expandedPlatterView = v3;

    v5 = self->_expandedPlatterView;
    if (v5)
    {
      -[PLExpandedPlatter setAdjustsFontForContentSizeCategory:](v5, "setAdjustsFontForContentSizeCategory:", 1);
      if (-[PLExpandedPlatter conformsToProtocol:](self->_expandedPlatterView, "conformsToProtocol:", &unk_1EFC6BBC8))v6 = self->_expandedPlatterView;
      else
        v6 = 0;
      v7 = v6;
      -[PLExpandedPlatter dismissControl](v7, "dismissControl");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__handleDismissButton_, 0x2000);

      -[PLExpandedPlatterPresentationView _configureScrollViewIfNecessary](self, "_configureScrollViewIfNecessary");
      -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_expandedPlatterView);

    }
  }
}

- (void)_handleDismissButton:(id)a3
{
  -[PLExpandedPlatterPresentationView _dismissExpandedPlatterWithTrigger:](self, "_dismissExpandedPlatterWithTrigger:", 4);
}

- (PLClickPresentationInteractionPresentable)presentableViewController
{
  return (PLClickPresentationInteractionPresentable *)objc_loadWeakRetained((id *)&self->_presentableViewController);
}

- (void)setPresentableViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentableViewController, a3);
}

- (PLExpandedPlatterPresentationViewDelegate)delegate
{
  return (PLExpandedPlatterPresentationViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_presentableViewController);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_expandedPlatterView, 0);
}

@end
