@implementation RoutePlanningRefinementBarButton

- (RoutePlanningRefinementBarButton)initWithRefinement:(id)a3
{
  RoutePlanningRefinementBarButton *v5;
  RoutePlanningRefinementBarButton *v6;
  UIImageView *v7;
  UIImageView *iconImageView;
  UILabel *v9;
  UILabel *textLabel;
  void *v11;
  UIImageView *v12;
  UIImageView *chevronImageView;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  objc_super v36;
  _QWORD v37[5];
  _QWORD v38[3];

  v35 = a3;
  v36.receiver = self;
  v36.super_class = (Class)RoutePlanningRefinementBarButton;
  v5 = -[RoutePlanningRefinementBarButton initWithFrame:](&v36, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_refinement, a3);
    v7 = objc_opt_new(UIImageView);
    iconImageView = v6->_iconImageView;
    v6->_iconImageView = v7;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v6->_iconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v6->_iconImageView, "setContentMode:", 1);
    -[UIImageView setAccessibilityIdentifier:](v6->_iconImageView, "setAccessibilityIdentifier:", CFSTR("BarButtonIcon"));
    v9 = objc_opt_new(UILabel);
    textLabel = v6->_textLabel;
    v6->_textLabel = v9;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v6->_textLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[RoutePlanningRefinementBarButton _updateFonts](v6, "_updateFonts");
    -[UILabel setAccessibilityIdentifier:](v6->_textLabel, "setAccessibilityIdentifier:", CFSTR("BarButtonText"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 4, 15.0));
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("chevron.down"), v11));

    v12 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v34);
    chevronImageView = v6->_chevronImageView;
    v6->_chevronImageView = v12;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v6->_chevronImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v6->_chevronImageView, "setContentMode:", 1);
    -[UIImageView setAccessibilityIdentifier:](v6->_chevronImageView, "setAccessibilityIdentifier:", CFSTR("BarButtonChevron"));
    v14 = objc_alloc((Class)UIStackView);
    v38[0] = v6->_iconImageView;
    v38[1] = v6->_textLabel;
    v38[2] = v6->_chevronImageView;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 3));
    v16 = objc_msgSend(v14, "initWithArrangedSubviews:", v15);

    objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v16, "setAlignment:", 3);
    objc_msgSend(v16, "setAxis:", 0);
    objc_msgSend(v16, "setDistribution:", 0);
    objc_msgSend(v16, "setSpacing:", 4.0);
    objc_msgSend(v16, "setUserInteractionEnabled:", 0);
    -[RoutePlanningRefinementBarButton addSubview:](v6, "addSubview:", v16);
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "leadingAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarButton leadingAnchor](v6, "leadingAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:constant:", v32, 12.0));
    v37[0] = v31;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarButton trailingAnchor](v6, "trailingAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, 12.0));
    v37[1] = v28;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarButton topAnchor](v6, "topAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, 6.0));
    v37[2] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "centerYAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarButton centerYAnchor](v6, "centerYAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
    v37[3] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarButton bottomAnchor](v6, "bottomAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bottomAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, 6.0));
    v37[4] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 5));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

    -[RoutePlanningRefinementBarButton _updateMenu](v6, "_updateMenu");
    -[RoutePlanningRefinementBarButton _drawWithRefinement](v6, "_drawWithRefinement");

  }
  return v6;
}

- (void)layoutSubviews
{
  double v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  objc_super v8;
  CGRect v9;

  v8.receiver = self;
  v8.super_class = (Class)RoutePlanningRefinementBarButton;
  -[RoutePlanningRefinementBarButton layoutSubviews](&v8, "layoutSubviews");
  -[RoutePlanningRefinementBarButton bounds](self, "bounds");
  v3 = CGRectGetHeight(v9) * 0.5;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarButton layer](self, "layer"));
  objc_msgSend(v4, "cornerRadius");
  v6 = v5;

  if (v6 != v3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarButton layer](self, "layer"));
    objc_msgSend(v7, "setCornerRadius:", v3);

  }
}

