@implementation PTPStorage

- (id)getDedupedAssetDirectory:(id)a3 increment:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableDictionary *duplicateAssetIdentifiers;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  void *v12;
  _UNKNOWN **v13;
  _UNKNOWN **v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  int v18;
  signed int v19;
  __CFString *v20;
  unsigned int v21;
  uint64_t v22;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    duplicateAssetIdentifiers = self->_duplicateAssetIdentifiers;
    if (!duplicateAssetIdentifiers)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v9 = self->_duplicateAssetIdentifiers;
      self->_duplicateAssetIdentifiers = v8;

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "components:fromDate:", 28, v11));

      if (v12)
      {
        self->_currentYear = objc_msgSend(v12, "year");
        self->_currentMonth = objc_msgSend(v12, "month");
      }

      duplicateAssetIdentifiers = self->_duplicateAssetIdentifiers;
    }
    v13 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](duplicateAssetIdentifiers, "objectForKeyedSubscript:", v6));
    v14 = v13;
    if (v4)
    {
      if (!v13)
      {
        v14 = &off_100050748;
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_duplicateAssetIdentifiers, "setObject:forKeyedSubscript:", &off_100050748, v6);
        goto LABEL_13;
      }
      v15 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v13, "intValue") + 1));

      v14 = (_UNKNOWN **)v15;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_duplicateAssetIdentifiers, "setObject:forKeyedSubscript:", v14, v6);
    if (!v14)
    {
      v16 = CFSTR("__");
LABEL_23:
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByReplacingCharactersInRange:withString:", 6, 2, v16));

      goto LABEL_24;
    }
LABEL_13:
    v18 = objc_msgSend(v14, "intValue");
    if (v18 > 702)
      v19 = 1;
    else
      v19 = v18;
    if (v19 < 1)
    {
      v16 = &stru_100048E60;
    }
    else
    {
      v20 = &stru_100048E60;
      do
      {
        v21 = v19 - 1;
        v19 = (v19 - 1) / 0x1Au;
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%c"), v20, v21 % 0x1A + 97));

        v20 = v16;
      }
      while ((int)(v21 - v21 % 0x1A) > 25);
    }
    if (-[__CFString length](v16, "length") == (id)1)
    {
      v22 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("_%@"), v16));

      v16 = (__CFString *)v22;
    }
    goto LABEL_23;
  }
  v17 = 0;
LABEL_24:

  return v17;
}

- (id)virtualDirectoryName:(id)a3
{
  const char *v4;
  const char *v5;
  uint64_t currentYear;
  uint64_t currentMonth;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v10 = 0;
  v11 = 0;
  v9 = 0;
  v4 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  if (!v4
    || (v5 = v4, strlen(v4) < 0xF)
    || (sscanf(v5, "%04d%02d%02dT%02d%02d%02d", (char *)&v11 + 4, &v11, (char *)&v10 + 4, &v10, (char *)&v9 + 4, &v9),
        currentYear = HIDWORD(v11),
        !HIDWORD(v11))
    || (currentMonth = v11, !(_DWORD)v11))
  {
    currentMonth = self->_currentMonth;
    currentYear = self->_currentYear;
    LODWORD(v11) = self->_currentMonth;
    HIDWORD(v11) = currentYear;
  }
  return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%04d%02d__"), currentYear, currentMonth));
}

