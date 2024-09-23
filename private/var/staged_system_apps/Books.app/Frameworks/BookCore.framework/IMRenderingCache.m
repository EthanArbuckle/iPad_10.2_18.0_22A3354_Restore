@implementation IMRenderingCache

- (IMRenderingCache)initWithIdentifier:(id)a3 memorySize:(int64_t)a4
{
  id v6;
  IMRenderingCache *v7;
  void *v8;
  NSOperationQueue *v9;
  NSOperationQueue *writeQueue;
  NSString *v11;
  NSString *identifier;
  void *v13;
  void *v14;
  id v15;
  unsigned __int8 v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  IMMemoryCache *v24;
  IMMemoryCache *memoryCache;
  void *v26;
  double v27;
  BOOL v28;
  id v30;
  objc_super v31;

  v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)IMRenderingCache;
  v7 = -[IMRenderingCache init](&v31, "init");
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, "imRenderingCacheDidReceiveMemoryWarning:", UIApplicationDidReceiveMemoryWarningNotification, 0);

    v7->_primaryImageSize = CGSizeZero;
    v9 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    writeQueue = v7->_writeQueue;
    v7->_writeQueue = v9;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v7->_writeQueue, "setMaxConcurrentOperationCount:", 1);
    v11 = (NSString *)objc_msgSend(v6, "copy");
    identifier = v7->_identifier;
    v7->_identifier = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[IMRenderingCache _persistentCacheFileName](v7, "_persistentCacheFileName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[IMRenderingCache cacheDirectory](v7, "cacheDirectory"));
    v15 = objc_alloc_init((Class)NSFileManager);
    v30 = 0;
    v16 = objc_msgSend(v15, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v14, 1, 0, &v30);
    v17 = v30;
    v18 = v17;
    if ((v16 & 1) == 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedDescription"));
      +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("Could not create cacheDirectory %@ [Error: %@]"), v14, v19);

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingPathComponent:", v13));
    -[IMRenderingCache setPersistentCachePath:](v7, "setPersistentCachePath:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[IMPersistentCacheManager sharedInstance](IMPersistentCacheManager, "sharedInstance"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[IMRenderingCache persistentCachePath](v7, "persistentCachePath"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "cacheForPath:maxSize:", v22, 0));

    if (a4 >= 1)
    {
      v24 = objc_alloc_init(IMMemoryCache);
      memoryCache = v7->_memoryCache;
      v7->_memoryCache = v24;

      -[IMMemoryCache setTotalCostLimit:](v7->_memoryCache, "setTotalCostLimit:", a4);
    }
    if ((+[UIScreen instancesRespondToSelector:](UIScreen, "instancesRespondToSelector:", "scale") & 1) != 0)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v26, "scale");
      v7->_scale = v27;

      v28 = v7->_scale != 1.0;
    }
    else
    {
      v28 = 0;
      v7->_scale = 1.0;
    }
    v7->_scaleNeeded = v28;

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  NSOperationQueue *renderQueue;
  NSOperationQueue *writeQueue;
  void *v6;
  void *v7;
  IMMemoryCache *memoryCache;
  NSString *identifier;
  objc_super v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  -[IMRenderingCache cancelRenderingCacheOperations](self, "cancelRenderingCacheOperations");
  -[NSOperationQueue cancelAllOperations](self->_renderQueue, "cancelAllOperations");
  -[NSOperationQueue removeObserver:forKeyPath:context:](self->_renderQueue, "removeObserver:forKeyPath:context:", self, CFSTR("operations"), &off_309ED8);
  renderQueue = self->_renderQueue;
  self->_renderQueue = 0;

  -[NSOperationQueue cancelAllOperations](self->_writeQueue, "cancelAllOperations");
  writeQueue = self->_writeQueue;
  self->_writeQueue = 0;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMPersistentCacheManager sharedInstance](IMPersistentCacheManager, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMRenderingCache persistentCachePath](self, "persistentCachePath"));
  objc_msgSend(v6, "purgeFromCache:", v7);

  memoryCache = self->_memoryCache;
  self->_memoryCache = 0;

  identifier = self->_identifier;
  self->_identifier = 0;

  v10.receiver = self;
  v10.super_class = (Class)IMRenderingCache;
  -[IMRenderingCache dealloc](&v10, "dealloc");
}

- (void)imRenderingCacheDidReceiveMemoryWarning:(id)a3
{
  -[NSOperationQueue cancelAllOperations](self->_writeQueue, "cancelAllOperations", a3);
  -[IMMemoryCache removeAllObjects](self->_memoryCache, "removeAllObjects");
}

