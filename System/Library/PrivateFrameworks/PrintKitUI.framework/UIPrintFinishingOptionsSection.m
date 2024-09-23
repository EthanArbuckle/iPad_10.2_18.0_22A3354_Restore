@implementation UIPrintFinishingOptionsSection

- (UIPrintFinishingOptionsSection)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  id v6;
  id v7;
  UIPrintFinishingOptionsSection *v8;
  void *v9;
  void *v10;
  UIPrintFinishingsOption *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)UIPrintFinishingOptionsSection;
  v8 = -[UIPrintOptionSection initWithPrintInfo:printPanelViewController:](&v16, sel_initWithPrintInfo_printPanelViewController_, v6, v7);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Finishing Options"), CFSTR("Finishing Options"), CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintOptionSection setTitle:](v8, "setTitle:", v10);

    v11 = -[UIPrintFinishingsOption initWithPrintInfo:printPanelViewController:]([UIPrintFinishingsOption alloc], "initWithPrintInfo:printPanelViewController:", v6, v7);
    -[UIPrintFinishingOptionsSection setFinishingPrintOption:](v8, "setFinishingPrintOption:", v11);

    -[UIPrintOptionSection updateSectionSummary](v8, "updateSectionSummary");
    -[UIPrintFinishingOptionsSection finishingPrintOption](v8, "finishingPrintOption");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:forKeyPath:options:context:", v8, CFSTR("summary"), 0, 0);

    -[UIPrintOptionSection printInfo](v8, "printInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:forKeyPath:options:context:", v8, 0x1E9D986F8, 0, 0);

    -[UIPrintOptionSection printInfo](v8, "printInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:forKeyPath:options:context:", v8, 0x1E9D98978, 0, 0);

  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[UIPrintFinishingOptionsSection finishingPrintOption](self, "finishingPrintOption");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("summary"));

  -[UIPrintOptionSection printInfo](self, "printInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, 0x1E9D986F8);

  -[UIPrintOptionSection printInfo](self, "printInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:", self, 0x1E9D98978);

  v6.receiver = self;
  v6.super_class = (Class)UIPrintFinishingOptionsSection;
  -[UIPrintFinishingOptionsSection dealloc](&v6, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  UIPrintFinishingOptionsSection *v11;

  v7 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__UIPrintFinishingOptionsSection_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v9[3] = &unk_1E9D96E78;
  v10 = v7;
  v11 = self;
  v8 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

uint64_t __81__UIPrintFinishingOptionsSection_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", 0x1E9D986F8);
  v3 = *(void **)(a1 + 40);
  if (v2)
    return objc_msgSend(v3, "currentPrinterChanged");
  else
    return objc_msgSend(v3, "updateSectionSummary");
}

- (BOOL)updatePrintOptionsList
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintFinishingOptionsSection finishingPrintOption](self, "finishingPrintOption");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldShow");

  if (v5)
  {
    -[UIPrintFinishingOptionsSection finishingPrintOption](self, "finishingPrintOption");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  -[UIPrintOptionSection printOptions](self, "printOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToArray:", v3);

  if ((v8 & 1) == 0)
  {
    -[UIPrintOptionSection setPrintOptions:](self, "setPrintOptions:", v3);
    if (pthread_main_np() == 1)
    {
      -[UIPrintFinishingOptionsSection finishingPrintOption](self, "finishingPrintOption");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "finishingOptionsTableView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "reloadData");

    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __56__UIPrintFinishingOptionsSection_updatePrintOptionsList__block_invoke;
      block[3] = &unk_1E9D96D90;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }

  return v8 ^ 1;
}

void __56__UIPrintFinishingOptionsSection_updatePrintOptionsList__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "finishingPrintOption");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishingOptionsTableView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

- (void)currentPrinterChanged
{
  -[UIPrintFinishingOptionsSection updatePrintOptionsList](self, "updatePrintOptionsList");
  -[UIPrintOptionSection updateSectionSummary](self, "updateSectionSummary");
}

- (void)didSelectPrintOptionSection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[UIPrintOptionSection printPanelViewController](self, "printPanelViewController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F20]), "initWithNibName:bundle:", 0, 0);
  -[UIPrintFinishingOptionsSection finishingPrintOption](self, "finishingPrintOption");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishingOptionsTableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setView:", v5);

  -[UIPrintFinishingOptionsSection finishingPrintOption](self, "finishingPrintOption");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v7);

  objc_msgSend(v3, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addPrintShareButtonsToNavItem:", v8);

  objc_msgSend(v10, "printOptionsNavController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pushViewController:animated:", v3, 1);

}

- (UIPrintFinishingsOption)finishingPrintOption
{
  return self->_finishingPrintOption;
}

- (void)setFinishingPrintOption:(id)a3
{
  objc_storeStrong((id *)&self->_finishingPrintOption, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishingPrintOption, 0);
}

@end
