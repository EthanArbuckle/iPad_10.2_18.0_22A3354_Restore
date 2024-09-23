@implementation FeatureDiscoveryView

+ (double)estimatedHeight
{
  return 128.0;
}

+ ($29727DC6989B69F22950FCD998EA20D4)_metricsForIdiom:(SEL)a3
{
  if (a4 == 5)
  {
    retstr->var6 = 0.0;
    *(_OWORD *)&retstr->var0 = xmmword_100E3EC70;
    *(_OWORD *)&retstr->var2 = unk_100E3EC80;
    *(_OWORD *)&retstr->var4 = xmmword_100E3EC90;
  }
  else
  {
    *(_OWORD *)&retstr->var0 = xmmword_100E3ECA8;
    *(_OWORD *)&retstr->var2 = unk_100E3ECB8;
    *(_OWORD *)&retstr->var4 = xmmword_100E3ECC8;
    retstr->var6 = 40.0;
  }
  return result;
}

+ ($1AB5FA073B851C12C2339EC22442E995)_cellMetricsForIdiom:(int64_t)a3 context:(unint64_t)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  $1AB5FA073B851C12C2339EC22442E995 result;

  v4 = 2.0;
  if (!a4)
    v4 = 12.0;
  v5 = 4.0;
  if (!a4)
    v5 = 0.0;
  if (a3 == 5)
    v5 = v4;
  v6 = 10.0;
  if (a3 != 5)
    v6 = 16.0;
  v7 = 6.0;
  result.var2 = v6;
  result.var1 = v5;
  result.var0 = v7;
  return result;
}

+ (id)_constraintsForFeatureDiscoveryView:(id)a3 centeredInContentView:(id)a4 withIdiom:(int64_t)a5 context:(unint64_t)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;

  v9 = a4;
  v10 = a3;
  +[FeatureDiscoveryView _cellMetricsForIdiom:context:](FeatureDiscoveryView, "_cellMetricsForIdiom:context:", a5, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_maps_constraintsEqualToEdgesOfView:insets:priority:", v9));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allConstraints"));
  return v12;
}

