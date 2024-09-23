@implementation BKContinueReadingBooksProvider

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

- (BKContinueReadingBooksProvider)initWithLimit:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  BKContinueReadingBooksProvider *v10;
  _QWORD block[5];
  objc_super v13;
  uint8_t buf[4];
  unint64_t v15;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager fetchRequestForContinueReading](BKLibraryManager, "fetchRequestForContinueReading"));
  objc_msgSend(v5, "setFetchLimit:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BSUIAsset propertiesNeededFromBKLibraryAsset](BSUIAsset, "propertiesNeededFromBKLibraryAsset"));
  objc_msgSend(v5, "setPropertiesToFetch:", v6);

  v8 = BCCurrentBookLog(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Initializing continue reading books provider with limit %ld", buf, 0xCu);
  }

  v13.receiver = self;
  v13.super_class = (Class)BKContinueReadingBooksProvider;
  v10 = -[BKLibraryProvider initWithFetchRequest:name:](&v13, "initWithFetchRequest:name:", v5, CFSTR("continueReading"));
  if (v10)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100051AE0;
    block[3] = &unk_1008E7458;
    block[4] = a3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }

  return v10;
}

@end
