@implementation SXScrollView

- (SXScrollView)initWithFrame:(CGRect)a3
{
  SXScrollView *v3;
  SXAXCustomRotorProvider *v4;
  SXAXCustomRotorProvider *customRotorProvider;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SXScrollView;
  v3 = -[SXScrollView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (SXAXCustomRotorProvider *)-[SXAXCustomRotorProvider initWithRootElement:]([SXAXCustomRotorProvider alloc], v3);
    customRotorProvider = v3->_customRotorProvider;
    v3->_customRotorProvider = v4;

    -[SXScrollView setScrollsToTop:](v3, "setScrollsToTop:", 0);
  }
  return v3;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  -[SXScrollView panGestureRecognizer](self, "panGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 != v4)
  {

LABEL_5:
    v10.receiver = self;
    v10.super_class = (Class)SXScrollView;
    v8 = -[SXScrollView gestureRecognizerShouldBegin:](&v10, sel_gestureRecognizerShouldBegin_, v4);
    goto LABEL_6;
  }
  -[SXScrollView scrollViewDelegate](self, "scrollViewDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldPreventDraggingForScrollView:", self);

  if ((v7 & 1) == 0)
    goto LABEL_5;
  v8 = 0;
LABEL_6:

  return v8;
}

- (BOOL)isBouncing
{
  double v3;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect v9;

  -[SXScrollView contentOffset](self, "contentOffset");
  if (round(v3) < 0.0)
    return 1;
  -[SXScrollView contentOffset](self, "contentOffset");
  v6 = v5;
  -[SXScrollView bounds](self, "bounds");
  v7 = round(v6 + CGRectGetHeight(v9));
  -[SXScrollView contentSize](self, "contentSize");
  return v7 > round(v8);
}

- (id)accessibilityCustomRotors
{
  void *v2;
  void *v3;

  -[SXAXCustomRotorProvider graphSearchForAvailableCustomRotorsAndUpdateCache]((uint64_t)self->_customRotorProvider);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)shouldOccludeAccessibilityElement:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;

  v4 = a3;
  -[SXScrollView scrollViewDelegate](self, "scrollViewDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SXScrollView scrollViewDelegate](self, "scrollViewDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "scrollView:shouldOccludeAccessibilityElement:", self, v4);
LABEL_9:
    v11 = v8;

    goto LABEL_10;
  }
  -[SXScrollView accessibilityContainer](self, "accessibilityContainer");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v7 = (void *)v9;
    while ((objc_opt_respondsToSelector() & 1) == 0)
    {
      objc_msgSend(v7, "accessibilityContainer");
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v10;
      if (!v10)
        goto LABEL_7;
    }
    v8 = objc_msgSend(v7, "shouldOccludeAccessibilityElement:", v4);
    goto LABEL_9;
  }
LABEL_7:
  v11 = 0;
LABEL_10:

  return v11;
}

- (BOOL)_accessibilityScrollingEnabled
{
  _BOOL8 v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  char v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SXScrollView;
  v3 = -[SXScrollView _accessibilityScrollingEnabled](&v11, sel__accessibilityScrollingEnabled);
  -[SXScrollView scrollViewDelegate](self, "scrollViewDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  -[SXScrollView scrollViewDelegate](self, "scrollViewDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 & 1) != 0)
  {
    v8 = objc_msgSend(v6, "accessibilityShouldScrollForScrollView:defaultValue:", self, v3);
LABEL_5:
    LOBYTE(v3) = v8;

    return v3;
  }
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[SXScrollView scrollViewDelegate](self, "scrollViewDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "accessibilityShouldScrollForScrollView:", self);
    goto LABEL_5;
  }
  return v3;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (SXScrollViewDelegate)scrollViewDelegate
{
  return (SXScrollViewDelegate *)objc_loadWeakRetained((id *)&self->_scrollViewDelegate);
}

- (void)setScrollViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_scrollViewDelegate, a3);
}

- (SXAXCustomRotorProvider)customRotorProvider
{
  return self->_customRotorProvider;
}

- (void)setCustomRotorProvider:(id)a3
{
  objc_storeStrong((id *)&self->_customRotorProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customRotorProvider, 0);
  objc_destroyWeak((id *)&self->_scrollViewDelegate);
}

@end
