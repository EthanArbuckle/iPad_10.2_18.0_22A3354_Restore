@implementation PUParallaxLayerStackDebugStyleTableViewController

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUParallaxLayerStackDebugStyleTableViewController;
  -[PUParallaxLayerStackDebugStyleTableViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[PUParallaxLayerStackDebugStyleTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("styleCell"));

}

- (id)availableStyles
{
  NSArray *cachedAvailableStyles;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSArray *v19;
  NSArray *v20;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  cachedAvailableStyles = self->_cachedAvailableStyles;
  if (!cachedAvailableStyles)
  {
    -[PUParallaxLayerStackViewModel segmentationItem](self->_viewModel, "segmentationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUParallaxLayerStackDebugStyleTableViewController.m"), 229, CFSTR("editing requires a segmentation item"));

    }
    -[PUParallaxLayerStackViewModel segmentationItem](self->_viewModel, "segmentationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "colorAnalysis");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUParallaxLayerStackDebugStyleTableViewController.m"), 230, CFSTR("editing requires color analysis"));

    }
    -[PUParallaxLayerStackViewModel segmentationItem](self->_viewModel, "segmentationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "availableStyles");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUParallaxLayerStackDebugStyleTableViewController.m"), 231, CFSTR("expected available styles"));

    }
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    PFParallaxLayerStyleSupportedKinds();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v26;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v26 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v15);
          -[PUParallaxLayerStackViewModel segmentationItem](self->_viewModel, "segmentationItem", (_QWORD)v25);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "defaultStyleOfKind:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "addObject:", v18);
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v13);
    }

    v19 = (NSArray *)objc_msgSend(v10, "copy");
    v20 = self->_cachedAvailableStyles;
    self->_cachedAvailableStyles = v19;

    cachedAvailableStyles = self->_cachedAvailableStyles;
  }
  return cachedAvailableStyles;
}

- (id)indexPathForStyle:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v11;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUParallaxLayerStackDebugStyleTableViewController.m"), 246, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("style"));

  }
  -[PUParallaxLayerStackDebugStyleTableViewController availableStyles](self, "availableStyles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__PUParallaxLayerStackDebugStyleTableViewController_indexPathForStyle___block_invoke;
  v12[3] = &unk_1E58A2D10;
  v13 = v5;
  v7 = v5;
  v8 = objc_msgSend(v6, "indexOfObjectPassingTest:", v12);

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[PUParallaxLayerStackDebugStyleTableViewController availableStyles](self, "availableStyles", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
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
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("styleCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC39A8], "cellConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugStyleTableViewController availableStyles](self, "availableStyles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUParallaxLayerStackViewModel style](self->_viewModel, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugStyleTableViewController indexPathForStyle:](self, "indexPathForStyle:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "kind");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v13);

  -[PUParallaxLayerStackViewModel segmentationItem](self->_viewModel, "segmentationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "availableStyles");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10;
  PFFind();
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_msgSend(v8, "text");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByAppendingString:", CFSTR(" (not suggested)"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v19);

  }
  objc_msgSend(v7, "setContentConfiguration:", v8);
  objc_msgSend(v7, "setStyleCellDelegate:", self);
  if (objc_msgSend(v12, "isEqual:", v6))
  {
    objc_msgSend(v7, "rebuildControlsViewForStyle:", v11);
    objc_msgSend(v7, "setAccessoryType:", 3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D71248], "styleWithBakedStyle:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rebuildControlsViewForStyle:", v20);
    objc_msgSend(v7, "setAccessoryType:", 0);

  }
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[PUParallaxLayerStackViewModel style](self->_viewModel, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugStyleTableViewController indexPathForStyle:](self, "indexPathForStyle:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", v8) & 1) != 0)
  {
    objc_msgSend(v13, "deselectRowAtIndexPath:animated:", v6, 1);
  }
  else
  {
    objc_msgSend(v13, "cellForRowAtIndexPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAccessoryType:", 0);

    objc_msgSend(v13, "cellForRowAtIndexPath:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccessoryType:", 3);

    objc_msgSend(v13, "deselectRowAtIndexPath:animated:", v6, 1);
    -[PUParallaxLayerStackDebugStyleTableViewController tableView](self, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cellForRowAtIndexPath:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUParallaxLayerStackDebugStyleTableViewController cellValueUpdated:](self, "cellValueUpdated:", v12);
  }

}

- (void)cellValueUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v4 = a3;
  if (objc_msgSend(v4, "accessoryType") == 3)
  {
    objc_msgSend(v4, "styleKind");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUParallaxLayerStackDebugStyleTableViewController availableStyles](self, "availableStyles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __70__PUParallaxLayerStackDebugStyleTableViewController_cellValueUpdated___block_invoke;
    v22[3] = &unk_1E58A2D10;
    v23 = v5;
    v8 = v5;
    v9 = objc_msgSend(v6, "indexOfObjectPassingTest:", v22);

    -[PUParallaxLayerStackDebugStyleTableViewController availableStyles](self, "availableStyles");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D71248], "styleWithBakedStyle:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applyToStyle:", v12);
    -[PUParallaxLayerStackDebugStyleTableViewController viewModel](self, "viewModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v7;
    v18 = 3221225472;
    v19 = __70__PUParallaxLayerStackDebugStyleTableViewController_cellValueUpdated___block_invoke_2;
    v20 = &unk_1E58AB148;
    v21 = v12;
    v14 = v12;
    objc_msgSend(v13, "performChanges:", &v17);

    -[PUParallaxLayerStackDebugStyleTableViewController viewModelUpdater](self, "viewModelUpdater", v17, v18, v19, v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUParallaxLayerStackDebugStyleTableViewController viewModel](self, "viewModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "renderOnscreenModelAfterStyleChange:", v16);

  }
}

- (PUParallaxLayerStackViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (PUParallaxLayerStackViewModelUpdater)viewModelUpdater
{
  return self->_viewModelUpdater;
}

- (void)setViewModelUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_viewModelUpdater, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModelUpdater, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_cachedAvailableStyles, 0);
}

uint64_t __70__PUParallaxLayerStackDebugStyleTableViewController_cellValueUpdated___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "kind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __70__PUParallaxLayerStackDebugStyleTableViewController_cellValueUpdated___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStyle:", *(_QWORD *)(a1 + 32));
}

uint64_t __85__PUParallaxLayerStackDebugStyleTableViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "kind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "kind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

uint64_t __71__PUParallaxLayerStackDebugStyleTableViewController_indexPathForStyle___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "kind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "kind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

@end
