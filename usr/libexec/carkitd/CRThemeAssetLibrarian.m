@implementation CRThemeAssetLibrarian

+ (unint64_t)_supportedCompatibilityVersion
{
  NSArray *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  int v17;
  NSObject *v18;

  v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("PrivateFrameworks/CarPlayAssetUI.framework")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "infoDictionary"));
  v8 = v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {
    v10 = CarThemeAssetsLogging();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10006DEF8();
    goto LABEL_15;
  }
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForKey:", CFSTR("MaximumAssetCompatibilityVersion")));
  v12 = CarThemeAssetsLogging();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if (!v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10006DF24();

LABEL_15:
    v15 = 0;
    goto LABEL_16;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "MaximumAssetCompatibilityVersion is %@", (uint8_t *)&v17, 0xCu);
  }

  v15 = -[NSObject unsignedIntegerValue](v11, "unsignedIntegerValue");
LABEL_16:

  return (unint64_t)v15;
}

- (CRThemeAssetLibrarian)initWithLibraryAgent:(id)a3 vehicleStore:(id)a4 sessionStatus:(id)a5
{
  id v9;
  id v10;
  id v11;
  CRThemeAssetLibrarian *v12;
  CRThemeAssetLibrarian *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *assetProgressForVehicleIdentifiers;
  CRThemeAssetDownloader *v16;
  CRThemeAssetDownloader *assetDownloader;
  _QWORD block[4];
  CRThemeAssetLibrarian *v20;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CRThemeAssetLibrarian;
  v12 = -[CRThemeAssetLibrarian init](&v21, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_libraryAgent, a3);
    objc_storeStrong((id *)&v13->_vehicleStore, a4);
    objc_msgSend(v10, "addObserver:", v13);
    objc_storeStrong((id *)&v13->_sessionStatus, a5);
    objc_msgSend(v11, "addSessionObserver:", v13);
    v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    assetProgressForVehicleIdentifiers = v13->_assetProgressForVehicleIdentifiers;
    v13->_assetProgressForVehicleIdentifiers = v14;

    v16 = objc_alloc_init(CRThemeAssetDownloader);
    assetDownloader = v13->_assetDownloader;
    v13->_assetDownloader = v16;

    -[CRThemeAssetDownloader setDownloadObserver:](v13->_assetDownloader, "setDownloadObserver:", v13);
    v13->_currentSessionTransferStatus = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100045208;
    block[3] = &unk_1000B51B8;
    v20 = v13;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  return v13;
}

- (void)_mainQueue_updateAssetRequests
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (+[CRVehicleStoreAvailability isVehicleStoreAvailable](CRVehicleStoreAvailability, "isVehicleStoreAvailable"))
  {
    v3 = objc_alloc_init((Class)NSMutableSet);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetLibrarian vehicleStore](self, "vehicleStore", 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allStoredVehicles"));

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetLibrarian _assetRequestForVehicle:](self, "_assetRequestForVehicle:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9)));
          if (v10)
            objc_msgSend(v3, "addObject:", v10);

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetLibrarian assetDownloader](self, "assetDownloader"));
    objc_msgSend(v11, "setAssetRequests:", v3);

  }
}

- (id)_mainQueue_vehicleForSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  int v19;
  id v20;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "MFiCertificateSerialNumber"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetLibrarian vehicleStore](self, "vehicleStore"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "vehicleForCertificateSerial:", v5));

    if (v7)
    {
      v7 = v7;
      v8 = v7;
    }
    else
    {
      v16 = CarThemeAssetsLogging();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138412290;
        v20 = v4;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "no paired vehicle matching session %@", (uint8_t *)&v19, 0xCu);
      }

      v8 = 0;
    }
  }
  else
  {
    v9 = CarThemeAssetsLogging();
    v7 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10006DF50((uint64_t)v4, v7, v10, v11, v12, v13, v14, v15);
    v8 = 0;
  }

  return v8;
}

