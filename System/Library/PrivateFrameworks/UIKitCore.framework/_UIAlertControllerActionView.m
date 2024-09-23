@implementation _UIAlertControllerActionView

- (_UIAlertControllerActionView)initWithCoder:(id)a3
{
  -[UIResponder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (_UIAlertControllerActionView)initWithFrame:(CGRect)a3
{
  _UIAlertControllerActionView *v3;
  UIView *v4;
  UIView *labelContainerView;
  UILabel *v6;
  UILabel *label;
  UILabel *v8;
  void *v9;
  void *v10;
  NSArray *contentViewControllerConstraints;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_UIAlertControllerActionView;
  v3 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(UIView);
    labelContainerView = v3->_labelContainerView;
    v3->_labelContainerView = v4;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_labelContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setUserInteractionEnabled:](v3->_labelContainerView, "setUserInteractionEnabled:", 0);
    v6 = objc_alloc_init(UILabel);
    label = v3->_label;
    v3->_label = v6;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = v3->_label;
    +[UIColor clearColor](UIColor, "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v8, "setBackgroundColor:", v9);

    -[UILabel _setTextColorFollowsTintColor:](v3->_label, "_setTextColorFollowsTintColor:", 1);
    -[UIView addSubview:](v3, "addSubview:", v3->_labelContainerView);
    -[UIView addSubview:](v3->_labelContainerView, "addSubview:", v3->_label);
    -[UIView setExclusiveTouch:](v3, "setExclusiveTouch:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v3, sel__contentSizeChanged, CFSTR("UIContentSizeCategoryDidChangeNotification"), 0);

    contentViewControllerConstraints = v3->_contentViewControllerConstraints;
    v3->_contentViewControllerConstraints = (NSArray *)MEMORY[0x1E0C9AA60];

    -[_UIAlertControllerActionView _buildConstraints](v3, "_buildConstraints");
    -[_UIAlertControllerActionView _updateLabelAttributes](v3, "_updateLabelAttributes");
    -[UIView setFocusEffect:](v3, "setFocusEffect:", 0);
  }
  return v3;
}

- (NSString)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  -[UIView frame](self, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = objc_opt_class();
  -[UIAlertAction description](self->_action, "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@: %p; frame = (%g %g; %g %g); Action = %@>"),
    v12,
    self,
    v4,
    v6,
    v8,
    v10,
    v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v14;
}

- (int64_t)focusItemDeferralMode
{
  void *v2;
  int64_t v3;

  -[_UIAlertControllerActionView alertController](self, "alertController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_resolvedStyle") != 1;

  return v3;
}

- (void)dealloc
{
  void *v3;
  _UIAlertControllerActionView *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)MEMORY[0x186DC9484](self, a2);
  -[UIAlertAction _representer](self->_action, "_representer");
  v4 = (_UIAlertControllerActionView *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
    -[UIAlertAction _setRepresenter:](self->_action, "_setRepresenter:", 0);
  objc_autoreleasePoolPop(v3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("UIContentSizeCategoryDidChangeNotification"), 0);

  v6.receiver = self;
  v6.super_class = (Class)_UIAlertControllerActionView;
  -[UIView dealloc](&v6, sel_dealloc);
}

- (void)_buildConstraints
{
  void *v3;
  void *v4;
  void *v5;
  NSLayoutConstraint *v6;
  NSLayoutConstraint *labelContainerLeadingConstraint;
  void *v8;
  void *v9;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *labelContainerTrailingConstraint;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSLayoutConstraint *v50;
  NSLayoutConstraint *minimumHeightConstraint;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  _QWORD v67[3];

  v67[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAlertControllerActionView _buildNotHavingDescriptiveLabelConstraints](self, "_buildNotHavingDescriptiveLabelConstraints");
  -[UIView leadingAnchor](self->_labelContainerView, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self, "leadingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintGreaterThanOrEqualToAnchor:", v5);
  v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  labelContainerLeadingConstraint = self->_labelContainerLeadingConstraint;
  self->_labelContainerLeadingConstraint = v6;

  -[UIView trailingAnchor](self->_labelContainerView, "trailingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintLessThanOrEqualToAnchor:", v9);
  v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  labelContainerTrailingConstraint = self->_labelContainerTrailingConstraint;
  self->_labelContainerTrailingConstraint = v10;

  LODWORD(v12) = 1148829696;
  -[NSLayoutConstraint setPriority:](self->_labelContainerLeadingConstraint, "setPriority:", v12);
  LODWORD(v13) = 1148829696;
  -[NSLayoutConstraint setPriority:](self->_labelContainerTrailingConstraint, "setPriority:", v13);
  objc_msgSend(v3, "addObject:", self->_labelContainerLeadingConstraint);
  objc_msgSend(v3, "addObject:", self->_labelContainerTrailingConstraint);
  -[UIView leadingAnchor](self->_labelContainerView, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_label, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView trailingAnchor](self->_labelContainerView, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_label, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v66 = v16;
  LODWORD(v20) = 1140457472;
  objc_msgSend(v16, "setPriority:", v20);
  v65 = v19;
  LODWORD(v21) = 1140457472;
  objc_msgSend(v19, "setPriority:", v21);
  objc_msgSend(v3, "addObject:", v16);
  v22 = v3;
  objc_msgSend(v3, "addObject:", v19);
  -[UIView centerXAnchor](self->_labelContainerView, "centerXAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self, "centerXAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAlertControllerActionView setLabelContainerCenterXConstraint:](self, "setLabelContainerCenterXConstraint:", v25);

  -[_UIAlertControllerActionView labelContainerCenterXConstraint](self, "labelContainerCenterXConstraint");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v27) = 1132068864;
  objc_msgSend(v26, "setPriority:", v27);

  -[UIView centerYAnchor](self->_labelContainerView, "centerYAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self, "centerYAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v29);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView heightAnchor](self->_labelContainerView, "heightAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView heightAnchor](self, "heightAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v31);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIAlertControllerActionView labelContainerCenterXConstraint](self, "labelContainerCenterXConstraint");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v32);

  objc_msgSend(v22, "addObject:", v64);
  objc_msgSend(v22, "addObject:", v63);
  -[UIView leadingAnchor](self->_labelContainerView, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAlertControllerActionView setLabelContainerLeadingPinConstraint:](self, "setLabelContainerLeadingPinConstraint:", v35);

  -[_UIAlertControllerActionView labelContainerLeadingPinConstraint](self, "labelContainerLeadingPinConstraint");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v37) = 1132068864;
  objc_msgSend(v36, "setPriority:", v37);

  -[UIView trailingAnchor](self->_labelContainerView, "trailingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self, "trailingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAlertControllerActionView setLabelContainerTrailingPinConstraint:](self, "setLabelContainerTrailingPinConstraint:", v40);

  -[_UIAlertControllerActionView labelContainerTrailingPinConstraint](self, "labelContainerTrailingPinConstraint");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v42) = 1132068864;
  objc_msgSend(v41, "setPriority:", v42);

  -[UIView trailingAnchor](self->_label, "trailingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_labelContainerView, "trailingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintLessThanOrEqualToAnchor:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "addObject:", v45);
  -[UIView centerYAnchor](self->_label, "centerYAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self, "centerYAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView heightAnchor](self, "heightAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintGreaterThanOrEqualToConstant:", 0.0);
  v50 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  minimumHeightConstraint = self->_minimumHeightConstraint;
  self->_minimumHeightConstraint = v50;

  LODWORD(v52) = 1148829696;
  -[NSLayoutConstraint setPriority:](self->_minimumHeightConstraint, "setPriority:", v52);
  -[UIView heightAnchor](self->_labelContainerView, "heightAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToConstant:", 0.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView topAnchor](self->_labelContainerView, "topAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_label, "topAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v58) = 1111752704;
  objc_msgSend(v54, "setPriority:", v58);
  LODWORD(v59) = 1111752704;
  objc_msgSend(v57, "setPriority:", v59);
  v67[0] = v54;
  v67[1] = v57;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 2);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObjectsFromArray:", v60);

  objc_msgSend(v22, "addObject:", v48);
  objc_msgSend(v22, "addObject:", self->_minimumHeightConstraint);
  v61 = (void *)MEMORY[0x1E0D156E0];
  objc_msgSend(v22, "sortedArrayUsingFunction:context:", compareConstraintsForInsertionPerformance, 0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "activateConstraints:", v62);

}

