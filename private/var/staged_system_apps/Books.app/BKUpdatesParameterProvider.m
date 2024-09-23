@implementation BKUpdatesParameterProvider

+ (void)fetchUpdateParametersForLibraryAsset:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  const __CFString **v10;
  NSErrorUserInfoKey *v11;
  uint64_t updated;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSErrorUserInfoKey v20;
  const __CFString *v21;
  NSErrorUserInfoKey v22;
  const __CFString *v23;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storeID"));
  if (objc_msgSend(v8, "length"))
  {
    if ((objc_msgSend(v6, "isAudiobook") & 1) == 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "versionNumber"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringValue"));
      objc_msgSend(a1, "_fetchUpdateParametersForAdamID:version:completion:", v8, v19, v7);

      goto LABEL_11;
    }
    v22 = NSLocalizedDescriptionKey;
    v23 = CFSTR("Audiobook not supported for fetchUpdateParameters");
    v10 = &v23;
    v11 = &v22;
  }
  else
  {
    updated = BKStoreBookUpdateLog(0, v9);
    v13 = objc_claimAutoreleasedReturnValue(updated);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1006A1810(v13);

    v20 = NSLocalizedDescriptionKey;
    v21 = CFSTR("book unexpectedly has nil/empty storeID.");
    v10 = &v21;
    v11 = &v20;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v11, 1));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BKUpdatesParameterProviderDomain"), -1, v14));

  v16 = objc_retainBlock(v7);
  v17 = v16;
  if (v16)
    (*((void (**)(id, _QWORD, void *))v16 + 2))(v16, 0, v15);

LABEL_11:
}

+ (void)_fetchUpdateParametersForAdamID:(id)a3 version:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  BKViewBookUpdatesOperation *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[BKViewBookUpdatesOperation initWithAdamID:version:]([BKViewBookUpdatesOperation alloc], "initWithAdamID:version:", v8, v9);
  objc_initWeak(&location, v11);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001263B0;
  v14[3] = &unk_1008E7F50;
  objc_copyWeak(&v16, &location);
  v12 = v10;
  v15 = v12;
  -[BKViewBookUpdatesOperation setCompletionBlock:](v11, "setCompletionBlock:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_fetchQueue"));
  objc_msgSend(v13, "addOperation:", v11);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

+ (id)_fetchQueue
{
  if (qword_1009F5038 != -1)
    dispatch_once(&qword_1009F5038, &stru_1008EB940);
  return (id)qword_1009F5030;
}

@end
