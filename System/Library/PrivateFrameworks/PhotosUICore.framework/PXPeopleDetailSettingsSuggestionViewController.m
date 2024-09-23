@implementation PXPeopleDetailSettingsSuggestionViewController

- (PXPeopleDetailSettingsSuggestionViewController)initWithPerson:(id)a3
{
  id v5;
  PXPeopleDetailSettingsSuggestionViewController *v6;
  PXPeopleDetailSettingsSuggestionViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPeopleDetailSettingsSuggestionViewController;
  v6 = -[PXPeopleDetailSettingsSuggestionViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_person, a3);

  return v7;
}

- (void)loadDataSource
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  PXPeopleDetailSettingsSuggestionViewController *v10;
  id v11;

  -[PXPeopleDetailSettingsSuggestionViewController person](self, "person");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleDetailSettingsSuggestionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(25, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PXPeopleDetailSettingsSuggestionViewController_loadDataSource__block_invoke;
  block[3] = &unk_1E51457C8;
  v9 = v3;
  v10 = self;
  v11 = v4;
  v6 = v4;
  v7 = v3;
  dispatch_async(v5, block);

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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PXPeopleDetailSettingsSuggestionViewController;
  -[PXPeopleDetailSettingsSuggestionViewController viewDidLoad](&v16, sel_viewDidLoad);
  v3 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  objc_msgSend(v3, "setMinimumLineSpacing:", 15.0);
  v4 = objc_alloc(MEMORY[0x1E0DC35B8]);
  -[PXPeopleDetailSettingsSuggestionViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v6 = (void *)objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v3);
  -[PXPeopleDetailSettingsSuggestionViewController setCollectionView:](self, "setCollectionView:", v6);

  -[PXPeopleDetailSettingsSuggestionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAutoresizingMask:", 18);

  -[PXPeopleDetailSettingsSuggestionViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDataSource:", self);

  -[PXPeopleDetailSettingsSuggestionViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", self);

  -[PXPeopleDetailSettingsSuggestionViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("faceCellIdentifier"));

  -[PXPeopleDetailSettingsSuggestionViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x1E0DC48A8], CFSTR("headerTitle"));

  -[PXPeopleDetailSettingsSuggestionViewController collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v13);

  -[PXPeopleDetailSettingsSuggestionViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleDetailSettingsSuggestionViewController collectionView](self, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v15);

  -[PXPeopleDetailSettingsSuggestionViewController loadDataSource](self, "loadDataSource");
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  int64_t v7;

  -[PXPeopleDetailSettingsSuggestionViewController detailSettingsDataSources](self, "detailSettingsDataSources", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfItems");

  return v7;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v3;
  int64_t v4;

  -[PXPeopleDetailSettingsSuggestionViewController detailSettingsDataSources](self, "detailSettingsDataSources", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[PXPeopleDetailSettingsSuggestionViewController collectionView](self, "collectionView", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentSize");
  v7 = v6;

  v8 = 30.0;
  v9 = v7;
  result.height = v8;
  result.width = v9;
  return result;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((id)*MEMORY[0x1E0DC48A8] != v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleDetailSettingsViewController.m"), 523, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v12 = v11;
  objc_msgSend(v9, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v10, CFSTR("headerTitle"), v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleDetailSettingsSuggestionViewController detailSettingsDataSources](self, "detailSettingsDataSources");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v12, "section"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "title");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:", v16);

  return v13;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  uint64_t v29;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("faceCellIdentifier"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "tag") + 1;
  objc_msgSend(v8, "setTag:", v9);
  -[PXPeopleDetailSettingsSuggestionViewController detailSettingsDataSources](self, "detailSettingsDataSources");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v6, "item");
  objc_msgSend(v7, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "displayScale");
  v15 = v14;
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __88__PXPeopleDetailSettingsSuggestionViewController_collectionView_cellForItemAtIndexPath___block_invoke;
  v27 = &unk_1E513C320;
  v16 = v8;
  v28 = v16;
  v29 = v9;
  objc_msgSend(v11, "imageAtIndex:targetSize:displayScale:resultHandler:", v12, &v24, 110.0, 110.0, v15);

  if (objc_msgSend(v11, "hasMoreDetails"))
  {
    objc_msgSend(v11, "personNameAtIndex:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v11, "faceCount:", v12);
    v19 = objc_msgSend(v11, "verifyTypeAtIndex:", v12);
    if ((unint64_t)(v19 + 2) > 4)
      v20 = CFSTR("Unknown");
    else
      v20 = off_1E513C340[v19 + 2];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld (%@)"), v18, v20, v24, v25, v26, v27);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setName:", v17);
    objc_msgSend(v16, "quantityLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setText:", v21);

    objc_msgSend(v16, "setTextAlpha:", 1.0);
  }
  else
  {
    objc_msgSend(v16, "quantityLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setHidden:", 1);
  }

  return v16;
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
  void *v6;
  void *v7;
  void *v8;
  PXPeopleDetailSettingsSuggestionViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  PXPeopleDetailSettingsAssetsViewController *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _QWORD v30[3];

  v30[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[PXPeopleDetailSettingsSuggestionViewController detailSettingsDataSources](self, "detailSettingsDataSources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "action") == 1)
  {
    objc_msgSend(v7, "modelObjectForIndex:", objc_msgSend(v5, "item"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PXPeopleDetailSettingsSuggestionViewController initWithPerson:]([PXPeopleDetailSettingsSuggestionViewController alloc], "initWithPerson:", v8);
    -[PXPeopleDetailSettingsSuggestionViewController navigationController](self, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pushViewController:animated:", v9, 1);

LABEL_15:
    goto LABEL_16;
  }
  if (objc_msgSend(v7, "action") == 2)
  {
    objc_msgSend(v7, "modelObjectForIndex:", objc_msgSend(v5, "item"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "person");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0CD1390];
      objc_msgSend(v8, "person");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "fetchAssetsForPersons:options:", v14, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v15, "count"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v17 = v15;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(v16, "addObject:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i), (_QWORD)v25);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v19);
    }

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v16);
    v23 = -[PXPeopleDetailSettingsAssetsViewController initWithAssets:]([PXPeopleDetailSettingsAssetsViewController alloc], "initWithAssets:", v22);
    -[PXPeopleDetailSettingsSuggestionViewController navigationController](self, "navigationController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "pushViewController:animated:", v23, 1);

    goto LABEL_15;
  }
LABEL_16:

}

- (id)_defaultOptionsForPhotoLibrary:(id)a3 sortKey:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", v5, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInternalSortDescriptors:", v8);

  }
  objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIncludedDetectionTypes:", v9);

  return v6;
}

- (PHPerson)person
{
  return self->_person;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (NSArray)detailSettingsDataSources
{
  return (NSArray *)objc_getProperty(self, a2, 984, 1);
}

- (void)setDetailSettingsDataSources:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 984);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_detailSettingsDataSources, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

void __88__PXPeopleDetailSettingsSuggestionViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v4 = v3;
  px_dispatch_on_main_queue();

}

uint64_t __88__PXPeopleDetailSettingsSuggestionViewController_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "tag");
  if (result == *(_QWORD *)(a1 + 48))
    return objc_msgSend(*(id *)(a1 + 32), "setImage:normalizedFaceRect:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  return result;
}

void __64__PXPeopleDetailSettingsSuggestionViewController_loadDataSource__block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  PXPeopleDetailSettingsFaceDataSource *v6;
  void *v7;
  PXPeopleDetailSettingsPersonDataSource *v8;
  void *v9;
  PXPeopleDetailSettingsPersonDataSource *v10;
  void *v11;
  PXPeopleDetailSettingsPersonSuggestionDataSource *v12;
  void *v13;
  PXPeopleDetailSettingsFaceDataSource *v14;
  void *v15;
  void *v16;
  void *v17;
  PXPeopleDetailSettingsFaceDataSource *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  PXPeopleDetailSettingsKeyFacesDataSource *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  PXPeopleDetailSettingsKeyFacesDataSource *v33;
  _QWORD *v34;
  void *v35;
  id v36;
  void *v37;
  void *context;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD block[4];
  id v53;
  void *v54;
  _QWORD v55[3];

  v55[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "_defaultOptionsForPhotoLibrary:sortKey:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFetchLimit:", 9);
  objc_msgSend(MEMORY[0x1E0CD1528], "fetchSuggestedFacesForPerson:options:", a1[4], v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = -[PXPeopleDetailSettingsFaceDataSource initWithTitle:faces:]([PXPeopleDetailSettingsFaceDataSource alloc], "initWithTitle:faces:", CFSTR("Suggested Faces"), v5);
    objc_msgSend(v2, "addObject:", v6);

  }
  v51 = v5;
  objc_msgSend(a1[5], "_defaultOptionsForPhotoLibrary:sortKey:", v3, CFSTR("faceCount"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchMergeCandidatePersonsForPerson:options:", a1[4]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8 = -[PXPeopleDetailSettingsPersonDataSource initWithTitle:persons:]([PXPeopleDetailSettingsPersonDataSource alloc], "initWithTitle:persons:", CFSTR("Merged Candidate (Pet)"), v7);
    objc_msgSend(v2, "addObject:", v8);

  }
  objc_msgSend(a1[5], "_defaultOptionsForPhotoLibrary:sortKey:", v3, CFSTR("faceCount"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchInvalidMergeCandidatePersonsForPerson:options:", a1[4]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v10 = -[PXPeopleDetailSettingsPersonDataSource initWithTitle:persons:]([PXPeopleDetailSettingsPersonDataSource alloc], "initWithTitle:persons:", CFSTR("Invalidate Candidate (Pet)"), v9);
    objc_msgSend(v2, "addObject:", v10);

  }
  objc_msgSend(MEMORY[0x1E0CD16C0], "personSuggestionsForPerson:confirmedPersonSuggestions:rejectedPersonSuggestions:", a1[4], 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    v12 = -[PXPeopleDetailSettingsPersonSuggestionDataSource initWithTitle:personSuggestions:]([PXPeopleDetailSettingsPersonSuggestionDataSource alloc], "initWithTitle:personSuggestions:", CFSTR("Person Suggestion"), v11);
    objc_msgSend(v2, "addObject:", v12);

  }
  v46 = v11;
  objc_msgSend(a1[5], "_defaultOptionsForPhotoLibrary:sortKey:", v3, 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1528], "fetchRejectedFacesForPerson:options:", a1[4]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    v14 = -[PXPeopleDetailSettingsFaceDataSource initWithTitle:faces:]([PXPeopleDetailSettingsFaceDataSource alloc], "initWithTitle:faces:", CFSTR("Rejected Faces"), v13);
    objc_msgSend(v2, "addObject:", v14);

  }
  v44 = v13;
  v47 = v9;
  v49 = v7;
  objc_msgSend(a1[5], "_defaultOptionsForPhotoLibrary:sortKey:", v3, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("nameSource = %ld OR nameSource = %ld"), 1, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setInternalPredicate:", v16);

  objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesForPerson:options:", a1[4], v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count"))
  {
    v18 = -[PXPeopleDetailSettingsFaceDataSource initWithTitle:faces:]([PXPeopleDetailSettingsFaceDataSource alloc], "initWithTitle:faces:", CFSTR("Confirmation Faces"), v17);
    objc_msgSend(v2, "addObject:", v18);

  }
  objc_msgSend(v3, "photoAnalysisClient");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "uuid");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v19;
  objc_msgSend(v19, "faceCandidatesForKeyFaceForPersonsWithLocalIdentifiers:error:", v21, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v22, "count"))
  {
    v42 = v4;
    objc_msgSend(v22, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("qualityMeasure"), 0);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v24);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sortedArrayUsingDescriptors:");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[PXPeopleDetailSettingsKeyFacesDataSource initWithTitle:keyFaces:qualityProperty:photoLibrary:]([PXPeopleDetailSettingsKeyFacesDataSource alloc], "initWithTitle:keyFaces:qualityProperty:photoLibrary:", CFSTR("Key Faces by Quality Measure"), v40, CFSTR("qualityMeasure"), v3);
    objc_msgSend(v2, "addObject:", v25);

    if (objc_msgSend(a1[4], "detectionType") == 1)
    {
      v39 = v24;
      objc_msgSend(v23, "firstObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("quality"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("quality"), 0);
        v54 = v28;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "sortedArrayUsingDescriptors:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        context = (void *)MEMORY[0x1A85CE17C]();
        PFMap();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "_defaultOptionsForPhotoLibrary:sortKey:", v3, CFSTR("quality"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesWithLocalIdentifiers:options:", v37, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        PFMap();
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_autoreleasePoolPop(context);
      }
      v33 = -[PXPeopleDetailSettingsKeyFacesDataSource initWithTitle:keyFaces:qualityProperty:photoLibrary:]([PXPeopleDetailSettingsKeyFacesDataSource alloc], "initWithTitle:keyFaces:qualityProperty:photoLibrary:", CFSTR("Key Faces by Face Quality"), v30, CFSTR("quality"), v3);
      objc_msgSend(v2, "addObject:", v33);

      v24 = v39;
    }

    v4 = v42;
  }
  v34 = a1[5];
  v35 = (void *)v34[123];
  v34[123] = v2;
  v36 = v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PXPeopleDetailSettingsSuggestionViewController_loadDataSource__block_invoke_4;
  block[3] = &unk_1E5149198;
  v53 = a1[6];
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __64__PXPeopleDetailSettingsSuggestionViewController_loadDataSource__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadData");
}

id __64__PXPeopleDetailSettingsSuggestionViewController_loadDataSource__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("localIdentifier");
  v2 = a2;
  objc_msgSend(v2, "localIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("quality");
  v11[0] = v3;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v2, "quality");
  v6 = v5;

  objc_msgSend(v4, "numberWithDouble:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __64__PXPeopleDetailSettingsSuggestionViewController_loadDataSource__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("localIdentifier"));
}

@end
