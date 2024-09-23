@implementation BCCardViewControllerScrollView

- (UIEdgeInsets)_accessibilityVisibleContentInset
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
  double v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewControllerScrollView accessibilityDelegate](self, "accessibilityDelegate"));
  objc_msgSend(v3, "accessibilityVisibleContentInsetForCardViewControllerScrollView:", self);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (void)accessibilityApplyScrollContent:(CGPoint)a3 sendScrollStatus:(BOOL)a4 animated:(BOOL)a5
{
  double x;
  float y;
  double v8;
  id v9;

  x = a3.x;
  y = a3.y;
  v8 = fmaxf(y, 0.0);
  v9 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewControllerScrollView accessibilityDelegate](self, "accessibilityDelegate", a4, a5));
  objc_msgSend(v9, "cardViewControllerScrollView:accessibilityWantsToScrollToOffset:", self, x, v8);

}

- (BOOL)touchesShouldCancelInContentView:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewControllerScrollView contentScrollView](self, "contentScrollView"));
  v6 = objc_msgSend(v5, "touchesShouldCancelInContentView:", v4);

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)BCCardViewControllerScrollView;
    v7 = -[BCCardViewControllerScrollView touchesShouldCancelInContentView:](&v9, "touchesShouldCancelInContentView:", v4);
  }

  return v7;
}

- (UIScrollView)contentScrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_contentScrollView);
}

- (void)setContentScrollView:(id)a3
{
  objc_storeWeak((id *)&self->_contentScrollView, a3);
}

- (BCCardViewControllerScrollViewAccessibilityDelegate)accessibilityDelegate
{
  return (BCCardViewControllerScrollViewAccessibilityDelegate *)objc_loadWeakRetained((id *)&self->_accessibilityDelegate);
}

- (void)setAccessibilityDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_accessibilityDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessibilityDelegate);
  objc_destroyWeak((id *)&self->_contentScrollView);
}

@end
