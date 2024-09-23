@implementation FMDAccessoryLocationStore

+ (id)defaultStorageLocation
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init((Class)FMInternalFileContainer);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "url"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fm_preferencesPathURLForDomain:", CFSTR("com.apple.icloud.findmydeviced.accessories.locations")));

  return v4;
}

- (FMDAccessoryLocationStore)init
{
  FMDAccessoryLocationStore *v2;
  FMDAccessoryLocationStore *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FMDAccessoryLocationStore;
  v2 = -[FMDAccessoryLocationStore init](&v5, "init");
  v3 = v2;
  if (v2)
    -[FMDAccessoryLocationStore setup](v2, "setup");
  return v3;
}

- (FMDAccessoryLocationStore)initWithSupportedAccessoryRegistry:(id)a3 accessoryRegistry:(id)a4
{
  id v6;
  id v7;
  FMDAccessoryLocationStore *v8;
  FMDAccessoryLocationStore *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FMDAccessoryLocationStore;
  v8 = -[FMDAccessoryLocationStore init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[FMDAccessoryLocationStore setSupportedAccessoryRegistry:](v8, "setSupportedAccessoryRegistry:", v6);
    -[FMDAccessoryLocationStore setAccessoryRegistry:](v9, "setAccessoryRegistry:", v7);
    -[FMDAccessoryLocationStore setup](v9, "setup");
  }

  return v9;
}

- (void)setup
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  dispatch_queue_t v11;
  FMDXPCJanitor *v12;
  FMDXPCJanitor *v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;

  v3 = objc_alloc((Class)FMDataArchiver);
  v5 = objc_msgSend((id)objc_opt_class(self, v4), "defaultStorageLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v3, "initWithFileURL:", v6);
  -[FMDAccessoryLocationStore setDataArchiver:](self, "setDataArchiver:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryLocationStore dataArchiver](self, "dataArchiver"));
  objc_msgSend(v8, "setDataProtectionClass:", 4);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryLocationStore dataArchiver](self, "dataArchiver"));
  objc_msgSend(v9, "setBackedUp:", 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryLocationStore dataArchiver](self, "dataArchiver"));
  objc_msgSend(v10, "setCreateDirectories:", 1);

  v11 = dispatch_queue_create("FMDAccessoryLocationStoreSerialQueue", 0);
  -[FMDAccessoryLocationStore setSerialQueue:](self, "setSerialQueue:", v11);

  -[FMDAccessoryLocationStore readLocationsFromDisk](self, "readLocationsFromDisk");
  objc_initWeak(&location, self);
  v12 = [FMDXPCJanitor alloc];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100081B74;
  v20[3] = &unk_1002C1378;
  objc_copyWeak(&v21, &location);
  v13 = -[FMDXPCJanitor initWithName:gracePeriod:cleanupTask:](v12, "initWithName:gracePeriod:cleanupTask:", CFSTR("FMDAccessoryLocationStoreJanitor"), v20, 10800.0);
  -[FMDAccessoryLocationStore setJanitor:](self, "setJanitor:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v15 = objc_msgSend(v14, "isLocationServicesEnabled");

  if ((v15 & 1) != 0)
    -[FMDAccessoryLocationStore expungeAccessoryLocationStore](self, "expungeAccessoryLocationStore");
  else
    -[FMDAccessoryLocationStore clearAccessoryLocationStore](self, "clearAccessoryLocationStore");
  v16 = objc_alloc_init((Class)FMStateCapture);
  -[FMDAccessoryLocationStore setStateCapture:](self, "setStateCapture:", v16);

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100081C74;
  v18[3] = &unk_1002C4268;
  objc_copyWeak(&v19, &location);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryLocationStore stateCapture](self, "stateCapture"));
  objc_msgSend(v17, "setStateCaptureBlock:", v18);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)locationForAccessory:(id)a3 locator:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  void (**v12)(id, void *, _QWORD);
  _QWORD v13[4];
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryLocationStore historicalLocationForAccessory:](self, "historicalLocationForAccessory:", v8));
  if (v10)
    v10[2](v10, v11, 0);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10008202C;
  v13[3] = &unk_1002C4290;
  v14 = v10;
  v12 = v10;
  -[FMDAccessoryLocationStore retreiveLocationForAccessory:forEvent:locator:completion:](self, "retreiveLocationForAccessory:forEvent:locator:completion:", v8, 3, v9, v13);

}

