@implementation AEAssetURLActivityItemProvider

- (AEAssetURLActivityItemProvider)initWithDelegate:(id)a3 propertySource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  AEAssetURLActivityItemProvider *v9;
  objc_super v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", &stru_296430));
  v11.receiver = self;
  v11.super_class = (Class)AEAssetURLActivityItemProvider;
  v9 = -[AEAssetBaseActivityItemProvider initWithDelegate:placeholderItem:propertySource:](&v11, "initWithDelegate:placeholderItem:propertySource:", v7, v8, v6);

  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_temporaryURL)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    objc_msgSend(v3, "removeItemAtURL:error:", self->_temporaryURL, 0);

  }
  v4.receiver = self;
  v4.super_class = (Class)AEAssetURLActivityItemProvider;
  -[AEAssetURLActivityItemProvider dealloc](&v4, "dealloc");
}

- (BOOL)supportsActivityType:(id)a3
{
  return 1;
}

- (id)placeholderItem
{
  void *v3;
  NSURL *v4;
  NSURL *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetBaseActivityItemProvider propertyProvider](self, "propertyProvider"));
  if ((objc_msgSend(v3, "isStoreAsset") & 1) != 0)
    v4 = objc_opt_new(NSURL);
  else
    v4 = (NSURL *)objc_claimAutoreleasedReturnValue(-[AEAssetURLActivityItemProvider _tempBookURL](self, "_tempBookURL"));
  v5 = v4;

  return v5;
}

- (id)item
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  id v15;
  uint64_t *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  AEAssetURLActivityItemProvider *v25;
  uint64_t *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetURLActivityItemProvider activityType](self, "activityType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetBaseActivityItemProvider propertyProvider](self, "propertyProvider"));
  objc_msgSend(v4, "setActivityType:", v3);

  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_77374;
  v33 = sub_77384;
  v34 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetURLActivityItemProvider activityType](self, "activityType"));
  LODWORD(v4) = -[AEAssetBaseActivityItemProvider shouldShareActivityType:](self, "shouldShareActivityType:", v5);

  if ((_DWORD)v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetBaseActivityItemProvider propertyProvider](self, "propertyProvider"));
    if (objc_msgSend(v6, "isStoreAsset"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetBaseActivityItemProvider propertyProvider](self, "propertyProvider"));
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "storeURL"));
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetBaseActivityItemProvider propertyProvider](self, "propertyProvider"));
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bookURL"));
    }
    v9 = (void *)v8;

    if (objc_msgSend(v9, "isFileURL"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetURLActivityItemProvider _tempBookURL](self, "_tempBookURL"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));
      v13 = objc_msgSend(v11, "fileExistsAtPath:", v12);

      if (v13
        && (v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path")),
            v28 = 0,
            objc_msgSend(v11, "removeItemAtPath:error:", v14, &v28),
            v15 = v28,
            v14,
            v15))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_1B4DB4();
      }
      else
      {
        v18 = objc_msgSend(objc_alloc((Class)NSFileCoordinator), "initWithFilePresenter:", 0);
        v27 = 0;
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_7738C;
        v22[3] = &unk_28EEB0;
        v23 = v11;
        v25 = self;
        v26 = &v29;
        v24 = v10;
        objc_msgSend(v18, "coordinateReadingItemAtURL:options:error:byAccessor:", v9, 1, &v27, v22);
        v19 = v27;
        if (v19 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_1B4D4C();

        v15 = 0;
      }

    }
    else
    {
      v16 = v30;
      v17 = v9;
      v15 = (id)v16[5];
      v16[5] = (uint64_t)v17;
    }

  }
  v20 = (id)v30[5];
  _Block_object_dispose(&v29, 8);

  return v20;
}

- (id)_tempBookURL
{
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSURL *v12;
  NSURL *v13;
  id v15;

  v3 = NSTemporaryDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Sharing")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  if ((objc_msgSend(v6, "fileExistsAtPath:", v5) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v15 = 0;
    objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v15);
    v7 = v15;
    if (v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1B4F18();
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v5, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetBaseActivityItemProvider propertyProvider](self, "propertyProvider"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bookURL"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));

  if (v11)
  {
    v12 = (NSURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLByAppendingPathComponent:", v11));
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1B4E84(self);
    v12 = objc_opt_new(NSURL);
  }
  v13 = v12;

  return v13;
}

- (NSURL)temporaryURL
{
  return self->_temporaryURL;
}

- (void)setTemporaryURL:(id)a3
{
  objc_storeStrong((id *)&self->_temporaryURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryURL, 0);
}

@end