- (void)_buildNotHavingDescriptiveLabelConstraints
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *notHavingDescriptiveLabelConstraints;
  id v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_label, "leadingAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_labelContainerView, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintGreaterThanOrEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addObject:", v5);
  objc_msgSend(v8, "sortedArrayUsingFunction:context:", compareConstraintsForInsertionPerformance, 0);
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  notHavingDescriptiveLabelConstraints = self->_notHavingDescriptiveLabelConstraints;
  self->_notHavingDescriptiveLabelConstraints = v6;

}

- (void)_buildHavingDescriptiveLabelConstraints
{
  void *v3;
  void *v4;
  NSLayoutConstraint *v5;
  NSLayoutConstraint *descriptiveLabelTrailingToLabelLeadingLabelConstraint;
  void *v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *descriptiveLabelTrailingToContainerCenterConstraint;
  double v11;
  void *v12;
  void *v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *labelCenterLeadingConstraint;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  NSLayoutConstraint *v25;
  NSLayoutConstraint *descriptiveLabelWidthConstraint;
  double v27;
  void *v28;
  NSLayoutConstraint *v29;
  NSLayoutConstraint *labelWidthConstraint;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  NSArray *v39;
  NSArray *havingDescriptiveLabelConstraints;
  id v41;

  v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[UIView trailingAnchor](self->_descriptiveLabel, "trailingAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_label, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v4);
  v5 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  descriptiveLabelTrailingToLabelLeadingLabelConstraint = self->_descriptiveLabelTrailingToLabelLeadingLabelConstraint;
  self->_descriptiveLabelTrailingToLabelLeadingLabelConstraint = v5;

  objc_msgSend(v41, "addObject:", self->_descriptiveLabelTrailingToLabelLeadingLabelConstraint);
  -[UIView trailingAnchor](self->_descriptiveLabel, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_labelContainerView, "centerXAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  descriptiveLabelTrailingToContainerCenterConstraint = self->_descriptiveLabelTrailingToContainerCenterConstraint;
  self->_descriptiveLabelTrailingToContainerCenterConstraint = v9;

  LODWORD(v11) = 1132068864;
  -[NSLayoutConstraint setPriority:](self->_descriptiveLabelTrailingToContainerCenterConstraint, "setPriority:", v11);
  objc_msgSend(v41, "addObject:", self->_descriptiveLabelTrailingToContainerCenterConstraint);
  -[UIView leadingAnchor](self->_label, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_labelContainerView, "centerXAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  labelCenterLeadingConstraint = self->_labelCenterLeadingConstraint;
  self->_labelCenterLeadingConstraint = v14;

  LODWORD(v16) = 1132068864;
  -[NSLayoutConstraint setPriority:](self->_labelCenterLeadingConstraint, "setPriority:", v16);
  objc_msgSend(v41, "addObject:", self->_labelCenterLeadingConstraint);
  -[UIView leadingAnchor](self->_descriptiveLabel, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_labelContainerView, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintGreaterThanOrEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v41, "addObject:", v19);
  -[UIView leadingAnchor](self->_labelContainerView, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_descriptiveLabel, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v23) = 1140457472;
  objc_msgSend(v22, "setPriority:", v23);
  objc_msgSend(v41, "addObject:", v22);
  -[UIView widthAnchor](self->_descriptiveLabel, "widthAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAlertControllerActionViewMetrics descriptiveLabelTextWidth](self->_metrics, "descriptiveLabelTextWidth");
  objc_msgSend(v24, "constraintEqualToConstant:");
  v25 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  descriptiveLabelWidthConstraint = self->_descriptiveLabelWidthConstraint;
  self->_descriptiveLabelWidthConstraint = v25;

  LODWORD(v27) = 1148829696;
  -[NSLayoutConstraint setPriority:](self->_descriptiveLabelWidthConstraint, "setPriority:", v27);
  objc_msgSend(v41, "addObject:", self->_descriptiveLabelWidthConstraint);
  -[UIView widthAnchor](self->_label, "widthAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAlertControllerActionViewMetrics labelTextWidth](self->_metrics, "labelTextWidth");
  objc_msgSend(v28, "constraintEqualToConstant:");
  v29 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  labelWidthConstraint = self->_labelWidthConstraint;
  self->_labelWidthConstraint = v29;

  LODWORD(v31) = 1148829696;
  -[NSLayoutConstraint setPriority:](self->_labelWidthConstraint, "setPriority:", v31);
  objc_msgSend(v41, "addObject:", self->_labelWidthConstraint);
  -[UIView centerYAnchor](self->_descriptiveLabel, "centerYAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self, "centerYAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v41, "addObject:", v34);
  -[UIView centerXAnchor](self->_descriptiveLabel, "centerXAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self, "centerXAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v38) = 1111752704;
  objc_msgSend(v37, "setPriority:", v38);
  objc_msgSend(v41, "addObject:", v34);
  objc_msgSend(v41, "sortedArrayUsingFunction:context:", compareConstraintsForInsertionPerformance, 0);
  v39 = (NSArray *)objc_claimAutoreleasedReturnValue();
  havingDescriptiveLabelConstraints = self->_havingDescriptiveLabelConstraints;
  self->_havingDescriptiveLabelConstraints = v39;

  -[_UIAlertControllerActionView _updateHavingDescriptiveLabelConstraints](self, "_updateHavingDescriptiveLabelConstraints");
}

- (void)_prepareConstraintsForHavingDescriptiveText:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v3 = a3;
  self->_hasDescriptiveText = a3;
  -[_UIAlertControllerActionView _updateHavingDescriptiveLabelConstraints](self, "_updateHavingDescriptiveLabelConstraints");
  v5 = 7;
  if (v3)
    v6 = 15;
  else
    v6 = 7;
  v7 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____UIAlertControllerActionView__labelContainerView[v6]);
  if (!v3)
    v5 = 15;
  if (v7)
    v8 = v7;
  else
    v8 = (void *)MEMORY[0x1E0C9AA60];
  v9 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____UIAlertControllerActionView__labelContainerView[v5]);
  if (!v9)
    v9 = (void *)MEMORY[0x1E0C9AA60];
  v10 = (void *)MEMORY[0x1E0D156E0];
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "deactivateConstraints:", v11);
  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v12);

}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_highlighted != a3)
  {
    v3 = a3;
    self->_highlighted = a3;
    -[UIView _enclosingInterfaceActionRepresentationView](self, "_enclosingInterfaceActionRepresentationView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHighlighted:", v3);

    -[_UIAlertControllerActionView _recomputeColors](self, "_recomputeColors");
  }
}

