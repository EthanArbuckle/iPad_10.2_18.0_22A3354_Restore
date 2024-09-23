@implementation BrowseManagerContentCache

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)BrowseManagerContentCache;
  -[BrowseManagerContentCache dealloc](&v4, "dealloc");
}

- (BrowseManagerContentCache)init
{
  BrowseManagerContentCache *v2;
  BrowseManagerContentCache *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BrowseManagerContentCache;
  v2 = -[BrowseManagerContentCache init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_writesToDisk = 257;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, "didReceiveMemoryWarning", UIApplicationDidReceiveMemoryWarningNotification, 0);

  }
  return v3;
}

- (NSMapTable)categoryResultsCache
{
  NSMapTable *categoryResultsCache;
  NSMapTable *v4;
  NSMapTable *v5;

  categoryResultsCache = self->_categoryResultsCache;
  if (!categoryResultsCache)
  {
    v4 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 0, 0));
    v5 = self->_categoryResultsCache;
    self->_categoryResultsCache = v4;

    categoryResultsCache = self->_categoryResultsCache;
  }
  return categoryResultsCache;
}

- (void)setGeoCategories:(id)a3
{
  id v3;
  _QWORD v4[4];
  BrowseManagerContentCache *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1007B1100;
  v4[3] = &unk_1011C6DB0;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[BrowseManagerContentCache updateCacheWithBlock:](v5, "updateCacheWithBlock:", v4);

}

- (void)setLatestTraits:(id)a3
{
  id v4;
  GEOMapServiceTraits *v5;
  GEOMapServiceTraits *latestTraits;
  id v7;
  id v8;

  v7 = a3;
  if (-[BrowseManagerContentCache _traitsAreValid:](self, "_traitsAreValid:"))
  {
    v4 = v7;
  }
  else
  {

    v4 = 0;
  }
  v8 = v4;
  -[BrowseManagerContentCache setNeedsRefresh:](self, "setNeedsRefresh:", -[BrowseManagerContentCache _needsRefreshWithTraits:](self, "_needsRefreshWithTraits:", v4));
  v5 = (GEOMapServiceTraits *)objc_msgSend(v8, "copy");
  latestTraits = self->_latestTraits;
  self->_latestTraits = v5;

  -[GEOMapServiceTraits setPhotosCount:](self->_latestTraits, "setPhotosCount:", 1);
}

- (BOOL)_traitsAreValid:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  if ((objc_msgSend(v3, "hasDeviceLocation") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "hasMapRegion");

  return v4;
}

- (BOOL)_needsRefreshWithTraits:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  BOOL v8;
  const char *v9;
  uint8_t *v10;
  id v11;
  unsigned int v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v31;
  id v32;
  id v33;
  uint8_t v35[16];
  uint8_t buf[2];
  __int16 v37;
  __int16 v38;
  __int16 v39;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "navigating"))
    {
      v6 = sub_1007B158C();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      v8 = 1;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v38 = 0;
        v9 = "Refresh categories. Reason: navigating";
        v10 = (uint8_t *)&v38;
LABEL_20:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v9, v10, 2u);
      }
    }
    else
    {
      v12 = -[GEOMapServiceTraits mode](self->_latestTraits, "mode");
      if (v12 == objc_msgSend(v5, "mode"))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMapServiceTraits mapRegion](self->_latestTraits, "mapRegion"));
        v15 = GEOMapRectForMapRegion(v13, v14);
        v17 = v16;
        v19 = v18;
        v21 = v20;

        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapRegion"));
        v24 = GEOMapRectForMapRegion(v22, v23);
        v26 = v25;
        v28 = v27;
        v30 = v29;

        if (self->_latestTraits && v24 == v15 && v26 == v17 && v28 == v19 && v30 == v21)
        {
          v31 = sub_1007B158C();
          v7 = objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v35 = 0;
            _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Did not refresh categories", v35, 2u);
          }
          v8 = 0;
        }
        else
        {
          v33 = sub_1007B158C();
          v7 = objc_claimAutoreleasedReturnValue(v33);
          v8 = 1;
          if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            v9 = "Refresh categories. Reason: region is different";
            v10 = buf;
            goto LABEL_20;
          }
        }
      }
      else
      {
        v32 = sub_1007B158C();
        v7 = objc_claimAutoreleasedReturnValue(v32);
        v8 = 1;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v37 = 0;
          v9 = "Refresh categories. Reason: traits.mode has changed";
          v10 = (uint8_t *)&v37;
          goto LABEL_20;
        }
      }
    }
  }
  else
  {
    v11 = sub_1007B158C();
    v7 = objc_claimAutoreleasedReturnValue(v11);
    v8 = 1;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v39 = 0;
      v9 = "Refresh categories. Reason: nil traits";
      v10 = (uint8_t *)&v39;
      goto LABEL_20;
    }
  }

  return v8;
}

