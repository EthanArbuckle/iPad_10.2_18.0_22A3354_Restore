@implementation PSGSWVersionDetailCell

- (PSGSWVersionDetailCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8;
  PSGSWVersionDetailCell *v9;
  PSGSWVersionDetailCell *v10;
  int *p_osUpdateType;
  SUDocumentationData *documentationData;
  void *v13;
  uint64_t v14;
  SUManagerClient *suClient;
  uint64_t v16;
  SUManagerClient *v17;
  uint64_t v18;
  SUDocumentationData *v19;
  NSObject *v20;
  uint64_t v21;
  NSString *buildVersion;
  NSObject *v23;
  objc_super v25;

  v8 = a5;
  v25.receiver = self;
  v25.super_class = (Class)PSGSWVersionDetailCell;
  v9 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v25, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, v8);
  v10 = v9;
  if (v9)
  {
    p_osUpdateType = &v9->_osUpdateType;
    v9->_osUpdateType = 0;
    documentationData = v9->_documentationData;
    v9->_documentationData = 0;

    objc_msgSend(v8, "propertyForKey:", CFSTR("OSUpdateType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        *p_osUpdateType = objc_msgSend(v13, "integerValue");
    }
    objc_msgSend(v8, "propertyForKey:", CFSTR("SUManagerClient"));
    v14 = objc_claimAutoreleasedReturnValue();
    suClient = v10->_suClient;
    v10->_suClient = (SUManagerClient *)v14;

    if (!v10->_suClient || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x24BEAEC38]), "initWithDelegate:", 0);
      v17 = v10->_suClient;
      v10->_suClient = (SUManagerClient *)v16;

    }
    objc_msgSend(v8, "propertyForKey:", CFSTR("SUDocumentationData"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v10->_documentationData;
    v10->_documentationData = (SUDocumentationData *)v18;

    if (!v10->_documentationData)
    {
      _PSGLoggingFacility();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[PSGSWVersionDetailCell initWithStyle:reuseIdentifier:specifier:].cold.2((uint64_t)&v10->_osUpdateType, v20);

    }
    -[PSGSWVersionDetailCell systemVersionValueForKey:](v10, "systemVersionValueForKey:", CFSTR("ProductBuildVersion"));
    v21 = objc_claimAutoreleasedReturnValue();
    buildVersion = v10->_buildVersion;
    v10->_buildVersion = (NSString *)v21;

    if (!v10->_buildVersion)
    {
      _PSGLoggingFacility();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[PSGSWVersionDetailCell initWithStyle:reuseIdentifier:specifier:].cold.1(v23);

    }
    -[PSGSWVersionDetailCell setupMargins](v10, "setupMargins");
    -[PSGSWVersionDetailCell configureContentView](v10, "configureContentView");

  }
  return v10;
}

