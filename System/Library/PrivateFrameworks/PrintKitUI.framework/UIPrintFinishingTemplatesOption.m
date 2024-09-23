@implementation UIPrintFinishingTemplatesOption

- (UIPrintFinishingTemplatesOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4 finishingOptionsTableView:(id)a5
{
  id v8;
  id v9;
  id v10;
  UIPrintFinishingTemplatesOption *v11;
  UIPrintFinishingTemplatesOption *v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)UIPrintFinishingTemplatesOption;
  v11 = -[UIPrintFinishingTemplatesOption init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    -[UIPrintFinishingTemplatesOption setPrintInfo:](v11, "setPrintInfo:", v8);
    -[UIPrintFinishingTemplatesOption setPrintPanelViewController:](v12, "setPrintPanelViewController:", v9);
    -[UIPrintFinishingTemplatesOption setFinishingOptionsTableView:](v12, "setFinishingOptionsTableView:", v10);
    -[UIPrintFinishingTemplatesOption setSelectedTemplate:](v12, "setSelectedTemplate:", 0);
    -[UIPrintFinishingTemplatesOption printInfo](v12, "printInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:forKeyPath:options:context:", v12, 0x1E9D98998, 0, 0);

  }
  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[UIPrintFinishingTemplatesOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, 0x1E9D98998);

  v4.receiver = self;
  v4.super_class = (Class)UIPrintFinishingTemplatesOption;
  -[UIPrintFinishingTemplatesOption dealloc](&v4, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__UIPrintFinishingTemplatesOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E9D96D90;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __82__UIPrintFinishingTemplatesOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
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
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[UIPrintFinishingTemplatesOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishingTemplate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[UIPrintFinishingTemplatesOption printInfo](self, "printInfo", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentPrinter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finishingTemplates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    v11 = *MEMORY[0x1E0D80AD8];
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v13, "objectForKey:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqualToString:", v4))
        {
          -[UIPrintFinishingTemplatesOption printInfo](self, "printInfo");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "currentPrinter");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "finishingTemplates");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIPrintFinishingTemplatesOption setSelectedTemplate:](self, "setSelectedTemplate:", objc_msgSend(v17, "indexOfObject:", v13));

          goto LABEL_11;
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  -[UIPrintFinishingTemplatesOption finishingTemplatesCell](self, "finishingTemplatesCell");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "contentConfiguration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPrintFinishingTemplatesOption summary](self, "summary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setSecondaryText:", v20);

  -[UIPrintFinishingTemplatesOption finishingTemplatesCell](self, "finishingTemplatesCell");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setContentConfiguration:", v19);

}

- (BOOL)shouldShow
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
  BOOL v12;

  -[UIPrintFinishingTemplatesOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPrinter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "printerInfoDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[UIPrintFinishingTemplatesOption printInfo](self, "printInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentPrinter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishingTemplates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[UIPrintFinishingTemplatesOption printInfo](self, "printInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "currentPrinter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "finishingTemplates");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count") != 0;

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)title
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Finishing Template"), CFSTR("Finishing Template"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)summary
{
  void *v3;
  void *v4;
  void *v5;

  -[UIPrintFinishingTemplatesOption finishingTemplateNames](self, "finishingTemplateNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", -[UIPrintFinishingTemplatesOption selectedTemplate](self, "selectedTemplate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("Title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)itemList
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D20];
  -[UIPrintFinishingTemplatesOption finishingTemplateNames](self, "finishingTemplateNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)selectedItem
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", -[UIPrintFinishingTemplatesOption selectedTemplate](self, "selectedTemplate"), 0);
}

- (int64_t)listItemSelected:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[UIPrintFinishingTemplatesOption setSelectedTemplate:](self, "setSelectedTemplate:", objc_msgSend(v4, "row"));
  -[UIPrintFinishingTemplatesOption printInfo](self, "printInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentPrinter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finishingTemplates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "row");

  objc_msgSend(v7, "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D80AD8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintFinishingTemplatesOption printInfo](self, "printInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFinishingTemplate:", v10);

  return 1;
}

- (NSMutableArray)finishingTemplateNames
{
  UIPrintFinishingTemplatesOption *v2;
  void *v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSMutableArray *v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  NSMutableArray *finishingTemplateNames;
  NSMutableArray *v26;
  void *v28;
  UIPrintFinishingTemplatesOption *v29;
  uint64_t v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v2 = self;
  v37 = *MEMORY[0x1E0C80C00];
  -[UIPrintFinishingTemplatesOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPrinter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishingTemplates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2->_finishingTemplateNames && v5 && objc_msgSend(v5, "count"))
  {
    v29 = v2;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v28 = v5;
    obj = v5;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v33;
      v10 = *MEMORY[0x1E0D80AE8];
      v11 = CFSTR("none");
      v12 = *MEMORY[0x1E0D80AD8];
      do
      {
        v13 = 0;
        v30 = v8;
        do
        {
          if (*(_QWORD *)v33 != v9)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v13);
          objc_msgSend(v14, "objectForKey:", v10, v28);
          v15 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKey:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "isEqualToString:", v11))
          {
            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("No finishing template"), CFSTR("No finishing template"), CFSTR("Localizable"));
            v18 = v12;
            v19 = v10;
            v20 = v9;
            v21 = v6;
            v22 = v11;
            v23 = objc_claimAutoreleasedReturnValue();

            v15 = (id)v23;
            v11 = v22;
            v6 = v21;
            v9 = v20;
            v10 = v19;
            v12 = v18;
            v8 = v30;
          }
          else if (!v15)
          {
            v15 = v16;
          }
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v15, CFSTR("Title"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v6, "addObject:", v24);

          ++v13;
        }
        while (v8 != v13);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v8);
    }

    v2 = v29;
    finishingTemplateNames = v29->_finishingTemplateNames;
    v29->_finishingTemplateNames = v6;

    v5 = v28;
  }
  v26 = v2->_finishingTemplateNames;

  return v26;
}

- (UIPrintPanelViewController)printPanelViewController
{
  return (UIPrintPanelViewController *)objc_loadWeakRetained((id *)&self->_printPanelViewController);
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

- (void)setFinishingTemplateNames:(id)a3
{
  objc_storeStrong((id *)&self->_finishingTemplateNames, a3);
}

- (UIPrintInfo)printInfo
{
  return self->_printInfo;
}

- (void)setPrintInfo:(id)a3
{
  objc_storeStrong((id *)&self->_printInfo, a3);
}

- (int64_t)selectedTemplate
{
  return self->_selectedTemplate;
}

- (void)setSelectedTemplate:(int64_t)a3
{
  self->_selectedTemplate = a3;
}

- (UITableViewCell)finishingTemplatesCell
{
  return self->_finishingTemplatesCell;
}

- (void)setFinishingTemplatesCell:(id)a3
{
  objc_storeStrong((id *)&self->_finishingTemplatesCell, a3);
}

- (void)setSummary:(id)a3
{
  objc_storeStrong((id *)&self->_summary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_finishingTemplatesCell, 0);
  objc_storeStrong((id *)&self->_printInfo, 0);
  objc_storeStrong((id *)&self->_finishingTemplateNames, 0);
  objc_destroyWeak((id *)&self->_finishingOptionsTableView);
  objc_destroyWeak((id *)&self->_printPanelViewController);
}

@end
