@implementation UIPrintScalingOption

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[UIPrintOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, 0x1E9D98798);

  -[UIPrintOption printPanelViewController](self, "printPanelViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "printOptionsTableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("frame"));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  v7.receiver = self;
  v7.super_class = (Class)UIPrintScalingOption;
  -[UIPrintScalingOption dealloc](&v7, sel_dealloc);
}

- (UIPrintScalingOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  UIPrintScalingOption *v4;
  UIPrintScalingOption *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)UIPrintScalingOption;
  v4 = -[UIPrintOption initWithPrintInfo:printPanelViewController:](&v14, sel_initWithPrintInfo_printPanelViewController_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[UIPrintOption printPanelViewController](v4, "printPanelViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintOption setShouldShow:](v5, "setShouldShow:", objc_msgSend(v6, "shouldShowScaling"));

    -[UIPrintOption printInfo](v5, "printInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:forKeyPath:options:context:", v5, 0x1E9D98798, 0, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintOption printPanelViewController](v5, "printPanelViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v5, sel_printPanelDidChangeSize, CFSTR("UIPrintPanelDidChangeSizeNotification"), v9);

    -[UIPrintOption printPanelViewController](v5, "printPanelViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "printOptionsTableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    -[UIPrintScalingOption setSavedTableViewWidth:](v5, "setSavedTableViewWidth:", v12);

  }
  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD block[5];
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("frame"), a4, a5, a6))
  {
    -[UIPrintOption tableViewCell](self, "tableViewCell");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      -[UIPrintOption printPanelViewController](self, "printPanelViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "printOptionsTableView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "frame");
      v12 = v11;
      -[UIPrintScalingOption savedTableViewWidth](self, "savedTableViewWidth");
      v14 = v13;

      if (v12 != v14)
      {
        -[UIPrintOption printPanelViewController](self, "printPanelViewController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "printOptionsTableView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "frame");
        -[UIPrintScalingOption setSavedTableViewWidth:](self, "setSavedTableViewWidth:", v17);

        -[UIPrintOption printPanelViewController](self, "printPanelViewController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "printOptionsTableView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPrintOption tableViewCell](self, "tableViewCell");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "indexPathForCell:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          -[UIPrintOption printPanelViewController](self, "printPanelViewController");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "printOptionsTableView");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v26[0] = v21;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "reloadRowsAtIndexPaths:withRowAnimation:", v24, 0);

        }
      }
    }
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__UIPrintScalingOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E9D96D90;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __71__UIPrintScalingOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateFromPrintInfo");
}

- (void)printPanelDidChangeSize
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  -[UIPrintOption tableViewCell](self, "tableViewCell");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[UIPrintOption printPanelViewController](self, "printPanelViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "printOptionsTableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v8 = v7;
    -[UIPrintScalingOption savedTableViewWidth](self, "savedTableViewWidth");
    v10 = v9;

    if (v8 != v10)
    {
      -[UIPrintOption printPanelViewController](self, "printPanelViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "printOptionsTableView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "frame");
      -[UIPrintScalingOption setSavedTableViewWidth:](self, "setSavedTableViewWidth:", v13);

      -[UIPrintOption printPanelViewController](self, "printPanelViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "printOptionsTableView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrintOption tableViewCell](self, "tableViewCell");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "indexPathForCell:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        -[UIPrintOption printPanelViewController](self, "printPanelViewController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "printOptionsTableView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "reloadRowsAtIndexPaths:withRowAnimation:", v20, 0);

      }
    }
  }
}