- (id)historicalLocationForAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_100081DC8;
  v16 = sub_100081DD8;
  v17 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[FMDAccessoryLocationStore serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000821E4;
  block[3] = &unk_1002C1410;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)clearAccessoryLocationStore
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[FMDAccessoryLocationStore serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000825F0;
  block[3] = &unk_1002C1328;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)expungeAccessoryLocationStore
{
  void *v3;
  _QWORD v4[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryLocationStore accessoryRegistry](self, "accessoryRegistry"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000827A0;
  v4[3] = &unk_1002C4320;
  v4[4] = self;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "accessories:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)removeOrphanedLocationFiles
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  id v20;

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "AccessoryLocationStore checking for orphaned files", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryLocationStore recordsByAccessoryIdentifier](self, "recordsByAccessoryIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues"));

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100082B68;
  v17[3] = &unk_1002C4348;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v18 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v17);
  v8 = sub_1000031B8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v7, "count");
    *(_DWORD *)buf = 134217984;
    v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "AccessoryLocationStore found %lu active location records", buf, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMDProtectedContextManager sharedManager](FMDProtectedContextManager, "sharedManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contextKeysForType:enumerationOption:", CFSTR("AccessoryLocation"), 1));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allObjects"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100082C18;
  v15[3] = &unk_1002C1890;
  v16 = v7;
  v14 = v7;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v15);

}

- (void)retreiveLocationForAccessory:(id)a3 forEvent:(int64_t)a4 locator:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  AccessoryCurrentLocationAction *v15;
  id v16;
  id v17;
  AccessoryCurrentLocationAction *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = sub_1000031B8();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "FMDAccessoryLocationStore retreiveLocationForAccessory %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v15 = [AccessoryCurrentLocationAction alloc];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100082EB8;
  v22[3] = &unk_1002C4370;
  objc_copyWeak(&v25, (id *)buf);
  v16 = v10;
  v23 = v16;
  v17 = v12;
  v24 = v17;
  v18 = -[AccessoryCurrentLocationAction initWithAccessory:locator:event:completion:](v15, "initWithAccessory:locator:event:completion:", v16, v11, a4, v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryLocationStore accessoryRegistry](self, "accessoryRegistry"));
  objc_msgSend(v19, "registerDelegate:", v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[ActionManager sharedManager](ActionManager, "sharedManager"));
  v21 = objc_msgSend(v20, "enqueueAction:", v18);

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);

}

- (BOOL)shouldRetrieveLocationForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  _BOOL4 v19;
  id v20;
  NSObject *v21;
  int v23;
  id v24;
  __int16 v25;
  _BOOL4 v26;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryLocationStore historicalLocationForAccessory:](self, "historicalLocationForAccessory:", v4));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryLocationStore supportedAccessoryRegistry](self, "supportedAccessoryRegistry"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "location"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "speed"));
    objc_msgSend(v8, "doubleValue");
    objc_msgSend(v6, "locationThrottleTimeIntervalForAccessory:speed:", v4);
    v10 = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timeStamp"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateByAddingTimeInterval:", v10));

    if (v12)
    {
      v13 = sub_1000031B8();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "timeIntervalSinceNow");
        v23 = 134217984;
        v24 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "AccessoryLocationStore next allowed locate cycle in %f", (uint8_t *)&v23, 0xCu);
      }

      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      v17 = v16;
      objc_msgSend(v12, "timeIntervalSinceReferenceDate");
      v19 = v17 > v18;
    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 1;
  }
  v20 = sub_1000031B8();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138412546;
    v24 = v4;
    v25 = 1024;
    v26 = v19;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "AccessoryLocationStore : Retrieve a location for accessory %@? %i", (uint8_t *)&v23, 0x12u);
  }

  return v19;
}

- (void)saveLocation:(id)a3 forAccessory:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  id location[2];

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_initWeak(location, self);
    v8 = objc_claimAutoreleasedReturnValue(-[FMDAccessoryLocationStore serialQueue](self, "serialQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10008324C;
    block[3] = &unk_1002C21C8;
    objc_copyWeak(&v14, location);
    v12 = v7;
    v13 = v6;
    dispatch_async(v8, block);

    objc_destroyWeak(&v14);
    objc_destroyWeak(location);
  }
  else
  {
    v9 = sub_1000031B8();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Trying to save nil location to location store.", (uint8_t *)location, 2u);
    }

  }
}

