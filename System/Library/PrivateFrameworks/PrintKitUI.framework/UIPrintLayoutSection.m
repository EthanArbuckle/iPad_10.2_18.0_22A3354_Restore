@implementation UIPrintLayoutSection

- (UIPrintLayoutSection)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  id v6;
  id v7;
  UIPrintLayoutSection *v8;
  void *v9;
  void *v10;
  UIPrintPagesPerSheetOption *v11;
  UIPrintLayoutDirectionOption *v12;
  UIPrintBorderOption *v13;
  UIPrintFlipHorizontalOption *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)UIPrintLayoutSection;
  v8 = -[UIPrintOptionSection initWithPrintInfo:printPanelViewController:](&v21, sel_initWithPrintInfo_printPanelViewController_, v6, v7);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Layout"), CFSTR("Layout"), CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintOptionSection setTitle:](v8, "setTitle:", v10);

    v11 = -[UIPrintPagesPerSheetOption initWithPrintInfo:printPanelViewController:]([UIPrintPagesPerSheetOption alloc], "initWithPrintInfo:printPanelViewController:", v6, v7);
    -[UIPrintLayoutSection setPagesPerSheetPrintOption:](v8, "setPagesPerSheetPrintOption:", v11);

    v12 = -[UIPrintLayoutDirectionOption initWithPrintInfo:printPanelViewController:]([UIPrintLayoutDirectionOption alloc], "initWithPrintInfo:printPanelViewController:", v6, v7);
    -[UIPrintLayoutSection setLayoutDirectionPrintOption:](v8, "setLayoutDirectionPrintOption:", v12);

    v13 = -[UIPrintBorderOption initWithPrintInfo:printPanelViewController:]([UIPrintBorderOption alloc], "initWithPrintInfo:printPanelViewController:", v6, v7);
    -[UIPrintLayoutSection setBorderPrintOption:](v8, "setBorderPrintOption:", v13);

    v14 = -[UIPrintFlipHorizontalOption initWithPrintInfo:printPanelViewController:]([UIPrintFlipHorizontalOption alloc], "initWithPrintInfo:printPanelViewController:", v6, v7);
    -[UIPrintLayoutSection setFlipHorizontalPrintOption:](v8, "setFlipHorizontalPrintOption:", v14);

    -[UIPrintLayoutSection updatePrintOptionsList](v8, "updatePrintOptionsList");
    -[UIPrintOptionSection updateSectionSummary](v8, "updateSectionSummary");
    -[UIPrintLayoutSection pagesPerSheetPrintOption](v8, "pagesPerSheetPrintOption");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:forKeyPath:options:context:", v8, CFSTR("summary"), 0, 0);

    -[UIPrintLayoutSection layoutDirectionPrintOption](v8, "layoutDirectionPrintOption");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:forKeyPath:options:context:", v8, CFSTR("summary"), 0, 0);

    -[UIPrintLayoutSection borderPrintOption](v8, "borderPrintOption");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:forKeyPath:options:context:", v8, CFSTR("summary"), 0, 0);

    -[UIPrintLayoutSection flipHorizontalPrintOption](v8, "flipHorizontalPrintOption");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:forKeyPath:options:context:", v8, CFSTR("summary"), 0, 0);

    -[UIPrintOptionSection printInfo](v8, "printInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:forKeyPath:options:context:", v8, 0x1E9D98898, 0, 0);

  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  -[UIPrintLayoutSection pagesPerSheetPrintOption](self, "pagesPerSheetPrintOption");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("summary"));

  -[UIPrintLayoutSection layoutDirectionPrintOption](self, "layoutDirectionPrintOption");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("summary"));

  -[UIPrintLayoutSection borderPrintOption](self, "borderPrintOption");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("summary"));

  -[UIPrintLayoutSection flipHorizontalPrintOption](self, "flipHorizontalPrintOption");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:forKeyPath:", self, CFSTR("summary"));

  -[UIPrintOptionSection printInfo](self, "printInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:forKeyPath:", self, 0x1E9D98898);

  v8.receiver = self;
  v8.super_class = (Class)UIPrintLayoutSection;
  -[UIPrintLayoutSection dealloc](&v8, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  UIPrintLayoutSection *v11;

  v7 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__UIPrintLayoutSection_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v9[3] = &unk_1E9D96E78;
  v10 = v7;
  v11 = self;
  v8 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

uint64_t __71__UIPrintLayoutSection_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", 0x1E9D98898);
  v3 = *(void **)(a1 + 40);
  if (v2)
    return objc_msgSend(v3, "updatePrintOptionsList");
  else
    return objc_msgSend(v3, "updateSectionSummary");
}

- (BOOL)shouldShow
{
  void *v2;
  char v3;

  -[UIPrintOptionSection printPanelViewController](self, "printPanelViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldShowLayout");

  return v3;
}

