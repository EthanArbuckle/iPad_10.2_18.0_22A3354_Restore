@implementation SBLogoutProgressView

- (SBLogoutProgressView)initWithFrame:(CGRect)a3
{
  SBLogoutProgressView *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UILabel *goodbyeLabel;
  UILabel *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSLayoutConstraint *goodbyeLabelConstraint;
  uint64_t v17;
  UIImageView *userAvatarView;
  void *v19;
  void *v20;
  uint64_t v21;
  NSLayoutConstraint *userAvatarVerticalConstraint;
  uint64_t v23;
  uint64_t v24;
  UIView *savingDocumentsActivityAndLabelContainerView;
  uint64_t v26;
  UILabel *savingDocumentsLabel;
  uint64_t v28;
  UIActivityIndicatorView *savingDocumentsActivityIndicator;
  uint64_t v30;
  UILabel *savingDocumentsMoreLabel;
  void *v32;
  void *v33;
  uint64_t v34;
  NSLayoutConstraint *savingDocumentsMoreLabelConstraint;
  uint64_t v36;
  UIView *blameContainerView;
  uint64_t v38;
  UIImageView *blameAppIconView;
  uint64_t v40;
  UILabel *blameAppNameLabel;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
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
  objc_super v111;
  _QWORD v112[27];

  v112[25] = *MEMORY[0x1E0C80C00];
  v111.receiver = self;
  v111.super_class = (Class)SBLogoutProgressView;
  v3 = -[SBLogoutProgressView initWithFrame:](&v111, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA700]);
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    goodbyeLabel = v3->_goodbyeLabel;
    v3->_goodbyeLabel = (UILabel *)v9;

    v11 = v3->_goodbyeLabel;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", 48.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v11, "setFont:", v12);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_goodbyeLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAdjustsFontSizeToFitWidth:](v3->_goodbyeLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setMinimumScaleFactor:](v3->_goodbyeLabel, "setMinimumScaleFactor:", 0.8);
    -[UILabel setTextAlignment:](v3->_goodbyeLabel, "setTextAlignment:", 1);
    -[SBLogoutProgressView addSubview:](v3, "addSubview:", v3->_goodbyeLabel);
    -[UILabel firstBaselineAnchor](v3->_goodbyeLabel, "firstBaselineAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLogoutProgressView topAnchor](v3, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLogoutProgressView _goodbyeLabelBaselineOffset](v3, "_goodbyeLabelBaselineOffset");
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    goodbyeLabelConstraint = v3->_goodbyeLabelConstraint;
    v3->_goodbyeLabelConstraint = (NSLayoutConstraint *)v15;

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", v5, v6, v7, v8);
    userAvatarView = v3->_userAvatarView;
    v3->_userAvatarView = (UIImageView *)v17;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_userAvatarView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SBLogoutProgressView addSubview:](v3, "addSubview:", v3->_userAvatarView);
    -[UIImageView centerYAnchor](v3->_userAvatarView, "centerYAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLogoutProgressView centerYAnchor](v3, "centerYAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLogoutProgressView _userAvatarVerticalOffsetFromCenter](v3, "_userAvatarVerticalOffsetFromCenter");
    objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    userAvatarVerticalConstraint = v3->_userAvatarVerticalConstraint;
    v3->_userAvatarVerticalConstraint = (NSLayoutConstraint *)v21;

    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 20.0, *MEMORY[0x1E0CEB5F0]);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v5, v6, v7, v8);
    savingDocumentsActivityAndLabelContainerView = v3->_savingDocumentsActivityAndLabelContainerView;
    v3->_savingDocumentsActivityAndLabelContainerView = (UIView *)v24;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_savingDocumentsActivityAndLabelContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SBLogoutProgressView addSubview:](v3, "addSubview:", v3->_savingDocumentsActivityAndLabelContainerView);
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v5, v6, v7, v8);
    savingDocumentsLabel = v3->_savingDocumentsLabel;
    v3->_savingDocumentsLabel = (UILabel *)v26;

    -[UILabel setFont:](v3->_savingDocumentsLabel, "setFont:", v23);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_savingDocumentsLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v3->_savingDocumentsActivityAndLabelContainerView, "addSubview:", v3->_savingDocumentsLabel);
    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 1);
    savingDocumentsActivityIndicator = v3->_savingDocumentsActivityIndicator;
    v3->_savingDocumentsActivityIndicator = (UIActivityIndicatorView *)v28;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v3->_savingDocumentsActivityIndicator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIActivityIndicatorView startAnimating](v3->_savingDocumentsActivityIndicator, "startAnimating");
    -[UIView addSubview:](v3->_savingDocumentsActivityAndLabelContainerView, "addSubview:", v3->_savingDocumentsActivityIndicator);
    v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v5, v6, v7, v8);
    savingDocumentsMoreLabel = v3->_savingDocumentsMoreLabel;
    v3->_savingDocumentsMoreLabel = (UILabel *)v30;

    v110 = (void *)v23;
    -[UILabel setFont:](v3->_savingDocumentsMoreLabel, "setFont:", v23);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_savingDocumentsMoreLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SBLogoutProgressView addSubview:](v3, "addSubview:", v3->_savingDocumentsMoreLabel);
    -[UILabel firstBaselineAnchor](v3->_savingDocumentsMoreLabel, "firstBaselineAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLogoutProgressView bottomAnchor](v3, "bottomAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLogoutProgressView _moreDocumentsLabelBaselineOffset](v3, "_moreDocumentsLabelBaselineOffset");
    objc_msgSend(v32, "constraintEqualToAnchor:constant:", v33);
    v34 = objc_claimAutoreleasedReturnValue();
    savingDocumentsMoreLabelConstraint = v3->_savingDocumentsMoreLabelConstraint;
    v3->_savingDocumentsMoreLabelConstraint = (NSLayoutConstraint *)v34;

    v36 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v5, v6, v7, v8);
    blameContainerView = v3->_blameContainerView;
    v3->_blameContainerView = (UIView *)v36;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_blameContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SBLogoutProgressView addSubview:](v3, "addSubview:", v3->_blameContainerView);
    v38 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", v5, v6, v7, v8);
    blameAppIconView = v3->_blameAppIconView;
    v3->_blameAppIconView = (UIImageView *)v38;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_blameAppIconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v3->_blameContainerView, "addSubview:", v3->_blameAppIconView);
    v40 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v5, v6, v7, v8);
    blameAppNameLabel = v3->_blameAppNameLabel;
    v3->_blameAppNameLabel = (UILabel *)v40;

    -[UILabel setFont:](v3->_blameAppNameLabel, "setFont:", v23);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_blameAppNameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v3->_blameContainerView, "addSubview:", v3->_blameAppNameLabel);
    v84 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel centerXAnchor](v3->_goodbyeLabel, "centerXAnchor");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLogoutProgressView centerXAnchor](v3, "centerXAnchor");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "constraintEqualToAnchor:", v108);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v112[0] = v107;
    -[UILabel widthAnchor](v3->_goodbyeLabel, "widthAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLogoutProgressView widthAnchor](v3, "widthAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "constraintLessThanOrEqualToAnchor:constant:", v105, -72.0);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v112[1] = v104;
    v112[2] = v3->_goodbyeLabelConstraint;
    -[UIImageView centerXAnchor](v3->_userAvatarView, "centerXAnchor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLogoutProgressView centerXAnchor](v3, "centerXAnchor");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "constraintEqualToAnchor:", v102);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v112[3] = v101;
    v112[4] = v3->_userAvatarVerticalConstraint;
    -[UIImageView widthAnchor](v3->_userAvatarView, "widthAnchor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "constraintEqualToConstant:", 256.0);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v112[5] = v99;
    -[UIImageView heightAnchor](v3->_userAvatarView, "heightAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView widthAnchor](v3->_userAvatarView, "widthAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "constraintEqualToAnchor:", v97);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v112[6] = v96;
    -[UILabel centerYAnchor](v3->_savingDocumentsLabel, "centerYAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView centerYAnchor](v3->_savingDocumentsActivityIndicator, "centerYAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "constraintEqualToAnchor:", v94);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v112[7] = v93;
    -[UIActivityIndicatorView leadingAnchor](v3->_savingDocumentsActivityIndicator, "leadingAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v3->_savingDocumentsActivityAndLabelContainerView, "leadingAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "constraintEqualToAnchor:", v91);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v112[8] = v90;
    -[UILabel leadingAnchor](v3->_savingDocumentsLabel, "leadingAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView trailingAnchor](v3->_savingDocumentsActivityIndicator, "trailingAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "constraintEqualToAnchor:constant:", v88, 8.0);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v112[9] = v87;
    -[UILabel trailingAnchor](v3->_savingDocumentsLabel, "trailingAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v3->_savingDocumentsActivityAndLabelContainerView, "trailingAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "constraintEqualToAnchor:", v85);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v112[10] = v83;
    -[UILabel topAnchor](v3->_savingDocumentsLabel, "topAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v3->_savingDocumentsActivityAndLabelContainerView, "topAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "constraintEqualToAnchor:", v81);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v112[11] = v80;
    -[UILabel bottomAnchor](v3->_savingDocumentsLabel, "bottomAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v3->_savingDocumentsActivityAndLabelContainerView, "bottomAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "constraintEqualToAnchor:", v78);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v112[12] = v77;
    -[UILabel centerYAnchor](v3->_blameAppNameLabel, "centerYAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView centerYAnchor](v3->_blameAppIconView, "centerYAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "constraintEqualToAnchor:", v75);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v112[13] = v74;
    -[UIImageView leadingAnchor](v3->_blameAppIconView, "leadingAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v3->_blameContainerView, "leadingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToAnchor:", v72);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v112[14] = v71;
    -[UILabel leadingAnchor](v3->_blameAppNameLabel, "leadingAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView trailingAnchor](v3->_blameAppIconView, "trailingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToAnchor:constant:", v69, 8.0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v112[15] = v68;
    -[UILabel trailingAnchor](v3->_blameAppNameLabel, "trailingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v3->_blameContainerView, "trailingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:", v66);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v112[16] = v65;
    -[UIImageView topAnchor](v3->_blameAppIconView, "topAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v3->_blameContainerView, "topAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:", v63);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v112[17] = v62;
    -[UIImageView bottomAnchor](v3->_blameAppIconView, "bottomAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v3->_blameContainerView, "bottomAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:", v60);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v112[18] = v59;
    -[UIView centerXAnchor](v3->_savingDocumentsActivityAndLabelContainerView, "centerXAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLogoutProgressView centerXAnchor](v3, "centerXAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v57);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v112[19] = v56;
    -[UIView centerXAnchor](v3->_blameContainerView, "centerXAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLogoutProgressView centerXAnchor](v3, "centerXAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:", v54);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v112[20] = v53;
    -[UILabel centerXAnchor](v3->_savingDocumentsMoreLabel, "centerXAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLogoutProgressView centerXAnchor](v3, "centerXAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v112[21] = v43;
    v112[22] = v3->_savingDocumentsMoreLabelConstraint;
    -[UILabel firstBaselineAnchor](v3->_blameAppNameLabel, "firstBaselineAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel firstBaselineAnchor](v3->_savingDocumentsMoreLabel, "firstBaselineAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:constant:", v45, -36.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v112[23] = v46;
    -[UILabel firstBaselineAnchor](v3->_savingDocumentsLabel, "firstBaselineAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel firstBaselineAnchor](v3->_blameAppNameLabel, "firstBaselineAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:constant:", v48, -36.0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v112[24] = v49;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v112, 25);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "activateConstraints:", v50);

  }
  return v3;
}

- (BOOL)isProgressVisible
{
  return -[UIView isHidden](self->_savingDocumentsActivityAndLabelContainerView, "isHidden");
}

- (void)setProgressVisible:(BOOL)a3
{
  -[UIView setHidden:](self->_savingDocumentsActivityAndLabelContainerView, "setHidden:", !a3);
}

- (void)setUserContact:(id)a3
{
  CNContact *v5;
  CNContact *v6;

  v5 = (CNContact *)a3;
  if (self->_userContact != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_userContact, a3);
    -[SBLogoutProgressView _updateViewData](self, "_updateViewData");
    v5 = v6;
  }

}

- (void)setPendingApplications:(id)a3
{
  NSArray *v4;
  NSArray *pendingApplications;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  pendingApplications = self->_pendingApplications;
  self->_pendingApplications = v4;

  -[SBLogoutProgressView _updateViewData](self, "_updateViewData");
}

- (void)setLegibilitySettings:(id)a3
{
  _UILegibilitySettings *v5;
  _UILegibilitySettings *v6;

  v5 = (_UILegibilitySettings *)a3;
  if (self->_legibilitySettings != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[SBLogoutProgressView _updateLegibility](self, "_updateLegibility");
    v5 = v6;
  }

}

- (void)updateConstraints
{
  NSLayoutConstraint *goodbyeLabelConstraint;
  NSLayoutConstraint *savingDocumentsMoreLabelConstraint;
  NSLayoutConstraint *userAvatarVerticalConstraint;
  objc_super v6;

  goodbyeLabelConstraint = self->_goodbyeLabelConstraint;
  -[SBLogoutProgressView _goodbyeLabelBaselineOffset](self, "_goodbyeLabelBaselineOffset");
  -[NSLayoutConstraint setConstant:](goodbyeLabelConstraint, "setConstant:");
  savingDocumentsMoreLabelConstraint = self->_savingDocumentsMoreLabelConstraint;
  -[SBLogoutProgressView _moreDocumentsLabelBaselineOffset](self, "_moreDocumentsLabelBaselineOffset");
  -[NSLayoutConstraint setConstant:](savingDocumentsMoreLabelConstraint, "setConstant:");
  userAvatarVerticalConstraint = self->_userAvatarVerticalConstraint;
  -[SBLogoutProgressView _userAvatarVerticalOffsetFromCenter](self, "_userAvatarVerticalOffsetFromCenter");
  -[NSLayoutConstraint setConstant:](userAvatarVerticalConstraint, "setConstant:");
  v6.receiver = self;
  v6.super_class = (Class)SBLogoutProgressView;
  -[SBLogoutProgressView updateConstraints](&v6, sel_updateConstraints);
}

- (double)_goodbyeLabelBaselineOffset
{
  void *v2;
  void *v3;
  int v4;
  char v5;
  int v6;
  char v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  double result;
  double v13;

  v4 = __sb__runningInSpringBoard();
  v5 = v4;
  if (v4)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "userInterfaceIdiom") != 1)
    {

      goto LABEL_15;
    }
  }
  v6 = __sb__runningInSpringBoard();
  v7 = v6;
  if (v6)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v9 = v8;
  v10 = *(double *)(MEMORY[0x1E0DAB260] + 264);
  if ((v7 & 1) == 0)

  if ((v5 & 1) == 0)
  if (v9 >= v10)
  {
    v11 = (unint64_t)(objc_msgSend((id)SBApp, "activeInterfaceOrientation") - 3) >= 2;
    result = 315.0;
    v13 = 184.0;
    goto LABEL_16;
  }
LABEL_15:
  v11 = (unint64_t)(objc_msgSend((id)SBApp, "activeInterfaceOrientation") - 3) >= 2;
  result = 184.0;
  v13 = 138.0;
LABEL_16:
  if (!v11)
    return v13;
  return result;
}

- (double)_moreDocumentsLabelBaselineOffset
{
  void *v2;
  void *v3;
  int v4;
  char v5;
  int v6;
  char v7;
  double v8;
  double v9;
  double v10;
  double result;
  uint64_t v12;

  v4 = __sb__runningInSpringBoard();
  v5 = v4;
  if (v4)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "userInterfaceIdiom") != 1)
    {

      goto LABEL_15;
    }
  }
  v6 = __sb__runningInSpringBoard();
  v7 = v6;
  if (v6)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v9 = v8;
  v10 = *(double *)(MEMORY[0x1E0DAB260] + 264);
  if ((v7 & 1) == 0)

  if ((v5 & 1) == 0)
  if (v9 >= v10)
    return dbl_1D0E89BF0[(unint64_t)(objc_msgSend((id)SBApp, "activeInterfaceOrientation") - 3) < 2];
LABEL_15:
  v12 = objc_msgSend((id)SBApp, "activeInterfaceOrientation");
  result = -128.0;
  if ((unint64_t)(v12 - 3) < 2)
    return -78.5;
  return result;
}

- (double)_userAvatarVerticalOffsetFromCenter
{
  void *v2;
  void *v3;
  int v4;
  char v5;
  int v6;
  char v7;
  double v8;
  double v9;
  double v10;
  double result;
  uint64_t v12;

  v4 = __sb__runningInSpringBoard();
  v5 = v4;
  if (v4)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
LABEL_14:
      v12 = objc_msgSend((id)SBApp, "activeInterfaceOrientation");
      result = -20.0;
      if ((unint64_t)(v12 - 3) < 2)
        return 0.0;
      return result;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "userInterfaceIdiom") != 1)
    {

      goto LABEL_14;
    }
  }
  v6 = __sb__runningInSpringBoard();
  v7 = v6;
  if (v6)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v9 = v8;
  v10 = *(double *)(MEMORY[0x1E0DAB260] + 264);
  if ((v7 & 1) == 0)

  if ((v5 & 1) == 0)
  result = -20.0;
  if (v9 < v10)
    goto LABEL_14;
  return result;
}

