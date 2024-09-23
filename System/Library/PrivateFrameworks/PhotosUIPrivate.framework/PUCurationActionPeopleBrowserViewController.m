@implementation PUCurationActionPeopleBrowserViewController

- (PUCurationActionPeopleBrowserViewController)initWithTraitContainer:(id)a3
{
  id v5;
  id v6;
  PUCurationActionPeopleBrowserViewController *v7;
  void *v8;
  PUCurationActionPeopleBrowserViewController *v9;
  PUCurationActionPeopleBrowserViewController *v10;
  void *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *facesByPersonLocalIdentifier;
  NSMutableDictionary *v14;
  NSMutableDictionary *detectionTraitsByFaceLocalIdentifierByPersonLocalIdentifier;
  void *v16;
  PUCurationActionAssetBrowserViewController *v17;
  void *v18;
  uint64_t v19;
  PUCurationActionAssetBrowserViewController *assetBrowserViewController;
  objc_super v22;
  _QWORD aBlock[4];
  id v24;
  PUCurationActionPeopleBrowserViewController *v25;

  v5 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PUCurationActionPeopleBrowserViewController_initWithTraitContainer___block_invoke;
  aBlock[3] = &unk_1E589AA58;
  v6 = v5;
  v24 = v6;
  v7 = self;
  v25 = v7;
  v8 = _Block_copy(aBlock);
  v22.receiver = v7;
  v22.super_class = (Class)PUCurationActionPeopleBrowserViewController;
  v9 = -[PXPeopleDetailSettingsViewController initWithDataSourceReloadBlock:](&v22, sel_initWithDataSourceReloadBlock_, v8);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_traitContainer, a3);
    objc_msgSend(v6, "actionLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCurationActionPeopleBrowserViewController setTitle:](v10, "setTitle:", v11);

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    facesByPersonLocalIdentifier = v10->_facesByPersonLocalIdentifier;
    v10->_facesByPersonLocalIdentifier = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    detectionTraitsByFaceLocalIdentifierByPersonLocalIdentifier = v10->_detectionTraitsByFaceLocalIdentifierByPersonLocalIdentifier;
    v10->_detectionTraitsByFaceLocalIdentifierByPersonLocalIdentifier = v14;

    -[PUCurationActionPeopleBrowserViewController px_extendedTraitCollection](v10, "px_extendedTraitCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "userInterfaceIdiom");
    objc_opt_class();

    v17 = [PUCurationActionAssetBrowserViewController alloc];
    v18 = (void *)objc_opt_new();
    v19 = -[PUPhotosAlbumViewController initWithSpec:](v17, "initWithSpec:", v18);
    assetBrowserViewController = v10->_assetBrowserViewController;
    v10->_assetBrowserViewController = (PUCurationActionAssetBrowserViewController *)v19;

  }
  return v10;
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
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v5 = a4;
  -[PXPeopleDetailSettingsViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "personAtIndex:", v7);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  -[PUCurationActionPeopleBrowserViewController facesByPersonLocalIdentifier](self, "facesByPersonLocalIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUCurationActionPeopleBrowserViewController detectionTraitsByFaceLocalIdentifierByPersonLocalIdentifier](self, "detectionTraitsByFaceLocalIdentifierByPersonLocalIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUCurationActionPeopleBrowserViewController assetBrowserViewController](self, "assetBrowserViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCurationActionPeopleBrowserViewController traitContainer](self, "traitContainer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTraitContainer:withFaces:detectionTraitsByFaceLocalIdentifier:", v15, v10, v13);

  -[PUCurationActionPeopleBrowserViewController navigationController](self, "navigationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCurationActionPeopleBrowserViewController assetBrowserViewController](self, "assetBrowserViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pushViewController:animated:", v17, 1);

}

- (PUCurationTraitContainer)traitContainer
{
  return self->_traitContainer;
}

- (void)setTraitContainer:(id)a3
{
  objc_storeStrong((id *)&self->_traitContainer, a3);
}

- (PUCurationActionAssetBrowserViewController)assetBrowserViewController
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

- (NSMutableDictionary)detectionTraitsByFaceLocalIdentifierByPersonLocalIdentifier
{
  return self->_detectionTraitsByFaceLocalIdentifierByPersonLocalIdentifier;
}

- (void)setDetectionTraitsByFaceLocalIdentifierByPersonLocalIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_detectionTraitsByFaceLocalIdentifierByPersonLocalIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectionTraitsByFaceLocalIdentifierByPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_facesByPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_assetBrowserViewController, 0);
  objc_storeStrong((id *)&self->_traitContainer, 0);
}

