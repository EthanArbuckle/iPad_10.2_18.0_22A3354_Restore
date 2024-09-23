@implementation CRThemeAssetDownloader

- (CRThemeAssetDownloader)init
{
  CRThemeAssetDownloader *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *assetQueue;
  uint64_t v7;
  NSMapTable *assetQueue_currentlyDownloadingAssets;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CRThemeAssetDownloader;
  v2 = -[CRThemeAssetDownloader init](&v10, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.carkit.ThemeAssetDownloader", v4);
    assetQueue = v2->_assetQueue;
    v2->_assetQueue = (OS_dispatch_queue *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](NSMapTable, "strongToWeakObjectsMapTable"));
    assetQueue_currentlyDownloadingAssets = v2->_assetQueue_currentlyDownloadingAssets;
    v2->_assetQueue_currentlyDownloadingAssets = (NSMapTable *)v7;

    -[CRThemeAssetDownloader setAssetQueue_queryInProgress:](v2, "setAssetQueue_queryInProgress:", 0);
  }
  return v2;
}

- (void)setAssetRequests:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  CRThemeAssetDownloader *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CRThemeAssetDownloader assetQueue](self, "assetQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005B5C8;
  v7[3] = &unk_1000B5390;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleDownloadHintForAssetRequest:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  CRThemeAssetDownloader *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CRThemeAssetDownloader assetQueue](self, "assetQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005B760;
  v7[3] = &unk_1000B5390;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)removeAssetsBeforeVersion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CRThemeAssetDownloader assetQueue](self, "assetQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005B91C;
  v7[3] = &unk_1000B5390;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_assetQueue_requestAssetCatalogDownload
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  uint8_t buf[16];

  v3 = objc_claimAutoreleasedReturnValue(-[CRThemeAssetDownloader assetQueue](self, "assetQueue"));
  dispatch_assert_queue_V2(v3);

  v5 = CarThemeAssetsLogging(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Requesting theme assets catalog download", buf, 2u);
  }

  v7 = objc_alloc_init((Class)MADownloadOptions);
  objc_msgSend(v7, "setAllowsCellularAccess:", 1);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005BA10;
  v8[3] = &unk_1000B75F0;
  v8[4] = self;
  +[MAAsset startCatalogDownload:options:completionWithError:](MAAsset, "startCatalogDownload:options:completionWithError:", CFSTR("com.apple.MobileAsset.CarDDPAssets"), v7, v8);

}

- (void)_assetQueue_queryUpdatedAssetsForRequests:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL8 v6;
  _BOOL4 v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  const char *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  char v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  void **v38;
  uint64_t v39;
  void (*v40)(id *, void *, void *, void *);
  void *v41;
  CRThemeAssetDownloader *v42;
  id v43;
  id v44;
  _QWORD v45[5];
  uint8_t buf[4];
  id v47;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CRThemeAssetDownloader assetQueue](self, "assetQueue"));
  dispatch_assert_queue_V2(v5);

  if (objc_msgSend(v4, "count"))
  {
    v6 = -[CRThemeAssetDownloader assetQueue_queryInProgress](self, "assetQueue_queryInProgress");
    v7 = v6;
    v8 = CarThemeAssetsLogging(v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        v11 = "asset query already in progress";
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v11, buf, 2u);
        goto LABEL_25;
      }
      goto LABEL_25;
    }
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      v47 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "starting asset query for %@", buf, 0xCu);
    }

    -[CRThemeAssetDownloader setAssetQueue_queryInProgress:](self, "setAssetQueue_queryInProgress:", 1);
    v9 = objc_msgSend(objc_alloc((Class)MAAssetQuery), "initWithType:", CFSTR("com.apple.MobileAsset.CarDDPAssets"));
    -[NSObject returnTypes:](v9, "returnTypes:", 2);
    -[NSObject setDoNotBlockBeforeFirstUnlock:](v9, "setDoNotBlockBeforeFirstUnlock:", 1);
    v13 = -[NSObject queryMetaDataSync](v9, "queryMetaDataSync");
    v14 = objc_claimAutoreleasedReturnValue(-[NSObject results](v9, "results"));
    v15 = (void *)v14;
    if (v13)
    {
      if (v13 != (id)2)
      {
        v36 = CarThemeAssetsLogging(v14);
        v37 = objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          sub_10006EDC4();

        goto LABEL_24;
      }
      v16 = CarThemeAssetsLogging(v14);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_10006EE28(v17, v18, v19, v20, v21, v22, v23, v24);

      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_10005BEB4;
      v45[3] = &unk_1000B7618;
      v45[4] = self;
      -[CRThemeAssetDownloader _assetQueue_processPerAssetRequestAllAssets:completion:](self, "_assetQueue_processPerAssetRequestAllAssets:completion:", v15, v45);
    }
    else
    {
      v25 = -[NSObject isCatalogFetchedWithinThePastFewDays:](v9, "isCatalogFetchedWithinThePastFewDays:", 3);
      v26 = (char)v25;
      if ((v25 & 1) == 0)
      {
        v27 = CarThemeAssetsLogging(v25);
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          sub_10006EE5C(v28, v29, v30, v31, v32, v33, v34, v35);

      }
      objc_initWeak((id *)buf, self);
      v38 = _NSConcreteStackBlock;
      v39 = 3221225472;
      v40 = sub_10005BEC8;
      v41 = &unk_1000B76B8;
      v42 = self;
      v43 = v4;
      objc_copyWeak(&v44, (id *)buf);
      -[CRThemeAssetDownloader _assetQueue_processPerAssetRequestAllAssets:completion:](self, "_assetQueue_processPerAssetRequestAllAssets:completion:", v15, &v38);
      objc_destroyWeak(&v44);

      objc_destroyWeak((id *)buf);
      if ((v26 & 1) != 0)
        goto LABEL_24;
    }
    -[CRThemeAssetDownloader _assetQueue_requestAssetCatalogDownload](self, "_assetQueue_requestAssetCatalogDownload", v38, v39, v40, v41, v42);
