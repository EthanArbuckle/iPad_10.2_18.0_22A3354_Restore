@implementation StepTrayHeaderView

- (StepTrayHeaderView)initWithDelegate:(id)a3 metrics:(id)a4
{
  id v6;
  id v7;
  StepTrayHeaderView *v8;
  StepTrayHeaderView *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  uint64_t v13;
  id minimizedValueFontProvider;
  id v15;
  void *v16;
  UIImageView *v17;
  UIImageView *chevronImageView;
  uint64_t (**v19)(id, void *);
  void *v20;
  uint64_t v21;
  void *v22;
  NavTrayStackedLabel *v23;
  NavTrayStackedLabel *defaultLabel;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
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
  id v73;
  id v74;
  id v75;
  objc_super v76;
  _QWORD v77[11];

  v6 = a3;
  v7 = a4;
  v76.receiver = self;
  v76.super_class = (Class)StepTrayHeaderView;
  v8 = -[StepTrayHeaderView initWithFrame:](&v76, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v9 = v8;
  if (v8)
  {
    v10 = (objc_class *)objc_opt_class(v8);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[StepTrayHeaderView setAccessibilityIdentifier:](v9, "setAccessibilityIdentifier:", v12);

    objc_storeWeak((id *)&v9->_delegate, v6);
    objc_storeStrong((id *)&v9->_metrics, a4);
    v13 = objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontProviderWeight:minimumPointSize:minimumSizeCategory:maximumPointSize:maximumSizeCategory:](UIFont, "_maps_fontProviderWeight:minimumPointSize:minimumSizeCategory:maximumPointSize:maximumSizeCategory:", UIContentSizeCategoryLarge, UIContentSizeCategoryExtraExtraExtraLarge, UIFontWeightBold, 25.0, 33.0));
    minimizedValueFontProvider = v9->_minimizedValueFontProvider;
    v9->_minimizedValueFontProvider = (id)v13;

    -[StepTrayHeaderView setUserInteractionEnabled:](v9, "setUserInteractionEnabled:", 1);
    v73 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v6, "pressedHeaderView");
    -[StepTrayHeaderView addGestureRecognizer:](v9, "addGestureRecognizer:", v73);
    v15 = objc_alloc((Class)UIImageView);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("NavTrayChevron")));
    v17 = (UIImageView *)objc_msgSend(v15, "initWithImage:", v16);
    v75 = v6;
    chevronImageView = v9->_chevronImageView;
    v9->_chevronImageView = v17;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v9->_chevronImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v9->_chevronImageView, "setContentMode:", 1);
    -[UIImageView setAccessibilityIdentifier:](v9->_chevronImageView, "setAccessibilityIdentifier:", CFSTR("ChevronImageView"));
    -[StepTrayHeaderView addSubview:](v9, "addSubview:", v9->_chevronImageView);
    v19 = (uint64_t (**)(id, void *))v9->_minimizedValueFontProvider;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[StepTrayHeaderView traitCollection](v9, "traitCollection"));
    v21 = v19[2](v19, v20);
    v72 = (void *)objc_claimAutoreleasedReturnValue(v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "minimizedTitleTextStyle"));
    objc_msgSend(v7, "minimizedTitleFontWeight");
    v71 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", v22));

    v23 = objc_opt_new(NavTrayStackedLabel);
    defaultLabel = v9->_defaultLabel;
    v9->_defaultLabel = v23;

    -[NavTrayStackedLabel setTranslatesAutoresizingMaskIntoConstraints:](v9->_defaultLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[NavTrayMetrics minimizedValueToTitlePadding](v9->_metrics, "minimizedValueToTitlePadding");
    -[NavTrayStackedLabel setInterLabelPadding:](v9->_defaultLabel, "setInterLabelPadding:");
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel topLabel](v9->_defaultLabel, "topLabel"));
    objc_msgSend(v25, "setFont:", v72);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayMetrics minimizedValueTextColor](v9->_metrics, "minimizedValueTextColor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel topLabel](v9->_defaultLabel, "topLabel"));
    objc_msgSend(v27, "setTextColor:", v26);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel topLabel](v9->_defaultLabel, "topLabel"));
    objc_msgSend(v28, "setAdjustsFontSizeToFitWidth:", 0);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel bottomLabel](v9->_defaultLabel, "bottomLabel"));
    objc_msgSend(v29, "setFont:", v71);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayMetrics minimizedTitleTextColor](v9->_metrics, "minimizedTitleTextColor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel bottomLabel](v9->_defaultLabel, "bottomLabel"));
    objc_msgSend(v31, "setTextColor:", v30);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel bottomLabel](v9->_defaultLabel, "bottomLabel"));
    objc_msgSend(v32, "setAdjustsFontSizeToFitWidth:", 1);

    -[NavTrayStackedLabel setAccessibilityIdentifier:](v9->_defaultLabel, "setAccessibilityIdentifier:", CFSTR("DefaultLabel"));
    -[StepTrayHeaderView addSubview:](v9, "addSubview:", v9->_defaultLabel);
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](v9->_chevronImageView, "trailingAnchor"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[StepTrayHeaderView trailingAnchor](v9, "trailingAnchor"));
    -[NavTrayMetrics defaultHorizontalPadding](v9->_metrics, "defaultHorizontalPadding");
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToAnchor:constant:", v69, -v33));
    v77[0] = v68;
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](v9->_chevronImageView, "topAnchor"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[StepTrayHeaderView topAnchor](v9, "topAnchor"));
    -[NavTrayMetrics defaultVerticalPadding](v9->_metrics, "defaultVerticalPadding");
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintGreaterThanOrEqualToAnchor:constant:", v66));
    v77[1] = v65;
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](v9->_chevronImageView, "bottomAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[StepTrayHeaderView bottomAnchor](v9, "bottomAnchor"));
    -[NavTrayMetrics defaultVerticalPadding](v9->_metrics, "defaultVerticalPadding");
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintLessThanOrEqualToAnchor:constant:", v63, -v34));
    v77[2] = v62;
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v9->_chevronImageView, "centerYAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[StepTrayHeaderView centerYAnchor](v9, "centerYAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:", v60));
    v77[3] = v59;
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v9->_chevronImageView, "widthAnchor"));
    -[NavTrayMetrics expandCollapseImageSize](v9->_metrics, "expandCollapseImageSize");
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToConstant:"));
    v77[4] = v57;
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v9->_chevronImageView, "heightAnchor"));
    -[NavTrayMetrics expandCollapseImageSize](v9->_metrics, "expandCollapseImageSize");
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToConstant:", v35));
    v77[5] = v55;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel leadingAnchor](v9->_defaultLabel, "leadingAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[StepTrayHeaderView leadingAnchor](v9, "leadingAnchor"));
    -[NavTrayMetrics defaultHorizontalPadding](v9->_metrics, "defaultHorizontalPadding");
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:constant:", v53));
    v77[6] = v52;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel trailingAnchor](v9->_defaultLabel, "trailingAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v9->_chevronImageView, "leadingAnchor"));
    -[NavTrayMetrics defaultHorizontalPadding](v9->_metrics, "defaultHorizontalPadding");
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:constant:", v50, -v36));
    v77[7] = v49;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel topAnchor](v9->_defaultLabel, "topAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[StepTrayHeaderView topAnchor](v9, "topAnchor"));
    -[NavTrayMetrics defaultVerticalPadding](v9->_metrics, "defaultVerticalPadding");
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintGreaterThanOrEqualToAnchor:constant:", v37));
    v77[8] = v38;
    v74 = v7;
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel bottomAnchor](v9->_defaultLabel, "bottomAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[StepTrayHeaderView bottomAnchor](v9, "bottomAnchor"));
    -[NavTrayMetrics defaultVerticalPadding](v9->_metrics, "defaultVerticalPadding");
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintLessThanOrEqualToAnchor:constant:", v40, -v41));
    v77[9] = v42;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel centerYAnchor](v9->_defaultLabel, "centerYAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[StepTrayHeaderView centerYAnchor](v9, "centerYAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v44));
    v77[10] = v45;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v77, 11));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v46);

    v6 = v75;
    v7 = v74;

    -[StepTrayHeaderView _updateLayoutProgress](v9, "_updateLayoutProgress");
  }

  return v9;
}

