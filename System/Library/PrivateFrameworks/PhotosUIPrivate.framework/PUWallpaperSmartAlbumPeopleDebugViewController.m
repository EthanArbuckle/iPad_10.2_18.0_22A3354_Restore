@implementation PUWallpaperSmartAlbumPeopleDebugViewController

- (PUWallpaperSmartAlbumPeopleDebugViewController)initWithSpec:(id)a3 dataSource:(id)a4
{
  id v7;
  id v8;
  id v9;
  PUWallpaperSmartAlbumPeopleDebugViewController *v10;
  PUWallpaperSmartAlbumPeopleDebugViewController *v11;

  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  v10 = -[PUWallpaperSmartAlbumPeopleDebugViewController initWithCollectionViewLayout:](self, "initWithCollectionViewLayout:", v9);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_spec, a3);
    objc_storeStrong((id *)&v11->_dataSource, a4);
  }

  return v11;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUWallpaperSmartAlbumPeopleDebugViewController;
  -[PUWallpaperSmartAlbumPeopleDebugViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[PUWallpaperSmartAlbumPeopleDebugViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("peopleCell"));

  -[PUWallpaperSmartAlbumPeopleDebugViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x1E0DC48A8], CFSTR("peopleHeader"));

  -[PUWallpaperSmartAlbumPeopleDebugViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addChangeObserver:", self);

  -[PUWallpaperSmartAlbumPeopleDebugViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startBackgroundFetch");

}

- (void)_updateDisplayDataSource
{
  _PXWallpaperPeoplePickerDataSourceEntry *v3;
  void *v4;
  void *v5;
  _PXWallpaperPeoplePickerDataSourceEntry *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *dataSourceEntries;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(_PXWallpaperPeoplePickerDataSourceEntry);
  -[PUWallpaperSmartAlbumPeopleDebugViewController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vipPersons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXWallpaperPeoplePickerDataSourceEntry setPersons:](v3, "setPersons:", v5);

  -[_PXWallpaperPeoplePickerDataSourceEntry setTitle:](v3, "setTitle:", CFSTR("VIP"));
  v6 = objc_alloc_init(_PXWallpaperPeoplePickerDataSourceEntry);
  -[PUWallpaperSmartAlbumPeopleDebugViewController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nonVIPPersons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXWallpaperPeoplePickerDataSourceEntry setPersons:](v6, "setPersons:", v8);

  -[_PXWallpaperPeoplePickerDataSourceEntry setTitle:](v6, "setTitle:", CFSTR("Non-VIP with shuffle suggestions"));
  v12[0] = v3;
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  dataSourceEntries = self->_dataSourceEntries;
  self->_dataSourceEntries = v9;

  -[PUWallpaperSmartAlbumPeopleDebugViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reloadData");

}

- (void)passiveContentPeoplePickerDataSourceChanged:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __94__PUWallpaperSmartAlbumPeopleDebugViewController_passiveContentPeoplePickerDataSourceChanged___block_invoke;
  v6[3] = &unk_1E58ABCA8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v3;
  int64_t v4;

  -[PUWallpaperSmartAlbumPeopleDebugViewController dataSourceEntries](self, "dataSourceEntries", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  -[PUWallpaperSmartAlbumPeopleDebugViewController dataSourceEntries](self, "dataSourceEntries", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  _QWORD v30[4];
  id v31;
  void *v32;
  uint64_t v33;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("peopleCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "tag") + 1;
  objc_msgSend(v7, "setTag:", v8);
  -[PUWallpaperSmartAlbumPeopleDebugViewController dataSourceEntries](self, "dataSourceEntries");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "persons");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "row");

  objc_msgSend(v11, "objectAtIndex:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc(MEMORY[0x1E0D7B690]);
  -[PUWallpaperSmartAlbumPeopleDebugViewController spec](self, "spec");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "itemSize");
  v17 = v16;
  v19 = v18;
  -[PUWallpaperSmartAlbumPeopleDebugViewController collectionView](self, "collectionView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "traitCollection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "displayScale");
  v23 = (void *)objc_msgSend(v14, "initWithPerson:targetSize:displayScale:", v13, v17, v19, v22);

  objc_msgSend(MEMORY[0x1E0D7B698], "sharedManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __88__PUWallpaperSmartAlbumPeopleDebugViewController_collectionView_cellForItemAtIndexPath___block_invoke;
  v30[3] = &unk_1E589D028;
  v25 = v7;
  v32 = v13;
  v33 = v8;
  v31 = v25;
  v26 = v13;
  objc_msgSend(v24, "requestFaceCropForOptions:resultHandler:", v23, v30);

  v27 = v32;
  v28 = v25;

  return v28;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 0;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[PUWallpaperSmartAlbumPeopleDebugViewController spec](self, "spec", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemSize");
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[PUWallpaperSmartAlbumPeopleDebugViewController spec](self, "spec", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "headerReferenceSize");
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIEdgeInsets result;

  -[PUWallpaperSmartAlbumPeopleDebugViewController spec](self, "spec", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionViewContentInsets");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a5;
  v9 = *MEMORY[0x1E0DC48A8];
  v10 = a4;
  objc_msgSend(a3, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, CFSTR("peopleHeader"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(v10, "isEqualToString:", v9);

  if ((_DWORD)a3)
  {
    -[PUWallpaperSmartAlbumPeopleDebugViewController dataSourceEntries](self, "dataSourceEntries");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v8, "section"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSectionHeaderTitle:", v14);

    -[PUWallpaperSmartAlbumPeopleDebugViewController spec](self, "spec");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "headerInsets");
    objc_msgSend(v11, "setSectionHeaderInsets:");

  }
  return v11;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUWallpaperSmartAlbumPeopleDebugViewController;
  -[PUWallpaperSmartAlbumPeopleDebugViewController viewWillTransitionToSize:withTransitionCoordinator:](&v7, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[PUWallpaperSmartAlbumPeopleDebugViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionViewLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidateLayout");

}

- (PUPassiveContentDebugViewSpec)spec
{
  return self->_spec;
}

- (void)setSpec:(id)a3
{
  objc_storeStrong((id *)&self->_spec, a3);
}

- (PXPassiveContentPeoplePickerDataSourceBase)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (NSArray)dataSourceEntries
{
  return self->_dataSourceEntries;
}

- (void)setDataSourceEntries:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourceEntries, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceEntries, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_spec, 0);
}

void __88__PUWallpaperSmartAlbumPeopleDebugViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v9 = *(id *)(a1 + 32);
  v10 = v6;
  v11 = *(id *)(a1 + 40);
  v7 = v5;
  v8 = v6;
  px_dispatch_on_main_queue();

}

void __88__PUWallpaperSmartAlbumPeopleDebugViewController_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "tag") == *(_QWORD *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D7C5B0]);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "CGRectValue");
    objc_msgSend(*(id *)(a1 + 32), "setImage:normalizedFaceRect:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 56), "name");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setName:", v2);

    objc_msgSend(*(id *)(a1 + 32), "setFavorite:", objc_msgSend(*(id *)(a1 + 56), "type") == 1);
  }
}

uint64_t __94__PUWallpaperSmartAlbumPeopleDebugViewController_passiveContentPeoplePickerDataSourceChanged___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDataSource:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updateDisplayDataSource");
}

@end
