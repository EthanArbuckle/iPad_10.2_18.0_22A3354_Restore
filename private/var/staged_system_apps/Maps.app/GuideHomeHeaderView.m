@implementation GuideHomeHeaderView

- (GuideHomeHeaderView)initWithFrame:(CGRect)a3
{
  GuideHomeHeaderView *v3;
  GuideHomeHeaderView *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GuideHomeHeaderView;
  v3 = -[GuideHomeHeaderView initWithFrame:](&v10, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (objc_class *)objc_opt_class(v3);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[GuideHomeHeaderView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v7);

    -[GuideHomeHeaderView setupSubviews](v4, "setupSubviews");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v4, "contentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v4;
}

+ (double)maximumCollectionImageHeight
{
  return 390.0;
}

+ (double)maximumRequiredHeightWithFeaturedGuideTitle:(id)a3 maxWidth:(double)a4
{
  double v4;
  double v5;
  double v6;

  objc_msgSend(a3, "boundingRectWithSize:options:context:", 1, 0, a4 + -32.0, 1.79769313e308);
  v5 = v4;
  +[GuideHomeHeaderView maximumCollectionImageHeight](GuideHomeHeaderView, "maximumCollectionImageHeight");
  return v6 + v5 + 20.0 + 50.0 + 24.0;
}

+ (double)minimumRequiredHeight
{
  return 95.0;
}

- (void)configureWithGuidesHomeHeaderViewModel:(id)a3 maxWidth:(double)a4 delegate:(id)a5
{
  id v8;
  id v9;
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
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[2];
  _QWORD v39[2];

  v8 = a3;
  v9 = a5;
  -[GuideHomeHeaderView setMaxWidth:](self, "setMaxWidth:", a4);
  -[GuideHomeHeaderView setViewModel:](self, "setViewModel:", v8);
  -[GuideHomeHeaderView setHeaderDelegate:](self, "setHeaderDelegate:", v9);

  -[GuideHomeHeaderView setupConstraints](self, "setupConstraints");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionLongTitle"));
  v11 = v10;
  if (!v10)
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionTitle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView collectionLabel](self, "collectionLabel"));
  objc_msgSend(v12, "setAttributedText:", v11);

  if (!v10)
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView viewModel](self, "viewModel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "backgroundColor"));
  -[GuideHomeHeaderView setBackgroundColor:](self, "setBackgroundColor:", v14);

  -[GuideHomeHeaderView displayEditorsPickLabel](self, "displayEditorsPickLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView topGradientView](self, "topGradientView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "gradientLayer"));
  objc_msgSend(v16, "setStartPoint:", 0.5, 0.0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView topGradientView](self, "topGradientView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "gradientLayer"));
  objc_msgSend(v18, "setEndPoint:", 0.5, 1.0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "colorWithAlphaComponent:", 0.5)));
  v39[0] = objc_msgSend(v20, "CGColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "colorWithAlphaComponent:", 0.0)));
  v39[1] = objc_msgSend(v22, "CGColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v39, 2));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView topGradientView](self, "topGradientView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "gradientLayer"));
  objc_msgSend(v25, "setColors:", v23);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView bottomGradientView](self, "bottomGradientView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "gradientLayer"));
  objc_msgSend(v27, "setStartPoint:", 0.5, 0.0);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView bottomGradientView](self, "bottomGradientView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "gradientLayer"));
  objc_msgSend(v29, "setEndPoint:", 0.5, 1.0);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView viewModel](self, "viewModel"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "backgroundColor"));
  v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "colorWithAlphaComponent:", 0.0)));
  v38[0] = objc_msgSend(v32, "CGColor");
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView viewModel](self, "viewModel"));
  v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "backgroundColor")));
  v38[1] = objc_msgSend(v34, "CGColor");
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 2));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView bottomGradientView](self, "bottomGradientView"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "gradientLayer"));
  objc_msgSend(v37, "setColors:", v35);

  -[GuideHomeHeaderView setImageMetadataUsingWidth:](self, "setImageMetadataUsingWidth:", a4);
  -[GuideHomeHeaderView addOpenGuideButton](self, "addOpenGuideButton");

}

