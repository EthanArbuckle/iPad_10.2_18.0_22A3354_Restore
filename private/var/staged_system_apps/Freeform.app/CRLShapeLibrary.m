@implementation CRLShapeLibrary

+ (CRLShapeLibrary)sharedLibrary
{
  if (qword_101414C48 != -1)
    dispatch_once(&qword_101414C48, &stru_10122F968);
  return (CRLShapeLibrary *)(id)qword_101414C40;
}

+ (void)loadDataIfNeededWithCompletion:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[CRLShapeLibrary sharedLibrary](CRLShapeLibrary, "sharedLibrary"));
  objc_msgSend(v4, "p_loadDataWithCompletion:", v3);

}

- (CRLShapeLibrary)initWithShapeLibraryURL:(id)a3 categorySortURL:(id)a4 locale:(id)a5
{
  id v9;
  id v10;
  id v11;
  CRLShapeLibrary *v12;
  CRLShapeLibrary *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSArray *categorySort;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSSet *shapeIDsToRemove;
  NSCache *v27;
  NSCache *shapeCache;
  objc_super v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v30.receiver = self;
  v30.super_class = (Class)CRLShapeLibrary;
  v12 = -[CRLShapeLibrary init](&v30, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_libraryURL, a3);
    if (!v13->_libraryURL)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122F988);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DECAEC();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122F9A8);
      v14 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLibrary initWithShapeLibraryURL:categorySortURL:locale:]"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibrary.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 86, 0, "Invalid parameter not satisfying: %{public}s", "_libraryURL != nil");

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:](NSDictionary, "dictionaryWithContentsOfURL:", v10));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("CRLShapeLibraryCategorySort")));
    categorySort = v13->_categorySort;
    v13->_categorySort = (NSArray *)v18;

    if (!v13->_categorySort)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122F9C8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DECA58();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122F9E8);
      v20 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLibrary initWithShapeLibraryURL:categorySortURL:locale:]"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibrary.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 89, 0, "Invalid parameter not satisfying: %{public}s", "_categorySort != nil");

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[CRLRemoteDefaults sharedDefaults](CRLRemoteDefaults, "sharedDefaults"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "arrayForKey:", CFSTR("CRLShapeLibraryRemovedShapeIDs")));

    v25 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v24));
    shapeIDsToRemove = v13->_shapeIDsToRemove;
    v13->_shapeIDsToRemove = (NSSet *)v25;

    v27 = (NSCache *)objc_alloc_init((Class)NSCache);
    shapeCache = v13->_shapeCache;
    v13->_shapeCache = v27;

    objc_storeStrong((id *)&v13->_locale, a5);
  }

  return v13;
}

- (NSArray)categories
{
  -[CRLShapeLibrary p_loadCategoriesAndSearchIndexIfNeeded](self, "p_loadCategoriesAndSearchIndexIfNeeded");
  return self->_categories;
}

- (void)setDataLoadStatus:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  if (self->_dataLoadStatus != a3)
  {
    self->_dataLoadStatus = a3;
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      v7 = CFSTR("CRLShapeLibraryLoadingDidFinishNotificationStatusKey");
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:"));
      v8 = v4;
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));

      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("CRLShapeLibraryLoadingDidFinishNotification"), self, v5);

    }
  }
}

- (id)shapeWithID:(id)a3
{
  id v4;
  CRLShapeLibraryShape *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CRLShapeLibraryShape *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[CRLShapeLibrary p_setupLibraryIfNeeded](self, "p_setupLibraryIfNeeded");
  if (self->_dataLoadStatus == 3)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibrary p_shapeCache](self, "p_shapeCache"));
    v5 = (CRLShapeLibraryShape *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v6));

    if (!v5)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibrary p_shapeDictionariesByID](self, "p_shapeDictionariesByID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v6));
      if (v9)
      {
        v10 = [CRLShapeLibraryShape alloc];
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibrary p_library](self, "p_library"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibrary p_keywordDelimiterFromLibrary:](self, "p_keywordDelimiterFromLibrary:", v11));
        v5 = -[CRLShapeLibraryShape initWithDictionary:keywordDelimiter:](v10, "initWithDictionary:keywordDelimiter:", v9, v12);

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibrary p_shapeCache](self, "p_shapeCache"));
        objc_msgSend(v13, "setObject:forKey:", v5, v6);

      }
      else
      {
        v5 = 0;
      }

    }
  }

  return v5;
}

