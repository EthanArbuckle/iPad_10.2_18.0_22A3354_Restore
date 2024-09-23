@implementation PXPeopleDetailSettingsViewController

- (void)commonInit
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __50__PXPeopleDetailSettingsViewController_commonInit__block_invoke;
  v2[3] = &unk_1E513C230;
  v2[4] = self;
  -[PXPeopleDetailSettingsViewController commonInitWithDataSourceReloadBlock:](self, "commonInitWithDataSourceReloadBlock:", v2);
}

- (void)commonInitWithDataSourceReloadBlock:(id)a3
{
  void *v4;
  PXPeoplePersonDataSource *v5;
  PXPeopleSuggestionDataSource *v6;
  id v7;

  v7 = a3;
  -[PXPeopleDetailSettingsViewController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = -[PXPeopleDataSource initWithName:objectsReloadBlock:asynchronousLoad:callbackDelegate:]([PXPeoplePersonDataSource alloc], "initWithName:objectsReloadBlock:asynchronousLoad:callbackDelegate:", CFSTR("PeopleAdditionalDataSource"), v7, 1, self);
    -[PXPeopleDataSource setSortComparator:](v5, "setSortComparator:", &__block_literal_global_240832);
    -[PXPeopleDetailSettingsViewController setDataSource:](self, "setDataSource:", v5);
    v6 = -[PXPeopleSuggestionDataSource initWithFlowType:]([PXPeopleSuggestionDataSource alloc], "initWithFlowType:", 0);
    -[PXPeopleDetailSettingsViewController setSuggestionDataSource:](self, "setSuggestionDataSource:", v6);

  }
}

- (PXPeopleDetailSettingsViewController)init
{
  PXPeopleDetailSettingsViewController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPeopleDetailSettingsViewController;
  v2 = -[PXPeopleDetailSettingsViewController init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CD1570], "defaultDetectionTypes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleDetailSettingsViewController setPersonDetectionTypes:](v2, "setPersonDetectionTypes:", v3);

    -[PXPeopleDetailSettingsViewController commonInit](v2, "commonInit");
  }
  return v2;
}

