@implementation BKLibraryDataSourceMediaLibraryLocal

- (int64_t)rank
{
  return self->_rank;
}

- (void)mediaLibraryCacheAddedLocalAssets:(id)a3 updatedLocalAssets:(id)a4 removedLocalAssets:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = BKLibraryDataSourceMediaLibraryLog(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 134218496;
    v20 = objc_msgSend(v8, "count");
    v21 = 2048;
    v22 = objc_msgSend(v10, "count");
    v23 = 2048;
    v24 = objc_msgSend(v9, "count");
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Local library changed adding %lu, removing %lu, updating %lu.", (uint8_t *)&v19, 0x20u);
  }

  if (objc_msgSend(v10, "count"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceMediaLibraryLocal libraryManager](self, "libraryManager"));
    objc_msgSend(v13, "libraryDataSource:removedAssets:", self, v10);

    -[BKLibraryDataSourceMediaLibraryLocal _removeAssetIDsFromCacheManager:](self, "_removeAssetIDsFromCacheManager:", v10);
  }
  if (objc_msgSend(v8, "count"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceMediaLibraryLocal libraryManager](self, "libraryManager"));
    objc_msgSend(v14, "libraryDataSource:addedAssets:", self, v8);

    -[BKLibraryDataSourceMediaLibraryLocal _addAssetIDsToCacheManager:](self, "_addAssetIDsToCacheManager:", v8);
  }
  if (objc_msgSend(v9, "count"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKey:", CFSTR("assetID")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v16));
    objc_msgSend(v15, "incrementVersionForIdentifiers:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceMediaLibraryLocal libraryManager](self, "libraryManager"));
    objc_msgSend(v18, "libraryDataSource:updatedAssets:", self, v9);

  }
}

- (void)setRank:(int64_t)a3
{
  self->_rank = a3;
}

- (void)setLibraryManager:(id)a3
{
  objc_storeWeak((id *)&self->_libraryManager, a3);
}

- (BKLibraryDataSourceMediaLibraryLocal)initWithIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  BKLibraryDataSourceMediaLibraryLocal *v8;
  NSString *v9;
  NSString *dataSourceIdentifier;
  uint64_t v11;
  BKMediaLibraryCache *mediaLibraryCache;
  objc_super v14;

  v4 = a3;
  v5 = kdebug_trace(725353716, 30, 0, 0, 0);
  v6 = BKLibraryDataSourceMediaLibraryLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_1006A1E5C((uint64_t)v4, v7);

  v14.receiver = self;
  v14.super_class = (Class)BKLibraryDataSourceMediaLibraryLocal;
  v8 = -[BKLibraryDataSourceMediaLibraryLocal init](&v14, "init");
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v4, "copy");
    dataSourceIdentifier = v8->_dataSourceIdentifier;
    v8->_dataSourceIdentifier = v9;

    v11 = objc_claimAutoreleasedReturnValue(+[BKMediaLibraryCache sharedCache](BKMediaLibraryCache, "sharedCache"));
    mediaLibraryCache = v8->_mediaLibraryCache;
    v8->_mediaLibraryCache = (BKMediaLibraryCache *)v11;

    -[BKMediaLibraryCache addObserver:](v8->_mediaLibraryCache, "addObserver:", v8);
  }
  kdebug_trace(725353716, 31, 0, 0, 0);

  return v8;
}

- (NSString)identifier
{
  return self->_dataSourceIdentifier;
}

+ (id)localAudiobooksDataSource
{
  return -[BKLibraryDataSourceMediaLibraryLocal initWithIdentifier:]([BKLibraryDataSourceMediaLibraryLocal alloc], "initWithIdentifier:", CFSTR("com.apple.ibooks.datasource.audiobooks"));
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  objc_super v5;

  v3 = BKLibraryDataSourceMediaLibraryLog(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_1006A1ED0(v4);

  v5.receiver = self;
  v5.super_class = (Class)BKLibraryDataSourceMediaLibraryLocal;
  -[BKLibraryDataSourceMediaLibraryLocal dealloc](&v5, "dealloc");
}

- (BOOL)isEnabled
{
  return 1;
}

- (void)mediaLibraryCacheRequestsReload:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceMediaLibraryLocal libraryManager](self, "libraryManager"));
  objc_msgSend(v5, "reloadDataSource:completion:", self, v4);

}

