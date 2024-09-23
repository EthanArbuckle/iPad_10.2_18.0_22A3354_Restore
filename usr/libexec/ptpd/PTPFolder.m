@implementation PTPFolder

- (unsigned)unsignedIntegerValue
{
  return self->_objectHandle;
}

- (NSString)mediaItemType
{
  return (NSString *)CFSTR("folder");
}

- (PTPFolder)initWithName:(id)a3 captureTimeSpec:(timespec *)a4 parent:(id)a5 storage:(id)a6
{
  id v10;
  id v11;
  id v12;
  PTPFolder *v13;
  PTPFolder *v14;
  void *v15;
  id v16;
  PTPObjectInfoDataset *objectInfoDataset;
  void *v18;
  PTPObjectInfoDataset *v19;
  void *v20;
  void *v22;
  void *v23;
  id v24;
  char __str[20];

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = -[PTPFolder initWithObjectHandle:](self, "initWithObjectHandle:", sub_100004C30());
  v14 = v13;
  if (v13)
  {
    -[PTPFolder setParent:](v13, "setParent:", v11);
    -[PTPFolder setStorage:](v14, "setStorage:", v12);
    if (a4)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)a4->tv_sec));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "components:fromDate:", 252, v23));
      v24 = v12;
      v16 = v10;
      snprintf(__str, 0x14uLL, "%04d%02d%02dT%02d%02d%02d.0", objc_msgSend(v15, "year"), objc_msgSend(v15, "month"), objc_msgSend(v15, "day"), objc_msgSend(v15, "hour"), objc_msgSend(v15, "minute"), objc_msgSend(v15, "second"));
      objectInfoDataset = v14->_objectInfoDataset;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), __str));
      -[PTPObjectInfoDataset setCaptureDate:](objectInfoDataset, "setCaptureDate:", v18);

      v10 = v16;
      v12 = v24;
      v19 = v14->_objectInfoDataset;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), __str));
      -[PTPObjectInfoDataset setModificationDate:](v19, "setModificationDate:", v20);

      v14->_captureTimeSpec = *a4;
    }
    -[PTPObjectInfoDataset setStorageID:](v14->_objectInfoDataset, "setStorageID:", -[PTPFolder storageID](v14, "storageID"));
    -[PTPObjectInfoDataset setObjectFormat:](v14->_objectInfoDataset, "setObjectFormat:", 12289);
    -[PTPObjectInfoDataset setProtectionStatus:](v14->_objectInfoDataset, "setProtectionStatus:", 0);
    -[PTPObjectInfoDataset setParentObject:](v14->_objectInfoDataset, "setParentObject:", objc_msgSend(v11, "objectHandle"));
    -[PTPObjectInfoDataset setAssociationType:](v14->_objectInfoDataset, "setAssociationType:", 1);
    -[PTPObjectInfoDataset setFilename:](v14->_objectInfoDataset, "setFilename:", v10);
    -[PTPObjectInfoDataset setObjectHandle:](v14->_objectInfoDataset, "setObjectHandle:", -[PTPFolder objectHandle](v14, "objectHandle"));
    ++dword_10005E454;
  }

  return v14;
}