- (id)saveLocationToDisk:(id)a3 accessory:(id)a4 protection:(unint64_t)a5
{
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  FMDAccessoryLocationStoreRecord *v27;
  void *v28;
  FMDAccessoryLocationStoreRecord *v29;
  unint64_t v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  uint64_t v35;

  v8 = a4;
  v31 = a5;
  if (a5 == 1)
    v9 = 2;
  else
    v9 = 3;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryLocationStore contextKeyForAccessory:protectionClass:](self, "contextKeyForAccessory:protectionClass:", v8, v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryLocationStore recordsByAccessoryIdentifier](self, "recordsByAccessoryIdentifier"));
  v13 = objc_msgSend(v12, "mutableCopy");

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accessoryIdentifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v14));
  v16 = objc_msgSend(v15, "mutableCopy");

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SELF.recordName contains[cd] %@"), v11));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "filteredArrayUsingPredicate:", v17));

  if (v18)
  {
    objc_msgSend(v16, "removeObjectsInArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accessoryIdentifier"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, v19);

    -[FMDAccessoryLocationStore setRecordsByAccessoryIdentifier:](self, "setRecordsByAccessoryIdentifier:", v13);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[FMDProtectedContextManager sharedManager](FMDProtectedContextManager, "sharedManager"));
  objc_msgSend(v20, "cleanupContextsForKey:contextUUID:", v11, 0);

  if (+[FMDProtectedContext isUnittest](FMDProtectedContext, "isUnittest"))
    v21 = 4;
  else
    v21 = v9;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[FMDProtectedContextManager sharedManager](FMDProtectedContextManager, "sharedManager"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dictionaryValue"));

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "saveContext:forContextKey:dataProtectionClass:", v23, v11, v21));
  v25 = sub_1000031B8();
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v33 = v11;
    v34 = 2048;
    v35 = v9;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "AccessoryLocationStore Saving location to disk %@ protection %li", buf, 0x16u);
  }

  v27 = [FMDAccessoryLocationStoreRecord alloc];
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v29 = -[FMDAccessoryLocationStoreRecord initWithRecordName:contextUUID:creationDate:protection:](v27, "initWithRecordName:contextUUID:creationDate:protection:", v11, v24, v28, v31);

  return v29;
}

