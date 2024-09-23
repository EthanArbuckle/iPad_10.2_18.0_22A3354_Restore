@implementation BKSearchController

- (BKSearchController)init
{
  BKSearchController *v2;
  NSMutableArray *v3;
  NSMutableArray *results;
  IMPerformSelectorProxy *v5;
  IMPerformSelectorProxy *performSelectorProxy;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKSearchController;
  v2 = -[BKSearchController init](&v8, "init");
  if (v2)
  {
    v3 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 100);
    results = v2->_results;
    v2->_results = v3;

    v5 = (IMPerformSelectorProxy *)objc_msgSend(objc_alloc((Class)IMPerformSelectorProxy), "initWithTarget:", v2);
    performSelectorProxy = v2->_performSelectorProxy;
    v2->_performSelectorProxy = v5;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  NSOperationQueue *searchQueue;
  BKTextIndexQueryResult *indexQueryResult;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  -[NSOperationQueue cancelAllOperations](self->_searchQueue, "cancelAllOperations");
  searchQueue = self->_searchQueue;
  self->_searchQueue = 0;

  -[IMPerformSelectorProxy teardown](self->_performSelectorProxy, "teardown");
  indexQueryResult = self->_indexQueryResult;
  self->_indexQueryResult = 0;

  v6.receiver = self;
  v6.super_class = (Class)BKSearchController;
  -[BKSearchController dealloc](&v6, "dealloc");
}

- (id)_searchQueue
{
  NSOperationQueue *searchQueue;
  NSOperationQueue *v4;
  NSOperationQueue *v5;

  searchQueue = self->_searchQueue;
  if (!searchQueue)
  {
    v4 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    v5 = self->_searchQueue;
    self->_searchQueue = v4;

    -[NSOperationQueue setMaxConcurrentOperationCount:](self->_searchQueue, "setMaxConcurrentOperationCount:", 1);
    searchQueue = self->_searchQueue;
  }
  return searchQueue;
}

- (void)setSearchString:(id)a3
{
  id v4;
  void *v5;
  BKTextIndexQueryResult *indexQueryResult;
  id obj;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5));

  if ((-[NSString isEqual:](self->_searchString, "isEqual:", obj) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_searchString, obj);
    -[BKSearchController setAborted:](self, "setAborted:", 0);
    -[BKSearchController setPartialResults:](self, "setPartialResults:", 0);
    -[BKSearchController setSearchCompleted:](self, "setSearchCompleted:", 0);
    -[BKSearchController cancelSearch](self, "cancelSearch");
    indexQueryResult = self->_indexQueryResult;
    self->_indexQueryResult = 0;

    if ((unint64_t)objc_msgSend(obj, "length") >= 3)
      -[BKSearchController _scheduleSearchAfterDelay:reportAnalytics:](self, "_scheduleSearchAfterDelay:reportAnalytics:", 1, 1.0);
  }

}

- (void)setContentStyle:(id)a3 configuration:(id)a4
{
  id v7;
  unsigned __int8 v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v7 = a4;
  v8 = objc_msgSend(v17, "isEqual:", self->_style);
  if ((v8 & 1) == 0)
    objc_storeStrong((id *)&self->_style, a3);
  v9 = objc_msgSend(v7, "copy");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "environment"));
  objc_msgSend(v10, "unfreeze");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchController delegate](self, "delegate"));
  v12 = objc_opt_respondsToSelector(v11, "environmentOverrideViewForSearchController:");

  if ((v12 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchController delegate](self, "delegate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "environmentOverrideViewForSearchController:", self));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "environment"));
      objc_msgSend(v15, "setView:", v14);

    }
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "environment"));
  objc_msgSend(v16, "freeze");

  if (-[BKFlowingBookLayoutConfiguration isEqual:](self->_configuration, "isEqual:", v9))
  {
    if ((v8 & 1) != 0)
      goto LABEL_12;
  }
  else
  {
    -[BKSearchController setConfiguration:](self, "setConfiguration:", v7);
  }
  -[BKSearchController beginSearchWithReportAnalytics:](self, "beginSearchWithReportAnalytics:", 1);
LABEL_12:

}

