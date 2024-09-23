@implementation PTPCameraStorage

- (PTPCameraStorage)initWithStorageID:(unsigned int)a3 initiator:(id)a4
{
  PTPCameraStorage *v4;
  PTPCameraStorage *v5;
  ICOrderedMediaSet *v6;
  ICOrderedMediaSet *indexedMediaSet;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PTPCameraStorage;
  v4 = -[PTPCameraFolder initWithStorageID:objHandle:parent:initiator:](&v9, "initWithStorageID:objHandle:parent:initiator:", *(_QWORD *)&a3, 0xFFFFFFFFLL, 0, a4);
  v5 = v4;
  if (v4)
  {
    -[PTPCameraItem setType:](v4, "setType:", 4);
    v6 = -[ICOrderedMediaSet initWithTypes:]([ICOrderedMediaSet alloc], "initWithTypes:", &off_100055A70);
    indexedMediaSet = v5->_indexedMediaSet;
    v5->_indexedMediaSet = v6;

  }
  return v5;
}

- (void)dealloc
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  objc_super v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  void *v13;

  __ICOSLogCreate();
  v3 = CFSTR("PTPStorage");
  if ((unint64_t)objc_msgSend(CFSTR("PTPStorage"), "length") >= 0x15)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("PTPStorage"), "substringWithRange:", 0, 18));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("..")));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p | %16s - 0x%08X"), self, "dealloc storeID", -[PTPCameraItem storageID](self, "storageID")));
  v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v3);
    v8 = v6;
    *(_DWORD *)buf = 136446466;
    v11 = -[__CFString UTF8String](v7, "UTF8String");
    v12 = 2114;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  -[PTPCameraStorage setObjectInfoArray:](self, "setObjectInfoArray:", 0);
  v9.receiver = self;
  v9.super_class = (Class)PTPCameraStorage;
  -[PTPCameraFolder dealloc](&v9, "dealloc");
}

- (BOOL)locked
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem info](self, "info"));
  v3 = objc_msgSend(v2, "accessCapability") == 1;

  return v3;
}

- (void)refreshInfo
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem path](self, "path"));

  if (!v3)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[PTPCameraItem initiator](self, "initiator"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storageInfo:", -[PTPCameraItem storageID](self, "storageID")));
    -[PTPCameraItem setInfo:](self, "setInfo:", v4);

  }
}

