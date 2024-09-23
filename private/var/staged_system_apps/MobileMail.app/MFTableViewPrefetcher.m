@implementation MFTableViewPrefetcher

- (MFTableViewPrefetcher)initWithPrefetchProvider:(id)a3 maxConcurrentOperationCount:(unint64_t)a4
{
  id v8;
  MFTableViewPrefetcher *v9;
  MFTableViewPrefetcher *v10;
  NSOperationQueue *v11;
  NSOperationQueue *operationQueue;
  void *v14;
  objc_super v15;

  v8 = a3;
  if (!v8)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFTableViewPrefetcher.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("prefetchProvider"));

  }
  v15.receiver = self;
  v15.super_class = (Class)MFTableViewPrefetcher;
  v9 = -[MFTableViewPrefetcher init](&v15, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_prefetchProvider, a3);
    v11 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v10->_operationQueue;
    v10->_operationQueue = v11;

    -[NSOperationQueue setQualityOfService:](v10->_operationQueue, "setQualityOfService:", 25);
    -[NSOperationQueue setMaxConcurrentOperationCount:](v10->_operationQueue, "setMaxConcurrentOperationCount:", a4);
  }

  return v10;
}

- (MFTableViewPrefetcher)initWithPrefetchProvider:(id)a3
{
  return -[MFTableViewPrefetcher initWithPrefetchProvider:maxConcurrentOperationCount:](self, "initWithPrefetchProvider:maxConcurrentOperationCount:", a3, 4);
}

- (void)tableView:(id)a3 prefetchRowsAtIndexPaths:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = a4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFTableViewPrefetcher prefetchProvider](self, "prefetchProvider", (_QWORD)v13));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tableViewPrefetcher:prefetchOperationAtIndexPath:", self, v9));

        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFTableViewPrefetcher operationQueue](self, "operationQueue"));
          objc_msgSend(v12, "addOperation:", v11);

        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (void)tableView:(id)a3 cancelPrefetchingForRowsAtIndexPaths:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = objc_msgSend(a4, "mutableCopy", a3);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFTableViewPrefetcher operationQueue](self, "operationQueue", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "operations"));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "indexPath"));
        if (objc_msgSend(v5, "containsObject:", v12))
        {
          objc_msgSend(v11, "cancel");
          objc_msgSend(v5, "removeObject:", v12);
          if (!objc_msgSend(v5, "count"))
          {

            goto LABEL_12;
          }
        }

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_12:

}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (MFTableViewPrefetchProvider)prefetchProvider
{
  return self->_prefetchProvider;
}

- (void)setPrefetchProvider:(id)a3
{
  objc_storeStrong((id *)&self->_prefetchProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefetchProvider, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

@end