- (void)setSearchBook:(id)a3
{
  AEBookInfo *v5;
  AEBookInfo *v6;

  v5 = (AEBookInfo *)a3;
  if (self->_book != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_book, a3);
    -[BKSearchController setSearchString:](self, "setSearchString:", 0);
    v5 = v6;
  }

}

- (id)_newSearchOperationForOrdinal:(int64_t)a3
{
  id v5;
  NSObject *v6;
  unsigned int v7;
  __objc2_class **v8;
  id v9;
  void *v10;
  void *v11;
  int v13;
  int64_t v14;

  v5 = _AESearchLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134217984;
    v14 = a3;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "-- _newSearchOperationForOrdinal for ordinal: %ld", (uint8_t *)&v13, 0xCu);
  }

  v7 = -[AEBookInfo contentType](self->_book, "contentType");
  if (v7)
  {
    if (v7 != 2)
    {
      v9 = 0;
      goto LABEL_9;
    }
    v8 = &off_1BD430;
  }
  else
  {
    v8 = &off_1BD478;
  }
  v9 = objc_alloc_init(*v8);
LABEL_9:
  objc_msgSend(v9, "setDelegate:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchController searchString](self, "searchString"));
  objc_msgSend(v9, "setSearchString:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchController searchBook](self, "searchBook"));
  objc_msgSend(v9, "setSearchBook:", v11);

  objc_msgSend(v9, "setTimeOut:", 0.0);
  objc_msgSend(v9, "setOrdinal:", a3);
  return v9;
}

- (BOOL)_searchOnCandidateOrdinal:(int64_t)a3
{
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  __int128 v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  __int128 v17;
  char v18;
  uint8_t buf[4];
  int64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;

  v5 = _AESearchLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v20 = a3;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "-- _searchOnCandidateOrdinal ordinal: %ld", buf, 0xCu);
  }

  if (self->_indexQueryResult)
  {
    v7 = _AESearchLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v20 = a3;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "-- _searchOnCandidateOrdinal _indexQueryResult available for ordinal: %ld", buf, 0xCu);
    }

    v18 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchController searchBook](self, "searchBook"));
    v10 = objc_msgSend(v9, "readingDocumentCount");

    if ((uint64_t)v10 > a3)
    {
      *(_QWORD *)&v11 = 134218498;
      v17 = v11;
      while (!-[BKTextIndexQueryResult isCandidateOrdinal:isMissing:](self->_indexQueryResult, "isCandidateOrdinal:isMissing:", a3, &v18, v17)|| !-[BKSearchController _isDocumentOrdinalSearchable:](self, "_isDocumentOrdinalSearchable:", a3))
      {
        v12 = _AESearchLog();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BKSearchController _isDocumentOrdinalSearchable:](self, "_isDocumentOrdinalSearchable:", a3)));
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BKTextIndexQueryResult isCandidateOrdinal:isMissing:](self->_indexQueryResult, "isCandidateOrdinal:isMissing:", a3, &v18)));
          *(_DWORD *)buf = v17;
          v20 = a3;
          v21 = 2112;
          v22 = v14;
          v23 = 2112;
          v24 = v15;
          _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "-- _searchOnCandidateOrdinal skipping ordinal: %ld isDocumentSearchable: %@ isCandidateOrdinal: %@", buf, 0x20u);

        }
        ++a3;
        --self->_chaptersRemaining;
        if (v10 == (id)a3)
          return 0;
      }
    }
    if (a3 >= (uint64_t)v10)
      return 0;
  }
  -[BKSearchController _searchOnOrdinal:](self, "_searchOnOrdinal:", a3);
  return 1;
}

- (BOOL)_isDocumentOrdinalSearchable:(int64_t)a3
{
  void *v4;
  char v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchController searchBook](self, "searchBook"));
  if (objc_msgSend(v4, "contentType"))
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "linearIndexForOrdinal:", a3) != (id)0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

