@implementation APServerConfigurationSettings

+ (id)storageWithDefaultValues:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)APSettingsStorageKeychain), "initWithDefaultValues:", v3);

  return v4;
}

- (NSDictionary)serverConfig
{
  void *v3;
  void *v4;

  v3 = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APServerConfigurationSettings _loadServerConfig](self, "_loadServerConfig"));
  objc_autoreleasePoolPop(v3);
  return (NSDictionary *)v4;
}

- (id)_loadServerConfig
{
  void *v2;
  id v3;
  id v4;
  id v5;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, void *);
  void *v10;
  id v11;
  id v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APServerConfigurationSettings serverConfigRecord](self, "serverConfigRecord"));
  if (objc_msgSend(v2, "count"))
  {
    v7 = _NSConcreteStackBlock;
    v8 = 3221225472;
    v9 = sub_10002830C;
    v10 = &unk_1002143F8;
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v12 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v2, "count"));
    v3 = v12;
    v4 = v11;
    objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", &v7);
    v5 = objc_msgSend(v3, "copy", v7, v8, v9, v10);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
