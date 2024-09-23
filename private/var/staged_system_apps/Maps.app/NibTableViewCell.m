@implementation NibTableViewCell

- (NibTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return -[NibTableViewCell initWithNibName:bundle:reuseIdentifier:](self, "initWithNibName:bundle:reuseIdentifier:", 0, 0, a4);
}

- (NibTableViewCell)initWithNibName:(id)a3 bundle:(id)a4 reuseIdentifier:(id)a5
{
  id v8;
  id v9;
  NibTableViewCell *v10;
  NSString *v11;
  NSString *nibName;
  void *v13;
  void *v14;
  id v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)NibTableViewCell;
  v10 = -[NibTableViewCell initWithStyle:reuseIdentifier:](&v17, "initWithStyle:reuseIdentifier:", 0, a5);
  if (v10)
  {
    v11 = (NSString *)objc_msgSend(v8, "copy");
    nibName = v10->_nibName;
    v10->_nibName = v11;

    objc_storeStrong((id *)&v10->_bundle, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NibTableViewCell bundle](v10, "bundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NibTableViewCell nibName](v10, "nibName"));
    v15 = objc_msgSend(v13, "loadNibNamed:owner:options:", v14, v10, 0);

    -[NibTableViewCell cellContentViewDidLoad](v10, "cellContentViewDidLoad");
  }

  return v10;
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

- (void)setCellContentView:(id)a3
{
  UIView *v5;
  UIView **p_cellContentView;
  UIView *cellContentView;
  void *v8;
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
  void *v22;
  void *v23;
  UIView *v24;
  _QWORD v25[4];

  v5 = (UIView *)a3;
  p_cellContentView = &self->_cellContentView;
  cellContentView = self->_cellContentView;
  if (cellContentView != v5)
  {
    v24 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](cellContentView, "superview"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NibTableViewCell contentView](self, "contentView"));

    if (v8 == v9)
      -[UIView removeFromSuperview](*p_cellContentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_cellContentView, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NibTableViewCell contentView](self, "contentView"));
    objc_msgSend(v10, "addSubview:", *p_cellContentView);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](*p_cellContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leftAnchor](*p_cellContentView, "leftAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NibTableViewCell leftAnchor](self, "leftAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v22));
    v25[0] = v21;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](*p_cellContentView, "topAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NibTableViewCell topAnchor](self, "topAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v11));
    v25[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView rightAnchor](*p_cellContentView, "rightAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NibTableViewCell rightAnchor](self, "rightAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
    v25[2] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](*p_cellContentView, "bottomAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NibTableViewCell bottomAnchor](self, "bottomAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
    v25[3] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);

    -[UIView setPreservesSuperviewLayoutMargins:](*p_cellContentView, "setPreservesSuperviewLayoutMargins:", 1);
    v5 = v24;
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  width = a3.width;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NibTableViewCell cellContentView](self, "cellContentView", a3.width, a3.height));
  LODWORD(v5) = 1144750080;
  LODWORD(v6) = 1112014848;
  objc_msgSend(v4, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, 0.0, v5, v6);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (UIView)cellContentView
{
  return self->_cellContentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellContentView, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_nibName, 0);
}

@end
