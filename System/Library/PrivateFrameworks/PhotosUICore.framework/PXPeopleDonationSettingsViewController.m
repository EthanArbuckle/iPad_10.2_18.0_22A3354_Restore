@implementation PXPeopleDonationSettingsViewController

- (void)commonInit
{
  void *v3;
  PXPeopleSuggestionDataSource *v4;
  PXPeoplePersonDataSource *v5;

  -[PXPeopleDonationSettingsViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v5 = -[PXPeopleDataSource initWithName:objectsReloadBlock:asynchronousLoad:callbackDelegate:]([PXPeoplePersonDataSource alloc], "initWithName:objectsReloadBlock:asynchronousLoad:callbackDelegate:", CFSTR("PeopleDonationDataSource"), &__block_literal_global_264845, 1, self);
    -[PXPeopleDataSource setSortComparator:](v5, "setSortComparator:", &__block_literal_global_133_264846);
    -[PXPeopleDonationSettingsViewController setDataSource:](self, "setDataSource:", v5);
    v4 = -[PXPeopleSuggestionDataSource initWithFlowType:]([PXPeopleSuggestionDataSource alloc], "initWithFlowType:", 0);
    -[PXPeopleDonationSettingsViewController setSuggestionDataSource:](self, "setSuggestionDataSource:", v4);

  }
}

- (PXPeopleDonationSettingsViewController)init
{
  PXPeopleDonationSettingsViewController *v2;
  PXPeopleDonationSettingsViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPeopleDonationSettingsViewController;
  v2 = -[PXPeopleDonationSettingsViewController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PXPeopleDonationSettingsViewController commonInit](v2, "commonInit");
  return v3;
}

