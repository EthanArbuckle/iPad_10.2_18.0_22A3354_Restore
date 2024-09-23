@implementation _UIContentUnavailableView

- (_UIContentUnavailableView)initWithFrame:(CGRect)a3 title:(id)a4 style:(unint64_t)a5 includeBackdrop:(BOOL)a6
{
  _BOOL4 v6;
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  id v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _UIContentUnavailableView *v24;
  _UIContentUnavailableView *v25;
  uint64_t v26;
  NSString *title;
  UIScrollView *v28;
  uint64_t v29;
  UIScrollView *scrollView;
  UIView *v31;
  uint64_t v32;
  UIView *containerView;
  _UIBackdropView *v34;
  _UIBackdropView *backdrop;
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
  _UIContentUnavailableView *v48;
  _UIContentUnavailableView *v49;
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
  double v71;
  void *v72;
  double v73;
  void *v74;
  double v75;
  void *v76;
  uint64_t v77;
  void *v78;
  UIScrollView *v79;
  void *v80;
  void *v81;
  void *v82;
  UIScrollView *v83;
  void *v84;
  void *v85;
  void *v86;
  UIScrollView *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  UIScrollView *v93;
  void *v94;
  void *v95;
  id v96;
  objc_super v98;
  _QWORD v99[2];
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;

  v6 = a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v99[1] = *MEMORY[0x1E0C80C00];
  v14 = a4;
  if (!a5 && v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIContentUnavailableView.m"), 138, CFSTR("UIContentUnavailableStyleAutomatic does not currently support backdrops"));

  }
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "userInterfaceIdiom") == 1)
    v17 = 184.0;
  else
    v17 = 60.0;

  -[_UIContentUnavailableView _labelVerticalSpacing](self, "_labelVerticalSpacing");
  v19 = v18;
  v100.origin.x = x;
  v100.origin.y = y;
  v100.size.width = width;
  v100.size.height = height;
  v20 = CGRectGetWidth(v100);
  if (v20 >= v17)
    v21 = v20;
  else
    v21 = v17;
  v101.origin.x = x;
  v101.origin.y = y;
  v101.size.width = v21;
  v101.size.height = height;
  v22 = CGRectGetHeight(v101);
  if (v22 >= v19)
    v23 = v22;
  else
    v23 = v19;
  v98.receiver = self;
  v98.super_class = (Class)_UIContentUnavailableView;
  v24 = -[UIView initWithFrame:](&v98, sel_initWithFrame_, x, y, v21, v23);
  v25 = v24;
  if (v24)
  {
    v24->_style = a5;
    v26 = objc_msgSend(v14, "copy");
    title = v25->_title;
    v25->_title = (NSString *)v26;

    -[UIView setAutoresizingMask:](v25, "setAutoresizingMask:", 18);
    v28 = [UIScrollView alloc];
    -[UIView bounds](v25, "bounds");
    v29 = -[UIScrollView initWithFrame:](v28, "initWithFrame:", 0.0, 0.0, CGRectGetWidth(v102), 100.0);
    scrollView = v25->_scrollView;
    v25->_scrollView = (UIScrollView *)v29;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v25->_scrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setClipsToBounds:](v25->_scrollView, "setClipsToBounds:", 0);
    -[UIScrollView _setApplyVerticalSafeAreaInsetsToNonscrollingContent:](v25->_scrollView, "_setApplyVerticalSafeAreaInsetsToNonscrollingContent:", 1);
    v31 = [UIView alloc];
    -[UIView bounds](v25, "bounds");
    v32 = -[UIView initWithFrame:](v31, "initWithFrame:", 0.0, 0.0, CGRectGetWidth(v103), 100.0);
    containerView = v25->_containerView;
    v25->_containerView = (UIView *)v32;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v25->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v25->_scrollView, "addSubview:", v25->_containerView);
    if (v6)
    {
      v34 = -[_UIBackdropView initWithPrivateStyle:]([_UIBackdropView alloc], "initWithPrivateStyle:", 2030);
      backdrop = v25->_backdrop;
      v25->_backdrop = v34;

      -[UIView setUserInteractionEnabled:](v25->_backdrop, "setUserInteractionEnabled:", 1);
      -[UIView addSubview:](v25, "addSubview:", v25->_backdrop);
      -[UIView topAnchor](v25->_backdrop, "topAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](v25, "topAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "constraintEqualToAnchor:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addConstraint:](v25, "addConstraint:", v38);

      -[UIView leftAnchor](v25->_backdrop, "leftAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leftAnchor](v25, "leftAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "constraintEqualToAnchor:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addConstraint:](v25, "addConstraint:", v41);

      -[UIView bottomAnchor](v25->_backdrop, "bottomAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](v25, "bottomAnchor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "constraintEqualToAnchor:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addConstraint:](v25, "addConstraint:", v44);

      -[UIView rightAnchor](v25->_backdrop, "rightAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView rightAnchor](v25, "rightAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "constraintEqualToAnchor:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addConstraint:](v25, "addConstraint:", v47);

      -[_UIBackdropView contentView](v25->_backdrop, "contentView");
      v48 = (_UIContentUnavailableView *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v48 = v25;
    }
    v49 = v48;
    -[UIView _setHostsLayoutEngine:](v48, "_setHostsLayoutEngine:", 1);
    -[UIView addSubview:](v49, "addSubview:", v25->_scrollView);
    -[UIView topAnchor](v25->_containerView, "topAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v25->_scrollView, "topAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](v49, "addConstraint:", v52);

    -[UIView bottomAnchor](v25->_containerView, "bottomAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v25->_scrollView, "bottomAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](v49, "addConstraint:", v55);

    -[UIView leadingAnchor](v25->_scrollView, "leadingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v25->_containerView, "leadingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](v49, "addConstraint:", v58);

    -[UIView trailingAnchor](v25->_scrollView, "trailingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v25->_containerView, "trailingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](v49, "addConstraint:", v61);

    -[UIView centerXAnchor](v25->_containerView, "centerXAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](v25->_scrollView, "centerXAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](v49, "addConstraint:", v64);

    -[UIView heightAnchor](v25->_scrollView, "heightAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView heightAnchor](v49, "heightAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintLessThanOrEqualToAnchor:", v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](v49, "addConstraint:", v67);

    -[UIView heightAnchor](v25->_scrollView, "heightAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView heightAnchor](v25->_containerView, "heightAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:constant:", v69, 0.0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v71) = 1144750080;
    objc_msgSend(v70, "setPriority:", v71);
    -[UIView addConstraint:](v49, "addConstraint:", v70);
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v25->_scrollView, 9, 0, v49, 9, 1.0, 0.0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v73) = 1144750080;
    objc_msgSend(v72, "setPriority:", v73);
    -[UIView addConstraint:](v49, "addConstraint:", v72);
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v25->_scrollView, 10, 0, v49, 10, 1.0, 0.0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v75) = 1144750080;
    objc_msgSend(v74, "setPriority:", v75);
    -[UIView addConstraint:](v49, "addConstraint:", v74);
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v76, "userInterfaceIdiom");

    v78 = (void *)MEMORY[0x1E0D156E0];
    v79 = v25->_scrollView;
    if (v77 == 1)
    {
      _NSDictionaryOfVariableBindings(CFSTR("_scrollView"), v79, 0);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[_scrollView(>=124,<=418)]"), 0, 0, v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIView addConstraints:](v49, "addConstraints:", v81);
      v82 = (void *)MEMORY[0x1E0D156E0];
      v83 = v25->_scrollView;
      -[UIView safeAreaLayoutGuide](v49, "safeAreaLayoutGuide");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v83, 5, 1, v84, 5, 1.0, 30.0);
      v85 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIView addConstraint:](v49, "addConstraint:", v85);
      v86 = (void *)MEMORY[0x1E0D156E0];
      v87 = v25->_scrollView;
      -[UIView safeAreaLayoutGuide](v49, "safeAreaLayoutGuide");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v87, 6, -1, v88, 6, 1.0, -30.0);
      v89 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIView addConstraint:](v49, "addConstraint:", v89);
    }
    else
    {
      -[UIView safeAreaLayoutGuide](v49, "safeAreaLayoutGuide");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v79, 5, 0, v90, 5, 1.0, 29.0);
      v91 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIView addConstraint:](v49, "addConstraint:", v91);
      v92 = (void *)MEMORY[0x1E0D156E0];
      v93 = v25->_scrollView;
      -[UIView safeAreaLayoutGuide](v49, "safeAreaLayoutGuide");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v93, 6, 0, v94, 6, 1.0, -29.0);
      v89 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIView addConstraint:](v49, "addConstraint:", v89);
    }
    if (v25->_style == 1)
      v25->_vibrantOptions = 1;
    -[UIView setNeedsLayout](v25, "setNeedsLayout");
    v99[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 1);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = -[UIView registerForTraitChanges:withAction:](v25, "registerForTraitChanges:withAction:", v95, sel__updateForCurrentContentSizeCategory);

  }
  return v25;
}

