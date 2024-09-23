@implementation VIAEventCache

- (VIAEventCache)initWithQueue:(id)a3
{
  id v5;
  VIAEventCache *v6;
  VIAEventCache *v7;
  uint64_t v8;
  NSMutableDictionary *appToEventMap;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VIAEventCache;
  v6 = -[VIAEventCache init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = objc_opt_new();
    appToEventMap = v7->_appToEventMap;
    v7->_appToEventMap = (NSMutableDictionary *)v8;

  }
  return v7;
}

- (void)cacheEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSMutableDictionary *appToEventMap;
  void *v21;
  id WeakRetained;
  id v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v4, "originatingApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VIAEventCache _cachedEventsForBundleID:](self, "_cachedEventsForBundleID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "queryID"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v9, "mutableCopy");

    if (!v10)
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v10, "addObject:", v4);
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "queryID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, v12);

    v13 = v6;
    if ((unint64_t)objc_msgSend(v13, "count") >= 0x65)
    {
      objc_msgSend(v13, "allKeys");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sortedArrayUsingSelector:", sel_compare_);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
        objc_msgSend(v13, "removeObjectForKey:", v16);

    }
  }
  else
  {
    v29 = v4;
    v30 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "mutableCopy");
    appToEventMap = self->_appToEventMap;
    objc_msgSend(v4, "originatingApplication");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](appToEventMap, "setObject:forKeyedSubscript:", v19, v21);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_testingDelegate);

  if (WeakRetained)
  {
    v23 = objc_loadWeakRetained((id *)&self->_testingDelegate);
    objc_msgSend(v4, "feedback");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originatingApplication");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[VIAEventCache _cachedEventsForBundleID:](self, "_cachedEventsForBundleID:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "didCacheEventName:currentCacheSize:", v26, objc_msgSend(v28, "count"));

  }
}

- (id)cachedEventForBundleID:(id)a3 queryID:(unint64_t)a4
{
  NSObject *queue;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  queue = self->_queue;
  v7 = a3;
  dispatch_assert_queue_V2(queue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_appToEventMap, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  return v11;
}

- (id)_cachedEventsForBundleID:(id)a3
{
  NSObject *queue;
  id v5;
  void *v6;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_appToEventMap, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (VIAnalyticsTestingDelegate)testingDelegate
{
  return (VIAnalyticsTestingDelegate *)objc_loadWeakRetained((id *)&self->_testingDelegate);
}

- (void)setTestingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_testingDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_testingDelegate);
  objc_storeStrong((id *)&self->_appToEventMap, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
