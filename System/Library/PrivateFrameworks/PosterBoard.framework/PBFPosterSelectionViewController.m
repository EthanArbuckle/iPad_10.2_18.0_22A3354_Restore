@implementation PBFPosterSelectionViewController

- (id)sectionWithEnvironment:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
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

  objc_msgSend(a3, "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "effectiveContentSize");
  v6 = (v5 + -64.0 + -40.0) / 3.0;

  -[PBFPosterSelectionViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "screen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    +[PBFFocusPosterCell estimatedCellSizeForItemWidth:screen:hasAccessory:](PBFFocusPosterCell, "estimatedCellSizeForItemWidth:screen:hasAccessory:", v9, 1, v6);
    v11 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PBFFocusPosterCell estimatedCellSizeForItemWidth:screen:hasAccessory:](PBFFocusPosterCell, "estimatedCellSizeForItemWidth:screen:hasAccessory:", v12, 1, v6);
    v11 = v13;

  }
  v14 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sizeWithWidthDimension:heightDimension:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sizeWithWidthDimension:heightDimension:", v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:supplementaryItems:", v17, MEMORY[0x1E0C9AA60]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setContentInsets:", 10.0, 10.0, 10.0, 10.0);
  objc_msgSend(MEMORY[0x1E0DC3350], "horizontalGroupWithLayoutSize:subitem:count:", v21, v22, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setContentInsets:", 26.0, 22.0, 26.0, 22.0);
  objc_msgSend(v24, "setInterGroupSpacing:", 26.0);

  return v24;
}

- (id)compositionalLayout
{
  id v2;
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v2 = objc_alloc(MEMORY[0x1E0DC35D0]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__PBFPosterSelectionViewController_compositionalLayout__block_invoke;
  v5[3] = &unk_1E86F4E30;
  objc_copyWeak(&v6, &location);
  v3 = (void *)objc_msgSend(v2, "initWithSectionProvider:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

id __55__PBFPosterSelectionViewController_compositionalLayout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  _QWORD *WeakRetained;
  void *v6;
  void *v7;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained && WeakRetained[128])
  {
    objc_msgSend(WeakRetained, "sectionWithEnvironment:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContentInsets:", 26.0, 22.0, 20.0, 22.0);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (PBFPosterSelectionViewController)initWithAllowedConfigurationUUIDs:(id)a3 selectedConfigurationUUID:(id)a4 galleryDataProvider:(id)a5 dataStore:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  PBFPosterSelectionViewController *v17;
  uint64_t v18;
  NSSet *allowedConfigurationUUIDs;
  uint64_t v20;
  NSMapTable *configurationsToMetadata;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v12;
  NSClassFromString(CFSTR("PBFPosterGalleryDataProvider"));
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSelectionViewController initWithAllowedConfigurationUUIDs:selectedConfigurationUUID:galleryDataProvider:dataStore:].cold.1();
LABEL_19:
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA6A2F4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PBFPosterGalleryDataProviderClass]"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSelectionViewController initWithAllowedConfigurationUUIDs:selectedConfigurationUUID:galleryDataProvider:dataStore:].cold.1();
    objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA6A358);
  }

  v15 = v13;
  NSClassFromString(CFSTR("PBFPosterExtensionDataStore"));
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSelectionViewController initWithAllowedConfigurationUUIDs:selectedConfigurationUUID:galleryDataProvider:dataStore:].cold.2();
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA6A3BCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PBFPosterExtensionDataStoreClass]"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSelectionViewController initWithAllowedConfigurationUUIDs:selectedConfigurationUUID:galleryDataProvider:dataStore:].cold.2();
    goto LABEL_19;
  }

  -[PBFPosterSelectionViewController compositionalLayout](self, "compositionalLayout");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26.receiver = self;
  v26.super_class = (Class)PBFPosterSelectionViewController;
  v17 = -[PBFPosterSelectionViewController initWithCollectionViewLayout:](&v26, sel_initWithCollectionViewLayout_, v16);

  if (v17)
  {
    v18 = objc_msgSend(v10, "copy");
    allowedConfigurationUUIDs = v17->_allowedConfigurationUUIDs;
    v17->_allowedConfigurationUUIDs = (NSSet *)v18;

    objc_storeStrong((id *)&v17->_selectedConfigurationUUID, a4);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v20 = objc_claimAutoreleasedReturnValue();
    configurationsToMetadata = v17->_configurationsToMetadata;
    v17->_configurationsToMetadata = (NSMapTable *)v20;

    objc_storeStrong((id *)&v17->_galleryDataProvider, a5);
    objc_storeStrong((id *)&v17->_dataStore, a6);
    -[PBFPosterExtensionDataStore addObserver:](v17->_dataStore, "addObserver:", v17);
  }

  return v17;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  UICollectionViewDiffableDataSource *v12;
  UICollectionViewDiffableDataSource *dataSource;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PBFPosterSelectionViewController;
  -[PBFPosterSelectionViewController viewDidLoad](&v17, sel_viewDidLoad);
  -[PBFPosterSelectionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[PBFPosterSelectionViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterSelectionViewController _cancelBarButtonItem](self, "_cancelBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLeftBarButtonItem:", v6);

  -[PBFPosterSelectionViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterSelectionViewController _doneBarButtonItem](self, "_doneBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRightBarButtonItem:", v8);

  -[PBFPosterSelectionViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("Poster"));

  -[PBFPosterSelectionViewController _validateDoneButton](self, "_validateDoneButton");
  objc_initWeak(&location, self);
  v10 = objc_alloc(MEMORY[0x1E0DC35E8]);
  -[PBFPosterSelectionViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __47__PBFPosterSelectionViewController_viewDidLoad__block_invoke;
  v14[3] = &unk_1E86F2340;
  objc_copyWeak(&v15, &location);
  v12 = (UICollectionViewDiffableDataSource *)objc_msgSend(v10, "initWithCollectionView:cellProvider:", v11, v14);
  dataSource = self->_dataSource;
  self->_dataSource = v12;

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

id __47__PBFPosterSelectionViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_cellForItemAtIndexPath:identifier:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)viewIsAppearing:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBFPosterSelectionViewController;
  -[PBFPosterSelectionViewController viewIsAppearing:](&v4, sel_viewIsAppearing_, a3);
  self->_layoutOrientation = -[UIViewController pbf_layoutOrientation](self, "pbf_layoutOrientation");
  -[PBFPosterSelectionViewController _reloadDataWithAnimation:](self, "_reloadDataWithAnimation:", 0);
}

