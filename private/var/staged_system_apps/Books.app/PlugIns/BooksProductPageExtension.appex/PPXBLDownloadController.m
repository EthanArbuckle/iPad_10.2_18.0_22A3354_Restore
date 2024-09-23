@implementation PPXBLDownloadController

+ (PPXBLDownloadController)sharedController
{
  if (qword_1000356F8[0] != -1)
    dispatch_once(qword_1000356F8, &stru_10002D4E0);
  return (PPXBLDownloadController *)(id)qword_1000356F0;
}

- (PPXBLDownloadController)init
{
  PPXBLDownloadController *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *dispatchQueue;
  NSMutableDictionary *v9;
  NSMutableDictionary *downloadingAssets;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PPXBLDownloadController;
  v2 = -[PPXBLDownloadController init](&v12, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);
    v6 = objc_claimAutoreleasedReturnValue(v5);

    v7 = dispatch_queue_create("com.apple.PPXBLDownloadController.dispatchQueue", v6);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v7;

    v9 = objc_opt_new(NSMutableDictionary);
    downloadingAssets = v2->_downloadingAssets;
    v2->_downloadingAssets = v9;

  }
  return v2;
}

- (void)startObserving
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[BLDownloadQueue sharedInstance](BLDownloadQueue, "sharedInstance"));
  objc_msgSend(v3, "addObserver:", self);

}

- (void)stopObserving
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[BLDownloadQueue sharedInstance](BLDownloadQueue, "sharedInstance"));
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)dealloc
{
  OS_dispatch_queue *dispatchQueue;
  NSMutableDictionary *downloadingAssets;
  objc_super v5;

  -[PPXBLDownloadController stopObserving](self, "stopObserving");
  dispatchQueue = self->_dispatchQueue;
  self->_dispatchQueue = 0;

  downloadingAssets = self->_downloadingAssets;
  self->_downloadingAssets = 0;

  v5.receiver = self;
  v5.super_class = (Class)PPXBLDownloadController;
  -[PPXBLDownloadController dealloc](&v5, "dealloc");
}

