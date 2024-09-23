@implementation PXSharedLibraryRulePersonCell

- (PXSharedLibraryRulePersonCell)initWithFrame:(CGRect)a3
{
  PXSharedLibraryRulePersonCell *v3;
  PXSharedLibraryRulePersonCell *v4;
  PXRoundImageView *v5;
  UIImageView *faceImageView;
  void *v7;
  UIImageView *v8;
  UIImageView *plusImageView;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  UIButton *minusButton;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  UIImageView *v28;
  UIImageView *minusImageView;
  UILabel *v30;
  UILabel *nameLabel;
  void *v32;
  double v33;
  UILabel *v34;
  UILabel *subtitleLabel;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
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
  _QWORD v100[4];
  id v101;
  id location;
  objc_super v103;
  _QWORD v104[18];
  _QWORD v105[4];

  v105[2] = *MEMORY[0x1E0C80C00];
  v103.receiver = self;
  v103.super_class = (Class)PXSharedLibraryRulePersonCell;
  v3 = -[PXSharedLibraryRulePersonCell initWithFrame:](&v103, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PXSharedLibraryRulePersonCell contentView](v3, "contentView");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(PXRoundImageView);
    faceImageView = v4->_faceImageView;
    v4->_faceImageView = &v5->super;

    objc_msgSend(MEMORY[0x1E0DC3658], "systemLightGrayColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v4->_faceImageView, "setBackgroundColor:", v7);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_faceImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v4->_faceImageView, "setContentMode:", 1);
    objc_msgSend(v99, "addSubview:", v4->_faceImageView);
    v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    plusImageView = v4->_plusImageView;
    v4->_plusImageView = v8;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_plusImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v4->_plusImageView, "setContentMode:", 1);
    objc_msgSend(v99, "addSubview:", v4->_plusImageView);
    objc_initWeak(&location, v4);
    v10 = (void *)MEMORY[0x1E0DC3658];
    v100[0] = MEMORY[0x1E0C809B0];
    v100[1] = 3221225472;
    v100[2] = __47__PXSharedLibraryRulePersonCell_initWithFrame___block_invoke;
    v100[3] = &unk_1E5131FF0;
    objc_copyWeak(&v101, &location);
    objc_msgSend(v10, "colorWithDynamicProvider:", v100);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0DC3888];
    v49 = (void *)v11;
    v105[0] = v11;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v105[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v105, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "configurationWithPaletteColors:", v14);
    v97 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "configurationByApplyingConfiguration:", v97);
    v96 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0DC3518];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("minus.circle.fill"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "systemButtonWithImage:target:action:", v17, v4, sel_remove_);
    v18 = objc_claimAutoreleasedReturnValue();
    minusButton = v4->_minusButton;
    v4->_minusButton = (UIButton *)v18;

    -[UIButton setPreferredSymbolConfiguration:forImageInState:](v4->_minusButton, "setPreferredSymbolConfiguration:forImageInState:", v96, 0);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_minusButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton layer](v4->_minusButton, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v21) = 1050253722;
    objc_msgSend(v20, "setShadowOpacity:", v21);

    -[UIButton layer](v4->_minusButton, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setShadowOffset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));

    -[UIButton layer](v4->_minusButton, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setShadowRadius:", 3.0);

    -[PXSharedLibraryRulePersonCell _updateMinusButton](v4, "_updateMinusButton");
    objc_msgSend(v99, "addSubview:", v4->_minusButton);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("minus.circle"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "imageWithSymbolConfiguration:", v95);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "px_tintedCircularImageWithColor:backgroundColor:", v26, v27);
    v94 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    minusImageView = v4->_minusImageView;
    v4->_minusImageView = v28;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_minusImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setImage:](v4->_minusImageView, "setImage:", v94);
    -[UIImageView setHidden:](v4->_minusImageView, "setHidden:", 1);
    objc_msgSend(v99, "addSubview:", v4->_minusImageView);
    objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4A98], *MEMORY[0x1E0DC4900], 0x8000);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    nameLabel = v4->_nameLabel;
    v4->_nameLabel = v30;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_nameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTextAlignment:](v4->_nameLabel, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_nameLabel, "setTextColor:", v32);

    -[UILabel setNumberOfLines:](v4->_nameLabel, "setNumberOfLines:", 2);
    -[UILabel setFont:](v4->_nameLabel, "setFont:", v98);
    LODWORD(v33) = 1144766464;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_nameLabel, "setContentCompressionResistancePriority:forAxis:", 1, v33);
    objc_msgSend(v99, "addSubview:", v4->_nameLabel);
    v34 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v34;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTextAlignment:](v4->_subtitleLabel, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_subtitleLabel, "setTextColor:", v36);

    -[UILabel setFont:](v4->_subtitleLabel, "setFont:", v98);
    LODWORD(v37) = 1144766464;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_subtitleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v37);
    objc_msgSend(v99, "addSubview:", v4->_subtitleLabel);
    v48 = (void *)MEMORY[0x1E0CB3718];
    -[UIImageView topAnchor](v4->_faceImageView, "topAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedLibraryRulePersonCell topAnchor](v4, "topAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "constraintEqualToAnchor:", v92);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v104[0] = v91;
    -[UIImageView leadingAnchor](v4->_faceImageView, "leadingAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedLibraryRulePersonCell leadingAnchor](v4, "leadingAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "constraintEqualToAnchor:", v89);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v104[1] = v88;
    -[UIImageView trailingAnchor](v4->_faceImageView, "trailingAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedLibraryRulePersonCell trailingAnchor](v4, "trailingAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "constraintEqualToAnchor:", v86);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v104[2] = v85;
    -[UIImageView bottomAnchor](v4->_faceImageView, "bottomAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedLibraryRulePersonCell bottomAnchor](v4, "bottomAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintEqualToAnchor:", v83);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v104[3] = v82;
    -[UIImageView centerYAnchor](v4->_plusImageView, "centerYAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView centerYAnchor](v4->_faceImageView, "centerYAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:", v80);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v104[4] = v79;
    -[UIImageView centerXAnchor](v4->_plusImageView, "centerXAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView centerXAnchor](v4->_faceImageView, "centerXAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "constraintEqualToAnchor:", v77);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v104[5] = v76;
    -[UIImageView heightAnchor](v4->_plusImageView, "heightAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToConstant:", 50.0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v104[6] = v74;
    -[UIImageView heightAnchor](v4->_plusImageView, "heightAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToConstant:", 50.0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v104[7] = v72;
    -[UIButton leadingAnchor](v4->_minusButton, "leadingAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView leadingAnchor](v4->_faceImageView, "leadingAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:", v70);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v104[8] = v69;
    -[UIButton topAnchor](v4->_minusButton, "topAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView topAnchor](v4->_faceImageView, "topAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:", v67);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v104[9] = v66;
    -[UIImageView leadingAnchor](v4->_minusImageView, "leadingAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView leadingAnchor](v4->_faceImageView, "leadingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:", v64);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v104[10] = v63;
    -[UIImageView topAnchor](v4->_minusImageView, "topAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView topAnchor](v4->_faceImageView, "topAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v61);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v104[11] = v60;
    -[UILabel topAnchor](v4->_nameLabel, "topAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bottomAnchor](v4->_faceImageView, "bottomAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:constant:", v58, 5.0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v104[12] = v57;
    -[UILabel leadingAnchor](v4->_nameLabel, "leadingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView leadingAnchor](v4->_faceImageView, "leadingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v55);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v104[13] = v54;
    -[UILabel trailingAnchor](v4->_nameLabel, "trailingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView trailingAnchor](v4->_faceImageView, "trailingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v52);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v104[14] = v51;
    -[UILabel topAnchor](v4->_subtitleLabel, "topAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v4->_nameLabel, "bottomAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v104[15] = v39;
    -[UILabel leadingAnchor](v4->_subtitleLabel, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView leadingAnchor](v4->_faceImageView, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v104[16] = v42;
    -[UILabel trailingAnchor](v4->_subtitleLabel, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView trailingAnchor](v4->_faceImageView, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v104[17] = v45;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v104, 18);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "activateConstraints:", v46);

    objc_destroyWeak(&v101);
    objc_destroyWeak(&location);

  }
  return v4;
}

- (void)setImagePerson:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PXSharedLibraryRulePersonCell faceImageView](self, "faceImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  objc_msgSend(v6, "setRepresentedPerson:", v4);
}

- (PHPerson)imagePerson
{
  void *v2;
  id v3;
  void *v4;

  -[PXSharedLibraryRulePersonCell faceImageView](self, "faceImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  objc_msgSend(v3, "representedPerson");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHPerson *)v4;
}

- (void)_updateMinusButton
{
  void *v3;
  _QWORD v4[5];

  -[PXSharedLibraryRulePersonCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__PXSharedLibraryRulePersonCell__updateMinusButton__block_invoke;
  v4[3] = &unk_1E5149198;
  v4[4] = self;
  objc_msgSend(v3, "performAsCurrentTraitCollection:", v4);

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXSharedLibraryRulePersonCell;
  -[PXSharedLibraryRulePersonCell prepareForReuse](&v5, sel_prepareForReuse);
  -[PXSharedLibraryRulePersonCell setImagePerson:](self, "setImagePerson:", 0);
  -[PXSharedLibraryRulePersonCell plusImageView](self, "plusImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", 0);

  -[PXSharedLibraryRulePersonCell faceImageView](self, "faceImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", 0);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXSharedLibraryRulePersonCell;
  v4 = a3;
  -[PXSharedLibraryRulePersonCell traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  -[PXSharedLibraryRulePersonCell traitCollection](self, "traitCollection", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4);

  if (v6)
    -[PXSharedLibraryRulePersonCell _updateMinusButton](self, "_updateMinusButton");
}

- (void)remove:(id)a3
{
  const char *v4;
  const char *v5;
  void *v6;
  id v7;

  v4 = -[PXSharedLibraryRulePersonCell removeAction](self, "removeAction", a3);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PXSharedLibraryRulePersonCell removeTarget](self, "removeTarget");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sendAction:to:from:forEvent:", v5, v6, self, 0);

  }
}

- (UIImageView)faceImageView
{
  return self->_faceImageView;
}

- (UIImageView)plusImageView
{
  return self->_plusImageView;
}

- (UIImageView)minusImageView
{
  return self->_minusImageView;
}

- (UIButton)minusButton
{
  return self->_minusButton;
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (id)removeTarget
{
  return objc_loadWeakRetained(&self->_removeTarget);
}

- (void)setRemoveTarget:(id)a3
{
  objc_storeWeak(&self->_removeTarget, a3);
}

- (SEL)removeAction
{
  return self->_removeAction;
}

- (void)setRemoveAction:(SEL)a3
{
  self->_removeAction = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_removeTarget);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_minusButton, 0);
  objc_storeStrong((id *)&self->_minusImageView, 0);
  objc_storeStrong((id *)&self->_plusImageView, 0);
  objc_storeStrong((id *)&self->_faceImageView, 0);
}

void __51__PXSharedLibraryRulePersonCell__updateMinusButton__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v2 = objc_msgSend(v4, "CGColor");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 672), "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShadowColor:", v2);

}

id __47__PXSharedLibraryRulePersonCell_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "tintColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