- (void)_searchOnOrdinal:(int64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchController searchBook](self, "searchBook"));
  v6 = objc_msgSend(v5, "readingDocumentCount");

  if ((uint64_t)v6 > a3)
  {
    v25 = -[BKSearchController _newSearchOperationForOrdinal:](self, "_newSearchOperationForOrdinal:", a3);
    objc_msgSend(v25, "setStartSearchFromIndex:", -[BKSearchController startSearchIndex](self, "startSearchIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchController lastSavedSearchResult](self, "lastSavedSearchResult"));
    objc_msgSend(v25, "setLastSavedSearchResult:", v7);

    v8 = -[AEBookInfo contentType](self->_book, "contentType");
    if (v8 == 2)
    {
      objc_opt_class(BKPdfSearchOperation);
      v19 = BUDynamicCast(v18, v25);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v19);
      if (v11)
      {
        objc_msgSend(v11, "setCurrentPageIndex:", -[BKSearchController startSearchIndex](self, "startSearchIndex"));
        *(_QWORD *)&v20 = objc_opt_class(PDFSelection).n128_u64[0];
        v22 = v21;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchController lastSavedSearchResult](self, "lastSavedSearchResult", v20));
        v23 = BUDynamicCast(v22, v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v23);
        objc_msgSend(v11, "setLastSavedSearchResult:", v16);
        goto LABEL_9;
      }
    }
    else
    {
      if (v8)
      {
LABEL_11:
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchController _searchQueue](self, "_searchQueue"));
        objc_msgSend(v24, "addOperation:", v25);

        return;
      }
      objc_opt_class(BKWK2EpubSearchOperation);
      v10 = BUDynamicCast(v9, v25);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchController searchBook](self, "searchBook"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "documentWithOrdinal:", a3));

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchController searchBook](self, "searchBook"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "physicalPageMapForDocument:", v13));
        objc_msgSend(v11, "setPhysicalPageMap:", v15);

        v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchController searchBook](self, "searchBook"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "baseURL"));
        objc_msgSend(v11, "setBaseURL:", v17);

LABEL_9:
      }
    }

    goto LABEL_11;
  }
}

- (BOOL)contentIsPages
{
  return -[AEBookInfo contentType](self->_book, "contentType") == 2;
}

- (BOOL)contentIsChaptered
{
  return -[AEBookInfo contentType](self->_book, "contentType") == 0;
}

- (unint64_t)pagesRemaining
{
  return self->_pagesRemaining;
}

- (unint64_t)chaptersRemaining
{
  return self->_chaptersRemaining;
}

- (void)beginSearchWithReportAnalytics:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = a3;
  -[BKSearchController cancelSearch](self, "cancelSearch");
  v5 = _AESearchLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "beginSearchWithReportAnalytics - schedule search after 0", v7, 2u);
  }

  -[BKSearchController _scheduleSearchAfterDelay:reportAnalytics:](self, "_scheduleSearchAfterDelay:reportAnalytics:", v3, 0.0);
}

- (void)_unscheduleSearch
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchController performSelectorProxy](self, "performSelectorProxy"));
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", v3, "_startSearchNowWithReportAnalytics:", &__kCFBooleanTrue);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKSearchController performSelectorProxy](self, "performSelectorProxy"));
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", v4, "_startSearchNowWithReportAnalytics:", &__kCFBooleanFalse);

}

- (void)_scheduleSearchAfterDelay:(double)a3 reportAnalytics:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  id v8;

  v4 = a4;
  -[BKSearchController _unscheduleSearch](self, "_unscheduleSearch");
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BKSearchController performSelectorProxy](self, "performSelectorProxy"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  objc_msgSend(v8, "performSelector:withObject:afterDelay:", "_startSearchNowWithReportAnalytics:", v7, a3);

}

