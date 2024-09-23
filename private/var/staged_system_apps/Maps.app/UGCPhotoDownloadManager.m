@implementation UGCPhotoDownloadManager

+ (id)generateRandomizedDownloadTokenForClass:(Class)a3
{
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v3 = NSStringFromClass(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));

  v10[0] = v4;
  v10[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsJoinedByString:", CFSTR(":")));

  return v8;
}

+ (id)sharedDownloadManager
{
  if (qword_1014D2528 != -1)
    dispatch_once(&qword_1014D2528, &stru_1011B5E88);
  return (id)qword_1014D2520;
}

- (UGCPhotoDownloadManager)init
{
  UGCPhotoDownloadManager *v2;
  NSCache *v3;
  NSCache *imageCache;
  NSOperationQueue *v5;
  NSOperationQueue *downloadOperationQueue;
  NSOperationQueue *v7;
  NSOperationQueue *completionOperationQueue;
  dispatch_queue_t v9;
  OS_dispatch_queue *workQueue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UGCPhotoDownloadManager;
  v2 = -[UGCPhotoDownloadManager init](&v12, "init");
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init((Class)NSCache);
    imageCache = v2->_imageCache;
    v2->_imageCache = v3;

    -[NSCache setCountLimit:](v2->_imageCache, "setCountLimit:", GEOConfigGetUInteger(MapsConfig_UGCPhotoDownloadManagerMaximumNumberOfCachedImages, off_1014B4738));
    -[NSCache setTotalCostLimit:](v2->_imageCache, "setTotalCostLimit:", GEOConfigGetUInteger(MapsConfig_UGCPhotoDownloadManagerMaximumNumberOfCachedImages, off_1014B4738));
    v5 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    downloadOperationQueue = v2->_downloadOperationQueue;
    v2->_downloadOperationQueue = v5;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_downloadOperationQueue, "setMaxConcurrentOperationCount:", GEOConfigGetUInteger(MapsConfig_UGCPhotoDownloadManagerMaximumNumberOfActiveDownloadTasks, off_1014B4748));
    v7 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    completionOperationQueue = v2->_completionOperationQueue;
    v2->_completionOperationQueue = v7;

    v9 = dispatch_queue_create("com.apple.Maps.UGCPhotoDownloadManager", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v9;

  }
  return v2;
}

- (void)fetchImageForPhotoInfo:(id)a3 downloadToken:(id)a4 completion:(id)a5
{
  -[UGCPhotoDownloadManager fetchImageForPhotoInfo:callerIdentifier:callbackQueue:completion:](self, "fetchImageForPhotoInfo:callerIdentifier:callbackQueue:completion:", a3, a4, &_dispatch_main_q, a5);
}

- (void)fetchImageForPhotoInfo:(id)a3 callerIdentifier:(id)a4 callbackQueue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *workQueue;
  const char *v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "url"));

  if (!v14)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      goto LABEL_6;
    *(_WORD *)buf = 0;
    v16 = "Assertion failed: downloadablePhotoInfo.url != ((void *)0)";
LABEL_15:
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, v16, buf, 2u);
    goto LABEL_6;
  }
  if (!objc_msgSend(v11, "length"))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      goto LABEL_6;
    *(_WORD *)buf = 0;
    v16 = "Assertion failed: callerIdentifier.length > 0";
    goto LABEL_15;
  }
  if (!v12)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      goto LABEL_6;
    *(_WORD *)buf = 0;
    v16 = "Assertion failed: callbackQueue != ((void *)0)";
    goto LABEL_15;
  }
  if (!v13)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      goto LABEL_6;
    *(_WORD *)buf = 0;
    v16 = "Assertion failed: completion != ((void *)0)";
    goto LABEL_15;
  }
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100425E38;
  block[3] = &unk_1011B5F28;
  block[4] = self;
  v18 = v10;
  v19 = v12;
  v21 = v13;
  v20 = v11;
  dispatch_async(workQueue, block);

LABEL_6:
}

- (void)cancelRequestForPhotoInfo:(id)a3 downloadToken:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *workQueue;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  uint8_t buf[8];
  id v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "length"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "downloadIdentifier"));
    *(_QWORD *)buf = CFSTR("DOWNLOAD_COMPLETION");
    v19 = v7;
    v20 = v8;
    v9 = v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", buf, 3));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "componentsJoinedByString:", CFSTR("_")));
    workQueue = self->_workQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1004269A8;
    v14[3] = &unk_1011AF1B0;
    v14[4] = self;
    v15 = v6;
    v16 = v9;
    v17 = v11;
    v13 = v11;
    dispatch_async(workQueue, v14);

  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: downloadToken.length > 0", buf, 2u);
  }

}

- (id)_currentDownloadOperationForPhotoInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _QWORD v22[2];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "downloadIdentifier"));
  v22[0] = CFSTR("DOWNLOAD_OPERATION");
  v22[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", CFSTR("_")));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue operations](self->_downloadOperationQueue, "operations"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name", (_QWORD)v17));
        v15 = objc_msgSend(v14, "isEqualToString:", v7);

        if ((v15 & 1) != 0)
        {
          v10 = v13;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  return v10;
}

- (id)_completionOperationForPhotoInfo:(id)a3 downloadToken:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _QWORD v26[3];

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "downloadIdentifier"));
  v26[0] = CFSTR("DOWNLOAD_COMPLETION");
  v26[1] = v7;
  v26[2] = v8;
  v9 = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 3));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "componentsJoinedByString:", CFSTR("_")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue operations](self->_completionOperationQueue, "operations"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name", (_QWORD)v21));
        v19 = objc_msgSend(v18, "isEqualToString:", v11);

        if ((v19 & 1) != 0)
        {
          v14 = v17;
          goto LABEL_11;
        }
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v14)
        continue;
      break;
    }
  }
LABEL_11:

  return v14;
}

- (BOOL)_canCancelDownloadOperation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  unsigned __int8 v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  if (v4)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue operations](self->_completionOperationQueue, "operations"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "dependencies", (_QWORD)v15));
          v12 = objc_msgSend(v11, "containsObject:", v4);

          if ((v12 & 1) != 0)
          {
            v13 = 0;
            goto LABEL_12;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          continue;
        break;
      }
    }
    v13 = 1;
LABEL_12:

  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (void)_updateCacheWithImage:(id)a3 forDownloadIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  const char *v10;
  int v11;
  id v12;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (!v6)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      goto LABEL_6;
    LOWORD(v11) = 0;
    v10 = "Assertion failed: image != ((void *)0)";
LABEL_11:
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, v10, (uint8_t *)&v11, 2u);
    goto LABEL_6;
  }
  if (!objc_msgSend(v7, "length"))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      goto LABEL_6;
    LOWORD(v11) = 0;
    v10 = "Assertion failed: downloadIdentifier.length > 0";
    goto LABEL_11;
  }
  v8 = sub_10043317C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v11 = 138412290;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Adding image %@ to cache", (uint8_t *)&v11, 0xCu);
  }

  -[NSCache setObject:forKey:cost:](self->_imageCache, "setObject:forKey:cost:", v6, v7, 1);
LABEL_6:

}

- (id)_cachedImageForDownloadIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (objc_msgSend(v4, "length"))
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSCache objectForKey:](self->_imageCache, "objectForKey:", v4));
  else
    v5 = 0;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionOperationQueue, 0);
  objc_storeStrong((id *)&self->_downloadOperationQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
}

@end