- (CGSize)scaleAdjustedImageSize:(CGSize)result
{
  double scale;

  if (self->_scaleNeeded)
  {
    scale = self->_scale;
    result.width = result.width * scale;
    result.height = result.height * scale;
  }
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  id v8;

  if (a6 == &off_309ED8)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue operations](self->_renderQueue, "operations", a3, a4, a5));
    v8 = objc_msgSend(v7, "count");

    if (!v8)
      -[IMRenderingCache renderQueuesEmptied](self, "renderQueuesEmptied");
  }
}

- (id)renderQueue
{
  NSOperationQueue *renderQueue;
  NSOperationQueue *v4;
  NSOperationQueue *v5;

  renderQueue = self->_renderQueue;
  if (!renderQueue)
  {
    v4 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    v5 = self->_renderQueue;
    self->_renderQueue = v4;

    -[NSOperationQueue setMaxConcurrentOperationCount:](self->_renderQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue addObserver:forKeyPath:options:context:](self->_renderQueue, "addObserver:forKeyPath:options:context:", self, CFSTR("operations"), 0, &off_309ED8);
    renderQueue = self->_renderQueue;
  }
  return renderQueue;
}

- (void)suspend
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[IMRenderingCache renderQueue](self, "renderQueue"));
  objc_msgSend(v2, "setSuspended:", 1);

}

- (void)resume
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[IMRenderingCache renderQueue](self, "renderQueue"));
  objc_msgSend(v2, "setSuspended:", 0);

}

- (void)clear
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[IMRenderingCache cancelRenderingCacheOperations](self, "cancelRenderingCacheOperations");
  -[IMMemoryCache removeAllObjects](self->_memoryCache, "removeAllObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMPersistentCacheManager sharedInstance](IMPersistentCacheManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMRenderingCache persistentCachePath](self, "persistentCachePath"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cacheForPath:maxSize:", v4, 0));

  objc_msgSend(v7, "clear");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMPersistentCacheManager sharedInstance](IMPersistentCacheManager, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMRenderingCache persistentCachePath](self, "persistentCachePath"));
  objc_msgSend(v5, "purgeFromCache:", v6);

}

- (void)cancelRenderingCacheOperationsInQueue:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "operations"));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7);
        v9 = objc_opt_class(IMRenderingCacheOperation);
        if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
        {
          objc_msgSend(v8, "setImageCache:", 0);
          objc_msgSend(v8, "setTarget:", 0);
          objc_msgSend(v8, "setContext:", 0);
          objc_msgSend(v8, "cancel");
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)cancelRenderingCacheOperationsInQueue:(id)a3 forTarget:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "operations"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v13);
        v15 = objc_opt_class(IMRenderingCacheOperation);
        if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
        {
          v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "target"));
          if (v16 == v7)
          {
            v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "context"));

            if (v17 == v8)
            {
              objc_msgSend(v14, "setTarget:", 0);
              objc_msgSend(v14, "setContext:", 0);
              objc_msgSend(v14, "cancel");
            }
          }
          else
          {

          }
        }
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

}

- (void)cancelRenderingCacheOperationsInQueue:(id)a3 forTarget:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "operations"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10);
        v12 = objc_opt_class(IMRenderingCacheOperation);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
        {
          v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "target"));

          if (v13 == v5)
          {
            objc_msgSend(v11, "setTarget:", 0);
            objc_msgSend(v11, "setContext:", 0);
            objc_msgSend(v11, "cancel");
          }
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (id)findRenderingCacheOperationInQueue:(id)a3 withStorageKey:(id)a4 target:(id)a5 selector:(SEL)a6 context:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  unsigned __int8 v22;
  id v23;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v25 = a4;
  v11 = a5;
  v26 = a7;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "operations"));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (!v13)
    goto LABEL_18;
  v14 = v13;
  v15 = *(_QWORD *)v28;
  do
  {
    v16 = 0;
    do
    {
      if (*(_QWORD *)v28 != v15)
        objc_enumerationMutation(v12);
      v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v16);
      v18 = objc_opt_class(IMRenderingCacheOperation);
      if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
      {
        v19 = v17;
        v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "target"));
        if (v20 == v11 && objc_msgSend(v19, "selector") == a6)
        {
          v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "context"));

          if (v21 == v26)
          {
            v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "storageKey"));
            if (!objc_msgSend(v20, "isEqualToString:", v25))
              goto LABEL_9;
            v22 = objc_msgSend(v19, "isCancelled");

            if ((v22 & 1) == 0)
              goto LABEL_19;
          }
        }
        else
        {
LABEL_9:

        }
      }
      v16 = (char *)v16 + 1;
    }
    while (v14 != v16);
    v23 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    v14 = v23;
  }
  while (v23);
