@implementation FeatureDiscoveryOutlineCell

- (FeatureDiscoveryOutlineCell)initWithFrame:(CGRect)a3
{
  FeatureDiscoveryOutlineCell *v3;
  FeatureDiscoveryView *v4;
  void *v5;
  FeatureDiscoveryView *v6;
  FeatureDiscoveryView *featureDiscoveryView;
  objc_class *v8;
  NSString *v9;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;
  _QWORD v33[4];

  v32.receiver = self;
  v32.super_class = (Class)FeatureDiscoveryOutlineCell;
  v3 = -[SidebarOutlineCell initWithFrame:](&v32, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [FeatureDiscoveryView alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryOutlineCell contentView](v3, "contentView"));
    objc_msgSend(v5, "bounds");
    v6 = -[FeatureDiscoveryView initWithFrame:](v4, "initWithFrame:");
    featureDiscoveryView = v3->_featureDiscoveryView;
    v3->_featureDiscoveryView = v6;

    -[FeatureDiscoveryView setTranslatesAutoresizingMaskIntoConstraints:](v3->_featureDiscoveryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = (objc_class *)objc_opt_class(v3);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[FeatureDiscoveryOutlineCell setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryOutlineCell contentView](v3, "contentView"));
    objc_msgSend(v11, "addSubview:", v3->_featureDiscoveryView);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView topAnchor](v3->_featureDiscoveryView, "topAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryOutlineCell contentView](v3, "contentView"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "topAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, 16.0));
    v33[0] = v28;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView leadingAnchor](v3->_featureDiscoveryView, "leadingAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryOutlineCell contentView](v3, "contentView"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "layoutMarginsGuide"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "leadingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v24));
    v33[1] = v23;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView trailingAnchor](v3->_featureDiscoveryView, "trailingAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryOutlineCell contentView](v3, "contentView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layoutMarginsGuide"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v14));
    v33[2] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView bottomAnchor](v3->_featureDiscoveryView, "bottomAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryOutlineCell contentView](v3, "contentView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, -16.0));
    v33[3] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v20);

  }
  return v3;
}

- (FeatureDiscoveryModel)cellModel
{
  return -[FeatureDiscoveryView model](self->_featureDiscoveryView, "model");
}

- (void)setCellModel:(id)a3
{
  -[FeatureDiscoveryView setModel:](self->_featureDiscoveryView, "setModel:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureDiscoveryView, 0);
}

@end
