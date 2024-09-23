@implementation PUCurationPeopleBrowserViewController

- (PUCurationPeopleBrowserViewController)initWithScoreConfiguration:(id)a3
{
  id v5;
  PUCurationPeopleBrowserViewController *v6;
  void *v7;
  PUCurationPeopleBrowserViewController *v8;
  PUCurationPeopleBrowserViewController *v9;
  void *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *facesByPersonLocalIdentifier;
  void *v13;
  PUCurationAssetBrowserViewController *v14;
  void *v15;
  uint64_t v16;
  PUCurationAssetBrowserViewController *assetBrowserViewController;
  objc_super v19;
  _QWORD aBlock[4];
  PUCurationPeopleBrowserViewController *v21;

  v5 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PUCurationPeopleBrowserViewController_initWithScoreConfiguration___block_invoke;
  aBlock[3] = &unk_1E58A7D30;
  v6 = self;
  v21 = v6;
  v7 = _Block_copy(aBlock);
  v19.receiver = v6;
  v19.super_class = (Class)PUCurationPeopleBrowserViewController;
  v8 = -[PXPeopleDetailSettingsViewController initWithDataSourceReloadBlock:](&v19, sel_initWithDataSourceReloadBlock_, v7);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_scoreConfiguration, a3);
    objc_msgSend(v5, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCurationPeopleBrowserViewController setTitle:](v9, "setTitle:", v10);

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    facesByPersonLocalIdentifier = v9->_facesByPersonLocalIdentifier;
    v9->_facesByPersonLocalIdentifier = v11;

    -[PUCurationPeopleBrowserViewController px_extendedTraitCollection](v9, "px_extendedTraitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "userInterfaceIdiom");
    objc_opt_class();

    v14 = [PUCurationAssetBrowserViewController alloc];
    v15 = (void *)objc_opt_new();
    v16 = -[PUPhotosAlbumViewController initWithSpec:](v14, "initWithSpec:", v15);
    assetBrowserViewController = v9->_assetBrowserViewController;
    v9->_assetBrowserViewController = (PUCurationAssetBrowserViewController *)v16;

  }
  return v9;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a4;
  -[PXPeopleDetailSettingsViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "personAtIndex:", v7);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[PUCurationPeopleBrowserViewController facesByPersonLocalIdentifier](self, "facesByPersonLocalIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUCurationPeopleBrowserViewController assetBrowserViewController](self, "assetBrowserViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCurationPeopleBrowserViewController scoreConfiguration](self, "scoreConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setScoreConfiguration:withFaces:", v12, v10);

  -[PUCurationPeopleBrowserViewController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCurationPeopleBrowserViewController assetBrowserViewController](self, "assetBrowserViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pushViewController:animated:", v14, 1);

}

- (PNScoreConfiguration)scoreConfiguration
{
  return self->_scoreConfiguration;
}

- (void)setScoreConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_scoreConfiguration, a3);
}

- (PUCurationAssetBrowserViewController)assetBrowserViewController
{
  return self->_assetBrowserViewController;
}

- (void)setAssetBrowserViewController:(id)a3
{
  objc_storeStrong((id *)&self->_assetBrowserViewController, a3);
}

- (NSMutableDictionary)facesByPersonLocalIdentifier
{
  return self->_facesByPersonLocalIdentifier;
}

- (void)setFacesByPersonLocalIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_facesByPersonLocalIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_facesByPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_assetBrowserViewController, 0);
  objc_storeStrong((id *)&self->_scoreConfiguration, 0);
}

id __68__PUCurationPeopleBrowserViewController_initWithScoreConfiguration___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v16;
  id obj;
  id v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_systemPhotoLibrary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "librarySpecificFetchOptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithOptions:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v1;
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v22;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v22 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v5);
        v7 = (void *)MEMORY[0x1AF42B2C0]();
        objc_msgSend(v20, "librarySpecificFetchOptions");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesForPerson:options:", v6, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "count"))
        {
          objc_msgSend(v9, "fetchedObjects");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "facesByPersonLocalIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "localIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

          objc_msgSend(v19, "addObject:", v6);
        }

        objc_autoreleasePoolPop(v7);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v3);
  }

  v13 = objc_alloc(MEMORY[0x1E0CD1620]);
  v14 = (void *)objc_msgSend(v13, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v19, v20, *MEMORY[0x1E0CD1BB8], 0, 0, 0);

  return v14;
}

@end
