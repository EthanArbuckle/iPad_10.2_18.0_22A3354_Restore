@implementation WFWorkflowWizardNameCell

- (WFWorkflowWizardNameCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WFWorkflowWizardNameCell *v4;
  WFWorkflowWizardNameCell *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  WFWorkflowWizardNameRecordButton *v10;
  WFWorkflowWizardNameClearButton *v11;
  id v12;
  id v13;
  UITextField *v14;
  void *v15;
  UITextField *shortcutNameTextField;
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
  WFWorkflowWizardNameCell *v43;
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
  id v71;
  WFWorkflowWizardNameClearButton *v72;
  WFWorkflowWizardNameRecordButton *v73;
  void *v74;
  UITextField *v75;
  objc_super v76;
  _QWORD v77[2];
  _QWORD v78[2];
  _QWORD v79[12];

  v79[10] = *MEMORY[0x24BDAC8D0];
  v76.receiver = self;
  v76.super_class = (Class)WFWorkflowWizardNameCell;
  v4 = -[WFWorkflowWizardNameCell initWithStyle:reuseIdentifier:](&v76, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_showsHeySiri = 1;
    v4->_useHorizontalInset = 1;
    -[WFWorkflowWizardNameCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    -[WFWorkflowWizardNameCell contentView](v5, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "wf_settingsCellColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v7);

    v8 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "wf_settingsCellColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v9);

    objc_msgSend(v8, "_setContinuousCornerRadius:", 14.0);
    objc_msgSend(v6, "addSubview:", v8);
    objc_storeStrong((id *)&v5->_platterView, v8);
    v10 = objc_alloc_init(WFWorkflowWizardNameRecordButton);
    -[WFWorkflowWizardNameRecordButton setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WFWorkflowWizardNameRecordButton addTarget:action:forControlEvents:](v10, "addTarget:action:forControlEvents:", v5, sel_didTapRecordButton, 64);
    objc_msgSend(v8, "addSubview:", v10);
    objc_storeStrong((id *)&v5->_recordButton, v10);
    v11 = objc_alloc_init(WFWorkflowWizardNameClearButton);
    -[WFWorkflowWizardNameClearButton setTranslatesAutoresizingMaskIntoConstraints:](v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WFWorkflowWizardNameClearButton addTarget:action:forControlEvents:](v11, "addTarget:action:forControlEvents:", v5, sel_didTapClearButton, 64);
    objc_msgSend(v8, "addSubview:", v11);
    objc_storeStrong((id *)&v5->_clearButton, v11);
    v12 = objc_alloc_init(MEMORY[0x24BEBD978]);
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v12, "setAxis:", 1);
    objc_msgSend(v12, "setDistribution:", 3);
    objc_msgSend(v12, "setAlignment:", 0);
    objc_msgSend(v8, "addSubview:", v12);
    objc_storeStrong((id *)&v5->_phraseView, v12);
    v13 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    objc_msgSend(v12, "addArrangedSubview:", v13);
    v14 = (UITextField *)objc_alloc_init(MEMORY[0x24BEBDA48]);
    -[UITextField setAutocapitalizationType:](v14, "setAutocapitalizationType:", WFAutocapitalizationTypeFromLocale());
    -[UITextField setDelegate:](v14, "setDelegate:", v5);
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 17.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setFont:](v14, "setFont:", v15);

    -[UITextField setAccessibilityIdentifier:](v14, "setAccessibilityIdentifier:", CFSTR("name_field"));
    -[UITextField addTarget:action:forControlEvents:](v14, "addTarget:action:forControlEvents:", v5, sel_textFieldDidChange, 0x20000);
    if (-[UITextField conformsToProtocol:](v14, "conformsToProtocol:", &unk_255618BD8))
      -[UITextField setAcceptsDictationSearchResults:](v14, "setAcceptsDictationSearchResults:", 1);
    objc_msgSend(v12, "addArrangedSubview:", v14);
    shortcutNameTextField = v5->_shortcutNameTextField;
    v5->_shortcutNameTextField = v14;
    v75 = v14;

    v71 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    objc_msgSend(v12, "addArrangedSubview:", v71);
    v57 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v8, "topAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToAnchor:", v68);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v79[0] = v67;
    objc_msgSend(v8, "bottomAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bottomAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:", v65);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v79[1] = v64;
    -[WFWorkflowWizardNameRecordButton trailingAnchor](v10, "trailingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trailingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:constant:", v62, -16.0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v79[2] = v61;
    -[WFWorkflowWizardNameRecordButton centerYAnchor](v10, "centerYAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "centerYAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:", v59);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v79[3] = v58;
    -[WFWorkflowWizardNameClearButton trailingAnchor](v11, "trailingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trailingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:constant:", v55, -16.0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v79[4] = v54;
    -[WFWorkflowWizardNameClearButton centerYAnchor](v11, "centerYAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "centerYAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v51);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v79[5] = v50;
    objc_msgSend(v12, "topAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:constant:", v48, 12.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v79[6] = v47;
    objc_msgSend(v12, "bottomAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bottomAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:constant:", v45, -12.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v79[7] = v17;
    objc_msgSend(v12, "trailingAnchor");
    v74 = v12;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowWizardNameRecordButton leadingAnchor](v10, "leadingAnchor");
    v53 = v6;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, -10.0);
    v73 = v10;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v79[8] = v20;
    objc_msgSend(v13, "heightAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "heightAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v72 = v11;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v79[9] = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v79, 10);
    v70 = v13;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "activateConstraints:", v24);

    objc_msgSend(v8, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, 13.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = v27;
    objc_msgSend(v8, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, -13.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v78[1] = v30;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v78, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowWizardNameCell setHorizontalConstraintsWithInset:](v5, "setHorizontalConstraintsWithInset:", v31);

    objc_msgSend(v8, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = v34;
    objc_msgSend(v8, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v77[1] = v37;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v77, 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowWizardNameCell setHorizontalConstraintsWithoutInset:](v5, "setHorizontalConstraintsWithoutInset:", v38);

    WFLocalizedString(CFSTR("Shortcut Name"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowWizardNameCell shortcutNameTextField](v5, "shortcutNameTextField");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setPlaceholder:", v39);

    -[WFWorkflowWizardNameCell updateViewForHorizontalConstraints](v5, "updateViewForHorizontalConstraints");
    -[WFWorkflowWizardNameCell updateButtonVisibility](v5, "updateButtonVisibility");
    -[WFWorkflowWizardNameCell updateViewForDoneButton](v5, "updateViewForDoneButton");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObserver:selector:name:object:", v5, sel_updateButtonVisibility, *MEMORY[0x24BEBE970], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addObserver:selector:name:object:", v5, sel_updateButtonVisibility, *MEMORY[0x24BEBE428], 0);

    v43 = v5;
  }

  return v5;
}

- (void)configureIconButton
{
  void *v3;
  void *v4;
  WFWorkflowWizardNameIconButton *v5;
  WFWorkflowWizardNameIconButton *iconButton;
  WFWorkflowWizardNameIconButton *v7;
  void *v8;

  -[WFWorkflowWizardNameCell iconButton](self, "iconButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFWorkflowWizardNameCell iconButton](self, "iconButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

  }
  if (-[WFWorkflowWizardNameCell useDropdownMenuIconButton](self, "useDropdownMenuIconButton"))
    -[WFWorkflowWizardNameCell dropdownMenuIconButton](self, "dropdownMenuIconButton");
  else
    -[WFWorkflowWizardNameCell regularIconButton](self, "regularIconButton");
  v5 = (WFWorkflowWizardNameIconButton *)objc_claimAutoreleasedReturnValue();
  iconButton = self->_iconButton;
  self->_iconButton = v5;
  v7 = v5;

  -[WFWorkflowWizardNameCell platterView](self, "platterView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v7);

  -[WFWorkflowWizardNameCell setIconButtonConstraints](self, "setIconButtonConstraints");
}

- (BOOL)useDropdownMenuIconButton
{
  void *v2;
  char v3;

  -[WFWorkflowWizardNameCell dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (void)setIconButtonConstraints
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  -[WFWorkflowWizardNameCell iconButton](self, "iconButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowWizardNameCell platterView](self, "platterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowWizardNameCell phraseView](self, "phraseView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BDD1628];
  v15 = v5;
  objc_msgSend(v3, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v16, 13.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  objc_msgSend(v3, "centerYAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerYAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  objc_msgSend(v5, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 10.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activateConstraints:", v13);

}

- (id)regularIconButton
{
  WFWorkflowWizardNameIconButton *v3;

  v3 = objc_alloc_init(WFWorkflowWizardNameIconButton);
  -[WFWorkflowWizardNameIconButton setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WFWorkflowWizardNameIconButton addTarget:action:forControlEvents:](v3, "addTarget:action:forControlEvents:", self, sel_didTapIconButton, 64);
  return v3;
}

- (id)dropdownMenuIconButton
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEBD388], "actionWithTitle:image:identifier:handler:", &stru_24E605650, 0, 0, &__block_literal_global_2079);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFWorkflowWizardNameIconButton systemButtonWithPrimaryAction:](WFWorkflowWizardNameIconButton, "systemButtonWithPrimaryAction:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsMenuAsPrimaryAction:", 1);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WFWorkflowWizardNameCell setDropdownMenuForIconButton:](self, "setDropdownMenuForIconButton:", v4);

  return v4;
}

- (void)setDropdownMenuForIconButton:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WFWorkflowWizardNameCell dataSource](self, "dataSource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iconButtonDropdownMenuInWorkflowWizardNameCell:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMenu:", v5);

}