- (void)expungeRecordsForAccessory:(id)a3 allRecords:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  NSPredicate *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  NSObject *v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  NSObject *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  _QWORD v52[11];
  BOOL v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  uint8_t v66[4];
  id v67;
  __int16 v68;
  uint64_t v69;
  _BYTE buf[24];
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryLocationStore supportedAccessoryRegistry](self, "supportedAccessoryRegistry"));
  v8 = v7;
  v9 = 1;
  v10 = 0x47EFFFFFE0000000;
  v11 = 0x47EFFFFFE0000000;
  if (v7 && !a4)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "longTermLocationExpiryTimeIntervalForAccessory:", v6));
    objc_msgSend(v12, "doubleValue");
    v11 = v13;

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "shortTermLocationExpiryTimeIntervalForAccessory:", v6));
    objc_msgSend(v14, "doubleValue");
    v10 = v15;

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "maximumHistoricalLocationsForAccessory:", v6));
    v9 = (uint64_t)objc_msgSend(v16, "unsignedIntegerValue");

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  v18 = objc_msgSend(v17, "isInternalBuild");

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil objectForKey:inDomain:](FMPreferencesUtil, "objectForKey:inDomain:", CFSTR("LocationStoreCleanup"), kFMDNotBackedUpPrefDomain));
    v20 = v19;
    if (v19)
    {
      objc_msgSend(v19, "doubleValue");
      v10 = v21;
    }

  }
  v22 = sub_1000031B8();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2048;
    v71 = (uint64_t (*)(uint64_t, uint64_t))v9;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Expunging accessory locations older than (short) %f (long) %f, maxlocates %li", buf, 0x20u);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryLocationStore recordsByAccessoryIdentifier](self, "recordsByAccessoryIdentifier"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessoryIdentifier"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", v25));
  v27 = objc_msgSend(v26, "copy");

  v29 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("class == %@"), objc_opt_class(FMDAccessoryLocationStoreRecord, v28));
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "filteredArrayUsingPredicate:", v30));

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "sortedArrayUsingComparator:", &stru_1002C4390));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v33, "timeIntervalSinceReferenceDate");
  v35 = v34;

  v36 = sub_1000031B8();
  v37 = objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    v38 = objc_msgSend(v32, "count");
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v38;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v32;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "FMDAccessoryLocationStore found %lu records %@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v71 = sub_100081DC8;
  v72 = sub_100081DD8;
  v73 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v60 = 0;
  v61 = &v60;
  v62 = 0x3032000000;
  v63 = sub_100081DC8;
  v64 = sub_100081DD8;
  v65 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = sub_100081DC8;
  v58 = sub_100081DD8;
  v59 = 0;
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_100083D74;
  v52[3] = &unk_1002C43B8;
  v53 = a4;
  v52[8] = v10;
  v52[9] = v35;
  v52[10] = v11;
  v52[4] = buf;
  v52[5] = &v60;
  v52[6] = &v54;
  v52[7] = v9;
  objc_msgSend(v32, "enumerateObjectsUsingBlock:", v52);
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryLocationStore recordsByAccessoryIdentifier](self, "recordsByAccessoryIdentifier"));
  v40 = objc_msgSend(v39, "mutableCopy");

  v41 = sub_1000031B8();
  v42 = objc_claimAutoreleasedReturnValue(v41);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    v43 = objc_msgSend((id)v61[5], "count");
    v44 = v61[5];
    *(_DWORD *)v66 = 134218242;
    v67 = v43;
    v68 = 2112;
    v69 = v44;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "FMDAccessoryLocationStore keeping %lu records %@", v66, 0x16u);
  }

  v45 = v61[5];
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessoryIdentifier"));
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v45, v46);

  -[FMDAccessoryLocationStore setRecordsByAccessoryIdentifier:](self, "setRecordsByAccessoryIdentifier:", v40);
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryLocationStore dataArchiver](self, "dataArchiver"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryLocationStore recordsByAccessoryIdentifier](self, "recordsByAccessoryIdentifier"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "saveDictionary:", v48));

  if (v49)
  {
    v50 = sub_1000031B8();
    v51 = objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      sub_100228A90();

  }
  -[FMDAccessoryLocationStore scheduleJanitor:](self, "scheduleJanitor:", v55[5]);

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v60, 8);

  _Block_object_dispose(buf, 8);
}

- (void)clearAllRecords
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  uint8_t v8[16];

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Deleting all accessory locations stored on disk.", v8, 2u);
  }

  -[FMDAccessoryLocationStore readLocationsFromDisk](self, "readLocationsFromDisk");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryLocationStore recordsByAccessoryIdentifier](self, "recordsByAccessoryIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues"));
  v7 = objc_msgSend(v6, "copy");

  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &stru_1002C43F8);
}

- (void)readLocationsFromDisk
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[FMDAccessoryLocationStore serialQueue](self, "serialQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000842DC;
  v4[3] = &unk_1002C1378;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)canRetrieveLockedRecords
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v3 = objc_msgSend(v2, "isLocked") ^ 1;

  return v3;
}

- (id)contextKeyForAccessory:(id)a3 protectionClass:(int64_t)a4
{
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;

  v5 = CFSTR("classC");
  if (a4 == 2)
    v5 = CFSTR("classB");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "accessoryIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@:%@"), CFSTR("AccessoryLocation"), v7, v6));

  return v8;
}

