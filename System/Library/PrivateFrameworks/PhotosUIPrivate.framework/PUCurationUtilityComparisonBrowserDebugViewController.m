@implementation PUCurationUtilityComparisonBrowserDebugViewController

- (void)viewDidLoad
{
  void *v3;
  PUPhotosAlbumViewController *v4;
  void *v5;
  void *v6;
  PUPhotosAlbumViewController *v7;
  PUPhotosAlbumViewController *assetCollectionViewController;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUCurationUtilityComparisonBrowserDebugViewController;
  -[PUCurationUtilityComparisonBrowserDebugViewController viewDidLoad](&v9, sel_viewDidLoad);
  -[PUCurationUtilityComparisonBrowserDebugViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInterfaceIdiom");
  objc_opt_class();

  v4 = [PUPhotosAlbumViewController alloc];
  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PUPhotosAlbumViewController initWithSpec:photoLibrary:](v4, "initWithSpec:photoLibrary:", v5, v6);
  assetCollectionViewController = self->_assetCollectionViewController;
  self->_assetCollectionViewController = v7;

  -[PUCurationUtilityComparisonBrowserDebugViewController _fetchUtilityAssetInformation](self, "_fetchUtilityAssetInformation");
}

- (void)_fetchUtilityAssetInformation
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSMutableArray *v7;
  NSMutableArray *isUtilityButWasnt;
  NSMutableArray *v9;
  NSMutableArray *wasUtilityButIsnt;
  NSMutableArray *v11;
  NSMutableArray *isUtilityAndWas;
  NSMutableArray *v13;
  NSMutableArray *isUtilityForMemoriesButNotUtility;
  void *v15;
  _QWORD v16[5];
  id v17;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoAnalysisClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v4, "requestUtilityAssetInformationWithError:", &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v17;

  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  isUtilityButWasnt = self->_isUtilityButWasnt;
  self->_isUtilityButWasnt = v7;

  v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  wasUtilityButIsnt = self->_wasUtilityButIsnt;
  self->_wasUtilityButIsnt = v9;

  v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  isUtilityAndWas = self->_isUtilityAndWas;
  self->_isUtilityAndWas = v11;

  v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  isUtilityForMemoriesButNotUtility = self->_isUtilityForMemoriesButNotUtility;
  self->_isUtilityForMemoriesButNotUtility = v13;

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __86__PUCurationUtilityComparisonBrowserDebugViewController__fetchUtilityAssetInformation__block_invoke;
  v16[3] = &unk_1E58A9B08;
  v16[4] = self;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v16);
  -[PUCurationUtilityComparisonBrowserDebugViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "reloadData");

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  int *v6;
  uint64_t v7;
  void *v8;
  id v9;
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
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (objc_msgSend(v5, "item"))
  {
    if (objc_msgSend(v5, "item") == 1)
    {
      v6 = &OBJC_IVAR___PUCurationUtilityComparisonBrowserDebugViewController__wasUtilityButIsnt;
    }
    else
    {
      v7 = objc_msgSend(v5, "item");
      v6 = &OBJC_IVAR___PUCurationUtilityComparisonBrowserDebugViewController__isUtilityForMemoriesButNotUtility;
      if (v7 == 2)
        v6 = &OBJC_IVAR___PUCurationUtilityComparisonBrowserDebugViewController__isUtilityAndWas;
    }
  }
  else
  {
    v6 = &OBJC_IVAR___PUCurationUtilityComparisonBrowserDebugViewController__isUtilityButWasnt;
  }
  v8 = (void *)MEMORY[0x1E0CD16F8];
  v9 = *(id *)((char *)&self->super.super.super.super.isa + *v6);
  objc_msgSend(v8, "px_deprecated_appPhotoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "librarySpecificFetchOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v12;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSortDescriptors:", v14);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v9, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:", v15, &stru_1E58AD278);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0CD14E0];
  v24 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedTitle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "transientCollectionListWithCollections:title:", v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v20, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosAlbumViewController setAssetCollection:fetchResultContainingAssetCollection:filterPredicate:](self->_assetCollectionViewController, "setAssetCollection:fetchResultContainingAssetCollection:filterPredicate:", v16, v21, 0);
  -[PUPhotosAlbumViewController collectionView](self->_assetCollectionViewController, "collectionView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "reloadData");

  -[PUCurationUtilityComparisonBrowserDebugViewController navigationController](self, "navigationController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "pushViewController:animated:", self->_assetCollectionViewController, 1);

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 40.0;
}

- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  return 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("JunkClassificationBrowserDebugTableViewCellIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("JunkClassificationBrowserDebugTableViewCellIdentifier"));
    objc_msgSend(v7, "detailTextLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNumberOfLines:", 1);

    objc_msgSend(v7, "detailTextLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLineBreakMode:", 0);

  }
  v10 = objc_msgSend(v6, "item");
  if (v10 > 3)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", off_1E58A9B48[v10], objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *off_1E58A9B28[v10]), "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollectionViewController, 0);
  objc_storeStrong((id *)&self->_isUtilityForMemoriesButNotUtility, 0);
  objc_storeStrong((id *)&self->_isUtilityAndWas, 0);
  objc_storeStrong((id *)&self->_wasUtilityButIsnt, 0);
  objc_storeStrong((id *)&self->_isUtilityButWasnt, 0);
}

void __86__PUCurationUtilityComparisonBrowserDebugViewController__fetchUtilityAssetInformation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  char v5;
  uint64_t v6;
  char v7;
  void *v8;
  int *v9;
  id v10;

  v10 = a2;
  v5 = objc_msgSend(a3, "integerValue");
  v6 = v5 & 3;
  if (v6 == 1)
  {
    v9 = &OBJC_IVAR___PUCurationUtilityComparisonBrowserDebugViewController__isUtilityButWasnt;
    goto LABEL_9;
  }
  if (v6 == 3)
  {
    v9 = &OBJC_IVAR___PUCurationUtilityComparisonBrowserDebugViewController__isUtilityAndWas;
    goto LABEL_9;
  }
  v7 = v5;
  v8 = v10;
  if (v6 == 2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "addObject:", v10);
    v8 = v10;
  }
  if ((v7 & 5) == 4)
  {
    v9 = &OBJC_IVAR___PUCurationUtilityComparisonBrowserDebugViewController__isUtilityForMemoriesButNotUtility;
LABEL_9:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + *v9), "addObject:", v10);
    v8 = v10;
  }

}

@end