- (void)_mainQueue_evaluateAssetTransferIfConnected
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  unint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id *v40;
  NSObject *v41;
  id v42;
  CRFileSender *v43;
  NSObject *v44;
  _QWORD v45[4];
  NSObject *v46;
  id v47;
  id location;
  uint8_t buf[4];
  NSObject *v50;
  __int16 v51;
  NSObject *v52;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetLibrarian sessionStatus](self, "sessionStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentSession"));

  v5 = ((uint64_t (*)(void))CarThemeAssetsLogging)();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "evaluate asset transfer: connected", buf, 2u);
    }

    v6 = objc_claimAutoreleasedReturnValue(-[CRThemeAssetLibrarian _mainQueue_vehicleForSession:](self, "_mainQueue_vehicleForSession:", v4));
    v8 = -[CRThemeAssetLibrarian currentSessionTransferStatus](self, "currentSessionTransferStatus");
    switch(v8)
    {
      case 3uLL:
        v12 = ((uint64_t (*)(void))CarThemeAssetsLogging)();
        v10 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v11 = "asset transfer already failed, not trying again";
          goto LABEL_15;
        }
LABEL_43:

        goto LABEL_44;
      case 2uLL:
        v13 = ((uint64_t (*)(void))CarThemeAssetsLogging)();
        v10 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v11 = "asset transfer already completed";
          goto LABEL_15;
        }
        goto LABEL_43;
      case 1uLL:
        v9 = CarThemeAssetsLogging(1);
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v11 = "asset transfer already in progress";
LABEL_15:
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
          goto LABEL_43;
        }
        goto LABEL_43;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetLibrarian fileSenderSession](self, "fileSenderSession"));

    if (v14)
      -[CRThemeAssetLibrarian _mainQueue_invalidateFileSenderSession](self, "_mainQueue_invalidateFileSenderSession");
    v10 = objc_claimAutoreleasedReturnValue(-[NSObject clusterAssetIdentifier](v6, "clusterAssetIdentifier"));
    if (!v10)
    {
      v31 = ((uint64_t (*)(void))CarThemeAssetsLogging)();
      v15 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "vehicle doesn't require assets", buf, 2u);
      }
      goto LABEL_42;
    }
    v15 = objc_claimAutoreleasedReturnValue(-[CRThemeAssetLibrarian _assetVersionForVehicle:](self, "_assetVersionForVehicle:", v6));
    v16 = objc_claimAutoreleasedReturnValue(-[CRThemeAssetLibrarian _stagedAssetVersionForVehicle:](self, "_stagedAssetVersionForVehicle:", v6));
    if (v16)
    {
      if (-[NSObject compare:](v15, "compare:", v16) != (id)-1)
      {
LABEL_41:

LABEL_42:
        goto LABEL_43;
      }
      v17 = ((uint64_t (*)(void))CarThemeAssetsLogging)();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v50 = v16;
        v51 = 2114;
        v52 = v15;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "staged asset version %{public}@ is newer than vehicle's asset version %{public}@, starting update", buf, 0x16u);
      }

      v19 = objc_claimAutoreleasedReturnValue(-[NSObject accessoryContentVersion](v15, "accessoryContentVersion"));
      v41 = objc_claimAutoreleasedReturnValue(-[NSObject accessoryContentVersion](v16, "accessoryContentVersion"));
      v20 = -[NSObject isEqualToNumber:](v19, "isEqualToNumber:", &off_1000BE080);
      v21 = objc_alloc((Class)CARSessionChannel);
      v42 = objc_msgSend(v21, "initWithSession:channelType:", v4, kFigEndpointRemoteControlSessionClientTypeUUIDKey_CarPlayUpdateData);
      v43 = -[CRFileSender initWithChannel:isPriority:]([CRFileSender alloc], "initWithChannel:isPriority:", v42, v20);
      v22 = CarThemeAssetsLogging(-[CRThemeAssetLibrarian setFileSenderSession:](self, "setFileSenderSession:", v43));
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "file transfer channel opened", buf, 2u);
      }

      v44 = objc_claimAutoreleasedReturnValue(-[NSObject stagedClusterAssetURL](v6, "stagedClusterAssetURL"));
      if (v44)
      {
        v24 = CarThemeAssetsLogging(-[CRThemeAssetLibrarian setCurrentSessionTransferStatus:](self, "setCurrentSessionTransferStatus:", 1));
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v50 = v41;
          v51 = 2112;
          v52 = v44;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "sending version %@ from %@", buf, 0x16u);
        }

        v26 = objc_msgSend(objc_alloc((Class)CARThemeAsset), "initWithBaseURL:version:", v44, v16);
        objc_initWeak(&location, self);
        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472;
        v45[2] = sub_100045B34;
        v45[3] = &unk_1000B6CB8;
        v40 = &v47;
        objc_copyWeak(&v47, &location);
        v46 = v41;
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRFileSender sendThemeAsset:completion:](v43, "sendThemeAsset:completion:", v26, v45));
        if (v27)
        {
          v28 = objc_claimAutoreleasedReturnValue(-[CRThemeAssetLibrarian _assetProgressForVehicle:](self, "_assetProgressForVehicle:", v6, &v47));
          v29 = CarThemeAssetsLogging(-[NSObject addChild:withPendingUnitCount:](v28, "addChild:withPendingUnitCount:", v27, 1));
          v30 = objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v50 = v6;
            v51 = 2112;
            v52 = v28;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "attempting transfer for vehicle %@, overall progress is now: %@", buf, 0x16u);
          }

        }
        objc_destroyWeak(v40);
        objc_destroyWeak(&location);
      }
      else
      {
        v33 = CarThemeAssetsLogging(0);
        v26 = objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          sub_10006DFB4((uint64_t)v16, v26, v34, v35, v36, v37, v38, v39);
      }

    }
    else
    {
      v32 = ((uint64_t (*)(void))CarThemeAssetsLogging)();
      v19 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v50 = v15;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "vehicle is using the latest asset version %{public}@, no staged asset available", buf, 0xCu);
      }
    }

    goto LABEL_41;
  }
  if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "evaluate asset transfer: not connected", buf, 2u);
  }
