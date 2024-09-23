@implementation PXPhotoKitAssetCollectionShowInAlbumActionPerformer

+ (id)_assetInAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;

  v7 = a4;
  objc_msgSend(a3, "assetCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_descriptionForAssertionMessage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionShowInAlbumActionPerformer.m"), 23, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollectionReference.assetCollection"), v15, v17);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionShowInAlbumActionPerformer.m"), 23, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollectionReference.assetCollection"), v15);
  }

LABEL_3:
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "people");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  if (objc_msgSend(v8, "estimatedAssetCount") == 1 && !objc_msgSend(v9, "count"))
  {
    objc_msgSend(v7, "assetsFetchResult");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v11;
  void *v12;

  v6 = a4;
  objc_msgSend(a1, "_assetInAssetCollectionReference:withInputs:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7 || (objc_msgSend(v7, "isHidden") & 1) != 0 || (objc_msgSend(v8, "isTrashed") & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "containingAlbum");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CD13B8], "px_fetchContainingCollectionsForAsset:excludedAssetCollection:", v8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (unint64_t)objc_msgSend(v12, "count") > 1;

  }
  return v9;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  return PXLocalizedStringFromTable(CFSTR("PXPhotoKitAssetCollectionManagerStandardActionTitle_ShowInAlbum"), CFSTR("PhotosUICore"));
}

+ (BOOL)showsMenuForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return 1;
}

+ (void)_populateActions:(id)a3 withNode:(id)a4 asset:(id)a5 level:(unint64_t)a6
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
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
  id v23;
  void *v24;
  void *v25;
  id obj;
  uint64_t v27;
  id v30;
  _QWORD v31[5];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v30 = a5;
  objc_msgSend(v9, "sortChildNodes");
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v25 = v9;
  objc_msgSend(v9, "childNodes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v10)
  {
    v11 = v10;
    v27 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v34 != v27)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedTitle");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR(" "), "px_stringByRepeating:", a6);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "userInterfaceLayoutDirection") == 1)
        {
          objc_msgSend(v16, "stringByAppendingString:", CFSTR("\u200F"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringByAppendingString:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = v17;
        }
        else
        {
          objc_msgSend(v16, "stringByAppendingString:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }

        v19 = (void *)MEMORY[0x1E0DC3870];
        objc_msgSend(v13, "symbolName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "systemImageNamed:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = (void *)MEMORY[0x1E0DC3428];
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __93__PXPhotoKitAssetCollectionShowInAlbumActionPerformer__populateActions_withNode_asset_level___block_invoke;
        v31[3] = &unk_1E513F280;
        v31[4] = v13;
        v23 = v30;
        v32 = v23;
        objc_msgSend(v22, "actionWithTitle:image:identifier:handler:", v18, v21, 0, v31);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v24);
        objc_msgSend(a1, "_populateActions:withNode:asset:level:", v8, v13, v23, a6 + 1);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v11);
  }

}

+ (id)menuElementsForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  objc_msgSend(a1, "_assetInAssetCollectionReference:withInputs:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "containingAlbum");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPhotoKitCollectionMenuNode rootNodeForAssetCollectionsContainingAsset:excludedAssetCollection:](PXPhotoKitCollectionMenuNode, "rootNodeForAssetCollectionsContainingAsset:excludedAssetCollection:", v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_populateActions:withNode:asset:level:", v9, v10, v7, 0);

  return v9;
}

void __93__PXPhotoKitAssetCollectionShowInAlbumActionPerformer__populateActions_withNode_asset_level___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_navigateToCollection:selectedObject:completionHandler:", v2, *(_QWORD *)(a1 + 40), 0);

}

@end
