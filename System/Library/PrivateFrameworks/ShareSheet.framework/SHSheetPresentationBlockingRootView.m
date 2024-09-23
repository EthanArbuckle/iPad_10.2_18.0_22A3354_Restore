@implementation SHSheetPresentationBlockingRootView

- (SHSheetPresentationBlockingRootView)initWithFrame:(CGRect)a3
{
  SHSheetPresentationBlockingRootView *v3;
  uint64_t v4;
  UIView *containerView;
  uint64_t v6;
  UILabel *titleLabel;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  UILabel *descriptionLabel;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)SHSheetPresentationBlockingRootView;
  v3 = -[SHSheetPresentationBlockingRootView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new();
    containerView = v3->_containerView;
    v3->_containerView = (UIView *)v4;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = objc_opt_new();
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v6;

    _ShareSheetBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SHARE_SHEET_SHARING_UNAVAILABLE_TITLE"), &stru_1E4004990, CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v3->_titleLabel, "setText:", v9);

    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 0);
    v10 = (void *)MEMORY[0x1E0DC37E8];
    objc_msgSend(MEMORY[0x1E0DC37F0], "defaultFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4B50]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fontWithDescriptor:size:", v11, 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v12);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_titleLabel, "setTextColor:", v13);

    v14 = objc_opt_new();
    descriptionLabel = v3->_descriptionLabel;
    v3->_descriptionLabel = (UILabel *)v14;

    _ShareSheetBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("SHARE_SHEET_SHARING_UNAVAILABLE_DESCRIPTION"), &stru_1E4004990, CFSTR("Localizable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v3->_descriptionLabel, "setText:", v17);

    -[UILabel setTextAlignment:](v3->_descriptionLabel, "setTextAlignment:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_descriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_descriptionLabel, "setNumberOfLines:", 0);
    v18 = (void *)MEMORY[0x1E0DC37E8];
    objc_msgSend(MEMORY[0x1E0DC37F0], "defaultFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4A88]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fontWithDescriptor:size:", v19, 0.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_descriptionLabel, "setFont:", v20);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_descriptionLabel, "setTextColor:", v21);

  }
  return v3;
}

- (void)didMoveToSuperview
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SHSheetPresentationBlockingRootView;
  -[SHSheetPresentationBlockingRootView didMoveToSuperview](&v9, sel_didMoveToSuperview);
  -[SHSheetPresentationBlockingRootView containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[SHSheetPresentationBlockingRootView containerView](self, "containerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetPresentationBlockingRootView addSubview:](self, "addSubview:", v5);

    -[SHSheetPresentationBlockingRootView containerView](self, "containerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetPresentationBlockingRootView titleLabel](self, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v7);

    -[SHSheetPresentationBlockingRootView descriptionLabel](self, "descriptionLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v8);

  }
}

- (void)updateConstraints
{
  double Width;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
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
  objc_super v70;
  _QWORD v71[11];
  uint64_t v72;
  _QWORD v73[3];
  CGRect v74;
  CGRect v75;

  v73[1] = *MEMORY[0x1E0C80C00];
  v70.receiver = self;
  v70.super_class = (Class)SHSheetPresentationBlockingRootView;
  -[SHSheetPresentationBlockingRootView updateConstraints](&v70, sel_updateConstraints);
  if (!-[SHSheetPresentationBlockingRootView hasAppliedConstraints](self, "hasAppliedConstraints"))
  {
    -[SHSheetPresentationBlockingRootView frame](self, "frame");
    Width = CGRectGetWidth(v74);
    -[SHSheetPresentationBlockingRootView titleLabel](self, "titleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = *MEMORY[0x1E0DC32A0];
    -[SHSheetPresentationBlockingRootView titleLabel](self, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "font");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v73[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, &v72, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "boundingRectWithSize:options:attributes:context:", 3, v8, 0, Width, 1.79769313e308);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    v75.origin.x = v10;
    v75.origin.y = v12;
    v75.size.width = v14;
    v75.size.height = v16;
    v17 = CGRectGetWidth(v75) + 8.0;
    v48 = (void *)MEMORY[0x1E0CB3718];
    -[SHSheetPresentationBlockingRootView containerView](self, "containerView");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "widthAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetPresentationBlockingRootView widthAnchor](self, "widthAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintLessThanOrEqualToAnchor:multiplier:constant:", v67, 0.8, 0.0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = v66;
    -[SHSheetPresentationBlockingRootView containerView](self, "containerView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "centerXAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetPresentationBlockingRootView centerXAnchor](self, "centerXAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:", v63);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v71[1] = v62;
    -[SHSheetPresentationBlockingRootView containerView](self, "containerView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "centerYAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetPresentationBlockingRootView centerYAnchor](self, "centerYAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:", v59);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v71[2] = v58;
    -[SHSheetPresentationBlockingRootView titleLabel](self, "titleLabel");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "widthAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToConstant:", v17);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v71[3] = v55;
    -[SHSheetPresentationBlockingRootView titleLabel](self, "titleLabel");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "topAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetPresentationBlockingRootView containerView](self, "containerView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "topAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v51);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v71[4] = v50;
    -[SHSheetPresentationBlockingRootView titleLabel](self, "titleLabel");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetPresentationBlockingRootView containerView](self, "containerView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "leadingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v45);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v71[5] = v44;
    -[SHSheetPresentationBlockingRootView titleLabel](self, "titleLabel");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "trailingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetPresentationBlockingRootView containerView](self, "containerView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v40);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v71[6] = v39;
    -[SHSheetPresentationBlockingRootView descriptionLabel](self, "descriptionLabel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetPresentationBlockingRootView titleLabel](self, "titleLabel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "bottomAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, 8.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v71[7] = v34;
    -[SHSheetPresentationBlockingRootView descriptionLabel](self, "descriptionLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetPresentationBlockingRootView titleLabel](self, "titleLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v71[8] = v29;
    -[SHSheetPresentationBlockingRootView descriptionLabel](self, "descriptionLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetPresentationBlockingRootView titleLabel](self, "titleLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v71[9] = v20;
    -[SHSheetPresentationBlockingRootView descriptionLabel](self, "descriptionLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetPresentationBlockingRootView containerView](self, "containerView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v71[10] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 11);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "activateConstraints:", v26);

    -[SHSheetPresentationBlockingRootView setHasAppliedConstraints:](self, "setHasAppliedConstraints:", 1);
  }
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabel, a3);
}

- (BOOL)hasAppliedConstraints
{
  return self->_hasAppliedConstraints;
}

- (void)setHasAppliedConstraints:(BOOL)a3
{
  self->_hasAppliedConstraints = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end
