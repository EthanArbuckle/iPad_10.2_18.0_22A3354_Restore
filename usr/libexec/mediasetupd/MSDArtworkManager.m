@implementation MSDArtworkManager

- (MSDArtworkManager)initWithServiceID:(id)a3 remoteImageURL:(id)a4
{
  id v7;
  id v8;
  MSDArtworkManager *v9;
  MSDArtworkManager *v10;
  uint64_t v11;
  NSString *serviceIconImageName;
  uint64_t v13;
  NSString *v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSURL *localCacheDirURL;
  uint64_t v19;
  NSURL *v20;
  id v21;
  NSObject *v22;
  MSDArtworkManager *v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD block[4];
  id v35;
  id location;
  id v37;
  objc_super v38;

  v7 = a3;
  v8 = a4;
  v38.receiver = self;
  v38.super_class = (Class)MSDArtworkManager;
  v9 = -[MSDArtworkManager init](&v38, "init");
  v10 = v9;
  if (!v9)
  {
LABEL_8:
    v23 = v10;
    goto LABEL_12;
  }
  if (v7)
  {
    objc_storeStrong((id *)&v9->_serviceID, a3);
    objc_storeStrong((id *)&v10->_remoteImageURL, a4);
    v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v10->_serviceID));
    serviceIconImageName = v10->_serviceIconImageName;
    v10->_serviceIconImageName = (NSString *)v11;

    v13 = objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingPathExtension:](v10->_serviceIconImageName, "stringByAppendingPathExtension:", CFSTR("png")));
    v14 = v10->_serviceIconImageName;
    v10->_serviceIconImageName = (NSString *)v13;

    *(_OWORD *)&v10->_iconImageScale = xmmword_10003E270;
    v10->_iconImageSize.height = 256.0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v37 = 0;
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 0, &v37));
    v17 = v37;
    localCacheDirURL = v10->_localCacheDirURL;
    v10->_localCacheDirURL = (NSURL *)v16;

    v19 = objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](v10->_localCacheDirURL, "URLByAppendingPathComponent:", CFSTR("com.apple.mediasetupd")));
    v20 = v10->_localCacheDirURL;
    v10->_localCacheDirURL = (NSURL *)v19;

    if (v17)
    {
      v21 = sub_10002E034();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_1000047D0();

    }
    objc_initWeak(&location, v10);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100003B48;
    block[3] = &unk_1000489C0;
    objc_copyWeak(&v35, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);

    goto LABEL_8;
  }
  v24 = sub_10002E034();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    sub_1000047A0(v25, v26, v27, v28, v29, v30, v31, v32);

  v23 = 0;
LABEL_12:

  return v23;
}

- (id)getLocalCachedImageURL
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](self->_localCacheDirURL, "URLByAppendingPathComponent:", self->_serviceIconImageName));
  if (-[NSString isEqualToString:](self->_serviceID, "isEqualToString:", kAppleMusicServiceIdentifier))
  {
    v4 = objc_alloc((Class)ISIcon);
    v5 = objc_msgSend(v4, "initWithBundleIdentifier:", kAppleMusicBundleIdentifier);
    v6 = objc_claimAutoreleasedReturnValue(-[MSDArtworkManager _saveISIconInLocalCacheDir:withName:](self, "_saveISIconInLocalCacheDir:withName:", v5, self->_serviceIconImageName));
LABEL_8:
    v10 = (id)v6;

    goto LABEL_9;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));
  v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

  if (!v9)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDArtworkManager _fetchImageFromInternetURL](self, "_fetchImageFromInternetURL"));
    if (v5)
      v6 = objc_claimAutoreleasedReturnValue(-[MSDArtworkManager _saveDataInLocalCacheDir:withName:](self, "_saveDataInLocalCacheDir:withName:", v5, self->_serviceIconImageName));
    else
      v6 = objc_claimAutoreleasedReturnValue(-[MSDArtworkManager _returnGenericAppIcon](self, "_returnGenericAppIcon"));
    goto LABEL_8;
  }
  v10 = v3;
LABEL_9:

  return v10;
}

- (id)_returnGenericAppIcon
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ISIcon genericApplicationIcon](ISIcon, "genericApplicationIcon"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDArtworkManager _saveISIconInLocalCacheDir:withName:](self, "_saveISIconInLocalCacheDir:withName:", v3, CFSTR("genericIcon.png")));

  return v4;
}

