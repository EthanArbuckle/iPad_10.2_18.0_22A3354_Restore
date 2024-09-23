@implementation SBModalWidgetIntroductionBackgroundDescriptionView

- (SBModalWidgetIntroductionBackgroundDescriptionView)initWithFrame:(CGRect)a3 withOwner:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  SBModalWidgetIntroductionBackgroundDescriptionView *v10;
  SBModalWidgetIntroductionBackgroundDescriptionView *v11;
  UIView *v12;
  UIView *backgroundView;
  UIView *v14;
  void *v15;
  id v16;
  UIView *v17;
  UIView *labelContainerView;
  UIView *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  UILabel *v29;
  UILabel *titleLabel;
  UILabel *v31;
  void *v32;
  void *v33;
  UILabel *v34;
  void *v35;
  UILabel *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  UILabel *v45;
  UILabel *introductionTextLabel;
  UILabel *v47;
  void *v48;
  void *v49;
  UILabel *v50;
  void *v51;
  UILabel *v52;
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
  id v79;
  objc_super v80;
  _QWORD v81[4];
  _QWORD v82[4];
  _QWORD v83[6];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v83[4] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v80.receiver = self;
  v80.super_class = (Class)SBModalWidgetIntroductionBackgroundDescriptionView;
  v10 = -[SBModalWidgetIntroductionBackgroundDescriptionView initWithFrame:](&v80, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_owner, v9);
    v12 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    backgroundView = v11->_backgroundView;
    v11->_backgroundView = v12;

    -[UIView _setContinuousCornerRadius:](v11->_backgroundView, "_setContinuousCornerRadius:", 40.0);
    -[UIView setClipsToBounds:](v11->_backgroundView, "setClipsToBounds:", 1);
    v14 = v11->_backgroundView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v79 = v9;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v14, "setBackgroundColor:", v15);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v11->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SBModalWidgetIntroductionBackgroundDescriptionView addSubview:](v11, "addSubview:", v11->_backgroundView);
    v16 = SBHPinViewWithinView(v11, v11->_backgroundView);
    v17 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    labelContainerView = v11->_labelContainerView;
    v11->_labelContainerView = v17;

    v19 = v11->_labelContainerView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v19, "setBackgroundColor:", v20);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v11->_labelContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SBModalWidgetIntroductionBackgroundDescriptionView addSubview:](v11, "addSubview:", v11->_labelContainerView);
    v64 = (void *)MEMORY[0x1E0CB3718];
    -[UIView leadingAnchor](v11->_labelContainerView, "leadingAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBModalWidgetIntroductionBackgroundDescriptionView leadingAnchor](v11, "leadingAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "constraintEqualToAnchor:", v73);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v83[0] = v70;
    -[UIView trailingAnchor](v11->_labelContainerView, "trailingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBModalWidgetIntroductionBackgroundDescriptionView trailingAnchor](v11, "trailingAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:", v65);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v83[1] = v21;
    -[UIView topAnchor](v11->_labelContainerView, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBModalWidgetIntroductionBackgroundDescriptionView topAnchor](v11, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, 10.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v83[2] = v24;
    -[UIView bottomAnchor](v11->_labelContainerView, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBModalWidgetIntroductionBackgroundDescriptionView bottomAnchor](v11, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v83[3] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "activateConstraints:", v28);

    v29 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v11->_titleLabel;
    v11->_titleLabel = v29;

    v31 = v11->_titleLabel;
    SBHBundle();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("MODAL_WIDGET_DISCOVERABILITY_TITLE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v31, "setText:", v33);

    v34 = v11->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 30.0, *MEMORY[0x1E0DC1430]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v34, "setFont:", v35);

    v36 = v11->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v36, "setTextColor:", v37);

    -[UILabel setAdjustsFontSizeToFitWidth:](v11->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setMinimumScaleFactor:](v11->_titleLabel, "setMinimumScaleFactor:", 0.6);
    -[UILabel setNumberOfLines:](v11->_titleLabel, "setNumberOfLines:", 2);
    -[UILabel setTextAlignment:](v11->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v11->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v11->_labelContainerView, "addSubview:", v11->_titleLabel);
    v68 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel centerXAnchor](v11->_titleLabel, "centerXAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](v11->_labelContainerView, "centerXAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintGreaterThanOrEqualToAnchor:", v74);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v82[0] = v71;
    -[UILabel topAnchor](v11->_titleLabel, "topAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v11->_labelContainerView, "topAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:constant:", v38, 100.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v82[1] = v39;
    -[UILabel widthAnchor](v11->_titleLabel, "widthAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToConstant:", 200.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v82[2] = v41;
    -[UILabel heightAnchor](v11->_titleLabel, "heightAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToConstant:", 50.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v82[3] = v43;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 4);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "activateConstraints:", v44);

    v45 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    introductionTextLabel = v11->_introductionTextLabel;
    v11->_introductionTextLabel = v45;

    v47 = v11->_introductionTextLabel;
    SBHBundle();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("MODAL_WIDGET_DISCOVERABILITY_DESCRIPTION"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v47, "setText:", v49);

    v50 = v11->_introductionTextLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 15.0, *MEMORY[0x1E0DC1440]);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v50, "setFont:", v51);

    v52 = v11->_introductionTextLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v52, "setTextColor:", v53);

    -[UILabel setAdjustsFontSizeToFitWidth:](v11->_introductionTextLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setMinimumScaleFactor:](v11->_introductionTextLabel, "setMinimumScaleFactor:", 0.6);
    -[UILabel setNumberOfLines:](v11->_introductionTextLabel, "setNumberOfLines:", 2);
    -[UILabel setTextAlignment:](v11->_introductionTextLabel, "setTextAlignment:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v11->_introductionTextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v11->_labelContainerView, "addSubview:", v11->_introductionTextLabel);
    v69 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel leadingAnchor](v11->_introductionTextLabel, "leadingAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v11->_labelContainerView, "leadingAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "constraintGreaterThanOrEqualToAnchor:constant:", v75, 30.0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v81[0] = v72;
    -[UILabel trailingAnchor](v11->_introductionTextLabel, "trailingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v11->_labelContainerView, "trailingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintLessThanOrEqualToAnchor:constant:", v55, -30.0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v81[1] = v56;
    -[UILabel topAnchor](v11->_introductionTextLabel, "topAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v11->_titleLabel, "bottomAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:constant:", v58, 15.0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v81[2] = v59;
    -[UILabel heightAnchor](v11->_introductionTextLabel, "heightAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToConstant:", 60.0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v81[3] = v61;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 4);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "activateConstraints:", v62);

    v9 = v79;
  }

  return v11;
}

- (UIViewController)owner
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_owner);
}

- (void)setOwner:(id)a3
{
  objc_storeWeak((id *)&self->_owner, a3);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UIView)labelContainerView
{
  return self->_labelContainerView;
}

- (void)setLabelContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_labelContainerView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)introductionTextLabel
{
  return self->_introductionTextLabel;
}

- (void)setIntroductionTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_introductionTextLabel, a3);
}

- (UIImageView)homescreenPreview
{
  return self->_homescreenPreview;
}

- (void)setHomescreenPreview:(id)a3
{
  objc_storeStrong((id *)&self->_homescreenPreview, a3);
}

- (UIButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
  objc_storeStrong((id *)&self->_continueButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_homescreenPreview, 0);
  objc_storeStrong((id *)&self->_introductionTextLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_labelContainerView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_destroyWeak((id *)&self->_owner);
}

@end
