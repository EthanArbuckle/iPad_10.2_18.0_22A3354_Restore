@implementation PBFFocusPosterSelectionViewController

- (id)mastheadSectionWithEnvironment:(id)a3
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
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", a3, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeWithWidthDimension:heightDimension:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3350], "customGroupWithLayoutSize:itemProvider:", v6, &__block_literal_global);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 100.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeWithWidthDimension:heightDimension:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3330], "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v11, *MEMORY[0x1E0DC48A8], 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBoundarySupplementaryItems:", v14);

  return v13;
}

uint64_t __72__PBFFocusPosterSelectionViewController_mastheadSectionWithEnvironment___block_invoke()
{
  return MEMORY[0x1E0C9AA60];
}

- (id)sectionWithEnvironment:(id)a3 section:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
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
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "container");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "effectiveContentSize");
  v9 = (v8 + -64.0 + -40.0) / 3.0;

  -[PBFFocusPosterSelectionViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "screen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[PBFFocusPosterCell estimatedCellSizeForItemWidth:screen:hasAccessory:](PBFFocusPosterCell, "estimatedCellSizeForItemWidth:screen:hasAccessory:", v13, objc_msgSend(v6, "isEqualToString:", CFSTR("Configured")), v9);
  v15 = v14;
  if (!v12)

  v16 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sizeWithWidthDimension:heightDimension:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sizeWithWidthDimension:heightDimension:", v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:supplementaryItems:", v19, MEMORY[0x1E0C9AA60]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setContentInsets:", 10.0, 10.0, 10.0, 10.0);
  objc_msgSend(MEMORY[0x1E0DC3350], "horizontalGroupWithLayoutSize:subitem:count:", v23, v24, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 60.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sizeWithWidthDimension:heightDimension:", v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3330], "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v29, *MEMORY[0x1E0DC48A8], 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v25);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setContentInsets:", 2.0, 22.0, 26.0, 22.0);
  objc_msgSend(v31, "setInterGroupSpacing:", 26.0);
  v34[0] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setBoundarySupplementaryItems:", v32);

  return v31;
}

- (id)compositionalLayout
{
  id v4;
  void *v5;
  _QWORD v7[5];
  id v8[2];
  id location;

  objc_initWeak(&location, self);
  v4 = objc_alloc(MEMORY[0x1E0DC35D0]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__PBFFocusPosterSelectionViewController_compositionalLayout__block_invoke;
  v7[3] = &unk_1E86F22C8;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a2;
  v7[4] = self;
  v5 = (void *)objc_msgSend(v4, "initWithSectionProvider:", v7);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
  return v5;
}

id __60__PBFFocusPosterSelectionViewController_compositionalLayout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id result;
  void *v13;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (!WeakRetained || (v8 = (void *)*((_QWORD *)WeakRetained + 132)) == 0)
  {
    v11 = 0;
LABEL_12:

    return v11;
  }
  objc_msgSend(v8, "sectionIdentifierForIndex:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("Masthead")))
  {
    objc_msgSend(v7, "mastheadSectionWithEnvironment:", v5);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v11 = (void *)v10;
LABEL_11:

    goto LABEL_12;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("Create")))
  {
    objc_msgSend(v7, "sectionWithEnvironment:section:", v5, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("Configured")))
  {
    objc_msgSend(v7, "sectionWithEnvironment:section:", v5, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setContentInsets:", 2.0, 22.0, 20.0, 22.0);
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("NO"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __60__PBFFocusPosterSelectionViewController_compositionalLayout__block_invoke_cold_1(a1);
  objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (PBFFocusPosterSelectionViewController)initWithActivityUUID:(id)a3 activityIdentifier:(id)a4 galleryDataProvider:(id)a5 dataStore:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  PBFFocusPosterSelectionViewController *v20;
  NSObject *v21;
  uint64_t v22;
  NSString *activityIdentifier;
  uint64_t v24;
  NSMapTable *configurationsToMetadata;
  CFTimeInterval v26;
  PBFPosterExtensionDataStore *dataStore;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  PBFFocusPosterSelectionViewController *v39;
  CFTimeInterval v40;
  objc_super v41;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v11;
  NSClassFromString(CFSTR("NSUUID"));
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFFocusPosterSelectionViewController initWithActivityUUID:activityIdentifier:galleryDataProvider:dataStore:].cold.1();
LABEL_37:
    objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA01F14);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSUUIDClass]"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFFocusPosterSelectionViewController initWithActivityUUID:activityIdentifier:galleryDataProvider:dataStore:].cold.1();
    objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA01F78);
  }

  v16 = v12;
  NSClassFromString(CFSTR("NSString"));
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFFocusPosterSelectionViewController initWithActivityUUID:activityIdentifier:galleryDataProvider:dataStore:].cold.2();
    objc_msgSend(objc_retainAutorelease(v33), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA01FDCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFFocusPosterSelectionViewController initWithActivityUUID:activityIdentifier:galleryDataProvider:dataStore:].cold.2();
    objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA02040);
  }

  v17 = v13;
  NSClassFromString(CFSTR("PBFPosterGalleryDataProvider"));
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFFocusPosterSelectionViewController initWithActivityUUID:activityIdentifier:galleryDataProvider:dataStore:].cold.3();
    objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA020A4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PBFPosterGalleryDataProviderClass]"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFFocusPosterSelectionViewController initWithActivityUUID:activityIdentifier:galleryDataProvider:dataStore:].cold.3();
    objc_msgSend(objc_retainAutorelease(v36), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA02108);
  }

  v18 = v14;
  NSClassFromString(CFSTR("PBFPosterExtensionDataStore"));
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFFocusPosterSelectionViewController initWithActivityUUID:activityIdentifier:galleryDataProvider:dataStore:].cold.4();
    objc_msgSend(objc_retainAutorelease(v37), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA0216CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PBFPosterExtensionDataStoreClass]"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFFocusPosterSelectionViewController initWithActivityUUID:activityIdentifier:galleryDataProvider:dataStore:].cold.4();
    goto LABEL_37;
  }

  -[PBFFocusPosterSelectionViewController compositionalLayout](self, "compositionalLayout");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v41.receiver = self;
  v41.super_class = (Class)PBFFocusPosterSelectionViewController;
  v20 = -[PBFFocusPosterSelectionViewController initWithCollectionViewLayout:](&v41, sel_initWithCollectionViewLayout_, v19);

  if (v20)
  {
    PBFLogCommon();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[PBFFocusPosterSelectionViewController initWithActivityUUID:activityIdentifier:galleryDataProvider:dataStore:].cold.5();

    objc_storeStrong((id *)&v20->_activityUUID, a3);
    v22 = objc_msgSend(v16, "copy");
    activityIdentifier = v20->_activityIdentifier;
    v20->_activityIdentifier = (NSString *)v22;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v24 = objc_claimAutoreleasedReturnValue();
    configurationsToMetadata = v20->_configurationsToMetadata;
    v20->_configurationsToMetadata = (NSMapTable *)v24;

    objc_storeStrong((id *)&v20->_galleryDataProvider, a5);
    objc_storeStrong((id *)&v20->_dataStore, a6);
    v26 = CACurrentMediaTime();
    -[PBFPosterExtensionDataStore addObserver:](v20->_dataStore, "addObserver:", v20);
    dataStore = v20->_dataStore;
    -[NSUUID UUIDString](v20->_activityUUID, "UUIDString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[PBFGenericDisplayContext mainScreen](PBFGenericDisplayContext, "mainScreen");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __111__PBFFocusPosterSelectionViewController_initWithActivityUUID_activityIdentifier_galleryDataProvider_dataStore___block_invoke;
    v38[3] = &unk_1E86F2318;
    v39 = v20;
    v40 = v26;
    -[PBFPosterExtensionDataStore fetchPosterSuggestionsForFocusModeWithUUID:context:completion:](dataStore, "fetchPosterSuggestionsForFocusModeWithUUID:context:completion:", v28, v29, v38);

  }
  return v20;
}