- (void)updateCacheWithBlock:(id)a3
{
  void (**v4)(id, BrowseManagerContentCache *);
  BrowseManagerContentCache *v5;
  void (**v6)(id, BrowseManagerContentCache *);

  v4 = (void (**)(id, BrowseManagerContentCache *))a3;
  if (v4)
  {
    v6 = v4;
    v5 = self;
    objc_sync_enter(v5);
    v6[2](v6, v5);
    objc_sync_exit(v5);

    v4 = v6;
  }

}

- (void)didReceiveMemoryWarning
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BrowseManagerContentCache categoryResultsCache](self, "categoryResultsCache"));
  objc_msgSend(v2, "removeAllObjects");

}

- (void)writeCategories
{
  id v3;
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  BrowseManagerContentCache *v9;

  if (-[BrowseManagerContentCache writesToDisk](self, "writesToDisk"))
  {
    v3 = -[NSArray copy](self->_geoCategories, "copy");
    global_queue = dispatch_get_global_queue(-32768, 0);
    v5 = objc_claimAutoreleasedReturnValue(global_queue);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1007B1710;
    v7[3] = &unk_1011AC8B0;
    v8 = v3;
    v9 = self;
    v6 = v3;
    dispatch_async(v5, v7);

  }
}

- (id)_diskCachedCategories
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseManagerContentCache diskCachingKey](self, "diskCachingKey"));
  v3 = sub_1007B18A8(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  if (v4
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path")),
        v7 = objc_msgSend(v5, "fileExistsAtPath:", v6),
        v6,
        v5,
        v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithContentsOfURL:](NSArray, "arrayWithContentsOfURL:", v4));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v8, "count")));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v14);
          v16 = objc_alloc((Class)GEOSearchCategoryStorage);
          v17 = objc_msgSend(v16, "initWithData:", v15, (_QWORD)v21);
          v18 = objc_msgSend(objc_alloc((Class)GEOSearchCategory), "initWithStorage:", v17);
          objc_msgSend(v9, "addObject:", v18);

          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v12);
    }

  }
  else
  {
    v9 = 0;
  }
  v19 = objc_msgSend(v9, "copy", (_QWORD)v21);

  return v19;
}

- (void)readCategoriesFromDiskIfNeeded
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseManagerContentCache geoCategories](self, "geoCategories"));

  if (!v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[BrowseManagerContentCache _diskCachedCategories](self, "_diskCachedCategories"));
    -[BrowseManagerContentCache setGeoCategories:](self, "setGeoCategories:", v4);

  }
}

- (void)setWritesToDisk:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;

  if (self->_writesToDisk != a3)
  {
    self->_writesToDisk = a3;
    if (!a3)
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseManagerContentCache diskCachingKey](self, "diskCachingKey"));
      v5 = sub_1007B18A8(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
      v8 = objc_msgSend(v9, "fileExistsAtPath:", v7);

      if (v8)
        objc_msgSend(v9, "removeItemAtURL:error:", v6, 0);

    }
  }
}

- (GEOMapServiceTraits)latestTraits
{
  return self->_latestTraits;
}

- (BOOL)writesToDisk
{
  return self->_writesToDisk;
}

- (NSString)diskCachingKey
{
  return self->_diskCachingKey;
}

- (void)setDiskCachingKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)needsRefresh
{
  return self->_needsRefresh;
}

- (void)setNeedsRefresh:(BOOL)a3
{
  self->_needsRefresh = a3;
}

- (NSArray)geoCategories
{
  return self->_geoCategories;
}

- (NSArray)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
  objc_storeStrong((id *)&self->_categories, a3);
}

- (void)setCategoryResultsCache:(id)a3
{
  objc_storeStrong((id *)&self->_categoryResultsCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryResultsCache, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_geoCategories, 0);
  objc_storeStrong((id *)&self->_diskCachingKey, 0);
  objc_storeStrong((id *)&self->_latestTraits, 0);
}

@end