- (FeatureDiscoveryView)initWithFrame:(CGRect)a3
{
  FeatureDiscoveryView *v3;
  FeatureDiscoveryView *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  double y;
  double width;
  double height;
  UIImageView *v15;
  UIImageView *imageView;
  UILabel *v17;
  UILabel *titleLabel;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  UILabel *v23;
  UILabel *subtitleLabel;
  void *v25;
  double v26;
  id v27;
  void *v28;
  UIStackView *v29;
  UIStackView *textStackView;
  double v31;
  UIGestureRecognizer *v32;
  UIGestureRecognizer *tapGesture;
  id v34;
  NSString *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  BOOL v42;
  double v43;
  double v44;
  void *v45;
  uint64_t v46;
  MapsLargerHitTargetButton *closeButton;
  MapsLargerHitTargetButton *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  MapsLargerHitTargetButton *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  double v70;
  double v71;
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
  uint64_t v86;
  NSArray *constraintsWithImage;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  NSArray *constraintsWithoutImage;
  void *v93;
  void *v94;
  uint64_t v95;
  NSLayoutConstraint *bottomConstraint;
  void *v97;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  NSString *v108;
  void *v109;
  __int128 v110;
  __int128 v111;
  objc_super v112;
  NSLayoutConstraint *v113;
  _QWORD v114[4];
  _QWORD v115[3];
  _QWORD v116[3];
  _QWORD v117[2];

  v112.receiver = self;
  v112.super_class = (Class)FeatureDiscoveryView;
  v3 = -[FeatureDiscoveryView initWithFrame:](&v112, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[FeatureDiscoveryView setClipsToBounds:](v3, "setClipsToBounds:", 0);
    -[FeatureDiscoveryView setFloatingIndicator:](v4, "setFloatingIndicator:", 1);
    v5 = (objc_class *)objc_opt_class(v4);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[FeatureDiscoveryView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v7);

    v111 = 0u;
    v110 = 0u;
    v8 = (void *)objc_opt_class(v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView traitCollection](v4, "traitCollection"));
    v10 = objc_msgSend(v9, "userInterfaceIdiom");
    if (v8)
    {
      objc_msgSend(v8, "_metricsForIdiom:", v10);
    }
    else
    {
      v111 = 0u;
      v110 = 0u;
    }

    v11 = objc_alloc((Class)UIImageView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v15 = (UIImageView *)objc_msgSend(v11, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    imageView = v4->_imageView;
    v4->_imageView = v15;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v4->_imageView, "setContentMode:", 1);
    -[UIImageView setAccessibilityIdentifier:](v4->_imageView, "setAccessibilityIdentifier:", CFSTR("FeatureDiscoveryImageView"));
    -[FeatureDiscoveryView addSubview:](v4, "addSubview:", v4->_imageView);
    v17 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v17;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "_mapkit_fontWithWeight:", UIFontWeightSemibold));
    -[UILabel setFont:](v4->_titleLabel, "setFont:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v4->_titleLabel, "setTextColor:", v21);

    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setAccessibilityIdentifier:](v4->_titleLabel, "setAccessibilityIdentifier:", CFSTR("FeatureDiscoveryTitle"));
    LODWORD(v22) = 1132068864;
    -[UILabel setContentHuggingPriority:forAxis:](v4->_titleLabel, "setContentHuggingPriority:forAxis:", 0, v22);
    v23 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v23;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v4->_subtitleLabel, "setTextColor:", v25);

    -[UILabel setNumberOfLines:](v4->_subtitleLabel, "setNumberOfLines:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_subtitleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setAccessibilityIdentifier:](v4->_subtitleLabel, "setAccessibilityIdentifier:", CFSTR("FeatureDiscoverySubtitle"));
    LODWORD(v26) = 1132068864;
    -[UILabel setContentHuggingPriority:forAxis:](v4->_subtitleLabel, "setContentHuggingPriority:forAxis:", 0, v26);
    v27 = objc_alloc((Class)UIStackView);
    v117[0] = v4->_titleLabel;
    v117[1] = v4->_subtitleLabel;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v117, 2));
    v29 = (UIStackView *)objc_msgSend(v27, "initWithArrangedSubviews:", v28);
    textStackView = v4->_textStackView;
    v4->_textStackView = v29;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v4->_textStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v4->_textStackView, "setAxis:", 1);
    -[UIStackView setDistribution:](v4->_textStackView, "setDistribution:", 0);
    -[UIStackView setAlignment:](v4->_textStackView, "setAlignment:", 0);
    v31 = 0.0;
    -[UIStackView setSpacing:](v4->_textStackView, "setSpacing:", 0.0);
    -[UIStackView setAccessibilityIdentifier:](v4->_textStackView, "setAccessibilityIdentifier:", CFSTR("FeatureDiscoveryTextStack"));
    -[FeatureDiscoveryView addSubview:](v4, "addSubview:", v4->_textStackView);
    v32 = (UIGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v4, "_performBodyTap");
    tapGesture = v4->_tapGesture;
    v4->_tapGesture = v32;

    v34 = objc_alloc_init((Class)NSMutableArray);
    v35 = UIFontTextStyleSubheadline;
    v109 = v34;
    if (sub_1002A8AA0(v4) == 5)
    {
      -[FeatureDiscoveryView setCornerRadius:](v4, "setCornerRadius:", 8.0);
      v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.0199999996)));
      v37 = objc_msgSend(v36, "CGColor");
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView layer](v4, "layer"));
      objc_msgSend(v38, "setBorderColor:", v37);

      v39 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView traitCollection](v4, "traitCollection"));
      objc_msgSend(v39, "displayScale");
      v41 = v40;
      v42 = v40 <= 1.0;
      v43 = 1.0;
      if (!v42)
      {
        v37 = (id)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView traitCollection](v4, "traitCollection", 1.0));
        objc_msgSend(v37, "displayScale");
      }
      v44 = 1.0 / v43;
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView layer](v4, "layer"));
      objc_msgSend(v45, "setBorderWidth:", v44);

      if (v41 > 1.0)
      v108 = UIFontTextStyleBody;

      v46 = objc_claimAutoreleasedReturnValue(+[MapsLargerHitTargetButton buttonWithType:](MapsLargerHitTargetButton, "buttonWithType:", 1));
      closeButton = v4->_closeButton;
      v4->_closeButton = (MapsLargerHitTargetButton *)v46;

      v48 = v4->_closeButton;
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("Dismiss [Action, Route Planning, Feature Discovery, Mac]"), CFSTR("localized string not found"), 0));
      -[MapsLargerHitTargetButton setTitle:forState:](v48, "setTitle:forState:", v50, 0);

      -[MapsLargerHitTargetButton setAccessibilityIdentifier:](v4->_closeButton, "setAccessibilityIdentifier:", CFSTR("FeatureDiscoveryCloseButton"));
      v105 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLargerHitTargetButton leadingAnchor](v4->_closeButton, "leadingAnchor"));
      v101 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView leadingAnchor](v4, "leadingAnchor"));
      v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "constraintGreaterThanOrEqualToAnchor:constant:", *(double *)&v110));
      v116[0] = v103;
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLargerHitTargetButton topAnchor](v4->_closeButton, "topAnchor"));
      v99 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](v4->_textStackView, "bottomAnchor"));
      v100 = v51;
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:constant:", v99, *(double *)&v110));
      v116[1] = v52;
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView trailingAnchor](v4, "trailingAnchor"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](v4->_textStackView, "trailingAnchor"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:constant:", v54, *(double *)&v110));
      v116[2] = v55;
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v116, 3));
      objc_msgSend(v34, "addObjectsFromArray:", v56);
    }
    else
    {
      v108 = v35;
      -[FeatureDiscoveryView setCornerRadius:](v4, "setCornerRadius:", 10.0);
      v57 = objc_claimAutoreleasedReturnValue(+[MapsLargerHitTargetButton buttonWithType:](MapsLargerHitTargetButton, "buttonWithType:", 0));
      v58 = v4->_closeButton;
      v4->_closeButton = (MapsLargerHitTargetButton *)v57;

      +[UIFont systemFontSize](UIFont, "systemFontSize");
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "_mapkit_fontWithWeight:", UIFontWeightMedium));
      v61 = objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v60));

      v62 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("xmark"), v61));
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "imageWithRenderingMode:", 2));

      -[MapsLargerHitTargetButton setImage:forState:](v4->_closeButton, "setImage:forState:", v63, 0);
      objc_msgSend(v63, "size");
      if (0.0 - v64 >= 0.0)
      {
        objc_msgSend(v63, "size");
        v31 = (0.0 - v65) * 0.5;
      }
      v105 = (void *)v61;
      objc_msgSend(v63, "size");
      v67 = 0.0;
      if (0.0 - v66 >= 0.0)
      {
        objc_msgSend(v63, "size", 0.0);
        v67 = (0.0 - v68) * 0.5;
      }
      -[MapsLargerHitTargetButton setTouchInsets:](v4->_closeButton, "setTouchInsets:", -v67, -v31, -v67, -v31);
      v69 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      -[MapsLargerHitTargetButton setTintColor:](v4->_closeButton, "setTintColor:", v69);

      LODWORD(v70) = 1144750080;
      -[MapsLargerHitTargetButton setContentHuggingPriority:forAxis:](v4->_closeButton, "setContentHuggingPriority:forAxis:", 0, v70);
      LODWORD(v71) = 1148846080;
      -[MapsLargerHitTargetButton setContentCompressionResistancePriority:forAxis:](v4->_closeButton, "setContentCompressionResistancePriority:forAxis:", 0, v71);
      v103 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLargerHitTargetButton leadingAnchor](v4->_closeButton, "leadingAnchor"));
      v100 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](v4->_textStackView, "trailingAnchor"));
      v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "constraintEqualToAnchor:constant:", *(double *)&v110));
      v115[0] = v99;
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView trailingAnchor](v4, "trailingAnchor"));
      v101 = v63;
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLargerHitTargetButton trailingAnchor](v4->_closeButton, "trailingAnchor"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:constant:", v53, *(double *)&v110));
      v115[1] = v54;
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLargerHitTargetButton topAnchor](v4->_closeButton, "topAnchor"));
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v4->_textStackView, "topAnchor"));
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:", v56));
      v115[2] = v72;
      v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v115, 3));
      objc_msgSend(v109, "addObjectsFromArray:", v73);

    }
    v74 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", v108));
    -[UILabel setFont:](v4->_subtitleLabel, "setFont:", v74);

    -[MapsLargerHitTargetButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_closeButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MapsLargerHitTargetButton addTarget:action:forControlEvents:](v4->_closeButton, "addTarget:action:forControlEvents:", v4, "_dismiss", 64);
    -[FeatureDiscoveryView addSubview:](v4, "addSubview:", v4->_closeButton);
    v107 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v4->_imageView, "widthAnchor"));
    v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "constraintEqualToConstant:", *((double *)&v111 + 1)));
    v114[0] = v106;
    v104 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v4->_imageView, "leadingAnchor"));
    v102 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView leadingAnchor](v4, "leadingAnchor"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "constraintEqualToAnchor:constant:", v102, *(double *)&v110));
    v114[1] = v75;
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v4->_imageView, "centerYAnchor"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerYAnchor](v4->_textStackView, "centerYAnchor"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintEqualToAnchor:", v77));
    v114[2] = v78;
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v4->_textStackView, "topAnchor"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView topAnchor](v4, "topAnchor"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "constraintEqualToAnchor:constant:", v80, *((double *)&v110 + 1)));
    v114[3] = v81;
    v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v114, 4));
    objc_msgSend(v109, "addObjectsFromArray:", v82);

    v83 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](v4->_textStackView, "leadingAnchor"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](v4->_imageView, "trailingAnchor"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "constraintEqualToAnchor:constant:", v84, *(double *)&v110));
    v86 = objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "arrayByAddingObject:", v85));
    constraintsWithImage = v4->_constraintsWithImage;
    v4->_constraintsWithImage = (NSArray *)v86;

    v88 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](v4->_textStackView, "leadingAnchor"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v4->_imageView, "leadingAnchor"));
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "constraintEqualToAnchor:", v89));
    v91 = objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "arrayByAddingObject:", v90));
    constraintsWithoutImage = v4->_constraintsWithoutImage;
    v4->_constraintsWithoutImage = (NSArray *)v91;

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v4->_constraintsWithoutImage);
    v93 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView bottomAnchor](v4, "bottomAnchor"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](v4->_textStackView, "bottomAnchor"));
    v95 = objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToAnchor:constant:", v94, *(double *)&v111));
    bottomConstraint = v4->_bottomConstraint;
    v4->_bottomConstraint = (NSLayoutConstraint *)v95;

    v113 = v4->_bottomConstraint;
    v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v113, 1));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v97);

    -[FeatureDiscoveryView _setupActionButtonIfNeeded](v4, "_setupActionButtonIfNeeded");
  }
  return v4;
}

