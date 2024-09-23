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
    sub_100004818();
    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100004760();
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
  void *i;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  FRReferredArticle *v21;
  id v23;
  FRNewsReferralItemWidgetArticleList *v24;
  id obj;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSMutableArray *v33;
  uint64_t v34;
  id v35;
  id v36;
  FRSectionData *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];

  v23 = a3;
  if (!v23 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_1000048D0();
  v33 = objc_opt_new(NSMutableArray);
  v24 = self;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[FRNewsReferralItemWidgetArticleList JSONArray](self, "JSONArray"));
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v35)
  {
    v34 = *(_QWORD *)v44;
    v32 = FCWidgetArticleListArticleID;
    v31 = FCWidgetArticleListSourceChannelID;
    v30 = FCWidgetArticleListSectionName;
    v29 = FCWidgetArticleListFlintDocumentURL;
    v28 = FCWidgetArticleListArticleRecordData;
    v27 = FCWidgetArticleListSourceChannelRecordData;
    v26 = FCWidgetArticleListParentIssueRecordData;
    do
    {
      for (i = 0; i != v35; i = (char *)i + 1)
      {
        if (*(_QWORD *)v44 != v34)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
        v6 = objc_opt_class(NSDictionary);
        v7 = FCDynamicCast(v6, v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
        v9 = v8;
        if (v8)
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v32));
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v31));
          v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v30));
          v37 = -[FRSectionData initWithName:]([FRSectionData alloc], "initWithName:", v10);
          v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v29));
          v40 = (void *)v11;
          v41 = (void *)v10;
          if (v11)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v11));
            if (v12)
            {
              v13 = (void *)objc_claimAutoreleasedReturnValue(-[FRNewsReferralItemWidgetArticleList flintDocumentURLAssetHandlesByRemoteURL](v24, "flintDocumentURLAssetHandlesByRemoteURL"));
              v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v12));

              v15 = (void *)v14;
LABEL_15:
              v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v28));
              if (v16)
                v36 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v16, 0);
              else
                v36 = 0;
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v27));
              v39 = (void *)v16;
              if (v17)
                v18 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v17, 0);
              else
                v18 = 0;
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v26));
              if (v19)
                v20 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v19, 0);
              else
                v20 = 0;
              v21 = -[FRReferredArticle initWithArticleID:sourceChannelID:sectionData:flintDocumentAssetHandle:articleRecordData:sourceChannelRecordData:parentIssueRecordData:]([FRReferredArticle alloc], "initWithArticleID:sourceChannelID:sectionData:flintDocumentAssetHandle:articleRecordData:sourceChannelRecordData:parentIssueRecordData:", v42, v38, v37, v15, v36, v18, v20);
              -[NSMutableArray addObject:](v33, "addObject:", v21);

              goto LABEL_25;
            }
          }
          else
          {
            v12 = 0;
          }
          v15 = 0;
          goto LABEL_15;
        }
LABEL_25:

      }
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v35);
  }

  return v33;
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
    sub_100004A40();
    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100004988();
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
  return (Class)objc_opt_class(FRNewsReferralItemWidgetArticleListEncodableElement);
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

@end
