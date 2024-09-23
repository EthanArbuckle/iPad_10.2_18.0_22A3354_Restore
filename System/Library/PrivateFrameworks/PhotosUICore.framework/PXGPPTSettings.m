@implementation PXGPPTSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGPPTSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXGPPTSettings setNumberOfItems:](self, "setNumberOfItems:", 100000);
  -[PXGPPTSettings setNumberOfSections:](self, "setNumberOfSections:", 1);
  -[PXGPPTSettings setNumberOfColumns:](self, "setNumberOfColumns:", 4);
  -[PXGPPTSettings setUseAssetBadgeDecoration:](self, "setUseAssetBadgeDecoration:", 0);
  -[PXGPPTSettings setSelectionDecorationStlye:](self, "setSelectionDecorationStlye:", 0);
  -[PXGPPTSettings setUseMultipleScrollableRows:](self, "setUseMultipleScrollableRows:", 0);
  -[PXGPPTSettings setShouldTestNestedScrollView:](self, "setShouldTestNestedScrollView:", 0);
}

- (void)setUseMultipleScrollableRows:(BOOL)a3
{
  self->_useMultipleScrollableRows = a3;
}

- (void)setUseAssetBadgeDecoration:(BOOL)a3
{
  self->_useAssetBadgeDecoration = a3;
}

- (void)setShouldTestNestedScrollView:(BOOL)a3
{
  self->_shouldTestNestedScrollView = a3;
}

- (void)setSelectionDecorationStlye:(int64_t)a3
{
  self->_selectionDecorationStlye = a3;
}

- (void)setNumberOfSections:(int64_t)a3
{
  self->_numberOfSections = a3;
}

- (void)setNumberOfItems:(int64_t)a3
{
  self->_numberOfItems = a3;
}

- (void)setNumberOfColumns:(int64_t)a3
{
  self->_numberOfColumns = a3;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (void)setDefaultValuesWithPresetName:(id)a3
{
  PXGPPTSettings *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PXGPPTSettings setDefaultValues](self, "setDefaultValues");
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("10k_Grid")))
  {
    v5 = self;
    v6 = 10000;
LABEL_5:
    -[PXGPPTSettings setNumberOfItems:](v5, "setNumberOfItems:", v6);
    goto LABEL_6;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("100k_Grid")))
  {
    v5 = self;
    v6 = 100000;
    goto LABEL_5;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("10k_Sections")))
  {
    -[PXGPPTSettings setNumberOfItems:](self, "setNumberOfItems:", 500000);
    -[PXGPPTSettings setNumberOfSections:](self, "setNumberOfSections:", 10000);
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("10k_Sections_Decorated")))
  {
    -[PXGPPTSettings setNumberOfItems:](self, "setNumberOfItems:", 500000);
    -[PXGPPTSettings setNumberOfSections:](self, "setNumberOfSections:", 10000);
    -[PXGPPTSettings setUseAssetBadgeDecoration:](self, "setUseAssetBadgeDecoration:", 1);
    -[PXGPPTSettings setSelectionDecorationStlye:](self, "setSelectionDecorationStlye:", 3);
  }
  else
  {
    if (!objc_msgSend(v8, "hasPrefix:", CFSTR("ScrollableRows_")))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGPPTSettings.m"), 74, CFSTR("unknown presetName %@"), v8);

      abort();
    }
    -[PXGPPTSettings setUseMultipleScrollableRows:](self, "setUseMultipleScrollableRows:", 1);
    -[PXGPPTSettings setNumberOfSections:](self, "setNumberOfSections:", 10000);
    if (objc_msgSend(v8, "hasSuffix:", CFSTR("_HorizontalRow")))
      -[PXGPPTSettings setShouldTestNestedScrollView:](self, "setShouldTestNestedScrollView:", 1);
  }
LABEL_6:

}

- (id)createLayout
{
  _BOOL4 v3;
  __objc2_class **v4;

  v3 = -[PXGPPTSettings useMultipleScrollableRows](self, "useMultipleScrollableRows");
  v4 = off_1E50B2BF8;
  if (!v3)
    v4 = off_1E50B2BD0;
  return (id)objc_msgSend(objc_alloc(*v4), "initWithSettings:", self);
}

