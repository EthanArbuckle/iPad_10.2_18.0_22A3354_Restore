@implementation UIPrinterFinishingOption

- (UIPrinterFinishingOption)initWithTitle:(id)a3 finishingType:(int64_t)a4 viewType:(int64_t)a5 optionChoices:(id)a6 printPanelViewController:(id)a7 finishingOptionsTableView:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  UIPrinterFinishingOption *v18;
  UIPrinterFinishingOption *v19;
  void *v20;
  unint64_t v21;
  uint64_t *v22;
  void *v23;
  objc_super v25;

  v14 = a3;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)UIPrinterFinishingOption;
  v18 = -[UIPrinterFinishingOption init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    -[UIPrinterFinishingOption setTitle:](v18, "setTitle:", v14);
    -[UIPrinterFinishingOption setFinishingType:](v19, "setFinishingType:", a4);
    -[UIPrinterFinishingOption setViewType:](v19, "setViewType:", a5);
    -[UIPrinterFinishingOption setOptionChoices:](v19, "setOptionChoices:", v15);
    -[UIPrinterFinishingOption setPrintPanelViewController:](v19, "setPrintPanelViewController:", v16);
    objc_msgSend(v16, "printInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrinterFinishingOption setPrintInfo:](v19, "setPrintInfo:", v20);

    -[UIPrinterFinishingOption setFinishingOptionsTableView:](v19, "setFinishingOptionsTableView:", v17);
    v21 = -[UIPrinterFinishingOption finishingType](v19, "finishingType");
    if (v21 <= 6)
    {
      v22 = off_1E9D977A0[v21];
      -[UIPrinterFinishingOption printInfo](v19, "printInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObserver:forKeyPath:options:context:", v19, *v22, 0, 0);

    }
    -[UIPrinterFinishingOption updateFromPrintInfo](v19, "updateFromPrintInfo");
  }

  return v19;
}

- (void)dealloc
{
  unint64_t v3;
  uint64_t *v4;
  void *v5;
  objc_super v6;

  v3 = -[UIPrinterFinishingOption finishingType](self, "finishingType");
  if (v3 <= 6)
  {
    v4 = off_1E9D977A0[v3];
    -[UIPrinterFinishingOption printInfo](self, "printInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:forKeyPath:", self, *v4);

  }
  v6.receiver = self;
  v6.super_class = (Class)UIPrinterFinishingOption;
  -[UIPrinterFinishingOption dealloc](&v6, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__UIPrinterFinishingOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E9D96D90;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __75__UIPrinterFinishingOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
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
  id v9;

  if (-[UIPrinterFinishingOption viewType](self, "viewType") == 1)
  {
    -[UIPrinterFinishingOption optionChoices](self, "optionChoices");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndex:", -[UIPrinterFinishingOption selectedChoice](self, "selectedChoice"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

    -[UIPrinterFinishingOption printerFinishingOptionCell](self, "printerFinishingOptionCell");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSecondaryText:", v6);

    -[UIPrinterFinishingOption printerFinishingOptionCell](self, "printerFinishingOptionCell");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContentConfiguration:", v5);

  }
  else
  {
    -[UIPrinterFinishingOption printerFinishingOptionCell](self, "printerFinishingOptionCell");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessoryView");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setOn:", -[UIPrinterFinishingOption selectedChoice](self, "selectedChoice") != 0);
  }

}

- (UIPrintPanelViewController)printPanelViewController
{
  return (UIPrintPanelViewController *)objc_loadWeakRetained((id *)&self->_printPanelViewController);
}