- (double)arrowOffset
{
  void *v3;
  double result;
  double v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView sourceView](self, "sourceView"));

  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)FeatureDiscoveryView;
    -[FeatureDiscoveryView arrowOffset](&v6, "arrowOffset");
  }
  else
  {
    -[FeatureDiscoveryView bounds](self, "bounds");
    return v5 * 0.5 + -25.0;
  }
  return result;
}

- (void)setModel:(id)a3
{
  id v5;
  FeatureDiscoveryModel **p_model;
  FeatureDiscoveryModel *model;
  id v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  UIGestureRecognizer *tapGesture;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;

  v5 = a3;
  p_model = &self->_model;
  model = self->_model;
  v21 = (unint64_t)v5;
  v8 = model;
  v9 = (void *)v21;
  if (v21 | (unint64_t)v8)
  {
    v10 = objc_msgSend((id)v21, "isEqual:", v8);

    v9 = (void *)v21;
    if ((v10 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_model, a3);
      -[FeatureDiscoveryModel setUpdatesDelegate:](*p_model, "setUpdatesDelegate:", self);
      -[FeatureDiscoveryView setShowBubbleIndicator:](self, "setShowBubbleIndicator:", -[FeatureDiscoveryModel isTipMode](*p_model, "isTipMode"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v21, "image"));

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v21, "image"));
      -[UIImageView setImage:](self->_imageView, "setImage:", v12);

      -[UIImageView setHidden:](self->_imageView, "setHidden:", v11 == 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v21, "title"));
      -[UILabel setText:](self->_titleLabel, "setText:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v21, "subtitle"));
      -[UILabel setText:](self->_subtitleLabel, "setText:", v14);

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v21, "dismissHandler"));
      v16 = v15 == 0;

      -[MapsLargerHitTargetButton setHidden:](self->_closeButton, "setHidden:", v16);
      -[FeatureDiscoveryView _setupActionButtonIfNeeded](self, "_setupActionButtonIfNeeded");
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v21, "bodyTapHandler"));

      tapGesture = self->_tapGesture;
      if (v17)
        -[FeatureDiscoveryView addGestureRecognizer:](self, "addGestureRecognizer:", tapGesture);
      else
        -[FeatureDiscoveryView removeGestureRecognizer:](self, "removeGestureRecognizer:", tapGesture);
      if (v11)
        v19 = 7;
      else
        v19 = 6;
      if (v11)
        v20 = 6;
      else
        v20 = 7;
      +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", *(_QWORD *)&self->MUFeatureDiscoveryAnnotationView_opaque[OBJC_IVAR___FeatureDiscoveryView__imageView[v19]]);
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", *(_QWORD *)&self->MUFeatureDiscoveryAnnotationView_opaque[OBJC_IVAR___FeatureDiscoveryView__imageView[v20]]);
      v9 = (void *)v21;
    }
  }

}

