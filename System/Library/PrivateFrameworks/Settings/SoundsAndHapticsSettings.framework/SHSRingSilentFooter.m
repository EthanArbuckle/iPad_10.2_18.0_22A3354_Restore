@implementation SHSRingSilentFooter

+ (id)newTextView
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BE75530], "appearance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "altTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    PreferencesTableViewFooterColor();
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  v7 = objc_alloc_init(MEMORY[0x24BEBDA88]);
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7, "setTextColor:", v6);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  PreferencesTableViewFooterFont();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v9);

  objc_msgSend(v7, "setShowsVerticalScrollIndicator:", 0);
  objc_msgSend(v7, "setEditable:", 0);
  objc_msgSend(v7, "setSelectable:", 1);
  objc_msgSend(v7, "setScrollEnabled:", 0);
  objc_msgSend(v7, "textContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLineFragmentPadding:", 0.0);

  objc_msgSend(v7, "setTextContainerInset:", *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));
  objc_msgSend(v7, "_setInteractiveTextSelectionDisabled:", 1);

  return v7;
}

+ (id)newImageView
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setContentMode:", 5);
  LODWORD(v3) = 1148846080;
  objc_msgSend(v2, "setContentCompressionResistancePriority:forAxis:", 0, v3);
  LODWORD(v4) = 1148846080;
  objc_msgSend(v2, "setContentCompressionResistancePriority:forAxis:", 1, v4);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v2, "widthAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToConstant:", 40.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", 1);

  return v2;
}

- (SHSRingSilentFooter)initWithSpecifier:(id)a3
{
  SHSRingSilentFooter *v3;
  SHSRingSilentFooter *v4;
  void *v5;
  void *v6;
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
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  SHSRingSilentFooter *v47;

  v3 = -[SHSRingSilentFooter initWithFrame:](self, "initWithFrame:", a3, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v4 = v3;
  if (v3)
  {
    -[SHSRingSilentFooter contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutMarginsGuide");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:weight:", 5, 28.0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v8, "setAxis:", 1);
    -[SHSRingSilentFooter contentView](v4, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v8);

    objc_msgSend(v8, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topAnchor");
    v47 = v4;
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setActive:", 1);

    objc_msgSend(v8, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActive:", 1);

    objc_msgSend(v8, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v6;
    objc_msgSend(v6, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setActive:", 1);

    objc_msgSend(v8, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setActive:", 1);

    v22 = (void *)objc_opt_new();
    objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v22, "setAxis:", 0);
    objc_msgSend(v8, "addArrangedSubview:", v22);
    objc_msgSend(v8, "setCustomSpacing:afterView:", v22, 18.0);
    v41 = (void *)v7;
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("bell.fill"), v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "imageWithTintColor:renderingMode:", v24, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = +[SHSRingSilentFooter newImageView](SHSRingSilentFooter, "newImageView");
    objc_msgSend(v44, "setImage:", v45);
    objc_msgSend(v22, "addArrangedSubview:", v44);
    objc_msgSend(v22, "setCustomSpacing:afterView:", v44, 8.0);
    v25 = (void *)objc_opt_new();
    objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v25, "setAxis:", 1);
    objc_msgSend(v22, "addArrangedSubview:", v25);
    v43 = +[SHSRingSilentFooter newTextView](SHSRingSilentFooter, "newTextView");
    SHS_LocalizedStringForSounds(CFSTR("RING_MODE"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedUppercaseString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setText:", v27);

    objc_msgSend(v25, "addArrangedSubview:", v43);
    objc_msgSend(v25, "setCustomSpacing:afterView:", v43, 5.0);
    v42 = +[SHSRingSilentFooter newTextView](SHSRingSilentFooter, "newTextView");
    SHS_LocalizedStringForSounds(CFSTR("RING_MODE_FOOTER"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setText:", v28);

    objc_msgSend(v25, "addArrangedSubview:", v42);
    v29 = (void *)objc_opt_new();
    objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v29, "setAxis:", 0);
    objc_msgSend(v8, "addArrangedSubview:", v29);
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("bell.slash.fill"), v7);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "imageWithTintColor:renderingMode:", v31, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = +[SHSRingSilentFooter newImageView](SHSRingSilentFooter, "newImageView");
    objc_msgSend(v33, "setImage:", v32);
    objc_msgSend(v29, "addArrangedSubview:", v33);
    objc_msgSend(v29, "setCustomSpacing:afterView:", v33, 8.0);
    v34 = (void *)objc_opt_new();
    objc_msgSend(v34, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v34, "setAxis:", 1);
    objc_msgSend(v29, "addArrangedSubview:", v34);
    v35 = +[SHSRingSilentFooter newTextView](SHSRingSilentFooter, "newTextView");
    SHS_LocalizedStringForSounds(CFSTR("SILENT_MODE"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "localizedUppercaseString");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setText:", v37);

    objc_msgSend(v34, "addArrangedSubview:", v35);
    objc_msgSend(v34, "setCustomSpacing:afterView:", v35, 5.0);
    v38 = +[SHSRingSilentFooter newTextView](SHSRingSilentFooter, "newTextView");
    SHS_LocalizedStringForSounds(CFSTR("SILENT_MODE_FOOTER"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setText:", v39);

    objc_msgSend(v34, "addArrangedSubview:", v38);
    v4 = v47;

  }
  return v4;
}

- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4
{
  id v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v6 = a4;
  v7 = *(double *)(MEMORY[0x24BEBE588] + 8);
  -[SHSRingSilentFooter superview](self, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[SHSRingSilentFooter layoutMargins](self, "layoutMargins");
    v12 = v11;
    v14 = v13;
    objc_msgSend(v6, "layoutMargins");
    v16 = v15;
    objc_msgSend(v6, "layoutMargins");
    -[SHSRingSilentFooter setLayoutMargins:](self, "setLayoutMargins:", v12, v16, v14);
  }
  LODWORD(v9) = 1148846080;
  LODWORD(v10) = 1112014848;
  -[SHSRingSilentFooter systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3, v7, v9, v10);
  v18 = v17;

  return v18;
}

@end