LABEL_24:
    -[CRThemeAssetDownloader setAssetQueue_queryInProgress:](self, "setAssetQueue_queryInProgress:", 0, v38, v39, v40, v41, v42);

    goto LABEL_25;
  }
  v12 = CarThemeAssetsLogging(0);
  v9 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    v11 = "no asset requests to query";
    goto LABEL_7;
  }
LABEL_25:

}

- (id)_assetQueue_installedAssets
{
  NSObject *v2;
  id v3;
  void *v4;

  v2 = objc_claimAutoreleasedReturnValue(-[CRThemeAssetDownloader assetQueue](self, "assetQueue"));
  dispatch_assert_queue_V2(v2);

  v3 = objc_msgSend(objc_alloc((Class)MAAssetQuery), "initWithType:", CFSTR("com.apple.MobileAsset.CarDDPAssets"));
  objc_msgSend(v3, "returnTypes:", 1);
  objc_msgSend(v3, "setDoNotBlockBeforeFirstUnlock:", 1);
  if (objc_msgSend(v3, "queryMetaDataSync"))
    v4 = 0;
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "results"));

  return v4;
}

- (void)_assetQueue_cancelUnusedDownloads
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  __int128 v7;
  id v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  void *v18;
  unsigned __int8 v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  __int128 v26;
  id obj;
  CRThemeAssetDownloader *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  _BYTE v43[128];

  v3 = objc_claimAutoreleasedReturnValue(-[CRThemeAssetDownloader assetQueue](self, "assetQueue"));
  dispatch_assert_queue_V2(v3);

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v28 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetDownloader assetQueue_currentlyDownloadingAssets](self, "assetQueue_currentlyDownloadingAssets"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectEnumerator"));

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v6)
  {
    v8 = v6;
    v29 = *(_QWORD *)v35;
    *(_QWORD *)&v7 = 138412546;
    v26 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v29)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cr_assetVersion", v26));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));

        if (v12)
        {
          v32 = 0u;
          v33 = 0u;
          v30 = 0u;
          v31 = 0u;
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetDownloader assetRequests](v28, "assetRequests"));
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v31;
            while (2)
            {
              for (j = 0; j != v15; j = (char *)j + 1)
              {
                if (*(_QWORD *)v31 != v16)
                  objc_enumerationMutation(v13);
                v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1)
                                                                                   + 8 * (_QWORD)j), "assetIdentifier"));
                v19 = objc_msgSend(v12, "isEqualToString:", v18);

                if ((v19 & 1) != 0)
                {

                  v24 = CarThemeAssetsLogging(v23);
                  v25 = objc_claimAutoreleasedReturnValue(v24);
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = v26;
                    v39 = v12;
                    v40 = 2112;
                    v41 = v10;
                    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "still need ongoing download for assetID %@: %@", buf, 0x16u);
                  }

                  goto LABEL_21;
                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
              if (v15)
                continue;
              break;
            }
          }

          v21 = CarThemeAssetsLogging(v20);
          v22 = objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v26;
            v39 = v12;
            v40 = 2112;
            v41 = v10;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "cancelling download for assetID %@: %@", buf, 0x16u);
          }

          objc_msgSend(v10, "cancelDownloadSync");
        }
