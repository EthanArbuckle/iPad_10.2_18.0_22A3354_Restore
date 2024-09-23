@implementation ICNibView

- (ICNibView)init
{
  ICNibView *v2;
  ICNibView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICNibView;
  v2 = -[ICNibView init](&v5, "init");
  v3 = v2;
  if (v2)
    -[ICNibView commonInit](v2, "commonInit");
  return v3;
}

- (ICNibView)initWithFrame:(CGRect)a3
{
  ICNibView *v3;
  ICNibView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICNibView;
  v3 = -[ICNibView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[ICNibView commonInit](v3, "commonInit");
  return v4;
}

- (ICNibView)initWithCoder:(id)a3
{
  ICNibView *v3;
  ICNibView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICNibView;
  v3 = -[ICNibView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[ICNibView commonInit](v3, "commonInit");
  return v4;
}

- (void)commonInit
{
  objc_class *v3;
  NSString *v4;
  NSBundle *v5;
  void *v6;
  void *v7;
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
  _QWORD v23[4];

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v5 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "loadNibNamed:owner:options:", v22, self, 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "firstObject"));
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ICNibView addSubview:](self, "addSubview:", v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICNibView topAnchor](self, "topAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v19));
  v23[0] = v18;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rightAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNibView rightAnchor](self, "rightAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v8));
  v23[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICNibView bottomAnchor](self, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
  v23[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leftAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICNibView leftAnchor](self, "leftAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
  v23[3] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

}

@end
