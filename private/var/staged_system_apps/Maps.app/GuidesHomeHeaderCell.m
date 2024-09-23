@implementation GuidesHomeHeaderCell

- (GuidesHomeHeaderCell)initWithFrame:(CGRect)a3
{
  GuidesHomeHeaderCell *v3;
  GuidesHomeHeaderCell *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GuidesHomeHeaderCell;
  v3 = -[GuidesHomeHeaderCell initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (objc_class *)objc_opt_class(v3);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[GuidesHomeHeaderCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v7);

    -[GuidesHomeHeaderCell setupSubviews](v4, "setupSubviews");
  }
  return v4;
}

- (void)prepareForReuse
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)GuidesHomeHeaderCell;
  -[GuidesHomeHeaderCell prepareForReuse](&v2, "prepareForReuse");
}

- (void)configureWithGuidesHomeHeaderViewModel:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  double v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[GuidesHomeHeaderCell setupConstraints](self, "setupConstraints");
  v9 = (id)objc_claimAutoreleasedReturnValue(-[GuidesHomeHeaderCell heroHeaderView](self, "heroHeaderView"));
  -[GuidesHomeHeaderCell frame](self, "frame");
  objc_msgSend(v9, "configureWithGuidesHomeHeaderViewModel:maxWidth:delegate:", v7, v6, v8);

}

- (void)didChangeContentYOffset:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[GuidesHomeHeaderCell heroHeaderView](self, "heroHeaderView"));
  objc_msgSend(v4, "didChangeContentYOffset:", a3);

}

- (void)setupSubviews
{
  GuideHomeHeaderView *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = -[GuideHomeHeaderView initWithFrame:]([GuideHomeHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[GuidesHomeHeaderCell setHeroHeaderView:](self, "setHeroHeaderView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeHeaderCell heroHeaderView](self, "heroHeaderView"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[GuidesHomeHeaderCell contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeHeaderCell heroHeaderView](self, "heroHeaderView"));
  objc_msgSend(v6, "addSubview:", v5);

}

- (void)setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
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
  void *v23;
  _QWORD v24[4];

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeHeaderCell heroHeaderView](self, "heroHeaderView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeHeaderCell contentView](self, "contentView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
  v24[0] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeHeaderCell heroHeaderView](self, "heroHeaderView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeHeaderCell contentView](self, "contentView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v15));
  v24[1] = v14;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeHeaderCell heroHeaderView](self, "heroHeaderView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeHeaderCell contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v5));
  v24[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeHeaderCell heroHeaderView](self, "heroHeaderView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeHeaderCell contentView](self, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v24[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (GuideHomeHeaderView)heroHeaderView
{
  return self->_heroHeaderView;
}

- (void)setHeroHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_heroHeaderView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heroHeaderView, 0);
}

@end