- (void)_startSearchNowWithReportAnalytics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *searchString;
  void *v17;
  BKTextIndexQueryResult *v18;
  BKTextIndexQueryResult *indexQueryResult;
  void *v20;
  id v21;
  NSObject *v22;
  unint64_t chaptersRemaining;
  void *v24;
  int v25;
  unint64_t v26;

  v4 = a3;
  if (-[NSString length](self->_searchString, "length") && !-[BKSearchController isSearching](self, "isSearching"))
  {
    -[BKSearchController cancelSearch](self, "cancelSearch");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self->_configuration, "environment"));
    objc_msgSend(v5, "unfreeze");

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchController delegate](self, "delegate"));
    v7 = objc_opt_respondsToSelector(v6, "environmentOverrideViewForSearchController:");

    if ((v7 & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchController delegate](self, "delegate"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "environmentOverrideViewForSearchController:", self));

      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self->_configuration, "environment"));
        objc_msgSend(v10, "setView:", v9);

      }
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self->_configuration, "environment"));
    objc_msgSend(v11, "freeze");

    if (!self->_indexQueryResult)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo baseURL](self->_book, "baseURL"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "absoluteString"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[BKTextIndex bookIndexWithName:](BKTextIndex, "bookIndexWithName:", v14));

      searchString = self->_searchString;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchController searchBook](self, "searchBook"));
      v18 = (BKTextIndexQueryResult *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "queryForString:maxOrdinal:", searchString, objc_msgSend(v17, "readingDocumentCount")));
      indexQueryResult = self->_indexQueryResult;
      self->_indexQueryResult = v18;

      if (!self->_indexQueryResult)
      {
        -[BKSearchController endSearch](self, "endSearch");

        goto LABEL_15;
      }

    }
    self->_maxSearchResults = 100;
    -[BKSearchController setStartSearchIndex:](self, "setStartSearchIndex:", 0);
    -[BKSearchController setLastSavedSearchResult:](self, "setLastSavedSearchResult:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchController searchBook](self, "searchBook"));
    self->_chaptersRemaining = (unint64_t)objc_msgSend(v20, "readingDocumentCount");

    v21 = _AESearchLog();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      chaptersRemaining = self->_chaptersRemaining;
      v25 = 134217984;
      v26 = chaptersRemaining;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "-- _startSearchNowWithReportAnalytics _chaptersRemaining: %ld", (uint8_t *)&v25, 0xCu);
    }

    if (-[BKSearchController contentIsPages](self, "contentIsPages"))
      self->_pagesRemaining = -[BKSearchController pageCount](self, "pageCount");
    -[BKSearchController setSearching:](self, "setSearching:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchController delegate](self, "delegate"));
    objc_msgSend(v24, "searchControllerWillBeginSearching:reportAnalytics:", self, objc_msgSend(v4, "BOOLValue"));

    -[BKSearchController setAborted:](self, "setAborted:", 0);
    -[BKSearchController setPartialResults:](self, "setPartialResults:", 0);
    -[BKSearchController setSearchCompleted:](self, "setSearchCompleted:", 0);
    -[BKSearchController _searchOnCandidateOrdinal:](self, "_searchOnCandidateOrdinal:", 0);
  }
LABEL_15:

}

- (void)cancelSearch
{
  unsigned int v3;
  void *v4;
  void *v5;
  BKTextIndexQueryResult *indexQueryResult;

  v3 = -[BKSearchController isSearching](self, "isSearching");
  -[BKSearchController _unscheduleSearch](self, "_unscheduleSearch");
  -[BKSearchController setSearching:](self, "setSearching:", 0);
  -[BKSearchController setPartialResults:](self, "setPartialResults:", 0);
  -[BKSearchController setStartSearchIndex:](self, "setStartSearchIndex:", 0);
  -[BKSearchController setLastSavedSearchResult:](self, "setLastSavedSearchResult:", 0);
  -[BKSearchController setSearchCompleted:](self, "setSearchCompleted:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchController _searchQueue](self, "_searchQueue"));
  objc_msgSend(v4, "cancelAllOperations");

  -[BKSearchController setWebView:](self, "setWebView:", 0);
  -[BKSearchController setWebViewTrackingID:](self, "setWebViewTrackingID:", (char *)-[BKSearchController webViewTrackingID](self, "webViewTrackingID") + 1);
  if (-[NSMutableArray count](self->_results, "count"))
  {
    -[NSMutableArray removeAllObjects](self->_results, "removeAllObjects");
    -[BKSearchController _resultsChanged](self, "_resultsChanged");
LABEL_4:
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchController delegate](self, "delegate"));
    objc_msgSend(v5, "searchControllerDidFinishSearching:", self);

    goto LABEL_5;
  }
  if (v3)
    goto LABEL_4;
LABEL_5:
  indexQueryResult = self->_indexQueryResult;
  self->_indexQueryResult = 0;

}

- (void)pauseSearch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (-[BKSearchController isSearching](self, "isSearching"))
  {
    -[BKSearchController setSearching:](self, "setSearching:", 0);
    -[BKSearchController setPartialResults:](self, "setPartialResults:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchController delegate](self, "delegate"));
    objc_msgSend(v3, "searchControllerResultsChanged:", self);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchController delegate](self, "delegate"));
    objc_msgSend(v4, "searchControllerDidFinishSearching:", self);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo baseURL](self->_book, "baseURL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absoluteString"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
    v8 = (id)objc_claimAutoreleasedReturnValue(+[BKTextIndex bookIndexWithName:](BKTextIndex, "bookIndexWithName:", v7));

    objc_msgSend(v8, "save");
  }
}

