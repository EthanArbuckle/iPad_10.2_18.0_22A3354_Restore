@implementation BKLibraryAssetStatusController

+ (id)sharedController
{
  if (qword_DE4A0 != -1)
    dispatch_once(&qword_DE4A0, &stru_C26E8);
  return (id)qword_DE4A8;
}

- (BKLibraryAssetStatusController)init
{
  void *v3;
  BKLibraryAssetStatusController *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v4 = -[BKLibraryAssetStatusController initWithLibrary:](self, "initWithLibrary:", v3);

  return v4;
}

- (BKLibraryAssetStatusController)initWithLibrary:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  void *v9;
  dispatch_queue_attr_t v10;
  NSObject *v11;
  dispatch_queue_attr_t v12;
  NSObject *v13;
  dispatch_queue_t v14;
  void *v15;
  NSMutableArray *v16;
  void *v17;
  NSMutableArray *v18;
  void *v19;
  BKAssetArrayController *v20;
  void *v21;
  BKAssetArrayController *v22;
  void *v23;
  BKAssetArrayController *v24;
  void *v25;
  NSMutableDictionary *v26;
  void *v27;
  NSMutableArray *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  void *i;
  void *v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  unsigned __int8 *v44;
  id *v46;
  _QWORD v47[4];
  unsigned __int8 *v48;
  _QWORD block[4];
  unsigned __int8 *v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  id v61;
  id location;
  objc_super v63;
  _BYTE v64[128];

  v4 = a3;
  v63.receiver = self;
  v63.super_class = (Class)BKLibraryAssetStatusController;
  v5 = -[BKLibraryAssetStatusController init](&v63, "init");
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = dispatch_queue_create("com.apple.iBooks.BKLibraryAssetStatusController.statuses", v7);
    v9 = (void *)*((_QWORD *)v5 + 18);
    *((_QWORD *)v5 + 18) = v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_UTILITY, 0);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = dispatch_queue_create("com.apple.iBooks.BKLibraryAssetStatusController.monitors", v13);
    v15 = (void *)*((_QWORD *)v5 + 19);
    *((_QWORD *)v5 + 19) = v14;

    v16 = objc_opt_new(NSMutableArray);
    v17 = (void *)*((_QWORD *)v5 + 27);
    *((_QWORD *)v5 + 27) = v16;

    v18 = objc_opt_new(NSMutableArray);
    v19 = (void *)*((_QWORD *)v5 + 4);
    *((_QWORD *)v5 + 4) = v18;

    v20 = -[BKAssetArrayController initWithContent:]([BKAssetArrayController alloc], "initWithContent:", *((_QWORD *)v5 + 4));
    v21 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v20;

    v22 = -[BKAssetArrayController initWithContent:]([BKAssetArrayController alloc], "initWithContent:", *((_QWORD *)v5 + 4));
    v23 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v22;

    v24 = -[BKAssetArrayController initWithContent:]([BKAssetArrayController alloc], "initWithContent:", *((_QWORD *)v5 + 4));
    v25 = (void *)*((_QWORD *)v5 + 3);
    *((_QWORD *)v5 + 3) = v24;

    v26 = objc_opt_new(NSMutableDictionary);
    v27 = (void *)*((_QWORD *)v5 + 5);
    *((_QWORD *)v5 + 5) = v26;

    *((_QWORD *)v5 + 22) = 0x3FF0000000000000;
    v5[162] = 0;
    *((_QWORD *)v5 + 25) = 0;
    *((_WORD *)v5 + 80) = 0;
    v28 = objc_opt_new(NSMutableArray);
    v29 = (void *)*((_QWORD *)v5 + 15);
    *((_QWORD *)v5 + 15) = v28;

    objc_msgSend(v5, "_readPersistedInfoFromDisk");
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[BURestrictionsProvider sharedInstance](BURestrictionsProvider, "sharedInstance"));
    objc_msgSend(v30, "addObserver:", v5);

    objc_initWeak(&location, v5);
    v31 = (void *)*((_QWORD *)v5 + 2);
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_3DE4C;
    v60[3] = &unk_C2710;
    v46 = &v61;
    objc_copyWeak(&v61, &location);
    objc_msgSend(v31, "setFilter:", v60);
    v32 = (void *)*((_QWORD *)v5 + 1);
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_3DE9C;
    v58[3] = &unk_C2710;
    objc_copyWeak(&v59, &location);
    objc_msgSend(v32, "setFilter:", v58);
    v33 = (void *)*((_QWORD *)v5 + 3);
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_3DEEC;
    v56[3] = &unk_C2710;
    objc_copyWeak(&v57, &location);
    objc_msgSend(v33, "setFilter:", v56);
    objc_msgSend(v5, "setupStateObservation");
    v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataSourcesConformingToProtocol:", &OBJC_PROTOCOL___BKBookDownloadController));
    v35 = (void *)*((_QWORD *)v5 + 7);
    *((_QWORD *)v5 + 7) = v34;

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v36 = *((id *)v5 + 7);
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
    if (v37)
    {
      v38 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v37; i = (char *)i + 1)
        {
          if (*(_QWORD *)v53 != v38)
            objc_enumerationMutation(v36);
          v40 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v40, "setExplicitContentRestricted:", v5[136], v46);
          objc_msgSend(v40, "updateDownloadStatus");
        }
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
      }
      while (v37);
    }

    v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataSourceConformingToProtocol:", &OBJC_PROTOCOL___BKBookUpdateController));
    v42 = (void *)*((_QWORD *)v5 + 8);
    *((_QWORD *)v5 + 8) = v41;

    v43 = *((_QWORD *)v5 + 19);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_3DF3C;
    block[3] = &unk_C12F8;
    v44 = v5;
    v50 = v44;
    v51 = v4;
    dispatch_async(v43, block);
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_3E068;
    v47[3] = &unk_C1400;
    v48 = v44;
    objc_msgSend(v48, "_updateAssetsWithBlock:", v47);

    objc_destroyWeak(&v57);
    objc_destroyWeak(&v59);
    objc_destroyWeak(v46);
    objc_destroyWeak(&location);
  }

  return (BKLibraryAssetStatusController *)v5;
}