void __111__PBFFocusPosterSelectionViewController_initWithActivityUUID_activityIdentifier_galleryDataProvider_dataStore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD block[4];
  NSObject *v9;
  id v10;
  uint64_t v11;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PBFLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __111__PBFFocusPosterSelectionViewController_initWithActivityUUID_activityIdentifier_galleryDataProvider_dataStore___block_invoke_cold_1();
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __111__PBFFocusPosterSelectionViewController_initWithActivityUUID_activityIdentifier_galleryDataProvider_dataStore___block_invoke_114;
    block[3] = &unk_1E86F22F0;
    v9 = *(id *)(a1 + 32);
    v10 = v5;
    v11 = *(_QWORD *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v7 = v9;
  }

}

uint64_t __111__PBFFocusPosterSelectionViewController_initWithActivityUUID_activityIdentifier_galleryDataProvider_dataStore___block_invoke_114(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1072) = 1;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1080), *(id *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 32), "isViewLoaded");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_applySnapshotForCurrentStateWithAnimation:", CACurrentMediaTime() - *(double *)(a1 + 48) > 0.25);
  return result;
}

- (void)dealloc
{
  BSInvalidatable *editingSessionInProgressAssertion;
  objc_super v4;

  -[BSInvalidatable invalidate](self->_editingSessionInProgressAssertion, "invalidate");
  editingSessionInProgressAssertion = self->_editingSessionInProgressAssertion;
  self->_editingSessionInProgressAssertion = 0;

  v4.receiver = self;
  v4.super_class = (Class)PBFFocusPosterSelectionViewController;
  -[PBFFocusPosterSelectionViewController dealloc](&v4, sel_dealloc);
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
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  UICollectionViewDiffableDataSource *v18;
  UICollectionViewDiffableDataSource *dataSource;
  UICollectionViewDiffableDataSource *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id location;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)PBFFocusPosterSelectionViewController;
  -[PBFFocusPosterSelectionViewController viewDidLoad](&v26, sel_viewDidLoad);
  self->_initialLayoutOrientation = -[PBFFocusPosterSelectionViewController pbf_layoutOrientation](self, "pbf_layoutOrientation");
  -[PBFFocusPosterSelectionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[PBFFocusPosterSelectionViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFFocusPosterSelectionViewController _cancelBarButtonItem](self, "_cancelBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLeftBarButtonItem:", v6);

  -[PBFFocusPosterSelectionViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFFocusPosterSelectionViewController _doneBarButtonItem](self, "_doneBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRightBarButtonItem:", v8);

  -[PBFFocusPosterSelectionViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("Suggestion"));

  -[PBFFocusPosterSelectionViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("Poster"));

  -[PBFFocusPosterSelectionViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  v13 = *MEMORY[0x1E0DC48A8];
  objc_msgSend(v11, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v12, *MEMORY[0x1E0DC48A8], CFSTR("Header"));

  -[PBFFocusPosterSelectionViewController collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), v13, CFSTR("Masthead"));

  -[PBFFocusPosterSelectionViewController _populateActivityMetadata](self, "_populateActivityMetadata");
  objc_initWeak(&location, self);
  v15 = objc_alloc(MEMORY[0x1E0DC35E8]);
  -[PBFFocusPosterSelectionViewController collectionView](self, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __52__PBFFocusPosterSelectionViewController_viewDidLoad__block_invoke;
  v23[3] = &unk_1E86F2340;
  objc_copyWeak(&v24, &location);
  v18 = (UICollectionViewDiffableDataSource *)objc_msgSend(v15, "initWithCollectionView:cellProvider:", v16, v23);
  dataSource = self->_dataSource;
  self->_dataSource = v18;

  v20 = self->_dataSource;
  v21[0] = v17;
  v21[1] = 3221225472;
  v21[2] = __52__PBFFocusPosterSelectionViewController_viewDidLoad__block_invoke_2;
  v21[3] = &unk_1E86F2368;
  objc_copyWeak(&v22, &location);
  -[UICollectionViewDiffableDataSource setSupplementaryViewProvider:](v20, "setSupplementaryViewProvider:", v21);
  -[PBFFocusPosterSelectionViewController _reloadDataWithAnimation:](self, "_reloadDataWithAnimation:", 0);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

id __52__PBFFocusPosterSelectionViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
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

id __52__PBFFocusPosterSelectionViewController_viewDidLoad__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v4;
  id v5;
  id WeakRetained;
  void *v7;

  v4 = (id *)(a1 + 32);
  v5 = a4;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_supplementaryViewAtIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)pbf_layoutOrientation
{
  void *v2;
  int64_t v3;

  -[PBFFocusPosterSelectionViewController presentingViewController](self, "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "interfaceOrientation");

  return v3;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  PBFFocusPosterSelectionViewController *v13;
  objc_super v14;

  height = a3.height;
  width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)PBFFocusPosterSelectionViewController;
  v7 = a4;
  -[PBFFocusPosterSelectionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[PBFFocusPosterSelectionViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collectionViewLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __92__PBFFocusPosterSelectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v11[3] = &unk_1E86F2390;
  v12 = v9;
  v13 = self;
  v10 = v9;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v11, &__block_literal_global_130);

}

uint64_t __92__PBFFocusPosterSelectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidateLayout");
  return objc_msgSend(*(id *)(a1 + 40), "_reloadDataWithAnimation:", 0);
}

- (id)_cancelBarButtonItem
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancel_);
}

