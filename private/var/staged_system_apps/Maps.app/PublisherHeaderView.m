@implementation PublisherHeaderView

- (PublisherHeaderView)initWithDelegate:(id)a3 usingPublisherAttribution:(id)a4 usingAnalyticsManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  PublisherHeaderView *v11;
  PublisherHeaderView *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PublisherHeaderView;
  v11 = -[PublisherHeaderView initWithFrame:](&v14, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    objc_storeStrong((id *)&v12->_attribution, a4);
    objc_storeStrong((id *)&v12->_analyticsManager, a5);
    v12->_isMarzipan = sub_1002A8AA0(v12) == 5;
    -[PublisherHeaderView setAccessibilityIdentifier:](v12, "setAccessibilityIdentifier:", CFSTR("PublisherHeader"));
    -[PublisherHeaderView setupSubviews](v12, "setupSubviews");
  }

  return v12;
}

- (void)resetLogoHeight
{
  double v3;
  double v4;
  double v5;
  void *v6;
  id v7;

  if (-[PublisherHeaderView isMarzipan](self, "isMarzipan"))
    v3 = 3.45714286;
  else
    v3 = 2.45454545;
  -[PublisherHeaderView maximumRequiredHeight](self, "maximumRequiredHeight");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherLogoImageViewHeightConstraint](self, "publisherLogoImageViewHeightConstraint"));
  objc_msgSend(v6, "setConstant:", v5);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherLogoImageViewWidthConstraint](self, "publisherLogoImageViewWidthConstraint"));
  objc_msgSend(v7, "setConstant:", v5 * v3);

}

- (void)headerHeightChangedWithNewYOffset:(double)a3
{
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  id v19;

  if (-[PublisherHeaderView isMarzipan](self, "isMarzipan"))
    v5 = 3.45714286;
  else
    v5 = 2.45454545;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherLogoImageViewHeightConstraint](self, "publisherLogoImageViewHeightConstraint"));
  objc_msgSend(v6, "constant");
  v8 = v7 - a3;

  -[PublisherHeaderView maximumRequiredHeight](self, "maximumRequiredHeight");
  v10 = v9;
  -[PublisherHeaderView minimumRequiredHeight](self, "minimumRequiredHeight");
  if (v8 <= v10)
  {
    v15 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherLogoImageViewHeightConstraint](self, "publisherLogoImageViewHeightConstraint"));
    v13 = v12;
    if (v8 >= v15)
      v14 = v8;
    else
      v14 = v15;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherLogoImageViewHeightConstraint](self, "publisherLogoImageViewHeightConstraint"));
    v13 = v12;
    v14 = v10;
  }
  objc_msgSend(v12, "setConstant:", v14);

  v19 = (id)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherLogoImageViewHeightConstraint](self, "publisherLogoImageViewHeightConstraint"));
  objc_msgSend(v19, "constant");
  v17 = v5 * v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherLogoImageViewWidthConstraint](self, "publisherLogoImageViewWidthConstraint"));
  objc_msgSend(v18, "setConstant:", v17);

}

- (void)adjustLogoImageViewTopConstraint:(double)a3
{
  id v5;

  if (!-[PublisherHeaderView isMarzipan](self, "isMarzipan"))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherLogoImageViewTopConstraint](self, "publisherLogoImageViewTopConstraint"));
    objc_msgSend(v5, "setConstant:", a3 * 3.0 / 5.0 + -36.0);

  }
}

- (double)maximumRequiredHeight
{
  unsigned int v2;
  double result;

  v2 = -[PublisherHeaderView isMarzipan](self, "isMarzipan");
  result = 110.0;
  if (v2)
    return 79.0;
  return result;
}

- (double)minimumRequiredHeight
{
  unsigned int v2;
  double result;

  v2 = -[PublisherHeaderView isMarzipan](self, "isMarzipan");
  result = 60.0;
  if (v2)
    return 59.0;
  return result;
}

- (void)setupSubviews
{
  void *v3;

  -[PublisherHeaderView setClipsToBounds:](self, "setClipsToBounds:", 1);
  -[PublisherHeaderView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", _UISheetCornerRadius);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView layer](self, "layer"));
  objc_msgSend(v3, "setMaskedCorners:", 3);

  -[PublisherHeaderView setupHeaderContainerView](self, "setupHeaderContainerView");
  -[PublisherHeaderView setupStackView](self, "setupStackView");
  -[PublisherHeaderView setupConstraints](self, "setupConstraints");
}

- (void)setupStackView
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
  id v14;

  v3 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[PublisherHeaderView setPublisherLogoImageView:](self, "setPublisherLogoImageView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherLogoImageView](self, "publisherLogoImageView"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherLogoImageView](self, "publisherLogoImageView"));
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherLogoImageView](self, "publisherLogoImageView"));
  objc_msgSend(v7, "setAccessibilityIgnoresInvertColors:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherLogoImageView](self, "publisherLogoImageView"));
  objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("PublisherHeaderLogo"));

  -[PublisherHeaderView updateImage](self, "updateImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView attribution](self, "attribution"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "displayName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherLogoImageView](self, "publisherLogoImageView"));
  objc_msgSend(v11, "setAccessibilityLabel:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherLogoImageView](self, "publisherLogoImageView"));
  objc_msgSend(v12, "setContentMode:", 1);

  v14 = (id)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherHeaderView](self, "publisherHeaderView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherLogoImageView](self, "publisherLogoImageView"));
  objc_msgSend(v14, "addSubview:", v13);

}

