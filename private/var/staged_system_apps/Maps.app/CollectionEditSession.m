@implementation CollectionEditSession

- (CollectionEditSession)init
{
  CollectionEditSession *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CollectionEditSession;
  result = -[CollectionEditSession init](&v3, "init");
  if (result)
    result->_analyticsTarget = 201;
  return result;
}

- (CollectionEditSession)initWithCollection:(id)a3
{
  id v5;
  CollectionEditSession *v6;
  CollectionEditSession *v7;

  v5 = a3;
  v6 = -[CollectionEditSession init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_collection, a3);

  return v7;
}

+ (id)collectionSessionWithSession:(id)a3
{
  id *v4;
  id *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;

  v4 = (id *)a3;
  v5 = (id *)objc_alloc_init((Class)objc_opt_class(a1));
  objc_storeStrong(v5 + 5, v4[5]);
  v6 = objc_msgSend(v4[4], "mutableCopy");
  v7 = v5[4];
  v5[4] = v6;

  *((_BYTE *)v5 + 8) = *((_BYTE *)v4 + 8);
  *((_DWORD *)v5 + 3) = *((_DWORD *)v4 + 3);
  v8 = objc_msgSend(v4[3], "copy");
  v9 = v5[3];
  v5[3] = v8;

  WeakRetained = objc_loadWeakRetained(v4 + 2);
  objc_storeWeak(v5 + 2, WeakRetained);

  return v5;
}

- (void)clearSelectedobjects
{
  id WeakRetained;

  -[NSMutableSet removeAllObjects](self->_selectedObjectSet, "removeAllObjects");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "collectionEditSessionUpdated:", self);

}

- (NSMutableSet)selectedObjectSet
{
  NSMutableSet *selectedObjectSet;
  NSMutableSet *v4;
  NSMutableSet *v5;

  selectedObjectSet = self->_selectedObjectSet;
  if (!selectedObjectSet)
  {
    v4 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v5 = self->_selectedObjectSet;
    self->_selectedObjectSet = v4;

    selectedObjectSet = self->_selectedObjectSet;
  }
  return selectedObjectSet;
}

- (BOOL)isEmpty
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionEditSession selectedObjectSet](self, "selectedObjectSet"));
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (BOOL)isObjectSelected:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionEditSession selectedObjectSet](self, "selectedObjectSet"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)addSelectedObject:(id)a3
{
  id v4;
  id v5;
  NSObject *WeakRetained;
  void *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___GEOTransitLine))
  {
    v5 = sub_1004315EC();
    WeakRetained = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionEditSession collection](self, "collection"));
      v9 = 138412546;
      v10 = v4;
      v11 = 2112;
      v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_ERROR, "Attempting to add an object to an unsupported collection. Cannot add %@ to %@", (uint8_t *)&v9, 0x16u);

    }
    goto LABEL_6;
  }
  if (v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionEditSession selectedObjectSet](self, "selectedObjectSet"));
    objc_msgSend(v8, "addObject:", v4);

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[NSObject collectionEditSessionUpdated:](WeakRetained, "collectionEditSessionUpdated:", self);
LABEL_6:

  }
}

- (void)addSelectedObjects:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  id WeakRetained;
  id v12;
  NSObject *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  _BYTE v23[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "conformsToProtocol:", &OBJC_PROTOCOL___GEOTransitLine, (_QWORD)v15))
        {
          v12 = sub_1004315EC();
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionEditSession collection](self, "collection"));
            *(_DWORD *)buf = 138412546;
            v20 = v9;
            v21 = 2112;
            v22 = v14;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Attempting to add an object to an unsupported collection. Cannot add %@ to %@", buf, 0x16u);

          }
          WeakRetained = v4;
          goto LABEL_14;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      if (v6)
        continue;
      break;
    }
  }

  if (objc_msgSend(v4, "count"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionEditSession selectedObjectSet](self, "selectedObjectSet"));
    objc_msgSend(v10, "addObjectsFromArray:", v4);

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "collectionEditSessionUpdated:", self);
LABEL_14:

  }
}

- (void)removeSelectedObject:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionEditSession selectedObjectSet](self, "selectedObjectSet"));
    objc_msgSend(v5, "removeObject:", v4);

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "collectionEditSessionUpdated:", self);

  }
}

- (void)markAllSelected
{
  void *v3;
  void *v4;
  id WeakRetained;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler content](self->_collection, "content"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v3));
  -[CollectionEditSession setSelectedObjectSet:](self, "setSelectedObjectSet:", v4);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "collectionEditSessionUpdated:", self);

}

- (CollectionEditSessionProtocol)delegate
{
  return (CollectionEditSessionProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)resultBlock
{
  return self->_resultBlock;
}

- (void)setResultBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setSelectedObjectSet:(id)a3
{
  objc_storeStrong((id *)&self->_selectedObjectSet, a3);
}

- (CollectionHandler)collection
{
  return self->_collection;
}

- (void)setCollection:(id)a3
{
  objc_storeStrong((id *)&self->_collection, a3);
}

- (BOOL)suppressAnalytics
{
  return self->_suppressAnalytics;
}

- (void)setSuppressAnalytics:(BOOL)a3
{
  self->_suppressAnalytics = a3;
}

- (int)analyticsTarget
{
  return self->_analyticsTarget;
}

- (void)setAnalyticsTarget:(int)a3
{
  self->_analyticsTarget = a3;
}

- (id)analyticsHandler
{
  return self->_analyticsHandler;
}

- (void)setAnalyticsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_analyticsHandler, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_selectedObjectSet, 0);
  objc_storeStrong(&self->_resultBlock, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
