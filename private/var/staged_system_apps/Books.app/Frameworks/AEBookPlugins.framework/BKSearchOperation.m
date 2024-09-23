@implementation BKSearchOperation

- (BKSearchOperation)init
{
  BKSearchOperation *v2;
  NSMutableArray *v3;
  NSMutableArray *results;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKSearchOperation;
  v2 = -[BKSearchOperation init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 100);
    results = v2->_results;
    v2->_results = v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[BKSearchOperation setDelegate:](self, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)BKSearchOperation;
  -[BKSearchOperation dealloc](&v3, "dealloc");
}

- (void)setSearchBook:(id)a3
{
  void *v4;
  id obj;

  obj = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "url"));
  -[BKSearchOperation setBookURL:](self, "setBookURL:", v4);

  objc_storeWeak((id *)&self->_book, obj);
}

- (BOOL)_doSearch
{
  return 1;
}

- (void)setOrdinal:(int64_t)a3
{
  self->_ordinal = a3;
}

- (BOOL)isPastLimit
{
  return (unint64_t)-[NSMutableArray count](self->_results, "count") > 0x63;
}

- (void)_postSearch:(id)a3
{
  void *v4;
  id v5;

  if (objc_msgSend(a3, "BOOLValue"))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[BKSearchOperation delegate](self, "delegate"));
    objc_msgSend(v5, "searchDidTimeOut:", self);
LABEL_12:

    return;
  }
  if (-[BKSearchOperation isCancelled](self, "isCancelled"))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[BKSearchOperation delegate](self, "delegate"));
    objc_msgSend(v5, "searchWasCancelled:", self);
    goto LABEL_12;
  }
  if (self->_isDone && -[BKSearchOperation isPastLimit](self, "isPastLimit"))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[BKSearchOperation delegate](self, "delegate"));
    objc_msgSend(v5, "searchLimitHit:", self);
    goto LABEL_12;
  }
  if (-[BKSearchOperation havePartialResults](self, "havePartialResults"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchOperation delegate](self, "delegate"));
    objc_msgSend(v4, "searchHasPartialResults:", self);

    -[NSMutableArray removeAllObjects](self->_results, "removeAllObjects");
    -[BKSearchOperation setHavePartialResults:](self, "setHavePartialResults:", 0);
    return;
  }
  if (self->_isDone)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[BKSearchOperation delegate](self, "delegate"));
    objc_msgSend(v5, "searchDidFinish:", self);
    goto LABEL_12;
  }
}

- (void)_search
{
  void *v3;
  void *v4;

  v3 = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BKSearchOperation _doSearch](self, "_doSearch")));
  if (-[BKSearchOperation requiresMainThread](self, "requiresMainThread"))
    -[BKSearchOperation _postSearch:](self, "_postSearch:", v4);
  else
    -[BKSearchOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "_postSearch:", v4, 1);

  objc_autoreleasePoolPop(v3);
}

- (float)desiredSleepTime
{
  return 0.0;
}

- (BOOL)requiresMainThread
{
  return 1;
}

- (void)main
{
  id v3;
  NSObject *v4;
  float v5;
  float v6;
  unsigned int v7;
  unsigned int v8;
  id v9;
  NSObject *v10;
  unsigned int v11;
  int v12;
  int v13;
  __int16 v14;
  unsigned int v15;

  v3 = _AESearchLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 67109376;
    v13 = (int)self;
    v14 = 1024;
    v15 = -[BKSearchOperation ordinal](self, "ordinal");
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "START main %x for ordinal: %d", (uint8_t *)&v12, 0xEu);
  }

  -[BKSearchOperation desiredSleepTime](self, "desiredSleepTime");
  v6 = v5;
  v7 = -[BKSearchOperation requiresMainThread](self, "requiresMainThread");
  if (!self->_isDone)
  {
    v8 = v7;
    do
    {
      if ((-[BKSearchOperation isCancelled](self, "isCancelled") & 1) != 0)
        break;
      if (v8)
        -[BKSearchOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "_search", 0, 1);
      else
        -[BKSearchOperation _search](self, "_search");
      if (v6 > 0.0)
        +[NSThread sleepForTimeInterval:](NSThread, "sleepForTimeInterval:", v6);
    }
    while (!self->_isDone);
  }
  v9 = _AESearchLog();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = -[BKSearchOperation ordinal](self, "ordinal");
    v12 = 67109376;
    v13 = (int)self;
    v14 = 1024;
    v15 = v11;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "FINISH main %x for ordinal: %d", (uint8_t *)&v12, 0xEu);
  }

}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKSearchOperation;
  -[BKSearchOperation cancel](&v4, "cancel");
  if (!self->_isDone)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchOperation delegate](self, "delegate"));
    objc_msgSend(v3, "searchWasCancelled:", self);

  }
  -[BKSearchOperation setDelegate:](self, "setDelegate:", 0);
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (AEBookInfo)searchBook
{
  return (AEBookInfo *)objc_loadWeakRetained((id *)&self->_book);
}

- (NSURL)bookURL
{
  return self->_bookURL;
}

- (void)setBookURL:(id)a3
{
  objc_storeStrong((id *)&self->_bookURL, a3);
}

- (int64_t)ordinal
{
  return self->_ordinal;
}

- (NSArray)results
{
  return &self->_results->super;
}

- (double)timeOut
{
  return self->_timeOut;
}

- (void)setTimeOut:(double)a3
{
  self->_timeOut = a3;
}

- (BKSearchOperationDelegate)delegate
{
  return (BKSearchOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)startSearchFromIndex
{
  return self->_startSearchFromIndex;
}

- (void)setStartSearchFromIndex:(unint64_t)a3
{
  self->_startSearchFromIndex = a3;
}

- (BOOL)isDone
{
  return self->_isDone;
}

- (void)setIsDone:(BOOL)a3
{
  self->_isDone = a3;
}

- (BOOL)havePartialResults
{
  return self->_havePartialResults;
}

- (void)setHavePartialResults:(BOOL)a3
{
  self->_havePartialResults = a3;
}

- (NSObject)lastSavedSearchResult
{
  return self->_lastSavedSearchResult;
}

- (void)setLastSavedSearchResult:(id)a3
{
  objc_storeStrong((id *)&self->_lastSavedSearchResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSavedSearchResult, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_bookURL, 0);
  objc_destroyWeak((id *)&self->_book);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