- (void)didChangeContentYOffset:(double)a3
{
  void *v3;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  CGAffineTransform *v23;
  CGAffineTransform v24;
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  _QWORD v28[6];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView publisherLogoImageView](self, "publisherLogoImageView"));
  objc_msgSend(v6, "frame");
  v8 = a3 / v7;

  v9 = fmin(fmax(1.0 - v8, 0.0), 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView publisherLogoImageView](self, "publisherLogoImageView"));
  objc_msgSend(v10, "setAlpha:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView metadataStackView](self, "metadataStackView"));
  objc_msgSend(v11, "setAlpha:", v9);

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100564A04;
  v28[3] = &unk_1011AD518;
  v28[4] = self;
  *(double *)&v28[5] = v8;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v28, 0.2);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView collectionImageView](self, "collectionImageView"));
  objc_msgSend(v12, "setAlpha:", v9);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView topGradientView](self, "topGradientView"));
  objc_msgSend(v13, "setAlpha:", v9);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView contentView](self, "contentView"));
  objc_msgSend(v14, "setAlpha:", v9);

  if (a3 >= 0.0)
  {
    CGAffineTransformMakeScale(&v25, 1.0, 1.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView collectionImageView](self, "collectionImageView"));
    v22 = v21;
    v24 = v25;
    v23 = &v24;
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView viewModel](self, "viewModel"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "collectionLongTitle"));
    v17 = v16;
    if (!v16)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView viewModel](self, "viewModel"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionTitle"));
    }
    -[GuideHomeHeaderView maxWidth](self, "maxWidth");
    +[GuideHomeHeaderView maximumRequiredHeightWithFeaturedGuideTitle:maxWidth:](GuideHomeHeaderView, "maximumRequiredHeightWithFeaturedGuideTitle:maxWidth:", v17);
    v19 = v18;
    if (!v16)
    {

    }
    v20 = fabs(a3) / v19 + 1.0;
    if (v20 < 0.0)
      v20 = 0.0;
    CGAffineTransformMakeScale(&v27, v20, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView collectionImageView](self, "collectionImageView"));
    v22 = v21;
    v26 = v27;
    v23 = &v26;
  }
  objc_msgSend(v21, "setTransform:", v23, *(_OWORD *)&v24.a, *(_OWORD *)&v24.c, *(_OWORD *)&v24.tx);

}

- (void)displayEditorsPickLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
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
  _QWORD v44[6];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView editorPickLabel](self, "editorPickLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attributedText"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView viewModel](self, "viewModel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sectionTitle"));
  v7 = objc_msgSend(v4, "isEqualToAttributedString:", v6);

  if ((v7 & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView editorPickView](self, "editorPickView"));
    objc_msgSend(v8, "setHidden:", 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView viewModel](self, "viewModel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sectionTitle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView editorPickLabel](self, "editorPickLabel"));
    objc_msgSend(v11, "setAttributedText:", v10);

    -[GuideHomeHeaderView sizeForEditorsPickLabel](self, "sizeForEditorsPickLabel");
    v13 = v12;
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView editorPickView](self, "editorPickView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView contentView](self, "contentView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v19));
    -[GuideHomeHeaderView setEditorsPickTopConstraint:](self, "setEditorsPickTopConstraint:", v20);

    -[GuideHomeHeaderView updateEditorsPickTop](self, "updateEditorsPickTop");
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView editorPickLabel](self, "editorPickLabel"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "centerXAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView editorPickView](self, "editorPickView"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "centerXAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
    v44[0] = v39;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView editorPickLabel](self, "editorPickLabel"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "centerYAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView editorPickView](self, "editorPickView"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "centerYAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v35));
    v44[1] = v34;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView editorsPickTopConstraint](self, "editorsPickTopConstraint"));
    v44[2] = v33;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView editorPickView](self, "editorPickView"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "leadingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView contentView](self, "contentView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leadingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v22, 16.0));
    v44[3] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView editorPickView](self, "editorPickView"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "heightAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToConstant:", v15));
    v44[4] = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView editorPickView](self, "editorPickView"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "widthAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToConstant:", v13));
    v44[5] = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v44, 6));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v30);

  }
}

