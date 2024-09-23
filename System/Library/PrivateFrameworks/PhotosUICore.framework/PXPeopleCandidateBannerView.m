@implementation PXPeopleCandidateBannerView

- (PXPeopleCandidateBannerView)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleCandidateBannerView.m"), 52, CFSTR("%s is not available as initializer"), "-[PXPeopleCandidateBannerView initWithCoder:]");

  abort();
}

- (PXPeopleCandidateBannerView)initWithFrame:(CGRect)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleCandidateBannerView.m"), 56, CFSTR("%s is not available as initializer"), "-[PXPeopleCandidateBannerView initWithFrame:]");

  abort();
}

- (PXPeopleCandidateBannerView)initWithStyle:(int64_t)a3
{
  PXPeopleCandidateBannerView *v4;
  PXPeopleCandidateBannerView *v5;
  void *v6;
  PXPeopleScalableAvatarView *v7;
  id *p_personAvatarView;
  PXPeopleScalableAvatarView *personAvatarView;
  uint64_t v10;
  UIImageView *contactAvatarView;
  char v12;
  UILabel *v13;
  UILabel *promptLabel;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  PXPeopleCandidateBannerView *v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
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
  id v88;
  id v89;
  id v90;
  void *v91;
  id v92;
  id obj;
  _QWORD v94[4];
  id v95;
  id location;
  _QWORD v97[4];
  id v98;
  objc_super v99;
  _QWORD v100[15];
  _QWORD v101[21];

  v101[19] = *MEMORY[0x1E0C80C00];
  v99.receiver = self;
  v99.super_class = (Class)PXPeopleCandidateBannerView;
  v4 = -[PXPeopleCandidateBannerView initWithFrame:](&v99, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleCandidateBannerView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    switch(a3)
    {
      case 0:
      case 4:
        v7 = -[PXPeopleScalableAvatarView initWithFrame:]([PXPeopleScalableAvatarView alloc], "initWithFrame:", 0.0, 0.0, 37.0, 37.0);
        p_personAvatarView = (id *)&v5->_personAvatarView;
        personAvatarView = v5->_personAvatarView;
        v5->_personAvatarView = v7;

        -[PXPeopleScalableAvatarView setCornerStyle:](v5->_personAvatarView, "setCornerStyle:", 1);
        goto LABEL_5;
      case 1:
      case 3:
        v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", 0.0, 0.0, 37.0, 37.0);
        p_personAvatarView = (id *)&v5->_contactAvatarView;
        contactAvatarView = v5->_contactAvatarView;
        v5->_contactAvatarView = (UIImageView *)v10;

LABEL_5:
        v90 = *p_personAvatarView;
        objc_msgSend(v90, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        if (!v90)
          goto LABEL_8;
        -[PXPeopleCandidateBannerView addSubview:](v5, "addSubview:");
        v12 = 0;
        break;
      default:
        objc_msgSend(0, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
LABEL_8:
        v90 = 0;
        v12 = 1;
        break;
    }
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    promptLabel = v5->_promptLabel;
    v5->_promptLabel = v13;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_promptLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v15) = 1132068864;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v5->_promptLabel, "setContentCompressionResistancePriority:forAxis:", 0, v15);
    LODWORD(v16) = 1112014848;
    -[UILabel setContentHuggingPriority:forAxis:](v5->_promptLabel, "setContentHuggingPriority:forAxis:", 0, v16);
    -[UILabel setLineBreakMode:](v5->_promptLabel, "setLineBreakMode:", 0);
    -[UILabel setNumberOfLines:](v5->_promptLabel, "setNumberOfLines:", 0);
    -[PXPeopleCandidateBannerView _updatePromptTitle](v5, "_updatePromptTitle");
    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_promptLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[PXPeopleCandidateBannerView addSubview:](v5, "addSubview:", v5->_promptLabel);
    objc_msgSend(MEMORY[0x1E0DC3520], "filledButtonConfiguration");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleCandidateBannerView tintColor](v5, "tintColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "setBaseBackgroundColor:", v17);

    objc_msgSend(v91, "background");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCornerRadius:", 12.0);

    objc_msgSend(v91, "setContentInsets:", 0.0, 10.0, 0.0, 10.0);
    -[PXPeopleCandidateBannerView _reviewButtonTitle](v5, "_reviewButtonTitle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "setTitle:", v19);

    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:addingSymbolicTraits:weight:", *MEMORY[0x1E0DC4AB8], 0x8000, *MEMORY[0x1E0DC1420]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    v97[0] = MEMORY[0x1E0C809B0];
    v97[1] = 3221225472;
    v97[2] = __45__PXPeopleCandidateBannerView_initWithStyle___block_invoke;
    v97[3] = &unk_1E5138A20;
    v51 = v20;
    v98 = v51;
    objc_msgSend(v91, "setTitleTextAttributesTransformer:", v97);
    objc_initWeak(&location, v5);
    v22 = (void *)MEMORY[0x1E0DC3428];
    v94[0] = v21;
    v94[1] = 3221225472;
    v94[2] = __45__PXPeopleCandidateBannerView_initWithStyle___block_invoke_2;
    v94[3] = &unk_1E5147F40;
    objc_copyWeak(&v95, &location);
    objc_msgSend(v22, "actionWithHandler:", v94);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v91);
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_storeStrong((id *)&v5->_actionButton, obj);
    -[PXPeopleCandidateBannerView addSubview:](v5, "addSubview:", obj);
    -[PXPeopleCandidateBannerView _updateNotNowButton](v5, "_updateNotNowButton");
    v92 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "setBackgroundColor:", v23);

    objc_msgSend(v92, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PXPeopleCandidateBannerView addSubview:](v5, "addSubview:", v92);
    -[PXPeopleCandidateBannerView spec](v5, "spec");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "layoutMargins");
    v26 = v25;

    -[UIButton trailingAnchor](v5->_notNowButton, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleCandidateBannerView trailingAnchor](v5, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, -(v26 + 7.0));
    v88 = (id)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)&v5->_notNowToTrailingConstraint, v88);
    if ((v12 & 1) != 0)
    {
      -[UILabel leadingAnchor](v5->_promptLabel, "leadingAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPeopleCandidateBannerView leadingAnchor](v5, "leadingAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, v26);
      v89 = (id)objc_claimAutoreleasedReturnValue();

      objc_storeStrong((id *)&v5->_leadingConstraint, v89);
      v31 = (void *)MEMORY[0x1E0CB3718];
      v100[0] = v89;
      -[UILabel centerYAnchor](v5->_promptLabel, "centerYAnchor");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPeopleCandidateBannerView centerYAnchor](v5, "centerYAnchor");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "constraintEqualToAnchor:", v86);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v100[1] = v85;
      objc_msgSend(obj, "leadingAnchor");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel trailingAnchor](v5->_promptLabel, "trailingAnchor");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "constraintEqualToAnchor:constant:", v83, 15.0);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v100[2] = v82;
      objc_msgSend(obj, "centerYAnchor");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPeopleCandidateBannerView centerYAnchor](v5, "centerYAnchor");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "constraintEqualToAnchor:", v80);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v100[3] = v79;
      objc_msgSend(obj, "heightAnchor");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "constraintEqualToConstant:", 24.0);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v100[4] = v77;
      -[UIButton leadingAnchor](v5->_notNowButton, "leadingAnchor");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obj, "trailingAnchor");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "constraintEqualToAnchor:constant:", v75, 15.0);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v100[5] = v74;
      -[UIButton centerYAnchor](v5->_notNowButton, "centerYAnchor");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPeopleCandidateBannerView centerYAnchor](v5, "centerYAnchor");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "constraintEqualToAnchor:", v72);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v100[6] = v71;
      -[UIButton heightAnchor](v5->_notNowButton, "heightAnchor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "constraintEqualToConstant:", 24.0);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v100[7] = v69;
      v100[8] = v88;
      objc_msgSend(v92, "leadingAnchor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPeopleCandidateBannerView leadingAnchor](v5, "leadingAnchor");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "constraintEqualToAnchor:", v67);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v100[9] = v66;
      objc_msgSend(v92, "trailingAnchor");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPeopleCandidateBannerView trailingAnchor](v5, "trailingAnchor");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "constraintEqualToAnchor:", v64);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v100[10] = v63;
      objc_msgSend(v92, "bottomAnchor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPeopleCandidateBannerView bottomAnchor](v5, "bottomAnchor");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "constraintEqualToAnchor:", v61);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v100[11] = v60;
      objc_msgSend(v92, "heightAnchor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "scale");
      objc_msgSend(v59, "constraintEqualToConstant:", 1.0 / v32);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v100[12] = v57;
      -[PXPeopleCandidateBannerView heightAnchor](v5, "heightAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "constraintGreaterThanOrEqualToConstant:", 60.0);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v100[13] = v55;
      -[PXPeopleCandidateBannerView heightAnchor](v5, "heightAnchor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel heightAnchor](v5->_promptLabel, "heightAnchor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "constraintGreaterThanOrEqualToAnchor:constant:", v53, 28.0);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v100[14] = v52;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v100, 15);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "activateConstraints:", v33);
    }
    else
    {
      objc_msgSend(v90, "leadingAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPeopleCandidateBannerView leadingAnchor](v5, "leadingAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constraintEqualToAnchor:constant:", v35, v26);
      v89 = (id)objc_claimAutoreleasedReturnValue();

      objc_storeStrong((id *)&v5->_leadingConstraint, v89);
      v47 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v90, "widthAnchor");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "constraintEqualToConstant:", 37.0);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v101[0] = v86;
      objc_msgSend(v90, "heightAnchor");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "constraintEqualToConstant:", 37.0);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v101[1] = v84;
      objc_msgSend(v90, "centerYAnchor");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPeopleCandidateBannerView centerYAnchor](v5, "centerYAnchor");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "constraintEqualToAnchor:", v82);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v101[2] = v81;
      v101[3] = v89;
      -[UILabel leadingAnchor](v5->_promptLabel, "leadingAnchor");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "trailingAnchor");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "constraintEqualToAnchor:constant:", v79, 8.0);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v101[4] = v78;
      -[UILabel centerYAnchor](v5->_promptLabel, "centerYAnchor");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPeopleCandidateBannerView centerYAnchor](v5, "centerYAnchor");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "constraintEqualToAnchor:", v76);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v101[5] = v75;
      objc_msgSend(obj, "leadingAnchor");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel trailingAnchor](v5->_promptLabel, "trailingAnchor");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "constraintEqualToAnchor:constant:", v73, 15.0);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v101[6] = v72;
      objc_msgSend(obj, "centerYAnchor");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPeopleCandidateBannerView centerYAnchor](v5, "centerYAnchor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "constraintEqualToAnchor:", v70);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v101[7] = v69;
      objc_msgSend(obj, "heightAnchor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "constraintEqualToConstant:", 24.0);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v101[8] = v67;
      -[UIButton leadingAnchor](v5->_notNowButton, "leadingAnchor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obj, "trailingAnchor");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "constraintEqualToAnchor:constant:", v65, 15.0);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v101[9] = v64;
      -[UIButton centerYAnchor](v5->_notNowButton, "centerYAnchor");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPeopleCandidateBannerView centerYAnchor](v5, "centerYAnchor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "constraintEqualToAnchor:", v62);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v101[10] = v61;
      -[UIButton heightAnchor](v5->_notNowButton, "heightAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "constraintEqualToConstant:", 24.0);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v101[11] = v59;
      v101[12] = v88;
      objc_msgSend(v92, "leadingAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPeopleCandidateBannerView leadingAnchor](v5, "leadingAnchor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "constraintEqualToAnchor:", v57);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v101[13] = v56;
      objc_msgSend(v92, "trailingAnchor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPeopleCandidateBannerView trailingAnchor](v5, "trailingAnchor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "constraintEqualToAnchor:", v54);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v101[14] = v53;
      objc_msgSend(v92, "bottomAnchor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPeopleCandidateBannerView bottomAnchor](v5, "bottomAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "constraintEqualToAnchor:", v33);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v101[15] = v49;
      objc_msgSend(v92, "heightAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "scale");
      objc_msgSend(v48, "constraintEqualToConstant:", 1.0 / v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v101[16] = v38;
      -[PXPeopleCandidateBannerView heightAnchor](v5, "heightAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "constraintGreaterThanOrEqualToConstant:", 60.0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v101[17] = v40;
      -[PXPeopleCandidateBannerView heightAnchor](v5, "heightAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel heightAnchor](v5->_promptLabel, "heightAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "constraintGreaterThanOrEqualToAnchor:constant:", v42, 28.0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v101[18] = v43;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v101, 19);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "activateConstraints:", v44);

    }
    v45 = v5;

    objc_destroyWeak(&v95);
    objc_destroyWeak(&location);

  }
  return v5;
}

- (void)setAttribution:(int64_t)a3
{
  if (self->_attribution != a3)
  {
    self->_attribution = a3;
    -[PXPeopleCandidateBannerView _updatePromptTitle](self, "_updatePromptTitle");
  }
}

- (void)setPerson:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXPeopleCandidateBannerView personAvatarView](self, "personAvatarView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPerson:", v4);

}

- (PHPerson)person
{
  void *v2;
  void *v3;

  -[PXPeopleCandidateBannerView personAvatarView](self, "personAvatarView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "person");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHPerson *)v3;
}

- (void)setContactSuggestion:(id)a3
{
  CNContact *v5;
  CNContact *v6;

  v5 = (CNContact *)a3;
  if (self->_contactSuggestion != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_contactSuggestion, a3);
    -[PXPeopleCandidateBannerView _updatePromptTitle](self, "_updatePromptTitle");
    -[PXPeopleCandidateBannerView _updateContactAvatarImage](self, "_updateContactAvatarImage");
    v5 = v6;
  }

}

- (void)setSuggestedContactImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXPeopleCandidateBannerView contactAvatarView](self, "contactAvatarView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

}