- (double)_labelVerticalSpacing
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[_UIContentUnavailableView _messageTextStyle](self, "_messageTextStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIFontMetrics metricsForTextStyle:](UIFontMetrics, "metricsForTextStyle:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValueForValue:", 35.0);
  v5 = v4;

  return v5;
}

- (id)_messageTextStyle
{
  return CFSTR("UICTFontTextStyleBody");
}

- (void)setVibrantOptions:(unint64_t)a3
{
  if (self->_vibrantOptions != a3)
  {
    self->_vibrantOptions = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

+ (_UIContentUnavailableView)allocWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS____UIContentUnavailableView;
  return (_UIContentUnavailableView *)objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

- (unint64_t)vibrantOptions
{
  return self->_vibrantOptions;
}

- (void)updateConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIContentUnavailableView;
  -[UIView updateConstraints](&v3, sel_updateConstraints);
  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", self->_containerViewContraints);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  NSString *v6;
  _BOOL4 IsAccessibilityCategory;
  objc_super v8;
  CGRect v9;

  -[_UIContentUnavailableView _updateViewHierarchy](self, "_updateViewHierarchy");
  v8.receiver = self;
  v8.super_class = (Class)_UIContentUnavailableView;
  -[UIView layoutSubviews](&v8, sel_layoutSubviews);
  -[UIScrollView contentSize](self->_scrollView, "contentSize");
  v4 = v3;
  -[UIView bounds](self->_scrollView, "bounds");
  if (v4 > CGRectGetHeight(v9))
  {
    -[UIView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

    if (IsAccessibilityCategory)
      -[UIScrollView flashScrollIndicators](self->_scrollView, "flashScrollIndicators");
  }
}

- (_UIContentUnavailableView)initWithFrame:(CGRect)a3 title:(id)a4 style:(unint64_t)a5
{
  return -[_UIContentUnavailableView initWithFrame:title:style:includeBackdrop:](self, "initWithFrame:title:style:includeBackdrop:", a4, a5, a5 != 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)didMoveToWindow
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObserver:name:object:", self, CFSTR("UIWindowWillRotateNotification"), 0);
    objc_msgSend(v9, "removeObserver:name:object:", self, CFSTR("UIWindowWillAnimateRotationNotification"), 0);
    objc_msgSend(v9, "removeObserver:name:object:", self, CFSTR("UIWindowDidRotateNotification"), 0);
    -[UIView window](self, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[UIView window](self, "window");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_windowWillRotateNotification_, CFSTR("UIWindowWillRotateNotification"), v6);

      -[UIView window](self, "window");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_windowWillAnimateRotateNotification_, CFSTR("UIWindowWillAnimateRotationNotification"), v7);

      -[UIView window](self, "window");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_windowDidRotateNotification_, CFSTR("UIWindowDidRotateNotification"), v8);

    }
    else
    {
      -[_UIContentUnavailableView cleanupLingeringRotationState](self, "cleanupLingeringRotationState");
    }

  }
}