- (id)_doneBarButtonItem
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__done_);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  UICollectionViewDiffableDataSource *dataSource;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  PBFFocusPosterSelectionViewController *v42;
  id v43;
  id v44;
  uint8_t buf[16];

  v6 = a4;
  dataSource = self->_dataSource;
  v8 = a3;
  -[UICollectionViewDiffableDataSource sectionIdentifierForIndex:](dataSource, "sectionIdentifierForIndex:", objc_msgSend(v6, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cellForItemAtIndexPath:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isEqualToString:", CFSTR("Create")))
  {
    -[PBFFocusPosterSuggestionData objectAtIndexedSubscript:](self->_suggestionData, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFFocusPosterSelectionViewController _showEditingForPoster:fromFocusPosterCell:](self, "_showEditingForPoster:fromFocusPosterCell:", v11, v10);
LABEL_20:

    goto LABEL_21;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("Configured")))
  {
    -[NSArray objectAtIndexedSubscript:](self->_configurations, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](self->_configurationsToMetadata, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isChecked");
    if ((v13 & 1) != 0)
    {
      objc_msgSend(v12, "setChecked:", 0);
      objc_msgSend(v11, "loadFocusConfigurationWithError:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (!v14
        || (objc_msgSend(v14, "activityUUID"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v17 = objc_msgSend(v16, "isEqual:", self->_activityUUID),
            v16,
            v17))
      {
        -[NSMutableArray addObject:](self->_nonFocusAssociatedConfigurations, "addObject:", v11);
      }

      goto LABEL_18;
    }
    if (-[NSMutableArray count](self->_nonFocusAssociatedConfigurations, "count") == 1
      && -[NSMutableArray containsObject:](self->_nonFocusAssociatedConfigurations, "containsObject:", v11))
    {
      PBFLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CB9FA000, v18, OS_LOG_TYPE_DEFAULT, "Cannot check checkbox because at least one Poster needs to be not associated with a focus.", buf, 2u);
      }

      v19 = (void *)MEMORY[0x1E0DC3450];
      PBFLocalizedString(CFSTR("CANNOT_SET_POSTER_FOCUS_ALERT_TITLE"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      PBFLocalizedString(CFSTR("CANNOT_SET_POSTER_FOCUS_ALERT_MESSAGE"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "alertControllerWithTitle:message:preferredStyle:", v20, v21, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = (void *)MEMORY[0x1E0DC3448];
      PBFLocalizedString(CFSTR("OK"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "actionWithTitle:style:handler:", v24, 0, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "addAction:", v25);
      -[PBFFocusPosterSelectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v22, 1, 0);
    }
    else
    {
      objc_msgSend(v12, "otherFocusSymbolImageName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v26)
      {
        objc_msgSend(v12, "setChecked:", 1);
        -[NSMutableArray removeObject:](self->_nonFocusAssociatedConfigurations, "removeObject:", v11);
LABEL_18:
        objc_msgSend(v10, "setCheckboxOn:", v13 ^ 1u);
        goto LABEL_19;
      }
      v37 = (void *)MEMORY[0x1E0DC3450];
      PBFLocalizedString(CFSTR("LINK_POSTER_CONFIRMATION_TITLE"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)MEMORY[0x1E0CB3940];
      PBFBundle();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("LINK_POSTER_CONFIRMATION_MESSAGE"), &stru_1E86FC5B8, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "otherFocusDisplayName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringWithFormat:", v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "alertControllerWithTitle:message:preferredStyle:", v27, v31, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = (void *)MEMORY[0x1E0DC3448];
      PBFLocalizedString(CFSTR("CANCEL"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "actionWithTitle:style:handler:", v33, 1, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = (void *)MEMORY[0x1E0DC3448];
      v22 = v38;
      PBFLocalizedString(CFSTR("LINK"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __81__PBFFocusPosterSelectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
      v40[3] = &unk_1E86F23F8;
      v41 = v12;
      v42 = self;
      v43 = v11;
      v44 = v10;
      objc_msgSend(v34, "actionWithTitle:style:handler:", v35, 0, v40);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v38, "addAction:", v25);
      objc_msgSend(v38, "addAction:", v36);
      -[PBFFocusPosterSelectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v38, 1, 0);

    }
LABEL_19:

    goto LABEL_20;
  }
LABEL_21:

}

uint64_t __81__PBFFocusPosterSelectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setChecked:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setOtherFocusSymbolImageName:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1144), "removeObject:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 56), "setCheckboxOn:", 1);
  return objc_msgSend(*(id *)(a1 + 56), "setFocusSymbolImageName:", 0);
}

- (void)_reloadDataWithAnimation:(BOOL)a3
{
  PRSwitcherConfiguration *v4;
  PRSwitcherConfiguration *switcherConfiguration;
  NSArray *v6;
  NSArray *configurations;
  NSMutableArray *v8;
  NSMutableArray *nonFocusAssociatedConfigurations;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  PBFFocusPosterConfigurationMetadata *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  PBFPosterExtensionDataStore *dataStore;
  void *v29;
  void *v30;
  PBFPosterConfigurationGalleryPreview *v31;
  PBFPosterExtensionDataStore *v32;
  id v33;
  PBFPosterExtensionDataStore *v34;
  id v35;
  NSDictionary *v36;
  NSDictionary *uuidsToConfigurations;
  void *v38;
  _BOOL4 v39;
  uint64_t v40;
  id v41;
  void *v42;
  NSArray *obj;
  void *v44;
  uint64_t v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  PBFFocusPosterSelectionViewController *v49;
  PBFFocusPosterConfigurationMetadata *v50;
  id v51;
  _QWORD v52[4];
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v39 = a3;
  v59 = *MEMORY[0x1E0C80C00];
  -[PBFPosterExtensionDataStore switcherConfiguration](self->_dataStore, "switcherConfiguration");
  v4 = (PRSwitcherConfiguration *)objc_claimAutoreleasedReturnValue();
  switcherConfiguration = self->_switcherConfiguration;
  self->_switcherConfiguration = v4;

  -[PRSwitcherConfiguration configurations](self->_switcherConfiguration, "configurations");
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  configurations = self->_configurations;
  self->_configurations = v6;

  v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  nonFocusAssociatedConfigurations = self->_nonFocusAssociatedConfigurations;
  self->_nonFocusAssociatedConfigurations = v8;

  objc_msgSend(MEMORY[0x1E0D22368], "sharedActivityManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "availableActivities");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[UIViewController pbf_displayContext](self, "pbf_displayContext");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = self->_configurations;
  v45 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  if (v45)
  {
    v12 = *(_QWORD *)v55;
    v40 = *(_QWORD *)v55;
    v41 = v11;
    do
    {
      for (i = 0; i != v45; ++i)
      {
        if (*(_QWORD *)v55 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_msgSend(v14, "loadFocusConfigurationWithError:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "serverIdentity");
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMapTable objectForKey:](self->_configurationsToMetadata, "objectForKey:", v14);
        v17 = (PBFFocusPosterConfigurationMetadata *)objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          v17 = objc_alloc_init(PBFFocusPosterConfigurationMetadata);
          -[NSMapTable setObject:forKey:](self->_configurationsToMetadata, "setObject:forKey:", v17, v14);
        }
        if (self->_activityUUID)
        {
          objc_msgSend(v15, "activityUUID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqual:", self->_activityUUID);

          -[PBFFocusPosterConfigurationMetadata setChecked:](v17, "setChecked:", v19);
          v52[0] = MEMORY[0x1E0C809B0];
          v52[1] = 3221225472;
          v52[2] = __66__PBFFocusPosterSelectionViewController__reloadDataWithAnimation___block_invoke;
          v52[3] = &unk_1E86F2420;
          v53 = v15;
          objc_msgSend(v44, "bs_firstObjectPassingTest:", v52);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if ((_DWORD)v19)
          {
            -[PBFFocusPosterConfigurationMetadata setOtherFocusSymbolImageName:](v17, "setOtherFocusSymbolImageName:", 0);
            -[PBFFocusPosterConfigurationMetadata setOtherFocusDisplayName:](v17, "setOtherFocusDisplayName:", 0);
          }
          else
          {
            objc_msgSend(v20, "activitySymbolImageName");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[PBFFocusPosterConfigurationMetadata setOtherFocusSymbolImageName:](v17, "setOtherFocusSymbolImageName:", v22);

            objc_msgSend(v21, "activityDisplayName");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[PBFFocusPosterConfigurationMetadata setOtherFocusDisplayName:](v17, "setOtherFocusDisplayName:", v23);

          }
        }
        if (!v15)
          -[NSMutableArray addObject:](self->_nonFocusAssociatedConfigurations, "addObject:", v14);
        v24 = v46;
        objc_msgSend(v46, "posterUUID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "UUIDString");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v26)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("uuidString != nil"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[PBFFocusPosterSelectionViewController _reloadDataWithAnimation:].cold.1();
          objc_msgSend(objc_retainAutorelease(v38), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1CBA03388);
        }
        objc_msgSend(v11, "setObject:forKey:", v14, v26);
        -[PBFFocusPosterConfigurationMetadata cachedSnapshot](v17, "cachedSnapshot");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v27)
        {
          dataStore = self->_dataStore;
          objc_msgSend(v46, "provider");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[PBFPosterExtensionDataStore providerForExtensionIdentifier:](dataStore, "providerForExtensionIdentifier:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          v31 = -[PBFPosterConfigurationGalleryPreview initWithConfiguration:extension:]([PBFPosterConfigurationGalleryPreview alloc], "initWithConfiguration:extension:", v14, v30);
          -[PBFFocusPosterConfigurationMetadata setPosterPreview:](v17, "setPosterPreview:", v31);
          v32 = self->_dataStore;
          v47[0] = MEMORY[0x1E0C809B0];
          v47[1] = 3221225472;
          v47[2] = __66__PBFFocusPosterSelectionViewController__reloadDataWithAnimation___block_invoke_163;
          v47[3] = &unk_1E86F2470;
          v33 = v42;
          v48 = v33;
          v49 = self;
          v50 = v17;
          v51 = v26;
          v34 = v32;
          v24 = v46;
          v35 = v33;
          v11 = v41;
          -[PBFPosterExtensionDataStore fetchGallerySnapshotForConfiguration:context:completion:](v34, "fetchGallerySnapshotForConfiguration:context:completion:", v14, v35, v47);

          v12 = v40;
        }

      }
      v45 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    }
    while (v45);
  }

  v36 = (NSDictionary *)objc_msgSend(v11, "copy");
  uuidsToConfigurations = self->_uuidsToConfigurations;
  self->_uuidsToConfigurations = v36;

  -[PBFFocusPosterSelectionViewController _applySnapshotForCurrentStateWithAnimation:](self, "_applySnapshotForCurrentStateWithAnimation:", v39);
}

uint64_t __66__PBFFocusPosterSelectionViewController__reloadDataWithAnimation___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "activityUniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "activityUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

void __66__PBFFocusPosterSelectionViewController__reloadDataWithAnimation___block_invoke_163(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__PBFFocusPosterSelectionViewController__reloadDataWithAnimation___block_invoke_2;
  v12[3] = &unk_1E86F2448;
  v13 = v5;
  v14 = v6;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v15 = v7;
  v16 = v8;
  v17 = v9;
  v18 = *(id *)(a1 + 56);
  v10 = v6;
  v11 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

void __66__PBFFocusPosterSelectionViewController__reloadDataWithAnimation___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  uint8_t buf[16];

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "pbf_displayContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v2) = objc_msgSend(v2, "isEqualToDisplayContext:", v3);

    if ((v2 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 64), "setCachedSnapshot:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 1056), "indexPathForItemIdentifier:", *(_QWORD *)(a1 + 72));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v16 = v4;
        objc_msgSend(*(id *)(a1 + 56), "collectionView");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "cellForItemAtIndexPath:", v16);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "setPosterImage:", *(_QWORD *)(a1 + 32));
        objc_msgSend(CFSTR("poster-uuid--"), "stringByAppendingString:", *(_QWORD *)(a1 + 72));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setCheckboxAssociatedPosterIdentifier:", v7);

        v4 = v16;
      }

    }
    else
    {
      PBFLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CB9FA000, v15, OS_LOG_TYPE_DEFAULT, "Focus Poster Selection: Display context changed. Will need to requery.", buf, 2u);
      }

    }
  }
  else
  {
    PBFLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __66__PBFFocusPosterSelectionViewController__reloadDataWithAnimation___block_invoke_2_cold_1(a1, v8, v9, v10, v11, v12, v13, v14);

  }
}

- (void)_applySnapshotForCurrentStateWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const __CFString *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v3 = a3;
  v15[1] = *MEMORY[0x1E0C80C00];
  -[PBFFocusPosterSuggestionData previews](self->_suggestionData, "previews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_compactMap:", &__block_literal_global_166);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSArray bs_compactMap:](self->_configurations, "bs_compactMap:", &__block_literal_global_168);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  v15[0] = CFSTR("Masthead");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendSectionsWithIdentifiers:", v9);

  if (self->_receivedSuggestionsResponse)
  {
    v14 = CFSTR("Create");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendSectionsWithIdentifiers:", v10);

    if (objc_msgSend(v6, "count"))
      objc_msgSend(v8, "appendItemsWithIdentifiers:", v6);
  }
  v13 = CFSTR("Configured");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendSectionsWithIdentifiers:", v11);

  if (v7)
  {
    objc_msgSend(v8, "appendItemsWithIdentifiers:", v7);
  }
  else
  {
    PBFLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[PBFFocusPosterSelectionViewController _applySnapshotForCurrentStateWithAnimation:].cold.1(&self->_configurations, (uint64_t)self, v12);

  }
  -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_dataSource, "applySnapshot:animatingDifferences:", v8, v3);

}

