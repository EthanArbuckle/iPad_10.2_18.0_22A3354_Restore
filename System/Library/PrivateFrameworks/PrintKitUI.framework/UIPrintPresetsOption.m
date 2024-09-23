@implementation UIPrintPresetsOption

- (UIPrintPresetsOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  id v6;
  UIPrintPresetsOption *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)UIPrintPresetsOption;
  v7 = -[UIPrintOption initWithPrintInfo:printPanelViewController:](&v18, sel_initWithPrintInfo_printPanelViewController_, v6, a4);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Presets"), CFSTR("Presets"), CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintOption setTitle:](v7, "setTitle:", v9);

    -[UIPrintPresetsOption setPresets:](v7, "setPresets:", 0);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPresetsOption setSelectedIndexPath:](v7, "setSelectedIndexPath:", v10);

    -[UIPrintPresetsOption updateFromPrintInfo](v7, "updateFromPrintInfo");
    -[UIPrintOption printInfo](v7, "printInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:forKeyPath:options:context:", v7, 0x1E9D98738, 0, 0);

    -[UIPrintOption printInfo](v7, "printInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:forKeyPath:options:context:", v7, 0x1E9D986F8, 0, 0);

    objc_msgSend(v6, "currentPrinter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPresetsOption setObservedPrinter:](v7, "setObservedPrinter:", v13);

    -[UIPrintPresetsOption observedPrinter](v7, "observedPrinter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:forKeyPath:options:context:", v7, 0x1E9D99738, 0, 0);

    -[UIPrintOption printInfo](v7, "printInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    -[UIPrintPresetsOption setOrigPrintInfo:](v7, "setOrigPrintInfo:", v16);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[UIPrintOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, 0x1E9D98738);

  -[UIPrintOption printInfo](self, "printInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, 0x1E9D986F8);

  -[UIPrintPresetsOption observedPrinter](self, "observedPrinter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:", self, 0x1E9D99738);

  v6.receiver = self;
  v6.super_class = (Class)UIPrintPresetsOption;
  -[UIPrintPresetsOption dealloc](&v6, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  UIPrintPresetsOption *v11;

  v7 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__UIPrintPresetsOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v9[3] = &unk_1E9D96E78;
  v10 = v7;
  v11 = self;
  v8 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

uint64_t __71__UIPrintPresetsOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

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

    objc_msgSend(*(id *)(a1 + 40), "currentPrinterChanged");
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", 0x1E9D99738))
  {
    objc_msgSend(*(id *)(a1 + 40), "updatePresetsList");
  }
  return objc_msgSend(*(id *)(a1 + 40), "updateFromPrintInfo");
}

- (BOOL)shouldShow
{
  void *v3;
  void *v4;
  BOOL v5;

  -[UIPrintPresetsOption presets](self, "presets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIPrintPresetsOption presets](self, "presets");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)updateFromPrintInfo
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
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[UIPrintOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jobPreset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("PresetTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[UIPrintPresetsOption presets](self, "presets", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v10);
      objc_msgSend(v11, "objectForKey:", CFSTR("PresetTitle"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "isEqualToString:", v5) & 1) != 0)
        break;

      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    -[UIPrintPresetsOption presets](self, "presets");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "indexOfObject:", v11);

    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v14, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      goto LABEL_12;
  }
  else
  {
LABEL_9:

  }
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
  -[UIPrintPresetsOption setSelectedIndexPath:](self, "setSelectedIndexPath:", v15);

  -[UIPrintOption tableViewCell](self, "tableViewCell");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "contentConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPrintPresetsOption summary](self, "summary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSecondaryText:", v18);

  -[UIPrintOption tableViewCell](self, "tableViewCell");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setContentConfiguration:", v17);

}

- (void)updatePresetsList
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[UIPrintPresetsOption getPrinterPresets](self, "getPrinterPresets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPresetsOption setPrinterPresets:](self, "setPrinterPresets:", v3);

  -[UIPrintPresetsOption getStandardPresets](self, "getStandardPresets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPresetsOption setStandardPresets:](self, "setStandardPresets:", v4);

  -[UIPrintPresetsOption printerPresets](self, "printerPresets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    -[UIPrintPresetsOption printerPresets](self, "printerPresets");
  else
    -[UIPrintPresetsOption standardPresets](self, "standardPresets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPresetsOption setPresets:](self, "setPresets:", v6);

  -[UIPrintPresetsOption setPresetNames:](self, "setPresetNames:", 0);
  -[UIPrintPresetsOption appliedPresetsSummary](self, "appliedPresetsSummary");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[UIPrintPresetsOption appliedPresetsSummaryLabel](self, "appliedPresetsSummaryLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v8);

}

- (void)currentPrinterChanged
{
  void *v3;
  void *v4;
  id v5;

  -[UIPrintPresetsOption updatePresetsList](self, "updatePresetsList");
  -[UIPrintPresetsOption printerPresets](self, "printerPresets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPrintOption printInfo](self, "printInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "setJobPreset:", 0);
  else
    objc_msgSend(v4, "setAppliedPresetsList:", 0);

}

- (void)updatePrintInfoWithSelectedIndex:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  if (!objc_msgSend(v25, "section"))
  {
    -[UIPrintOption printInfo](self, "printInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPresetsOption origPrintInfo](self, "origPrintInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resetToDefaultSettings:", v17);
    goto LABEL_14;
  }
  -[UIPrintPresetsOption presets](self, "presets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  -[UIPrintPresetsOption selectedIndexPath](self, "selectedIndexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "row");

  if (v5 > v7)
  {
    -[UIPrintPresetsOption presets](self, "presets");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v25, "row"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
LABEL_15:

      goto LABEL_16;
    }
    objc_msgSend(v9, "objectForKey:", CFSTR("PresetType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

    -[UIPrintOption printInfo](self, "printInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
    {
      objc_msgSend(v12, "appliedPresetsList");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        -[UIPrintOption printInfo](self, "printInfo");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "appliedPresetsList");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v16, "mutableCopy");

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }

      v19 = objc_msgSend(v17, "containsObject:", v9);
      objc_msgSend(v17, "removeObject:", v9);
      if ((v19 & 1) == 0)
      {
        objc_msgSend(v17, "addObject:", v9);
        -[UIPrintOption printInfo](self, "printInfo");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", CFSTR("PresetInfo"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "updateWithDictionary:", v21);

      }
      -[UIPrintOption printInfo](self, "printInfo");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setAppliedPresetsList:", v17);

      -[UIPrintPresetsOption appliedPresetsSummary](self, "appliedPresetsSummary");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrintPresetsOption appliedPresetsSummaryLabel](self, "appliedPresetsSummaryLabel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setText:", v23);

      -[UIPrintPresetsOption appliedPresetsSummaryLabel](self, "appliedPresetsSummaryLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "sizeToFit");
    }
    else
    {
      objc_msgSend(v12, "setJobPreset:", v9);

      -[UIPrintOption printInfo](self, "printInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", CFSTR("PresetInfo"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "updateWithDictionary:", v18);
    }

LABEL_14:
    goto LABEL_15;
  }
LABEL_16:

}

- (id)appliedPresetsSummary
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __CFString *v15;
  __CFString *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[UIPrintPresetsOption printerPresets](self, "printerPresets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return &stru_1E9D97C98;
  -[UIPrintOption printInfo](self, "printInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appliedPresetsList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reverseObjectEnumerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "objectForKey:", CFSTR("PresetTitle"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          PMAppendToSummaryString(v13, v7);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

  }
  else
  {
    v7 = 0;
  }
  v15 = CFSTR("No Presets Applied");
  if (v7)
    v15 = v7;
  v16 = v15;

  return v16;
}

- (NSMutableArray)presetNames
{
  UIPrintPresetsOption *v2;
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
  uint64_t i;
  void *v16;
  void *v17;
  NSMutableArray *presetNames;
  UIPrintPresetsOption *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v2 = self;
  v25 = *MEMORY[0x1E0C80C00];
  if (!self->_presetNames)
  {
    -[UIPrintPresetsOption presets](self, "presets");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[UIPrintPresetsOption presets](v2, "presets");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      if (v7)
      {
        v8 = (void *)MEMORY[0x1E0C99DE8];
        -[UIPrintPresetsOption presets](v2, "presets");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));
        v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();

        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        v19 = v2;
        -[UIPrintPresetsOption presets](v2, "presets");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v21;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v21 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "objectForKey:", CFSTR("PresetTitle"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (v16)
              {
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v16, CFSTR("Title"));
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableArray addObject:](v10, "addObject:", v17);

              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          }
          while (v13);
        }

        v2 = v19;
        presetNames = v19->_presetNames;
        v19->_presetNames = v10;

      }
    }
  }
  return v2->_presetNames;
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

  -[UIPrintPresetsOption summary](self, "summary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSecondaryText:", v8);

  objc_msgSend(v5, "setContentConfiguration:", v6);
  objc_msgSend(v5, "setAccessoryType:", 1);
  objc_msgSend(v5, "setSelectionStyle:", 3);
  objc_msgSend(v5, "setItemListDelegate:", self);
  -[UIPrintOption setTableViewCell:](self, "setTableViewCell:", v5);

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
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Reset to Default Settings"), CFSTR("Reset to Default Settings"), CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithObject:forKey:", v6, CFSTR("Title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPresetsOption presetNames](self, "presetNames");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithObjects:", v8, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)selectedItem
{
  return 0;
}

- (id)selectedItems
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[UIPrintOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appliedPresetsList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[UIPrintOption printInfo](self, "printInfo", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appliedPresetsList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v11);
          v13 = (void *)MEMORY[0x1E0CB36B0];
          -[UIPrintPresetsOption presets](self, "presets");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "indexPathForRow:inSection:", objc_msgSend(v14, "indexOfObject:", v12), 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "addObject:", v15);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v9);
    }

  }
  else
  {
    -[UIPrintPresetsOption selectedIndexPath](self, "selectedIndexPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "section");

    if (v17 == 1)
    {
      v18 = (void *)MEMORY[0x1E0C99DE8];
      -[UIPrintPresetsOption selectedIndexPath](self, "selectedIndexPath");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "arrayWithObject:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      return v20;
    }
    v5 = 0;
  }
  return v5;
}

