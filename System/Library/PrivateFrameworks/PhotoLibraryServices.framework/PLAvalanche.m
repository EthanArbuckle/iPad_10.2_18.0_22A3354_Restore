@implementation PLAvalanche

- (PLAvalanche)initWithUUID:(id)a3 photoLibrary:(id)a4
{
  id v7;
  id v8;
  PLAvalanche *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSOrderedSet *assets;
  uint64_t v14;
  NSMutableIndexSet *autoPickIndexes;
  uint64_t v16;
  NSMutableIndexSet *userFavoriteIndexes;
  NSOrderedSet *v18;
  PLAvalanche *v19;
  uint64_t v20;
  NSIndexSet *originalAutoPickIndexes;
  uint64_t v22;
  NSIndexSet *originalUserFavoriteIndexes;
  unint64_t stackIndex;
  void *v25;
  _QWORD v27[4];
  PLAvalanche *v28;
  objc_super v29;

  v7 = a3;
  v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)PLAvalanche;
  v9 = -[PLAvalanche init](&v29, sel_init);
  if (v9)
  {
    if (!v7)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("tried to create with nil uuid"));
    objc_storeStrong((id *)&v9->_uuid, a3);
    objc_storeStrong((id *)&v9->_photoLibrary, a4);
    objc_msgSend(v8, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLAvalanche assetsWithAvalancheUUID:inManagedObjectContext:](PLAvalanche, "assetsWithAvalancheUUID:inManagedObjectContext:", v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v11);
    assets = v9->_assets;
    v9->_assets = (NSOrderedSet *)v12;

    v14 = objc_opt_new();
    autoPickIndexes = v9->__autoPickIndexes;
    v9->__autoPickIndexes = (NSMutableIndexSet *)v14;

    v16 = objc_opt_new();
    userFavoriteIndexes = v9->__userFavoriteIndexes;
    v9->__userFavoriteIndexes = (NSMutableIndexSet *)v16;

    v9->__stackIndex = 0x7FFFFFFFFFFFFFFFLL;
    v18 = v9->_assets;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __41__PLAvalanche_initWithUUID_photoLibrary___block_invoke;
    v27[3] = &unk_1E36775E8;
    v19 = v9;
    v28 = v19;
    -[NSOrderedSet enumerateObjectsUsingBlock:](v18, "enumerateObjectsUsingBlock:", v27);
    v20 = -[NSMutableIndexSet copy](v9->__autoPickIndexes, "copy");
    originalAutoPickIndexes = v19->__originalAutoPickIndexes;
    v19->__originalAutoPickIndexes = (NSIndexSet *)v20;

    v22 = -[NSMutableIndexSet copy](v9->__userFavoriteIndexes, "copy");
    originalUserFavoriteIndexes = v19->__originalUserFavoriteIndexes;
    v19->__originalUserFavoriteIndexes = (NSIndexSet *)v22;

    stackIndex = v9->__stackIndex;
    v19->__originalStackIndex = stackIndex;
    if (stackIndex == 0x7FFFFFFFFFFFFFFFLL)
      -[PLAvalanche _recalculateStackAsset](v19, "_recalculateStackAsset");
    if ((PLIsAssetsd() & 1) == 0)
    {
      +[PLChangeNotificationCenter defaultCenter](PLChangeNotificationCenter, "defaultCenter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addAssetChangeObserver:", v19);

    }
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if ((PLIsAssetsd() & 1) == 0)
  {
    +[PLChangeNotificationCenter defaultCenter](PLChangeNotificationCenter, "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeAssetChangeObserver:", self);

  }
  v4.receiver = self;
  v4.super_class = (Class)PLAvalanche;
  -[PLAvalanche dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  NSString *uuid;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)PLAvalanche;
  -[PLAvalanche description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  uuid = self->_uuid;
  -[NSOrderedSet valueForKey:](self->_assets, "valueForKey:", CFSTR("shortObjectIDURI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAvalanche _autoPickIndexes](self, "_autoPickIndexes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PLAvalanche _stackIndex](self, "_stackIndex");
  -[PLAvalanche _userFavoriteIndexes](self, "_userFavoriteIndexes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ uuid %@, assets %@, autoPicks %@ stackAsset %lu userFavorites %@ "), v4, uuid, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (void)applyChangesAndDeleteNonPicks:(BOOL)a3 currentContainer:(id)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v6 = a3;
  v41 = *MEMORY[0x1E0C80C00];
  v34 = a4;
  v8 = a5;
  -[PLAvalanche assets](self, "assets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") == 1)
  {
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAvalanche addUserFavorite:](self, "addUserFavorite:", v10);

  }
  v33 = v8;
  -[PLAvalanche autoPicks](self, "autoPicks");
  v11 = objc_claimAutoreleasedReturnValue();
  -[PLAvalanche userFavorites](self, "userFavorites");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAvalanche stackAsset](self, "stackAsset");
  v13 = objc_claimAutoreleasedReturnValue();
  -[PLAvalanche _originalStackIndex](self, "_originalStackIndex");
  -[PLAvalanche _originalUserFavoriteIndexes](self, "_originalUserFavoriteIndexes");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLAvalanche _visibleIndexesAmongAssets:fromUserFavoriteIndexes:stackIndex:](PLAvalanche, "_visibleIndexesAmongAssets:fromUserFavoriteIndexes:stackIndex:", v9);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v29) = 1;
  v31 = (void *)v13;
  v32 = (void *)v11;
  v14 = +[PLAvalanche updatePropertiesForAssets:autoPicks:stackAsset:userFavorites:deleteNonPicks:setFirstPick:allowDissolve:](PLAvalanche, "updatePropertiesForAssets:autoPicks:stackAsset:userFavorites:deleteNonPicks:setFirstPick:allowDissolve:", v9, v11, v13, v12, v6, 0, v29);
  if ((objc_msgSend(v9, "isSubsetOfOrderedSet:", v12) & 1) == 0)
  {
    objc_msgSend(v9, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "photoLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = +[PLAvalanche revalidateAvalancheAssets:inLibrary:deleteNonPicks:allowDissolve:](PLAvalanche, "revalidateAvalancheAssets:inLibrary:deleteNonPicks:allowDissolve:", v17, v16, v6, 1);

  }
  v19 = -[PLAvalanche _stackIndex](self, "_stackIndex");
  -[PLAvalanche _userFavoriteIndexes](self, "_userFavoriteIndexes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLAvalanche _visibleIndexesAmongAssets:fromUserFavoriteIndexes:stackIndex:](PLAvalanche, "_visibleIndexesAmongAssets:fromUserFavoriteIndexes:stackIndex:", v9, v20, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v9, "objectsAtIndexes:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v37 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "generateLargeThumbnailFileIfNecessary");
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v24);
  }

  if (v33)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[PLAvalanche _assetAmongAssets:fromIndexes:excludingIndexes:](PLAvalanche, "_assetAmongAssets:fromIndexes:excludingIndexes:", v9, v35, v21);
      v27 = objc_claimAutoreleasedReturnValue();
      +[PLAvalanche _assetAmongAssets:fromIndexes:excludingIndexes:](PLAvalanche, "_assetAmongAssets:fromIndexes:excludingIndexes:", v9, v21, v35);
      v28 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = 0;
      v28 = 0;
    }
    if (v27 | v28)
    {
      -[PLAvalanche _setAnOldPick:](self, "_setAnOldPick:", v27);
      -[PLAvalanche _setANewPick:](self, "_setANewPick:", v28);
      -[PLAvalanche _setCompletionHandler:](self, "_setCompletionHandler:", v33);
    }
    else
    {
      pl_dispatch_async();
    }

  }
}

