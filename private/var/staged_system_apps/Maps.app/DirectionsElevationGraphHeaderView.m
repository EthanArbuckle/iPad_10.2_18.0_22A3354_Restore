@implementation DirectionsElevationGraphHeaderView

- (DirectionsElevationGraphHeaderView)initWithFrame:(CGRect)a3
{
  DirectionsElevationGraphHeaderView *v3;
  DirectionsElevationGraphHeaderView *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  id v8;
  id v9;
  double y;
  double width;
  double height;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  uint64_t v24;
  NSLayoutConstraint *innerContentBottomConstraint;
  void *v26;
  DirectionsElevationGraphConfiguration *v27;
  void *v28;
  DirectionsElevationGraphConfiguration *v29;
  DirectionsElevationGraphView *v30;
  UIView *v31;
  UIView *textContainerView;
  double v33;
  double v34;
  DirectionsElevationLabelSummaryView *v35;
  DirectionsElevationLabelSummaryView *labelSummaryView;
  double v37;
  double v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  DirectionsElevationLabelSummaryView *v43;
  void *v44;
  Block_layout *v45;
  UIFont *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  uint64_t v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  uint64_t v60;
  NSLayoutConstraint *textContainerTopConstraint;
  void *v62;
  void *v63;
  double v64;
  uint64_t v65;
  NSLayoutConstraint *graphMinimumHeightConstraint;
  void *v67;
  void *v68;
  uint64_t v69;
  NSLayoutConstraint *graphMaximumHeightConstraint;
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
  Block_layout *v101;
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
  DirectionsElevationGraphView *v116;
  DirectionsElevationGraphConfiguration *v117;
  void *v118;
  void *v119;
  void *v120;
  id *p_chartView;
  void *v122;
  objc_super v123;
  _QWORD v124[3];
  _QWORD v125[16];

  v123.receiver = self;
  v123.super_class = (Class)DirectionsElevationGraphHeaderView;
  v3 = -[DirectionsElevationGraphHeaderView initWithFrame:](&v123, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (objc_class *)objc_opt_class(v3);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[DirectionsElevationGraphHeaderView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v7);

    -[DirectionsElevationGraphHeaderView setClipsToBounds:](v4, "setClipsToBounds:", 1);
    v8 = objc_alloc_init((Class)NSMutableArray);
    v9 = objc_alloc((Class)UIView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v13 = objc_msgSend(v9, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v13, "setClipsToBounds:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("RoutePlanningPlatterBackground")));
    objc_msgSend(v13, "setBackgroundColor:", v14);

    objc_msgSend(v13, "_setContinuousCornerRadius:", 14.0);
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor lightGrayColor](UIColor, "lightGrayColor")));
    v16 = objc_msgSend(v15, "CGColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layer"));
    objc_msgSend(v17, "setShadowColor:", v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layer"));
    LODWORD(v19) = 1045220557;
    objc_msgSend(v18, "setShadowOpacity:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layer"));
    objc_msgSend(v20, "setShadowRadius:", 3.0);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layer"));
    objc_msgSend(v21, "setShadowOffset:", 0.0, 0.0);

    objc_msgSend(v13, "setAccessibilityIdentifier:", CFSTR("InnerContentView"));
    -[DirectionsElevationGraphHeaderView addSubview:](v4, "addSubview:", v13);
    LODWORD(v22) = 1148846080;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_maps_constraintsEqualToEdgesOfView:insets:priority:", v4, 0.0, 16.0, 16.0, 16.0, v22));
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bottomConstraint"));
    innerContentBottomConstraint = v4->_innerContentBottomConstraint;
    v4->_innerContentBottomConstraint = (NSLayoutConstraint *)v24;

    v118 = v23;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "allConstraints"));
    v122 = v8;
    objc_msgSend(v8, "addObjectsFromArray:", v26);

    v27 = [DirectionsElevationGraphConfiguration alloc];
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationGraphHeaderView traitCollection](v4, "traitCollection"));
    v29 = -[DirectionsElevationGraphConfiguration initWithUseType:userInterfaceIdiom:](v27, "initWithUseType:userInterfaceIdiom:", 0, objc_msgSend(v28, "userInterfaceIdiom"));

    v117 = v29;
    v30 = -[DirectionsElevationGraphView initWithConfiguration:]([DirectionsElevationGraphView alloc], "initWithConfiguration:", v29);
    -[DirectionsElevationGraphView setTranslatesAutoresizingMaskIntoConstraints:](v30, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v13, "addSubview:", v30);
    p_chartView = (id *)&v4->_chartView;
    v116 = v30;
    objc_storeStrong((id *)&v4->_chartView, v30);
    v31 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    textContainerView = v4->_textContainerView;
    v4->_textContainerView = v31;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_textContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v33) = 1148846080;
    -[UIView setContentCompressionResistancePriority:forAxis:](v4->_textContainerView, "setContentCompressionResistancePriority:forAxis:", 1, v33);
    LODWORD(v34) = 1148846080;
    -[UIView setContentHuggingPriority:forAxis:](v4->_textContainerView, "setContentHuggingPriority:forAxis:", 1, v34);
    -[UIView setAccessibilityIdentifier:](v4->_textContainerView, "setAccessibilityIdentifier:", CFSTR("TextContainer"));
    objc_msgSend(v13, "addSubview:", v4->_textContainerView);
    v35 = -[DirectionsElevationLabelSummaryView initWithFrame:]([DirectionsElevationLabelSummaryView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    labelSummaryView = v4->_labelSummaryView;
    v4->_labelSummaryView = v35;

    -[DirectionsElevationLabelSummaryView setTranslatesAutoresizingMaskIntoConstraints:](v4->_labelSummaryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v37) = 1148846080;
    -[DirectionsElevationLabelSummaryView setContentCompressionResistancePriority:forAxis:](v4->_labelSummaryView, "setContentCompressionResistancePriority:forAxis:", 1, v37);
    LODWORD(v38) = 1148846080;
    -[DirectionsElevationLabelSummaryView setContentHuggingPriority:forAxis:](v4->_labelSummaryView, "setContentHuggingPriority:forAxis:", 1, v38);
    -[DirectionsElevationLabelSummaryView setAccessibilityIdentifier:](v4->_labelSummaryView, "setAccessibilityIdentifier:", CFSTR("LabelSummary"));
    -[UIView addSubview:](v4->_textContainerView, "addSubview:", v4->_labelSummaryView);
    v39 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v39, "setLineBreakMode:", 0);
    objc_msgSend(v39, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(v39, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
    if (sub_1002A8AA0(v4) == 5)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleBody));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "fontDescriptorWithSymbolicTraits:", 2));

      v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v41, 0.0));
      v43 = v4->_labelSummaryView;
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
      -[DirectionsElevationLabelSummaryView setFont:color:](v43, "setFont:color:", v42, v44);

      v45 = &stru_1011BC968;
    }
    else
    {
      v45 = &stru_1011BC988;
    }
    v101 = v45;
    v46 = ((UIFont *(__cdecl *)(id))v45->invoke)(v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
    objc_msgSend(v39, "setFont:", v47);

    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("Total Elevation [Chart Header]"), CFSTR("localized string not found"), 0));
    objc_msgSend(v39, "setText:", v49);

    v50 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    objc_msgSend(v39, "setTextColor:", v50);

    LODWORD(v51) = 1148846080;
    objc_msgSend(v39, "setContentHuggingPriority:forAxis:", 1, v51);
    LODWORD(v52) = 1148846080;
    objc_msgSend(v39, "setContentCompressionResistancePriority:forAxis:", 1, v52);
    LODWORD(v53) = 1148829696;
    objc_msgSend(v39, "setContentCompressionResistancePriority:forAxis:", 0, v53);
    -[UIView addSubview:](v4->_textContainerView, "addSubview:", v39);
    v54 = sub_1002A8AA0(v4);
    v55 = 12.0;
    if (v54 == 5)
      v56 = 16.0;
    else
      v56 = 12.0;
    if (v54 == 5)
      v57 = 10.0;
    else
      v57 = 12.0;
    v120 = v39;
    if (v54 == 5)
      v55 = 14.0;
    v4->_contentInsets.top = v55;
    v4->_contentInsets.left = v56;
    v4->_contentInsets.bottom = v57;
    v4->_contentInsets.right = v56;
    v4->_textContainerMaxTopMargin = v55;
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v4->_textContainerView, "topAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
    v60 = objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:constant:", v59, v4->_textContainerMaxTopMargin));
    textContainerTopConstraint = v4->_textContainerTopConstraint;
    v4->_textContainerTopConstraint = (NSLayoutConstraint *)v60;

    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_chartView, "heightAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintGreaterThanOrEqualToConstant:", 0.0));
    v64 = 50.0;
    if (v4->_styleForNavigation)
      v64 = 80.0;
    v65 = objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v63, &stru_1011BC9A8, v64));
    v119 = v13;
    graphMinimumHeightConstraint = v4->_graphMinimumHeightConstraint;
    v4->_graphMinimumHeightConstraint = (NSLayoutConstraint *)v65;

    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_chartView, "heightAnchor"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintLessThanOrEqualToConstant:", 0.0));
    v69 = objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v68, &stru_1011BC9A8, 80.0));
    graphMaximumHeightConstraint = v4->_graphMaximumHeightConstraint;
    v4->_graphMaximumHeightConstraint = (NSLayoutConstraint *)v69;

    v115 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationLabelSummaryView topAnchor](v4->_labelSummaryView, "topAnchor"));
    v114 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v4->_textContainerView, "topAnchor"));
    v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "constraintEqualToAnchor:", v114));
    v125[0] = v113;
    v112 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationLabelSummaryView leadingAnchor](v4->_labelSummaryView, "leadingAnchor"));
    v111 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v4->_textContainerView, "leadingAnchor"));
    v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "constraintEqualToAnchor:", v111));
    v125[1] = v110;
    v109 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v4->_textContainerView, "trailingAnchor"));
    v108 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationLabelSummaryView trailingAnchor](v4->_labelSummaryView, "trailingAnchor"));
    v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "constraintGreaterThanOrEqualToAnchor:", v108));
    v125[2] = v107;
    v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "firstBaselineAnchor"));
    v105 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationLabelSummaryView lastBaselineAnchor](v4->_labelSummaryView, "lastBaselineAnchor"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "constraintEqualToAnchor:", v105));
    v103 = (void *)objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v104, v101, 17.0));
    v125[3] = v103;
    v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "leadingAnchor"));
    v99 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v4->_textContainerView, "leadingAnchor"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "constraintEqualToAnchor:", v99));
    v125[4] = v98;
    v97 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v4->_textContainerView, "trailingAnchor"));
    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "trailingAnchor"));
    v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "constraintEqualToAnchor:", v96));
    v125[5] = v95;
    v94 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v4->_textContainerView, "bottomAnchor"));
    v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "bottomAnchor"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "constraintEqualToAnchor:", v93));
    v125[6] = v91;
    v125[7] = v4->_textContainerTopConstraint;
    v92 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v4->_textContainerView, "leadingAnchor"));
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "leadingAnchor"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "constraintEqualToAnchor:constant:", v90, v56));
    v125[8] = v89;
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
    v87 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v4->_textContainerView, "trailingAnchor"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "constraintEqualToAnchor:constant:", v87, v56));
    v125[9] = v86;
    v125[10] = v4->_graphMinimumHeightConstraint;
    v125[11] = v4->_graphMaximumHeightConstraint;
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_chartView, "topAnchor"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[UIView lastBaselineAnchor](v4->_textContainerView, "lastBaselineAnchor"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToAnchor:", v84));
    v102 = (void *)objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v83, v101, 15.0));
    v125[12] = v102;
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_chartView, "leadingAnchor"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "leadingAnchor"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "constraintEqualToAnchor:constant:", v71, v56));
    v125[13] = v72;
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_chartView, "trailingAnchor"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:constant:", v74, v56));
    v125[14] = v75;
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_chartView, "bottomAnchor"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintEqualToAnchor:constant:", v77, v57));
    v125[15] = v78;
    v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v125, 16));
    objc_msgSend(v122, "addObjectsFromArray:", v79);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v122);
    v124[0] = v4->_labelSummaryView;
    v124[1] = v120;
    v124[2] = *p_chartView;
    v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v124, 3));
    -[DirectionsElevationGraphHeaderView setAccessibilityElements:](v4, "setAccessibilityElements:", v80);

    -[DirectionsElevationGraphHeaderView _updateMinimumMaximumHeights](v4, "_updateMinimumMaximumHeights");
    +[DynamicTypeWizard makeObject:performSelector:whenSizeCategoryChangesWithOrder:](DynamicTypeWizard, "makeObject:performSelector:whenSizeCategoryChangesWithOrder:", v4, "_scheduleUpdateMinimumMaximumHeights", 2);

  }
  return v4;
}