- (void)scheduleJanitor:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;

  v4 = a3;
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[FMDAccessoryLocationStore nextScheduledJanitorDate](self, "nextScheduledJanitorDate"));
    if (!v5)
      goto LABEL_4;
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryLocationStore nextScheduledJanitorDate](self, "nextScheduledJanitorDate"));
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    v9 = v8;
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    v11 = v10;

    if (v9 <= v11)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryLocationStore nextScheduledJanitorDate](self, "nextScheduledJanitorDate"));

      v18 = sub_1000031B8();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      v14 = v19;
      if (v17)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          sub_10022B580(self, v14);
      }
      else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        sub_10022B540(v14);
      }
    }
    else
    {
LABEL_4:
      v12 = sub_1000031B8();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        sub_10022B4DC();

      -[FMDAccessoryLocationStore setNextScheduledJanitorDate:](self, "setNextScheduledJanitorDate:", v4);
      v14 = objc_claimAutoreleasedReturnValue(-[FMDAccessoryLocationStore janitor](self, "janitor"));
      -[NSObject schedule:](v14, "schedule:", v4);
    }
  }
  else
  {
    v15 = sub_1000031B8();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      sub_10022B49C(v16);

    -[FMDAccessoryLocationStore setNextScheduledJanitorDate:](self, "setNextScheduledJanitorDate:", 0);
    v14 = objc_claimAutoreleasedReturnValue(-[FMDAccessoryLocationStore janitor](self, "janitor"));
    -[NSObject deactivate](v14, "deactivate");
  }

}

- (void)accessoryDidUnpair:(id)a3
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
  v5 = objc_claimAutoreleasedReturnValue(-[FMDAccessoryLocationStore serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100084758;
  block[3] = &unk_1002C11E8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)accessoryDidDisconnect:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;

  v4 = a3;
  v5 = sub_1000031B8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "accesory disconnected storing last known location", (uint8_t *)&v12, 2u);
  }

  if (-[FMDAccessoryLocationStore shouldRetrieveLocationForAccessory:](self, "shouldRetrieveLocationForAccessory:", v4))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryLocationStore supportedAccessoryRegistry](self, "supportedAccessoryRegistry"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "locatorForAccessory:", v4));
    v9 = sub_1000031B8();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
      v12 = 138412546;
      v13 = v11;
      v14 = 2112;
      v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "accesory = %@, locator = %@", (uint8_t *)&v12, 0x16u);

    }
    -[FMDAccessoryLocationStore retreiveLocationForAccessory:forEvent:locator:completion:](self, "retreiveLocationForAccessory:forEvent:locator:completion:", v4, 2, v8, 0);

  }
}

- (FMDSupportedAccessoryRegistry)supportedAccessoryRegistry
{
  return (FMDSupportedAccessoryRegistry *)objc_loadWeakRetained((id *)&self->_supportedAccessoryRegistry);
}

- (void)setSupportedAccessoryRegistry:(id)a3
{
  objc_storeWeak((id *)&self->_supportedAccessoryRegistry, a3);
}

- (FMDAccessoryRegistry)accessoryRegistry
{
  return (FMDAccessoryRegistry *)objc_loadWeakRetained((id *)&self->_accessoryRegistry);
}

- (void)setAccessoryRegistry:(id)a3
{
  objc_storeWeak((id *)&self->_accessoryRegistry, a3);
}

- (FMDXPCJanitor)janitor
{
  return self->_janitor;
}

- (void)setJanitor:(id)a3
{
  objc_storeStrong((id *)&self->_janitor, a3);
}

- (NSDate)nextScheduledJanitorDate
{
  return self->_nextScheduledJanitorDate;
}

- (void)setNextScheduledJanitorDate:(id)a3
{
  objc_storeStrong((id *)&self->_nextScheduledJanitorDate, a3);
}

- (FMDataArchiver)dataArchiver
{
  return self->_dataArchiver;
}

- (void)setDataArchiver:(id)a3
{
  objc_storeStrong((id *)&self->_dataArchiver, a3);
}

- (NSDictionary)recordsByAccessoryIdentifier
{
  return self->_recordsByAccessoryIdentifier;
}

- (void)setRecordsByAccessoryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_recordsByAccessoryIdentifier, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (FMStateCapture)stateCapture
{
  return self->_stateCapture;
}

- (void)setStateCapture:(id)a3
{
  objc_storeStrong((id *)&self->_stateCapture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCapture, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_recordsByAccessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_dataArchiver, 0);
  objc_storeStrong((id *)&self->_nextScheduledJanitorDate, 0);
  objc_storeStrong((id *)&self->_janitor, 0);
  objc_destroyWeak((id *)&self->_accessoryRegistry);
  objc_destroyWeak((id *)&self->_supportedAccessoryRegistry);
}

@end
