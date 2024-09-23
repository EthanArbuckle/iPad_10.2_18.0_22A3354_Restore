@implementation PUPhotoPickerFileSizeToolbarProvider

- (PUPhotoPickerFileSizeToolbarProvider)initWithDataSource:(id)a3
{
  id v4;
  PUPhotoPickerFileSizeToolbarProvider *v5;
  PUPhotoPickerFileSizeToolbarProvider *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PUPhotoPickerFileSizeToolbarProvider;
  v5 = -[PUPhotoPickerFileSizeToolbarProvider init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_dataSource, v4);

  return v6;
}

- (BOOL)shouldShowToolbar
{
  void *v3;
  void *v4;
  BOOL v5;
  UITableViewController *v7;
  UITableViewController *sizePickerViewController;
  id WeakRetained;
  void *v10;
  id v11;
  int v12;
  id v13;
  id v14;
  char v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[UITableViewController navigationController](self->_sizePickerViewController, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_preparingToPresentSizePickerViewController)
    goto LABEL_4;
  -[UITableViewController presentingViewController](self->_sizePickerViewController, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

    goto LABEL_4;
  }
  if (v3)
  {
    objc_msgSend(v3, "topViewController");
    v7 = (UITableViewController *)objc_claimAutoreleasedReturnValue();
    sizePickerViewController = self->_sizePickerViewController;

    if (v7 == sizePickerViewController)
      goto LABEL_4;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "sessionInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "showsFileSizePicker") & 1) == 0)
  {

    goto LABEL_4;
  }
  v11 = objc_loadWeakRetained((id *)&self->_dataSource);
  v12 = objc_msgSend(v11, "isAnyAssetSelected");

  if (!v12)
  {
LABEL_4:
    v5 = 0;
    goto LABEL_5;
  }
  v13 = objc_loadWeakRetained((id *)&self->_dataSource);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v14 = objc_loadWeakRetained((id *)&self->_dataSource);
    v15 = objc_msgSend(v14, "isAnyAssetDownloading");

    if ((v15 & 1) != 0)
      goto LABEL_4;
  }
  else
  {

  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(v16, "selectedAssets", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v17);
        if (!+[PUPhotoPickerScaledFileSizeEstimator isAssetResizable:](PUPhotoPickerScaledFileSizeEstimator, "isAssetResizable:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i)))
        {

          goto LABEL_4;
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v19)
        continue;
      break;
    }
  }

  -[PUPhotoPickerFileSizeToolbarProvider _orderedResizeTaskDescriptorsForCurrentlySelectedAssets](self, "_orderedResizeTaskDescriptorsForCurrentlySelectedAssets");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (unint64_t)objc_msgSend(v22, "count") > 1;

LABEL_5:
  return v5;
}

- (NSArray)toolbarItems
{
  id WeakRetained;
  int v4;
  NSArray *toolbarItems;
  NSArray *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  NSArray *v11;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v4 = objc_msgSend(WeakRetained, "isAnyAssetSelected");

  if (v4)
  {
    toolbarItems = self->_toolbarItems;
    if (toolbarItems)
    {
      v6 = toolbarItems;
    }
    else
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
      -[PUPhotoPickerFileSizeToolbarProvider _sizePickerItem](self, "_sizePickerItem", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13[1] = v9;
      v13[2] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
      v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v11 = self->_toolbarItems;
      self->_toolbarItems = v10;

      v6 = self->_toolbarItems;
    }
  }
  else
  {
    v6 = (NSArray *)MEMORY[0x1E0C9AA60];
  }
  -[PUPhotoPickerFileSizeToolbarProvider _updateSizePickerItemIfNeeded](self, "_updateSizePickerItemIfNeeded");
  return v6;
}

- (id)_sizePickerItem
{
  UIBarButtonItem *sizePickerItem;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UILabel *v8;
  UILabel *sizePickerDescriptionLabel;
  id v10;
  void *v11;
  void *v12;
  UIBarButtonItem *v13;
  UIBarButtonItem *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  sizePickerItem = self->_sizePickerItem;
  if (!sizePickerItem)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 13.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PULocalizedString(CFSTR("SIZE_PICKER_CHOOSE_SIZE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:forState:", v6, 0);

    objc_msgSend(v5, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v4);

    objc_msgSend(v5, "_setTouchInsets:", -12.0, -12.0, -12.0, -12.0);
    objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel__presentSizePicker_, 64);
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    sizePickerDescriptionLabel = self->_sizePickerDescriptionLabel;
    self->_sizePickerDescriptionLabel = v8;

    -[UILabel setFont:](self->_sizePickerDescriptionLabel, "setFont:", v4);
    v10 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v16[0] = self->_sizePickerDescriptionLabel;
    v16[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithArrangedSubviews:", v11);

    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v12, "setAxis:", 1);
    objc_msgSend(v12, "setDistribution:", 0);
    objc_msgSend(v12, "setAlignment:", 3);
    objc_msgSend(v12, "setLayoutMarginsRelativeArrangement:", 1);
    objc_msgSend(v12, "setLayoutMargins:", 3.0, 0.0, -3.0, 0.0);
    objc_msgSend(v12, "setBaselineRelativeArrangement:", 1);
    objc_msgSend(v12, "setSpacing:", 19.0);
    v13 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v12);
    v14 = self->_sizePickerItem;
    self->_sizePickerItem = v13;

    sizePickerItem = self->_sizePickerItem;
  }
  return sizePickerItem;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[PUPhotoPickerFileSizeToolbarProvider _orderedResizeTaskDescriptorsForCurrentlySelectedAssets](self, "_orderedResizeTaskDescriptorsForCurrentlySelectedAssets", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  -[PUPhotoPickerFileSizeToolbarProvider _orderedResizeTaskDescriptorsForCurrentlySelectedAssets](self, "_orderedResizeTaskDescriptorsForCurrentlySelectedAssets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("Size picker cell"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "localizedDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  PUPhotoPickerResizeTaskDescriptor *v9;
  id WeakRetained;
  char v11;
  id v12;
  PUPhotoPickerResizeTaskDescriptor *selectedTaskDescriptor;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  -[PUPhotoPickerFileSizeToolbarProvider _orderedResizeTaskDescriptorsForCurrentlySelectedAssets](self, "_orderedResizeTaskDescriptorsForCurrentlySelectedAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "row");

  objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
  v9 = (PUPhotoPickerResizeTaskDescriptor *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v12, "photoPickerFileSizeToolbarProvider:didSelectResizeTaskDescriptor:", self, v9);

  }
  selectedTaskDescriptor = self->_selectedTaskDescriptor;
  self->_selectedTaskDescriptor = v9;

  -[PUPhotoPickerFileSizeToolbarProvider _updateTableViewSelection](self, "_updateTableViewSelection");
  -[PUPhotoPickerFileSizeToolbarProvider _updateSizePickerItemIfNeeded](self, "_updateSizePickerItemIfNeeded");
}

- (id)_orderedResizeTaskDescriptors
{
  NSArray *resizeTaskDescriptors;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *v9;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  resizeTaskDescriptors = self->_resizeTaskDescriptors;
  if (!resizeTaskDescriptors)
  {
    +[PUPhotoPickerResizeTaskDescriptor defaultSmallDescriptor](PUPhotoPickerResizeTaskDescriptor, "defaultSmallDescriptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUPhotoPickerResizeTaskDescriptor defaultMediumDescriptor](PUPhotoPickerResizeTaskDescriptor, "defaultMediumDescriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUPhotoPickerResizeTaskDescriptor defaultLargeDescriptor](PUPhotoPickerResizeTaskDescriptor, "defaultLargeDescriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUPhotoPickerResizeTaskDescriptor defaultActualSizeDescriptor](PUPhotoPickerResizeTaskDescriptor, "defaultActualSizeDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v11[1] = v5;
    v11[2] = v4;
    v11[3] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v9 = self->_resizeTaskDescriptors;
    self->_resizeTaskDescriptors = v8;

    resizeTaskDescriptors = self->_resizeTaskDescriptors;
  }
  return resizeTaskDescriptors;
}

- (id)_orderedResizeTaskDescriptorsForCurrentlySelectedAssets
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[PUPhotoPickerFileSizeToolbarProvider _orderedResizeTaskDescriptors](self, "_orderedResizeTaskDescriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "selectedAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(v8, "estimatedSizeForAssets:", v5));
    v9 = objc_claimAutoreleasedReturnValue();
    v22 = v8;
    v23 = v7;
    objc_msgSend(v7, "addObject:", v8);
    v21 = (void *)v9;
    objc_msgSend(v6, "addObject:", v9);
    v10 = objc_msgSend(v3, "count");
    v11 = v10 - 1;
    if (v10 != 1)
    {
      v12 = 0;
      do
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v14 = v5;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v25;
          while (2)
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v25 != v17)
                objc_enumerationMutation(v14);
              if (objc_msgSend(v13, "appliesToAsset:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i)))
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(v13, "estimatedSizeForAssets:", v14));
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v6, "containsObject:", v19) & 1) == 0)
                {
                  objc_msgSend(v23, "insertObject:atIndex:", v13, objc_msgSend(v23, "count") - 1);
                  objc_msgSend(v6, "addObject:", v19);
                }

                goto LABEL_16;
              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
            if (v16)
              continue;
            break;
          }
        }
