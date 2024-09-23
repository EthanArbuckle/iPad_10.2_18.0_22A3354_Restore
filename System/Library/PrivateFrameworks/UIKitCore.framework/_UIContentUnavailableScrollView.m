@implementation _UIContentUnavailableScrollView

- (_UIContentUnavailableScrollView)initWithFrame:(CGRect)a3
{
  _UIContentUnavailableScrollView *v3;
  _UIContentUnavailableScrollView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIContentUnavailableScrollView;
  v3 = -[UIScrollView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIScrollView _setApplyVerticalSafeAreaInsetsToNonscrollingContent:](v3, "_setApplyVerticalSafeAreaInsetsToNonscrollingContent:", 1);
    -[UIScrollView setShowsHorizontalScrollIndicator:](v4, "setShowsHorizontalScrollIndicator:", 0);
    -[UIScrollView setShowsVerticalScrollIndicator:](v4, "setShowsVerticalScrollIndicator:", 0);
  }
  return v4;
}

- (BOOL)_hasReparentedPanGesture
{
  _UIContentUnavailableScrollView *v2;
  void *v3;
  _UIContentUnavailableScrollView *v4;

  v2 = self;
  -[UIScrollView panGestureRecognizer](self, "panGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (_UIContentUnavailableScrollView *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v4 != v2;

  return (char)v2;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  _UIContentUnavailableScrollView *v5;
  _UIContentUnavailableScrollView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIContentUnavailableScrollView;
  -[UIScrollView hitTest:withEvent:](&v8, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (_UIContentUnavailableScrollView *)objc_claimAutoreleasedReturnValue();
  if (-[_UIContentUnavailableScrollView _hasReparentedPanGesture](self, "_hasReparentedPanGesture") && v5 == self)
    v6 = 0;
  else
    v6 = v5;

  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  char v10;

  if (!-[_UIContentUnavailableScrollView _hasReparentedPanGesture](self, "_hasReparentedPanGesture"))
    return 0;
  -[UIScrollView panGestureRecognizer](self, "panGestureRecognizer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != a3 || !objc_msgSend(a4, "_isGestureType:", 9))
    return 0;
  objc_msgSend(a4, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isDescendantOfView:", v9);

  return v10;
}

- (id)_parentScrollView
{
  objc_super v4;

  if (-[_UIContentUnavailableScrollView _hasReparentedPanGesture](self, "_hasReparentedPanGesture"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)_UIContentUnavailableScrollView;
  -[UIScrollView _parentScrollView](&v4, sel__parentScrollView);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
