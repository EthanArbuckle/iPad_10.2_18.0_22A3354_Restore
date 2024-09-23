@implementation VTUIProximityTryAgainView

- (VTUIProximityTryAgainView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  VTUIProximityTryAgainView *v5;
  uint64_t v6;
  VTUIStyle *vtStyle;
  uint64_t v8;
  VTPreferences *vtPrefs;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  v11.receiver = self;
  v11.super_class = (Class)VTUIProximityTryAgainView;
  v5 = -[VTUIProximityTryAgainView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
    v6 = objc_claimAutoreleasedReturnValue();
    vtStyle = v5->_vtStyle;
    v5->_vtStyle = (VTUIStyle *)v6;

    objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
    v8 = objc_claimAutoreleasedReturnValue();
    vtPrefs = v5->_vtPrefs;
    v5->_vtPrefs = (VTPreferences *)v8;

    -[VTUIProximityTryAgainView _setupViews](v5, "_setupViews");
    -[VTUIProximityTryAgainView _setupConstraintsToSize:](v5, "_setupConstraintsToSize:", width, height);
  }
  return v5;
}

- (void)_setupViews
{
  VTUIProximityContainerView *v3;
  VTUIProximityContainerView *containerView;
  UILabel *v5;
  UILabel *titleLabel;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  void *v13;
  UIButton *v14;
  UIButton *dismissButton;

  v3 = objc_alloc_init(VTUIProximityContainerView);
  containerView = self->_containerView;
  self->_containerView = v3;

  -[VTUIProximityContainerView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[VTUIProximityTryAgainView addSubview:](self, "addSubview:", self->_containerView);
  v5 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v5;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = self->_titleLabel;
  -[VTUIStyle proxHeaderFont](self->_vtStyle, "proxHeaderFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v7, "setFont:", v8);

  v9 = self->_titleLabel;
  -[VTUIStyle proxHeaderColor](self->_vtStyle, "proxHeaderColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v9, "setTextColor:", v10);

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 3);
  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  v11 = self->_titleLabel;
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uiLocalizedStringForKey:", CFSTR("TRY_AGAIN_MESSAGE"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v11, "setText:", v13);

  -[VTUIProximityContainerView addSubview:](self->_containerView, "addSubview:", self->_titleLabel);
  +[VTUIButton _vtuiProximityDismissButton](VTUIButton, "_vtuiProximityDismissButton");
  v14 = (UIButton *)objc_claimAutoreleasedReturnValue();
  dismissButton = self->_dismissButton;
  self->_dismissButton = v14;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_dismissButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[VTUIProximityContainerView addSubview:](self->_containerView, "addSubview:", self->_dismissButton);
}

- (void)_setupConstraintsToSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  char v10;
  VTUIProximityContainerView *containerView;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  VTUIProximityContainerView *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  uint64_t v45;
  VTUIStyle *vtStyle;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
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
  NSArray *v71;
  NSArray *viewConstraints;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  _BOOL4 v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  _QWORD v86[4];
  _QWORD v87[3];
  _QWORD v88[2];
  _QWORD v89[2];
  void *v90;
  _QWORD v91[5];

  height = a3.height;
  width = a3.width;
  v91[3] = *MEMORY[0x24BDAC8D0];
  -[VTUIProximityTryAgainView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIProximityContainerView safeAreaLayoutGuide](self->_containerView, "safeAreaLayoutGuide");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[VTUIProximityView _shouldUsePhoneLandscapeLayoutForSize:](self, "_shouldUsePhoneLandscapeLayoutForSize:", width, height);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MGWrapper sharedMGWrapper](MGWrapper, "sharedMGWrapper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isDeviceIPad");

  containerView = self->_containerView;
  v85 = v8;
  v82 = v6;
  v79 = v7;
  if ((v10 & 1) != 0)
  {
    -[VTUIProximityContainerView centerYAnchor](containerView, "centerYAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "centerYAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToAnchor:", v73);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v91[0] = v12;
    -[VTUIProximityContainerView centerXAnchor](self->_containerView, "centerXAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "centerXAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v91[1] = v15;
    -[VTUIProximityContainerView widthAnchor](self->_containerView, "widthAnchor");
    v16 = v8;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIStyle proxViewMaxWidth](self->_vtStyle, "proxViewMaxWidth");
    objc_msgSend(v17, "constraintEqualToConstant:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v91[2] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v91, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObjectsFromArray:", v19);

    v20 = v79;
    if (!v79)
      goto LABEL_8;
LABEL_6:
    -[VTUIStyle proxViewHeightPhoneLandscape](self->_vtStyle, "proxViewHeightPhoneLandscape");
    goto LABEL_9;
  }
  -[VTUIProximityContainerView bottomAnchor](containerView, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIProximityTryAgainView bottomAnchor](self, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxContainerHorizontalVerticalPadding](self->_vtStyle, "proxContainerHorizontalVerticalPadding");
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, -v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v90, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v25);

  v26 = self->_containerView;
  if (v7)
  {
    -[VTUIProximityContainerView centerXAnchor](v26, "centerXAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "centerXAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v89[0] = v29;
    -[VTUIProximityContainerView widthAnchor](self->_containerView, "widthAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIStyle proxViewMaxWidthPhoneLandscape](self->_vtStyle, "proxViewMaxWidthPhoneLandscape");
    objc_msgSend(v30, "constraintEqualToConstant:");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v89[1] = v31;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v89, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v32);

    v20 = v79;
    goto LABEL_6;
  }
  -[VTUIProximityContainerView leadingAnchor](v26, "leadingAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxContainerHorizontalVerticalPadding](self->_vtStyle, "proxContainerHorizontalVerticalPadding");
  objc_msgSend(v76, "constraintEqualToAnchor:constant:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = v35;
  -[VTUIProximityContainerView trailingAnchor](self->_containerView, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxContainerHorizontalVerticalPadding](self->_vtStyle, "proxContainerHorizontalVerticalPadding");
  objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, -v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v88[1] = v39;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v88, 2);
  v40 = objc_claimAutoreleasedReturnValue();
  v41 = v8;
  v42 = (void *)v40;
  objc_msgSend(v41, "addObjectsFromArray:", v40);

  v20 = v79;
LABEL_8:
  -[VTUIStyle proxViewHeight](self->_vtStyle, "proxViewHeight");
LABEL_9:
  v43 = v33;
  -[VTUIProximityContainerView heightAnchor](self->_containerView, "heightAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToConstant:", v43);
  v45 = objc_claimAutoreleasedReturnValue();

  v83 = (void *)v45;
  objc_msgSend(v85, "addObject:", v45);
  vtStyle = self->_vtStyle;
  if (v20)
  {
    -[VTUIStyle proxLeadingLandscape](vtStyle, "proxLeadingLandscape");
    v48 = v47;
    -[VTUIStyle proxTrailingLandscape](self->_vtStyle, "proxTrailingLandscape");
    v50 = v49;
    -[VTUIStyle proxPaddingTryAgainTitleLandscape](self->_vtStyle, "proxPaddingTryAgainTitleLandscape");
  }
  else
  {
    -[VTUIStyle proxLeading](vtStyle, "proxLeading");
    v48 = v52;
    -[VTUIStyle proxTrailing](self->_vtStyle, "proxTrailing");
    v50 = v53;
    -[VTUIStyle orbLength](self->_vtStyle, "orbLength");
  }
  v54 = v51;
  -[UILabel topAnchor](self->_titleLabel, "topAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "topAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintEqualToAnchor:constant:", v77, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = v55;
  -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "leadingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:constant:", v57, v48);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v87[1] = v58;
  -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "trailingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:constant:", v60, -v50);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v87[2] = v61;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v87, 3);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "addObjectsFromArray:", v62);

  -[UIButton centerYAnchor](self->_dismissButton, "centerYAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "topAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrainingDismissButtonVerticalPaddingTop](self->_vtStyle, "proxTrainingDismissButtonVerticalPaddingTop");
  objc_msgSend(v81, "constraintEqualToAnchor:constant:", v78);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = v74;
  -[UIButton centerXAnchor](self->_dismissButton, "centerXAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "trailingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrainingDismissButtonHorizontalPadding](self->_vtStyle, "proxTrainingDismissButtonHorizontalPadding");
  objc_msgSend(v63, "constraintEqualToAnchor:constant:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v86[1] = v65;
  -[UIButton widthAnchor](self->_dismissButton, "widthAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrainingDismissButtonWidthOrHeight](self->_vtStyle, "proxTrainingDismissButtonWidthOrHeight");
  objc_msgSend(v66, "constraintEqualToConstant:");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v86[2] = v67;
  -[UIButton heightAnchor](self->_dismissButton, "heightAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrainingDismissButtonWidthOrHeight](self->_vtStyle, "proxTrainingDismissButtonWidthOrHeight");
  objc_msgSend(v68, "constraintEqualToConstant:");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v86[3] = v69;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v86, 4);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "addObjectsFromArray:", v70);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v85);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v85);
  v71 = (NSArray *)objc_claimAutoreleasedReturnValue();
  viewConstraints = self->_viewConstraints;
  self->_viewConstraints = v71;

}

- (UIButton)dismissButton
{
  return self->_dismissButton;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (VTUIStyle)vtStyle
{
  return self->_vtStyle;
}

- (void)setVtStyle:(id)a3
{
  objc_storeStrong((id *)&self->_vtStyle, a3);
}

- (VTPreferences)vtPrefs
{
  return self->_vtPrefs;
}

- (void)setVtPrefs:(id)a3
{
  objc_storeStrong((id *)&self->_vtPrefs, a3);
}

- (VTUIProximityContainerView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (NSArray)viewConstraints
{
  return self->_viewConstraints;
}

- (void)setViewConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_viewConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewConstraints, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_vtPrefs, 0);
  objc_storeStrong((id *)&self->_vtStyle, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
}

@end
