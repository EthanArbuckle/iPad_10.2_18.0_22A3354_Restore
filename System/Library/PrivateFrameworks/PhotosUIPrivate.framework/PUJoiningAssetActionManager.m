@implementation PUJoiningAssetActionManager

- (PUJoiningAssetActionManager)init
{
  PUJoiningAssetActionManager *v2;
  uint64_t v3;
  NSMapTable *actionManagerByClass;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUJoiningAssetActionManager;
  v2 = -[PUJoiningAssetActionManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    actionManagerByClass = v2->__actionManagerByClass;
    v2->__actionManagerByClass = (NSMapTable *)v3;

  }
  return v2;
}

- (void)registerActionManager:(id)a3 forAssetClass:(Class)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v7 = a3;
  v10 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUJoiningAssetActionManager.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionManager != nil"));

    v7 = 0;
  }
  if (a4)
  {
    -[PUJoiningAssetActionManager _actionManagerByClass](self, "_actionManagerByClass");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v10, a4);

  }
  else
  {
    -[PUJoiningAssetActionManager _setActionManagerForNoAsset:](self, "_setActionManagerForNoAsset:", v7);
  }

}

- (id)_actionManagerForAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[PUJoiningAssetActionManager _actionManagerByClass](self, "_actionManagerByClass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[PUJoiningAssetActionManager _actionManagerByClass](self, "_actionManagerByClass");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      objc_msgSend(v7, "keyEnumerator", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v16;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v16 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
            if ((objc_msgSend((id)objc_opt_class(), "isSubclassOfClass:", v13) & 1) != 0)
            {
              objc_msgSend(v7, "objectForKey:", v13);
              v6 = (void *)objc_claimAutoreleasedReturnValue();

              if (v6)
                objc_msgSend(v7, "setObject:forKey:", v6, objc_opt_class());
              goto LABEL_15;
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v10)
            continue;
          break;
        }
      }

      v6 = 0;
LABEL_15:

    }
  }
  else
  {
    -[PUJoiningAssetActionManager _actionManagerForNoAsset](self, "_actionManagerForNoAsset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)_actionManagerForAssets:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v15;
      while (2)
      {
        v10 = 0;
        v11 = v8;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v5);
          -[PUJoiningAssetActionManager _actionManagerForAsset:](self, "_actionManagerForAsset:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
          v12 = objc_claimAutoreleasedReturnValue();
          v8 = (void *)v12;
          if (v11 && v11 != (void *)v12)
          {

            goto LABEL_13;
          }

          ++v10;
          v11 = v8;
        }
        while (v7 != v10);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          continue;
        break;
      }
    }
    else
    {
LABEL_13:
      v8 = 0;
    }

  }
  else
  {
    -[PUJoiningAssetActionManager _actionManagerForNoAsset](self, "_actionManagerForNoAsset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)_actionManagerForAssetsByAssetCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__43633;
    v15 = __Block_byref_object_dispose__43634;
    v16 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __72__PUJoiningAssetActionManager__actionManagerForAssetsByAssetCollection___block_invoke;
    v10[3] = &unk_1E58A1898;
    v10[4] = self;
    v10[5] = &v11;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v10);
    v5 = (void *)v12[5];
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v5, "isEqual:", v6);

    if ((_DWORD)v5)
    {
      v7 = (void *)v12[5];
      v12[5] = 0;

    }
    v8 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    -[PUJoiningAssetActionManager _actionManagerForNoAsset](self, "_actionManagerForNoAsset");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BOOL)canPerformActionType:(unint64_t)a3 onAsset:(id)a4 inAssetCollection:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  BOOL v13;
  objc_super v15;

  v8 = a5;
  v9 = a4;
  -[PUJoiningAssetActionManager _actionManagerForAsset:](self, "_actionManagerForAsset:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = objc_msgSend(v10, "canPerformActionType:onAsset:inAssetCollection:", a3, v9, v8);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)PUJoiningAssetActionManager;
    v12 = -[PUAssetActionManager canPerformActionType:onAsset:inAssetCollection:](&v15, sel_canPerformActionType_onAsset_inAssetCollection_, a3, v9, v8);
  }
  v13 = v12;

  return v13;
}

- (BOOL)shouldEnableActionType:(unint64_t)a3 onAsset:(id)a4 inAssetCollection:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  BOOL v13;
  objc_super v15;

  v8 = a5;
  v9 = a4;
  -[PUJoiningAssetActionManager _actionManagerForAsset:](self, "_actionManagerForAsset:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = objc_msgSend(v10, "shouldEnableActionType:onAsset:inAssetCollection:", a3, v9, v8);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)PUJoiningAssetActionManager;
    v12 = -[PUAssetActionManager shouldEnableActionType:onAsset:inAssetCollection:](&v15, sel_shouldEnableActionType_onAsset_inAssetCollection_, a3, v9, v8);
  }
  v13 = v12;

  return v13;
}