uint64_t __84__PBFFocusPosterSelectionViewController__applySnapshotForCurrentStateWithAnimation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "previewUniqueIdentifier");
}

id __84__PBFFocusPosterSelectionViewController__applySnapshotForCurrentStateWithAnimation___block_invoke_2(uint64_t a1, void *a2)
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
  block[2] = __89__PBFFocusPosterSelectionViewController_posterExtensionDataStoreDidUpdateConfigurations___block_invoke;
  block[3] = &unk_1E86F2518;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __89__PBFFocusPosterSelectionViewController_posterExtensionDataStoreDidUpdateConfigurations___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadDataWithAnimation:", 1);
}

- (id)_cellForItemAtIndexPath:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  -[PBFFocusPosterSelectionViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewDiffableDataSource sectionIdentifierForIndex:](self->_dataSource, "sectionIdentifierForIndex:", objc_msgSend(v6, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Configured"));

  if (v10)
  {
    objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("Poster"), v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](self->_uuidsToConfigurations, "objectForKey:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](self->_configurationsToMetadata, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLayoutOrientation:", self->_initialLayoutOrientation);
    objc_msgSend(v13, "cachedSnapshot");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPosterImage:", v14);

    objc_msgSend(v11, "setPosterPreviewGenerator:", self->_galleryDataProvider);
    objc_msgSend(v13, "posterPreview");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPosterPreview:", v15);

    objc_msgSend(v11, "setCheckboxAssociatedPosterIdentifier:", v7);
    if (self->_activityUUID)
    {
      objc_msgSend(v11, "setCheckboxOn:", objc_msgSend(v13, "isChecked"));
      objc_msgSend(v13, "otherFocusSymbolImageName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setFocusSymbolImageName:", v16);

    }
    else
    {
      objc_msgSend(v11, "setCheckboxOn:", 0);
      objc_msgSend(v11, "setFocusSymbolImageName:", 0);
    }
    objc_msgSend(v11, "setActionType:", 1);

  }
  else
  {
    -[PBFFocusPosterSuggestionData previewForUniqueIdentifier:](self->_suggestionData, "previewForUniqueIdentifier:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("Suggestion"), v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLayoutOrientation:", self->_initialLayoutOrientation);
    objc_msgSend(v11, "setActionType:", 0);
    -[PBFFocusPosterSuggestionData snapshotForPoster:](self->_suggestionData, "snapshotForPoster:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPosterImage:", v17);

    objc_msgSend(v11, "setPosterPreviewGenerator:", self->_galleryDataProvider);
    objc_msgSend(v11, "setPosterPreview:", v12);
  }

  return v11;
}