- (void)updateEditorsPickTop
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17Bold](UIFont, "system17Bold"));
  objc_msgSend(v3, "_scaledValueForValue:useLanguageAwareScaling:", 1, 24.0);
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17Bold](UIFont, "system17Bold"));
  objc_msgSend(v6, "lineHeight");
  v8 = v5 + v7 + 48.0;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView editorsPickTopConstraint](self, "editorsPickTopConstraint"));
  objc_msgSend(v9, "setConstant:", v8);

}

- (void)setImageMetadataUsingWidth:(double)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView logoWidthConstraint](self, "logoWidthConstraint"));
  objc_msgSend(v5, "setActive:", 0);

  -[GuideHomeHeaderView setLogoWidthConstraint:](self, "setLogoWidthConstraint:", 0);
  objc_initWeak(&location, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView viewModel](self, "viewModel"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1005650C0;
  v17[3] = &unk_1011ADDF0;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v6, "publisherLogoImageWithCompletion:", v17);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView collectionImageView](self, "collectionImageView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "image"));
  if (v8)
  {

LABEL_5:
    goto LABEL_6;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView viewModel](self, "viewModel"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView viewModel](self, "viewModel"));
    +[GuideHomeHeaderView maximumCollectionImageHeight](GuideHomeHeaderView, "maximumCollectionImageHeight");
    v13 = v12;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100565230;
    v14[3] = &unk_1011BB438;
    objc_copyWeak(&v16, &location);
    v7 = v10;
    v15 = v7;
    objc_msgSend(v11, "collectionImageForSize:onCompletion:", v14, a3, v13);

    objc_destroyWeak(&v16);
    goto LABEL_5;
  }