- (void)_updatedAssets
{
  _QWORD *v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD v11[4];
  _QWORD *v12;
  _QWORD v13[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD block[4];
  _QWORD *v19;
  _QWORD v20[5];
  _BYTE v21[128];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_3E3F0;
  v20[3] = &unk_C1400;
  v20[4] = self;
  v3 = objc_retainBlock(v20);
  if (v3)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v3[2])(v3);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_3E42C;
      block[3] = &unk_C2738;
      v19 = v3;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
  }

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_additionalArrayControllers;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v8);
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_3E438;
        v13[3] = &unk_C1400;
        v13[4] = v9;
        v10 = objc_retainBlock(v13);
        if (v10)
        {
          if (+[NSThread isMainThread](NSThread, "isMainThread"))
          {
            ((void (*)(_QWORD *))v10[2])(v10);
          }
          else
          {
            v11[0] = _NSConcreteStackBlock;
            v11[1] = 3221225472;
            v11[2] = sub_3E440;
            v11[3] = &unk_C2738;
            v12 = v10;
            dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);

          }
        }

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v21, 16);
    }
    while (v6);
  }

}

- (void)_addAssetID:(id)a3
{
  id v4;
  unsigned __int8 v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = -[NSMutableArray containsObject:](self->_assetsArray, "containsObject:", v4);
    v4 = v6;
    if ((v5 & 1) == 0)
    {
      -[NSMutableArray addObject:](self->_assetsArray, "addObject:", v6);
      v4 = v6;
    }
  }

}

- (void)_removeAssetID:(id)a3
{
  id v4;
  unsigned int v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = -[NSMutableArray containsObject:](self->_assetsArray, "containsObject:", v4);
    v4 = v6;
    if (v5)
    {
      -[NSMutableArray removeObject:](self->_assetsArray, "removeObject:", v6);
      v4 = v6;
    }
  }

}

- (void)_removeAssetIDs:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[NSMutableArray removeObject:](self->_assetsArray, "removeObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
  -[BKLibraryAssetStatusController _updatedAssets](self, "_updatedAssets");

}

- (id)_persistedInfoURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLForDirectory:inDomain:appropriateForURL:create:error:", 9, 1, 0, 1, 0));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("BKLibraryAssetStatusController"), 0));
  return v4;
}

- (void)_writePersistedInfoToDisk
{
  void *v3;
  void *v4;
  NSMutableSet *acknowledgedDownloads;
  NSMutableSet *acknowledgedUpdates;
  NSMutableDictionary *updateDictionary;
  NSObject *backgroundQueue;
  id v9;
  _QWORD v10[4];
  id v11;
  BKLibraryAssetStatusController *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  acknowledgedDownloads = self->_acknowledgedDownloads;
  if (acknowledgedDownloads)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", acknowledgedDownloads, CFSTR("AckedDownloads"));
  acknowledgedUpdates = self->_acknowledgedUpdates;
  if (acknowledgedUpdates)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", acknowledgedUpdates, CFSTR("AckedUpdates"));
  updateDictionary = self->_updateDictionary;
  if (updateDictionary)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", updateDictionary, CFSTR("Updates"));
  backgroundQueue = self->_backgroundQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_3E740;
  v10[3] = &unk_C12F8;
  v11 = v4;
  v12 = self;
  v9 = v4;
  dispatch_async(backgroundQueue, v10);

}

- (void)_readPersistedInfoFromDisk
{
  void *v3;
  void *v4;
  NSDictionary *persistentInfo;
  NSMutableSet *acknowledgedDownloads;
  NSMutableSet *acknowledgedUpdates;
  NSMutableDictionary *updateDictionary;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSSet *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSMutableSet *v26;
  NSMutableSet *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSMutableSet *v32;
  NSMutableSet *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  NSMutableDictionary *v38;
  NSMutableDictionary *v39;
  NSMutableSet *v40;
  NSMutableSet *v41;
  NSMutableSet *v42;
  NSMutableSet *v43;
  NSMutableDictionary *v44;
  NSMutableDictionary *v45;
  id v46;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetStatusController _persistedInfoURL](self, "_persistedInfoURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", v3));

  persistentInfo = self->_persistentInfo;
  self->_persistentInfo = 0;

  acknowledgedDownloads = self->_acknowledgedDownloads;
  self->_acknowledgedDownloads = 0;

  acknowledgedUpdates = self->_acknowledgedUpdates;
  self->_acknowledgedUpdates = 0;

  updateDictionary = self->_updateDictionary;
  self->_updateDictionary = 0;

  if (v4)
  {
    v46 = 0;
    v9 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v4, &v46);
    v10 = v46;
    v11 = v10;
    if (v10)
    {
      v12 = BKLibraryLog(v10);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_826CC((uint64_t)v11, v13);
    }
    else
    {
      v14 = objc_opt_class(NSDictionary);
      v15 = objc_opt_class(NSMutableSet);
      v16 = objc_opt_class(NSString);
      v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v14, v15, v16, objc_opt_class(NSNumber), 0);
      v13 = objc_claimAutoreleasedReturnValue(v17);
      v18 = objc_opt_class(NSDictionary);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "decodeObjectOfClasses:forKey:", v13, CFSTR("Root")));
      v20 = BUDynamicCast(v18, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

      objc_storeStrong((id *)&self->_persistentInfo, v21);
      v22 = objc_opt_class(NSSet);
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("AckedDownloads")));
      v24 = BUDynamicCast(v22, v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v26 = (NSMutableSet *)objc_msgSend(v25, "mutableCopy");
      v27 = self->_acknowledgedDownloads;
      self->_acknowledgedDownloads = v26;

      v28 = objc_opt_class(NSSet);
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("AckedUpdates")));
      v30 = BUDynamicCast(v28, v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      v32 = (NSMutableSet *)objc_msgSend(v31, "mutableCopy");
      v33 = self->_acknowledgedUpdates;
      self->_acknowledgedUpdates = v32;

      v34 = objc_opt_class(NSDictionary);
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Updates")));
      v36 = BUDynamicCast(v34, v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      v38 = (NSMutableDictionary *)objc_msgSend(v37, "mutableCopy");
      v39 = self->_updateDictionary;
      self->_updateDictionary = v38;

    }
  }
  if (!self->_acknowledgedDownloads)
  {
    v40 = objc_opt_new(NSMutableSet);
    v41 = self->_acknowledgedDownloads;
    self->_acknowledgedDownloads = v40;

  }
  if (!self->_acknowledgedUpdates)
  {
    v42 = objc_opt_new(NSMutableSet);
    v43 = self->_acknowledgedUpdates;
    self->_acknowledgedUpdates = v42;

  }
  if (!self->_updateDictionary)
  {
    v44 = objc_opt_new(NSMutableDictionary);
    v45 = self->_updateDictionary;
    self->_updateDictionary = v44;

  }
}