- (id)shapeWithLocalizationKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[CRLShapeLibrary p_setupLibraryIfNeeded](self, "p_setupLibraryIfNeeded");
  if (self->_dataLoadStatus == 3)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibrary p_library](self, "p_library"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibrary p_shapeIDByLocalizationKeyFromLibrary:](self, "p_shapeIDByLocalizationKeyFromLibrary:", v6));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v4));
    if (v8)
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibrary shapeWithID:](self, "shapeWithID:", v8));
    else
      v5 = 0;

  }
  return v5;
}

- (id)resultsForSearchTerm:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibrary p_searchIndex](self, "p_searchIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resultsForSearchTerm:", v4));

  return v6;
}

- (id)shapeFromSearchResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibrary shapeWithID:](self, "shapeWithID:", v5));

  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122FA08);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DECB80();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122FA28);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLibrary shapeFromSearchResult:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibrary.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 163, 0, "Shape library shape from result is nil: %@", v4);

  }
  return v6;
}

- (void)setP_searchIndexStatus:(int64_t)a3
{
  id v4;

  if (self->_searchIndexStatus != a3)
  {
    self->_searchIndexStatus = a3;
    if (a3 == 2)
    {
      v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v4, "postNotificationName:object:", CFSTR("CRLShapeLibraryIndexingDidFinishNotification"), self);

    }
  }
}

- (void)p_setupLibraryIfNeeded
{
  int64_t dataLoadStatus;

  dataLoadStatus = self->_dataLoadStatus;
  if (!dataLoadStatus)
  {
    self->_dataLoadStatus = 1;
    dataLoadStatus = -[CRLShapeLibrary p_setupLibrary](self, "p_setupLibrary");
  }
  self->_dataLoadStatus = dataLoadStatus;
}

- (int64_t)p_setupLibrary
{
  NSDictionary *v3;
  NSDictionary *library;
  NSArray *v5;
  NSArray *categories;

  v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibrary p_parseLibraryFromJSON](self, "p_parseLibraryFromJSON"));
  library = self->_library;
  self->_library = v3;

  if (!self->_library)
    return 3;
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibrary p_sortedCategoriesFromLibrary:](self, "p_sortedCategoriesFromLibrary:"));
  categories = self->_categories;
  self->_categories = v5;

  if (-[NSArray count](self->_categories, "count"))
    return 2;
  else
    return 3;
}

- (void)p_loadCategoriesAndSearchIndexIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122FA48);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DECC0C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122FA68);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLibrary p_loadCategoriesAndSearchIndexIfNeeded]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibrary.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 203, 0, "This operation must only be performed on the main thread.");

  }
  -[CRLShapeLibrary p_setupLibraryIfNeeded](self, "p_setupLibraryIfNeeded");
  if (self->_dataLoadStatus == 2 && !self->_searchIndexStatus)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100055288;
    v6[3] = &unk_10122FA90;
    v6[4] = self;
    -[CRLShapeLibrary p_createSearchIndexWithCompletionHandler:](self, "p_createSearchIndexWithCompletionHandler:", v6);
  }
}

- (void)p_loadDataWithCompletion:(id)a3
{
  void (**v4)(id, int64_t);
  void *v5;
  void *v6;
  void *v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD block[5];

  v4 = (void (**)(id, int64_t))a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122FAB0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DECC8C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122FAD0);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLibrary p_loadDataWithCompletion:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibrary.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 214, 0, "This operation must only be performed on the main thread.");

  }
  -[CRLShapeLibrary p_setupLibraryIfNeeded](self, "p_setupLibraryIfNeeded");
  v4[2](v4, self->_dataLoadStatus);

  if (self->_dataLoadStatus == 2 && !self->_searchIndexStatus)
  {
    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, -1);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_create("com.apple.freeform.CRLShapeLibrary", v9);
    -[CRLShapeLibrary setP_searchIndexStatus:](self, "setP_searchIndexStatus:", 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100055508;
    block[3] = &unk_10122D110;
    block[4] = self;
    dispatch_async(v10, block);

  }
}

