@implementation BKMediaLibraryChangeCollector

- (BKMediaLibraryChangeCollector)initWithAssetCache:(id)a3
{
  id v5;
  BKMediaLibraryChangeCollector *v6;
  uint64_t v7;
  NSMutableDictionary *added;
  uint64_t v9;
  NSMutableDictionary *updated;
  uint64_t v11;
  NSMutableDictionary *removed;
  uint64_t v13;
  NSMutableSet *beforeChangesCacheIDSet;
  NSMutableSet *v15;
  NSMutableSet *afterChangesCacheIDSet;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BKMediaLibraryChangeCollector;
  v6 = -[BKMediaLibraryChangeCollector init](&v18, "init");
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    added = v6->_added;
    v6->_added = (NSMutableDictionary *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    updated = v6->_updated;
    v6->_updated = (NSMutableDictionary *)v9;

    v11 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    removed = v6->_removed;
    v6->_removed = (NSMutableDictionary *)v11;

    objc_storeStrong((id *)&v6->_assetCache, a3);
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mutableCacheIDSet"));
    beforeChangesCacheIDSet = v6->_beforeChangesCacheIDSet;
    v6->_beforeChangesCacheIDSet = (NSMutableSet *)v13;

    v15 = objc_opt_new(NSMutableSet);
    afterChangesCacheIDSet = v6->_afterChangesCacheIDSet;
    v6->_afterChangesCacheIDSet = v15;

  }
  return v6;
}

- (void)finalizeChangeProcessing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryChangeCollector beforeChangesCacheIDSet](self, "beforeChangesCacheIDSet"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryChangeCollector afterChangesCacheIDSet](self, "afterChangesCacheIDSet"));
  objc_msgSend(v3, "minusSet:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryChangeCollector beforeChangesCacheIDSet](self, "beforeChangesCacheIDSet"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", v5));

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1001C99D0;
  v28[3] = &unk_1008EF300;
  v28[4] = self;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v28);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryChangeCollector removed](self, "removed"));
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v10 = BKLibraryDataSourceMediaLibraryLog(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_1006A4AB8(self);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryChangeCollector removed](self, "removed"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allValues"));
    +[BKMediaLibraryChangeCollector logAssets:message:](BKMediaLibraryChangeCollector, "logAssets:message:", v13, CFSTR("removing"));

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryChangeCollector added](self, "added"));
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    v17 = BKLibraryDataSourceMediaLibraryLog(v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      sub_1006A4A0C(self);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryChangeCollector added](self, "added"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "allValues"));
    +[BKMediaLibraryChangeCollector logAssets:message:](BKMediaLibraryChangeCollector, "logAssets:message:", v20, CFSTR("adding"));

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryChangeCollector updated](self, "updated"));
  v22 = objc_msgSend(v21, "count");

  if (v22)
  {
    v24 = BKLibraryDataSourceMediaLibraryLog(v23);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      sub_1006A4960(self);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryChangeCollector updated](self, "updated"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "allValues"));
    +[BKMediaLibraryChangeCollector logAssets:message:](BKMediaLibraryChangeCollector, "logAssets:message:", v27, CFSTR("updating"));

  }
}

- (NSMutableSet)beforeChangesCacheIDSet
{
  return self->_beforeChangesCacheIDSet;
}

- (NSMutableSet)afterChangesCacheIDSet
{
  return self->_afterChangesCacheIDSet;
}

- (NSMutableDictionary)updated
{
  return self->_updated;
}

- (NSMutableDictionary)removed
{
  return self->_removed;
}

- (NSMutableDictionary)added
{
  return self->_added;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removed, 0);
  objc_storeStrong((id *)&self->_updated, 0);
  objc_storeStrong((id *)&self->_added, 0);
  objc_storeStrong((id *)&self->_afterChangesCacheIDSet, 0);
  objc_storeStrong((id *)&self->_beforeChangesCacheIDSet, 0);
  objc_storeStrong((id *)&self->_assetCache, 0);
}

+ (void)logAssets:(id)a3 message:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];

  v5 = a3;
  v6 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v10);
        v12 = BKLibraryDataSourceMediaLibraryLog(v7);
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "assetID"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "title"));
          *(_DWORD *)buf = 138543874;
          v21 = v6;
          v22 = 2112;
          v23 = v14;
          v24 = 2112;
          v25 = v15;
          _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%{public}@ assetID: %@, title: %@", buf, 0x20u);

        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
      v8 = v7;
    }
    while (v7);
  }

}

- (BKMediaLibraryAssetCache)assetCache
{
  return self->_assetCache;
}

- (void)setAssetCache:(id)a3
{
  objc_storeStrong((id *)&self->_assetCache, a3);
}

- (void)setBeforeChangesCacheIDSet:(id)a3
{
  objc_storeStrong((id *)&self->_beforeChangesCacheIDSet, a3);
}

- (void)setAfterChangesCacheIDSet:(id)a3
{
  objc_storeStrong((id *)&self->_afterChangesCacheIDSet, a3);
}

- (void)setAdded:(id)a3
{
  objc_storeStrong((id *)&self->_added, a3);
}

- (void)setUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_updated, a3);
}

- (void)setRemoved:(id)a3
{
  objc_storeStrong((id *)&self->_removed, a3);
}

@end
