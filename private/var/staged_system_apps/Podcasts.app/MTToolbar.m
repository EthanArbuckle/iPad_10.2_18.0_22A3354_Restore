@implementation MTToolbar

- (MTToolbar)init
{
  MTToolbar *v2;
  MTToolbar *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTToolbar;
  v2 = -[MTToolbar init](&v5, "init");
  v3 = v2;
  if (v2)
    -[MTToolbar setupView](v2, "setupView");
  return v3;
}

- (void)setupView
{
  UIImage *v3;
  UIImage *v4;
  void *v5;
  UIView *v6;
  UIView *separatorView;
  void *v8;

  v3 = objc_opt_new(UIImage);
  -[MTToolbar setBackgroundImage:forToolbarPosition:barMetrics:](self, "setBackgroundImage:forToolbarPosition:barMetrics:", v3, 0, 0);

  v4 = objc_opt_new(UIImage);
  -[MTToolbar setShadowImage:forToolbarPosition:](self, "setShadowImage:forToolbarPosition:", v4, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[MTToolbar setBackgroundColor:](self, "setBackgroundColor:", v5);

  v6 = (UIView *)objc_alloc_init((Class)UIView);
  separatorView = self->_separatorView;
  self->_separatorView = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTToolbar _separatorColor](self, "_separatorColor"));
  -[UIView setBackgroundColor:](self->_separatorView, "setBackgroundColor:", v8);

  -[MTToolbar addSubview:](self, "addSubview:", self->_separatorView);
}

- (void)setSeparatorHidden:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[MTToolbar isSeparatorHidden](self, "isSeparatorHidden") != a3)
    -[UIView setHidden:](self->_separatorView, "setHidden:", v3);
}

- (BOOL)isSeparatorHidden
{
  return -[UIView isHidden](self->_separatorView, "isHidden");
}

- (void)setSeparatorColor:(id)a3
{
  UIColor *v5;
  void *v6;
  UIColor *v7;

  v5 = (UIColor *)a3;
  if (self->_separatorColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_separatorColor, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTToolbar _separatorColor](self, "_separatorColor"));
    -[UIView setBackgroundColor:](self->_separatorView, "setBackgroundColor:", v6);

    v5 = v7;
  }

}

- (id)_separatorColor
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTToolbar separatorColor](self, "separatorColor"));
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = (id)objc_claimAutoreleasedReturnValue(+[UIColor cellSeparatorColor](UIColor, "cellSeparatorColor"));
  v5 = v4;

  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTToolbar;
  -[MTToolbar layoutSubviews](&v9, "layoutSubviews");
  if (self->_separatorView)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v3, "scale");
    v5 = v4;

    -[MTToolbar bounds](self, "bounds");
    v7 = v6;
    -[MTToolbar bounds](self, "bounds");
    -[UIView setFrame:](self->_separatorView, "setFrame:", CGRectZero.origin.x, v8 - 1.0 / v5, v7, 1.0 / v5);
  }
}

- (UIColor)separatorColor
{
  return self->_separatorColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
}

@end