- (PTPFolder)initWithObjectHandle:(unsigned int)a3
{
  PTPFolder *v4;
  PTPFolder *v5;
  PTPObjectInfoDataset *v6;
  PTPObjectInfoDataset *objectInfoDataset;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PTPFolder;
  v4 = -[PTPFolder init](&v12, "init");
  v5 = v4;
  if (v4)
  {
    v4->_serialNumber = 0;
    v4->_size = 0;
    v6 = objc_alloc_init(PTPObjectInfoDataset);
    objectInfoDataset = v5->_objectInfoDataset;
    v5->_objectInfoDataset = v6;

    v5->_objectHandle = a3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
    -[PTPFolder setFileIndices:](v5, "setFileIndices:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[PTPFolder setFileNames:](v5, "setFileNames:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[PTPFolder setFolders:](v5, "setFolders:", v10);

    v5->_folderLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

- (unsigned)storageID
{
  id WeakRetained;
  unsigned int v3;

  WeakRetained = objc_loadWeakRetained(&self->_storage);
  v3 = objc_msgSend(WeakRetained, "storageID");

  return v3;
}

- (PTPObjectInfoDataset)objectInfoDataset
{
  return self->_objectInfoDataset;
}

- (unsigned)objectHandle
{
  return self->_objectHandle;
}

- (id)objectMatchingAssetHandle:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v4 = a3;
  v5 = -[NSMutableIndexSet lastIndex](self->_fileIndices, "lastIndex");
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_7;
  v6 = v5;
  while (1)
  {
    v7 = objc_autoreleasePoolPush();
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PTPFolder storage](self, "storage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cameraFileWithObjectID:", v6));

    v6 = -[NSMutableIndexSet indexLessThanIndex:](self->_fileIndices, "indexLessThanIndex:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "plAssetHandle"));
    v11 = objc_msgSend(v10, "isEqual:", v4);

    if ((v11 & 1) != 0)
      break;

    objc_autoreleasePoolPop(v7);
    if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_7;
  }
  objc_autoreleasePoolPop(v7);
  if (!v9)
  {
LABEL_7:
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_folders, "allValues", 0));
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
LABEL_9:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v16), "unsignedIntValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[PTPFolder storage](self, "storage"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "cameraFolderWithObjectID:", v17));

        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectMatchingAssetHandle:", v4));
        if (v9)
          break;
        if (v14 == (id)++v16)
        {
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v14)
            goto LABEL_9;
          goto LABEL_15;
        }
      }
    }
    else
    {
LABEL_15:
      v9 = 0;
    }

  }
  return v9;
}

