@implementation OBSetupAssistantSpinnerController

- (OBSetupAssistantSpinnerController)initWithSpinnerText:(id)a3
{
  id v4;
  OBSetupAssistantSpinnerController *v5;
  id v6;
  uint64_t v7;
  UILabel *label;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)OBSetupAssistantSpinnerController;
  v5 = -[OBSetupAssistantSpinnerController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0DC3990]);
    v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    label = v5->_label;
    v5->_label = (UILabel *)v7;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v5->_label, "setNumberOfLines:", 0);
    v9 = (void *)MEMORY[0x1E0DC1350];
    -[OBSetupAssistantSpinnerController _textStyle](v5, "_textStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferredFontForTextStyle:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_label, "setFont:", v11);

    v12 = (void *)objc_msgSend(v4, "copy");
    -[UILabel setText:](v5->_label, "setText:", v12);

  }
  return v5;
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OBSetupAssistantSpinnerController;
  -[OBBaseWelcomeController loadView](&v5, sel_loadView);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", -[OBSetupAssistantSpinnerController _activityIndicatorViewStyle](self, "_activityIndicatorViewStyle"));
  -[OBSetupAssistantSpinnerController setActivityIndicator:](self, "setActivityIndicator:", v3);

  -[OBSetupAssistantSpinnerController activityIndicator](self, "activityIndicator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[OBSetupAssistantSpinnerController _updateLayout](self, "_updateLayout");
  -[OBSetupAssistantSpinnerController _updateTextColor](self, "_updateTextColor");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  id v4;
  void *v5;
  id v6;
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
  objc_super v60;
  _QWORD v61[11];

  v61[9] = *MEMORY[0x1E0C80C00];
  v60.receiver = self;
  v60.super_class = (Class)OBSetupAssistantSpinnerController;
  -[OBBaseWelcomeController viewDidLayoutSubviews](&v60, sel_viewDidLayoutSubviews);
  -[OBSetupAssistantSpinnerController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else if (-[OBSetupAssistantSpinnerController _shouldUseScrollView](self, "_shouldUseScrollView"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3C28]);
    -[OBSetupAssistantSpinnerController setScrollView:](self, "setScrollView:", v4);

    -[OBSetupAssistantSpinnerController scrollView](self, "scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v6 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v7 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[OBSetupAssistantSpinnerController setScrollContentView:](self, "setScrollContentView:", v7);

    -[OBSetupAssistantSpinnerController scrollContentView](self, "scrollContentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[OBSetupAssistantSpinnerController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBSetupAssistantSpinnerController scrollView](self, "scrollView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v10);

    -[OBSetupAssistantSpinnerController scrollView](self, "scrollView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBSetupAssistantSpinnerController scrollContentView](self, "scrollContentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v12);

    v39 = (void *)MEMORY[0x1E0CB3718];
    -[OBSetupAssistantSpinnerController view](self, "view");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "topAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBSetupAssistantSpinnerController scrollView](self, "scrollView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "topAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v56);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v55;
    -[OBSetupAssistantSpinnerController view](self, "view");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "rightAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBSetupAssistantSpinnerController scrollView](self, "scrollView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "rightAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v51);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v61[1] = v50;
    -[OBSetupAssistantSpinnerController view](self, "view");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "bottomAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBSetupAssistantSpinnerController scrollView](self, "scrollView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "bottomAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v46);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v61[2] = v45;
    -[OBSetupAssistantSpinnerController view](self, "view");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "leftAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBSetupAssistantSpinnerController scrollView](self, "scrollView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "leftAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v61[3] = v40;
    -[OBSetupAssistantSpinnerController scrollContentView](self, "scrollContentView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBSetupAssistantSpinnerController scrollView](self, "scrollView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v35);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v61[4] = v34;
    -[OBSetupAssistantSpinnerController scrollContentView](self, "scrollContentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "rightAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBSetupAssistantSpinnerController scrollView](self, "scrollView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "rightAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v61[5] = v29;
    -[OBSetupAssistantSpinnerController scrollContentView](self, "scrollContentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBSetupAssistantSpinnerController scrollView](self, "scrollView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v61[6] = v24;
    -[OBSetupAssistantSpinnerController scrollContentView](self, "scrollContentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "leftAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBSetupAssistantSpinnerController scrollView](self, "scrollView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "leftAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v61[7] = v15;
    -[OBSetupAssistantSpinnerController scrollContentView](self, "scrollContentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "widthAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBSetupAssistantSpinnerController scrollView](self, "scrollView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "widthAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v61[8] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "activateConstraints:", v21);

    -[OBSetupAssistantSpinnerController _updateLayout](self, "_updateLayout");
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OBSetupAssistantSpinnerController;
  -[OBSetupAssistantSpinnerController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  if (!-[OBSetupAssistantSpinnerController isActivityIndicatorHidden](self, "isActivityIndicatorHidden"))
  {
    -[OBSetupAssistantSpinnerController activityIndicator](self, "activityIndicator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startAnimating");

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OBSetupAssistantSpinnerController;
  -[OBSetupAssistantSpinnerController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[OBSetupAssistantSpinnerController activityIndicator](self, "activityIndicator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopAnimating");

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0DC1350];
  -[OBSetupAssistantSpinnerController _textStyle](self, "_textStyle", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredFontForTextStyle:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBSetupAssistantSpinnerController label](self, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

  -[OBSetupAssistantSpinnerController _updateLayout](self, "_updateLayout");
}

- (void)setActivityIndicatorHidden:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;

  v3 = a3;
  self->_activityIndicatorHidden = a3;
  -[OBSetupAssistantSpinnerController activityIndicator](self, "activityIndicator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "stopAnimating");
  else
    objc_msgSend(v5, "startAnimating");

  -[OBSetupAssistantSpinnerController _updateTextColor](self, "_updateTextColor");
}

- (void)setPrivacyLinkController:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_privacyLinkController, a3);
  objc_msgSend(v6, "willMoveToParentViewController:", self);
  -[OBSetupAssistantSpinnerController addChildViewController:](self, "addChildViewController:", v6);
  objc_msgSend(v6, "didMoveToParentViewController:", self);
  objc_msgSend(v6, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  if (-[OBSetupAssistantSpinnerController isViewLoaded](self, "isViewLoaded"))
    -[OBSetupAssistantSpinnerController _updateLayout](self, "_updateLayout");

}

- (void)updateDirectionalLayoutMargins
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)OBSetupAssistantSpinnerController;
  -[OBBaseWelcomeController updateDirectionalLayoutMargins](&v15, sel_updateDirectionalLayoutMargins);
  -[OBSetupAssistantSpinnerController scrollContentView](self, "scrollContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "directionalLayoutMargins");
  v5 = v4;
  v7 = v6;

  -[OBSetupAssistantSpinnerController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "directionalLayoutMargins");
  v10 = v9;

  -[OBSetupAssistantSpinnerController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "directionalLayoutMargins");
  v13 = v12;

  -[OBSetupAssistantSpinnerController scrollContentView](self, "scrollContentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDirectionalLayoutMargins:", v5, v10, v7, v13);

}

- (id)_textStyle
{
  return (id)*MEMORY[0x1E0DC4A88];
}

- (void)_updateTextColor
{
  void *v3;
  id v4;

  if (-[OBSetupAssistantSpinnerController isActivityIndicatorHidden](self, "isActivityIndicatorHidden"))
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[OBSetupAssistantSpinnerController label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v4);

}

- (void)_updateLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
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
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  _BOOL4 v76;
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
  uint64_t v113;
  void *v114;
  uint64_t v115;
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
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  _QWORD v134[3];
  _QWORD v135[5];
  void *v136;
  _QWORD v137[3];
  void *v138;
  _QWORD v139[7];

  v139[5] = *MEMORY[0x1E0C80C00];
  -[OBSetupAssistantSpinnerController activityIndicator](self, "activityIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[OBSetupAssistantSpinnerController label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  -[OBSetupAssistantSpinnerController privacyLinkController](self, "privacyLinkController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  v7 = -[OBSetupAssistantSpinnerController _shouldUseScrollView](self, "_shouldUseScrollView");
  -[OBSetupAssistantSpinnerController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[OBSetupAssistantSpinnerController scrollContentView](self, "scrollContentView");
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  -[OBSetupAssistantSpinnerController activityIndicator](self, "activityIndicator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v10);

  -[OBSetupAssistantSpinnerController label](self, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v11);

  -[OBSetupAssistantSpinnerController privacyLinkController](self, "privacyLinkController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v13);

  v14 = -[OBSetupAssistantSpinnerController _activityIndicatorViewStyle](self, "_activityIndicatorViewStyle");
  -[OBSetupAssistantSpinnerController activityIndicator](self, "activityIndicator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActivityIndicatorViewStyle:", v14);

  LODWORD(v15) = +[OBViewUtilities shouldUseAccessibilityLayout](OBViewUtilities, "shouldUseAccessibilityLayout");
  -[OBSetupAssistantSpinnerController label](self, "label");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  v132 = v8;
  if (!(_DWORD)v15)
  {
    objc_msgSend(v16, "setTextAlignment:", 1);

    v91 = (void *)MEMORY[0x1E0CB3718];
    -[OBSetupAssistantSpinnerController activityIndicator](self, "activityIndicator");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "bottomAnchor");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBSetupAssistantSpinnerController label](self, "label");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "topAnchor");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "constraintEqualToAnchor:constant:", v118, -16.0);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v135[0] = v114;
    -[OBSetupAssistantSpinnerController activityIndicator](self, "activityIndicator");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "centerXAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "centerXAnchor");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "constraintEqualToAnchor:", v102);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v135[1] = v98;
    -[OBSetupAssistantSpinnerController label](self, "label");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "leftAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutMarginsGuide");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "leftAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "constraintEqualToAnchor:", v84);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v135[2] = v82;
    -[OBSetupAssistantSpinnerController label](self, "label");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "rightAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutMarginsGuide");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "rightAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:", v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v135[3] = v57;
    -[OBSetupAssistantSpinnerController label](self, "label");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "centerYAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "centerYAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v135[4] = v61;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v135, 5);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "activateConstraints:", v62);

    -[OBSetupAssistantSpinnerController privacyLinkController](self, "privacyLinkController");
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    v64 = (void *)MEMORY[0x1E0CB3718];
    if (v63)
    {
      -[OBSetupAssistantSpinnerController privacyLinkController](self, "privacyLinkController");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "view");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v127, "leftAnchor");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "layoutMarginsGuide");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "leftAnchor");
      v115 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "constraintEqualToAnchor:", v115);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v134[0] = v40;
      -[OBSetupAssistantSpinnerController privacyLinkController](self, "privacyLinkController");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "view");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "rightAnchor");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "layoutMarginsGuide");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "rightAnchor");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "constraintEqualToAnchor:", v95);
      v65 = v64;
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v134[1] = v66;
      -[OBSetupAssistantSpinnerController privacyLinkController](self, "privacyLinkController");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "view");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "bottomAnchor");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "layoutMarginsGuide");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "bottomAnchor");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "constraintEqualToAnchor:", v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v134[2] = v72;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v134, 3);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "activateConstraints:", v73);

      v51 = v127;
      v49 = (void *)v115;

      v50 = v119;
      v52 = v123;

      v53 = v131;
      v39 = v132;
      goto LABEL_13;
    }
    -[OBSetupAssistantSpinnerController label](self, "label");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "bottomAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v132;
    objc_msgSend(v132, "layoutMarginsGuide");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "bottomAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintLessThanOrEqualToAnchor:", v50);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = v49;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v133, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v64;
