@implementation FMDAssetRegistry

- (FMDAssetRegistry)initWithStorageLocation:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  FMDAssetRegistry *v8;
  FMDAssetRegistry *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  dispatch_queue_t v16;
  FMDBackgroundServerChannel *v17;
  FMDServerInteractionController *v18;
  void *v19;
  FMDServerInteractionController *v20;
  objc_super v22;
  FMDBackgroundServerChannel *v23;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)FMDAssetRegistry;
  v8 = -[FMDAssetRegistry init](&v22, "init");
  v9 = v8;
  if (v8)
  {
    -[FMDAssetRegistry setStoreIdentifier:](v8, "setStoreIdentifier:", v7);
    -[FMDAssetRegistry setBaseStoragePath:](v9, "setBaseStoragePath:", v6);
    v10 = objc_alloc((Class)FMDataArchiver);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAssetRegistry registryFileURL](v9, "registryFileURL"));
    v12 = objc_msgSend(v10, "initWithFileURL:", v11);
    -[FMDAssetRegistry setDataArchiver:](v9, "setDataArchiver:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAssetRegistry dataArchiver](v9, "dataArchiver"));
    objc_msgSend(v13, "setDataProtectionClass:", 4);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAssetRegistry dataArchiver](v9, "dataArchiver"));
    objc_msgSend(v14, "setBackedUp:", 0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAssetRegistry dataArchiver](v9, "dataArchiver"));
    objc_msgSend(v15, "setCreateDirectories:", 1);

    v16 = dispatch_queue_create("com.apple.icloud.findmydeviced.FMDAssetRegistry.serialqueue", 0);
    -[FMDAssetRegistry setSerialQueue:](v9, "setSerialQueue:", v16);

    v17 = objc_alloc_init(FMDBackgroundServerChannel);
    v18 = [FMDServerInteractionController alloc];
    v23 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
    v20 = -[FMDServerInteractionController initWithChannels:delegate:](v18, "initWithChannels:delegate:", v19, 0);
    -[FMDAssetRegistry setServerInteractionController:](v9, "setServerInteractionController:", v20);

    -[FMDAssetRegistry resumeBackgroundAssetDownloads:](v9, "resumeBackgroundAssetDownloads:", v17);
  }

  return v9;
}

+ (id)defaultStorageLocation
{
  id v2;
  id v3;
  void *v4;
  void *v5;

  v2 = objc_alloc((Class)FMSharedFileContainer);
  v3 = objc_msgSend(v2, "initWithIdentifier:", off_100304A08);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("Caches/com.apple.icloud.findmydeviced.FMDAssetRegistry"), 1));

  return v5;
}

- (void)storeAsset:(id)a3 fromLocation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fileURL"));
  v20 = 0;
  v10 = objc_msgSend(v8, "copyItemAtURL:toURL:error:", v7, v9, &v20);

  v11 = v20;
  if (v10)
    v12 = v11 == 0;
  else
    v12 = 0;
  if (v12)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fileURL"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    v19 = 0;
    objc_msgSend(v15, "setResourceValue:forKey:error:", v16, NSURLIsExcludedFromBackupKey, &v19);
    v14 = v19;

    if (v14)
    {
      v17 = sub_1000031B8();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_10022B00C(v6);

    }
    -[FMDAssetRegistry saveAssetMetadata:](self, "saveAssetMetadata:", v6);
  }
  else
  {
    v13 = sub_1000031B8();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10022B0B4(v11, v10, v14);
  }

}

- (id)assetForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAssetRegistry assetsByURL](self, "assetsByURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (id)newAssetWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("url")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type")));

  v8 = -[FMDAssetRegistry newAssetForURL:type:](self, "newAssetForURL:type:", v6, -[FMDAssetRegistry assetTypeForString:](self, "assetTypeForString:", v7));
  return v8;
}

- (void)removeUntrackedAssets:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[FMDAssetRegistry serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007D564;
  block[3] = &unk_1002C11E8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)clearAssetRegistry
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[FMDAssetRegistry serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007D60C;
  block[3] = &unk_1002C1328;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (id)newAssetForURL:(id)a3 type:(unint64_t)a4
{
  id v6;
  FMDStandardAsset *v7;
  FMDStandardAsset *v8;
  void *v9;

  v6 = a3;
  v7 = (FMDStandardAsset *)objc_claimAutoreleasedReturnValue(-[FMDAssetRegistry assetForURL:](self, "assetForURL:", v6));
  if (!v7)
  {
    v8 = [FMDStandardAsset alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAssetRegistry generateAssetURL](self, "generateAssetURL"));
    v7 = -[FMDStandardAsset initWithFileURL:lastModified:etag:type:url:](v8, "initWithFileURL:lastModified:etag:type:url:", v9, 0, 0, a4, v6);

  }
  return v7;
}

