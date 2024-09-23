@implementation PLUtilityAssetPool

- (id)_dequeueRecylableAsset
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray lastObject](self->_locked_recycledAssets, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[NSMutableArray removeLastObject](self->_locked_recycledAssets, "removeLastObject");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)_dequeueRecylableClassification
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray lastObject](self->_locked_recycledClassifications, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[NSMutableArray removeLastObject](self->_locked_recycledClassifications, "removeLastObject");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (PLUtilityAssetPool)init
{
  PLUtilityAssetPool *v2;
  PLUtilityAssetPool *v3;
  uint64_t v4;
  NSMutableArray *locked_recycledAssets;
  uint64_t v6;
  NSMutableArray *locked_recycledClassifications;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PLUtilityAssetPool;
  v2 = -[PLUtilityAssetPool init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    locked_recycledAssets = v3->_locked_recycledAssets;
    v3->_locked_recycledAssets = (NSMutableArray *)v4;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    locked_recycledClassifications = v3->_locked_recycledClassifications;
    v3->_locked_recycledClassifications = (NSMutableArray *)v6;

  }
  return v3;
}

- (void)recycleAsset:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    objc_msgSend(v4, "sceneClassifications", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          -[NSMutableArray addObject:](self->_locked_recycledClassifications, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

    -[NSMutableArray addObject:](self->_locked_recycledAssets, "addObject:", v4);
    objc_msgSend(v4, "_prepareForRecycle");
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locked_recycledClassifications, 0);
  objc_storeStrong((id *)&self->_locked_recycledAssets, 0);
}

@end