LABEL_12:
    objc_msgSend(v75, "activateConstraints:", v40);
    goto LABEL_13;
  }
  v76 = v7;
  objc_msgSend(v16, "setTextAlignment:", 4);

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  v20 = v19 * 0.09;

  v87 = (void *)MEMORY[0x1E0CB3718];
  -[OBSetupAssistantSpinnerController activityIndicator](self, "activityIndicator");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "topAnchor");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutMarginsGuide");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "topAnchor");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "constraintEqualToAnchor:constant:", v116, v20);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v139[0] = v112;
  -[OBSetupAssistantSpinnerController activityIndicator](self, "activityIndicator");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "leadingAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutMarginsGuide");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "leadingAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "constraintEqualToAnchor:", v96);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v139[1] = v92;
  -[OBSetupAssistantSpinnerController label](self, "label");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "topAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBSetupAssistantSpinnerController activityIndicator](self, "activityIndicator");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "bottomAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "constraintEqualToAnchor:constant:", v81, 37.0);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v139[2] = v79;
  -[OBSetupAssistantSpinnerController label](self, "label");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "leftAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutMarginsGuide");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "leftAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v139[3] = v23;
  -[OBSetupAssistantSpinnerController label](self, "label");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "rightAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutMarginsGuide");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "rightAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v139[4] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v139, 5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "activateConstraints:", v29);

  -[OBSetupAssistantSpinnerController privacyLinkController](self, "privacyLinkController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30)
  {
    v74 = (void *)MEMORY[0x1E0CB3718];
    -[OBSetupAssistantSpinnerController label](self, "label");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "bottomAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v132;
    objc_msgSend(v132, "layoutMarginsGuide");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "bottomAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintLessThanOrEqualToAnchor:", v50);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v136 = v49;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v136, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v74;
    goto LABEL_12;
  }
  if (v76)
  {
    v31 = (void *)MEMORY[0x1E0CB3718];
    -[OBSetupAssistantSpinnerController privacyLinkController](self, "privacyLinkController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBSetupAssistantSpinnerController label](self, "label");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:constant:", v36, 20.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v138, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "activateConstraints:", v38);

  }
  v105 = (void *)MEMORY[0x1E0CB3718];
  -[OBSetupAssistantSpinnerController privacyLinkController](self, "privacyLinkController");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "view");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "leftAnchor");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v132;
  objc_msgSend(v132, "layoutMarginsGuide");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "leftAnchor");
  v113 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "constraintEqualToAnchor:", v113);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v137[0] = v40;
  -[OBSetupAssistantSpinnerController privacyLinkController](self, "privacyLinkController");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "view");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "rightAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "layoutMarginsGuide");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "rightAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "constraintEqualToAnchor:", v90);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v137[1] = v41;
  -[OBSetupAssistantSpinnerController privacyLinkController](self, "privacyLinkController");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "view");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "layoutMarginsGuide");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "bottomAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v137[2] = v47;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v137, 3);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "activateConstraints:", v48);

  v49 = (void *)v113;
  v50 = v117;

  v51 = v125;
  v52 = v121;

  v53 = v129;
LABEL_13:

}

- (int64_t)_activityIndicatorViewStyle
{
  if (+[OBViewUtilities shouldUseAccessibilityLayout](OBViewUtilities, "shouldUseAccessibilityLayout"))
    return 101;
  else
    return 100;
}

- (BOOL)_shouldUseScrollView
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  double MaxY;
  void *v8;
  void *v9;
  CGRect v11;
  CGRect v12;

  -[OBSetupAssistantSpinnerController privacyLinkController](self, "privacyLinkController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[OBSetupAssistantSpinnerController scrollView](self, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return 1;
  -[OBSetupAssistantSpinnerController label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  MaxY = CGRectGetMaxY(v11);
  -[OBSetupAssistantSpinnerController privacyLinkController](self, "privacyLinkController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v5 = MaxY > CGRectGetMinY(v12);

  return v5;
}

- (BOOL)isActivityIndicatorHidden
{
  return self->_activityIndicatorHidden;
}

- (OBPrivacyLinkController)privacyLinkController
{
  return self->_privacyLinkController;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (UIView)scrollContentView
{
  return self->_scrollContentView;
}

- (void)setScrollContentView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollContentView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollContentView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_privacyLinkController, 0);
}

@end
