@implementation NavContainerResumeRouteControl

- (NavContainerResumeRouteControl)initWithFrame:(CGRect)a3
{
  NavContainerResumeRouteControl *v3;
  NavContainerResumeRouteControl *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  UILayoutGuide *v8;
  UILayoutGuide *contentLayoutGuide;
  void *v10;
  id v11;
  double y;
  double width;
  double height;
  UILabel *v15;
  UILabel *titleLabel;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  UIButton *v27;
  UIButton *closeButton;
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
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
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
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  objc_super v116;
  _QWORD v117[15];

  v116.receiver = self;
  v116.super_class = (Class)NavContainerResumeRouteControl;
  v3 = -[NavContainerResumeRouteControl initWithFrame:](&v116, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (objc_class *)objc_opt_class(v3);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[NavContainerResumeRouteControl setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v7);

    -[NavContainerResumeRouteControl setClipsToBounds:](v4, "setClipsToBounds:", 1);
    v8 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
    contentLayoutGuide = v4->_contentLayoutGuide;
    v4->_contentLayoutGuide = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl contentLayoutGuide](v4, "contentLayoutGuide"));
    -[NavContainerResumeRouteControl addLayoutGuide:](v4, "addLayoutGuide:", v10);

    v11 = objc_alloc((Class)UILabel);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v15 = (UILabel *)objc_msgSend(v11, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl titleLabel](v4, "titleLabel"));
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl titleLabel](v4, "titleLabel"));
    objc_msgSend(v19, "setTextColor:", v18);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_systemFontWithSize:](UIFont, "_maps_systemFontWithSize:", 17.0));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl titleLabel](v4, "titleLabel"));
    objc_msgSend(v21, "setFont:", v20);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl titleLabel](v4, "titleLabel"));
    objc_msgSend(v22, "setNumberOfLines:", 2);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl titleLabel](v4, "titleLabel"));
    LODWORD(v24) = 1148846080;
    objc_msgSend(v23, "setContentCompressionResistancePriority:forAxis:", 1, v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl titleLabel](v4, "titleLabel"));
    objc_msgSend(v25, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl titleLabel](v4, "titleLabel"));
    -[NavContainerResumeRouteControl addSubview:](v4, "addSubview:", v26);

    v27 = (UIButton *)objc_msgSend(objc_alloc((Class)UIButton), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    closeButton = v4->_closeButton;
    v4->_closeButton = v27;

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl closeButton](v4, "closeButton"));
    objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl closeButton](v4, "closeButton"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("xmark.circle.fill")));
    objc_msgSend(v30, "setImage:forState:", v31, 0);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl closeButton](v4, "closeButton"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 19.0));
    objc_msgSend(v32, "setPreferredSymbolConfiguration:forImageInState:", v33, 0);

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl closeButton](v4, "closeButton"));
    objc_msgSend(v35, "setTintColor:", v34);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl closeButton](v4, "closeButton"));
    objc_msgSend(v36, "addTarget:action:forControlEvents:", v4, "_closeButtonAction", 64);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl closeButton](v4, "closeButton"));
    objc_msgSend(v37, "_setTouchInsets:", -3.0, -3.0, -3.0, -3.0);

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl closeButton](v4, "closeButton"));
    objc_msgSend(v38, "setAccessibilityIdentifier:", CFSTR("CloseButton"));

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl closeButton](v4, "closeButton"));
    -[NavContainerResumeRouteControl addSubview:](v4, "addSubview:", v39);

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl contentLayoutGuide](v4, "contentLayoutGuide"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "heightAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToConstant:", 0.0));
    -[NavContainerResumeRouteControl setContentHeightCollapsedConstraint:](v4, "setContentHeightCollapsedConstraint:", v42);

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl closeButton](v4, "closeButton"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "heightAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToConstant:", 40.0));
    -[NavContainerResumeRouteControl setCloseButtonHeightConstraint:](v4, "setCloseButtonHeightConstraint:", v45);

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl contentLayoutGuide](v4, "contentLayoutGuide"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "heightAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToConstant:", 60.0));

    LODWORD(v49) = 1148829696;
    v105 = v48;
    objc_msgSend(v48, "setPriority:", v49);
    v115 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl contentLayoutGuide](v4, "contentLayoutGuide"));
    v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "leadingAnchor"));
    v114 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl safeAreaLayoutGuide](v4, "safeAreaLayoutGuide"));
    v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "leadingAnchor"));
    v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "constraintEqualToAnchor:constant:", v112, 13.0));
    v117[0] = v111;
    v110 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl contentLayoutGuide](v4, "contentLayoutGuide"));
    v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "trailingAnchor"));
    v109 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl safeAreaLayoutGuide](v4, "safeAreaLayoutGuide"));
    v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "trailingAnchor"));
    v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "constraintEqualToAnchor:constant:", v107, -13.0));
    v117[1] = v106;
    v104 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl contentLayoutGuide](v4, "contentLayoutGuide"));
    v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "topAnchor"));
    v103 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl safeAreaLayoutGuide](v4, "safeAreaLayoutGuide"));
    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "topAnchor"));
    v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "constraintEqualToAnchor:", v101));
    v117[2] = v100;
    v99 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl contentLayoutGuide](v4, "contentLayoutGuide"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "bottomAnchor"));
    v97 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl bottomAnchor](v4, "bottomAnchor"));
    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "constraintEqualToAnchor:", v97));
    v117[3] = v96;
    v117[4] = v48;
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl titleLabel](v4, "titleLabel"));
    v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "topAnchor"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl contentLayoutGuide](v4, "contentLayoutGuide"));
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "topAnchor"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToAnchor:", v92));
    v117[5] = v91;
    v90 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl titleLabel](v4, "titleLabel"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "bottomAnchor"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl contentLayoutGuide](v4, "contentLayoutGuide"));
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "bottomAnchor"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "constraintEqualToAnchor:", v87));
    v117[6] = v86;
    v85 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl titleLabel](v4, "titleLabel"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "leadingAnchor"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl contentLayoutGuide](v4, "contentLayoutGuide"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "leadingAnchor"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "constraintEqualToAnchor:", v82));
    v117[7] = v81;
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl titleLabel](v4, "titleLabel"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "trailingAnchor"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl closeButton](v4, "closeButton"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "leadingAnchor"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToAnchor:constant:", v77, -13.0));
    v117[8] = v76;
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl closeButton](v4, "closeButton"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "topAnchor"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl contentLayoutGuide](v4, "contentLayoutGuide"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "topAnchor"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintGreaterThanOrEqualToAnchor:constant:", v72, 10.0));
    v117[9] = v71;
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl closeButton](v4, "closeButton"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "bottomAnchor"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl contentLayoutGuide](v4, "contentLayoutGuide"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "bottomAnchor"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintLessThanOrEqualToAnchor:constant:", v67, -10.0));
    v117[10] = v66;
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl closeButton](v4, "closeButton"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "centerYAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl contentLayoutGuide](v4, "contentLayoutGuide"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "centerYAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:", v62));
    v117[11] = v61;
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl closeButton](v4, "closeButton"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "trailingAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl contentLayoutGuide](v4, "contentLayoutGuide"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "trailingAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v52));
    v117[12] = v53;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl closeButtonHeightConstraint](v4, "closeButtonHeightConstraint"));
    v117[13] = v54;
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl closeButton](v4, "closeButton"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "widthAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToConstant:", 40.0));
    v117[14] = v57;
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v117, 15));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v58);

  }
  return v4;
}