- (void)fetchAssetIDsWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceMediaLibraryLocal mediaLibraryCache](self, "mediaLibraryCache"));
  objc_msgSend(v5, "fetchAssetIDsOfType:completion:", 0, v4);

}

- (void)fetchAssetsWithIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceMediaLibraryLocal mediaLibraryCache](self, "mediaLibraryCache"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10012EB18;
  v10[3] = &unk_1008E9D38;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "fetchAssetsWithIDs:type:completion:", v7, 0, v10);

}

- (void)fetchAssetsWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceMediaLibraryLocal mediaLibraryCache](self, "mediaLibraryCache"));
  objc_msgSend(v5, "fetchAssetsOfType:completion:", 0, v4);

}

- (void)_addAssetIDsToCacheManager:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "assetID", (_QWORD)v16));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[BKCoverCacheURLSchemeHandler urlStringForAssetID:dataSourceID:](BKCoverCacheURLSchemeHandler, "urlStringForAssetID:dataSourceID:", v12, self->_dataSourceIdentifier));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "assetID"));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
    objc_msgSend(v15, "addURLs:priority:quality:expiresAfter:", v5, 3, 206, 0);

  }
}

- (void)_removeAssetIDsFromCacheManager:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "assetID", (_QWORD)v16));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[BKCoverCacheURLSchemeHandler urlStringForAssetID:dataSourceID:](BKCoverCacheURLSchemeHandler, "urlStringForAssetID:dataSourceID:", v12, self->_dataSourceIdentifier));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "assetID"));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
    objc_msgSend(v15, "removeURLs:priority:quality:", v5, 3, 206);

  }
}

- (int64_t)coverSourceRank
{
  return 3;
}

- (void)bookCoverForLibraryAssetProperties:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceMediaLibraryLocal mediaLibraryCache](self, "mediaLibraryCache"));
  objc_msgSend(v9, "bookCoverForLibraryAssetProperties:type:completion:", v8, 0, v7);

}

- (void)deleteAssets:(id)a3 exhaustive:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  id v17;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = BKLibraryDataSourceMediaLibraryLog(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v17 = objc_msgSend(v8, "count");
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Deleting %lu media library assets", buf, 0xCu);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceMediaLibraryLocal mediaLibraryCache](self, "mediaLibraryCache"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10012F0E8;
  v14[3] = &unk_1008EBCC0;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "deleteAssets:type:exhaustive:completion:", v8, 0, v6, v14);

}

- (BOOL)canImportURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5
{
  return 0;
}

- (BOOL)importURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5 completion:(id)a6
{
  return 0;
}

- (BOOL)updateURL:(id)a3 completion:(id)a4
{
  return 0;
}

- (BOOL)examineURL:(id)a3 completion:(id)a4
{
  return 0;
}

- (void)resolveLibraryAsset:(id)a3 options:(id)a4 completion:(id)a5
{
  id v5;
  id v6;

  v5 = objc_retainBlock(a5);
  if (v5)
  {
    v6 = v5;
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v5 + 2))(v5, 0, 0, 0);
    v5 = v6;
  }

}

- (void)assetForLibraryAsset:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceMediaLibraryLocal mediaLibraryCache](self, "mediaLibraryCache"));
  objc_msgSend(v8, "assetForLibraryAsset:type:completion:", v7, 0, v6);

}

- (BOOL)prioritizeImport:(id)a3 completion:(id)a4
{
  return 0;
}

- (BOOL)canRedownloadAssets
{
  return 0;
}

- (BOOL)canMakeAssetsLocal
{
  return 0;
}