- (void)_writePersistentInfoIfNeeded
{
  NSMutableSet *acknowledgedDownloads;
  void *v4;
  unsigned __int8 v5;
  NSMutableSet *acknowledgedUpdates;
  void *v7;
  unsigned int v8;
  NSMutableDictionary *updateDictionary;
  void *v10;

  acknowledgedDownloads = self->_acknowledgedDownloads;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_persistentInfo, "objectForKeyedSubscript:", CFSTR("AckedDownloads")));
  v5 = -[NSMutableSet isEqual:](acknowledgedDownloads, "isEqual:", v4);

  acknowledgedUpdates = self->_acknowledgedUpdates;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_persistentInfo, "objectForKeyedSubscript:", CFSTR("AckedUpdates")));
  v8 = -[NSMutableSet isEqual:](acknowledgedUpdates, "isEqual:", v7);

  updateDictionary = self->_updateDictionary;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_persistentInfo, "objectForKeyedSubscript:", CFSTR("Updates")));
  LODWORD(updateDictionary) = -[NSMutableDictionary isEqual:](updateDictionary, "isEqual:", v10);

  if (!(_DWORD)updateDictionary || !v8 || (v5 & 1) == 0)
    -[BKLibraryAssetStatusController _writePersistedInfoToDisk](self, "_writePersistedInfoToDisk");
}

- (id)_updateInfoForAssetID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *updateDictionary;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;

  v4 = a3;
  if (v4)
  {
    v5 = objc_opt_class(NSDictionary);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_updateDictionary, "objectForKey:", v4));
    v7 = BUDynamicCast(v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    v9 = objc_opt_class(NSMutableDictionary);
    v10 = BUDynamicCast(v9, v8);
    v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v10);
    if (!v11)
    {
      if (v8)
        v12 = (NSMutableDictionary *)objc_msgSend(v8, "mutableCopy");
      else
        v12 = objc_opt_new(NSMutableDictionary);
      v11 = v12;
      updateDictionary = self->_updateDictionary;
      if (!updateDictionary)
      {
        v14 = objc_opt_new(NSMutableDictionary);
        v15 = self->_updateDictionary;
        self->_updateDictionary = v14;

        updateDictionary = self->_updateDictionary;
      }
      -[NSMutableDictionary setObject:forKey:](updateDictionary, "setObject:forKey:", v11, v4);
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_isSignedInForAssetID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "libraryAssetOnMainQueueWithAssetID:", v4));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storeID"));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetStatusController storeDelegate](self, "storeDelegate"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accountID"));
      v10 = objc_msgSend(v8, "libraryAssetStatusController:isAccountPrimaryAndSignedIn:", self, v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_hasActiveDownloadForAssetID:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetStatusController statusForAssetID:](self, "statusForAssetID:", a3));
  v4 = (char *)objc_msgSend(v3, "state") - 2 < (_BYTE *)&dword_4 + 3;

  return v4;
}

- (BOOL)_passesExplicitContentFilter:(id)a3
{
  void *v3;
  void *v4;
  unsigned int v5;

  if (self->_explicitContentRestricted)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "isExplicit"));
    v4 = v3;
    if (v3)
      v5 = objc_msgSend(v3, "BOOLValue") ^ 1;
    else
      LOBYTE(v5) = 0;

  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)_includedInUpdatesForAssetID:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_statusDictionary, "objectForKey:", v4));
    if (objc_msgSend(v5, "state") == (char *)&dword_0 + 1)
    {
      v6 = 1;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAssetArrayController arrangedObjects](self->_updateAssets, "arrangedObjects"));
      v6 = objc_msgSend(v7, "containsObject:", v4);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_includeInDownloadsForAssetID:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (v4 && !-[BKLibraryAssetStatusController _includedInUpdatesForAssetID:](self, "_includedInUpdatesForAssetID:", v4))
    v5 = -[BKLibraryAssetStatusController _hasActiveDownloadForAssetID:](self, "_hasActiveDownloadForAssetID:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)_includeInUploadsForAssetID:(id)a3
{
  void *v3;
  BOOL v4;

  if (!a3)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_statusDictionary, "objectForKey:"));
  v4 = (char *)objc_msgSend(v3, "state") - 9 < (_BYTE *)&dword_0 + 3;

  return v4;
}