- (BOOL)canPerformAction:(unint64_t)a3 onAllAssetsByAssetCollection:(id)a4
{
  id v6;
  char v7;
  void *v8;
  _QWORD v10[8];
  _QWORD v11[5];
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = __Block_byref_object_copy__43633;
    v11[4] = __Block_byref_object_dispose__43634;
    v12 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __77__PUJoiningAssetActionManager_canPerformAction_onAllAssetsByAssetCollection___block_invoke;
    v10[3] = &unk_1E58A18C0;
    v10[4] = self;
    v10[5] = &v13;
    v10[6] = v11;
    v10[7] = a3;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);
    v7 = *((_BYTE *)v14 + 24) != 0;
    _Block_object_dispose(v11, 8);

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    -[PUJoiningAssetActionManager _actionManagerForNoAsset](self, "_actionManagerForNoAsset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "canPerformActionType:onAsset:inAssetCollection:", a3, 0, 0);

  }
  return v7;
}

- (BOOL)shouldEnableActionType:(unint64_t)a3 onAllAssetsByAssetCollection:(id)a4
{
  id v6;
  char v7;
  void *v8;
  _QWORD v10[8];
  _QWORD v11[5];
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = __Block_byref_object_copy__43633;
    v11[4] = __Block_byref_object_dispose__43634;
    v12 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __83__PUJoiningAssetActionManager_shouldEnableActionType_onAllAssetsByAssetCollection___block_invoke;
    v10[3] = &unk_1E58A18C0;
    v10[4] = self;
    v10[5] = &v13;
    v10[6] = v11;
    v10[7] = a3;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);
    v7 = *((_BYTE *)v14 + 24) != 0;
    _Block_object_dispose(v11, 8);

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    -[PUJoiningAssetActionManager _actionManagerForNoAsset](self, "_actionManagerForNoAsset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "shouldEnableActionType:onAllAssetsByAssetCollection:", a3, v6);

  }
  return v7;
}

- (id)actionPerformerForSimpleActionType:(unint64_t)a3 onAssetsByAssetCollection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUJoiningAssetActionManager _actionManagerForAsset:](self, "_actionManagerForAsset:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "actionPerformerForSimpleActionType:onAssetsByAssetCollection:", a3, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)actionPerformerForSettingFavoriteTo:(BOOL)a3 onAssetsByAssetCollection:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unsigned int v23;
  id v24;
  id obj;
  objc_super v26;
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

  v4 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (!v8)
  {

LABEL_22:
    v26.receiver = self;
    v26.super_class = (Class)PUJoiningAssetActionManager;
    -[PUAssetActionManager actionPerformerForSettingFavoriteTo:onAssetsByAssetCollection:](&v26, sel_actionPerformerForSettingFavoriteTo_onAssetsByAssetCollection_, v4, v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    goto LABEL_23;
  }
  v9 = v8;
  v23 = v4;
  v24 = v6;
  obj = v7;
  v10 = 0;
  v11 = *(_QWORD *)v32;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v32 != v11)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v28;
        while (2)
        {
          v18 = 0;
          v19 = v10;
          do
          {
            if (*(_QWORD *)v28 != v17)
              objc_enumerationMutation(v14);
            -[PUJoiningAssetActionManager _actionManagerForAsset:](self, "_actionManagerForAsset:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v18));
            v20 = objc_claimAutoreleasedReturnValue();
            v10 = (void *)v20;
            if (v19 && (void *)v20 != v19)
            {

              v10 = 0;
              goto LABEL_17;
            }

            ++v18;
            v19 = v10;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (v16)
            continue;
          break;
        }
      }
LABEL_17:

    }
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  }
  while (v9);

  v6 = v24;
  v4 = v23;
  if (!v10)
    goto LABEL_22;
  objc_msgSend(v10, "actionPerformerForSettingFavoriteTo:onAssetsByAssetCollection:", v23, v24);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:

  return v21;
}

- (id)actionPerformerForDuplicatingAssetsByAssetCollection:(id)a3 withNewStillImageTime:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v23;
  id v24;
  id obj;
  objc_super v26;
  __int128 v27;
  int64_t var3;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (!v8)
  {

LABEL_22:
    v26.receiver = self;
    v26.super_class = (Class)PUJoiningAssetActionManager;
    v27 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    -[PUAssetActionManager actionPerformerForDuplicatingAssetsByAssetCollection:withNewStillImageTime:](&v26, sel_actionPerformerForDuplicatingAssetsByAssetCollection_withNewStillImageTime_, v6, &v27);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    goto LABEL_23;
  }
  v9 = v8;
  v23 = a4;
  v24 = v6;
  v10 = 0;
  v11 = *(_QWORD *)v34;
  obj = v7;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v34 != v11)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v30;
        while (2)
        {
          v18 = 0;
          v19 = v10;
          do
          {
            if (*(_QWORD *)v30 != v17)
              objc_enumerationMutation(v14);
            -[PUJoiningAssetActionManager _actionManagerForAsset:](self, "_actionManagerForAsset:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v18));
            v20 = objc_claimAutoreleasedReturnValue();
            v10 = (void *)v20;
            if (v19 && (void *)v20 != v19)
            {

              v10 = 0;
              goto LABEL_17;
            }

            ++v18;
            v19 = v10;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          if (v16)
            continue;
          break;
        }
      }
LABEL_17:

    }
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  }
  while (v9);

  a4 = v23;
  v6 = v24;
  if (!v10)
    goto LABEL_22;
  v27 = *(_OWORD *)&v23->var0;
  var3 = v23->var3;
  objc_msgSend(v10, "actionPerformerForDuplicatingAssetsByAssetCollection:withNewStillImageTime:", v24, &v27);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:

  return v21;
}