LABEL_6:
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)setupSubviews
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init((Class)UIView);
  -[GuideHomeHeaderView setContentView:](self, "setContentView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView contentView](self, "contentView"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView contentView](self, "contentView"));
  objc_msgSend(v6, "setBackgroundColor:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("GuideHomeHeader"), "stringByAppendingString:", CFSTR("Content")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView contentView](self, "contentView"));
  objc_msgSend(v8, "setAccessibilityIdentifier:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView contentView](self, "contentView"));
  -[GuideHomeHeaderView addSubview:](self, "addSubview:", v9);

  -[GuideHomeHeaderView setupGradientAndImageContainerView](self, "setupGradientAndImageContainerView");
  -[GuideHomeHeaderView addPublisherLogoImage](self, "addPublisherLogoImage");
  -[GuideHomeHeaderView setupStackView](self, "setupStackView");
  -[GuideHomeHeaderView setupEditorsPickView](self, "setupEditorsPickView");
}

- (void)setupGuideImageView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[GuideHomeHeaderView setCollectionImageView:](self, "setCollectionImageView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView collectionImageView](self, "collectionImageView"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView collectionImageView](self, "collectionImageView"));
  objc_msgSend(v5, "setAccessibilityIgnoresInvertColors:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("GuideHomeHeader"), "stringByAppendingString:", CFSTR("CollectionImage")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView collectionImageView](self, "collectionImageView"));
  objc_msgSend(v7, "setAccessibilityIdentifier:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView collectionImageView](self, "collectionImageView"));
  objc_msgSend(v8, "setContentMode:", 2);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView gradientAndImageContainerView](self, "gradientAndImageContainerView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView collectionImageView](self, "collectionImageView"));
  objc_msgSend(v10, "addSubview:", v9);

}

- (void)setupGradientAndImageContainerView
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

  v3 = objc_alloc_init((Class)UIView);
  -[GuideHomeHeaderView setGradientAndImageContainerView:](self, "setGradientAndImageContainerView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView gradientAndImageContainerView](self, "gradientAndImageContainerView"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView gradientAndImageContainerView](self, "gradientAndImageContainerView"));
  objc_msgSend(v6, "setBackgroundColor:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView gradientAndImageContainerView](self, "gradientAndImageContainerView"));
  objc_msgSend(v7, "setClipsToBounds:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("GuideHomeHeader"), "stringByAppendingString:", CFSTR("GradientAndImageContainer")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView gradientAndImageContainerView](self, "gradientAndImageContainerView"));
  objc_msgSend(v9, "setAccessibilityIdentifier:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView contentView](self, "contentView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView gradientAndImageContainerView](self, "gradientAndImageContainerView"));
  objc_msgSend(v10, "addSubview:", v11);

  -[GuideHomeHeaderView setupGuideImageView](self, "setupGuideImageView");
  -[GuideHomeHeaderView setupBottomGradient](self, "setupBottomGradient");
  -[GuideHomeHeaderView setupTopGradient](self, "setupTopGradient");
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

  v3 = objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[GuideHomeHeaderView setMetadataStackView:](self, "setMetadataStackView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView metadataStackView](self, "metadataStackView"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView metadataStackView](self, "metadataStackView"));
  objc_msgSend(v5, "setAxis:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView metadataStackView](self, "metadataStackView"));
  objc_msgSend(v6, "setDistribution:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView metadataStackView](self, "metadataStackView"));
  objc_msgSend(v7, "setAlignment:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView metadataStackView](self, "metadataStackView"));
  objc_msgSend(v8, "setSpacing:", 20.0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("GuideHomeHeader"), "stringByAppendingString:", CFSTR("MetadataStack")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView metadataStackView](self, "metadataStackView"));
  objc_msgSend(v10, "setAccessibilityIdentifier:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView contentView](self, "contentView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView metadataStackView](self, "metadataStackView"));
  objc_msgSend(v11, "addSubview:", v12);

  -[GuideHomeHeaderView addCollectionNameView](self, "addCollectionNameView");
}

- (CGSize)sizeForEditorsPickLabel
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView editorPickLabel](self, "editorPickLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attributedText"));
  objc_msgSend(v4, "size");
  v6 = v5;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView editorPickView](self, "editorPickView"));
  objc_msgSend(v9, "_setContinuousCornerRadius:", 4.0);

  v10 = v6 + 8.0 + 8.0;
  v11 = v8 + 3.0 + 3.0;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)setupEditorsPickView
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
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v29 = (id)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithBlurRadius:](UIBlurEffect, "effectWithBlurRadius:", 10.0));
  v3 = objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", v29);
  -[GuideHomeHeaderView setEditorPickView:](self, "setEditorPickView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView editorPickView](self, "editorPickView"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView editorPickView](self, "editorPickView"));
  objc_msgSend(v6, "setBackgroundColor:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "colorWithAlphaComponent:", 0.2));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView editorPickView](self, "editorPickView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentView"));
  objc_msgSend(v10, "setBackgroundColor:", v8);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("GuideHomeHeader"), "stringByAppendingString:", CFSTR("EditorPick")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView editorPickView](self, "editorPickView"));
  objc_msgSend(v12, "setAccessibilityIdentifier:", v11);

  v13 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[GuideHomeHeaderView setEditorPickLabel:](self, "setEditorPickLabel:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("GuideHomeHeader"), "stringByAppendingString:", CFSTR("EditorPickLabel")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView editorPickLabel](self, "editorPickLabel"));
  objc_msgSend(v15, "setAccessibilityIdentifier:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView editorPickLabel](self, "editorPickLabel"));
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView editorPickLabel](self, "editorPickLabel"));
  objc_msgSend(v18, "setTextColor:", v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView editorPickLabel](self, "editorPickLabel"));
  LODWORD(v20) = 1148846080;
  objc_msgSend(v19, "setContentCompressionResistancePriority:forAxis:", 0, v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView editorPickLabel](self, "editorPickLabel"));
  objc_msgSend(v21, "setNumberOfLines:", 1);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView editorPickLabel](self, "editorPickLabel"));
  objc_msgSend(v22, "setTextAlignment:", 1);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView editorPickView](self, "editorPickView"));
  objc_msgSend(v23, "setHidden:", 1);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView editorPickView](self, "editorPickView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "contentView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView editorPickLabel](self, "editorPickLabel"));
  objc_msgSend(v25, "addSubview:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView contentView](self, "contentView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView editorPickView](self, "editorPickView"));
  objc_msgSend(v27, "addSubview:", v28);

}

