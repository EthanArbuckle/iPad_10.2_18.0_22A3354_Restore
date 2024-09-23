@implementation BKMediaLibraryBookletAssetCache

- (BKMediaLibraryBookletAssetCache)init
{
  BKMediaLibraryBookletAssetCache *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *bookletAssetIdToBookletAssetMapping;
  NSMutableDictionary *v5;
  NSMutableDictionary *parentAssetIdToBookletAssetIdMapping;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKMediaLibraryBookletAssetCache;
  v2 = -[BKMediaLibraryBookletAssetCache init](&v8, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    bookletAssetIdToBookletAssetMapping = v2->_bookletAssetIdToBookletAssetMapping;
    v2->_bookletAssetIdToBookletAssetMapping = v3;

    v5 = objc_opt_new(NSMutableDictionary);
    parentAssetIdToBookletAssetIdMapping = v2->_parentAssetIdToBookletAssetIdMapping;
    v2->_parentAssetIdToBookletAssetIdMapping = v5;

  }
  return v2;
}

- (id)allBookletAssetIDs
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryBookletAssetCache bookletAssetIdToBookletAssetMapping](self, "bookletAssetIdToBookletAssetMapping"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allKeys"));

  return v3;
}

- (id)allBookletAssets
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryBookletAssetCache bookletAssetIdToBookletAssetMapping](self, "bookletAssetIdToBookletAssetMapping"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));

  return v3;
}

- (id)bookletAssetForAssetID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryBookletAssetCache bookletAssetIdToBookletAssetMapping](self, "bookletAssetIdToBookletAssetMapping"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (id)bookletAssetsForParentAssetID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  _BYTE v28[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryBookletAssetCache parentAssetIdToBookletAssetIdMapping](self, "parentAssetIdToBookletAssetIdMapping"));
  v21 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryBookletAssetCache bookletAssetIdToBookletAssetMapping](self, "bookletAssetIdToBookletAssetMapping"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v13));

        if (v15)
        {
          objc_msgSend(v7, "addObject:", v15);
        }
        else
        {
          v17 = BKLibraryDataSourceMediaLibraryLog(v16);
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v27 = v13;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Could not find a booklet with assetID %@", buf, 0xCu);
          }

        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v10);
  }

  v19 = objc_msgSend(v7, "copy");
  return v19;
}

- (void)addBookletAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryBookletAssetCache bookletAssetIdToBookletAssetMapping](self, "bookletAssetIdToBookletAssetMapping"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "storeID"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parentAsset"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetID"));

  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryBookletAssetCache parentAssetIdToBookletAssetIdMapping](self, "parentAssetIdToBookletAssetIdMapping"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v8));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "storeID"));
      objc_msgSend(v11, "addObject:", v12);
    }
    else
    {
      v15 = objc_alloc((Class)NSMutableSet);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "storeID"));
      v16 = objc_msgSend(v15, "initWithObjects:", v12, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryBookletAssetCache parentAssetIdToBookletAssetIdMapping](self, "parentAssetIdToBookletAssetIdMapping"));
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v8);

    }
  }
  else
  {
    v13 = BKLibraryDataSourceMediaLibraryLog(v9);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10069D290((uint64_t)v4, v14);

  }
}

- (id)popBookletAssetsForParentAssetID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryBookletAssetCache parentAssetIdToBookletAssetIdMapping](self, "parentAssetIdToBookletAssetIdMapping"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));
  v7 = objc_msgSend(v6, "copy");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryBookletAssetCache popBookletAssetsWithAssetIDs:forParentAssetID:](self, "popBookletAssetsWithAssetIDs:forParentAssetID:", v7, v4));
  return v8;
}

- (id)popBookletAssetsWithAssetIDs:(id)a3 forParentAssetID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryBookletAssetCache parentAssetIdToBookletAssetIdMapping](self, "parentAssetIdToBookletAssetIdMapping"));
  v23 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));

  v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryBookletAssetCache bookletAssetIdToBookletAssetMapping](self, "bookletAssetIdToBookletAssetMapping"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v16));

        if (v18)
        {
          objc_msgSend(v10, "addObject:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryBookletAssetCache bookletAssetIdToBookletAssetMapping](self, "bookletAssetIdToBookletAssetMapping"));
          objc_msgSend(v19, "removeObjectForKey:", v16);

          objc_msgSend(v9, "removeObject:", v16);
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v13);
  }

  if (!objc_msgSend(v9, "count"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryBookletAssetCache parentAssetIdToBookletAssetIdMapping](self, "parentAssetIdToBookletAssetIdMapping"));
    objc_msgSend(v20, "removeObjectForKey:", v23);

  }
  v21 = objc_msgSend(v10, "copy");

  return v21;
}

- (NSMutableDictionary)bookletAssetIdToBookletAssetMapping
{
  return self->_bookletAssetIdToBookletAssetMapping;
}

- (void)setBookletAssetIdToBookletAssetMapping:(id)a3
{
  objc_storeStrong((id *)&self->_bookletAssetIdToBookletAssetMapping, a3);
}

- (NSMutableDictionary)parentAssetIdToBookletAssetIdMapping
{
  return self->_parentAssetIdToBookletAssetIdMapping;
}

- (void)setParentAssetIdToBookletAssetIdMapping:(id)a3
{
  objc_storeStrong((id *)&self->_parentAssetIdToBookletAssetIdMapping, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentAssetIdToBookletAssetIdMapping, 0);
  objc_storeStrong((id *)&self->_bookletAssetIdToBookletAssetMapping, 0);
}

@end
