@implementation RoutePlanningOverviewRouteCreationCell

- (RoutePlanningOverviewRouteCreationCell)initWithFrame:(CGRect)a3
{
  RoutePlanningOverviewRouteCreationCell *v3;
  RoutePlanningOverviewRouteCreationCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RoutePlanningOverviewRouteCreationCell;
  v3 = -[RoutePlanningOverviewRouteCreationCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[RoutePlanningOverviewRouteCreationCell customInit](v3, "customInit");
  return v4;
}

- (RoutePlanningOverviewRouteCreationCell)initWithCoder:(id)a3
{
  RoutePlanningOverviewRouteCreationCell *v3;
  RoutePlanningOverviewRouteCreationCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RoutePlanningOverviewRouteCreationCell;
  v3 = -[RoutePlanningOverviewRouteCreationCell initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[RoutePlanningOverviewRouteCreationCell customInit](v3, "customInit");
  return v4;
}

- (void)customInit
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void **v9;
  uint64_t v10;
  id (*v11)(uint64_t, uint64_t);
  void *v12;
  id v13;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[RoutePlanningOverviewRouteCreationCell setBackgroundColor:](self, "setBackgroundColor:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewRouteCreationCell contentView](self, "contentView"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  objc_initWeak(&location, self);
  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_10058A2B0;
  v12 = &unk_1011AF768;
  objc_copyWeak(&v13, &location);
  -[RoutePlanningOverviewRouteCreationCell _setBackgroundViewConfigurationProvider:](self, "_setBackgroundViewConfigurationProvider:", &v9);
  v6 = (objc_class *)objc_opt_class(self);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[RoutePlanningOverviewRouteCreationCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v8, v9, v10, v11, v12);

  -[RoutePlanningOverviewRouteCreationCell setSelectionStyle:](self, "setSelectionStyle:", 1);
  -[RoutePlanningOverviewRouteCreationCell _createSubviews](self, "_createSubviews");
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_createSubviews
{
  UIView *v3;
  void *v4;
  id v5;
  void *v6;
  UIView *v7;
  UILabel *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  UILabel *titleLabel;
  UILabel *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  UILabel *bodyLabel;
  UILabel *v23;
  UIView *v24;
  void *v25;
  void *v26;
  UIView *v27;
  UIImageView *v28;
  UIImageView *v29;
  void *v30;
  void *v31;
  double v32;
  UILabel *v33;
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
  UIView *v67;
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
  UIView *v81;
  void *v82;
  void *v83;
  UIView *v84;
  void *v85;
  void *v86;
  void *v87;
  UIImageView *v88;
  void *v89;
  void *v90;
  void *v91;
  UILabel *v92;
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
  _QWORD v112[23];

  v3 = objc_opt_new(UIView);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("CreateRouteCellView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemGroupedBackgroundColor](UIColor, "secondarySystemGroupedBackgroundColor"));
  -[UIView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  -[UIView _setContinuousCornerRadius:](v3, "_setContinuousCornerRadius:", 12.0);
  v5 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_pressedCell");
  -[UIView addGestureRecognizer:](v3, "addGestureRecognizer:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewRouteCreationCell contentView](self, "contentView"));
  objc_msgSend(v6, "addSubview:", v3);

  v7 = objc_opt_new(UIView);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](v3, "addSubview:", v7);
  v8 = objc_opt_new(UILabel);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", CFSTR("CreateRouteTitle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Create Route [Route Planning]"), CFSTR("localized string not found"), 0));
  -[UILabel setText:](v8, "setText:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:weight:](UIFont, "_preferredFontForTextStyle:weight:", UIFontTextStyleTitle3, UIFontWeightSemibold));
  -[UILabel setFont:](v8, "setFont:", v11);

  -[UILabel setNumberOfLines:](v8, "setNumberOfLines:", 0);
  LODWORD(v12) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](v8, "setContentHuggingPriority:forAxis:", 1, v12);
  LODWORD(v13) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](v8, "setContentCompressionResistancePriority:forAxis:", 1, v13);
  -[UIView addSubview:](v7, "addSubview:", v8);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v8;
  v92 = v8;

  v15 = objc_opt_new(UILabel);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAccessibilityIdentifier:](v15, "setAccessibilityIdentifier:", CFSTR("CreateRouteSubtitle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Create Route Detail [Route Planning]"), CFSTR("localized string not found"), 0));
  -[UILabel setText:](v15, "setText:", v17);

  -[UILabel setNumberOfLines:](v15, "setNumberOfLines:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](v15, "setTextColor:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  -[UILabel setFont:](v15, "setFont:", v19);

  LODWORD(v20) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](v15, "setContentHuggingPriority:forAxis:", 1, v20);
  LODWORD(v21) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](v15, "setContentCompressionResistancePriority:forAxis:", 1, v21);
  -[UIView addSubview:](v7, "addSubview:", v15);
  bodyLabel = self->_bodyLabel;
  self->_bodyLabel = v15;
  v23 = v15;

  v24 = objc_opt_new(UIView);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemFillColor](UIColor, "secondarySystemFillColor"));
  -[UIView setBackgroundColor:](v24, "setBackgroundColor:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v24, "layer"));
  objc_msgSend(v26, "setCornerRadius:", 10.0);

  -[UIView setClipsToBounds:](v24, "setClipsToBounds:", 1);
  v27 = v24;
  -[UIView addSubview:](v3, "addSubview:", v24);
  v28 = objc_opt_new(UIImageView);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setAccessibilityIdentifier:](v28, "setAccessibilityIdentifier:", CFSTR("CreateRouteIcon"));
  v29 = v28;
  -[UIImageView setContentMode:](v28, "setContentMode:", 4);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 28.0, UIFontWeightSemibold));
  v111 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v30));

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", CFSTR("location.bottomleft.forward.to.point.topright.scurvepath.dashed"), v111));
  -[UIImageView setImage:](v29, "setImage:", v31);

  -[UIView addSubview:](v27, "addSubview:", v29);
  if (sub_1002A8AA0(self) == 5)
    v32 = 10.0;
  else
    v32 = 16.0;
  v110 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewRouteCreationCell heightAnchor](self, "heightAnchor"));
  v109 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v7, "heightAnchor"));
  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "constraintEqualToAnchor:constant:", v109, 52.0));
  v112[0] = v108;
  v107 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewRouteCreationCell contentView](self, "contentView"));
  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "heightAnchor"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v7, "heightAnchor"));
  v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "constraintEqualToAnchor:constant:", v105, 52.0));
  v112[1] = v104;
  v102 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v3, "leadingAnchor"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewRouteCreationCell contentView](self, "contentView"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "leadingAnchor"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "constraintEqualToAnchor:constant:", v101, v32));
  v112[2] = v100;
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v3, "trailingAnchor"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewRouteCreationCell contentView](self, "contentView"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "trailingAnchor"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "constraintEqualToAnchor:constant:", v97, -v32));
  v112[3] = v96;
  v94 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v3, "topAnchor"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewRouteCreationCell contentView](self, "contentView"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "topAnchor"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "constraintEqualToAnchor:", v93));
  v112[4] = v91;
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v3, "bottomAnchor"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewRouteCreationCell contentView](self, "contentView"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "bottomAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "constraintEqualToAnchor:", v87));
  v112[5] = v86;
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v27, "trailingAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v3, "trailingAnchor"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToAnchor:constant:", v83, -16.0));
  v112[6] = v82;
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v27, "centerYAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v3, "centerYAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "constraintEqualToAnchor:", v79));
  v112[7] = v78;
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v27, "widthAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToConstant:", 64.0));
  v112[8] = v76;
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v27, "heightAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToConstant:", 64.0));
  v112[9] = v74;
  v88 = v29;
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](v29, "centerXAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v27, "centerXAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:", v72));
  v112[10] = v71;
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v29, "centerYAnchor"));
  v84 = v27;
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v27, "centerYAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToAnchor:", v69));
  v112[11] = v68;
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v7, "leadingAnchor"));
  v81 = v3;
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v3, "leadingAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:constant:", v65, 18.0));
  v112[12] = v64;
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v7, "trailingAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v27, "leadingAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:constant:", v62, -16.0));
  v112[13] = v61;
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v7, "centerYAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v3, "centerYAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v59));
  v112[14] = v58;
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v7, "heightAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintGreaterThanOrEqualToConstant:", 68.0));
  v112[15] = v56;
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v92, "leadingAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v7, "leadingAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:", v54));
  v112[16] = v53;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v92, "trailingAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v7, "trailingAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v51));
  v112[17] = v50;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v92, "topAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v7, "topAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v48));
  v112[18] = v47;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v23, "leadingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v7, "leadingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v45));
  v112[19] = v44;
  v33 = v23;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v23, "trailingAnchor"));
  v67 = v7;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v7, "trailingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v42));
  v112[20] = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v33, "topAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v92, "bottomAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:constant:", v36, 2.0));
  v112[21] = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v33, "bottomAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v7, "bottomAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v39));
  v112[22] = v40;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v112, 23));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v41);

}

