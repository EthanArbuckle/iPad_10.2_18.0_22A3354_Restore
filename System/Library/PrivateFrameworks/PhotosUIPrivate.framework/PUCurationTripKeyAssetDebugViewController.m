@implementation PUCurationTripKeyAssetDebugViewController

- (PUCurationTripKeyAssetDebugViewController)init
{
  void *v3;
  void *v4;
  objc_class *v5;
  id v6;
  PUCurationTripKeyAssetDebugViewController *v7;
  objc_super v9;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCurationTripKeyAssetDebugViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInterfaceIdiom");
  v5 = (objc_class *)objc_opt_class();

  v6 = objc_alloc_init(v5);
  v9.receiver = self;
  v9.super_class = (Class)PUCurationTripKeyAssetDebugViewController;
  v7 = -[PUPhotosAlbumViewController initWithSpec:photoLibrary:](&v9, sel_initWithSpec_photoLibrary_, v6, v3);

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  PUCurationTripKeyAssetBrowserDebugViewController *v4;
  void *v5;
  void *v6;
  PUCurationTripKeyAssetBrowserDebugViewController *v7;
  PUCurationTripKeyAssetBrowserDebugViewController *assetCollectionViewController;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUCurationTripKeyAssetDebugViewController;
  -[PUPhotosAlbumViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[PUCurationTripKeyAssetDebugViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInterfaceIdiom");
  objc_opt_class();

  v4 = [PUCurationTripKeyAssetBrowserDebugViewController alloc];
  v5 = (void *)objc_opt_new();
  -[PUPhotosGridViewController photoLibrary](self, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PUPhotosAlbumViewController initWithSpec:photoLibrary:](v4, "initWithSpec:photoLibrary:", v5, v6);
  assetCollectionViewController = self->_assetCollectionViewController;
  self->_assetCollectionViewController = v7;

  -[PUCurationTripKeyAssetDebugViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PUPhotoCell"));

  -[PUCurationTripKeyAssetDebugViewController _fetchHighlights](self, "_fetchHighlights");
}

- (BOOL)updateSpec
{
  return 0;
}

- (void)_fetchHighlights
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PHFetchResult *v8;
  PHFetchResult *tripHighlights;
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
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("type == %d OR type == %d"), 1, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v7);

  objc_msgSend(MEMORY[0x1E0CD1708], "fetchHighlightsWithOptions:", v4);
  v8 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
  tripHighlights = self->_tripHighlights;
  self->_tripHighlights = v8;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "librarySpecificFetchOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetByHighlightUUIDForHighlights:options:", self->_tripHighlights, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sortedArrayUsingDescriptors:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssets:title:", v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0CD14E0];
  v24 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedTitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "transientCollectionListWithCollections:title:", v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v21, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosAlbumViewController setAssetCollection:fetchResultContainingAssetCollection:filterPredicate:](self, "setAssetCollection:fetchResultContainingAssetCollection:filterPredicate:", v17, v22, 0);
  -[PUCurationTripKeyAssetDebugViewController collectionView](self, "collectionView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "reloadData");

}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  PUCurationTripKeyAssetBrowserDebugViewController *assetCollectionViewController;
  void *v6;
  void *v7;

  assetCollectionViewController = self->_assetCollectionViewController;
  -[PHFetchResult objectAtIndexedSubscript:](self->_tripHighlights, "objectAtIndexedSubscript:", objc_msgSend(a4, "item", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCurationTripKeyAssetBrowserDebugViewController setTripHighlight:](assetCollectionViewController, "setTripHighlight:", v6);

  -[PUCurationTripKeyAssetDebugViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushViewController:animated:", self->_assetCollectionViewController, 1);

  return 0;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  PHFetchResult *tripHighlights;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PUCurationTripKeyAssetDebugViewController;
  v6 = a4;
  -[PUPhotosGridViewController collectionView:cellForItemAtIndexPath:](&v14, sel_collectionView_cellForItemAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  tripHighlights = self->_tripHighlights;
  v9 = objc_msgSend(v6, "item", v14.receiver, v14.super_class);

  -[PHFetchResult objectAtIndexedSubscript:](tripHighlights, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v11);

  objc_msgSend(v10, "localizedSubtitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSubtitle:", v12);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tripHighlights, 0);
  objc_storeStrong((id *)&self->_assetCollectionViewController, 0);
}

@end
