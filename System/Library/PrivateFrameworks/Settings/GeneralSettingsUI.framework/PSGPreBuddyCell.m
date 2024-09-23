@implementation PSGPreBuddyCell

- (PSGPreBuddyCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PSGPreBuddyCell *v4;
  PSGPreBuddyCell *v5;
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
  id v27;
  void *v28;
  int v29;
  BOOL v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  id v58;
  objc_super v59;

  v59.receiver = self;
  v59.super_class = (Class)PSGPreBuddyCell;
  v4 = -[PSGPreBuddyCell initWithStyle:reuseIdentifier:](&v59, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PSGPreBuddyCell setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PSTableCell titleLabel](v5, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 1);

    -[PSGPreBuddyCell detailTextLabel](v5, "detailTextLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 1);

    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v8, "setAxis:", 1);
    -[PSGPreBuddyCell contentView](v5, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v8);

    objc_msgSend(v8, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGPreBuddyCell contentView](v5, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, 15.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", 1);

    objc_msgSend(v8, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGPreBuddyCell contentView](v5, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, 24.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActive:", 1);

    objc_msgSend(v8, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGPreBuddyCell contentView](v5, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:constant:", v20, -24.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setActive:", 1);

    objc_msgSend(v8, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGPreBuddyCell contentView](v5, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v24, -25.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setActive:", 1);

    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v24) = objc_msgSend(v26, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63770]);

    v27 = objc_alloc_init(MEMORY[0x24BDB4398]);
    objc_msgSend(v27, "aa_primaryAppleAccount");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = PSUsedByManagedAccount();
    v30 = (_DWORD)v24 == 2 && v28 == 0;
    if (v30 || v29)
    {
      v36 = (void *)objc_opt_new();
      objc_msgSend(v36, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      PSG_LocalizedStringForReset(CFSTR("PREBUDDY_MANAGED"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setText:", v51);

      v52 = (void *)MEMORY[0x24BEBB520];
      v53 = *MEMORY[0x24BEBE220];
      +[PSGResetOrEraseListController maximumSupportedContentSizeCategory](PSGResetOrEraseListController, "maximumSupportedContentSizeCategory");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "_preferredFontForTextStyle:maximumContentSizeCategory:", v53, v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setFont:", v55);

      objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setTextColor:", v56);

      objc_msgSend(v36, "setTextAlignment:", 1);
      objc_msgSend(v36, "setNumberOfLines:", 0);
      objc_msgSend(v8, "addArrangedSubview:", v36);
    }
    else
    {
      v58 = v27;
      v31 = (void *)MEMORY[0x24BEBB520];
      v32 = *MEMORY[0x24BEBE1D0];
      +[PSGResetOrEraseListController maximumSupportedContentSizeCategory](PSGResetOrEraseListController, "maximumSupportedContentSizeCategory");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "_preferredFontForTextStyle:maximumContentSizeCategory:", v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "fontDescriptor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "fontDescriptorWithSymbolicTraits:", 2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = objc_alloc(MEMORY[0x24BEBD668]);
      -[PSGPreBuddyCell transferingImage](v5, "transferingImage");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)objc_msgSend(v37, "initWithImage:", v38);

      objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v39, "setContentMode:", 4);
      objc_msgSend(v8, "addArrangedSubview:", v39);
      objc_msgSend(v8, "setCustomSpacing:afterView:", v39, 15.0);
      v40 = (void *)objc_opt_new();
      objc_msgSend(v40, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      PSG_LocalizedStringForReset(CFSTR("PREBUDDY_LABEL"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setText:", v41);

      objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v36, 0.0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setFont:", v42);

      objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setTextColor:", v43);

      objc_msgSend(v40, "setTextAlignment:", 1);
      objc_msgSend(v40, "setNumberOfLines:", 0);
      objc_msgSend(v8, "addArrangedSubview:", v40);
      objc_msgSend(v8, "setCustomSpacing:afterView:", v40, 15.0);
      v44 = (void *)objc_opt_new();
      objc_msgSend(v44, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      PSG_LocalizedStringForReset(CFSTR("PREBUDDY_TEXT"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setText:", v45);

      v46 = (void *)MEMORY[0x24BEBB520];
      v47 = *MEMORY[0x24BEBE220];
      +[PSGResetOrEraseListController maximumSupportedContentSizeCategory](PSGResetOrEraseListController, "maximumSupportedContentSizeCategory");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "_preferredFontForTextStyle:maximumContentSizeCategory:", v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setFont:", v49);

      objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setTextColor:", v50);

      v27 = v58;
      objc_msgSend(v44, "setTextAlignment:", 1);
      objc_msgSend(v44, "setNumberOfLines:", 0);
      objc_msgSend(v8, "addArrangedSubview:", v44);

    }
  }
  return v5;
}

- (UIImage)transferingImage
{
  void *v2;
  int v3;
  void *v4;
  char v5;
  const __CFString *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sf_hasHardwareHomeButton");

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sf_isiPod");

  if ((v5 & 1) != 0)
  {
    v6 = CFSTR("iPod");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "sf_isiPad");

    v6 = CFSTR("iPhone");
    if (v8)
      v6 = CFSTR("iPad");
  }
  v9 = CFSTR("Modern");
  if (v3)
    v9 = CFSTR("Classic");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageNamed:inBundle:", v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "imageWithRenderingMode:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v14;
}

@end
