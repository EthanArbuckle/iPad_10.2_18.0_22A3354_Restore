@implementation UIPrintOrientationOption

- (UIPrintOrientationOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  UIPrintOrientationOption *v4;
  UIPrintOrientationOption *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIPrintOrientationOption;
  v4 = -[UIPrintOption initWithPrintInfo:printPanelViewController:](&v9, sel_initWithPrintInfo_printPanelViewController_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[UIPrintOption printPanelViewController](v4, "printPanelViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintOption setShouldShow:](v5, "setShouldShow:", objc_msgSend(v6, "shouldShowOrientation"));

    -[UIPrintOption printInfo](v5, "printInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:forKeyPath:options:context:", v5, 0x1E9D98638, 0, 0);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[UIPrintOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, 0x1E9D98638);

  v4.receiver = self;
  v4.super_class = (Class)UIPrintOrientationOption;
  -[UIPrintOrientationOption dealloc](&v4, sel_dealloc);
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
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  -[UIPrintOption printPanelViewController](self, "printPanelViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "printOptionsTableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dequeueReusableCellWithIdentifier:", CFSTR("UIPrintOptionCell"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setSelectionStyle:", 0);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Orientation"), CFSTR("Orientation"), CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Orientation"), CFSTR("Orientation"), CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v11);

  -[UIPrintOrientationOption summary](self, "summary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSecondaryText:", v12);

  objc_msgSend(v5, "setContentConfiguration:", v9);
  v13 = objc_alloc(MEMORY[0x1E0DC3C58]);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.up.and.person.rectangle.portrait"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v14;
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.up.and.person.rectangle.turn.right"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v13, "initWithItems:", v16);
  -[UIPrintOrientationOption setOrientationSegmentedControl:](self, "setOrientationSegmentedControl:", v17);

  -[UIPrintOption printInfo](self, "printInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "orientation") != 0;
  -[UIPrintOrientationOption orientationSegmentedControl](self, "orientationSegmentedControl");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setSelectedSegmentIndex:", v19);

  -[UIPrintOrientationOption orientationSegmentedControl](self, "orientationSegmentedControl");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addTarget:action:forControlEvents:", self, sel_changeOrientation_, 4096);

  -[UIPrintOrientationOption orientationSegmentedControl](self, "orientationSegmentedControl");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessoryView:", v22);

  -[UIPrintOption setTableViewCell:](self, "setTableViewCell:", v5);
  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__UIPrintOrientationOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E9D96D90;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __75__UIPrintOrientationOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateFromPrintInfo");
}

- (void)updateFromPrintInfo
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[UIPrintOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "orientation") != 0;
  -[UIPrintOrientationOption orientationSegmentedControl](self, "orientationSegmentedControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectedSegmentIndex:", v4);

  -[UIPrintOption tableViewCell](self, "tableViewCell");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentConfiguration");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[UIPrintOrientationOption summary](self, "summary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSecondaryText:", v7);

  -[UIPrintOption tableViewCell](self, "tableViewCell");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentConfiguration:", v9);

}

- (void)changeOrientation:(id)a3
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = objc_msgSend(a3, "selectedSegmentIndex") != 0;
  -[UIPrintOption printInfo](self, "printInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "printPaper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setPaperOrientation:", v4);

  -[UIPrintOption printPanelViewController](self, "printPanelViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "printInteractionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "paper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setPaperOrientation:", v4);

  -[UIPrintOption printInfo](self, "printInfo");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setOrientation:", v4);

}

- (id)summary
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  -[UIPrintOption printInfo](self, "printInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "orientation");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR("Landscape");
  else
    v6 = CFSTR("Portrait");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, v6, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (UISegmentedControl)orientationSegmentedControl
{
  return self->_orientationSegmentedControl;
}

- (void)setOrientationSegmentedControl:(id)a3
{
  objc_storeStrong((id *)&self->_orientationSegmentedControl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orientationSegmentedControl, 0);
}

@end