- (BOOL)isItemSelected:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[UIPrintPresetsOption presets](self, "presets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "row");

  objc_msgSend(v5, "objectAtIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPrintOption printInfo](self, "printInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appliedPresetsList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v9, "containsObject:", v7);

  return v6;
}

- (id)titleForHeaderInSection:(int64_t)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  if (a3)
  {
    -[UIPrintPresetsOption printerPresets](self, "printerPresets");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
      v7 = CFSTR("Printer Presets");
    else
      v7 = CFSTR("Standard Presets");
    objc_msgSend(v5, "localizedStringForKey:value:table:", v7, v7, CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)titleForFooterInSection:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (a3
    && (-[UIPrintPresetsOption printerPresets](self, "printerPresets"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "count"),
        v4,
        v5))
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("%@\n\n%@"), CFSTR("%@\n\n%@"), CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("The most recent selection may override previously selected presets."), CFSTR("The most recent selection may override previously selected presets."), CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPresetsOption appliedPresetsSummary](self, "appliedPresetsSummary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v8, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (int64_t)listItemSelected:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int64_t v11;

  v4 = a3;
  -[UIPrintPresetsOption setSelectedIndexPath:](self, "setSelectedIndexPath:", v4);
  -[UIPrintPresetsOption updatePrintInfoWithSelectedIndex:](self, "updatePrintInfoWithSelectedIndex:", v4);
  -[UIPrintOption tableViewCell](self, "tableViewCell");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPrintPresetsOption summary](self, "summary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSecondaryText:", v7);

  -[UIPrintOption tableViewCell](self, "tableViewCell");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentConfiguration:", v6);

  v9 = objc_msgSend(v4, "section");
  if (v9)
  {
    -[UIPrintPresetsOption printerPresets](self, "printerPresets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count") != 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)printerContainsQuality:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[UIPrintOption printInfo](self, "printInfo", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentPrinter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "supportedQualities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "integerValue") == a3)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)getStandardPresets
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;

  -[UIPrintOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPrinter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPresetsOption grayscaleStandardPreset](self, "grayscaleStandardPreset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = 0;
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0C99D80];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v9, 0x1E9D98DB8, v10, 0x1E9D98DD8, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)MEMORY[0x1E0C99D80];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Black and White"), CFSTR("Black and White"), CFSTR("Localizable"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v12, CFSTR("PresetType"), v14, CFSTR("PresetTitle"), v7, CFSTR("PresetInfo"), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrintPresetsOption setGrayscaleStandardPreset:](self, "setGrayscaleStandardPreset:", v15);

    }
    -[UIPrintPresetsOption grayscaleStandardPreset](self, "grayscaleStandardPreset");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v16);

    if (-[UIPrintPresetsOption printerContainsQuality:](self, "printerContainsQuality:", 3))
    {
      -[UIPrintPresetsOption grayscaleDraftStandardPreset](self, "grayscaleDraftStandardPreset");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        v18 = (void *)MEMORY[0x1E0C99D80];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "dictionaryWithObjectsAndKeys:", v19, 0x1E9D98DB8, v20, 0x1E9D98DD8, 0);
        v21 = objc_claimAutoreleasedReturnValue();

        v22 = (void *)MEMORY[0x1E0C99D80];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Black and White - Draft"), CFSTR("Black and White - Draft"), CFSTR("Localizable"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "dictionaryWithObjectsAndKeys:", v23, CFSTR("PresetType"), v25, CFSTR("PresetTitle"), v21, CFSTR("PresetInfo"), 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPrintPresetsOption setGrayscaleDraftStandardPreset:](self, "setGrayscaleDraftStandardPreset:", v26);

        v7 = (void *)v21;
      }
      -[UIPrintPresetsOption grayscaleDraftStandardPreset](self, "grayscaleDraftStandardPreset");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v27);

    }
    -[UIPrintOption printInfo](self, "printInfo");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "currentPrinter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "supportsColor");

    if (v30)
    {
      -[UIPrintPresetsOption colorStandardPreset](self, "colorStandardPreset");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v31)
      {
        v32 = (void *)MEMORY[0x1E0C99D80];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "dictionaryWithObjectsAndKeys:", v33, 0x1E9D98DB8, v34, 0x1E9D98DD8, 0);
        v35 = objc_claimAutoreleasedReturnValue();

        v36 = (void *)MEMORY[0x1E0C99D80];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("Color"), CFSTR("Color"), CFSTR("Localizable"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "dictionaryWithObjectsAndKeys:", v37, CFSTR("PresetType"), v39, CFSTR("PresetTitle"), v35, CFSTR("PresetInfo"), 0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPrintPresetsOption setColorStandardPreset:](self, "setColorStandardPreset:", v40);

        v7 = (void *)v35;
      }
      -[UIPrintPresetsOption colorStandardPreset](self, "colorStandardPreset");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v41);

      if (-[UIPrintPresetsOption printerContainsQuality:](self, "printerContainsQuality:", 5))
      {
        -[UIPrintPresetsOption colorFineStandardPreset](self, "colorFineStandardPreset");
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v42)
        {
          v43 = (void *)MEMORY[0x1E0C99D80];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 5);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "dictionaryWithObjectsAndKeys:", v44, 0x1E9D98DB8, v45, 0x1E9D98DD8, 0);
          v46 = objc_claimAutoreleasedReturnValue();

          v47 = (void *)MEMORY[0x1E0C99D80];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("Color - Fine"), CFSTR("Color - Fine"), CFSTR("Localizable"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "dictionaryWithObjectsAndKeys:", v48, CFSTR("PresetType"), v50, CFSTR("PresetTitle"), v46, CFSTR("PresetInfo"), 0);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIPrintPresetsOption setColorFineStandardPreset:](self, "setColorFineStandardPreset:", v51);

          v7 = (void *)v46;
        }
        -[UIPrintPresetsOption colorFineStandardPreset](self, "colorFineStandardPreset");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v52);

      }
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)getPrinterPresets
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  const __CFString *v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[UIPrintOption printInfo](self, "printInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPrinter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "supportedPresets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    obj = v4;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      v9 = *MEMORY[0x1E0D80B20];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v11, "objectForKey:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)MEMORY[0x1E0C99D80];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = CFSTR("UIPrintInfoJobPresetKey");
          v24 = v11;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "dictionaryWithObjectsAndKeys:", v14, CFSTR("PresetType"), v12, CFSTR("PresetTitle"), v15, CFSTR("PresetInfo"), 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v16);

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      }
      while (v7);
    }

  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_1);

  return v5;
}