- (void)_dismiss
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(void);
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView model](self, "model"));
  if ((objc_msgSend(v3, "isDismissed") & 1) != 0)
    goto LABEL_4;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView model](self, "model"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dismissHandler"));

  if (v5)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView model](self, "model"));
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dismissHandler"));
    v6[2]();

LABEL_4:
  }
  v7 = (id)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView model](self, "model"));
  objc_msgSend(v7, "setDismissed:", 1);

}

- (void)_performAction
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(void);
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView model](self, "model"));
  if (objc_msgSend(v7, "isDismissed"))
  {

  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView model](self, "model"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actionHandler"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView model](self, "model"));
      v6 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "actionHandler"));
      v6[2]();

      -[FeatureDiscoveryView _configureActionButton](self, "_configureActionButton");
    }
  }
}

- (void)_performBodyTap
{
  void *v3;
  void *v4;
  void (**v5)(void);
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView model](self, "model"));
  if ((objc_msgSend(v6, "isDismissed") & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView model](self, "model"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bodyTapHandler"));

    if (!v4)
      return;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView model](self, "model"));
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bodyTapHandler"));
    v5[2]();

  }
}

- (void)_setupActionButtonIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSLayoutConstraint *v17;
  NSLayoutConstraint *bottomConstraint;
  void *v19;
  void *v20;
  NSLayoutConstraint *v21;
  NSLayoutConstraint *closeButtonTrailingConstraint;
  NSLayoutConstraint *v23;
  UIButton *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  unsigned __int8 v31;
  void *v32;
  void *v33;
  id v34;
  UIButton *v35;
  UIButton *actionButton;
  void *v37;
  void *v38;
  NSLayoutConstraint *v39;
  NSLayoutConstraint *v40;
  void *v41;
  void *v42;
  NSLayoutConstraint *v43;
  NSLayoutConstraint *v44;
  void *v45;
  HairlineView *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  NSLayoutConstraint *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSLayoutConstraint *v57;
  NSLayoutConstraint *v58;
  void *v59;
  UIButton *v60;
  UIButton *v61;
  void *v62;
  void *v63;
  double v64;
  HairlineView *v65;
  void *v66;
  void *v67;
  NSLayoutConstraint *v68;
  NSLayoutConstraint *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  NSLayoutConstraint *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  UIButton *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  __int128 v98;
  _QWORD v99[7];
  _QWORD v100[6];
  NSLayoutConstraint *v101;
  _QWORD v102[2];

  v98 = 0u;
  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView traitCollection](self, "traitCollection"));
  v5 = objc_msgSend(v4, "userInterfaceIdiom");
  if (v3)
    objc_msgSend(v3, "_metricsForIdiom:", v5);
  else
    v98 = 0u;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView model](self, "model"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dismissHandler"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView model](self, "model"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "actionTitle"));
  if (!v9)
  {
    if (v7)
    {
      v14 = sub_1002A8AA0(self);

      if (v14 != 5)
        goto LABEL_14;
LABEL_11:
      -[NSLayoutConstraint setActive:](self->_bottomConstraint, "setActive:", 0);
      -[NSLayoutConstraint setActive:](self->_closeButtonTrailingConstraint, "setActive:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView bottomAnchor](self, "bottomAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLargerHitTargetButton bottomAnchor](self->_closeButton, "bottomAnchor"));
      v17 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, 0.0));
      bottomConstraint = self->_bottomConstraint;
      self->_bottomConstraint = v17;

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView trailingAnchor](self, "trailingAnchor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLargerHitTargetButton trailingAnchor](self->_closeButton, "trailingAnchor"));
      v21 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, 0.0));
      closeButtonTrailingConstraint = self->_closeButtonTrailingConstraint;
      self->_closeButtonTrailingConstraint = v21;

      v23 = self->_bottomConstraint;
      v102[0] = self->_closeButtonTrailingConstraint;
      v102[1] = v23;
      v24 = (UIButton *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v102, 2));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);
