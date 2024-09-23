@implementation FRNewsReferralItemWidgetArticleList

- (FRNewsReferralItemWidgetArticleList)init
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
    v6 = "-[FRNewsReferralItemWidgetArticleList init]";
    v7 = 2080;
    v8 = "FRNewsReferralItemWidgetArticleList.m";
    v9 = 1024;
    v10 = 38;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FRNewsReferralItemWidgetArticleList init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (FRNewsReferralItemWidgetArticleList)initWithJSONArray:(id)a3 flintDocumentURLAssetHandlesByRemoteURL:(id)a4
{
  id v6;
  id v7;
  FRNewsReferralItemWidgetArticleListEncodableElement *v8;
  FRNewsReferralItemWidgetArticleList *v9;

  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007F9B8();
    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007F900();
LABEL_6:
  v8 = -[FRNewsReferralItemWidgetArticleListEncodableElement initWithJSONArray:]([FRNewsReferralItemWidgetArticleListEncodableElement alloc], "initWithJSONArray:", v6);
  v9 = -[FRNewsReferralItemWidgetArticleList initWithEncodableElement:assetHandlesByRemoteURL:](self, "initWithEncodableElement:assetHandlesByRemoteURL:", v8, v7);

  return v9;
}

- (NSArray)JSONArray
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRNewsReferralItemWidgetArticleList myEncodableElement](self, "myEncodableElement"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "JSONArray"));

  return (NSArray *)v3;
}

- (id)referredArticlesWithAssetManager:(id)a3
{
  uint64_t v4;
  void *i;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  FRReferredArticle *v22;
  id v24;
  FRNewsReferralItemWidgetArticleList *v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSMutableArray *v34;
  uint64_t v35;
  id v36;
  id v37;
  FRSectionData *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];

  v24 = a3;
  if (!v24 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007FA70();
  v34 = objc_opt_new(NSMutableArray);
  v25 = self;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[FRNewsReferralItemWidgetArticleList JSONArray](self, "JSONArray"));
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v36)
  {
    v35 = *(_QWORD *)v45;
    v33 = FCWidgetArticleListArticleID;
    v32 = FCWidgetArticleListSourceChannelID;
    v31 = FCWidgetArticleListSectionName;
    v30 = FCWidgetArticleListFlintDocumentURL;
    v29 = FCWidgetArticleListArticleRecordData;
    v28 = FCWidgetArticleListSourceChannelRecordData;
    v27 = FCWidgetArticleListParentIssueRecordData;
    do
    {
      for (i = 0; i != v36; i = (char *)i + 1)
      {
        if (*(_QWORD *)v45 != v35)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
        v7 = objc_opt_class(NSDictionary, v4);
        v8 = FCDynamicCast(v7, v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
        v10 = v9;
        if (v9)
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v33));
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v32));
          v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v31));
          v38 = -[FRSectionData initWithName:]([FRSectionData alloc], "initWithName:", v11);
          v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v30));
          v41 = (void *)v12;
          v42 = (void *)v11;
          if (v12)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v12));
            if (v13)
            {
              v14 = (void *)objc_claimAutoreleasedReturnValue(-[FRNewsReferralItemWidgetArticleList flintDocumentURLAssetHandlesByRemoteURL](v25, "flintDocumentURLAssetHandlesByRemoteURL"));
              v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v13));

              v16 = (void *)v15;
LABEL_15:
              v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v29));
              if (v17)
                v37 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v17, 0);
              else
                v37 = 0;
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v28));
              v40 = (void *)v17;
              if (v18)
                v19 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v18, 0);
              else
                v19 = 0;
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v27));
              if (v20)
                v21 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v20, 0);
              else
                v21 = 0;
              v22 = -[FRReferredArticle initWithArticleID:sourceChannelID:sectionData:flintDocumentAssetHandle:articleRecordData:sourceChannelRecordData:parentIssueRecordData:]([FRReferredArticle alloc], "initWithArticleID:sourceChannelID:sectionData:flintDocumentAssetHandle:articleRecordData:sourceChannelRecordData:parentIssueRecordData:", v43, v39, v38, v16, v37, v19, v21);
              -[NSMutableArray addObject:](v34, "addObject:", v22);

              goto LABEL_25;
            }
          }
          else
          {
            v13 = 0;
          }
          v16 = 0;
          goto LABEL_15;
        }