- (void)continueSearch
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  char *v7;

  if (!-[BKSearchController isSearching](self, "isSearching"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchController searchString](self, "searchString"));
    v4 = objc_msgSend(v3, "length");

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchController delegate](self, "delegate"));
      objc_msgSend(v5, "searchControllerWillBeginSearching:reportAnalytics:", self, 1);

      -[BKSearchController setAborted:](self, "setAborted:", 0);
      -[BKSearchController setPartialResults:](self, "setPartialResults:", 0);
      -[BKSearchController setSearchCompleted:](self, "setSearchCompleted:", 0);
      -[BKSearchController setSearching:](self, "setSearching:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchController searchBook](self, "searchBook"));
      v7 = (char *)objc_msgSend(v6, "readingDocumentCount");

      if (!-[BKSearchController _searchOnCandidateOrdinal:](self, "_searchOnCandidateOrdinal:", &v7[-self->_chaptersRemaining]))-[BKSearchController endSearch](self, "endSearch");
    }
  }
}

- (void)endSearch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[BKSearchController setSearching:](self, "setSearching:", 0);
  -[BKSearchController setSearchCompleted:](self, "setSearchCompleted:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchController _searchQueue](self, "_searchQueue"));
  objc_msgSend(v3, "cancelAllOperations");

  -[BKSearchController setWebView:](self, "setWebView:", 0);
  -[BKSearchController setWebViewTrackingID:](self, "setWebViewTrackingID:", (char *)-[BKSearchController webViewTrackingID](self, "webViewTrackingID") + 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchController delegate](self, "delegate"));
  objc_msgSend(v4, "searchControllerResultsChanged:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchController delegate](self, "delegate"));
  objc_msgSend(v5, "searchControllerDidFinishSearching:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo baseURL](self->_book, "baseURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "absoluteString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
  v9 = (id)objc_claimAutoreleasedReturnValue(+[BKTextIndex bookIndexWithName:](BKTextIndex, "bookIndexWithName:", v8));

  objc_msgSend(v9, "save");
}

- (void)loadMore
{
  void *v3;
  id v4;

  if (!-[BKSearchController isSearching](self, "isSearching"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchController searchString](self, "searchString"));
    v4 = objc_msgSend(v3, "length");

    if (v4)
    {
      self->_maxSearchResults += 100;
      -[BKSearchController continueSearch](self, "continueSearch");
    }
  }
}

- (void)_addResultsFromSearch:(id)a3
{
  void *v4;
  id v5;
  NSMutableArray *results;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "results"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    results = self->_results;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "results"));
    -[NSMutableArray addObjectsFromArray:](results, "addObjectsFromArray:", v7);

    -[BKSearchController _resultsChanged](self, "_resultsChanged");
  }

}

- (void)_resultsChanged
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKSearchController delegate](self, "delegate"));
  objc_msgSend(v3, "searchControllerResultsChanged:", self);

}