- (id)actionPerformerForEditingWithQuickCropContext:(id)a3 onAsset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[PUJoiningAssetActionManager _actionManagerForAsset:](self, "_actionManagerForAsset:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionPerformerForEditingWithQuickCropContext:onAsset:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)actionPerformerForEditingPlaybackRate:(float)a3 onAsset:(id)a4
{
  id v6;
  void *v7;
  double v8;
  void *v9;

  v6 = a4;
  -[PUJoiningAssetActionManager _actionManagerForAsset:](self, "_actionManagerForAsset:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a3;
  objc_msgSend(v7, "actionPerformerForEditingPlaybackRate:onAsset:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)actionPerformerForEditingAudioMixMode:(id)a3 onAsset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[PUJoiningAssetActionManager _actionManagerForAsset:](self, "_actionManagerForAsset:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionPerformerForEditingAudioMixMode:onAsset:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)actionPerformerForEditingWithPendingEditsRequest:(id)a3 onAsset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[PUJoiningAssetActionManager _actionManagerForAsset:](self, "_actionManagerForAsset:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionPerformerForEditingWithPendingEditsRequest:onAsset:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSMapTable)_actionManagerByClass
{
  return self->__actionManagerByClass;
}

- (PUAssetActionManager)_actionManagerForNoAsset
{
  return self->__actionManagerForNoAsset;
}

- (void)_setActionManagerForNoAsset:(id)a3
{
  objc_storeStrong((id *)&self->__actionManagerForNoAsset, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__actionManagerForNoAsset, 0);
  objc_storeStrong((id *)&self->__actionManagerByClass, 0);
}

void __83__PUJoiningAssetActionManager_shouldEnableActionType_onAllAssetsByAssetCollection___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  char v18;
  id v19;
  BOOL v20;
  uint64_t v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = a3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v11)
        objc_enumerationMutation(v8);
      v13 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v12);
      objc_msgSend(*(id *)(a1 + 32), "_actionManagerForAsset:", v13, (_QWORD)v24);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (!v14)
        v15 = *(void **)(a1 + 32);
      v16 = v15;

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v16, "shouldEnableActionType:onAsset:inAssetCollection:", *(_QWORD *)(a1 + 56), v13, v7);
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v18 = *(_BYTE *)(v17 + 24);
      if (v18)
      {
        v19 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        if (v19)
          v20 = v19 == v16;
        else
          v20 = 1;
        v18 = v20;
      }
      *(_BYTE *)(v17 + 24) = v18;
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v22 = *(void **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = v16;
      v23 = v16;

      LODWORD(v22) = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      if (!(_DWORD)v22)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^ 1;
}

void __77__PUJoiningAssetActionManager_canPerformAction_onAllAssetsByAssetCollection___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  char v18;
  id v19;
  BOOL v20;
  uint64_t v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = a3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v11)
        objc_enumerationMutation(v8);
      v13 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v12);
      objc_msgSend(*(id *)(a1 + 32), "_actionManagerForAsset:", v13, (_QWORD)v24);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (!v14)
        v15 = *(void **)(a1 + 32);
      v16 = v15;

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v16, "canPerformActionType:onAsset:inAssetCollection:", *(_QWORD *)(a1 + 56), v13, v7);
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v18 = *(_BYTE *)(v17 + 24);
      if (v18)
      {
        v19 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        if (v19)
          v20 = v19 == v16;
        else
          v20 = 1;
        v18 = v20;
      }
      *(_BYTE *)(v17 + 24) = v18;
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v22 = *(void **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = v16;
      v23 = v16;

      LODWORD(v22) = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      if (!(_DWORD)v22)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^ 1;
}

void __72__PUJoiningAssetActionManager__actionManagerForAssetsByAssetCollection___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  id *v8;
  void *v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "_actionManagerForAssets:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v7 + 40);
  v8 = (id *)(v7 + 40);
  v9 = v10;
  if (v10)
    v11 = v9 == v6;
  else
    v11 = 1;
  v15 = v6;
  if (v11)
  {
    objc_storeStrong(v8, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    *a4 = 1;
  }

}

@end