- (void)setStyleForNavigation:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  uint64_t v9;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *v11;
  void *v12;
  DirectionsElevationGraphView *chartView;
  DirectionsElevationGraphConfiguration *v14;
  void *v15;
  DirectionsElevationGraphConfiguration *v16;
  NSLayoutConstraint *v17;
  NSLayoutConstraint *graphMinimumHeightConstraint;

  if (self->_styleForNavigation != a3)
  {
    v3 = a3;
    self->_styleForNavigation = a3;
    graphMinimumHeightConstraint = self->_graphMinimumHeightConstraint;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &graphMinimumHeightConstraint, 1));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationGraphView heightAnchor](self->_chartView, "heightAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintGreaterThanOrEqualToConstant:", 0.0));
    v8 = 50.0;
    if (v3)
    {
      v8 = 80.0;
      v9 = 2;
    }
    else
    {
      v9 = 0;
    }
    v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v7, &stru_1011BC9C8, v8));
    v11 = self->_graphMinimumHeightConstraint;
    self->_graphMinimumHeightConstraint = v10;

    v17 = self->_graphMinimumHeightConstraint;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

    chartView = self->_chartView;
    v14 = [DirectionsElevationGraphConfiguration alloc];
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationGraphHeaderView traitCollection](self, "traitCollection"));
    v16 = -[DirectionsElevationGraphConfiguration initWithUseType:userInterfaceIdiom:](v14, "initWithUseType:userInterfaceIdiom:", v9, objc_msgSend(v15, "userInterfaceIdiom"));
    -[DirectionsElevationGraphView setConfiguration:](chartView, "setConfiguration:", v16);

    -[DirectionsElevationGraphHeaderView _updateMinimumMaximumHeights](self, "_updateMinimumMaximumHeights");
  }
}