- (UIImage)suggestedContactImage
{
  void *v2;
  void *v3;

  -[PXPeopleCandidateBannerView contactAvatarView](self, "contactAvatarView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setNameSuggestion:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *nameSuggestion;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_nameSuggestion;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      nameSuggestion = self->_nameSuggestion;
      self->_nameSuggestion = v6;

      -[PXPeopleCandidateBannerView _updatePromptTitle](self, "_updatePromptTitle");
    }
  }

}

- (UIPopoverPresentationControllerSourceItem)popoverSourceForPrimaryAction
{
  return (UIPopoverPresentationControllerSourceItem *)self->_actionButton;
}

- (void)setSpec:(id)a3
{
  PXFeatureSpec *v5;
  PXFeatureSpec *v6;

  v5 = (PXFeatureSpec *)a3;
  if (self->_spec != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    -[PXPeopleCandidateBannerView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    v5 = v6;
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  LODWORD(v3) = 1148846080;
  LODWORD(v4) = 1112014848;
  -[PXPeopleCandidateBannerView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height, v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (int64_t)avatarStyle
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v7;
  _BOOL4 v8;

  -[PXPeopleCandidateBannerView personAvatarView](self, "personAvatarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXPeopleCandidateBannerView personAvatarView](self, "personAvatarView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "cornerStyle");

    return v5;
  }
  else
  {
    -[PXPeopleCandidateBannerView contactAvatarView](self, "contactAvatarView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;

    return 2 * v8;
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v18;

  v4 = a3;
  -[PXPeopleCandidateBannerView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "horizontalSizeClass");
  v7 = objc_msgSend(v4, "horizontalSizeClass");

  if (v6 != v7)
    -[PXPeopleCandidateBannerView _updateNotNowButton](self, "_updateNotNowButton");
  -[PXPeopleCandidateBannerView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredContentSizeCategory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 != v10)
    -[PXPeopleCandidateBannerView _updatePromptTitle](self, "_updatePromptTitle");
  -[PXPeopleCandidateBannerView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");
  v13 = v12;
  objc_msgSend(v4, "displayScale");
  if (v13 == v14)
  {
    -[PXPeopleCandidateBannerView traitCollection](self, "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "layoutDirection");
    v17 = objc_msgSend(v4, "layoutDirection");

    if (v16 == v17)
      goto LABEL_10;
  }
  else
  {

  }
  -[PXPeopleCandidateBannerView _updateContactAvatarImage](self, "_updateContactAvatarImage");
LABEL_10:
  v18.receiver = self;
  v18.super_class = (Class)PXPeopleCandidateBannerView;
  -[PXPeopleCandidateBannerView traitCollectionDidChange:](&v18, sel_traitCollectionDidChange_, v4);

}

- (void)updateConstraints
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  objc_super v8;

  -[PXPeopleCandidateBannerView spec](self, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentGuideInsetsForScrollAxis:", 1);
  v5 = v4;

  -[PXPeopleCandidateBannerView leadingConstraint](self, "leadingConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConstant:", v5);

  -[PXPeopleCandidateBannerView notNowToTrailingConstraint](self, "notNowToTrailingConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConstant:", -(v5 + 7.0));

  v8.receiver = self;
  v8.super_class = (Class)PXPeopleCandidateBannerView;
  -[PXPeopleCandidateBannerView updateConstraints](&v8, sel_updateConstraints);
}

- (BOOL)_isMeSuggestion
{
  return (unint64_t)(-[PXPeopleCandidateBannerView style](self, "style") - 3) < 2;
}

- (id)_attributionTitle
{
  int64_t v3;
  __CFString *v4;
  id result;
  NSObject *v6;
  uint8_t v7[16];

  v3 = -[PXPeopleCandidateBannerView attribution](self, "attribution") - 1;
  v4 = CFSTR("PXPeopleCandidateMessagesAttributionTitle");
  switch(v3)
  {
    case 0:
      goto LABEL_10;
    case 1:
      v4 = CFSTR("PXPeopleCandidateContactsAttributionTitle");
      goto LABEL_10;
    case 2:
      if (!-[PXPeopleCandidateBannerView _isMeSuggestion](self, "_isMeSuggestion"))
      {
        PXAssertGetLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v7 = 0;
          _os_log_fault_impl(&dword_1A6789000, v6, OS_LOG_TYPE_FAULT, "Found in selfies for non-me suggestion doesn't make sense", v7, 2u);
        }

      }
      v4 = CFSTR("PXPeopleCandidatePhotosAttributionTitle");
      goto LABEL_10;
    case 3:
      v4 = CFSTR("PXPeopleCandidateHomeAttributionTitle");
LABEL_10:
      PXLocalizedStringFromTable(v4, CFSTR("PhotosUICore"));
      result = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)_suggestionTitle
{
  PXPeopleCandidateBannerView *v2;
  void *v3;
  __CFString *v4;
  uint64_t v5;
  PXPeopleCandidateBannerView *v6;

  v2 = self;
  switch(-[PXPeopleCandidateBannerView style](self, "style"))
  {
    case 0:
      PXLocalizedStringFromTable(CFSTR("PXPeopleCandidatePhotosForReviewNoNameMessage"), CFSTR("PhotosUICore"));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 1:
    case 3:
      -[PXPeopleCandidateBannerView _attributionTitle](v2, "_attributionTitle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
        goto LABEL_6;
      v4 = CFSTR("PXPeopleCandidateContactSuggestionTitle");
      goto LABEL_10;
    case 2:
      -[PXPeopleCandidateBannerView _attributionTitle](v2, "_attributionTitle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
LABEL_6:
        v6 = v3;
      }
      else
      {
        v4 = CFSTR("PXPeopleCandidateNameSuggestionTitle");
LABEL_10:
        PXLocalizedStringFromTable(v4, CFSTR("PhotosUICore"));
        v6 = (PXPeopleCandidateBannerView *)objc_claimAutoreleasedReturnValue();
      }
      v2 = v6;

      return v2;
    case 4:
      -[PXPeopleCandidateBannerView _attributionTitle](v2, "_attributionTitle");
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v2 = (PXPeopleCandidateBannerView *)v5;
      return v2;
    default:
      return v2;
  }
}

- (id)_suggestionString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  switch(-[PXPeopleCandidateBannerView style](self, "style"))
  {
    case 1:
      -[PXPeopleCandidateBannerView contactSuggestion](self, "contactSuggestion");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
        goto LABEL_11;
      objc_msgSend(MEMORY[0x1E0CD16C0], "fullNameFromContact:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPeopleCandidateBannerView person](self, "person");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedStringForPersonOrPetAndVisibility(v5, 0, CFSTR("PXPeopleCandidateNameContactSuggestionMessage"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedStringWithValidatedFormat(v6, CFSTR("%@"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    case 2:
      -[PXPeopleCandidateBannerView nameSuggestion](self, "nameSuggestion");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        -[PXPeopleCandidateBannerView person](self, "person");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        PXLocalizedStringForPersonOrPetAndVisibility(v4, 0, CFSTR("PXPeopleCandidateNameContactSuggestionMessage"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        PXLocalizedStringWithValidatedFormat(v5, CFSTR("%@"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

      }
      else
      {
LABEL_11:
        v7 = 0;
      }

      return v7;
    case 3:
      v8 = CFSTR("PXPeopleCandidateYouContactSuggestionMessage");
      goto LABEL_10;
    case 4:
      v8 = CFSTR("PXPeopleMeConfirmMessage");
LABEL_10:
      PXLocalizedStringFromTable(v8, CFSTR("PhotosUICore"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v7 = 0;
      break;
  }
  return v7;
}

- (id)_reviewButtonTitle
{
  void *v2;
  int64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;

  v4 = -[PXPeopleCandidateBannerView style](self, "style");
  if ((unint64_t)(v4 - 1) < 3)
  {
    v5 = CFSTR("PXPeopleCandidateNameContactSuggestionReviewButton");
LABEL_7:
    PXLocalizedStringFromTable(v5, CFSTR("PhotosUICore"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    return v2;
  }
  if (v4 == 4)
  {
    v5 = CFSTR("PXPeopleCandidateYouSuggestionAcceptButton");
    goto LABEL_7;
  }
  if (!v4)
  {
    -[PXPeopleCandidateBannerView person](self, "person");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringForPersonOrPetAndVisibility(0, objc_msgSend(v7, "px_peoplePetsHomeVisibility"), CFSTR("PXPeopleCandidateReviewTitle"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (BOOL)_wantsNotNowTextInRegularSizeClass
{
  unint64_t v4;
  void *v6;

  v4 = -[PXPeopleCandidateBannerView style](self, "style");
  if (v4 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleCandidateBannerView.m"), 413, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  return (v4 & 0x1F) == 0;
}

- (void)_updateNotNowButton
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  double v6;
  double v7;
  double v8;
  double v9;
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
  uint64_t v23;
  id v24;
  UIButton *notNowButton;
  void *v26;
  void *v27;
  UIButton *v28;
  UIButton *v29;
  _QWORD v30[4];
  id v31;
  id location;
  _QWORD v33[4];
  id v34;

  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleCandidateBannerView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "horizontalSizeClass") == 2)
  {
    v5 = -[PXPeopleCandidateBannerView _wantsNotNowTextInRegularSizeClass](self, "_wantsNotNowTextInRegularSizeClass");

    if (v5)
    {
      v7 = *MEMORY[0x1E0DC49E8];
      v6 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
      v8 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
      v9 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
      objc_msgSend(v3, "background");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setCornerRadius:", 12.0);

      -[PXPeopleCandidateBannerView tintColor](self, "tintColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "background");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setStrokeColor:", v11);

      objc_msgSend(v3, "background");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setStrokeWidth:", 1.0);

      PXLocalizedStringFromTable(CFSTR("PXPeopleCandidateNotNowTitle"), CFSTR("PhotosUICore"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0C99DC8];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "preferredLocalizations");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localeWithLocaleIdentifier:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "uppercaseStringWithLocale:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setTitle:", v20);

      goto LABEL_6;
    }
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4AD0], 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("xmark"), v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v21);

  objc_msgSend(v3, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBaseForegroundColor:", v16);
  v8 = -10.0;
  v9 = -17.0;
  v6 = -17.0;
  v7 = -10.0;
LABEL_6:

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 11.0, *MEMORY[0x1E0DC1420]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __50__PXPeopleCandidateBannerView__updateNotNowButton__block_invoke;
  v33[3] = &unk_1E5138A20;
  v24 = v22;
  v34 = v24;
  objc_msgSend(v3, "setTitleTextAttributesTransformer:", v33);
  notNowButton = self->_notNowButton;
  if (notNowButton)
  {
    -[UIButton setConfiguration:](notNowButton, "setConfiguration:", v3);
  }
  else
  {
    objc_initWeak(&location, self);
    v26 = (void *)MEMORY[0x1E0DC3428];
    v30[0] = v23;
    v30[1] = 3221225472;
    v30[2] = __50__PXPeopleCandidateBannerView__updateNotNowButton__block_invoke_2;
    v30[3] = &unk_1E5147F40;
    objc_copyWeak(&v31, &location);
    objc_msgSend(v26, "actionWithHandler:", v30);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v3, v27);
    v28 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v29 = self->_notNowButton;
    self->_notNowButton = v28;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_notNowButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PXPeopleCandidateBannerView addSubview:](self, "addSubview:", self->_notNowButton);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
  -[UIButton _setTouchInsets:](self->_notNowButton, "_setTouchInsets:", v7, v6, v8, v9);

}

- (void)_updatePromptTitle
{
  uint64_t v3;
  void *v4;
  void *v5;
  int64_t v6;
  uint64_t v7;
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
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0DC4AB8];
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4AB8], 0x8000, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleCandidateBannerView _suggestionTitle](self, "_suggestionTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXPeopleCandidateBannerView style](self, "style");
  if ((unint64_t)(v6 - 1) < 4)
  {
    v7 = *MEMORY[0x1E0DC1138];
    v22 = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v4, 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXPeopleCandidateBannerView _suggestionString](self, "_suggestionString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v3, 32770, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v7;
      objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v11, 0.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v5, "length"))
      {
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v5, v13);
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
        objc_msgSend(v14, "appendAttributedString:", v15);

        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v10, v9);
        objc_msgSend(v14, "appendAttributedString:", v16);
        v17 = (void *)objc_msgSend(v14, "copy");

      }
      else
      {
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v10, v13);
      }

    }
    else
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v5, v9);
    }

    goto LABEL_12;
  }
  if (!v6)
  {
    v24 = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v4, 0.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v5, v9);
LABEL_12:

    goto LABEL_13;
  }
  v17 = 0;
LABEL_13:
  -[PXPeopleCandidateBannerView promptLabel](self, "promptLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAttributedText:", v17);

}

- (void)_updateContactAvatarImage
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  _BOOL8 v8;
  int64_t contactImageRequestVersion;
  _QWORD v10[6];

  self->_contactImageRequestVersion = (self->_contactImageRequestVersion + 1) % 1000;
  -[PXPeopleCandidateBannerView contactSuggestion](self, "contactSuggestion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PXPeopleCandidateBannerView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayScale");
    v6 = v5;

    -[PXPeopleCandidateBannerView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "layoutDirection") == 1;

    contactImageRequestVersion = self->_contactImageRequestVersion;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __56__PXPeopleCandidateBannerView__updateContactAvatarImage__block_invoke;
    v10[3] = &unk_1E51461C0;
    v10[4] = self;
    v10[5] = contactImageRequestVersion;
    +[PXActivityUtilities requestImageForContact:targetSize:displayScale:isRTL:deliverOnce:completion:](PXActivityUtilities, "requestImageForContact:targetSize:displayScale:isRTL:deliverOnce:completion:", v3, v8, 0, v10, 37.0, 37.0, v6);
  }
  else
  {
    -[PXPeopleCandidateBannerView setSuggestedContactImage:](self, "setSuggestedContactImage:", 0);
  }

}

- (void)_reviewTapped
{
  id v3;

  -[PXPeopleCandidateBannerView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bannerViewDidSelectPrimaryAction:", self);

}

- (void)_notNowTapped
{
  id v3;

  -[PXPeopleCandidateBannerView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bannerViewDidSelectNotNow:", self);

}

- (int64_t)style
{
  return self->_style;
}

- (int64_t)attribution
{
  return self->_attribution;
}

- (CNContact)contactSuggestion
{
  return self->_contactSuggestion;
}

- (NSString)nameSuggestion
{
  return self->_nameSuggestion;
}

- (PXFeatureSpec)spec
{
  return self->_spec;
}

- (PXPeopleCandidateBannerViewDelegate)delegate
{
  return (PXPeopleCandidateBannerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXPeopleScalableAvatarView)personAvatarView
{
  return self->_personAvatarView;
}

- (UIImageView)contactAvatarView
{
  return self->_contactAvatarView;
}

- (UILabel)promptLabel
{
  return self->_promptLabel;
}

- (NSLayoutConstraint)leadingConstraint
{
  return self->_leadingConstraint;
}

- (NSLayoutConstraint)notNowToTrailingConstraint
{
  return self->_notNowToTrailingConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notNowToTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_promptLabel, 0);
  objc_storeStrong((id *)&self->_contactAvatarView, 0);
  objc_storeStrong((id *)&self->_personAvatarView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_nameSuggestion, 0);
  objc_storeStrong((id *)&self->_contactSuggestion, 0);
  objc_storeStrong((id *)&self->_notNowButton, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
}

_QWORD *__56__PXPeopleCandidateBannerView__updateContactAvatarImage__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v3;

  v3 = a1 + 32;
  result = *(_QWORD **)(a1 + 32);
  if (*(_QWORD *)(v3 + 8) == result[54])
    return (_QWORD *)objc_msgSend(result, "setSuggestedContactImage:", a2);
  return result;
}

id __50__PXPeopleCandidateBannerView__updateNotNowButton__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledFontForFont:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0DC1138]);
  return v3;
}

void __50__PXPeopleCandidateBannerView__updateNotNowButton__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_notNowTapped");

}

id __45__PXPeopleCandidateBannerView_initWithStyle___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledFontForFont:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0DC1138]);
  return v3;
}

void __45__PXPeopleCandidateBannerView_initWithStyle___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reviewTapped");

}

@end
