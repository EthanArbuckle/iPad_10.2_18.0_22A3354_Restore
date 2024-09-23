@implementation UIPrintPaperSizeOption

- (void)dealloc
{
  OS_dispatch_queue *pkPrinterQueue;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  pkPrinterQueue = self->_pkPrinterQueue;
  self->_pkPrinterQueue = 0;

  -[UIPrintPaperSizeOption observedPrinter](self, "observedPrinter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, 0x1E9D99738);

  -[UIPrintOption printInfo](self, "printInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:", self, 0x1E9D98778);

  -[UIPrintOption printInfo](self, "printInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:forKeyPath:", self, 0x1E9D986F8);

  v7.receiver = self;
  v7.super_class = (Class)UIPrintPaperSizeOption;
  -[UIPrintPaperSizeOption dealloc](&v7, sel_dealloc);
}

- (UIPrintPaperSizeOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  id v6;
  UIPrintPaperSizeOption *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSIndexPath *selectedIndexPath;
  dispatch_queue_t v12;
  OS_dispatch_queue *pkPrinterQueue;
  void *v14;
  uint64_t v15;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v33;

  v6 = a3;
  v33.receiver = self;
  v33.super_class = (Class)UIPrintPaperSizeOption;
  v7 = -[UIPrintOption initWithPrintInfo:printPanelViewController:](&v33, sel_initWithPrintInfo_printPanelViewController_, v6, a4);
  if (!v7)
    goto LABEL_17;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Paper Size"), CFSTR("Paper Size"), CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintOption setTitle:](v7, "setTitle:", v9);

  -[UIPrintPaperSizeOption defaultPaperIndex](v7, "defaultPaperIndex");
  v10 = objc_claimAutoreleasedReturnValue();
  selectedIndexPath = v7->_selectedIndexPath;
  v7->_selectedIndexPath = (NSIndexPath *)v10;

  v12 = dispatch_queue_create("com.apple.UIKit.UIPrintPaperSizeOption.pkPrinter", 0);
  pkPrinterQueue = v7->_pkPrinterQueue;
  v7->_pkPrinterQueue = (OS_dispatch_queue *)v12;

  -[UIPrintOption printInfo](v7, "printInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "currentPrinter");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[UIPrintOption printInfo](v7, "printInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "currentPrinter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "printerInfoDict");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
      goto LABEL_7;
  }
  else
  {

  }
  -[UIPrintPaperSizeOption updateSelectedPaper](v7, "updateSelectedPaper");
LABEL_7:
  -[UIPrintOption printInfo](v7, "printInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "currentPrinter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[UIPrintOption printPanelViewController](v7, "printPanelViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "printInteractionController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "_canShowPaperList"))
    {
      -[UIPrintOption printInfo](v7, "printInfo");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "currentPrinter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "printerInfoDict");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        -[UIPrintPaperSizeOption loadedPaperSizes](v7, "loadedPaperSizes");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPrintOption setShouldShow:](v7, "setShouldShow:", objc_msgSend(v27, "count") != 0);

      }
      else
      {
        -[UIPrintOption setShouldShow:](v7, "setShouldShow:", 0);
      }

    }
    else
    {
      -[UIPrintOption setShouldShow:](v7, "setShouldShow:", 0);
    }

  }
  else
  {
    -[UIPrintOption setShouldShow:](v7, "setShouldShow:", 1);
  }
  objc_msgSend(v6, "currentPrinter");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPaperSizeOption setObservedPrinter:](v7, "setObservedPrinter:", v28);

  -[UIPrintPaperSizeOption observedPrinter](v7, "observedPrinter");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObserver:forKeyPath:options:context:", v7, 0x1E9D99738, 0, 0);

  -[UIPrintOption printInfo](v7, "printInfo");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObserver:forKeyPath:options:context:", v7, 0x1E9D98778, 0, 0);

  -[UIPrintOption printInfo](v7, "printInfo");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObserver:forKeyPath:options:context:", v7, 0x1E9D986F8, 0, 0);

LABEL_17:
  return v7;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  UIPrintPaperSizeOption *v11;

  v7 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__UIPrintPaperSizeOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v9[3] = &unk_1E9D96E78;
  v10 = v7;
  v11 = self;
  v8 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