- (void)addPublisherLogoImage
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[GuideHomeHeaderView setPublisherLogoImageView:](self, "setPublisherLogoImageView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView publisherLogoImageView](self, "publisherLogoImageView"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView publisherLogoImageView](self, "publisherLogoImageView"));
  objc_msgSend(v5, "setAccessibilityIgnoresInvertColors:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("GuideHomeHeader"), "stringByAppendingString:", CFSTR("PublisherLogoImage")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView publisherLogoImageView](self, "publisherLogoImageView"));
  objc_msgSend(v7, "setAccessibilityIdentifier:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView publisherLogoImageView](self, "publisherLogoImageView"));
  objc_msgSend(v8, "setContentMode:", 1);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView contentView](self, "contentView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView publisherLogoImageView](self, "publisherLogoImageView"));
  objc_msgSend(v10, "addSubview:", v9);

}

- (void)addCollectionNameView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[GuideHomeHeaderView setCollectionLabel:](self, "setCollectionLabel:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView collectionLabel](self, "collectionLabel"));
  objc_msgSend(v5, "setTextColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView collectionLabel](self, "collectionLabel"));
  objc_msgSend(v6, "setNumberOfLines:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("GuideHomeHeader"), "stringByAppendingString:", CFSTR("CollectionLabel")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView collectionLabel](self, "collectionLabel"));
  objc_msgSend(v8, "setAccessibilityIdentifier:", v7);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView metadataStackView](self, "metadataStackView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView collectionLabel](self, "collectionLabel"));
  objc_msgSend(v10, "addArrangedSubview:", v9);

}

- (void)addOpenGuideButton
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
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
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  _QWORD v65[10];
  NSAttributedStringKey v66;
  void *v67;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView openGuideButton](self, "openGuideButton"));

  if (!v3)
  {
    v4 = objc_alloc_init((Class)UIView);
    -[GuideHomeHeaderView setButtonView:](self, "setButtonView:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView buttonView](self, "buttonView"));
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView buttonView](self, "buttonView"));
    objc_msgSend(v7, "setBackgroundColor:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView buttonView](self, "buttonView"));
    objc_msgSend(v8, "setUserInteractionEnabled:", 1);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("GuideHomeHeader"), "stringByAppendingString:", CFSTR("ButtonView")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView buttonView](self, "buttonView"));
    objc_msgSend(v10, "setAccessibilityIdentifier:", v9);

    v64 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 1));
    v11 = objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", v64);
    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v11, "_setContinuousCornerRadius:", 10.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView buttonView](self, "buttonView"));
    objc_msgSend(v12, "addSubview:", v11);

    v66 = NSFontAttributeName;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17Bold](UIFont, "system17Bold"));
    v67 = v13;
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1));

    v14 = objc_alloc((Class)NSAttributedString);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("[Guide Home View] Open Guide"), CFSTR("localized string not found"), 0));
    v62 = objc_msgSend(v14, "initWithString:attributes:", v16, v63);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v17, "setAttributedTitle:forState:", v62, 0);
    objc_msgSend(v17, "addTarget:action:forControlEvents:", self, "didTapOpenGuide:", 64);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "titleLabel"));
    objc_msgSend(v19, "setTextColor:", v18);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("GuideHomeHeader"), "stringByAppendingString:", CFSTR("Button")));
    objc_msgSend(v17, "setAccessibilityIdentifier:", v20);

    -[GuideHomeHeaderView setOpenGuideButton:](self, "setOpenGuideButton:", v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView buttonView](self, "buttonView"));
    objc_msgSend(v21, "addSubview:", v17);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView metadataStackView](self, "metadataStackView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView buttonView](self, "buttonView"));
    objc_msgSend(v22, "addArrangedSubview:", v23);

    -[GuideHomeHeaderView maxWidth](self, "maxWidth");
    v25 = v24 + -32.0;
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView buttonView](self, "buttonView"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "heightAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToConstant:", 50.0));
    v65[0] = v59;
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView buttonView](self, "buttonView"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "widthAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToConstant:", v25));
    v65[1] = v56;
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView buttonView](self, "buttonView"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "topAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:", v53));
    v65[2] = v52;
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView buttonView](self, "buttonView"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "leadingAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v49));
    v65[3] = v48;
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView buttonView](self, "buttonView"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "trailingAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v45));
    v44 = v11;
    v65[4] = v43;
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView buttonView](self, "buttonView"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "bottomAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
    v65[5] = v39;
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v37));
    v65[6] = v36;
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v26));
    v65[7] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v29));
    v65[8] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v32));
    v65[9] = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v65, 10));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v34);

  }
}