- (void)applyMetrics:(id)a3
{
  NSLayoutConstraint *descriptiveLabelWidthConstraint;
  NSLayoutConstraint *labelWidthConstraint;
  id v7;

  objc_storeStrong((id *)&self->_metrics, a3);
  v7 = a3;
  descriptiveLabelWidthConstraint = self->_descriptiveLabelWidthConstraint;
  objc_msgSend(v7, "descriptiveLabelTextWidth");
  -[NSLayoutConstraint setConstant:](descriptiveLabelWidthConstraint, "setConstant:");
  labelWidthConstraint = self->_labelWidthConstraint;
  objc_msgSend(v7, "labelTextWidth");
  -[NSLayoutConstraint setConstant:](labelWidthConstraint, "setConstant:");

}

- (double)currentDescriptiveLabelTextWidth
{
  double result;

  -[UILabel intrinsicContentSize](self->_descriptiveLabel, "intrinsicContentSize");
  return result;
}

- (double)currentLabelTextWidth
{
  double result;

  -[UILabel intrinsicContentSize](self->_label, "intrinsicContentSize");
  return result;
}

- (void)_recomputeColors
{
  uint64_t v3;
  UIView *contentViewControllerContainerView;
  void *v5;
  id v6;

  -[_UIAlertControllerActionView _updateLabelAttributes](self, "_updateLabelAttributes");
  -[_UIAlertControllerActionView _updateImageViewAttributes](self, "_updateImageViewAttributes");
  -[_UIAlertControllerActionView action](self, "action");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEnabled"))
    v3 = 1;
  else
    v3 = 2;
  if (-[UIView tintAdjustmentMode](self, "tintAdjustmentMode") != v3)
    -[UIView setTintAdjustmentMode:](self, "setTintAdjustmentMode:", v3);
  contentViewControllerContainerView = self->_contentViewControllerContainerView;
  -[UIView tintColor](self->_label, "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setTintColor:](contentViewControllerContainerView, "setTintColor:", v5);

}

- (void)_updateImageViewAttributes
{
  UIImageView *imageView;
  void *v4;
  UIImageView *checkView;
  void *v6;
  id v7;

  -[_UIAlertControllerActionView visualStyle](self, "visualStyle");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  imageView = self->_imageView;
  -[_UIAlertControllerActionView _interfaceActionViewState](self, "_interfaceActionViewState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configureAttributesForImageView:imageProperty:actionViewState:", imageView, 0x1E16EFC40, v4);

  checkView = self->_checkView;
  -[_UIAlertControllerActionView _interfaceActionViewState](self, "_interfaceActionViewState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configureAttributesForImageView:imageProperty:actionViewState:", checkView, 0x1E16EFC80, v6);

}

- (void)_updateLabelAttributes
{
  void *v3;
  uint64_t v4;
  UILabel *descriptiveLabel;
  UILabel *v6;
  UILabel *label;
  void *v8;
  id v9;

  -[UIAlertAction _descriptiveText](self->_action, "_descriptiveText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
    descriptiveLabel = self->_descriptiveLabel;
  else
    descriptiveLabel = 0;
  v6 = descriptiveLabel;
  -[_UIAlertControllerActionView visualStyle](self, "visualStyle");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  label = self->_label;
  -[_UIAlertControllerActionView _interfaceActionViewState](self, "_interfaceActionViewState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configureAttributesForTitleLabel:classificationLabel:actionViewState:", label, v6, v8);

}

- (void)_loadDescriptiveLabel
{
  UILabel *v3;
  UILabel *descriptiveLabel;
  UILabel *v5;
  void *v6;

  v3 = objc_alloc_init(UILabel);
  descriptiveLabel = self->_descriptiveLabel;
  self->_descriptiveLabel = v3;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_descriptiveLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = self->_descriptiveLabel;
  +[UIColor clearColor](UIColor, "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

  -[UILabel _setTextColorFollowsTintColor:](self->_descriptiveLabel, "_setTextColorFollowsTintColor:", 1);
  -[_UIAlertControllerActionView _updateTextAlignmentForHavingDescriptiveText:titleTextAlignment:](self, "_updateTextAlignmentForHavingDescriptiveText:titleTextAlignment:", self->_hasDescriptiveText, -[UIAlertAction _titleTextAlignment](self->_action, "_titleTextAlignment"));
  -[_UIAlertControllerActionView _updateLabelAttributes](self, "_updateLabelAttributes");
  -[_UIAlertControllerActionView _recomputeColors](self, "_recomputeColors");
  -[UIView addSubview:](self->_labelContainerView, "addSubview:", self->_descriptiveLabel);
  -[_UIAlertControllerActionView _buildHavingDescriptiveLabelConstraints](self, "_buildHavingDescriptiveLabelConstraints");
}

- (void)_updateDescriptiveText
{
  void *v3;
  UILabel *descriptiveLabel;
  void *v5;
  id v6;

  -[_UIAlertControllerActionView action](self, "action");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_descriptiveText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length") && !self->_descriptiveLabel)
    -[_UIAlertControllerActionView _loadDescriptiveLabel](self, "_loadDescriptiveLabel");
  descriptiveLabel = self->_descriptiveLabel;
  objc_msgSend(v6, "_descriptiveText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](descriptiveLabel, "setText:", v5);

}

- (void)_buildImageViewConstraints
{
  void *v3;
  void *v4;
  NSLayoutConstraint *v5;
  NSLayoutConstraint *marginToImageConstraint;
  void *v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *imageViewTopConstraint;
  void *v11;
  void *v12;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *imageViewBottomConstraint;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  id v23;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_imageView, "leadingAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v4);
  v5 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  marginToImageConstraint = self->_marginToImageConstraint;
  self->_marginToImageConstraint = v5;

  objc_msgSend(v23, "addObject:", self->_marginToImageConstraint);
  -[UIView topAnchor](self->_imageView, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintGreaterThanOrEqualToAnchor:", v8);
  v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  imageViewTopConstraint = self->_imageViewTopConstraint;
  self->_imageViewTopConstraint = v9;

  -[UIView bottomAnchor](self->_imageView, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintLessThanOrEqualToAnchor:", v12);
  v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  imageViewBottomConstraint = self->_imageViewBottomConstraint;
  self->_imageViewBottomConstraint = v13;

  -[_UIAlertControllerActionView _prepareConstraintsForImage:](self, "_prepareConstraintsForImage:", 0);
  objc_msgSend(v23, "addObject:", self->_imageViewBaselineOrCenterYConstraint);
  objc_msgSend(v23, "addObject:", self->_imageViewTopConstraint);
  objc_msgSend(v23, "addObject:", self->_imageViewBottomConstraint);
  -[UIView widthAnchor](self->_imageView, "widthAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToConstant:", 0.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v17) = 1111752704;
  objc_msgSend(v16, "setPriority:", v17);
  -[UIView heightAnchor](self->_imageView, "heightAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToConstant:", 0.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v20) = 1111752704;
  objc_msgSend(v19, "setPriority:", v20);
  objc_msgSend(v23, "addObject:", v16);
  objc_msgSend(v23, "addObject:", v19);
  -[_UIAlertControllerActionView _updateImageMargins](self, "_updateImageMargins");
  v21 = (void *)MEMORY[0x1E0D156E0];
  objc_msgSend(v23, "sortedArrayUsingFunction:context:", compareConstraintsForInsertionPerformance, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activateConstraints:", v22);

}

- (void)_prepareConstraintsForImage:(id)a3
{
  id v4;
  NSLayoutConstraint **p_imageViewBaselineOrCenterYConstraint;
  NSLayoutConstraint *v6;
  NSLayoutConstraint *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSLayoutConstraint *imageViewBaselineOrCenterYConstraint;
  NSLayoutConstraint *v12;
  void *v13;
  uint64_t v14;
  NSLayoutConstraint *v15;
  id v16;

  v4 = a3;
  v16 = v4;
  if (v4 && !objc_msgSend(v4, "hasBaseline"))
  {
    p_imageViewBaselineOrCenterYConstraint = &self->_imageViewBaselineOrCenterYConstraint;
    imageViewBaselineOrCenterYConstraint = self->_imageViewBaselineOrCenterYConstraint;
    if (!imageViewBaselineOrCenterYConstraint)
      goto LABEL_12;
    if (-[NSLayoutConstraint firstAttribute](imageViewBaselineOrCenterYConstraint, "firstAttribute") == NSLayoutAttributeLastBaseline)
    {
      -[NSLayoutConstraint setActive:](*p_imageViewBaselineOrCenterYConstraint, "setActive:", 0);
      v12 = *p_imageViewBaselineOrCenterYConstraint;
      *p_imageViewBaselineOrCenterYConstraint = 0;

    }
    v8 = v16;
    if (!*p_imageViewBaselineOrCenterYConstraint)
    {
LABEL_12:
      -[UIView centerYAnchor](self->_imageView, "centerYAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView centerYAnchor](self, "centerYAnchor");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
  }
  else
  {
    p_imageViewBaselineOrCenterYConstraint = &self->_imageViewBaselineOrCenterYConstraint;
    v6 = self->_imageViewBaselineOrCenterYConstraint;
    if (!v6)
      goto LABEL_7;
    if (-[NSLayoutConstraint firstAttribute](v6, "firstAttribute") == NSLayoutAttributeCenterY)
    {
      -[NSLayoutConstraint setActive:](*p_imageViewBaselineOrCenterYConstraint, "setActive:", 0);
      v7 = *p_imageViewBaselineOrCenterYConstraint;
      *p_imageViewBaselineOrCenterYConstraint = 0;

    }
    v8 = v16;
    if (!*p_imageViewBaselineOrCenterYConstraint)
    {
LABEL_7:
      -[UIView lastBaselineAnchor](self->_imageView, "lastBaselineAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView lastBaselineAnchor](self->_label, "lastBaselineAnchor");
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      v13 = (void *)v10;
      objc_msgSend(v9, "constraintEqualToAnchor:", v10);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *p_imageViewBaselineOrCenterYConstraint;
      *p_imageViewBaselineOrCenterYConstraint = (NSLayoutConstraint *)v14;

      -[NSLayoutConstraint setActive:](*p_imageViewBaselineOrCenterYConstraint, "setActive:", 1);
      v8 = v16;
    }
  }

}

- (void)_loadImageView
{
  UIImageView *v3;
  UIImageView *imageView;

  v3 = objc_alloc_init(UIImageView);
  imageView = self->_imageView;
  self->_imageView = v3;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView _setDefaultRenderingMode:](self->_imageView, "_setDefaultRenderingMode:", 2);
  -[_UIAlertControllerActionView _recomputeColors](self, "_recomputeColors");
  -[UIView addSubview:](self, "addSubview:", self->_imageView);
  -[_UIAlertControllerActionView _buildImageViewConstraints](self, "_buildImageViewConstraints");
}

- (void)_updateImageView
{
  uint64_t v3;
  id v4;

  -[UIAlertAction image](self->_action, "image");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (id)v3;
  if (v3 && !self->_imageView)
  {
    -[_UIAlertControllerActionView _loadImageView](self, "_loadImageView");
    v3 = (uint64_t)v4;
  }
  -[UIImageView setImage:](self->_imageView, "setImage:", v3);
  -[_UIAlertControllerActionView _prepareConstraintsForImage:](self, "_prepareConstraintsForImage:", v4);

}

- (void)_buildCheckViewConstraints
{
  void *v3;
  void *v4;
  NSLayoutConstraint *v5;
  NSLayoutConstraint *checkToMarginConstraint;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_checkView, "trailingAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self, "trailingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v4);
  v5 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  checkToMarginConstraint = self->_checkToMarginConstraint;
  self->_checkToMarginConstraint = v5;

  objc_msgSend(v10, "addObject:", self->_checkToMarginConstraint);
  -[UIView lastBaselineAnchor](self->_checkView, "lastBaselineAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView lastBaselineAnchor](self->_label, "lastBaselineAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addObject:", v9);
  -[_UIAlertControllerActionView _updateImageMargins](self, "_updateImageMargins");
  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v10);

}

- (void)_loadCheckView
{
  UIImageView *v3;
  UIImageView *checkView;
  void *v5;
  id v6;

  v3 = objc_alloc_init(UIImageView);
  checkView = self->_checkView;
  self->_checkView = v3;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_checkView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView _setDefaultRenderingMode:](self->_checkView, "_setDefaultRenderingMode:", 2);
  -[UIImageView setHidden:](self->_checkView, "setHidden:", 1);
  +[UIImageSymbolConfiguration configurationWithTextStyle:](UIImageSymbolConfiguration, "configurationWithTextStyle:", CFSTR("UICTFontTextStyleBody"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("checkmark"), v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[UIImageView setImage:](self->_checkView, "setImage:", v6);
  -[_UIAlertControllerActionView _recomputeColors](self, "_recomputeColors");
  -[UIView addSubview:](self, "addSubview:", self->_checkView);
  -[_UIAlertControllerActionView _buildCheckViewConstraints](self, "_buildCheckViewConstraints");

}

- (void)_updateCheckImageView
{
  void *v3;
  int v4;

  -[_UIAlertControllerActionView action](self, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isChecked");

  if (v4 && !self->_checkView)
    -[_UIAlertControllerActionView _loadCheckView](self, "_loadCheckView");
  -[UIImageView setHidden:](self->_checkView, "setHidden:", v4 ^ 1u);
  -[_UIAlertControllerActionView _updateLabelContainerConstraints](self, "_updateLabelContainerConstraints");
}

- (void)_buildContentViewControllerContainerConstraints
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
  NSArray *v15;
  NSArray *contentViewControllerConstraints;
  id v17;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_contentViewControllerContainerView, "leadingAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v5);

  -[UIView topAnchor](self->_contentViewControllerContainerView, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v8);

  -[UIView widthAnchor](self->_contentViewControllerContainerView, "widthAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView widthAnchor](self, "widthAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v11);

  -[UIView heightAnchor](self->_contentViewControllerContainerView, "heightAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView heightAnchor](self, "heightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v14);

  objc_msgSend(v17, "sortedArrayUsingFunction:context:", compareConstraintsForInsertionPerformance, 0);
  v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
  contentViewControllerConstraints = self->_contentViewControllerConstraints;
  self->_contentViewControllerConstraints = v15;

}

- (void)_loadContentViewControllerView
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
  id v17;

  -[_UIAlertControllerActionView _loadContentViewControllerContainerViewIfNecessary](self, "_loadContentViewControllerContainerViewIfNecessary");
  -[_UIAlertControllerActionView action](self, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_contentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setPreservesSuperviewLayoutMargins:", 1);
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", self->_contentViewControllerConstraints);
  -[UIAlertAction _willAddContentViewController](self->_action, "_willAddContentViewController");
  -[UIView addSubview:](self->_contentViewControllerContainerView, "addSubview:", v17);
  -[UIView leadingAnchor](self, "leadingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

  -[UIView trailingAnchor](self, "trailingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", 1);

  -[UIView topAnchor](self, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

  -[UIView bottomAnchor](self, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  -[UIAlertAction _didAddContentViewController](self->_action, "_didAddContentViewController");
}

- (void)_loadContentViewControllerContainerViewIfNecessary
{
  UIView *v3;
  UIView *v4;
  UIView *contentViewControllerContainerView;
  UIView *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;

  if (!self->_contentViewControllerContainerView)
  {
    v3 = [UIView alloc];
    -[UIView bounds](self, "bounds");
    v4 = -[UIView initWithFrame:](v3, "initWithFrame:");
    contentViewControllerContainerView = self->_contentViewControllerContainerView;
    self->_contentViewControllerContainerView = v4;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentViewControllerContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setClipsToBounds:](self->_contentViewControllerContainerView, "setClipsToBounds:", 1);
    v6 = self->_contentViewControllerContainerView;
    -[_UIAlertControllerActionView visualStyle](self, "visualStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentHorizontalMargin");
    v9 = v8;
    -[_UIAlertControllerActionView visualStyle](self, "visualStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentHorizontalMargin");
    -[UIView setLayoutMargins:](v6, "setLayoutMargins:", 0.0, v9, 0.0, v11);

    -[_UIAlertControllerActionView _recomputeColors](self, "_recomputeColors");
    -[UIView addSubview:](self, "addSubview:", self->_contentViewControllerContainerView);
    -[_UIAlertControllerActionView _buildContentViewControllerContainerConstraints](self, "_buildContentViewControllerContainerConstraints");
  }
}

- (void)_removeContentViewControllerContainerViewSubviews
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:", self->_contentViewControllerConstraints);
  -[UIView subviews](self->_contentViewControllerContainerView, "subviews");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeObjectsPerformSelector:", sel_removeFromSuperview);

}

- (void)updateSizeUsingAXEnforcedWidth:(double)a3
{
  if (self->_axEnforcedWidth != a3)
  {
    self->_axEnforcedWidth = a3;
    -[_UIAlertControllerActionView _updateMinimumHeightAndDesiredWidthConstraints](self, "_updateMinimumHeightAndDesiredWidthConstraints");
  }
}

- (void)_updateMinimumHeightAndDesiredWidthConstraints
{
  void *v3;
  double v4;
  double v5;
  double axEnforcedWidth;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  NSLayoutConstraint *axLabelContainerWidthConstraint;
  void *v18;
  NSLayoutConstraint *v19;
  NSLayoutConstraint *v20;
  double v21;
  double v22;
  id v23;

  -[_UIAlertControllerActionView visualStyle](self, "visualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minimumActionContentSize");
  v5 = v4;

  if (-[UILabel numberOfLines](self->_label, "numberOfLines")
    || (axEnforcedWidth = self->_axEnforcedWidth, axEnforcedWidth <= 0.0))
  {
    -[NSLayoutConstraint setActive:](self->_axLabelContainerWidthConstraint, "setActive:", 0);
  }
  else
  {
    -[NSLayoutConstraint constant](self->_labelContainerLeadingConstraint, "constant");
    v8 = axEnforcedWidth - v7;
    -[NSLayoutConstraint constant](self->_labelContainerTrailingConstraint, "constant");
    -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", v8 + v9, 0.0);
    v11 = v10;
    v13 = v12;
    -[_UIAlertControllerActionView visualStyle](self, "visualStyle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "contentVerticalMargin");
    v16 = v13 + v15 + v15;

    if (v5 < v16)
      v5 = v16;
    axLabelContainerWidthConstraint = self->_axLabelContainerWidthConstraint;
    if (!axLabelContainerWidthConstraint)
    {
      -[UIView widthAnchor](self->_labelContainerView, "widthAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToConstant:", v11);
      v19 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v20 = self->_axLabelContainerWidthConstraint;
      self->_axLabelContainerWidthConstraint = v19;

      LODWORD(v21) = 1144750080;
      -[NSLayoutConstraint setPriority:](self->_axLabelContainerWidthConstraint, "setPriority:", v21);
      -[NSLayoutConstraint setActive:](self->_axLabelContainerWidthConstraint, "setActive:", 1);
      axLabelContainerWidthConstraint = self->_axLabelContainerWidthConstraint;
    }
    -[NSLayoutConstraint setConstant:](axLabelContainerWidthConstraint, "setConstant:", v11);
  }
  -[NSLayoutConstraint constant](self->_minimumHeightConstraint, "constant");
  if (v5 != v22)
  {
    -[NSLayoutConstraint setConstant:](self->_minimumHeightConstraint, "setConstant:", v5);
    -[UIView _enclosingInterfaceActionRepresentationView](self, "_enclosingInterfaceActionRepresentationView");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "invalidateIntrinsicContentSize");

  }
}

- (void)_updateImageMargins
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  -[_UIAlertControllerActionView visualStyle](self, "visualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionImageMarginForAction");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[NSLayoutConstraint setConstant:](self->_marginToImageConstraint, "setConstant:", v7);
  -[NSLayoutConstraint setConstant:](self->_checkToMarginConstraint, "setConstant:", -v11);
  -[NSLayoutConstraint setConstant:](self->_imageViewTopConstraint, "setConstant:", v5);
  -[NSLayoutConstraint setConstant:](self->_imageViewBottomConstraint, "setConstant:", -v9);
}

- (void)_updateTextAlignmentForHavingDescriptiveText:(BOOL)a3 titleTextAlignment:(int64_t)a4
{
  int64_t v4;
  int *v6;
  uint64_t v7;
  void *v9;

  v4 = a4;
  v6 = &OBJC_IVAR____UIAlertControllerActionView__label;
  if (a3)
  {
    if (a4 != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIAlertControllerActionView.m"), 672, CFSTR("Customizing the title text alignment of an alert action is not supported with descriptive text"));

    }
    v7 = objc_msgSend(off_1E1679C48, "defaultWritingDirectionForLanguage:", 0);
    v4 = 2 * (v7 == 0);
    v6 = &OBJC_IVAR____UIAlertControllerActionView__descriptiveLabel;
    -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", 2 * (v7 != 0));
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v6), "setTextAlignment:", v4);
}

- (void)_updateLabelContainerConstraints
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double *v15;
  double v16;
  double v17;
  int64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;

  -[_UIAlertControllerActionView visualStyle](self, "visualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentHorizontalMargin");
  v5 = v4;

  -[_UIAlertControllerActionView visualStyle](self, "visualStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentHorizontalMargin");
  v8 = v7;

  -[_UIAlertControllerActionView visualStyle](self, "visualStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionImageMarginForAction");
  v11 = v10;
  v13 = v12;

  -[UIAlertAction image](self->_action, "image");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (double *)MEMORY[0x1E0C9D820];
  if (v14)
  {
    -[UIView systemLayoutSizeFittingSize:](self->_imageView, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v5 = v13 + v5 + v16;
  }
  if (-[UIAlertAction _isChecked](self->_action, "_isChecked"))
  {
    -[UIView systemLayoutSizeFittingSize:](self->_checkView, "systemLayoutSizeFittingSize:", *v15, v15[1]);
    v8 = v11 + v8 + v17;
  }
  v18 = -[_UIAlertControllerActionView _effectiveTitleTextAlignment](self, "_effectiveTitleTextAlignment");
  switch(v18)
  {
    case 0:
      -[_UIAlertControllerActionView labelContainerLeadingPinConstraint](self, "labelContainerLeadingPinConstraint");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setActive:", 1);

      -[_UIAlertControllerActionView labelContainerCenterXConstraint](self, "labelContainerCenterXConstraint");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setActive:", 0);

      -[_UIAlertControllerActionView labelContainerTrailingPinConstraint](self, "labelContainerTrailingPinConstraint");
      v24 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      v21 = (void *)v24;
LABEL_14:
      objc_msgSend(v21, "setActive:", 0);

      break;
    case 2:
      -[_UIAlertControllerActionView labelContainerTrailingPinConstraint](self, "labelContainerTrailingPinConstraint");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setActive:", 1);

      -[_UIAlertControllerActionView labelContainerCenterXConstraint](self, "labelContainerCenterXConstraint");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setActive:", 0);

      -[_UIAlertControllerActionView labelContainerLeadingPinConstraint](self, "labelContainerLeadingPinConstraint");
      v24 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 1:
      if (v5 >= v8)
        v8 = v5;
      -[_UIAlertControllerActionView labelContainerCenterXConstraint](self, "labelContainerCenterXConstraint");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setActive:", 1);

      -[_UIAlertControllerActionView labelContainerLeadingPinConstraint](self, "labelContainerLeadingPinConstraint");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setActive:", 0);

      -[_UIAlertControllerActionView labelContainerTrailingPinConstraint](self, "labelContainerTrailingPinConstraint");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v8;
      goto LABEL_14;
  }
  -[NSLayoutConstraint setConstant:](self->_labelContainerLeadingConstraint, "setConstant:", v5);
  -[NSLayoutConstraint setConstant:](self->_labelContainerTrailingConstraint, "setConstant:", -v8);
}

- (int64_t)_effectiveTitleTextAlignment
{
  int64_t result;

  result = -[UIAlertAction _titleTextAlignment](self->_action, "_titleTextAlignment");
  if (result == 4)
    return 0;
  return result;
}

- (void)_updateHavingDescriptiveLabelConstraints
{
  void *v3;
  double v4;
  double v5;

  if (self->_hasDescriptiveText)
  {
    -[_UIAlertControllerActionView visualStyle](self, "visualStyle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contentHorizontalMargin");
    v5 = v4;

    -[NSLayoutConstraint setConstant:](self->_descriptiveLabelTrailingToLabelLeadingLabelConstraint, "setConstant:", -v5);
    -[NSLayoutConstraint setConstant:](self->_descriptiveLabelTrailingToContainerCenterConstraint, "setConstant:", -(v5 * 0.5));
    -[NSLayoutConstraint setConstant:](self->_labelCenterLeadingConstraint, "setConstant:", v5 * 0.5);
  }
}

- (void)_updateContentViewControllerContainerViewConstraints
{
  UIView *contentViewControllerContainerView;
  double v4;
  double v5;
  void *v6;
  double v7;
  id v8;

  contentViewControllerContainerView = self->_contentViewControllerContainerView;
  -[_UIAlertControllerActionView visualStyle](self, "visualStyle");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentHorizontalMargin");
  v5 = v4;
  -[_UIAlertControllerActionView visualStyle](self, "visualStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentHorizontalMargin");
  -[UIView setLayoutMargins:](contentViewControllerContainerView, "setLayoutMargins:", 0.0, v5, 0.0, v7);

}

- (void)setAction:(id)a3
{
  UIAlertAction **p_action;
  _UIAlertControllerActionView *v6;
  UIAlertAction *v7;
  UIAlertAction *v8;
  void *v9;
  UIAlertAction *v10;
  void *v11;
  UIAlertAction *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  UIAlertAction *v18;

  v18 = (UIAlertAction *)a3;
  -[_UIAlertControllerActionView _removeContentViewControllerContainerViewSubviews](self, "_removeContentViewControllerContainerViewSubviews");
  p_action = &self->_action;
  -[UIAlertAction _representer](self->_action, "_representer");
  v6 = (_UIAlertControllerActionView *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
    -[UIAlertAction _setRepresenter:](*p_action, "_setRepresenter:", 0);
  v7 = v18;
  if (*p_action != v18)
  {
    objc_storeStrong((id *)&self->_action, a3);
    v7 = *p_action;
  }
  -[UIAlertAction _setRepresenter:](v7, "_setRepresenter:", self);
  v8 = *p_action;
  -[UIAlertAction title](*p_action, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAlertControllerActionView _action:changedToTitle:](self, "_action:changedToTitle:", v8, v9);

  -[_UIAlertControllerActionView _updateDescriptiveText](self, "_updateDescriptiveText");
  -[_UIAlertControllerActionView _updateImageView](self, "_updateImageView");
  -[_UIAlertControllerActionView _action:changedToChecked:](self, "_action:changedToChecked:", *p_action, -[UIAlertAction _isChecked](*p_action, "_isChecked"));
  -[_UIAlertControllerActionView _action:changedToBePreferred:](self, "_action:changedToBePreferred:", *p_action, -[UIAlertAction _isPreferred](*p_action, "_isPreferred"));
  v10 = *p_action;
  -[UIAlertAction _imageTintColor](*p_action, "_imageTintColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAlertControllerActionView _action:updatedImageTintColor:](self, "_action:updatedImageTintColor:", v10, v11);

  v12 = *p_action;
  -[UIAlertAction _titleTextColor](*p_action, "_titleTextColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAlertControllerActionView _action:updatedTitleTextColor:](self, "_action:updatedTitleTextColor:", v12, v13);

  -[UIAlertAction _descriptiveText](*p_action, "_descriptiveText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length") != 0;

  -[_UIAlertControllerActionView _prepareConstraintsForHavingDescriptiveText:](self, "_prepareConstraintsForHavingDescriptiveText:", v15);
  -[_UIAlertControllerActionView _updateTextAlignmentForHavingDescriptiveText:titleTextAlignment:](self, "_updateTextAlignmentForHavingDescriptiveText:titleTextAlignment:", v15, -[UIAlertAction _titleTextAlignment](*p_action, "_titleTextAlignment"));
  -[_UIAlertControllerActionView _updateLabelContainerConstraints](self, "_updateLabelContainerConstraints");
  -[_UIAlertControllerActionView action](self, "action");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_contentViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    -[_UIAlertControllerActionView _loadContentViewControllerView](self, "_loadContentViewControllerView");
  else
    -[_UIAlertControllerActionView _removeContentViewControllerContainerViewSubviews](self, "_removeContentViewControllerContainerViewSubviews");

}

- (void)setVisualStyle:(id)a3
{
  id WeakRetained;
  char v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_visualStyle);
  v5 = objc_msgSend(WeakRetained, "isEqual:", obj);

  if ((v5 & 1) == 0)
  {
    objc_storeWeak((id *)&self->_visualStyle, obj);
    -[_UIAlertControllerActionView _updateStyle](self, "_updateStyle");
  }

}

- (void)_updateStyle
{
  void *v3;

  -[_UIAlertControllerActionView visualStyle](self, "visualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UIAlertControllerActionView _recomputeColors](self, "_recomputeColors");
    -[_UIAlertControllerActionView _updateLabelAttributes](self, "_updateLabelAttributes");
    -[_UIAlertControllerActionView _updateMinimumHeightAndDesiredWidthConstraints](self, "_updateMinimumHeightAndDesiredWidthConstraints");
    -[_UIAlertControllerActionView _updateImageMargins](self, "_updateImageMargins");
    -[_UIAlertControllerActionView _updateLabelContainerConstraints](self, "_updateLabelContainerConstraints");
    -[_UIAlertControllerActionView _updateHavingDescriptiveLabelConstraints](self, "_updateHavingDescriptiveLabelConstraints");
    -[_UIAlertControllerActionView _updateContentViewControllerContainerViewConstraints](self, "_updateContentViewControllerContainerViewConstraints");
    -[_UIAlertControllerActionView _updateCheckImageView](self, "_updateCheckImageView");
  }
}

- (UIAlertAction)action
{
  return self->_action;
}

- (id)_interfaceActionViewState
{
  return +[UIInterfaceActionViewState viewStateForAlertControllerActionView:](UIInterfaceActionViewState, "viewStateForAlertControllerActionView:", self);
}

- (BOOL)hasLayoutHeightConstraintsIdenticalToInterfaceActionCustomView:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    -[_UIAlertControllerActionView action](self, "action");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "action");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_contentViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(v8, "_contentViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v10 == 0;

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)hasActiveMinimumSizeConstraintsWithSize:(CGSize)a3
{
  double height;
  double width;
  _BOOL4 v6;
  double v7;

  height = a3.height;
  width = a3.width;
  v6 = -[NSLayoutConstraint isActive](self->_minimumHeightConstraint, "isActive");
  if (v6)
  {
    -[NSLayoutConstraint constant](self->_minimumHeightConstraint, "constant");
    LOBYTE(v6) = v7 == height && width == 0.0;
  }
  return v6;
}

- (void)_action:(id)a3 changedToTitle:(id)a4
{
  -[UILabel setText:](self->_label, "setText:", a4);
}

- (void)_action:(id)a3 changedToTitleTextAlignment:(int64_t)a4
{
  id v5;

  objc_msgSend(a3, "_descriptiveText");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIAlertControllerActionView _updateTextAlignmentForHavingDescriptiveText:titleTextAlignment:](self, "_updateTextAlignmentForHavingDescriptiveText:titleTextAlignment:", v5 != 0, -[UIAlertAction _titleTextAlignment](self->_action, "_titleTextAlignment"));

}

- (void)_action:(id)a3 changedToEnabled:(BOOL)a4
{
  id v5;

  -[_UIAlertControllerActionView _recomputeColors](self, "_recomputeColors", a3, a4);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIResponder touchesCancelled:withEvent:](self, "touchesCancelled:withEvent:", v5, 0);

}

- (void)_action:(id)a3 updatedImageTintColor:(id)a4
{
  -[UIView setTintColor:](self->_imageView, "setTintColor:", a4);
}

- (NSLayoutConstraint)labelContainerCenterXConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 464, 1);
}

- (void)setLabelContainerCenterXConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 464);
}

- (NSLayoutConstraint)labelContainerLeadingPinConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 472, 1);
}

- (void)setLabelContainerLeadingPinConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 472);
}