LABEL_44:

}

- (void)_mainQueue_invalidateFileSenderSession
{
  void *v3;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetLibrarian fileSenderSession](self, "fileSenderSession"));
  objc_msgSend(v3, "invalidate");

  -[CRThemeAssetLibrarian setFileSenderSession:](self, "setFileSenderSession:", 0);
}

- (void)_mainQueue_hintDownloadForVehicle:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetLibrarian _assetRequestForVehicle:](self, "_assetRequestForVehicle:", v4));

  if (v5)
  {
    v7 = CarThemeAssetsLogging(v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "hinting download request for %@", (uint8_t *)&v10, 0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetLibrarian assetDownloader](self, "assetDownloader"));
    objc_msgSend(v9, "handleDownloadHintForAssetRequest:", v5);

  }
}

- (void)_mainQueue_removeOlderAssets
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetLibrarian vehicleStore](self, "vehicleStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allStoredVehicles"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "clusterAssetIdentifier"));
        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetLibrarian _assetVersionForVehicle:](self, "_assetVersionForVehicle:", v10));
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", v11));
          v14 = (void *)v13;
          if (v12 && (!v13 || objc_msgSend(v12, "compare:", v13) == (id)-1))
            objc_msgSend(v3, "setObject:forKey:", v12, v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100045FF8;
  v15[3] = &unk_1000B6CE0;
  v15[4] = self;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v15);

}

- (void)_mainQueue_handleVehiclesChanged
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  -[CRThemeAssetLibrarian _mainQueue_updateAssetRequests](self, "_mainQueue_updateAssetRequests");
  -[CRThemeAssetLibrarian _mainQueue_evaluateAssetTransferIfConnected](self, "_mainQueue_evaluateAssetTransferIfConnected");
  -[CRThemeAssetLibrarian _mainQueue_removeOlderAssets](self, "_mainQueue_removeOlderAssets");
}