uint64_t __41__UIPrintPresetsOption_getPrinterPresets__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("PresetTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PresetTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);
  return v7;
}

- (id)summary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  -[UIPrintPresetsOption selectedIndexPath](self, "selectedIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "section"))
  {

  }
  else
  {
    -[UIPrintOption printInfo](self, "printInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appliedPresetsList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = CFSTR("No Preset");
      goto LABEL_9;
    }
  }
  -[UIPrintOption printInfo](self, "printInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appliedPresetsList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("Printer");
LABEL_9:
    objc_msgSend(v10, "localizedStringForKey:value:table:", v12, v12, CFSTR("Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  -[UIPrintOption printInfo](self, "printInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appliedPresetsList");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("No Preset"), CFSTR("No Preset"), CFSTR("Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIPrintPresetsOption presets](self, "presets");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPresetsOption selectedIndexPath](self, "selectedIndexPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndex:", objc_msgSend(v16, "row"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", CFSTR("PresetTitle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_12:

  return v15;
}

- (void)didSelectPrintOption
{
  id v3;

  -[UIPrintPresetsOption updatePresetsList](self, "updatePresetsList");
  -[UIPrintOption tableViewCell](self, "tableViewCell");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "printOptionCellTapped");

}

- (NSArray)presets
{
  return self->_presets;
}

- (void)setPresets:(id)a3
{
  objc_storeStrong((id *)&self->_presets, a3);
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_selectedIndexPath, a3);
}

- (void)setPresetNames:(id)a3
{
  objc_storeStrong((id *)&self->_presetNames, a3);
}

- (UIPrinter)observedPrinter
{
  return self->_observedPrinter;
}

- (void)setObservedPrinter:(id)a3
{
  objc_storeStrong((id *)&self->_observedPrinter, a3);
}

- (UIPrintInfo)origPrintInfo
{
  return self->_origPrintInfo;
}

- (void)setOrigPrintInfo:(id)a3
{
  objc_storeStrong((id *)&self->_origPrintInfo, a3);
}

- (NSArray)printerPresets
{
  return self->_printerPresets;
}

- (void)setPrinterPresets:(id)a3
{
  objc_storeStrong((id *)&self->_printerPresets, a3);
}

- (NSArray)standardPresets
{
  return self->_standardPresets;
}

- (void)setStandardPresets:(id)a3
{
  objc_storeStrong((id *)&self->_standardPresets, a3);
}

- (UILabel)appliedPresetsSummaryLabel
{
  return self->_appliedPresetsSummaryLabel;
}

- (void)setAppliedPresetsSummaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_appliedPresetsSummaryLabel, a3);
}

