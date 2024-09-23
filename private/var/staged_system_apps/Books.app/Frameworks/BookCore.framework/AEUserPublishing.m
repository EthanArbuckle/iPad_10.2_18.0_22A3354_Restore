@implementation AEUserPublishing

+ (id)p_keyForPrefix:(id)a3 storeId:(id)a4
{
  return objc_msgSend(a3, "stringByAppendingString:", a4);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1506C8;
  block[3] = &unk_28B8C8;
  block[4] = a1;
  if (qword_311420 != -1)
    dispatch_once(&qword_311420, block);
  return (id)qword_311418;
}

- (AEUserPublishing)init
{
  AEUserPublishing *v2;
  NSCache *v3;
  NSCache *cache;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *workQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AEUserPublishing;
  v2 = -[AEUserPublishing init](&v10, "init");
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init((Class)NSCache);
    cache = v2->_cache;
    v2->_cache = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("com.apple.iBooks.AEUserPublishing.workQueue", v6);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v7;

    v2->_timeoutInterval = 2.0;
  }
  return v2;
}

- (id)bookInfoHTMLForStoreId:(id)a3 dataSource:(id)a4
{
  if (a4)
    return (id)objc_claimAutoreleasedReturnValue(-[AEUserPublishing p_generatedEmailBodyForStoreId:dataSource:](self, "p_generatedEmailBodyForStoreId:dataSource:", a3));
  else
    return 0;
}

- (id)wholeHTMLForStoreId:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "longLongValue"))
  {
    v8 = objc_msgSend((id)objc_opt_class(self), "p_keyForPrefix:storeId:", CFSTR("kWholeHTMLPrefix~"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishing cache](self, "cache"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v9));

    if (!v11)
    {
      if (-[AEUserPublishing p_isConnectedToInternet](self, "p_isConnectedToInternet"))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.1f"), 0x4014000000000000));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishing p_downloadEmailContentForStoreId:dataSource:overrideClientVersion:](self, "p_downloadEmailContentForStoreId:dataSource:overrideClientVersion:", v6, v7, v12));
        if (objc_msgSend(v11, "length"))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishing cache](self, "cache"));
          objc_msgSend(v13, "setObject:forKey:", v11, v9);
        }
        else
        {
          v13 = v11;
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)storeURLForStoreId:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSDate *v12;
  NSDate *lastFetchStoreURLDate;
  uint64_t v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "longLongValue"))
  {
    v8 = objc_msgSend((id)objc_opt_class(self), "p_keyForPrefix:storeId:", CFSTR("kStoreURLPrefix~"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishing cache](self, "cache"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v9));

    if (!v11)
    {
      if (-[AEUserPublishing p_isConnectedToInternet](self, "p_isConnectedToInternet")
        && !-[AEUserPublishing hasRecentlyTriedToFetchStoreURLFromNetwork](self, "hasRecentlyTriedToFetchStoreURLFromNetwork")&& (v12 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now")), lastFetchStoreURLDate = self->lastFetchStoreURLDate, self->lastFetchStoreURLDate = v12, lastFetchStoreURLDate, (v14 = objc_claimAutoreleasedReturnValue(-[AEUserPublishing p_downloadedStoreUrlForStoreId:keyProfile:path:dataSource:](self, "p_downloadedStoreUrlForStoreId:keyProfile:path:dataSource:", v6, CFSTR("kAEUserPublishingLookProfileURL"), CFSTR("url"), v7))) != 0))
      {
        v11 = (void *)v14;
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishing cache](self, "cache"));
        objc_msgSend(v15, "setObject:forKey:", v11, v9);

      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishing p_storeURLForStoreId:dataSource:](self, "p_storeURLForStoreId:dataSource:", v6, v7));
      }
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)hasRecentlyTriedToFetchStoreURLFromNetwork
{
  void *v3;
  double v4;
  double v5;

  if (!self->lastFetchStoreURLDate)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(v3, "timeIntervalSinceDate:", self->lastFetchStoreURLDate);
  v5 = v4;

  return v5 < 30.0;
}