- (timespec)virtualDirectoryDate:(id)a3
{
  const char *v4;
  const char *v5;
  int currentYear;
  void *v7;
  id v8;
  void *v9;
  double v10;
  uint64_t v11;
  __darwin_time_t v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  timespec result;

  v16 = 0;
  v17 = 0;
  v15 = 0;
  v14 = 0;
  v4 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  if (!v4
    || (v5 = v4, strlen(v4) < 0xF)
    || (sscanf(v5, "%04d%02d%02dT%02d%02d%02d", (char *)&v17 + 4, &v17, (char *)&v16 + 4, &v16, &v15, &v14),
        !HIDWORD(v17))
    || !(_DWORD)v17)
  {
    currentYear = self->_currentYear;
    LODWORD(v17) = self->_currentMonth;
    HIDWORD(v17) = currentYear;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v8 = objc_alloc_init((Class)NSDateComponents);
  objc_msgSend(v8, "setYear:", SHIDWORD(v17));
  objc_msgSend(v8, "setMonth:", (int)v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateFromComponents:", v8));
  objc_msgSend(v9, "timeIntervalSince1970");
  v11 = (uint64_t)v10;

  v12 = v11;
  v13 = 0;
  result.tv_nsec = v13;
  result.tv_sec = v12;
  return result;
}

- (PTPStorage)initWithParent:(id)a3 andOptionalID:(unsigned int)a4 forSessionID:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  uint64_t v9;
  PTPStorage *v10;
  PTPStorage *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  ICOrderedMediaSet *v17;
  ICOrderedMediaSet *indexedMediaSet;
  PTPStorageInfoDataset *v19;
  PTPStorageInfoDataset *storageInfoDataset;
  id v21;
  void *v22;
  NSMutableArray *v23;
  NSMutableArray *assetGroups;
  void *v25;
  double v26;
  PTPFolder *v27;
  PTPFolder *dcimFolder;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  NSObject *v34;
  id v35;
  _QWORD v37[2];
  objc_super v38;
  statfs v39;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = v6;
  if (!(_DWORD)v6)
    v9 = sub_100004C10();
  v38.receiver = self;
  v38.super_class = (Class)PTPStorage;
  v10 = -[PTPStorage init](&v38, "init");
  v11 = v10;
  if (v10)
  {
    memset(&v39, 0, 512);
    -[PTPStorage setParent:](v10, "setParent:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hostMediaSupportedFormats"));
    -[PTPStorage setSupportedFormats:](v11, "setSupportedFormats:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingPathComponent:", CFSTR("DCIM"))));
    statfs((const char *)objc_msgSend(v14, "fileSystemRepresentation"), &v39);

    v15 = v39.f_blocks * v39.f_bsize;
    v16 = v39.f_bavail * v39.f_bsize;
    v17 = -[ICOrderedMediaSet initWithTypes:]([ICOrderedMediaSet alloc], "initWithTypes:", &off_100053790);
    indexedMediaSet = v11->_indexedMediaSet;
    v11->_indexedMediaSet = v17;

    v11->_storageID = v9;
    v19 = objc_alloc_init(PTPStorageInfoDataset);
    storageInfoDataset = v11->_storageInfoDataset;
    v11->_storageInfoDataset = v19;

    v11->_objectHandle = v9;
    v21 = sub_10000D990();
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    -[PTPStorageInfoDataset setAccessCapability:](v11->_storageInfoDataset, "setAccessCapability:", objc_msgSend(v22, "cplStorageState") != 0);
    -[PTPStorageInfoDataset setStorageType:](v11->_storageInfoDataset, "setStorageType:", 3);
    -[PTPStorageInfoDataset setFilesystemType:](v11->_storageInfoDataset, "setFilesystemType:", 3);
    -[PTPStorageInfoDataset setMaxCapacity:](v11->_storageInfoDataset, "setMaxCapacity:", v15);
    -[PTPStorageInfoDataset setFreeSpaceInBytes:](v11->_storageInfoDataset, "setFreeSpaceInBytes:", v16);
    -[PTPStorageInfoDataset setFreeSpaceInImages:](v11->_storageInfoDataset, "setFreeSpaceInImages:", v16 / 0x258);
    -[PTPStorageInfoDataset setStorageDescription:](v11->_storageInfoDataset, "setStorageDescription:", CFSTR("Internal Storage"));
    -[PTPStorageInfoDataset setVolumeLabel:](v11->_storageInfoDataset, "setVolumeLabel:", CFSTR("Internal Storage"));
    v11->_sessionID = v5;
    v23 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    assetGroups = v11->_assetGroups;
    v11->_assetGroups = v23;

    if (!(_DWORD)v6)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v37[1] = 0;
      objc_msgSend(v25, "timeIntervalSince1970");
      v37[0] = (uint64_t)v26;
      v27 = -[PTPFolder initWithName:captureTimeSpec:parent:storage:]([PTPFolder alloc], "initWithName:captureTimeSpec:parent:storage:", CFSTR("DCIM"), v37, v11, v11);
      dcimFolder = v11->_dcimFolder;
      v11->_dcimFolder = v27;

      -[PTPStorage addCameraFolderToIndex:](v11, "addCameraFolderToIndex:", v11->_dcimFolder);
    }
    -[PTPStorage setEnumerated:](v11, "setEnumerated:", 0);
    -[PTPStorage customUpdateToStoreInfoDataset](v11, "customUpdateToStoreInfoDataset");

  }
  __ICOSLogCreate();
  v29 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "stringByAppendingString:", CFSTR("..")));

  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Created Storage - PTPStorageID: 0x%x SessionID:0x%x"), v9, v5, v37[0]));
  v32 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v33 = objc_retainAutorelease(v29);
    v34 = v32;
    v35 = -[__CFString UTF8String](v33, "UTF8String");
    v39.f_bsize = 136446466;
    *(_QWORD *)&v39.f_iosize = v35;
    WORD2(v39.f_blocks) = 2114;
    *(uint64_t *)((char *)&v39.f_blocks + 6) = (uint64_t)v31;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v39, 0x16u);

  }
  return v11;
}

