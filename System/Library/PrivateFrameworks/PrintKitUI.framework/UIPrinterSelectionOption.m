@implementation UIPrinterSelectionOption

- (UIPrinterSelectionOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  UIPrinterSelectionOption *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIPrinterSelectionOption;
  v4 = -[UIPrintOption initWithPrintInfo:printPanelViewController:](&v8, sel_initWithPrintInfo_printPanelViewController_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PRINTER_OPTION_TITLE"), CFSTR("Printer"), CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintOption setTitle:](v4, "setTitle:", v6);

  }
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

  -[UIPrintOption printPanelViewController](self, "printPanelViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "printOptionsTableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dequeueReusableCellWithIdentifier:", CFSTR("UIPrintOptionCell"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPrintOption setTableViewCell:](self, "setTableViewCell:", v5);
  objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintOption title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v7);

  -[UIPrinterSelectionOption summary](self, "summary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSecondaryText:", v8);

  objc_msgSend(v5, "setContentConfiguration:", v6);
  if (-[UIPrinterSelectionOption contactingPrinter](self, "contactingPrinter"))
  {
    -[UIPrinterSelectionOption showContacting](self, "showContacting");
  }
  else
  {
    objc_msgSend(v5, "setAccessoryView:", 0);
    objc_msgSend(v5, "setAccessoryType:", 1);
    objc_msgSend(v5, "setSelectionStyle:", 3);
  }

  return v5;
}

- (id)printerDisplayName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "_internalPrinter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "displayName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("No Printer Selected"), CFSTR("No Printer Selected"), CFSTR("Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)summary
{
  void *v3;
  void *v4;
  void *v5;

  -[UIPrintOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPrinter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrinterSelectionOption printerDisplayName:](self, "printerDisplayName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)didSelectPrintOption
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UIPrinterBrowserViewController *v7;
  void *v8;
  void *v9;
  UIPrinterBrowserViewController *v10;
  void *v11;
  id v12;

  -[UIPrintOption printPanelViewController](self, "printPanelViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "printOptionsNavController");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrinterSelectionOption browserController](self, "browserController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != v5)
  {
    -[UIPrinterSelectionOption browserController](self, "browserController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = [UIPrinterBrowserViewController alloc];
      -[UIPrintOption printPanelViewController](self, "printPanelViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "printInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[UIPrinterBrowserViewController initWithOwnerViewController:printInfo:](v7, "initWithOwnerViewController:printInfo:", self, v9);
      -[UIPrinterSelectionOption setBrowserController:](self, "setBrowserController:", v10);

    }
    -[UIPrinterSelectionOption browserController](self, "browserController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pushViewController:animated:", v11, 1);

  }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (BOOL)filtersPrinters
{
  return 0;
}

- (PKPrinter)printer
{
  void *v2;
  void *v3;
  void *v4;

  -[UIPrintOption printInfo](self, "printInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPrinter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_internalPrinter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKPrinter *)v4;
}

- (void)setPrinter:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = -[UIPrinter _initWithPrinter:]([UIPrinter alloc], "_initWithPrinter:", v4);

  -[UIPrintOption printInfo](self, "printInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCurrentPrinter:", v6);

}

- (void)showContacting
{
  void *v2;
  id v3;

  -[UIPrintOption tableViewCell](self, "tableViewCell");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 4);
  objc_msgSend(v3, "setAccessoryView:", v2);
  objc_msgSend(v2, "startAnimating");

}

- (void)setShowContactingPrinter:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD block[4];
  id v10;
  UIPrinterSelectionOption *v11;

  v3 = a3;
  -[UIPrintOption tableViewCell](self, "tableViewCell");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[UIPrinterSelectionOption setContactingPrinter:](self, "setContactingPrinter:", 0);
    objc_msgSend(MEMORY[0x1E0C99E58], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_showContacting, 0);
    if (pthread_main_np() == 1)
    {
      objc_msgSend(v6, "setAccessoryView:", 0);
      objc_msgSend(v6, "setAccessoryType:", 1);
      goto LABEL_9;
    }
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53__UIPrinterSelectionOption_setShowContactingPrinter___block_invoke_2;
    v7[3] = &unk_1E9D96D90;
    v8 = v6;
    dispatch_sync(MEMORY[0x1E0C80D38], v7);
    v5 = v8;
LABEL_8:

    goto LABEL_9;
  }
  -[UIPrinterSelectionOption setContactingPrinter:](self, "setContactingPrinter:", 1);
  if (pthread_main_np() != 1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__UIPrinterSelectionOption_setShowContactingPrinter___block_invoke;
    block[3] = &unk_1E9D96E78;
    v10 = v6;
    v11 = self;
    dispatch_sync(MEMORY[0x1E0C80D38], block);
    v5 = v10;
    goto LABEL_8;
  }
  objc_msgSend(v6, "setSelectionStyle:", 0);
  -[UIPrinterSelectionOption performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_showContacting, 0, 0.1);
LABEL_9:

}

uint64_t __53__UIPrinterSelectionOption_setShowContactingPrinter___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSelectionStyle:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "performSelector:withObject:afterDelay:", sel_showContacting, 0, 0.1);
}

uint64_t __53__UIPrinterSelectionOption_setShowContactingPrinter___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAccessoryView:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setAccessoryType:", 1);
}

- (UIPrinterBrowserViewController)browserController
{
  return self->_browserController;
}

- (void)setBrowserController:(id)a3
{
  objc_storeStrong((id *)&self->_browserController, a3);
}

- (BOOL)contactingPrinter
{
  return self->_contactingPrinter;
}

- (void)setContactingPrinter:(BOOL)a3
{
  self->_contactingPrinter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browserController, 0);
}

@end
