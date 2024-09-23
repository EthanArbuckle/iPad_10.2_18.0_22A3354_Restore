@implementation UIPrintRangeView

- (UIPrintRangeView)initWithFrame:(CGRect)a3 printInfo:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  UIPrintRangeView *v10;
  UIPrintRangeView *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)UIPrintRangeView;
  v10 = -[UIPrintRangeView initWithFrame:](&v17, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[UIPrintRangeView setPrintInfo:](v10, "setPrintInfo:", v9);
    objc_msgSend(v9, "pageRanges");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13 >= 2)
    {
      objc_msgSend(v9, "pageRanges");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrintRangeView setSavedMultiPageRanges:](v11, "setSavedMultiPageRanges:", v14);

    }
    -[UIPrintRangeView loadViews](v11, "loadViews");
    -[UIPrintRangeView printInfo](v11, "printInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:forKeyPath:options:context:", v11, 0x1E9D98758, 0, 0);

  }
  return v11;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[UIPrintRangeView printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, 0x1E9D98758);

  v4.receiver = self;
  v4.super_class = (Class)UIPrintRangeView;
  -[UIPrintRangeView dealloc](&v4, sel_dealloc);
}

- (void)loadViews
{
  void *v3;
  objc_class *v4;
  UIPrintRangeView *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  objc_class *v13;
  UIPrintRangeView *v14;
  void *v15;
  objc_class *v16;
  UIPrintRangeView *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  id v25;
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
  id v38;
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
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  void *v68;
  uint64_t v69;
  double v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  const __CFString *v77;
  void *v78;
  _QWORD v79[5];
  _QWORD v80[7];

  v80[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintRangeView setBackgroundColor:](self, "setBackgroundColor:", v3);

  v4 = (objc_class *)MEMORY[0x1E0DC3D48];
  v5 = self;
  v6 = [v4 alloc];
  v7 = *MEMORY[0x1E0C9D648];
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v11 = (void *)objc_msgSend(v6, "initWithFrame:style:", 2, *MEMORY[0x1E0C9D648], v8, v9, v10);
  objc_msgSend(v11, "setDataSource:", v5);
  objc_msgSend(v11, "setDelegate:", v5);

  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v11, "setEstimatedSectionHeaderHeight:", 8.0);
  objc_msgSend(v11, "setEstimatedSectionFooterHeight:", 100.0);
  -[UIPrintRangeView setTableView:](v5, "setTableView:", v11);

  -[UIPrintRangeView tableView](v5, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintRangeView addSubview:](v5, "addSubview:", v12);

  v13 = (objc_class *)MEMORY[0x1E0DC3AE0];
  v14 = v5;
  v15 = (void *)objc_msgSend([v13 alloc], "initWithFrame:", v7, v8, v9, v10);
  objc_msgSend(v15, "setDataSource:", v14);
  objc_msgSend(v15, "setDelegate:", v14);

  objc_msgSend(v15, "setBackgroundColor:", 0);
  objc_msgSend(v15, "setOpaque:", 0);
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIPrintRangeView setFromPicker:](v14, "setFromPicker:", v15);

  v16 = (objc_class *)MEMORY[0x1E0DC3AE0];
  v17 = v14;
  v18 = (void *)objc_msgSend([v16 alloc], "initWithFrame:", v7, v8, v9, v10);
  objc_msgSend(v18, "setDataSource:", v17);
  objc_msgSend(v18, "setDelegate:", v17);

  objc_msgSend(v18, "setBackgroundColor:", 0);
  objc_msgSend(v18, "setOpaque:", 0);
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIPrintRangeView setToPicker:](v17, "setToPicker:", v18);

  v19 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("to"), CFSTR("to"), CFSTR("Localizable"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setText:", v21);

  objc_msgSend(v19, "setOpaque:", 0);
  objc_msgSend(v19, "setBackgroundColor:", 0);
  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B58]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFont:", v22);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTextColor:", v23);

  objc_msgSend(v19, "setTextAlignment:", 1);
  objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v24) = 1148846080;
  objc_msgSend(v19, "setContentHuggingPriority:forAxis:", 0, v24);
  v25 = objc_alloc(MEMORY[0x1E0DC3F10]);
  -[UIPrintRangeView toPicker](v17, "toPicker");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "frame");
  v27 = (void *)objc_msgSend(v25, "initWithFrame:");

  objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIPrintRangeView fromPicker](v17, "fromPicker");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addSubview:", v28);

  -[UIPrintRangeView toPicker](v17, "toPicker");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addSubview:", v29);

  objc_msgSend(v27, "addSubview:", v19);
  v79[0] = CFSTR("table");
  -[UIPrintRangeView tableView](v17, "tableView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = v30;
  v80[1] = v27;
  v79[1] = CFSTR("pickers");
  v79[2] = CFSTR("from");
  -[UIPrintRangeView fromPicker](v17, "fromPicker");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v80[2] = v31;
  v79[3] = CFSTR("to");
  -[UIPrintRangeView toPicker](v17, "toPicker");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v79[4] = CFSTR("label");
  v80[3] = v32;
  v80[4] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-20-[from]|"), 0, 0, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addConstraints:", v34);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-20-[label]|"), 0, 0, v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addConstraints:", v35);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-20-[to]|"), 0, 0, v33);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addConstraints:", v36);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[table]|"), 0, 0, v33);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintRangeView addConstraints:](v17, "addConstraints:", v37);

  v38 = objc_alloc(MEMORY[0x1E0DC3F10]);
  -[UIPrintRangeView toPicker](v17, "toPicker");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "frame");
  v40 = (void *)objc_msgSend(v38, "initWithFrame:");
  -[UIPrintRangeView setPickerView:](v17, "setPickerView:", v40);

  -[UIPrintRangeView pickerView](v17, "pickerView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "addSubview:", v27);

  -[UIPrintRangeView pickerView](v17, "pickerView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[pickers]|"), 0, 0, v33);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addConstraints:", v43);

  -[UIPrintRangeView pickerView](v17, "pickerView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "centerXAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintRangeView pickerView](v17, "pickerView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "centerXAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "addConstraint:", v48);

  v49 = (void *)MEMORY[0x1E0CB3718];
  v77 = CFSTR("tableviewheight");
  v50 = (void *)MEMORY[0x1E0CB37E8];
  -[UIPrintRangeView tableView](v17, "tableView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintRangeView frame](v17, "frame");
  objc_msgSend(v51, "sizeThatFits:", v52, v53);
  *(float *)&v55 = v54;
  objc_msgSend(v50, "numberWithFloat:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v56;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-0-[table]|"), 0, v57, v33);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintRangeView addConstraints:](v17, "addConstraints:", v58);

  v59 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B50]);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setFont:", v60);

  -[UIPrintRangeView printInfo](v17, "printInfo");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "pageCount");

  if (v62 < 1)
  {
    v70 = 32.0;
  }
  else
  {
    v63 = 0;
    v64 = 0.0;
    do
    {
      LocalizedInteger(++v63);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setText:", v65);

      objc_msgSend(v59, "intrinsicContentSize");
      v67 = ceil(v66);
      if (v67 >= v64)
        v64 = v67;
      -[UIPrintRangeView printInfo](v17, "printInfo");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v68, "pageCount");

    }
    while (v63 < v69);
    v70 = v64 + 32.0;
  }
  if (v70 < 72.0)
    v70 = 72.0;
  -[UIPrintRangeView setPickerWidth:](v17, "setPickerWidth:", v70);
  v71 = (void *)MEMORY[0x1E0CB3940];
  -[UIPrintRangeView pickerWidth](v17, "pickerWidth");
  v73 = v72;
  -[UIPrintRangeView pickerWidth](v17, "pickerWidth");
  objc_msgSend(v71, "stringWithFormat:", CFSTR("H:|-[from(==%f)]-%f-[label]-%f-[to(==%f)]-|"), v73, 0x4020000000000000, 0x4020000000000000, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", v75, 0, 0, v33);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addConstraints:", v76);

  -[UIPrintRangeView updatePageRangeView](v17, "updatePageRangeView");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__UIPrintRangeView_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E9D96D90;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __67__UIPrintRangeView_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updatePageRangeView");
}