uint64_t __73__UIPrintPaperSizeOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", 0x1E9D986F8))
  {
    objc_msgSend(*(id *)(a1 + 40), "observedPrinter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeObserver:forKeyPath:", *(_QWORD *)(a1 + 40), 0x1E9D99738);

    objc_msgSend(*(id *)(a1 + 40), "printInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentPrinter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObservedPrinter:", v4);

    objc_msgSend(*(id *)(a1 + 40), "observedPrinter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 40), 0x1E9D99738, 0, 0);

    return objc_msgSend(*(id *)(a1 + 40), "currentPrinterChanged");
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", 0x1E9D98778))
    return objc_msgSend(*(id *)(a1 + 40), "updateSelectedPaper");
  result = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", 0x1E9D99738);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "currentPrinterChanged");
  return result;
}

- (id)_removeRollsFrom:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a3;
  objc_msgSend(v3, "predicateWithBlock:", &__block_literal_global_5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __43__UIPrintPaperSizeOption__removeRollsFrom___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "_pkPaper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRoll") ^ 1;

  return v3;
}

- (id)paperList
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;

  -[UIPrintOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPrinter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    && (objc_msgSend(v4, "printerInfoDict"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, !v5))
  {
    v18 = 0;
  }
  else
  {
    -[UIPrintOption printPanelViewController](self, "printPanelViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "printInteractionController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_printItemContentSize");
    v9 = v8;
    v11 = v10;

    if (v4)
    {
      -[UIPrintOption printInfo](self, "printInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "scaleUp");

      objc_msgSend(v4, "_internalPrinter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrintOption printInfo](self, "printInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "duplex");
      if (v13)
      {
        +[UIPrintPaper _readyDocumentPaperListForPrinter:withDuplexMode:contentSize:scaleUpForRoll:](UIPrintPaper, "_readyDocumentPaperListForPrinter:withDuplexMode:contentSize:scaleUpForRoll:", v14, v16, 1, v9, v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[UIPrintOption printInfo](self, "printInfo");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIPrintPaper _readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:](UIPrintPaper, "_readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:", v14, v16, objc_msgSend(v19, "outputType"), v9, v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      -[UIPrintOption printInfo](self, "printInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIPrintPaper _genericPaperListForOutputType:](UIPrintPaper, "_genericPaperListForOutputType:", objc_msgSend(v14, "outputType"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (v9 == *MEMORY[0x1E0C9D820] && v11 == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      -[UIPrintPaperSizeOption _removeRollsFrom:](self, "_removeRollsFrom:", v17);
      v21 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v21;
    }
    objc_msgSend(v17, "sortedArrayUsingComparator:", &__block_literal_global_507);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v18;
}

uint64_t __35__UIPrintPaperSizeOption_paperList__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "_pkPaper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_pkPaper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "localizedName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "localizedCompare:", v8);

  return v9;
}

- (NSArray)loadedPaperSizes
{
  NSArray *loadedPaperSizes;
  NSArray *v4;
  NSArray *v5;

  loadedPaperSizes = self->_loadedPaperSizes;
  if (!loadedPaperSizes)
  {
    -[UIPrintPaperSizeOption paperList](self, "paperList");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_loadedPaperSizes;
    self->_loadedPaperSizes = v4;

    loadedPaperSizes = self->_loadedPaperSizes;
  }
  return loadedPaperSizes;
}

- (NSArray)loadedPaperNames
{
  NSArray *loadedPaperNames;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  loadedPaperNames = self->_loadedPaperNames;
  if (!loadedPaperNames)
  {
    -[UIPrintPaperSizeOption loadedPaperSizes](self, "loadedPaperSizes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPaperSizeOption getPaperNames:](self, "getPaperNames:", v4);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_loadedPaperNames;
    self->_loadedPaperNames = v5;

    loadedPaperNames = self->_loadedPaperNames;
  }
  return loadedPaperNames;
}

- (NSArray)supportedPaperNames
{
  void *v3;
  NSArray *supportedPaperNames;
  void *v5;
  NSArray *v6;
  NSArray *v7;

  -[UIPrintPaperSizeOption supportedPaperSizes](self, "supportedPaperSizes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    supportedPaperNames = self->_supportedPaperNames;

    if (!supportedPaperNames)
    {
      -[UIPrintPaperSizeOption supportedPaperSizes](self, "supportedPaperSizes");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrintPaperSizeOption getPaperNames:](self, "getPaperNames:", v5);
      v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v7 = self->_supportedPaperNames;
      self->_supportedPaperNames = v6;

    }
  }
  return self->_supportedPaperNames;
}

- (id)getPaperNames:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
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
  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v11, "_localizedName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKey:", v12, CFSTR("Title"));
            objc_msgSend(v11, "_localizedMediaTypeName");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
              objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("SubTitle"));
            objc_msgSend(v5, "addObject:", v13);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)itemList
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPaperSizeOption loadedPaperNames](self, "loadedPaperNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIPrintPaperSizeOption loadedPaperNames](self, "loadedPaperNames");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  -[UIPrintPaperSizeOption supportedPaperNames](self, "supportedPaperNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIPrintPaperSizeOption supportedPaperNames](self, "supportedPaperNames");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  if (objc_msgSend(v3, "count"))
    v8 = v3;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