- (void)setRefinement:(id)a3
{
  objc_storeStrong((id *)&self->_refinement, a3);
  -[RoutePlanningRefinementBarButton _updateMenu](self, "_updateMenu");
  -[RoutePlanningRefinementBarButton _drawWithRefinement](self, "_drawWithRefinement");
}

- (void)_updateMenu
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  id v7;

  -[RoutePlanningRefinementBarButton setMenu:](self, "setMenu:", 0);
  -[RoutePlanningRefinementBarButton _setMenuProvider:](self, "_setMenuProvider:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarButton refinement](self, "refinement"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "menuProvider"));

  if (v7)
  {
    -[RoutePlanningRefinementBarButton _setMenuProvider:](self, "_setMenuProvider:", v7);
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarButton refinement](self, "refinement"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "menu"));

    v4 = v6 != 0;
    if (v6)
      -[RoutePlanningRefinementBarButton setMenu:](self, "setMenu:", v6);

  }
  -[RoutePlanningRefinementBarButton setShowsMenuAsPrimaryAction:](self, "setShowsMenuAsPrimaryAction:", v4);

}

- (void)_drawWithRefinement
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  double v6;
  void *v7;
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
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarButton refinement](self, "refinement"));
  v4 = objc_msgSend(v3, "shouldShowHighlighted");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    v6 = 0.0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v6 = 0.5;
  }
  -[RoutePlanningRefinementBarButton setBackgroundColor:](self, "setBackgroundColor:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarButton layer](self, "layer"));
  objc_msgSend(v7, "setBorderWidth:", v6);

  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor systemGray3Color](UIColor, "systemGray3Color")));
  v9 = objc_msgSend(v8, "CGColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarButton layer](self, "layer"));
  objc_msgSend(v10, "setBorderColor:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarButton refinement](self, "refinement"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "iconImage"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarButton iconImageView](self, "iconImageView"));
  objc_msgSend(v13, "setImage:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarButton iconImageView](self, "iconImageView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "image"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarButton iconImageView](self, "iconImageView"));
  objc_msgSend(v16, "setHidden:", v15 == 0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarButton refinement](self, "refinement"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "titleText"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarButton textLabel](self, "textLabel"));
  objc_msgSend(v19, "setText:", v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarButton refinement](self, "refinement"));
  v21 = objc_msgSend(v20, "shouldShowChevron") ^ 1;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarButton chevronImageView](self, "chevronImageView"));
  objc_msgSend(v22, "setHidden:", v21);

  if ((v4 & 1) != 0)
    v23 = objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  else
    v23 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v27 = (id)v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarButton iconImageView](self, "iconImageView"));
  objc_msgSend(v24, "setTintColor:", v27);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarButton textLabel](self, "textLabel"));
  objc_msgSend(v25, "setTextColor:", v27);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarButton chevronImageView](self, "chevronImageView"));
  objc_msgSend(v26, "setTintColor:", v27);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RoutePlanningRefinementBarButton;
  v4 = a3;
  -[RoutePlanningRefinementBarButton traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory", v8.receiver, v8.super_class));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarButton traitCollection](self, "traitCollection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "preferredContentSizeCategory"));

  if (v5 != v7)
    -[RoutePlanningRefinementBarButton _updateFonts](self, "_updateFonts");
}

- (void)_updateFonts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarButton traitCollection](self, "traitCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_maps_traitCollectionWithMaximumContentSizeCategory:", UIContentSizeCategoryAccessibilityLarge));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", UIFontTextStyleBody, v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarButton textLabel](self, "textLabel"));
  objc_msgSend(v6, "setFont:", v5);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarButton textLabel](self, "textLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "font"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarButton titleLabel](self, "titleLabel"));
  objc_msgSend(v8, "setFont:", v7);

}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (RoutePlanningRefinementModel)refinement
{
  return self->_refinement;
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageView, a3);
}

- (UIImageView)chevronImageView
{
  return self->_chevronImageView;
}

- (void)setChevronImageView:(id)a3
{
  objc_storeStrong((id *)&self->_chevronImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_refinement, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end
