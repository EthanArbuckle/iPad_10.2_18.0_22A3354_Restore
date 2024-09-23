@implementation BKRecentBooksProvider

- (void)setLastKnownTopMostAsset:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownTopMostAsset, a3);
}

- (void)libraryProvider:(id)a3 contentDidLoad:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  id v13;
  uint8_t buf[4];
  void *v15;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  v7 = BCCurrentBookLog(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assetID"));
    *(_DWORD *)buf = 138412290;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Setting up with current book: %@", buf, 0xCu);

  }
  -[BKRecentBooksProvider setLastKnownTopMostAsset:](self, "setLastKnownTopMostAsset:", v6);
  v12 = CFSTR("BKRecentBooksProviderAssetsKey");
  v13 = v5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));

  objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("BKRecentBooksProviderDidChangeNotification"), 0, v10);
}

- (BKRecentBooksProvider)initWithLimit:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  BKRecentBooksProvider *v10;
  BKRecentBooksProvider *v11;
  _QWORD block[5];
  objc_super v14;
  uint8_t buf[4];
  unint64_t v16;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager fetchRequestForRecentlyEngaged](BKLibraryManager, "fetchRequestForRecentlyEngaged"));
  objc_msgSend(v5, "setFetchLimit:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BSUIAsset propertiesNeededFromBKLibraryAsset](BSUIAsset, "propertiesNeededFromBKLibraryAsset"));
  objc_msgSend(v5, "setPropertiesToFetch:", v6);

  v8 = BCCurrentBookLog(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v16 = a3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Initializing recent books provider with limit %ld", buf, 0xCu);
  }

  v14.receiver = self;
  v14.super_class = (Class)BKRecentBooksProvider;
  v10 = -[BKLibraryProvider initWithFetchRequest:name:](&v14, "initWithFetchRequest:name:", v5, CFSTR("recents"));
  v11 = v10;
  if (v10)
  {
    -[BKLibraryProvider setDelegate:](v10, "setDelegate:", v10);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100016A00;
    block[3] = &unk_1008E7458;
    block[4] = a3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }

  return v11;
}

+ (id)getInstance:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v12;
  void *v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BCJSConfiguration sharedInstance](BCJSConfiguration, "sharedInstance"));
  v12 = BCJSNumberOfBooksInRecentsKey;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v13 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
  objc_msgSend(v5, "updateConfiguration:", v7);

  v8 = objc_alloc((Class)a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "numberOfBooksAllowedInRecentsList"));
  v10 = objc_msgSend(v8, "initWithLimit:", objc_msgSend(v9, "integerValue"));

  return v10;
}

+ (void)recentBooksAssetIDs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000BAD70;
  v6[3] = &unk_1008E9860;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "performBlockOnWorkerQueue:", v6);

}

- (void)libraryProvider:(id)a3 contentDidChange:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKRecentBooksProvider lastKnownTopMostAsset](self, "lastKnownTopMostAsset"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetID"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assetID"));
  if ((objc_msgSend(v9, "isEqualToString:", v8) & 1) != 0)
  {
    v10 = objc_msgSend(v6, "isLocal");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKRecentBooksProvider lastKnownTopMostAsset](self, "lastKnownTopMostAsset"));
    v12 = objc_msgSend(v11, "isLocal");

    if (v10 == v12)
      goto LABEL_8;
  }
  else
  {

  }
  v14 = BCCurrentBookLog(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assetID"));
    *(_DWORD *)buf = 138412546;
    v22 = v16;
    v23 = 2112;
    v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "New current book from a change in the FRC: %@ (was %@)", buf, 0x16u);

  }
  -[BKRecentBooksProvider setLastKnownTopMostAsset:](self, "setLastKnownTopMostAsset:", v6);
  v19 = CFSTR("BKRecentBooksProviderAssetsKey");
  v20 = v5;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v18, "postNotificationName:object:userInfo:", CFSTR("BKRecentBooksProviderDidChangeNotification"), 0, v17);

LABEL_8:
}

- (BSUIAsset)lastKnownTopMostAsset
{
  return self->_lastKnownTopMostAsset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastKnownTopMostAsset, 0);
}

@end