- (void)cleanupLingeringRotationState
{
  UIView *fromSnapshot;
  UIView *toSnapshot;

  -[_UIContentUnavailableView _labelAlpha](self, "_labelAlpha");
  -[UIView setAlpha:](self->_titleLabel, "setAlpha:");
  -[_UIContentUnavailableView _labelAlpha](self, "_labelAlpha");
  -[UIView setAlpha:](self->_messageLabel, "setAlpha:");
  -[UIView removeFromSuperview](self->_fromSnapshot, "removeFromSuperview");
  fromSnapshot = self->_fromSnapshot;
  self->_fromSnapshot = 0;

  -[UIView removeFromSuperview](self->_toSnapshot, "removeFromSuperview");
  toSnapshot = self->_toSnapshot;
  self->_toSnapshot = 0;

}

- (void)_updateViewHierarchy
{
  UILabel *titleLabel;
  BOOL v4;
  UILabel *v5;
  UILabel *v6;
  UILabel *v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  uint64_t v12;
  void *v13;
  UILabel *v14;
  uint64_t v15;
  void *v16;
  NSUInteger v17;
  UILabel *messageLabel;
  UILabel *v19;
  UILabel *v20;
  UILabel *v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  uint64_t v26;
  void *v27;
  UILabel *v28;
  uint64_t v29;
  void *v30;
  UILabel *v31;
  NSUInteger v32;
  UIButton *actionButton;
  UIButton *v34;
  UIButton *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  UIButton *v42;
  void *v43;
  void *v44;
  void *v45;
  unint64_t style;
  _BOOL4 v47;
  UIButton *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  UIButton *v54;
  void *v55;
  void *v56;
  UIButton *v57;
  void *v58;
  CGRect v59;
  CGRect v60;

  titleLabel = self->_titleLabel;
  v4 = titleLabel == 0;
  if (!titleLabel)
  {
    v5 = [UILabel alloc];
    -[UIView bounds](self->_scrollView, "bounds");
    v6 = -[UILabel initWithFrame:](v5, "initWithFrame:", 0.0, 0.0, CGRectGetWidth(v59), 20.0);
    v7 = self->_titleLabel;
    self->_titleLabel = v6;

    LODWORD(v8) = 1148846080;
    -[UIView setContentCompressionResistancePriority:forAxis:](self->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v8);
    -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
    +[UIColor clearColor](UIColor, "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v9);

    -[UIView setOpaque:](self->_titleLabel, "setOpaque:", 0);
    -[_UIContentUnavailableView _titleFont](self, "_titleFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_titleLabel, "setFont:", v10);

    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
    LODWORD(v11) = 1051931443;
    -[UILabel _setHyphenationFactor:](self->_titleLabel, "_setHyphenationFactor:", v11);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](self->_containerView, "addSubview:", self->_titleLabel);
    titleLabel = self->_titleLabel;
  }
  -[UILabel setText:](titleLabel, "setText:", self->_title);
  if (-[_UIContentUnavailableView _hasVibrantText](self, "_hasVibrantText") && self->_style == 1)
  {
    -[_UIContentUnavailableView _vibrantBaseColor](self, "_vibrantBaseColor");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_UIContentUnavailableView _flatTextColor](self, "_flatTextColor");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v12);

  -[_UIContentUnavailableView _labelAlpha](self, "_labelAlpha");
  -[UIView setAlpha:](self->_titleLabel, "setAlpha:");
  if (self->_style == 1)
  {
    v14 = self->_titleLabel;
    if (-[_UIContentUnavailableView _hasVibrantText](self, "_hasVibrantText"))
      v15 = 3;
    else
      v15 = 0;
    -[UIView _setDrawsAsBackdropOverlayWithBlendMode:](v14, "_setDrawsAsBackdropOverlayWithBlendMode:", v15);
    if (-[_UIContentUnavailableView _hasVibrantText](self, "_hasVibrantText"))
    {
      -[_UIContentUnavailableView _vibrantBaseColor](self, "_vibrantBaseColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setTintColor:](self->_titleLabel, "setTintColor:", v16);

    }
    else
    {
      -[UIView setTintColor:](self->_titleLabel, "setTintColor:", 0);
    }
  }
  v17 = -[NSString length](self->_message, "length");
  messageLabel = self->_messageLabel;
  if (v17)
  {
    if (!messageLabel)
    {
      v19 = [UILabel alloc];
      -[UIView bounds](self->_scrollView, "bounds");
      v20 = -[UILabel initWithFrame:](v19, "initWithFrame:", 0.0, 0.0, CGRectGetWidth(v60), 20.0);
      v21 = self->_messageLabel;
      self->_messageLabel = v20;

      LODWORD(v22) = 1148846080;
      v4 = 1;
      -[UIView setContentCompressionResistancePriority:forAxis:](self->_messageLabel, "setContentCompressionResistancePriority:forAxis:", 1, v22);
      -[UILabel setTextAlignment:](self->_messageLabel, "setTextAlignment:", 1);
      -[UIView setOpaque:](self->_messageLabel, "setOpaque:", 0);
      +[UIColor clearColor](UIColor, "clearColor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_messageLabel, "setBackgroundColor:", v23);

      objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleBody"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](self->_messageLabel, "setFont:", v24);

      -[UILabel setNumberOfLines:](self->_messageLabel, "setNumberOfLines:", 0);
      LODWORD(v25) = 1051931443;
      -[UILabel _setHyphenationFactor:](self->_messageLabel, "_setHyphenationFactor:", v25);
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_messageLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView addSubview:](self->_containerView, "addSubview:", self->_messageLabel);
      messageLabel = self->_messageLabel;
    }
    -[UILabel setText:](messageLabel, "setText:", self->_message);
    if (-[_UIContentUnavailableView _hasVibrantText](self, "_hasVibrantText") && self->_style == 1)
    {
      -[_UIContentUnavailableView _vibrantBaseColor](self, "_vibrantBaseColor");
      v26 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[_UIContentUnavailableView _flatTextColor](self, "_flatTextColor");
      v26 = objc_claimAutoreleasedReturnValue();
    }
    v27 = (void *)v26;
    -[UILabel setTextColor:](self->_messageLabel, "setTextColor:", v26);

    -[_UIContentUnavailableView _labelAlpha](self, "_labelAlpha");
    -[UIView setAlpha:](self->_messageLabel, "setAlpha:");
    if (self->_style == 1)
    {
      v28 = self->_messageLabel;
      if (-[_UIContentUnavailableView _hasVibrantText](self, "_hasVibrantText"))
        v29 = 3;
      else
        v29 = 0;
      -[UIView _setDrawsAsBackdropOverlayWithBlendMode:](v28, "_setDrawsAsBackdropOverlayWithBlendMode:", v29);
      if (-[_UIContentUnavailableView _hasVibrantText](self, "_hasVibrantText"))
      {
        -[_UIContentUnavailableView _vibrantBaseColor](self, "_vibrantBaseColor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setTintColor:](self->_messageLabel, "setTintColor:", v30);

      }
      else
      {
        -[UIView setTintColor:](self->_messageLabel, "setTintColor:", 0);
      }
    }
  }
  else if (messageLabel)
  {
    -[UIView removeFromSuperview](messageLabel, "removeFromSuperview");
    v31 = self->_messageLabel;
    self->_messageLabel = 0;

    v4 = 1;
  }
  v32 = -[NSString length](self->_buttonTitle, "length");
  actionButton = self->_actionButton;
  if (v32)
  {
    if (!actionButton)
    {
      v4 = 1;
      +[UIButton buttonWithType:](UIButton, "buttonWithType:", 1);
      v34 = (UIButton *)objc_claimAutoreleasedReturnValue();
      v35 = self->_actionButton;
      self->_actionButton = v34;

      -[UIControl addTarget:action:forControlEvents:](self->_actionButton, "addTarget:action:forControlEvents:", self, sel__actionButtonPressed_, 0x2000);
      -[UIButton setFrame:](self->_actionButton, "setFrame:", 0.0, 0.0, 124.0, 29.0);
      -[_UIContentUnavailableView _buttonFont](self, "_buttonFont");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton titleLabel](self->_actionButton, "titleLabel");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setFont:", v36);

      -[UIButton titleLabel](self->_actionButton, "titleLabel");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setNumberOfLines:", 0);

      -[UIButton titleLabel](self->_actionButton, "titleLabel");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v40) = 1051931443;
      objc_msgSend(v39, "_setHyphenationFactor:", v40);

      -[UIButton titleLabel](self->_actionButton, "titleLabel");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setTextAlignment:", 1);

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_actionButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIButton setContentHorizontalAlignment:](self->_actionButton, "setContentHorizontalAlignment:", 0);
      -[UIView addSubview:](self->_containerView, "addSubview:", self->_actionButton);
      actionButton = self->_actionButton;
    }
    -[UIButton setTitle:forState:](actionButton, "setTitle:forState:", self->_buttonTitle, 0);
    v42 = self->_actionButton;
    -[_UIContentUnavailableView _buttonBackgroundImageForStyle:controlState:](self, "_buttonBackgroundImageForStyle:controlState:", self->_style, 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundImage:forState:](v42, "setBackgroundImage:forState:", v43, 0);

    -[_UIContentUnavailableView _buttonAlpha](self, "_buttonAlpha");
    -[UIView setAlpha:](self->_actionButton, "setAlpha:");
    -[_UIContentUnavailableView _flatTextColor](self, "_flatTextColor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor blackColor](UIColor, "blackColor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    style = self->_style;
    if (style)
    {
      if (style == 1)
      {
        v47 = -[_UIContentUnavailableView _hasVibrantButton](self, "_hasVibrantButton");
        v48 = self->_actionButton;
        if (v47)
        {
          -[UIView _setDrawsAsBackdropOverlayWithBlendMode:](v48, "_setDrawsAsBackdropOverlayWithBlendMode:", 3);
          objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2F28]);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIButton titleLabel](self->_actionButton, "titleLabel");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "layer");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "setCompositingFilter:", v49);

          -[_UIContentUnavailableView _vibrantBaseColor](self, "_vibrantBaseColor");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIButton setTintColor:](self->_actionButton, "setTintColor:", v52);

          -[_UIContentUnavailableView _vibrantBaseColor](self, "_vibrantBaseColor");
          v53 = objc_claimAutoreleasedReturnValue();

          -[UIButton setBackgroundImage:forState:](self->_actionButton, "setBackgroundImage:forState:", 0, 1);
        }
        else
        {
          -[UIView _setDrawsAsBackdropOverlayWithBlendMode:](v48, "_setDrawsAsBackdropOverlayWithBlendMode:", 0);
          -[UIButton titleLabel](self->_actionButton, "titleLabel");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "layer");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setCompositingFilter:", 0);

          -[UIButton setTintColor:](self->_actionButton, "setTintColor:", 0);
          +[UIColor whiteColor](UIColor, "whiteColor");
          v53 = objc_claimAutoreleasedReturnValue();

          v57 = self->_actionButton;
          -[_UIContentUnavailableView _buttonBackgroundImageForStyle:controlState:](self, "_buttonBackgroundImageForStyle:controlState:", self->_style, 1);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIButton setBackgroundImage:forState:](v57, "setBackgroundImage:forState:", v58, 1);

        }
        v44 = (void *)v53;
      }
    }
    else
    {
      -[UIButton setBackgroundImage:forState:](self->_actionButton, "setBackgroundImage:forState:", 0, 1);
    }
    -[UIButton setTitleColor:forState:](self->_actionButton, "setTitleColor:forState:", v44, 0);
    -[UIButton setTitleColor:forState:](self->_actionButton, "setTitleColor:forState:", v45, 8);

  }
  else if (actionButton)
  {
    -[UIView removeFromSuperview](actionButton, "removeFromSuperview");
    v54 = self->_actionButton;
    self->_actionButton = 0;

LABEL_45:
    -[_UIContentUnavailableView _rebuildConstraints](self, "_rebuildConstraints");
    return;
  }
  if (v4 || !self->_containerViewContraints)
    goto LABEL_45;
}

