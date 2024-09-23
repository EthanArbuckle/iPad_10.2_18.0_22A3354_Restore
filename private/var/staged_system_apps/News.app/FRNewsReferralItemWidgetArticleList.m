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
    sub_10007A0C4();
    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007A00C();
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
  uint64_t v5;
  void *i;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  FRReferredArticle *v23;
  id v25;
  FRNewsReferralItemWidgetArticleList *v26;
  id obj;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  id v37;
  id v38;
  FRSectionData *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];

  v25 = a3;
  if (!v25 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007A17C();
  v35 = (id)objc_opt_new(NSMutableArray, v4);
  v26 = self;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[FRNewsReferralItemWidgetArticleList JSONArray](self, "JSONArray"));
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v37)
  {
    v36 = *(_QWORD *)v46;
    v34 = FCWidgetArticleListArticleID;
    v33 = FCWidgetArticleListSourceChannelID;
    v32 = FCWidgetArticleListSectionName;
    v31 = FCWidgetArticleListFlintDocumentURL;
    v30 = FCWidgetArticleListArticleRecordData;
    v29 = FCWidgetArticleListSourceChannelRecordData;
    v28 = FCWidgetArticleListParentIssueRecordData;
    do
    {
      for (i = 0; i != v37; i = (char *)i + 1)
      {
        if (*(_QWORD *)v46 != v36)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
        v8 = objc_opt_class(NSDictionary, v5);
        v9 = FCDynamicCast(v8, v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        v11 = v10;
        if (v10)
        {
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v34));
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v33));
          v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v32));
          v39 = -[FRSectionData initWithName:]([FRSectionData alloc], "initWithName:", v12);
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v31));
          v42 = (void *)v13;
          v43 = (void *)v12;
          if (v13)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v13));
            if (v14)
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue(-[FRNewsReferralItemWidgetArticleList flintDocumentURLAssetHandlesByRemoteURL](v26, "flintDocumentURLAssetHandlesByRemoteURL"));
              v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v14));

              v17 = (void *)v16;
LABEL_15:
              v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v30));
              if (v18)
                v38 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v18, 0);
              else
                v38 = 0;
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v29));
              v41 = (void *)v18;
              if (v19)
                v20 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v19, 0);
              else
                v20 = 0;
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v28));
              if (v21)
                v22 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v21, 0);
              else
                v22 = 0;
              v23 = -[FRReferredArticle initWithArticleID:sourceChannelID:sectionData:flintDocumentAssetHandle:articleRecordData:sourceChannelRecordData:parentIssueRecordData:]([FRReferredArticle alloc], "initWithArticleID:sourceChannelID:sectionData:flintDocumentAssetHandle:articleRecordData:sourceChannelRecordData:parentIssueRecordData:", v44, v40, v39, v17, v38, v20, v22);
              objc_msgSend(v35, "addObject:", v23);

              goto LABEL_25;
            }
          }
          else
          {
            v14 = 0;
          }
          v17 = 0;
          goto LABEL_15;
        }
LABEL_25:

      }
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    }
    while (v37);
  }

  return v35;
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
    sub_10007A2EC();
    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007A234();
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

@end