LABEL_21:

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v8);
  }

}

- (void)_assetQueue_removeAssets:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  _BYTE v23[128];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CRThemeAssetDownloader assetQueue](self, "assetQueue"));
  dispatch_assert_queue_V2(v5);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v10);
        v12 = CarThemeAssetsLogging(v7);
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cr_assetVersion"));
          *(_DWORD *)buf = 138543618;
          v20 = v14;
          v21 = 2112;
          v22 = v11;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Removing asset %{public}@: %@", buf, 0x16u);

        }
        v7 = objc_msgSend(v11, "purgeSync");
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      v8 = v7;
    }
    while (v7);
  }

}

- (void)_assetQueue_removeUnusedAssets
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = objc_claimAutoreleasedReturnValue(-[CRThemeAssetDownloader assetQueue](self, "assetQueue"));
  dispatch_assert_queue_V2(v3);

  -[CRThemeAssetDownloader _assetQueue_cancelUnusedDownloads](self, "_assetQueue_cancelUnusedDownloads");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetDownloader _assetQueue_installedAssets](self, "_assetQueue_installedAssets"));
  if (v4)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10005CB48;
    v7[3] = &unk_1000B76E0;
    v7[4] = self;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v7));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filteredArrayUsingPredicate:", v5));

    -[CRThemeAssetDownloader _assetQueue_removeAssets:](self, "_assetQueue_removeAssets:", v6);
  }

}

- (void)_assetQueue_removeAssetsBeforeVersion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CRThemeAssetDownloader assetQueue](self, "assetQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetDownloader _assetQueue_installedAssets](self, "_assetQueue_installedAssets"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MAAsset cr_themeAsset_filteredAssets:matchingAssetIdentifier:maximumSDKVersion:maximumCompatibilityVersion:](MAAsset, "cr_themeAsset_filteredAssets:matchingAssetIdentifier:maximumSDKVersion:maximumCompatibilityVersion:", v6, v7, 0, 0));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10005CDCC;
  v12[3] = &unk_1000B76E0;
  v13 = v4;
  v9 = v4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v12));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filteredArrayUsingPredicate:", v10));

  -[CRThemeAssetDownloader _assetQueue_removeAssets:](self, "_assetQueue_removeAssets:", v11);
}

- (void)_assetQueue_processPerAssetRequestAllAssets:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *, void *, void *);
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id obj;
  uint64_t v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v20 = a3;
  v6 = (void (**)(id, void *, void *, void *))a4;
  v7 = objc_claimAutoreleasedReturnValue(-[CRThemeAssetDownloader assetQueue](self, "assetQueue"));
  dispatch_assert_queue_V2(v7);

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[CRThemeAssetDownloader assetRequests](self, "assetRequests"));
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v21)
  {
    v19 = *(_QWORD *)v23;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "assetIdentifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "maximumSDKVersion"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "maximumCompatibilityVersion")));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[MAAsset cr_themeAsset_filteredAssets:matchingAssetIdentifier:maximumSDKVersion:maximumCompatibilityVersion:](MAAsset, "cr_themeAsset_filteredAssets:matchingAssetIdentifier:maximumSDKVersion:maximumCompatibilityVersion:", v20, v10, v11, v12));

        v14 = (void *)objc_claimAutoreleasedReturnValue(+[MAAsset cr_themeAsset_highestVersionAssetInAssets:](MAAsset, "cr_themeAsset_highestVersionAssetInAssets:", v13));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[MAAsset cr_installedAssetsInAssets:](MAAsset, "cr_installedAssetsInAssets:", v13));
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[MAAsset cr_themeAsset_highestVersionAssetInAssets:](MAAsset, "cr_themeAsset_highestVersionAssetInAssets:", v15));
        if (v14 != v16)
        {
          if (!v6)
            goto LABEL_9;
LABEL_8:
          v6[2](v6, v9, v16, v14);
          goto LABEL_9;
        }

        v14 = 0;
        if (v6)
          goto LABEL_8;