- (void)setRoute:(id)a3
{
  DirectionsElevationGraphView *chartView;
  void *v6;
  GEOComposedRoute *v7;

  v7 = (GEOComposedRoute *)a3;
  if (self->_route != v7)
  {
    objc_storeStrong((id *)&self->_route, a3);
    -[DirectionsElevationGraphHeaderView _updateLabels](self, "_updateLabels");
    chartView = self->_chartView;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute elevationProfile](v7, "elevationProfile"));
    -[GEOComposedRoute distance](v7, "distance");
    -[DirectionsElevationGraphView setElevationProfile:routeLength:](chartView, "setElevationProfile:routeLength:", v6);

  }
}

- (void)_updateLabels
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  id v8;
  NSObject *v9;
  DirectionsElevationGraphHeaderView *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  DirectionsElevationLabelSummaryView *labelSummaryView;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute elevationProfile](self->_route, "elevationProfile"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute elevationProfile](self->_route, "elevationProfile"));
    v5 = (double)objc_msgSend(v4, "sumElevationGainCm") / 100.0;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute elevationProfile](self->_route, "elevationProfile"));
    v7 = (double)objc_msgSend(v6, "sumElevationLossCm") / 100.0;

  }
  else
  {
    v7 = 0.0;
    v5 = 0.0;
  }
  v8 = sub_100432CAC();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = self;
    v11 = (objc_class *)objc_opt_class(v10);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if ((objc_opt_respondsToSelector(v10, "accessibilityIdentifier") & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationGraphHeaderView performSelector:](v10, "performSelector:", "accessibilityIdentifier"));
      v15 = v14;
      if (v14 && !objc_msgSend(v14, "isEqualToString:", v13))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v13, v10, v15));

        goto LABEL_10;
      }

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v13, v10));
LABEL_10:

    *(_DWORD *)buf = 138412290;
    v25 = v16;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@ | Will update labels for gain/loss", buf, 0xCu);

  }
  labelSummaryView = self->_labelSummaryView;
  v18 = objc_alloc((Class)NSMeasurement);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUnitLength meters](NSUnitLength, "meters"));
  v20 = objc_msgSend(v18, "initWithDoubleValue:unit:", v19, v5);
  v21 = objc_alloc((Class)NSMeasurement);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSUnitLength meters](NSUnitLength, "meters"));
  v23 = objc_msgSend(v21, "initWithDoubleValue:unit:", v22, v7);
  -[DirectionsElevationLabelSummaryView setAscent:descent:](labelSummaryView, "setAscent:descent:", v20, v23);

}

