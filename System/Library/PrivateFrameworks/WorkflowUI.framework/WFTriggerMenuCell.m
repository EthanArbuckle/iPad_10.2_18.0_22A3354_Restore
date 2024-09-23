@implementation WFTriggerMenuCell

- (WFTriggerMenuCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WFTriggerMenuCell *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
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
  WFTriggerMenuCell *v28;
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
  objc_super v41;
  _QWORD v42[4];
  _QWORD v43[3];

  v43[1] = *MEMORY[0x24BDAC8D0];
  v41.receiver = self;
  v41.super_class = (Class)WFTriggerMenuCell;
  v4 = -[WFTriggerMenuCell initWithStyle:reuseIdentifier:](&v41, sel_initWithStyle_reuseIdentifier_, 1, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEBD438], "plainButtonConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitleLineBreakMode:", 4);
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBaseForegroundColor:", v6);

    objc_msgSend(v5, "contentInsets");
    v8 = v7;
    objc_msgSend(v5, "contentInsets");
    objc_msgSend(v5, "setContentInsets:", v8, 0.0);
    v40 = v5;
    objc_msgSend(v5, "setTitleAlignment:", 3);
    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithTextStyle:", *MEMORY[0x24BEBE1F0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPreferredSymbolConfigurationForImage:", v9);

    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithConfiguration:primaryAction:", v5, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD388], "actionWithTitle:image:identifier:handler:", &stru_24E605650, 0, 0, &__block_literal_global_3359);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BEBD748];
    v43[0] = v39;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "menuWithChildren:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMenu:", v13);

    objc_msgSend(v10, "setShowsMenuAsPrimaryAction:", 1);
    objc_msgSend(v10, "setChangesSelectionAsPrimaryAction:", 1);
    objc_msgSend(v10, "setContentHorizontalAlignment:", 2);
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subtitleLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFont:", v14);

    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subtitleLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTextColor:", v16);

    -[WFTriggerMenuCell _setPopupMenuButton:](v4, "_setPopupMenuButton:", v10);
    -[WFTriggerMenuCell contentView](v4, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerMenuCell _popupMenuButton](v4, "_popupMenuButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v19);

    v31 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v10, "topAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerMenuCell topAnchor](v4, "topAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v37);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v36;
    objc_msgSend(v10, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerMenuCell textLabel](v4, "textLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, 8.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v32;
    objc_msgSend(v10, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerMenuCell bottomAnchor](v4, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v42[2] = v21;
    objc_msgSend(v10, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerMenuCell contentView](v4, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "layoutMarginsGuide");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v42[3] = v26;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "activateConstraints:", v27);

    v28 = v4;
  }

  return v4;
}

- (id)titleFont
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x24BEBB520];
  v3 = *MEMORY[0x24BEBE1D0];
  -[WFTriggerMenuCell traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFontForTextStyle:compatibleWithTraitCollection:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "fontDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontDescriptorWithDesign:", *MEMORY[0x24BEBB578]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v7, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setMenu:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "selectedElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFTriggerMenuCell _popupMenuButton](self, "_popupMenuButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMenu:", v4);

  if (v7)
  {
    v9 = objc_alloc(MEMORY[0x24BDD1458]);
    v15[0] = *MEMORY[0x24BEBB360];
    -[WFTriggerMenuCell titleFont](self, "titleFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    v15[1] = *MEMORY[0x24BEBB368];
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v9, "initWithString:attributes:", v7, v12);

    -[WFTriggerMenuCell _popupMenuButton](self, "_popupMenuButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAttributedTitle:forState:", v13, 0);

  }
}

@end
