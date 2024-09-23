@implementation BKAssetArrayController

- (BOOL)_filterAsset:(id)a3
{
  uint64_t (**filter)(id, id);

  filter = (uint64_t (**)(id, id))self->_filter;
  if (filter)
    return filter[2](filter, a3);
  else
    return 1;
}

- (id)arrangeObjects:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (self->_filter)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uiChildContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "libraryAssetsWithAssetIDsContainedInList:tempAssetIDs:inManagedObjectContext:", v4, 0, v7));

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          if (-[BKAssetArrayController _filterAsset:](self, "_filterAsset:", v14, (_QWORD)v17))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "assetID"));
            objc_msgSend(v5, "addObject:", v15);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

  }
  else
  {
    v5 = v4;
  }

  return v5;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_filter, 0);
}

@end