- (void)assetsDidChange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(a3, "updatedAssets");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    -[PLAvalanche _anOldPick](self, "_anOldPick");
    v4 = objc_claimAutoreleasedReturnValue();
    -[PLAvalanche _aNewPick](self, "_aNewPick");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (!(v5 | v4))
      goto LABEL_14;
    if (v5)
    {
      if (objc_msgSend(v12, "containsObject:", v5))
      {
        objc_msgSend(v6, "moment");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7 == 0;

        if (!v4)
          goto LABEL_8;
        goto LABEL_10;
      }
      v8 = 1;
      if (v4)
      {
LABEL_10:
        if (objc_msgSend(v12, "containsObject:", v4))
        {
          objc_msgSend((id)v4, "moment");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v10 != 0;

LABEL_12:
          if (!v8 && !v9)
          {
            -[PLAvalanche _completionHandler](self, "_completionHandler");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            pl_dispatch_async();

            -[PLAvalanche _setAnOldPick:](self, "_setAnOldPick:", 0);
            -[PLAvalanche _setANewPick:](self, "_setANewPick:", 0);
            -[PLAvalanche _setCompletionHandler:](self, "_setCompletionHandler:", 0);
          }
        }
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      v8 = 0;
      if (v4)
        goto LABEL_10;
    }
LABEL_8:
    v9 = 0;
    goto LABEL_12;
  }
LABEL_15:

}