LABEL_18:
  v19 = 0;
LABEL_19:

  return v19;
}

- (id)renderingCacheOperationsForSize:(CGSize)a3
{
  double height;
  double width;
  NSOperationQueue *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  double v15;
  double v16;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  height = a3.height;
  width = a3.width;
  v5 = self->_renderQueue;
  v6 = objc_alloc_init((Class)NSMutableArray);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue operations](v5, "operations"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v11);
        v13 = objc_opt_class(IMRenderingCacheOperation);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0 && (objc_msgSend(v12, "isCancelled") & 1) == 0)
        {
          v14 = v12;
          objc_msgSend(v14, "desiredSize");
          if (v16 == width && v15 == height)
            objc_msgSend(v6, "addObject:", v14);

        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  return v6;
}

- (void)cancelRenderingCacheOperations
{
  -[IMRenderingCache cancelRenderingCacheOperationsInQueue:](self, "cancelRenderingCacheOperationsInQueue:", self->_renderQueue);
}

- (void)cancelRenderingCacheOperationsForTarget:(id)a3 context:(id)a4
{
  -[IMRenderingCache cancelRenderingCacheOperationsInQueue:forTarget:context:](self, "cancelRenderingCacheOperationsInQueue:forTarget:context:", self->_renderQueue, a3, a4);
}

- (void)cancelRenderingCacheOperationsForTarget:(id)a3
{
  -[IMRenderingCache cancelRenderingCacheOperationsInQueue:forTarget:](self, "cancelRenderingCacheOperationsInQueue:forTarget:", self->_renderQueue, a3);
}

- (void)enqueueRenderingCacheOperation:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  id v8;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "desiredSize");
    v6 = v5;
    -[IMRenderingCache primaryImageSize](self, "primaryImageSize");
    objc_msgSend(v4, "setThreadPriority:", dbl_26A940[v6 < v7]);
    v8 = (id)objc_claimAutoreleasedReturnValue(-[IMRenderingCache renderQueue](self, "renderQueue"));
    objc_msgSend(v8, "addOperation:", v4);

  }
}

- (id)findRenderingCacheOperationWithStorageKey:(id)a3 target:(id)a4 selector:(SEL)a5 context:(id)a6
{
  return -[IMRenderingCache findRenderingCacheOperationInQueue:withStorageKey:target:selector:context:](self, "findRenderingCacheOperationInQueue:withStorageKey:target:selector:context:", self->_renderQueue, a3, a4, a5, a6);
}

- (SEL)selectorForTarget:(id)a3
{
  if (!a3)
    return 0;
  if ((objc_opt_respondsToSelector(a3, "renderingCacheCallbackImage:context:pageNumber:") & 1) != 0)
    return "renderingCacheCallbackImage:context:pageNumber:";
  return "renderingCacheCallbackImage:context:";
}

- (id)keyPrefixForPage:(int64_t)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("p%08lu"), a3);
}

- (id)keyForAssetID:(id)a3 prefix:(id)a4 size:(CGSize)a5
{
  double height;
  double width;
  id v8;
  __CFString *v9;
  __CFString *v10;
  NSString *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;

  height = a5.height;
  width = a5.width;
  v8 = a3;
  v9 = (__CFString *)a4;
  if (v9)
    v10 = v9;
  else
    v10 = &stru_296430;
  if (width == CGSizeZero.width && height == CGSizeZero.height)
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@;%@"), v10, v8, v15, v16);
  else
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@;%@;%06dx%06d"),
            v10,
            v8,
            (int)width,
            (int)height);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  return v13;
}

- (int)serializeFormat
{
  return 1;
}

- (int64_t)cacheVersion
{
  return 20210721;
}

- (id)cachePrefix
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(self, a2);
  return NSStringFromClass(v2);
}

- (id)cacheDirectory
{
  NSArray *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMRenderingCache cachePrefix](self, "cachePrefix"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", v6));

  return v7;
}

- (id)persistentCacheFileName
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ic-%@"), self->_identifier);
}

- (id)_persistentCacheFileName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMRenderingCache persistentCacheFileName](self, "persistentCacheFileName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[IMRenderingCache cacheVersion](self, "cacheVersion")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "systemVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@-%@.cache"), v3, v4, v6));

  return v7;
}