- (BOOL)_filterUpdateForAsset:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetID"));
  if (-[BKLibraryAssetStatusController _includedInUpdatesForAssetID:](self, "_includedInUpdatesForAssetID:", v5)
    && (-[BKLibraryAssetStatusController _isSignedInForAssetID:](self, "_isSignedInForAssetID:", v5)
     || -[BKLibraryAssetStatusController _hasActiveDownloadForAssetID:](self, "_hasActiveDownloadForAssetID:", v5)))
  {
    v6 = -[BKLibraryAssetStatusController _passesExplicitContentFilter:](self, "_passesExplicitContentFilter:", v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_filterDownloadForAsset:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetID"));
  if (-[BKLibraryAssetStatusController _includeInDownloadsForAssetID:](self, "_includeInDownloadsForAssetID:", v5))
    v6 = -[BKLibraryAssetStatusController _passesExplicitContentFilter:](self, "_passesExplicitContentFilter:", v4);
  else
    v6 = 0;

  return v6;
}

- (BOOL)_filterUploadsForAsset:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "assetID"));
  LOBYTE(self) = -[BKLibraryAssetStatusController _includeInUploadsForAssetID:](self, "_includeInUploadsForAssetID:", v4);

  return (char)self;
}

- (unint64_t)updateAssetsCount
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAssetArrayController arrangedObjects](self->_updateAssets, "arrangedObjects"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (unint64_t)downloadAssetsCount
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAssetArrayController arrangedObjects](self->_downloadAssets, "arrangedObjects"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (unint64_t)uploadAssetsCount
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAssetArrayController arrangedObjects](self->_uploadAssets, "arrangedObjects"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (void)setupStateObservation
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_downloadStatusNotification:", CFSTR("BKLibraryDownloadStatusNotification"), 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_libraryUpdateNotification:", CFSTR("BKLibraryUpdateNotification"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_libraryOwnershipNotification:", CFSTR("BKLibraryOwnershipDidChangeNotification"), v3);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BURestrictionsProvider sharedInstance](BURestrictionsProvider, "sharedInstance"));
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)BKLibraryAssetStatusController;
  -[BKLibraryAssetStatusController dealloc](&v5, "dealloc");
}

- (void)_updateTotalPercentCompleteForAssetIDs:(id)a3
{
  id v4;
  NSMutableDictionary *statusDictionary;
  id v6;
  unint64_t v7;
  double v8;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  v17 = 0;
  v18 = (double *)&v17;
  v19 = 0x2020000000;
  v20 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  statusDictionary = self->_statusDictionary;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_3F42C;
  v9[3] = &unk_C2760;
  v6 = v4;
  v10 = v6;
  v11 = &v13;
  v12 = &v17;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](statusDictionary, "enumerateKeysAndObjectsUsingBlock:", v9);
  v7 = v14[3];
  if (v7)
    v8 = v18[3] / (float)v7;
  else
    v8 = 1.0;
  -[BKLibraryAssetStatusController setDownloadAssetsTotalPercentComplete:](self, "setDownloadAssetsTotalPercentComplete:", v8);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

}

- (void)_updateSeriesContainerDownloadStatusForAssetIDs:(id)a3
{
  NSMutableDictionary *statusDictionary;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  BKLibraryAssetStatusController *v27;

  statusDictionary = self->_statusDictionary;
  v5 = a3;
  v6 = -[NSMutableDictionary copy](statusDictionary, "copy");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v7));

  objc_msgSend(v8, "intersectSet:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_3F6A0;
  v20[3] = &unk_C27B0;
  v13 = v8;
  v21 = v13;
  v14 = v6;
  v22 = v14;
  v15 = v12;
  v23 = v15;
  v16 = v11;
  v24 = v16;
  v17 = v10;
  v25 = v17;
  v18 = v9;
  v26 = v18;
  v27 = self;
  v19 = objc_retainBlock(v20);
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(v15, "performNamed:workerQueueBlock:", CFSTR("updateSeriesContainerDownloadStatus"), v19);
  else
    objc_msgSend(v15, "performNamed:workerQueueBlockAndWait:", CFSTR("updateSeriesContainerDownloadStatus"), v19);

}

- (void)_updateCountsForAssetIDs:(id)a3
{
  id v4;
  NSMutableDictionary *statusDictionary;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  statusDictionary = self->_statusDictionary;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_3FE80;
  v7[3] = &unk_C2760;
  v6 = v4;
  v8 = v6;
  v9 = &v15;
  v10 = &v11;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](statusDictionary, "enumerateKeysAndObjectsUsingBlock:", v7);
  if (self->_canResumeCount != v12[3])
    -[BKLibraryAssetStatusController setCanResumeCount:](self, "setCanResumeCount:");
  if (self->_canPauseCount != v16[3])
    -[BKLibraryAssetStatusController setCanPauseCount:](self, "setCanPauseCount:");

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

}

- (void)_updateAcknowledgeCountsWithAssetIDs:(id)a3
{
  id v4;
  NSMutableDictionary *statusDictionary;
  id v6;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, void *);
  void *v10;
  id v11;
  BKLibraryAssetStatusController *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  statusDictionary = self->_statusDictionary;
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_40030;
  v10 = &unk_C27D8;
  v6 = v4;
  v11 = v6;
  v12 = self;
  v13 = &v19;
  v14 = &v15;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](statusDictionary, "enumerateKeysAndObjectsUsingBlock:", &v7);
  if (self->_unacknowledgedDownloadsCount != v20[3])
    -[BKLibraryAssetStatusController setUnacknowledgedDownloadsCount:](self, "setUnacknowledgedDownloadsCount:", v7, v8, v9, v10);
  if (self->_unacknowledgedUpdatesCount != v16[3])
    -[BKLibraryAssetStatusController setUnacknowledgedUpdatesCount:](self, "setUnacknowledgedUpdatesCount:");

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

}

