@implementation SettingsTipView

+ (Class)layerClass
{
  return (Class)objc_opt_class(CAShapeLayer);
}

- (SettingsTipView)initWithFrame:(CGRect)a3
{
  SettingsTipView *v3;
  SettingsTipView *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  double y;
  double width;
  double height;
  UIView *v19;
  UIView *contentMaskView;
  uint64_t v21;
  CAShapeLayer *contentMaskLayer;
  id v23;
  CAShapeLayer *v24;
  void *v25;
  CardView *v26;
  CardView *cardView;
  UILabel *v28;
  UILabel *titleLabel;
  void *v30;
  void *v31;
  UILabel *v32;
  UILabel *bodyLabel;
  void *v34;
  void *v35;
  uint64_t v36;
  UIButton *closeButton;
  UIButton *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  UITapGestureRecognizer *v44;
  UITapGestureRecognizer *tapGestureRecognizer;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
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
  objc_super v108;
  _QWORD v109[18];

  v108.receiver = self;
  v108.super_class = (Class)SettingsTipView;
  v3 = -[SettingsTipView initWithFrame:](&v108, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SettingsTipView setDirectionalLayoutMargins:](v3, "setDirectionalLayoutMargins:", 12.0, 16.0, 12.0, 25.0);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
    v6 = objc_msgSend(v5, "CGColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTipView layer](v4, "layer"));
    objc_msgSend(v7, "setShadowColor:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTipView layer](v4, "layer"));
    LODWORD(v9) = 1041865114;
    objc_msgSend(v8, "setShadowOpacity:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTipView layer](v4, "layer"));
    objc_msgSend(v10, "setShadowRadius:", 12.0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTipView layer](v4, "layer"));
    objc_msgSend(v11, "setShadowOffset:", 0.0, 1.0);

    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
    v13 = objc_msgSend(v12, "CGColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTipView _shapeLayer](v4, "_shapeLayer"));
    objc_msgSend(v14, "setFillColor:", v13);

    v15 = objc_alloc((Class)UIView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v19 = (UIView *)objc_msgSend(v15, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    contentMaskView = v4->_contentMaskView;
    v4->_contentMaskView = v19;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_contentMaskView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SettingsTipView addSubview:](v4, "addSubview:", v4->_contentMaskView);
    v21 = objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
    contentMaskLayer = v4->_contentMaskLayer;
    v4->_contentMaskLayer = (CAShapeLayer *)v21;

    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
    -[CAShapeLayer setFillColor:](v4->_contentMaskLayer, "setFillColor:", objc_msgSend(v23, "CGColor"));

    -[CAShapeLayer setAnchorPoint:](v4->_contentMaskLayer, "setAnchorPoint:", 0.0, 0.0);
    v24 = v4->_contentMaskLayer;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v4->_contentMaskView, "layer"));
    objc_msgSend(v25, "setMask:", v24);

    v26 = -[CardView initAllowingBlurred:]([CardView alloc], "initAllowingBlurred:", 1);
    cardView = v4->_cardView;
    v4->_cardView = v26;

    -[CardView setTranslatesAutoresizingMaskIntoConstraints:](v4->_cardView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CardView setLayoutStyle:](v4->_cardView, "setLayoutStyle:", 6);
    -[UIView addSubview:](v4->_contentMaskView, "addSubview:", v4->_cardView);
    v28 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v28;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v4->_titleLabel, "setTextColor:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CardView contentView](v4->_cardView, "contentView"));
    objc_msgSend(v31, "addSubview:", v4->_titleLabel);

    v32 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    bodyLabel = v4->_bodyLabel;
    v4->_bodyLabel = v32;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_bodyLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v4->_bodyLabel, "setNumberOfLines:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v4->_bodyLabel, "setTextColor:", v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CardView contentView](v4->_cardView, "contentView"));
    objc_msgSend(v35, "addSubview:", v4->_bodyLabel);

    v36 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    closeButton = v4->_closeButton;
    v4->_closeButton = (UIButton *)v36;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_closeButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v38 = v4->_closeButton;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("xmark")));
    -[UIButton setImage:forState:](v38, "setImage:forState:", v39, 0);

    -[UIButton addTarget:action:forControlEvents:](v4->_closeButton, "addTarget:action:forControlEvents:", v4, "_closeTapped", 0x2000);
    LODWORD(v40) = 1148846080;
    -[UIButton setContentHuggingPriority:forAxis:](v4->_closeButton, "setContentHuggingPriority:forAxis:", 0, v40);
    LODWORD(v41) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v4->_closeButton, "setContentCompressionResistancePriority:forAxis:", 0, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UIButton setTintColor:](v4->_closeButton, "setTintColor:", v42);

    -[UIButton _setTouchInsets:](v4->_closeButton, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[CardView contentView](v4->_cardView, "contentView"));
    objc_msgSend(v43, "addSubview:", v4->_closeButton);

    v44 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v4, "_tipTapped");
    tapGestureRecognizer = v4->_tapGestureRecognizer;
    v4->_tapGestureRecognizer = v44;

    -[SettingsTipView addGestureRecognizer:](v4, "addGestureRecognizer:", v4->_tapGestureRecognizer);
    v107 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTipView widthAnchor](v4, "widthAnchor"));
    LODWORD(v46) = 1144766464;
    v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "constraintEqualToConstant:priority:", 320.0, v46));
    v109[0] = v106;
    v105 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v4->_contentMaskView, "topAnchor"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTipView topAnchor](v4, "topAnchor"));
    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "constraintEqualToAnchor:", v104));
    v109[1] = v103;
    v102 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v4->_contentMaskView, "leadingAnchor"));
    v101 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTipView leadingAnchor](v4, "leadingAnchor"));
    v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "constraintEqualToAnchor:", v101));
    v109[2] = v100;
    v99 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v4->_contentMaskView, "trailingAnchor"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTipView trailingAnchor](v4, "trailingAnchor"));
    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "constraintEqualToAnchor:", v98));
    v109[3] = v97;
    v96 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v4->_contentMaskView, "bottomAnchor"));
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTipView bottomAnchor](v4, "bottomAnchor"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "constraintEqualToAnchor:", v95));
    v109[4] = v94;
    v93 = (void *)objc_claimAutoreleasedReturnValue(-[CardView topAnchor](v4->_cardView, "topAnchor"));
    v92 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTipView topAnchor](v4, "topAnchor"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToAnchor:constant:", v92, -10.0));
    v109[5] = v91;
    v90 = (void *)objc_claimAutoreleasedReturnValue(-[CardView leadingAnchor](v4->_cardView, "leadingAnchor"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTipView leadingAnchor](v4, "leadingAnchor"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "constraintEqualToAnchor:constant:", v89, -10.0));
    v109[6] = v88;
    v87 = (void *)objc_claimAutoreleasedReturnValue(-[CardView trailingAnchor](v4->_cardView, "trailingAnchor"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTipView trailingAnchor](v4, "trailingAnchor"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "constraintEqualToAnchor:constant:", v86, 10.0));
    v109[7] = v85;
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[CardView bottomAnchor](v4->_cardView, "bottomAnchor"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTipView bottomAnchor](v4, "bottomAnchor"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToAnchor:constant:", v83, 10.0));
    v109[8] = v82;
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](v4->_closeButton, "topAnchor"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTipView layoutMarginsGuide](v4, "layoutMarginsGuide"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "topAnchor"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "constraintEqualToAnchor:", v79));
    v109[9] = v78;
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](v4->_closeButton, "trailingAnchor"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTipView layoutMarginsGuide](v4, "layoutMarginsGuide"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "trailingAnchor"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintEqualToAnchor:", v75));
    v109[10] = v74;
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v4->_titleLabel, "topAnchor"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTipView layoutMarginsGuide](v4, "layoutMarginsGuide"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "topAnchor"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintEqualToAnchor:", v71));
    v109[11] = v70;
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_titleLabel, "leadingAnchor"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTipView layoutMarginsGuide](v4, "layoutMarginsGuide"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "leadingAnchor"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToAnchor:", v67));
    v109[12] = v66;
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_titleLabel, "trailingAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](v4->_closeButton, "leadingAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToAnchor:constant:", v64, -12.0));
    v109[13] = v63;
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v4->_bodyLabel, "topAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v4->_titleLabel, "bottomAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v61));
    v109[14] = v60;
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_bodyLabel, "leadingAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTipView layoutMarginsGuide](v4, "layoutMarginsGuide"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "leadingAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:", v57));
    v109[15] = v47;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_bodyLabel, "trailingAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_titleLabel, "trailingAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v49));
    v109[16] = v50;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v4->_bodyLabel, "bottomAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTipView layoutMarginsGuide](v4, "layoutMarginsGuide"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "bottomAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v53));
    v109[17] = v54;
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v109, 18));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v55);

    -[SettingsTipView _updateFonts](v4, "_updateFonts");
    -[SettingsTipView _updateText](v4, "_updateText");
  }
  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SettingsTipView;
  v4 = a3;
  -[SettingsTipView traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTipView traitCollection](self, "traitCollection", v9.receiver, v9.super_class));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));

  v8 = sub_1002A8950(v6, v7);
  if (v8)
    -[SettingsTipView _updateFonts](self, "_updateFonts");
}