- (void)storeImage:(id)a3 forKey:(id)a4 size:(CGSize)a5 format:(int)a6
{
  uint64_t v6;
  id v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  IMRenderingCacheWriteOperation *v15;
  void *v16;
  IMRenderingCacheWriteOperation *v17;
  id v18;

  v6 = *(_QWORD *)&a6;
  v18 = a3;
  v9 = a4;
  if (v18)
  {
    if (objc_msgSend(v9, "length"))
    {
      objc_msgSend(v18, "size");
      v11 = v10;
      objc_msgSend(v18, "size");
      -[IMMemoryCache setObject:forKey:cost:](self->_memoryCache, "setObject:forKey:cost:", v18, v9, (unint64_t)(v11 * v12 + v11 * v12));
      if ((_DWORD)v6 != -1)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[IMRenderingCache persistentCachePath](self, "persistentCachePath"));
        v14 = objc_msgSend(v13, "length");

        if (v14)
        {
          v15 = [IMRenderingCacheWriteOperation alloc];
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[IMRenderingCache persistentCachePath](self, "persistentCachePath"));
          v17 = -[IMRenderingCacheWriteOperation initWithImage:key:format:persistentCachePath:](v15, "initWithImage:key:format:persistentCachePath:", v18, v9, v6, v16);

          if (+[NSThread isMainThread](NSThread, "isMainThread"))
          {
            -[IMRenderingCacheWriteOperation setThreadPriority:](v17, "setThreadPriority:", 0.2);
            -[NSOperationQueue addOperation:](self->_writeQueue, "addOperation:", v17);
          }
          else
          {
            -[IMRenderingCacheWriteOperation start](v17, "start");
          }

        }
      }
    }
  }

}

- (BOOL)hasImageForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMPersistentCacheManager sharedInstance](IMPersistentCacheManager, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMRenderingCache persistentCachePath](self, "persistentCachePath"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cacheForPath:maxSize:", v6, 0));

  LOBYTE(v5) = objc_msgSend(v7, "hasItemForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[IMPersistentCacheManager sharedInstance](IMPersistentCacheManager, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMRenderingCache persistentCachePath](self, "persistentCachePath"));
  objc_msgSend(v8, "purgeFromCache:", v9);

  return (char)v5;
}

- (id)fetchImageForAssetID:(id)a3 prefix:(id)a4 size:(CGSize)a5
{
  void *v6;
  void *v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMRenderingCache keyForAssetID:prefix:size:](self, "keyForAssetID:prefix:size:", a3, a4, a5.width, a5.height));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMRenderingCache fetchImageForKey:](self, "fetchImageForKey:", v6));

  return v7;
}

- (id)fetchImageForKey:(id)a3 canAcceptSurfaceBacked:(BOOL)a4
{
  id v6;
  void *v7;
  Class v8;
  void *v9;
  void *v10;
  void *v11;
  CGImage *v12;
  CGImage *v13;
  void *v14;
  void *v15;
  uint64_t v17;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMMemoryCache objectForKey:](self->_memoryCache, "objectForKey:", v6));
  if (a4 || (v8 = NSClassFromString(CFSTR("SurfaceBackedUIImage")), (objc_opt_isKindOfClass(v7, v8) & 1) == 0))
  {
    if (v7)
      goto LABEL_10;
  }
  else
  {

  }
  v17 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMPersistentCacheManager sharedInstance](IMPersistentCacheManager, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IMRenderingCache persistentCachePath](self, "persistentCachePath"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cacheForPath:maxSize:", v10, 0));

  v12 = (CGImage *)objc_msgSend(v11, "copyCGImageForKey:resourceSize:", v6, &v17);
  if (v12)
  {
    v13 = v12;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", v12));
    CGImageRelease(v13);
    if (v7)
      -[IMMemoryCache setObject:forKey:cost:](self->_memoryCache, "setObject:forKey:cost:", v7, v6, v17);
  }
  else
  {
    v7 = 0;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[IMPersistentCacheManager sharedInstance](IMPersistentCacheManager, "sharedInstance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[IMRenderingCache persistentCachePath](self, "persistentCachePath"));
  objc_msgSend(v14, "purgeFromCache:", v15);

LABEL_10:
  return v7;
}

- (id)fetchImageForKey:(id)a3
{
  return -[IMRenderingCache fetchImageForKey:canAcceptSurfaceBacked:](self, "fetchImageForKey:canAcceptSurfaceBacked:", a3, 1);
}

- (CGSize)primaryImageSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_primaryImageSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setPrimaryImageSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_primaryImageSize, &v3, 16, 1, 0);
}

- (NSString)persistentCachePath
{
  return self->_persistentCachePath;
}

- (void)setPersistentCachePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (IMMemoryCache)memoryCache
{
  return self->_memoryCache;
}

- (void)setMemoryCache:(id)a3
{
  objc_storeStrong((id *)&self->_memoryCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryCache, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_persistentCachePath, 0);
  objc_storeStrong((id *)&self->_writeQueue, 0);
  objc_storeStrong((id *)&self->_renderQueue, 0);
}

@end
