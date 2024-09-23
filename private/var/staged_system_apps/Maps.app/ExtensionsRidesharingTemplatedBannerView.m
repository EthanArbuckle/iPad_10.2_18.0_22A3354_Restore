@implementation ExtensionsRidesharingTemplatedBannerView

- (ExtensionsRidesharingTemplatedBannerView)initWithCoder:(id)a3
{
  ExtensionsRidesharingTemplatedBannerView *v3;
  ExtensionsRidesharingTemplatedBannerView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ExtensionsRidesharingTemplatedBannerView;
  v3 = -[ExtensionsRidesharingTemplatedBannerView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[ExtensionsRidesharingTemplatedBannerView _commonInit](v3, "_commonInit");
  return v4;
}

- (ExtensionsRidesharingTemplatedBannerView)initWithFrame:(CGRect)a3
{
  ExtensionsRidesharingTemplatedBannerView *v3;
  ExtensionsRidesharingTemplatedBannerView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ExtensionsRidesharingTemplatedBannerView;
  v3 = -[ExtensionsRidesharingTemplatedBannerView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[ExtensionsRidesharingTemplatedBannerView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  UIImageView *v3;
  UIImageView *appIconImageView;
  UILabel *v5;
  UILabel *primaryLabel;
  UILabel *v7;
  UILabel *secondaryLabel;
  void *v9;
  void *v10;
  void *v11;

  -[ExtensionsRidesharingTemplatedBannerView setLeftHairlineInset:](self, "setLeftHairlineInset:", 16.0);
  -[ExtensionsRidesharingTemplatedBannerView setRightHairlineInset:](self, "setRightHairlineInset:", 0.0);
  v3 = (UIImageView *)objc_alloc_init((Class)UIImageView);
  appIconImageView = self->_appIconImageView;
  self->_appIconImageView = v3;

  -[UIImageView setAlpha:](self->_appIconImageView, "setAlpha:", 0.100000001);
  v5 = (UILabel *)objc_alloc_init((Class)UILabel);
  primaryLabel = self->_primaryLabel;
  self->_primaryLabel = v5;

  v7 = (UILabel *)objc_alloc_init((Class)UILabel);
  secondaryLabel = self->_secondaryLabel;
  self->_secondaryLabel = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  -[UILabel setTextColor:](self->_primaryLabel, "setTextColor:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.5));
  -[UILabel setTextColor:](self->_secondaryLabel, "setTextColor:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.899999976, 1.0));
  -[ExtensionsRidesharingTemplatedBannerView setBackgroundColor:](self, "setBackgroundColor:", v11);

  -[ExtensionsRidesharingTemplatedBannerView addSubview:](self, "addSubview:", self->_appIconImageView);
  -[ExtensionsRidesharingTemplatedBannerView addSubview:](self, "addSubview:", self->_primaryLabel);
  -[ExtensionsRidesharingTemplatedBannerView addSubview:](self, "addSubview:", self->_secondaryLabel);
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", self->_primaryLabel, &stru_1011E7A78);
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", self->_secondaryLabel, &stru_1011E7A78);
  -[ExtensionsRidesharingTemplatedBannerView _updateConstraints](self, "_updateConstraints");
}

- (void)_updateConstraints
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
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
  _QWORD v50[13];

  -[ExtensionsRidesharingTemplatedBannerView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_appIconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_primaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_secondaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v3) = 1148846080;
  -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_appIconImageView, "setContentCompressionResistancePriority:forAxis:", 1, v3);
  LODWORD(v4) = 1148846080;
  -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_appIconImageView, "setContentCompressionResistancePriority:forAxis:", 0, v4);
  LODWORD(v5) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_primaryLabel, "setContentCompressionResistancePriority:forAxis:", 1, v5);
  LODWORD(v6) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_secondaryLabel, "setContentCompressionResistancePriority:forAxis:", 1, v6);
  v7 = objc_alloc_init((Class)UILayoutGuide);
  -[ExtensionsRidesharingTemplatedBannerView addLayoutGuide:](self, "addLayoutGuide:", v7);
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "centerYAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsRidesharingTemplatedBannerView centerYAnchor](self, "centerYAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v48));
  v50[0] = v47;
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "centerXAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsRidesharingTemplatedBannerView centerXAnchor](self, "centerXAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v45));
  v50[1] = v44;
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsRidesharingTemplatedBannerView layoutMarginsGuide](self, "layoutMarginsGuide"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "topAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintGreaterThanOrEqualToAnchor:constant:", v41, 12.0));
  v50[2] = v40;
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsRidesharingTemplatedBannerView layoutMarginsGuide](self, "layoutMarginsGuide"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "bottomAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintLessThanOrEqualToAnchor:constant:", v37, -12.0));
  v50[3] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](self->_appIconImageView, "topAnchor"));
  v32 = v7;
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v34));
  v50[4] = v33;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_appIconImageView, "heightAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToConstant:", 60.0));
  v50[5] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_appIconImageView, "widthAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_appIconImageView, "heightAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:multiplier:", v28, 1.0));
  v50[6] = v27;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_primaryLabel, "firstBaselineAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](self->_appIconImageView, "bottomAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", v25, 26.0));
  v50[7] = v24;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_secondaryLabel, "firstBaselineAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_primaryLabel, "lastBaselineAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v22, 20.0));
  v50[8] = v21;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_secondaryLabel, "lastBaselineAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v19));
  v50[9] = v18;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsRidesharingTemplatedBannerView centerXAnchor](self, "centerXAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](self->_appIconImageView, "centerXAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
  v50[10] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsRidesharingTemplatedBannerView centerXAnchor](self, "centerXAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](self->_primaryLabel, "centerXAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
  v50[11] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsRidesharingTemplatedBannerView centerXAnchor](self, "centerXAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](self->_secondaryLabel, "centerXAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));
  v50[12] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v50, 13));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = UIViewNoIntrinsicMetric;
  v3 = 145.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setAppIcon:(id)a3
{
  id v4;
  UIImage *desaturatedAppIcon;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  CGImage *v13;
  UIImage *v14;
  UIImage *v15;
  UIImageView *appIconImageView;
  CIContextOption v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[2];

  v4 = a3;
  if (v4)
  {
    desaturatedAppIcon = self->_desaturatedAppIcon;
    if (!desaturatedAppIcon)
    {
      v6 = objc_msgSend(objc_alloc((Class)CIImage), "initWithImage:", v4);
      v19[0] = kCIInputImageKey;
      v19[1] = kCIInputSaturationKey;
      v20[0] = v6;
      v20[1] = &off_101274C98;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 2));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[CIFilter filterWithName:withInputParameters:](CIFilter, "filterWithName:withInputParameters:", CFSTR("CIColorControls"), v7));

      v9 = objc_alloc((Class)CIContext);
      v17 = kCIContextUseSoftwareRenderer;
      v18 = &__kCFBooleanFalse;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
      v11 = objc_msgSend(v9, "initWithOptions:", v10);

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "outputImage"));
      objc_msgSend(v12, "extent");
      v13 = (CGImage *)objc_msgSend(v11, "createCGImage:fromRect:", v12);
      v14 = (UIImage *)objc_msgSend(objc_alloc((Class)UIImage), "initWithCGImage:", v13);
      v15 = self->_desaturatedAppIcon;
      self->_desaturatedAppIcon = v14;

      CGImageRelease(v13);
      desaturatedAppIcon = self->_desaturatedAppIcon;
    }
    appIconImageView = self->_appIconImageView;
  }
  else
  {
    appIconImageView = self->_appIconImageView;
    desaturatedAppIcon = 0;
  }
  -[UIImageView setImage:](appIconImageView, "setImage:", desaturatedAppIcon);

}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_primaryLabel, a3);
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_desaturatedAppIcon, 0);
  objc_storeStrong((id *)&self->_appIconImageView, 0);
}

@end