- (void)_updateLegibility
{
  UILabel *goodbyeLabel;
  void *v4;
  UILabel *savingDocumentsLabel;
  void *v6;
  UILabel *savingDocumentsMoreLabel;
  void *v8;
  UILabel *blameAppNameLabel;
  id v10;

  -[SBLogoutProgressView _updateUserAvatarLegibility](self, "_updateUserAvatarLegibility");
  goodbyeLabel = self->_goodbyeLabel;
  -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](goodbyeLabel, "setTextColor:", v4);

  savingDocumentsLabel = self->_savingDocumentsLabel;
  -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](savingDocumentsLabel, "setTextColor:", v6);

  savingDocumentsMoreLabel = self->_savingDocumentsMoreLabel;
  -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](savingDocumentsMoreLabel, "setTextColor:", v8);

  blameAppNameLabel = self->_blameAppNameLabel;
  -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](blameAppNameLabel, "setTextColor:", v10);

}

- (void)_updateViewData
{
  -[SBLogoutProgressView _updateGoodbye](self, "_updateGoodbye");
  -[SBLogoutProgressView _updateUserAvatar](self, "_updateUserAvatar");
  -[SBLogoutProgressView _updateBlame](self, "_updateBlame");
}

- (void)_updateGoodbye
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("LOGOUT_GOODBYE_USER_NAME_FORMAT"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "rangeOfString:options:", CFSTR("<[a-z]+>"), 1024);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v5;
    v10 = v6;
    objc_msgSend(v4, "substringWithRange:", v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    if (!v8)
      goto LABEL_13;
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("<firstname>")))
    {
      if (!-[CNContact isKeyAvailable:](self->_userContact, "isKeyAvailable:", CFSTR("givenName")))
        goto LABEL_3;
      -[CNContact givenName](self->_userContact, "givenName");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("<surname>")))
      {
        if (!objc_msgSend(v7, "isEqualToString:", CFSTR("<fullname>"))
          || !-[CNContact isKeyAvailable:](self->_userContact, "isKeyAvailable:", CFSTR("givenName"))
          || !-[CNContact isKeyAvailable:](self->_userContact, "isKeyAvailable:", CFSTR("familyName")))
        {
          goto LABEL_3;
        }
        v12 = objc_alloc_init(MEMORY[0x1E0C97218]);
        objc_msgSend(v12, "stringFromContact:", self->_userContact);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", v9, v10, v19);
        v20 = (id)objc_claimAutoreleasedReturnValue();

LABEL_12:
        v8 = v20;
        goto LABEL_13;
      }
      if (!-[CNContact isKeyAvailable:](self->_userContact, "isKeyAvailable:", CFSTR("familyName")))
        goto LABEL_3;
      -[CNContact familyName](self->_userContact, "familyName");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (id)v11;
    objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", v9, v10, v11);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v7 = 0;