- (NSLayoutConstraint)labelContainerTrailingPinConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 480, 1);
}

- (void)setLabelContainerTrailingPinConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 480);
}

- (UIAlertController)alertController
{
  return (UIAlertController *)objc_loadWeakRetained((id *)&self->_alertController);
}

- (void)setAlertController:(id)a3
{
  objc_storeWeak((id *)&self->_alertController, a3);
}

- (UIAlertControllerVisualStyle)visualStyle
{
  return (UIAlertControllerVisualStyle *)objc_loadWeakRetained((id *)&self->_visualStyle);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_alertController);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_destroyWeak((id *)&self->_visualStyle);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_minimumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewBaselineOrCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_marginToImageConstraint, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_checkToMarginConstraint, 0);
  objc_storeStrong((id *)&self->_checkView, 0);
  objc_storeStrong((id *)&self->_descriptiveLabelTrailingToContainerCenterConstraint, 0);
  objc_storeStrong((id *)&self->_descriptiveLabelTrailingToLabelLeadingLabelConstraint, 0);
  objc_storeStrong((id *)&self->_descriptiveLabelWidthConstraint, 0);
  objc_storeStrong((id *)&self->_notHavingDescriptiveLabelConstraints, 0);
  objc_storeStrong((id *)&self->_havingDescriptiveLabelConstraints, 0);
  objc_storeStrong((id *)&self->_descriptiveLabel, 0);
  objc_storeStrong((id *)&self->_contentViewControllerConstraints, 0);
  objc_storeStrong((id *)&self->_contentViewControllerContainerView, 0);
  objc_storeStrong((id *)&self->_labelCenterLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_labelWidthConstraint, 0);
  objc_storeStrong((id *)&self->_labelContainerTrailingPinConstraint, 0);
  objc_storeStrong((id *)&self->_labelContainerLeadingPinConstraint, 0);
  objc_storeStrong((id *)&self->_labelContainerCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_labelContainerTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_labelContainerLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_axLabelContainerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_labelContainerView, 0);
}

@end
