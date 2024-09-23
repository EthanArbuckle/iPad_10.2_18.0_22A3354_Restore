@implementation TUNavigationBarCompressibleTitleView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regularTitleView, 0);
  objc_storeStrong((id *)&self->_customTitleView, 0);
}

- (TUNavigationBarCompressibleTitleView)initWithCustomTitleView:(id)a3
{
  id v5;
  TUNavigationBarCompressibleTitleView *v6;
  TUNavigationBarCompressibleTitleView *v7;
  UILabel *regularTitleView;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TUNavigationBarCompressibleTitleView;
  v6 = -[TUNavigationBarCompressibleTitleView init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_customTitleView, a3);
    regularTitleView = v7->_regularTitleView;
    v7->_regularTitleView = 0;

  }
  return v7;
}

- (TUNavigationBarCompressibleTitleView)initWithRegularTitleView:(id)a3
{
  id v5;
  TUNavigationBarCompressibleTitleView *v6;
  TUNavigationBarCompressibleTitleView *v7;
  TUNavigationBarCompressible *customTitleView;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TUNavigationBarCompressibleTitleView;
  v6 = -[TUNavigationBarCompressibleTitleView init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_regularTitleView, a3);
    customTitleView = v7->_customTitleView;
    v7->_customTitleView = 0;

  }
  return v7;
}

- (UIView)view
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[TUNavigationBarCompressibleTitleView customTitleView](self, "customTitleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[TUNavigationBarCompressibleTitleView regularTitleView](self, "regularTitleView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (UIView *)v6;
}

- (double)contentAlpha
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[TUNavigationBarCompressibleTitleView customTitleView](self, "customTitleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TUNavigationBarCompressibleTitleView customTitleView](self, "customTitleView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentAlpha");
  }
  else
  {
    -[TUNavigationBarCompressibleTitleView regularTitleView](self, "regularTitleView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alpha");
  }
  v6 = v5;

  return v6;
}

- (void)setContentAlpha:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[TUNavigationBarCompressibleTitleView customTitleView](self, "customTitleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TUNavigationBarCompressibleTitleView customTitleView](self, "customTitleView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentAlpha:", a3);

  }
  -[TUNavigationBarCompressibleTitleView regularTitleView](self, "regularTitleView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[TUNavigationBarCompressibleTitleView regularTitleView](self, "regularTitleView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlpha:", a3);

  }
}

- (double)verticalOffset
{
  void *v2;
  void *v3;
  double v4;
  double v6;

  -[TUNavigationBarCompressibleTitleView view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "transform");
    v4 = v6;
  }
  else
  {
    v4 = 0.0;
  }

  return v4;
}

- (void)setVerticalOffset:(double)a3
{
  void *v4;
  CATransform3D v5;

  -[TUNavigationBarCompressibleTitleView view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CATransform3DMakeTranslation(&v5, 0.0, a3, 0.0);
  objc_msgSend(v4, "setTransform3D:", &v5);

}

- (TUNavigationBarCompressible)customTitleView
{
  return self->_customTitleView;
}

- (UILabel)regularTitleView
{
  return self->_regularTitleView;
}

@end
