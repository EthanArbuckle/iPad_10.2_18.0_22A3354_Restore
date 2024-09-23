@implementation PDUDisclosureReviewViewController_iOS

- (PDUDisclosureReviewViewController_iOS)initWithBundle:(id)a3 variant:(unint64_t)a4
{
  id v7;
  PDUDisclosureReviewViewController_iOS *v8;
  PDUDisclosureReviewViewController_iOS *v9;
  NSArray *v10;
  NSArray *v11;
  NSArray *titles;
  NSArray *v13;
  NSArray *descriptions;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSString *obkBundleID;
  PDUDisclosureReviewViewController_iOS *v20;
  id v22;
  id v23;
  objc_super v24;

  v7 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PDUDisclosureReviewViewController_iOS;
  v8 = -[PDUDisclosureReviewViewController_iOS initWithStyle:](&v24, sel_initWithStyle_, 2);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_bundle, a3);
    v9->_variant = a4;
    v22 = 0;
    v23 = 0;
    PDURetrieveLocalizedTitlesAndDescriptions(v7, &v23, &v22);
    v10 = (NSArray *)v23;
    v11 = (NSArray *)v22;
    titles = v9->_titles;
    v9->_titles = v10;
    v13 = v10;

    descriptions = v9->_descriptions;
    v9->_descriptions = v11;

    -[PDUDisclosureReviewViewController_iOS tableView](v9, "tableView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("DISCLOSURE_CELL"));

    -[PDUDisclosureReviewViewController_iOS tableView](v9, "tableView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(), CFSTR("DISCLOSURE_HEADER"));

    -[PDUDisclosureReviewViewController_iOS tableView](v9, "tableView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(), CFSTR("DISCLOSURE_FOOTER"));

    -[NSBundle pdu_aboutPrivacyBundleID](v9->_bundle, "pdu_aboutPrivacyBundleID");
    v18 = objc_claimAutoreleasedReturnValue();
    obkBundleID = v9->_obkBundleID;
    v9->_obkBundleID = (NSString *)v18;

    v20 = v9;
  }

  return v9;
}

- (void)viewWillAppear:(BOOL)a3
{
  unint64_t variant;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PDUDisclosureReviewViewController_iOS;
  -[PDUDisclosureReviewViewController_iOS viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  if (!self->_isConfigured)
  {
    variant = self->_variant;
    if (variant == 1)
    {
      -[PDUDisclosureReviewViewController_iOS configureForSettings](self, "configureForSettings");
    }
    else if (!variant)
    {
      -[PDUDisclosureReviewViewController_iOS configureForAlert](self, "configureForAlert");
    }
    self->_isConfigured = 1;
  }
}

- (void)configureForAlert
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc(MEMORY[0x24BDF6860]);
  PDULocalizedString(CFSTR("REVIEW_DONE"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "initWithTitle:image:target:action:menu:", v6, 0, self, sel_doneTapped, 0);
  -[PDUDisclosureReviewViewController_iOS navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRightBarButtonItem:", v4);

}

- (void)configureForSettings
{
  void *v3;
  id v4;

  PDULocalizedNameForBundle(self->_bundle);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PDUDisclosureReviewViewController_iOS navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

}

- (void)doneTapped
{
  id v3;

  -[PDUDisclosureReviewViewController_iOS delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "disclosureReviewViewControllerDidDismiss:", self);

}

- (void)aboutPrivacyTapped
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[NSBundle pathForResource:ofType:](self->_bundle, "pathForResource:ofType:", self->_obkBundleID, CFSTR("bundle"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", v8);

  if (v4)
    objc_msgSend(MEMORY[0x24BE6E438], "presenterForPrivacySplashWithBundleAtPath:", v8);
  else
    objc_msgSend(MEMORY[0x24BE6E438], "presenterForPrivacySplashWithIdentifier:", self->_obkBundleID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPresentingViewController:", self);
  -[PDUDisclosureReviewViewController_iOS view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCustomTintColor:", v7);

  objc_msgSend(v5, "present");
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  unint64_t variant;
  uint64_t v9;

  v6 = a3;
  if (a4)
    goto LABEL_2;
  variant = self->_variant;
  if (variant == 1)
  {
    -[PDUDisclosureReviewViewController_iOS headerForSettings](self, "headerForSettings");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (!variant)
  {
    -[PDUDisclosureReviewViewController_iOS headerForAlert](self, "headerForAlert");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v7 = (void *)v9;
    goto LABEL_8;
  }
LABEL_2:
  v7 = 0;
LABEL_8:

  return v7;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  void *v5;

  if (-[NSArray count](self->_titles, "count", a3) - 1 == a4 && self->_variant == 1)
  {
    -[PDUDisclosureReviewViewController_iOS footerForSettings](self, "footerForSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)headerForSettings
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
  double v13;
  double v14;
  double v15;
  double v16;

  -[PDUDisclosureReviewViewController_iOS tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("DISCLOSURE_HEADER"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "defaultContentConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD17C8];
  PDULocalizedString(CFSTR("LEARN_MORE_SUBTITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PDULocalizedNameForBundle(self->_bundle);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v9);

  objc_msgSend(v5, "textProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTransform:", 0);

  objc_msgSend(v5, "textProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLineBreakMode:", 0);

  objc_msgSend(v5, "textProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNumberOfLines:", 0);

  objc_msgSend(v5, "directionalLayoutMargins");
  v14 = v13;
  objc_msgSend(v5, "directionalLayoutMargins");
  v16 = v15;
  objc_msgSend(v5, "directionalLayoutMargins");
  objc_msgSend(v5, "setDirectionalLayoutMargins:", v14, v16, 32.0);
  objc_msgSend(v4, "setContentConfiguration:", v5);

  return v4;
}

- (id)footerForSettings
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
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
  _QWORD v48[5];
  _QWORD v49[4];
  uint64_t v50;
  _QWORD v51[3];

  v51[1] = *MEMORY[0x24BDAC8D0];
  if (self->_obkBundleID)
  {
    -[PDUDisclosureReviewViewController_iOS tableView](self, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("DISCLOSURE_FOOTER"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "defaultContentConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "directionalLayoutMargins");
    v7 = v6;
    objc_msgSend(v5, "directionalLayoutMargins");
    v9 = v8;
    objc_msgSend(v5, "directionalLayoutMargins");
    objc_msgSend(v5, "setDirectionalLayoutMargins:", 32.0, v7, v9);
    objc_msgSend(v4, "setContentConfiguration:", v5);

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6888], "borderlessButtonConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDD17C8];
    PDULocalizedString(CFSTR("SETTINGS_ABOUT_PRIVACY"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PDULocalizedNameForBundle(self->_bundle);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", v12, v13);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_alloc(MEMORY[0x24BDD1458]);
    v50 = *MEMORY[0x24BEBB360];
    v51[0] = v46;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithString:attributes:", v45, v15);
    objc_msgSend(v10, "setAttributedTitle:", v16);

    objc_msgSend(v10, "setTitleAlignment:", 1);
    objc_msgSend(v10, "setButtonSize:", 2);
    objc_msgSend(v10, "contentInsets");
    v18 = v17;
    objc_msgSend(v10, "contentInsets");
    v44 = v10;
    objc_msgSend(v10, "setContentInsets:", v18, 0.0);
    v48[0] = MEMORY[0x24BDAC760];
    v48[1] = 3221225472;
    v48[2] = __58__PDUDisclosureReviewViewController_iOS_footerForSettings__block_invoke;
    v48[3] = &unk_2515A5D70;
    v48[4] = self;
    objc_msgSend(MEMORY[0x24BDF67B8], "actionWithHandler:", v48);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6880], "buttonWithConfiguration:primaryAction:", v10, v43);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v4, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSubview:", v19);

    objc_msgSend(v4, "contentView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v4;
    objc_msgSend(v4, "contentView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "layoutMarginsGuide");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v38;
    objc_msgSend(v19, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "layoutMarginsGuide");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintLessThanOrEqualToAnchor:", v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = v33;
    objc_msgSend(v19, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v49[2] = v24;
    objc_msgSend(v19, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v49[3] = v28;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addConstraints:", v29);

    objc_msgSend(v21, "contentView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setNeedsLayout");

  }
  else
  {
    v21 = 0;
  }
  return v21;
}

- (id)headerForAlert
{
  void *v3;
  objc_class *v4;
  NSBundle *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  objc_class *v14;
  NSBundle *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
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
  _QWORD v36[5];

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)MEMORY[0x24BDF6B68];
  v5 = self->_bundle;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = (void *)MEMORY[0x24BDD17C8];
  PDULocalizedString(CFSTR("LEARN_MORE_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PDULocalizedNameForBundle(v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringWithFormat:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setText:", v10);
  objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:weight:", *MEMORY[0x24BDF7800], *MEMORY[0x24BEBB5E8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v11);

  objc_msgSend(v6, "setNumberOfLines:", 0);
  objc_msgSend(v6, "setTextAlignment:", 1);
  LODWORD(v12) = 1148846080;
  objc_msgSend(v6, "setContentHuggingPriority:forAxis:", 1, v12);
  LODWORD(v13) = 1148846080;
  objc_msgSend(v6, "setContentCompressionResistancePriority:forAxis:", 1, v13);

  objc_msgSend(v3, "addObject:", v6);
  v14 = (objc_class *)MEMORY[0x24BDF6B68];
  v15 = self->_bundle;
  v16 = objc_alloc_init(v14);
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v17 = (void *)MEMORY[0x24BDD17C8];
  PDULocalizedString(CFSTR("LEARN_MORE_SUBTITLE"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  PDULocalizedNameForBundle(v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "stringWithFormat:", v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setText:", v20);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFont:", v21);

  objc_msgSend(v16, "setNumberOfLines:", 0);
  objc_msgSend(v16, "setTextAlignment:", 1);
  LODWORD(v22) = 1148846080;
  objc_msgSend(v16, "setContentHuggingPriority:forAxis:", 1, v22);
  LODWORD(v23) = 1148846080;
  objc_msgSend(v16, "setContentCompressionResistancePriority:forAxis:", 1, v23);

  objc_msgSend(v3, "addObject:", v16);
  if (self->_obkBundleID)
  {
    objc_msgSend(MEMORY[0x24BDF6888], "borderlessButtonConfiguration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x24BDD17C8];
    PDULocalizedString(CFSTR("ABOUT_PRIVACY"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    PDULocalizedNameForBundle(self->_bundle);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTitle:", v28);

    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __55__PDUDisclosureReviewViewController_iOS_headerForAlert__block_invoke;
    v36[3] = &unk_2515A5D70;
    v36[4] = self;
    objc_msgSend(MEMORY[0x24BDF67B8], "actionWithHandler:", v36);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6880], "buttonWithConfiguration:primaryAction:", v24, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v30);

  }
  stackForViews(v3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PDUDisclosureReviewViewController_iOS tableView](self, "tableView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("DISCLOSURE_HEADER"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "contentView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  fillViewWithNewSubview(v34, v31);

  return v33;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_titles, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *titles;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("DISCLOSURE_CELL"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSelectionStyle:", 0);
  objc_msgSend(MEMORY[0x24BDF6B80], "subtitleCellConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndexedSubscript:](self->_descriptions, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSecondaryText:", v9);

  titles = self->_titles;
  v11 = objc_msgSend(v6, "section");

  -[NSArray objectAtIndexedSubscript:](titles, "objectAtIndexedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v12);

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "secondaryTextProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFont:", v13);

  v15 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(v8, "textProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "font");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pointSize");
  objc_msgSend(v15, "systemFontOfSize:weight:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textProperties");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFont:", v18);

  objc_msgSend(v8, "setTextToSecondaryTextVerticalPadding:", 8.0);
  objc_msgSend(v8, "directionalLayoutMargins");
  v21 = v20;
  objc_msgSend(v8, "directionalLayoutMargins");
  objc_msgSend(v8, "setDirectionalLayoutMargins:", 16.0, v21, 16.0);
  objc_msgSend(v7, "setContentConfiguration:", v8);

  return v7;
}

- (int64_t)preferredUserInterfaceStyle
{
  void *v2;
  int64_t v3;

  -[PDUDisclosureReviewViewController_iOS presentingViewController](self, "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "preferredUserInterfaceStyle");

  return v3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (PDUDisclosureReviewViewControllerDelegate)delegate
{
  return (PDUDisclosureReviewViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_obkBundleID, 0);
  objc_storeStrong((id *)&self->_descriptions, 0);
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end