- (void)_updateUploadStatusForAssetIDs:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v6[8];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_40240;
  v6[3] = &unk_C2800;
  v6[4] = self;
  v6[5] = &v11;
  v6[6] = &v15;
  v6[7] = &v7;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);
  if (v12[3])
  {
    v5 = 1;
  }
  else if (v16[3])
  {
    v5 = 2;
  }
  else if (v8[3])
  {
    v5 = 3;
  }
  else
  {
    v5 = 0;
  }
  if (v5 != self->_uploadStatus)
    -[BKLibraryAssetStatusController setUploadStatus:](self, "setUploadStatus:");
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

}

- (void)_trimUpdateDictionary
{
  NSMutableDictionary *updateDictionary;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_403A8;
  v9 = sub_403B8;
  v10 = 0;
  updateDictionary = self->_updateDictionary;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_403C0;
  v4[3] = &unk_C2828;
  v4[4] = &v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](updateDictionary, "enumerateKeysAndObjectsUsingBlock:", v4);
  if (v6[5])
    -[NSMutableDictionary removeObjectsForKeys:](self->_updateDictionary, "removeObjectsForKeys:");
  _Block_object_dispose(&v5, 8);

}

- (void)_updateAssetsWithBlock:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  _BOOL4 v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void (**v22)(_QWORD);

  v22 = (void (**)(_QWORD))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAssetArrayController arrangedObjects](self->_updateAssets, "arrangedObjects"));
  v5 = (unint64_t)objc_msgSend(v4, "count");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAssetArrayController arrangedObjects](self->_downloadAssets, "arrangedObjects"));
  v7 = (unint64_t)objc_msgSend(v6, "count");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAssetArrayController arrangedObjects](self->_uploadAssets, "arrangedObjects"));
  v9 = (unint64_t)objc_msgSend(v8, "count");

  v21 = (v5 | v7 | v9) != 0;
  if (v22)
    v22[2](v22);
  v10 = v5 != 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKAssetArrayController arrangedObjects](self->_updateAssets, "arrangedObjects"));
  v12 = (unint64_t)objc_msgSend(v11, "count");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKAssetArrayController arrangedObjects](self->_downloadAssets, "arrangedObjects"));
  v14 = (unint64_t)objc_msgSend(v13, "count");

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKAssetArrayController arrangedObjects](self->_uploadAssets, "arrangedObjects"));
  v16 = (unint64_t)objc_msgSend(v15, "count");

  if (v10 != (v12 != 0))
    -[BKLibraryAssetStatusController setHasUpdates:](self, "setHasUpdates:", v12 != 0);
  if ((v7 != 0) != (v14 != 0))
    -[BKLibraryAssetStatusController setHasDownloads:](self, "setHasDownloads:", v14 != 0);
  if ((v9 != 0) != (v16 != 0))
    -[BKLibraryAssetStatusController setHasUploads:](self, "setHasUploads:", v16 != 0);
  if (v21 != ((v12 | v14 | v16) != 0))
    -[BKLibraryAssetStatusController setHasUpdatesOrDownloadsOrUploads:](self, "setHasUpdatesOrDownloadsOrUploads:", (v12 | v14 | v16) != 0);
  v17 = objc_alloc_init((Class)NSMutableSet);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKAssetArrayController arrangedObjects](self->_updateAssets, "arrangedObjects"));
  objc_msgSend(v17, "addObjectsFromArray:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKAssetArrayController arrangedObjects](self->_downloadAssets, "arrangedObjects"));
  objc_msgSend(v17, "addObjectsFromArray:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKAssetArrayController arrangedObjects](self->_uploadAssets, "arrangedObjects"));
  -[BKLibraryAssetStatusController _updateUploadStatusForAssetIDs:](self, "_updateUploadStatusForAssetIDs:", v20);

  -[BKLibraryAssetStatusController _updateTotalPercentCompleteForAssetIDs:](self, "_updateTotalPercentCompleteForAssetIDs:", v17);
  -[BKLibraryAssetStatusController _updateCountsForAssetIDs:](self, "_updateCountsForAssetIDs:", v17);
  -[BKLibraryAssetStatusController _updateSeriesContainerDownloadStatusForAssetIDs:](self, "_updateSeriesContainerDownloadStatusForAssetIDs:", v17);
  -[BKLibraryAssetStatusController _updateAcknowledgeCountsWithAssetIDs:](self, "_updateAcknowledgeCountsWithAssetIDs:", v17);
  -[BKLibraryAssetStatusController _trimUpdateDictionary](self, "_trimUpdateDictionary");
  -[BKLibraryAssetStatusController _writePersistentInfoIfNeeded](self, "_writePersistentInfoIfNeeded");

}

- (BUCoalescingCallBlock)downloadRelatedNotificationCoalescingBlock
{
  BUCoalescingCallBlock *downloadRelatedNotificationCoalescingBlock;
  BUCoalescingCallBlock *v4;
  BUCoalescingCallBlock *v5;
  _QWORD v7[5];

  downloadRelatedNotificationCoalescingBlock = self->_downloadRelatedNotificationCoalescingBlock;
  if (!downloadRelatedNotificationCoalescingBlock)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_4075C;
    v7[3] = &unk_C2850;
    v7[4] = self;
    v4 = (BUCoalescingCallBlock *)objc_msgSend(objc_alloc((Class)BUCoalescingCallBlock), "initWithNotifyBlock:blockDescription:", v7, CFSTR("BKLibraryAssetStatusController"));
    v5 = self->_downloadRelatedNotificationCoalescingBlock;
    self->_downloadRelatedNotificationCoalescingBlock = v4;

    -[BUCoalescingCallBlock setCoalescingDelay:](self->_downloadRelatedNotificationCoalescingBlock, "setCoalescingDelay:", 0.1);
    -[BUCoalescingCallBlock setMaximumDelay:](self->_downloadRelatedNotificationCoalescingBlock, "setMaximumDelay:", 0.5);
    downloadRelatedNotificationCoalescingBlock = self->_downloadRelatedNotificationCoalescingBlock;
  }
  return downloadRelatedNotificationCoalescingBlock;
}