- (void)receivedClusterAssetIdentifier:(id)a3 assetVersion:(id)a4 sdkVersion:(id)a5 forVehicle:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned __int8 v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  unsigned __int8 v41;
  id v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  id v53;
  uint64_t v54;
  NSObject *v55;
  id v56;
  uint64_t v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  NSObject *v63;
  void *v64;
  void *v65;
  CRThemeAssetLibrarian *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint8_t buf[4];
  id v72;
  __int16 v73;
  id v74;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (v13)
  {
    v14 = objc_msgSend(v13, "isPaired");
    if ((v14 & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetLibrarian _assetVersionForVehicle:](self, "_assetVersionForVehicle:", v13));
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "clusterAssetURL"));
      v17 = (void *)v16;
      v18 = 0;
      if (v15 && v16)
        v18 = objc_msgSend(objc_alloc((Class)CARThemeAsset), "initWithBaseURL:version:", v16, v15);
      v70 = v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "supportsThemeAssets"));
      v20 = v19 == 0;

      if (!v19)
      {
        v22 = CarThemeAssetsLogging(v21);
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "updating supportsThemeAssets to YES", buf, 2u);
        }

        objc_msgSend(v13, "setSupportsThemeAssets:", &__kCFBooleanTrue);
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "clusterAssetIdentifier"));
      v25 = v24;
      if (v10 && v24)
      {
        v26 = objc_msgSend(v24, "isEqual:", v10);

        if ((v26 & 1) != 0)
          goto LABEL_20;
      }
      else
      {

        if (!v10)
          goto LABEL_20;
      }
      v29 = CarThemeAssetsLogging(v27);
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "clusterAssetIdentifier"));
        *(_DWORD *)buf = 138412546;
        v72 = v31;
        v73 = 2112;
        v74 = v10;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "updating cluster asset identifier from %@ to %@", buf, 0x16u);

      }
      objc_msgSend(v13, "setClusterAssetIdentifier:", v10);
      v20 = 1;
LABEL_20:
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "clusterAssetVersion"));
      v33 = v32;
      if (v11 && v32)
      {
        v34 = objc_msgSend(v32, "isEqual:", v11);

        if ((v34 & 1) != 0)
          goto LABEL_28;
      }
      else
      {

        if (!v11)
          goto LABEL_28;
      }
      v36 = CarThemeAssetsLogging(v35);
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "clusterAssetVersion"));
        *(_DWORD *)buf = 138412546;
        v72 = v38;
        v73 = 2112;
        v74 = v11;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "updating cluster asset version from %@ to %@", buf, 0x16u);

      }
      objc_msgSend(v13, "setClusterAssetVersion:", v11);
      v20 = 1;
LABEL_28:
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "SDKVersion"));
      v40 = v39;
      if (v12 && v39)
      {
        v41 = objc_msgSend(v39, "isEqual:", v12);

        if ((v41 & 1) != 0)
          goto LABEL_31;
      }
      else
      {

        if (!v12)
        {
LABEL_31:
          if (!v20)
          {
            v43 = CarGeneralLogging(v42);
            v44 = objc_claimAutoreleasedReturnValue(v43);
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "saved vehicle already has current cluster information", buf, 2u);
            }
LABEL_53:

            goto LABEL_54;
          }
LABEL_38:
          v68 = v15;
          v48 = CarGeneralLogging(v42);
          v49 = objc_claimAutoreleasedReturnValue(v48);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v72 = v13;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Saving vehicle %@ to update cluster information", buf, 0xCu);
          }

          v69 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stagedClusterAssetiOSContentVersion"));
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stagedClusterAssetVersion"));
          v51 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stagedClusterAssetURL"));
          v52 = (void *)v51;
          if (v50)
          {
            if (v51)
            {
              v53 = objc_msgSend(v11, "compare:", v50);
              if (v53 != (id)-1)
              {
                if (v53)
                {
                  v62 = CarThemeAssetsLogging(v53);
                  v63 = objc_claimAutoreleasedReturnValue(v62);
                  if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
                    sub_10006E12C();

                  objc_msgSend(v13, "setStagedClusterAssetVersion:", 0);
                  objc_msgSend(v13, "setStagedClusterAssetURL:", 0);
                }
                else
                {
                  v54 = CarThemeAssetsLogging(0);
                  v55 = objc_claimAutoreleasedReturnValue(v54);
                  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "staged asset is now the current asset, making staged asset the current asset", buf, 2u);
                  }

                  objc_msgSend(v13, "setClusterAssetURL:", v52);
                  objc_msgSend(v13, "setClusterAssetiOSContentVersion:", v69);
                  objc_msgSend(v13, "setStagedClusterAssetiOSContentVersion:", 0);
                  objc_msgSend(v13, "setStagedClusterAssetVersion:", 0);
                  objc_msgSend(v13, "setStagedClusterAssetURL:", 0);
                  v67 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetLibrarian _assetVersionForVehicle:](self, "_assetVersionForVehicle:", v13));
                  v56 = objc_msgSend(objc_alloc((Class)CARThemeAsset), "initWithBaseURL:version:", v52, v67);
                  v57 = CarThemeAssetsLogging(v56);
                  v58 = objc_claimAutoreleasedReturnValue(v57);
                  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v72 = v56;
                    _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "updating to asset %@", buf, 0xCu);
                  }

                  v59 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetLibrarian libraryAgent](self, "libraryAgent"));
                  v66 = self;
                  v60 = v56;
                  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
                  objc_msgSend(v59, "notifyDidUpdateFromAsset:toAsset:forVehicleIdentifier:", v18, v60, v61);

                  self = v66;
                }
              }
            }
          }
          v64 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetLibrarian vehicleStore](self, "vehicleStore"));
          v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "saveVehicle:", v13));

          -[CRThemeAssetLibrarian _mainQueue_handleVehiclesChanged](self, "_mainQueue_handleVehiclesChanged");
          v15 = v68;
          v44 = v69;
          goto LABEL_53;
        }
      }
      v45 = CarThemeAssetsLogging(v42);
      v46 = objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "SDKVersion"));
        *(_DWORD *)buf = 138412546;
        v72 = v47;
        v73 = 2112;
        v74 = v12;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "updating SDK version from %@ to %@", buf, 0x16u);

      }
      v42 = objc_msgSend(v13, "setSDKVersion:", v12);
      goto LABEL_38;
    }
  }
  v28 = CarThemeAssetsLogging(v14);
  v18 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    sub_10006E100();
