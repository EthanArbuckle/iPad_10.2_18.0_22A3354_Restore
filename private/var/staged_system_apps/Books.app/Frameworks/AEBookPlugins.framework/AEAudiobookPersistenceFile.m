@implementation AEAudiobookPersistenceFile

- (int64_t)eventThreshold
{
  return 1;
}

- (NSString)shortName
{
  return (NSString *)CFSTR("keyed archiver plist");
}

- (BOOL)isLocal
{
  return 1;
}

- (void)bookmarkTimeForAudiobook:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  AEAudiobookBookmarkTimeSnapshot *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void (**v20)(id, void *, id, double);
  double v21;
  double v22;
  void *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "assetID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication contextDirectoryForAssetWithID:](UIApplication, "contextDirectoryForAssetWithID:", v6));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLByAppendingPathComponent:", CFSTR("AEAudiobookBookmarkTimeSnapshot")));

    if (v9)
    {
      v25 = 0;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", v9, 0, &v25));
      v11 = v25;
      if (v10)
      {
        v24 = v11;
        v12 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v10, &v24);
        v13 = v24;

        if (v13)
        {
          v14 = 0;
        }
        else
        {
          v14 = -[AEAudiobookBookmarkTimeSnapshot initWithCoder:]([AEAudiobookBookmarkTimeSnapshot alloc], "initWithCoder:", v12);
          v15 = _AEBookPluginsAudiobookLog();
          v16 = objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            -[AEAudiobookBookmarkTimeSnapshot bookmarkTime](v14, "bookmarkTime");
            v18 = v17;
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[AEAudiobookBookmarkTimeSnapshot bookmarkTimeTimestamp](v14, "bookmarkTimeTimestamp"));
            *(_DWORD *)buf = 134218498;
            v27 = v18;
            v28 = 2112;
            v29 = v6;
            v30 = 2114;
            v31 = v19;
            _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Unarchived bookmarkTimeSnapshot:%lf assetID:%@ timestamp:%{public}@", buf, 0x20u);

          }
        }

        v11 = v13;
      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", AssetEngineErrorDomain, 2005, 0));
      v14 = 0;
    }

  }
  else
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", AssetEngineErrorDomain, 2005, 0));
    v14 = 0;
  }
  v20 = (void (**)(id, void *, id, double))objc_retainBlock(v5);

  if (v20)
  {
    -[AEAudiobookBookmarkTimeSnapshot bookmarkTime](v14, "bookmarkTime");
    v22 = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[AEAudiobookBookmarkTimeSnapshot bookmarkTimeTimestamp](v14, "bookmarkTimeTimestamp"));
    v20[2](v20, v23, v11, v22);

  }
}

- (void)saveBookmarkTime:(double)a3 audiobook:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  AEAudiobookBookmarkTimeSnapshot *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void (**v25)(id, void *);
  id v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "assetID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v10 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
  if (v10)
  {
    v11 = -[AEAudiobookBookmarkTimeSnapshot initWithBookmarkTime:bookmarkTimeTimestamp:]([AEAudiobookBookmarkTimeSnapshot alloc], "initWithBookmarkTime:bookmarkTimeTimestamp:", v9, a3);
    -[AEAudiobookBookmarkTimeSnapshot encodeWithCoder:](v11, "encodeWithCoder:", v10);
    objc_msgSend(v10, "finishEncoding");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "encodedData"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication contextDirectoryForAssetWithID:](UIApplication, "contextDirectoryForAssetWithID:", v8));
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v27 = 0;
      objc_msgSend(v14, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v13, 1, 0, &v27);
      v15 = v27;

      if (!v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v13));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "URLByAppendingPathComponent:", CFSTR("AEAudiobookBookmarkTimeSnapshot")));

        if (v17)
        {
          v18 = _AEBookPluginsAudiobookLog();
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            -[AEAudiobookBookmarkTimeSnapshot bookmarkTime](v11, "bookmarkTime");
            v21 = v20;
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[AEAudiobookBookmarkTimeSnapshot bookmarkTimeTimestamp](v11, "bookmarkTimeTimestamp"));
            *(_DWORD *)buf = 134218498;
            v29 = v21;
            v30 = 2112;
            v31 = v8;
            v32 = 2114;
            v33 = v22;
            _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Archiving bookmarkTimeSnapshot:%lf assetID:%@ timestamp:%{public}@", buf, 0x20u);

          }
          v26 = 0;
          objc_msgSend(v12, "writeToURL:options:error:", v17, 1, &v26);
          v23 = v26;
        }
        else
        {
          v23 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", AssetEngineErrorDomain, 2005, 0));
        }
        v15 = v23;

      }
      v24 = 0;
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", AssetEngineErrorDomain, 2005, 0));
    }

  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", AssetEngineErrorDomain, 2005, 0));
  }
  v25 = (void (**)(id, void *))objc_retainBlock(v7);

  if (v25)
    v25[2](v25, v24);

}

@end