- (void)provideWebView:(CGRect)a3 protocolCacheItem:(id)a4 paginationOptions:(id)a5 cleanupOptions:(id)a6 cfiOptions:(id)a7 stylesheetSet:(id)a8 styleManager:(id)a9 contentSupportMode:(unint64_t)a10 completion:(id)a11
{
  double height;
  double width;
  double y;
  double x;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void (**v31)(id, void *, _QWORD);
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39[2];
  uint8_t buf[4];
  void *v41;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v36 = a4;
  v21 = a5;
  v22 = a6;
  v23 = a7;
  v24 = a8;
  v25 = a9;
  v26 = a11;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchController webView](self, "webView"));

  if (v27)
  {
    v28 = _AESearchLog();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchController webView](self, "webView"));
      *(_DWORD *)buf = 138412290;
      v41 = v30;
      _os_log_impl(&dword_0, v29, OS_LOG_TYPE_DEFAULT, "Reusing web view %@", buf, 0xCu);

    }
    v31 = (void (**)(id, void *, _QWORD))objc_retainBlock(v26);
    if (v31)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchController webView](self, "webView"));
      v31[2](v31, v32, 0);

    }
  }
  else
  {
    -[BKSearchController setWebViewTrackingID:](self, "setWebViewTrackingID:", (char *)-[BKSearchController webViewTrackingID](self, "webViewTrackingID") + 1);
    v33 = -[BKSearchController webViewTrackingID](self, "webViewTrackingID");
    v34 = _AESearchLog();
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v41) = (_DWORD)v33;
      _os_log_impl(&dword_0, v35, OS_LOG_TYPE_DEFAULT, "Creating web view for tracking ID: %d", buf, 8u);
    }

    objc_initWeak((id *)buf, self);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_88608;
    v37[3] = &unk_1C0C78;
    objc_copyWeak(v39, (id *)buf);
    v39[1] = v33;
    v38 = v26;
    +[BEWebViewFactory viewConfiguredForSearch:protocolCacheItem:paginationOptions:cleanupOptions:cfiOptions:stylesheetSet:styleManager:contentSupportMode:completion:](BEWebViewFactory, "viewConfiguredForSearch:protocolCacheItem:paginationOptions:cleanupOptions:cfiOptions:stylesheetSet:styleManager:contentSupportMode:completion:", v36, v21, v22, v23, v24, v25, x, y, width, height, a10, v37);

    objc_destroyWeak(v39);
    objc_destroyWeak((id *)buf);
  }

}

- (void)_didFinishCreatingWebView:(id)a3 forTrackingID:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  unsigned int v14;
  void (**v15)(id, id, uint64_t);
  int v16;
  int v17;
  __int16 v18;
  unsigned int v19;

  v8 = a3;
  v9 = a5;
  v10 = _AESearchLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 67109120;
    v17 = a4;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Finished creating web view for tracking ID: %d", (uint8_t *)&v16, 8u);
  }

  if (-[BKSearchController webViewTrackingID](self, "webViewTrackingID") == a4)
  {
    -[BKSearchController setWebView:](self, "setWebView:", v8);
  }
  else
  {
    v12 = _AESearchLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = -[BKSearchController webViewTrackingID](self, "webViewTrackingID");
      v16 = 67109376;
      v17 = a4;
      v18 = 1024;
      v19 = v14;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Ignoring web view for old tracking ID: %d (currently: %d)", (uint8_t *)&v16, 0xEu);
    }

  }
  v15 = (void (**)(id, id, uint64_t))objc_retainBlock(v9);

  if (v15)
    v15[2](v15, v8, 1);

}

- (void)searchWasCancelled:(id)a3
{
  -[BKSearchController setAborted:](self, "setAborted:", 1);
}

- (void)searchLimitHit:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  char *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchController delegate](self, "delegate"));
  objc_msgSend(v4, "searchControllerFinishedSearchingChapter:", self);

  -[BKSearchController _addResultsFromSearch:](self, "_addResultsFromSearch:", v8);
  v5 = -[BKSearchController contentIsPages](self, "contentIsPages");
  v6 = (char *)objc_msgSend(v8, "startSearchFromIndex");
  if ((v5 & 1) == 0)
    v6 = &v6[-[BKSearchController startSearchIndex](self, "startSearchIndex")];
  -[BKSearchController setStartSearchIndex:](self, "setStartSearchIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastSavedSearchResult"));
  -[BKSearchController setLastSavedSearchResult:](self, "setLastSavedSearchResult:", v7);

  -[BKSearchController pauseSearch](self, "pauseSearch");
}

- (void)searchHasPartialResults:(id)a3
{
  unsigned int v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = -[BKSearchController contentIsPages](self, "contentIsPages");
  v5 = v11;
  if (v4)
  {
    objc_opt_class(BKPdfSearchOperation);
    v7 = BUDynamicCast(v6, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = objc_msgSend(v8, "remainingPages");
    if ((id)self->_pagesRemaining != v9)
    {
      self->_pagesRemaining = (unint64_t)v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchController delegate](self, "delegate"));
      objc_msgSend(v10, "searchControllerFinishedSearchingChapter:", self);

    }
    v5 = v11;
  }
  -[BKSearchController _addResultsFromSearch:](self, "_addResultsFromSearch:", v5);
  if ((unint64_t)-[NSMutableArray count](self->_results, "count") >= self->_maxSearchResults)
    -[BKSearchController pauseSearch](self, "pauseSearch");

}

