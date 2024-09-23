@implementation FRSpotlightManager

- (void)createSpotlightDirectoryIfNeeded
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  unsigned __int8 v8;
  id v9;
  unsigned __int8 v10;
  id v11;
  id v12;
  char v13;

  v3 = objc_msgSend((id)objc_opt_class(self, a2), "_spotlightFolder");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v13 = 0;
  if (objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v5, &v13))
  {
    if (v13)
      goto LABEL_6;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100083B00();
    if (v13)
    {
LABEL_6:
      v7 = 0;
      goto LABEL_16;
    }
    v12 = 0;
    v8 = objc_msgSend(v6, "removeItemAtPath:error:", v5, &v12);
    v9 = v12;
    if ((v8 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100083A30();

  }
  v11 = 0;
  v10 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v11);
  v7 = v11;
  if ((v10 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100083980();
      if (!v7)
        goto LABEL_16;
    }
    else if (!v7)
    {
      goto LABEL_16;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100083904((uint64_t)v5);
  }
LABEL_16:
  if (!-[FRSpotlightManager addSkipBackupAttributeToItemAtPath:](self, "addSkipBackupAttributeToItemAtPath:", v5)
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100083854();
  }

}

- (BOOL)addSkipBackupAttributeToItemAtPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned __int8 v8;
  id v9;
  id v11;

  v3 = a3;
  if (!v3)
    goto LABEL_8;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v3, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
  v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

  if (!v7)
  {

LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  v11 = 0;
  v8 = objc_msgSend(v4, "setResourceValue:forKey:error:", &__kCFBooleanTrue, NSURLIsExcludedFromBackupKey, &v11);
  v9 = v11;
  if ((v8 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100083BB0(v4);

LABEL_9:
  return v8;
}

- (FRSpotlightManager)initWithCloudContext:(id)a3
{
  id v4;
  FRSpotlightManager *v5;
  void *v6;
  void *v7;
  void *v8;
  FCReadingList *readingList;
  id v10;
  FCSubscriptionController *subscriptionController;
  id v12;
  FCReadingHistory *readingHistory;
  id v14;
  uint64_t v15;
  FCArticleController *articleController;
  uint64_t v17;
  id v18;
  NSObject *v19;
  FRSpotlightManager *v20;
  FRSpotlightManager *v21;
  _QWORD block[4];
  FRSpotlightManager *v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)FRSpotlightManager;
  v5 = -[FRSpotlightManager init](&v25, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subscriptionController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "readingHistory"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "readingList"));
    objc_msgSend(v6, "addObserver:", v5);
    objc_msgSend(v7, "addObserver:", v5);
    objc_msgSend(v8, "addObserver:", v5);
    readingList = v5->_readingList;
    v5->_readingList = (FCReadingList *)v8;
    v10 = v8;

    subscriptionController = v5->_subscriptionController;
    v5->_subscriptionController = (FCSubscriptionController *)v6;
    v12 = v6;

    readingHistory = v5->_readingHistory;
    v5->_readingHistory = (FCReadingHistory *)v7;
    v14 = v7;

    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "articleController"));
    articleController = v5->_articleController;
    v5->_articleController = (FCArticleController *)v15;

    v18 = objc_msgSend((id)objc_opt_class(v5, v17), "spotlightQueue");
    v19 = objc_claimAutoreleasedReturnValue(v18);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100007C34;
    block[3] = &unk_1000D9758;
    v20 = v5;
    v24 = v20;
    dispatch_async(v19, block);

    v21 = v20;
  }

  return v5;
}

+ (id)spotlightQueue
{
  return +[FCTaskScheduler lowPriorityQueue](FCTaskScheduler, "lowPriorityQueue");
}

+ (id)_spotlightFolder
{
  if (qword_10010A9A0[0] != -1)
    dispatch_once(qword_10010A9A0, &stru_1000DE5D8);
  return (id)qword_10010A998;
}

- (void)addSubscriptionsWithTags:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v6 = objc_msgSend((id)objc_opt_class(self, v5), "spotlightQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10006F310;
  v9[3] = &unk_1000D97A8;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

- (void)removeSubscriptionsWithTags:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;

  v4 = a3;
  v6 = objc_msgSend((id)objc_opt_class(self, v5), "spotlightQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006F3F0;
  block[3] = &unk_1000D9758;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, block);

}

+ (void)clearIndex
{
  NSObject *v2;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "spotlightQueue"));
  dispatch_async(v2, &stru_1000DE638);

}

- (void)subscriptionController:(id)a3 didAddTags:(id)a4 changeTags:(id)a5 moveTags:(id)a6 removeTags:(id)a7 subscriptionType:(unint64_t)a8
{
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  FRSpotlightManager *v20;
  id v21;
  id v22;

  v12 = a4;
  v13 = a5;
  v15 = a7;
  if (!a8)
  {
    v16 = objc_msgSend((id)objc_opt_class(self, v14), "spotlightQueue");
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10006F654;
    v18[3] = &unk_1000D9820;
    v19 = v12;
    v20 = self;
    v21 = v15;
    v22 = v13;
    dispatch_async(v17, v18);

  }
}

