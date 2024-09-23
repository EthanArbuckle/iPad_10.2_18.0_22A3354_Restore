@implementation FRReferredArticle

- (FRReferredArticle)initWithArticleID:(id)a3 sourceChannelID:(id)a4 sectionData:(id)a5 flintDocumentAssetHandle:(id)a6 articleRecordData:(id)a7 sourceChannelRecordData:(id)a8 parentIssueRecordData:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  FRReferredArticle *v21;
  NSString *v22;
  NSString *articleID;
  NSString *v24;
  NSString *sourceChannelID;
  NSData *v26;
  NSData *articleRecordData;
  NSData *v28;
  NSData *sourceChannelRecordData;
  NSData *v30;
  NSData *parentIssueRecordData;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  id v37;
  objc_super v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;

  v15 = a3;
  v16 = a4;
  v37 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v38.receiver = self;
  v38.super_class = (Class)FRReferredArticle;
  v21 = -[FRReferredArticle init](&v38, "init");
  if (v21)
  {
    v22 = (NSString *)objc_msgSend(v15, "copy");
    articleID = v21->_articleID;
    v21->_articleID = v22;

    v24 = (NSString *)objc_msgSend(v16, "copy");
    sourceChannelID = v21->_sourceChannelID;
    v21->_sourceChannelID = v24;

    objc_storeStrong((id *)&v21->_sectionData, a5);
    objc_storeStrong((id *)&v21->_flintDocumentAssetHandle, a6);
    v26 = (NSData *)objc_msgSend(v18, "copy");
    articleRecordData = v21->_articleRecordData;
    v21->_articleRecordData = v26;

    v28 = (NSData *)objc_msgSend(v19, "copy");
    sourceChannelRecordData = v21->_sourceChannelRecordData;
    v21->_sourceChannelRecordData = v28;

    v30 = (NSData *)objc_msgSend(v20, "copy");
    parentIssueRecordData = v21->_parentIssueRecordData;
    v21->_parentIssueRecordData = v30;

    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "filePath"));
    if (v32)
    {
      v33 = (void *)FCDefaultLog;
      if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_DEFAULT))
      {
        v34 = v33;
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "uniqueKey"));
        *(_DWORD *)buf = 138543618;
        v40 = v35;
        v41 = 2114;
        v42 = v15;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "initializing referredArticle with prefetched JSON %{public}@ to asset manager for article %{public}@", buf, 0x16u);

      }
    }
  }

  return v21;
}

- (id)headlineWithContentContext:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;

  v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100082E84();
  v5 = objc_claimAutoreleasedReturnValue(-[FRReferredArticle articleRecordData](self, "articleRecordData"));
  if (!v5)
    goto LABEL_12;
  v6 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRReferredArticle sourceChannelID](self, "sourceChannelID"));

  if (!v7)
    goto LABEL_12;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tagController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRReferredArticle sourceChannelID](self, "sourceChannelID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "slowCachedTagForID:", v9));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "asChannel"));

  if (v11
    || (v20 = (void *)objc_claimAutoreleasedReturnValue(-[FRReferredArticle sourceChannelRecordData](self, "sourceChannelRecordData")),
        v20,
        v20)
    && (v21 = objc_alloc((Class)FCTag),
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[FRReferredArticle sourceChannelRecordData](self, "sourceChannelRecordData")),
        v11 = objc_msgSend(v21, "initWithData:context:", v22, v4),
        v22,
        v11))
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(-[FRReferredArticle parentIssueRecordData](self, "parentIssueRecordData"));

    if (v12)
    {
      v13 = objc_alloc((Class)FCIssue);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[FRReferredArticle parentIssueRecordData](self, "parentIssueRecordData"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetManager"));
      v12 = objc_msgSend(v13, "initWithData:sourceChannel:assetManager:", v14, v11, v15);

    }
    v16 = objc_alloc((Class)FCArticleHeadline);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FRReferredArticle articleRecordData](self, "articleRecordData"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetManager"));
    v19 = objc_msgSend(v16, "initWithArticleRecordData:sourceChannel:parentIssue:assetManager:", v17, v11, v12, v18);

  }
  else
  {
LABEL_12:
    v19 = 0;
  }

  return v19;
}

- (NSString)articleID
{
  return self->_articleID;
}

- (FRSectionData)sectionData
{
  return self->_sectionData;
}

- (NSString)sourceChannelID
{
  return self->_sourceChannelID;
}

- (FCAssetHandle)flintDocumentAssetHandle
{
  return self->_flintDocumentAssetHandle;
}

- (NSData)articleRecordData
{
  return self->_articleRecordData;
}

- (NSData)sourceChannelRecordData
{
  return self->_sourceChannelRecordData;
}

- (NSData)parentIssueRecordData
{
  return self->_parentIssueRecordData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentIssueRecordData, 0);
  objc_storeStrong((id *)&self->_sourceChannelRecordData, 0);
  objc_storeStrong((id *)&self->_articleRecordData, 0);
  objc_storeStrong((id *)&self->_flintDocumentAssetHandle, 0);
  objc_storeStrong((id *)&self->_sourceChannelID, 0);
  objc_storeStrong((id *)&self->_sectionData, 0);
  objc_storeStrong((id *)&self->_articleID, 0);
}

@end
