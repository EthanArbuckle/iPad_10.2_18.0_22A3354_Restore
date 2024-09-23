@implementation UIPrintMediaTypeOption

- (UIPrintMediaTypeOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  UIPrintMediaTypeOption *v11;
  NSArray *mediaTypes;
  uint64_t v13;
  NSIndexPath *selectedIndexPath;
  void *v15;
  void *v16;
  objc_super v18;

  v6 = (void *)MEMORY[0x1E0CB34D0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Media Type"), CFSTR("Media Type"), CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintOption setTitle:](self, "setTitle:", v10);

  v18.receiver = self;
  v18.super_class = (Class)UIPrintMediaTypeOption;
  v11 = -[UIPrintOption initWithPrintInfo:printPanelViewController:](&v18, sel_initWithPrintInfo_printPanelViewController_, v8, v7);

  if (v11)
  {
    mediaTypes = v11->_mediaTypes;
    v11->_mediaTypes = 0;

    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    selectedIndexPath = v11->_selectedIndexPath;
    v11->_selectedIndexPath = (NSIndexPath *)v13;

    -[UIPrintMediaTypeOption currentPrinterChanged](v11, "currentPrinterChanged");
    -[UIPrintOption printInfo](v11, "printInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:forKeyPath:options:context:", v11, 0x1E9D98838, 0, 0);

    -[UIPrintOption printInfo](v11, "printInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:forKeyPath:options:context:", v11, 0x1E9D986F8, 0, 0);

  }
  return v11;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[UIPrintOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, 0x1E9D98838);

  -[UIPrintOption printInfo](self, "printInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, 0x1E9D986F8);

  v5.receiver = self;
  v5.super_class = (Class)UIPrintMediaTypeOption;
  -[UIPrintMediaTypeOption dealloc](&v5, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  UIPrintMediaTypeOption *v11;

  v7 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__UIPrintMediaTypeOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v9[3] = &unk_1E9D96E78;
  v10 = v7;
  v11 = self;
  v8 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

uint64_t __73__UIPrintMediaTypeOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
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
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  id v24;

  if (-[UIPrintMediaTypeOption shouldShow](self, "shouldShow"))
  {
    -[UIPrintOption printInfo](self, "printInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mediaType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[UIPrintMediaTypeOption mediaTypes](self, "mediaTypes");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");

      if (v6)
      {
        v7 = 0;
        v8 = *MEMORY[0x1E0D80B50];
        do
        {
          -[UIPrintMediaTypeOption mediaTypes](self, "mediaTypes");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndex:", v7);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "objectForKey:", v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIPrintOption printInfo](self, "printInfo");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "mediaType");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v11, "isEqualToString:", v13);

          if (v14)
          {
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v7, 0);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIPrintMediaTypeOption setSelectedIndexPath:](self, "setSelectedIndexPath:", v15);

            -[UIPrintOption tableViewCell](self, "tableViewCell");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "contentConfiguration");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            objc_opt_self();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "selectedMediaTypeName");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setSecondaryText:", v19);

            -[UIPrintOption tableViewCell](self, "tableViewCell");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setContentConfiguration:", v17);

          }
          ++v7;
          -[UIPrintMediaTypeOption mediaTypes](self, "mediaTypes");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "count");

        }
        while (v7 < v22);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrintMediaTypeOption setSelectedIndexPath:](self, "setSelectedIndexPath:", v23);

    }
    -[UIPrintMediaTypeOption summaryString](self, "summaryString");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    -[UIPrintOption setSummary:](self, "setSummary:", v24);

  }
}

- (NSArray)mediaTypes
{
  NSArray **p_mediaTypes;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  p_mediaTypes = &self->_mediaTypes;
  if (!self->_mediaTypes)
  {
    -[UIPrintOption printInfo](self, "printInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentPrinter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "printerInfoDict");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0C99DE8];
      -[UIPrintOption printInfo](self, "printInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "currentPrinter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "supportedMediaTypes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "arrayWithArray:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "sortUsingFunction:context:", compareMediaTypes, 0);
      if (objc_msgSend(v11, "count"))
        v12 = v11;
      else
        v12 = 0;
      objc_storeStrong((id *)p_mediaTypes, v12);

    }
  }
  return *p_mediaTypes;
}

- (void)currentPrinterChanged
{
  NSIndexPath *v3;
  NSIndexPath *selectedIndexPath;

  -[UIPrintMediaTypeOption setMediaTypes:](self, "setMediaTypes:", 0);
  -[UIPrintMediaTypeOption setMediaTypeNames:](self, "setMediaTypeNames:", 0);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
  v3 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
  selectedIndexPath = self->_selectedIndexPath;
  self->_selectedIndexPath = v3;

  -[UIPrintMediaTypeOption updateFromPrintInfo](self, "updateFromPrintInfo");
}