- (PXPeopleDetailSettingsViewController)initWithDataSourceReloadBlock:(id)a3
{
  id v4;
  PXPeopleDetailSettingsViewController *v5;
  PXPeopleDetailSettingsViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXPeopleDetailSettingsViewController;
  v5 = -[PXPeopleDetailSettingsViewController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[PXPeopleDetailSettingsViewController commonInitWithDataSourceReloadBlock:](v5, "commonInitWithDataSourceReloadBlock:", v4);

  return v6;
}

- (PXPeopleDetailSettingsViewController)initWithPersonDetectionType:(signed __int16)a3
{
  uint64_t v3;
  PXPeopleDetailSettingsViewController *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[2];

  v3 = a3;
  v9[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)PXPeopleDetailSettingsViewController;
  v4 = -[PXPeopleDetailSettingsViewController init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleDetailSettingsViewController setPersonDetectionTypes:](v4, "setPersonDetectionTypes:", v6);

    -[PXPeopleDetailSettingsViewController commonInit](v4, "commonInit");
  }
  return v4;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXPeopleDetailSettingsViewController;
  -[PXPeopleDetailSettingsViewController viewDidLoad](&v12, sel_viewDidLoad);
  v3 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  objc_msgSend(v3, "setMinimumInteritemSpacing:", 15.0);
  objc_msgSend(v3, "setMinimumLineSpacing:", 15.0);
  -[PXPeopleDetailSettingsViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0DC35B8]);
  objc_msgSend(v4, "frame");
  v6 = (void *)objc_msgSend(v5, "initWithFrame:collectionViewLayout:", v3);
  -[PXPeopleDetailSettingsViewController setCollectionView:](self, "setCollectionView:", v6);
  objc_msgSend(v6, "setAutoresizingMask:", 18);
  objc_msgSend(v6, "setDataSource:", self);
  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("cellIdentifier"));
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

  objc_msgSend(v4, "addSubview:", v6);
  objc_initWeak(&location, self);
  -[PXPeopleDetailSettingsViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__PXPeopleDetailSettingsViewController_viewDidLoad__block_invoke;
  v9[3] = &unk_1E5148D30;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v8, "loadObjectsAndUpdateMembersWithCompletion:", v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[PXPeopleDetailSettingsViewController dataSource](self, "dataSource", a3, a4);
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
  uint64_t v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  uint64_t v36;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("cellIdentifier"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "tag") + 1;
  objc_msgSend(v8, "setTag:", v9);
  -[PXPeopleDetailSettingsViewController dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "item");

  objc_msgSend(v7, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "displayScale");
  v14 = v13;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __78__PXPeopleDetailSettingsViewController_collectionView_cellForItemAtIndexPath___block_invoke;
  v34[3] = &unk_1E5141BA8;
  v15 = v8;
  v35 = v15;
  v36 = v9;
  objc_msgSend(v10, "imageAtIndex:targetSize:displayScale:resultHandler:", v11, v34, 110.0, 110.0, v14);

  -[PXPeopleDetailSettingsViewController dataSource](self, "dataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "personAtIndex:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "titleAtIndex:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v18, "length"))
  {
    objc_msgSend(v17, "uuid");
    v19 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v19;
  }
  v20 = objc_msgSend(v10, "photoQuantityAtIndex:", v11);
  v21 = objc_msgSend(v17, "verifiedType");
  if ((unint64_t)(v21 + 2) > 4)
    v22 = CFSTR("Unknown");
  else
    v22 = off_1E513C340[v21 + 2];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld (%@)"), v20, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "quantityLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setText:", v23);

  objc_msgSend(v15, "avatarView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setAlpha:", 1.0);
  objc_msgSend(v25, "setHighlighted:", 0);
  v30 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v31 = *MEMORY[0x1E0C9BAA8];
  v29 = v31;
  v32 = v30;
  v33 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v28 = v33;
  objc_msgSend(v25, "setTransform:", &v31);
  v31 = v29;
  v32 = v30;
  v33 = v28;
  objc_msgSend(v15, "setTransform:", &v31);
  objc_msgSend(v15, "setName:", v18);
  objc_msgSend(v15, "setTextAlpha:", 1.0);
  v26 = v15;

  return v26;
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
  v8[2] = __80__PXPeopleDetailSettingsViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
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
  PXPeopleDetailSettingsViewController *v19;
  _QWORD v20[4];
  NSObject *v21;
  _QWORD *v22;
  _QWORD v23[5];
  id v24;

  v4 = a3;
  v5 = objc_msgSend(v4, "item");
  -[PXPeopleDetailSettingsViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "personAtIndex:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__240711;
  v23[4] = __Block_byref_object_dispose__240712;
  v24 = 0;
  v8 = dispatch_semaphore_create(0);
  -[PXPeopleDetailSettingsViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayScale");
  v12 = v11;
  v13 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __65__PXPeopleDetailSettingsViewController_loadSuggestionsForPerson___block_invoke;
  v20[3] = &unk_1E513C278;
  v22 = v23;
  v14 = v8;
  v21 = v14;
  objc_msgSend(v6, "imageAtIndex:targetSize:displayScale:resultHandler:", v5, v20, 110.0, 110.0, v12);

  v15 = dispatch_time(0, 20000000000);
  dispatch_semaphore_wait(v14, v15);
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __65__PXPeopleDetailSettingsViewController_loadSuggestionsForPerson___block_invoke_2;
  v17[3] = &unk_1E5148D08;
  v18 = v7;
  v19 = self;
  v16 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v17);

  _Block_object_dispose(v23, 8);
}

- (PXPeoplePersonDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
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

- (NSArray)personDetectionTypes
{
  return self->_personDetectionTypes;
}

- (void)setPersonDetectionTypes:(id)a3
{
  objc_storeStrong((id *)&self->_personDetectionTypes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personDetectionTypes, 0);
  objc_storeStrong((id *)&self->_suggestionDataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

void __65__PXPeopleDetailSettingsViewController_loadSuggestionsForPerson___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __65__PXPeopleDetailSettingsViewController_loadSuggestionsForPerson___block_invoke_2(uint64_t a1)
{
  void *v2;
  PXPeopleDetailSettingsSuggestionViewController *v3;

  v3 = -[PXPeopleDetailSettingsSuggestionViewController initWithPerson:]([PXPeopleDetailSettingsSuggestionViewController alloc], "initWithPerson:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pushViewController:animated:", v3, 1);

}

uint64_t __80__PXPeopleDetailSettingsViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "loadSuggestionsForPerson:", *(_QWORD *)(a1 + 40));
}

void __78__PXPeopleDetailSettingsViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v4 = v3;
  px_dispatch_on_main_queue();

}

uint64_t __78__PXPeopleDetailSettingsViewController_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "tag");
  if (result == *(_QWORD *)(a1 + 48))
    return objc_msgSend(*(id *)(a1 + 32), "setImage:", *(_QWORD *)(a1 + 40));
  return result;
}

void __51__PXPeopleDetailSettingsViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__PXPeopleDetailSettingsViewController_viewDidLoad__block_invoke_2;
  block[3] = &unk_1E5148D30;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __51__PXPeopleDetailSettingsViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "collectionView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

uint64_t __76__PXPeopleDetailSettingsViewController_commonInitWithDataSourceReloadBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(a2, "modelObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "verifiedType");
  v8 = objc_msgSend(v6, "verifiedType");
  if (v7 != v8)
  {
    if (v7 == 1)
      goto LABEL_10;
    if (v8 == 1)
      goto LABEL_12;
    if (v7 == 2)
      goto LABEL_10;
    if (v8 == 2)
      goto LABEL_12;
    if (v7 > v8)
    {
LABEL_10:
      v13 = -1;
      goto LABEL_13;
    }
    if (v7 < v8)
      goto LABEL_12;
  }
  v9 = objc_msgSend(v5, "faceCount");
  v10 = objc_msgSend(v6, "faceCount");
  if (v9 > v10)
    goto LABEL_10;
  if (v9 < v10)
  {
LABEL_12:
    v13 = 1;
    goto LABEL_13;
  }
  objc_msgSend(v5, "localIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "compare:", v12);

LABEL_13:
  return v13;
}

id __50__PXPeopleDetailSettingsViewController_commonInit__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "personDetectionTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIncludedDetectionTypes:", v4);

  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithOptions:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
