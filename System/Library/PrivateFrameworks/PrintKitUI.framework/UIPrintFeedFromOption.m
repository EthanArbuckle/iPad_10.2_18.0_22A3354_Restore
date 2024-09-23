@implementation UIPrintFeedFromOption

- (UIPrintFeedFromOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  UIPrintFeedFromOption *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIPrintFeedFromOption;
  v4 = -[UIPrintOption initWithPrintInfo:printPanelViewController:](&v11, sel_initWithPrintInfo_printPanelViewController_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Feed From"), CFSTR("Feed From"), CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintOption setTitle:](v4, "setTitle:", v6);

    -[UIPrintFeedFromOption setTrays:](v4, "setTrays:", 0);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintFeedFromOption setSelectedIndexPath:](v4, "setSelectedIndexPath:", v7);

    -[UIPrintFeedFromOption currentPrinterChanged](v4, "currentPrinterChanged");
    -[UIPrintOption printInfo](v4, "printInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:forKeyPath:options:context:", v4, 0x1E9D98858, 0, 0);

    -[UIPrintOption printInfo](v4, "printInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:forKeyPath:options:context:", v4, 0x1E9D986F8, 0, 0);

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
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, 0x1E9D98858);

  -[UIPrintOption printInfo](self, "printInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, 0x1E9D986F8);

  v5.receiver = self;
  v5.super_class = (Class)UIPrintFeedFromOption;
  -[UIPrintFeedFromOption dealloc](&v5, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  UIPrintFeedFromOption *v11;

  v7 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__UIPrintFeedFromOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v9[3] = &unk_1E9D96E78;
  v10 = v7;
  v11 = self;
  v8 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

uint64_t __72__UIPrintFeedFromOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", 0x1E9D986F8);
  v3 = *(void **)(a1 + 40);
  if (v2)
    return objc_msgSend(v3, "currentPrinterChanged");
  else
    return objc_msgSend(v3, "updateFromPrintInfo");
}

- (void)updateFromPrintInfo
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  id v25;

  if (-[UIPrintFeedFromOption shouldShow](self, "shouldShow"))
  {
    -[UIPrintOption printInfo](self, "printInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "inputSlot");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[UIPrintFeedFromOption trays](self, "trays");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");

      if (v6)
      {
        v7 = 0;
        v8 = *MEMORY[0x1E0D80AF8];
        do
        {
          -[UIPrintFeedFromOption trays](self, "trays");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndex:", v7);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "allKeys");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "containsObject:", v8);

          if (v12)
          {
            objc_msgSend(v10, "objectForKey:", v8);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIPrintOption printInfo](self, "printInfo");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "inputSlot");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v13, "isEqualToString:", v15);

            if (v16)
            {
              objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v7, 0);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIPrintFeedFromOption setSelectedIndexPath:](self, "setSelectedIndexPath:", v17);

              -[UIPrintOption tableViewCell](self, "tableViewCell");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "contentConfiguration");
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              -[UIPrintFeedFromOption selectedTrayName](self, "selectedTrayName");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setSecondaryText:", v20);

              -[UIPrintOption tableViewCell](self, "tableViewCell");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setContentConfiguration:", v19);

            }
          }

          ++v7;
          -[UIPrintFeedFromOption trays](self, "trays");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "count");

        }
        while (v7 < v23);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrintFeedFromOption setSelectedIndexPath:](self, "setSelectedIndexPath:", v24);

    }
    -[UIPrintFeedFromOption summaryString](self, "summaryString");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    -[UIPrintOption setSummary:](self, "setSummary:", v25);

  }
}

- (BOOL)shouldShow
{
  void *v3;
  void *v4;
  BOOL v5;

  -[UIPrintFeedFromOption trays](self, "trays");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIPrintFeedFromOption trays](self, "trays");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSMutableArray)trayNames
{
  UIPrintFeedFromOption *v2;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableArray *trayNames;
  UIPrintFeedFromOption *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v2 = self;
  v29 = *MEMORY[0x1E0C80C00];
  if (!self->_trayNames)
  {
    -[UIPrintFeedFromOption trays](self, "trays");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[UIPrintFeedFromOption trays](v2, "trays");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      if (v7)
      {
        v8 = (void *)MEMORY[0x1E0C99DE8];
        -[UIPrintFeedFromOption trays](v2, "trays");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));
        v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();

        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v23 = v2;
        -[UIPrintFeedFromOption trays](v2, "trays");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v25;
          v15 = *MEMORY[0x1E0D80B08];
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v25 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "objectForKey:", v15);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (v17)
              {
                v18 = v17;
                if ((objc_msgSend(v17, "isEqualToString:", CFSTR("auto")) & 1) != 0
                  || objc_msgSend(v18, "isEqualToString:", CFSTR("any")))
                {
                  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Auto Select"), CFSTR("Auto Select"), CFSTR("Localizable"));
                  v20 = (void *)objc_claimAutoreleasedReturnValue();

                  v18 = v19;
                }
                else
                {
                  -[UIPrintFeedFromOption capitalizeFirstLetter:](v23, "capitalizeFirstLetter:", v18);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                }

                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v20, CFSTR("Title"));
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableArray addObject:](v10, "addObject:", v21);

              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          }
          while (v13);
        }

        v2 = v23;
        trayNames = v23->_trayNames;
        v23->_trayNames = v10;

      }
    }
  }
  return v2->_trayNames;
}

