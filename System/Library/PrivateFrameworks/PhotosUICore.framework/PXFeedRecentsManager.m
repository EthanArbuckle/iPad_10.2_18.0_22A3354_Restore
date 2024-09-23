@implementation PXFeedRecentsManager

- (PXFeedRecentsManager)initWithPhotoLibrary:(id)a3 count:(int64_t)a4
{
  id v6;
  PXFeedRecentsManager *v7;
  PXFeedRecentsManager *v8;
  uint64_t v9;
  NSMutableArray *pendingFeedEntriesChangeNotifications;
  uint64_t v11;
  NSMutableArray *pendingAssetsChangeNotifications;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXFeedRecentsManager;
  v7 = -[PXFeedRecentsManager init](&v16, sel_init);
  v8 = v7;
  if (v7)
  {
    -[PXFeedRecentsManager _setPhotoLibrary:](v7, "_setPhotoLibrary:", v6);
    -[PXFeedRecentsManager _setCount:](v8, "_setCount:", a4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    pendingFeedEntriesChangeNotifications = v8->_pendingFeedEntriesChangeNotifications;
    v8->_pendingFeedEntriesChangeNotifications = (NSMutableArray *)v9;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    pendingAssetsChangeNotifications = v8->_pendingAssetsChangeNotifications;
    v8->_pendingAssetsChangeNotifications = (NSMutableArray *)v11;

    objc_msgSend(MEMORY[0x1E0D715F0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addCloudFeedEntriesObserver:", v8);
    objc_msgSend(v13, "addAssetChangeObserver:", v8);
    objc_msgSend(v13, "addShouldReloadObserver:", v8);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v8, sel__didFinishPostingNotifications_, *MEMORY[0x1E0D71CF8], 0);

    -[PXFeedRecentsManager _invalidateCachedRecentAssets](v8, "_invalidateCachedRecentAssets");
  }

  return v8;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0D715F0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeCloudFeedEntriesObserver:", self);
  objc_msgSend(v3, "removeAssetChangeObserver:", self);
  objc_msgSend(v3, "removeShouldReloadObserver:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0D71CF8], 0);

  v5.receiver = self;
  v5.super_class = (Class)PXFeedRecentsManager;
  -[PXFeedRecentsManager dealloc](&v5, sel_dealloc);
}

- (void)_setCachedRecentAssets:(id)a3
{
  NSOrderedSet *v5;
  NSArray *cachedRecentPHAssets;
  NSOrderedSet *v7;

  v5 = (NSOrderedSet *)a3;
  if (self->__cachedRecentAssets != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->__cachedRecentAssets, a3);
    cachedRecentPHAssets = self->__cachedRecentPHAssets;
    self->__cachedRecentPHAssets = 0;

    v5 = v7;
  }

}

- (NSOrderedSet)recentAssets
{
  void *v3;

  -[PXFeedRecentsManager _cachedRecentAssets](self, "_cachedRecentAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PXFeedRecentsManager _updateCachedRecentAssets](self, "_updateCachedRecentAssets");
    -[PXFeedRecentsManager _cachedRecentAssets](self, "_cachedRecentAssets");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSOrderedSet *)v3;
}

- (NSArray)recentPHAssets
{
  void *v3;
  void *v4;
  void *v5;

  -[PXFeedRecentsManager _cachedRecentPHAssets](self, "_cachedRecentPHAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PXFeedRecentsManager recentAssets](self, "recentAssets");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D71880], "pl_PHAssetsForManagedAssets:photoLibrary:", v5, self->_photoLibrary);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFeedRecentsManager _setCachedRecentPHAssets:](self, "_setCachedRecentPHAssets:", v3);

  }
  return (NSArray *)v3;
}

- (BOOL)_updateCachedRecentAssets
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXFeedRecentsManager count](self, "count");
  v5 = (void *)MEMORY[0x1E0D71618];
  -[PHPhotoLibrary photoLibrary](self->_photoLibrary, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recentAssetsEntriesInLibrary:limit:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "entryAssets", (_QWORD)v22);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");
        if (objc_msgSend(v3, "count") + v14 >= v4)
        {
          v16 = v4 - objc_msgSend(v3, "count");
          objc_msgSend(v13, "array");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "subarrayWithRange:", 0, v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObjectsFromArray:", v18);

          goto LABEL_11;
        }
        objc_msgSend(v13, "array");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v15);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  -[PXFeedRecentsManager _cachedRecentAssets](self, "_cachedRecentAssets");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v3, "isEqualToOrderedSet:", v19);
  if ((v20 & 1) == 0)
    -[PXFeedRecentsManager _setCachedRecentAssets:](self, "_setCachedRecentAssets:", v3);

  return v20 ^ 1;
}