LABEL_16:

        ++v12;
      }
      while (v12 != v11);
    }

  }
  else
  {
    v23 = v3;
  }

  return v23;
}

- (void)_presentSizePicker:(id)a3
{
  PUPhotoPickerFileSizeToolbarProviderDelegate **p_delegate;
  id WeakRetained;
  char v6;
  UITableViewController *v7;
  UITableViewController *sizePickerViewController;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = (UITableViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D60]), "initWithStyle:", 1);
    sizePickerViewController = self->_sizePickerViewController;
    self->_sizePickerViewController = v7;

    PULocalizedString(CFSTR("SIZE_PICKER_TITLE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewController navigationItem](self->_sizePickerViewController, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:", v9);

    -[UITableViewController tableView](self->_sizePickerViewController, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDataSource:", self);

    -[UITableViewController tableView](self->_sizePickerViewController, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", self);

    -[UITableViewController tableView](self->_sizePickerViewController, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("Size picker cell"));

    -[PUPhotoPickerFileSizeToolbarProvider _updateTableViewSelection](self, "_updateTableViewSelection");
    self->_preparingToPresentSizePickerViewController = 1;
    v14 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v14, "photoPickerFileSizeToolbarProvider:presentSizePickerViewController:", self, self->_sizePickerViewController);

    self->_preparingToPresentSizePickerViewController = 0;
  }
}