- (id)capitalizeFirstLetter:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "substringToIndex:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", 0, 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)itemList
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D20];
  -[UIPrintFeedFromOption trayNames](self, "trayNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)listItemSelected:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[UIPrintFeedFromOption setSelectedIndexPath:](self, "setSelectedIndexPath:", v4);
  -[UIPrintFeedFromOption trays](self, "trays");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "row");

  objc_msgSend(v5, "objectAtIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D80AF8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintOption printInfo](self, "printInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setInputSlot:", v8);

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

  -[UIPrintFeedFromOption selectedTrayName](self, "selectedTrayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSecondaryText:", v8);

  objc_msgSend(v5, "setContentConfiguration:", v6);
  objc_msgSend(v5, "setAccessoryType:", 1);
  objc_msgSend(v5, "setSelectionStyle:", 3);
  objc_msgSend(v5, "setItemListDelegate:", self);
  -[UIPrintOption setTableViewCell:](self, "setTableViewCell:", v5);

  return v5;
}

- (NSArray)trays
{
  NSArray **p_trays;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;

  p_trays = &self->_trays;
  if (self->_trays)
    return *p_trays;
  -[UIPrintOption printInfo](self, "printInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentPrinter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "printerInfoDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    return *p_trays;
  -[UIPrintOption printInfo](self, "printInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentPrinter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "supportedTrays");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 || (unint64_t)objc_msgSend(v9, "count") < 2)
    goto LABEL_9;
  if (objc_msgSend(v9, "count") != 2)
    goto LABEL_15;
  objc_msgSend(v9, "objectAtIndex:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0D80AF8];
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D80AF8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectAtIndex:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v12, "isEqual:", CFSTR("auto")) & 1) == 0)
  {
    v15 = objc_msgSend(v14, "isEqual:", CFSTR("auto"));

    if ((v15 & 1) != 0)
      goto LABEL_9;
LABEL_15:
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sortUsingFunction:context:", compareTrayNames, 0);
    goto LABEL_10;
  }

LABEL_9:
  v16 = 0;
LABEL_10:
  if (objc_msgSend(v16, "count"))
    v17 = v16;
  else
    v17 = 0;
  objc_storeStrong((id *)p_trays, v17);

  return *p_trays;
}

- (void)currentPrinterChanged
{
  NSIndexPath *v3;
  NSIndexPath *selectedIndexPath;

  -[UIPrintFeedFromOption setTrays:](self, "setTrays:", 0);
  -[UIPrintFeedFromOption setTrayNames:](self, "setTrayNames:", 0);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
  v3 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
  selectedIndexPath = self->_selectedIndexPath;
  self->_selectedIndexPath = v3;

  -[UIPrintFeedFromOption updateFromPrintInfo](self, "updateFromPrintInfo");
}

- (id)selectedTrayName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[UIPrintFeedFromOption trayNames](self, "trayNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintFeedFromOption selectedIndexPath](self, "selectedIndexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", objc_msgSend(v4, "row"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("Title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)summaryString
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[UIPrintFeedFromOption selectedIndexPath](self, "selectedIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "row");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Feed From %@"), CFSTR("Feed From %@"), CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintFeedFromOption selectedTrayName](self, "selectedTrayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Auto Select Feed"), CFSTR("Auto Select Feed"), CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)didSelectPrintOption
{
  id v2;

  -[UIPrintOption tableViewCell](self, "tableViewCell");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "printOptionCellTapped");

}

- (void)setTrays:(id)a3
{
  objc_storeStrong((id *)&self->_trays, a3);
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_selectedIndexPath, a3);
}

- (void)setTrayNames:(id)a3
{
  objc_storeStrong((id *)&self->_trayNames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trayNames, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_trays, 0);
}

@end
