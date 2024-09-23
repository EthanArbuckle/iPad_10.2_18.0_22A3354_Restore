@implementation UIPrintOptionSection

- (UIPrintOptionSection)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  id v6;
  id v7;
  UIPrintOptionSection *v8;
  UIPrintOptionSection *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UIPrintOptionSection;
  v8 = -[UIPrintOptionSection init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[UIPrintOptionSection setPrintInfo:](v8, "setPrintInfo:", v6);
    -[UIPrintOptionSection setPrintPanelViewController:](v9, "setPrintPanelViewController:", v7);
  }

  return v9;
}

- (void)updateSectionSummary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[UIPrintOptionSection tableViewCell](self, "tableViewCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentConfiguration");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[UIPrintOptionSection summaryString](self, "summaryString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSecondaryText:", v4);

  -[UIPrintOptionSection tableViewCell](self, "tableViewCell");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentConfiguration:", v10);

  -[UIPrintOptionSection printPanelViewController](self, "printPanelViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "printOptionsTableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPrintOptionSection tableViewCell](self, "tableViewCell");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathForCell:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

}

- (id)summaryString
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[UIPrintOptionSection printOptions](self, "printOptions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "summary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          if (objc_msgSend(v3, "length"))
          {
            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR(" • "), CFSTR(" • "), CFSTR("Localizable"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "appendString:", v11);

          }
          objc_msgSend(v3, "appendString:", v9);
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (BOOL)updatePrintOptionsList
{
  return 0;
}

- (BOOL)shouldShow
{
  void *v3;
  BOOL v4;

  -[UIPrintOptionSection updatePrintOptionsList](self, "updatePrintOptionsList");
  -[UIPrintOptionSection printOptions](self, "printOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (BOOL)canDismiss
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[UIPrintOptionSection printOptions](self, "printOptions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "canDismiss"))
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)keyboardShowing
{
  return 0;
}

- (UIPrintPanelViewController)printPanelViewController
{
  return (UIPrintPanelViewController *)objc_loadWeakRetained((id *)&self->_printPanelViewController);
}

- (void)setPrintPanelViewController:(id)a3
{
  objc_storeWeak((id *)&self->_printPanelViewController, a3);
}

- (UIPrintInfo)printInfo
{
  return self->_printInfo;
}

- (void)setPrintInfo:(id)a3
{
  objc_storeStrong((id *)&self->_printInfo, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (UITableViewCell)tableViewCell
{
  return self->_tableViewCell;
}

- (void)setTableViewCell:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewCell, a3);
}

- (NSMutableArray)printOptions
{
  return self->_printOptions;
}

- (void)setPrintOptions:(id)a3
{
  objc_storeStrong((id *)&self->_printOptions, a3);
}

- (void)setShouldShow:(BOOL)a3
{
  self->_shouldShow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printOptions, 0);
  objc_storeStrong((id *)&self->_tableViewCell, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_printInfo, 0);
  objc_destroyWeak((id *)&self->_printPanelViewController);
}

@end