- (void)setupBottomGradient
{
  GradientView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = -[GradientView initWithFrame:]([GradientView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[GuideHomeHeaderView setBottomGradientView:](self, "setBottomGradientView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView bottomGradientView](self, "bottomGradientView"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView bottomGradientView](self, "bottomGradientView"));
  objc_msgSend(v6, "setBackgroundColor:", v5);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView gradientAndImageContainerView](self, "gradientAndImageContainerView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView bottomGradientView](self, "bottomGradientView"));
  objc_msgSend(v8, "addSubview:", v7);

}

- (void)setupTopGradient
{
  GradientView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = -[GradientView initWithFrame:]([GradientView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[GuideHomeHeaderView setTopGradientView:](self, "setTopGradientView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView topGradientView](self, "topGradientView"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView topGradientView](self, "topGradientView"));
  objc_msgSend(v6, "setBackgroundColor:", v5);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView gradientAndImageContainerView](self, "gradientAndImageContainerView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView topGradientView](self, "topGradientView"));
  objc_msgSend(v8, "addSubview:", v7);

}

- (void)setupConstraints
{
  void *v3;
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
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  _QWORD v130[27];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView constraints](self, "constraints"));
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    v129 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView gradientAndImageContainerView](self, "gradientAndImageContainerView"));
    v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "topAnchor"));
    v128 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView contentView](self, "contentView"));
    v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "topAnchor"));
    v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "constraintEqualToAnchor:", v126));
    v130[0] = v125;
    v124 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView gradientAndImageContainerView](self, "gradientAndImageContainerView"));
    v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "leadingAnchor"));
    v123 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView contentView](self, "contentView"));
    v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "leadingAnchor"));
    v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "constraintEqualToAnchor:", v121));
    v130[1] = v120;
    v119 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView gradientAndImageContainerView](self, "gradientAndImageContainerView"));
    v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "trailingAnchor"));
    v118 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView contentView](self, "contentView"));
    v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "trailingAnchor"));
    v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "constraintEqualToAnchor:", v116));
    v130[2] = v115;
    v114 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView gradientAndImageContainerView](self, "gradientAndImageContainerView"));
    v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "heightAnchor"));
    +[GuideHomeHeaderView maximumCollectionImageHeight](GuideHomeHeaderView, "maximumCollectionImageHeight");
    v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "constraintEqualToConstant:"));
    v130[3] = v112;
    v111 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView collectionImageView](self, "collectionImageView"));
    v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "topAnchor"));
    v110 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView gradientAndImageContainerView](self, "gradientAndImageContainerView"));
    v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "topAnchor"));
    v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "constraintEqualToAnchor:", v108));
    v130[4] = v107;
    v106 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView collectionImageView](self, "collectionImageView"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "leadingAnchor"));
    v105 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView gradientAndImageContainerView](self, "gradientAndImageContainerView"));
    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "leadingAnchor"));
    v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "constraintEqualToAnchor:", v103));
    v130[5] = v102;
    v101 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView collectionImageView](self, "collectionImageView"));
    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "trailingAnchor"));
    v100 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView gradientAndImageContainerView](self, "gradientAndImageContainerView"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "trailingAnchor"));
    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "constraintEqualToAnchor:", v98));
    v130[6] = v97;
    v96 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView collectionImageView](self, "collectionImageView"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "bottomAnchor"));
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView gradientAndImageContainerView](self, "gradientAndImageContainerView"));
    v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "bottomAnchor"));
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "constraintEqualToAnchor:", v93));
    v130[7] = v92;
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView bottomGradientView](self, "bottomGradientView"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "leadingAnchor"));
    v90 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView gradientAndImageContainerView](self, "gradientAndImageContainerView"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "leadingAnchor"));
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "constraintEqualToAnchor:", v88));
    v130[8] = v87;
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView bottomGradientView](self, "bottomGradientView"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "trailingAnchor"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView gradientAndImageContainerView](self, "gradientAndImageContainerView"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "trailingAnchor"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToAnchor:", v83));
    v130[9] = v82;
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView bottomGradientView](self, "bottomGradientView"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "bottomAnchor"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView gradientAndImageContainerView](self, "gradientAndImageContainerView"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "bottomAnchor"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "constraintEqualToAnchor:", v78));
    v130[10] = v77;
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView bottomGradientView](self, "bottomGradientView"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "heightAnchor"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToConstant:", 104.0));
    v130[11] = v74;
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView topGradientView](self, "topGradientView"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "leadingAnchor"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView gradientAndImageContainerView](self, "gradientAndImageContainerView"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "leadingAnchor"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToAnchor:", v70));
    v130[12] = v69;
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView topGradientView](self, "topGradientView"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "trailingAnchor"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView gradientAndImageContainerView](self, "gradientAndImageContainerView"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "trailingAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:", v65));
    v130[13] = v64;
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView topGradientView](self, "topGradientView"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "topAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView gradientAndImageContainerView](self, "gradientAndImageContainerView"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "topAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:", v60));
    v130[14] = v59;
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView topGradientView](self, "topGradientView"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "heightAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToConstant:", 242.0));
    v130[15] = v56;
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView publisherLogoImageView](self, "publisherLogoImageView"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "leadingAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView contentView](self, "contentView"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "leadingAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:constant:", v52, 16.0));
    v130[16] = v51;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView publisherLogoImageView](self, "publisherLogoImageView"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "bottomAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView metadataStackView](self, "metadataStackView"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "topAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v47));
    v130[17] = v46;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView publisherLogoImageView](self, "publisherLogoImageView"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "heightAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToConstant:", 40.0));
    v130[18] = v43;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView metadataStackView](self, "metadataStackView"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "leadingAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView contentView](self, "contentView"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "leadingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, 16.0));
    v130[19] = v38;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView metadataStackView](self, "metadataStackView"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "trailingAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView contentView](self, "contentView"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "trailingAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:constant:", v34, -16.0));
    v130[20] = v33;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView metadataStackView](self, "metadataStackView"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "topAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView contentView](self, "contentView"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "topAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintGreaterThanOrEqualToAnchor:", v29));
    v130[21] = v28;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView metadataStackView](self, "metadataStackView"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bottomAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView contentView](self, "contentView"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bottomAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v24, -24.0));
    v130[22] = v23;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView contentView](self, "contentView"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView topAnchor](self, "topAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
    v130[23] = v19;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView contentView](self, "contentView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView leadingAnchor](self, "leadingAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v16));
    v130[24] = v15;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView contentView](self, "contentView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView trailingAnchor](self, "trailingAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
    v130[25] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView contentView](self, "contentView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView bottomAnchor](self, "bottomAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
    v130[26] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v130, 27));
    -[GuideHomeHeaderView setConstraints:](self, "setConstraints:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView constraints](self, "constraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

  }
}