- (void)applyTrashedState:(signed __int16)a3 withTrashedReason:(unsigned __int16)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v4 = a4;
  v5 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  -[PLAvalanche assets](self, "assets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  -[PLAvalanche userFavorites](self, "userFavorites");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minusOrderedSet:", v9);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14++), "applyTrashedState:withTrashedReason:expungeReasonFromClient:", v5, v4, 0, (_QWORD)v16);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

  if ((_DWORD)v5 == 2)
  {
    objc_msgSend(v9, "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLAvalanche disolveBurstForAssets:permanently:](PLAvalanche, "disolveBurstForAssets:permanently:", v15, 1);

  }
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  -[PLAvalanche assets](self, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[PLAvalanche userFavorites](self, "userFavorites");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minusOrderedSet:", v7);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "setHidden:", v3, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (id)autoPicks
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99E40];
  -[PLAvalanche assets](self, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAvalanche _autoPickIndexes](self, "_autoPickIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectsAtIndexes:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orderedSetWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)userFavorites
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99E40];
  -[PLAvalanche assets](self, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAvalanche _userFavoriteIndexes](self, "_userFavoriteIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectsAtIndexes:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orderedSetWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)stackAsset
{
  void *v3;
  void *v4;

  if (-[PLAvalanche _stackIndex](self, "_stackIndex") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    -[PLAvalanche assets](self, "assets");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", -[PLAvalanche _stackIndex](self, "_stackIndex"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)_recalculateStackAsset
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  -[PLAvalanche assets](self, "assets");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "count");
  -[PLAvalanche _originalAutoPickIndexes](self, "_originalAutoPickIndexes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAvalanche _userFavoriteIndexes](self, "_userFavoriteIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->__stackIndex = +[PLAvalanche _calculateStackAssetForAssetCount:autoPicks:userFavorites:](PLAvalanche, "_calculateStackAssetForAssetCount:autoPicks:userFavorites:", v3, v4, v5);

}

- (void)addUserFavorite:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[PLAvalanche assets](self, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PLAvalanche _userFavoriteIndexes](self, "_userFavoriteIndexes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addIndex:", v6);

    -[PLAvalanche _recalculateStackAsset](self, "_recalculateStackAsset");
  }
}

- (void)removeUserFavorite:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[PLAvalanche assets](self, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PLAvalanche _userFavoriteIndexes](self, "_userFavoriteIndexes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeIndex:", v6);

    -[PLAvalanche _recalculateStackAsset](self, "_recalculateStackAsset");
  }
}

- (BOOL)isUserFavorite:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v8;
  char v9;

  v4 = a3;
  -[PLAvalanche assets](self, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  -[PLAvalanche _userFavoriteIndexes](self, "_userFavoriteIndexes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsIndex:", v6);

  return v9;
}

- (BOOL)isAutoPick:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v8;
  char v9;

  v4 = a3;
  -[PLAvalanche assets](self, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  -[PLAvalanche _autoPickIndexes](self, "_autoPickIndexes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsIndex:", v6);

  return v9;
}

- (id)proposedStackAssetAfterRemovingFavorite:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;

  v4 = a3;
  -[PLAvalanche stackAsset](self, "stackAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAvalanche assets](self, "assets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v4);

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PLAvalanche _userFavoriteIndexes](self, "_userFavoriteIndexes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v9, "removeIndex:", v7);
    -[PLAvalanche assets](self, "assets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    -[PLAvalanche _originalAutoPickIndexes](self, "_originalAutoPickIndexes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = +[PLAvalanche _calculateStackAssetForAssetCount:autoPicks:userFavorites:](PLAvalanche, "_calculateStackAssetForAssetCount:autoPicks:userFavorites:", v11, v12, v9);

    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[PLAvalanche assets](self, "assets");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndex:", v13);
      v15 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v15;
    }

  }
  return v5;
}

- (NSString)title
{
  return 0;
}

- (NSString)localizedTitle
{
  return 0;
}