- (void)_pressedCell
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewRouteCreationCell delegate](self, "delegate"));
  objc_msgSend(v3, "didTapRouteCreationButtonForCell:", self);

}

+ (double)heightForWidth:(double)a3 traitCollection:(id)a4
{
  double v4;
  void *v5;
  RoutePlanningOverviewRouteCreationCell *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v4 = a3 + -10.0 + -18.0 + -16.0 + -64.0 + -16.0 + -10.0;
  if (v4 <= 0.0)
    return 68.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "preferredContentSizeCategory"));
  if (!qword_1014D29C8
    || UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)qword_1014D29D0, (UIContentSizeCategory)v5))
  {
    v6 = -[RoutePlanningOverviewRouteCreationCell initWithFrame:]([RoutePlanningOverviewRouteCreationCell alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v7 = (void *)qword_1014D29C8;
    qword_1014D29C8 = (uint64_t)v6;

    objc_storeStrong((id *)&qword_1014D29D0, v5);
  }
  objc_msgSend(*(id *)(qword_1014D29C8 + 8), "sizeThatFits:", v4, 1.79769313e308);
  v9 = v8;
  objc_msgSend(*(id *)(qword_1014D29C8 + 16), "sizeThatFits:", v4, 1.79769313e308);
  v11 = fmax(v9 + 2.0 + v10 + 52.0, 68.0);

  return v11;
}

+ (BOOL)_maps_overridePreferredLayoutAttributesWithCompressedSize
{
  return 0;
}

- (RoutePlanningOverviewRouteCreationCellDelegate)delegate
{
  return (RoutePlanningOverviewRouteCreationCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