- (void)customUpdateToStoreInfoDataset
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  NSObject *v12;
  void *v13;
  id v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  NSObject *v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;

  v3 = (void *)MGCopyAnswer(CFSTR("DiskUsage"), 0);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", kMGQDiskUsageAmountDataAvailable));
    v6 = (unint64_t)objc_msgSend(v5, "longLongValue");

    __ICOSLogCreate();
    v7 = &stru_100048E60;
    if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingString:", CFSTR("..")));

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Available Storage: %.2f GB"), (double)v6 * 9.31322575e-10));
    v10 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_retainAutorelease(v7);
      v12 = v10;
      *(_DWORD *)buf = 136446466;
      v23 = -[__CFString UTF8String](v11, "UTF8String");
      v24 = 2114;
      v25 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    -[PTPStorageInfoDataset setFreeSpaceInBytes:](self->_storageInfoDataset, "setFreeSpaceInBytes:", v6);
    -[PTPStorageInfoDataset setFreeSpaceInImages:](self->_storageInfoDataset, "setFreeSpaceInImages:", v6 / 0x16E360);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", kMGQDiskUsageTotalDiskCapacity));
    v14 = objc_msgSend(v13, "longLongValue");

    __ICOSLogCreate();
    v15 = &stru_100048E60;
    if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByAppendingString:", CFSTR("..")));

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Storage  Capacity: %.2f GB"), (double)(unint64_t)v14 * 9.31322575e-10));
    v18 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_retainAutorelease(v15);
      v20 = v18;
      v21 = -[__CFString UTF8String](v19, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v23 = v21;
      v24 = 2114;
      v25 = v17;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    -[PTPStorageInfoDataset setMaxCapacity:](self->_storageInfoDataset, "setMaxCapacity:", v14);
  }

}

- (PTPFolder)dcimFolder
{
  return self->_dcimFolder;
}

