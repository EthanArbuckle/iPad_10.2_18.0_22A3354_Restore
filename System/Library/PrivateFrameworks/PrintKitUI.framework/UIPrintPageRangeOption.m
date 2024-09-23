@implementation UIPrintPageRangeOption

- (UIPrintPageRangeOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  UIPrintPageRangeOption *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIPrintPageRangeOption;
  v4 = -[UIPrintOption initWithPrintInfo:printPanelViewController:](&v9, sel_initWithPrintInfo_printPanelViewController_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("RANGE_SHEET_TITLE"), CFSTR("Page Range"), CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintOption setTitle:](v4, "setTitle:", v6);

    -[UIPrintOption printInfo](v4, "printInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:forKeyPath:options:context:", v4, 0x1E9D98758, 0, 0);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[UIPrintOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, 0x1E9D98758);

  v4.receiver = self;
  v4.super_class = (Class)UIPrintPageRangeOption;
  -[UIPrintPageRangeOption dealloc](&v4, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__UIPrintPageRangeOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E9D96D90;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __73__UIPrintPageRangeOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateFromPrintInfo");
}

- (BOOL)shouldShow
{
  void *v2;
  char v3;

  -[UIPrintOption printPanelViewController](self, "printPanelViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldShowPageRange");

  return v3;
}

- (void)updateFromPrintInfo
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[UIPrintOption tableViewCell](self, "tableViewCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentConfiguration");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[UIPrintPageRangeOption summary](self, "summary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSecondaryText:", v4);

  -[UIPrintOption tableViewCell](self, "tableViewCell");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentConfiguration:", v6);

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

  -[UIPrintOption printPanelViewController](self, "printPanelViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "printOptionsTableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dequeueReusableCellWithIdentifier:", CFSTR("UIPrintOptionViewCell"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPrintOption setTableViewCell:](self, "setTableViewCell:", v5);
  objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Range"), CFSTR("Range"), CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v8);

  -[UIPrintPageRangeOption summary](self, "summary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSecondaryText:", v9);

  objc_msgSend(v6, "secondaryTextProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNumberOfLines:", 1);

  objc_msgSend(v5, "setContentConfiguration:", v6);
  objc_msgSend(v5, "setAccessoryType:", 1);
  objc_msgSend(v5, "setOptionViewDelegate:", self);

  return v5;
}

- (id)printOptionDetailView
{
  UIPrintRangeView *v3;
  void *v4;
  UIPrintRangeView *v5;

  v3 = [UIPrintRangeView alloc];
  -[UIPrintOption printInfo](self, "printInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UIPrintRangeView initWithFrame:printInfo:](v3, "initWithFrame:printInfo:", v4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[UIPrintPageRangeOption setPageRangeView:](self, "setPageRangeView:", v5);

  return -[UIPrintPageRangeOption pageRangeView](self, "pageRangeView");
}

- (id)summary
{
  void *v2;
  void *v3;
  void *v4;

  -[UIPrintOption printInfo](self, "printInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pageRanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SummaryForRange(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)didSelectPrintOption
{
  id v2;

  -[UIPrintOption tableViewCell](self, "tableViewCell");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "printOptionCellTapped");

}

- (UIPrintRangeView)pageRangeView
{
  return self->_pageRangeView;
}

- (void)setPageRangeView:(id)a3
{
  objc_storeStrong((id *)&self->_pageRangeView, a3);
}

- (NSString)multiPageRangeTitle
{
  return self->_multiPageRangeTitle;
}

- (void)setMultiPageRangeTitle:(id)a3
{
  objc_storeStrong((id *)&self->_multiPageRangeTitle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiPageRangeTitle, 0);
  objc_storeStrong((id *)&self->_pageRangeView, 0);
}

@end