- (void)configureContentView
{
  UILabel *v3;
  UILabel *titleLabelView;
  void *v5;
  UILabel *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PSWebContainerView *v16;
  PSWebContainerView *releaseNotesSummaryView;
  void *v18;
  UIView *v19;
  UIView *revokedSplatView;
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
  _QWORD v51[3];
  void *v52;
  void *v53;
  _QWORD v54[4];

  v54[3] = *MEMORY[0x24BDAC8D0];
  -[PSGSWVersionDetailCell titleLabelView](self, "titleLabelView");
  v3 = (UILabel *)objc_claimAutoreleasedReturnValue();
  titleLabelView = self->_titleLabelView;
  self->_titleLabelView = v3;

  if (self->_titleLabelView)
  {
    -[PSGSWVersionDetailCell contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", self->_titleLabelView);

    v6 = self->_titleLabelView;
  }
  else
  {
    v6 = 0;
  }
  v38 = (void *)MEMORY[0x24BDD1628];
  -[UILabel topAnchor](v6, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGSWVersionDetailCell contentView](self, "contentView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "layoutMarginsGuide");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "topAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v42);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v40;
  -[UILabel leadingAnchor](self->_titleLabelView, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGSWVersionDetailCell contentView](self, "contentView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "layoutMarginsGuide");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = v9;
  -[UILabel trailingAnchor](self->_titleLabelView, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGSWVersionDetailCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutMarginsGuide");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v54[2] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "activateConstraints:", v15);

  -[PSGSWVersionDetailCell releaseNotesSummaryView](self, "releaseNotesSummaryView");
  v16 = (PSWebContainerView *)objc_claimAutoreleasedReturnValue();
  releaseNotesSummaryView = self->_releaseNotesSummaryView;
  self->_releaseNotesSummaryView = v16;

  if (self->_releaseNotesSummaryView)
  {
    -[PSGSWVersionDetailCell contentView](self, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", self->_releaseNotesSummaryView);

  }
  if (self->_osUpdateType == 1
    && -[SUManagerClient isSplatOnlyUpdateRollbackSuggested](self->_suClient, "isSplatOnlyUpdateRollbackSuggested"))
  {
    -[PSGSWVersionDetailCell revokedSplatView](self, "revokedSplatView");
    v19 = (UIView *)objc_claimAutoreleasedReturnValue();
    revokedSplatView = self->_revokedSplatView;
    self->_revokedSplatView = v19;

    v21 = (void *)MEMORY[0x24BDD1628];
    -[PSWebContainerView bottomAnchor](self->_releaseNotesSummaryView, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_revokedSplatView, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, -5.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v24;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v53, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "activateConstraints:", v25);
  }
  else
  {
    v26 = (void *)MEMORY[0x24BDD1628];
    -[PSWebContainerView bottomAnchor](self->_releaseNotesSummaryView, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGSWVersionDetailCell contentView](self, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v24, -5.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v25;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v52, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activateConstraints:", v27);

  }
  v41 = (void *)MEMORY[0x24BDD1628];
  -[PSWebContainerView topAnchor](self->_releaseNotesSummaryView, "topAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_titleLabelView, "bottomAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:constant:", v50, 5.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v47;
  -[PSWebContainerView leadingAnchor](self->_releaseNotesSummaryView, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGSWVersionDetailCell contentView](self, "contentView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "layoutMarginsGuide");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v30;
  -[PSWebContainerView trailingAnchor](self->_releaseNotesSummaryView, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGSWVersionDetailCell contentView](self, "contentView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "layoutMarginsGuide");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v51[2] = v35;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 3);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "activateConstraints:", v36);

  -[PSGSWVersionDetailCell updateConstraints](self, "updateConstraints");
  -[PSGSWVersionDetailCell setNeedsDisplay](self, "setNeedsDisplay");
}

- (id)revokedSplatView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
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
  _QWORD v52[4];
  _QWORD v53[6];

  v53[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  PSG_LocalizedStringForGeneral(CFSTR("REVOKE_SPLAT_INFO"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setText:", v3);

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v4);

  objc_msgSend(MEMORY[0x24BEBDAB0], "currentTraitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.62, 0.6, 0.58, 1.0);
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlackColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTextColor:", v6);

  objc_msgSend(v2, "setTextAlignment:", 4);
  objc_msgSend(v2, "setNumberOfLines:", 0);
  v7 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BEBDAB0], "currentTraitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "userInterfaceStyle") == 2)
  {
    v9 = 0.24;
    v10 = 0.22;
    v11 = 0.11;
  }
  else
  {
    v10 = 0.97;
    v11 = 0.84;
    v9 = 1.0;
  }
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", v9, v10, v11, 1.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v12);

  objc_msgSend(v7, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCornerRadius:", 5.0);

  objc_msgSend(v7, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setMasksToBounds:", 1);

  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7, "addSubview:", v2);
  v40 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v2, "topAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:constant:", v46, 10.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v44;
  objc_msgSend(v2, "leadingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:constant:", v15, 10.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v16;
  objc_msgSend(v2, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, -10.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v19;
  objc_msgSend(v2, "bottomAnchor");
  v50 = v2;
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, -10.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v53[3] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "activateConstraints:", v23);

  -[PSGSWVersionDetailCell contentView](self, "contentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addSubview:", v7);

  v37 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v7, "topAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSWebContainerView bottomAnchor](self->_releaseNotesSummaryView, "bottomAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:constant:", v47, 30.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v45;
  objc_msgSend(v7, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGSWVersionDetailCell contentView](self, "contentView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "layoutMarginsGuide");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:constant:", v38, 10.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v36;
  objc_msgSend(v7, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGSWVersionDetailCell contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "layoutMarginsGuide");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:constant:", v27, -5.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v28;
  objc_msgSend(v7, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGSWVersionDetailCell contentView](self, "contentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v31, -15.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v52[3] = v32;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "activateConstraints:", v33);

  return v7;
}

- (id)titleLabelView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x24BEBE200], *MEMORY[0x24BEBE070]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fontDescriptorWithSymbolicTraits:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PSGSWVersionDetailCell titleLabelString](self, "titleLabelString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v7);

  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v5, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v8);

  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v9);

  objc_msgSend(v6, "setTextAlignment:", 4);
  objc_msgSend(v6, "setNumberOfLines:", 0);

  return v6;
}

- (id)titleLabelString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PSGSWVersionDetailCell systemVersionValueForKey:](self, "systemVersionValueForKey:", *MEMORY[0x24BDBD208]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGSWVersionDetailCell systemVersionValueForKey:](self, "systemVersionValueForKey:", CFSTR("ProductBuildVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %@ (%@)"), v6, v3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)releaseNotesSummaryView
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x24BE75658]);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "setAutoresizesSubviews:", 0);
  -[PSGSWVersionDetailCell releaseNotesSummary](self, "releaseNotesSummary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContent:", v4);

  return v3;
}

- (id)releaseNotesSummary
{
  void *v2;
  void *v3;
  void *v4;

  -[PSGSWVersionDetailCell releaseNotesSummaryString](self, "releaseNotesSummaryString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("<style type=\"text/css\">body { margin: 0px; padding: 0px; }</style>"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)deviceNameString
{
  return (id)MGGetStringAnswer();
}

- (id)releaseNotesSummaryString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;

  -[SUDocumentationData readmeSummary](self->_documentationData, "readmeSummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v4, 4);
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    if (self->_osUpdateType == 1)
      v7 = CFSTR("SW_DETAIL_SECURITY");
    else
      v7 = CFSTR("SW_DETAIL_OS");
    PSG_LocalizedStringForGeneral(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGSWVersionDetailCell deviceNameString](self, "deviceNameString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(CFSTR("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\"><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"><meta http-equiv=\"Content-Style-Type\" content=\"text/css\"><meta name=\"supported-color-schemes\" content=\"light dark\"><title></title><style type=\"text/css\">p.plain { margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px; -webkit-text-size-adjust: 100%; font-family: -apple-system, HelveticaNeue, LucidaGrande; color: -apple-system-secondary-label; }</style><body><p class=\"plain\">{CONTENT}</p></body></html>"),
      "stringByReplacingOccurrencesOfString:withString:",
      CFSTR("{CONTENT}"),
      v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)preparingRollbackString
{
  void *v2;

  if (self->_osUpdateType == 1)
  {
    PSG_LocalizedStringForGeneral(CFSTR("PREPARING_REMOVAL"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)systemVersionValueForKey:(id)a3
{
  int osUpdateType;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  osUpdateType = self->_osUpdateType;
  v4 = a3;
  if (osUpdateType == 1)
    v5 = (void *)_CFCopySupplementalVersionDictionary();
  else
    v5 = (void *)_CFCopySystemVersionDictionary();
  v6 = v5;
  objc_msgSend(v5, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (double)preferredHeightWithTable:(id)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  UIView *revokedSplatView;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;

  -[PSGSWVersionDetailCell bounds](self, "bounds", a3);
  v5 = v4;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;

  -[PSWebContainerView webView](self->_releaseNotesSummaryView, "webView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentOffset");
  v12 = v11;
  v14 = v13;

  -[PSGSWVersionDetailCell computeHeightForWidth:forAccessibilitySupportedWebContainer:](self, "computeHeightForWidth:forAccessibilitySupportedWebContainer:", self->_releaseNotesSummaryView, v5);
  v16 = v15;
  -[PSWebContainerView webView](self->_releaseNotesSummaryView, "webView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scrollView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setContentOffset:", v12, v14);

  v19 = v8 * 0.330000013;
  -[PSWebContainerView webView](self->_releaseNotesSummaryView, "webView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "scrollView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v16 <= v19)
  {
    objc_msgSend(v21, "setScrollEnabled:", 0);

    -[PSWebContainerView webView](self->_releaseNotesSummaryView, "webView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "scrollView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setBounces:", 0);
    v19 = v16;
  }
  else
  {
    objc_msgSend(v21, "setScrollEnabled:", 1);

    -[PSWebContainerView webView](self->_releaseNotesSummaryView, "webView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "scrollView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setBounces:", 1);
  }

  revokedSplatView = self->_revokedSplatView;
  if (revokedSplatView)
  {
    -[UIView subviews](revokedSplatView, "subviews");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectAtIndex:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "intrinsicContentSize");
    v29 = v28 + 45.0;

  }
  else
  {
    v29 = 0.0;
  }
  -[PSGSWVersionDetailCell contentView](self, "contentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "layoutMargins");
  v32 = v31;
  -[UILabel frame](self->_titleLabelView, "frame");
  v34 = v29 + v19 + v32 + v33;
  -[PSGSWVersionDetailCell contentView](self, "contentView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "layoutMargins");
  v37 = v36 + v34;

  return v37;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PSGSWVersionDetailCell;
  -[PSGSWVersionDetailCell traitCollectionDidChange:](&v15, sel_traitCollectionDidChange_, a3);
  objc_msgSend(MEMORY[0x24BEBDAB0], "currentTraitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "userInterfaceStyle") == 2)
  {
    v5 = 0.24;
    v6 = 0.22;
    v7 = 0.11;
  }
  else
  {
    v6 = 0.97;
    v7 = 0.84;
    v5 = 1.0;
  }
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", v5, v6, v7, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_revokedSplatView, "setBackgroundColor:", v8);

  -[UIView subviews](self->_revokedSplatView, "subviews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    -[UIView subviews](self->_revokedSplatView, "subviews");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndex:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(MEMORY[0x24BEBDAB0], "currentTraitCollection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "userInterfaceStyle") == 2)
        objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.62, 0.6, 0.58, 1.0);
      else
        objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlackColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTextColor:", v14);

    }
  }
}

- (double)computeHeightForWidth:(double)a3 forAccessibilitySupportedWebContainer:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  float v8;
  double v9;
  double v10;

  v5 = a4;
  objc_msgSend(v5, "webView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByEvaluatingJavaScriptFromString:", CFSTR("function get_height(){var e=document;return Math.max(e.body.scrollHeight,e.documentElement.scrollHeight,e.body.offsetHeight,e.documentElement.offsetHeight,e.body.clientHeight,e.documentElement.clientHeight)}; get_height();"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7
    || objc_msgSend(v7, "isEqualToString:", &stru_24F9C95C8)
    || (objc_msgSend(v7, "floatValue"), v8 <= 0.0))
  {
    objc_msgSend(v5, "heightForWidth:", a3);
    v9 = v10;
  }
  else
  {
    v9 = v8;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suClient, 0);
  objc_storeStrong((id *)&self->_revokedSplatView, 0);
  objc_storeStrong((id *)&self->_releaseNotesSummaryView, 0);
  objc_storeStrong((id *)&self->_titleLabelView, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_documentationData, 0);
}

- (void)initWithStyle:(os_log_t)log reuseIdentifier:specifier:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22E024000, log, OS_LOG_TYPE_ERROR, "Failed to get buildVersion string from system version plist", v1, 2u);
}

- (void)initWithStyle:(uint64_t)a1 reuseIdentifier:(NSObject *)a2 specifier:.cold.2(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  SUStringFromOSUpdateType();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = 0;
  _os_log_error_impl(&dword_22E024000, a2, OS_LOG_TYPE_ERROR, "Failed to get documentation data for %@ update: %@", (uint8_t *)&v4, 0x16u);

}

@end
