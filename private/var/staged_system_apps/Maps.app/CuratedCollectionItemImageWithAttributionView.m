@implementation CuratedCollectionItemImageWithAttributionView

- (CuratedCollectionItemImageWithAttributionView)initWithFrame:(CGRect)a3
{
  CuratedCollectionItemImageWithAttributionView *v3;
  CuratedCollectionItemImageWithAttributionView *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CuratedCollectionItemImageWithAttributionView;
  v3 = -[CuratedCollectionItemImageWithAttributionView initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (objc_class *)objc_opt_class(v3);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[CuratedCollectionItemImageWithAttributionView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v7);

    -[CuratedCollectionItemImageWithAttributionView _commonInit](v4, "_commonInit");
  }
  return v4;
}

- (CuratedCollectionItemImageWithAttributionView)initWithCoder:(id)a3
{
  CuratedCollectionItemImageWithAttributionView *v3;
  CuratedCollectionItemImageWithAttributionView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CuratedCollectionItemImageWithAttributionView;
  v3 = -[CuratedCollectionItemImageWithAttributionView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[CuratedCollectionItemImageWithAttributionView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  void *v3;
  void *v4;
  id v5;
  double y;
  double width;
  double height;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
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
  _QWORD v99[12];
  _QWORD v100[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView theme](self, "theme"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageBackgroundColor"));
  -[CuratedCollectionItemImageWithAttributionView setBackgroundColor:](self, "setBackgroundColor:", v4);

  v5 = objc_alloc((Class)UIImageView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v9 = objc_msgSend(v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[CuratedCollectionItemImageWithAttributionView setImageView:](self, "setImageView:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView imageView](self, "imageView"));
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView imageView](self, "imageView"));
  objc_msgSend(v11, "setContentMode:", 2);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView imageView](self, "imageView"));
  objc_msgSend(v12, "setAccessibilityIdentifier:", CFSTR("ImageView"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView imageView](self, "imageView"));
  -[CuratedCollectionItemImageWithAttributionView addSubview:](self, "addSubview:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v15 = objc_msgSend(v14, "userInterfaceLayoutDirection");

  if (v15 == (id)1)
    v16 = 2;
  else
    v16 = 1;
  v98 = (void *)objc_claimAutoreleasedReturnValue(+[UIColorEffect colorEffectSaturate:](UIColorEffect, "colorEffectSaturate:", 1.0));
  v97 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithBlurRadius:](UIBlurEffect, "effectWithBlurRadius:", 10.0));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.200000003));
  v96 = (void *)objc_claimAutoreleasedReturnValue(+[UIVisualEffect effectCompositingColor:](UIVisualEffect, "effectCompositingColor:", v17));

  v100[0] = v97;
  v100[1] = v98;
  v100[2] = v96;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v100, 3));
  v95 = (void *)objc_claimAutoreleasedReturnValue(+[UIVisualEffect effectCombiningEffects:](UIVisualEffect, "effectCombiningEffects:", v18));

  v19 = objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", v95);
  -[CuratedCollectionItemImageWithAttributionView setAttributionBackgroundView:](self, "setAttributionBackgroundView:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView attributionBackgroundView](self, "attributionBackgroundView"));
  objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView attributionBackgroundView](self, "attributionBackgroundView"));
  objc_msgSend(v21, "_setCornerRadius:continuous:maskedCorners:", 1, v16, 10.0);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView attributionBackgroundView](self, "attributionBackgroundView"));
  objc_msgSend(v22, "setHidden:", 1);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView attributionBackgroundView](self, "attributionBackgroundView"));
  -[CuratedCollectionItemImageWithAttributionView addSubview:](self, "addSubview:", v23);

  v24 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[CuratedCollectionItemImageWithAttributionView setAttributionLabel:](self, "setAttributionLabel:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView attributionLabel](self, "attributionLabel"));
  objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView attributionLabel](self, "attributionLabel"));
  LODWORD(v27) = 1144750080;
  objc_msgSend(v26, "setContentHuggingPriority:forAxis:", 0, v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView attributionLabel](self, "attributionLabel"));
  LODWORD(v29) = 1144750080;
  objc_msgSend(v28, "setContentHuggingPriority:forAxis:", 1, v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView attributionLabel](self, "attributionLabel"));
  objc_msgSend(v30, "setOverrideUserInterfaceStyle:", 1);

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGray5Color](UIColor, "systemGray5Color"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView attributionLabel](self, "attributionLabel"));
  objc_msgSend(v32, "setTextColor:", v31);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView attributionLabel](self, "attributionLabel"));
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v33, &stru_1011E7B18);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView attributionLabel](self, "attributionLabel"));
  objc_msgSend(v34, "setAccessibilityIdentifier:", CFSTR("AttributionLabel"));

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView attributionBackgroundView](self, "attributionBackgroundView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "contentView"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView attributionLabel](self, "attributionLabel"));
  objc_msgSend(v36, "addSubview:", v37);

  v94 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView imageView](self, "imageView"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "topAnchor"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView topAnchor](self, "topAnchor"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToAnchor:", v92));
  v99[0] = v91;
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView imageView](self, "imageView"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "leadingAnchor"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView leadingAnchor](self, "leadingAnchor"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "constraintEqualToAnchor:", v88));
  v99[1] = v87;
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView imageView](self, "imageView"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "trailingAnchor"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView trailingAnchor](self, "trailingAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToAnchor:", v84));
  v99[2] = v83;
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView imageView](self, "imageView"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "bottomAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView bottomAnchor](self, "bottomAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "constraintEqualToAnchor:", v80));
  v99[3] = v79;
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView attributionBackgroundView](self, "attributionBackgroundView"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "topAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView topAnchor](self, "topAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintGreaterThanOrEqualToAnchor:", v76));
  v99[4] = v75;
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView attributionBackgroundView](self, "attributionBackgroundView"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "leadingAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView leadingAnchor](self, "leadingAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintGreaterThanOrEqualToAnchor:", v72));
  v99[5] = v71;
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView attributionBackgroundView](self, "attributionBackgroundView"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "trailingAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView trailingAnchor](self, "trailingAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:", v68));
  v99[6] = v67;
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView attributionBackgroundView](self, "attributionBackgroundView"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "bottomAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView bottomAnchor](self, "bottomAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToAnchor:", v64));
  v99[7] = v63;
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView attributionLabel](self, "attributionLabel"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "topAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView attributionBackgroundView](self, "attributionBackgroundView"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "contentView"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "topAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:constant:", v58, 3.0));
  v99[8] = v57;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView attributionLabel](self, "attributionLabel"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "leadingAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView attributionBackgroundView](self, "attributionBackgroundView"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "contentView"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "leadingAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:constant:", v52, 5.0));
  v99[9] = v51;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView attributionBackgroundView](self, "attributionBackgroundView"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "contentView"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "trailingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView attributionLabel](self, "attributionLabel"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "trailingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:constant:", v39, 5.0));
  v99[10] = v40;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView attributionBackgroundView](self, "attributionBackgroundView"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "contentView"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "bottomAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView attributionLabel](self, "attributionLabel"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "bottomAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:constant:", v45, 3.0));
  v99[11] = v46;
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v99, 12));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v47);

}

