@implementation BKMediaLibraryAssetCache

- (BKMediaLibraryAssetCache)initWithDataSourceIdentifier:(id)a3
{
  id v4;
  BKMediaLibraryAssetCache *v5;
  NSString *v6;
  NSString *dataSourceIdentifier;
  NSMutableDictionary *v8;
  NSMutableDictionary *assetCacheByAssetID;
  NSMutableDictionary *v10;
  NSMutableDictionary *assetCacheByCacheID;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BKMediaLibraryAssetCache;
  v5 = -[BKMediaLibraryAssetCache init](&v13, "init");
  if (v5)
  {
    v6 = (NSString *)objc_msgSend(v4, "copy");
    dataSourceIdentifier = v5->_dataSourceIdentifier;
    v5->_dataSourceIdentifier = v6;

    v8 = objc_opt_new(NSMutableDictionary);
    assetCacheByAssetID = v5->_assetCacheByAssetID;
    v5->_assetCacheByAssetID = v8;

    v10 = objc_opt_new(NSMutableDictionary);
    assetCacheByCacheID = v5->_assetCacheByCacheID;
    v5->_assetCacheByCacheID = v10;

  }
  return v5;
}

- (void)uncacheAllAssets
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAssetCache assetCacheByAssetID](self, "assetCacheByAssetID"));
  objc_msgSend(v3, "removeAllObjects");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAssetCache assetCacheByCacheID](self, "assetCacheByCacheID"));
  objc_msgSend(v4, "removeAllObjects");

}

- (NSMutableDictionary)assetCacheByAssetID
{
  return self->_assetCacheByAssetID;
}

- (id)mutableCacheIDSet
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAssetCache assetCacheByCacheID](self, "assetCacheByCacheID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allKeys"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v3));

  return v4;
}

- (NSMutableDictionary)assetCacheByCacheID
{
  return self->_assetCacheByCacheID;
}

- (NSArray)cachedAssets
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAssetCache assetCacheByAssetID](self, "assetCacheByAssetID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));

  return (NSArray *)v3;
}

- (NSArray)cachedAssetIDs
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAssetCache assetCacheByAssetID](self, "assetCacheByAssetID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allKeys"));

  return (NSArray *)v3;
}

- (id)assetFromCacheID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAssetCache assetCacheByCacheID](self, "assetCacheByCacheID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (id)assetFromAssetID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAssetCache assetCacheByAssetID](self, "assetCacheByAssetID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (id)assetsFromAssetIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAssetCache assetCacheByAssetID](self, "assetCacheByAssetID", (_QWORD)v15));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v11));

        if (v13)
          objc_msgSend(v5, "addObject:", v13);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)cacheAsset:(id)a3 cacheID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "assetID"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAssetCache assetCacheByAssetID](self, "assetCacheByAssetID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "assetID"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAssetCache assetCacheByCacheID](self, "assetCacheByCacheID"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, v6);

}

- (void)uncacheAsset:(id)a3 cacheID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "assetID"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAssetCache assetCacheByAssetID](self, "assetCacheByAssetID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "assetID"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAssetCache assetCacheByCacheID](self, "assetCacheByCacheID"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v6);

}

- (void)fetchBookCoverForAssetProperties:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKey:", CFSTR("assetID")));
  if (objc_msgSend(v7, "length"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAssetCache assetFromAssetID:](self, "assetFromAssetID:", v7));
    v9 = v8;
    if (v8)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "representativeItem"));
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "artworkCatalog"));

      if (v11)
      {
        objc_msgSend(v11, "setFittingSize:", 1.79769313e308, 1.79769313e308);
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_10012C7D0;
        v32[3] = &unk_1008E9A88;
        v33 = v7;
        v34 = v6;
        objc_msgSend(v11, "requestImageWithCompletion:", v32);

        v13 = v33;
      }
      else
      {
        v23 = BKLibraryDataSourceMediaLibraryLog(v12);
        v24 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          sub_1006A1C70((uint64_t)v7, v24, v25, v26, v27, v28, v29, v30);

        v31 = objc_retainBlock(v6);
        v13 = v31;
        if (v31)
          (*((void (**)(id, _QWORD, _QWORD, _QWORD))v31 + 2))(v31, 0, 0, 0);
      }
    }
    else
    {
      v15 = BKLibraryDataSourceMediaLibraryLog(0);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_1006A1C0C((uint64_t)v7, v16, v17, v18, v19, v20, v21, v22);

      v11 = objc_retainBlock(v6);
      if (!v11)
        goto LABEL_16;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kBKLibraryDataSourceDomain, kBKLibraryDataSourceErrorAssetIDNotInCacheError, 0));
      (*((void (**)(id, _QWORD, _QWORD, void *))v11 + 2))(v11, 0, 0, v13);
    }

LABEL_16:
    goto LABEL_17;
  }
  v14 = objc_retainBlock(v6);
  v9 = v14;
  if (v14)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v14 + 2))(v14, 0, 0, 0);
LABEL_17:

}