- (void)p_cacheDataAfterParsingWithSearchIndex:(id)a3
{
  CRLShapeSearchIndex *v4;
  void *v5;
  void *v6;
  void *v7;
  CRLShapeSearchIndex *searchIndex;

  v4 = (CRLShapeSearchIndex *)a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122FAF0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DECD0C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122FB10);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLibrary p_cacheDataAfterParsingWithSearchIndex:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibrary.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 236, 0, "This operation must only be performed on the main thread.");

  }
  searchIndex = self->_searchIndex;
  self->_searchIndex = v4;

  -[CRLShapeLibrary setP_searchIndexStatus:](self, "setP_searchIndexStatus:", 2);
}

- (void)p_createSearchIndexWithCompletionHandler:(id)a3
{
  void (**v4)(id, id);
  CRLShapeSearchIndex *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  id v14;
  CRLShapeSearchIndex *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  unsigned __int8 v19;

  v4 = (void (**)(id, id))a3;
  v5 = [CRLShapeSearchIndex alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibrary locale](self, "locale"));
  v15 = -[CRLShapeSearchIndex initWithLocale:](v5, "initWithLocale:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibrary p_shapeDictionariesByID](self, "p_shapeDictionariesByID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibrary p_library](self, "p_library"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibrary p_keywordDelimiterFromLibrary:](self, "p_keywordDelimiterFromLibrary:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v7, "count")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibrary locale](self, "locale"));
  v12 = +[CRLShapeLibraryHelper shouldAddBaseShapeNameAndKeywordsForLocale:](CRLShapeLibraryHelper, "shouldAddBaseShapeNameAndKeywordsForLocale:", v11);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100055954;
  v16[3] = &unk_10122FB78;
  v16[4] = self;
  v17 = v9;
  v19 = v12;
  v18 = v10;
  v13 = v10;
  v14 = v9;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v16);
  -[CRLShapeSearchIndex addSearchResults:](v15, "addSearchResults:", v13);
  v4[2](v4, v15);

}

- (id)p_parseLibraryFromJSON
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibrary p_libraryURL](self, "p_libraryURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", v3));

  if (v4)
  {
    v17 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v4, 0, &v17));
    v6 = v17;
    if (!v6)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibrary p_libraryByRemovingDenyListedShapes:](self, "p_libraryByRemovingDenyListedShapes:", v5));
      goto LABEL_26;
    }
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122FBD8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DECEE4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122FBF8);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLibrary p_parseLibraryFromJSON]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibrary.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 311, 0, "Error: Could not parse %@ with error: %@", CFSTR("shape_library"), v6);

    if (qword_10147E368 != -1)
      dispatch_once(&qword_10147E368, &stru_10122FC18);
    v10 = off_1013D9068;
    if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
      sub_100DECE5C((uint64_t)v6, v10);
  }
  else
  {
    v11 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122FB98);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DECD8C(v12, (uint64_t)self, v11);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122FBB8);
    v13 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v13);
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLibrary p_parseLibraryFromJSON]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibrary.m"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibrary p_libraryURL](self, "p_libraryURL"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v5, 306, 0, "No data found at search library URL: %@", v14);

  }
  v15 = 0;
LABEL_26:

  return v15;
}