- (id)printOptionTableViewCell
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
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
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
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  uint64_t v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v70;
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[3];

  v73[2] = *MEMORY[0x1E0C80C00];
  -[UIPrintOption printPanelViewController](self, "printPanelViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "printOptionsTableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dequeueReusableCellWithIdentifier:", CFSTR("UIPrintOptionCell"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Scaling"), CFSTR("Scaling"), CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Scaling"), CFSTR("Scaling"), CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v11);

  objc_msgSend(v5, "setContentConfiguration:", v9);
  objc_msgSend(v5, "setSelectionStyle:", 0);
  v12 = objc_alloc(MEMORY[0x1E0DC3DB8]);
  v13 = *MEMORY[0x1E0C9D648];
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v15 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v17 = (void *)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E0C9D648], v14, v15, v16);
  -[UIPrintScalingOption setScaleTextField:](self, "setScaleTextField:", v17);

  -[UIPrintScalingOption scaleTextField](self, "scaleTextField");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIPrintScalingOption scaleTextField](self, "scaleTextField");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDelegate:", self);

  -[UIPrintScalingOption scaleTextField](self, "scaleTextField");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTextAlignment:", 1);

  -[UIPrintScalingOption scaleTextField](self, "scaleTextField");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setKeyboardType:", 4);

  -[UIPrintScalingOption scaleTextField](self, "scaleTextField");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBorderStyle:", 3);

  objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemGroupedBackgroundColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintScalingOption scaleTextField](self, "scaleTextField");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setBackgroundColor:", v23);

  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CF0]), "initWithFrame:", v13, v14, v15, v16);
  -[UIPrintScalingOption setScaleStepper:](self, "setScaleStepper:", v25);

  -[UIPrintScalingOption scaleStepper](self, "scaleStepper");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIPrintScalingOption scaleStepper](self, "scaleStepper");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setMinimumValue:", 1.0);

  -[UIPrintScalingOption scaleStepper](self, "scaleStepper");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setMaximumValue:", 400.0);

  -[UIPrintScalingOption scaleStepper](self, "scaleStepper");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addTarget:action:forControlEvents:", self, sel_paperScaleStepperChanged_, 4096);

  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v13, v14, v15, v16);
  objc_msgSend(v30, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v30, "setUserInteractionEnabled:", 1);
  -[UIPrintScalingOption scaleTextField](self, "scaleTextField");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addSubview:", v31);

  -[UIPrintScalingOption scaleStepper](self, "scaleStepper");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addSubview:", v32);

  v72[0] = CFSTR("scaleText");
  -[UIPrintScalingOption scaleTextField](self, "scaleTextField");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v72[1] = CFSTR("scaleStepper");
  v73[0] = v33;
  -[UIPrintScalingOption scaleStepper](self, "scaleStepper");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v73[1] = v34;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[scaleText]-[scaleStepper]|"), 0, 0, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addConstraints:", v36);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[scaleText]|"), 0, 0, v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addConstraints:", v37);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[scaleStepper]|"), 0, 0, v35);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addConstraints:", v38);

  v39 = (void *)MEMORY[0x1E0CB3718];
  -[UIPrintScalingOption scaleTextField](self, "scaleTextField");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v40, 7, 0, 0, 0, 1.0, 76.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addConstraint:", v41);

  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v13, v14, v15, v16);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("Scaling"), CFSTR("Scaling"), CFSTR("Localizable"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setText:", v44);

  v70 = v9;
  objc_msgSend(v9, "textProperties");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "font");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setFont:", v46);

  objc_msgSend(v42, "setNumberOfLines:", 1);
  objc_msgSend(v42, "sizeToFit");
  -[UIPrintOption printPanelViewController](self, "printPanelViewController");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "printOptionsTableView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "rectForRowAtIndexPath:", v49);
  v51 = v50;

  objc_msgSend(v42, "frame");
  v53 = v52;
  objc_msgSend(v30, "frame");
  if (v53 > v51 - v54 + -48.0)
  {
    -[UIPrintScalingOption scaleStepper](self, "scaleStepper");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "removeFromSuperview");

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[scaleText]|"), 0, 0, v35);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addConstraints:", v56);

  }
  objc_msgSend(v30, "layoutIfNeeded");
  objc_msgSend(v30, "bounds");
  objc_msgSend(v30, "setFrame:");
  v57 = objc_alloc(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v30, "bounds");
  v58 = (void *)objc_msgSend(v57, "initWithFrame:");
  objc_msgSend(v58, "setUserInteractionEnabled:", 1);
  objc_msgSend(v58, "addSubview:", v30);
  objc_msgSend(v5, "setAccessoryView:", v58);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v59, "userInterfaceIdiom");

  if (!v60)
  {
    v61 = objc_alloc_init(MEMORY[0x1E0DC3E68]);
    objc_msgSend(v61, "sizeToFit");
    v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_dismissKeyboard);
    v71[0] = v62;
    v71[1] = v63;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 2);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setItems:", v64);

    -[UIPrintScalingOption scaleTextField](self, "scaleTextField");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setInputAccessoryView:", v61);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = *MEMORY[0x1E0DC54D0];
  -[UIPrintScalingOption scaleTextField](self, "scaleTextField");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "addObserver:selector:name:object:", self, sel_paperScaleTextFieldDidChange, v67, v68);

  -[UIPrintScalingOption updateFromPrintInfo](self, "updateFromPrintInfo");
  -[UIPrintOption setTableViewCell:](self, "setTableViewCell:", v5);

  return v5;
}

- (void)updateFromPrintInfo
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[UIPrintOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scalingFactor");
  v5 = v4 * 100.0;
  v6 = round(v4 * 100.0);

  -[UIPrintScalingOption scaleStepper](self, "scaleStepper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:", (double)(uint64_t)v6);

  -[UIPrintScalingOption scaleTextField](self, "scaleTextField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEditing");

  if ((v9 & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("%ld%%"), CFSTR("%ld%%"), CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v11, llround(v5));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintScalingOption scaleTextField](self, "scaleTextField");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v12);

  }
}