- (id)objectHandlesForObjectFormatCode:(unsigned __int16)a3 inAssociation:(unsigned int)a4
{
  uint64_t v4;
  unsigned int v5;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  id v14;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  char v24;
  unsigned int v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  NSObject *v33;
  void *v34;
  unsigned int v35;
  unsigned int v36;
  void *v37;
  NSObject *v38;
  int v39;
  id v40;
  __CFString *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  __CFString *v46;
  void *v47;
  __CFString *v48;
  NSObject *v49;
  id v50;
  PTPFolder *v51;
  id v52;
  id v53;
  uint64_t v54;
  void *i;
  void *v56;
  void *v57;
  void *v58;
  __CFString *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  id v63;
  __CFString *v64;
  void *v65;
  __CFString *v66;
  NSObject *v67;
  id v68;
  void *v69;
  __CFString *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  id v74;
  __CFString *v75;
  void *v76;
  __CFString *v77;
  NSObject *v78;
  id v79;
  void *v80;
  void *obj;
  id v83;
  unsigned int v84;
  PTPFolder *v85;
  uint64_t v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint8_t v91[128];
  uint8_t buf[4];
  id v93;
  __int16 v94;
  __CFString *v95;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  __ICOSLogCreate();
  v85 = self;
  v86 = v4;
  v84 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[Object Handle: 0x%x] objectHandlesForObjectFormatCode: 0x%x, Association Handle: 0x%x\n"), -[PTPFolder objectHandle](self, "objectHandle"), v5, v4));
  if (__ICLogTypeEnabled(4))
  {
    v8 = _gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v93 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
  }

  v9 = objc_opt_class(PTPFolder);
  if ((objc_opt_isKindOfClass(v85, v9) & 1) != 0)
  {
    v10 = v85;
    __ICOSLogCreate();
    v11 = &stru_100048E60;
    if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingString:", CFSTR("..")));

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString objectInfoDataset](v10, "objectInfoDataset"));
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "filename")));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("* >>[%s] "), objc_msgSend(v14, "UTF8String")));

    v16 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_retainAutorelease(v11);
      v18 = v16;
      v19 = -[__CFString UTF8String](v17, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v93 = v19;
      v94 = 2114;
      v95 = v15;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }
  else
  {
    __ICOSLogCreate();
    v10 = &stru_100048E60;
    if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringByAppendingString:", CFSTR("..")));

    }
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("* >>[0x%x] \n"), -[PTPFolder objectHandle](v85, "objectHandle")));
    v21 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_retainAutorelease(v10);
      v22 = v21;
      v23 = -[__CFString UTF8String](v10, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v93 = v23;
      v94 = 2114;
      v95 = v11;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }

  v83 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0));
  v24 = sub_100004BF8();
  v25 = v84;
  if ((v4 + 1) < 2 || v85->_objectHandle == (_DWORD)v4)
  {
    v26 = -[NSMutableIndexSet lastIndex](v85->_fileIndices, "lastIndex");
    if (v26 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v27 = v26;
      while (1)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[PTPFolder storage](v85, "storage"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "cameraFileWithObjectID:", v27));

        v27 = -[NSMutableIndexSet indexLessThanIndex:](v85->_fileIndices, "indexLessThanIndex:", v27);
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectInfoDataset"));
        v31 = (unint64_t)objc_msgSend(v30, "objectCompressedSize64") >> 32 ? v24 : 1;

        if ((v31 & 1) == 0)
          break;
        if (!v25)
          goto LABEL_38;
        __ICOSLogCreate();
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[0x%x] Object Format Code Is Non-Zero\n"), objc_msgSend(v29, "objectHandle")));
        if (__ICLogTypeEnabled(4))
        {
          v33 = _gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v93 = v32;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
          }
        }

        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectInfoDataset"));
        v35 = objc_msgSend(v34, "objectFormat");
        v36 = v35;
        if (v25 == 0xFFFF)
        {
          v39 = ~v35 & 0x3800;

          if (v39)
          {
LABEL_38:
            v40 = v27;
            __ICOSLogCreate();
            v41 = &stru_100048E60;
            if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
            {
              v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
              v41 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "stringByAppendingString:", CFSTR("..")));

            }
            v43 = objc_msgSend(v29, "objectHandle");
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectInfoDataset"));
            v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "filename")));
            v46 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("  +[0x%x]%s] "), v43, objc_msgSend(v45, "UTF8String")));

            v47 = (void *)_gICOSLog;
            if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
            {
              v48 = objc_retainAutorelease(v41);
              v49 = v47;
              v50 = -[__CFString UTF8String](v48, "UTF8String");
              *(_DWORD *)buf = 136446466;
              v93 = v50;
              v94 = 2114;
              v95 = v46;
              _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

            }
            v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v29, "objectHandle")));
            objc_msgSend(v83, "addObject:", v37);
            v25 = v84;
            v27 = v40;
            goto LABEL_43;
          }
          __ICOSLogCreate();
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[0x%x] Object Has Been Excluded\n"), objc_msgSend(v29, "objectHandle")));
          if (__ICLogTypeEnabled(4))
          {
            v38 = _gICOSLog;
            if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
              goto LABEL_33;
          }
        }
        else
        {

          if (v36 == v25)
            goto LABEL_38;
          __ICOSLogCreate();
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[0x%x] Object Format Code Does Not Match\n"), objc_msgSend(v29, "objectHandle")));
          if (__ICLogTypeEnabled(4))
          {
            v38 = _gICOSLog;
            if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
              goto LABEL_33;
          }
        }
LABEL_43:

        if (v27 == (id)0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_44;
      }
      __ICOSLogCreate();
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[0x%x] Large File Support Disabled, Large File Cannot Be Added Index\n"), objc_msgSend(v29, "objectHandle")));
      if (!__ICLogTypeEnabled(4))
        goto LABEL_43;
      v38 = _gICOSLog;
      if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_43;
LABEL_33:
      *(_DWORD *)buf = 138543362;
      v93 = v37;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
      goto LABEL_43;
    }
  }
