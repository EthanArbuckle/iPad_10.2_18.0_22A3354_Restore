@implementation _MessageSearchAggregationContext

- (void)foundRange:(id)a3 forSearchString:(id)a4 inDocument:(id)a5
{
  NSMutableOrderedSet *v6;
  EMCollectionItemID *itemID;
  EMCollectionItemID *v8;
  ConversationSearchTextRange *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (self)
  {
    v6 = self->_foundRanges;
    itemID = self->_itemID;
  }
  else
  {
    v6 = 0;
    itemID = 0;
  }
  v8 = itemID;
  v9 = sub_1000588A0((uint64_t)ConversationSearchTextRange, v11, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[NSMutableOrderedSet addObject:](v6, "addObject:", v10);

}

- (void)invalidateFoundRange:(id)a3 inDocument:(id)a4
{
  NSMutableOrderedSet *v5;
  EMCollectionItemID *itemID;
  EMCollectionItemID *v7;
  ConversationSearchTextRange *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (self)
  {
    v5 = self->_foundRanges;
    itemID = self->_itemID;
  }
  else
  {
    v5 = 0;
    itemID = 0;
  }
  v7 = itemID;
  v8 = sub_1000588A0((uint64_t)ConversationSearchTextRange, v10, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[NSMutableOrderedSet removeObject:](v5, "removeObject:", v9);

}

- (void)invalidate
{
  if (self)
    self = (_MessageSearchAggregationContext *)self->_foundRanges;
  -[_MessageSearchAggregationContext removeAllObjects](self, "removeAllObjects");
}

- (void)finishedSearching
{
  sub_1000554FC((uint64_t)self, 1);
}

- (NSOrderedSet)allFoundRanges
{
  if (self)
    self = (_MessageSearchAggregationContext *)self->_foundRanges;
  return (NSOrderedSet *)self;
}

- (void)webProcessDidBlockLoadingResourceWithURL:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  EMCollectionItemID *itemID;
  EMCollectionItemID *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  EMCollectionItemID *v14;
  __int16 v15;
  void *v16;

  v4 = a3;
  v5 = sub_100055328();
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    if (self)
      itemID = self->_itemID;
    else
      itemID = 0;
    v8 = itemID;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "absoluteString"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[EFPrivacy fullyRedactedStringForString:](EFPrivacy, "fullyRedactedStringForString:", v9));
    v11 = 136315650;
    v12 = "-[_MessageSearchAggregationContext webProcessDidBlockLoadingResourceWithURL:]";
    v13 = 2114;
    v14 = v8;
    v15 = 2114;
    v16 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s: itemID:%{public}@, url:%{public}@", (uint8_t *)&v11, 0x20u);

  }
}

- (void)webProcessDidFailLoadingResourceWithURL:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  EMCollectionItemID *itemID;
  EMCollectionItemID *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  EMCollectionItemID *v14;
  __int16 v15;
  void *v16;

  v4 = a3;
  v5 = sub_100055328();
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    if (self)
      itemID = self->_itemID;
    else
      itemID = 0;
    v8 = itemID;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "absoluteString"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[EFPrivacy fullyRedactedStringForString:](EFPrivacy, "fullyRedactedStringForString:", v9));
    v11 = 136315650;
    v12 = "-[_MessageSearchAggregationContext webProcessDidFailLoadingResourceWithURL:]";
    v13 = 2114;
    v14 = v8;
    v15 = 2114;
    v16 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s: itemID:%{public}@, url:%{public}@", (uint8_t *)&v11, 0x20u);

  }
}

- (void)webProcessDidFinishDocumentLoadForURL:(id)a3 andRequestedRemoteURLs:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  EMCollectionItemID *itemID;
  EMCollectionItemID *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  EMCollectionItemID *v15;
  __int16 v16;
  void *v17;

  v5 = a3;
  v6 = sub_100055328();
  v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if (self)
      itemID = self->_itemID;
    else
      itemID = 0;
    v9 = itemID;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absoluteString"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[EFPrivacy fullyRedactedStringForString:](EFPrivacy, "fullyRedactedStringForString:", v10));
    v12 = 136315650;
    v13 = "-[_MessageSearchAggregationContext webProcessDidFinishDocumentLoadForURL:andRequestedRemoteURLs:]";
    v14 = 2114;
    v15 = v9;
    v16 = 2114;
    v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s: itemID:%{public}@, url:%{public}@", (uint8_t *)&v12, 0x20u);

  }
}

- (void)webProcessDidFinishLoadForURL:(id)a3
{
  id v4;
  MFWebViewLoadingController *loadingController;
  MFWebViewLoadingController *v6;
  void *v7;
  id v8;
  NSObject *v9;
  EMCollectionItemID *itemID;
  EMCollectionItemID *v11;
  void *v12;
  void *v13;
  NSString *v14;
  _UITextSearchOptions *searchOptions;
  int v16;
  const char *v17;
  __int16 v18;
  EMCollectionItemID *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;

  v4 = a3;
  if (self)
    loadingController = self->_loadingController;
  else
    loadingController = 0;
  v6 = loadingController;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFWebViewLoadingController webView](v6, "webView"));

  v8 = sub_100055328();
  v9 = (id)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      itemID = self->_itemID;
    else
      itemID = 0;
    v11 = itemID;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "absoluteString"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[EFPrivacy fullyRedactedStringForString:](EFPrivacy, "fullyRedactedStringForString:", v12));
    v16 = 136315906;
    v17 = "-[_MessageSearchAggregationContext webProcessDidFinishLoadForURL:]";
    v18 = 2114;
    v19 = v11;
    v20 = 2114;
    v21 = v13;
    v22 = 2112;
    v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: itemID:%{public}@, url:%{public}@, webview: %@", (uint8_t *)&v16, 0x2Au);

  }
  if (self)
  {
    v14 = self->_searchString;
    searchOptions = self->_searchOptions;
  }
  else
  {
    v14 = 0;
    searchOptions = 0;
  }
  objc_msgSend(v7, "performTextSearchWithQueryString:usingOptions:resultAggregator:", v14, searchOptions, self);

}

- (void)webProcessFailedToLoadResourceWithProxyForURL:(id)a3 failureReason:(int64_t)a4
{
  id v6;
  id v7;
  NSObject *v8;
  EMCollectionItemID *itemID;
  EMCollectionItemID *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  EMCollectionItemID *v16;
  __int16 v17;
  int64_t v18;
  __int16 v19;
  void *v20;

  v6 = a3;
  v7 = sub_100055328();
  v8 = (id)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    if (self)
      itemID = self->_itemID;
    else
      itemID = 0;
    v10 = itemID;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "absoluteString"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[EFPrivacy fullyRedactedStringForString:](EFPrivacy, "fullyRedactedStringForString:", v11));
    v13 = 136315906;
    v14 = "-[_MessageSearchAggregationContext webProcessFailedToLoadResourceWithProxyForURL:failureReason:]";
    v15 = 2114;
    v16 = v10;
    v17 = 2048;
    v18 = a4;
    v19 = 2112;
    v20 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s: itemID:%{public}@ reason:%ld  %@", (uint8_t *)&v13, 0x2Au);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchOptions, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_loadingController, 0);
  objc_storeStrong((id *)&self->_foundRanges, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_itemID, 0);
}

@end