- (id)p_sortedCategoriesFromLibrary:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  CFArrayRef (__cdecl **v15)(CTFontDescriptorRef, CFSetRef);
  void **v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  CRLShapeLibraryCategory *v23;
  uint64_t v24;
  void **v25;
  CFArrayRef (__cdecl **v26)(CTFontDescriptorRef, CFSetRef);
  CRLShapeLibrary *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned int v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  char *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v51;
  void *v52;
  id v53;
  id v54;
  id obj;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[5];
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  uint8_t v69[128];
  uint8_t buf[4];
  unsigned int v71;
  __int16 v72;
  const char *v73;
  __int16 v74;
  const char *v75;
  __int16 v76;
  int v77;
  __int16 v78;
  id v79;
  __int16 v80;
  id v81;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("categories")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibrary p_categorySort](self, "p_categorySort"));
  v6 = objc_msgSend(v5, "count");
  if (v6 != objc_msgSend(v4, "count"))
  {
    v7 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122FC38);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    {
      v51 = v8;
      *(_DWORD *)buf = 67110402;
      v71 = v7;
      v72 = 2082;
      v73 = "-[CRLShapeLibrary p_sortedCategoriesFromLibrary:]";
      v74 = 2082;
      v75 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibrary.m";
      v76 = 1024;
      v77 = 323;
      v78 = 2048;
      v79 = objc_msgSend(v5, "count");
      v80 = 2048;
      v81 = objc_msgSend(v4, "count");
      _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d The number of categories in the plist (%lu) must equal the number of categories in the shape librarian data (%lu)", buf, 0x36u);

    }
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122FC58);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLibrary p_sortedCategoriesFromLibrary:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibrary.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 323, 0, "The number of categories in the plist (%lu) must equal the number of categories in the shape librarian data (%lu)", objc_msgSend(v5, "count"), objc_msgSend(v4, "count"));

  }
  v52 = v5;
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v4, "count")));
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  obj = v4;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v65;
    v15 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
    v16 = _NSConcreteStackBlock;
    do
    {
      v17 = 0;
      v53 = v13;
      do
      {
        if (*(_QWORD *)v65 != v14)
          objc_enumerationMutation(obj);
        v18 = *(id *)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15[418], "indexSet"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("shapeIDs")));
        v62[0] = v16;
        v62[1] = 3221225472;
        v62[2] = sub_1000569D0;
        v62[3] = &unk_10122FC80;
        v62[4] = self;
        v21 = v19;
        v63 = v21;
        objc_msgSend(v20, "enumerateObjectsUsingBlock:", v62);
        v22 = objc_msgSend(v21, "count");
        if (v22 == objc_msgSend(v20, "count"))
        {
          v23 = (CRLShapeLibraryCategory *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("localizationKey")));
          objc_msgSend(v57, "addObject:", v23);
        }
        else
        {
          v24 = v14;
          v25 = v16;
          v26 = v15;
          v27 = self;
          if (objc_msgSend(v21, "count"))
          {
            v28 = objc_msgSend(v20, "mutableCopy");
            objc_msgSend(v28, "removeObjectsAtIndexes:", v21);
            v29 = objc_msgSend(v18, "mutableCopy");
            objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, CFSTR("shapeIDs"));

            v18 = v29;
          }
          v23 = -[CRLShapeLibraryObject initWithDictionary:]([CRLShapeLibraryCategory alloc], "initWithDictionary:", v18);
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibraryCategory localizationKey](v23, "localizationKey"));
          objc_msgSend(v56, "setObject:forKeyedSubscript:", v23, v30);

          self = v27;
          v15 = v26;
          v16 = v25;
          v14 = v24;
          v13 = v53;
        }

        v17 = (char *)v17 + 1;
      }
      while (v13 != v17);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
    }
    while (v13);
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(obj, "count")));
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v32 = v52;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
  v34 = v56;
  if (v33)
  {
    v35 = v33;
    v36 = *(_QWORD *)v59;
    v54 = v32;
    do
    {
      v37 = 0;
      do
      {
        if (*(_QWORD *)v59 != v36)
          objc_enumerationMutation(v32);
        v38 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", v38));
        if (v39)
        {
          objc_msgSend(v31, "addObject:", v39);
        }
        else if ((objc_msgSend(v57, "containsObject:", v38) & 1) == 0)
        {
          v40 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10122FCA0);
          v41 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            v71 = v40;
            v72 = 2082;
            v73 = "-[CRLShapeLibrary p_sortedCategoriesFromLibrary:]";
            v74 = 2082;
            v75 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibrary.m";
            v76 = 1024;
            v77 = 366;
            v78 = 2112;
            v79 = v38;
            _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Found a category localization key in the plist that doesn't exist in the shape librarian data: %@", buf, 0x2Cu);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10122FCC0);
          v42 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v45 = v42;
            v46 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            v71 = v40;
            v72 = 2114;
            v73 = v46;
            _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLibrary p_sortedCategoriesFromLibrary:]"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibrary.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v43, v44, 366, 0, "Found a category localization key in the plist that doesn't exist in the shape librarian data: %@", v38);

          v34 = v56;
          v32 = v54;
        }

        v37 = (char *)v37 + 1;
      }
      while (v35 != v37);
      v35 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
    }
    while (v35);
  }

  if (!objc_msgSend(v31, "count"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122FCE0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DECF94();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122FD00);
    v47 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLibrary p_sortedCategoriesFromLibrary:]"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibrary.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v48, v49, 370, 0, "Found no categories in the shape librarian data: %@", obj);

  }
  return v31;
}