LABEL_44:
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v51 = v85;
  obj = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v85->_folders, "allValues"));
  v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v91, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v88;
    do
    {
      for (i = 0; i != v53; i = (char *)i + 1)
      {
        if (*(_QWORD *)v88 != v54)
          objc_enumerationMutation(obj);
        v56 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * (_QWORD)i);
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[PTPFolder storage](v51, "storage"));
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "cameraFolderWithObjectID:", objc_msgSend(v56, "unsignedIntValue")));

        if (v25)
          goto LABEL_57;
        if ((v86 + 1) < 2 || v51->_objectHandle == (_DWORD)v86)
        {
          __ICOSLogCreate();
          v59 = &stru_100048E60;
          if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
          {
            v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
            v59 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "stringByAppendingString:", CFSTR("..")));

          }
          v61 = objc_msgSend(v58, "objectHandle");
          v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectInfoDataset"));
          v63 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "filename")));
          v64 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("  +[0x%lx]%s] \n"), v61, objc_msgSend(v63, "UTF8String")));

          v65 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            v66 = objc_retainAutorelease(v59);
            v67 = v65;
            v68 = -[__CFString UTF8String](v66, "UTF8String");
            *(_DWORD *)buf = 136446466;
            v93 = v68;
            v94 = 2114;
            v95 = v64;
            _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

          }
          v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v58, "objectHandle")));
          objc_msgSend(v83, "addObject:", v69);

          v25 = v84;
          v51 = v85;
LABEL_57:
          if ((_DWORD)v86 == -1)
            goto LABEL_63;
        }
        __ICOSLogCreate();
        v70 = &stru_100048E60;
        if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
        {
          v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
          v70 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "stringByAppendingString:", CFSTR("..")));

        }
        v72 = objc_msgSend(v58, "objectHandle");
        v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectInfoDataset"));
        v74 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "filename")));
        v75 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" ->[0x%lx]%s] \n"), v72, objc_msgSend(v74, "UTF8String")));

        v76 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          v77 = objc_retainAutorelease(v70);
          v78 = v76;
          v79 = -[__CFString UTF8String](v77, "UTF8String");
          *(_DWORD *)buf = 136446466;
          v93 = v79;
          v94 = 2114;
          v95 = v75;
          _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

        }
        v25 = v84;
        v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectHandlesForObjectFormatCode:inAssociation:", v84, v86));
        objc_msgSend(v83, "addObjectsFromArray:", v80);

        v51 = v85;
LABEL_63:

      }
      v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v91, 16);
    }
    while (v53);
  }

  return v83;
}

- (void)addFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  os_unfair_lock_s *p_folderLock;
  NSMutableIndexSet *fileIndices;
  id v11;

  v4 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "objectHandle")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectInfoDataset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "filename"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectInfoDataset"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%d"), v6, objc_msgSend(v7, "sequenceNumber")));

  p_folderLock = &self->_folderLock;
  os_unfair_lock_lock(&self->_folderLock);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_fileNames, "setObject:forKeyedSubscript:", v11, v8);
  fileIndices = self->_fileIndices;
  LODWORD(v6) = objc_msgSend(v4, "objectHandle");

  -[NSMutableIndexSet addIndex:](fileIndices, "addIndex:", v6);
  os_unfair_lock_unlock(p_folderLock);

}

- (void)addFolder:(id)a3
{
  id v4;
  os_unfair_lock_s *p_folderLock;
  NSMutableDictionary *folders;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "objectHandle")));
  p_folderLock = &self->_folderLock;
  os_unfair_lock_lock(&self->_folderLock);
  folders = self->_folders;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectInfoDataset"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filename"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](folders, "setObject:forKeyedSubscript:", v9, v8);

  os_unfair_lock_unlock(p_folderLock);
}

- (void)deleteFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  os_unfair_lock_s *p_folderLock;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectInfoDataset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "filename"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectInfoDataset"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%d"), v6, objc_msgSend(v7, "sequenceNumber")));

  p_folderLock = &self->_folderLock;
  os_unfair_lock_lock(&self->_folderLock);
  -[NSMutableDictionary removeObjectForKey:](self->_fileNames, "removeObjectForKey:", v10);
  -[NSMutableIndexSet removeIndex:](self->_fileIndices, "removeIndex:", objc_msgSend(v4, "objectHandle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PTPFolder storage](self, "storage"));
  LODWORD(v5) = objc_msgSend(v4, "objectHandle");

  objc_msgSend(v9, "removeCameraFileFromIndex:", v5);
  os_unfair_lock_unlock(p_folderLock);

}

- (void)deleteFolder:(id)a3
{
  os_unfair_lock_s *p_folderLock;
  id v5;
  NSMutableDictionary *folders;
  void *v7;
  void *v8;
  void *v9;

  p_folderLock = &self->_folderLock;
  v5 = a3;
  os_unfair_lock_lock(p_folderLock);
  folders = self->_folders;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectInfoDataset"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filename"));
  -[NSMutableDictionary removeObjectForKey:](folders, "removeObjectForKey:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PTPFolder storage](self, "storage"));
  LODWORD(folders) = objc_msgSend(v5, "objectHandle");

  objc_msgSend(v9, "removeCameraFolderFromIndex:", folders);
  os_unfair_lock_unlock(p_folderLock);
}