- (id)storeShortURLForStoreId:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSDate *v12;
  NSDate *lastFetchShortStoreURLDate;
  uint64_t v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "longLongValue"))
  {
    v8 = objc_msgSend((id)objc_opt_class(self), "p_keyForPrefix:storeId:", CFSTR("kStoreShortURLPrefix~"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishing cache](self, "cache"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v9));

    if (!v11)
    {
      if (-[AEUserPublishing p_isConnectedToInternet](self, "p_isConnectedToInternet")
        && !-[AEUserPublishing hasRecentlyTriedToFetchShortStoreURLFromNetwork](self, "hasRecentlyTriedToFetchShortStoreURLFromNetwork")&& (v12 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now")), lastFetchShortStoreURLDate = self->lastFetchShortStoreURLDate, self->lastFetchShortStoreURLDate = v12, lastFetchShortStoreURLDate, (v14 = objc_claimAutoreleasedReturnValue(-[AEUserPublishing p_downloadedStoreUrlForStoreId:keyProfile:path:dataSource:](self, "p_downloadedStoreUrlForStoreId:keyProfile:path:dataSource:", v6, CFSTR("kAEUserPublishingLookProfileURL"), CFSTR("shortUrl"), v7))) != 0))
      {
        v11 = (void *)v14;
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishing cache](self, "cache"));
        objc_msgSend(v15, "setObject:forKey:", v11, v9);

      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishing p_storeShortURLForStoreId:dataSource:](self, "p_storeShortURLForStoreId:dataSource:", v6, v7));
      }
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)hasRecentlyTriedToFetchShortStoreURLFromNetwork
{
  void *v3;
  double v4;
  double v5;

  if (!self->lastFetchShortStoreURLDate)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(v3, "timeIntervalSinceDate:", self->lastFetchShortStoreURLDate);
  v5 = v4;

  return v5 < 30.0;
}

- (void)productProfilesForStoreIDs:(id)a3 completion:(id)a4
{
  -[AEUserPublishing profilesForStoreIDs:keyProfile:completion:](self, "profilesForStoreIDs:keyProfile:completion:", a3, CFSTR("kAEUserPublishingLookProfileProduct"), a4);
}

- (void)lockupProfilesForStoreIDs:(id)a3 completion:(id)a4
{
  -[AEUserPublishing profilesForStoreIDs:keyProfile:completion:](self, "profilesForStoreIDs:keyProfile:completion:", a3, CFSTR("kAEUserPublishingLookProfileLockUp"), a4);
}

- (void)profilesForStoreIDs:(id)a3 keyProfile:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  Class v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  Class v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = NSClassFromString(CFSTR("AEUserPublishingLookUpRequest"));
  if (-[objc_class isEnabled](v11, "isEnabled"))
  {
    if (objc_msgSend(v8, "count"))
    {
      v12 = objc_claimAutoreleasedReturnValue(-[AEUserPublishing workQueue](self, "workQueue"));
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_150DD4;
      v14[3] = &unk_2927D8;
      v15 = v8;
      v18 = v11;
      v16 = v9;
      v17 = v10;
      dispatch_async(v12, v14);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, 0, 0, 0);
    }
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("AEUserPublishingErrorDomain"), -1000, 0));
    (*((void (**)(id, _QWORD, _QWORD, void *))v10 + 2))(v10, 0, 0, v13);

  }
}

- (BOOL)p_isConnectedToInternet
{
  void *v2;
  unsigned int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BKReachability sharedReachabilityForInternetConnection](BKReachability, "sharedReachabilityForInternetConnection"));
  if (objc_msgSend(v2, "currentReachabilityStatus"))
    v3 = objc_msgSend(v2, "connectionRequired") ^ 1;
  else
    LOBYTE(v3) = 0;

  return v3;
}