- (unint64_t)approximateCount
{
  void *v2;
  unint64_t v3;

  -[PLAvalanche assets](self, "assets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)assetsCount
{
  void *v2;
  unint64_t v3;

  -[PLAvalanche assets](self, "assets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)photosCount
{
  void *v2;
  unint64_t v3;

  -[PLAvalanche assets](self, "assets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)videosCount
{
  return 0;
}

- (BOOL)isEmpty
{
  void *v2;
  BOOL v3;

  -[PLAvalanche assets](self, "assets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (BOOL)canPerformEditOperation:(unint64_t)a3
{
  return a3 < 2;
}

- (BOOL)canShowComments
{
  return 0;
}

- (BOOL)canShowAvalancheStacks
{
  return 0;
}

- (NSArray)localizedLocationNames
{
  return 0;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (PLPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (NSOrderedSet)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
  objc_storeStrong((id *)&self->_assets, a3);
}

- (NSIndexSet)_originalAutoPickIndexes
{
  return self->__originalAutoPickIndexes;
}

- (void)set_originalAutoPickIndexes:(id)a3
{
  objc_storeStrong((id *)&self->__originalAutoPickIndexes, a3);
}

- (NSMutableIndexSet)_autoPickIndexes
{
  return self->__autoPickIndexes;
}

- (void)set_autoPickIndexes:(id)a3
{
  objc_storeStrong((id *)&self->__autoPickIndexes, a3);
}

- (NSIndexSet)_originalUserFavoriteIndexes
{
  return self->__originalUserFavoriteIndexes;
}

- (void)set_originalUserFavoriteIndexes:(id)a3
{
  objc_storeStrong((id *)&self->__originalUserFavoriteIndexes, a3);
}

- (NSMutableIndexSet)_userFavoriteIndexes
{
  return self->__userFavoriteIndexes;
}

- (void)set_userFavoriteIndexes:(id)a3
{
  objc_storeStrong((id *)&self->__userFavoriteIndexes, a3);
}

- (unint64_t)_originalStackIndex
{
  return self->__originalStackIndex;
}

- (void)set_originalStackIndex:(unint64_t)a3
{
  self->__originalStackIndex = a3;
}

- (unint64_t)_stackIndex
{
  return self->__stackIndex;
}

- (void)set_stackIndex:(unint64_t)a3
{
  self->__stackIndex = a3;
}

- (PLManagedAsset)_aNewPick
{
  return self->__aNewPick;
}

- (void)_setANewPick:(id)a3
{
  objc_storeStrong((id *)&self->__aNewPick, a3);
}

- (PLManagedAsset)_anOldPick
{
  return self->__anOldPick;
}

- (void)_setAnOldPick:(id)a3
{
  objc_storeStrong((id *)&self->__anOldPick, a3);
}

- (id)_completionHandler
{
  return self->__completionHandler;
}

- (void)_setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__completionHandler, 0);
  objc_storeStrong((id *)&self->__anOldPick, 0);
  objc_storeStrong((id *)&self->__aNewPick, 0);
  objc_storeStrong((id *)&self->__userFavoriteIndexes, 0);
  objc_storeStrong((id *)&self->__originalUserFavoriteIndexes, 0);
  objc_storeStrong((id *)&self->__autoPickIndexes, 0);
  objc_storeStrong((id *)&self->__originalAutoPickIndexes, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

uint64_t __41__PLAvalanche_initWithUUID_photoLibrary___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  char v6;

  result = objc_msgSend(a2, "avalanchePickType");
  v6 = result;
  if ((result & 4) != 0)
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addIndex:", a3);
    if ((v6 & 0x10) == 0)
    {
LABEL_3:
      if ((v6 & 8) == 0)
        return result;
      return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "addIndex:", a3);
    }
  }
  else if ((result & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = a3;
  if ((v6 & 8) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "addIndex:", a3);
  return result;
}

+ (id)assetsWithAvalancheUUID:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  _QWORD v22[2];
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_fetchRequestForAssetsWithAvalancheUUID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = CFSTR("additionalAttributes");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRelationshipKeyPathsForPrefetching:", v9);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v10;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("additionalAttributes.originalFilename"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSortDescriptors:", v12);

  v17 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v8, &v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v17;
  if (!v13)
  {
    PLBackendGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v6;
      v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Error fetching assets with avalancheUUID %@: %@", buf, 0x16u);
    }

  }
  return v13;
}

+ (unint64_t)countForAssetsWithAvalancheUUID:(id)a3 inLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  id v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_fetchRequestForAssetsWithAvalancheUUID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  v10 = objc_msgSend(v9, "countForFetchRequest:error:", v8, &v14);
  v11 = v14;

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLBackendGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v6;
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Error counting assets with avalancheUUID %@: %@", buf, 0x16u);
    }

  }
  return v10;
}

+ (id)_fetchRequestForAssetsWithAvalancheUUID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C97B48];
  v4 = a3;
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestWithEntityName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("avalancheUUID"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("avalancheKind"), 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForAvalancheSupportedAssets"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setPredicate:", v12);
  return v6;
}

+ (BOOL)isValidBurstWithAssets:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  BOOL v11;
  void *v12;
  void *v13;
  _BYTE *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {
    if (*MEMORY[0x1E0D115D0])
      goto LABEL_35;
    __CPLAssetsdOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "avalancheUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v13;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Invalid burst %{public}@, has only 1 asset", buf, 0xCu);

    }
LABEL_34:

    goto LABEL_35;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = v3;
  v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v26;
LABEL_4:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v8)
        objc_enumerationMutation(v4);
      v10 = objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v9), "avalanchePickType", (_QWORD)v25);
      if ((v10 & 0x10) != 0)
      {
        if ((v7 & 1) != 0)
        {
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              -[NSObject firstObject](v4, "firstObject");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "avalancheUUID");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v30 = v23;
              _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEFAULT, "Invalid burst %{public}@, has more than 1 stack pick", buf, 0xCu);

            }
          }
          goto LABEL_34;
        }
        v7 = 1;
      }
      else if (!v10)
      {
        v14 = (_BYTE *)MEMORY[0x1E0D115D0];
        if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            -[NSObject firstObject](v4, "firstObject");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "avalancheUUID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v30 = v17;
            _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "Invalid burst %{public}@, burst marked as not in burst", buf, 0xCu);

          }
        }

        if (v7 & 1 | (*v14 != 0))
          goto LABEL_35;
        goto LABEL_27;
      }
      if (v6 == ++v9)
      {
        v6 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
        if (v6)
          goto LABEL_4;

        if ((v7 & 1) != 0)
        {
          v11 = 1;
          goto LABEL_36;
        }
        goto LABEL_20;
      }
    }
  }

