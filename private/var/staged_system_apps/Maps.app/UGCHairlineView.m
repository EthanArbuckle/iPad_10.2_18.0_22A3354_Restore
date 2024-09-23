@implementation UGCHairlineView

- (UGCHairlineView)initWithFrame:(CGRect)a3
{
  UGCHairlineView *v3;
  UGCHairlineView *v4;
  void *v5;
  UGCHairlineView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)UGCHairlineView;
  v3 = -[UGCHairlineView initWithFrame:](&v19, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UGCHairlineView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCHairlineView heightAnchor](v4, "heightAnchor"));
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UGCHairlineView window](v6, "window"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "screen"));
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[UGCHairlineView window](v6, "window"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "screen"));
      objc_msgSend(v10, "nativeScale");
      v12 = v11;

    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v9, "nativeScale");
      v12 = v13;
    }

    if (v12 <= 0.0)
      v14 = 1.0;
    else
      v14 = 1.0 / v12;

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToConstant:", v14));
    -[UGCHairlineView setConstraint:](v6, "setConstraint:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UGCHairlineView constraint](v6, "constraint"));
    objc_msgSend(v16, "setActive:", 1);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme ugcHairlineColor](MapsTheme, "ugcHairlineColor"));
    -[UGCHairlineView setBackgroundColor:](v6, "setBackgroundColor:", v17);

  }
  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UGCHairlineView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)UGCHairlineView;
  v4 = a3;
  -[UGCHairlineView traitCollectionDidChange:](&v20, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCHairlineView traitCollection](self, "traitCollection", v20.receiver, v20.super_class));
  objc_msgSend(v5, "displayScale");
  v7 = v6;
  objc_msgSend(v4, "displayScale");
  v9 = v8;

  if (v7 != v9)
  {
    v10 = self;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UGCHairlineView window](v10, "window"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "screen"));
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[UGCHairlineView window](v10, "window"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "screen"));
      objc_msgSend(v14, "nativeScale");
      v16 = v15;

    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v13, "nativeScale");
      v16 = v17;
    }

    if (v16 <= 0.0)
      v18 = 1.0;
    else
      v18 = 1.0 / v16;

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UGCHairlineView constraint](v10, "constraint"));
    objc_msgSend(v19, "setConstant:", v18);

  }
}

- (NSLayoutConstraint)constraint
{
  return self->_constraint;
}

- (void)setConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_constraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraint, 0);
}

@end
