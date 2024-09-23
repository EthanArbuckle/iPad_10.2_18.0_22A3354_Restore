@implementation PRXCardContainerView

- (PRXCardContainerView)init
{
  void *v3;
  PRXCardContainerView *v4;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v4 = -[PRXCardContainerView initWithFrame:](self, "initWithFrame:");

  return v4;
}

- (PRXCardContainerView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = PRXCardContainerDefaultLayoutMargins();
  return -[PRXCardContainerView initWithFrame:containerLayoutMargins:](self, "initWithFrame:containerLayoutMargins:", x, y, width, height, v8, v9, v10, v11);
}

- (PRXCardContainerView)initWithFrame:(CGRect)a3 containerLayoutMargins:(NSDirectionalEdgeInsets)a4
{
  CGFloat trailing;
  CGFloat bottom;
  CGFloat leading;
  CGFloat top;
  PRXCardContainerView *v8;
  PRXCardContainerView *v9;
  double *p_top;
  uint64_t v11;
  UITapGestureRecognizer *tapRecognizer;
  PRXPullDismissalScrollView *v13;
  PRXPullDismissalScrollView *pullDismissalScrollView;
  void *v15;
  PRXCardBackgroundView *v16;
  uint64_t v17;
  PRXCardBackgroundView *backgroundView;
  CGFloat v19;
  CGFloat v20;
  PRXCardContentContainerView *v21;
  UIView *contentContainerView;
  UIView *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSLayoutConstraint *contentWidthConstraint;
  double v28;
  void *v29;
  uint64_t v30;
  NSLayoutConstraint *contentHeightConstraint;
  double v32;
  void *v33;
  unint64_t v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSLayoutConstraint *visibleHeightConstraint;
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
  uint64_t v51;
  NSLayoutConstraint *scrollViewHeightConstraint;
  void *v53;
  void *v54;
  uint64_t v55;
  NSLayoutConstraint *scrollViewTopConstraint;
  void *v57;
  void *v58;
  uint64_t v59;
  NSLayoutConstraint *scrollViewBottomConstraint;
  void *v61;
  void *v62;
  uint64_t v63;
  NSLayoutConstraint *contentTopConstraint;
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
  PRXCardContainerView *v76;
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
  objc_super v106;
  _QWORD v107[15];
  void *v108;
  _QWORD v109[7];

  trailing = a4.trailing;
  bottom = a4.bottom;
  leading = a4.leading;
  top = a4.top;
  v109[5] = *MEMORY[0x24BDAC8D0];
  v106.receiver = self;
  v106.super_class = (Class)PRXCardContainerView;
  v8 = -[PRXCardContainerView initWithFrame:](&v106, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v9 = v8;
  if (v8)
  {
    p_top = &v8->_containerLayoutMargins.top;
    v8->_containerLayoutMargins.top = top;
    v8->_containerLayoutMargins.leading = leading;
    v8->_containerLayoutMargins.bottom = bottom;
    v8->_containerLayoutMargins.trailing = trailing;
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", v8, sel_tappedView_);
    tapRecognizer = v9->_tapRecognizer;
    v9->_tapRecognizer = (UITapGestureRecognizer *)v11;

    -[UITapGestureRecognizer setDelegate:](v9->_tapRecognizer, "setDelegate:", v9);
    -[PRXCardContainerView addGestureRecognizer:](v9, "addGestureRecognizer:", v9->_tapRecognizer);
    v13 = objc_alloc_init(PRXPullDismissalScrollView);
    pullDismissalScrollView = v9->_pullDismissalScrollView;
    v9->_pullDismissalScrollView = v13;

    -[PRXPullDismissalScrollView setTranslatesAutoresizingMaskIntoConstraints:](v9->_pullDismissalScrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PRXPullDismissalScrollView dismissableContentContainerView](v9->_pullDismissalScrollView, "dismissableContentContainerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDirectionalLayoutMargins:", *p_top, v9->_containerLayoutMargins.leading, v9->_containerLayoutMargins.bottom, v9->_containerLayoutMargins.trailing);
    objc_msgSend(v15, "setInsetsLayoutMarginsFromSafeArea:", 0);
    -[PRXCardContainerView addSubview:](v9, "addSubview:", v9->_pullDismissalScrollView);
    v16 = [PRXCardBackgroundView alloc];
    v17 = -[PRXCardBackgroundView initWithFrame:containerLayoutMargins:](v16, "initWithFrame:containerLayoutMargins:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24), *p_top, v9->_containerLayoutMargins.leading, v9->_containerLayoutMargins.bottom, v9->_containerLayoutMargins.trailing);
    backgroundView = v9->_backgroundView;
    v9->_backgroundView = (PRXCardBackgroundView *)v17;

    -[PRXCardBackgroundView setTranslatesAutoresizingMaskIntoConstraints:](v9->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PRXCardBackgroundView setClipsToBounds:](v9->_backgroundView, "setClipsToBounds:", 1);
    objc_msgSend(v15, "addSubview:", v9->_backgroundView);
    PRXCardDefaultSize();
    v9->_preferredContentSize.width = v19;
    v9->_preferredContentSize.height = v20;
    v21 = -[PRXCardContentContainerView initWithFrame:]([PRXCardContentContainerView alloc], "initWithFrame:", 0.0, 0.0, v9->_preferredContentSize.width, v9->_preferredContentSize.height);
    contentContainerView = v9->_contentContainerView;
    v9->_contentContainerView = &v21->super;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v9->_contentContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v23 = v9->_contentContainerView;
    -[PRXPullDismissalScrollView panGestureRecognizer](v9->_pullDismissalScrollView, "panGestureRecognizer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addGestureRecognizer:](v23, "addGestureRecognizer:", v24);

    -[PRXCardBackgroundView addSubview:](v9->_backgroundView, "addSubview:", v9->_contentContainerView);
    -[UIView widthAnchor](v9->_contentContainerView, "widthAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToConstant:", v9->_preferredContentSize.width);
    v26 = objc_claimAutoreleasedReturnValue();
    contentWidthConstraint = v9->_contentWidthConstraint;
    v9->_contentWidthConstraint = (NSLayoutConstraint *)v26;

    LODWORD(v28) = 1146388480;
    -[NSLayoutConstraint setPriority:](v9->_contentWidthConstraint, "setPriority:", v28);
    -[UIView heightAnchor](v9->_contentContainerView, "heightAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToConstant:", v9->_preferredContentSize.height);
    v30 = objc_claimAutoreleasedReturnValue();
    contentHeightConstraint = v9->_contentHeightConstraint;
    v9->_contentHeightConstraint = (NSLayoutConstraint *)v30;

    LODWORD(v32) = 1146388480;
    -[NSLayoutConstraint setPriority:](v9->_contentHeightConstraint, "setPriority:", v32);
    objc_msgSend(v15, "layoutMarginsGuide");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0x24BDD1000uLL;
    v105 = v33;
    v104 = v15;
    if (PRXIsPad())
    {
      v35 = objc_alloc_init(MEMORY[0x24BDF6B78]);
      -[PRXCardContainerView addLayoutGuide:](v9, "addLayoutGuide:", v35);
      objc_msgSend(v35, "heightAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRXCardContainerView heightAnchor](v9, "heightAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "constraintEqualToAnchor:", v37);
      v38 = objc_claimAutoreleasedReturnValue();
      visibleHeightConstraint = v9->_visibleHeightConstraint;
      v9->_visibleHeightConstraint = (NSLayoutConstraint *)v38;

      v98 = (void *)MEMORY[0x24BDD1628];
      objc_msgSend(v35, "widthAnchor");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "constraintEqualToConstant:", 0.0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v109[0] = v40;
      objc_msgSend(v35, "leadingAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "leadingAnchor");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "constraintEqualToAnchor:", v101);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v109[1] = v100;
      v109[2] = v9->_visibleHeightConstraint;
      objc_msgSend(v35, "bottomAnchor");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bottomAnchor");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "constraintEqualToAnchor:", v93);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v109[3] = v42;
      -[UIView centerYAnchor](v9->_contentContainerView, "centerYAnchor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "centerYAnchor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "constraintEqualToAnchor:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v109[4] = v45;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v109, 5);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "activateConstraints:", v46);

      v47 = v96;
      v34 = 0x24BDD1000;

    }
    else
    {
      v48 = (void *)MEMORY[0x24BDD1628];
      -[UIView bottomAnchor](v9->_contentContainerView, "bottomAnchor");
      v35 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "bottomAnchor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "constraintEqualToAnchor:", v47);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = v40;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v108, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "activateConstraints:", v41);
    }

    -[PRXPullDismissalScrollView heightAnchor](v9->_pullDismissalScrollView, "heightAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXCardContainerView heightAnchor](v9, "heightAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintLessThanOrEqualToAnchor:", v50);
    v51 = objc_claimAutoreleasedReturnValue();
    scrollViewHeightConstraint = v9->_scrollViewHeightConstraint;
    v9->_scrollViewHeightConstraint = (NSLayoutConstraint *)v51;

    -[PRXPullDismissalScrollView topAnchor](v9->_pullDismissalScrollView, "topAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXCardContainerView topAnchor](v9, "topAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintGreaterThanOrEqualToAnchor:", v54);
    v55 = objc_claimAutoreleasedReturnValue();
    scrollViewTopConstraint = v9->_scrollViewTopConstraint;
    v9->_scrollViewTopConstraint = (NSLayoutConstraint *)v55;

    -[PRXPullDismissalScrollView bottomAnchor](v9->_pullDismissalScrollView, "bottomAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXCardContainerView bottomAnchor](v9, "bottomAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v58);
    v59 = objc_claimAutoreleasedReturnValue();
    scrollViewBottomConstraint = v9->_scrollViewBottomConstraint;
    v9->_scrollViewBottomConstraint = (NSLayoutConstraint *)v59;

    -[UIView topAnchor](v9->_contentContainerView, "topAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "topAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:", v62);
    v63 = objc_claimAutoreleasedReturnValue();
    contentTopConstraint = v9->_contentTopConstraint;
    v9->_contentTopConstraint = (NSLayoutConstraint *)v63;

    v86 = *(void **)(v34 + 1576);
    -[PRXCardBackgroundView leadingAnchor](v9->_backgroundView, "leadingAnchor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v9->_contentContainerView, "leadingAnchor");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "constraintEqualToAnchor:", v102);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v107[0] = v99;
    -[PRXCardBackgroundView trailingAnchor](v9->_backgroundView, "trailingAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v9->_contentContainerView, "trailingAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "constraintEqualToAnchor:", v95);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v107[1] = v92;
    -[PRXCardBackgroundView topAnchor](v9->_backgroundView, "topAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v9->_contentContainerView, "topAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "constraintEqualToAnchor:", v90);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v107[2] = v89;
    -[PRXCardBackgroundView bottomAnchor](v9->_backgroundView, "bottomAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v9->_contentContainerView, "bottomAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "constraintEqualToAnchor:", v87);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v107[3] = v85;
    -[UIView leadingAnchor](v9->_contentContainerView, "leadingAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "leadingAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintEqualToAnchor:", v83);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v107[4] = v82;
    -[UIView trailingAnchor](v9->_contentContainerView, "trailingAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "trailingAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:", v80);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v107[5] = v79;
    -[PRXPullDismissalScrollView leadingAnchor](v9->_pullDismissalScrollView, "leadingAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXCardContainerView leadingAnchor](v9, "leadingAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "constraintGreaterThanOrEqualToAnchor:", v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v107[6] = v66;
    -[PRXPullDismissalScrollView trailingAnchor](v9->_pullDismissalScrollView, "trailingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXCardContainerView trailingAnchor](v9, "trailingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintLessThanOrEqualToAnchor:", v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v107[7] = v69;
    -[PRXPullDismissalScrollView centerXAnchor](v9->_pullDismissalScrollView, "centerXAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXCardContainerView centerXAnchor](v9, "centerXAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToAnchor:", v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v107[8] = v72;
    v107[9] = v9->_scrollViewHeightConstraint;
    v107[10] = v9->_scrollViewTopConstraint;
    v107[11] = v9->_scrollViewBottomConstraint;
    v107[12] = v9->_contentWidthConstraint;
    v107[13] = v9->_contentHeightConstraint;
    v107[14] = v9->_contentTopConstraint;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v107, 15);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "activateConstraints:", v73);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "addObserver:selector:name:object:", v9, sel_keyboardWillShow_, *MEMORY[0x24BDF7B80], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "addObserver:selector:name:object:", v9, sel_keyboardWillHide_, *MEMORY[0x24BDF7B78], 0);

    v76 = v9;
  }

  return v9;
}

- (void)setUsePortraitTopInset:(BOOL)a3
{
  double top;

  if (self->_usePortraitTopInset != a3)
  {
    self->_usePortraitTopInset = a3;
    if (a3)
      top = 88.0 - self->_containerLayoutMargins.top;
    else
      top = self->_containerLayoutMargins.top;
    -[NSLayoutConstraint setConstant:](self->_scrollViewTopConstraint, "setConstant:", top);
  }
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  CGSize *p_preferredContentSize;
  NSObject *v8;

  height = a3.height;
  width = a3.width;
  p_preferredContentSize = &self->_preferredContentSize;
  if (self->_preferredContentSize.width != a3.width || self->_preferredContentSize.height != a3.height)
  {
    PRXDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[PRXCardContainerView setPreferredContentSize:].cold.1(v8, width, height);

    p_preferredContentSize->width = width;
    p_preferredContentSize->height = height;
    -[NSLayoutConstraint setConstant:](self->_contentWidthConstraint, "setConstant:", width);
    -[NSLayoutConstraint setConstant:](self->_contentHeightConstraint, "setConstant:", height);
  }
}

- (void)setDefersKeyboardUpdates:(BOOL)a3
{
  if (self->_defersKeyboardUpdates != a3)
  {
    self->_defersKeyboardUpdates = a3;
    if (!a3)
      -[PRXCardContainerView _updateKeyboardDeferred:](self, "_updateKeyboardDeferred:", 1);
  }
}

- (void)keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  CGRect v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDF7A20]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  self->_keyboardHeight = CGRectGetHeight(v6);

  -[PRXCardContainerView _updateKeyboardDeferred:](self, "_updateKeyboardDeferred:", 0);
}

- (void)keyboardWillHide:(id)a3
{
  self->_keyboardHeight = 0.0;
  -[PRXCardContainerView _updateKeyboardDeferred:](self, "_updateKeyboardDeferred:", 0);
}

- (void)_updateKeyboardDeferred:(BOOL)a3
{
  double keyboardHeight;
  double v6;
  double v7;
  double v8;
  double v9;
  _QWORD v10[5];

  if (!self->_defersKeyboardUpdates)
  {
    -[NSLayoutConstraint constant](self->_scrollViewBottomConstraint, "constant");
    keyboardHeight = self->_keyboardHeight;
    if (v6 != -keyboardHeight)
    {
      if (!a3)
      {
        v10[0] = MEMORY[0x24BDAC760];
        v10[1] = 3221225472;
        v10[2] = __48__PRXCardContainerView__updateKeyboardDeferred___block_invoke;
        v10[3] = &unk_24CC31DB8;
        v10[4] = self;
        objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v10);
        keyboardHeight = self->_keyboardHeight;
      }
      if (keyboardHeight <= 0.0)
      {
        v9 = 0.0;
        v8 = 0.0;
        if (self->_usePortraitTopInset)
          v8 = 88.0 - self->_containerLayoutMargins.top;
        PRXIsPad();
      }
      else
      {
        -[PRXCardContainerView safeAreaInsets](self, "safeAreaInsets");
        v8 = v7;
        v9 = 0.0;
        if (PRXIsPad())
          v9 = 6.0 - self->_containerLayoutMargins.top;
      }
      -[NSLayoutConstraint setConstant:](self->_contentTopConstraint, "setConstant:", v9);
      -[NSLayoutConstraint setConstant:](self->_scrollViewTopConstraint, "setConstant:", v8);
      -[NSLayoutConstraint setConstant:](self->_scrollViewBottomConstraint, "setConstant:", -self->_keyboardHeight);
      -[NSLayoutConstraint setConstant:](self->_visibleHeightConstraint, "setConstant:", -self->_keyboardHeight);
      -[PRXPullDismissalScrollView setScrollEnabled:](self->_pullDismissalScrollView, "setScrollEnabled:", self->_keyboardHeight == 0.0);
      self->_shouldDismissKeyboardOnTap = self->_keyboardHeight != 0.0;
      if (!a3)
        -[PRXCardContainerView layoutIfNeeded](self, "layoutIfNeeded");
    }
  }
}

uint64_t __48__PRXCardContainerView__updateKeyboardDeferred___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)tappedView:(id)a3
{
  id WeakRetained;

  if (self->_shouldDismissKeyboardOnTap)
  {
    -[PRXCardContainerView firstResponder](self, "firstResponder", a3);
    WeakRetained = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "resignFirstResponder");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "backgroundTapped:", self);
  }

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  BOOL v5;
  id WeakRetained;
  PRXCardContainerView *v8;

  v4 = a3;
  if (self->_shouldDismissKeyboardOnTap)
  {
    v5 = 1;
  }
  else if (!-[PRXPullDismissalScrollView allowsPullToDismiss](self->_pullDismissalScrollView, "allowsPullToDismiss")
         || (-[PRXPullDismissalScrollView isDragging](self->_pullDismissalScrollView, "isDragging") & 1) != 0
         || (-[PRXPullDismissalScrollView isDecelerating](self->_pullDismissalScrollView, "isDecelerating") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "locationInView:", self);
      -[PRXCardContainerView hitTest:withEvent:](self, "hitTest:withEvent:", 0);
      v8 = (PRXCardContainerView *)objc_claimAutoreleasedReturnValue();
      v5 = v8 == self;

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (UIView)contentContainerView
{
  return self->_contentContainerView;
}

- (PRXCardBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (PRXPullDismissalScrollView)pullDismissalScrollView
{
  return self->_pullDismissalScrollView;
}

- (PRXCardContainerViewDelegate)delegate
{
  return (PRXCardContainerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CGSize)preferredContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredContentSize.width;
  height = self->_preferredContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)usePortraitTopInset
{
  return self->_usePortraitTopInset;
}

- (BOOL)defersKeyboardUpdates
{
  return self->_defersKeyboardUpdates;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pullDismissalScrollView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_scrollViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_scrollViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contentTopConstraint, 0);
  objc_storeStrong((id *)&self->_contentHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contentWidthConstraint, 0);
  objc_storeStrong((id *)&self->_visibleHeightConstraint, 0);
  objc_storeStrong((id *)&self->_scrollViewBottomConstraint, 0);
}

- (void)setPreferredContentSize:(double)a3 .cold.1(NSObject *a1, double a2, double a3)
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  NSStringFromCGSize(*(CGSize *)&a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl(&dword_21161A000, a1, OS_LOG_TYPE_DEBUG, "Card container view size changed to %@", (uint8_t *)&v5, 0xCu);

}

@end