LABEL_20:
  if (!*MEMORY[0x1E0D115D0])
  {
LABEL_27:
    __CPLAssetsdOSLogDomain();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      -[NSObject firstObject](v4, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "avalancheUUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v20;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "Invalid burst %{public}@, can't find a stack pick", buf, 0xCu);

    }
    v4 = v18;
    goto LABEL_34;
  }
LABEL_35:
  v11 = 0;
LABEL_36:

  return v11;
}

+ (void)disolveBurstForAssets:(id)a3 permanently:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        if (v4)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "setAvalancheUUID:", 0);
          objc_msgSend(v10, "setAvalancheKind:", 0);
        }
        objc_msgSend(v10, "setAvalanchePickType:", 0);
        objc_msgSend(v10, "additionalAttributes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setCloudAvalanchePickType:", 0);

        objc_msgSend(v10, "setVisibilityState:", 0);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

+ (id)revalidateAvalancheAssets:(id)a3 inLibrary:(id)a4 deleteNonPicks:(BOOL)a5 allowDissolve:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  _BYTE *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  PLAvalanche *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v49;
  id v50;
  id v51;
  void *v52;
  _BOOL4 v53;
  _BOOL4 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  id v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v6 = a6;
  v7 = a5;
  v71 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (objc_msgSend(v9, "count") == 1)
  {
    +[PLAvalanche disolveBurstForAssets:permanently:](PLAvalanche, "disolveBurstForAssets:permanently:", v9, 0);
LABEL_41:
    v19 = 0;
    goto LABEL_51;
  }
  if (!objc_msgSend(v9, "count"))
    goto LABEL_41;
  v53 = v7;
  v54 = v6;
  v50 = v10;
  objc_msgSend(v9, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "avalancheUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)objc_msgSend(v12, "copy");

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v51 = v9;
  v16 = v9;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v60 != v20)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        if ((objc_msgSend(v22, "avalanchePickType") & 4) != 0)
          objc_msgSend(v13, "addObject:", v22);
        if ((objc_msgSend(v22, "avalanchePickType") & 0x20) != 0 && (objc_msgSend(v22, "avalanchePickType") & 8) == 0)
        {
          if (v19)
            objc_msgSend(v14, "addObject:", v19);
          v23 = v22;

          v19 = v23;
        }
        if ((objc_msgSend(v22, "avalanchePickType") & 8) == 0)
        {
          if (v19)
          {
            if ((objc_msgSend(v19, "avalanchePickType") & 4) == 0 && (objc_msgSend(v22, "avalanchePickType") & 4) != 0)
            {
              v24 = v22;

              v19 = v24;
            }
          }
          else
          {
            v19 = v22;
          }
        }
        if ((objc_msgSend(v22, "avalanchePickType") & 0x10) != 0)
          objc_msgSend(v14, "addObject:", v22);
        if ((objc_msgSend(v22, "avalanchePickType") & 8) != 0)
          objc_msgSend(v15, "addObject:", v22);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
    }
    while (v18);

    if (v19)
    {
      if ((unint64_t)objc_msgSend(v14, "count") > 1
        || (objc_msgSend(v14, "firstObject"),
            v25 = (id)objc_claimAutoreleasedReturnValue(),
            v25,
            v25 != v19))
      {
        objc_msgSend(v14, "removeObject:", v19);
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v26 = v14;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v56;
          do
          {
            for (j = 0; j != v28; ++j)
            {
              if (*(_QWORD *)v56 != v29)
                objc_enumerationMutation(v26);
              v31 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
              objc_msgSend(v31, "setAvalanchePickType:", objc_msgSend(v31, "avalanchePickType") & 0xFFFFFFEFLL);
              if ((objc_msgSend(v31, "avalanchePickType") & 4) == 0)
                objc_msgSend(v31, "setAvalanchePickType:", objc_msgSend(v31, "avalanchePickType") | 2);
              objc_msgSend(v31, "setVisibilityState:", 2);
            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
          }
          while (v28);
        }

        objc_msgSend(v19, "setVisibilityState:", 0);
        objc_msgSend(v19, "setAvalanchePickType:", objc_msgSend(v19, "avalanchePickType") & 0xFFFFFFED | 0x10);
      }
    }
  }
  else
  {

    v19 = 0;
  }
  v32 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v19, "avalancheUUID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "uuid");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v64 = v34;
      v65 = 2112;
      v66 = v35;
      _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_DEFAULT, "Updating burst %@, stack will be set to %@", buf, 0x16u);

    }
    if (!*v32)
    {
      __CPLAssetsdOSLogDomain();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v64 = v13;
        v65 = 2112;
        v66 = v15;
        v67 = 2112;
        v68 = v16;
        _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_DEBUG, "autoPicks are %@, favorites are %@, the rest of burst are %@", buf, 0x20u);
      }

    }
  }
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v16);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v13);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v15);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v49) = v54;
  v40 = +[PLAvalanche updatePropertiesForAssets:autoPicks:stackAsset:userFavorites:deleteNonPicks:setFirstPick:allowDissolve:](PLAvalanche, "updatePropertiesForAssets:autoPicks:stackAsset:userFavorites:deleteNonPicks:setFirstPick:allowDissolve:", v37, v38, v19, v39, v53, 0, v49);

  v41 = -[PLAvalanche initWithUUID:photoLibrary:]([PLAvalanche alloc], "initWithUUID:photoLibrary:", v52, v50);
  -[PLAvalanche stackAsset](v41, "stackAsset");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "generateLargeThumbnailFileIfNecessary");

  -[PLAvalanche assets](v41, "assets");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAvalanche autoPicks](v41, "autoPicks");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAvalanche stackAsset](v41, "stackAsset");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAvalanche userFavorites](v41, "userFavorites");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLAvalanche updateMembershipForAssets:autoPicks:stackAsset:userFavorites:deleteNonPicks:allowDissolve:inLibrary:](PLAvalanche, "updateMembershipForAssets:autoPicks:stackAsset:userFavorites:deleteNonPicks:allowDissolve:inLibrary:", v43, v44, v45, v46, v53, v54, v50);

  v10 = v50;
  v9 = v51;