- (void)addContent
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD block[10];
  int v13;
  _QWORD v14[10];
  mach_timebase_info info;
  _QWORD v16[4];
  _QWORD v17[4];
  _QWORD v18[4];
  _QWORD v19[3];
  char v20;
  _BYTE buf[24];
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  PTPStorage *v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PTPStorage dcimFolder](self, "dcimFolder"));
  if (v3)
  {
    v4 = sub_10000D990();
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = -[PTPStorage storageID](self, "storageID");
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    v20 = 0;
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2020000000;
    v18[3] = 0;
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    v17[3] = 0;
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    v16[3] = 0;
    __ICOSLogCreate();
    if ((unint64_t)objc_msgSend(&stru_100048E60, "length") < 0x15)
    {
      v8 = &stru_100048E60;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingString:", CFSTR("..")));

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("-[PTPFolder addContent] PTPStorageID: 0x%x \n"), v6));
    v10 = (id)_gICOSLog;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = -[__CFString UTF8String](objc_retainAutorelease(v8), "UTF8String");
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }

    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1000488C0);
    info = 0;
    mach_timebase_info(&info);
    dword_10005E46C = 0;
    *(float *)&dword_10005E46C = (float)mach_absolute_time();
    if (v5)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v22 = sub_1000192AC;
      v23 = sub_1000192BC;
      v24 = self;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000192C4;
      v14[3] = &unk_100048910;
      v14[4] = v24;
      v14[5] = buf;
      v14[6] = v19;
      v14[7] = v18;
      v14[8] = v17;
      v14[9] = v16;
      objc_msgSend(v5, "ptpEnumerateAllAssetsUsingBlock:", v14);
      _Block_object_dispose(buf, 8);

    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100019498;
    block[3] = &unk_100048938;
    block[6] = v18;
    block[7] = v17;
    block[8] = v16;
    block[9] = info;
    v13 = v6;
    block[4] = self;
    block[5] = v19;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    _Block_object_dispose(v16, 8);
    _Block_object_dispose(v17, 8);
    _Block_object_dispose(v18, 8);
    _Block_object_dispose(v19, 8);

  }
}

- (id)addAssets:(id)a3 createdObjects:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  BOOL v26;
  _QWORD v27[5];
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PTPStorage dcimFolder](self, "dcimFolder"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  if (v7)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    if (!v8)
      goto LABEL_8;
  }
  else
  {
    v11 = 0;
    if (!v8)
      goto LABEL_8;
  }
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = sub_1000192AC;
  v27[4] = sub_1000192BC;
  v28 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100019EC0;
  v18[3] = &unk_100048960;
  v18[4] = self;
  v22 = v27;
  v19 = v8;
  v26 = v7 != 0;
  v12 = v11;
  v20 = v12;
  v23 = &v29;
  v24 = &v37;
  v13 = v9;
  v21 = v13;
  v25 = &v33;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v18);
  -[PTPStorage addGroup:](self, "addGroup:", v13);
  if (v7)
  {
    objc_msgSend(v7, "setObject:forKey:", v13, CFSTR("addedFiles"));
    objc_msgSend(v7, "setObject:forKey:", v12, CFSTR("addedFolders"));
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v38[3]));
  objc_msgSend(v10, "setObject:forKey:", v14, CFSTR("prunedCount"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v34[3]));
  objc_msgSend(v10, "setObject:forKey:", v15, CFSTR("assetCount"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v30[3]));
  objc_msgSend(v10, "setObject:forKey:", v16, CFSTR("folderCount"));

  _Block_object_dispose(v27, 8);
LABEL_8:
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  return v10;
}

- (id)deleteAssets:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PTPStorage dcimFolder](self, "dcimFolder"));
  v6 = objc_alloc_init((Class)NSMutableDictionary);
  v7 = objc_alloc_init((Class)NSMutableArray);
  v8 = objc_alloc_init((Class)NSMutableArray);
  if (v5)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001A4D4;
    v10[3] = &unk_100048988;
    v11 = v5;
    v12 = v7;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v10);

  }
  if (v7)
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("removedFiles"));
  if (v8)
    objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("removedFolders"));

  return v6;
}

