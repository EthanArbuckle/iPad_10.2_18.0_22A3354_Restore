@implementation PXAssetActionMenuBuilder

+ (id)menuElementsForActionManager:(id)a3 excludedActionTypes:(id)a4
{
  id v6;
  id v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "_actionTypesGroupedBySectionForActionManager:excludedActionTypes:", v6, v7);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v25)
  {
    v24 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (objc_msgSend(v9, "count"))
        {
          v26 = i;
          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v11 = v9;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v28;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v28 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j);
                objc_msgSend(v6, "systemImageNameForActionType:", v16);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v17);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "previewActionForActionType:image:", v16, v18);
                v19 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v10, "addObject:", v19);
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            }
            while (v13);
          }

          objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E5149688, 0, 0, 1, v10);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v20);

          i = v26;
        }
      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v25);
  }

  return v23;
}

+ (id)menuElementsForActionManager:(id)a3
{
  return (id)objc_msgSend(a1, "menuElementsForActionManager:excludedActionTypes:", a3, 0);
}

+ (id)pxMenuElementsForActionManager:(id)a3 excludedActionTypes:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t, uint64_t);
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0C99DE8];
  v11 = a4;
  objc_msgSend(v10, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_actionTypesGroupedBySectionForActionManager:excludedActionTypes:", v8, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __87__PXAssetActionMenuBuilder_pxMenuElementsForActionManager_excludedActionTypes_handler___block_invoke;
  v29 = &unk_1E51450D8;
  v14 = v12;
  v30 = v14;
  v15 = v8;
  v31 = v15;
  v16 = v9;
  v33 = v16;
  v17 = v13;
  v32 = v17;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", &v26);
  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance", v26, v27, v28, v29);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = objc_msgSend(v18, "canShowInternalUI");

  if ((_DWORD)v13)
  {
    v19 = (void *)objc_opt_new();
    objc_msgSend(v14, "addObject:", v19);

    objc_msgSend(a1, "_internalActionTypesForActionManager:", v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "actionItemsForActionTypes:handler:", v20, v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXActionMenu menuWithTitle:childElements:](PXActionMenu, "menuWithTitle:childElements:", CFSTR(" Internal"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v22);

  }
  v23 = v32;
  v24 = v14;

  return v24;
}

+ (id)_actionTypesGroupedBySectionForActionManager:(id)a3 excludedActionTypes:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void (**v10)(void *, const __CFString *, id);
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v25;
  _QWORD aBlock[4];
  id v27;
  id v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__PXAssetActionMenuBuilder__actionTypesGroupedBySectionForActionManager_excludedActionTypes___block_invoke;
  aBlock[3] = &unk_1E5145100;
  v8 = v6;
  v27 = v8;
  v9 = v5;
  v28 = v9;
  v10 = (void (**)(void *, const __CFString *, id))_Block_copy(aBlock);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v9;
    objc_msgSend(v12, "selectionManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dataSourceManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dataSource");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "containerCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = objc_msgSend(v16, "px_isRecentlyDeletedSmartAlbum");

    if ((_DWORD)v14)
    {
      v10[2](v10, CFSTR("PXAssetActionTypeDelete"), v11);
      v10[2](v10, CFSTR("PXAssetActionTypeRestore"), v11);
      v29[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }

  }
  v10[2](v10, CFSTR("PXAssetActionTypeCopy"), v11);
  v10[2](v10, CFSTR("PXAssetActionTypeShare"), v11);
  v10[2](v10, CFSTR("PXAssetActionTypeToggleFavorite"), v11);
  v10[2](v10, CFSTR("PXAssetActionTypeDuplicate"), v11);
  v10[2](v10, CFSTR("PXAssetActionTypeHide"), v11);
  v10[2](v10, CFSTR("PXAssetActionTypeShowInLibrary"), v11);
  v10[2](v10, CFSTR("PXAssetActionTypeSlideshow"), v11);
  v10[2](v10, CFSTR("PXAssetActionTypePlayMovie"), v11);
  v10[2](v10, CFSTR("PXAssetActionTypeCompositeVideo"), v11);
  v10[2](v10, CFSTR("PXAssetActionTypeSyndicationSaveToLibrary"), v11);
  if (objc_msgSend(v11, "count"))
    objc_msgSend(v7, "addObject:", v11);
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10[2](v10, CFSTR("PXAssetActionTypeAddToAlbum"), v12);
  v10[2](v10, CFSTR("PXAssetActionTypeAddToLastUsedAlbum"), v12);
  +[PXDocumentMenuSettings sharedInstance](PXDocumentMenuSettings, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "showAddToSharedAlbumAction");

  if (v19)
    v10[2](v10, CFSTR("PXAssetActionTypeAddToAlbumStream"), v12);
  v10[2](v10, CFSTR("PXAssetActionTypeMoveToSharedLibrary"), v12);
  v10[2](v10, CFSTR("PXAssetActionTypeMoveToPersonalLibrary"), v12);
  v10[2](v10, CFSTR("PXAssetActionTypeRemoveSharingSuggestion"), v12);
  if (objc_msgSend(v12, "count"))
    objc_msgSend(v7, "addObject:", v12);
  v25 = v9;
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10[2](v10, CFSTR("PXAssetActionTypeCopyAdjustments"), v15);
  v10[2](v10, CFSTR("PXAssetActionTypePasteAdjustments"), v15);
  v10[2](v10, CFSTR("PXAssetActionTypeRevertAdjustments"), v15);
  if (objc_msgSend(v15, "count"))
    objc_msgSend(v7, "addObject:", v15);
  v20 = v8;
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10[2](v10, CFSTR("PXAssetActionTypeEditDateTime"), v21);
  v10[2](v10, CFSTR("PXAssetActionTypeEditLocation"), v21);
  if (objc_msgSend(v21, "count"))
    objc_msgSend(v7, "addObject:", v21);
  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10[2](v10, CFSTR("PXAssetActionTypeInternalAddStacks"), v22);
  v10[2](v10, CFSTR("PXAssetActionTypeInternalRemoveStacks"), v22);
  if (objc_msgSend(v22, "count"))
    objc_msgSend(v7, "addObject:", v22);
  v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10[2](v10, CFSTR("PXAssetActionTypeRemove"), v23);
  v10[2](v10, CFSTR("PXAssetActionTypeTrash"), v23);
  v10[2](v10, CFSTR("PXAssetActionTypeRemoveFromFeaturedPhotos"), v23);
  v10[2](v10, CFSTR("PXAssetActionTypeFeatureLess"), v23);
  v10[2](v10, CFSTR("PXAssetActionTypeNotThisPerson"), v23);
  if (objc_msgSend(v23, "count"))
    objc_msgSend(v7, "addObject:", v23);
  v17 = v7;

  v8 = v20;
  v9 = v25;
LABEL_20:

  return v17;
}