- (void)didTapOpenGuide:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView headerDelegate](self, "headerDelegate", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeHeaderView viewModel](self, "viewModel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "featuredGuide"));
  objc_msgSend(v6, "didSelectGuide:", v5);

}

- (GuidesHomeHeaderViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (GuideHomeHeaderViewActionDelegate)headerDelegate
{
  return (GuideHomeHeaderViewActionDelegate *)objc_loadWeakRetained((id *)&self->_headerDelegate);
}

- (void)setHeaderDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_headerDelegate, a3);
}

- (GEOPlaceCollection)featuredGuide
{
  return self->_featuredGuide;
}

- (void)setFeaturedGuide:(id)a3
{
  objc_storeStrong((id *)&self->_featuredGuide, a3);
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (void)setTitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_titleFont, a3);
}

- (NSLayoutConstraint)logoWidthConstraint
{
  return self->_logoWidthConstraint;
}

- (void)setLogoWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_logoWidthConstraint, a3);
}

- (NSLayoutConstraint)editorsPickTopConstraint
{
  return self->_editorsPickTopConstraint;
}

- (void)setEditorsPickTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_editorsPickTopConstraint, a3);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (UIStackView)metadataStackView
{
  return self->_metadataStackView;
}

- (void)setMetadataStackView:(id)a3
{
  objc_storeStrong((id *)&self->_metadataStackView, a3);
}