- (void)dealloc
{
  PTPStorageInfoDataset *storageInfoDataset;
  NSMutableDictionary *duplicateAssetIdentifiers;
  NSArray *supportedFormats;
  NSMutableArray *assetGroups;
  objc_super v7;

  objc_storeWeak(&self->_parent, 0);
  storageInfoDataset = self->_storageInfoDataset;
  self->_storageInfoDataset = 0;

  duplicateAssetIdentifiers = self->_duplicateAssetIdentifiers;
  self->_duplicateAssetIdentifiers = 0;

  supportedFormats = self->_supportedFormats;
  self->_supportedFormats = 0;

  assetGroups = self->_assetGroups;
  self->_assetGroups = 0;

  self->_assetGroupIndex = 0;
  v7.receiver = self;
  v7.super_class = (Class)PTPStorage;
  -[PTPStorage dealloc](&v7, "dealloc");
}

- (void)addCameraFileToIndex:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PTPStorage indexedMediaSet](self, "indexedMediaSet"));
  objc_msgSend(v5, "addMediaItemToIndex:", v4);

}

- (void)addCameraFolderToIndex:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PTPStorage indexedMediaSet](self, "indexedMediaSet"));
  objc_msgSend(v5, "addMediaItemToIndex:", v4);

  v6 = objc_msgSend(v4, "objectHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v6));
  v9 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  -[PTPStorage addGroup:](self, "addGroup:", v8);

}

- (id)cameraFileWithObjectID:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PTPStorage indexedMediaSet](self, "indexedMediaSet"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mediaItemWithHandle:inTypes:", a3, &off_1000537A8));

  return v5;
}

- (id)cameraFolderWithObjectID:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PTPStorage indexedMediaSet](self, "indexedMediaSet"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mediaItemWithHandle:inTypes:", a3, &off_1000537C0));

  return v5;
}

- (void)removeCameraFileFromIndex:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[PTPStorage indexedMediaSet](self, "indexedMediaSet"));
  objc_msgSend(v4, "removeMediaItemWithHandleFromIndex:", a3);

}

- (void)removeCameraFolderFromIndex:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[PTPStorage indexedMediaSet](self, "indexedMediaSet"));
  objc_msgSend(v4, "removeMediaItemWithHandleFromIndex:", a3);

}

- (id)objectHandlesForObjectFormatCode:(unsigned __int16)a3 inAssociation:(unsigned int)a4
{
  return -[PTPFolder objectHandlesForObjectFormatCode:inAssociation:](self->_dcimFolder, "objectHandlesForObjectFormatCode:inAssociation:", a3, *(_QWORD *)&a4);
}

- (unint64_t)appendObjectData:(id)a3 forObjectFormatCode:(unsigned __int16)a4 inAssociation:(unsigned int)a5 withContentType:(unsigned int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v8 = a4;
  v10 = a3;
  v11 = 0;
  v15 = 0;
  if ((_DWORD)v8)
  {
LABEL_5:
    if ((_DWORD)v7 == -1)
      goto LABEL_7;
    goto LABEL_6;
  }
  if ((v7 + 1) < 2 || -[PTPFolder objectHandle](self->_dcimFolder, "objectHandle") == (_DWORD)v7)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PTPFolder objectInfoDataset](self->_dcimFolder, "objectInfoDataset"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "content:", v6));

    objc_msgSend(v10, "appendData:", v13);
    v11 = 1;
    v15 = 1;

    goto LABEL_5;
  }
  v11 = 0;
LABEL_6:
  v11 += -[PTPFolder appendObjectData:forObjectFormatCode:inAssociation:withContentType:](self->_dcimFolder, "appendObjectData:forObjectFormatCode:inAssociation:withContentType:", v10, v8, v7, v6);
  v15 = v11;
LABEL_7:
  if ((_DWORD)v6 == 3)
  {
    objc_msgSend(v10, "replaceBytesInRange:withBytes:", 0, 8, &v15);
    v11 = v15;
  }

  return v11;
}