- (void)setShowsHeySiri:(BOOL)a3
{
  self->_showsHeySiri = a3;
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[WFWorkflowWizardNameCell shortcutNameTextField](self, "shortcutNameTextField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[WFWorkflowWizardNameCell shortcutNameTextField](self, "shortcutNameTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[WFWorkflowWizardNameCell updateButtonVisibility](self, "updateButtonVisibility");
}

- (void)setUseHorizontalContraints:(BOOL)a3
{
  if (self->_useHorizontalInset != a3)
  {
    self->_useHorizontalInset = a3;
    -[WFWorkflowWizardNameCell updateViewForHorizontalConstraints](self, "updateViewForHorizontalConstraints");
  }
}

- (void)setUseDoneButtonOnKeyboard:(BOOL)a3
{
  if (self->_useDoneButtonOnKeyboard != a3)
  {
    self->_useDoneButtonOnKeyboard = a3;
    -[WFWorkflowWizardNameCell updateViewForDoneButton](self, "updateViewForDoneButton");
  }
}

- (void)setIcon:(id)a3 customImageData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[WFWorkflowWizardNameCell iconButton](self, "iconButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIcon:customImageData:", v7, v6);

  if (-[WFWorkflowWizardNameCell useDropdownMenuIconButton](self, "useDropdownMenuIconButton"))
  {
    -[WFWorkflowWizardNameCell iconButton](self, "iconButton");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowWizardNameCell setDropdownMenuForIconButton:](self, "setDropdownMenuForIconButton:", v9);

  }
}

