@implementation PXStoryAssetPickerHelper

- (PXStoryAssetPickerHelper)initWithContainerAssetCollection:(id)a3 preselectedAssets:(id)a4
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  PXStoryAssetPickerHelper *v19;
  PXStoryAssetPickerHelper *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  id v25;
  id v26;
  BOOL v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v38;
  unint64_t v39;
  void *v40;
  uint64_t v41;
  NSOrderedSet *preselectedOIDs;
  BOOL v43;
  UIViewController *v44;
  UIViewController *pickerViewController;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  objc_super v52;

  v8 = a3;
  v9 = a4;
  v10 = v8;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v10;

    if (v11)
    {
      objc_msgSend(v11, "photoLibrary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
  }
  else
  {

  }
  objc_msgSend(v9, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;

  objc_msgSend(v14, "photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
LABEL_11:

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryAssetPickerHelper.m"), 35, CFSTR("Photo library couldn't be determined for %@ / %@"), v10, v9);

  }
  v15 = v10;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;

  objc_msgSend(v16, "localIdentifier");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
LABEL_19:

    goto LABEL_21;
  }
  objc_msgSend(v15, "uuid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryAssetPickerHelper.m"), 37, CFSTR("Collection identifier couldn't be determined for %@"), v15);
    goto LABEL_19;
  }
LABEL_21:
  v52.receiver = self;
  v52.super_class = (Class)PXStoryAssetPickerHelper;
  v19 = -[PXStoryAssetPickerHelper init](&v52, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_containerCollection, a3);
    objc_storeStrong((id *)&v20->_photoLibrary, v12);
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD2168]), "initWithPhotoLibraryAndOnlyReturnsIdentifiers:", v12);
    objc_msgSend(v21, "_setUsesMemoriesLayout:", 1);
    objc_msgSend(v21, "setSelectionLimit:", *MEMORY[0x1E0CD1F00]);
    objc_msgSend(v21, "_setDisabledPrivateCapabilities:", 7);
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "allowCustomUserAssets");

    if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CD21F8], "assetCollectionSuggestionGroup:extendedCuratedAssetsOnly:shouldReverseSortOrder:", v18, 1, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "set_suggestionGroup:", v24);

      objc_msgSend(v21, "setDisabledCapabilities:", 16);
    }
    else
    {
      objc_msgSend(v21, "setDisabledCapabilities:", 21);
      objc_msgSend(v21, "set_containerIdentifier:", v18);
    }
    if (objc_msgSend(v9, "count") >= 1)
    {
      v48 = v21;
      v49 = v18;
      v50 = v15;
      v51 = v12;
      v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v26 = objc_alloc_init(MEMORY[0x1E0C99E10]);
      v27 = 1;
      if (objc_msgSend(v9, "count"))
      {
        v28 = -1;
        do
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", v28 + 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27 && (unint64_t)(v28 + 1) >= 2)
          {
            objc_msgSend(v9, "objectAtIndexedSubscript:", v28);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "creationDate");
            v31 = objc_claimAutoreleasedReturnValue();
            if (v31
              && (v32 = (void *)v31,
                  objc_msgSend(v29, "creationDate"),
                  v33 = (void *)objc_claimAutoreleasedReturnValue(),
                  v33,
                  v32,
                  v33))
            {
              objc_msgSend(v30, "creationDate");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "creationDate");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v34, "compare:", v35) != 1;

            }
            else
            {
              v27 = 0;
            }

          }
          objc_msgSend(v29, "localIdentifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v36);

          objc_msgSend(v29, "objectID");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v37);

          v38 = objc_msgSend(v9, "count");
          v39 = v28 + 2;
          ++v28;
        }
        while (v39 < v38);
      }
      v40 = (void *)objc_msgSend(v25, "copy");
      objc_msgSend(v48, "setPreselectedAssetIdentifiers:", v40);

      v41 = objc_msgSend(v26, "copy");
      preselectedOIDs = v20->_preselectedOIDs;
      v20->_preselectedOIDs = (NSOrderedSet *)v41;

      v43 = v27;
      v21 = v48;
      v20->_preselectedAssetsHaveDefaultSortOrder = v43;

      v15 = v50;
      v12 = v51;
      v18 = v49;
    }
    v44 = (UIViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD2180]), "initWithConfiguration:", v21);
    -[UIViewController setDelegate:](v44, "setDelegate:", v20);
    pickerViewController = v20->_pickerViewController;
    v20->_pickerViewController = v44;

  }
  return v20;
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[PXStoryAssetPickerHelper delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    PXMap();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v8);
    -[PXStoryAssetPickerHelper photoLibrary](self, "photoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "librarySpecificFetchOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[PXStoryAssetPickerHelper preselectedAssetsHaveDefaultSortOrder](self, "preselectedAssetsHaveDefaultSortOrder")|| (+[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v13 = objc_msgSend(v12, "allowCustomUserAssets"), v12, (v13 & 1) == 0))
    {
      v16 = (void *)MEMORY[0x1E0CB3928];
      NSStringFromSelector(sel_creationDate);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "sortDescriptorWithKey:ascending:", v17, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSortDescriptors:", v19);

      v15 = 0;
    }
    else
    {
      objc_msgSend(v11, "sortDescriptors");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSortDescriptors:", v14);

      v15 = 1;
    }
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v8, v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if ((v15 & 1) != 0)
      objc_msgSend(v20, "px_fetchedObjectIDsSortedByLocalIdentifiers:", v9);
    else
      objc_msgSend(v20, "fetchedObjectIDs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v22);
    -[PXStoryAssetPickerHelper _handlePickedAssets:](self, "_handlePickedAssets:", v23);

  }
}