- (void)updateImage
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
  objc_msgSend(v3, "screenScale");
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView attribution](self, "attribution"));
  v9 = v8;
  if (v7 == (id)2)
    v10 = objc_msgSend(v8, "logoCenteredIdentifier");
  else
    v10 = objc_msgSend(v8, "logoCenteredColorizedIdentifier");
  v12 = (id)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForIconID:contentScale:sizeGroup:nightMode:](MKIconManager, "imageForIconID:contentScale:sizeGroup:nightMode:", v10, 1, 0, v5));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherLogoImageView](self, "publisherLogoImageView"));
  objc_msgSend(v11, "setImage:", v12);

}

- (void)setupHeaderContainerView
{
  ContainerHeaderView *v3;
  PublisherHeaderViewActionManager *v4;
  GEOCollectionPublisherAttribution *attribution;
  id WeakRetained;
  PublisherHeaderViewActionManager *v7;
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
  id v20;

  v3 = -[ContainerHeaderView initWithCardButtonType:]([ContainerHeaderView alloc], "initWithCardButtonType:", 0);
  -[PublisherHeaderView setPublisherHeaderView:](self, "setPublisherHeaderView:", v3);

  v4 = [PublisherHeaderViewActionManager alloc];
  attribution = self->_attribution;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = -[PublisherHeaderViewActionManager initWithAttribution:withActionsDelegate:usingAnalyticsManager:shouldHideAppIcon:](v4, "initWithAttribution:withActionsDelegate:usingAnalyticsManager:shouldHideAppIcon:", attribution, WeakRetained, self->_analyticsManager, self->_isMarzipan);
  -[PublisherHeaderView setActionManager:](self, "setActionManager:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherHeaderView](self, "publisherHeaderView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_headerTapGesture"));
  objc_msgSend(v9, "setCancelsTouchesInView:", 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherHeaderView](self, "publisherHeaderView"));
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherHeaderView](self, "publisherHeaderView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v11, "setBackgroundColor:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherHeaderView](self, "publisherHeaderView"));
  objc_msgSend(v13, "setHeaderSize:", 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherHeaderView](self, "publisherHeaderView"));
  objc_msgSend(v14, "setDelegate:", self);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherHeaderView](self, "publisherHeaderView"));
  objc_msgSend(v15, "setHairLineAlpha:", 0.0);

  if (sub_1002A8AA0(self) == 5)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherHeaderView](self, "publisherHeaderView"));
    objc_msgSend(v16, "setAccessoryViewInsets:", 0.0, 0.0, 0.0, 15.0);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView actionManager](self, "actionManager"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "headerEllipsis"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherHeaderView](self, "publisherHeaderView"));
    objc_msgSend(v19, "setAccessoryView:", v18);

  }
  v20 = (id)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherHeaderView](self, "publisherHeaderView"));
  -[PublisherHeaderView addSubview:](self, "addSubview:", v20);

}