- (int64_t)selectedChoice
{
  UIPrinterFinishingOption *v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  UIPrinterFinishingOption *v29;
  void *v30;

  v2 = self;
  if (-[UIPrinterFinishingOption finishingType](self, "finishingType") == 6)
  {
    -[UIPrinterFinishingOption optionChoices](v2, "optionChoices");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4)
    {
      v5 = 0;
      v29 = v2;
      while (1)
      {
        -[UIPrinterFinishingOption optionChoices](v2, "optionChoices", v29);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndex:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        -[UIPrinterFinishingOption printInfo](v2, "printInfo");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "outputBin");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "finishingChoiceInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", CFSTR("OutputBinChoice"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqualToString:", v11))
        {
          -[UIPrinterFinishingOption printInfo](v2, "printInfo");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "pageStackOrder");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "finishingChoiceInfo");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKey:", CFSTR("com.apple.pageStackOrder"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v12, "isEqualToString:", v14);

          v2 = v29;
        }
        else
        {
          v15 = 0;
        }

        if (v15)
          break;
        ++v5;
        -[UIPrinterFinishingOption optionChoices](v2, "optionChoices");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

        if (v5 >= v17)
          return 0;
      }
      return v5;
    }
    return 0;
  }
  switch(-[UIPrinterFinishingOption finishingType](v2, "finishingType"))
  {
    case 0:
      -[UIPrinterFinishingOption printInfo](v2, "printInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "staple");
      goto LABEL_18;
    case 1:
      -[UIPrinterFinishingOption printInfo](v2, "printInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "punch");
      goto LABEL_18;
    case 2:
      -[UIPrinterFinishingOption printInfo](v2, "printInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "fold");
      goto LABEL_18;
    case 3:
      -[UIPrinterFinishingOption printInfo](v2, "printInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "laminate");
      goto LABEL_18;
    case 4:
      -[UIPrinterFinishingOption printInfo](v2, "printInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "coat");
      goto LABEL_18;
    case 5:
      -[UIPrinterFinishingOption printInfo](v2, "printInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "trim");
LABEL_18:
      v5 = v19;

      break;
    default:
      v5 = 0;
      break;
  }
  if (-[UIPrinterFinishingOption viewType](v2, "viewType") != 1)
    return v5;
  -[UIPrinterFinishingOption optionChoices](v2, "optionChoices");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (!v21)
    return 0;
  v22 = 0;
  while (1)
  {
    -[UIPrinterFinishingOption optionChoices](v2, "optionChoices");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndex:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_msgSend(v24, "finishingChoiceID");
    if (v25 == v5)
      break;
    ++v22;
    -[UIPrinterFinishingOption optionChoices](v2, "optionChoices");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "count");

    if (v22 >= v27)
      return 0;
  }
  return v22;
}

- (void)setSelectedChoice:(int64_t)a3
{
  int64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
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
  id v20;

  v5 = -[UIPrinterFinishingOption viewType](self, "viewType");
  -[UIPrinterFinishingOption optionChoices](self, "optionChoices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 == 1)
  {
    objc_msgSend(v6, "objectAtIndex:", a3);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v20, "finishingChoiceID");
    -[UIPrinterFinishingOption printerFinishingOptionCell](self, "printerFinishingOptionCell");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSecondaryText:", v11);

    -[UIPrinterFinishingOption printerFinishingOptionCell](self, "printerFinishingOptionCell");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContentConfiguration:", v10);

  }
  else
  {
    objc_msgSend(v6, "objectAtIndex:", 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    if (a3)
      v8 = objc_msgSend(v20, "finishingChoiceID");
    else
      v8 = 0;
    -[UIPrinterFinishingOption printerFinishingOptionCell](self, "printerFinishingOptionCell");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accessoryView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setOn:", a3 != 0);
  }

  switch(-[UIPrinterFinishingOption finishingType](self, "finishingType"))
  {
    case 0:
      -[UIPrinterFinishingOption printInfo](self, "printInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setStaple:", v8);
      goto LABEL_15;
    case 1:
      -[UIPrinterFinishingOption printInfo](self, "printInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setPunch:", v8);
      goto LABEL_15;
    case 2:
      -[UIPrinterFinishingOption printInfo](self, "printInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setFold:", v8);
      goto LABEL_15;
    case 3:
      -[UIPrinterFinishingOption printInfo](self, "printInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setLaminate:", v8);
      goto LABEL_15;
    case 4:
      -[UIPrinterFinishingOption printInfo](self, "printInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setCoat:", v8);
      goto LABEL_15;
    case 5:
      -[UIPrinterFinishingOption printInfo](self, "printInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTrim:", v8);
      goto LABEL_15;
    case 6:
      objc_msgSend(v20, "finishingChoiceInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", CFSTR("OutputBinChoice"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrinterFinishingOption printInfo](self, "printInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setOutputBin:", v16);

      objc_msgSend(v20, "finishingChoiceInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", CFSTR("com.apple.pageStackOrder"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrinterFinishingOption printInfo](self, "printInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setPageStackOrder:", v18);

LABEL_15:
      break;
    default:
      break;
  }

}

- (id)itemList
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[UIPrinterFinishingOption optionChoices](self, "optionChoices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[UIPrinterFinishingOption optionChoices](self, "optionChoices", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)MEMORY[0x1E0C99D80];
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "title");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "dictionaryWithObject:forKey:", v12, CFSTR("Title"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)selectedItem
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", -[UIPrinterFinishingOption selectedChoice](self, "selectedChoice"), 0);
}

- (int64_t)listItemSelected:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[UIPrinterFinishingOption setSelectedChoice:](self, "setSelectedChoice:", objc_msgSend(a3, "row"));
  -[UIPrinterFinishingOption optionChoices](self, "optionChoices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", -[UIPrinterFinishingOption selectedChoice](self, "selectedChoice"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPrinterFinishingOption printerFinishingOptionCell](self, "printerFinishingOptionCell");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSecondaryText:", v8);

  -[UIPrinterFinishingOption printerFinishingOptionCell](self, "printerFinishingOptionCell");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContentConfiguration:", v7);

  return 1;
}

- (void)updateSwitchValue:(id)a3
{
  void *v4;
  id v5;

  if (objc_msgSend(a3, "isOn"))
  {
    -[UIPrinterFinishingOption optionChoices](self, "optionChoices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    -[UIPrinterFinishingOption setSelectedChoice:](self, "setSelectedChoice:", objc_msgSend(v5, "finishingChoiceID"));
  }
  else
  {
    -[UIPrinterFinishingOption setSelectedChoice:](self, "setSelectedChoice:", 0);
  }
}

- (id)summary
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

  if (-[UIPrinterFinishingOption selectedChoice](self, "selectedChoice") < 1)
  {
    v10 = 0;
  }
  else
  {
    if (-[UIPrinterFinishingOption viewType](self, "viewType"))
    {
      -[UIPrinterFinishingOption optionChoices](self, "optionChoices");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectAtIndex:", -[UIPrinterFinishingOption selectedChoice](self, "selectedChoice"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("%@: %@"), CFSTR("%@: %@"), CFSTR("Localizable"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrinterFinishingOption title](self, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", v7, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("%@ On"), CFSTR("%@ On"), CFSTR("Localizable"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrinterFinishingOption title](self, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", v6, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v10;
}

- (void)setPrintPanelViewController:(id)a3
{
  objc_storeWeak((id *)&self->_printPanelViewController, a3);
}

- (UITableView)finishingOptionsTableView
{
  return (UITableView *)objc_loadWeakRetained((id *)&self->_finishingOptionsTableView);
}

- (void)setFinishingOptionsTableView:(id)a3
{
  objc_storeWeak((id *)&self->_finishingOptionsTableView, a3);
}

- (UIPrintInfo)printInfo
{
  return self->_printInfo;
}

- (void)setPrintInfo:(id)a3
{
  objc_storeStrong((id *)&self->_printInfo, a3);
}

- (int64_t)finishingType
{
  return self->_finishingType;
}

- (void)setFinishingType:(int64_t)a3
{
  self->_finishingType = a3;
}

- (int64_t)viewType
{
  return self->_viewType;
}

- (void)setViewType:(int64_t)a3
{
  self->_viewType = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSArray)optionChoices
{
  return self->_optionChoices;
}

- (void)setOptionChoices:(id)a3
{
  objc_storeStrong((id *)&self->_optionChoices, a3);
}

- (UIPrintOptionCell)printerFinishingOptionCell
{
  return self->_printerFinishingOptionCell;
}

- (void)setPrinterFinishingOptionCell:(id)a3
{
  objc_storeStrong((id *)&self->_printerFinishingOptionCell, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printerFinishingOptionCell, 0);
  objc_storeStrong((id *)&self->_optionChoices, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_printInfo, 0);
  objc_destroyWeak((id *)&self->_finishingOptionsTableView);
  objc_destroyWeak((id *)&self->_printPanelViewController);
}

@end
