@implementation UIPrintBorderOption

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[UIPrintOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, 0x1E9D98918);

  v4.receiver = self;
  v4.super_class = (Class)UIPrintBorderOption;
  -[UIPrintBorderOption dealloc](&v4, sel_dealloc);
}

- (UIPrintBorderOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  UIPrintBorderOption *v4;
  UIPrintBorderOption *v5;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v34;
  _QWORD v35[6];

  v35[5] = *MEMORY[0x1E0C80C00];
  v34.receiver = self;
  v34.super_class = (Class)UIPrintBorderOption;
  v4 = -[UIPrintOption initWithPrintInfo:printPanelViewController:](&v34, sel_initWithPrintInfo_printPanelViewController_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[UIPrintOption printInfo](v4, "printInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBorderType:", 0);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Border"), CFSTR("Border"), CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintOption setTitle:](v5, "setTitle:", v8);

    v9 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("No Layout Border"), CFSTR("No Layout Border"), CFSTR("Localizable"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryWithObject:forKey:", v32, CFSTR("Title"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v31;
    v10 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("Single Hairline"), CFSTR("Single Hairline"), CFSTR("Localizable"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryWithObject:forKey:", v29, CFSTR("Title"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v28;
    v11 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Single Thin Line"), CFSTR("Single Thin Line"), CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryWithObject:forKey:", v12, CFSTR("Title"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2] = v13;
    v14 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Double Hairline"), CFSTR("Double Hairline"), CFSTR("Localizable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryWithObject:forKey:", v16, CFSTR("Title"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v35[3] = v17;
    v18 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Double Thin Line"), CFSTR("Double Thin Line"), CFSTR("Localizable"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryWithObject:forKey:", v20, CFSTR("Title"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v35[4] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintBorderOption setBorderTypeNames:](v5, "setBorderTypeNames:", v22);

    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintBorderOption setSelectedIndexPath:](v5, "setSelectedIndexPath:", v23);

    -[UIPrintBorderOption summaryString](v5, "summaryString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintOption setSummary:](v5, "setSummary:", v24);

    -[UIPrintOption printInfo](v5, "printInfo");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:forKeyPath:options:context:", v5, 0x1E9D98918, 0, 0);

  }
  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__UIPrintBorderOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E9D96D90;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __70__UIPrintBorderOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateFromPrintInfo");
}

- (void)updateFromPrintInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)MEMORY[0x1E0CB36B0];
  -[UIPrintOption printInfo](self, "printInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathForRow:inSection:", objc_msgSend(v4, "borderType"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintBorderOption setSelectedIndexPath:](self, "setSelectedIndexPath:", v5);

  -[UIPrintOption tableViewCell](self, "tableViewCell");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentConfiguration");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[UIPrintBorderOption shortSummary](self, "shortSummary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSecondaryText:", v7);

  -[UIPrintOption tableViewCell](self, "tableViewCell");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentConfiguration:", v10);

  -[UIPrintBorderOption summaryString](self, "summaryString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintOption setSummary:](self, "setSummary:", v9);

}

- (id)itemList
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D20];
  -[UIPrintBorderOption borderTypeNames](self, "borderTypeNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)listItemSelected:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  -[UIPrintBorderOption setSelectedIndexPath:](self, "setSelectedIndexPath:", v4);
  v5 = objc_msgSend(v4, "row");

  -[UIPrintOption printInfo](self, "printInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBorderType:", v5);

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

  -[UIPrintBorderOption shortSummary](self, "shortSummary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSecondaryText:", v8);

  objc_msgSend(v5, "setContentConfiguration:", v6);
  objc_msgSend(v5, "setAccessoryType:", 1);
  objc_msgSend(v5, "setSelectionStyle:", 3);
  objc_msgSend(v5, "setItemListDelegate:", self);
  -[UIPrintOption setTableViewCell:](self, "setTableViewCell:", v5);

  return v5;
}

- (id)shortSummary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[UIPrintBorderOption borderTypeNames](self, "borderTypeNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintOption printInfo](self, "printInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", objc_msgSend(v4, "borderType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("Title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)summaryString
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  -[UIPrintOption printInfo](self, "printInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "borderType");

  switch(v3)
  {
    case 1:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("Single Hairline Border");
      goto LABEL_7;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("Single Thin Line Border");
      goto LABEL_7;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("Double Hairline Border");
      goto LABEL_7;
    case 4:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("Double Thin Line Border");
LABEL_7:
      objc_msgSend(v4, "localizedStringForKey:value:table:", v6, v6, CFSTR("Localizable"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v7 = 0;
      break;
  }
  return v7;
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

- (NSArray)borderTypeNames
{
  return self->_borderTypeNames;
}

- (void)setBorderTypeNames:(id)a3
{
  objc_storeStrong((id *)&self->_borderTypeNames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderTypeNames, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
}

@end