LABEL_51:
  objc_msgSend(v19, "uuid");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  return v47;
}

+ (void)handleUpdatesForContextWillSave:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *context;
  id v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v18 = v3;
    context = (void *)MEMORY[0x19AEC1554]();
    objc_msgSend(v4, "getAndClearRecordedAvalancheUUIDsForUpdate");
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v26 != v7)
            objc_enumerationMutation(obj);
          objc_msgSend(a1, "assetsWithAvalancheUUID:inManagedObjectContext:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i), v4);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v10 = v9;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v11)
          {
            v12 = v11;
            v13 = 0;
            v14 = *(_QWORD *)v22;
            do
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v22 != v14)
                  objc_enumerationMutation(v10);
                v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
                if ((objc_msgSend(v16, "isDeleted") & 1) == 0)
                {
                  if ((objc_msgSend(v16, "isAvalancheStackPhoto") & 1) != 0)
                    goto LABEL_26;
                  if (!v13)
                  {
                    if ((objc_msgSend(v16, "avalanchePickTypeIsVisible") & 1) != 0)
                      v13 = 0;
                    else
                      v13 = v16;
                  }
                }
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            }
            while (v12);

            if (v13)
            {
              objc_msgSend(v13, "setAvalanchePickType:", objc_msgSend(v13, "avalanchePickType") & 0x24 | 0x10);
              if (+[PLAvalanche shouldOnlyShowAvalanchePicks](PLAvalanche, "shouldOnlyShowAvalanchePicks"))
              {
                if (objc_msgSend(v13, "visibilityState"))
                  objc_msgSend(v13, "setVisibilityState:", 0);
                objc_msgSend(v13, "setNeedsMomentUpdate:", 1);
              }
            }
          }
          else
          {
            v13 = 0;
LABEL_26:

          }
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v6);
    }

    objc_autoreleasePoolPop(context);
    v3 = v18;
  }

}