- (void)viewDidLoad
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PXPeopleDonationSettingsViewController;
  -[PXPeopleDonationSettingsViewController viewDidLoad](&v14, sel_viewDidLoad);
  v3 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  objc_msgSend(v3, "setMinimumInteritemSpacing:", 15.0);
  objc_msgSend(v3, "setMinimumLineSpacing:", 15.0);
  v4 = objc_alloc(MEMORY[0x1E0DC35B8]);
  -[PXPeopleDonationSettingsViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v6 = (void *)objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v3);

  objc_msgSend(v6, "setAutoresizingMask:", 18);
  objc_msgSend(v6, "setDataSource:", self);
  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

  objc_msgSend(v6, "setAllowsSelection:", 1);
  objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("cellIdentifier"));
  -[PXPeopleDonationSettingsViewController setCollectionView:](self, "setCollectionView:", v6);
  -[PXPeopleDonationSettingsViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleDonationSettingsViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v9);

  objc_initWeak(&location, self);
  -[PXPeopleDonationSettingsViewController dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__PXPeopleDonationSettingsViewController_viewDidLoad__block_invoke;
  v11[3] = &unk_1E5148D30;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v10, "loadObjectsAndUpdateMembersWithCompletion:", v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[PXPeopleDonationSettingsViewController dataSource](self, "dataSource", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfMembers");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  id v33;
  uint64_t v34;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("cellIdentifier"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "tag") + 1;
  objc_msgSend(v8, "setTag:", v9);
  -[PXPeopleDonationSettingsViewController dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "item");

  objc_msgSend(v7, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "displayScale");
  v14 = v13;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __80__PXPeopleDonationSettingsViewController_collectionView_cellForItemAtIndexPath___block_invoke;
  v32[3] = &unk_1E5141BA8;
  v15 = v8;
  v33 = v15;
  v34 = v9;
  objc_msgSend(v10, "imageAtIndex:targetSize:displayScale:resultHandler:", v11, v32, 110.0, 110.0, v14);

  -[PXPeopleDonationSettingsViewController dataSource](self, "dataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "personAtIndex:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "titleAtIndex:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v18, "length"))
  {
    objc_msgSend(v17, "localIdentifier");
    v19 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v19;
  }
  v20 = objc_msgSend(v10, "photoQuantityAtIndex:", v11);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "quantityLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setText:", v21);

  objc_msgSend(v15, "avatarView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAlpha:", 1.0);
  objc_msgSend(v23, "setHighlighted:", 0);
  v28 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v29 = *MEMORY[0x1E0C9BAA8];
  v27 = v29;
  v30 = v28;
  v31 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v26 = v31;
  objc_msgSend(v23, "setTransform:", &v29);
  v29 = v27;
  v30 = v28;
  v31 = v26;
  objc_msgSend(v15, "setTransform:", &v29);
  objc_msgSend(v15, "setName:", v18);
  objc_msgSend(v15, "setTextAlpha:", 1.0);
  v24 = v15;

  return v24;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  v5 = 110.0;
  v6 = 110.0;
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  CGSize result;

  objc_msgSend(a3, "bounds");
  v6 = v5;
  v7 = 10.0;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  CGSize result;

  objc_msgSend(a3, "bounds");
  v6 = v5;
  v7 = 10.0;
  result.height = v7;
  result.width = v6;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  v5 = 10.0;
  v6 = 0.0;
  v7 = 10.0;
  v8 = 2.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  dispatch_get_global_queue(25, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__PXPeopleDonationSettingsViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
  v8[3] = &unk_1E5148D08;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)loadSuggestionsForPerson:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  dispatch_semaphore_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  NSObject *v14;
  dispatch_time_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  PXPeopleDonationSettingsViewController *v19;
  _QWORD v20[4];
  NSObject *v21;
  _QWORD *v22;
  _QWORD v23[5];
  id v24;

  v4 = a3;
  v5 = objc_msgSend(v4, "item");
  -[PXPeopleDonationSettingsViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "personAtIndex:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__264798;
  v23[4] = __Block_byref_object_dispose__264799;
  v24 = 0;
  v8 = dispatch_semaphore_create(0);
  -[PXPeopleDonationSettingsViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayScale");
  v12 = v11;
  v13 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __67__PXPeopleDonationSettingsViewController_loadSuggestionsForPerson___block_invoke;
  v20[3] = &unk_1E5141BD0;
  v22 = v23;
  v14 = v8;
  v21 = v14;
  objc_msgSend(v6, "imageAtIndex:targetSize:displayScale:resultHandler:", v5, v20, 110.0, 110.0, v12);

  v15 = dispatch_time(0, 20000000000);
  dispatch_semaphore_wait(v14, v15);
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __67__PXPeopleDonationSettingsViewController_loadSuggestionsForPerson___block_invoke_2;
  v17[3] = &unk_1E5148D08;
  v18 = v7;
  v19 = self;
  v16 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v17);

  _Block_object_dispose(v23, 8);
}

- (PXPeoplePersonDataSource)dataSource
{
  return (PXPeoplePersonDataSource *)objc_getProperty(self, a2, 968, 1);
}

- (void)setDataSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 968);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (PXPeopleSuggestionDataSource)suggestionDataSource
{
  return self->_suggestionDataSource;
}

- (void)setSuggestionDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionDataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionDataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

void __67__PXPeopleDonationSettingsViewController_loadSuggestionsForPerson___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __67__PXPeopleDonationSettingsViewController_loadSuggestionsForPerson___block_invoke_2(uint64_t a1)
{
  void *v2;
  PXPeopleDonationSettingsSuggestionViewController *v3;

  v3 = -[PXPeopleDonationSettingsSuggestionViewController initWithPerson:]([PXPeopleDonationSettingsSuggestionViewController alloc], "initWithPerson:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pushViewController:animated:", v3, 1);

}

uint64_t __82__PXPeopleDonationSettingsViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "loadSuggestionsForPerson:", *(_QWORD *)(a1 + 40));
}

void __80__PXPeopleDonationSettingsViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__PXPeopleDonationSettingsViewController_collectionView_cellForItemAtIndexPath___block_invoke_2;
  block[3] = &unk_1E5145560;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v8 = v4;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __80__PXPeopleDonationSettingsViewController_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "tag");
  if (result == *(_QWORD *)(a1 + 48))
    return objc_msgSend(*(id *)(a1 + 32), "setImage:", *(_QWORD *)(a1 + 40));
  return result;
}

void __53__PXPeopleDonationSettingsViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__PXPeopleDonationSettingsViewController_viewDidLoad__block_invoke_2;
  block[3] = &unk_1E5148D30;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __53__PXPeopleDonationSettingsViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "collectionView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

uint64_t __52__PXPeopleDonationSettingsViewController_commonInit__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "modelObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v6, "manualOrder"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "modelObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "manualOrder"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "compare:", v10);

  return v11;
}

id __52__PXPeopleDonationSettingsViewController_commonInit__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "librarySpecificFetchOptions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchSuggestedPersonsForClient:options:", 1, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