+ (id)_internalActionTypesForActionManager:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void (**v7)(void *, const __CFString *);
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__PXAssetActionMenuBuilder__internalActionTypesForActionManager___block_invoke;
  v10[3] = &unk_1E5145218;
  v11 = v3;
  v5 = v4;
  v12 = v5;
  v6 = v3;
  v7 = (void (**)(void *, const __CFString *))_Block_copy(v10);
  v7[2](v7, CFSTR("PXAssetActionTypeInternalContentSyndicationPromoteToGuest"));
  v7[2](v7, CFSTR("PXAssetActionTypeInternalContentSyndicationFileRadar"));
  v7[2](v7, CFSTR("PXAssetActionTypeInternalAssetDetails"));
  v7[2](v7, CFSTR("PXAssetActionTypeInternalAssetSearchDetails"));
  v7[2](v7, CFSTR("PXAssetActionTypeInternalCopyURL"));
  v7[2](v7, CFSTR("PXAssetActionTypeInternalFileRadarForSharedLibrary"));
  v7[2](v7, CFSTR("PXAssetActionTypeInternalToggleStacks"));
  v8 = v5;

  return v8;
}

void __65__PXAssetActionMenuBuilder__internalActionTypesForActionManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "canPerformActionType:"))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

void __93__PXAssetActionMenuBuilder__actionTypesGroupedBySectionForActionManager_excludedActionTypes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6) & 1) == 0
    && objc_msgSend(*(id *)(a1 + 40), "canPerformActionType:", v6))
  {
    objc_msgSend(v5, "addObject:", v6);
  }

}

void __87__PXAssetActionMenuBuilder_pxMenuElementsForActionManager_excludedActionTypes_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "actionItemsForActionTypes:handler:", a2, *(_QWORD *)(a1 + 56));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  if (a3 + 1 < (unint64_t)objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v7 = *(void **)(a1 + 32);
    v8 = (id)objc_opt_new();
    objc_msgSend(v7, "addObject:", v8);

  }
}

@end