- (void)updatePageRangeView
{
  __assert_rtn("-[UIPrintRangeView updatePageRangeView]", "UIPrintMoreOptions.m", 582, "dispatch_get_main_queue() == dispatch_get_current_queue()");
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[UIPrintRangeView savedMultiPageRanges](self, "savedMultiPageRanges", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = 3;
  else
    v5 = 2;

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIPrintRangeView *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
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
  uint64_t v41;
  void *v43;
  void *v44;
  id v45;

  v45 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("PageRangeViewCell"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, CFSTR("PageRangeViewCell"));
  objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintRangeView printInfo](self, "printInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pageRanges");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  -[UIPrintRangeView printInfo](self, "printInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 > 1)
  {
    v17 = objc_msgSend(v10, "pageCount");
    v18 = 0;
  }
  else
  {
    objc_msgSend(v10, "pageRanges");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = self;
    v15 = objc_msgSend(v13, "rangeValue");
    v17 = v16;

    v18 = v15;
    self = v14;
  }

  if (!objc_msgSend(v45, "row"))
  {
    -[UIPrintRangeView printInfo](self, "printInfo");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 == objc_msgSend(v35, "pageCount"))
    {
      -[UIPrintRangeView printInfo](self, "printInfo");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "pageRanges");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (unint64_t)objc_msgSend(v37, "count") < 2;

    }
    else
    {
      v22 = 0;
    }

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("All Pages"), CFSTR("All Pages"), CFSTR("Localizable"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setText:", v40);

    objc_msgSend(v44, "setSecondaryText:", 0);
    goto LABEL_18;
  }
  if (objc_msgSend(v45, "row") == 1)
  {
    -[UIPrintRangeView savedMultiPageRanges](self, "savedMultiPageRanges");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[UIPrintRangeView printInfo](self, "printInfo");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "pageRanges");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (unint64_t)objc_msgSend(v21, "count") > 1;

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Custom Range"), CFSTR("Custom Range"), CFSTR("Localizable"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setText:", v24);

      -[UIPrintRangeView savedMultiPageRanges](self, "savedMultiPageRanges");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      SummaryForRange(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setSecondaryText:", v26);

      objc_msgSend(v44, "secondaryTextProperties");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setNumberOfLines:", 0);

LABEL_18:
      objc_msgSend(v6, "setSelectionStyle:", 3);
      goto LABEL_19;
    }
  }
  -[UIPrintRangeView printInfo](self, "printInfo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v17 < objc_msgSend(v28, "pageCount");

  LocalizedUnsignedInteger(v18 + 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  LocalizedUnsignedInteger(v17 + v18);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v17 == 1)
  {
    objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("Page %@"), CFSTR("Page %@"), CFSTR("Localizable"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("Pages %@-%@"), CFSTR("Pages %@-%@"), CFSTR("Localizable"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v30;
  }
  objc_msgSend(v31, "stringWithFormat:", v34, v29, v43);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setText:", v38);

  objc_msgSend(v44, "setSecondaryText:", 0);
  objc_msgSend(v6, "setSelectionStyle:", 0);

LABEL_19:
  objc_msgSend(v6, "setContentConfiguration:", v44);
  if (v22)
    v41 = 3;
  else
    v41 = 0;
  objc_msgSend(v6, "setAccessoryType:", v41);

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
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
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (!objc_msgSend(v5, "row"))
  {
    -[UIPrintRangeView printInfo](self, "printInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "pageCount");

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", 0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintRangeView printInfo](self, "printInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPageRanges:", v9);

    -[UIPrintRangeView fromPicker](self, "fromPicker");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "selectRow:inComponent:animated:", 0, 0, 1);

    -[UIPrintRangeView toPicker](self, "toPicker");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "selectRow:inComponent:animated:", v7 - 1, 0, 1);

    -[UIPrintRangeView reloadTableView](self, "reloadTableView");
  }
  if (objc_msgSend(v5, "row") == 1)
  {
    -[UIPrintRangeView savedMultiPageRanges](self, "savedMultiPageRanges");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[UIPrintRangeView savedMultiPageRanges](self, "savedMultiPageRanges");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrintRangeView printInfo](self, "printInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setPageRanges:", v14);

      -[UIPrintRangeView reloadTableView](self, "reloadTableView");
    }
  }

}