LABEL_16:

      return;
    }
LABEL_13:

    goto LABEL_14;
  }
  v10 = (void *)v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView model](self, "model"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "actionTitle"));
  if (objc_msgSend(v12, "length") || !v7)
  {

    goto LABEL_13;
  }
  v13 = sub_1002A8AA0(self);

  if (v13 == 5)
    goto LABEL_11;
LABEL_14:
  v24 = (UIButton *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView model](self, "model"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton actionTitle](v24, "actionTitle"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_actionButton, "titleLabel"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "text"));
  v28 = v25;
  v29 = v27;
  if (!(v28 | v29))
  {

    goto LABEL_16;
  }
  v30 = (void *)v29;
  v31 = objc_msgSend((id)v28, "isEqual:", v29);

  if ((v31 & 1) == 0)
  {
    -[UIButton removeFromSuperview](self->_actionButton, "removeFromSuperview");
    -[NSLayoutConstraint setActive:](self->_bottomConstraint, "setActive:", 0);
    -[NSLayoutConstraint setActive:](self->_closeButtonTrailingConstraint, "setActive:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView model](self, "model"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "actionTitle"));
    v34 = objc_msgSend(v33, "length");

    if (v34)
    {
      v24 = (UIButton *)objc_alloc_init((Class)NSMutableArray);
      if (sub_1002A8AA0(self) == 5)
      {
        v35 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
        actionButton = self->_actionButton;
        self->_actionButton = v35;

        -[UIButton setAccessibilityIdentifier:](self->_actionButton, "setAccessibilityIdentifier:", CFSTR("FeatureDiscoveryActionButton"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView bottomAnchor](self, "bottomAnchor"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_actionButton, "bottomAnchor"));
        v39 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:constant:", v38, 0.0));
        v40 = self->_bottomConstraint;
        self->_bottomConstraint = v39;

        v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_actionButton, "leadingAnchor"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLargerHitTargetButton trailingAnchor](self->_closeButton, "trailingAnchor"));
        v43 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v42, 1.0));
        v44 = self->_closeButtonTrailingConstraint;
        self->_closeButtonTrailingConstraint = v43;

        v100[0] = self->_closeButtonTrailingConstraint;
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView trailingAnchor](self, "trailingAnchor"));
        v46 = (HairlineView *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_actionButton, "trailingAnchor"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:constant:", v46, 0.0));
        v100[1] = v47;
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLargerHitTargetButton topAnchor](self->_closeButton, "topAnchor"));
        v96 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_actionButton, "topAnchor"));
        v97 = v48;
        v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v96));
        v100[2] = v95;
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLargerHitTargetButton bottomAnchor](self->_closeButton, "bottomAnchor"));
        v94 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_actionButton, "bottomAnchor"));
        v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:"));
        v100[3] = v93;
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_actionButton, "topAnchor"));
        v92 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_textStackView, "bottomAnchor"));
        v51 = objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:constant:", *(double *)&v98));
        v52 = self->_bottomConstraint;
        v53 = (void *)v51;
        v100[4] = v51;
        v100[5] = v52;
        v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v100, 6));
        -[UIButton addObjectsFromArray:](v24, "addObjectsFromArray:", v54);
      }
      else
      {
        v60 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
        v61 = self->_actionButton;
        self->_actionButton = v60;

        -[UIButton setAccessibilityIdentifier:](self->_actionButton, "setAccessibilityIdentifier:", CFSTR("FeatureDiscoveryActionButton"));
        -[UIButton setContentHorizontalAlignment:](self->_actionButton, "setContentHorizontalAlignment:", 4);
        v62 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_actionButton, "titleLabel"));
        objc_msgSend(v62, "setLineBreakMode:", 4);

        v63 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_actionButton, "titleLabel"));
        objc_msgSend(v63, "setNumberOfLines:", 0);

        v91 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
        objc_msgSend(v91, "setContentInsets:", *((double *)&v98 + 1), 0.0, 0.0, 0.0);
        -[UIButton setConfiguration:](self->_actionButton, "setConfiguration:", v91);
        LODWORD(v64) = 1148846080;
        -[UIButton setContentCompressionResistancePriority:forAxis:](self->_actionButton, "setContentCompressionResistancePriority:forAxis:", 1, v64);
        v65 = -[HairlineView initWithFrame:]([HairlineView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
        -[HairlineView setTranslatesAutoresizingMaskIntoConstraints:](v65, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[FeatureDiscoveryView addSubview:](self, "addSubview:", v65);
        v66 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView bottomAnchor](self, "bottomAnchor"));
        v67 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_actionButton, "bottomAnchor"));
        v68 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:", v67));
        v69 = self->_bottomConstraint;
        self->_bottomConstraint = v68;

        v90 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_actionButton, "leadingAnchor"));
        v97 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_textStackView, "leadingAnchor"));
        v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "constraintEqualToAnchor:"));
        v99[0] = v96;
        v70 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView leadingAnchor](v65, "leadingAnchor"));
        v89 = objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_actionButton, "leadingAnchor"));
        v95 = v70;
        v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToAnchor:", v89));
        v99[1] = v94;
        v71 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView trailingAnchor](self, "trailingAnchor"));
        v88 = objc_claimAutoreleasedReturnValue(-[HairlineView trailingAnchor](v65, "trailingAnchor"));
        v93 = v71;
        v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToAnchor:", v88));
        v99[2] = v92;
        v85 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView bottomAnchor](v65, "bottomAnchor"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_textStackView, "bottomAnchor"));
        v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToAnchor:constant:", v54, *(double *)&v98));
        v99[3] = v87;
        v86 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_actionButton, "trailingAnchor"));
        v84 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLargerHitTargetButton leadingAnchor](self->_closeButton, "leadingAnchor"));
        v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "constraintLessThanOrEqualToAnchor:", v84));
        v99[4] = v72;
        v73 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_actionButton, "topAnchor"));
        v74 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView bottomAnchor](v65, "bottomAnchor"));
        v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:", v74));
        v76 = self->_bottomConstraint;
        v99[5] = v75;
        v99[6] = v76;
        v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v99, 7));
        -[UIButton addObjectsFromArray:](v24, "addObjectsFromArray:", v77);

        v53 = v85;
        v50 = (void *)v88;

        v47 = v90;
        v46 = v65;
        v49 = (void *)v89;

        v45 = v91;
      }

      -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_actionButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v78 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_actionButton, "titleLabel"));
      objc_msgSend(v78, "setAdjustsFontForContentSizeCategory:", 1);

      -[UIButton setRole:](self->_actionButton, "setRole:", 1);
      v79 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView model](self, "model"));
      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "actionHandler"));
      -[UIButton setEnabled:](self->_actionButton, "setEnabled:", v80 != 0);

      -[UIButton addTarget:action:forControlEvents:](self->_actionButton, "addTarget:action:forControlEvents:", self, "_performAction", 64);
      -[FeatureDiscoveryView addSubview:](self, "addSubview:", self->_actionButton);
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);
      if (sub_1002A8AA0(self) == 5)
      {
        v81 = self->_actionButton;
        v82 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView model](self, "model"));
        v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "actionTitle"));
        -[UIButton setTitle:forState:](v81, "setTitle:forState:", v83, 0);

      }
      else
      {
        -[FeatureDiscoveryView _configureActionButton](self, "_configureActionButton");
      }
    }
    else
    {
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView bottomAnchor](self, "bottomAnchor"));
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_textStackView, "bottomAnchor"));
      v57 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:constant:", v56, 0.0));
      v58 = self->_bottomConstraint;
      self->_bottomConstraint = v57;

      v101 = self->_bottomConstraint;
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v101, 1));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v59);

      v24 = self->_actionButton;
      self->_actionButton = 0;
    }
    goto LABEL_16;
  }
}