- (void)configureWithName:(id)a3 showsHeySiri:(BOOL)a4 icon:(id)a5
{
  -[WFWorkflowWizardNameCell configureWithName:showsHeySiri:useHorizontalInset:icon:](self, "configureWithName:showsHeySiri:useHorizontalInset:icon:", a3, a4, 1, a5);
}

- (void)configureWithName:(id)a3 showsHeySiri:(BOOL)a4 useHorizontalInset:(BOOL)a5 icon:(id)a6
{
  -[WFWorkflowWizardNameCell configureWithName:showsHeySiri:useHorizontalInset:icon:customImageData:](self, "configureWithName:showsHeySiri:useHorizontalInset:icon:customImageData:", a3, a4, a5, a6, 0);
}

- (void)configureWithName:(id)a3 showsHeySiri:(BOOL)a4 useHorizontalInset:(BOOL)a5 icon:(id)a6 customImageData:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;

  v8 = a5;
  v9 = a4;
  v12 = a7;
  v13 = a6;
  v14 = a3;
  -[WFWorkflowWizardNameCell setShowsHeySiri:](self, "setShowsHeySiri:", v9);
  -[WFWorkflowWizardNameCell setName:](self, "setName:", v14);

  -[WFWorkflowWizardNameCell configureIconButton](self, "configureIconButton");
  -[WFWorkflowWizardNameCell setIcon:customImageData:](self, "setIcon:customImageData:", v13, v12);

  -[WFWorkflowWizardNameCell setUseHorizontalContraints:](self, "setUseHorizontalContraints:", v8);
}

