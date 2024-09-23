@implementation UIPrintMediaQualitySection

- (UIPrintMediaQualitySection)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  id v6;
  id v7;
  UIPrintMediaQualitySection *v8;
  void *v9;
  void *v10;
  UIPrintFeedFromOption *v11;
  UIPrintMediaTypeOption *v12;
  UIPrintQualityOption *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)UIPrintMediaQualitySection;
  v8 = -[UIPrintOptionSection initWithPrintInfo:printPanelViewController:](&v19, sel_initWithPrintInfo_printPanelViewController_, v6, v7);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Media & Quality"), CFSTR("Media & Quality"), CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintOptionSection setTitle:](v8, "setTitle:", v10);

    v11 = -[UIPrintFeedFromOption initWithPrintInfo:printPanelViewController:]([UIPrintFeedFromOption alloc], "initWithPrintInfo:printPanelViewController:", v6, v7);
    -[UIPrintMediaQualitySection setFeedFromPrintOption:](v8, "setFeedFromPrintOption:", v11);

    v12 = -[UIPrintMediaTypeOption initWithPrintInfo:printPanelViewController:]([UIPrintMediaTypeOption alloc], "initWithPrintInfo:printPanelViewController:", v6, v7);
    -[UIPrintMediaQualitySection setMediaTypePrintOption:](v8, "setMediaTypePrintOption:", v12);

    v13 = -[UIPrintQualityOption initWithPrintInfo:printPanelViewController:]([UIPrintQualityOption alloc], "initWithPrintInfo:printPanelViewController:", v6, v7);
    -[UIPrintMediaQualitySection setQualityPrintOption:](v8, "setQualityPrintOption:", v13);

    -[UIPrintMediaQualitySection updatePrintOptionsList](v8, "updatePrintOptionsList");
    -[UIPrintMediaQualitySection feedFromPrintOption](v8, "feedFromPrintOption");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:forKeyPath:options:context:", v8, CFSTR("summary"), 0, 0);

    -[UIPrintMediaQualitySection mediaTypePrintOption](v8, "mediaTypePrintOption");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:forKeyPath:options:context:", v8, CFSTR("summary"), 0, 0);

    -[UIPrintMediaQualitySection qualityPrintOption](v8, "qualityPrintOption");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:forKeyPath:options:context:", v8, CFSTR("summary"), 0, 0);

    -[UIPrintOptionSection printInfo](v8, "printInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:forKeyPath:options:context:", v8, 0x1E9D986F8, 0, 0);

  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[UIPrintMediaQualitySection feedFromPrintOption](self, "feedFromPrintOption");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("summary"));

  -[UIPrintMediaQualitySection mediaTypePrintOption](self, "mediaTypePrintOption");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("summary"));

  -[UIPrintMediaQualitySection qualityPrintOption](self, "qualityPrintOption");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("summary"));

  -[UIPrintOptionSection printInfo](self, "printInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:forKeyPath:", self, 0x1E9D986F8);

  v7.receiver = self;
  v7.super_class = (Class)UIPrintMediaQualitySection;
  -[UIPrintMediaQualitySection dealloc](&v7, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  UIPrintMediaQualitySection *v11;

  v7 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__UIPrintMediaQualitySection_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v9[3] = &unk_1E9D96E78;
  v10 = v7;
  v11 = self;
  v8 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

uint64_t __77__UIPrintMediaQualitySection_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
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

- (void)currentPrinterChanged
{
  -[UIPrintMediaQualitySection updatePrintOptionsList](self, "updatePrintOptionsList");
  -[UIPrintOptionSection updateSectionSummary](self, "updateSectionSummary");
}

- (BOOL)updatePrintOptionsList
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintMediaQualitySection setFeedFromRow:](self, "setFeedFromRow:", -1);
  -[UIPrintMediaQualitySection setMediaTypeRow:](self, "setMediaTypeRow:", -1);
  -[UIPrintMediaQualitySection setQualitySectionNum:](self, "setQualitySectionNum:", -1);
  -[UIPrintMediaQualitySection feedFromPrintOption](self, "feedFromPrintOption");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldShow");

  if (v5)
  {
    -[UIPrintMediaQualitySection feedFromPrintOption](self, "feedFromPrintOption");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

    -[UIPrintMediaQualitySection setFeedFromRow:](self, "setFeedFromRow:", 0);
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }
  -[UIPrintMediaQualitySection mediaTypePrintOption](self, "mediaTypePrintOption");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shouldShow");

  if (v9)
  {
    -[UIPrintMediaQualitySection mediaTypePrintOption](self, "mediaTypePrintOption");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);

    -[UIPrintMediaQualitySection setMediaTypeRow:](self, "setMediaTypeRow:", v7);
    v7 = 1;
  }
  -[UIPrintMediaQualitySection qualityPrintOption](self, "qualityPrintOption");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "shouldShow");

  if (v12)
  {
    -[UIPrintMediaQualitySection qualityPrintOption](self, "qualityPrintOption");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v13);

    -[UIPrintMediaQualitySection setQualitySectionNum:](self, "setQualitySectionNum:", v7);
  }
  -[UIPrintOptionSection printOptions](self, "printOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToArray:", v3);

  if ((v15 & 1) == 0)
  {
    -[UIPrintOptionSection setPrintOptions:](self, "setPrintOptions:", v3);
    if (pthread_main_np() == 1)
    {
      -[UIPrintMediaQualitySection mediaQualitySectionController](self, "mediaQualitySectionController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "tableView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "reloadData");

    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __52__UIPrintMediaQualitySection_updatePrintOptionsList__block_invoke;
      block[3] = &unk_1E9D96D90;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }

  return v15 ^ 1;
}

