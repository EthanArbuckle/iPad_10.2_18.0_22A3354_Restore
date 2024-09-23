@implementation _APRSBiomeBase

+ (id)config
{
  id v2;
  void *v3;

  v2 = +[BMStoreConfig newPrivateStreamDefaultConfigurationWithStoreBasePath:](BMStoreConfig, "newPrivateStreamDefaultConfigurationWithStoreBasePath:");
  v3 = (void *)qword_1001AB868;
  qword_1001AB868 = (uint64_t)v2;

  return (id)qword_1001AB868;
}

+ (void)setStoragePath:(id)a3
{
  objc_storeStrong((id *)&qword_1001AB860, a3);
}

+ (id)getStoragePath
{
  return (id)qword_1001AB860;
}

+ (id)eventStream
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_APRSBiomeBase config](_APRSBiomeBase, "config"));
  v4 = (objc_class *)objc_opt_class(a1);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringFromIndex:", 1));

  v8 = objc_msgSend(objc_alloc((Class)BMStoreStream), "initWithPrivateStreamIdentifier:storeConfig:", v7, v3);
  return v8;
}

+ (id)sourceForStream
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_msgSend((id)objc_opt_class(a1), "eventStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "source"));

  return v4;
}

+ (id)sharedEventQueue
{
  if (qword_1001AB878 != -1)
    dispatch_once(&qword_1001AB878, &stru_10015E530);
  return (id)qword_1001AB870;
}

+ (void)postEvent:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(a1), "eventStream");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "source"));

  objc_msgSend((id)objc_opt_class(a1), "postEvent:usingSource:", v4, v7);
}

+ (void)postEvent:(id)a3 usingSource:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(+[_APRSBiomeBase sharedEventQueue](_APRSBiomeBase, "sharedEventQueue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10005A584;
  v10[3] = &unk_10015D558;
  v11 = v6;
  v12 = v5;
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, v10);

}

+ (id)publisherForEventsStartingFromDate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(a1), "eventStream");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "publisherFromStartTime:", v8));
  return v9;
}

+ (void)pruneEventsOlderThanDate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "eventStream"));
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v7 = v6;

  v8 = objc_claimAutoreleasedReturnValue(+[_APRSBiomeBase sharedEventQueue](_APRSBiomeBase, "sharedEventQueue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10005A6BC;
  v10[3] = &unk_10015DF50;
  v11 = v5;
  v12 = v7;
  v9 = v5;
  dispatch_async(v8, v10);

}

@end
