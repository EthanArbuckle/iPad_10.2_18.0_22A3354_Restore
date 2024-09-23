@implementation RetainedQueryController

- (void)restoreIfNeededWithBlock:(id)a3
{
  void (**v4)(id, SearchFieldItem *);
  id v5;
  NSObject *v6;
  SearchFieldItem *v7;
  __int16 v8[8];

  v4 = (void (**)(id, SearchFieldItem *))a3;
  if (-[RetainedQueryController hasRelevantRetainedSearchQuery](self, "hasRelevantRetainedSearchQuery"))
  {
    v5 = sub_10043222C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Restoring Retain Query", (uint8_t *)v8, 2u);
    }

    -[RetainedQueryController _sendAnalyticsRetainedQueryEvent](self, "_sendAnalyticsRetainedQueryEvent");
    v7 = objc_alloc_init(SearchFieldItem);
    -[SearchFieldItem setSearchString:](v7, "setSearchString:", self->_retainedSearchQueryString);
    -[SearchFieldItem setRetainedSearchMetadata:](v7, "setRetainedSearchMetadata:", self->_retainedSearchQueryMetadata);
    v4[2](v4, v7);

    objc_storeStrong((id *)&self->_restoredRetainedSearchQueryMetadata, self->_retainedSearchQueryMetadata);
    v4 = (void (**)(id, SearchFieldItem *))v7;
  }
  else
  {
    -[RetainedQueryController clearRetainedSearchQuery](self, "clearRetainedSearchQuery");
    v4[2](v4, 0);
  }

}

- (void)_sendAnalyticsRetainedQueryEvent
{
  double v3;
  void *v4;
  id v5;

  -[RetainedQueryController retainedSearchQueryAge](self, "retainedSearchQueryAge");
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{ \"age\": %lu, \"retainSearchTime\": %lu }"), (unint64_t)(v3 * 1000.0), (unint64_t)(self->_timeToRetainSearchQuery * 1000.0)));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", 2024, 11, v5);

}

- (void)retainSearchQueryForSelectedSearchResult:(id)a3 query:(id)a4 forTimeInterval:(double)a5
{
  id v8;
  void *v9;
  GEORetainedSearchMetadata *retainedSearchQueryMetadata;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "retainedSearchMetadata"));
  if (v9)
  {
    retainedSearchQueryMetadata = self->_retainedSearchQueryMetadata;

    if (!retainedSearchQueryMetadata)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "retainedSearchMetadata"));
      -[RetainedQueryController retainSearchQueryWithRetainedSearchMetadata:query:forTimeInterval:](self, "retainSearchQueryWithRetainedSearchMetadata:query:forTimeInterval:", v11, v8, a5);

    }
  }

}

- (void)retainSearchQueryWithRetainedSearchMetadata:(id)a3 query:(id)a4 forTimeInterval:(double)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v12 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_query"));
  if (v9)
    v10 = v9;
  else
    v10 = v12;
  v11 = v10;

  -[RetainedQueryController retainSearchQuery:metadata:forTimeInterval:](self, "retainSearchQuery:metadata:forTimeInterval:", v11, v8, a5);
}

- (void)retainSearchQueryForSelectedAutocompleteItem:(id)a3 query:(id)a4 forTimeInterval:(double)a5
{
  id v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = objc_opt_class(MKLocalSearchCompletion);
  if ((objc_opt_isKindOfClass(v10, v9) & 1) != 0)
    -[RetainedQueryController retainSearchQueryForSelectedSearchCompletion:query:forTimeInterval:](self, "retainSearchQueryForSelectedSearchCompletion:query:forTimeInterval:", v10, v8, a5);
  else
    -[RetainedQueryController retainSearchQueryWithRetainedSearchMetadata:query:forTimeInterval:](self, "retainSearchQueryWithRetainedSearchMetadata:query:forTimeInterval:", 0, v8, a5);

}

- (void)retainSearchQueryForSelectedSearchCompletion:(id)a3 query:(id)a4 forTimeInterval:(double)a5
{
  id v8;
  id v9;

  v8 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "retainedSearchMetadata"));
  -[RetainedQueryController retainSearchQueryWithRetainedSearchMetadata:query:forTimeInterval:](self, "retainSearchQueryWithRetainedSearchMetadata:query:forTimeInterval:", v9, v8, a5);

}