- (void)setNavigationProgress:(double)a3
{
  -[DirectionsElevationGraphView setNavigationProgress:](self->_chartView, "setNavigationProgress:", a3);
}

- (void)layoutSubviews
{
  double widthForLastMinMaxCalculation;
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)DirectionsElevationGraphHeaderView;
  -[DirectionsElevationGraphHeaderView layoutSubviews](&v4, "layoutSubviews");
  if (self->_recalculatingHeights
    || (widthForLastMinMaxCalculation = self->_widthForLastMinMaxCalculation,
        -[DirectionsElevationGraphHeaderView bounds](self, "bounds"),
        vabdd_f64(widthForLastMinMaxCalculation, CGRectGetWidth(v5)) <= 2.22044605e-16))
  {
    if (self->_minimumHeight > 0.0 && self->_maximumHeight > 0.0)
    {
      -[DirectionsElevationGraphHeaderView _calculateTransitionProgress](self, "_calculateTransitionProgress");
      -[DirectionsElevationGraphHeaderView setTransitionProgress:](self, "setTransitionProgress:");
    }
  }
  else
  {
    -[DirectionsElevationGraphHeaderView _updateMinimumMaximumHeights](self, "_updateMinimumMaximumHeights");
  }
}

- (float)_calculateTransitionProgress
{
  double Height;
  double minimumHeight;
  float v5;
  double maximumHeight;
  float v7;
  CGRect v9;

  -[DirectionsElevationGraphHeaderView bounds](self, "bounds");
  Height = CGRectGetHeight(v9);
  minimumHeight = self->_minimumHeight;
  v5 = 1.0;
  if (Height > minimumHeight)
  {
    maximumHeight = self->_maximumHeight;
    v5 = 0.0;
    if (Height < maximumHeight)
    {
      v7 = (Height - minimumHeight) / (maximumHeight - minimumHeight);
      return 1.0 - v7;
    }
  }
  return v5;
}