- (void)_downloadStatusNotification:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *downloadStatusesQueue;
  void *v10;
  id v11;
  _QWORD block[5];
  id v13;

  v11 = a3;
  v4 = objc_opt_class(NSSet);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BKLibraryDownloadStatusKey")));
  v7 = BUDynamicCast(v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (objc_msgSend(v8, "count"))
  {
    downloadStatusesQueue = self->_downloadStatusesQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_40878;
    block[3] = &unk_C12F8;
    block[4] = self;
    v13 = v11;
    dispatch_sync(downloadStatusesQueue, block);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetStatusController downloadRelatedNotificationCoalescingBlock](self, "downloadRelatedNotificationCoalescingBlock"));
    objc_msgSend(v10, "signalWithCompletion:", &stru_C2870);

  }
}

- (void)_processDownloadRelatedNotificationsCompletion:(id)a3
{
  id v4;
  NSObject *downloadStatusesQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  downloadStatusesQueue = self->_downloadStatusesQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_40904;
  block[3] = &unk_C1428;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(downloadStatusesQueue, block);

}

- (void)_processDownloadStatuses:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_40E74;
    block[3] = &unk_C21D0;
    block[4] = self;
    v9 = v6;
    v10 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (void)_libraryUpdateNotification:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_4117C;
  v4[3] = &unk_C12F8;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (void)_removeTrackingOfAssetID:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_41508;
    v6[3] = &unk_C12F8;
    v6[4] = self;
    v7 = v4;
    -[BKLibraryAssetStatusController _updateAssetsWithBlock:](self, "_updateAssetsWithBlock:", v6);

  }
}

- (void)_libraryOwnershipNotification:(id)a3
{
  id v4;
  NSObject *downloadStatusesQueue;
  void *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  downloadStatusesQueue = self->_downloadStatusesQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_415FC;
  block[3] = &unk_C12F8;
  block[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(downloadStatusesQueue, block);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetStatusController downloadRelatedNotificationCoalescingBlock](self, "downloadRelatedNotificationCoalescingBlock"));
  objc_msgSend(v6, "signalWithCompletion:", &stru_C2890);

}

- (void)_processLibraryOwnershipNotification:(id)a3 completion:(id)a4
{
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  unsigned __int16 v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  id *v18;
  NSObject *downloadStatusesQueue;
  id v20;
  id v21;
  void *v22;
  id obj;
  uint64_t v24;
  _QWORD v26[4];
  id v27;
  _QWORD v28[7];
  __int16 v29;
  _QWORD v30[7];
  _QWORD block[5];
  id v32;
  NSObject *v33;
  unsigned __int16 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];

  v21 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v6 = dispatch_group_create();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v22 = v5;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BKLibraryOwnershipAssetsKey")));
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v7)
  {
    v8 = v7;
    v24 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v24)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("BKLibraryOwnershipNewState")));
        v12 = (unsigned __int16)objc_msgSend(v11, "integerValue");

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("BKLibraryOwnershipOldState")));
        v14 = (unsigned __int16)objc_msgSend(v13, "integerValue");

        v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("BKLibraryOwnershipAssetIDKey")));
        v16 = (void *)v15;
        if (v15)
          v17 = v12 == 3;
        else
          v17 = 0;
        if (v17)
        {
          dispatch_group_enter(v6);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_4197C;
          block[3] = &unk_C28B8;
          block[4] = self;
          v32 = v16;
          v34 = v14;
          v33 = v6;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

        }
        else if (v12 == 2)
        {
          if (!v15)
            goto LABEL_17;
          dispatch_group_enter(v6);
          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472;
          v30[2] = sub_41A50;
          v30[3] = &unk_C1918;
          v30[4] = self;
          v30[5] = v16;
          v18 = (id *)v30;
          goto LABEL_16;
        }
        if (v14 != 2)
          goto LABEL_17;
        dispatch_group_enter(v6);
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_41B54;
        v28[3] = &unk_C28B8;
        v28[4] = self;
        v28[5] = v16;
        v29 = v12;
        v18 = (id *)v28;
LABEL_16:
        v18[6] = v6;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v18);

LABEL_17:
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v8);
  }

  downloadStatusesQueue = self->_downloadStatusesQueue;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_41DCC;
  v26[3] = &unk_C2738;
  v27 = v21;
  v20 = v21;
  dispatch_group_notify(v6, downloadStatusesQueue, v26);

}

- (void)_showUpdateFailureForAssetID:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_41E80;
    v6[3] = &unk_C12F8;
    v6[4] = self;
    v7 = v4;
    -[BKLibraryAssetStatusController _updateAssetsWithBlock:](self, "_updateAssetsWithBlock:", v6);

  }
}

- (void)makeAccountPrimaryAndCheckForUpdateAndUpdateAssetUnacknowledged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountID"));

  if (v5 && v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetStatusController storeDelegate](self, "storeDelegate"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_41FCC;
    v8[3] = &unk_C2958;
    v8[4] = self;
    v9 = v5;
    objc_msgSend(v7, "libraryAssetStatusController:makeAccountPrimaryAndSignedIn:completion:", self, v6, v8);

  }
}

