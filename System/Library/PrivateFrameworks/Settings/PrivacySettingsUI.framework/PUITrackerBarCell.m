@implementation PUITrackerBarCell

- (PUITrackerBarCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PUITrackerBarCell *v4;
  PUITrackerBarCell *v5;
  void *v6;
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
  objc_super v95;

  v95.receiver = self;
  v95.super_class = (Class)PUITrackerBarCell;
  v4 = -[PUITrackerBarCell initWithStyle:reuseIdentifier:](&v95, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PUITrackerBarCell setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fontDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fontDescriptorWithSymbolicTraits:", 0x8000);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fontDescriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fontDescriptorWithSymbolicTraits:", 0x8000);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[PSTableCell titleLabel](v5, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidden:", 1);

    -[PUITrackerBarCell detailTextLabel](v5, "detailTextLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", 1);

    PUIWebsiteIconView();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerBarCell setIconLabelView:](v5, "setIconLabelView:", v14);

    -[PUITrackerBarCell contentView](v5, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerBarCell iconLabelView](v5, "iconLabelView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v16);

    v17 = (void *)objc_opt_new();
    -[PUITrackerBarCell setStackView:](v5, "setStackView:", v17);

    -[PUITrackerBarCell stackView](v5, "stackView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[PUITrackerBarCell stackView](v5, "stackView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAxis:", 1);

    -[PUITrackerBarCell contentView](v5, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerBarCell stackView](v5, "stackView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSubview:", v21);

    v22 = (void *)objc_opt_new();
    -[PUITrackerBarCell setPrimaryLabel:](v5, "setPrimaryLabel:", v22);

    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v8, 0.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerBarCell primaryLabel](v5, "primaryLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFont:", v23);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerBarCell primaryLabel](v5, "primaryLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTextColor:", v25);

    -[PUITrackerBarCell primaryLabel](v5, "primaryLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[PUITrackerBarCell primaryLabel](v5, "primaryLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setNumberOfLines:", 0);

    -[PUITrackerBarCell stackView](v5, "stackView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerBarCell primaryLabel](v5, "primaryLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addArrangedSubview:", v30);

    v31 = (void *)objc_opt_new();
    -[PUITrackerBarCell setBarStackView:](v5, "setBarStackView:", v31);

    -[PUITrackerBarCell barStackView](v5, "barStackView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[PUITrackerBarCell barStackView](v5, "barStackView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setSpacing:", 8.0);

    -[PUITrackerBarCell barStackView](v5, "barStackView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setAlignment:", 3);

    -[PUITrackerBarCell stackView](v5, "stackView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerBarCell barStackView](v5, "barStackView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addArrangedSubview:", v36);

    v37 = (void *)objc_opt_new();
    -[PUITrackerBarCell setBarView:](v5, "setBarView:", v37);

    -[PUITrackerBarCell barView](v5, "barView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[PUITrackerBarCell barView](v5, "barView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "layer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setCornerRadius:", 2.5);

    -[PUITrackerBarCell barView](v5, "barView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "heightAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToConstant:", 5.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setActive:", 1);

    -[PUITrackerBarCell barStackView](v5, "barStackView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerBarCell barView](v5, "barView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addArrangedSubview:", v45);

    v46 = (void *)objc_opt_new();
    -[PUITrackerBarCell setValueLabel:](v5, "setValueLabel:", v46);

    -[PUITrackerBarCell valueLabel](v5, "valueLabel");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v11, 0.0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerBarCell valueLabel](v5, "valueLabel");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setFont:", v48);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerBarCell valueLabel](v5, "valueLabel");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setTextColor:", v50);

    -[PUITrackerBarCell barStackView](v5, "barStackView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerBarCell valueLabel](v5, "valueLabel");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "addArrangedSubview:", v53);

    v54 = (void *)objc_opt_new();
    -[PUITrackerBarCell setSecondaryLabel:](v5, "setSecondaryLabel:", v54);

    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v11, 0.0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerBarCell secondaryLabel](v5, "secondaryLabel");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setFont:", v55);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerBarCell secondaryLabel](v5, "secondaryLabel");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setTextColor:", v57);

    -[PUITrackerBarCell secondaryLabel](v5, "secondaryLabel");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[PUITrackerBarCell secondaryLabel](v5, "secondaryLabel");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setNumberOfLines:", 0);

    -[PUITrackerBarCell stackView](v5, "stackView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerBarCell secondaryLabel](v5, "secondaryLabel");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addArrangedSubview:", v62);

    v63 = (void *)objc_opt_new();
    -[PUITrackerBarCell setTertiaryLabel:](v5, "setTertiaryLabel:", v63);

    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v11, 0.0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerBarCell tertiaryLabel](v5, "tertiaryLabel");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setFont:", v64);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerBarCell tertiaryLabel](v5, "tertiaryLabel");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setTextColor:", v66);

    -[PUITrackerBarCell tertiaryLabel](v5, "tertiaryLabel");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[PUITrackerBarCell tertiaryLabel](v5, "tertiaryLabel");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setNumberOfLines:", 0);

    -[PUITrackerBarCell stackView](v5, "stackView");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerBarCell tertiaryLabel](v5, "tertiaryLabel");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "addArrangedSubview:", v71);

    v72 = (void *)objc_opt_new();
    -[PUITrackerBarCell setAppAttributedBackgroundView:](v5, "setAppAttributedBackgroundView:", v72);

    -[PUITrackerBarCell appAttributedBackgroundView](v5, "appAttributedBackgroundView");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setContentMode:", 4);

    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", CFSTR("appstore.circle.fill"), 0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "imageWithRenderingMode:", 2);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerBarCell appAttributedBackgroundView](v5, "appAttributedBackgroundView");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setImage:", v75);

    -[PUITrackerBarCell appAttributedBackgroundView](v5, "appAttributedBackgroundView");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerBarCell appAttributedBackgroundView](v5, "appAttributedBackgroundView");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setTintColor:", v78);

    -[PUITrackerBarCell appAttributedBackgroundView](v5, "appAttributedBackgroundView");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setHidden:", 1);

    -[PUITrackerBarCell contentView](v5, "contentView");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerBarCell appAttributedBackgroundView](v5, "appAttributedBackgroundView");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "addSubview:", v82);

    v83 = (void *)objc_opt_new();
    -[PUITrackerBarCell setAppAttributedView:](v5, "setAppAttributedView:", v83);

    -[PUITrackerBarCell appAttributedView](v5, "appAttributedView");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setContentMode:", 4);

    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", CFSTR("appstore.circle"), 0);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "imageWithRenderingMode:", 2);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerBarCell appAttributedView](v5, "appAttributedView");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "setImage:", v86);

    -[PUITrackerBarCell appAttributedView](v5, "appAttributedView");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerBarCell appAttributedView](v5, "appAttributedView");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setTintColor:", v89);

    -[PUITrackerBarCell appAttributedView](v5, "appAttributedView");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "setHidden:", 1);

    -[PUITrackerBarCell contentView](v5, "contentView");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerBarCell appAttributedView](v5, "appAttributedView");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "addSubview:", v93);

  }
  return v5;
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
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
  float v70;
  float v71;
  void *v72;
  void *v73;
  float v74;
  float v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  objc_super v87;

  -[PUITrackerBarCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutMarginsGuide");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3718];
  -[PUITrackerBarCell constraints](self, "constraints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deactivateConstraints:", v6);

  v7 = (void *)objc_opt_new();
  -[PUITrackerBarCell imageView](self, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PUITrackerBarCell stackView](self, "stackView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "leadingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leadingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PSBlankIconImage();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "size");
    v15 = v14 + 8.0;
    v16 = v11;
    v17 = v12;
  }
  else
  {
    -[PUITrackerBarCell iconLabelView](self, "iconLabelView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isHidden");

    if ((v19 & 1) != 0)
    {
      -[PUITrackerBarCell stackView](self, "stackView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "leadingAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "leadingAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToAnchor:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v13);
      goto LABEL_7;
    }
    -[PUITrackerBarCell iconLabelView](self, "iconLabelView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v23);

    -[PUITrackerBarCell iconLabelView](self, "iconLabelView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "centerYAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerBarCell contentView](self, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "centerYAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v28);

    -[PUITrackerBarCell stackView](self, "stackView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerBarCell iconLabelView](self, "iconLabelView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v32, 1.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v33);

    -[PUITrackerBarCell appAttributedView](self, "appAttributedView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "centerXAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerBarCell iconLabelView](self, "iconLabelView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "centerXAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:constant:", v37, 10.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v38);

    -[PUITrackerBarCell appAttributedView](self, "appAttributedView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "centerYAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerBarCell iconLabelView](self, "iconLabelView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "centerYAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:constant:", v42, 10.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v43);

    -[PUITrackerBarCell appAttributedBackgroundView](self, "appAttributedBackgroundView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "centerXAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerBarCell appAttributedView](self, "appAttributedView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "centerXAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:constant:", v47, 0.0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v48);

    -[PUITrackerBarCell appAttributedBackgroundView](self, "appAttributedBackgroundView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "centerYAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerBarCell appAttributedView](self, "appAttributedView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "centerYAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0.0;
    v16 = v11;
    v17 = v13;
  }
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, v15);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v49);

LABEL_7:
  -[PUITrackerBarCell stackView](self, "stackView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "trailingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v53);

  -[PUITrackerBarCell stackView](self, "stackView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "topAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUITrackerBarCell contentView](self, "contentView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "topAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v57, 1.0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v58);

  -[PUITrackerBarCell contentView](self, "contentView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "bottomAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUITrackerBarCell stackView](self, "stackView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "bottomAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v62, 1.0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v63);

  -[PSTableCell specifier](self, "specifier");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("PUITrackerBarValueKey"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v61) = objc_msgSend(v65, "intValue");

  if ((_DWORD)v61)
  {
    -[PUITrackerBarCell barColor](self, "barColor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerBarCell barView](self, "barView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setBackgroundColor:", v66);

    -[PSTableCell specifier](self, "specifier");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("PUITrackerBarValueKey"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "floatValue");
    v71 = v70;

    -[PSTableCell specifier](self, "specifier");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "objectForKeyedSubscript:", CFSTR("PUITrackerBarCapacityKey"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "floatValue");
    v75 = v74;

    -[PUITrackerBarCell barView](self, "barView");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "widthAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerBarCell stackView](self, "stackView");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "widthAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = 0.0;
    if (v75 > 0.0)
      v80 = (float)(v71 / v75);
    objc_msgSend(v77, "constraintLessThanOrEqualToAnchor:multiplier:constant:", v79, v80, 10.0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v81);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray3Color");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerBarCell barView](self, "barView");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setBackgroundColor:", v82);

    -[PUITrackerBarCell barView](self, "barView");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "widthAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToConstant:", 5.0);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v78);
  }

  v84 = (void *)objc_msgSend(v7, "copy");
  -[PUITrackerBarCell setConstraints:](self, "setConstraints:", v84);

  v85 = (void *)MEMORY[0x1E0CB3718];
  -[PUITrackerBarCell constraints](self, "constraints");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "activateConstraints:", v86);

  v87.receiver = self;
  v87.super_class = (Class)PUITrackerBarCell;
  -[PUITrackerBarCell updateConstraints](&v87, sel_updateConstraints);

}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
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
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PUITrackerBarCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v34, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PUITrackerBarShowAppAttributedBadgeKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PUITrackerBarIconLabelKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  -[PUITrackerBarCell iconLabelView](self, "iconLabelView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v9, "setHidden:", 0);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PUITrackerBarIconLabelKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "substringWithRange:", 0, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedUppercaseString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerBarCell iconLabelView](self, "iconLabelView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v13);

    v15 = v6 ^ 1u;
    -[PUITrackerBarCell appAttributedView](self, "appAttributedView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setHidden:", v15);

    -[PUITrackerBarCell appAttributedBackgroundView](self, "appAttributedBackgroundView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v17 = v15;
  }
  else
  {
    v17 = 1;
  }
  objc_msgSend(v9, "setHidden:", v17);

  -[PSTableCell titleLabel](self, "titleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "text");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUITrackerBarCell primaryLabel](self, "primaryLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setText:", v19);

  -[PSTableCell specifier](self, "specifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("PUITrackerBarDomainOwnerKey"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUITrackerBarCell secondaryLabel](self, "secondaryLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setText:", v22);

  v24 = (void *)objc_opt_new();
  -[PSTableCell specifier](self, "specifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("PUITrackerBarValueKey"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringFromNumber:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUITrackerBarCell valueLabel](self, "valueLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setText:", v27);

  -[PSTableCell specifier](self, "specifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("PUITrackerBarTertiaryLabelKey"));
  v30 = objc_claimAutoreleasedReturnValue();
  -[PUITrackerBarCell tertiaryLabel](self, "tertiaryLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setText:", v30);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PUITrackerBarColorKey"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(v30) = objc_opt_isKindOfClass();

  if ((v30 & 1) != 0)
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PUITrackerBarColorKey"));
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUITrackerBarCell setBarColor:](self, "setBarColor:", v33);

  -[PUITrackerBarCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[PUITrackerBarCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUITrackerBarCell;
  -[PUITrackerBarCell traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[PUITrackerBarCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[PUITrackerBarCell setNeedsLayout](self, "setNeedsLayout");
}

- (UILabel)iconLabelView
{
  return self->_iconLabelView;
}

- (void)setIconLabelView:(id)a3
{
  objc_storeStrong((id *)&self->_iconLabelView, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_primaryLabel, a3);
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabel, a3);
}

- (UILabel)tertiaryLabel
{
  return self->_tertiaryLabel;
}

- (void)setTertiaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_tertiaryLabel, a3);
}

- (UIImageView)appAttributedView
{
  return self->_appAttributedView;
}

- (void)setAppAttributedView:(id)a3
{
  objc_storeStrong((id *)&self->_appAttributedView, a3);
}

- (UIImageView)appAttributedBackgroundView
{
  return self->_appAttributedBackgroundView;
}

- (void)setAppAttributedBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_appAttributedBackgroundView, a3);
}

- (UIStackView)barStackView
{
  return self->_barStackView;
}

- (void)setBarStackView:(id)a3
{
  objc_storeStrong((id *)&self->_barStackView, a3);
}

- (UIView)barView
{
  return self->_barView;
}

- (void)setBarView:(id)a3
{
  objc_storeStrong((id *)&self->_barView, a3);
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
  objc_storeStrong((id *)&self->_valueLabel, a3);
}

- (UIColor)barColor
{
  return self->_barColor;
}

- (void)setBarColor:(id)a3
{
  objc_storeStrong((id *)&self->_barColor, a3);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_barColor, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_barView, 0);
  objc_storeStrong((id *)&self->_barStackView, 0);
  objc_storeStrong((id *)&self->_appAttributedBackgroundView, 0);
  objc_storeStrong((id *)&self->_appAttributedView, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_iconLabelView, 0);
}

@end