- (unint64_t)assetTypeForString:(id)a3
{
  return objc_msgSend(CFSTR("locate_sound"), "isEqualToString:", a3);
}

- (void)_removeUntrackedAssets:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  NSDictionary *v25;
  NSDictionary *assetsByURL;
  NSDictionary *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  FMDAssetRegistry *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  id v48;
  _BYTE v49[128];
  _BYTE v50[128];

  v4 = a3;
  v32 = self;
  v35 = -[NSDictionary copy](self->_assetsByURL, "copy");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i), "url"));
        objc_msgSend(v5, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v8);
  }
  v33 = v6;

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "allKeys"));
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v38 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)j);
        if ((objc_msgSend(v5, "containsObject:", v17) & 1) == 0)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", v17));
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "fileURL"));
          v36 = 0;
          objc_msgSend(v19, "removeItemAtURL:error:", v20, &v36);
          v21 = v36;

          if (v21)
          {
            if ((objc_msgSend(v21, "fm_isFileNotFoundError") & 1) == 0)
            {
              v22 = sub_1000031B8();
              v23 = objc_claimAutoreleasedReturnValue(v22);
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                v24 = objc_msgSend(v21, "code");
                *(_DWORD *)buf = 138412546;
                v46 = v21;
                v47 = 2048;
                v48 = v24;
                _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Could not delete the file %@ %li", buf, 0x16u);
              }

            }
          }
          else
          {
            objc_msgSend(v34, "addObject:", v17);
          }

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    }
    while (v14);
  }
  v25 = (NSDictionary *)objc_msgSend(v35, "mutableCopy");
  -[NSDictionary removeObjectsForKeys:](v25, "removeObjectsForKeys:", v34);
  assetsByURL = v32->_assetsByURL;
  v32->_assetsByURL = v25;
  v27 = v25;

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAssetRegistry dataArchiver](v32, "dataArchiver"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "saveDictionary:", v27));

  if (v29)
  {
    v30 = sub_1000031B8();
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      sub_100228A90();

  }
}

- (void)saveAssetMetadata:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[FMDAssetRegistry serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007DBF8;
  block[3] = &unk_1002C11E8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (NSDictionary)assetsByURL
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_10007DDB0;
  v11 = sub_10007DDC0;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[FMDAssetRegistry serialQueue](self, "serialQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007DDC8;
  v6[3] = &unk_1002C11C0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (id)registryFileURL
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAssetRegistry storeIdentifier](self, "storeIdentifier"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAssetRegistry storeIdentifier](self, "storeIdentifier"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(".%@"), v4));

  }
  else
  {
    v5 = &stru_1002CD590;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.icloud.findmydeviced.FMDAssetRegistry%@.plist"), v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAssetRegistry baseStoragePath](self, "baseStoragePath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v6, 0));

  return v8;
}

- (id)generateAssetURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAssetRegistry baseStoragePath](self, "baseStoragePath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v4, 0));

  return v6;
}

- (void)downloadAssets:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10007E0C4;
  v3[3] = &unk_1002C40D0;
  v3[4] = self;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v3);
}

- (void)resumeBackgroundAssetDownloads:(id)a3
{
  id v3;

  v3 = a3;
  xpc_set_event_stream_handler("com.apple.nsurlsessiond-events", (dispatch_queue_t)&_dispatch_main_q, &stru_1002C4110);
  objc_msgSend(v3, "resumeBackgroundTasks");

}

- (NSURL)baseStoragePath
{
  return self->_baseStoragePath;
}

- (void)setBaseStoragePath:(id)a3
{
  objc_storeStrong((id *)&self->_baseStoragePath, a3);
}

- (void)setAssetsByURL:(id)a3
{
  objc_storeStrong((id *)&self->_assetsByURL, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_storeIdentifier, a3);
}

- (FMDataArchiver)dataArchiver
{
  return self->_dataArchiver;
}

- (void)setDataArchiver:(id)a3
{
  objc_storeStrong((id *)&self->_dataArchiver, a3);
}

- (FMDServerInteractionController)serverInteractionController
{
  return self->_serverInteractionController;
}

- (void)setServerInteractionController:(id)a3
{
  objc_storeStrong((id *)&self->_serverInteractionController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverInteractionController, 0);
  objc_storeStrong((id *)&self->_dataArchiver, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_assetsByURL, 0);
  objc_storeStrong((id *)&self->_baseStoragePath, 0);
}

@end
