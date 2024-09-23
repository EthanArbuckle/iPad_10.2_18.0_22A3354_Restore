@implementation SearchUICustomViewControllerCell

- (void)setEmbeddedViewController:(id)a3
{
  UIViewController *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  UIViewController *v11;

  v5 = (UIViewController *)a3;
  if (self->_embeddedViewController != v5)
  {
    v11 = v5;
    -[SearchUICustomViewControllerCell hostedView](self, "hostedView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    if (v11)
    {
      v7 = objc_alloc(MEMORY[0x1E0DC40B0]);
      -[UIViewController view](v11, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initWithHostedView:", v8);

      -[SearchUICustomViewControllerCell contentView](self, "contentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSubview:", v9);

      -[SearchUICollectionViewCell setUseSystemSizing:](self, "setUseSystemSizing:", 1);
      -[SearchUICustomViewControllerCell setHostedView:](self, "setHostedView:", v9);

    }
    objc_storeStrong((id *)&self->_embeddedViewController, a3);
    v5 = v11;
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[SearchUICustomViewControllerCell hostedView](self, "hostedView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
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
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SearchUICustomViewControllerCell;
  -[SearchUICollectionViewCell layoutSubviews](&v13, sel_layoutSubviews);
  -[SearchUICustomViewControllerCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SearchUICustomViewControllerCell hostedView](self, "hostedView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (UIViewController)embeddedViewController
{
  return self->_embeddedViewController;
}

- (UIView)hostedView
{
  return (UIView *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setHostedView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostedView, 0);
  objc_storeStrong((id *)&self->_embeddedViewController, 0);
}

@end
