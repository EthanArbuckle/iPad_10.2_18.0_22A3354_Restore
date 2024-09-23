@implementation TUNavigationBarCompressibleBarButtonItemView

- (TUNavigationBarCompressibleBarButtonItemView)initWithCustomItemView:(id)a3
{
  id v5;
  TUNavigationBarCompressibleBarButtonItemView *v6;
  TUNavigationBarCompressibleBarButtonItemView *v7;
  UIView *regularItemView;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TUNavigationBarCompressibleBarButtonItemView;
  v6 = -[TUNavigationBarCompressibleBarButtonItemView init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_customItemView, a3);
    regularItemView = v7->_regularItemView;
    v7->_regularItemView = 0;

  }
  return v7;
}

- (TUNavigationBarCompressibleBarButtonItemView)initWithRegularItemView:(id)a3
{
  id v5;
  TUNavigationBarCompressibleBarButtonItemView *v6;
  TUNavigationBarCompressibleBarButtonItemView *v7;
  TUNavigationBarButtonItemCompressible *customItemView;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TUNavigationBarCompressibleBarButtonItemView;
  v6 = -[TUNavigationBarCompressibleBarButtonItemView init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    customItemView = v6->_customItemView;
    v6->_customItemView = 0;

    objc_storeStrong((id *)&v7->_regularItemView, a3);
  }

  return v7;
}

- (UIView)view
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[TUNavigationBarCompressibleBarButtonItemView customItemView](self, "customItemView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[TUNavigationBarCompressibleBarButtonItemView regularItemView](self, "regularItemView");
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

  -[TUNavigationBarCompressibleBarButtonItemView customItemView](self, "customItemView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TUNavigationBarCompressibleBarButtonItemView customItemView](self, "customItemView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentAlpha");
  }
  else
  {
    -[TUNavigationBarCompressibleBarButtonItemView regularItemView](self, "regularItemView");
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

  -[TUNavigationBarCompressibleBarButtonItemView customItemView](self, "customItemView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TUNavigationBarCompressibleBarButtonItemView customItemView](self, "customItemView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentAlpha:", a3);

  }
  -[TUNavigationBarCompressibleBarButtonItemView regularItemView](self, "regularItemView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[TUNavigationBarCompressibleBarButtonItemView regularItemView](self, "regularItemView");
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

  -[TUNavigationBarCompressibleBarButtonItemView view](self, "view");
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

  -[TUNavigationBarCompressibleBarButtonItemView view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CATransform3DMakeTranslation(&v5, 0.0, a3, 0.0);
  objc_msgSend(v4, "setTransform3D:", &v5);

}

- (TUNavigationBarButtonItemCompressible)customItemView
{
  return self->_customItemView;
}

- (UIView)regularItemView
{
  return self->_regularItemView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regularItemView, 0);
  objc_storeStrong((id *)&self->_customItemView, 0);
}

@end
