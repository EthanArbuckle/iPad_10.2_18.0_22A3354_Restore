@implementation PXActionProgressToast

- (PXActionProgressToast)initWithTargetDestination:(id)a3 progress:(id)a4
{
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  PXActionProgressToast *v13;
  PXActionProgressToast *v14;
  void *v15;
  void **p_progress;
  UIView *v17;
  void *v18;
  UIView *progressView;
  PXRoundProgressView *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  UIImageView *checkmarkView;
  void *v30;
  uint64_t v31;
  UIButton *errorView;
  UIButton *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  UIView *leadingView;
  UIButton *v39;
  UIButton *closeButton;
  void *v41;
  UILabel *v42;
  UILabel *primaryLabel;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  UILabel *v49;
  UILabel *secondaryLabel;
  void *v51;
  void *v52;
  double v53;
  double v54;
  UIView *v55;
  UIView *labelContainer;
  PXActionProgressToast *v57;
  void *v58;
  void *v59;
  PXActionProgressToast *v60;
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
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  id v141;
  id v142;
  objc_super v143;
  _QWORD v144[29];

  v144[27] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v143.receiver = self;
  v143.super_class = (Class)PXActionProgressToast;
  v9 = *MEMORY[0x1E0C9D648];
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v13 = -[PXActionProgressToast initWithFrame:](&v143, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v10, v11, v12);
  v14 = v13;
  if (v13)
  {
    v142 = v7;
    -[PXActionProgressToast layer](v13, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCornerRadius:", 22.0);

    +[PXToastDefaultContentView configureBackgroundOfToastContentView:](PXToastDefaultContentView, "configureBackgroundOfToastContentView:", v14);
    objc_storeStrong((id *)&v14->_targetDestination, a3);
    p_progress = (void **)&v14->_progress;
    objc_storeStrong((id *)&v14->_progress, a4);
    v141 = v8;
    if (objc_msgSend(v8, "isIndeterminate"))
    {
      v17 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setColor:](v17, "setColor:", v18);

      -[UIView startAnimating](v17, "startAnimating");
      progressView = v14->_progressView;
      v14->_progressView = v17;
    }
    else
    {
      v20 = -[PXRoundProgressView initWithFrame:style:]([PXRoundProgressView alloc], "initWithFrame:style:", 5, v9, v10, v11, v12);
      progressView = v14->_progressView;
      v14->_progressView = &v20->super;
    }

    v21 = *p_progress;
    NSStringFromSelector(sel_fractionCompleted);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:forKeyPath:options:context:", v14, v22, 4, PXActionProgressToastContext);

    v23 = *p_progress;
    NSStringFromSelector(sel_localizedDescription);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:forKeyPath:options:context:", v14, v24, 4, PXActionProgressToastContext);

    v25 = *p_progress;
    NSStringFromSelector(sel_localizedAdditionalDescription);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:forKeyPath:options:context:", v14, v26, 4, PXActionProgressToastContext);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "addObserver:selector:name:object:", v14, sel__handleContentModeChange_, *MEMORY[0x1E0D71E70], 0);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.circle.fill"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "imageWithRenderingMode:", 2);
    v139 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v139);
    checkmarkView = v14->_checkmarkView;
    v14->_checkmarkView = (UIImageView *)v28;

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v14->_checkmarkView, "setTintColor:", v30);

    -[PXActionProgressToast setTranslatesAutoresizingMaskIntoConstraints:](v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
    v31 = objc_claimAutoreleasedReturnValue();
    errorView = v14->_errorView;
    v14->_errorView = (UIButton *)v31;

    v33 = v14->_errorView;
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("exclamationmark.circle.fill"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](v33, "setImage:forState:", v34, 0);

    -[UIButton addTarget:action:forControlEvents:](v14->_errorView, "addTarget:action:forControlEvents:", v14, sel__errorButtonClicked_, 64);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v14->_errorView, "setTintColor:", v35);

    v36 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[UIView frame](v14->_progressView, "frame");
    v37 = objc_msgSend(v36, "initWithFrame:");
    leadingView = v14->_leadingView;
    v14->_leadingView = (UIView *)v37;

    -[UIView addSubview:](v14->_leadingView, "addSubview:", v14->_progressView);
    -[UIView addSubview:](v14->_leadingView, "addSubview:", v14->_checkmarkView);
    -[UIView addSubview:](v14->_leadingView, "addSubview:", v14->_errorView);
    -[PXActionProgressToast addSubview:](v14, "addSubview:", v14->_leadingView);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark.circle.fill"));
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
    closeButton = v14->_closeButton;
    v14->_closeButton = v39;

    -[UIButton setImage:forState:](v14->_closeButton, "setImage:forState:", v138, 0);
    -[UIButton addTarget:action:forControlEvents:](v14->_closeButton, "addTarget:action:forControlEvents:", v14, sel__close_, 64);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v14->_closeButton, "setTintColor:", v41);

    -[PXActionProgressToast addSubview:](v14, "addSubview:", v14->_closeButton);
    -[UIButton setHidden:](v14->_closeButton, "setHidden:", 1);
    v42 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    primaryLabel = v14->_primaryLabel;
    v14->_primaryLabel = v42;

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v14->_primaryLabel, "setTextColor:", v44);

    -[PXActionProgressToast localizedTitle](v14, "localizedTitle");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v14->_primaryLabel, "setText:", v45);

    -[UILabel setLineBreakMode:](v14->_primaryLabel, "setLineBreakMode:", 4);
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 13.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v14->_primaryLabel, "setFont:", v46);

    LODWORD(v47) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v14->_primaryLabel, "setContentHuggingPriority:forAxis:", 0, v47);
    LODWORD(v48) = 1132068864;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v14->_primaryLabel, "setContentCompressionResistancePriority:forAxis:", 0, v48);
    -[UILabel sizeToFit](v14->_primaryLabel, "sizeToFit");
    v49 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    secondaryLabel = v14->_secondaryLabel;
    v14->_secondaryLabel = v49;

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v14->_secondaryLabel, "setTextColor:", v51);

    -[UILabel setLineBreakMode:](v14->_secondaryLabel, "setLineBreakMode:", 4);
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 13.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v14->_secondaryLabel, "setFont:", v52);

    LODWORD(v53) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v14->_secondaryLabel, "setContentHuggingPriority:forAxis:", 0, v53);
    LODWORD(v54) = 1132068864;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v14->_secondaryLabel, "setContentCompressionResistancePriority:forAxis:", 0, v54);
    -[UILabel sizeToFit](v14->_secondaryLabel, "sizeToFit");
    v55 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    labelContainer = v14->_labelContainer;
    v14->_labelContainer = v55;

    -[UIView addSubview:](v14->_labelContainer, "addSubview:", v14->_primaryLabel);
    -[UIView addSubview:](v14->_labelContainer, "addSubview:", v14->_secondaryLabel);
    -[PXActionProgressToast addSubview:](v14, "addSubview:", v14->_labelContainer);
    v137 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v14, sel__handleSingleTouchTap_);
    objc_msgSend(v137, "setNumberOfTouchesRequired:", 1);
    objc_msgSend(v137, "setNumberOfTapsRequired:", 1);
    -[PXActionProgressToast addGestureRecognizer:](v14, "addGestureRecognizer:", v137);
    -[PXActionProgressToast _prepareForReuse](v14, "_prepareForReuse");
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v14->_labelContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v14->_primaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v14->_secondaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v14->_checkmarkView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v14->_progressView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v14->_leadingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v14->_errorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v14->_leadingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v14->_closeButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v57 = v14;
    -[PXActionProgressToast heightAnchor](v57, "heightAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToConstant:", 44.0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setActive:", 1);

    v108 = (void *)MEMORY[0x1E0CB3718];
    -[PXActionProgressToast leadingAnchor](v57, "leadingAnchor");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v14->_leadingView, "leadingAnchor");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "constraintEqualToAnchor:constant:", v135, -12.0);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v144[0] = v134;
    -[PXActionProgressToast centerYAnchor](v57, "centerYAnchor");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](v14->_leadingView, "centerYAnchor");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "constraintEqualToAnchor:", v132);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v144[1] = v131;
    -[PXActionProgressToast heightAnchor](v57, "heightAnchor");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView heightAnchor](v14->_leadingView, "heightAnchor");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "constraintEqualToAnchor:", v129);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v144[2] = v128;
    -[PXActionProgressToast heightAnchor](v57, "heightAnchor");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "constraintGreaterThanOrEqualToConstant:", 80.0);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v144[3] = v126;
    -[UIView widthAnchor](v14->_leadingView, "widthAnchor");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "constraintEqualToConstant:", 18.0);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    v144[4] = v124;
    -[UIView centerXAnchor](v14->_leadingView, "centerXAnchor");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](v14->_progressView, "centerXAnchor");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "constraintEqualToAnchor:", v122);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v144[5] = v121;
    -[UIView centerYAnchor](v14->_leadingView, "centerYAnchor");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](v14->_progressView, "centerYAnchor");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "constraintEqualToAnchor:", v119);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v144[6] = v118;
    -[UIView centerYAnchor](v14->_leadingView, "centerYAnchor");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView centerYAnchor](v14->_checkmarkView, "centerYAnchor");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "constraintEqualToAnchor:", v116);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v144[7] = v115;
    -[UIView centerYAnchor](v14->_leadingView, "centerYAnchor");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton centerYAnchor](v14->_errorView, "centerYAnchor");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "constraintEqualToAnchor:", v113);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v144[8] = v112;
    -[UIView widthAnchor](v14->_progressView, "widthAnchor");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "constraintEqualToConstant:", 18.0);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v144[9] = v110;
    -[UIView heightAnchor](v14->_progressView, "heightAnchor");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "constraintEqualToConstant:", 18.0);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v144[10] = v107;
    -[UIImageView widthAnchor](v14->_checkmarkView, "widthAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "constraintEqualToConstant:", 18.0);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v144[11] = v105;
    -[UIImageView heightAnchor](v14->_checkmarkView, "heightAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "constraintEqualToConstant:", 18.0);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v144[12] = v103;
    -[UIButton widthAnchor](v14->_errorView, "widthAnchor");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "constraintEqualToConstant:", 18.0);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v144[13] = v101;
    -[UIButton heightAnchor](v14->_errorView, "heightAnchor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "constraintEqualToConstant:", 18.0);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v144[14] = v99;
    v60 = v57;
    -[PXActionProgressToast centerYAnchor](v57, "centerYAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton centerYAnchor](v14->_closeButton, "centerYAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "constraintEqualToAnchor:", v97);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v144[15] = v96;
    -[UIButton heightAnchor](v14->_closeButton, "heightAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "constraintEqualToConstant:", 18.0);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v144[16] = v94;
    -[PXActionProgressToast centerYAnchor](v57, "centerYAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](v14->_labelContainer, "centerYAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "constraintEqualToAnchor:", v92);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v144[17] = v91;
    -[UIView trailingAnchor](v14->_leadingView, "trailingAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v14->_labelContainer, "leadingAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "constraintEqualToAnchor:constant:", v89, -12.0);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v144[18] = v88;
    -[UIButton leadingAnchor](v14->_closeButton, "leadingAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v14->_labelContainer, "trailingAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "constraintEqualToAnchor:constant:", v86, 12.0);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v144[19] = v85;
    -[UIView topAnchor](v14->_labelContainer, "topAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel topAnchor](v14->_primaryLabel, "topAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintEqualToAnchor:", v83);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v144[20] = v82;
    -[UIView bottomAnchor](v14->_labelContainer, "bottomAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v14->_secondaryLabel, "bottomAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:", v80);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v144[21] = v79;
    -[UILabel bottomAnchor](v14->_primaryLabel, "bottomAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel topAnchor](v14->_secondaryLabel, "topAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "constraintEqualToAnchor:constant:", v77, -2.0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v144[22] = v76;
    -[UIView widthAnchor](v14->_labelContainer, "widthAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel widthAnchor](v14->_primaryLabel, "widthAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintGreaterThanOrEqualToAnchor:", v74);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v144[23] = v73;
    -[UIView widthAnchor](v14->_labelContainer, "widthAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel widthAnchor](v14->_secondaryLabel, "widthAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintGreaterThanOrEqualToAnchor:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v144[24] = v62;
    -[UIView trailingAnchor](v14->_leadingView, "trailingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v14->_labelContainer, "leadingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintLessThanOrEqualToAnchor:", v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v144[25] = v65;
    -[PXActionProgressToast trailingAnchor](v57, "trailingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v14->_labelContainer;

    -[UIView trailingAnchor](v67, "trailingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintGreaterThanOrEqualToAnchor:", v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v144[26] = v69;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v144, 27);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "activateConstraints:", v70);

    v7 = v142;
    v8 = v141;
  }

  return v14;
}

- (void)dealloc
{
  NSProgress *progress;
  void *v4;
  NSProgress *v5;
  void *v6;
  NSProgress *v7;
  void *v8;
  void *v9;
  objc_super v10;

  progress = self->_progress;
  NSStringFromSelector(sel_fractionCompleted);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSProgress removeObserver:forKeyPath:context:](progress, "removeObserver:forKeyPath:context:", self, v4, PXActionProgressToastContext);

  v5 = self->_progress;
  NSStringFromSelector(sel_localizedDescription);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSProgress removeObserver:forKeyPath:context:](v5, "removeObserver:forKeyPath:context:", self, v6, PXActionProgressToastContext);

  v7 = self->_progress;
  NSStringFromSelector(sel_localizedAdditionalDescription);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSProgress removeObserver:forKeyPath:context:](v7, "removeObserver:forKeyPath:context:", self, v8, PXActionProgressToastContext);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:name:object:", self, *MEMORY[0x1E0D71E70], 0);

  v10.receiver = self;
  v10.super_class = (Class)PXActionProgressToast;
  -[PXActionProgressToast dealloc](&v10, sel_dealloc);
}

- (void)updateConstraints
{
  double v3;
  double v4;
  NSLayoutConstraint *primaryLabelWidthConstraint;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *v8;
  double v9;
  double v10;
  double v11;
  NSLayoutConstraint *secondaryLabelWidthConstraint;
  void *v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *v15;
  double v16;
  NSLayoutConstraint *labelContainerWidthConstraint;
  double v18;
  void *v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *v21;
  void *v22;
  UIView *labelContainer;
  void *v24;
  void *v25;
  NSLayoutConstraint *v26;
  NSLayoutConstraint *primaryLabelAlignmentConstraint;
  void *v28;
  void *v29;
  NSLayoutConstraint *v30;
  NSLayoutConstraint *secondaryLabelAlignmentConstraint;
  void *v32;
  void *v33;
  NSLayoutConstraint *v34;
  NSLayoutConstraint *trailingSpacingConstraint;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  NSLayoutConstraint *v41;
  NSLayoutConstraint *v42;
  void *v43;
  void *v44;
  NSLayoutConstraint *v45;
  NSLayoutConstraint *v46;
  void *v47;
  void *v48;
  NSLayoutConstraint *v49;
  NSLayoutConstraint *v50;
  NSLayoutConstraint *v51;
  NSLayoutConstraint *closeButtonWidthConstraint;
  objc_super v53;

  v53.receiver = self;
  v53.super_class = (Class)PXActionProgressToast;
  -[PXActionProgressToast updateConstraints](&v53, sel_updateConstraints);
  -[UILabel intrinsicContentSize](self->_primaryLabel, "intrinsicContentSize");
  v4 = v3;
  primaryLabelWidthConstraint = self->_primaryLabelWidthConstraint;
  if (primaryLabelWidthConstraint)
  {
    -[NSLayoutConstraint setConstant:](primaryLabelWidthConstraint, "setConstant:", v3);
  }
  else
  {
    -[UILabel widthAnchor](self->_primaryLabel, "widthAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToConstant:", v4);
    v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v8 = self->_primaryLabelWidthConstraint;
    self->_primaryLabelWidthConstraint = v7;

    LODWORD(v9) = 1132068864;
    -[NSLayoutConstraint setPriority:](self->_primaryLabelWidthConstraint, "setPriority:", v9);
    -[NSLayoutConstraint setActive:](self->_primaryLabelWidthConstraint, "setActive:", 1);
  }
  -[UILabel intrinsicContentSize](self->_secondaryLabel, "intrinsicContentSize");
  v11 = v10;
  secondaryLabelWidthConstraint = self->_secondaryLabelWidthConstraint;
  if (secondaryLabelWidthConstraint)
  {
    -[NSLayoutConstraint setConstant:](secondaryLabelWidthConstraint, "setConstant:", v10);
  }
  else
  {
    -[UILabel widthAnchor](self->_secondaryLabel, "widthAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToConstant:", v11);
    v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v15 = self->_secondaryLabelWidthConstraint;
    self->_secondaryLabelWidthConstraint = v14;

    LODWORD(v16) = 1132068864;
    -[NSLayoutConstraint setPriority:](self->_secondaryLabelWidthConstraint, "setPriority:", v16);
    -[NSLayoutConstraint setActive:](self->_secondaryLabelWidthConstraint, "setActive:", 1);
  }
  if (v4 < v11)
    v4 = v11;
  labelContainerWidthConstraint = self->_labelContainerWidthConstraint;
  if (labelContainerWidthConstraint)
  {
    -[NSLayoutConstraint constant](labelContainerWidthConstraint, "constant");
    if (v18 < v4)
      v18 = v4;
    -[NSLayoutConstraint setConstant:](self->_labelContainerWidthConstraint, "setConstant:", v18);
  }
  else
  {
    -[UIView widthAnchor](self->_labelContainer, "widthAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToConstant:", v4);
    v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v21 = self->_labelContainerWidthConstraint;
    self->_labelContainerWidthConstraint = v20;

    -[NSLayoutConstraint setActive:](self->_labelContainerWidthConstraint, "setActive:", 1);
  }
  if (self->_primaryLabelAlignmentConstraint)
    -[PXActionProgressToast removeConstraint:](self, "removeConstraint:");
  if (self->_secondaryLabelWidthConstraint)
    -[PXActionProgressToast removeConstraint:](self, "removeConstraint:", self->_secondaryLabelAlignmentConstraint);
  if (self->_closeButtonWidthConstraint)
    -[PXActionProgressToast removeConstraint:](self, "removeConstraint:");
  if (self->_trailingSpacingConstraint)
    -[PXActionProgressToast removeConstraint:](self, "removeConstraint:");
  -[PXActionProgressToast closeButtonAction](self, "closeButtonAction");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  labelContainer = self->_labelContainer;
  if (v22)
  {
    -[UIView centerXAnchor](labelContainer, "centerXAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel centerXAnchor](self->_primaryLabel, "centerXAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    primaryLabelAlignmentConstraint = self->_primaryLabelAlignmentConstraint;
    self->_primaryLabelAlignmentConstraint = v26;

    -[NSLayoutConstraint setActive:](self->_primaryLabelAlignmentConstraint, "setActive:", 1);
    -[UIView centerXAnchor](self->_labelContainer, "centerXAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel centerXAnchor](self->_secondaryLabel, "centerXAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v29);
    v30 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    secondaryLabelAlignmentConstraint = self->_secondaryLabelAlignmentConstraint;
    self->_secondaryLabelAlignmentConstraint = v30;

    -[NSLayoutConstraint setActive:](self->_secondaryLabelAlignmentConstraint, "setActive:", 1);
    -[PXActionProgressToast trailingAnchor](self, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton trailingAnchor](self->_closeButton, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:constant:", v33, 12.0);
    v34 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    trailingSpacingConstraint = self->_trailingSpacingConstraint;
    self->_trailingSpacingConstraint = v34;

    -[NSLayoutConstraint setActive:](self->_trailingSpacingConstraint, "setActive:", 1);
    -[UIButton widthAnchor](self->_closeButton, "widthAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    v38 = 18.0;
  }
  else
  {
    -[UIView leadingAnchor](labelContainer, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](self->_primaryLabel, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v40);
    v41 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v42 = self->_primaryLabelAlignmentConstraint;
    self->_primaryLabelAlignmentConstraint = v41;

    -[NSLayoutConstraint setActive:](self->_primaryLabelAlignmentConstraint, "setActive:", 1);
    -[UIView leadingAnchor](self->_labelContainer, "leadingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](self->_secondaryLabel, "leadingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v44);
    v45 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v46 = self->_secondaryLabelAlignmentConstraint;
    self->_secondaryLabelAlignmentConstraint = v45;

    -[NSLayoutConstraint setActive:](self->_secondaryLabelAlignmentConstraint, "setActive:", 1);
    -[PXActionProgressToast trailingAnchor](self, "trailingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_labelContainer, "trailingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:constant:", v48, 22.0);
    v49 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v50 = self->_trailingSpacingConstraint;
    self->_trailingSpacingConstraint = v49;

    -[NSLayoutConstraint setActive:](self->_trailingSpacingConstraint, "setActive:", 1);
    -[UIButton widthAnchor](self->_closeButton, "widthAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    v38 = 0.0;
  }
  objc_msgSend(v36, "constraintEqualToConstant:", v38);
  v51 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  closeButtonWidthConstraint = self->_closeButtonWidthConstraint;
  self->_closeButtonWidthConstraint = v51;

  -[NSLayoutConstraint setActive:](self->_closeButtonWidthConstraint, "setActive:", 1);
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXActionProgressToast;
  -[PXActionProgressToast setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PXActionProgressToast _updateToastMargin](self, "_updateToastMargin");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  objc_super v12;
  _QWORD block[4];
  id v14;
  PXActionProgressToast *v15;

  v10 = a3;
  v11 = v10;
  if ((void *)PXActionProgressToastContext == a6)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__PXActionProgressToast_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E5148D08;
    v14 = v10;
    v15 = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PXActionProgressToast;
    -[PXActionProgressToast observeValueForKeyPath:ofObject:change:context:](&v12, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, a5, a6);
  }

}

- (void)willStartProgress
{
  void *v3;
  void *v4;
  id v5;

  -[PXActionProgressToast _updateIcons](self, "_updateIcons");
  -[PXActionProgressToast progress](self, "progress");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedAdditionalDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionProgressToast setLocalizedProgressText:](self, "setLocalizedProgressText:", v3);

  -[PXActionProgressToast targetDestination](self, "targetDestination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionProgressToast _updateDisplayForDestination:](self, "_updateDisplayForDestination:", v4);

  -[PXActionProgressToast setState:](self, "setState:", 1);
  -[PXActionProgressToast _showToast](self, "_showToast");

}

- (id)_determinateProgressView
{
  UIView *progressView;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    progressView = self->_progressView;
  else
    progressView = 0;
  return progressView;
}

- (void)_updateDeterminateProgress
{
  void *v3;
  double v4;
  id v5;

  -[PXActionProgressToast _determinateProgressView](self, "_determinateProgressView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PXActionProgressToast progress](self, "progress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fractionCompleted");
  *(float *)&v4 = v4;
  objc_msgSend(v5, "setProgress:", v4);

}

- (void)_showToast
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  PXToast *v11;
  PXToast *toast;
  _QWORD v13[5];
  id v14;
  id buf[2];

  v3 = (void *)_activeToasts_235756;
  if (!_activeToasts_235756)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)_activeToasts_235756;
    _activeToasts_235756 = v4;

    v3 = (void *)_activeToasts_235756;
  }
  -[PXActionProgressToast targetDestination](self, "targetDestination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_9;
  if ((objc_msgSend(v7, "isLocked") & 1) == 0)
  {
    objc_msgSend(v7, "_dismissAnimated:", 1);
LABEL_9:
    v9 = (void *)_activeToasts_235756;
    -[PXActionProgressToast targetDestination](self, "targetDestination");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", self, v10);

    objc_initWeak(buf, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __35__PXActionProgressToast__showToast__block_invoke;
    v13[3] = &unk_1E513B260;
    objc_copyWeak(&v14, buf);
    v13[4] = self;
    +[PXToast show:](PXToast, "show:", v13);
    v11 = (PXToast *)objc_claimAutoreleasedReturnValue();
    toast = self->_toast;
    self->_toast = v11;

    objc_destroyWeak(&v14);
    objc_destroyWeak(buf);
    goto LABEL_10;
  }
  PLUIGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "PXActionProgressToast: Cannot display new toast with locked toast in existence.", (uint8_t *)buf, 2u);
  }

LABEL_10:
}

- (void)_dismissAnimated:(BOOL)a3 afterDelay:(double)a4
{
  dispatch_time_t v6;
  _QWORD block[4];
  id v8;
  BOOL v9;
  id location;

  objc_initWeak(&location, self);
  v6 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__PXActionProgressToast__dismissAnimated_afterDelay___block_invoke;
  block[3] = &unk_1E5145760;
  objc_copyWeak(&v8, &location);
  v9 = a3;
  dispatch_after(v6, MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_dismissAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[PXActionProgressToast targetDestination](self, "targetDestination");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_activeToasts_235756, "objectForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend((id)_activeToasts_235756, "removeObjectForKey:", v6);
  -[PXToast dismissAnimated:](self->_toast, "dismissAnimated:", v3);

}

- (BOOL)isLocked
{
  int64_t v3;
  void *v4;

  v3 = -[PXActionProgressToast state](self, "state");
  -[PXActionProgressToast closeButtonAction](self, "closeButtonAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 == 1 && v4 != 0;
}

- (void)setErrors:(id)a3
{
  -[PXActionProgressToast setErrors:forMediaType:](self, "setErrors:forMediaType:", a3, 0);
}

- (void)setErrors:(id)a3 forMediaType:(int64_t)a4
{
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_errors, a3);
  if (objc_msgSend(v8, "count"))
  {
    if (-[PXActionProgressToast state](self, "state") != 1)
    {
      -[PXActionProgressToast _prepareForReuse](self, "_prepareForReuse");
      -[PXActionProgressToast _showToast](self, "_showToast");
    }
    -[PXActionProgressToast setState:](self, "setState:", 3);
    PXLocalizedAssetCountForUsage(objc_msgSend(v8, "count"), a4, 0, 5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionProgressToast setLocalizedProgressText:](self, "setLocalizedProgressText:", v7);
    -[PXActionProgressToast _updateIcons](self, "_updateIcons");

  }
}

- (void)finishProgressMarkingAsComplete:(BOOL)a3
{
  -[PXActionProgressToast finishProgressMarkingAsComplete:updatedLocalizedTitle:updatedLocalizedDescription:](self, "finishProgressMarkingAsComplete:updatedLocalizedTitle:updatedLocalizedDescription:", a3, 0, 0);
}

- (void)finishProgressMarkingAsComplete:(BOOL)a3 updatedLocalizedTitle:(id)a4 updatedLocalizedDescription:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  char v10;
  id v11;
  void *v12;
  char v13;
  double v14;
  void *v15;
  id v16;

  v6 = a3;
  v16 = a4;
  v8 = a5;
  if (-[PXActionProgressToast state](self, "state") == 1)
  {
    -[PXActionProgressToast setState:](self, "setState:", 4);
    if (!v6)
    {
      v14 = 1.7;
LABEL_17:
      -[PXActionProgressToast _dismissAnimated:afterDelay:](self, "_dismissAnimated:afterDelay:", 1, v14);
      goto LABEL_18;
    }
    if (v16)
    {
      -[PXActionProgressToast localizedTitle](self, "localizedTitle");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (v9 == v16)
      {

        if (!v8)
          goto LABEL_15;
LABEL_8:
        -[PXActionProgressToast localizedProgressText](self, "localizedProgressText");
        v11 = (id)objc_claimAutoreleasedReturnValue();
        if (v11 == v8)
        {

        }
        else
        {
          v12 = v11;
          v13 = objc_msgSend(v8, "isEqualToString:", v11);

          if ((v13 & 1) == 0)
          {
            -[PXActionProgressToast setLocalizedProgressText:](self, "setLocalizedProgressText:", v8);
LABEL_16:
            -[PXActionProgressToast _updateIcons](self, "_updateIcons");
            v14 = 1.0;
            goto LABEL_17;
          }
        }
LABEL_15:
        PXLocalizedStringFromTable(CFSTR("PXActionProgressCompleted"), CFSTR("PhotosUICore"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXActionProgressToast setLocalizedProgressText:](self, "setLocalizedProgressText:", v15);

        goto LABEL_16;
      }
      v10 = objc_msgSend(v16, "isEqualToString:", v9);

      if ((v10 & 1) == 0)
        -[PXActionProgressToast setLocalizedTitle:](self, "setLocalizedTitle:", v16);
    }
    if (!v8)
      goto LABEL_15;
    goto LABEL_8;
  }
LABEL_18:

}

- (void)setBottomSpacing:(double)a3
{
  if (self->_bottomSpacing != a3)
  {
    self->_bottomSpacing = a3;
    -[PXActionProgressToast _updateToastMargin](self, "_updateToastMargin");
  }
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    -[PXActionProgressToast _updatePrimaryLabel](self, "_updatePrimaryLabel");
  }
}

- (BOOL)_hasFinalState
{
  return (unint64_t)(-[PXActionProgressToast state](self, "state") - 2) < 3;
}

- (void)setLocalizedTitle:(id)a3
{
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;

  v8 = (NSString *)a3;
  v5 = self->_localizedTitle;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v8);

    if (!v7)
    {
      objc_storeStrong((id *)&self->_localizedTitle, a3);
      -[PXActionProgressToast _updatePrimaryLabel](self, "_updatePrimaryLabel");
    }
  }

}

- (void)_updatePrimaryLabel
{
  BOOL v3;
  void *v4;
  void *v5;
  id v6;

  -[PXActionProgressToast localizedTitle](self, "localizedTitle");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[PXActionProgressToast state](self, "state") != 4 && -[PXActionProgressToast state](self, "state") != 3;
  if (v3 || !v6)
  {
    -[PXActionProgressToast progress](self, "progress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_primaryLabel, "setText:", v5);

  }
  else
  {
    -[UILabel setText:](self->_primaryLabel, "setText:", v6);
  }
  -[PXActionProgressToast setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

}

- (void)setLocalizedProgressText:(id)a3
{
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;

  v8 = (NSString *)a3;
  v5 = self->_localizedProgressText;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v8);

    if (!v7)
    {
      objc_storeStrong((id *)&self->_localizedProgressText, a3);
      -[PXActionProgressToast _updateSecondaryLabel](self, "_updateSecondaryLabel");
    }
  }

}

- (void)_updateSecondaryLabel
{
  void *v3;

  -[PXActionProgressToast localizedProgressText](self, "localizedProgressText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_secondaryLabel, "setText:", v3);

  -[PXActionProgressToast setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)setCloseButtonAction:(id)a3
{
  void *v5;
  id closeButtonAction;

  v5 = _Block_copy(a3);
  closeButtonAction = self->_closeButtonAction;
  self->_closeButtonAction = v5;

  -[UIButton setHidden:](self->_closeButton, "setHidden:", a3 == 0);
  -[PXActionProgressToast setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)_handleSingleTouchTap:(id)a3
{
  void *v4;
  id v5;

  -[PXActionProgressToast _tabBarController](self, "_tabBarController", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PXActionProgressToast targetDestination](self, "targetDestination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "px_switchToTabAndNavigateToDestination:options:completionHandler:", v4, 0, &__block_literal_global_235753);

}

- (void)_errorButtonClicked:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, void *);

  -[PXActionProgressToast errorButtonAction](self, "errorButtonAction", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PXActionProgressToast errorButtonAction](self, "errorButtonAction");
    v6 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
    -[PXActionProgressToast errors](self, "errors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v5);

  }
}

- (void)_cancel
{
  void *v3;

  if (-[PXActionProgressToast state](self, "state") == 1)
  {
    -[PXActionProgressToast setState:](self, "setState:", 2);
    PXLocalizedStringFromTable(CFSTR("PXActionProgressCanceling"), CFSTR("PhotosUICore"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionProgressToast setLocalizedProgressText:](self, "setLocalizedProgressText:", v3);

    -[PXActionProgressToast _updateIcons](self, "_updateIcons");
  }
}

- (void)_close:(id)a3
{
  void *v4;
  void (**v5)(void);

  if (-[PXActionProgressToast state](self, "state", a3) == 1)
  {
    -[PXActionProgressToast closeButtonAction](self, "closeButtonAction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[PXActionProgressToast closeButtonAction](self, "closeButtonAction");
      v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v5[2]();

    }
    -[PXActionProgressToast _cancel](self, "_cancel");
    -[PXActionProgressToast _dismissAnimated:afterDelay:](self, "_dismissAnimated:afterDelay:", 1, 1.0);
  }
  else
  {
    -[PXActionProgressToast _dismissAnimated:](self, "_dismissAnimated:", 1);
  }
}

- (void)_updateToastMargin
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  id v10;

  -[PXActionProgressToast bottomSpacing](self, "bottomSpacing");
  v4 = v3;
  -[PXActionProgressToast _tabBarController](self, "_tabBarController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  if (v5 && (objc_msgSend(v5, "px_isTabBarHidden") & 1) == 0)
  {
    objc_msgSend(v10, "tabBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v8 = v9;
  }
  else
  {
    -[PXActionProgressToast _mainViewController](self, "_mainViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_safeAreaInsets");
    v8 = v7;
  }

  self->_toastMargin = v4 + 8.0 + v8;
  -[PXToast setBottomMargin:](self->_toast, "setBottomMargin:");

}

- (id)_mainViewController
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_firstKeyWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "contentViewController");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v5;

    v4 = v6;
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "selectedViewController");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:

  return v4;
}

- (id)_tabBarController
{
  void *v2;
  void *v3;

  -[PXActionProgressToast _mainViewController](self, "_mainViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tabBarController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_prepareForReuse
{
  NSArray *errors;
  void *v4;

  errors = self->_errors;
  self->_errors = 0;

  -[PXActionProgressToast setState:](self, "setState:", 0);
  -[PXActionProgressToast _updatePrimaryLabel](self, "_updatePrimaryLabel");
  -[PXActionProgressToast _updateSecondaryLabel](self, "_updateSecondaryLabel");
  -[PXActionProgressToast _updateToastMargin](self, "_updateToastMargin");
  -[PXActionProgressToast _determinateProgressView](self, "_determinateProgressView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepareForReuse");

  -[NSLayoutConstraint setConstant:](self->_labelContainerWidthConstraint, "setConstant:", 0.0);
}

- (void)_updateIcons
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[PXActionProgressToast state](self, "state");
  if (v3 <= 4)
  {
    v4 = (0xFu >> v3) & 1;
    v5 = (0x18u >> v3) & 1;
    -[UIButton setHidden:](self->_errorView, "setHidden:", (0x17u >> v3) & 1);
    -[UIImageView setHidden:](self->_checkmarkView, "setHidden:", v4);
    -[UIView setHidden:](self->_progressView, "setHidden:", v5);
  }
}

- (void)_handleContentModeChange:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D71E80]);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[PXActionProgressToast _updateDisplayForDestination:](self, "_updateDisplayForDestination:", v5);
}

- (void)_updateDisplayForDestination:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  -[PXActionProgressToast targetDestination](self, "targetDestination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PXActionProgressToast targetDestination](self, "targetDestination");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToNavigationDestination:", v7) ^ 1;

  }
  else
  {
    v6 = 0;
  }

  if ((_DWORD)v6 != -[PXActionProgressToast isHidden](self, "isHidden"))
  {
    -[PXActionProgressToast setHidden:](self, "setHidden:", v6);
    if ((v6 & -[PXActionProgressToast _hasFinalState](self, "_hasFinalState")) == 1)
      -[PXActionProgressToast _dismissAnimated:](self, "_dismissAnimated:", 0);
  }

}

- (int64_t)state
{
  return self->_state;
}

- (double)bottomSpacing
{
  return self->_bottomSpacing;
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 568, 1);
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedProgressText
{
  return self->_localizedProgressText;
}

- (id)closeButtonAction
{
  return self->_closeButtonAction;
}

- (id)errorButtonAction
{
  return self->_errorButtonAction;
}

- (void)setErrorButtonAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 600);
}

