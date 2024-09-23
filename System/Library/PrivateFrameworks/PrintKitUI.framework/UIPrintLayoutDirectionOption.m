@implementation UIPrintLayoutDirectionOption

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[UIPrintOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, 0x1E9D988F8);

  -[UIPrintOption printInfo](self, "printInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, 0x1E9D98898);

  v5.receiver = self;
  v5.super_class = (Class)UIPrintLayoutDirectionOption;
  -[UIPrintLayoutDirectionOption dealloc](&v5, sel_dealloc);
}

- (UIPrintLayoutDirectionOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  UIPrintLayoutDirectionOption *v4;
  void *v5;
  void *v6;
  uint64_t v7;
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
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;
  _QWORD v38[6];

  v38[4] = *MEMORY[0x1E0C80C00];
  v37.receiver = self;
  v37.super_class = (Class)UIPrintLayoutDirectionOption;
  v4 = -[UIPrintOption initWithPrintInfo:printPanelViewController:](&v37, sel_initWithPrintInfo_printPanelViewController_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Layout Direction"), CFSTR("Layout Direction"), CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintOption setTitle:](v4, "setTitle:", v6);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("Left-Right-Top-Bottom"), CFSTR("Left-Right-Top-Bottom"), CFSTR("Localizable"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:withConfiguration:", CFSTR("LayoutDirection1"), v7, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v35, CFSTR("Title"), v34, CFSTR("Image"), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v33;
    v9 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("Right-Left-Top-Bottom"), CFSTR("Right-Left-Top-Bottom"), CFSTR("Localizable"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)v7;
    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:withConfiguration:", CFSTR("LayoutDirection2"), v7, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v30, CFSTR("Title"), v29, CFSTR("Image"), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v28;
    v11 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Top-Bottom-Left-Right"), CFSTR("Top-Bottom-Left-Right"), CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v10;
    v31 = v10;
    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:withConfiguration:", CFSTR("LayoutDirection3"), v10, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v12, CFSTR("Title"), v14, CFSTR("Image"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v15;
    v16 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Top-Bottom-Right-Left"), CFSTR("Top-Bottom-Right-Left"), CFSTR("Localizable"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:withConfiguration:", CFSTR("LayoutDirection4"), v13, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryWithObjectsAndKeys:", v18, CFSTR("Title"), v19, CFSTR("Image"), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v38[3] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintLayoutDirectionOption setLayoutDirectionOptions:](v4, "setLayoutDirectionOptions:", v21);

    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintLayoutDirectionOption setSelectedIndexPath:](v4, "setSelectedIndexPath:", v22);

    -[UIPrintLayoutDirectionOption summaryString](v4, "summaryString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintOption setSummary:](v4, "setSummary:", v23);

    -[UIPrintOption printInfo](v4, "printInfo");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:forKeyPath:options:context:", v4, 0x1E9D988F8, 0, 0);

    -[UIPrintOption printInfo](v4, "printInfo");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:forKeyPath:options:context:", v4, 0x1E9D98898, 0, 0);

  }
  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__UIPrintLayoutDirectionOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E9D96D90;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __79__UIPrintLayoutDirectionOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateFromPrintInfo");
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

  -[UIPrintLayoutDirectionOption shortSummary](self, "shortSummary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSecondaryText:", v8);

  objc_msgSend(v5, "setContentConfiguration:", v6);
  objc_msgSend(v5, "setAccessoryType:", 1);
  objc_msgSend(v5, "setSelectionStyle:", 3);
  objc_msgSend(v5, "setItemListDelegate:", self);
  -[UIPrintOption setTableViewCell:](self, "setTableViewCell:", v5);

  return v5;
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
  objc_msgSend(v3, "indexPathForRow:inSection:", objc_msgSend(v4, "nUpLayoutDirection"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintLayoutDirectionOption setSelectedIndexPath:](self, "setSelectedIndexPath:", v5);

  -[UIPrintOption tableViewCell](self, "tableViewCell");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentConfiguration");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[UIPrintLayoutDirectionOption shortSummary](self, "shortSummary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSecondaryText:", v7);

  -[UIPrintOption tableViewCell](self, "tableViewCell");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentConfiguration:", v10);

  -[UIPrintLayoutDirectionOption summaryString](self, "summaryString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintOption setSummary:](self, "setSummary:", v9);

}

- (id)itemList
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D20];
  -[UIPrintLayoutDirectionOption layoutDirectionOptions](self, "layoutDirectionOptions");
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
  -[UIPrintLayoutDirectionOption setSelectedIndexPath:](self, "setSelectedIndexPath:", v4);
  v5 = objc_msgSend(v4, "row");

  -[UIPrintOption printInfo](self, "printInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNUpLayoutDirection:", v5);

  return 1;
}

- (id)shortSummary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[UIPrintLayoutDirectionOption layoutDirectionOptions](self, "layoutDirectionOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintOption printInfo](self, "printInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", objc_msgSend(v4, "nUpLayoutDirection"));
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
  v3 = objc_msgSend(v2, "nUpLayoutDirection");

  if (v3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("Right-Left-Top-Bottom");
  }
  else if (v3 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("Top-Bottom-Left-Right");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 == 3)
    {
      v5 = v4;
      v6 = CFSTR("Top-Bottom-Right-Left");
    }
    else
    {
      v5 = v4;
      v6 = CFSTR("Left-Right-Top-Bottom");
    }
  }
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, v6, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

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

- (NSArray)layoutDirectionOptions
{
  return self->_layoutDirectionOptions;
}

- (void)setLayoutDirectionOptions:(id)a3
{
  objc_storeStrong((id *)&self->_layoutDirectionOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutDirectionOptions, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
}

@end