- (BOOL)fileExists:(id)a3
{
  os_unfair_lock_s *p_folderLock;
  id v5;
  void *v6;

  p_folderLock = &self->_folderLock;
  v5 = a3;
  os_unfair_lock_lock(p_folderLock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_fileNames, "objectForKeyedSubscript:", v5));

  LODWORD(v5) = objc_msgSend(v6, "unsignedIntValue");
  os_unfair_lock_unlock(p_folderLock);
  return (_DWORD)v5 != 0;
}

- (id)folderMatchingName:(id)a3
{
  os_unfair_lock_s *p_folderLock;
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;

  p_folderLock = &self->_folderLock;
  v5 = a3;
  os_unfair_lock_lock(p_folderLock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_folders, "objectForKeyedSubscript:", v5));

  v7 = objc_msgSend(v6, "unsignedIntValue");
  os_unfair_lock_unlock(p_folderLock);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PTPFolder storage](self, "storage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cameraFolderWithObjectID:", v7));

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (unint64_t)appendObjectData:(id)a3 forObjectFormatCode:(unsigned __int16)a4 inAssociation:(unsigned int)a5 withContentType:(unsigned int)a6
{
  unsigned int v7;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  PTPFolder *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  NSMutableIndexSet *fileIndices;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *i;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  NSObject *v48;
  id v49;
  unint64_t v50;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  void *v58;
  NSObject *v59;
  void *v60;
  unsigned int v61;
  unsigned int v62;
  void *v63;
  NSObject *v64;
  int v65;
  id v66;
  uint64_t v67;
  id v68;
  void *v69;
  id v70;
  void *v71;
  NSObject *v72;
  void *v73;
  os_unfair_lock_t lock;
  unsigned int v75;
  unsigned int v76;
  id v78;
  unsigned int v79;
  PTPFolder *v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  unint64_t v85;
  uint8_t v86[128];
  uint8_t buf[4];
  id v88;
  __int16 v89;
  void *v90;

  v7 = a4;
  v78 = a3;
  v9 = objc_opt_class(PTPStorage);
  v76 = a5;
  if ((objc_opt_isKindOfClass(self, v9) & 1) == 0)
  {
    v16 = self;
    __ICOSLogCreate();
    v11 = &stru_100048E60;
    if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingString:", CFSTR("..")));

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PTPFolder objectInfoDataset](v16, "objectInfoDataset"));
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "filename")));
    v20 = objc_msgSend(v19, "UTF8String");
    v21 = -[NSMutableDictionary count](v16->_folders, "count");
    fileIndices = v16->_fileIndices;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("  [Folder: %8s] folders:[%5lu] files:[%5lu] \n"), v20, v21, -[NSMutableIndexSet count](fileIndices, "count")));
    v23 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_retainAutorelease(v11);
      v24 = v23;
      *(_DWORD *)buf = 136446466;
      v88 = -[__CFString UTF8String](v11, "UTF8String");
      v89 = 2114;
      v90 = v13;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    a5 = v76;
    goto LABEL_12;
  }
  v10 = objc_opt_class(PTPFolder);
  if ((objc_opt_isKindOfClass(self, v10) & 1) != 0)
  {
    __ICOSLogCreate();
    v11 = &stru_100048E60;
    if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingString:", CFSTR("..")));

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[Storage: 0x%x] \n"), -[PTPFolder objectHandle](self, "objectHandle")));
    v14 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_retainAutorelease(v11);
      v15 = v14;
      *(_DWORD *)buf = 136446466;
      v88 = -[__CFString UTF8String](v11, "UTF8String");
      v89 = 2114;
      v90 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
LABEL_12:

  }
  v85 = 0;
  if (a6 == 3 && !objc_msgSend(v78, "length"))
  {
    __ICOSLogCreate();
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Append Initial PTP11 Array, Object Count [%d]\n"), v85));
    if (__ICLogTypeEnabled(4))
    {
      v26 = _gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v88 = v25;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
      }
    }

    objc_msgSend(v78, "appendBytes:length:", &v85, 8);
    a5 = v76;
  }
  v27 = sub_100004BF8();
  v75 = a5 + 1;
  v79 = v7;
  v80 = self;
  if (a5 + 1 < 2 || self->_objectHandle == a5)
  {
    os_unfair_lock_lock(&self->_folderLock);
    v28 = -[NSMutableIndexSet lastIndex](self->_fileIndices, "lastIndex");
    if (v28 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_22:
      os_unfair_lock_unlock(&self->_folderLock);
      v7 = v79;
      goto LABEL_23;
    }
    v52 = v28;
    while (1)
    {
      v53 = objc_autoreleasePoolPush();
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[PTPFolder storage](self, "storage"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "cameraFileWithObjectID:", v52));

      v52 = -[NSMutableIndexSet indexLessThanIndex:](self->_fileIndices, "indexLessThanIndex:", v52);
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectInfoDataset"));
      v57 = (unint64_t)objc_msgSend(v56, "objectCompressedSize64") >> 32 ? v27 : 1;

      if ((v57 & 1) == 0)
        break;
      if (!v79)
        goto LABEL_64;
      __ICOSLogCreate();
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[0x%x] Object Format Code Is Non-Zero\n"), objc_msgSend(v55, "objectHandle")));
      if (__ICLogTypeEnabled(4))
      {
        v59 = _gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v88 = v58;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }
      }

      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectInfoDataset"));
      v61 = objc_msgSend(v60, "objectFormat");
      v62 = v61;
      if (v79 == 0xFFFF)
      {
        v65 = ~v61 & 0x3800;

        if (v65)
        {
LABEL_64:
          v66 = v52;
          v67 = v27;
          __ICOSLogCreate();
          v68 = objc_msgSend(v55, "objectHandle");
          v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectInfoDataset"));
          v70 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "filename")));
          v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" +[0x%x]%s] "), v68, objc_msgSend(v70, "UTF8String")));

          if (__ICLogTypeEnabled(4))
          {
            v72 = _gICOSLog;
            if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v88 = v71;
              _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
            }
          }

          v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectInfoDataset"));
          v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "content:", a6));

          objc_msgSend(v78, "appendData:", v63);
          ++v85;
          a5 = v76;
          v27 = v67;
          v52 = v66;
          goto LABEL_68;
        }
        __ICOSLogCreate();
        v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[0x%x] Object Has Been Excluded\n"), objc_msgSend(v55, "objectHandle")));
        if (!__ICLogTypeEnabled(4))
        {
LABEL_70:
          a5 = v76;
          goto LABEL_68;
        }
        v64 = _gICOSLog;
        a5 = v76;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          goto LABEL_59;
      }
      else
      {

        if (v62 == v79)
          goto LABEL_64;
        __ICOSLogCreate();
        v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[0x%x] Object Format Code Does Not Match\n"), objc_msgSend(v55, "objectHandle")));
        if (!__ICLogTypeEnabled(4))
          goto LABEL_70;
        v64 = _gICOSLog;
        a5 = v76;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          goto LABEL_59;
      }