- (void)setImage:(id)a3
{
  UIImage *v5;
  UIImage *image;
  void *v7;
  UIImage *v8;

  v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    image = self->_image;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView imageView](self, "imageView"));
    objc_msgSend(v7, "setImage:", image);

    v5 = v8;
  }

}

- (void)setAttributionString:(id)a3
{
  NSString **p_attributionString;
  _BOOL8 v6;
  void *v7;
  NSString *v8;
  void *v9;
  id v10;

  p_attributionString = &self->_attributionString;
  v10 = a3;
  if (!-[NSString isEqualToString:](*p_attributionString, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_attributionString, a3);
    v6 = -[NSString length](*p_attributionString, "length") == 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView attributionBackgroundView](self, "attributionBackgroundView"));
    objc_msgSend(v7, "setHidden:", v6);

    v8 = *p_attributionString;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemImageWithAttributionView attributionLabel](self, "attributionLabel"));
    objc_msgSend(v9, "setText:", v8);

  }
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)attributionString
{
  return self->_attributionString;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UIVisualEffectView)attributionBackgroundView
{
  return self->_attributionBackgroundView;
}

- (void)setAttributionBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_attributionBackgroundView, a3);
}

- (UILabel)attributionLabel
{
  return self->_attributionLabel;
}

- (void)setAttributionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_attributionLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionLabel, 0);
  objc_storeStrong((id *)&self->_attributionBackgroundView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_attributionString, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