- (BOOL)canBecomeFirstResponder
{
  void *v2;
  char v3;

  -[WFWorkflowWizardNameCell shortcutNameTextField](self, "shortcutNameTextField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canBecomeFirstResponder");

  return v3;
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  char v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFWorkflowWizardNameCell;
  if (!-[WFWorkflowWizardNameCell becomeFirstResponder](&v6, sel_becomeFirstResponder)
    || !-[WFWorkflowWizardNameCell canBecomeFirstResponder](self, "canBecomeFirstResponder"))
  {
    return 0;
  }
  -[WFWorkflowWizardNameCell shortcutNameTextField](self, "shortcutNameTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "becomeFirstResponder");

  return v4;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    objc_msgSend(v4, "resignFirstResponder");
    -[WFWorkflowWizardNameCell delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[WFWorkflowWizardNameCell delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "workflowWizardNameCellDidFinishEditing:", self);

    }
  }

  return v6 != 0;
}

- (BOOL)shortcutNameIsEmpty
{
  void *v2;
  void *v3;
  BOOL v4;

  -[WFWorkflowWizardNameCell shortcutNameTextField](self, "shortcutNameTextField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") == 0;

  return v4;
}

- (void)textFieldDidChange
{
  void *v3;
  void *v4;

  -[WFWorkflowWizardNameCell delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowWizardNameCell name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workflowWizardNameCell:didUpdateName:", self, v4);

  -[WFWorkflowWizardNameCell updateButtonVisibility](self, "updateButtonVisibility");
  -[WFWorkflowWizardNameCell updateViewForDoneButton](self, "updateViewForDoneButton");
}

- (void)updateButtonVisibility
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = -[WFWorkflowWizardNameCell shortcutNameIsEmpty](self, "shortcutNameIsEmpty");
  -[WFWorkflowWizardNameCell clearButton](self, "clearButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

  if (objc_msgSend(MEMORY[0x24BEBD548], "currentInputModeSupportsDictation"))
    v5 = -[WFWorkflowWizardNameCell shortcutNameIsEmpty](self, "shortcutNameIsEmpty") ^ 1;
  else
    v5 = 1;
  -[WFWorkflowWizardNameCell recordButton](self, "recordButton");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v5);

}