- (void)_startUpdateForAssetIDs:(id)a3
{
  id v4;
  _QWORD activity_block[4];
  id v6;
  BKLibraryAssetStatusController *v7;

  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_42670;
  activity_block[3] = &unk_C12F8;
  v6 = a3;
  v7 = self;
  v4 = v6;
  _os_activity_initiate(&dword_0, "Start update for assets", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)pauseDownloadOfAsset:(id)a3
{
  id v3;
  _QWORD activity_block[5];
  id v5;

  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_42A90;
  activity_block[3] = &unk_C12F8;
  activity_block[4] = self;
  v5 = a3;
  v3 = v5;
  _os_activity_initiate(&dword_0, "Pause download for asset", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)resumeDownloadOfAsset:(id)a3
{
  id v3;
  _QWORD activity_block[5];
  id v5;

  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_42C0C;
  activity_block[3] = &unk_C12F8;
  activity_block[4] = self;
  v5 = a3;
  v3 = v5;
  _os_activity_initiate(&dword_0, "Resume download for asset", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)cancelDownloadOfAsset:(id)a3
{
  id v4;
  BKBookDownloadController *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_downloadControllers;
  v6 = -[BKBookDownloadController countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "cancelDownloadForAssetID:", v4, (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[BKBookDownloadController countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)restartDownloadOfAsset:(id)a3
{
  id v4;
  BKBookDownloadController *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_downloadControllers;
  v6 = -[BKBookDownloadController countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "restartDownloadForAssetID:", v4, (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[BKBookDownloadController countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)removeCompletedDownloads
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_42F48;
  v2[3] = &unk_C1400;
  v2[4] = self;
  -[BKLibraryAssetStatusController _updateAssetsWithBlock:](self, "_updateAssetsWithBlock:", v2);
}

- (void)removeCompletedUploads
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_43134;
  v2[3] = &unk_C1400;
  v2[4] = self;
  -[BKLibraryAssetStatusController _updateAssetsWithBlock:](self, "_updateAssetsWithBlock:", v2);
}

- (void)checkForUpdates:(id)a3
{
  id v4;
  BKBookUpdateController *updateController;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[BKLibraryAssetStatusController setCheckingForUpdates:](self, "setCheckingForUpdates:", 1);
  updateController = self->_updateController;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_43334;
  v7[3] = &unk_C29A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[BKBookUpdateController checkForUpdates:](updateController, "checkForUpdates:", v7);

}

- (id)statusForAssetID:(id)a3
{
  id v4;
  BKLibraryDownloadStatus *v5;

  v4 = a3;
  if (v4)
  {
    v5 = (BKLibraryDownloadStatus *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_statusDictionary, "objectForKey:", v4));
    if (!v5)
    {
      v5 = -[BKLibraryDownloadStatus initWithAssetID:state:progressValue:timeRemaining:bytesDownloaded:fileSize:]([BKLibraryDownloadStatus alloc], "initWithAssetID:state:progressValue:timeRemaining:bytesDownloaded:fileSize:", v4, 0, -1, 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL, 0.0);
      -[NSMutableDictionary setObject:forKey:](self->_statusDictionary, "setObject:forKey:", v5, v4);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)ephemeralStatusForAssetID:(id)a3
{
  if (a3)
    return (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_statusDictionary, "objectForKey:"));
  else
    return 0;
}

- (void)acknowledgeCurrentUpdatesAndDownloads
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_4352C;
  v2[3] = &unk_C1400;
  v2[4] = self;
  -[BKLibraryAssetStatusController _updateAssetsWithBlock:](self, "_updateAssetsWithBlock:", v2);
}

- (void)primaryAccountChanged
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_43728;
  block[3] = &unk_C1400;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)managedObjectBackgroundMonitor:(id)a3 fetchNotify:(id)a4
{
  -[BKLibraryAssetStatusController _processLibraryAssetChanges:](self, "_processLibraryAssetChanges:", a4);
}

- (void)managedObjectBackgroundMonitor:(id)a3 didSaveNotify:(id)a4
{
  -[BKLibraryAssetStatusController _processLibraryAssetChanges:](self, "_processLibraryAssetChanges:", a4);
}

- (void)_processLibraryAssetChanges:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  BKLibraryAssetStatusController *v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;

  v4 = a3;
  v5 = BKLibraryLog(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addedObjects"));
    v8 = objc_msgSend(v7, "count");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deletedObjects"));
    v10 = objc_msgSend(v9, "count");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "updatedObjects"));
    *(_DWORD *)buf = 134218496;
    v18 = v8;
    v19 = 2048;
    v20 = v10;
    v21 = 2048;
    v22 = objc_msgSend(v11, "count");
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "BKLibraryAssetStatusController _processLibraryAssetChanges: added: %ld deleted: %ld updated: %ld", buf, 0x20u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_43924;
  v14[3] = &unk_C17B8;
  v15 = v4;
  v16 = self;
  v13 = v4;
  objc_msgSend(v12, "performBackgroundReadOnlyBlock:", v14);

}

- (id)_addArrayControllerWithFilter:(id)a3
{
  id v4;
  BKAssetArrayController *v5;
  id v6;
  void **v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, void *);
  void *v11;
  BKLibraryAssetStatusController *v12;
  id v13;

  v4 = a3;
  v5 = -[BKAssetArrayController initWithContent:]([BKAssetArrayController alloc], "initWithContent:", self->_assetsArray);
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_43BA8;
  v11 = &unk_C29D0;
  v12 = self;
  v13 = v4;
  v6 = v4;
  -[BKAssetArrayController setFilter:](v5, "setFilter:", &v8);
  -[NSMutableArray addObject:](self->_additionalArrayControllers, "addObject:", v5, v8, v9, v10, v11, v12);

  return v5;
}

- (void)_removeArrayController:(id)a3
{
  -[NSMutableArray removeObjectIdenticalTo:](self->_additionalArrayControllers, "removeObjectIdenticalTo:", a3);
}

- (id)addStatusObserverWithFilter:(id)a3 notify:(id)a4
{
  id v5;
  id v6;
  BKLibraryAssetStatusObserver *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[BKLibraryAssetStatusObserver initWithFilter:notify:]([BKLibraryAssetStatusObserver alloc], "initWithFilter:notify:", v6, v5);

  return v7;
}

- (void)restrictionsForExplicitContentAllowedChanged:(BOOL)a3
{
  _BOOL4 v3;
  BKBookDownloadController *v5;
  id v6;
  id v7;
  uint64_t v8;
  _BOOL8 v9;
  void *v10;
  _QWORD block[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_downloadControllers;
  v6 = -[BKBookDownloadController countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    v9 = !v3;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v10), "setExplicitContentRestricted:", v9);
        v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      v7 = -[BKBookDownloadController countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_43DBC;
  block[3] = &unk_C1400;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (IMArrayController)downloadAssets
{
  return (IMArrayController *)objc_getProperty(self, a2, 8, 1);
}

- (IMArrayController)updateAssets
{
  return (IMArrayController *)objc_getProperty(self, a2, 16, 1);
}

- (BKLibraryAssetStatusControllerStoreDelegate)storeDelegate
{
  return (BKLibraryAssetStatusControllerStoreDelegate *)objc_loadWeakRetained((id *)&self->_storeDelegate);
}

- (void)setStoreDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_storeDelegate, a3);
}

- (BOOL)explicitContentRestricted
{
  return self->_explicitContentRestricted;
}

- (void)setExplicitContentRestricted:(BOOL)a3
{
  self->_explicitContentRestricted = a3;
}

- (double)downloadAssetsTotalPercentComplete
{
  return self->_downloadAssetsTotalPercentComplete;
}

- (void)setDownloadAssetsTotalPercentComplete:(double)a3
{
  self->_downloadAssetsTotalPercentComplete = a3;
}

- (IMArrayController)uploadAssets
{
  return (IMArrayController *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)unacknowledgedDownloadsCount
{
  return self->_unacknowledgedDownloadsCount;
}

- (void)setUnacknowledgedDownloadsCount:(unint64_t)a3
{
  self->_unacknowledgedDownloadsCount = a3;
}

- (unint64_t)unacknowledgedUpdatesCount
{
  return self->_unacknowledgedUpdatesCount;
}

- (void)setUnacknowledgedUpdatesCount:(unint64_t)a3
{
  self->_unacknowledgedUpdatesCount = a3;
}

- (BOOL)hasUpdatesOrDownloadsOrUploads
{
  return self->_hasUpdatesOrDownloadsOrUploads;
}

- (void)setHasUpdatesOrDownloadsOrUploads:(BOOL)a3
{
  self->_hasUpdatesOrDownloadsOrUploads = a3;
}

- (BOOL)hasUpdates
{
  return self->_hasUpdates;
}

- (void)setHasUpdates:(BOOL)a3
{
  self->_hasUpdates = a3;
}

- (BOOL)hasDownloads
{
  return self->_hasDownloads;
}

- (void)setHasDownloads:(BOOL)a3
{
  self->_hasDownloads = a3;
}

- (BOOL)hasUploads
{
  return self->_hasUploads;
}

- (void)setHasUploads:(BOOL)a3
{
  self->_hasUploads = a3;
}

- (unint64_t)uploadStatus
{
  return self->_uploadStatus;
}

- (void)setUploadStatus:(unint64_t)a3
{
  self->_uploadStatus = a3;
}

- (BOOL)checkingForUpdates
{
  return self->_checkingForUpdates;
}

- (void)setCheckingForUpdates:(BOOL)a3
{
  self->_checkingForUpdates = a3;
}

- (unint64_t)canPauseCount
{
  return self->_canPauseCount;
}

- (void)setCanPauseCount:(unint64_t)a3
{
  self->_canPauseCount = a3;
}

- (unint64_t)canResumeCount
{
  return self->_canResumeCount;
}

- (void)setCanResumeCount:(unint64_t)a3
{
  self->_canResumeCount = a3;
}

- (void)setDownloadRelatedNotificationCoalescingBlock:(id)a3
{
  objc_storeStrong((id *)&self->_downloadRelatedNotificationCoalescingBlock, a3);
}

- (NSMutableArray)downloadRelatedNotificationsToProcess
{
  return self->_downloadRelatedNotificationsToProcess;
}

- (void)setDownloadRelatedNotificationsToProcess:(id)a3
{
  objc_storeStrong((id *)&self->_downloadRelatedNotificationsToProcess, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadRelatedNotificationsToProcess, 0);
  objc_storeStrong((id *)&self->_downloadRelatedNotificationCoalescingBlock, 0);
  objc_destroyWeak((id *)&self->_storeDelegate);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_downloadStatusesQueue, 0);
  objc_storeStrong((id *)&self->_persistentInfo, 0);
  objc_storeStrong((id *)&self->_additionalArrayControllers, 0);
  objc_storeStrong((id *)&self->_acknowledgedUpdates, 0);
  objc_storeStrong((id *)&self->_acknowledgedDownloads, 0);
  objc_storeStrong((id *)&self->_libraryAssetMonitorAllBooks, 0);
  objc_storeStrong((id *)&self->_libraryAssetMonitorStoreBooks, 0);
  objc_storeStrong((id *)&self->_updateController, 0);
  objc_storeStrong((id *)&self->_downloadControllers, 0);
  objc_storeStrong((id *)&self->_updateDictionary, 0);
  objc_storeStrong((id *)&self->_statusDictionary, 0);
  objc_storeStrong((id *)&self->_assetsArray, 0);
  objc_storeStrong((id *)&self->_uploadAssets, 0);
  objc_storeStrong((id *)&self->_updateAssets, 0);
  objc_storeStrong((id *)&self->_downloadAssets, 0);
}

@end