+ (id)updatePropertiesForAssets:(id)a3 autoPicks:(id)a4 stackAsset:(id)a5 userFavorites:(id)a6 deleteNonPicks:(BOOL)a7 setFirstPick:(BOOL)a8 allowDissolve:(BOOL)a9
{
  int v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  id v21;
  int v22;
  int v23;
  int v24;
  unsigned int v25;
  int v26;
  unsigned int v27;
  uint64_t v28;
  void *v29;
  int v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  int v38;
  id v41;
  id v42;
  id obj;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v13 = a9;
  v54 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v41 = a4;
  v15 = a5;
  v16 = a6;
  if (a9)
    v13 = objc_msgSend(v14, "isSubsetOfOrderedSet:", v16);
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v14;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  v42 = v16;
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v49 != v19)
          objc_enumerationMutation(obj);
        v21 = *(id *)(*((_QWORD *)&v48 + 1) + 8 * i);
        if ((objc_msgSend(v21, "isDeleted") & 1) == 0)
        {
          v22 = objc_msgSend(v21, "avalanchePickType");
          v23 = objc_msgSend(v21, "visibilityState");
          if (objc_msgSend(v16, "containsObject:", v21))
          {
            if (v13)
              v24 = 0;
            else
              v24 = v22 & 0x24 | 8;
            if (objc_msgSend(v21, "isInTrash"))
            {
              objc_msgSend(v21, "setTrashedState:", 0);
              objc_msgSend(v21, "setTrashedDate:", 0);
            }
            v25 = 0;
          }
          else
          {
            if (objc_msgSend(v41, "containsObject:", v21))
            {
              if (!v15)
              {
                v15 = v21;
                a8 = 0;
              }
              v24 = v22 & 0x20 | 4;
            }
            else
            {
              v24 = v22 & 0x20 | 2;
            }
            v25 = 2;
          }
          if (a8)
            v26 = 48;
          else
            v26 = 16;
          if (v15 == v21)
            v27 = v24 & 0xFFFFFFFD | v26;
          else
            v27 = v24;
          if (v15 == v21)
            v28 = 0;
          else
            v28 = v25;
          if (v22 != v27)
            objc_msgSend(v21, "setAvalanchePickType:");
          if (+[PLAvalanche shouldOnlyShowAvalanchePicks](PLAvalanche, "shouldOnlyShowAvalanchePicks"))
          {
            if (v23 != (_DWORD)v28)
              objc_msgSend(v21, "setVisibilityState:", v28);
            objc_msgSend(v21, "setNeedsMomentUpdate:", 1);
          }
          if (v13)
          {
            objc_msgSend(v21, "setAvalancheUUID:", 0);
            objc_msgSend(v21, "additionalAttributes");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setCloudAvalanchePickType:", 0);

          }
          v16 = v42;
        }
      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v18);
  }

  if (v15)
    v30 = 1;
  else
    v30 = v13;
  if (v30)
    v31 = v15;
  else
    v31 = 0;
  if ((v30 & 1) == 0 && !a7)
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v32 = obj;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v45;
      while (2)
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v45 != v35)
            objc_enumerationMutation(v32);
          v37 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
          if ((objc_msgSend(v37, "isDeleted") & 1) == 0)
          {
            v38 = objc_msgSend(v37, "avalanchePickType");
            if ((v38 & 8) == 0)
            {
              if (v38 != (v38 & 0x24 | 0x10))
                objc_msgSend(v37, "setAvalanchePickType:");
              v16 = v42;
              if (+[PLAvalanche shouldOnlyShowAvalanchePicks](PLAvalanche, "shouldOnlyShowAvalanchePicks")&& objc_msgSend(v37, "visibilityState"))
              {
                objc_msgSend(v37, "setVisibilityState:", 0);
              }
              v31 = v37;
              goto LABEL_67;
            }
          }
        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        if (v34)
          continue;
        break;
      }
      v31 = 0;
      v16 = v42;
    }
    else
    {
      v31 = 0;
    }
LABEL_67:

  }
  return v31;
}

+ (void)updateMembershipForAssets:(id)a3 autoPicks:(id)a4 stackAsset:(id)a5 userFavorites:(id)a6 deleteNonPicks:(BOOL)a7 allowDissolve:(BOOL)a8 inLibrary:(id)a9
{
  int v9;
  _BOOL4 v10;
  id v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  char v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v9 = a8;
  v10 = a7;
  v31 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v15 = a6;
  if (+[PLAvalanche shouldOnlyShowAvalanchePicks](PLAvalanche, "shouldOnlyShowAvalanchePicks"))
  {
    if (v9)
      LOBYTE(v9) = objc_msgSend(v13, "isSubsetOfOrderedSet:", v15);
    v16 = (void *)objc_msgSend(v13, "mutableCopy");
    objc_msgSend(v16, "minusOrderedSet:", v15);
    if (v14)
      v17 = v9;
    else
      v17 = 1;
    v18 = v17 | v10;
    if (((v17 | v10) & 1) == 0 && (objc_msgSend(v14, "isDeleted") & 1) == 0)
      objc_msgSend(v16, "removeObject:", v14);
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithOrderedSet:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v18 & 1) == 0 && (objc_msgSend(v14, "isDeleted") & 1) == 0)
      objc_msgSend(v19, "insertObject:atIndex:", v14, 0);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v20 = v16;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v27 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (v10)
            objc_msgSend(v25, "trashWithReason:", 5);
          else
            objc_msgSend(v25, "setAlbums:", 0, (_QWORD)v26);
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v22);
    }

  }
}

+ (id)_visibleIndexesAmongAssets:(id)a3 fromUserFavoriteIndexes:(id)a4 stackIndex:(unint64_t)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v7 = a3;
  v8 = (void *)MEMORY[0x1E0CB3788];
  v9 = a4;
  objc_msgSend(v8, "indexSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __77__PLAvalanche__visibleIndexesAmongAssets_fromUserFavoriteIndexes_stackIndex___block_invoke;
  v21[3] = &unk_1E3671018;
  v22 = v7;
  v12 = v7;
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __77__PLAvalanche__visibleIndexesAmongAssets_fromUserFavoriteIndexes_stackIndex___block_invoke_2;
  v18[3] = &unk_1E3671040;
  v13 = (id)MEMORY[0x19AEC174C](v21);
  v20 = v13;
  v14 = v10;
  v19 = v14;
  objc_msgSend(v9, "enumerateIndexesUsingBlock:", v18);

  if (a5 != 0x7FFFFFFFFFFFFFFFLL && (*((unsigned int (**)(id, unint64_t))v13 + 2))(v13, a5))
    objc_msgSend(v14, "addIndex:", a5);
  v15 = v19;
  v16 = v14;

  return v16;
}