- (id)_saveDataInLocalCacheDir:(id)a3 withName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSURL **p_localCacheDirURL;
  NSURL *localCacheDirURL;
  void *v12;
  unsigned __int8 v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSURL *v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  void *v48;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v22 = sub_10002E034();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_100004830(v23, v24, v25, v26, v27, v28, v29, v30);
    goto LABEL_17;
  }
  if (!v7)
  {
    v35 = sub_10002E034();
    v23 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_100004860(v23, v36, v37, v38, v39, v40, v41, v42);
LABEL_17:

LABEL_18:
    v31 = 0;
    goto LABEL_19;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  localCacheDirURL = self->_localCacheDirURL;
  p_localCacheDirURL = &self->_localCacheDirURL;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](localCacheDirURL, "path"));
  v13 = objc_msgSend(v9, "fileExistsAtPath:", v12);

  if ((v13 & 1) == 0)
  {
    v14 = sub_10002E034();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](*p_localCacheDirURL, "path"));
      *(_DWORD *)buf = 138477827;
      v46 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Directory for icon file path (%{private}@) does not exist, will try to create now", buf, 0xCu);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v18 = *p_localCacheDirURL;
    v44 = 0;
    objc_msgSend(v17, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v18, 1, 0, &v44);
    v19 = v44;

    if (v19)
    {
      v20 = sub_10002E034();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_100004890((id *)p_localCacheDirURL, (uint64_t)v19, v21);

      goto LABEL_18;
    }
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](*p_localCacheDirURL, "URLByAppendingPathComponent:", v8));
  v32 = sub_10002E034();
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "path"));
    *(_DWORD *)buf = 138478083;
    v46 = v6;
    v47 = 2113;
    v48 = v34;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Saving image %{private}@ to path %{private}@", buf, 0x16u);

  }
  objc_msgSend(v6, "writeToURL:atomically:", v31, 1);
LABEL_19:

  return v31;
}

- (id)_saveISIconInLocalCacheDir:(id)a3 withName:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  UIImage *v10;
  NSData *v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)ISImageDescriptor), "initWithSize:scale:", self->_iconImageSize.width, self->_iconImageSize.height, self->_iconImageScale);
  objc_msgSend(v8, "setShouldApplyMask:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "prepareImageForDescriptor:", v8));

  v10 = (UIImage *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", objc_msgSend(v9, "CGImage")));
  v11 = UIImagePNGRepresentation(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDArtworkManager _saveDataInLocalCacheDir:withName:](self, "_saveDataInLocalCacheDir:withName:", v12, v6));

  return v13;
}

- (id)_fetchImageFromInternetURL
{
  NSObject *v3;
  NSURL *remoteImageURL;
  NSObject *v5;
  dispatch_time_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  if (self->_remoteImageURL)
  {
    v3 = dispatch_group_create();
    dispatch_group_enter(v3);
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = sub_1000041E8;
    v24 = sub_1000041F8;
    v25 = 0;
    remoteImageURL = self->_remoteImageURL;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100004200;
    v17[3] = &unk_1000489E8;
    v19 = &v20;
    v5 = v3;
    v18 = v5;
    -[MSDArtworkManager getDataFromURL:completionHandler:](self, "getDataFromURL:completionHandler:", remoteImageURL, v17);
    v6 = dispatch_time(0, 1000000000 * MSMaxWaitTimeForServiceIconDownload);
    dispatch_group_wait(v5, v6);
    v7 = (id)v21[5];

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v8 = sub_10002E034();
    v5 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100004934(v5, v9, v10, v11, v12, v13, v14, v15);
    v7 = 0;
  }

  return v7;
}

- (void)getDataFromURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration ephemeralSessionConfiguration](NSURLSessionConfiguration, "ephemeralSessionConfiguration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:](NSURLSession, "sessionWithConfiguration:", v7));

  v9 = objc_msgSend(objc_alloc((Class)NSURLRequest), "initWithURL:", v6);
  v10 = sub_10002E034();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URL"));
    *(_DWORD *)buf = 138412546;
    v18 = v12;
    v19 = 2112;
    v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Executing fetch %@ withSession %@", buf, 0x16u);

  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100004454;
  v15[3] = &unk_100048A10;
  v16 = v5;
  v13 = v5;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataTaskWithRequest:completionHandler:", v9, v15));
  objc_msgSend(v14, "resume");
  objc_msgSend(v8, "finishTasksAndInvalidate");

}

- (BOOL)removeCachedIconImage
{
  void *v2;
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  BOOL v13;
  id v15;
  uint8_t buf[4];
  void *v17;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](self->_localCacheDirURL, "URLByAppendingPathComponent:", self->_serviceIconImageName));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "path"));
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  v6 = sub_10002E034();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "path"));
      *(_DWORD *)buf = 138477827;
      v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Going to remove item at URL %{private}@", buf, 0xCu);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v15 = 0;
    objc_msgSend(v10, "removeItemAtURL:error:", v2, &v15);
    v8 = v15;

    if (!v8)
    {
      v13 = 1;
      goto LABEL_11;
    }
    v11 = sub_10002E034();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100004A78();

  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_100004AD8();
  }

  v13 = 0;
LABEL_11:

  return v13;
}

- (NSString)serviceID
{
  return self->_serviceID;
}

- (NSURL)remoteImageURL
{
  return self->_remoteImageURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteImageURL, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_localCacheDirURL, 0);
  objc_storeStrong((id *)&self->_serviceIconImageName, 0);
}

@end