- (NSArray)errors
{
  return self->_errors;
}

- (PXProgrammaticNavigationDestination)targetDestination
{
  return self->_targetDestination;
}

- (void)setTargetDestination:(id)a3
{
  objc_storeStrong((id *)&self->_targetDestination, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetDestination, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong(&self->_errorButtonAction, 0);
  objc_storeStrong(&self->_closeButtonAction, 0);
  objc_storeStrong((id *)&self->_localizedProgressText, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_secondaryLabelAlignmentConstraint, 0);
  objc_storeStrong((id *)&self->_primaryLabelAlignmentConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryLabelWidthConstraint, 0);
  objc_storeStrong((id *)&self->_primaryLabelWidthConstraint, 0);
  objc_storeStrong((id *)&self->_trailingSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_closeButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_labelContainerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_toast, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_labelContainer, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_errorView, 0);
  objc_storeStrong((id *)&self->_checkmarkView, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
}

void __53__PXActionProgressToast__dismissAnimated_afterDelay___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dismissAnimated:", *(unsigned __int8 *)(a1 + 40));

}

void __35__PXActionProgressToast__showToast__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  id v5;

  v3 = (id *)(a1 + 40);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(v5, "setContentView:", WeakRetained);

  objc_msgSend(v5, "setBottomMargin:", *(double *)(*(_QWORD *)(a1 + 32) + 488));
}