+ (id)_assetAmongAssets:(id)a3 fromIndexes:(id)a4 excludingIndexes:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v7 = a3;
  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__PLAvalanche__assetAmongAssets_fromIndexes_excludingIndexes___block_invoke;
  v13[3] = &unk_1E3671068;
  v14 = v8;
  v9 = v8;
  v10 = objc_msgSend(a4, "indexPassingTest:", v13);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndex:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

+ (unint64_t)_calculateStackAssetForAssetCount:(unint64_t)a3 autoPicks:(id)a4 userFavorites:(id)a5
{
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t, _BYTE *);
  void *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v7 = a4;
  v8 = a5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0x7FFFFFFFFFFFFFFFLL;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __73__PLAvalanche__calculateStackAssetForAssetCount_autoPicks_userFavorites___block_invoke;
  v16 = &unk_1E3675100;
  v9 = v8;
  v17 = v9;
  v18 = &v19;
  objc_msgSend(v7, "enumerateIndexesUsingBlock:", &v13);
  v10 = v20[3];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL && a3 != 0)
  {
    v10 = 0;
    while ((objc_msgSend(v9, "containsIndex:", v10, v13, v14, v15, v16) & 1) != 0)
    {
      if (a3 == ++v10)
      {
        v10 = v20[3];
        goto LABEL_10;
      }
    }
    v20[3] = v10;
  }
LABEL_10:

  _Block_object_dispose(&v19, 8);
  return v10;
}

+ (void)removeFavoriteStatus:(id)a3
{
  int v3;
  void *v4;
  int v5;
  int v6;
  int v7;
  _BOOL4 v8;
  void *v9;
  id v10;

  v10 = a3;
  v3 = objc_msgSend(v10, "isAvalanchePhoto");
  v4 = v10;
  if (v3)
  {
    v5 = objc_msgSend(v10, "avalanchePickType");
    v6 = objc_msgSend(v10, "visibilityState");
    if ((v5 & 4) != 0)
      v7 = 36;
    else
      v7 = 34;
    if (v5 != (v7 & v5))
      objc_msgSend(v10, "setAvalanchePickType:");
    v8 = +[PLAvalanche shouldOnlyShowAvalanchePicks](PLAvalanche, "shouldOnlyShowAvalanchePicks");
    v4 = v10;
    if (v8)
    {
      v9 = v10;
      if (v6 != 2)
      {
        objc_msgSend(v10, "setVisibilityState:", 2);
        v9 = v10;
      }
      objc_msgSend(v9, "setAlbums:", 0);
      objc_msgSend(v10, "setNeedsMomentUpdate:", 1);
      v4 = v10;
    }
  }

}

+ (CGRect)frameOfTopImageInStackForStackFrame:(CGRect)result
{
  double v3;
  double v4;
  double v5;

  v3 = result.origin.x + 0.0;
  v4 = result.origin.y + 5.0;
  v5 = result.size.height + -5.0;
  result.size.height = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (BOOL)shouldOnlyShowAvalanchePicks
{
  pl_dispatch_once();
  return shouldOnlyShowAvalanchePicks_sOnlyShowPicks;
}

uint64_t __43__PLAvalanche_shouldOnlyShowAvalanchePicks__block_invoke()
{
  uint64_t result;
  BOOL v1;
  char v2;
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppBooleanValue(CFSTR("PLOnlyShowAvalanchePicks"), CFSTR("com.apple.mobileslideshow"), &keyExistsAndHasValidFormat);
  if ((_DWORD)result)
    v1 = 1;
  else
    v1 = keyExistsAndHasValidFormat == 0;
  v2 = v1;
  shouldOnlyShowAvalanchePicks_sOnlyShowPicks = v2;
  return result;
}

uint64_t __73__PLAvalanche__calculateStackAssetForAssetCount_autoPicks_userFavorites___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a2);
  if ((result & 1) == 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    *a3 = 1;
  }
  return result;
}

uint64_t __62__PLAvalanche__assetAmongAssets_fromIndexes_excludingIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a2) ^ 1;
}

BOOL __77__PLAvalanche__visibleIndexesAmongAssets_fromUserFavoriteIndexes_stackIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "visibilityState"))
    v3 = 0;
  else
    v3 = objc_msgSend(v2, "trashedState") == 0;

  return v3;
}

uint64_t __77__PLAvalanche__visibleIndexesAmongAssets_fromUserFavoriteIndexes_stackIndex___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "addIndex:", a2);
  return result;
}

@end
