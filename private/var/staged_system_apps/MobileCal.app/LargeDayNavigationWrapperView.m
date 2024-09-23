@implementation LargeDayNavigationWrapperView

- (LargeDayNavigationWrapperView)initWithNavigationView:(id)a3
{
  id v5;
  LargeDayNavigationWrapperView *v6;
  LargeDayNavigationWrapperView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LargeDayNavigationWrapperView;
  v6 = -[LargeDayNavigationWrapperView initWithFrame:](&v9, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_navigationView, a3);
    -[LargeDayNavigationWrapperView addSubview:](v7, "addSubview:", v7->_navigationView);
  }

  return v7;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LargeDayNavigationWrapperView;
  -[LargeDayNavigationWrapperView layoutSubviews](&v3, "layoutSubviews");
  -[LargeDayNavigationWrapperView bounds](self, "bounds");
  -[UIView setFrame:](self->_navigationView, "setFrame:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationView, 0);
}

@end