void __72__PXActionProgressToast_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v2 = *(void **)(a1 + 32);
  NSStringFromSelector(sel_fractionCompleted);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", v3) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "progress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isIndeterminate");

    if ((v5 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "progress");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "fractionCompleted");
      v8 = v7;

      v9 = *(void **)(a1 + 40);
      if (v8 <= 0.0)
      {
        objc_msgSend(v9, "_prepareForReuse");
      }
      else if (!objc_msgSend(v9, "state"))
      {
        objc_msgSend(*(id *)(a1 + 40), "willStartProgress");
      }
      objc_msgSend(*(id *)(a1 + 40), "_updateDeterminateProgress");
      return;
    }
  }
  else
  {

  }
  v10 = *(void **)(a1 + 32);
  NSStringFromSelector(sel_localizedDescription);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v10, "isEqualToString:", v11);

  if ((_DWORD)v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "_updatePrimaryLabel");
  }
  else
  {
    v12 = *(void **)(a1 + 32);
    NSStringFromSelector(sel_localizedAdditionalDescription);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = objc_msgSend(v12, "isEqualToString:", v13);

    if ((_DWORD)v12 && (objc_msgSend(*(id *)(a1 + 40), "_hasFinalState") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "progress");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedAdditionalDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setLocalizedProgressText:", v14);

    }
  }
}

@end