- (id)prime
{
  void *v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  NSObject *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  NSObject *v34;
  __CFString *v35;
  void *v36;
  void *v37;
  __CFString *v38;
  NSObject *v39;
  void *v40;
  int v41;
  id v42;
  __int16 v43;
  void *v44;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem path](self, "path"));

  if (v3)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem initiator](self, "initiator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceInfo"));
  if (objc_msgSend(v5, "deviceVendorID") != 1452)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "operationsSupported"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 4131));
    if (objc_msgSend(v13, "containsObject:", v14))
    {
      v15 = objc_msgSend(v6, "standardVersion");

      if (v15 >= 0x6E)
      {
        __ICOSLogCreate();
        v16 = CFSTR("[prime]");
        if ((unint64_t)objc_msgSend(CFSTR("[prime]"), "length") >= 0x15)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("[prime]"), "substringWithRange:", 0, 18));
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingString:", CFSTR("..")));

        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Device supports PTP1.1/MTP1.0 enumeration")));
        v19 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          v20 = objc_retainAutorelease(v16);
          v21 = v19;
          v41 = 136446466;
          v42 = -[__CFString UTF8String](v20, "UTF8String");
          v43 = 2114;
          v44 = v18;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v41, 0x16u);

        }
        v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fileSystemManifestForStorage:objectFormatCode:association:", -[PTPCameraItem storageID](self, "storageID"), 0, 0));
        goto LABEL_33;
      }
    }
    else
    {

    }
    __ICOSLogCreate();
    v24 = CFSTR("[prime]");
    if ((unint64_t)objc_msgSend(CFSTR("[prime]"), "length") >= 0x15)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("[prime]"), "substringWithRange:", 0, 18));
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "stringByAppendingString:", CFSTR("..")));

    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Device supports PTP1.0 enumeration")));
    v27 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v28 = objc_retainAutorelease(v24);
      v29 = v27;
      v41 = 136446466;
      v42 = -[__CFString UTF8String](v28, "UTF8String");
      v43 = 2114;
      v44 = v26;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v41, 0x16u);

    }
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectHandlesInStorage:objectFormatCode:association:", -[PTPCameraItem storageID](self, "storageID"), 0, 0));
    goto LABEL_33;
  }
  if (objc_msgSend(v6, "standardVersion") < 0x6E)
    v7 = 1;
  else
    v7 = 2;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "operationsSupported"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 36879));
  v10 = objc_msgSend(v8, "containsObject:", v9);

  __ICOSLogCreate();
  v11 = objc_msgSend(CFSTR("[prime]"), "length");
  if (v10)
  {
    if ((unint64_t)v11 >= 0x15)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("[prime]"), "substringWithRange:", 0, 18));
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingString:", CFSTR("..")));

    }
    else
    {
      v30 = CFSTR("[prime]");
    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Device supports apple group enumeration, opting in for more responsive experience")));
    v32 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v33 = objc_retainAutorelease(v30);
      v34 = v32;
      v41 = 136446466;
      v42 = -[__CFString UTF8String](v33, "UTF8String");
      v43 = 2114;
      v44 = v31;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v41, 0x16u);

    }
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectInfoDatasetForNextObjectGroupInStorage:", -[PTPCameraItem storageID](self, "storageID")));
  }
  else
  {
    if ((unint64_t)v11 >= 0x15)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("[prime]"), "substringWithRange:", 0, 18));
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "stringByAppendingString:", CFSTR("..")));

    }
    else
    {
      v35 = CFSTR("[prime]");
    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Device supports apple full enumeration, large libraries may experience delays")));
    v37 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v38 = objc_retainAutorelease(v35);
      v39 = v37;
      v41 = 136446466;
      v42 = -[__CFString UTF8String](v38, "UTF8String");
      v43 = 2114;
      v44 = v36;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v41, 0x16u);

    }
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectInfoDatasetForObjectsInStorage:objectFormatCode:association:contentType:", -[PTPCameraItem storageID](self, "storageID"), 0, 0, v7));
  }
LABEL_33:
  v40 = (void *)v22;

  return v40;
}

- (unint64_t)enumerateContent:(id)a3 withOrder:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  __CFString *v15;
  unint64_t v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  void *v21;
  __CFString *v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  unsigned int v33;
  _QWORD v35[4];
  id v36;
  PTPCameraStorage *v37;
  BOOL v38;
  _QWORD v39[4];
  id v40;
  PTPCameraStorage *v41;
  _QWORD *v42;
  BOOL v43;
  _QWORD v44[5];
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  int64_t v50;
  BOOL v51;
  uint8_t buf[4];
  id v53;
  __int16 v54;
  void *v55;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem initiator](self, "initiator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transport"));
  v8 = objc_msgSend(v7, "connected");

  if (v8)
  {
    v33 = objc_msgSend(v6, "deviceVendorID");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_1000155D8;
    v46[3] = &unk_100048B18;
    v11 = v6;
    v47 = v11;
    v51 = v33 == 1452;
    v12 = v10;
    v48 = v12;
    v50 = a4;
    v13 = v9;
    v49 = v13;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v46);
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x3032000000;
    v44[3] = sub_100015788;
    v44[4] = sub_100015798;
    v45 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    __ICOSLogCreate();
    if ((unint64_t)objc_msgSend(CFSTR("Folders"), "length") < 0x15)
    {
      v15 = CFSTR("Folders");
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Folders"), "substringWithRange:", 0, 18));
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingString:", CFSTR("..")));

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%lu]"), objc_msgSend(v12, "count")));
    v18 = (id)_gICOSLog;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = -[__CFString UTF8String](objc_retainAutorelease(v15), "UTF8String");
      *(_DWORD *)buf = 136446466;
      v53 = v19;
      v54 = 2114;
      v55 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }

    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1000157A0;
    v39[3] = &unk_100048B40;
    v20 = v11;
    v40 = v20;
    v41 = self;
    v42 = v44;
    v43 = v33 == 1452;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v39);
    __ICOSLogCreate();
    if ((unint64_t)objc_msgSend(CFSTR("Files"), "length") < 0x15)
    {
      v22 = CFSTR("Files");
    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Files"), "substringWithRange:", 0, 18));
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringByAppendingString:", CFSTR("..")));

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%lu]"), objc_msgSend(v13, "count")));
    v24 = (id)_gICOSLog;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = -[__CFString UTF8String](objc_retainAutorelease(v22), "UTF8String");
      *(_DWORD *)buf = 136446466;
      v53 = v25;
      v54 = 2114;
      v55 = v23;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }

    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100015ABC;
    v35[3] = &unk_100048B68;
    v36 = v20;
    v37 = self;
    v38 = v33 == 1452;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v35);
    if (v33 == 1452)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem initiator](self, "initiator"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "delegate"));

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem initiator](self, "initiator"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "allConnections"));
      objc_msgSend(v28, "sendContentsNotificationWithOrder:toConnections:", a4, v29);

    }
    v30 = objc_msgSend(v13, "count");
    v31 = objc_msgSend(v12, "count");

    _Block_object_dispose(v44, 8);
    v16 = (unint64_t)v30 + (_QWORD)v31;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (unint64_t)ptpObjectCount
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraStorage indexedMediaSet](self, "indexedMediaSet"));
  v3 = objc_msgSend(v2, "mediaItemCount");

  return (unint64_t)v3;
}

