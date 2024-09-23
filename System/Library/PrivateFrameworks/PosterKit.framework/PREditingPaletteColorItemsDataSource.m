@implementation PREditingPaletteColorItemsDataSource

- (PREditingPaletteColorItemsDataSource)initWithConfiguration:(id)a3 variationStore:(id)a4 includesSuggestedColor:(BOOL)a5
{
  id v9;
  id v10;
  PREditingPaletteColorItemsDataSource *v11;
  PREditingPaletteColorItemsDataSource *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PREditingPaletteColorItemsDataSource;
  v11 = -[PREditingPaletteColorItemsDataSource init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_configuration, a3);
    objc_storeStrong((id *)&v12->_variationStore, a4);
    v12->_includeSuggestedColor = a5;
    -[PREditingPaletteColorItemsDataSource buildItems](v12, "buildItems");
  }

  return v12;
}

- (unint64_t)numberOfItems
{
  return -[NSArray count](self->_items, "count");
}

- (void)buildItems
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  PREditorColorPalette *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  double v21;
  PREditingColorItem *v22;
  NSArray *v23;
  NSArray *items;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!self->_items)
  {
    -[PREditorColorPickerConfiguration identifier](self->_configuration, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditorColorPickerConfiguration suggestedColor](self->_configuration, "suggestedColor");
    v4 = objc_claimAutoreleasedReturnValue();
    -[PREditorColorPickerConfiguration colorPalette](self->_configuration, "colorPalette");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)v4;
    if (self->_includeSuggestedColor
      && -[PREditorColorPickerConfiguration showsSuggestedColorItem](self->_configuration, "showsSuggestedColorItem")
      && v4)
    {
      +[PREditingColorItem suggestedColorItemWithColor:context:](PREditingColorItem, "suggestedColorItemWithColor:context:", v4, -[PREditorColorPickerConfiguration context](self->_configuration, "context"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v6);
      +[PREditorColorPalette extendedPalette](PREditorColorPalette, "extendedPalette");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v5, "isEqual:", v7);

      if (v8)
      {
        objc_msgSend(v5, "colors");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v9, "mutableCopy");

        objc_msgSend(v10, "removeObjectAtIndex:", 15);
        v11 = [PREditorColorPalette alloc];
        objc_msgSend(v5, "localizedName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[PREditorColorPalette initWithColors:localizedName:showsColorWell:](v11, "initWithColors:localizedName:showsColorWell:", v10, v12, 0);

        v5 = (void *)v13;
      }

    }
    objc_msgSend(v5, "generatePickerColorsIfNeededForContext:", -[PREditorColorPickerConfiguration context](self->_configuration, "context"));
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v5, "pickerColors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v28 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          -[PREditingColorVariationStore variationForPickerColor:forContextIdentifier:](self->_variationStore, "variationForPickerColor:forContextIdentifier:", v19, v26);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "initialVariation");
          if (v20)
            objc_msgSend(v20, "doubleValue");
          v22 = -[PREditingColorItem initWithPickerColor:variation:context:]([PREditingColorItem alloc], "initWithPickerColor:variation:context:", v19, -[PREditorColorPickerConfiguration context](self->_configuration, "context"), v21);
          objc_msgSend(v3, "addObject:", v22);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v16);
    }

    v23 = (NSArray *)objc_msgSend(v3, "copy");
    items = self->_items;
    self->_items = v23;

  }
}

- (id)firstColorItemPassingTest:(id)a3
{
  uint64_t (**v4)(id, void *);
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(id, void *))a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_items;
  v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((v4[2](v4, v9) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (unint64_t)indexForItem:(id)a3
{
  id v4;
  NSArray *items;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  items = self->_items;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__PREditingPaletteColorItemsDataSource_indexForItem___block_invoke;
  v9[3] = &unk_1E21840A0;
  v10 = v4;
  v6 = v4;
  v7 = -[NSArray indexOfObjectPassingTest:](items, "indexOfObjectPassingTest:", v9);

  return v7;
}

uint64_t __53__PREditingPaletteColorItemsDataSource_indexForItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32));
}

- (id)colorItemForIndex:(unint64_t)a3
{
  void *v5;

  if (-[NSArray count](self->_items, "count") >= a3)
  {
    -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (PREditorColorPickerConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (PREditingColorVariationStore)variationStore
{
  return self->_variationStore;
}

- (void)setVariationStore:(id)a3
{
  objc_storeStrong((id *)&self->_variationStore, a3);
}

- (BOOL)includeSuggestedColor
{
  return self->_includeSuggestedColor;
}

- (void)setIncludeSuggestedColor:(BOOL)a3
{
  self->_includeSuggestedColor = a3;
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_variationStore, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