- (void)deleteAssets:(id)a3 exhaustive:(BOOL)a4 completion:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BOOL8 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  void *v47;
  void **v48;
  uint64_t v49;
  void (*v50)(id *, void *);
  void *v51;
  BKMediaLibraryAssetCache *v52;
  id v53;
  id v54;
  id v55;

  v7 = a5;
  v8 = a3;
  v9 = BKLibraryDataSourceMediaLibraryLog(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_1006A1DB8(v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v8, "count")));
  v48 = _NSConcreteStackBlock;
  v49 = 3221225472;
  v50 = sub_10012CBF8;
  v51 = &unk_1008E7798;
  v52 = self;
  v13 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v8, "count")));
  v53 = v13;
  v14 = v11;
  v54 = v14;
  v15 = v12;
  v55 = v15;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v48);

  if (objc_msgSend(v14, "count", v48, v49, v50, v51, v52))
  {
    if (objc_msgSend(v13, "count"))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaQuery bk_audiobooksQuery](MPMediaQuery, "bk_audiobooksQuery"));
      objc_msgSend(v16, "setIgnoreSystemFilterPredicates:", 1);
      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allObjects"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:comparisonType:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:comparisonType:", v17, MPMediaItemPropertyStorePlaylistID, 108));

        objc_msgSend(v16, "addFilterPredicate:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "items"));
        v21 = objc_msgSend(v19, "removeItems:", v20);

        v23 = BKLibraryDataSourceMediaLibraryLog(v22);
        v24 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          sub_1006A1D3C((uint64_t)v21, v24, v25, v26, v27, v28, v29, v30);

      }
      else
      {
        LODWORD(v21) = 0;
      }

    }
    else
    {
      LODWORD(v21) = 0;
    }
    v31 = (_DWORD)v21 != 0;
    if (objc_msgSend(v15, "count"))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaQuery bk_audiobooksQuery](MPMediaQuery, "bk_audiobooksQuery"));
      objc_msgSend(v32, "setIgnoreSystemFilterPredicates:", 1);
      if (v32)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allObjects"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:comparisonType:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:comparisonType:", v33, MPMediaItemPropertyAlbumPersistentID, 108));

        objc_msgSend(v32, "addFilterPredicate:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "items"));
        v21 = objc_msgSend(v35, "removeItems:", v36);

        v38 = BKLibraryDataSourceMediaLibraryLog(v37);
        v39 = objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          sub_1006A1D3C((uint64_t)v21, v39, v40, v41, v42, v43, v44, v45);

      }
      v31 = (_DWORD)v21 != 0;
    }
  }
  else
  {
    v31 = 0;
  }
  v46 = objc_retainBlock(v7);
  v47 = v46;
  if (v46)
    (*((void (**)(id, _BOOL8, id, _QWORD))v46 + 2))(v46, v31, v14, 0);

}

- (void)assetForLibraryAsset:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void (**v13)(id, id, _QWORD);
  uint64_t v14;
  NSObject *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAssetCache assetFromAssetID:](self, "assetFromAssetID:", v6));
    v9 = BKLibraryDataSourceMediaLibraryLog(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "representativeItem"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForProperty:", MPMediaItemPropertyAlbumPersistentID));
      v16 = 138412802;
      v17 = v6;
      v18 = 2112;
      v19 = v8;
      v20 = 2112;
      v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "assetForLibraryAsset:completion:, (asset.assetID = %@) calling completion with asset:%@, albumPersistentID: %@", (uint8_t *)&v16, 0x20u);

    }
    v13 = (void (**)(id, id, _QWORD))objc_retainBlock(v7);

    if (v13)
      v13[2](v13, v8, 0);
    goto LABEL_10;
  }
  v14 = BKLibraryDataSourceMediaLibraryLog(0);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "assetForLibraryAsset:completion:, (asset.assetID = %@) calling completion with nil asset", (uint8_t *)&v16, 0xCu);
  }

  v8 = objc_retainBlock(v7);
  if (v8)
  {
    v13 = (void (**)(id, id, _QWORD))objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kBKLibraryDataSourceDomain, kBKLibraryDataSourceErrorAssetIDNotInCacheError, 0));
    (*((void (**)(id, _QWORD, id))v8 + 2))(v8, 0, v13);
LABEL_10:

  }
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAssetCache dataSourceIdentifier](self, "dataSourceIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAssetCache assetCacheByAssetID](self, "assetCacheByAssetID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAssetCache assetCacheByAssetID](self, "assetCacheByAssetID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allValues"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@(%p) dataSourceIdentifier=%@ cachedAssetIDs=%@ cachedAssets=%@>"), v5, self, v6, v8, v10));

  return v11;
}

- (NSString)dataSourceIdentifier
{
  return self->_dataSourceIdentifier;
}

- (void)setAssetCacheByAssetID:(id)a3
{
  objc_storeStrong((id *)&self->_assetCacheByAssetID, a3);
}

- (void)setAssetCacheByCacheID:(id)a3
{
  objc_storeStrong((id *)&self->_assetCacheByCacheID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCacheByCacheID, 0);
  objc_storeStrong((id *)&self->_assetCacheByAssetID, 0);
  objc_storeStrong((id *)&self->_dataSourceIdentifier, 0);
}

@end