- (void)retainSearchQuery:(id)a3 metadata:(id)a4 forTimeInterval:(double)a5
{
  GEORetainedSearchMetadata *v8;
  NSDate *v9;
  NSDate *retainedSearchQueryTimestamp;
  id v11;
  NSString *retainedSearchQueryString;
  GEORetainedSearchMetadata *retainedSearchQueryMetadata;
  id v14;

  v14 = a3;
  v8 = (GEORetainedSearchMetadata *)a4;
  v9 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  retainedSearchQueryTimestamp = self->_retainedSearchQueryTimestamp;
  self->_retainedSearchQueryTimestamp = v9;

  v11 = objc_msgSend(v14, "length");
  retainedSearchQueryString = (NSString *)v14;
  if (!v11)
  {
    if (-[NSString length](self->_retainedSearchQueryString, "length"))
      retainedSearchQueryString = self->_retainedSearchQueryString;
    else
      retainedSearchQueryString = 0;
  }
  objc_storeStrong((id *)&self->_retainedSearchQueryString, retainedSearchQueryString);
  retainedSearchQueryMetadata = self->_retainedSearchQueryMetadata;
  self->_retainedSearchQueryMetadata = v8;

  self->_timeToRetainSearchQuery = a5;
}

- (void)clearRetainedSearchQuery
{
  id v3;
  NSObject *v4;
  NSDate *retainedSearchQueryTimestamp;
  NSString *retainedSearchQueryString;
  GEORetainedSearchMetadata *retainedSearchQueryMetadata;
  GEORetainedSearchMetadata *restoredRetainedSearchQueryMetadata;
  uint8_t v9[16];

  v3 = sub_10043222C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Clearing Retain Query", v9, 2u);
  }

  retainedSearchQueryTimestamp = self->_retainedSearchQueryTimestamp;
  self->_retainedSearchQueryTimestamp = 0;

  retainedSearchQueryString = self->_retainedSearchQueryString;
  self->_retainedSearchQueryString = 0;

  retainedSearchQueryMetadata = self->_retainedSearchQueryMetadata;
  self->_retainedSearchQueryMetadata = 0;

  restoredRetainedSearchQueryMetadata = self->_restoredRetainedSearchQueryMetadata;
  self->_restoredRetainedSearchQueryMetadata = 0;

  self->_timeToRetainSearchQuery = 0.0;
}

- (double)retainedSearchQueryAge
{
  double v2;

  -[NSDate timeIntervalSinceNow](self->_retainedSearchQueryTimestamp, "timeIntervalSinceNow");
  return -v2;
}

- (BOOL)hasRelevantRetainedSearchQuery
{
  __CFString *v2;
  GEORetainedSearchMetadata *retainedSearchQueryMetadata;
  BOOL v5;
  double v6;
  BOOL result;

  retainedSearchQueryMetadata = self->_retainedSearchQueryMetadata;
  if (retainedSearchQueryMetadata)
  {
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue(-[GEORetainedSearchMetadata sourceAppID](self->_retainedSearchQueryMetadata, "sourceAppID"));
    if (v2 == CFSTR("com.apple.Spotlight"))
    {
      v2 = CFSTR("com.apple.Spotlight");
      if (self->_timeToRetainSearchQuery > 0.0)
      {
        v5 = 1;
        goto LABEL_11;
      }
    }
  }
  if (!self->_retainedSearchQueryString
    || !self->_retainedSearchQueryTimestamp
    || self->_timeToRetainSearchQuery <= 0.0)
  {
    v5 = 0;
    result = 0;
    if (!retainedSearchQueryMetadata)
      return result;
    goto LABEL_11;
  }
  -[RetainedQueryController retainedSearchQueryAge](self, "retainedSearchQueryAge");
  v5 = v6 < self->_timeToRetainSearchQuery;
  result = v5;
  if (retainedSearchQueryMetadata)
  {
LABEL_11:

    return v5;
  }
  return result;
}

- (GEORetainedSearchMetadata)restoredRetainedSearchQueryMetadata
{
  return self->_restoredRetainedSearchQueryMetadata;
}

- (void)setRestoredRetainedSearchQueryMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_restoredRetainedSearchQueryMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restoredRetainedSearchQueryMetadata, 0);
  objc_storeStrong((id *)&self->_retainedSearchQueryMetadata, 0);
  objc_storeStrong((id *)&self->_retainedSearchQueryTimestamp, 0);
  objc_storeStrong((id *)&self->_retainedSearchQueryString, 0);
}

@end