- (void)_closeButtonAction
{
  -[NavContainerResumeRouteControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x1000000);
}

- (void)_updateBackgroundColor
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl theme](self, "theme"));
  if (-[NavContainerResumeRouteControl isHighlighted](self, "isHighlighted"))
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "navResumeRouteBannerHighlightColor"));
  else
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "navResumeRouteBannerBackgroundColor"));
  v4 = (void *)v3;
  -[NavContainerResumeRouteControl setBackgroundColor:](self, "setBackgroundColor:", v3);

}

- (void)didMoveToSuperview
{
  NSLayoutConstraint *topConstraint;
  NSLayoutConstraint *bottomConstraint;
  NSLayoutConstraint *bottomConstraintWhenHidden;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *v11;
  void *v12;
  void *v13;
  void *v14;
  NSLayoutConstraint *v15;
  NSLayoutConstraint *v16;
  void *v17;
  void *v18;
  void *v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)NavContainerResumeRouteControl;
  -[NavContainerResumeRouteControl didMoveToSuperview](&v22, "didMoveToSuperview");
  topConstraint = self->_topConstraint;
  self->_topConstraint = 0;

  bottomConstraint = self->_bottomConstraint;
  self->_bottomConstraint = 0;

  bottomConstraintWhenHidden = self->_bottomConstraintWhenHidden;
  self->_bottomConstraintWhenHidden = 0;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl superview](self, "superview"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl topAnchor](self, "topAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl superview](self, "superview"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topAnchor"));
    v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v9));
    v11 = self->_topConstraint;
    self->_topConstraint = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl bottomAnchor](self, "bottomAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl superview](self, "superview"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
    v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v14));
    v16 = self->_bottomConstraint;
    self->_bottomConstraint = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl bottomAnchor](self, "bottomAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl superview](self, "superview"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topAnchor"));
    v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v19));
    v21 = self->_bottomConstraintWhenHidden;
    self->_bottomConstraintWhenHidden = v20;

  }
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NavContainerResumeRouteControl;
  -[NavContainerResumeRouteControl setHighlighted:](&v4, "setHighlighted:", a3);
  -[NavContainerResumeRouteControl _updateBackgroundColor](self, "_updateBackgroundColor");
}