- (CRLShapeSearchIndex)p_searchIndex
{
  -[CRLShapeLibrary p_loadCategoriesAndSearchIndexIfNeeded](self, "p_loadCategoriesAndSearchIndexIfNeeded");
  return self->_searchIndex;
}

- (id)p_shapeDictionariesByID
{
  void *v3;
  void *v4;

  -[CRLShapeLibrary p_setupLibraryIfNeeded](self, "p_setupLibraryIfNeeded");
  if (self->_dataLoadStatus == 3)
  {
    v3 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibrary p_library](self, "p_library"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibrary p_shapeDictionariesByIDFromLibrary:](self, "p_shapeDictionariesByIDFromLibrary:", v4));

  }
  return v3;
}

- (id)p_keywordDelimiterFromLibrary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122FD20);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DED0A0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122FD40);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLibrary p_keywordDelimiterFromLibrary:]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibrary.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 391, 0, "invalid nil value for '%{public}s'", "library");

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("keywordDelimiter")));
  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122FD60);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DED020();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122FD80);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLibrary p_keywordDelimiterFromLibrary:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibrary.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 395, 0, "Shape Librarian data file did not have a keywordDelimiter.");

  }
  return v7;
}

- (id)p_shapeDictionariesByIDFromLibrary:(id)a3
{
  return objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("shapesByID"));
}

- (id)p_shapeIDByLocalizationKeyFromLibrary:(id)a3
{
  return objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("shapeIDByLocKey"));
}

- (id)p_libraryByRemovingDenyListedShapes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  CRLShapeLibraryShape *v17;
  void *v18;
  void *v19;
  id v20;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibrary p_shapeDictionariesByIDFromLibrary:](self, "p_shapeDictionariesByIDFromLibrary:", v4));
  v6 = objc_msgSend(v5, "mutableCopy");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibrary p_shapeIDByLocalizationKeyFromLibrary:](self, "p_shapeIDByLocalizationKeyFromLibrary:", v4));
  v23 = objc_msgSend(v7, "mutableCopy");

  v22 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibrary p_keywordDelimiterFromLibrary:](self, "p_keywordDelimiterFromLibrary:", v4));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibrary p_shapeIDsToRemove](self, "p_shapeIDsToRemove"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringValue"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v15));

        if (v16)
        {
          v17 = -[CRLShapeLibraryShape initWithDictionary:keywordDelimiter:]([CRLShapeLibraryShape alloc], "initWithDictionary:keywordDelimiter:", v16, v8);
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibraryShape localizationKey](v17, "localizationKey"));
          objc_msgSend(v23, "removeObjectForKey:", v18);

        }
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringValue"));
        objc_msgSend(v6, "removeObjectForKey:", v19);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v11);
  }

  v20 = objc_msgSend(v22, "mutableCopy");
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v6, CFSTR("shapesByID"));
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v23, CFSTR("shapeIDByLocKey"));

  return v20;
}

- (int64_t)dataLoadStatus
{
  return self->_dataLoadStatus;
}

- (CRLLocale)locale
{
  return self->_locale;
}

- (NSArray)p_categorySort
{
  return self->_categorySort;
}

- (void)setP_categorySort:(id)a3
{
  objc_storeStrong((id *)&self->_categorySort, a3);
}

- (int64_t)p_searchIndexStatus
{
  return self->_searchIndexStatus;
}

- (NSDictionary)p_library
{
  return self->_library;
}

- (void)setP_library:(id)a3
{
  objc_storeStrong((id *)&self->_library, a3);
}

- (NSURL)p_libraryURL
{
  return self->_libraryURL;
}

- (void)setP_libraryURL:(id)a3
{
  objc_storeStrong((id *)&self->_libraryURL, a3);
}

- (void)setP_searchIndex:(id)a3
{
  objc_storeStrong((id *)&self->_searchIndex, a3);
}

- (NSCache)p_shapeCache
{
  return self->_shapeCache;
}

- (void)setP_shapeCache:(id)a3
{
  objc_storeStrong((id *)&self->_shapeCache, a3);
}

- (NSSet)p_shapeIDsToRemove
{
  return self->_shapeIDsToRemove;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapeIDsToRemove, 0);
  objc_storeStrong((id *)&self->_shapeCache, 0);
  objc_storeStrong((id *)&self->_searchIndex, 0);
  objc_storeStrong((id *)&self->_libraryURL, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_categorySort, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_categories, 0);
}

@end
