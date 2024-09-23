@implementation UIPrintFlipHorizontalOption

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[UIPrintOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, 0x1E9D98958);

  v4.receiver = self;
  v4.super_class = (Class)UIPrintFlipHorizontalOption;
  -[UIPrintFlipHorizontalOption dealloc](&v4, sel_dealloc);
}

- (UIPrintFlipHorizontalOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  UIPrintFlipHorizontalOption *v4;
  UIPrintFlipHorizontalOption *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIPrintFlipHorizontalOption;
  v4 = -[UIPrintOption initWithPrintInfo:printPanelViewController:](&v8, sel_initWithPrintInfo_printPanelViewController_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[UIPrintOption printInfo](v4, "printInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v5, 0x1E9D98958, 0, 0);

  }
  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__UIPrintFlipHorizontalOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E9D96D90;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __78__UIPrintFlipHorizontalOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateFromPrintInfo");
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
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[UIPrintOption printPanelViewController](self, "printPanelViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "printOptionsTableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dequeueReusableCellWithIdentifier:", CFSTR("UIPrintOptionCell"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setSelectionStyle:", 0);
  objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Flip Horizontally"), CFSTR("Flip Horizontally"), CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v8);

  objc_msgSend(v5, "setContentConfiguration:", v6);
  createPrintKitUISwitch(*MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintFlipHorizontalOption setFlipHorizontalSwitch:](self, "setFlipHorizontalSwitch:", v9);

  -[UIPrintOption printInfo](self, "printInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "flipHorizontal");
  -[UIPrintFlipHorizontalOption flipHorizontalSwitch](self, "flipHorizontalSwitch");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setOn:", v11);

  -[UIPrintFlipHorizontalOption flipHorizontalSwitch](self, "flipHorizontalSwitch");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel_flipHorizontalSelected_, 4096);

  -[UIPrintFlipHorizontalOption flipHorizontalSwitch](self, "flipHorizontalSwitch");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessoryView:", v14);

  -[UIPrintOption setTableViewCell:](self, "setTableViewCell:", v5);
  -[UIPrintFlipHorizontalOption summaryString](self, "summaryString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintOption setSummary:](self, "setSummary:", v15);

  return v5;
}

- (void)updateFromPrintInfo
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[UIPrintOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "flipHorizontal");
  -[UIPrintFlipHorizontalOption flipHorizontalSwitch](self, "flipHorizontalSwitch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOn:", v4);

  -[UIPrintFlipHorizontalOption summaryString](self, "summaryString");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UIPrintOption setSummary:](self, "setSummary:", v6);

}

- (void)flipHorizontalSelected:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = objc_msgSend(a3, "isOn");
  -[UIPrintOption printInfo](self, "printInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFlipHorizontal:", v4);

}

- (id)summaryString
{
  void *v2;
  int v3;
  void *v4;
  void *v5;

  -[UIPrintOption printInfo](self, "printInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "flipHorizontal");

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Flipped Horizontally"), CFSTR("Flipped Horizontally"), CFSTR("Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (UISwitch)flipHorizontalSwitch
{
  return self->_flipHorizontalSwitch;
}

- (void)setFlipHorizontalSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_flipHorizontalSwitch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flipHorizontalSwitch, 0);
}

@end