- (void)_invalidateCachedRecentAssets
{
  -[PXFeedRecentsManager _setCachedRecentAssets:](self, "_setCachedRecentAssets:", 0);
}

- (void)cloudFeedEntriesDidChange:(id)a3
{
  -[NSMutableArray addObject:](self->_pendingFeedEntriesChangeNotifications, "addObject:", a3);
}

- (void)assetsDidChange:(id)a3
{
  -[NSMutableArray addObject:](self->_pendingAssetsChangeNotifications, "addObject:", a3);
}

- (void)shouldReload:(id)a3
{
  id v4;

  -[NSMutableArray removeAllObjects](self->_pendingFeedEntriesChangeNotifications, "removeAllObjects", a3);
  -[NSMutableArray removeAllObjects](self->_pendingAssetsChangeNotifications, "removeAllObjects");
  -[PXFeedRecentsManager _invalidateCachedRecentAssets](self, "_invalidateCachedRecentAssets");
  -[PXFeedRecentsManager delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "feedRecentsManagerRecentAssetsDidChange:", self);

}

- (void)_didFinishPostingNotifications:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_pendingFeedEntriesChangeNotifications, "count", a3)
    || -[NSMutableArray count](self->_pendingAssetsChangeNotifications, "count"))
  {
    v4 = (void *)-[NSMutableArray copy](self->_pendingFeedEntriesChangeNotifications, "copy");
    -[NSMutableArray removeAllObjects](self->_pendingFeedEntriesChangeNotifications, "removeAllObjects");
    v5 = (void *)-[NSMutableArray copy](self->_pendingAssetsChangeNotifications, "copy");
    -[NSMutableArray removeAllObjects](self->_pendingAssetsChangeNotifications, "removeAllObjects");
    if (objc_msgSend(v4, "count"))
    {
      -[PXFeedRecentsManager _invalidateCachedRecentAssets](self, "_invalidateCachedRecentAssets");
LABEL_5:
      -[PXFeedRecentsManager delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "feedRecentsManagerRecentAssetsDidChange:", self);
    }
    else
    {
      -[PXFeedRecentsManager _cachedRecentAssets](self, "_cachedRecentAssets");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "count"))
      {
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v7 = v5;
        v17 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        if (v17)
        {
          v8 = *(_QWORD *)v24;
          v18 = v7;
          v16 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v24 != v8)
                objc_enumerationMutation(v7);
              objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "updatedAssets");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = 0u;
              v20 = 0u;
              v21 = 0u;
              v22 = 0u;
              v11 = v6;
              v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
              if (v12)
              {
                v13 = v12;
                v14 = *(_QWORD *)v20;
                while (2)
                {
                  for (j = 0; j != v13; ++j)
                  {
                    if (*(_QWORD *)v20 != v14)
                      objc_enumerationMutation(v11);
                    if (objc_msgSend(v10, "containsObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j)))
                    {

                      goto LABEL_5;
                    }
                  }
                  v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
                  if (v13)
                    continue;
                  break;
                }
              }

              v7 = v18;
              v8 = v16;
            }
            v17 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
          }
          while (v17);

          goto LABEL_7;
        }

      }
    }

LABEL_7:
  }
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)_setPhotoLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibrary, a3);
}

- (int64_t)count
{
  return self->_count;
}

- (void)_setCount:(int64_t)a3
{
  self->_count = a3;
}

- (PXFeedRecentsManagerDelegate)delegate
{
  return (PXFeedRecentsManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSOrderedSet)_cachedRecentAssets
{
  return self->__cachedRecentAssets;
}

- (NSArray)_cachedRecentPHAssets
{
  return self->__cachedRecentPHAssets;
}

- (void)_setCachedRecentPHAssets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cachedRecentPHAssets, 0);
  objc_storeStrong((id *)&self->__cachedRecentAssets, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_pendingAssetsChangeNotifications, 0);
  objc_storeStrong((id *)&self->_pendingFeedEntriesChangeNotifications, 0);
}

@end