- (void)readingHistory:(id)a3 didChangeFeaturesForArticles:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  _QWORD block[5];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v23 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateByAddingTimeInterval:", -2592000.0));

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v15));
        v17 = objc_msgSend(v16, "integerValue");

        if ((v17 & 4) != 0 && -[FRSpotlightManager _shouldIndexArticleID:](self, "_shouldIndexArticleID:", v15))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lastVisitedDateForArticleID:", v15));
          if (objc_msgSend(v18, "fc_isLaterThan:", v9))
            objc_msgSend(v22, "addObject:", v15);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v22, "count"))
  {
    v20 = objc_msgSend((id)objc_opt_class(self, v19), "spotlightQueue");
    v21 = objc_claimAutoreleasedReturnValue(v20);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006F960;
    block[3] = &unk_1000D97A8;
    block[4] = self;
    v25 = v22;
    dispatch_async(v21, block);

  }
}

- (void)readingHistory:(id)a3 didRemoveArticlesWithIDs:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v5 = a4;
  v7 = objc_msgSend((id)objc_opt_class(self, v6), "spotlightQueue");
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10006FA4C;
  v10[3] = &unk_1000D97A8;
  v10[4] = self;
  v11 = v5;
  v9 = v5;
  dispatch_async(v8, v10);

}

- (void)readingHistoryDidClear:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = objc_msgSend((id)objc_opt_class(self, a2), "spotlightQueue");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  dispatch_async(v4, &stru_1000DE678);

}

- (void)readingList:(id)a3 didAddArticles:(id)a4 removeArticles:(id)a5 eventInitiationLevel:(int64_t)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "count");
  if (!a6 && v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CSSearchableIndex defaultSearchableIndex](CSSearchableIndex, "defaultSearchableIndex"));
    -[FRSpotlightManager _indexArticleIDs:searchableIndex:acknowledgementHandler:](self, "_indexArticleIDs:searchableIndex:acknowledgementHandler:", v9, v12, 0);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        if (!-[FRSpotlightManager _shouldIndexArticleID:](self, "_shouldIndexArticleID:", v19, (_QWORD)v20))
          objc_msgSend(v13, "addObject:", v19);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v16);
  }

  -[FRSpotlightManager removeArticlesWithIDs:](self, "removeArticlesWithIDs:", v13);
}

- (void)removeArticlesWithIDs:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  FRSpotlightManager *v10;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v6 = objc_msgSend((id)objc_opt_class(self, v5), "spotlightQueue");
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10006FDC4;
    v8[3] = &unk_1000D97A8;
    v9 = v4;
    v10 = self;
    dispatch_async(v7, v8);

  }
}

- (BOOL)_shouldIndexArticleID:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;

  v4 = a3;
  +[NSThread isMainThread](NSThread, "isMainThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRSpotlightManager readingHistory](self, "readingHistory"));
  if ((objc_msgSend(v5, "hasArticleBeenMarkedAsOffensive:", v4) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRSpotlightManager readingHistory](self, "readingHistory"));
    if ((objc_msgSend(v7, "hasArticleBeenVisited:", v4) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRSpotlightManager readingList](self, "readingList"));
      v6 = objc_msgSend(v8, "isArticleOnReadingList:", v4);

    }
  }

  return v6;
}

- (void)_indexTags:(id)a3 searchableIndex:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  FRSpotlightManager *v12;

  v5 = a3;
  v7 = objc_msgSend((id)objc_opt_class(self, v6), "spotlightQueue");
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000700AC;
  v10[3] = &unk_1000D97A8;
  v11 = v5;
  v12 = self;
  v9 = v5;
  dispatch_async(v8, v10);

}

- (void)_indexArticleIDs:(id)a3 searchableIndex:(id)a4 acknowledgementHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  void (**v19)(_QWORD);

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  if (objc_msgSend(v8, "count"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRSpotlightManager articleController](self, "articleController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "headlinesFetchOperationForArticleIDs:", v8));

    objc_msgSend(v12, "setCachePolicy:", 0);
    v14 = objc_msgSend((id)objc_opt_class(self, v13), "spotlightQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    objc_msgSend(v12, "setFetchCompletionQueue:", v15);

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000702FC;
    v17[3] = &unk_1000DE7B0;
    v17[4] = self;
    v18 = v9;
    v19 = v10;
    objc_msgSend(v12, "setFetchCompletionBlock:", v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue fc_sharedConcurrentQueue](NSOperationQueue, "fc_sharedConcurrentQueue"));
    objc_msgSend(v16, "addOperation:", v12);

  }
  else if (v10)
  {
    v10[2](v10);
  }

}

- (id)_itemForTag:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)CSSearchableItemAttributeSet), "initWithItemContentType:", kUTTypeContent);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  objc_msgSend(v4, "setRelatedUniqueIdentifier:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  objc_msgSend(v4, "setTitle:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("news"), &stru_1000DF290, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("feed"), &stru_1000DF290, 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v8, v10, 0));
  objc_msgSend(v4, "setKeywords:", v11);

  v12 = objc_alloc((Class)CSSearchableItem);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  v14 = objc_msgSend(v12, "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v13, NSSSpotlightFeedDomainIdentifier, v4);
  return v14;
}

