@implementation CardTestPopoverContainee

- (CardTestPopoverContainee)initWithContext:(id)a3 forLabelMarker:(id)a4
{
  id v7;
  CardTestPopoverContainee *v8;
  CardTestPopoverContainee *v9;
  void *v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CardTestPopoverContainee;
  v8 = -[CardTestContainee initWithContext:](&v12, "initWithContext:", a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_labelMarker, a4);
    -[ContaineeViewController setPreferredPresentationStyle:](v9, "setPreferredPresentationStyle:", 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController macPopoverPresentationController](v9, "macPopoverPresentationController"));
    objc_msgSend(v7, "coordinate");
    objc_msgSend(v10, "setCoordinate:");

  }
  return v9;
}

- (void)_createSubviews
{
  id v3;
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
  _QWORD v23[4];

  v3 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Label Marker: %@"), self->_labelMarker));
  objc_msgSend(v3, "setText:", v4);

  objc_msgSend(v3, "setNumberOfLines:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CardTestPopoverContainee view](self, "view"));
  objc_msgSend(v5, "addSubview:", v3);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CardTestPopoverContainee view](self, "view"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v20, 1.0));
  v23[0] = v19;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CardTestPopoverContainee view](self, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v16, 1.0));
  v23[1] = v15;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CardTestPopoverContainee view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v8, 1.0));
  v23[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CardTestPopoverContainee view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v12, 1.0));
  v23[3] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelMarker, 0);
}

@end