- (NSString)title
{
  return self->_titleText;
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *titleText;
  NSString *v6;
  id v7;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  titleText = self->_titleText;
  self->_titleText = v4;

  v6 = self->_titleText;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl titleLabel](self, "titleLabel"));
  objc_msgSend(v7, "setText:", v6);

}

- (void)hideIfNeeded
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl contentHeightCollapsedConstraint](self, "contentHeightCollapsedConstraint"));
  v4 = objc_msgSend(v3, "isActive");

  if ((v4 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl titleLabel](self, "titleLabel"));
    objc_msgSend(v5, "setText:", 0);

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100679DC0;
    v6[3] = &unk_1011AC860;
    v6[4] = self;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v6, 0.5);
  }
}

- (void)showIfNeeded
{
  void *v3;
  unsigned int v4;
  NSString *titleText;
  void *v6;
  _QWORD v7[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl contentHeightCollapsedConstraint](self, "contentHeightCollapsedConstraint"));
  v4 = objc_msgSend(v3, "isActive");

  if (v4)
  {
    titleText = self->_titleText;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl titleLabel](self, "titleLabel"));
    objc_msgSend(v6, "setText:", titleText);

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100679ED8;
    v7[3] = &unk_1011AC860;
    v7[4] = self;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v7, 0.5);
  }
}

- (id)constraintsForPositionInStatusBarBackgroundView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl topConstraint](self, "topConstraint"));
  v15[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl bottomConstraint](self, "bottomConstraint"));
  v15[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl leadingAnchor](self, "leadingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v8));
  v15[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl trailingAnchor](self, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
  v15[3] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 4));

  return v13;
}

- (id)initialConstraintsForAnimatingPositionInStatusBarBackgroundView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl bottomConstraintWhenHidden](self, "bottomConstraintWhenHidden"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl leadingAnchor](self, "leadingAnchor", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
  v14[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerResumeRouteControl trailingAnchor](self, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  v14[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 3));

  return v12;
}

- (UILayoutGuide)contentLayoutGuide
{
  return self->_contentLayoutGuide;
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (void)setTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topConstraint, a3);
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (void)setBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomConstraint, a3);
}

- (NSLayoutConstraint)bottomConstraintWhenHidden
{
  return self->_bottomConstraintWhenHidden;
}

- (void)setBottomConstraintWhenHidden:(id)a3
{
  objc_storeStrong((id *)&self->_bottomConstraintWhenHidden, a3);
}

- (NSLayoutConstraint)contentHeightCollapsedConstraint
{
  return self->_contentHeightCollapsedConstraint;
}

- (void)setContentHeightCollapsedConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentHeightCollapsedConstraint, a3);
}

- (NSLayoutConstraint)closeButtonHeightConstraint
{
  return self->_closeButtonHeightConstraint;
}

- (void)setCloseButtonHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_closeButtonHeightConstraint, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_closeButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contentHeightCollapsedConstraint, 0);
  objc_storeStrong((id *)&self->_bottomConstraintWhenHidden, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

@end