- (BOOL)_shouldIndexArticleWithDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  if (!a3)
    return 0;
  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "components:fromDate:toDate:options:", 24, v3, v5, 0));

  v7 = (uint64_t)objc_msgSend(v6, "month") < 2;
  return v7;
}

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  FRSpotlightManager *v8;
  id v9;
  id v10;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100070AD0;
  v7[3] = &unk_1000DC8A8;
  v8 = self;
  v9 = a3;
  v10 = a4;
  v5 = v10;
  v6 = v9;
  -[FRSpotlightManager _removeAllArticleThumbnailsWithCompletion:](v8, "_removeAllArticleThumbnailsWithCompletion:", v7);

}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  FRSpotlightManager *v14;
  id v15;
  id v16;

  v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100070F5C;
  v12[3] = &unk_1000DBC38;
  v13 = a4;
  v14 = self;
  v15 = v8;
  v16 = a5;
  v9 = v16;
  v10 = v8;
  v11 = v13;
  -[FRSpotlightManager _removeAllArticleThumbnailsWithCompletion:](self, "_removeAllArticleThumbnailsWithCompletion:", v12);

}

- (void)_removeAllArticleThumbnailsWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v6 = objc_msgSend((id)objc_opt_class(self, v5), "spotlightQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000711F8;
  v9[3] = &unk_1000D9AA8;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

- (id)_thumbnailURLForHeadline:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100083EB0();
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "articleID"));
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100083DF4();
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRSpotlightManager _thumbnailURLForArticleID:](self, "_thumbnailURLForArticleID:", v5));

  return v6;
}

- (id)_thumbnailURLForArticleID:(id)a3
{
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100083F6C();
  v6 = objc_msgSend((id)objc_opt_class(self, v4), "_spotlightFolder");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLByAppendingPathComponent:", v5));

  return v8;
}

- (BOOL)_copyThumbnail:(id)a3 forHeadline:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  id v17;
  void *v18;
  id v20;

  v6 = a3;
  v7 = a4;
  if (+[NSThread isMainThread](NSThread, "isMainThread")
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100084394();
    if (v6)
      goto LABEL_6;
  }
  else if (v6)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_1000842D8();
LABEL_6:
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "thumbnailAssetHandle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filePath"));

  if (!objc_msgSend(v9, "length") && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100084228();
    if (v7)
      goto LABEL_11;
  }
  else if (v7)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10008416C();
LABEL_11:
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "articleID"));
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100084028();
    objc_msgSend(v9, "length");
    goto LABEL_18;
  }
  if (!objc_msgSend(v9, "length"))
  {
LABEL_18:
    v16 = 0;
    goto LABEL_25;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v9, 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FRSpotlightManager _thumbnailURLForHeadline:](self, "_thumbnailURLForHeadline:", v7));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "path"));
  v15 = objc_msgSend(v12, "fileExistsAtPath:", v14);

  if ((v15 & 1) != 0)
  {
    v16 = 1;
  }
  else
  {
    v20 = 0;
    v16 = objc_msgSend(v12, "copyItemAtURL:toURL:error:", v11, v13, &v20);
    v17 = v20;
    v18 = v17;
    if ((v16 & 1) == 0 && v17 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000840E4(v18);

  }
LABEL_25:

  return v16;
}

- (BOOL)_removeThumbnailForArticleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  void *v10;
  id v12;

  v4 = a3;
  if (+[NSThread isMainThread](NSThread, "isMainThread")
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000844F8();
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRSpotlightManager _thumbnailURLForArticleID:](self, "_thumbnailURLForArticleID:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
  if (objc_msgSend(v6, "fileExistsAtPath:", v7))
  {
    v12 = 0;
    v8 = objc_msgSend(v6, "removeItemAtURL:error:", v5, &v12);
    v9 = v12;
    v10 = v9;
    if ((v8 & 1) == 0 && v9 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100084444((uint64_t)v7, v10);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NUAppEntityAssociator)associator
{
  return self->associator;
}

- (void)setAssociator:(id)a3
{
  objc_storeStrong((id *)&self->associator, a3);
}

- (FCSubscriptionController)subscriptionController
{
  return self->_subscriptionController;
}

- (void)setSubscriptionController:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionController, a3);
}

- (FCReadingHistory)readingHistory
{
  return self->_readingHistory;
}

- (void)setReadingHistory:(id)a3
{
  objc_storeStrong((id *)&self->_readingHistory, a3);
}

- (FCReadingList)readingList
{
  return self->_readingList;
}

- (void)setReadingList:(id)a3
{
  objc_storeStrong((id *)&self->_readingList, a3);
}

- (FCArticleController)articleController
{
  return self->_articleController;
}

- (void)setArticleController:(id)a3
{
  objc_storeStrong((id *)&self->_articleController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleController, 0);
  objc_storeStrong((id *)&self->_readingList, 0);
  objc_storeStrong((id *)&self->_readingHistory, 0);
  objc_storeStrong((id *)&self->_subscriptionController, 0);
  objc_storeStrong((id *)&self->associator, 0);
}

@end