LABEL_54:

}

- (id)assetProgressForVehicle:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  void *v11;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetLibrarian _assetProgressForVehicle:](self, "_assetProgressForVehicle:", v4));

  v7 = CarThemeAssetsLogging(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "overall asset progress: %@", (uint8_t *)&v10, 0xCu);
  }

  return v5;
}

- (void)vehicleStoreDidBecomeAvailable:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100046898;
  block[3] = &unk_1000B51B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)vehicleStore:(id)a3 didRemoveVehicle:(id)a4
{
  id v4;
  _QWORD v5[5];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100046928;
  v5[3] = &unk_1000B5390;
  v5[4] = self;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "identifier", a3));
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (void)sessionDidConnect:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000469AC;
  block[3] = &unk_1000B51B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)sessionDidDisconnect:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100046A54;
  v4[3] = &unk_1000B5390;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (void)assetDownloader:(id)a3 attemptingDownloadForAssetRequest:(id)a4 version:(id)a5 progress:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v9 = a4;
  v10 = a5;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100046B98;
  v14[3] = &unk_1000B5EA0;
  v14[4] = self;
  v15 = v9;
  v16 = a6;
  v17 = v10;
  v11 = v10;
  v12 = v16;
  v13 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);

}

- (void)assetDownloader:(id)a3 failedDownloadForAssetRequest:(id)a4 version:(id)a5 error:(id)a6
{
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  CRThemeAssetLibrarian *v12;
  id v13;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100046DEC;
  block[3] = &unk_1000B53B8;
  v11 = a5;
  v12 = self;
  v13 = a6;
  v8 = v13;
  v9 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)assetDownloader:(id)a3 hasAsset:(id)a4 forAssetRequest:(id)a5
{
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  CRThemeAssetLibrarian *v12;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100046F58;
  block[3] = &unk_1000B53B8;
  v10 = a4;
  v11 = a5;
  v12 = self;
  v7 = v11;
  v8 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)libraryAgent:(id)a3 requestsCurrentAssetForVehicleIdentifier:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v7 = a4;
  v8 = a5;
  if (v8)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100047394;
    block[3] = &unk_1000B6D08;
    block[4] = self;
    v10 = v7;
    v11 = v8;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (void)libraryAgent:(id)a3 receivedOverrideAsset:(id)a4 forVehicleIdentifier:(id)a5
{
  id v7;
  id v8;
  void *v9;
  _QWORD block[5];
  id v11;
  id v12;

  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (v7)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100047744;
    block[3] = &unk_1000B53B8;
    block[4] = self;
    v11 = v8;
    v12 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (id)_vehicleForVehicleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetLibrarian vehicleStore](self, "vehicleStore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allStoredVehicles"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000479EC;
    v9[3] = &unk_1000B6D30;
    v10 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bs_firstObjectPassingTest:", v9));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_assetRequestForVehicle:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  CRThemeAssetDownloadRequest *v7;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clusterAssetIdentifier"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "SDKVersion"));

  if (v5 | v6)
    v7 = -[CRThemeAssetDownloadRequest initWithAssetIdentifier:maximumSDKVersion:maximumCompatibilityVersion:]([CRThemeAssetDownloadRequest alloc], "initWithAssetIdentifier:maximumSDKVersion:maximumCompatibilityVersion:", v5, v6, objc_msgSend((id)objc_opt_class(self), "_supportedCompatibilityVersion"));
  else
    v7 = 0;

  return v7;
}