- (void)_configureActionButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v14 = objc_alloc_init((Class)NSMutableDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v3, NSFontAttributeName);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v4, NSForegroundColorAttributeName);

  -[UIButton setUserInteractionEnabled:](self->_actionButton, "setUserInteractionEnabled:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView model](self, "model"));
  if ((objc_msgSend(v5, "shouldDisableAffordanceAfterAction") & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryView model](self, "model"));
    v7 = objc_msgSend(v6, "hasActionExecuted");

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGray2Color](UIColor, "systemGray2Color"));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v8, NSForegroundColorAttributeName);

      -[UIButton setUserInteractionEnabled:](self->_actionButton, "setUserInteractionEnabled:", 0);
    }
  }
  else
  {

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryModel actionTitle](self->_model, "actionTitle"));
  if (v9)
  {
    v10 = objc_alloc((Class)NSAttributedString);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryModel actionTitle](self->_model, "actionTitle"));
    v12 = objc_msgSend(v10, "initWithString:attributes:", v11, v14);

  }
  else
  {
    v12 = 0;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton configuration](self->_actionButton, "configuration"));
  objc_msgSend(v13, "setAttributedTitle:", v12);
  -[UIButton setConfiguration:](self->_actionButton, "setConfiguration:", v13);

}

- (FeatureDiscoveryModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_closeButtonTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_constraintsWithoutImage, 0);
  objc_storeStrong((id *)&self->_constraintsWithImage, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_textStackView, 0);
}

@end