- (id)_titleFont
{
  return (id)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleTitle1"));
}

- (void)_rebuildConstraints
{
  NSMutableArray *containerViewContraints;
  NSMutableArray *v4;
  NSMutableArray *v5;
  NSLayoutConstraint *titleToMessageConstraint;
  NSLayoutConstraint *messageToButtonConstraint;
  void *v8;
  void *v9;
  NSString *v10;
  _BOOL4 IsAccessibilityCategory;
  void *messageLabel;
  id v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  void *v18;
  const __CFString *v19;
  UILabel *v20;
  UIButton *actionButton;
  uint64_t v22;
  void *v23;
  double v24;
  UILabel *v25;
  void *v26;
  void *v27;
  void *v28;
  UILabel *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  UIButton *v33;
  NSMutableArray *v34;
  void *v35;
  void *v36;
  void *v37;
  NSMutableArray *v38;
  void *v39;
  void *v40;
  void *v41;
  NSMutableArray *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  NSMutableArray *v50;
  void *v51;
  void *v52;
  NSMutableArray *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  NSMutableArray *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  NSMutableArray *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  id *location;
  void (**v74)(void *, UILabel *);
  _QWORD aBlock[5];

  containerViewContraints = self->_containerViewContraints;
  if (!containerViewContraints)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = self->_containerViewContraints;
    self->_containerViewContraints = v4;

    containerViewContraints = self->_containerViewContraints;
  }
  objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:", containerViewContraints);
  -[NSMutableArray removeAllObjects](self->_containerViewContraints, "removeAllObjects");
  titleToMessageConstraint = self->titleToMessageConstraint;
  self->titleToMessageConstraint = 0;

  messageToButtonConstraint = self->messageToButtonConstraint;
  location = (id *)&self->messageToButtonConstraint;
  self->messageToButtonConstraint = 0;

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48___UIContentUnavailableView__rebuildConstraints__block_invoke;
  aBlock[3] = &unk_1E16EC400;
  aBlock[4] = self;
  v74 = (void (**)(void *, UILabel *))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_titleLabel, 3, 0, self->_containerView, 3, 1.0, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](self->_containerViewContraints, "addObject:", v8);
  -[UIView traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferredContentSizeCategory");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v10);

  messageLabel = self->_messageLabel;
  if (!messageLabel)
  {
    messageLabel = self->_actionButton;
    if (!messageLabel)
    {
      v74[2](v74, self->_titleLabel);
      goto LABEL_24;
    }
  }
  v13 = messageLabel;
  -[_UIContentUnavailableView _labelVerticalSpacing](self, "_labelVerticalSpacing");
  v15 = v14;
  if (self->_messageLabel)
  {
    if (IsAccessibilityCategory)
      goto LABEL_7;
LABEL_11:
    v16 = 12;
    goto LABEL_12;
  }
  -[_UIContentUnavailableView _buttonVerticalSpacing](self, "_buttonVerticalSpacing");
  v15 = v15 + v17;
  if (!IsAccessibilityCategory)
    goto LABEL_11;
LABEL_7:
  if (self->_messageLabel)
    v16 = 12;
  else
    v16 = 3;
LABEL_12:
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, v16, 0, self->_titleLabel, 11, 1.0, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)&self->titleToMessageConstraint, v18);
  if (self->_messageLabel)
    v19 = CFSTR("UIContentUnavailable-title-to-message-spacing");
  else
    v19 = CFSTR("UIContentUnavailable-title-to-button-spacing");
  -[NSLayoutConstraint setIdentifier:](self->titleToMessageConstraint, "setIdentifier:", v19);
  -[NSMutableArray addObject:](self->_containerViewContraints, "addObject:", v18);
  v20 = self->_messageLabel;
  if (v20 && (actionButton = self->_actionButton) != 0)
  {
    v22 = 12;
    if (IsAccessibilityCategory)
      v22 = 3;
    v72 = v22;
    v23 = (void *)MEMORY[0x1E0D156E0];
    -[_UIContentUnavailableView _buttonVerticalSpacing](self, "_buttonVerticalSpacing");
    objc_msgSend(v23, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", actionButton, v72, 0, v20, 11, 1.0, v24);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong(location, v8);
    objc_msgSend(*location, "setIdentifier:", CFSTR("UIContentUnavailable-message-to-button-spacing"));
    -[NSMutableArray addObject:](self->_containerViewContraints, "addObject:", v8);
  }
  else
  {
    v8 = v18;
  }
  v25 = (UILabel *)self->_actionButton;
  if (!v25)
    v25 = self->_messageLabel;
  v74[2](v74, v25);

LABEL_24:
  v26 = (void *)MEMORY[0x1E0D156E0];
  _NSDictionaryOfVariableBindings(CFSTR("_titleLabel"), self->_titleLabel, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_titleLabel]|"), 0, 0, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView addConstraints:](self->_containerView, "addConstraints:", v28);
  -[NSMutableArray addObjectsFromArray:](self->_containerViewContraints, "addObjectsFromArray:", v28);
  v29 = self->_messageLabel;
  if (v29)
  {
    v30 = (void *)MEMORY[0x1E0D156E0];
    _NSDictionaryOfVariableBindings(CFSTR("_messageLabel"), v29, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_messageLabel]|"), 0, 0, v31);
    v32 = objc_claimAutoreleasedReturnValue();

    -[UIView addConstraints:](self->_containerView, "addConstraints:", v32);
    -[NSMutableArray addObjectsFromArray:](self->_containerViewContraints, "addObjectsFromArray:", v32);
    v28 = (void *)v32;
  }
  v33 = self->_actionButton;
  if (v33)
  {
    v34 = self->_containerViewContraints;
    -[UIView centerXAnchor](v33, "centerXAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](self->_containerView, "centerXAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v34, "addObject:", v37);

    v38 = self->_containerViewContraints;
    -[UIView leadingAnchor](self->_actionButton, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->_containerView, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintGreaterThanOrEqualToAnchor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v38, "addObject:", v41);

    v42 = self->_containerViewContraints;
    -[UIView trailingAnchor](self->_actionButton, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_containerView, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintLessThanOrEqualToAnchor:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v42, "addObject:", v45);

    -[_UIContentUnavailableView _buttonSize](self, "_buttonSize");
    v47 = v46;
    v49 = v48;
    v50 = self->_containerViewContraints;
    -[UIView widthAnchor](self->_actionButton, "widthAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintGreaterThanOrEqualToConstant:", v47);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v50, "addObject:", v52);

    v53 = self->_containerViewContraints;
    -[UIView heightAnchor](self->_actionButton, "heightAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintGreaterThanOrEqualToConstant:", v49);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v53, "addObject:", v55);

    if (-[UIButton behavioralStyle](self->_actionButton, "behavioralStyle") != UIBehavioralStyleMac)
    {
      -[_UIContentUnavailableView _buttonContentEdgeInsets](self, "_buttonContentEdgeInsets");
      v58 = v56 + v57;
      v61 = v59 + v60;
      v62 = self->_containerViewContraints;
      -[UIView widthAnchor](self->_actionButton, "widthAnchor");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton titleLabel](self->_actionButton, "titleLabel");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "widthAnchor");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "constraintEqualToAnchor:constant:", v65, v58);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v62, "addObject:", v66);

      v67 = self->_containerViewContraints;
      -[UIView heightAnchor](self->_actionButton, "heightAnchor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton titleLabel](self->_actionButton, "titleLabel");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "heightAnchor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "constraintEqualToAnchor:constant:", v70, v61);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v67, "addObject:", v71);

    }
  }
  -[UIView _setNeedsUpdateConstraintsNeedingLayout:](self, "_setNeedsUpdateConstraintsNeedingLayout:", 0);

}

