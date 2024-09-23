@implementation SearchHomeTipView

- (SearchHomeTipView)initWithFrame:(CGRect)a3
{
  SearchHomeTipView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchHomeTipView;
  v3 = -[SearchHomeTipView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", UIFontTextStyleBody, UIFontWeightSemibold));
    -[SearchHomeTipView setDefaultTitleFont:](v3, "setDefaultTitleFont:", v4);

    -[SearchHomeTipView setupSubviews](v3, "setupSubviews");
  }
  return v3;
}

- (double)arrowHeight
{
  return 13.0;
}

- (double)arrowBase
{
  return 26.0;
}

- (double)arrowOffset
{
  return 0.0;
}

- (void)setupSubviews
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
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
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
  double v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;

  -[SearchHomeTipView setShowBubbleIndicator:](self, "setShowBubbleIndicator:", 1);
  -[SearchHomeTipView setCornerRadius:](self, "setCornerRadius:", 13.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor lightGrayColor](UIColor, "lightGrayColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView backgroundView](self, "backgroundView"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[SearchHomeTipView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = objc_alloc((Class)UIStackView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v9 = objc_msgSend(v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[SearchHomeTipView setMetadataStackView:](self, "setMetadataStackView:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView metadataStackView](self, "metadataStackView"));
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView metadataStackView](self, "metadataStackView"));
  objc_msgSend(v11, "setAxis:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView metadataStackView](self, "metadataStackView"));
  objc_msgSend(v12, "setDistribution:", 2);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView metadataStackView](self, "metadataStackView"));
  objc_msgSend(v13, "setAlignment:", 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView metadataStackView](self, "metadataStackView"));
  objc_msgSend(v14, "setSpacing:", 0.0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView metadataStackView](self, "metadataStackView"));
  objc_msgSend(v15, "setAccessibilityIdentifier:", CFSTR("SearchHomeToolTipView"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView metadataStackView](self, "metadataStackView"));
  -[SearchHomeTipView addSubview:](self, "addSubview:", v16);

  v17 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[SearchHomeTipView setTitleLabel:](self, "setTitleLabel:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView titleLabel](self, "titleLabel"));
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView titleLabel](self, "titleLabel"));
  objc_msgSend(v19, "setNumberOfLines:", 0);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView titleLabel](self, "titleLabel"));
  objc_msgSend(v21, "setTextColor:", v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("[Search Home] Search Tip Title"), CFSTR("localized string not found"), 0));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView titleLabel](self, "titleLabel"));
  objc_msgSend(v24, "setText:", v23);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView metadataStackView](self, "metadataStackView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView titleLabel](self, "titleLabel"));
  objc_msgSend(v25, "addArrangedSubview:", v26);

  v27 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[SearchHomeTipView setSubtitleLabel:](self, "setSubtitleLabel:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v29, "setNumberOfLines:", 0);

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v31, "setTextColor:", v30);

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("[Search Home] Search Tip Subtitle"), CFSTR("localized string not found"), 0));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v34, "setText:", v33);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView metadataStackView](self, "metadataStackView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v35, "addArrangedSubview:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
  -[SearchHomeTipView setCloseButton:](self, "setCloseButton:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView closeButton](self, "closeButton"));
  objc_msgSend(v38, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView closeButton](self, "closeButton"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("xmark")));
  objc_msgSend(v39, "setImage:forState:", v40, 0);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView closeButton](self, "closeButton"));
  objc_msgSend(v41, "setUserInteractionEnabled:", 0);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView closeButton](self, "closeButton"));
  objc_msgSend(v42, "setAccessibilityIdentifier:", CFSTR("SearchHomeToolTipCloseButton"));

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView closeButton](self, "closeButton"));
  LODWORD(v44) = 1148846080;
  objc_msgSend(v43, "setContentHuggingPriority:forAxis:", 0, v44);

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView closeButton](self, "closeButton"));
  LODWORD(v46) = 1148846080;
  objc_msgSend(v45, "setContentCompressionResistancePriority:forAxis:", 0, v46);

  v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView closeButton](self, "closeButton"));
  objc_msgSend(v48, "setTintColor:", v47);

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView closeButton](self, "closeButton"));
  objc_msgSend(v49, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView closeButton](self, "closeButton"));
  -[SearchHomeTipView addSubview:](self, "addSubview:", v50);

  -[SearchHomeTipView setupConstraints](self, "setupConstraints");
  -[SearchHomeTipView updateUI](self, "updateUI");
}

- (void)setupConstraints
{
  void *v3;
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
  void *v27;
  void *v28;
  _QWORD v29[6];

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView closeButton](self, "closeButton"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "topAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView topAnchor](self, "topAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, 20.0));
  v29[0] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView closeButton](self, "closeButton"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView trailingAnchor](self, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v22, -10.0));
  v29[1] = v21;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView metadataStackView](self, "metadataStackView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView leadingAnchor](self, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:", v18, 10.0));
  v29[2] = v17;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView metadataStackView](self, "metadataStackView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView closeButton](self, "closeButton"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v13));
  v29[3] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView metadataStackView](self, "metadataStackView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView topAnchor](self, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:constant:", v6, 20.0));
  v29[4] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView metadataStackView](self, "metadataStackView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView bottomAnchor](self, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, -10.0));
  v29[5] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 6));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)updateUI
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView backgroundView](self, "backgroundView"));
  if (v4 == (id)2)
    v6 = objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemGroupedBackgroundColor](UIColor, "secondarySystemGroupedBackgroundColor"));
  else
    v6 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v7 = (void *)v6;
  objc_msgSend(v5, "setBackgroundColor:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:", UIFontTextStyleHeadline, 0, 0, 0.0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView titleLabel](self, "titleLabel"));
  objc_msgSend(v9, "setFont:", v8);

  v11 = (id)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:", UIFontTextStyleSubheadline, 0, 0x8000, 0.0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v10, "setFont:", v11);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSString *v8;
  NSString *v9;
  NSComparisonResult v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SearchHomeTipView;
  -[SearchHomeTipView traitCollectionDidChange:](&v11, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView traitCollection](self, "traitCollection"));
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  if (v6 == objc_msgSend(v4, "userInterfaceStyle"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView traitCollection](self, "traitCollection"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "preferredContentSizeCategory"));
    v9 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
    v10 = UIContentSizeCategoryCompareToCategory(v8, v9);

    if (v10 == NSOrderedSame)
      goto LABEL_6;
  }
  else
  {

  }
  -[SearchHomeTipView updateUI](self, "updateUI");
LABEL_6:

}

- (UIStackView)metadataStackView
{
  return self->_metadataStackView;
}

- (void)setMetadataStackView:(id)a3
{
  objc_storeStrong((id *)&self->_metadataStackView, a3);
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
  objc_storeStrong((id *)&self->_closeButton, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (UIFont)defaultTitleFont
{
  return self->_defaultTitleFont;
}

- (void)setDefaultTitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_defaultTitleFont, a3);
}

- (UIFont)maxSupportedTitleFont
{
  return self->_maxSupportedTitleFont;
}

- (void)setMaxSupportedTitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_maxSupportedTitleFont, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxSupportedTitleFont, 0);
  objc_storeStrong((id *)&self->_defaultTitleFont, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_metadataStackView, 0);
}

@end