- (id)_vehiclesForAssetRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "maximumSDKVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetLibrarian vehicleStore](self, "vehicleStore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allStoredVehicles"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100047BCC;
  v14[3] = &unk_1000B6D58;
  v15 = v5;
  v16 = v6;
  v17 = v4;
  v9 = v4;
  v10 = v6;
  v11 = v5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bs_filter:", v14));

  return v12;
}

- (id)_assetVersionForVehicle:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  id v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "clusterAssetIdentifier"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "clusterAssetiOSContentVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "clusterAssetVersion"));

  v7 = 0;
  if (v4 && v6)
  {
    if (!v5)
      v5 = CFSTR("0");
    v7 = objc_msgSend(objc_alloc((Class)CARThemeAssetVersion), "initWithIdentifier:iOSContentVersion:accessoryContentVersion:", v4, v5, v6);
  }

  return v7;
}

- (id)_stagedAssetVersionForVehicle:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  id v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "clusterAssetIdentifier"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stagedClusterAssetiOSContentVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stagedClusterAssetVersion"));

  v7 = 0;
  if (v4 && v6)
  {
    if (!v5)
      v5 = CFSTR("0");
    v7 = objc_msgSend(objc_alloc((Class)CARThemeAssetVersion), "initWithIdentifier:iOSContentVersion:accessoryContentVersion:", v4, v5, v6);
  }

  return v7;
}

- (id)_assetProgressForVehicle:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  int v12;
  id v13;
  __int16 v14;
  void *v15;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetLibrarian assetProgressForVehicleIdentifiers](self, "assetProgressForVehicleIdentifiers"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

    if (!v6)
    {
      v6 = objc_msgSend(objc_alloc((Class)NSProgress), "initWithParent:userInfo:", 0, 0);
      objc_msgSend(v6, "setTotalUnitCount:", 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetLibrarian assetProgressForVehicleIdentifiers](self, "assetProgressForVehicleIdentifiers"));
      objc_msgSend(v7, "setObject:forKey:", v6, v4);

      v9 = CarThemeAssetsLogging(v8);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v12 = 138412546;
        v13 = v6;
        v14 = 2112;
        v15 = v4;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "created asset progress %@ for vehicleID: %@", (uint8_t *)&v12, 0x16u);
      }

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_removeAssetProgressForVehicleIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetLibrarian assetProgressForVehicleIdentifiers](self, "assetProgressForVehicleIdentifiers"));
    objc_msgSend(v5, "removeObjectForKey:", v4);

    v7 = CarThemeAssetsLogging(v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "removing asset progress for vehicleID: %@", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (CARThemeAssetLibraryAgent)libraryAgent
{
  return self->_libraryAgent;
}

- (CRVehicleStore)vehicleStore
{
  return self->_vehicleStore;
}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (NSMutableDictionary)assetProgressForVehicleIdentifiers
{
  return self->_assetProgressForVehicleIdentifiers;
}

- (CRThemeAssetDownloader)assetDownloader
{
  return self->_assetDownloader;
}

- (CRFileSender)fileSenderSession
{
  return self->_fileSenderSession;
}

- (void)setFileSenderSession:(id)a3
{
  objc_storeStrong((id *)&self->_fileSenderSession, a3);
}

- (unint64_t)currentSessionTransferStatus
{
  return self->_currentSessionTransferStatus;
}

- (void)setCurrentSessionTransferStatus:(unint64_t)a3
{
  self->_currentSessionTransferStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileSenderSession, 0);
  objc_storeStrong((id *)&self->_assetDownloader, 0);
  objc_storeStrong((id *)&self->_assetProgressForVehicleIdentifiers, 0);
  objc_storeStrong((id *)&self->_sessionStatus, 0);
  objc_storeStrong((id *)&self->_vehicleStore, 0);
  objc_storeStrong((id *)&self->_libraryAgent, 0);
}

@end