- (BOOL)updatePrintOptionsList
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintLayoutSection pagesPerSheetPrintOption](self, "pagesPerSheetPrintOption");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  -[UIPrintOptionSection printInfo](self, "printInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "nUpActive");

  if (v6)
  {
    -[UIPrintLayoutSection layoutDirectionPrintOption](self, "layoutDirectionPrintOption");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  -[UIPrintLayoutSection borderPrintOption](self, "borderPrintOption");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  -[UIPrintLayoutSection flipHorizontalPrintOption](self, "flipHorizontalPrintOption");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  -[UIPrintOptionSection printOptions](self, "printOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToArray:", v3);

  if ((v11 & 1) == 0)
  {
    -[UIPrintOptionSection setPrintOptions:](self, "setPrintOptions:", v3);
    if (pthread_main_np() == 1)
    {
      -[UIPrintLayoutSection layoutSectionController](self, "layoutSectionController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "tableView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "reloadData");

    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __46__UIPrintLayoutSection_updatePrintOptionsList__block_invoke;
      block[3] = &unk_1E9D96D90;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }

  return v11 ^ 1;
}

void __46__UIPrintLayoutSection_updatePrintOptionsList__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "layoutSectionController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tableView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  -[UIPrintOptionSection printPanelViewController](self, "printPanelViewController");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D60]), "initWithStyle:", 2);
  -[UIPrintLayoutSection setLayoutSectionController:](self, "setLayoutSectionController:", v3);

  -[UIPrintOptionSection title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintLayoutSection layoutSectionController](self, "layoutSectionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v4);

  -[UIPrintLayoutSection layoutSectionController](self, "layoutSectionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);

  -[UIPrintLayoutSection layoutSectionController](self, "layoutSectionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDataSource:", self);

  -[UIPrintLayoutSection layoutSectionController](self, "layoutSectionController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEstimatedSectionHeaderHeight:", 8.0);

  -[UIPrintLayoutSection layoutSectionController](self, "layoutSectionController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addPrintShareButtonsToNavItem:", v13);

  objc_msgSend(v16, "printOptionsNavController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintLayoutSection layoutSectionController](self, "layoutSectionController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pushViewController:animated:", v15, 1);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v4;
  void *v5;

  if (a4)
    return 2;
  -[UIPrintOptionSection printInfo](self, "printInfo", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "nUpActive"))
    v4 = 2;
  else
    v4 = 1;

  return v4;
}

- (id)printOptionAtIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  v6 = objc_msgSend(v4, "row");

  if (v5)
  {
    if (v6)
      -[UIPrintLayoutSection flipHorizontalPrintOption](self, "flipHorizontalPrintOption");
    else
      -[UIPrintLayoutSection borderPrintOption](self, "borderPrintOption");
  }
  else if (v6)
  {
    -[UIPrintLayoutSection layoutDirectionPrintOption](self, "layoutDirectionPrintOption");
  }
  else
  {
    -[UIPrintLayoutSection pagesPerSheetPrintOption](self, "pagesPerSheetPrintOption");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;

  -[UIPrintLayoutSection printOptionAtIndexPath:](self, "printOptionAtIndexPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "printOptionTableViewCell");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v4;
  id v5;

  -[UIPrintLayoutSection printOptionAtIndexPath:](self, "printOptionAtIndexPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "didSelectPrintOption");
    v4 = v5;
  }

}

- (UIPrintPagesPerSheetOption)pagesPerSheetPrintOption
{
  return self->_pagesPerSheetPrintOption;
}

- (void)setPagesPerSheetPrintOption:(id)a3
{
  objc_storeStrong((id *)&self->_pagesPerSheetPrintOption, a3);
}

- (UIPrintLayoutDirectionOption)layoutDirectionPrintOption
{
  return self->_layoutDirectionPrintOption;
}

- (void)setLayoutDirectionPrintOption:(id)a3
{
  objc_storeStrong((id *)&self->_layoutDirectionPrintOption, a3);
}

- (UIPrintBorderOption)borderPrintOption
{
  return self->_borderPrintOption;
}

- (void)setBorderPrintOption:(id)a3
{
  objc_storeStrong((id *)&self->_borderPrintOption, a3);
}

- (UIPrintFlipHorizontalOption)flipHorizontalPrintOption
{
  return self->_flipHorizontalPrintOption;
}

- (void)setFlipHorizontalPrintOption:(id)a3
{
  objc_storeStrong((id *)&self->_flipHorizontalPrintOption, a3);
}

- (UITableViewController)layoutSectionController
{
  return self->_layoutSectionController;
}

- (void)setLayoutSectionController:(id)a3
{
  objc_storeStrong((id *)&self->_layoutSectionController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutSectionController, 0);
  objc_storeStrong((id *)&self->_flipHorizontalPrintOption, 0);
  objc_storeStrong((id *)&self->_borderPrintOption, 0);
  objc_storeStrong((id *)&self->_layoutDirectionPrintOption, 0);
  objc_storeStrong((id *)&self->_pagesPerSheetPrintOption, 0);
}

@end
