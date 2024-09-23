@implementation UIPrintTwoSidedOption

- (UIPrintTwoSidedOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  UIPrintTwoSidedOption *v4;
  UIPrintTwoSidedOption *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIPrintTwoSidedOption;
  v4 = -[UIPrintOption initWithPrintInfo:printPanelViewController:](&v9, sel_initWithPrintInfo_printPanelViewController_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[UIPrintOption printInfo](v4, "printInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v5, 0x1E9D98658, 0, 0);

    -[UIPrintOption printInfo](v5, "printInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:forKeyPath:options:context:", v5, 0x1E9D986F8, 0, 0);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[UIPrintOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, 0x1E9D98658);

  -[UIPrintOption printInfo](self, "printInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, 0x1E9D986F8);

  v5.receiver = self;
  v5.super_class = (Class)UIPrintTwoSidedOption;
  -[UIPrintTwoSidedOption dealloc](&v5, sel_dealloc);
}

- (BOOL)shouldShow
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[UIPrintOption printPanelViewController](self, "printPanelViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "shouldShowDuplex"))
  {
    -[UIPrintOption printInfo](self, "printInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentPrinter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "supportsDuplex");

  }
  else
  {
    v6 = 0;
  }

  return v6;
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
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;

  -[UIPrintOption printPanelViewController](self, "printPanelViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "printOptionsTableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dequeueReusableCellWithIdentifier:", CFSTR("UIPrintOptionCell"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Double-sided"), CFSTR("Double-sided"), CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v8);

  objc_msgSend(v6, "setSecondaryText:", 0);
  objc_msgSend(v5, "setContentConfiguration:", v6);
  objc_msgSend(v5, "setSelectionStyle:", 0);
  createPrintKitUISwitch(*MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintTwoSidedOption setDuplexSwitch:](self, "setDuplexSwitch:", v9);

  -[UIPrintTwoSidedOption duplexSwitch](self, "duplexSwitch");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPreferredStyle:", 1);

  -[UIPrintOption printInfo](self, "printInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "duplex") != 0;
  -[UIPrintTwoSidedOption duplexSwitch](self, "duplexSwitch");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setOn:", v12);

  -[UIPrintTwoSidedOption duplexSwitch](self, "duplexSwitch");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addTarget:action:forControlEvents:", self, sel_changeDuplex_, 4096);

  -[UIPrintTwoSidedOption duplexSwitch](self, "duplexSwitch");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessoryView:", v15);

  -[UIPrintOption setTableViewCell:](self, "setTableViewCell:", v5);
  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  void *v8;
  void *v9;
  _QWORD block[5];

  if (objc_msgSend(a3, "isEqualToString:", 0x1E9D986F8, a4, a5, a6))
  {
    -[UIPrintOption printInfo](self, "printInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "outputType") & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      -[UIPrintOption setShouldShow:](self, "setShouldShow:", 0);
    }
    else
    {
      -[UIPrintOption printInfo](self, "printInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "currentPrinter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrintOption setShouldShow:](self, "setShouldShow:", objc_msgSend(v9, "supportsDuplex"));

    }
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__UIPrintTwoSidedOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E9D96D90;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __72__UIPrintTwoSidedOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateFromPrintInfo");
}

- (void)updateFromPrintInfo
{
  _BOOL8 v3;
  void *v4;
  id v5;

  -[UIPrintOption printInfo](self, "printInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "duplex") != 0;
  -[UIPrintTwoSidedOption duplexSwitch](self, "duplexSwitch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOn:", v3);

}

- (void)changeDuplex:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = objc_msgSend(a3, "isOn");
  -[UIPrintOption printInfo](self, "printInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDuplex:", v4);

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
  v3 = objc_msgSend(v2, "duplex");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR("Double-sided");
  else
    v6 = CFSTR("Single-sided");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, v6, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (UISwitch)duplexSwitch
{
  return self->_duplexSwitch;
}

- (void)setDuplexSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_duplexSwitch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duplexSwitch, 0);
}

@end