- (id)_supplementaryViewAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  _TtC11PosterBoard35PBFFocusPosterMastheadConfiguration *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[PBFFocusPosterSelectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewDiffableDataSource sectionIdentifierForIndex:](self->_dataSource, "sectionIdentifierForIndex:", objc_msgSend(v4, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Masthead"));
  v8 = *MEMORY[0x1E0DC48A8];
  if (v7)
  {
    objc_msgSend(v5, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v8, CFSTR("Masthead"), v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_activitySymbolColor && self->_activitySymbolImageName)
    {
      v10 = -[PBFFocusPosterMastheadConfiguration initWithKeyColor:symbolImageName:]([_TtC11PosterBoard35PBFFocusPosterMastheadConfiguration alloc], "initWithKeyColor:symbolImageName:", self->_activitySymbolColor, self->_activitySymbolImageName);
      objc_msgSend(v9, "setConfiguration:", v10);
LABEL_12:

    }
  }
  else
  {
    objc_msgSend(v5, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v8, CFSTR("Header"), v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "isEqualToString:", CFSTR("Create")))
    {
      PBFLocalizedString(CFSTR("CREATE_NEW_LOCK_SCREEN"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTitle:", v11);

      if (-[PBFFocusPosterSuggestionData count](self->_suggestionData, "count"))
        -[PBFFocusPosterSelectionViewController _createLockScreenFromSuggestionsHeaderDescription](self, "_createLockScreenFromSuggestionsHeaderDescription");
      else
        -[PBFFocusPosterSelectionViewController _createLockScreenHeaderDescription](self, "_createLockScreenHeaderDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAttributedSubtitle:", v12);

      v10 = (_TtC11PosterBoard35PBFFocusPosterMastheadConfiguration *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__showGallery);
      objc_msgSend(v9, "addGestureRecognizer:", v10);
      goto LABEL_12;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("Configured")))
    {
      PBFLocalizedString(CFSTR("CHOOSE_FROM_YOUR_LOCK_SCREENS"));
      v10 = (_TtC11PosterBoard35PBFFocusPosterMastheadConfiguration *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTitle:", v10);
      goto LABEL_12;
    }
  }

  return v9;
}

- (void)editingSceneViewControllerDidFinalize:(id)a3
{
  BSInvalidatable *editingSessionInProgressAssertion;

  -[BSInvalidatable invalidate](self->_editingSessionInProgressAssertion, "invalidate", a3);
  editingSessionInProgressAssertion = self->_editingSessionInProgressAssertion;
  self->_editingSessionInProgressAssertion = 0;

}

- (PREditingSceneViewControllerTopButtonLayout)topButtonLayoutForEditingSceneViewController:(SEL)a3
{
  void *v6;
  PREditingSceneViewControllerTopButtonLayout *result;
  void *v8;

  -[PBFFocusPosterSelectionViewController delegate](self, "delegate", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v8 = v6;
    objc_msgSend(v6, "topButtonLayoutForFocusPosterSelectionViewController:", self);
    v6 = v8;
  }
  else
  {
    retstr->trailingTopButtonFrame.origin = 0u;
    retstr->trailingTopButtonFrame.size = 0u;
    retstr->leadingTopButtonFrame.origin = 0u;
    retstr->leadingTopButtonFrame.size = 0u;
  }

  return result;
}

- (void)editingSceneViewController:(id)a3 userDidDismissWithAction:(int64_t)a4 updatedConfiguration:(id)a5 updatedConfiguredProperties:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD);
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  BSInvalidatable *editingSessionInProgressAssertion;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  PBFPosterExtensionDataStore *dataStore;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  PBFPosterEditingIngestionManager *v40;
  void *v41;
  void *v42;
  id v43;
  void (**v44)(_QWORD, id);
  id v45;
  id v46;
  id v47;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(id, _QWORD))a7;
  v16 = objc_opt_class();
  v17 = v12;
  if (v16)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
  }
  else
  {
    v18 = 0;
  }
  v19 = v18;

  objc_msgSend(v19, "setGalleryDismissalAction:", a4);
  -[BSInvalidatable invalidate](self->_editingSessionInProgressAssertion, "invalidate");
  editingSessionInProgressAssertion = self->_editingSessionInProgressAssertion;
  self->_editingSessionInProgressAssertion = 0;

  if (a4 == 1)
  {
    v43 = v19;
    v44 = (void (**)(_QWORD, id))v15;
    objc_msgSend(v14, "suggestionMetadata");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "lastModifiedDate");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "suggestionMetadata");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "metadataBySettingLastModifiedDateToNow");
    v23 = objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      v24 = objc_alloc(MEMORY[0x1E0D7FB78]);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v24, "initWithSuggestedGalleryItem:suggestedComplicationsByIdentifier:lastModifiedDate:", 0, MEMORY[0x1E0C9AA70], v25);

    }
    v39 = (void *)v23;
    v41 = (void *)objc_msgSend(v14, "mutableCopy");
    objc_msgSend(v41, "setSuggestionMetadata:", v23);
    v40 = objc_alloc_init(PBFPosterEditingIngestionManager);
    -[PBFPosterEditingIngestionManager setDelegate:](v40, "setDelegate:", self);
    v26 = -[PBFPosterEditingIngestionManager ingestConfiguration:updatedConfiguredProperties:editingViewController:galleryViewController:showEditingConfirmation:](v40, "ingestConfiguration:updatedConfiguredProperties:editingViewController:galleryViewController:showEditingConfirmation:", v13, v41, v17, 0, 1);
    v45 = v14;
    -[PBFPosterExtensionDataStore switcherConfiguration](self->_dataStore, "switcherConfiguration");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v13;
    v28 = (void *)objc_msgSend(v27, "mutableCopy");

    objc_msgSend(v28, "configurations");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "lastObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FB08]), "initWithActivityIdentifier:activityUUID:", self->_activityIdentifier, self->_activityUUID);
    objc_msgSend(v28, "setFocusConfiguration:forPosterConfiguration:", v31, v30);
    dataStore = self->_dataStore;
    v47 = 0;
    v33 = -[PBFPosterExtensionDataStore updateDataStoreForSwitcherConfiguration:reason:error:](dataStore, "updateDataStoreForSwitcherConfiguration:reason:error:", v28, CFSTR("Focus Poster Selection change focus configuration"), &v47);
    v34 = v47;
    objc_msgSend(v30, "_path");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "serverIdentity");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "posterUUID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "UUIDString");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v45;
    -[PBFFocusPosterSelectionViewController _logEditWithEditingViewController:posterUUID:lastModifiedDate:](self, "_logEditWithEditingViewController:posterUUID:lastModifiedDate:", v17, v38, v42);
    v15 = (void (**)(id, _QWORD))v44;
    v44[2](v44, v34);

    v13 = v46;
    v19 = v43;
  }
  else
  {
    objc_msgSend(v17, "dismissViewControllerAnimated:completion:", 1, 0);
    v15[2](v15, 0);
  }

}