LABEL_68:

      objc_autoreleasePoolPop(v53);
      if (v52 == (id)0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_22;
    }
    __ICOSLogCreate();
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[0x%x] Large File Support Disabled, Large File Cannot Be Added Index\n"), objc_msgSend(v55, "objectHandle")));
    if (!__ICLogTypeEnabled(4))
      goto LABEL_68;
    v64 = _gICOSLog;
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_68;
LABEL_59:
    *(_DWORD *)buf = 138543362;
    v88 = v63;
    _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    goto LABEL_68;
  }
LABEL_23:
  lock = &self->_folderLock;
  os_unfair_lock_lock(&self->_folderLock);
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_folders, "allValues"));
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v82;
    do
    {
      for (i = 0; i != v31; i = (char *)i + 1)
      {
        if (*(_QWORD *)v82 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)i);
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[PTPFolder storage](self, "storage"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "cameraFolderWithObjectID:", objc_msgSend(v34, "unsignedIntValue")));

        if (v7)
          goto LABEL_35;
        if (v75 < 2 || self->_objectHandle == a5)
        {
          __ICOSLogCreate();
          v37 = objc_msgSend(v36, "objectHandle");
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectInfoDataset"));
          v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "filename")));
          v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" +[0x%x]%s] \n"), v37, objc_msgSend(v39, "UTF8String")));

          if (__ICLogTypeEnabled(4))
          {
            v41 = _gICOSLog;
            if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v88 = v40;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
            }
          }

          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectInfoDataset"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "content:", a6));

          objc_msgSend(v78, "appendData:", v43);
          ++v85;

          v7 = v79;
          self = v80;
