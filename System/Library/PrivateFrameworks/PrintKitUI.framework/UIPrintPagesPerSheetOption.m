@implementation UIPrintPagesPerSheetOption

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[UIPrintOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, 0x1E9D98898);

  -[UIPrintOption printInfo](self, "printInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, 0x1E9D98938);

  -[UIPrintOption printInfo](self, "printInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:", self, 0x1E9D986F8);

  v6.receiver = self;
  v6.super_class = (Class)UIPrintPagesPerSheetOption;
  -[UIPrintPagesPerSheetOption dealloc](&v6, sel_dealloc);
}

- (UIPrintPagesPerSheetOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  UIPrintPagesPerSheetOption *v4;
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
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;
  _QWORD v21[7];

  v21[6] = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)UIPrintPagesPerSheetOption;
  v4 = -[UIPrintOption initWithPrintInfo:printPanelViewController:](&v20, sel_initWithPrintInfo_printPanelViewController_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Pages per Sheet"), CFSTR("Pages per Sheet"), CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintOption setTitle:](v4, "setTitle:", v6);

    -[UIPrintPagesPerSheetOption itemNameDictForNumber:](v4, "itemNameDictForNumber:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v7;
    -[UIPrintPagesPerSheetOption itemNameDictForNumber:](v4, "itemNameDictForNumber:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v8;
    -[UIPrintPagesPerSheetOption itemNameDictForNumber:](v4, "itemNameDictForNumber:", 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v9;
    -[UIPrintPagesPerSheetOption itemNameDictForNumber:](v4, "itemNameDictForNumber:", 6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[3] = v10;
    -[UIPrintPagesPerSheetOption itemNameDictForNumber:](v4, "itemNameDictForNumber:", 9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[4] = v11;
    -[UIPrintPagesPerSheetOption itemNameDictForNumber:](v4, "itemNameDictForNumber:", 16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[5] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPagesPerSheetOption setNUpNames:](v4, "setNUpNames:", v13);

    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPagesPerSheetOption setSelectedIndexPath:](v4, "setSelectedIndexPath:", v14);

    -[UIPrintPagesPerSheetOption summaryString](v4, "summaryString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintOption setSummary:](v4, "setSummary:", v15);

    -[UIPrintOption printInfo](v4, "printInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:forKeyPath:options:context:", v4, 0x1E9D98898, 0, 0);

    -[UIPrintOption printInfo](v4, "printInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:forKeyPath:options:context:", v4, 0x1E9D98938, 0, 0);

    -[UIPrintOption printInfo](v4, "printInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:forKeyPath:options:context:", v4, 0x1E9D986F8, 0, 0);

  }
  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  UIPrintPagesPerSheetOption *v11;

  v7 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__UIPrintPagesPerSheetOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v9[3] = &unk_1E9D96E78;
  v10 = v7;
  v11 = self;
  v8 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

uint64_t __77__UIPrintPagesPerSheetOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", 0x1E9D986F8))
  {
    objc_msgSend(*(id *)(a1 + 40), "printInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "currentPrinter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "supportsDuplex"))
    {
LABEL_5:

      return objc_msgSend(*(id *)(a1 + 40), "updateFromPrintInfo");
    }
    objc_msgSend(*(id *)(a1 + 40), "printInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "bookletStyle");

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 40), "printInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setBookletStyle:", 0);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = v2;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v10[1] = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "printInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setNUpRowsColumns:", v7);

      goto LABEL_5;
    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "updateFromPrintInfo");
}

- (void)updateFromPrintInfo
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  -[UIPrintOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bookletStyle");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB36B0];
    v6 = 0;
    v7 = 1;
  }
  else
  {
    -[UIPrintOption printInfo](self, "printInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "numNUpRows");
    -[UIPrintOption printInfo](self, "printInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "numNUpColumns") * v9;

    v6 = 0;
    switch(v11)
    {
      case 2:
        v6 = 1;
        break;
      case 3:
      case 5:
      case 7:
      case 8:
        break;
      case 4:
        v6 = 2;
        break;
      case 6:
        v6 = 3;
        break;
      case 9:
        v6 = 4;
        break;
      default:
        if (v11 == 16)
          v6 = 5;
        else
          v6 = 0;
        break;
    }
    v5 = (void *)MEMORY[0x1E0CB36B0];
    v7 = 0;
  }
  objc_msgSend(v5, "indexPathForRow:inSection:", v6, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPagesPerSheetOption setSelectedIndexPath:](self, "setSelectedIndexPath:", v12);

  -[UIPrintOption tableViewCell](self, "tableViewCell");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentConfiguration");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  -[UIPrintPagesPerSheetOption shortSummary](self, "shortSummary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSecondaryText:", v14);

  -[UIPrintOption tableViewCell](self, "tableViewCell");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setContentConfiguration:", v17);

  -[UIPrintPagesPerSheetOption summaryString](self, "summaryString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintOption setSummary:](self, "setSummary:", v16);

}

- (id)itemList
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  -[UIPrintOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPrinter");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {

    goto LABEL_5;
  }
  v5 = (void *)v4;
  -[UIPrintOption printInfo](self, "printInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentPrinter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "supportsDuplex");

  if (v8)
  {
LABEL_5:
    v12 = (void *)MEMORY[0x1E0C99D20];
    -[UIPrintPagesPerSheetOption nUpNames](self, "nUpNames");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0C99D20];
    v14 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Print As Booklet"), CFSTR("Print As Booklet"), CFSTR("Localizable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryWithObject:forKey:", v16, CFSTR("Title"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayWithObject:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "arrayWithObjects:", v10, v18, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v9 = (void *)MEMORY[0x1E0C99D20];
  -[UIPrintPagesPerSheetOption nUpNames](self, "nUpNames");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayWithObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v11;
}

- (int64_t)listItemSelected:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIPrintPagesPerSheetOption setSelectedIndexPath:](self, "setSelectedIndexPath:", v4);
  v5 = objc_msgSend(v4, "section");
  v6 = v5 == 1;
  -[UIPrintOption printInfo](self, "printInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "bookletStyle");

  if (v8 != v6)
  {
    -[UIPrintOption printInfo](self, "printInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBookletStyle:", v6);

  }
  if (v5 == 1)
  {
    v10 = 2;
    v11 = 1;
  }
  else
  {
    v11 = sizes[2 * objc_msgSend(v4, "row") + 1];
    v10 = sizes[2 * objc_msgSend(v4, "row")];
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintOption printInfo](self, "printInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setNUpRowsColumns:", v14);

  return 1;
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
  objc_msgSend(v4, "dequeueReusableCellWithIdentifier:", CFSTR("UIPrintOptionListCell"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintOption title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v7);

  -[UIPrintPagesPerSheetOption shortSummary](self, "shortSummary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSecondaryText:", v8);

  objc_msgSend(v5, "setContentConfiguration:", v6);
  objc_msgSend(v5, "setAccessoryType:", 1);
  objc_msgSend(v5, "setSelectionStyle:", 3);
  objc_msgSend(v5, "setItemListDelegate:", self);
  -[UIPrintOption setTableViewCell:](self, "setTableViewCell:", v5);

  return v5;
}

- (id)itemNameDictForNumber:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringFromNumber:numberStyle:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v5, CFSTR("Title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)shortSummary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[UIPrintOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "bookletStyle") == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Print As Booklet"), CFSTR("Print As Booklet"), CFSTR("Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIPrintPagesPerSheetOption nUpNames](self, "nUpNames");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPagesPerSheetOption selectedIndexPath](self, "selectedIndexPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", objc_msgSend(v6, "row"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("Title"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)summaryString
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[UIPrintOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bookletStyle");

  if (v4 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Print As Booklet"), CFSTR("Print As Booklet"), CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIPrintOption printInfo](self, "printInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "numNUpRows");
    -[UIPrintOption printInfo](self, "printInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "numNUpColumns") * v8;

    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("NUP_PAGES"), CFSTR("NUP_PAGES"), CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", v13, &stru_1E9D97C98, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringWithFormat:", v14, v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)didSelectPrintOption
{
  id v2;

  -[UIPrintOption tableViewCell](self, "tableViewCell");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "printOptionCellTapped");

}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_selectedIndexPath, a3);
}

- (NSArray)nUpNames
{
  return self->_nUpNames;
}

- (void)setNUpNames:(id)a3
{
  objc_storeStrong((id *)&self->_nUpNames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nUpNames, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
}

@end
