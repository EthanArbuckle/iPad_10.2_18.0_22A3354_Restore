@implementation WLDetailViewController

- (WLDetailViewController)initWithContext:(id)a3
{
  id v4;
  WLDetailViewController *v5;
  uint64_t v6;
  NSArray *data;
  void *v8;
  uint64_t v9;
  NSString *size;
  id v11;
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
  id v34;
  id v35;
  uint64_t v36;
  objc_super v37;
  _QWORD v38[6];

  v38[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)WLDetailViewController;
  v5 = -[WLDetailViewController init](&v37, sel_init);
  if (v5)
  {
    v36 = 0;
    +[WLDetailItem items:size:](WLDetailItem, "items:size:", v4, &v36);
    v6 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSArray *)v6;

    v35 = v4;
    if (-[NSArray count](v5->_data, "count"))
    {
      -[NSArray objectAtIndexedSubscript:](v5->_data, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_isNothingImported = objc_msgSend(v8, "count") == 0;

    }
    else
    {
      v5->_isNothingImported = 0;
    }
    v34 = objc_alloc_init(MEMORY[0x24BDD1490]);
    objc_msgSend(v34, "stringFromByteCount:", v36);
    v9 = objc_claimAutoreleasedReturnValue();
    size = v5->_size;
    v5->_size = (NSString *)v9;

    v11 = objc_alloc(MEMORY[0x24BDF6E58]);
    v12 = (void *)objc_msgSend(v11, "initWithFrame:style:", 2, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(v12, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("WLDetailViewCell"));
    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v13);

    objc_msgSend(v12, "setDataSource:", v5);
    objc_msgSend(v12, "setDelegate:", v5);
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WLDetailViewController view](v5, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v12);

    v26 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v12, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLDetailViewController view](v5, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v31);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v30;
    objc_msgSend(v12, "leftAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLDetailViewController view](v5, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "leftAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v27);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v25;
    objc_msgSend(v12, "rightAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLDetailViewController view](v5, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "rightAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v17;
    objc_msgSend(v12, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLDetailViewController view](v5, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v38[3] = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activateConstraints:", v22);

    v4 = v35;
  }

  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WLDetailViewController;
  -[WLDetailViewController viewDidLoad](&v6, sel_viewDidLoad);
  WLLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLDetailViewController setTitle:](self, "setTitle:", v3);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_dismiss);
  -[WLDetailViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRightBarButtonItem:", v4);

  -[WLDetailViewController setCustomNavigationTitleView](self, "setCustomNavigationTitleView");
}

- (void)setCustomNavigationTitleView
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
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
  WLDetailViewController *v43;
  void *v44;
  _QWORD v45[4];
  _QWORD v46[5];

  v46[4] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 16.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v7);

  objc_msgSend(v5, "setTextAlignment:", 1);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v8);

  v43 = self;
  -[WLDetailViewController title](self, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v9);

  objc_msgSend(v3, "addSubview:", v5);
  v10 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v11);

  objc_msgSend(v10, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 13.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v12);

  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextColor:", v13);

  objc_msgSend(v10, "setText:", self->_size);
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", v10);
  v31 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v5, "topAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v39);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v37;
  objc_msgSend(v5, "leftAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v3;
  objc_msgSend(v3, "leftAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v33);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v14;
  objc_msgSend(v5, "rightAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v46[2] = v17;
  objc_msgSend(v5, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v46[3] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "activateConstraints:", v21);

  v32 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v10, "topAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v40);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v38;
  objc_msgSend(v10, "leftAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "leftAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v34);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v22;
  objc_msgSend(v10, "rightAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "rightAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v25;
  objc_msgSend(v10, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v45[3] = v28;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "activateConstraints:", v29);

  -[WLDetailViewController navigationItem](v43, "navigationItem");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setTitleView:", v44);

}

- (void)dismiss
{
  -[WLDetailViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  _BOOL8 isNothingImported;

  isNothingImported = self->_isNothingImported;
  return -[NSArray count](self->_data, "count", a3) - isNothingImported;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[NSArray objectAtIndex:](self->_data, "objectAtIndex:", self->_isNothingImported + a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
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

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("WLDetailViewCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "secondarySystemBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  -[NSArray objectAtIndex:](self->_data, "objectAtIndex:", objc_msgSend(v6, "section") + self->_isNothingImported);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v6, "row"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6B80], "valueCellConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "symbolTintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v10, "symbolTintColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTintColor:", v13);

  }
  v15 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(v10, "symbol");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "systemImageNamed:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setImage:", v17);

  objc_msgSend(v10, "text");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v18);

  objc_msgSend(v10, "secondaryText");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSecondaryText:", v19);

  objc_msgSend(v7, "setContentConfiguration:", v11);
  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  if ((unint64_t)self->_isNothingImported + a4 > 1)
  {
    v7 = 0;
  }
  else
  {
    WLLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = self->_isNothingImported + a4;
  if (v7)
  {
    if (v7 != 1)
    {
      v10 = 0;
      goto LABEL_7;
    }
    v8 = CFSTR("DETAIL_IMPORT_ERROR_SECTION_FOOTER_TITLE");
  }
  else
  {
    v8 = CFSTR("DETAIL_SUCCESS_SECTION_FOOTER_TITLE");
  }
  objc_msgSend(MEMORY[0x24BDF69C8], "modelSpecificLocalizedStringKeyForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WLLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", a4, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_size, 0);
}

@end
