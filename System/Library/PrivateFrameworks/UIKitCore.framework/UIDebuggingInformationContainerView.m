@implementation UIDebuggingInformationContainerView

- (void)layoutSubviews
{
  UIView *shadowView;
  UIView *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  UIView *v15;
  UIView *v16;
  void *v17;
  UIView *v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;

  v19.receiver = self;
  v19.super_class = (Class)UIDebuggingInformationContainerView;
  -[UIView layoutSubviews](&v19, sel_layoutSubviews);
  shadowView = self->_shadowView;
  if (!shadowView)
  {
    v4 = objc_alloc_init(UIView);
    +[UIColor whiteColor](UIColor, "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[UIView layer](v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCornerRadius:", 23.0);

    +[UIColor blackColor](UIColor, "blackColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v7, "CGColor");
    -[UIView layer](v4, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShadowColor:", v8);

    -[UIView layer](v4, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = 1053609165;
    objc_msgSend(v10, "setShadowOpacity:", v11);

    -[UIView layer](v4, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setShadowRadius:", 17.0);

    -[UIView layer](v4, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setShadowOffset:", 0.0, 4.0);

    -[UIView layer](v4, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMasksToBounds:", 0);

    v15 = self->_shadowView;
    self->_shadowView = v4;
    v16 = v4;

    +[UIColor clearColor](UIColor, "clearColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView setBackgroundColor:](self, "setBackgroundColor:", v17);
    shadowView = self->_shadowView;
  }
  -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", shadowView, 0);
  v18 = self->_shadowView;
  -[UIView bounds](self, "bounds");
  v21 = CGRectInset(v20, 10.0, 10.0);
  -[UIView setFrame:](v18, "setFrame:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
}

- (void)setShadowHidden:(BOOL)a3
{
  float v3;
  double v4;
  id v5;

  self->_shadowHidden = a3;
  if (a3)
    v3 = 0.0;
  else
    v3 = 1.0;
  -[UIView layer](self->_shadowView, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = v3;
  objc_msgSend(v5, "setOpacity:", v4);

}

- (BOOL)shadowHidden
{
  return self->_shadowHidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowView, 0);
}

@end