- (void)assetAccountIdentifiersForAssetID:(id)a3 storeID:(id)a4 path:(id)a5 completion:(id)a6
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *i;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  BKDataSourceMediaLibraryLocalAccountIdentifiers *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id obj;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _QWORD v65[2];

  v7 = a4;
  v8 = a6;
  if (objc_msgSend(v7, "length"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaQuery bk_audiobooksQuery](MPMediaQuery, "bk_audiobooksQuery"));
    if (v9 && objc_msgSend(v7, "length"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v7, MPMediaItemPropertyStorePlaylistID));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v7, MPMediaItemPropertyStoreID));
      v65[0] = v10;
      v65[1] = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v65, 2));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaCompoundAnyPredicate predicateMatchingPredicates:](MPMediaCompoundAnyPredicate, "predicateMatchingPredicates:", v12));
      objc_msgSend(v9, "addFilterPredicate:", v13);

      objc_msgSend(v9, "setGroupingType:", 1);
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "collections"));
      v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
      if (v54)
      {
        v45 = v11;
        v46 = v10;
        v47 = v9;
        v48 = v8;
        v53 = *(_QWORD *)v60;
        v52 = MPMediaItemPropertyStoreAccountID;
        v51 = MPMediaItemPropertyStoreDownloaderAccountID;
        v50 = MPMediaItemPropertyStoreFamilyAccountID;
        do
        {
          for (i = 0; i != v54; i = (char *)i + 1)
          {
            if (*(_QWORD *)v60 != v53)
              objc_enumerationMutation(obj);
            v15 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i);
            v55 = 0u;
            v56 = 0u;
            v57 = 0u;
            v58 = 0u;
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "items", v45, v46, v47, v48));
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v56;
LABEL_11:
              v20 = 0;
              while (1)
              {
                if (*(_QWORD *)v56 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v20);
                v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bk_storeID"));
                v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringValue"));
                v24 = objc_msgSend(v7, "isEqualToString:", v23);

                if ((v24 & 1) != 0)
                  break;
                if (v18 == (id)++v20)
                {
                  v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
                  if (v18)
                    goto LABEL_11;
                  goto LABEL_17;
                }
              }
              v25 = objc_opt_class(NSNumber);
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "valueForProperty:", v52));
              v27 = BUDynamicCast(v25, v26);
              v28 = (void *)objc_claimAutoreleasedReturnValue(v27);

              v29 = objc_opt_class(NSNumber);
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "valueForProperty:", v51));
              v31 = BUDynamicCast(v29, v30);
              v32 = (void *)objc_claimAutoreleasedReturnValue(v31);

              v33 = objc_opt_class(NSNumber);
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "valueForProperty:", v50));
              v35 = BUDynamicCast(v33, v34);
              v36 = (void *)objc_claimAutoreleasedReturnValue(v35);

              v37 = objc_opt_new(BKDataSourceMediaLibraryLocalAccountIdentifiers);
              v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "bkdsml_nonZeroString"));
              -[BKDataSourceMediaLibraryLocalAccountIdentifiers setPurchasedDSID:](v37, "setPurchasedDSID:", v38);

              v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "bkdsml_nonZeroString"));
              -[BKDataSourceMediaLibraryLocalAccountIdentifiers setDownloadedDSID:](v37, "setDownloadedDSID:", v39);

              v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "bkdsml_nonZeroString"));
              -[BKDataSourceMediaLibraryLocalAccountIdentifiers setFamilyID:](v37, "setFamilyID:", v40);

              if (v37)
                goto LABEL_22;
            }
            else
            {
LABEL_17:

            }
          }
          v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
        }
        while (v54);
        v37 = 0;
LABEL_22:
        v9 = v47;
        v8 = v48;
        v11 = v45;
        v10 = v46;
      }
      else
      {
        v37 = 0;
      }

    }
    else
    {
      v37 = 0;
    }
    v43 = objc_retainBlock(v8);
    v44 = v43;
    if (v43)
      (*((void (**)(id, BKDataSourceMediaLibraryLocalAccountIdentifiers *, _QWORD))v43 + 2))(v43, v37, 0);

  }
  else
  {
    v41 = objc_retainBlock(v8);
    v42 = v41;
    if (v41)
      (*((void (**)(id, _QWORD, _QWORD))v41 + 2))(v41, 0, 0);

  }
}

- (BKLibraryManager)libraryManager
{
  return (BKLibraryManager *)objc_loadWeakRetained((id *)&self->_libraryManager);
}

- (NSString)dataSourceIdentifier
{
  return self->_dataSourceIdentifier;
}

- (void)setDataSourceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BKMediaLibraryCache)mediaLibraryCache
{
  return self->_mediaLibraryCache;
}

- (void)setMediaLibraryCache:(id)a3
{
  objc_storeStrong((id *)&self->_mediaLibraryCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaLibraryCache, 0);
  objc_storeStrong((id *)&self->_dataSourceIdentifier, 0);
  objc_destroyWeak((id *)&self->_libraryManager);
}

@end
