@implementation AEPdfCache

+ (id)sharedInstance
{
  if (qword_20F588 != -1)
    dispatch_once(&qword_20F588, &stru_1C0DC8);
  return (id)qword_20F590;
}

- (AEPdfCache)init
{
  AEPdfCache *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *urlToDocumentCache;
  NSMutableDictionary *v5;
  NSMutableDictionary *urlToStringCache;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_global_t global_queue;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *cacheQueue;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AEPdfCache;
  v2 = -[AEPdfCache init](&v15, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    urlToDocumentCache = v2->_urlToDocumentCache;
    v2->_urlToDocumentCache = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    urlToStringCache = v2->_urlToStringCache;
    v2->_urlToStringCache = v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    global_queue = dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue(global_queue);
    v11 = dispatch_queue_create_with_target_V2("com.apple.iBooks.pdfCacheQueue", v8, v10);
    cacheQueue = v2->_cacheQueue;
    v2->_cacheQueue = (OS_dispatch_queue *)v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v13, "addObserver:selector:name:object:", v2, "didReceiveMemoryWarning:", UIApplicationDidReceiveMemoryWarningNotification, 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AEPdfCache;
  -[AEPdfCache dealloc](&v4, "dealloc");
}

- (void)clearNativeObjectCache
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[AEPdfCache cacheQueue](self, "cacheQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_93A34;
  block[3] = &unk_1BEA38;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (id)copyCacheObjectForBook:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  NSObject *v14;
  _QWORD block[5];
  id v17;
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url"));
  v6 = -[AEPdfCache copyCacheObjectForURL:](self, "copyCacheObjectForURL:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "password"));
  if (!objc_msgSend(v7, "length"))
  {
LABEL_7:

    goto LABEL_8;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "isPasswordRequired"));
  v9 = objc_msgSend(v8, "BOOLValue");

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "document"));
    if (!objc_msgSend(v11, "isLocked")
      || (v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "password")),
          v13 = objc_msgSend(v11, "unlockWithPassword:", v12),
          v12,
          v13))
    {
      v14 = objc_claimAutoreleasedReturnValue(-[AEPdfCache cacheQueue](self, "cacheQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_93BE4;
      block[3] = &unk_1C00A8;
      block[4] = self;
      v17 = v7;
      v18 = v4;
      dispatch_sync(v14, block);

    }
    goto LABEL_7;
  }
LABEL_8:

  return v6;
}

- (id)copyCacheObjectForPdfPath:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  AEPdfCacheObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  AEPdfCache *v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _QWORD v28[5];
  id v29;
  uint64_t *v30;
  _QWORD block[5];
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v4 = a3;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_93F40;
  v38 = sub_93F50;
  v39 = 0;
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[AEPdfCache cacheQueue](self, "cacheQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_93F58;
    block[3] = &unk_1C0CE8;
    v33 = &v34;
    block[4] = self;
    v6 = v4;
    v32 = v6;
    dispatch_sync(v5, block);

    if (!v35[5])
    {
      -[AEPdfCache clearNativeObjectCache](self, "clearNativeObjectCache");
      v7 = objc_msgSend(objc_alloc((Class)NSURL), "initFileURLWithPath:isDirectory:", v6, 0);
      v8 = objc_msgSend(objc_alloc((Class)PDFDocument), "initWithURL:", v7);
      if (v8)
      {
        v9 = -[AEPdfCacheObject initWithPdfDocument:]([AEPdfCacheObject alloc], "initWithPdfDocument:", v8);
        v10 = (void *)v35[5];
        v35[5] = (uint64_t)v9;

        if (v35[5])
        {
          v11 = objc_claimAutoreleasedReturnValue(-[AEPdfCache cacheQueue](self, "cacheQueue"));
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472;
          v28[2] = sub_93FB0;
          v28[3] = &unk_1C0DF0;
          v28[4] = self;
          v30 = &v34;
          v29 = v6;
          dispatch_sync(v11, v28);

        }
        if (objc_msgSend(v8, "isLocked"))
        {
          v22 = 0;
          v23 = &v22;
          v24 = 0x3032000000;
          v25 = sub_93F40;
          v26 = sub_93F50;
          v27 = 0;
          v12 = objc_claimAutoreleasedReturnValue(-[AEPdfCache cacheQueue](self, "cacheQueue"));
          v15 = _NSConcreteStackBlock;
          v16 = 3221225472;
          v17 = sub_93FF8;
          v18 = &unk_1C0CE8;
          v21 = &v22;
          v19 = self;
          v20 = v6;
          dispatch_sync(v12, &v15);

          if (v23[5])
            objc_msgSend(v8, "unlockWithPassword:", v15, v16, v17, v18, v19);

          _Block_object_dispose(&v22, 8);
        }
      }

    }
  }
  v13 = (id)v35[5];
  _Block_object_dispose(&v34, 8);

  return v13;
}

- (id)canonicalPathFromURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if ((objc_msgSend(v3, "isFileURL") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByStandardizingPath"));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "absoluteURL"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByStandardizingPath"));

  }
  return v5;
}

- (id)copyCacheObjectForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEPdfCache canonicalPathFromURL:](self, "canonicalPathFromURL:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pathExtension"));
  if (objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("pdf")))
    v8 = 0;
  else
    v8 = -[AEPdfCache copyCacheObjectForPdfPath:](self, "copyCacheObjectForPdfPath:", v5);

  return v8;
}

- (BOOL)hasCachedObjectForURL:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  char v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEPdfCache canonicalPathFromURL:](self, "canonicalPathFromURL:", v4));
  if (objc_msgSend(v5, "length"))
  {
    v6 = objc_claimAutoreleasedReturnValue(-[AEPdfCache cacheQueue](self, "cacheQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_9428C;
    block[3] = &unk_1C0CE8;
    v11 = &v12;
    block[4] = self;
    v10 = v5;
    dispatch_sync(v6, block);

  }
  v7 = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)removeCacheObjectForURL:(id)a3
{
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[AEPdfCache canonicalPathFromURL:](self, "canonicalPathFromURL:", a3));
  if (objc_msgSend(v5, "length"))
  {
    v4 = objc_claimAutoreleasedReturnValue(-[AEPdfCache cacheQueue](self, "cacheQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_94388;
    block[3] = &unk_1BFDB8;
    block[4] = self;
    v7 = v5;
    dispatch_sync(v4, block);

  }
}

- (NSMutableDictionary)urlToStringCache
{
  return self->_urlToStringCache;
}

- (void)setUrlToStringCache:(id)a3
{
  objc_storeStrong((id *)&self->_urlToStringCache, a3);
}

- (NSMutableDictionary)urlToDocumentCache
{
  return self->_urlToDocumentCache;
}

- (void)setUrlToDocumentCache:(id)a3
{
  objc_storeStrong((id *)&self->_urlToDocumentCache, a3);
}

- (OS_dispatch_queue)cacheQueue
{
  return self->_cacheQueue;
}

- (void)setCacheQueue:(id)a3
{
  objc_storeStrong((id *)&self->_cacheQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheQueue, 0);
  objc_storeStrong((id *)&self->_urlToDocumentCache, 0);
  objc_storeStrong((id *)&self->_urlToStringCache, 0);
}

@end
