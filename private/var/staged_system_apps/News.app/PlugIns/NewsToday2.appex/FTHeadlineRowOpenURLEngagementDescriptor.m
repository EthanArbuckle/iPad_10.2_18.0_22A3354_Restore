@implementation FTHeadlineRowOpenURLEngagementDescriptor

- (FTHeadlineRowOpenURLEngagementDescriptor)init
{
  id v2;
  void *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v6 = "-[FTHeadlineRowOpenURLEngagementDescriptor init]";
    v7 = 2080;
    v8 = "FTHeadlineRowOpenURLEngagementDescriptor.m";
    v9 = 1024;
    v10 = 27;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FTHeadlineRowOpenURLEngagementDescriptor init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (FTHeadlineRowOpenURLEngagementDescriptor)initWithHeadline:(id)a3
{
  id v4;
  FTHeadlineRowOpenURLEngagementDescriptor *v5;
  NTHeadlineProviding *v6;
  NTHeadlineProviding *headline;
  objc_super v9;

  v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100091248();
  v9.receiver = self;
  v9.super_class = (Class)FTHeadlineRowOpenURLEngagementDescriptor;
  v5 = -[FTHeadlineRowOpenURLEngagementDescriptor init](&v9, "init");
  if (v5)
  {
    v6 = (NTHeadlineProviding *)objc_msgSend(v4, "copy");
    headline = v5->_headline;
    v5->_headline = v6;

  }
  return v5;
}

- (id)userEngagementWithWidgetEventTracker:(id)a3 trackableWidgetState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000913B8();
    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100091300();
LABEL_6:
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FTHeadlineRowOpenURLEngagementDescriptor headline](self, "headline"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "engagementWithRowAtDate:forHeadline:withTrackableWidgetState:", v8, v9, v7));

  return v10;
}

- (NSURL)baseNewsURL
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FTHeadlineRowOpenURLEngagementDescriptor headline](self, "headline"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "NewsURL"));

  return (NSURL *)v3;
}

- (id)openInNewsReferralItemWithTrackableWidgetState:(id)a3 assetHandlesByRemoteURL:(id)a4
{
  id v5;
  id v6;
  NSMutableArray *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  id obj;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  NSMutableDictionary *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  id v52;
  _BYTE v53[128];
  _BYTE v54[128];

  v5 = a3;
  v6 = a4;
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100091528();
    if (v6)
      goto LABEL_6;
  }
  else if (v6)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100091470();
LABEL_6:
  v7 = objc_opt_new(NSMutableArray);
  v35 = objc_opt_new(NSMutableDictionary);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "todayResults"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sections"));

  obj = v9;
  v32 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
  v28 = v6;
  v29 = v5;
  if (v32)
  {
    v31 = *(_QWORD *)v42;
    v34 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v42 != v31)
          objc_enumerationMutation(obj);
        v33 = v10;
        v11 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v10);
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "items"));
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v38;
          do
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(_QWORD *)v38 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
              if (!objc_msgSend(v17, "itemType"))
              {
                v18 = v17;
                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "analyticsElement"));
                v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "articleID"));

                v21 = (void *)objc_claimAutoreleasedReturnValue(-[FTHeadlineRowOpenURLEngagementDescriptor headline](self, "headline"));
                v22 = objc_msgSend(v18, "isEqual:", v21);

                if (v22)
                {
                  if (!v20 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                  {
                    v23 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "articleID");
                    *(_DWORD *)buf = 136315906;
                    v46 = "-[FTHeadlineRowOpenURLEngagementDescriptor openInNewsReferralItemWithTrackableWidgetState:asse"
                          "tHandlesByRemoteURL:]";
                    v47 = 2080;
                    v48 = "FTHeadlineRowOpenURLEngagementDescriptor.m";
                    v49 = 1024;
                    v50 = 86;
                    v51 = 2114;
                    v52 = v23;
                    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

                  }
                  v34 = (uint64_t)-[NSMutableArray count](v7, "count");
                }
                if (v20)
                {
                  -[NSMutableArray addObject:](v7, "addObject:", v18);
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v35, "setObject:forKeyedSubscript:", v11, v18);
                }

              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
          }
          while (v14);
        }

        v10 = v33 + 1;
      }
      while ((id)(v33 + 1) != v32);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
    }
    while (v32);
  }
  else
  {
    v34 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray fc_arrayOfObjectsPassingTest:](v7, "fc_arrayOfObjectsPassingTest:", &stru_1000C6A48));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "fc_rotateElementsFromTheIndexOfSelectedItem:", v34));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[FRNewsReferralItemWidgetArticleList ft_itemWithHeadlines:sectionsByHeadline:assetHandlesByRemoteURL:](FRNewsReferralItemWidgetArticleList, "ft_itemWithHeadlines:sectionsByHeadline:assetHandlesByRemoteURL:", v25, v35, v28));

  return v26;
}

- (NSString)openInNewsReferralItemQueryItemName
{
  return (NSString *)FCWidgetArticleListReferralItemQueryItemName;
}

- (NTHeadlineProviding)headline
{
  return self->_headline;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headline, 0);
}

@end
