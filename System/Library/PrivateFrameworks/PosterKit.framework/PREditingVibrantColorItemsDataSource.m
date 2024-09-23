@implementation PREditingVibrantColorItemsDataSource

- (PREditingVibrantColorItemsDataSource)initWithConfiguration:(id)a3 variationStore:(id)a4
{
  id v7;
  id v8;
  PREditingVibrantColorItemsDataSource *v9;
  PREditingVibrantColorItemsDataSource *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PREditingVibrantColorItemsDataSource;
  v9 = -[PREditingVibrantColorItemsDataSource init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    objc_storeStrong((id *)&v10->_variationStore, a4);
    -[PREditingVibrantColorItemsDataSource buildItems](v10, "buildItems");
  }

  return v10;
}

- (unint64_t)numberOfItems
{
  return -[NSArray count](self->_items, "count");
}

- (void)buildItems
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  PRPosterColor *v9;
  void *v10;
  PRPosterColor *v11;
  PRPosterColor *v12;
  void *v13;
  uint64_t v14;
  PREditorColorPickerVibrantMonotoneColor *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  PREditingColorItem *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  PREditorColorPickerConstantColor *v28;
  void *v29;
  double v30;
  PREditingColorItem *v31;
  NSArray *v32;
  NSArray *items;
  PREditingColorItem *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _QWORD v44[2];
  _QWORD v45[3];
  _QWORD v46[5];

  v46[3] = *MEMORY[0x1E0C80C00];
  if (!self->_items)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditorColorPickerConfiguration identifier](self->_configuration, "identifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingVibrantColorItemsDataSource configuration](self, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suggestedColor");
    v5 = objc_claimAutoreleasedReturnValue();

    -[PREditingVibrantColorItemsDataSource configuration](self, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "suggestedColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      +[PREditingColorItem suggestedColorItemWithColor:context:](PREditingColorItem, "suggestedColorItemWithColor:context:", v5, -[PREditorColorPickerConfiguration context](self->_configuration, "context"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v8);

    }
    v37 = (void *)v5;
    v9 = [PRPosterColor alloc];
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PRPosterColor initWithColor:preferredStyle:](v9, "initWithColor:preferredStyle:", v10, 2);

    v12 = [PRPosterColor alloc];
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PRPosterColor initWithColor:preferredStyle:](v12, "initWithColor:preferredStyle:", v13, 2);

    v15 = [PREditorColorPickerVibrantMonotoneColor alloc];
    +[PRPosterColor vibrantMonochromeColor](PRPosterColor, "vibrantMonochromeColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = &unk_1E21DCD70;
    v45[1] = &unk_1E21DCD88;
    v46[0] = v11;
    v46[1] = v11;
    v36 = (void *)v14;
    v45[2] = &unk_1E21DCDA0;
    v46[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[PREditorColorPickerVibrantMonotoneColor initWithColor:displayColors:localizedName:](v15, "initWithColor:displayColors:localizedName:", v16, v17, 0);

    v35 = (void *)v18;
    v19 = -[PREditingColorItem initWithPickerColor:variation:context:]([PREditingColorItem alloc], "initWithPickerColor:variation:context:", v18, -[PREditorColorPickerConfiguration context](self->_configuration, "context"), 0.0);
    -[PREditingColorItem setShowsSlider:](v19, "setShowsSlider:", 0);
    +[PREditingColorItem vibrantMaterialItem](PREditingColorItem, "vibrantMaterialItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v20;
    v44[1] = v19;
    v34 = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v3;
    objc_msgSend(v3, "addObjectsFromArray:", v21);

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[PREditorColorPickerConfiguration suggestedColors](self->_configuration, "suggestedColors");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v40 != v26)
            objc_enumerationMutation(v23);
          v28 = -[PREditorColorPickerConstantColor initWithBaseUIColor:]([PREditorColorPickerConstantColor alloc], "initWithBaseUIColor:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
          -[PREditingColorVariationStore variationForPickerColor:forContextIdentifier:](self->_variationStore, "variationForPickerColor:forContextIdentifier:", v28, v38);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[PREditorColorPickerConstantColor initialVariation](v28, "initialVariation");
          if (v29)
            objc_msgSend(v29, "doubleValue");
          v31 = -[PREditingColorItem initWithPickerColor:variation:context:]([PREditingColorItem alloc], "initWithPickerColor:variation:context:", v28, -[PREditorColorPickerConfiguration context](self->_configuration, "context"), v30);
          objc_msgSend(v22, "addObject:", v31);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v25);
    }

    v32 = (NSArray *)objc_msgSend(v22, "copy");
    items = self->_items;
    self->_items = v32;

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
  v9[2] = __53__PREditingVibrantColorItemsDataSource_indexForItem___block_invoke;
  v9[3] = &unk_1E21840A0;
  v10 = v4;
  v6 = v4;
  v7 = -[NSArray indexOfObjectPassingTest:](items, "indexOfObjectPassingTest:", v9);

  return v7;
}

uint64_t __53__PREditingVibrantColorItemsDataSource_indexForItem___block_invoke(uint64_t a1, void *a2)
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
