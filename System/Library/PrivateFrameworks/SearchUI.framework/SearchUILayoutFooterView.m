@implementation SearchUILayoutFooterView

+ (id)reuseIdentifier
{
  return CFSTR("searchLayoutFooter");
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  width = a3.width;
  -[SearchUILayoutFooterView footerView](self, "footerView", a3.width, a3.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "systemLayoutSizeFittingSize:", width, 0.0);
  v8 = v7;

  v9 = width;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)setFooterView:(id)a3
{
  UIView *v5;
  UIView *footerView;
  UIView *v7;

  v5 = (UIView *)a3;
  footerView = self->_footerView;
  v7 = v5;
  if (footerView != v5)
  {
    -[UIView removeFromSuperview](footerView, "removeFromSuperview");
    -[SearchUILayoutFooterView addSubview:](self, "addSubview:", v7);
    objc_storeStrong((id *)&self->_footerView, a3);
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SearchUILayoutFooterView;
  -[SearchUILayoutFooterView layoutSubviews](&v12, sel_layoutSubviews);
  -[SearchUILayoutFooterView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SearchUILayoutFooterView footerView](self, "footerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (UIView)footerView
{
  return self->_footerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
}

@end