- (double)_labelAlpha
{
  unint64_t style;
  BOOL v4;
  double result;

  style = self->_style;
  if (style == 1)
  {
    v4 = -[_UIContentUnavailableView _hasVibrantText](self, "_hasVibrantText");
    result = 1.0;
    if (v4)
      return result;
    style = self->_style;
  }
  return dbl_1866857D0[style == 0];
}

- (BOOL)_hasVibrantText
{
  return -[_UIContentUnavailableView vibrantOptions](self, "vibrantOptions") & 1;
}

- (id)_flatTextColor
{
  return +[UIColor labelColor](UIColor, "labelColor");
}

- (_UIContentUnavailableView)initWithFrame:(CGRect)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIContentUnavailableView.m"), 129, CFSTR("-[_UIContentUnavailableView initWithFrame:] will not return a usable view"));

  return 0;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = CFSTR("UIWindowWillRotateNotification");
  v6[1] = CFSTR("UIWindowWillAnimateRotationNotification");
  v6[2] = CFSTR("UIWindowDidRotateNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5.receiver = self;
  v5.super_class = (Class)_UIContentUnavailableView;
  -[UIView dealloc](&v5, sel_dealloc);
}

- (void)_updateForCurrentContentSizeCategory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[_UIContentUnavailableView _titleFont](self, "_titleFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v3);

  -[_UIContentUnavailableView _messageTextStyle](self, "_messageTextStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_messageLabel, "setFont:", v5);

  -[_UIContentUnavailableView _buttonFont](self, "_buttonFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton titleLabel](self->_actionButton, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

  if (self->_containerViewContraints)
    -[_UIContentUnavailableView _rebuildConstraints](self, "_rebuildConstraints");
}

- (CGColor)_colorForButtonForStyle:(unint64_t)a3 controlState:(unint64_t)a4
{
  _BOOL4 v5;
  double v6;
  double v7;
  id v8;
  CGColor *v9;
  id v10;

  if (a3 == 1)
  {
    v5 = -[_UIContentUnavailableView _hasVibrantButton](self, "_hasVibrantButton");
    v6 = 0.6;
    v7 = 1.0;
    if (a4)
      v6 = 1.0;
    if (!v5)
      v7 = v6;
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, v7);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = (CGColor *)objc_msgSend(v8, "CGColor");
  }
  else
  {
    +[UIColor labelColor](UIColor, "labelColor", a3, a4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "colorWithAlphaComponent:", 1.0);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = (CGColor *)objc_msgSend(v10, "CGColor");

  }
  return v9;
}

- (id)_buttonBackgroundImageForStyle:(unint64_t)a3 controlState:(unint64_t)a4
{
  CGColor *v7;
  _UIContentUnavailableViewCacheKey *v8;
  void *v9;
  UIGraphicsImageRenderer *v10;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  _QWORD v23[7];
  __int128 v24;
  uint64_t v25;
  unint64_t v26;

  if (qword_1ECD7ADF0 != -1)
    dispatch_once(&qword_1ECD7ADF0, &__block_literal_global_670);
  v7 = -[_UIContentUnavailableView _colorForButtonForStyle:controlState:](self, "_colorForButtonForStyle:controlState:", a3, a4);
  v8 = -[_UIContentUnavailableViewCacheKey initWithStyle:color:]([_UIContentUnavailableViewCacheKey alloc], "initWithStyle:color:", a3, v7);
  objc_msgSend((id)_MergedGlobals_9_10, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v10 = -[UIGraphicsImageRenderer initWithSize:]([UIGraphicsImageRenderer alloc], "initWithSize:", 11.0, 11.0);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __73___UIContentUnavailableView__buttonBackgroundImageForStyle_controlState___block_invoke_2;
    v23[3] = &__block_descriptor_88_e40_v16__0__UIGraphicsImageRendererContext_8l;
    v23[5] = 0;
    v23[6] = 0;
    v23[4] = v7;
    __asm { FMOV            V0.2D, #11.0 }
    v24 = _Q0;
    v25 = 0x4008000000000000;
    v26 = a3;
    -[UIGraphicsImageRenderer imageWithActions:](v10, "imageWithActions:", v23);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "resizableImageWithCapInsets:", 5.0, 5.0, 5.0, 5.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3 == 1)
    {
      objc_msgSend(v9, "imageWithRenderingMode:", 2);
      v17 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v17;
    }
    if (v9)
    {
      v18 = (void *)_MergedGlobals_9_10;
      objc_msgSend(v9, "size");
      v20 = v19;
      objc_msgSend(v9, "size");
      objc_msgSend(v18, "setObject:forKey:cost:", v9, v8, (unint64_t)(v20 * v21));
    }

  }
  return v9;
}

- (id)preferredFocusedView
{
  return self->_actionButton;
}

- (void)setTitle:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  NSString *v8;
  NSString *title;
  void *v10;
  id v11;

  v5 = a3;
  v11 = v5;
  if (!v5 || (v6 = objc_msgSend(v5, "length"), v7 = v11, !v6))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIContentUnavailableView.m"), 540, CFSTR("Title cannot be nil or empty"));

    v7 = v11;
  }
  if ((objc_msgSend(v7, "isEqualToString:", self->_title) & 1) == 0)
  {
    v8 = (NSString *)objc_msgSend(v11, "copy");
    title = self->_title;
    self->_title = v8;

    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setMessage:(id)a3
{
  NSString *v4;
  NSString *message;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", self->_message) & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    message = self->_message;
    self->_message = v4;

    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setButtonTitle:(id)a3
{
  NSString *v4;
  NSString *buttonTitle;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", self->_buttonTitle) & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    buttonTitle = self->_buttonTitle;
    self->_buttonTitle = v4;

    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_actionButtonPressed:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[_UIContentUnavailableView buttonAction](self, "buttonAction", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_UIContentUnavailableView buttonAction](self, "buttonAction");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (void)windowWillRotateNotification:(id)a3
{
  double MinY;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIView *v11;
  UIView *fromSnapshot;
  CGFloat v13;
  CGFloat v14;
  CGRect v15;

  -[UIView bounds](self->_containerView, "bounds", a3);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (self->_buttonTitle)
  {
    -[UIView frame](self->_actionButton, "frame");
    MinY = CGRectGetMinY(v15);
  }
  -[UIView resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:](self->_containerView, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0, v6, v8, v10, MinY, 0.0, 0.0, 0.0, 0.0);
  v11 = (UIView *)objc_claimAutoreleasedReturnValue();
  fromSnapshot = self->_fromSnapshot;
  self->_fromSnapshot = v11;

  -[UIView setAutoresizingMask:](self->_fromSnapshot, "setAutoresizingMask:", 63);
  -[UIView bounds](self->_fromSnapshot, "bounds");
  self->_fromSnapshotSize.width = v13;
  self->_fromSnapshotSize.height = v14;
  -[UIView addSubview:](self->_containerView, "addSubview:", self->_fromSnapshot);
}

- (void)windowWillAnimateRotateNotification:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double MinY;
  _QWORD v12[9];
  CGRect v13;

  -[UIView bounds](self->_containerView, "bounds", a3);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (self->_buttonTitle)
  {
    -[UIView frame](self->_actionButton, "frame");
    MinY = CGRectGetMinY(v13);
  }
  else
  {
    MinY = v4;
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65___UIContentUnavailableView_windowWillAnimateRotateNotification___block_invoke;
  v12[3] = &unk_1E16B20D8;
  v12[4] = self;
  *(double *)&v12[5] = v6;
  *(double *)&v12[6] = v8;
  *(double *)&v12[7] = v10;
  *(double *)&v12[8] = MinY;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v12);
  -[UIView setAlpha:](self->_fromSnapshot, "setAlpha:", 0.0);
  -[UIView setAlpha:](self->_toSnapshot, "setAlpha:", 1.0);
  -[UIView setFrame:](self->_toSnapshot, "setFrame:", v6, v8, v10, MinY);
}

- (id)_vibrantBaseColor
{
  return +[UIColor _vibrantDarkFillDodgeColor](UIColor, "_vibrantDarkFillDodgeColor");
}

- (double)_buttonAlpha
{
  _BOOL4 v2;
  double result;

  if (self->_style != 1)
    return 0.4;
  v2 = -[_UIContentUnavailableView _hasVibrantButton](self, "_hasVibrantButton");
  result = 0.6;
  if (!v2)
    return 1.0;
  return result;
}

- (id)_buttonFont
{
  void *v2;
  void *v3;

  -[_UIContentUnavailableView _buttonTextStyle](self, "_buttonTextStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_buttonTextStyle
{
  return CFSTR("UICTFontTextStyleSubhead");
}

- (CGSize)_buttonSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 124.0;
  v3 = 29.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIEdgeInsets)_buttonContentEdgeInsets
{
  void *v2;
  NSString *v3;
  _BOOL4 IsAccessibilityCategory;
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  v5 = 0.0;
  if (IsAccessibilityCategory)
    v5 = 8.0;
  v6 = 16.0;
  v7 = 16.0;
  v8 = v5;
  result.right = v7;
  result.bottom = v8;
  result.left = v6;
  result.top = v5;
  return result;
}

- (double)_buttonVerticalSpacing
{
  void *v3;
  void *v4;
  void *v5;
  NSString *v6;
  _BOOL4 IsAccessibilityCategory;
  double v8;
  double v9;
  double v10;

  -[_UIContentUnavailableView _buttonTextStyle](self, "_buttonTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIFontMetrics metricsForTextStyle:](UIFontMetrics, "metricsForTextStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);
  v8 = 35.0;
  if (IsAccessibilityCategory)
    v8 = 8.0;
  objc_msgSend(v4, "scaledValueForValue:", v8);
  v10 = v9;

  return v10;
}

- (BOOL)_hasVibrantButton
{
  return (-[_UIContentUnavailableView vibrantOptions](self, "vibrantOptions") >> 1) & 1;
}

- (id)_titleLabel
{
  return self->_titleLabel;
}

- (id)_messageLabel
{
  return self->_messageLabel;
}

- (id)_actionButton
{
  return self->_actionButton;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (id)buttonAction
{
  return self->_buttonAction;
}

- (void)setButtonAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_buttonAction, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_containerViewContraints, 0);
  objc_storeStrong((id *)&self->_toSnapshot, 0);
  objc_storeStrong((id *)&self->_fromSnapshot, 0);
  objc_storeStrong((id *)&self->messageToButtonConstraint, 0);
  objc_storeStrong((id *)&self->titleToMessageConstraint, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_backdrop, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