LABEL_35:
          if (a5 == -1)
            goto LABEL_40;
        }
        __ICOSLogCreate();
        v44 = objc_msgSend(v36, "objectHandle");
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectInfoDataset"));
        v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "filename")));
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("->[0x%x]%s] \n"), v44, objc_msgSend(v46, "UTF8String")));

        if (__ICLogTypeEnabled(4))
        {
          v48 = _gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v88 = v47;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
          }
        }

        v7 = v79;
        a5 = v76;
        v49 = objc_msgSend(v36, "appendObjectData:forObjectFormatCode:inAssociation:withContentType:", v78, v79, v76, a6);
        v85 += (unint64_t)v49;
        self = v80;
LABEL_40:

      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
    }
    while (v31);
  }

  os_unfair_lock_unlock(lock);
  v50 = v85;

  return v50;
}

- (id)parent
{
  return objc_loadWeakRetained(&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak(&self->_parent, a3);
}

- (id)storage
{
  return objc_loadWeakRetained(&self->_storage);
}

- (void)setStorage:(id)a3
{
  objc_storeWeak(&self->_storage, a3);
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(unint64_t)a3
{
  self->_serialNumber = a3;
}

- (timespec)captureTimeSpec
{
  uint64_t tv_nsec;
  __darwin_time_t tv_sec;
  timespec result;

  tv_nsec = self->_captureTimeSpec.tv_nsec;
  tv_sec = self->_captureTimeSpec.tv_sec;
  result.tv_nsec = tv_nsec;
  result.tv_sec = tv_sec;
  return result;
}

- (void)setCaptureTimeSpec:(timespec)a3
{
  self->_captureTimeSpec = a3;
}

- (int64_t)size
{
  return self->_size;
}

- (void)setSize:(int64_t)a3
{
  self->_size = a3;
}

- (NSMutableDictionary)fileNames
{
  return self->_fileNames;
}

- (void)setFileNames:(id)a3
{
  objc_storeStrong((id *)&self->_fileNames, a3);
}

- (NSMutableIndexSet)fileIndices
{
  return self->_fileIndices;
}

- (void)setFileIndices:(id)a3
{
  objc_storeStrong((id *)&self->_fileIndices, a3);
}

- (NSMutableDictionary)folders
{
  return self->_folders;
}

- (void)setFolders:(id)a3
{
  objc_storeStrong((id *)&self->_folders, a3);
}

- (void)setObjectHandle:(unsigned int)a3
{
  self->_objectHandle = a3;
}

- (void)setObjectInfoDataset:(id)a3
{
  objc_storeStrong((id *)&self->_objectInfoDataset, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectInfoDataset, 0);
  objc_storeStrong((id *)&self->_folders, 0);
  objc_storeStrong((id *)&self->_fileIndices, 0);
  objc_storeStrong((id *)&self->_fileNames, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_destroyWeak(&self->_storage);
  objc_destroyWeak(&self->_parent);
}

@end
