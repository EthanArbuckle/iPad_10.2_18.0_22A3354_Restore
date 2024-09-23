@implementation SDShareSheetProxyLoader

- (SDShareSheetProxyLoader)initWithProxySection:(id)a3
{
  id v5;
  SDShareSheetProxyLoader *v6;
  SDShareSheetProxyLoader *v7;
  void *v8;
  NSArray *v9;
  NSArray *allProxies;
  NSMutableArray *v11;
  NSMutableArray *remainingProxies;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SDShareSheetProxyLoader;
  v6 = -[SDShareSheetProxyLoader init](&v14, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_proxySection, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "proxies"));
    v9 = (NSArray *)objc_msgSend(v8, "copy");
    allProxies = v7->_allProxies;
    v7->_allProxies = v9;

    v11 = (NSMutableArray *)-[NSArray mutableCopy](v7->_allProxies, "mutableCopy");
    remainingProxies = v7->_remainingProxies;
    v7->_remainingProxies = v11;

    v7->_loadTimeLimit = 0.25;
    atomic_store(0, (unsigned __int8 *)&v7->_isCancelled);
  }

  return v7;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SDShareSheetProxyLoader;
  v3 = -[SDShareSheetProxyLoader description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetProxyLoader proxySection](self, "proxySection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ proxySection:%@"), v4, v5));

  return v6;
}

- (unint64_t)remainingProxiesCount
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetProxyLoader remainingProxies](self, "remainingProxies"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (BOOL)isCancelled
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_isCancelled);
  return v2 & 1;
}

- (void)cancel
{
  atomic_store(1u, (unsigned __int8 *)&self->_isCancelled);
}

- (void)loadRemainingProxies
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  int v7;
  SDShareSheetProxyLoader *v8;

  if (!-[SDShareSheetProxyLoader isLoading](self, "isLoading"))
  {
    v3 = share_sheet_log();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "load remaining proxies for loader:%@", (uint8_t *)&v7, 0xCu);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetProxyLoader remainingProxies](self, "remainingProxies"));
    v6 = objc_msgSend(v5, "copy");
    -[SDShareSheetProxyLoader _loadProxies:withTimeLimit:](self, "_loadProxies:withTimeLimit:", v6, 1);

  }
}

- (void)loadBatchWithSize:(unint64_t)a3
{
  unsigned __int8 v6;
  unint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  unint64_t v15;
  __int16 v16;
  SDShareSheetProxyLoader *v17;

  v6 = -[SDShareSheetProxyLoader isLoading](self, "isLoading");
  if (a3 && (v6 & 1) == 0)
  {
    v7 = -[SDShareSheetProxyLoader remainingProxiesCount](self, "remainingProxiesCount");
    if (v7 < a3)
      a3 = v7;
    if (!a3)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SDShareSheetProxyLoader.m"), 103, CFSTR("There are no remaining proxies to load."));

    }
    v8 = share_sheet_log();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 134218242;
      v15 = a3;
      v16 = 2112;
      v17 = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "load proxy batch of size:%lu loader:%@", (uint8_t *)&v14, 0x16u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, a3));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetProxyLoader remainingProxies](self, "remainingProxies"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectsAtIndexes:", v10));

    -[SDShareSheetProxyLoader _loadProxies:withTimeLimit:](self, "_loadProxies:withTimeLimit:", v12, 0);
  }
}

- (void)_loadProxies:(id)a3 withTimeLimit:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  double v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  os_signpost_id_t v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  SDShareSheetProxyLoader *v18;
  unsigned int v19;
  unsigned int v20;
  void *v21;
  id v22;
  id v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  unsigned __int8 v31;
  id v32;
  NSObject *v33;
  const char *v34;
  id v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  os_signpost_id_t v39;
  void *v40;
  id v41;
  uint64_t v42;
  SDShareSheetProxyLoaderResult *v43;
  void *v44;
  id v45;
  void *v46;
  id obj;
  void *v49;
  void *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  SDShareSheetProxyLoader *v57;
  _BYTE v58[128];

  v4 = a4;
  v6 = a3;
  -[SDShareSheetProxyLoader setIsLoading:](self, "setIsLoading:", 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v8 = v7;
  v9 = share_sheet_log();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = share_sheet_log();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = os_signpost_id_make_with_pointer(v12, self);

  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v13, "LoadingProxies", ", buf, 2u);
  }

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v6;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v53;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v53 != v16)
          objc_enumerationMutation(obj);
        v18 = *(SDShareSheetProxyLoader **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i);
        v19 = -[SDShareSheetProxyLoader isCancelled](self, "isCancelled");
        if (v19)
        {
          v32 = share_sheet_log();
          v33 = objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v57 = self;
            v34 = "loading was cancelled for loader:%@";
            goto LABEL_24;
          }