LABEL_25:

      }
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v36);
  }

  return v34;
}

- (FRNewsReferralItemWidgetArticleList)initWithEncodableElement:(id)a3 assetHandlesByRemoteURL:(id)a4
{
  id v6;
  id v7;
  FRNewsReferralItemWidgetArticleList *v8;
  FRNewsReferralItemWidgetArticleListEncodableElement *v9;
  FRNewsReferralItemWidgetArticleListEncodableElement *myEncodableElement;
  NSDictionary *v11;
  NSDictionary *flintDocumentURLAssetHandlesByRemoteURL;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007FBE0();
    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007FB28();
LABEL_6:
  v14.receiver = self;
  v14.super_class = (Class)FRNewsReferralItemWidgetArticleList;
  v8 = -[FRNewsReferralItemWidgetArticleList init](&v14, "init");
  if (v8)
  {
    v9 = (FRNewsReferralItemWidgetArticleListEncodableElement *)objc_msgSend(v6, "copy");
    myEncodableElement = v8->_myEncodableElement;
    v8->_myEncodableElement = v9;

    v11 = (NSDictionary *)objc_msgSend(v7, "copy");
    flintDocumentURLAssetHandlesByRemoteURL = v8->_flintDocumentURLAssetHandlesByRemoteURL;
    v8->_flintDocumentURLAssetHandlesByRemoteURL = v11;

  }
  return v8;
}

+ (Class)encodableElementClass
{
  return (Class)objc_opt_class(FRNewsReferralItemWidgetArticleListEncodableElement, a2);
}

- (NSArray)assetHandles
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRNewsReferralItemWidgetArticleList flintDocumentURLAssetHandlesByRemoteURL](self, "flintDocumentURLAssetHandlesByRemoteURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));

  return (NSArray *)v3;
}

- (NSDictionary)flintDocumentURLAssetHandlesByRemoteURL
{
  return self->_flintDocumentURLAssetHandlesByRemoteURL;
}

- (FRNewsReferralItemWidgetArticleListEncodableElement)myEncodableElement
{
  return self->_myEncodableElement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_myEncodableElement, 0);
  objc_storeStrong((id *)&self->_flintDocumentURLAssetHandlesByRemoteURL, 0);
}

+ (id)ft_itemWithHeadlines:(id)a3 sectionsByHeadline:(id)a4 assetHandlesByRemoteURL:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  id v12;
  id v13;
  id v14;
  FRNewsReferralItemWidgetArticleList *v15;
  FRNewsReferralItemWidgetArticleList *v16;
  void **v18;
  uint64_t v19;
  void (*v20)(id *, void *);
  void *v21;
  id v22;
  id v23;
  id v24;
  NSMutableDictionary *v25;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100081634();
    if (v8)
      goto LABEL_6;
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10008157C();
LABEL_6:
  if (!v9 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_1000814C4();
  v10 = objc_opt_new(NSMutableDictionary);
  v18 = _NSConcreteStackBlock;
  v19 = 3221225472;
  v20 = sub_1000138C8;
  v21 = &unk_1000AAAA8;
  v22 = v8;
  v23 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v24 = v9;
  v25 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v23;
  v14 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v18);
  v15 = [FRNewsReferralItemWidgetArticleList alloc];
  v16 = -[FRNewsReferralItemWidgetArticleList initWithJSONArray:flintDocumentURLAssetHandlesByRemoteURL:](v15, "initWithJSONArray:flintDocumentURLAssetHandlesByRemoteURL:", v13, v11, v18, v19, v20, v21);

  return v16;
}

@end