- (BOOL)shouldShow
{
  void *v3;
  void *v4;
  BOOL v5;

  -[UIPrintMediaTypeOption mediaTypes](self, "mediaTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIPrintMediaTypeOption mediaTypes](self, "mediaTypes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSMutableArray)mediaTypeNames
{
  UIPrintMediaTypeOption *v2;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSMutableArray *mediaTypeNames;
  UIPrintMediaTypeOption *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v2 = self;
  v32 = *MEMORY[0x1E0C80C00];
  if (!self->_mediaTypeNames)
  {
    -[UIPrintMediaTypeOption mediaTypes](self, "mediaTypes");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[UIPrintMediaTypeOption mediaTypes](v2, "mediaTypes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      if (v7)
      {
        v8 = (void *)MEMORY[0x1E0C99DE8];
        -[UIPrintMediaTypeOption mediaTypes](v2, "mediaTypes");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));
        v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();

        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v25 = v2;
        -[UIPrintMediaTypeOption mediaTypes](v2, "mediaTypes");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v28;
          v14 = *MEMORY[0x1E0D80B60];
          v15 = *MEMORY[0x1E0D80B50];
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v28 != v13)
                objc_enumerationMutation(obj);
              v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
              objc_msgSend(v17, "objectForKey:", v14);
              v18 = objc_claimAutoreleasedReturnValue();
              if (v18)
              {
                v19 = (void *)v18;
                objc_msgSend(v17, "objectForKey:", v15);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v20, "isEqualToString:", CFSTR("auto")) & 1) != 0
                  || objc_msgSend(v20, "isEqualToString:", CFSTR("any")))
                {
                  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Auto Select"), CFSTR("Auto Select"), CFSTR("Localizable"));
                  v22 = objc_claimAutoreleasedReturnValue();

                  v19 = (void *)v22;
                }
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v19, CFSTR("Title"));
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableArray addObject:](v10, "addObject:", v23);

              }
            }
            v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          }
          while (v12);
        }

        v2 = v25;
        mediaTypeNames = v25->_mediaTypeNames;
        v25->_mediaTypeNames = v10;

      }
    }
  }
  return v2->_mediaTypeNames;
}

- (id)itemList
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D20];
  -[UIPrintMediaTypeOption mediaTypeNames](self, "mediaTypeNames");
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
  -[UIPrintMediaTypeOption setSelectedIndexPath:](self, "setSelectedIndexPath:", v4);
  -[UIPrintMediaTypeOption mediaTypes](self, "mediaTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "row");

  objc_msgSend(v5, "objectAtIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D80B50]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintOption printInfo](self, "printInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMediaType:", v8);

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
  void *v9;

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

  -[UIPrintMediaTypeOption selectedMediaTypeName](self, "selectedMediaTypeName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSecondaryText:", v8);

  objc_msgSend(v5, "setContentConfiguration:", v6);
  objc_msgSend(v5, "setAccessoryType:", 1);
  objc_msgSend(v5, "setSelectionStyle:", 3);
  objc_msgSend(v5, "setItemListDelegate:", self);
  -[UIPrintOption setTableViewCell:](self, "setTableViewCell:", v5);
  -[UIPrintMediaTypeOption summaryString](self, "summaryString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintOption setSummary:](self, "setSummary:", v9);

  return v5;
}

- (id)selectedMediaTypeName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[UIPrintMediaTypeOption mediaTypeNames](self, "mediaTypeNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintMediaTypeOption selectedIndexPath](self, "selectedIndexPath");
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

  -[UIPrintMediaTypeOption selectedIndexPath](self, "selectedIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "row");

  if (v4)
  {
    -[UIPrintMediaTypeOption selectedMediaTypeName](self, "selectedMediaTypeName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Auto Select Media Type"), CFSTR("Auto Select Media Type"), CFSTR("Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)didSelectPrintOption
{
  id v2;

  -[UIPrintOption tableViewCell](self, "tableViewCell");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "printOptionCellTapped");

}

- (void)setMediaTypes:(id)a3
{
  objc_storeStrong((id *)&self->_mediaTypes, a3);
}

- (void)setMediaTypeNames:(id)a3
{
  objc_storeStrong((id *)&self->_mediaTypeNames, a3);
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_selectedIndexPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_mediaTypeNames, 0);
  objc_storeStrong((id *)&self->_mediaTypes, 0);
}

@end
