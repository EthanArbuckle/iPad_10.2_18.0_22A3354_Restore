@implementation UIPrintInColorOption

- (UIPrintInColorOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  UIPrintInColorOption *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIPrintInColorOption;
  v4 = -[UIPrintOption initWithPrintInfo:printPanelViewController:](&v12, sel_initWithPrintInfo_printPanelViewController_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Print in Color"), CFSTR("Print in Color"), CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintOption setTitle:](v4, "setTitle:", v6);

    -[UIPrintOption printPanelViewController](v4, "printPanelViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "printInteractionController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintInColorOption setCanShowColor:](v4, "setCanShowColor:", objc_msgSend(v8, "_canShowColor"));

    -[UIPrintInColorOption setSavedOutputType:](v4, "setSavedOutputType:", -1);
    -[UIPrintOption printInfo](v4, "printInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:forKeyPath:options:context:", v4, 0x1E9D98618, 0, 0);

    -[UIPrintOption printInfo](v4, "printInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:forKeyPath:options:context:", v4, 0x1E9D986F8, 0, 0);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[UIPrintOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, 0x1E9D98618);

  -[UIPrintOption printInfo](self, "printInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, 0x1E9D986F8);

  v5.receiver = self;
  v5.super_class = (Class)UIPrintInColorOption;
  -[UIPrintInColorOption dealloc](&v5, sel_dealloc);
}

- (BOOL)shouldShow
{
  void *v2;
  void *v3;
  char v4;

  -[UIPrintOption printInfo](self, "printInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPrinter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsColor");

  return v4;
}

- (id)printOptionTableViewCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;

  -[UIPrintOption printPanelViewController](self, "printPanelViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "printOptionsTableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dequeueReusableCellWithIdentifier:", CFSTR("UIPrintOptionCell"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintOption title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v7);

  objc_msgSend(v6, "setSecondaryText:", 0);
  objc_msgSend(v5, "setContentConfiguration:", v6);
  objc_msgSend(v5, "setSelectionStyle:", 0);
  createPrintKitUISwitch(*MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintInColorOption setPrintInColorSwitch:](self, "setPrintInColorSwitch:", v8);

  v9 = -[UIPrintInColorOption printInColor](self, "printInColor");
  -[UIPrintInColorOption printInColorSwitch](self, "printInColorSwitch");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setOn:", v9);

  -[UIPrintInColorOption printInColorSwitch](self, "printInColorSwitch");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel_changePrintInColor_, 4096);

  -[UIPrintInColorOption printInColorSwitch](self, "printInColorSwitch");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessoryView:", v12);

  -[UIPrintOption setTableViewCell:](self, "setTableViewCell:", v5);
  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int64_t v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD block[5];

  if (objc_msgSend(a3, "isEqualToString:", 0x1E9D986F8, a4, a5, a6))
  {
    if (-[UIPrintInColorOption canShowColor](self, "canShowColor"))
    {
      -[UIPrintOption printInfo](self, "printInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "currentPrinter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrintOption setShouldShow:](self, "setShouldShow:", objc_msgSend(v8, "supportsColor"));

    }
    else
    {
      -[UIPrintOption setShouldShow:](self, "setShouldShow:", 0);
    }
    -[UIPrintOption printInfo](self, "printInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentPrinter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "supportsColor");

    v12 = -[UIPrintInColorOption savedOutputType](self, "savedOutputType");
    if (v11)
    {
      if (v12 != -1)
      {
        v13 = -[UIPrintInColorOption savedOutputType](self, "savedOutputType");
        -[UIPrintOption printInfo](self, "printInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setOutputType:", v13);

        -[UIPrintInColorOption setSavedOutputType:](self, "setSavedOutputType:", -1);
      }
    }
    else if (v12 == -1)
    {
      -[UIPrintOption printInfo](self, "printInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrintInColorOption setSavedOutputType:](self, "setSavedOutputType:", objc_msgSend(v15, "outputType"));

      -[UIPrintOption printInfo](self, "printInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setOutputType:", 2);

    }
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__UIPrintInColorOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E9D96D90;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __71__UIPrintInColorOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateFromPrintInfo");
}

- (BOOL)printInColor
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;

  -[UIPrintOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPrinter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "supportsColor"))
  {
    -[UIPrintOption printInfo](self, "printInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "outputType") == 1)
    {
      v6 = 1;
    }
    else
    {
      -[UIPrintOption printInfo](self, "printInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "outputType") == 0;

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setPrintInColor:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v3 = a3;
  -[UIPrintOption printInfo](self, "printInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "outputType");

  -[UIPrintOption printInfo](self, "printInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  if (v6 == 1 && !v3)
  {
    v8 = 3;
LABEL_13:
    objc_msgSend(v7, "setOutputType:", v8);

    return;
  }
  v9 = objc_msgSend(v7, "outputType");

  -[UIPrintOption printInfo](self, "printInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  if (v9 == 3 && v3)
  {
    v8 = 1;
    goto LABEL_13;
  }
  v10 = objc_msgSend(v7, "outputType");

  -[UIPrintOption printInfo](self, "printInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  if (!v10 && !v3)
  {
    v8 = 2;
    goto LABEL_13;
  }
  v11 = objc_msgSend(v7, "outputType");

  if (v11 == 2 && v3)
  {
    -[UIPrintOption printInfo](self, "printInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v7;
    v8 = 0;
    goto LABEL_13;
  }
}

- (void)changePrintInColor:(id)a3
{
  -[UIPrintInColorOption setPrintInColor:](self, "setPrintInColor:", objc_msgSend(a3, "isOn"));
}

- (void)updateFromPrintInfo
{
  _BOOL8 v3;
  id v4;

  v3 = -[UIPrintInColorOption printInColor](self, "printInColor");
  -[UIPrintInColorOption printInColorSwitch](self, "printInColorSwitch");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOn:", v3);

}

- (id)summary
{
  BOOL v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[UIPrintInColorOption printInColor](self, "printInColor");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    v5 = CFSTR("Color");
  else
    v5 = CFSTR("Black & White");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, v5, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (UISwitch)printInColorSwitch
{
  return self->_printInColorSwitch;
}

- (void)setPrintInColorSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_printInColorSwitch, a3);
}

- (BOOL)canShowColor
{
  return self->_canShowColor;
}

- (void)setCanShowColor:(BOOL)a3
{
  self->_canShowColor = a3;
}

- (int64_t)savedOutputType
{
  return self->_savedOutputType;
}

- (void)setSavedOutputType:(int64_t)a3
{
  self->_savedOutputType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printInColorSwitch, 0);
}

@end