LABEL_25:
          v31 = v19 ^ 1;

          goto LABEL_26;
        }
        v20 = -[SDShareSheetProxyLoader load](v18, "load");
        objc_msgSend(v51, "addObject:", v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetProxyLoader allProxies](self, "allProxies"));
        v22 = objc_msgSend(v21, "indexOfObject:", v18);

        v23 = share_sheet_log();
        v24 = objc_claimAutoreleasedReturnValue(v23);
        v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
        if (v20)
        {
          v26 = v50;
          if (v25)
          {
            *(_DWORD *)buf = 138412290;
            v57 = v18;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "load proxy succeeded:%@", buf, 0xCu);
            v26 = v50;
          }
        }
        else
        {
          v26 = v49;
          if (v25)
          {
            *(_DWORD *)buf = 138412290;
            v57 = v18;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "load proxy failed:%@", buf, 0xCu);
            v26 = v49;
          }
        }

        objc_msgSend(v26, "addIndex:", v22);
        if (v4)
        {
          -[SDShareSheetProxyLoader loadTimeLimit](self, "loadTimeLimit");
          if (v27 > 0.0)
          {
            +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
            v29 = v28 - v8;
            -[SDShareSheetProxyLoader loadTimeLimit](self, "loadTimeLimit");
            if (v29 > v30 || v29 < 0.0)
            {
              v45 = share_sheet_log();
              v33 = objc_claimAutoreleasedReturnValue(v45);
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v57 = self;
                v34 = "loading time interval reached. Stop loading:%@";
LABEL_24:
                _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, v34, buf, 0xCu);
              }
              goto LABEL_25;
            }
          }
        }
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      if (v15)
        continue;
      break;
    }
  }
  v19 = 0;
  v31 = 0;
LABEL_26:

  +[CATransaction flush](CATransaction, "flush");
  v35 = share_sheet_log();
  v36 = objc_claimAutoreleasedReturnValue(v35);
  v37 = share_sheet_log();
  v38 = objc_claimAutoreleasedReturnValue(v37);
  v39 = os_signpost_id_make_with_pointer(v38, self);

  if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v36, OS_SIGNPOST_INTERVAL_END, v39, "LoadingProxies", ", buf, 2u);
  }

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetProxyLoader remainingProxies](self, "remainingProxies"));
  objc_msgSend(v40, "removeObjectsInArray:", v51);

  -[SDShareSheetProxyLoader setIsLoading:](self, "setIsLoading:", 0);
  v41 = objc_msgSend(obj, "count");
  if (v41 == objc_msgSend(v51, "count"))
  {
    v42 = 0;
  }
  else
  {
    if (v19)
      v42 = 1;
    else
      v42 = 2;
    if (((v19 | v31) & 1) == 0)
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SDShareSheetProxyLoader.m"), 164, CFSTR("Unexpected timed out state."));

      v42 = 2;
    }
  }
  v43 = objc_alloc_init(SDShareSheetProxyLoaderResult);
  -[SDShareSheetProxyLoaderResult setState:](v43, "setState:", v42);
  -[SDShareSheetProxyLoaderResult setLoadedIndexes:](v43, "setLoadedIndexes:", v50);
  -[SDShareSheetProxyLoaderResult setFailedIndexes:](v43, "setFailedIndexes:", v49);
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetProxyLoader delegate](self, "delegate"));
  objc_msgSend(v44, "proxyLoader:didLoadProxiesWithResult:", self, v43);

}

- (SDShareSheetProxySection)proxySection
{
  return self->_proxySection;
}

- (SDShareSheetProxyLoaderDelegate)delegate
{
  return (SDShareSheetProxyLoaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)loadTimeLimit
{
  return self->_loadTimeLimit;
}

- (void)setLoadTimeLimit:(double)a3
{
  self->_loadTimeLimit = a3;
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (void)setIsLoading:(BOOL)a3
{
  self->_isLoading = a3;
}

- (NSArray)allProxies
{
  return self->_allProxies;
}

- (NSMutableArray)remainingProxies
{
  return self->_remainingProxies;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remainingProxies, 0);
  objc_storeStrong((id *)&self->_allProxies, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_proxySection, 0);
}

@end
