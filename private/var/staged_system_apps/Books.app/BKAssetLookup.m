@implementation BKAssetLookup

+ (BKAssetLookup)assetLookupWithID:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(objc_alloc((Class)a1), "initWithID:options:completion:", v10, v9, v8);

  return (BKAssetLookup *)v11;
}

+ (BKAssetLookup)assetLookupWithIdentifier:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:options:completion:", v10, v9, v8);

  return (BKAssetLookup *)v11;
}

- (BKAssetLookup)initWithID:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  BKAssetLookup *v11;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[BKAssetID identifierWithAssetID:](BKAssetID, "identifierWithAssetID:", a3));
  v11 = -[BKAssetLookup initWithIdentifier:options:completion:](self, "initWithIdentifier:options:completion:", v10, v9, v8);

  return v11;
}

- (BKAssetLookup)initWithIdentifier:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  BKAssetLookup *v11;
  BKAssetLookup *v12;
  dispatch_queue_t v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BKAssetLookup;
  v11 = -[BKAssetLookup init](&v15, "init");
  v12 = v11;
  if (v11)
  {
    -[BKAssetLookup setAssetIdentifier:](v11, "setAssetIdentifier:", v8);
    -[BKAssetLookup setCompletion:](v12, "setCompletion:", v10);
    -[BKAssetLookup setOptions:](v12, "setOptions:", v9);
    v13 = dispatch_queue_create("BKAssetLookup", 0);
    -[BKAssetLookup setSync:](v12, "setSync:", v13);

    -[BKAssetLookup _load](v12, "_load");
  }

  return v12;
}

- (void)_completeWithAssetViewController:(id)a3 helper:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  id (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_10004E3E0;
  v19 = sub_10004E270;
  v20 = 0;
  v11 = objc_claimAutoreleasedReturnValue(-[BKAssetLookup sync](self, "sync"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100115174;
  v14[3] = &unk_1008E75B8;
  v14[4] = self;
  v14[5] = &v15;
  dispatch_sync(v11, v14);

  v12 = objc_retainBlock((id)v16[5]);
  v13 = v12;
  if (v12)
    (*((void (**)(id, id, id, id))v12 + 2))(v12, v8, v9, v10);

  _Block_object_dispose(&v15, 8);
}

- (void)_load
{
  _QWORD *v2;
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1001152A0;
  v3[3] = &unk_1008E72C0;
  v3[4] = self;
  v2 = objc_retainBlock(v3);
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
    ((void (*)(_QWORD *))v2[2])(v2);
  else
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);

}

- (BOOL)_isProperlyInstalledAssetURL:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  if (objc_msgSend(v3, "isFileURL"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathExtension"));
    if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("epub"))
      && objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("ibooks")))
    {
      v5 = 1;
    }
    else
    {
      v6 = objc_alloc_init((Class)NSFileManager);
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "attributesOfItemAtPath:error:", v7, 0));

      if (v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", NSFileType));
        v5 = objc_msgSend(v9, "isEqualToString:", NSFileTypeDirectory);

      }
      else
      {
        v5 = 0;
      }

    }
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void)cancel
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BKAssetLookup"), 0, 0));
  -[BKAssetLookup _completeWithAssetViewController:helper:error:](self, "_completeWithAssetViewController:helper:error:", 0, 0, v3);

}

+ (void)validateAssetAuthorization:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSFileCoordinator *v11;
  void *v12;
  NSOperationQueue *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[AEPluginRegistry sharedInstance](AEPluginRegistry, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pluginForURL:", v5));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileAccessIntent readingIntentWithURL:options:](NSFileAccessIntent, "readingIntentWithURL:options:", v5, 1));
      v11 = objc_opt_new(NSFileCoordinator);
      v23 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
      v13 = objc_opt_new(NSOperationQueue);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100115C58;
      v18[3] = &unk_1008EB328;
      v19 = v5;
      v22 = v7;
      v20 = v9;
      v21 = v10;
      v14 = v10;
      -[NSFileCoordinator coordinateAccessWithIntents:queue:byAccessor:](v11, "coordinateAccessWithIntents:queue:byAccessor:", v12, v13, v18);

    }
    else
    {
      v16 = objc_retainBlock(v7);
      v17 = v16;
      if (v16)
        (*((void (**)(id, _QWORD))v16 + 2))(v16, 0);

    }
  }
  else
  {
    v15 = objc_retainBlock(v6);
    v9 = v15;
    if (v15)
      (*((void (**)(id, _QWORD))v15 + 2))(v15, 0);
  }

}

- (BKLibraryAssetIdentifier)assetIdentifier
{
  return self->_assetIdentifier;
}

- (void)setAssetIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (OS_dispatch_queue)sync
{
  return self->_sync;
}

- (void)setSync:(id)a3
{
  objc_storeStrong((id *)&self->_sync, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sync, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
}

@end