- (void)_handlePickedAssets:(id)a3
{
  id v4;
  void (**v5)(void *, id, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__PXStoryAssetPickerHelper__handlePickedAssets___block_invoke;
  aBlock[3] = &unk_1E51325A8;
  aBlock[4] = self;
  v4 = a3;
  v5 = (void (**)(void *, id, _QWORD))_Block_copy(aBlock);
  v5[2](v5, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryAssetPickerHelper preselectedOIDs](self, "preselectedOIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(void *, id, void *))v5)[2](v5, v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXStoryAssetPickerHelper preselectedOIDs](self, "preselectedOIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(void *, id, id))v5)[2](v5, v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXStoryAssetPickerHelper delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "storyPickerHelper:didFinishPicking:promotedAssets:demotedAssets:", self, v6, v8, v10);

}

- (PXDisplayAssetCollection)containerCollection
{
  return self->_containerCollection;
}

- (UIViewController)pickerViewController
{
  return self->_pickerViewController;
}

- (PXStoryAssetPickerHelperDelegate)delegate
{
  return (PXStoryAssetPickerHelperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (NSOrderedSet)preselectedOIDs
{
  return self->_preselectedOIDs;
}

- (BOOL)preselectedAssetsHaveDefaultSortOrder
{
  return self->_preselectedAssetsHaveDefaultSortOrder;
}

- (PXLoadingStatusManager)loadingStatusManager
{
  return self->_loadingStatusManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingStatusManager, 0);
  objc_storeStrong((id *)&self->_preselectedOIDs, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pickerViewController, 0);
  objc_storeStrong((id *)&self->_containerCollection, 0);
}

id __48__PXStoryAssetPickerHelper__handlePickedAssets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = (void *)objc_msgSend(a2, "mutableCopy");
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "minusOrderedSet:", v5);
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E40]);
    objc_msgSend(v7, "minusOrderedSet:", v8);

  }
  if (objc_msgSend(v7, "count"))
  {
    v9 = objc_alloc(MEMORY[0x1E0CD1620]);
    objc_msgSend(v7, "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v9, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v10, v11, v12, 0, 0, 0);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __52__PXStoryAssetPickerHelper_picker_didFinishPicking___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assetIdentifier");
}

@end