- (void)setupConstraints
{
  void *v3;
  void *v4;
  unsigned int v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[8];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherLogoImageView](self, "publisherLogoImageView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "heightAnchor"));
  v5 = -[PublisherHeaderView isMarzipan](self, "isMarzipan");
  v6 = 110.0;
  if (v5)
    v6 = 70.0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintLessThanOrEqualToConstant:", v6));
  -[PublisherHeaderView setPublisherLogoImageViewHeightConstraint:](self, "setPublisherLogoImageViewHeightConstraint:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherLogoImageView](self, "publisherLogoImageView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "widthAnchor"));
  v10 = -[PublisherHeaderView isMarzipan](self, "isMarzipan");
  v11 = 270.0;
  if (v10)
    v11 = 242.0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintLessThanOrEqualToConstant:", v11));
  -[PublisherHeaderView setPublisherLogoImageViewWidthConstraint:](self, "setPublisherLogoImageViewWidthConstraint:", v12);

  if (!-[PublisherHeaderView isMarzipan](self, "isMarzipan"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherLogoImageView](self, "publisherLogoImageView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView topAnchor](self, "topAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 30.0));
    -[PublisherHeaderView setPublisherLogoImageViewTopConstraint:](self, "setPublisherLogoImageViewTopConstraint:", v16);

  }
  v17 = objc_alloc_init((Class)NSMutableArray);
  if (-[PublisherHeaderView isMarzipan](self, "isMarzipan"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherLogoImageView](self, "publisherLogoImageView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "centerYAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView centerYAnchor](self, "centerYAnchor"));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));

  }
  else
  {
    v21 = objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherLogoImageViewTopConstraint](self, "publisherLogoImageViewTopConstraint"));
  }
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherLogoImageView](self, "publisherLogoImageView"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "centerXAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView centerXAnchor](self, "centerXAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v48));
  v53[0] = v47;
  v53[1] = v21;
  v51 = (void *)v21;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherLogoImageViewHeightConstraint](self, "publisherLogoImageViewHeightConstraint"));
  v53[2] = v46;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherLogoImageViewWidthConstraint](self, "publisherLogoImageViewWidthConstraint"));
  v53[3] = v45;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherHeaderView](self, "publisherHeaderView"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "leadingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView leadingAnchor](self, "leadingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v42));
  v53[4] = v41;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherHeaderView](self, "publisherHeaderView"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "trailingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView trailingAnchor](self, "trailingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v38));
  v53[5] = v37;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherHeaderView](self, "publisherHeaderView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "topAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView topAnchor](self, "topAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));
  v53[6] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherHeaderView](self, "publisherHeaderView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bottomAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView bottomAnchor](self, "bottomAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v27));
  v53[7] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v53, 8));
  objc_msgSend(v17, "addObjectsFromArray:", v29);

  if (-[PublisherHeaderView isMarzipan](self, "isMarzipan"))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherLogoImageView](self, "publisherLogoImageView"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "topAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView publisherHeaderView](self, "publisherHeaderView"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "topAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v33, 9.0));
    v52 = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v52, 1));
    objc_msgSend(v17, "addObjectsFromArray:", v35);

  }
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PublisherHeaderView;
  v4 = a3;
  -[PublisherHeaderView traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v5 = objc_msgSend(v4, "userInterfaceStyle", v8.receiver, v8.super_class);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
    -[PublisherHeaderView updateImage](self, "updateImage");
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView delegate](self, "delegate"));
  objc_msgSend(v6, "didTapClose:", v5);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[PublisherHeaderView analyticsManager](self, "analyticsManager"));
  objc_msgSend(v7, "publisherHeaderCloseButtonTapped");

}

- (PublisherHeaderViewActionManager)actionManager
{
  return self->_actionManager;
}

- (void)setActionManager:(id)a3
{
  objc_storeStrong((id *)&self->_actionManager, a3);
}

- (PublisherHeaderViewDelegate)delegate
{
  return (PublisherHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (GEOCollectionPublisherAttribution)attribution
{
  return self->_attribution;
}

- (void)setAttribution:(id)a3
{
  objc_storeStrong((id *)&self->_attribution, a3);
}

- (PublisherAnalytics)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (ContainerHeaderView)publisherHeaderView
{
  return self->_publisherHeaderView;
}

- (void)setPublisherHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_publisherHeaderView, a3);
}

- (UIImageView)publisherLogoImageView
{
  return self->_publisherLogoImageView;
}

- (void)setPublisherLogoImageView:(id)a3
{
  objc_storeStrong((id *)&self->_publisherLogoImageView, a3);
}

- (BOOL)isMarzipan
{
  return self->_isMarzipan;
}

- (void)setIsMarzipan:(BOOL)a3
{
  self->_isMarzipan = a3;
}

- (NSLayoutConstraint)publisherLogoImageViewTopConstraint
{
  return self->_publisherLogoImageViewTopConstraint;
}

- (void)setPublisherLogoImageViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_publisherLogoImageViewTopConstraint, a3);
}

- (NSLayoutConstraint)publisherLogoImageViewHeightConstraint
{
  return self->_publisherLogoImageViewHeightConstraint;
}

- (void)setPublisherLogoImageViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_publisherLogoImageViewHeightConstraint, a3);
}

- (NSLayoutConstraint)publisherLogoImageViewWidthConstraint
{
  return self->_publisherLogoImageViewWidthConstraint;
}

- (void)setPublisherLogoImageViewWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_publisherLogoImageViewWidthConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherLogoImageViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_publisherLogoImageViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_publisherLogoImageViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_publisherLogoImageView, 0);
  objc_storeStrong((id *)&self->_publisherHeaderView, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_actionManager, 0);
}

@end
