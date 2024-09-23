@implementation NibView

- (NibView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  NibView *v7;
  NibView *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = -[NibView initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  v8 = v7;
  if (v7)
    -[NibView setFrame:](v7, "setFrame:", x, y, width, height);
  return v8;
}

- (NibView)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NibView;
  return -[NibView initWithCoder:](&v4, "initWithCoder:", a3);
}

- (NibView)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  NibView *v8;
  NSString *v9;
  NSString *nibName;
  void *v11;
  void *v12;
  id v13;
  double y;
  void *v15;
  double v16;
  double v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)NibView;
  v8 = -[NibView initWithFrame:](&v19, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v6, "copy");
    nibName = v8->_nibName;
    v8->_nibName = v9;

    objc_storeStrong((id *)&v8->_bundle, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NibView bundle](v8, "bundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NibView nibName](v8, "nibName"));
    v13 = objc_msgSend(v11, "loadNibNamed:owner:options:", v12, v8, 0);

    -[NibView contentViewDidLoad](v8, "contentViewDidLoad");
    y = CGPointZero.y;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NibView contentView](v8, "contentView"));
    objc_msgSend(v15, "_mapkit_fittingSize");
    -[NibView setFrame:](v8, "setFrame:", CGPointZero.x, y, v16, v17);

  }
  return v8;
}

- (NSString)nibName
{
  NSString *nibName;
  objc_class *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;

  nibName = self->_nibName;
  if (!nibName)
  {
    v4 = (objc_class *)objc_opt_class(self);
    v5 = NSStringFromClass(v4);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue(v5);
    v7 = self->_nibName;
    self->_nibName = v6;

    nibName = self->_nibName;
  }
  return nibName;
}

- (NSBundle)bundle
{
  NSBundle *bundle;
  NSBundle *v4;
  NSBundle *v5;
  NSBundle *v6;

  bundle = self->_bundle;
  if (!bundle)
  {
    v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v5 = (NSBundle *)objc_claimAutoreleasedReturnValue(v4);
    v6 = self->_bundle;
    self->_bundle = v5;

    bundle = self->_bundle;
  }
  return bundle;
}

- (void)setContentView:(id)a3
{
  UIView *v5;
  UIView **p_contentView;
  UIView *contentView;
  NibView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  UIView *v22;
  _QWORD v23[4];

  v5 = (UIView *)a3;
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    v22 = v5;
    v8 = (NibView *)objc_claimAutoreleasedReturnValue(-[UIView superview](contentView, "superview"));

    if (v8 == self)
      -[UIView removeFromSuperview](*p_contentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentView, a3);
    -[NibView addSubview:](self, "addSubview:", *p_contentView);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](*p_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leftAnchor](*p_contentView, "leftAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NibView leftAnchor](self, "leftAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
    v23[0] = v19;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](*p_contentView, "topAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NibView topAnchor](self, "topAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
    v23[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView rightAnchor](*p_contentView, "rightAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NibView rightAnchor](self, "rightAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
    v23[2] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](*p_contentView, "bottomAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NibView bottomAnchor](self, "bottomAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
    v23[3] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);

    v5 = v22;
  }

}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_nibName, 0);
}

@end
