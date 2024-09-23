@implementation FRArticleContentPool

- (FRArticleContentPool)initWithCloudContext:(id)a3 dataProviderFactory:(id)a4
{
  id v7;
  id v8;
  FRArticleContentPool *v9;
  FRArticleContentPool *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *pool;
  NSCountedSet *v13;
  NSCountedSet *interests;
  NSMutableDictionary *v15;
  NSMutableDictionary *accessDates;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)FRArticleContentPool;
  v9 = -[FRArticleContentPool init](&v18, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_dataProviderFactory, a4);
    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pool = v10->_pool;
    v10->_pool = v11;

    v13 = (NSCountedSet *)objc_alloc_init((Class)NSCountedSet);
    interests = v10->_interests;
    v10->_interests = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    accessDates = v10->_accessDates;
    v10->_accessDates = v15;

  }
  return v10;
}

- (void)addInterestInArticleWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  id v10;
  id v11;

  v4 = a3;
  +[NSThread isMainThread](NSThread, "isMainThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleContentPool interests](self, "interests"));
  objc_msgSend(v5, "addObject:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleContentPool accessDates](self, "accessDates"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v6, "setObject:forKey:", v7, v4);

  v8 = -[FRArticleContentPool highWaterMark](self, "highWaterMark");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleContentPool interests](self, "interests"));
  v10 = objc_msgSend(v9, "count");

  if (v8 <= (unint64_t)v10)
    v11 = v10;
  else
    v11 = (id)v8;
  -[FRArticleContentPool setHighWaterMark:](self, "setHighWaterMark:", v11);
}

- (void)removeInterestInArticleWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  +[NSThread isMainThread](NSThread, "isMainThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleContentPool interests](self, "interests"));
  objc_msgSend(v5, "removeObject:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleContentPool accessDates](self, "accessDates"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v6, "setObject:forKey:", v7, v4);

  -[FRArticleContentPool _flushIfNeeded](self, "_flushIfNeeded");
}

- (id)contentForHeadline:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[NSThread isMainThread](NSThread, "isMainThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleContentPool _entryForHeadline:](self, "_entryForHeadline:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "content"));
  return v6;
}

- (void)fetchContentForHeadline:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  _QWORD v9[4];
  id v10;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003AF24;
  v9[3] = &unk_1000DB850;
  v10 = a5;
  v8 = v10;
  -[FRArticleContentPool _fetchEntryForHeadline:completionQueue:completionHandler:](self, "_fetchEntryForHeadline:completionQueue:completionHandler:", a3, a4, v9);

}

- (id)flintDataProviderForHeadline:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[NSThread isMainThread](NSThread, "isMainThread");
  if (objc_msgSend(v4, "contentType") == (id)2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleContentPool _entryForHeadline:](self, "_entryForHeadline:", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "flintDataProvider"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)fetchFlintDataProviderForHeadline:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  _QWORD v9[4];
  id v10;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003B08C;
  v9[3] = &unk_1000DB850;
  v10 = a5;
  v8 = v10;
  -[FRArticleContentPool _fetchEntryForHeadline:completionQueue:completionHandler:](self, "_fetchEntryForHeadline:completionQueue:completionHandler:", a3, a4, v9);

}

- (void)flushContentWithArticleID:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  +[NSThread isMainThread](NSThread, "isMainThread");
  if (v5)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleContentPool pool](self, "pool"));
    objc_msgSend(v4, "removeObjectForKey:", v5);

  }
}

- (id)_entryForHeadline:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  +[NSThread isMainThread](NSThread, "isMainThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "articleID"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleContentPool pool](self, "pool"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "articleID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v7));

    if (!v5)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleContentPool _createEntryForHeadline:](self, "_createEntryForHeadline:", v4));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleContentPool pool](self, "pool"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "articleID"));
      objc_msgSend(v8, "setObject:forKey:", v5, v9);

      -[FRArticleContentPool _flushIfNeeded](self, "_flushIfNeeded");
    }
  }

  return v5;
}

- (void)_fetchEntryForHeadline:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003B328;
  v15[3] = &unk_1000DB878;
  v15[4] = self;
  v16 = v8;
  v18 = (id)objc_claimAutoreleasedReturnValue(-[FRArticleContentPool _createEntryForHeadline:](self, "_createEntryForHeadline:", v8));
  v19 = v10;
  v17 = v9;
  v11 = v18;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  FCPerformBlockOnMainThread(v15);

}

- (id)_createEntryForHeadline:(id)a3
{
  id v4;
  FRArticleContentPoolEntry *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_alloc_init(FRArticleContentPoolEntry);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleContentPool context](self, "context"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentWithContext:", v6));
  -[FRArticleContentPoolEntry setContent:](v5, "setContent:", v7);

  if (objc_msgSend(v4, "contentType") == (id)2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleContentPool dataProviderFactory](self, "dataProviderFactory"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleContentPoolEntry content](v5, "content"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "anfContent"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "flintDataProviderForANFContent:headline:", v10, v4));
    -[FRArticleContentPoolEntry setFlintDataProvider:](v5, "setFlintDataProvider:", v11);

  }
  return v5;
}

- (void)_flushIfNeeded
{
  void *v3;
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  unint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  +[NSThread isMainThread](NSThread, "isMainThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleContentPool pool](self, "pool"));
  v4 = objc_msgSend(v3, "count");
  v5 = -[FRArticleContentPool highWaterMark](self, "highWaterMark");

  if ((unint64_t)v4 > v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleContentPool pool](self, "pool"));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleContentPool interests](self, "interests"));
          v14 = objc_msgSend(v13, "countForObject:", v12);

          if (!v14)
            objc_msgSend(v6, "addObject:", v12);
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10003B804;
    v20[3] = &unk_1000D9C28;
    v20[4] = self;
    objc_msgSend(v6, "sortUsingComparator:", v20);
    while (objc_msgSend(v6, "count"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleContentPool pool](self, "pool"));
      v16 = objc_msgSend(v15, "count");
      v17 = -[FRArticleContentPool highWaterMark](self, "highWaterMark");

      if ((unint64_t)v16 <= v17)
        break;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleContentPool pool](self, "pool"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
      objc_msgSend(v18, "removeObjectForKey:", v19);

      objc_msgSend(v6, "fc_removeFirstObject");
    }

  }
}

- (FCCloudContext)context
{
  return self->_context;
}

- (FRFlintDataProviderFactory)dataProviderFactory
{
  return self->_dataProviderFactory;
}

- (NSMutableDictionary)pool
{
  return self->_pool;
}

- (void)setPool:(id)a3
{
  objc_storeStrong((id *)&self->_pool, a3);
}

- (unint64_t)highWaterMark
{
  return self->_highWaterMark;
}

- (void)setHighWaterMark:(unint64_t)a3
{
  self->_highWaterMark = a3;
}

- (NSCountedSet)interests
{
  return self->_interests;
}

- (void)setInterests:(id)a3
{
  objc_storeStrong((id *)&self->_interests, a3);
}

- (NSMutableDictionary)accessDates
{
  return self->_accessDates;
}

- (void)setAccessDates:(id)a3
{
  objc_storeStrong((id *)&self->_accessDates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessDates, 0);
  objc_storeStrong((id *)&self->_interests, 0);
  objc_storeStrong((id *)&self->_pool, 0);
  objc_storeStrong((id *)&self->_dataProviderFactory, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
