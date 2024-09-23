@implementation UIUndoTutorialViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIUndoTutorialViewController)initWithCompletionHandler:(id)a3
{
  id v4;
  UIUndoTutorialViewController *v5;
  void *v6;
  id completionHandler;
  UIUndoTutorialViewController *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIUndoTutorialViewController;
  v5 = -[UIViewController init](&v10, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    completionHandler = v5->_completionHandler;
    v5->_completionHandler = v6;

    v8 = v5;
  }

  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  UIVisualEffectView *v8;
  void *v9;
  UIUndoTutorialView *v10;
  uint64_t v11;
  UIUndoTutorialView *v12;
  UIUndoTutorialView *tutorialView;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  UILayoutGuide *v23;
  void *v24;
  UILayoutGuide *v25;
  void *v26;
  void *v27;
  double v28;
  UILayoutGuide *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  UILayoutGuide *v39;
  void *v40;
  UILayoutGuide *v41;
  void *v42;
  void *v43;
  double v44;
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
  UIVisualEffectView *v55;
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
  UIVisualEffectView *v75;
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
  UILayoutGuide *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  UILayoutGuide *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  UILayoutGuide *v130;
  UILayoutGuide *v131;
  void *v132;
  void *v133;
  UIVisualEffectView *v134;
  objc_super v135;
  _QWORD v136[9];
  _QWORD v137[10];

  v137[8] = *MEMORY[0x1E0C80C00];
  v135.receiver = self;
  v135.super_class = (Class)UIUndoTutorialViewController;
  -[UIViewController viewDidLoad](&v135, sel_viewDidLoad);
  +[UIColor _alertControllerDimmingViewColor](UIColor, "_alertControllerDimmingViewColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[UIViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");

  +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 1200);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UIVisualEffectView initWithEffect:]([UIVisualEffectView alloc], "initWithEffect:", v7);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v8);

  v10 = [UIUndoTutorialView alloc];
  if (v6 == 2)
    v11 = 1;
  else
    v11 = 2;
  v12 = -[UIUndoTutorialView initWithKeyboardAppearance:](v10, "initWithKeyboardAppearance:", v11);
  tutorialView = self->_tutorialView;
  self->_tutorialView = v12;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_tutorialView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIVisualEffectView contentView](v8, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", self->_tutorialView);

  -[UIView centerXAnchor](v8, "centerXAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "centerXAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  -[UIView centerYAnchor](v8, "centerYAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "centerYAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActive:", 1);

  -[UIVisualEffectView _setContinuousCornerRadius:](v8, "_setContinuousCornerRadius:", 14.0);
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v23 = objc_alloc_init(UILayoutGuide);
    -[UIViewController view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addLayoutGuide:", v23);

    v25 = objc_alloc_init(UILayoutGuide);
    -[UIViewController view](self, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addLayoutGuide:", v25);

    -[UIView widthAnchor](v8, "widthAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToConstant:", 625.0);
    v133 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v28) = 1148829696;
    objc_msgSend(v133, "setPriority:", v28);
    v112 = (void *)MEMORY[0x1E0D156E0];
    -[UILayoutGuide leadingAnchor](v23, "leadingAnchor");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "leadingAnchor");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "constraintEqualToAnchor:", v124);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v137[0] = v122;
    -[UIViewController view](self, "view");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "trailingAnchor");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v25;
    -[UILayoutGuide trailingAnchor](v25, "trailingAnchor");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "constraintEqualToAnchor:", v116);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v137[1] = v114;
    v131 = v23;
    -[UILayoutGuide widthAnchor](v23, "widthAnchor");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide widthAnchor](v25, "widthAnchor");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "constraintEqualToAnchor:multiplier:", v108, 1.0);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v137[2] = v106;
    v130 = v25;
    -[UILayoutGuide widthAnchor](v25, "widthAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "constraintGreaterThanOrEqualToConstant:", 10.0);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v137[3] = v102;
    -[UIView leadingAnchor](v8, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v23, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v137[4] = v32;
    -[UILayoutGuide leadingAnchor](v29, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v8, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v34);
    v132 = v7;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v137[5] = v35;
    -[UIView heightAnchor](v8, "heightAnchor");
    v134 = v8;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToConstant:", 747.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v137[6] = v37;
    v137[7] = v133;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v137, 8);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "activateConstraints:", v38);

    v39 = objc_alloc_init(UILayoutGuide);
    -[UIViewController view](self, "view");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addLayoutGuide:", v39);

    v41 = objc_alloc_init(UILayoutGuide);
    -[UIViewController view](self, "view");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addLayoutGuide:", v41);

    -[UILayoutGuide widthAnchor](v39, "widthAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToConstant:", 88.0);
    v129 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v44) = 1148829696;
    objc_msgSend(v129, "setPriority:", v44);
    v101 = (void *)MEMORY[0x1E0D156E0];
    v136[0] = v129;
    -[UILayoutGuide widthAnchor](v39, "widthAnchor");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "constraintGreaterThanOrEqualToConstant:", 10.0);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v136[1] = v125;
    -[UILayoutGuide widthAnchor](v41, "widthAnchor");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide widthAnchor](v39, "widthAnchor");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "constraintEqualToAnchor:multiplier:", v121, 1.0);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v136[2] = v119;
    v115 = v39;
    -[UILayoutGuide leadingAnchor](v39, "leadingAnchor");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v134, "leadingAnchor");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "constraintEqualToAnchor:", v113);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v136[3] = v111;
    -[UIView trailingAnchor](v134, "trailingAnchor");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = v41;
    -[UILayoutGuide trailingAnchor](v41, "trailingAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "constraintEqualToAnchor:", v105);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v136[4] = v103;
    -[UIUndoTutorialViewController tutorialView](self, "tutorialView");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "leadingAnchor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v39, "trailingAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "constraintEqualToAnchor:", v98);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v136[5] = v97;
    -[UILayoutGuide leadingAnchor](v41, "leadingAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIUndoTutorialViewController tutorialView](self, "tutorialView");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "trailingAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "constraintEqualToAnchor:", v94);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v136[6] = v93;
    -[UIUndoTutorialViewController tutorialView](self, "tutorialView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "topAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v134, "topAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:constant:", v47, 56.0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v136[7] = v48;
    -[UIView bottomAnchor](v134, "bottomAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIUndoTutorialViewController tutorialView](self, "tutorialView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "bottomAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:constant:", v51, 5.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v136[8] = v52;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v136, 9);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "activateConstraints:", v53);

    v54 = v130;
    v55 = (UIVisualEffectView *)v131;

    v8 = v134;
    v56 = v133;

    v7 = v132;
  }
  else
  {
    -[UIView widthAnchor](v8, "widthAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToConstant:", 270.0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setActive:", 1);

    -[UIUndoTutorialViewController tutorialView](self, "tutorialView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "topAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v8, "topAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:constant:", v61, 0.0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setActive:", 1);

    -[UIUndoTutorialViewController tutorialView](self, "tutorialView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "leadingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v8, "leadingAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:constant:", v65, 0.0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setActive:", 1);

    -[UIView trailingAnchor](v8, "trailingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIUndoTutorialViewController tutorialView](self, "tutorialView");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "trailingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:constant:", v69, 0.0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setActive:", 1);

    -[UIView bottomAnchor](v8, "bottomAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIUndoTutorialViewController tutorialView](self, "tutorialView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "bottomAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:constant:", v73, 0.0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setActive:", 1);

    v75 = [UIVisualEffectView alloc];
    +[UIVibrancyEffect effectForBlurEffect:style:](UIVibrancyEffect, "effectForBlurEffect:style:", v7, 7);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = -[UIVisualEffectView initWithEffect:](v75, "initWithEffect:", v76);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v55, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    +[UIColor whiteColor](UIColor, "whiteColor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](v55, "contentView");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setBackgroundColor:", v77);

    -[UIVisualEffectView contentView](v8, "contentView");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "addSubview:", v55);

    -[UIView leadingAnchor](v55, "leadingAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v8, "leadingAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintEqualToAnchor:", v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setActive:", 1);

    -[UIView trailingAnchor](v55, "trailingAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v8, "trailingAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "constraintEqualToAnchor:", v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "setActive:", 1);

    -[UIView bottomAnchor](v55, "bottomAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIUndoTutorialViewController tutorialView](self, "tutorialView");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "button");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "topAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "constraintEqualToAnchor:", v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setActive:", 1);

    -[UIView heightAnchor](v55, "heightAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToConstant:", 1.0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setActive:", 1);
  }

  -[UIUndoTutorialViewController tutorialView](self, "tutorialView");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "button");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "addTarget:action:forControlEvents:", self, sel_doneButtonPressed, 64);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)UIUndoTutorialViewController;
  v7 = a4;
  -[UIViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__UIUndoTutorialViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v8[3] = &unk_1E16B2150;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", &__block_literal_global_165, v8);

}

void __83__UIUndoTutorialViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "tutorialView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "restartPagingAnimation");

}

- (void)doneButtonPressed
{
  _BOOL8 v3;
  void *v4;
  id v5;

  -[UIViewController presentingViewController](self, "presentingViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1;
  -[UIUndoTutorialViewController completionHandler](self, "completionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", v3, v4);

}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 968);
}

- (UIUndoTutorialView)tutorialView
{
  return self->_tutorialView;
}

- (void)setTutorialView:(id)a3
{
  objc_storeStrong((id *)&self->_tutorialView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tutorialView, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