- (void)_cancel:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(MEMORY[0x1E0D7F838], "cancel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFFocusPosterSelectionViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "focusPosterSelectionViewController:willDismissWithResponse:", self, v4);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__PBFFocusPosterSelectionViewController__cancel___block_invoke;
  v7[3] = &unk_1E86F2540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[PBFFocusPosterSelectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v7);

}

void __49__PBFFocusPosterSelectionViewController__cancel___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focusPosterSelectionViewController:didDismissWithResponse:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_done:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  -[PBFFocusPosterSelectionViewController _commitCheckedStates](self, "_commitCheckedStates", a3);
  objc_msgSend(MEMORY[0x1E0D7F838], "done");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFFocusPosterSelectionViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "focusPosterSelectionViewController:willDismissWithResponse:", self, v4);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__PBFFocusPosterSelectionViewController__done___block_invoke;
  v7[3] = &unk_1E86F2540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[PBFFocusPosterSelectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v7);

}

void __47__PBFFocusPosterSelectionViewController__done___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focusPosterSelectionViewController:didDismissWithResponse:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_commitCheckedStates
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "Could not save focus configuration after checkbox action: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_showGallery
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PBFPosterGalleryPreviewViewController *v8;

  v8 = -[PBFPosterGalleryPreviewViewController initWithNibName:bundle:]([PBFPosterGalleryPreviewViewController alloc], "initWithNibName:bundle:", 0, 0);
  -[PBFPosterGalleryPreviewViewController setDelegate:](v8, "setDelegate:", self);
  -[PBFPosterGalleryPreviewViewController setEditingSceneDelegate:](v8, "setEditingSceneDelegate:", self);
  -[PBFPosterGalleryPreviewViewController setDataProvider:](v8, "setDataProvider:", self->_galleryDataProvider);
  -[PBFPosterGalleryPreviewViewController sheetPresentationController](v8, "sheetPresentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PBFPosterGalleryPreviewViewController configureSheetPresentationController:](PBFPosterGalleryPreviewViewController, "configureSheetPresentationController:", v3);
  -[PBFFocusPosterSelectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
  -[PBFPosterExtensionDataStore currentGalleryConfiguration](self->_dataStore, "currentGalleryConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestedLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CF8E20], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "proactiveRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logFaceGalleryDidAppearWithFaceGalleryConfiguration:", v7);

  }
}

- (void)_showEditingForPoster:(id)a3 fromFocusPosterCell:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PBFPosterExtensionDataStore *dataStore;
  void *v18;
  void *v19;
  BSInvalidatable *v20;
  BSInvalidatable *editingSessionInProgressAssertion;
  PBFFocusEditingSceneViewController *v22;
  void *v23;
  void *v24;
  PBFFocusEditingSceneViewController *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;

  v41 = a3;
  v7 = a4;
  if (self->_editingSessionInProgressAssertion)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_editingSessionInProgressAssertion == nil"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFFocusPosterSelectionViewController _showEditingForPoster:fromFocusPosterCell:].cold.1();
    objc_msgSend(objc_retainAutorelease(v40), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    v8 = v7;
    if (-[PBFPosterExtensionDataStore canPersistNewPosterConfiguration](self->_dataStore, "canPersistNewPosterConfiguration"))
    {
      objc_msgSend(v41, "posterDescriptorLookupInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "posterDescriptorPath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v41, "posterDescriptorLookupInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "posterDescriptorExtension");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x1E0D7F8C0];
      objc_msgSend(v12, "identity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "extensionInstanceForIdentity:instanceIdentifier:", v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      dataStore = self->_dataStore;
      objc_msgSend(v12, "posterExtensionBundleIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFPosterExtensionDataStore acquireEditingSessionAssertionForProvider:withReason:](dataStore, "acquireEditingSessionAssertionForProvider:withReason:", v18, v19);
      v20 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      editingSessionInProgressAssertion = self->_editingSessionInProgressAssertion;
      self->_editingSessionInProgressAssertion = v20;

      v22 = [PBFFocusEditingSceneViewController alloc];
      objc_msgSend(MEMORY[0x1E0D7FAD0], "pbf_configurableOptionsForPreview:", v41);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D7FAE0], "pbf_configuredPropertiesForPreview:", v41);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[PRSceneViewController initWithProvider:contents:configurableOptions:configuredProperties:](v22, "initWithProvider:contents:configurableOptions:configuredProperties:", v16, v10, v23, v24);

      -[PREditingSceneViewController setAcceptButtonType:](v25, "setAcceptButtonType:", 1);
      -[PREditingSceneViewController setDelegate:](v25, "setDelegate:", self);
      -[PREditingSceneViewController addObserver:](v25, "addObserver:", self);
      objc_msgSend(v8, "contentView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "posterPreviewFrame");
      v28 = v27;
      v30 = v29;
      v32 = v31;
      v34 = v33;
      objc_msgSend(v8, "window");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "convertRect:toCoordinateSpace:", v35, v28, v30, v32, v34);
      -[PBFFocusEditingSceneViewController setPosterPreviewFrame:](v25, "setPosterPreviewFrame:");

      objc_msgSend(v8, "posterView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "snapshot");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFFocusEditingSceneViewController setGalleryPreviewView:](v25, "setGalleryPreviewView:", v37);

      objc_msgSend(v8, "makeComplicationsPortalView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFFocusEditingSceneViewController setPosterPreviewComplicationsView:](v25, "setPosterPreviewComplicationsView:", v38);

      v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v25);
      objc_msgSend(v39, "setNavigationBarHidden:animated:", 1, 0);
      objc_msgSend(v39, "setModalPresentationStyle:", 0);
      objc_msgSend(v39, "setTransitioningDelegate:", self);
      -[PBFFocusPosterSelectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v39, 1, 0);

    }
    else
    {
      -[PBFFocusPosterSelectionViewController _posterLimitExceededAlert](self, "_posterLimitExceededAlert");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFFocusPosterSelectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
    }

  }
}

- (id)_createLockScreenFromSuggestionsHeaderDescription
{
  NSAttributedString **p_createLockScreensFromSuggestionsHeaderDescription;
  NSAttributedString *createLockScreensFromSuggestionsHeaderDescription;
  NSAttributedString *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  p_createLockScreensFromSuggestionsHeaderDescription = &self->_createLockScreensFromSuggestionsHeaderDescription;
  createLockScreensFromSuggestionsHeaderDescription = self->_createLockScreensFromSuggestionsHeaderDescription;
  if (createLockScreensFromSuggestionsHeaderDescription)
  {
    v4 = createLockScreensFromSuggestionsHeaderDescription;
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3778]);
    PBFLocalizedString(CFSTR("CREATE_NEW_LOCK_SCREEN_FROM_SUGGESTIONS_HEADER_DESCRIPTION"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (NSAttributedString *)objc_msgSend(v5, "initWithString:", v6);

    -[NSAttributedString string](v4, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBFLocalizedString(CFSTR("CREATE_NEW_LOCK_SCREEN_HEADER_DESCRIPTION_GALLERY"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "rangeOfString:", v8);
    v11 = v10;

    v12 = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSAttributedString addAttribute:value:range:](v4, "addAttribute:value:range:", v12, v13, v9, v11);

    objc_storeStrong((id *)p_createLockScreensFromSuggestionsHeaderDescription, v4);
  }
  return v4;
}

- (id)_createLockScreenHeaderDescription
{
  NSAttributedString **p_createLockScreensHeaderDescription;
  NSAttributedString *createLockScreensHeaderDescription;
  NSAttributedString *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  p_createLockScreensHeaderDescription = &self->_createLockScreensHeaderDescription;
  createLockScreensHeaderDescription = self->_createLockScreensHeaderDescription;
  if (createLockScreensHeaderDescription)
  {
    v4 = createLockScreensHeaderDescription;
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3778]);
    PBFLocalizedString(CFSTR("CREATE_NEW_LOCK_SCREEN_HEADER_DESCRIPTION"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (NSAttributedString *)objc_msgSend(v5, "initWithString:", v6);

    -[NSAttributedString string](v4, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBFLocalizedString(CFSTR("CREATE_NEW_LOCK_SCREEN_HEADER_DESCRIPTION_GALLERY"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "rangeOfString:", v8);
    v11 = v10;

    v12 = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSAttributedString addAttribute:value:range:](v4, "addAttribute:value:range:", v12, v13, v9, v11);

    objc_storeStrong((id *)p_createLockScreensHeaderDescription, v4);
  }
  return v4;
}

- (void)_populateActivityMetadata
{
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, a2, a3, "Could not find activity with UUID: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_7();
}

- (void)_logEditWithEditingViewController:(id)a3 posterUUID:(id)a4 lastModifiedDate:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char isKindOfClass;
  __CFString *v12;
  __CFString *v13;
  id v14;
  double v15;
  double v16;
  uint64_t v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;

  v8 = a5;
  v28 = a4;
  v9 = a3;
  -[PBFFocusPosterSelectionViewController presentedViewController](self, "presentedViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v12 = CFSTR("focusSettingsSuggestion");
  if ((isKindOfClass & 1) != 0)
    v12 = CFSTR("focusSettingsGallery");
  v13 = v12;

  objc_msgSend(v9, "modifications");
  v29 = (id)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc(MEMORY[0x1E0CF9058]);
  objc_msgSend(v8, "timeIntervalSinceNow");
  v16 = v15;

  v17 = objc_msgSend(v29, "colorModified");
  v18 = objc_msgSend(v29, "fontModified");
  v19 = objc_msgSend(v29, "numberingSystemModified");
  v20 = objc_msgSend(v29, "posterContentModified");
  v21 = objc_msgSend(v29, "widgetsModified");
  v22 = objc_msgSend(v29, "containedWidgetsBeforeEdit");
  objc_msgSend(v29, "startDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "timeIntervalSinceNow");
  BYTE4(v27) = v22;
  BYTE3(v27) = v21;
  BYTE2(v27) = v20;
  BYTE1(v27) = v19;
  LOBYTE(v27) = v18;
  v25 = (void *)objc_msgSend(v14, "initWithLockscreenId:entryPoint:newlyCreated:secondsSinceLastEdit:outcome:userChangedColor:userChangedFont:userChangedNumberingSystem:userChangedPosterContent:userChangedWidgets:didLockscreenHaveWidgetsBeforeEdit:duration:", v28, v13, 1, (uint64_t)-v16, CFSTR("accepted"), v17, v27, (unint64_t)-v24);

  objc_msgSend(MEMORY[0x1E0CF8E20], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "logPosterEdit:completion:", v25, &__block_literal_global_214);

}

void __103__PBFFocusPosterSelectionViewController__logEditWithEditingViewController_posterUUID_lastModifiedDate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    PBFLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __103__PBFFocusPosterSelectionViewController__logEditWithEditingViewController_posterUUID_lastModifiedDate___block_invoke_cold_1();

  }
}

- (id)_posterLimitExceededAlert
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x1E0DC3450];
  PBFLocalizedString(CFSTR("TOO_MANY_CONFIGURATIONS_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PBFLocalizedString(CFSTR("TOO_MANY_CONFIGURATIONS_MESSAGE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alertControllerWithTitle:message:preferredStyle:", v3, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DC3448];
  PBFLocalizedString(CFSTR("OK"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v8);

  return v5;
}

- (void)galleryViewController:(id)a3 didSelectPreview:(id)a4 fromPreviewView:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  if (-[PBFPosterExtensionDataStore canPersistNewPosterConfiguration](self->_dataStore, "canPersistNewPosterConfiguration"))
  {
    objc_msgSend(v11, "presentPreview:withMode:fromView:", v8, 2, v9);
  }
  else
  {
    -[PBFFocusPosterSelectionViewController _posterLimitExceededAlert](self, "_posterLimitExceededAlert");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentViewController:animated:completion:", v10, 1, 0);

  }
}

- (id)galleryViewController:(id)a3 willUseAnimationController:(id)a4 forDismissingEditingViewControllerWithAction:(int64_t)a5
{
  BSInvalidatable *editingSessionInProgressAssertion;
  id v8;
  BSInvalidatable *v9;
  void *v10;
  id v11;

  editingSessionInProgressAssertion = self->_editingSessionInProgressAssertion;
  v8 = a4;
  -[BSInvalidatable invalidate](editingSessionInProgressAssertion, "invalidate");
  v9 = self->_editingSessionInProgressAssertion;
  self->_editingSessionInProgressAssertion = 0;

  if (a5 == 1)
    v10 = 0;
  else
    v10 = v8;
  v11 = v10;

  return v11;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  PBFEditingZoomUpAnimationController *v14;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  PBFEditingZoomUpAnimationController *v27;
  double v28;

  v7 = a3;
  if (a5 == self
    && (objc_opt_self(),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v8,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(v7, "bottomViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    v12 = v10;
    if (v11)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
    }
    else
    {
      v13 = 0;
    }
    v16 = v13;

    objc_msgSend(v16, "posterPreviewFrame");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    objc_msgSend(v16, "galleryPreviewView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "posterPreviewComplicationsView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = [PBFEditingZoomUpAnimationController alloc];
    +[PBFFocusPosterCell cornerRadius](PBFFocusPosterCell, "cornerRadius");
    v14 = -[PBFEditingZoomAnimationController initWithPreviewFrame:previewCornerRadius:previewView:complicationsView:](v27, "initWithPreviewFrame:previewCornerRadius:previewView:complicationsView:", v25, v26, v18, v20, v22, v24, v28);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  PBFEditingZoomDownAnimationController *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;

  v3 = a3;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "bottomViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    v8 = v6;
    if (v7)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v11 = v9;

    if (objc_msgSend(v11, "galleryDismissalAction") == 1)
    {
      v10 = 0;
    }
    else
    {
      +[PBFFocusPosterCell cornerRadius](PBFFocusPosterCell, "cornerRadius");
      v13 = v12;
      objc_msgSend(v11, "posterPreviewFrame");
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      objc_msgSend(v11, "galleryPreviewView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "posterPreviewComplicationsView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[PBFEditingZoomAnimationController initWithPreviewFrame:previewCornerRadius:previewView:complicationsView:]([PBFEditingZoomDownAnimationController alloc], "initWithPreviewFrame:previewCornerRadius:previewView:complicationsView:", v22, v23, v15, v17, v19, v21, v13);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)editingIngestionManager:(id)a3 didAccept:(id)a4 userChoice:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _OWORD v22[4];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  id v28;

  v8 = a3;
  v9 = a4;
  if (!a5)
  {
    objc_msgSend(MEMORY[0x1E0D7F838], "done");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFFocusPosterSelectionViewController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "focusPosterSelectionViewController:willDismissWithResponse:", self, v12);

    -[PBFFocusPosterSelectionViewController presentingViewController](self, "presentingViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __86__PBFFocusPosterSelectionViewController_editingIngestionManager_didAccept_userChoice___block_invoke;
    v27[3] = &unk_1E86F2540;
    v27[4] = self;
    v28 = v12;
    v15 = v12;
    objc_msgSend(v14, "dismissViewControllerAnimated:completion:", 1, v27);

LABEL_8:
    return;
  }
  objc_msgSend(v8, "dismissViewController");
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[PBFFocusPosterSelectionViewController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "topButtonLayoutForFocusPosterSelectionViewController:", self);
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
  }

  v22[0] = v23;
  v22[1] = v24;
  v22[2] = v25;
  v22[3] = v26;
  +[PBFPosterRackCollectionViewController simplifiedHomeScreenSwitcherFor:delegate:topButtonLayout:](PBFPosterRackCollectionViewController, "simplifiedHomeScreenSwitcherFor:delegate:topButtonLayout:", v9, self, v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "editingViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "navigationController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v8, "editingViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "navigationController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "pushViewController:animated:", v16, 1);

    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[[manager editingViewController] navigationController]"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[PBFFocusPosterSelectionViewController editingIngestionManager:didAccept:userChoice:].cold.1();
  objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

void __86__PBFFocusPosterSelectionViewController_editingIngestionManager_didAccept_userChoice___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focusPosterSelectionViewController:didDismissWithResponse:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (BOOL)posterRackCollectionViewControllerDidPressDone:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  objc_msgSend(MEMORY[0x1E0D7F838], "done", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFFocusPosterSelectionViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "focusPosterSelectionViewController:willDismissWithResponse:", self, v4);

  -[PBFFocusPosterSelectionViewController presentingViewController](self, "presentingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __88__PBFFocusPosterSelectionViewController_posterRackCollectionViewControllerDidPressDone___block_invoke;
  v9[3] = &unk_1E86F2540;
  v9[4] = self;
  v10 = v4;
  v7 = v4;
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v9);

  return 1;
}

void __88__PBFFocusPosterSelectionViewController_posterRackCollectionViewControllerDidPressDone___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focusPosterSelectionViewController:didDismissWithResponse:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)posterRackCollectionViewControllerDidPressCancel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  objc_msgSend(MEMORY[0x1E0D7F838], "cancel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFFocusPosterSelectionViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "focusPosterSelectionViewController:willDismissWithResponse:", self, v4);

  -[PBFFocusPosterSelectionViewController presentingViewController](self, "presentingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __90__PBFFocusPosterSelectionViewController_posterRackCollectionViewControllerDidPressCancel___block_invoke;
  v8[3] = &unk_1E86F2540;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v8);

}

void __90__PBFFocusPosterSelectionViewController_posterRackCollectionViewControllerDidPressCancel___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focusPosterSelectionViewController:didDismissWithResponse:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (PBFFocusPosterSelectionViewControllerDelegate)delegate
{
  return (PBFFocusPosterSelectionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_nonFocusAssociatedConfigurations, 0);
  objc_storeStrong((id *)&self->_configurationsToMetadata, 0);
  objc_storeStrong((id *)&self->_uuidsToConfigurations, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_switcherConfiguration, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_createLockScreensHeaderDescription, 0);
  objc_storeStrong((id *)&self->_createLockScreensFromSuggestionsHeaderDescription, 0);
  objc_storeStrong((id *)&self->_suggestionData, 0);
  objc_storeStrong((id *)&self->_editingSessionInProgressAssertion, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_galleryDataProvider, 0);
  objc_storeStrong((id *)&self->_activitySymbolColor, 0);
  objc_storeStrong((id *)&self->_activitySymbolImageName, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
  objc_storeStrong((id *)&self->_activityUUID, 0);
}

void __60__PBFFocusPosterSelectionViewController_compositionalLayout__block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  NSStringFromSelector(*(SEL *)(a1 + 48));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithActivityUUID:activityIdentifier:galleryDataProvider:dataStore:.cold.1()
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

- (void)initWithActivityUUID:activityIdentifier:galleryDataProvider:dataStore:.cold.2()
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

- (void)initWithActivityUUID:activityIdentifier:galleryDataProvider:dataStore:.cold.3()
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

- (void)initWithActivityUUID:activityIdentifier:galleryDataProvider:dataStore:.cold.4()
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

- (void)initWithActivityUUID:activityIdentifier:galleryDataProvider:dataStore:.cold.5()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9();
  _os_log_debug_impl(&dword_1CB9FA000, v0, OS_LOG_TYPE_DEBUG, "Creating PBFFocusPosterSelectionViewController with UUID: %@", v1, 0xCu);
  OUTLINED_FUNCTION_7();
}

void __111__PBFFocusPosterSelectionViewController_initWithActivityUUID_activityIdentifier_galleryDataProvider_dataStore___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "Could not get Proactive suggestions for Focus poster selection: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
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
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __66__PBFFocusPosterSelectionViewController__reloadDataWithAnimation___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, a2, a3, "Focus Poster Selection: Could not fetch snapshot for configuration: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_7();
}

- (void)_applySnapshotForCurrentStateWithAnimation:(os_log_t)log .cold.1(_QWORD *a1, uint64_t a2, os_log_t log)
{
  const __CFString *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  __int16 v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("NOT ");
  if (*a1)
    v4 = CFSTR("NOT ");
  else
    v4 = &stru_1E86FC5B8;
  if (!*(_QWORD *)(a2 + 1112))
    v3 = &stru_1E86FC5B8;
  v5 = 138412546;
  v6 = v4;
  v7 = 2112;
  v8 = v3;
  _os_log_fault_impl(&dword_1CB9FA000, log, OS_LOG_TYPE_FAULT, "PBFFocusPosterSelectionViewController: Invalid state: _configurations is %@nil, _switcherConfiguration is %@nil", (uint8_t *)&v5, 0x16u);
  OUTLINED_FUNCTION_7();
}

- (void)_showEditingForPoster:fromFocusPosterCell:.cold.1()
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
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __103__PBFFocusPosterSelectionViewController__logEditWithEditingViewController_posterUUID_lastModifiedDate___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "Error logging poster edit: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)editingIngestionManager:didAccept:userChoice:.cold.1()
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
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