- (void)reloadTableView
{
  void *v3;
  id v4;

  -[UIPrintRangeView tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

  -[UIPrintRangeView tableView](self, "tableView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[UIPrintRangeView printInfo](self, "printInfo", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "pageCount");

  return v5;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  return LocalizedInteger(a4 + 1);
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[UIPrintRangeView fromPicker](self, "fromPicker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "selectedRowInComponent:", 0);

  -[UIPrintRangeView toPicker](self, "toPicker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "selectedRowInComponent:", 0);

  -[UIPrintRangeView fromPicker](self, "fromPicker");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[UIPrintRangeView toPicker](self, "toPicker");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11 == v6 && v8 > v10)
  {
    objc_msgSend(v12, "selectRow:inComponent:animated:", v8, 0, 1);
    v10 = v8;
LABEL_7:

    goto LABEL_8;
  }

  if (v13 == v6 && v8 > v10)
  {
    -[UIPrintRangeView fromPicker](self, "fromPicker");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "selectRow:inComponent:animated:", v10, 0, 1);
    v8 = v10;
    goto LABEL_7;
  }
LABEL_8:
  -[UIPrintRangeView printInfo](self, "printInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pageRanges");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rangeValue");

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v8, v10 - v8 + 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintRangeView printInfo](self, "printInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPageRanges:", v18);

  -[UIPrintRangeView reloadTableView](self, "reloadTableView");
}

- (UIView)pickerView
{
  return self->_pickerView;
}

- (void)setPickerView:(id)a3
{
  objc_storeStrong((id *)&self->_pickerView, a3);
}

- (UIPickerView)fromPicker
{
  return self->_fromPicker;
}

- (void)setFromPicker:(id)a3
{
  objc_storeStrong((id *)&self->_fromPicker, a3);
}

- (UIPickerView)toPicker
{
  return self->_toPicker;
}

- (void)setToPicker:(id)a3
{
  objc_storeStrong((id *)&self->_toPicker, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (NSArray)savedMultiPageRanges
{
  return self->_savedMultiPageRanges;
}

- (void)setSavedMultiPageRanges:(id)a3
{
  objc_storeStrong((id *)&self->_savedMultiPageRanges, a3);
}

- (double)pickerWidth
{
  return self->_pickerWidth;
}

- (void)setPickerWidth:(double)a3
{
  self->_pickerWidth = a3;
}

- (UIPrintInfo)printInfo
{
  return self->_printInfo;
}

- (void)setPrintInfo:(id)a3
{
  objc_storeStrong((id *)&self->_printInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printInfo, 0);
  objc_storeStrong((id *)&self->_savedMultiPageRanges, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_toPicker, 0);
  objc_storeStrong((id *)&self->_fromPicker, 0);
  objc_storeStrong((id *)&self->_pickerView, 0);
}

@end
