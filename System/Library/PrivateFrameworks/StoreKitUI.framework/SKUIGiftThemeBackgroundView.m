@implementation SKUIGiftThemeBackgroundView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  UIScrollView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKUIGiftThemeBackgroundView;
  -[SKUIGiftThemeBackgroundView hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (UIScrollView *)objc_claimAutoreleasedReturnValue();
  if (v5 == (UIScrollView *)self)
  {
    v5 = self->_scrollView;

  }
  return v5;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