- (void)setDefaultTitle:(id)a3 defaultSubtitle:(id)a4
{
  NavTrayStackedLabel *defaultLabel;
  id v7;
  id v8;
  void *v9;
  id v10;

  defaultLabel = self->_defaultLabel;
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel topLabel](defaultLabel, "topLabel"));
  objc_msgSend(v9, "setText:", v8);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel bottomLabel](self->_defaultLabel, "bottomLabel"));
  objc_msgSend(v10, "setText:", v7);

}

- (void)_updateLayoutProgress
{
  double v3;
  UIImageView *chevronImageView;
  CGAffineTransform v5;
  CGAffineTransform v6;

  -[StepTrayHeaderView layoutProgress](self, "layoutProgress");
  CGAffineTransformMakeRotation(&v6, (v3 * 2.0 + -1.0) * 1.57079633);
  chevronImageView = self->_chevronImageView;
  v5 = v6;
  -[UIImageView setTransform:](chevronImageView, "setTransform:", &v5);
}

- (void)setLayoutProgress:(double)a3
{
  double v3;

  v3 = fmax(fmin(a3, 1.0), 0.0);
  if (vabdd_f64(self->_layoutProgress, v3) > 2.22044605e-16)
  {
    self->_layoutProgress = v3;
    -[StepTrayHeaderView _updateLayoutProgress](self, "_updateLayoutProgress");
  }
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  -[NavTrayMetrics expandCollapseImageSize](self->_metrics, "expandCollapseImageSize");
  v4 = v3;
  -[NavTrayStackedLabel intrinsicContentSize](self->_defaultLabel, "intrinsicContentSize");
  v6 = v5;
  -[StepTrayHeaderView frame](self, "frame");
  v8 = v7;
  if (v6 <= v4)
    v9 = v4;
  else
    v9 = v6;
  v10 = fmax(v9, 60.0);
  -[NavTrayMetrics defaultVerticalPadding](self->_metrics, "defaultVerticalPadding");
  v12 = v10 + v11 * 2.0;
  v13 = v8;
  result.height = v12;
  result.width = v13;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t (**minimizedValueFontProvider)(id, void *);
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)StepTrayHeaderView;
  v4 = a3;
  -[StepTrayHeaderView traitCollectionDidChange:](&v16, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[StepTrayHeaderView traitCollection](self, "traitCollection", v16.receiver, v16.super_class));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));

  if (v6 != v7)
  {
    minimizedValueFontProvider = (uint64_t (**)(id, void *))self->_minimizedValueFontProvider;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[StepTrayHeaderView traitCollection](self, "traitCollection"));
    v10 = minimizedValueFontProvider[2](minimizedValueFontProvider, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayMetrics minimizedTitleTextStyle](self->_metrics, "minimizedTitleTextStyle"));
    -[NavTrayMetrics minimizedTitleFontWeight](self->_metrics, "minimizedTitleFontWeight");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", v12));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel topLabel](self->_defaultLabel, "topLabel"));
    objc_msgSend(v14, "setFont:", v11);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel bottomLabel](self->_defaultLabel, "bottomLabel"));
    objc_msgSend(v15, "setFont:", v13);

  }
}

- (double)layoutProgress
{
  return self->_layoutProgress;
}

- (StepTrayHeaderViewDelegate)delegate
{
  return (StepTrayHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_defaultLabel, 0);
  objc_storeStrong(&self->_minimizedValueFontProvider, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
}

@end