- (unsigned)addGroup:(id)a3
{
  if (a3)
    -[NSMutableArray addObject:](self->_assetGroups, "addObject:");
  return -[NSMutableArray count](self->_assetGroups, "count");
}

- (id)dequeueGroup
{
  void *v3;
  id v4;
  unint64_t assetGroupIndex;
  unint64_t v6;
  void *v7;
  id v8;
  dispatch_time_t v9;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = -[NSMutableArray count](self->_assetGroups, "count");
  assetGroupIndex = self->_assetGroupIndex;
  if ((unint64_t)v4 > assetGroupIndex)
  {
    v6 = (unint64_t)v4;
    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_assetGroups, "objectAtIndex:", assetGroupIndex));
      if (v7)
        objc_msgSend(v3, "addObjectsFromArray:", v7);
      v8 = objc_msgSend(v3, "count");

      assetGroupIndex = self->_assetGroupIndex;
      if ((unint64_t)v8 >= 0x2711)
        break;
      assetGroupIndex = (assetGroupIndex + 1);
      self->_assetGroupIndex = assetGroupIndex;
    }
    while (v6 > assetGroupIndex);
  }
  if ((unint64_t)-[NSMutableArray count](self->_assetGroups, "count") > assetGroupIndex
    || !-[PTPStorage enumerated](self, "enumerated"))
  {
    v9 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001AA5C;
    block[3] = &unk_100048750;
    block[4] = self;
    dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  return v3;
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(unsigned int)a3
{
  self->_sessionID = a3;
}

- (NSMutableDictionary)duplicateAssetIdentifiers
{
  return self->_duplicateAssetIdentifiers;
}

- (void)setDuplicateAssetIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_duplicateAssetIdentifiers, a3);
}

- (PTPStorageInfoDataset)storageInfoDataset
{
  return self->_storageInfoDataset;
}

- (void)setStorageInfoDataset:(id)a3
{
  objc_storeStrong((id *)&self->_storageInfoDataset, a3);
}

- (void)setDcimFolder:(id)a3
{
  objc_storeStrong((id *)&self->_dcimFolder, a3);
}

- (unsigned)storageID
{
  return self->_storageID;
}

- (void)setStorageID:(unsigned int)a3
{
  self->_storageID = a3;
}

- (unsigned)objectHandle
{
  return self->_objectHandle;
}

- (void)setObjectHandle:(unsigned int)a3
{
  self->_objectHandle = a3;
}

- (ICOrderedMediaSet)indexedMediaSet
{
  return self->_indexedMediaSet;
}

- (void)setIndexedMediaSet:(id)a3
{
  objc_storeStrong((id *)&self->_indexedMediaSet, a3);
}

- (id)parent
{
  return objc_loadWeakRetained(&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak(&self->_parent, a3);
}

- (NSMutableArray)assetGroups
{
  return self->_assetGroups;
}

- (void)setAssetGroups:(id)a3
{
  objc_storeStrong((id *)&self->_assetGroups, a3);
}

- (unsigned)assetGroupIndex
{
  return self->_assetGroupIndex;
}

- (void)setAssetGroupIndex:(unsigned int)a3
{
  self->_assetGroupIndex = a3;
}

- (BOOL)enumerated
{
  return self->_enumerated;
}

- (void)setEnumerated:(BOOL)a3
{
  self->_enumerated = a3;
}

- (NSArray)supportedFormats
{
  return self->_supportedFormats;
}

- (void)setSupportedFormats:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedFormats, 0);
  objc_storeStrong((id *)&self->_assetGroups, 0);
  objc_destroyWeak(&self->_parent);
  objc_storeStrong((id *)&self->_indexedMediaSet, 0);
  objc_storeStrong((id *)&self->_dcimFolder, 0);
  objc_storeStrong((id *)&self->_storageInfoDataset, 0);
  objc_storeStrong((id *)&self->_duplicateAssetIdentifiers, 0);
}

@end