- (void)updateViewForDoneButton
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = -[WFWorkflowWizardNameCell useDoneButtonOnKeyboard](self, "useDoneButtonOnKeyboard");
  -[WFWorkflowWizardNameCell shortcutNameTextField](self, "shortcutNameTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "setReturnKeyType:", 9);

    -[WFWorkflowWizardNameCell shortcutNameTextField](self, "shortcutNameTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    v7 = 1;
  }
  else
  {
    objc_msgSend(v4, "setReturnKeyType:", 0);

    -[WFWorkflowWizardNameCell shortcutNameTextField](self, "shortcutNameTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    v7 = 0;
  }
  objc_msgSend(v6, "setEnablesReturnKeyAutomatically:", v7);

}

- (void)updateViewForHorizontalConstraints
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = -[WFWorkflowWizardNameCell useHorizontalInset](self, "useHorizontalInset");
  v4 = (void *)MEMORY[0x24BDD1628];
  if (v3)
  {
    -[WFWorkflowWizardNameCell horizontalConstraintsWithoutInset](self, "horizontalConstraintsWithoutInset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v5);

    v6 = (void *)MEMORY[0x24BDD1628];
    -[WFWorkflowWizardNameCell horizontalConstraintsWithInset](self, "horizontalConstraintsWithInset");
  }
  else
  {
    -[WFWorkflowWizardNameCell horizontalConstraintsWithInset](self, "horizontalConstraintsWithInset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v7);

    v6 = (void *)MEMORY[0x24BDD1628];
    -[WFWorkflowWizardNameCell horizontalConstraintsWithoutInset](self, "horizontalConstraintsWithoutInset");
  }
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activateConstraints:");

}

- (void)didTapIconButton
{
  id v3;

  -[WFWorkflowWizardNameCell delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workflowWizardNameCellDidSelectEditIcon:", self);

}

- (void)didTapRecordButton
{
  void *v2;
  id v3;

  -[WFWorkflowWizardNameCell shortcutNameTextField](self, "shortcutNameTextField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "becomeFirstResponder");

  objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "switchToDictationInputMode");

}

- (void)didTapClearButton
{
  void *v3;
  id v4;

  -[WFWorkflowWizardNameCell shortcutNameTextField](self, "shortcutNameTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

  -[WFWorkflowWizardNameCell updateButtonVisibility](self, "updateButtonVisibility");
  -[WFWorkflowWizardNameCell delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "workflowWizardNameCell:didUpdateName:", self, 0);

}

- (WFWorkflowWizardNameCellDelegate)delegate
{
  return (WFWorkflowWizardNameCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFWorkflowWizardNameCellDataSource)dataSource
{
  return (WFWorkflowWizardNameCellDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (BOOL)showsHeySiri
{
  return self->_showsHeySiri;
}

- (BOOL)useDoneButtonOnKeyboard
{
  return self->_useDoneButtonOnKeyboard;
}

- (BOOL)useHorizontalInset
{
  return self->_useHorizontalInset;
}

- (void)setUseHorizontalInset:(BOOL)a3
{
  self->_useHorizontalInset = a3;
}

- (UIView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_platterView, a3);
}

- (UIView)phraseView
{
  return self->_phraseView;
}

- (void)setPhraseView:(id)a3
{
  objc_storeStrong((id *)&self->_phraseView, a3);
}

- (WFWorkflowWizardNameIconButton)iconButton
{
  return self->_iconButton;
}

- (void)setIconButton:(id)a3
{
  objc_storeStrong((id *)&self->_iconButton, a3);
}

- (WFWorkflowWizardNameRecordButton)recordButton
{
  return self->_recordButton;
}

- (void)setRecordButton:(id)a3
{
  objc_storeStrong((id *)&self->_recordButton, a3);
}

- (WFWorkflowWizardNameClearButton)clearButton
{
  return self->_clearButton;
}

- (void)setClearButton:(id)a3
{
  objc_storeStrong((id *)&self->_clearButton, a3);
}

- (UITextField)shortcutNameTextField
{
  return self->_shortcutNameTextField;
}

- (void)setShortcutNameTextField:(id)a3
{
  objc_storeStrong((id *)&self->_shortcutNameTextField, a3);
}

- (NSArray)horizontalConstraintsWithInset
{
  return self->_horizontalConstraintsWithInset;
}

- (void)setHorizontalConstraintsWithInset:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalConstraintsWithInset, a3);
}

- (NSArray)horizontalConstraintsWithoutInset
{
  return self->_horizontalConstraintsWithoutInset;
}

- (void)setHorizontalConstraintsWithoutInset:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalConstraintsWithoutInset, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_horizontalConstraintsWithoutInset, 0);
  objc_storeStrong((id *)&self->_horizontalConstraintsWithInset, 0);
  objc_storeStrong((id *)&self->_shortcutNameTextField, 0);
  objc_storeStrong((id *)&self->_clearButton, 0);
  objc_storeStrong((id *)&self->_recordButton, 0);
  objc_storeStrong((id *)&self->_iconButton, 0);
  objc_storeStrong((id *)&self->_phraseView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (double)defaultRowHeight
{
  return 66.0;
}

@end