- (int64_t)listItemSelected:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[UIPrintPaperSizeOption setSelectedIndexPath:](self, "setSelectedIndexPath:", v4);
  -[UIPrintPaperSizeOption loadedPaperSizes](self, "loadedPaperSizes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "row");

  objc_msgSend(v5, "objectAtIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPrintOption printPanelViewController](self, "printPanelViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "printInteractionController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPaper:", v7);

  -[UIPrintOption printInfo](self, "printInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPrintPaper:", v7);

  return 1;
}

- (id)printOptionTableViewCell
{
  UIPrintOptionListCell *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(UIPrintOptionListCell);
  objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintOption title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v5);

  -[UIPrintPaperSizeOption summary](self, "summary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSecondaryText:", v6);

  -[UIPrintOptionListCell setContentConfiguration:](v3, "setContentConfiguration:", v4);
  -[UIPrintOptionListCell setAccessoryType:](v3, "setAccessoryType:", 1);
  -[UIPrintOptionListCell setSelectionStyle:](v3, "setSelectionStyle:", 3);
  -[UIPrintOptionListCell setItemListDelegate:](v3, "setItemListDelegate:", self);
  -[UIPrintOption setTableViewCell:](self, "setTableViewCell:", v3);

  return v3;
}

- (id)defaultPaperIndex
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintOption printInfo](self, "printInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentPrinter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

LABEL_14:
    return v3;
  }
  -[UIPrintPaperSizeOption loadedPaperSizes](self, "loadedPaperSizes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D80A58], "defaultGenericPaperForLocale:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[UIPrintPaperSizeOption loadedPaperSizes](self, "loadedPaperSizes", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v12, "_pkPaper");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualSizeAndMediaType:", v4);

          if (v14)
          {
            v15 = (void *)MEMORY[0x1E0CB36B0];
            -[UIPrintPaperSizeOption loadedPaperSizes](self, "loadedPaperSizes");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "indexPathForRow:inSection:", objc_msgSend(v16, "indexOfObject:", v12), 0);
            v17 = objc_claimAutoreleasedReturnValue();

            v3 = (void *)v17;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }

    goto LABEL_14;
  }
  return v3;
}

- (void)updateSelectedPaper
{
  NSObject *pkPrinterQueue;
  _QWORD block[5];

  pkPrinterQueue = self->_pkPrinterQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__UIPrintPaperSizeOption_updateSelectedPaper__block_invoke;
  block[3] = &unk_1E9D96D90;
  block[4] = self;
  dispatch_async(pkPrinterQueue, block);
}

void __45__UIPrintPaperSizeOption_updateSelectedPaper__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD block[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "printInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "printPaper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_pkPaper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "loadedPaperSizes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v10), "_pkPaper");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualSizeAndMediaType:", v4);

        if (v12)
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v8 + v10, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setSelectedIndexPath:", v13);

          if (pthread_main_np() == 1)
          {
            objc_msgSend(*(id *)(a1 + 32), "tableViewCell");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "contentConfiguration");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 32), "summary");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setSecondaryText:", v16);

            objc_msgSend(*(id *)(a1 + 32), "tableViewCell");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setContentConfiguration:", v15);

          }
          else
          {
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __45__UIPrintPaperSizeOption_updateSelectedPaper__block_invoke_2;
            block[3] = &unk_1E9D96D90;
            block[4] = *(_QWORD *)(a1 + 32);
            dispatch_sync(MEMORY[0x1E0C80D38], block);
          }
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v8 += v10;
    }
    while (v7);
  }

}