- (void)addCameraFileToIndex:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PTPCameraStorage indexedMediaSet](self, "indexedMediaSet"));
  objc_msgSend(v5, "addMediaItemToIndex:", v4);

}

- (void)addCameraFolderToIndex:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PTPCameraStorage indexedMediaSet](self, "indexedMediaSet"));
  objc_msgSend(v5, "addMediaItemToIndex:", v4);

}

- (id)cameraFileWithObjectID:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraStorage indexedMediaSet](self, "indexedMediaSet"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mediaItemWithHandle:inTypes:", a3, &off_100055A88));

  return v5;
}

- (id)cameraFolderWithObjectID:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraStorage indexedMediaSet](self, "indexedMediaSet"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mediaItemWithHandle:inTypes:", a3, &off_100055AA0));

  return v5;
}

- (id)cameraItemWithObjectID:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraStorage indexedMediaSet](self, "indexedMediaSet"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mediaItemWithHandle:inTypes:", a3, 0));

  return v5;
}

- (void)removeCameraFileFromIndex:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[PTPCameraStorage indexedMediaSet](self, "indexedMediaSet"));
  objc_msgSend(v4, "removeMediaItemWithHandleFromIndex:", a3);

}

- (void)removeCameraFolderFromIndex:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[PTPCameraStorage indexedMediaSet](self, "indexedMediaSet"));
  objc_msgSend(v4, "removeMediaItemWithHandleFromIndex:", a3);

}

- (id)indexedFiles
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraStorage indexedMediaSet](self, "indexedMediaSet"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "arrayForType:", CFSTR("file")));

  return v3;
}

- (id)indexedFolders
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraStorage indexedMediaSet](self, "indexedMediaSet"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "arrayForType:", CFSTR("folder")));

  return v3;
}

- (ICOrderedMediaSet)indexedMediaSet
{
  return self->_indexedMediaSet;
}

- (void)setIndexedMediaSet:(id)a3
{
  objc_storeStrong((id *)&self->_indexedMediaSet, a3);
}

- (NSArray)objectInfoArray
{
  return self->_objectInfoArray;
}

- (void)setObjectInfoArray:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)catalogingDone
{
  return self->_catalogingDone;
}

- (void)setCatalogingDone:(BOOL)a3
{
  self->_catalogingDone = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectInfoArray, 0);
  objc_storeStrong((id *)&self->_indexedMediaSet, 0);
}

@end