- (id)p_downloadEmailContentForStoreId:(id)a3 dataSource:(id)a4 overrideClientVersion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  dispatch_semaphore_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  _QWORD v30[4];
  NSObject *v31;
  uint64_t *v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  _QWORD v41[5];
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishing p_downloadedStoreUrlForStoreId:keyProfile:path:dataSource:](self, "p_downloadedStoreUrlForStoreId:keyProfile:path:dataSource:", v8, CFSTR("kAEUserPublishingLookProfileProduct"), CFSTR("tellAFriendMessageContentsUrl"), 0));
  if (!v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userPublishing:tellAFriendEmailBaseURLForStoreId:", self, v8));
    v13 = v12;
    if (v12)
      v14 = v12;
    else
      v14 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("https://userpub.itunes.apple.com/WebObjects/MZUserPublishing.woa/wa/tellAFriendEmailBody?displayable-kind=25")));
    v15 = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "absoluteString"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@&id=%@"), v16, v8));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v17));
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](NSMutableURLRequest, "requestWithURL:", v11));
  -[AEUserPublishing timeoutInterval](self, "timeoutInterval");
  objc_msgSend(v18, "setTimeoutInterval:");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[BCUserAgent clientUserAgentWithOverrideVersion:](BCUserAgent, "clientUserAgentWithOverrideVersion:", v10));
  objc_msgSend(v18, "setValue:forHTTPHeaderField:", v19, CFSTR("User-Agent"));

  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = sub_1510E8;
  v47 = sub_1510F8;
  v48 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = sub_1510E8;
  v41[4] = sub_1510F8;
  v42 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = sub_1510E8;
  v39 = sub_1510F8;
  v40 = 0;
  v20 = dispatch_semaphore_create(0);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sharedSession](NSURLSession, "sharedSession"));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1519E0;
  v30[3] = &unk_292800;
  v32 = &v35;
  v33 = v41;
  v34 = &v43;
  v22 = v20;
  v31 = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "dataTaskWithRequest:completionHandler:", v18, v30));
  objc_msgSend(v23, "resume");
  dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
  if (v36[5] && (v24 = (void *)v44[5]) != 0 && objc_msgSend(v24, "statusCode") == stru_B8.segname)
  {
    v25 = objc_alloc((Class)NSString);
    v26 = objc_msgSend(v25, "initWithData:encoding:", v36[5], 4);
    v27 = objc_msgSend(v26, "rangeOfString:", CFSTR("<html"));
    if (v27 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "substringFromIndex:", v27));

      v26 = (id)v28;
    }
  }
  else
  {
    v26 = 0;
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(v41, 8);

  _Block_object_dispose(&v43, 8);
  return v26;
}

