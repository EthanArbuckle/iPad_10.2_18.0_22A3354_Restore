@implementation PXAlbumActionMenuBuilder

+ (NSArray)primaryActionTypes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[9];

  v6[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99DE8];
  v6[0] = CFSTR("PXAssetCollectionActionTypeShare");
  v6[1] = CFSTR("PXAssetCollectionActionTypeMoveToSharedLibrary");
  v6[2] = CFSTR("PXAssetCollectionActionTypeAddFrom");
  v6[3] = CFSTR("PXAssetCollectionActionTypeManagePeople");
  v6[4] = CFSTR("PXAssetCollectionActionTypeAddPeople");
  v6[5] = CFSTR("PXAssetCollectionActionTypeShowMap");
  v6[6] = CFSTR("PXAssetCollectionActionTypePlayMovie");
  v6[7] = CFSTR("PXAssetCollectionActionTypeCopyLink");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
    objc_msgSend(v4, "removeObject:", CFSTR("PXAssetCollectionActionTypePlayMovie"));
  return (NSArray *)v4;
}

+ (NSArray)secondaryActionTypes
{
  _QWORD v3[9];

  v3[8] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("PXAssetCollectionActionTypeCustomize");
  v3[1] = CFSTR("PXAssetCollectionActionTypeMoveOut");
  v3[2] = CFSTR("PXAssetCollectionActionTypeToggleFavorite");
  v3[3] = CFSTR("PXAssetCollectionActionTypeRemoveSharingSuggestion");
  v3[4] = CFSTR("PXAssetCollectionActionTypeBlockMemory");
  v3[5] = CFSTR("PXAssetCollectionActionTypeDelete");
  v3[6] = CFSTR("PXAssetCollectionActionTypeDeleteMemory");
  v3[7] = CFSTR("PXAssetCollectionActionTypeTrashMomentShare");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 8);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

+ (NSArray)internalActionTypes
{
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("PXAssetCollectionActionTypeFileRadar");
  v3[1] = CFSTR("PXAssetCollectionActionTypeCopyInternalURL");
  v3[2] = CFSTR("PXAssetCollectionActionTypeDebugCuration");
  v3[3] = CFSTR("PXAssetCollectionActionTypeStoryDemo");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)contextMenuWithActionManager:(id)a3 overrideActions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void (**v10)(void *, void *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __73__PXAlbumActionMenuBuilder_contextMenuWithActionManager_overrideActions___block_invoke;
    v19 = &unk_1E5146BE8;
    v23 = a1;
    v20 = v6;
    v21 = v7;
    v9 = v8;
    v22 = v9;
    v10 = (void (**)(void *, void *))_Block_copy(&v16);
    objc_msgSend(a1, "primaryActionTypes", v16, v17, v18, v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v11);

    objc_msgSend(a1, "secondaryActionTypes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v12);

    objc_msgSend(a1, "internalActionTypes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v13);

    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)_createMenuWithActionManager:(id)a3 actionTypes:(id)a4 overrideActions:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", v16, (_QWORD)v21);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          objc_msgSend(v10, "addObject:", v17);
        }
        else
        {
          objc_msgSend(v7, "standardActionForActionType:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            objc_msgSend(v10, "addObject:", v18);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }

  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E5149688, 0, 0, 1, v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

void __73__PXAlbumActionMenuBuilder_contextMenuWithActionManager_overrideActions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 56), "_createMenuWithActionManager:actionTypes:overrideActions:", *(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
    v3 = v4;
  }

}

@end
