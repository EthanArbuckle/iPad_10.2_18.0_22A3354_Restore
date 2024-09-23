@implementation STStorageDataService

- (void)storageInfoDict:(id)a3
{
  void (**v3)(id, void *);
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint8_t v8[16];

  v3 = (void (**)(id, void *))a3;
  v4 = sub_100002C24();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handling request for StorageData info", v8, 2u);
  }

  v6 = objc_alloc_init((Class)STStorageDataInterface);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storageInfoDict"));
  if (v3)
    v3[2](v3, v7);

}

@end