- (void)saveScaleValueToPrintInfo:(int64_t)a3
{
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = (double)a3 / 100.0;
  -[UIPrintOption printInfo](self, "printInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scalingFactor");
  v7 = v6;

  if (v4 != v7)
  {
    -[UIPrintOption printInfo](self, "printInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setScalingFactor:", v4);

    -[UIPrintOption printInfo](self, "printInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "printPaper");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setScalingFactor:", v4);

    -[UIPrintOption printPanelViewController](self, "printPanelViewController");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "printInteractionController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "paper");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setScalingFactor:", v4);

  }
}

- (void)paperScaleStepperChanged:(id)a3
{
  double v4;

  objc_msgSend(a3, "value");
  -[UIPrintScalingOption saveScaleValueToPrintInfo:](self, "saveScaleValueToPrintInfo:", vcvtmd_s64_f64(v4));
}

- (void)paperScaleTextFieldDidChange
{
  void *v3;
  void *v4;
  double v5;
  id v6;

  -[UIPrintScalingOption scaleTextField](self, "scaleTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (double)objc_msgSend(v4, "integerValue");

  -[UIPrintScalingOption scaleStepper](self, "scaleStepper");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:", (double)(uint64_t)v5);

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  if (objc_msgSend(v10, "length"))
  {
    if (objc_msgSend(v9, "keyboardType") == 4
      && (objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v11, "invertedSet"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v10, "rangeOfCharacterFromSet:", v12),
          v12,
          v11,
          v13 != 0x7FFFFFFFFFFFFFFFLL))
    {
      v16 = 0;
    }
    else
    {
      objc_msgSend(v9, "text");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByReplacingCharactersInRange:withString:", location, length, v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if ((unint64_t)objc_msgSend(v15, "length") <= 4)
      {
        v17 = (double)objc_msgSend(v15, "integerValue");
        -[UIPrintScalingOption scaleStepper](self, "scaleStepper");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "minimumValue");
        if (v19 <= v17)
        {
          -[UIPrintScalingOption scaleStepper](self, "scaleStepper");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "maximumValue");
          v16 = v21 >= v17;

        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
  }
  else
  {
    v16 = 1;
  }

  return v16;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4;
  void *v5;
  double v6;
  unint64_t v7;
  id v8;

  v4 = a3;
  -[UIPrintOption printInfo](self, "printInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scalingFactor");
  *(float *)&v6 = v6 * 100.0;
  v7 = llroundf(*(float *)&v6);

  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%ld"), v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v8);

}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (v6)
    v7 = v6;
  else
    v7 = 100;
  -[UIPrintScalingOption saveScaleValueToPrintInfo:](self, "saveScaleValueToPrintInfo:", v7);
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("%ld%%"), CFSTR("%ld%%"), CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringWithFormat:", v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v11);

  -[UIPrintScalingOption scaleStepper](self, "scaleStepper");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setValue:", (double)v7);

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
  return 1;
}

- (BOOL)keyboardShowing
{
  void *v2;
  char v3;

  -[UIPrintScalingOption scaleTextField](self, "scaleTextField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFirstResponder");

  return v3;
}

- (void)dismissKeyboard
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[UIPrintScalingOption scaleTextField](self, "scaleTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintScalingOption scaleTextField](self, "scaleTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintScalingOption scaleTextField](self, "scaleTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginningOfDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintScalingOption scaleTextField](self, "scaleTextField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "beginningOfDocument");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textRangeFromPosition:toPosition:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSelectedTextRange:", v9);

  -[UIPrintScalingOption scaleTextField](self, "scaleTextField");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resignFirstResponder");

}

- (id)textField:(id)a3 editMenuForCharactersInRange:(_NSRange)a4 suggestedActions:(id)a5
{
  id v6;
  void *v7;
  char v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  -[UIPrintScalingOption scaleTextField](self, "scaleTextField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEditing");

  if ((v8 & 1) != 0)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      v13 = *MEMORY[0x1E0DC5120];
LABEL_4:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v15 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * v14);
        objc_msgSend(v15, "identifier", (_QWORD)v21);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", v13);

        if ((v17 & 1) != 0)
          break;

        if (v11 == ++v14)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v11)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      v15 = 0;
    }

  }
  else
  {
    v18 = (void *)MEMORY[0x1E0DC39D0];
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "menuWithChildren:", v19);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

- (UIStepper)scaleStepper
{
  return self->_scaleStepper;
}

- (void)setScaleStepper:(id)a3
{
  objc_storeStrong((id *)&self->_scaleStepper, a3);
}

- (UITextField)scaleTextField
{
  return self->_scaleTextField;
}

- (void)setScaleTextField:(id)a3
{
  objc_storeStrong((id *)&self->_scaleTextField, a3);
}

- (double)savedTableViewWidth
{
  return self->_savedTableViewWidth;
}

- (void)setSavedTableViewWidth:(double)a3
{
  self->_savedTableViewWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scaleTextField, 0);
  objc_storeStrong((id *)&self->_scaleStepper, 0);
}

@end