- (void)setTransitionProgress:(float)a3
{
  float v3;

  v3 = fminf(fmaxf(a3, 0.0), 1.0);
  if (self->_transitionProgress != v3)
  {
    self->_transitionProgress = v3;
    -[DirectionsElevationGraphHeaderView _updateTransition](self, "_updateTransition");
  }
}

- (void)_scheduleUpdateMinimumMaximumHeights
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005BC814;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_updateMinimumMaximumHeights
{
  void *v3;
  CGFloat v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  id v10;
  CGRect v11;

  self->_recalculatingHeights = 1;
  -[DirectionsElevationGraphHeaderView bounds](self, "bounds");
  self->_widthForLastMinMaxCalculation = CGRectGetWidth(v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationGraphHeaderView delegate](self, "delegate"));
  objc_msgSend(v3, "directionsElevationGraphHeaderViewWillRecalculateHeights:", self);

  v4 = self->_contentInsets.top + 0.0;
  -[NSLayoutConstraint constant](self->_graphMinimumHeightConstraint, "constant");
  v6 = v4 + v5 + self->_contentInsets.bottom + 16.0;
  self->_minimumHeight = v6;
  LODWORD(v6) = 0;
  -[DirectionsElevationGraphHeaderView setTransitionProgress:](self, "setTransitionProgress:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationGraphView heightAnchor](self->_chartView, "heightAnchor"));
  -[NSLayoutConstraint constant](self->_graphMaximumHeightConstraint, "constant");
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToConstant:"));

  objc_msgSend(v10, "setActive:", 1);
  -[DirectionsElevationGraphHeaderView systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  self->_maximumHeight = v8;
  objc_msgSend(v10, "setActive:", 0);
  -[DirectionsElevationGraphHeaderView setNeedsLayout](self, "setNeedsLayout");
  -[DirectionsElevationGraphHeaderView layoutIfNeeded](self, "layoutIfNeeded");
  self->_recalculatingHeights = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationGraphHeaderView delegate](self, "delegate"));
  objc_msgSend(v9, "directionsElevationGraphHeaderViewDidRecalculateHeights:", self);

}