void __52__UIPrintMediaQualitySection_updatePrintOptionsList__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "mediaQualitySectionController");
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
  -[UIPrintMediaQualitySection setMediaQualitySectionController:](self, "setMediaQualitySectionController:", v3);

  -[UIPrintOptionSection title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintMediaQualitySection mediaQualitySectionController](self, "mediaQualitySectionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v4);

  -[UIPrintMediaQualitySection mediaQualitySectionController](self, "mediaQualitySectionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);

  -[UIPrintMediaQualitySection mediaQualitySectionController](self, "mediaQualitySectionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDataSource:", self);

  -[UIPrintMediaQualitySection mediaQualitySectionController](self, "mediaQualitySectionController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEstimatedSectionHeaderHeight:", 8.0);

  -[UIPrintMediaQualitySection mediaQualitySectionController](self, "mediaQualitySectionController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addPrintShareButtonsToNavItem:", v13);

  objc_msgSend(v16, "printOptionsNavController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintMediaQualitySection mediaQualitySectionController](self, "mediaQualitySectionController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pushViewController:animated:", v15, 1);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (-[UIPrintMediaQualitySection qualitySectionNum](self, "qualitySectionNum", a3) < 1)
    return 1;
  else
    return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[UIPrintMediaQualitySection qualitySectionNum](self, "qualitySectionNum", a3) == a4)
    return 1;
  -[UIPrintOptionSection printOptions](self, "printOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintMediaQualitySection feedFromPrintOption](self, "feedFromPrintOption");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsObject:", v7))
  {
    -[UIPrintOptionSection printOptions](self, "printOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintMediaQualitySection mediaTypePrintOption](self, "mediaTypePrintOption");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "containsObject:", v9))
      v5 = 2;
    else
      v5 = 1;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  if (-[UIPrintMediaQualitySection qualitySectionNum](self, "qualitySectionNum", a3) == a4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Print Quality"), CFSTR("Print Quality"), CFSTR("Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = objc_msgSend(v5, "section");
  if (v6 == -[UIPrintMediaQualitySection qualitySectionNum](self, "qualitySectionNum"))
  {
    -[UIPrintMediaQualitySection qualityPrintOption](self, "qualityPrintOption");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_msgSend(v5, "row");
    if (v8 == -[UIPrintMediaQualitySection feedFromRow](self, "feedFromRow"))
      -[UIPrintMediaQualitySection feedFromPrintOption](self, "feedFromPrintOption");
    else
      -[UIPrintMediaQualitySection mediaTypePrintOption](self, "mediaTypePrintOption");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v7;
  objc_msgSend(v7, "printOptionTableViewCell");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a4;
  v5 = objc_msgSend(v10, "section");
  if (v5 != -[UIPrintMediaQualitySection qualitySectionNum](self, "qualitySectionNum"))
  {
    v6 = objc_msgSend(v10, "row");
    if (v6 == -[UIPrintMediaQualitySection feedFromRow](self, "feedFromRow"))
    {
      -[UIPrintMediaQualitySection feedFromPrintOption](self, "feedFromPrintOption");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = objc_msgSend(v10, "row");
      if (v8 != -[UIPrintMediaQualitySection mediaTypeRow](self, "mediaTypeRow"))
        goto LABEL_8;
      -[UIPrintMediaQualitySection mediaTypePrintOption](self, "mediaTypePrintOption");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = v7;
    if (v7)
    {
      objc_msgSend(v7, "didSelectPrintOption");

    }
  }
LABEL_8:

}

- (UIPrintFeedFromOption)feedFromPrintOption
{
  return self->_feedFromPrintOption;
}

- (void)setFeedFromPrintOption:(id)a3
{
  objc_storeStrong((id *)&self->_feedFromPrintOption, a3);
}

- (UIPrintMediaTypeOption)mediaTypePrintOption
{
  return self->_mediaTypePrintOption;
}

- (void)setMediaTypePrintOption:(id)a3
{
  objc_storeStrong((id *)&self->_mediaTypePrintOption, a3);
}

- (UIPrintQualityOption)qualityPrintOption
{
  return self->_qualityPrintOption;
}

- (void)setQualityPrintOption:(id)a3
{
  objc_storeStrong((id *)&self->_qualityPrintOption, a3);
}

- (UITableViewController)mediaQualitySectionController
{
  return self->_mediaQualitySectionController;
}

- (void)setMediaQualitySectionController:(id)a3
{
  objc_storeStrong((id *)&self->_mediaQualitySectionController, a3);
}

- (int64_t)feedFromRow
{
  return self->_feedFromRow;
}

- (void)setFeedFromRow:(int64_t)a3
{
  self->_feedFromRow = a3;
}

- (int64_t)mediaTypeRow
{
  return self->_mediaTypeRow;
}

- (void)setMediaTypeRow:(int64_t)a3
{
  self->_mediaTypeRow = a3;
}

- (int64_t)qualitySectionNum
{
  return self->_qualitySectionNum;
}

- (void)setQualitySectionNum:(int64_t)a3
{
  self->_qualitySectionNum = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaQualitySectionController, 0);
  objc_storeStrong((id *)&self->_qualityPrintOption, 0);
  objc_storeStrong((id *)&self->_mediaTypePrintOption, 0);
  objc_storeStrong((id *)&self->_feedFromPrintOption, 0);
}

@end