- (void)_orientationDidChange
{
  uint64_t v3;
  void *v4;
  int64_t layoutOrientation;
  int64_t v6;
  void *v7;
  id v8;

  -[PBFPosterSelectionViewController view](self, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    layoutOrientation = self->_layoutOrientation;
    v6 = -[UIViewController pbf_layoutOrientation](self, "pbf_layoutOrientation");

    if (layoutOrientation == v6)
      return;
    self->_layoutOrientation = -[UIViewController pbf_layoutOrientation](self, "pbf_layoutOrientation");
    -[PBFPosterSelectionViewController _reloadDataWithAnimation:](self, "_reloadDataWithAnimation:", 0);
    -[PBFPosterSelectionViewController collectionView](self, "collectionView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collectionViewLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidateLayout");

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __87__PBFPosterSelectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v4[3] = &unk_1E86F4E58;
  v4[4] = self;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", v4, 0);
}

uint64_t __87__PBFPosterSelectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_orientationDidChange");
}

- (id)_cancelBarButtonItem
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancel_);
}

- (id)_doneBarButtonItem
{
  UIBarButtonItem *doneButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  doneButtonItem = self->_doneButtonItem;
  if (!doneButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__done_);
    v5 = self->_doneButtonItem;
    self->_doneButtonItem = v4;

    -[UIBarButtonItem setEnabled:](self->_doneButtonItem, "setEnabled:", 0);
    doneButtonItem = self->_doneButtonItem;
  }
  return doneButtonItem;
}

- (void)_validateDoneButton
{
  -[UIBarButtonItem setEnabled:](self->_doneButtonItem, "setEnabled:", self->_selectedConfigurationUUID != 0);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSSet *allowedConfigurationUUIDs;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NSArray objectAtIndexedSubscript:](self->_configurations, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serverIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "posterUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  allowedConfigurationUUIDs = self->_allowedConfigurationUUIDs;
  if (!allowedConfigurationUUIDs || -[NSSet containsObject:](allowedConfigurationUUIDs, "containsObject:", v11))
  {
    v25 = v6;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v6, "visibleCells", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v19 = objc_opt_class();
          v20 = v18;
          if (v19)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v21 = v20;
            else
              v21 = 0;
          }
          else
          {
            v21 = 0;
          }
          v22 = v21;

          objc_msgSend(v22, "setCheckboxOn:", 0);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v15);
    }

    v6 = v25;
    objc_msgSend(v25, "cellForItemAtIndexPath:", v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_selectedConfigurationUUID, v11);
    objc_msgSend(v23, "setCheckboxOn:", 1);
    -[PBFPosterSelectionViewController _validateDoneButton](self, "_validateDoneButton");

    v8 = v24;
  }

}

