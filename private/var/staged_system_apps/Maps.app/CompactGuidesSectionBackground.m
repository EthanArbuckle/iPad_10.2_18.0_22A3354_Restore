@implementation CompactGuidesSectionBackground

+ (id)decorationViewKind
{
  return CFSTR("CompactGuidesSectionBackground");
}

- (CompactGuidesSectionBackground)initWithFrame:(CGRect)a3
{
  CompactGuidesSectionBackground *v3;
  CompactGuidesSectionBackground *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CompactGuidesSectionBackground;
  v3 = -[CompactGuidesSectionBackground initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CompactGuidesSectionBackground setupHairlines](v3, "setupHairlines");
    -[CompactGuidesSectionBackground setupGradientBackground](v4, "setupGradientBackground");
  }
  return v4;
}

- (void)setupHairlines
{
  HairlineView *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  HairlineView *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
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
  _QWORD v40[6];

  v3 = objc_alloc_init(HairlineView);
  -[CompactGuidesSectionBackground setTopHairline:](self, "setTopHairline:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CompactGuidesSectionBackground topHairline](self, "topHairline"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CompactGuidesSectionBackground topHairline](self, "topHairline"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));
  LODWORD(v7) = 1050253722;
  objc_msgSend(v6, "setOpacity:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CompactGuidesSectionBackground topHairline](self, "topHairline"));
  -[CompactGuidesSectionBackground addSubview:](self, "addSubview:", v8);

  v9 = objc_alloc_init(HairlineView);
  -[CompactGuidesSectionBackground setBottomHairline:](self, "setBottomHairline:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CompactGuidesSectionBackground bottomHairline](self, "bottomHairline"));
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CompactGuidesSectionBackground bottomHairline](self, "bottomHairline"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layer"));
  LODWORD(v13) = 1050253722;
  objc_msgSend(v12, "setOpacity:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CompactGuidesSectionBackground bottomHairline](self, "bottomHairline"));
  -[CompactGuidesSectionBackground addSubview:](self, "addSubview:", v14);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[CompactGuidesSectionBackground topHairline](self, "topHairline"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "leadingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CompactGuidesSectionBackground leadingAnchor](self, "leadingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v37));
  v40[0] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CompactGuidesSectionBackground topHairline](self, "topHairline"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CompactGuidesSectionBackground trailingAnchor](self, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
  v40[1] = v32;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CompactGuidesSectionBackground topHairline](self, "topHairline"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CompactGuidesSectionBackground topAnchor](self, "topAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
  v40[2] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CompactGuidesSectionBackground bottomHairline](self, "bottomHairline"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CompactGuidesSectionBackground leadingAnchor](self, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
  v40[3] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CompactGuidesSectionBackground bottomHairline](self, "bottomHairline"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CompactGuidesSectionBackground trailingAnchor](self, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
  v40[4] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CompactGuidesSectionBackground bottomHairline](self, "bottomHairline"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CompactGuidesSectionBackground bottomAnchor](self, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
  v40[5] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 6));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

}

- (void)setupGradientBackground
{
  GradientView *v3;
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
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];

  v3 = -[GradientView initWithFrame:]([GradientView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[CompactGuidesSectionBackground setBackgroundGradientView:](self, "setBackgroundGradientView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CompactGuidesSectionBackground backgroundGradientView](self, "backgroundGradientView"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CompactGuidesSectionBackground backgroundGradientView](self, "backgroundGradientView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "gradientLayer"));
  objc_msgSend(v6, "setStartPoint:", 0.5, 0.5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CompactGuidesSectionBackground backgroundGradientView](self, "backgroundGradientView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "gradientLayer"));
  objc_msgSend(v8, "setEndPoint:", 0.5, 1.0);

  -[CompactGuidesSectionBackground updateBackgroundUI](self, "updateBackgroundUI");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CompactGuidesSectionBackground backgroundGradientView](self, "backgroundGradientView"));
  -[CompactGuidesSectionBackground insertSubview:atIndex:](self, "insertSubview:atIndex:", v9, 0);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CompactGuidesSectionBackground backgroundGradientView](self, "backgroundGradientView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CompactGuidesSectionBackground leadingAnchor](self, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v24));
  v27[0] = v23;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CompactGuidesSectionBackground backgroundGradientView](self, "backgroundGradientView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CompactGuidesSectionBackground trailingAnchor](self, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
  v27[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CompactGuidesSectionBackground backgroundGradientView](self, "backgroundGradientView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CompactGuidesSectionBackground topAnchor](self, "topAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
  v27[2] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CompactGuidesSectionBackground backgroundGradientView](self, "backgroundGradientView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CompactGuidesSectionBackground bottomAnchor](self, "bottomAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
  v27[3] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);

}

- (void)updateBackgroundUI
{
  void *v3;
  id v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CompactGuidesSectionBackground traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4 == (id)2)
    v5 = CFSTR("#2C2C2E");
  else
    v5 = CFSTR("#F0F0F0");
  if (v4 == (id)2)
    v6 = CFSTR("#1C1C1E");
  else
    v6 = CFSTR("#E8E9ED");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _maps_colorFromHexString:](UIColor, "_maps_colorFromHexString:", v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _maps_colorFromHexString:](UIColor, "_maps_colorFromHexString:", v6));
  v9 = objc_retainAutorelease(v7);
  v14[0] = objc_msgSend(v9, "CGColor");
  v10 = objc_retainAutorelease(v8);
  v14[1] = objc_msgSend(v10, "CGColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CompactGuidesSectionBackground backgroundGradientView](self, "backgroundGradientView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "gradientLayer"));
  objc_msgSend(v13, "setColors:", v11);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CompactGuidesSectionBackground;
  v4 = a3;
  -[CompactGuidesSectionBackground traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CompactGuidesSectionBackground traitCollection](self, "traitCollection", v8.receiver, v8.super_class));
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[CompactGuidesSectionBackground updateBackgroundUI](self, "updateBackgroundUI");
}

- (GradientView)backgroundGradientView
{
  return self->_backgroundGradientView;
}

- (void)setBackgroundGradientView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundGradientView, a3);
}

- (HairlineView)topHairline
{
  return self->_topHairline;
}

- (void)setTopHairline:(id)a3
{
  objc_storeStrong((id *)&self->_topHairline, a3);
}

- (HairlineView)bottomHairline
{
  return self->_bottomHairline;
}

- (void)setBottomHairline:(id)a3
{
  objc_storeStrong((id *)&self->_bottomHairline, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomHairline, 0);
  objc_storeStrong((id *)&self->_topHairline, 0);
  objc_storeStrong((id *)&self->_backgroundGradientView, 0);
}

@end