- (void)_updateTransition
{
  double transitionProgress;
  CGRect v4;

  if (self->_minimumHeight == 0.0 || self->_maximumHeight == 0.0)
  {
    -[NSLayoutConstraint setConstant:](self->_textContainerTopConstraint, "setConstant:", self->_textContainerMaxTopMargin);
    -[NSLayoutConstraint setConstant:](self->_innerContentBottomConstraint, "setConstant:", 0.0);
    -[UIView setAlpha:](self->_textContainerView, "setAlpha:", 1.0);
  }
  else
  {
    transitionProgress = self->_transitionProgress;
    -[UIView bounds](self->_textContainerView, "bounds");
    -[NSLayoutConstraint setConstant:](self->_textContainerTopConstraint, "setConstant:", self->_textContainerMaxTopMargin - (CGRectGetHeight(v4) + self->_textContainerMaxTopMargin) * transitionProgress);
    -[UIView setAlpha:](self->_textContainerView, "setAlpha:", (float)(1.0 - self->_transitionProgress));
    -[NSLayoutConstraint setConstant:](self->_innerContentBottomConstraint, "setConstant:", self->_transitionProgress * 16.0);
  }
}

- (DirectionsElevationGraphHeaderViewDelegate)delegate
{
  return (DirectionsElevationGraphHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)styleForNavigation
{
  return self->_styleForNavigation;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (double)minimumHeight
{
  return self->_minimumHeight;
}

- (double)maximumHeight
{
  return self->_maximumHeight;
}

- (BOOL)isRecalatingHeights
{
  return self->_recalculatingHeights;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_route, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_graphMaximumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_graphMinimumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_innerContentBottomConstraint, 0);
  objc_storeStrong((id *)&self->_textContainerTopConstraint, 0);
  objc_storeStrong((id *)&self->_labelSummaryView, 0);
  objc_storeStrong((id *)&self->_chartView, 0);
  objc_storeStrong((id *)&self->_textContainerView, 0);
}

@end