- (id)p_generatedEmailBodyForStoreId:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  NSBundle *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _UNKNOWN **v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  uint64_t v30;

  v6 = a3;
  v7 = a4;
  if (-[AEUserPublishing p_isLocalGenerationEnabledForStoreId:dataSource:](self, "p_isLocalGenerationEnabledForStoreId:dataSource:", v6, v7))
  {
    v8 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pathForResource:ofType:", CFSTR("AEAssetInfo.html"), CFSTR("tmpl")));

    if (v10)
    {
      v30 = 0;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithContentsOfFile:encoding:error:](NSMutableString, "stringWithContentsOfFile:encoding:error:", v10, 4, &v30));
      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishing p_assetAuthorForStoreId:dataSource:](self, "p_assetAuthorForStoreId:dataSource:", v6, v7));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishing p_assetTitleForStoreId:dataSource:](self, "p_assetTitleForStoreId:dataSource:", v6, v7));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishing p_storeURLForStoreId:dataSource:](self, "p_storeURLForStoreId:dataSource:", v6, v7));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishing p_assetCategoryForStoreId:dataSource:](self, "p_assetCategoryForStoreId:dataSource:", v6, v7));
        v15 = CATransaction_ptr;
        if (objc_msgSend(v12, "length"))
        {
          v16 = IMCommonCoreBundle();
          v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("by %@"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v12));

          v15 = CATransaction_ptr;
          objc_msgSend(v11, "replaceOccurrencesOfString:withString:options:range:", CFSTR("<!-- %%AUTHOR%% -->"), v19, 0, 0, objc_msgSend(v11, "length"));

        }
        if (objc_msgSend(v13, "length"))
        {
          v20 = v13;
          if (v29)
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "absoluteString"));
            v22 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<a href=\"%@\">%@</a>"), v21, v20));

            v20 = (id)v22;
            v15 = CATransaction_ptr;
          }
          objc_msgSend(v11, "replaceOccurrencesOfString:withString:options:range:", CFSTR("<!-- %%TITLE%% -->"), v20, 0, 0, objc_msgSend(v11, "length"));

        }
        if (objc_msgSend(v14, "length"))
        {
          v23 = IMCommonCoreBundle();
          v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Category: %@"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v25, v14));

          objc_msgSend(v11, "replaceOccurrencesOfString:withString:options:range:", CFSTR("<!-- %%CATEGORY%% -->"), v26, 0, 0, objc_msgSend(v11, "length"));
          v15 = CATransaction_ptr;
        }
        else
        {
          objc_msgSend(v11, "replaceOccurrencesOfString:withString:options:range:", CFSTR("<!-- %%CATEGORY%% -->"), &stru_296430, 0, 0, objc_msgSend(v11, "length"));
        }
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15[107], "stringWithString:", v11));

      }
      else
      {
        v27 = 0;
      }

    }
    else
    {
      v27 = 0;
    }

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (id)p_downloadedStoreUrlForStoreId:(id)a3 keyProfile:(id)a4 path:(id)a5 dataSource:(id)a6
{
  id v10;
  id v11;
  id v12;
  objc_class *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  char *v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  id v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (-[AEUserPublishing p_isDownloadEnabledForStoreId:dataSource:](self, "p_isDownloadEnabledForStoreId:dataSource:", v10, a6)&& (v13 = NSClassFromString(CFSTR("AEUserPublishingLookUpRequest")), -[objc_class isEnabled](v13, "isEnabled")))
  {
    v14 = [v13 alloc];
    v35 = v10;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v35, 1));
    v16 = objc_msgSend(v14, "initWithAdamIDs:keyProfile:", v15, v11);

    -[AEUserPublishing timeoutInterval](self, "timeoutInterval");
    v28 = 0;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "resultWithTimeout:Error:", &v28));
    v18 = (char *)v28;
    if (v18)
    {
      v19 = BCIMLog();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v30 = "-[AEUserPublishing p_downloadedStoreUrlForStoreId:keyProfile:path:dataSource:]";
        v31 = 2080;
        v32 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Sharing/Annotations/Private/AEUserPublishing.m";
        v33 = 1024;
        v34 = 484;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
      }

      v21 = BCIMLog();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v18;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "@\"Failed to get storeURL -- Error {%@}\", buf, 0xCu);
      }
      v23 = 0;
    }
    else
    {
      v24 = objc_msgSend((id)objc_opt_class(v16), "resultsDictionaryFromLookupResult:", v17);
      v22 = objc_claimAutoreleasedReturnValue(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v22, "objectForKey:", v10));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKey:", v12));
      if (objc_msgSend(v26, "length"))
        v23 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", v26);
      else
        v23 = 0;

    }
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (BOOL)p_isDownloadEnabledForStoreId:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  unsigned __int8 v8;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector(v7, "userPublishing:isDownloadEnabledForStoreId:") & 1) != 0)
    v8 = objc_msgSend(v7, "userPublishing:isDownloadEnabledForStoreId:", self, v6);
  else
    v8 = 1;

  return v8;
}

- (BOOL)p_isLocalGenerationEnabledForStoreId:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  unsigned __int8 v8;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector(v7, "userPublishing:isLocalGenerationEnabledForStoreId:") & 1) != 0)
    v8 = objc_msgSend(v7, "userPublishing:isLocalGenerationEnabledForStoreId:", self, v6);
  else
    v8 = 1;

  return v8;
}

- (id)p_assetAuthorForStoreId:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector(v7, "userPublishing:assetAuthorForStoreId:") & 1) != 0)
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userPublishing:assetAuthorForStoreId:", self, v6));
  else
    v8 = 0;

  return v8;
}

- (id)p_assetTitleForStoreId:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector(v7, "userPublishing:assetTitleForStoreId:") & 1) != 0)
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userPublishing:assetTitleForStoreId:", self, v6));
  else
    v8 = 0;

  return v8;
}

- (id)p_assetCategoryForStoreId:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector(v7, "userPublishing:assetCategoryForStoreId:") & 1) != 0)
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userPublishing:assetCategoryForStoreId:", self, v6));
  else
    v8 = 0;

  return v8;
}

- (id)p_storeURLForStoreId:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector(v7, "userPublishing:storeURLForStoreId:") & 1) != 0)
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userPublishing:storeURLForStoreId:", self, v6));
  else
    v8 = 0;

  return v8;
}

- (id)p_storeShortURLForStoreId:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector(v7, "userPublishing:storeShortURLForStoreId:") & 1) != 0)
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userPublishing:storeShortURLForStoreId:", self, v6));
  else
    v8 = 0;

  return v8;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

- (NSCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->lastFetchShortStoreURLDate, 0);
  objc_storeStrong((id *)&self->lastFetchStoreURLDate, 0);
}

@end