- (NSDictionary)grayscaleStandardPreset
{
  return self->_grayscaleStandardPreset;
}

- (void)setGrayscaleStandardPreset:(id)a3
{
  objc_storeStrong((id *)&self->_grayscaleStandardPreset, a3);
}

- (NSDictionary)grayscaleDraftStandardPreset
{
  return self->_grayscaleDraftStandardPreset;
}

- (void)setGrayscaleDraftStandardPreset:(id)a3
{
  objc_storeStrong((id *)&self->_grayscaleDraftStandardPreset, a3);
}

- (NSDictionary)colorStandardPreset
{
  return self->_colorStandardPreset;
}

- (void)setColorStandardPreset:(id)a3
{
  objc_storeStrong((id *)&self->_colorStandardPreset, a3);
}

- (NSDictionary)colorFineStandardPreset
{
  return self->_colorFineStandardPreset;
}

- (void)setColorFineStandardPreset:(id)a3
{
  objc_storeStrong((id *)&self->_colorFineStandardPreset, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorFineStandardPreset, 0);
  objc_storeStrong((id *)&self->_colorStandardPreset, 0);
  objc_storeStrong((id *)&self->_grayscaleDraftStandardPreset, 0);
  objc_storeStrong((id *)&self->_grayscaleStandardPreset, 0);
  objc_storeStrong((id *)&self->_appliedPresetsSummaryLabel, 0);
  objc_storeStrong((id *)&self->_standardPresets, 0);
  objc_storeStrong((id *)&self->_printerPresets, 0);
  objc_storeStrong((id *)&self->_origPrintInfo, 0);
  objc_storeStrong((id *)&self->_observedPrinter, 0);
  objc_storeStrong((id *)&self->_presetNames, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_presets, 0);
}

@end