void __45__UIPrintPaperSizeOption_updateSelectedPaper__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "tableViewCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "summary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecondaryText:", v3);

  objc_msgSend(*(id *)(a1 + 32), "tableViewCell");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentConfiguration:", v5);

}

- (void)currentPrinterChanged
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[UIPrintPaperSizeOption setLoadedPaperSizes:](self, "setLoadedPaperSizes:", 0);
  -[UIPrintPaperSizeOption setLoadedPaperNames:](self, "setLoadedPaperNames:", 0);
  -[UIPrintPaperSizeOption setSupportedPaperSizes:](self, "setSupportedPaperSizes:", 0);
  -[UIPrintPaperSizeOption setSupportedPaperNames:](self, "setSupportedPaperNames:", 0);
  -[UIPrintPaperSizeOption defaultPaperIndex](self, "defaultPaperIndex");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPaperSizeOption setSelectedIndexPath:](self, "setSelectedIndexPath:", v3);

  -[UIPrintPaperSizeOption updateSelectedPaper](self, "updateSelectedPaper");
  -[UIPrintOption printInfo](self, "printInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentPrinter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIPrintOption printPanelViewController](self, "printPanelViewController");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "printInteractionController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "_canShowPaperList"))
    {
      -[UIPrintOption printInfo](self, "printInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "currentPrinter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "printerInfoDict");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[UIPrintPaperSizeOption loadedPaperSizes](self, "loadedPaperSizes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPrintOption setShouldShow:](self, "setShouldShow:", objc_msgSend(v10, "count") != 0);

      }
      else
      {
        -[UIPrintOption setShouldShow:](self, "setShouldShow:", 0);
      }

    }
    else
    {
      -[UIPrintOption setShouldShow:](self, "setShouldShow:", 0);
    }

  }
  else
  {
    -[UIPrintOption setShouldShow:](self, "setShouldShow:", 1);
  }
}

- (id)summary
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  -[UIPrintPaperSizeOption selectedIndexPath](self, "selectedIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "section") == 1)
  {
    -[UIPrintPaperSizeOption supportedPaperNames](self, "supportedPaperNames");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIPrintPaperSizeOption loadedPaperNames](self, "loadedPaperNames");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      -[UIPrintPaperSizeOption loadedPaperNames](self, "loadedPaperNames");
    else
      -[UIPrintPaperSizeOption supportedPaperNames](self, "supportedPaperNames");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v6 = objc_msgSend(v4, "count");
  -[UIPrintPaperSizeOption selectedIndexPath](self, "selectedIndexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "row");

  if (v6 <= v8)
  {
    v11 = 0;
  }
  else
  {
    -[UIPrintPaperSizeOption selectedIndexPath](self, "selectedIndexPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", objc_msgSend(v9, "row"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("Title"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
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

- (void)setLoadedPaperSizes:(id)a3
{
  objc_storeStrong((id *)&self->_loadedPaperSizes, a3);
}

- (NSArray)supportedPaperSizes
{
  return self->_supportedPaperSizes;
}

- (void)setSupportedPaperSizes:(id)a3
{
  objc_storeStrong((id *)&self->_supportedPaperSizes, a3);
}

- (void)setLoadedPaperNames:(id)a3
{
  objc_storeStrong((id *)&self->_loadedPaperNames, a3);
}

- (void)setSupportedPaperNames:(id)a3
{
  objc_storeStrong((id *)&self->_supportedPaperNames, a3);
}

- (UIPrinter)observedPrinter
{
  return self->_observedPrinter;
}

- (void)setObservedPrinter:(id)a3
{
  objc_storeStrong((id *)&self->_observedPrinter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedPrinter, 0);
  objc_storeStrong((id *)&self->_supportedPaperNames, 0);
  objc_storeStrong((id *)&self->_loadedPaperNames, 0);
  objc_storeStrong((id *)&self->_supportedPaperSizes, 0);
  objc_storeStrong((id *)&self->_loadedPaperSizes, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_pkPrinterQueue, 0);
}

@end