id __70__PUCurationActionPeopleBrowserViewController_initWithTraitContainer___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t i;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t k;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v36;
  id v37;
  id obj;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_systemPhotoLibrary");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "librarySpecificFetchOptions");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithOptions:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = v2;
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
  if (v42)
  {
    v39 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v42; ++i)
      {
        if (*(_QWORD *)v64 != v39)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
        v5 = (void *)MEMORY[0x1AF42B2C0]();
        objc_msgSend(v40, "librarySpecificFetchOptions");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("detectionTraits.@count > 0"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setInternalPredicate:", v7);

        objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesForPerson:options:", v4, v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "count"))
        {
          v41 = v4;
          v44 = v6;
          v45 = v5;
          v46 = i;
          v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v8, "count"));
          v59 = 0u;
          v60 = 0u;
          v61 = 0u;
          v62 = 0u;
          v43 = v8;
          v10 = v8;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v60;
            do
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v60 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
                objc_msgSend(v15, "localIdentifier");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v16);

              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
            }
            while (v12);
          }

          v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(MEMORY[0x1E0CD1510], "detectionTraitsByFaceLocalIdentifierForFaces:withDetectionTraitTypes:", v10, &unk_1E59B9C88);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = 0u;
          v56 = 0u;
          v57 = 0u;
          v58 = 0u;
          objc_msgSend(v18, "allKeys");
          v47 = (id)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
          if (v50)
          {
            v48 = *(_QWORD *)v56;
            v49 = v18;
            do
            {
              for (k = 0; k != v50; ++k)
              {
                if (*(_QWORD *)v56 != v48)
                  objc_enumerationMutation(v47);
                v20 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * k);
                objc_msgSend(v18, "objectForKeyedSubscript:", v20);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v51 = 0u;
                v52 = 0u;
                v53 = 0u;
                v54 = 0u;
                v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
                if (v22)
                {
                  v23 = v22;
                  v24 = *(_QWORD *)v52;
                  do
                  {
                    for (m = 0; m != v23; ++m)
                    {
                      if (*(_QWORD *)v52 != v24)
                        objc_enumerationMutation(v21);
                      v26 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * m);
                      if (objc_msgSend(v26, "type") == 1)
                      {
                        v27 = objc_msgSend(v26, "value");
                        if (v27 == objc_msgSend(*(id *)(a1 + 32), "value"))
                        {
                          objc_msgSend(v9, "objectForKeyedSubscript:", v20);
                          v28 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v17, "addObject:", v28);

                        }
                      }
                    }
                    v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
                  }
                  while (v23);
                }

                v18 = v49;
              }
              v50 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
            }
            while (v50);
          }

          if (objc_msgSend(v17, "count"))
          {
            objc_msgSend(v37, "addObject:", v41);
            objc_msgSend(*(id *)(a1 + 40), "facesByPersonLocalIdentifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "localIdentifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setObject:forKeyedSubscript:", v17, v30);

            objc_msgSend(*(id *)(a1 + 40), "detectionTraitsByFaceLocalIdentifierByPersonLocalIdentifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "localIdentifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setObject:forKeyedSubscript:", v18, v32);

          }
          v5 = v45;
          i = v46;
          v8 = v43;
          v6 = v44;
        }

        objc_autoreleasePoolPop(v5);
      }
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
    }
    while (v42);
  }

  v33 = objc_alloc(MEMORY[0x1E0CD1620]);
  v34 = (void *)objc_msgSend(v33, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v37, v40, *MEMORY[0x1E0CD1BB8], 0, 0, 0);

  return v34;
}

@end