LABEL_3:
  v8 = 0;
LABEL_13:
  v21 = v8;
  if (objc_msgSend(v8, "length")
    && (v13 = (void *)objc_opt_new(),
        v14 = objc_msgSend(v13, "isCurrentUserAnonymous"),
        v13,
        (v14 & 1) == 0))
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("LOGOUT_GOODBYE_USER"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", v18, v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("LOGOUT_GOODBYE_USER_NO_NAME"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[UILabel setText:](self->_goodbyeLabel, "setText:", v16);
}

- (void)_updateUserAvatar
{
  uint64_t v3;
  void *v4;
  id v5;

  if ((unint64_t)-[_UILegibilitySettings style](self->_legibilitySettings, "style") >= 2)
    v3 = 2;
  else
    v3 = 3;
  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C97518]), "initWithStyle:diameter:", v3, 256.0);
  objc_msgSend(v5, "monogramForContact:", self->_userContact);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_userAvatarView, "setImage:", v4);

}

- (void)_updateBlame
{
  void *v3;
  char v4;
  NSUInteger v5;
  UILabel *savingDocumentsLabel;
  void *v7;
  void *v8;
  void *v9;
  UILabel *blameAppNameLabel;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSUInteger v19;
  NSUInteger v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v3 = (void *)objc_opt_new();
  v4 = objc_msgSend(v3, "isCurrentUserAnonymous");

  if ((v4 & 1) == 0)
  {
    v5 = -[NSArray count](self->_pendingApplications, "count");
    savingDocumentsLabel = self->_savingDocumentsLabel;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5)
    {
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("LOGOUT_SAVING_DOCUMENTS_FROM"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](savingDocumentsLabel, "setText:", v9);

      -[NSArray firstObject](self->_pendingApplications, "firstObject");
      v26 = (id)objc_claimAutoreleasedReturnValue();
      blameAppNameLabel = self->_blameAppNameLabel;
      objc_msgSend(v26, "displayName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](blameAppNameLabel, "setText:", v11);

      +[SBIconController sharedInstance](SBIconController, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "model");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "bundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "applicationIconForBundleIdentifier:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[SBLogoutProgressView traitCollection](self, "traitCollection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "tableUIIconImageCache");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "imageForIcon:compatibleWithTraitCollection:options:", v15, v16, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIImageView setImage:](self->_blameAppIconView, "setImage:", v18);
      -[UIView setHidden:](self->_blameContainerView, "setHidden:", 0);
      v19 = -[NSArray count](self->_pendingApplications, "count");
      v20 = v19 - 1;
      if (v19 == 1)
      {
        -[UILabel setHidden:](self->_savingDocumentsMoreLabel, "setHidden:", 1);
      }
      else
      {
        v21 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("LOGOUT_SAVING_DOCUMENTS_MORE_COUNT"), &stru_1E8EC7EC0, CFSTR("SpringBoardPlurals"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "localizedStringWithFormat:", v23, v20);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        -[UILabel setText:](self->_savingDocumentsMoreLabel, "setText:", v24);
        -[UILabel setHidden:](self->_savingDocumentsMoreLabel, "setHidden:", 0);

      }
    }
    else
    {
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("LOGOUT_SAVING_DOCUMENTS"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](savingDocumentsLabel, "setText:", v25);

      -[UILabel setHidden:](self->_savingDocumentsMoreLabel, "setHidden:", 1);
      -[UIView setHidden:](self->_blameContainerView, "setHidden:", 1);
    }
  }
}

- (CNContact)userContact
{
  return self->_userContact;
}

- (NSArray)pendingApplications
{
  return self->_pendingApplications;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusBarSettingsAssertion, 0);
  objc_storeStrong((id *)&self->_blameAppNameLabel, 0);
  objc_storeStrong((id *)&self->_blameAppIconView, 0);
  objc_storeStrong((id *)&self->_blameContainerView, 0);
  objc_storeStrong((id *)&self->_savingDocumentsMoreLabelConstraint, 0);
  objc_storeStrong((id *)&self->_savingDocumentsMoreLabel, 0);
  objc_storeStrong((id *)&self->_savingDocumentsLabel, 0);
  objc_storeStrong((id *)&self->_savingDocumentsActivityIndicator, 0);
  objc_storeStrong((id *)&self->_savingDocumentsActivityAndLabelContainerView, 0);
  objc_storeStrong((id *)&self->_goodbyeLabelConstraint, 0);
  objc_storeStrong((id *)&self->_goodbyeLabel, 0);
  objc_storeStrong((id *)&self->_userAvatarVerticalConstraint, 0);
  objc_storeStrong((id *)&self->_userAvatarView, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_pendingApplications, 0);
  objc_storeStrong((id *)&self->_userContact, 0);
}

@end