- (void)_reloadDataWithAnimation:(BOOL)a3
{
  PRSwitcherConfiguration *v4;
  PRSwitcherConfiguration *switcherConfiguration;
  NSArray *v6;
  NSArray *configurations;
  id v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  PBFPosterSelectionConfigurationMetadata *v14;
  void *v15;
  void *v16;
  void *v17;
  PBFPosterExtensionDataStore *dataStore;
  id v19;
  void *v20;
  void *v21;
  PBFPosterConfigurationGalleryPreview *v22;
  PBFPosterExtensionDataStore *v23;
  PBFPosterExtensionDataStore *v24;
  NSDictionary *v25;
  NSDictionary *uuidsToConfigurations;
  void *v27;
  _BOOL4 v28;
  uint64_t v29;
  void *v30;
  NSArray *obj;
  uint64_t v32;
  _QWORD v33[4];
  PBFPosterSelectionConfigurationMetadata *v34;
  PBFPosterSelectionViewController *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v28 = a3;
  v42 = *MEMORY[0x1E0C80C00];
  -[PBFPosterExtensionDataStore switcherConfiguration](self->_dataStore, "switcherConfiguration");
  v4 = (PRSwitcherConfiguration *)objc_claimAutoreleasedReturnValue();
  switcherConfiguration = self->_switcherConfiguration;
  self->_switcherConfiguration = v4;

  -[PRSwitcherConfiguration configurations](self->_switcherConfiguration, "configurations");
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  configurations = self->_configurations;
  self->_configurations = v6;

  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[UIViewController pbf_displayContext](self, "pbf_displayContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable removeAllObjects](self->_configurationsToMetadata, "removeAllObjects");
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = self->_configurations;
  v32 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v32)
  {
    v9 = *(_QWORD *)v38;
    v29 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v38 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v11, "_path");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "serverIdentity");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMapTable objectForKey:](self->_configurationsToMetadata, "objectForKey:", v11);
        v14 = (PBFPosterSelectionConfigurationMetadata *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          v14 = objc_alloc_init(PBFPosterSelectionConfigurationMetadata);
          -[NSMapTable setObject:forKey:](self->_configurationsToMetadata, "setObject:forKey:", v14, v11);
        }
        objc_msgSend(v13, "posterUUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "UUIDString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("uuidString != nil"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[PBFPosterSelectionViewController _reloadDataWithAnimation:].cold.1();
          objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1CBA6AEB0);
        }
        objc_msgSend(v8, "setObject:forKey:", v11, v16);
        -[PBFPosterSelectionConfigurationMetadata cachedSnapshot](v14, "cachedSnapshot");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
        {
          dataStore = self->_dataStore;
          objc_msgSend(v13, "provider");
          v19 = v8;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[PBFPosterExtensionDataStore providerForExtensionIdentifier:](dataStore, "providerForExtensionIdentifier:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = -[PBFPosterConfigurationGalleryPreview initWithConfiguration:extension:]([PBFPosterConfigurationGalleryPreview alloc], "initWithConfiguration:extension:", v11, v21);
          -[PBFPosterSelectionConfigurationMetadata setPosterPreview:](v14, "setPosterPreview:", v22);
          v23 = self->_dataStore;
          v33[0] = MEMORY[0x1E0C809B0];
          v33[1] = 3221225472;
          v33[2] = __61__PBFPosterSelectionViewController__reloadDataWithAnimation___block_invoke;
          v33[3] = &unk_1E86F3270;
          v34 = v14;
          v35 = self;
          v36 = v16;
          v24 = v23;
          v9 = v29;
          -[PBFPosterExtensionDataStore fetchGallerySnapshotForConfiguration:context:completion:](v24, "fetchGallerySnapshotForConfiguration:context:completion:", v11, v30, v33);

          v8 = v19;
        }

      }
      v32 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v32);
  }

  v25 = (NSDictionary *)objc_msgSend(v8, "copy");
  uuidsToConfigurations = self->_uuidsToConfigurations;
  self->_uuidsToConfigurations = v25;

  -[PBFPosterSelectionViewController _applySnapshotForCurrentStateWithAnimation:](self, "_applySnapshotForCurrentStateWithAnimation:", v28);
}

void __61__PBFPosterSelectionViewController__reloadDataWithAnimation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__PBFPosterSelectionViewController__reloadDataWithAnimation___block_invoke_2;
  block[3] = &unk_1E86F4638;
  v13 = v5;
  v14 = v6;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v15 = v7;
  v16 = v8;
  v17 = v9;
  v10 = v6;
  v11 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __61__PBFPosterSelectionViewController__reloadDataWithAnimation___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 48), "setCachedSnapshot:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 1024), "indexPathForItemIdentifier:", *(_QWORD *)(a1 + 64));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v6 = v2;
      objc_msgSend(*(id *)(a1 + 56), "collectionView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "cellForItemAtIndexPath:", v6);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setPosterImage:", *(_QWORD *)(a1 + 32));
      objc_msgSend(v4, "setCheckboxAssociatedPosterIdentifier:", *(_QWORD *)(a1 + 64));

      v2 = v6;
    }

  }
  else
  {
    PBFLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __61__PBFPosterSelectionViewController__reloadDataWithAnimation___block_invoke_2_cold_1(a1, v5);

  }
}

- (void)_applySnapshotForCurrentStateWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[2];

  v3 = a3;
  v8[1] = *MEMORY[0x1E0C80C00];
  -[NSArray bs_compactMap:](self->_configurations, "bs_compactMap:", &__block_literal_global_12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0DC3398]);
    v8[0] = CFSTR("Configured");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendSectionsWithIdentifiers:", v7);

    objc_msgSend(v6, "appendItemsWithIdentifiers:", v5);
    -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_dataSource, "applySnapshot:animatingDifferences:", v6, v3);

  }
}

id __79__PBFPosterSelectionViewController__applySnapshotForCurrentStateWithAnimation___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "_path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serverIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "posterUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)posterExtensionDataStoreDidUpdateConfigurations:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__PBFPosterSelectionViewController_posterExtensionDataStoreDidUpdateConfigurations___block_invoke;
  block[3] = &unk_1E86F2518;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __84__PBFPosterSelectionViewController_posterExtensionDataStoreDidUpdateConfigurations___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "_reloadDataWithAnimation:", 1);
}

- (id)_cellForItemAtIndexPath:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSSet *allowedConfigurationUUIDs;
  uint64_t v15;
  void *v16;
  void *v17;
  NSUUID *selectedConfigurationUUID;
  void *v19;
  void *v20;
  void *v21;
  void *v23;

  v6 = a4;
  v7 = a3;
  -[PBFPosterSelectionViewController collectionView](self, "collectionView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("Poster"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDictionary objectForKey:](self->_uuidsToConfigurations, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_configurationsToMetadata, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "serverIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "posterUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  allowedConfigurationUUIDs = self->_allowedConfigurationUUIDs;
  if (allowedConfigurationUUIDs)
    v15 = -[NSSet containsObject:](allowedConfigurationUUIDs, "containsObject:", v13);
  else
    v15 = 1;
  objc_msgSend(v10, "cachedSnapshot");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPosterImage:", v16);

  objc_msgSend(v8, "setPosterPreviewGenerator:", self->_galleryDataProvider);
  objc_msgSend(v10, "posterPreview");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPosterPreview:", v17);

  objc_msgSend(v8, "setCheckboxAssociatedPosterIdentifier:", v6);
  selectedConfigurationUUID = self->_selectedConfigurationUUID;
  objc_msgSend(v9, "_path");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "serverIdentity");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "posterUUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCheckboxOn:", -[NSUUID isEqual:](selectedConfigurationUUID, "isEqual:", v21));

  objc_msgSend(v8, "setActionType:", 1);
  objc_msgSend(v8, "setEnabled:", v15);

  return v8;
}

- (void)_cancel:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7F830]), "initWithResult:configurationUUID:", 0, 0);
  -[PBFPosterSelectionViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "posterSelectionViewController:willDismissWithResponse:", self, v4);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__PBFPosterSelectionViewController__cancel___block_invoke;
  v7[3] = &unk_1E86F2540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[PBFPosterSelectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v7);

}

void __44__PBFPosterSelectionViewController__cancel___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "posterSelectionViewController:didDismissWithResponse:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_done:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7F830]), "initWithResult:configurationUUID:", 1, self->_selectedConfigurationUUID);
  -[PBFPosterSelectionViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "posterSelectionViewController:willDismissWithResponse:", self, v4);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__PBFPosterSelectionViewController__done___block_invoke;
  v7[3] = &unk_1E86F2540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[PBFPosterSelectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v7);

}

void __42__PBFPosterSelectionViewController__done___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "posterSelectionViewController:didDismissWithResponse:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (PBFPosterSelectionViewControllerDelegate)delegate
{
  return (PBFPosterSelectionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (void)setLayoutOrientation:(int64_t)a3
{
  self->_layoutOrientation = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configurationsToMetadata, 0);
  objc_storeStrong((id *)&self->_uuidsToConfigurations, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_switcherConfiguration, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_selectedConfigurationUUID, 0);
  objc_storeStrong((id *)&self->_allowedConfigurationUUIDs, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_galleryDataProvider, 0);
  objc_storeStrong((id *)&self->_doneButtonItem, 0);
}

- (void)initWithAllowedConfigurationUUIDs:selectedConfigurationUUID:galleryDataProvider:dataStore:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithAllowedConfigurationUUIDs:selectedConfigurationUUID:galleryDataProvider:dataStore:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_reloadDataWithAnimation:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __61__PBFPosterSelectionViewController__reloadDataWithAnimation___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1CB9FA000, a2, OS_LOG_TYPE_ERROR, "Poster Selection: Could not fetch snapshot for configuration: %@", (uint8_t *)&v3, 0xCu);
}

@end
