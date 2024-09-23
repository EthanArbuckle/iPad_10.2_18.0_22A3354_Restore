@implementation NavTrayFeedbackView

- (NavTrayFeedbackView)initWithDelegate:(id)a3
{
  id v4;
  NavTrayFeedbackView *v5;
  NavTrayFeedbackView *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  uint64_t v10;
  id minimizedValueFontProvider;
  UILabel *v12;
  UILabel *titleLabel;
  void *v14;
  void *v15;
  uint64_t (**v16)(id, void *);
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  UIButton *thumbsUpButton;
  UIButton *v22;
  void *v23;
  void *v24;
  UIButton *v25;
  void *v26;
  void *v27;
  UIButton *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  UIButton *thumbsDownButton;
  UIButton *v33;
  void *v34;
  void *v35;
  UIButton *v36;
  void *v37;
  void *v38;
  UIButton *v39;
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
  id v86;
  objc_super v87;
  _QWORD v88[14];

  v4 = a3;
  v87.receiver = self;
  v87.super_class = (Class)NavTrayFeedbackView;
  v5 = -[NavTrayFeedbackView initWithFrame:](&v87, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v6 = v5;
  if (v5)
  {
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[NavTrayFeedbackView setAccessibilityIdentifier:](v6, "setAccessibilityIdentifier:", v9);

    objc_storeWeak((id *)&v6->_delegate, v4);
    -[NavTrayFeedbackView _applyBackgroundColor](v6, "_applyBackgroundColor");
    -[NavTrayFeedbackView _setContinuousCornerRadius:](v6, "_setContinuousCornerRadius:", 10.0);
    v10 = objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontProviderWeight:minimumPointSize:minimumSizeCategory:maximumPointSize:maximumSizeCategory:](UIFont, "_maps_fontProviderWeight:minimumPointSize:minimumSizeCategory:maximumPointSize:maximumSizeCategory:", UIContentSizeCategoryLarge, UIContentSizeCategoryExtraExtraExtraLarge, UIFontWeightRegular, 20.0, 26.0));
    minimizedValueFontProvider = v6->_minimizedValueFontProvider;
    v6->_minimizedValueFontProvider = (id)v10;

    v12 = objc_opt_new(UILabel);
    titleLabel = v6->_titleLabel;
    v6->_titleLabel = v12;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v6->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v86 = v4;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Rate Your Route [RAP Revamp][NavTray]"), CFSTR("localized string not found"), 0));
    -[UILabel setText:](v6->_titleLabel, "setText:", v15);

    v16 = (uint64_t (**)(id, void *))v6->_minimizedValueFontProvider;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayFeedbackView traitCollection](v6, "traitCollection"));
    v18 = v16[2](v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    -[UILabel setFont:](v6->_titleLabel, "setFont:", v19);

    -[UILabel setAccessibilityIdentifier:](v6->_titleLabel, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
    -[NavTrayFeedbackView addSubview:](v6, "addSubview:", v6->_titleLabel);
    v20 = objc_claimAutoreleasedReturnValue(+[RAPThumbsButton buttonWithType:](RAPThumbsButton, "buttonWithType:", 0));
    thumbsUpButton = v6->_thumbsUpButton;
    v6->_thumbsUpButton = (UIButton *)v20;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v6->_thumbsUpButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v22 = v6->_thumbsUpButton;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayFeedbackView traitCollection](v6, "traitCollection"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:compatibleWithTraitCollection:](UIImage, "systemImageNamed:compatibleWithTraitCollection:", CFSTR("hand.thumbsup"), v23));
    -[UIButton setImage:forState:](v22, "setImage:forState:", v24, 0);

    v25 = v6->_thumbsUpButton;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayFeedbackView traitCollection](v6, "traitCollection"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:compatibleWithTraitCollection:](UIImage, "systemImageNamed:compatibleWithTraitCollection:", CFSTR("hand.thumbsup.fill"), v26));
    -[UIButton setImage:forState:](v25, "setImage:forState:", v27, 1);

    v28 = v6->_thumbsUpButton;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayFeedbackView traitCollection](v6, "traitCollection"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:compatibleWithTraitCollection:](UIImage, "systemImageNamed:compatibleWithTraitCollection:", CFSTR("hand.thumbsup.fill"), v29));
    -[UIButton setImage:forState:](v28, "setImage:forState:", v30, 4);

    -[UIButton addTarget:action:forControlEvents:](v6->_thumbsUpButton, "addTarget:action:forControlEvents:", v6, "_thumbsUpPressed:", 0x2000);
    -[UIButton setAccessibilityIdentifier:](v6->_thumbsUpButton, "setAccessibilityIdentifier:", CFSTR("ThumbsUpButton"));
    -[NavTrayFeedbackView addSubview:](v6, "addSubview:", v6->_thumbsUpButton);
    v31 = objc_claimAutoreleasedReturnValue(+[RAPThumbsButton buttonWithType:](RAPThumbsButton, "buttonWithType:", 0));
    thumbsDownButton = v6->_thumbsDownButton;
    v6->_thumbsDownButton = (UIButton *)v31;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v6->_thumbsDownButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v33 = v6->_thumbsDownButton;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayFeedbackView traitCollection](v6, "traitCollection"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:compatibleWithTraitCollection:](UIImage, "systemImageNamed:compatibleWithTraitCollection:", CFSTR("hand.thumbsdown"), v34));
    -[UIButton setImage:forState:](v33, "setImage:forState:", v35, 0);

    v36 = v6->_thumbsDownButton;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayFeedbackView traitCollection](v6, "traitCollection"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:compatibleWithTraitCollection:](UIImage, "systemImageNamed:compatibleWithTraitCollection:", CFSTR("hand.thumbsdown.fill"), v37));
    -[UIButton setImage:forState:](v36, "setImage:forState:", v38, 1);

    v39 = v6->_thumbsDownButton;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayFeedbackView traitCollection](v6, "traitCollection"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:compatibleWithTraitCollection:](UIImage, "systemImageNamed:compatibleWithTraitCollection:", CFSTR("hand.thumbsdown.fill"), v40));
    -[UIButton setImage:forState:](v39, "setImage:forState:", v41, 4);

    -[UIButton addTarget:action:forControlEvents:](v6->_thumbsDownButton, "addTarget:action:forControlEvents:", v6, "_thumbsDownPressed:", 0x2000);
    -[UIButton setAccessibilityIdentifier:](v6->_thumbsDownButton, "setAccessibilityIdentifier:", CFSTR("ThumbsDownButton"));
    -[NavTrayFeedbackView addSubview:](v6, "addSubview:", v6->_thumbsDownButton);
    v85 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v6->_titleLabel, "topAnchor"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayFeedbackView topAnchor](v6, "topAnchor"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToAnchor:constant:", v84, 20.0));
    v88[0] = v83;
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v6->_titleLabel, "leadingAnchor"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayFeedbackView leadingAnchor](v6, "leadingAnchor"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "constraintEqualToAnchor:constant:", v81, 20.0));
    v88[1] = v80;
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v6->_titleLabel, "trailingAnchor"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayFeedbackView trailingAnchor](v6, "trailingAnchor"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "constraintLessThanOrEqualToAnchor:constant:", v78, -20.0));
    v88[2] = v77;
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v6->_titleLabel, "bottomAnchor"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayFeedbackView bottomAnchor](v6, "bottomAnchor"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintEqualToAnchor:constant:", v75, -20.0));
    v88[3] = v74;
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](v6->_thumbsUpButton, "widthAnchor"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](v6->_thumbsUpButton, "heightAnchor"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:", v72));
    v88[4] = v71;
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](v6->_thumbsUpButton, "topAnchor"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayFeedbackView topAnchor](v6, "topAnchor"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToAnchor:constant:", v69, 20.0));
    v88[5] = v68;
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](v6->_thumbsUpButton, "leadingAnchor"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v6->_titleLabel, "trailingAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintGreaterThanOrEqualToAnchor:constant:", v66, 12.0));
    v88[6] = v65;
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](v6->_thumbsUpButton, "bottomAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayFeedbackView bottomAnchor](v6, "bottomAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:constant:", v63, -20.0));
    v88[7] = v62;
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](v6->_thumbsDownButton, "heightAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](v6->_thumbsUpButton, "heightAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:", v60));
    v88[8] = v59;
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](v6->_thumbsDownButton, "widthAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](v6->_thumbsDownButton, "heightAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:", v57));
    v88[9] = v56;
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](v6->_thumbsDownButton, "topAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayFeedbackView topAnchor](v6, "topAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:constant:", v54, 20.0));
    v88[10] = v53;
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](v6->_thumbsDownButton, "leadingAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](v6->_thumbsUpButton, "trailingAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:constant:", v42, 12.0));
    v88[11] = v43;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](v6->_thumbsDownButton, "trailingAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayFeedbackView trailingAnchor](v6, "trailingAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:constant:", v45, -20.0));
    v88[12] = v46;
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](v6->_thumbsDownButton, "bottomAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayFeedbackView bottomAnchor](v6, "bottomAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:constant:", v48, -20.0));
    v88[13] = v49;
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v88, 14));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v50);

    v4 = v86;
  }

  return v6;
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
  uint64_t v10;
  double v11;
  double v12;
  CGSize result;

  -[UILabel intrinsicContentSize](self->_titleLabel, "intrinsicContentSize");
  v4 = v3;
  -[UIButton intrinsicContentSize](self->_thumbsUpButton, "intrinsicContentSize");
  if (v4 <= v5)
    v6 = v5;
  else
    v6 = v4;
  v7 = fmax(v6 + 40.0, 80.0);
  -[NavTrayFeedbackView frame](self, "frame");
  v9 = v8;
  v11 = UIRoundToViewScale(self, v10, v7);
  v12 = v9;
  result.height = v11;
  result.width = v12;
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NavTrayFeedbackView;
  v4 = a3;
  -[NavTrayFeedbackView traitCollectionDidChange:](&v12, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayFeedbackView traitCollection](self, "traitCollection", v12.receiver, v12.super_class));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));

  if (v6 != v7)
  {
    minimizedValueFontProvider = (uint64_t (**)(id, void *))self->_minimizedValueFontProvider;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayFeedbackView traitCollection](self, "traitCollection"));
    v10 = minimizedValueFontProvider[2](minimizedValueFontProvider, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[UILabel setFont:](self->_titleLabel, "setFont:", v11);

    -[NavTrayFeedbackView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
  -[NavTrayFeedbackView _applyBackgroundColor](self, "_applyBackgroundColor");
}

- (void)_applyBackgroundColor
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[NavTrayFeedbackView traitCollection](self, "traitCollection"));
  if (objc_msgSend(v5, "userInterfaceStyle") == (id)2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemGroupedBackgroundColor](UIColor, "secondarySystemGroupedBackgroundColor"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "resolvedColorWithTraitCollection:", v5));
    -[NavTrayFeedbackView setBackgroundColor:](self, "setBackgroundColor:", v4);

  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[NavTrayFeedbackView setBackgroundColor:](self, "setBackgroundColor:", v3);
  }

}

- (void)_thumbsUpPressed:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  uint8_t v7[16];

  v4 = sub_100431F8C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "_thumbsUpPressed: ", v7, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "feedbackViewDidSelectThumbsUp");

}

- (void)_thumbsDownPressed:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  uint8_t v7[16];

  v4 = sub_100431F8C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "_thumbsDownPressed: ", v7, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "feedbackViewDidSelectThumbsDown");

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_minimizedValueFontProvider, 0);
  objc_storeStrong((id *)&self->_thumbsDownButton, 0);
  objc_storeStrong((id *)&self->_thumbsUpButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