- (UIImageView)publisherLogoImageView
{
  return self->_publisherLogoImageView;
}

- (void)setPublisherLogoImageView:(id)a3
{
  objc_storeStrong((id *)&self->_publisherLogoImageView, a3);
}

- (UILabel)collectionLabel
{
  return self->_collectionLabel;
}

- (void)setCollectionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_collectionLabel, a3);
}

- (UILabel)editorPickLabel
{
  return self->_editorPickLabel;
}

- (void)setEditorPickLabel:(id)a3
{
  objc_storeStrong((id *)&self->_editorPickLabel, a3);
}

- (UIView)buttonView
{
  return self->_buttonView;
}

- (void)setButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonView, a3);
}

- (UIButton)openGuideButton
{
  return self->_openGuideButton;
}

- (void)setOpenGuideButton:(id)a3
{
  objc_storeStrong((id *)&self->_openGuideButton, a3);
}

- (UIImageView)collectionImageView
{
  return self->_collectionImageView;
}

- (void)setCollectionImageView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionImageView, a3);
}

- (UIView)gradientAndImageContainerView
{
  return self->_gradientAndImageContainerView;
}

- (void)setGradientAndImageContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_gradientAndImageContainerView, a3);
}

- (GradientView)bottomGradientView
{
  return self->_bottomGradientView;
}

- (void)setBottomGradientView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomGradientView, a3);
}

- (GradientView)topGradientView
{
  return self->_topGradientView;
}

- (void)setTopGradientView:(id)a3
{
  objc_storeStrong((id *)&self->_topGradientView, a3);
}

- (UIVisualEffectView)editorPickView
{
  return self->_editorPickView;
}

- (void)setEditorPickView:(id)a3
{
  objc_storeStrong((id *)&self->_editorPickView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editorPickView, 0);
  objc_storeStrong((id *)&self->_topGradientView, 0);
  objc_storeStrong((id *)&self->_bottomGradientView, 0);
  objc_storeStrong((id *)&self->_gradientAndImageContainerView, 0);
  objc_storeStrong((id *)&self->_collectionImageView, 0);
  objc_storeStrong((id *)&self->_openGuideButton, 0);
  objc_storeStrong((id *)&self->_buttonView, 0);
  objc_storeStrong((id *)&self->_editorPickLabel, 0);
  objc_storeStrong((id *)&self->_collectionLabel, 0);
  objc_storeStrong((id *)&self->_publisherLogoImageView, 0);
  objc_storeStrong((id *)&self->_metadataStackView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_editorsPickTopConstraint, 0);
  objc_storeStrong((id *)&self->_logoWidthConstraint, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_featuredGuide, 0);
  objc_destroyWeak((id *)&self->_headerDelegate);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end
