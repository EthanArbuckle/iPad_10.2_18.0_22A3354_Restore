@implementation PersonalizedImageView

- (PersonalizedImageView)initWithMainImage:(id)a3 mainImageSize:(CGSize)a4 userImageDiameter:(double)a5 userImageExtensionPastMainImage:(double)a6
{
  CGFloat height;
  CGFloat width;
  id v12;
  PersonalizedImageView *v13;
  PersonalizedImageView *v14;
  objc_super v16;

  height = a4.height;
  width = a4.width;
  v12 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PersonalizedImageView;
  v13 = -[PersonalizedImageView initWithFrame:](&v16, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_mainImage, a3);
    v14->_mainImageSize.width = width;
    v14->_mainImageSize.height = height;
    v14->_userImageSize.width = a5;
    v14->_userImageSize.height = a5;
    v14->_userImageExtensionPastMainImage = a6;
    -[PersonalizedImageView _setupViews](v14, "_setupViews");
    -[PersonalizedImageView _setupConstraints](v14, "_setupConstraints");
  }

  return v14;
}

- (void)_setupViews
{
  id v3;
  double y;
  double width;
  double height;
  UIImageView *v7;
  UIImageView *mainImageView;
  UIImageView *v9;
  UIImageView *userImageView;
  void *v11;
  void *v12;
  double v13;
  double v14;

  v3 = objc_alloc((Class)UIImageView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  mainImageView = self->_mainImageView;
  self->_mainImageView = v7;

  -[UIImageView setImage:](self->_mainImageView, "setImage:", self->_mainImage);
  -[UIImageView setContentMode:](self->_mainImageView, "setContentMode:", 1);
  -[PersonalizedImageView addSubview:](self, "addSubview:", self->_mainImageView);
  v9 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  userImageView = self->_userImageView;
  self->_userImageView = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UserInformationManager sharedInstance](UserInformationManager, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userIcon"));
  -[UIImageView setImage:](self->_userImageView, "setImage:", v12);

  -[PersonalizedImageView addSubview:](self, "addSubview:", self->_userImageView);
  LODWORD(v13) = 1148846080;
  -[PersonalizedImageView setContentCompressionResistancePriority:forAxis:](self, "setContentCompressionResistancePriority:forAxis:", 1, v13);
  LODWORD(v14) = 1148846080;
  -[PersonalizedImageView setContentCompressionResistancePriority:forAxis:](self, "setContentCompressionResistancePriority:forAxis:", 0, v14);
}

- (void)_setupConstraints
{
  id v3;
  id v4;
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
  void *v24;
  _QWORD v25[6];
  _QWORD v26[2];

  v3 = objc_msgSend(objc_alloc((Class)MUSizeLayout), "initWithItem:size:", self->_mainImageView, self->_mainImageSize.width, self->_mainImageSize.height);
  v26[0] = v3;
  v4 = objc_msgSend(objc_alloc((Class)MUSizeLayout), "initWithItem:size:", self->_userImageView, self->_userImageSize.width, self->_userImageSize.height);
  v26[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 2));
  +[NSLayoutConstraint _mapsui_activateLayouts:](NSLayoutConstraint, "_mapsui_activateLayouts:", v5);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](self->_mainImageView, "topAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedImageView topAnchor](self, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v23));
  v25[0] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leftAnchor](self->_mainImageView, "leftAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedImageView leftAnchor](self, "leftAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v20, self->_userImageExtensionPastMainImage + -4.0));
  v25[1] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView rightAnchor](self->_mainImageView, "rightAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedImageView rightAnchor](self, "rightAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", v17, -(self->_userImageExtensionPastMainImage + 4.0)));
  v25[2] = v16;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](self->_mainImageView, "bottomAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedImageView bottomAnchor](self, "bottomAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v6, -self->_userImageExtensionPastMainImage));
  v25[3] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView rightAnchor](self->_userImageView, "rightAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView rightAnchor](self->_mainImageView, "rightAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, self->_userImageExtensionPastMainImage));
  v25[4] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](self->_userImageView, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](self->_mainImageView, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, self->_userImageExtensionPastMainImage));
  v25[5] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 6));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

}

- (void)layoutSubviews
{
  void *v3;
  UIImageView *userImageView;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v9;
  CGRect v10;
  CGRect v11;

  v9.receiver = self;
  v9.super_class = (Class)PersonalizedImageView;
  -[PersonalizedImageView layoutSubviews](&v9, "layoutSubviews");
  -[UIImageView bounds](self->_mainImageView, "bounds");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:"));
  userImageView = self->_userImageView;
  -[UIImageView bounds](userImageView, "bounds");
  -[UIImageView convertRect:toView:](userImageView, "convertRect:toView:", self->_mainImageView);
  v11 = CGRectInset(v10, -3.0, -3.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v11.origin.x, v11.origin.y, v11.size.width, v11.size.height));
  objc_msgSend(v3, "appendPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
  objc_msgSend(v6, "setFillRule:", kCAFillRuleEvenOdd);
  v7 = objc_retainAutorelease(v3);
  objc_msgSend(v6, "setPath:", objc_msgSend(v7, "CGPath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_mainImageView, "layer"));
  objc_msgSend(v8, "setMask:", v6);

}

- (CGSize)intrinsicContentSize
{
  double userImageExtensionPastMainImage;
  double v3;
  double v4;
  CGSize result;

  userImageExtensionPastMainImage = self->_userImageExtensionPastMainImage;
  v3 = self->_mainImageSize.width + userImageExtensionPastMainImage * 2.0;
  v4 = userImageExtensionPastMainImage + self->_mainImageSize.height;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainImage, 0);
  objc_storeStrong((id *)&self->_userImageView, 0);
  objc_storeStrong((id *)&self->_mainImageView, 0);
}

@end