- (void)searchDidFinish:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  unint64_t chaptersRemaining;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  id v22;
  __int16 v23;
  unint64_t v24;

  v4 = a3;
  --self->_chaptersRemaining;
  v5 = _AESearchLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(v4, "ordinal");
    chaptersRemaining = self->_chaptersRemaining;
    *(_DWORD *)buf = 134218240;
    v22 = v7;
    v23 = 2048;
    v24 = chaptersRemaining;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "-- searchDidFinishfor ordinal: %ld  chaptersRemaining: %ld", buf, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchController delegate](self, "delegate"));
  objc_msgSend(v9, "searchControllerFinishedSearchingChapter:", self);

  -[BKSearchController _addResultsFromSearch:](self, "_addResultsFromSearch:", v4);
  -[BKSearchController setStartSearchIndex:](self, "setStartSearchIndex:", 0);
  -[BKSearchController setLastSavedSearchResult:](self, "setLastSavedSearchResult:", 0);
  if ((unint64_t)-[NSMutableArray count](self->_results, "count") < self->_maxSearchResults
    && -[BKSearchController isSearching](self, "isSearching"))
  {
    -[BKSearchController _searchOnCandidateOrdinal:](self, "_searchOnCandidateOrdinal:", (char *)objc_msgSend(v4, "ordinal") + 1);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchController _searchQueue](self, "_searchQueue", 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "operations"));

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v17;
      while (2)
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v11);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v15), "isDone"))
          {

            goto LABEL_15;
          }
          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v13)
          continue;
        break;
      }
    }

    -[BKSearchController endSearch](self, "endSearch");
  }
  else
  {
    -[BKSearchController pauseSearch](self, "pauseSearch");
  }
LABEL_15:

}

- (IMPerformSelectorProxy)performSelectorProxy
{
  return self->_performSelectorProxy;
}

- (BESearchControllerDelegate)delegate
{
  return (BESearchControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)searchString
{
  return self->_searchString;
}

- (AEBookInfo)searchBook
{
  return self->_book;
}

- (ContentStyle)contentStyle
{
  return self->_style;
}

- (NSArray)results
{
  return &self->_results->super;
}

- (BOOL)isSearching
{
  return self->_searching;
}

- (void)setSearching:(BOOL)a3
{
  self->_searching = a3;
}

- (BOOL)wasAborted
{
  return self->_aborted;
}

- (void)setAborted:(BOOL)a3
{
  self->_aborted = a3;
}

- (BOOL)hasPartialResults
{
  return self->_partialResults;
}

- (void)setPartialResults:(BOOL)a3
{
  self->_partialResults = a3;
}

- (BOOL)searchWasCompleted
{
  return self->_searchCompleted;
}

- (void)setSearchCompleted:(BOOL)a3
{
  self->_searchCompleted = a3;
}

- (unint64_t)startSearchIndex
{
  return self->_startSearchIndex;
}

- (void)setStartSearchIndex:(unint64_t)a3
{
  self->_startSearchIndex = a3;
}

- (unint64_t)pageCount
{
  return self->_pageCount;
}

- (void)setPageCount:(unint64_t)a3
{
  self->_pageCount = a3;
}

- (BKFlowingBookLayoutConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BESearchConfiguring)searchConfiguration
{
  return self->_searchConfiguration;
}

- (void)setSearchConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_searchConfiguration, a3);
}

- (NSObject)lastSavedSearchResult
{
  return self->_lastSavedSearchResult;
}

- (void)setLastSavedSearchResult:(id)a3
{
  objc_storeStrong((id *)&self->_lastSavedSearchResult, a3);
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
  objc_storeStrong((id *)&self->_webView, a3);
}

- (int64_t)webViewTrackingID
{
  return self->_webViewTrackingID;
}

- (void)setWebViewTrackingID:(int64_t)a3
{
  self->_webViewTrackingID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_lastSavedSearchResult, 0);
  objc_storeStrong((id *)&self->_searchConfiguration, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_performSelectorProxy, 0);
  objc_storeStrong((id *)&self->_indexQueryResult, 0);
  objc_storeStrong((id *)&self->_searchQueue, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_book, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