LABEL_9:

        v8 = (char *)v8 + 1;
      }
      while (v21 != v8);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      v21 = v17;
    }
    while (v17);
  }

}

- (void)_assetQueue_notifyObserverOfDownloadAttemptForAssetRequest:(id)a3 version:(id)a4 progress:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  char v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[CRThemeAssetDownloader assetQueue](self, "assetQueue"));
  dispatch_assert_queue_V2(v11);

  v13 = CarThemeAssetsLogging(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v18 = 138412546;
    v19 = v8;
    v20 = 2112;
    v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "download attempt for asset request: %@ version: %@", (uint8_t *)&v18, 0x16u);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetDownloader downloadObserver](self, "downloadObserver"));
  v16 = objc_opt_respondsToSelector(v15, "assetDownloader:attemptingDownloadForAssetRequest:version:progress:");

  if ((v16 & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetDownloader downloadObserver](self, "downloadObserver"));
    objc_msgSend(v17, "assetDownloader:attemptingDownloadForAssetRequest:version:progress:", self, v8, v9, v10);

  }
}

- (void)_assetQueue_notifyObserverOfAsset:(id)a3 forAssetRequest:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v18;
  int v19;
  NSObject *v20;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[CRThemeAssetDownloader assetQueue](self, "assetQueue"));
  dispatch_assert_queue_V2(v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cr_assetVersion"));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getLocalFileUrl"));
  v11 = (void *)v10;
  if (v9 && v10)
  {
    v12 = objc_msgSend(objc_alloc((Class)CARThemeAsset), "initWithBaseURL:version:", v10, v9);
    v13 = CarThemeAssetsLogging(v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v19 = 138543362;
      v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "notifying observer of asset: %{public}@", (uint8_t *)&v19, 0xCu);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetDownloader downloadObserver](self, "downloadObserver"));
    v16 = objc_opt_respondsToSelector(v15, "assetDownloader:hasAsset:forAssetRequest:");

    if ((v16 & 1) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetDownloader downloadObserver](self, "downloadObserver"));
      objc_msgSend(v17, "assetDownloader:hasAsset:forAssetRequest:", self, v12, v7);

    }
  }
  else
  {
    v18 = CarThemeAssetsLogging(v10);
    v12 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10006EFE4(v6, v12);
  }

}

- (void)_assetQueue_notifyObserverOfFailedDownloadForAssetRequest:(id)a3 version:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  char v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[CRThemeAssetDownloader assetQueue](self, "assetQueue"));
  dispatch_assert_queue_V2(v11);

  v13 = CarThemeAssetsLogging(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v18 = 138412802;
    v19 = v8;
    v20 = 2112;
    v21 = v9;
    v22 = 2112;
    v23 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "download failed for asset request: %@ version: %@ error: %@", (uint8_t *)&v18, 0x20u);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetDownloader downloadObserver](self, "downloadObserver"));
  v16 = objc_opt_respondsToSelector(v15, "assetDownloader:failedDownloadForAssetRequest:version:error:");

  if ((v16 & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetDownloader downloadObserver](self, "downloadObserver"));
    objc_msgSend(v17, "assetDownloader:failedDownloadForAssetRequest:version:error:", self, v8, v9, v10);

  }
}

- (NSSet)assetRequests
{
  return self->_assetRequests;
}

- (CRThemeAssetDownloadObserving)downloadObserver
{
  return (CRThemeAssetDownloadObserving *)objc_loadWeakRetained((id *)&self->_downloadObserver);
}

- (void)setDownloadObserver:(id)a3
{
  objc_storeWeak((id *)&self->_downloadObserver, a3);
}

- (OS_dispatch_queue)assetQueue
{
  return self->_assetQueue;
}

- (NSMapTable)assetQueue_currentlyDownloadingAssets
{
  return self->_assetQueue_currentlyDownloadingAssets;
}

- (BOOL)assetQueue_queryInProgress
{
  return self->_assetQueue_queryInProgress;
}

- (void)setAssetQueue_queryInProgress:(BOOL)a3
{
  self->_assetQueue_queryInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetQueue_currentlyDownloadingAssets, 0);
  objc_storeStrong((id *)&self->_assetQueue, 0);
  objc_destroyWeak((id *)&self->_downloadObserver);
  objc_storeStrong((id *)&self->_assetRequests, 0);
}

@end
