@implementation GuidanceSearchResultsSearchInfoDataProvider

- (GuidanceSearchResultsSearchInfoDataProvider)initWithSearchInfo:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  GuidanceSearchResultsSearchInfoDataProvider *v9;
  GuidanceSearchResultsSearchInfoDataProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GuidanceSearchResultsSearchInfoDataProvider;
  v9 = -[GuidanceSearchResultsSearchInfoDataProvider init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_searchInfo, a3);
    objc_storeStrong((id *)&v10->_error, a4);
  }

  return v10;
}

- (NSString)title
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsSearchInfoDataProvider searchInfo](self, "searchInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchText"));
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsSearchInfoDataProvider searchInfo](self, "searchInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchFieldItem"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));

  }
  return (NSString *)v6;
}

- (NSString)subtitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsSearchInfoDataProvider searchInfo](self, "searchInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "subHeaderDisplayName"));

  return (NSString *)v3;
}

- (GEOFeatureStyleAttributes)styleAttributes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsSearchInfoDataProvider searchInfo](self, "searchInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "searchFieldItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentCategory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "styleAttributes"));

  return (GEOFeatureStyleAttributes *)v5;
}

- (BOOL)hasValidSearchResults
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsSearchInfoDataProvider searchInfo](self, "searchInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "clientResolvedResult"));

  if (v4)
    return 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsSearchInfoDataProvider searchInfo](self, "searchInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "results"));
  v5 = objc_msgSend(v7, "count") != 0;

  return v5;
}

- (NSError)error
{
  return self->_error;
}

- (void)loadSearchResultsWithRouteInfo:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ClientTypeResolver *v14;
  unsigned int v15;
  id v16;
  NSObject *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD block[4];
  NSObject *v24;
  id v25;
  _QWORD v26[4];
  NSObject *v27;
  uint8_t buf[4];
  void *v29;

  v5 = a4;
  v6 = sub_10043222C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsSearchInfoDataProvider searchInfo](self, "searchInfo"));
    *(_DWORD *)buf = 138412290;
    v29 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "SAR: Loading search results: %@", buf, 0xCu);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsSearchInfoDataProvider searchInfo](self, "searchInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "clientResolvedResult"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsSearchInfoDataProvider searchInfo](self, "searchInfo"));
  v12 = v11;
  if (!v10)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "results"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("mapItem != nil")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "filteredArrayUsingPredicate:", v20));

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10083052C;
    block[3] = &unk_1011AE240;
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForKeyPath:", CFSTR("mapItem")));
    v25 = v5;
    v14 = v24;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    v17 = v24;
LABEL_10:

    goto LABEL_11;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "clientResolvedResult"));

  v14 = objc_alloc_init(ClientTypeResolver);
  v15 = objc_msgSend(v13, "itemType");
  if (v15 <= 6)
  {
    if (((1 << v15) & 0x39) != 0)
    {
      v16 = sub_10043222C();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v18 = objc_msgSend(v13, "itemType");
        *(_DWORD *)buf = 67109120;
        LODWORD(v29) = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "SAR: Unhandled client resolved type: %d", buf, 8u);
      }
    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[ClientTypeResolver personalizedItemSource](v14, "personalizedItemSource"));
      v22 = objc_msgSend(v13, "itemType");
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100830158;
      v26[3] = &unk_1011BD818;
      v27 = v5;
      objc_msgSend(v21, "addressOrLOIWithType:completion:", v22, v26);

      v17 = v27;
    }
    goto LABEL_10;
  }
LABEL_11:

}

- (SearchInfo)searchInfo
{
  return self->_searchInfo;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_searchInfo, 0);
}

@end