- (void)cancelDownloadForAssetID:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;

  v4 = a3;
  v5 = BCBookDownloadLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "cancelDownloadForAssetID:%@", buf, 0xCu);
  }

  v7 = objc_claimAutoreleasedReturnValue(-[PPXBLDownloadController dispatchQueue](self, "dispatchQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000073F4;
  v9[3] = &unk_10002D298;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

- (id)_updateDownloadingAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PPXBLDownloadAsset *v7;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  PPXBLDownloadAsset *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bk_assetIdentifier"));
  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PPXBLDownloadController downloadingAssets](self, "downloadingAssets"));
    v7 = (PPXBLDownloadAsset *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v5));

    if (!v7)
    {
      if (objc_msgSend(v4, "isAudiobook")
        && (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "storePlaylistID")),
            v10 = objc_msgSend(v9, "longLongValue"),
            v9,
            !v10))
      {
        v7 = 0;
      }
      else
      {
        v7 = -[PPXBLDownloadAsset initWithBLDownloadStatus:isParent:]([PPXBLDownloadAsset alloc], "initWithBLDownloadStatus:isParent:", v4, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[PPXBLDownloadController downloadingAssets](self, "downloadingAssets"));
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v7, v5);

        v12 = BCBookDownloadLog();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[PPXBLDownloadAsset identifier](v7, "identifier"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[PPXBLDownloadAsset downloadID](v7, "downloadID"));
          v31 = 138412546;
          v32 = v14;
          v33 = 2114;
          v34 = v15;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "download new asset=%@, downloadID=%{public}@", (uint8_t *)&v31, 0x16u);

        }
        if (objc_msgSend(v4, "isAudiobook"))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "storePlaylistID"));
          v17 = objc_msgSend(v16, "longLongValue");

          if (v17)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "storePlaylistID"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringValue"));

            v20 = (void *)objc_claimAutoreleasedReturnValue(-[PPXBLDownloadController downloadingAssets](self, "downloadingAssets"));
            v21 = (PPXBLDownloadAsset *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", v19));

            if (!v21)
            {
              v21 = -[PPXBLDownloadAsset initWithBLDownloadStatus:isParent:]([PPXBLDownloadAsset alloc], "initWithBLDownloadStatus:isParent:", v4, 1);
              v22 = (void *)objc_claimAutoreleasedReturnValue(-[PPXBLDownloadController downloadingAssets](self, "downloadingAssets"));
              objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v19);

              v23 = BCBookDownloadLog();
              v24 = objc_claimAutoreleasedReturnValue(v23);
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                v25 = (void *)objc_claimAutoreleasedReturnValue(-[PPXBLDownloadAsset identifier](v21, "identifier"));
                v31 = 138412290;
                v32 = v25;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "download new parent=%@", (uint8_t *)&v31, 0xCu);

              }
            }
            v26 = BCBookDownloadLog();
            v27 = objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              v28 = (void *)objc_claimAutoreleasedReturnValue(-[PPXBLDownloadAsset identifier](v21, "identifier"));
              v29 = (void *)objc_claimAutoreleasedReturnValue(-[PPXBLDownloadAsset identifier](v7, "identifier"));
              v30 = (void *)objc_claimAutoreleasedReturnValue(-[PPXBLDownloadAsset downloadID](v7, "downloadID"));
              v31 = 138412802;
              v32 = v28;
              v33 = 2112;
              v34 = v29;
              v35 = 2114;
              v36 = v30;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "set parent=%@ for child=%@, downloadID=%{public}@", (uint8_t *)&v31, 0x20u);

            }
            -[PPXBLDownloadAsset addChild:](v21, "addChild:", v7);

          }
        }
      }
    }
    -[PPXBLDownloadAsset setDownloadStatus:](v7, "setDownloadStatus:", v4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_performBlockOnAllAssetsForAssetID:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PPXBLDownloadController downloadingAssets](self, "downloadingAssets"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v6));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "parent"));

    if (v10)
    {
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "parent"));

      v9 = (void *)v11;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "children"));
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "children", 0));
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v20;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v20 != v17)
              objc_enumerationMutation(v14);
            v7[2](v7, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v18));
            v18 = (char *)v18 + 1;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v16);
      }

    }
    else
    {
      ((void (**)(id, void *))v7)[2](v7, v9);
    }

  }
}

- (void)downloadQueue:(id)a3 downloadStatesDidChange:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  PPXBLDownloadController *v12;

  v5 = a4;
  v6 = BCBookDownloadLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_10001ED54((uint64_t)v5, v7);

  v8 = objc_claimAutoreleasedReturnValue(-[PPXBLDownloadController dispatchQueue](self, "dispatchQueue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100007B30;
  v10[3] = &unk_10002D298;
  v11 = v5;
  v12 = self;
  v9 = v5;
  dispatch_async(v8, v10);

}

- (void)downloadQueue:(id)a3 downloadStates:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  PPXBLDownloadController *v15;
  uint8_t buf[4];
  id v17;

  v7 = a4;
  v8 = a5;
  v9 = BCBookDownloadLog();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "didCompleteWithError: %@", buf, 0xCu);
  }

  v11 = objc_claimAutoreleasedReturnValue(-[PPXBLDownloadController dispatchQueue](self, "dispatchQueue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100007D4C;
  v13[3] = &unk_10002D298;
  v14 = v7;
  v15 = self;
  v12 = v7;
  dispatch_async(v11, v13);

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSMutableDictionary)downloadingAssets
{
  return self->_downloadingAssets;
}

- (void)setDownloadingAssets:(id)a3
{
  objc_storeStrong((id *)&self->_downloadingAssets, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadingAssets, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