- (void)layoutSubviews
{
  _BOOL4 v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SettingsTipView;
  -[SettingsTipView layoutSubviews](&v17, "layoutSubviews");
  v3 = -[SettingsTipView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == (id)1;
  -[SettingsTipView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = sub_10084D140(v3, v4, v6, v8, v10, 26.0);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v12));
  v14 = objc_msgSend(v13, "CGPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTipView _shapeLayer](self, "_shapeLayer"));
  objc_msgSend(v15, "setPath:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTipView _shapeLayer](self, "_shapeLayer"));
  objc_msgSend(v16, "setShadowPath:", v14);

  -[CAShapeLayer setPath:](self->_contentMaskLayer, "setPath:", v14);
  -[CAShapeLayer setBounds:](self->_contentMaskLayer, "setBounds:", v5, v7, v9, v11);

}

- (void)_updateFonts
{
  void *v3;
  void *v4;
  UIButton *closeButton;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:", UIFontTextStyleHeadline, 0, 0, 0.0));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:", UIFontTextStyleSubheadline, 0, 0x8000, 0.0));
  -[UILabel setFont:](self->_bodyLabel, "setFont:", v4);

  v7 = (id)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:", UIFontTextStyleBody, UIContentSizeCategoryLarge, 0, 0.0));
  closeButton = self->_closeButton;
  objc_msgSend(v7, "pointSize");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 5));
  -[UIButton setPreferredSymbolConfiguration:forImageInState:](closeButton, "setPreferredSymbolConfiguration:forImageInState:", v6, 0);

}

- (void)_updateText
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[Settings] Settings Tip Title for Traffic"), CFSTR("localized string not found"), 0));
  -[UILabel setText:](self->_titleLabel, "setText:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("[Settings] Settings Tip Message for Traffic"), CFSTR("localized string not found"), 0));
  -[UILabel setText:](self->_bodyLabel, "setText:", v5);

}

- (void)_tipTapped
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "settingsTipViewDidTapTip:", self);

}

- (void)_closeTapped
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "settingsTipViewDidTapClose:", self);

}

- (void)setBlurGroupName:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_blurGroupName, a3);
  v5 = a3;
  -[CardView setBlurGroupName:](self->_cardView, "setBlurGroupName:", v5);

}

- (SettingsTipViewDelegate)delegate
{
  return (SettingsTipViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)blurGroupName
{
  return self->_blurGroupName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurGroupName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_cardView, 0);
  objc_storeStrong((id *)&self->_contentMaskLayer, 0);
  objc_storeStrong((id *)&self->_contentMaskView, 0);
}

@end