- (int64_t)numberOfItems
{
  return self->_numberOfItems;
}

- (int64_t)numberOfSections
{
  return self->_numberOfSections;
}

- (int64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (BOOL)useAssetBadgeDecoration
{
  return self->_useAssetBadgeDecoration;
}

- (int64_t)selectionDecorationStlye
{
  return self->_selectionDecorationStlye;
}

- (BOOL)useMultipleScrollableRows
{
  return self->_useMultipleScrollableRows;
}

- (BOOL)shouldTestNestedScrollView
{
  return self->_shouldTestNestedScrollView;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_37542 != -1)
    dispatch_once(&sharedInstance_onceToken_37542, &__block_literal_global_37543);
  return (id)sharedInstance_sharedInstance_37544;
}

+ (NSArray)scrollingPresetNames
{
  return (NSArray *)&unk_1E53E8A48;
}

void __32__PXGPPTSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tungstenPPTSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_37544;
  sharedInstance_sharedInstance_37544 = v0;

}

+ (id)settingsControllerModule
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
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
  void *v46;
  id v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  _QWORD v52[7];
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D83078];
  v5 = (void *)MEMORY[0x1E0D83010];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __46__PXGPPTSettings_UI__settingsControllerModule__block_invoke;
  v49[3] = &unk_1E512E798;
  v6 = v3;
  v50 = v6;
  objc_msgSend(v5, "px_rowWithTitle:action:", CFSTR("Show Benchmarked View"), v49);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:title:", v8, CFSTR("(Double-tap to dismiss)"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(a1, "allPresetNames");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v6;
  v47 = v6;
  PXMap();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionWithRows:title:", v11, CFSTR("Presets"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = (void *)MEMORY[0x1E0D83078];
  v12 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_numberOfItems);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rowWithTitle:valueKeyPath:", CFSTR("Number Of Items"), v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "possibleValues:titles:", &unk_1E53E9528, &unk_1E53E9540);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v42;
  v13 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_numberOfSections);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rowWithTitle:valueKeyPath:", CFSTR("Number Of Sections"), v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "possibleValues:titles:", &unk_1E53E9558, &unk_1E53E9570);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v39;
  v14 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_numberOfColumns);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rowWithTitle:valueKeyPath:", CFSTR("Number Of Columns"), v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "possibleValues:titles:", &unk_1E53E9588, &unk_1E53E95A0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v35;
  v15 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_useAssetBadgeDecoration);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rowWithTitle:valueKeyPath:", CFSTR("Asset Badge Decoration"), v34);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v52[3] = v16;
  v17 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_selectionDecorationStlye);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "rowWithTitle:valueKeyPath:", CFSTR("Selection Decoration"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "possibleValues:titles:", &unk_1E53E95B8, &unk_1E53E95D0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v52[4] = v20;
  v21 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_useMultipleScrollableRows);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "rowWithTitle:valueKeyPath:", CFSTR("Use Multiple Scrollable Rows"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v52[5] = v23;
  v24 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_shouldTestNestedScrollView);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "rowWithTitle:valueKeyPath:", CFSTR("Test Nested Scroll View"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v52[6] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "sectionWithRows:title:", v27, CFSTR("Settings"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (void *)MEMORY[0x1E0D83078];
  v51[0] = v46;
  v51[1] = v45;
  v51[2] = v28;
  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v51[3] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "moduleWithTitle:contents:", CFSTR("Tungsten PPT"), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

void __46__PXGPPTSettings_UI__settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  PXGPPTViewController *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "createLayout");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[PXGPPTViewController initWithLayout:]([PXGPPTViewController alloc], "initWithLayout:", v5);
  objc_msgSend(v3, "presentViewController:animated:completion:", v4, 1, 0);

}

id __46__PXGPPTSettings_UI__settingsControllerModule__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D83010];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__PXGPPTSettings_UI__settingsControllerModule__block_invoke_3;
  v8[3] = &unk_1E51261F8;
  v9 = *(id *)(a1 + 32);
  v10 = v3;
  v5 = v3;
  objc_msgSend(v4, "px_rowWithTitle:action:", v5, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __46__PXGPPTSettings_UI__settingsControllerModule__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDefaultValuesWithPresetName:", *(_QWORD *)(a1 + 40));
}

@end