- (id)_localizedLabelForResizeTaskDescriptor:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  NSMutableDictionary *taskDescriptorsToCachedLabels;
  void *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "selectedAssets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSSet isEqualToSet:](self->_cachedAssetSet, "isEqualToSet:", v7))
  {
    taskDescriptorsToCachedLabels = self->_taskDescriptorsToCachedLabels;
    self->_taskDescriptorsToCachedLabels = 0;

    objc_storeStrong((id *)&self->_cachedAssetSet, v7);
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_taskDescriptorsToCachedLabels, "objectForKeyedSubscript:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    if (!self->_taskDescriptorsToCachedLabels)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v11 = self->_taskDescriptorsToCachedLabels;
      self->_taskDescriptorsToCachedLabels = v10;

    }
    objc_msgSend(v4, "localizedDescriptionForAssets:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_taskDescriptorsToCachedLabels, "setObject:forKeyedSubscript:", v9, v4);
  }

  return v9;
}

- (void)_updateSizePickerItemIfNeeded
{
  PUPhotoPickerResizeTaskDescriptor *v3;
  PUPhotoPickerResizeTaskDescriptor *selectedTaskDescriptor;
  void *v5;
  id v6;

  -[PUPhotoPickerFileSizeToolbarProvider _orderedResizeTaskDescriptorsForCurrentlySelectedAssets](self, "_orderedResizeTaskDescriptorsForCurrentlySelectedAssets");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!self->_selectedTaskDescriptor || (objc_msgSend(v6, "containsObject:") & 1) == 0)
  {
    objc_msgSend(v6, "lastObject");
    v3 = (PUPhotoPickerResizeTaskDescriptor *)objc_claimAutoreleasedReturnValue();
    selectedTaskDescriptor = self->_selectedTaskDescriptor;
    self->_selectedTaskDescriptor = v3;

  }
  -[PUPhotoPickerFileSizeToolbarProvider _localizedLabelForResizeTaskDescriptor:](self, "_localizedLabelForResizeTaskDescriptor:", self->_selectedTaskDescriptor);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_sizePickerDescriptionLabel, "setText:", v5);

}

- (void)_updateTableViewSelection
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  -[UITableViewController tableView](self->_sizePickerViewController, "tableView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPhotoPickerFileSizeToolbarProvider _computeSelectedIndexPath](self, "_computeSelectedIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "numberOfRowsInSection:", 0))
  {
    v4 = 0;
    do
    {
      if (v4 == objc_msgSend(v3, "row"))
        v5 = 3;
      else
        v5 = 0;
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v4, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cellForRowAtIndexPath:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAccessoryType:", v5);

      ++v4;
    }
    while (v4 < objc_msgSend(v8, "numberOfRowsInSection:", 0));
  }

}

- (id)_computeSelectedIndexPath
{
  void *v3;
  uint64_t v4;

  if (!self->_selectedTaskDescriptor)
    return 0;
  -[PUPhotoPickerFileSizeToolbarProvider _orderedResizeTaskDescriptorsForCurrentlySelectedAssets](self, "_orderedResizeTaskDescriptorsForCurrentlySelectedAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "indexOfObject:", self->_selectedTaskDescriptor);

  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (PUPhotoPickerFileSizeToolbarProviderDelegate)delegate
{
  return (PUPhotoPickerFileSizeToolbarProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_taskDescriptorsToCachedLabels, 0);
  objc_storeStrong((id *)&self->_selectedTaskDescriptor, 0);
  objc_storeStrong((id *)&self->_cachedAssetSet, 0);
  objc_storeStrong((id *)&self->_resizeTaskDescriptors, 0);
  objc_storeStrong((id *)&self->_toolbarItems, 0);
  objc_storeStrong((id *)&self->_sizePickerViewController, 0);
  objc_storeStrong((id *)&self->_sizePickerDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_sizePickerItem, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
