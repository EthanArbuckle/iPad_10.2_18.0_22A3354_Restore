@implementation SKBaseDiskArbOperation

+ (void)storeMountState:(id)a3
{
  void *v3;
  SKMountState *v4;
  void *v5;
  SKMountState *v6;
  id v7;

  v7 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mountPoint"));

  if (v3)
  {
    v4 = [SKMountState alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mountPoint"));
    v6 = -[SKMountState initWithMountPoint:](v4, "initWithMountPoint:", v5);

    objc_msgSend(v7, "setPreviousMount:", v6);
  }

}

+ (id)getMountState:(id)a3
{
  return objc_msgSend(a3, "previousMount");
}

+ (void)clearMountState:(id)a3
{
  objc_msgSend(a3, "setPreviousMount:", 0);
}

- (SKBaseDiskArbOperation)initWithTarget:(id)a3 options:(id)a4 callbackBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKBaseDiskArbOperation *v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  void *v15;
  id v16;
  id callbackBlock;
  SKBaseDiskArbOperation *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  objc_super v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  SKBaseDiskArbOperation *v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)SKBaseDiskArbOperation;
  v11 = -[SKManagerOperation init](&v24, "init");
  if (v8
    && (v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "daDisk"))) != 0
    && (v13 = (void *)v12, v14 = objc_msgSend(v8, "isValid"), v13, v14)
    && v11)
  {
    if (v9)
      v15 = v9;
    else
      v15 = &__NSDictionary0__struct;
    objc_storeStrong((id *)&v11->_options, v15);
    v16 = objc_msgSend(v10, "copy");
    callbackBlock = v11->_callbackBlock;
    v11->_callbackBlock = v16;

    v18 = v11;
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[SKBaseManager sharedManager](SKBaseManager, "sharedManager"));
    objc_msgSend(v19, "logEvent:eventPayloadBuilder:", CFSTR("com.apple.StorageKit.log.fault"), &stru_100045260);

    v20 = sub_10000BA9C();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315650;
      v26 = "-[SKBaseDiskArbOperation initWithTarget:options:callbackBlock:]";
      v27 = 2112;
      v28 = v8;
      v29 = 2112;
      v30 = v11;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "%s: Reached with invalid disk (%@) or init failed (%@)", buf, 0x20u);
    }

    if (v10)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](SKError, "errorWithCode:userInfo:", 102, 0));
      (*((void (**)(id, void *))v10 + 2))(v10, v22);

    }
    v18 = 0;
  }

  return v18;
}

- (BOOL)recursive
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation options](self, "options"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", kSKDiskMountOptionRecursive));

  if (sub_10000FA68(v3))
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (BOOL)raidTraverse
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation options](self, "options"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", kSKDiskMountOptionRecursiveRAID));

  LOBYTE(v2) = sub_10000FC18(v3);
  return (char)v2;
}

- (id)diskWithFSRefresh:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filesystem"));
  if (v4)
  {

LABEL_5:
    v7 = v3;
    goto LABEL_6;
  }
  if ((objc_msgSend(v3, "isIOMediaDisk") & 1) == 0)
    goto LABEL_5;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "diskIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/dev/%@"), v5));
  v7 = (id)objc_claimAutoreleasedReturnValue(+[SKMediaKit getMediaKitFilesystemType:](SKMediaKit, "getMediaKitFilesystemType:", v6));

  if (v7)
    goto LABEL_5;
LABEL_6:

  return v7;
}

- (id)disksForOperationWithTarget:(id)a3 ignoreGroup:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  _UNKNOWN **v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *j;
  void *v41;
  void *v42;
  unsigned int v43;
  void *v44;
  unsigned __int8 v45;
  void *v46;
  void *v47;
  void *v48;
  unsigned int v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  unsigned __int8 v54;
  void *v55;
  void *v57;
  id v59;
  void *v60;
  void *v61;
  uint64_t v62;
  id obj;
  id v64;
  void *v65;
  id v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];

  v5 = a3;
  v67 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  if (-[SKBaseDiskArbOperation recursive](self, "recursive"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v5));
    if (objc_msgSend(v5, "isWholeDisk"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "children"));
      if (v7)
        objc_msgSend(v6, "addObjectsFromArray:", v7);

    }
    v61 = v5;
    -[SKBaseDiskArbOperation raidTraverse](self, "raidTraverse");
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    obj = v6;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v77;
      v11 = &APFSCancelContainerResize_ptr;
      v62 = *(_QWORD *)v77;
      do
      {
        v12 = 0;
        v64 = v9;
        do
        {
          if (*(_QWORD *)v77 != v10)
            objc_enumerationMutation(obj);
          v13 = *(id *)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)v12);
          v14 = objc_opt_class(v11[125]);
          if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
          {
            v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "container"));
            if (!v15)
              goto LABEL_58;
            v16 = (void *)v15;

            v13 = v16;
          }
          v17 = objc_opt_class(SKAPFSContainerDisk);
          if ((objc_opt_isKindOfClass(v13, v17) & 1) != 0)
          {
            v18 = v12;
            v19 = v13;
            v20 = v13;
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "volumes"));
            v72 = 0u;
            v73 = 0u;
            v74 = 0u;
            v75 = 0u;
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
            if (v22)
            {
              v23 = v22;
              v24 = *(_QWORD *)v73;
              do
              {
                for (i = 0; i != v23; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v73 != v24)
                    objc_enumerationMutation(v21);
                  v26 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)i);
                  if (-[SKBaseDiskArbOperation toOperateWithDisk:](self, "toOperateWithDisk:", v26))
                    objc_msgSend(v67, "addObject:", v26);
                }
                v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
              }
              while (v23);
            }

            v11 = &APFSCancelContainerResize_ptr;
            v9 = v64;
            v12 = v18;
            v13 = v19;
            goto LABEL_57;
          }
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "type"));
          if (objc_msgSend(v27, "isEqualToString:", kSKDiskTypeEFI))
          {
            v28 = v12;
            v29 = v13;
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "diskIdentifier"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "diskIdentifier"));
            if (!objc_msgSend(v30, "isEqualToString:", v31))
            {
              v52 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation options](self, "options"));
              v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectForKeyedSubscript:", kSKDiskMountOptionWithoutEFI));
              v54 = sub_10000FC18(v53);

              v12 = v28;
              v13 = v29;
              v11 = &APFSCancelContainerResize_ptr;
              v9 = v64;
              if ((v54 & 1) != 0)
              {
                v10 = v62;
                goto LABEL_58;
              }
              goto LABEL_29;
            }

            v12 = v28;
            v13 = v29;
            v11 = &APFSCancelContainerResize_ptr;
            v9 = v64;
          }

LABEL_29:
          v32 = objc_opt_class(SKAPFSDisk);
          if ((objc_opt_isKindOfClass(v13, v32) & 1) == 0
            || (v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "apfsVolumeGroupUUID")),
                v33,
                !v33)
            || a4)
          {
            v20 = (id)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation diskWithFSRefresh:](self, "diskWithFSRefresh:", v13));
            if (v20)
              objc_msgSend(v67, "addObject:", v20);
            v10 = v62;
            goto LABEL_57;
          }
          v60 = v12;
          v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "apfsVolumeGroupUUID"));
          v59 = v13;
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "container"));
          v68 = 0u;
          v69 = 0u;
          v70 = 0u;
          v71 = 0u;
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "volumes"));
          v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
          if (!v36)
          {

            v38 = 0;
            v51 = 0;
            v10 = v62;
            goto LABEL_55;
          }
          v37 = v36;
          v65 = 0;
          v66 = v35;
          v57 = v34;
          v38 = 0;
          v39 = *(_QWORD *)v69;
          do
          {
            for (j = 0; j != v37; j = (char *)j + 1)
            {
              if (*(_QWORD *)v69 != v39)
                objc_enumerationMutation(v66);
              v41 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)j);
              v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "apfsVolumeGroupUUID"));
              v43 = objc_msgSend(v42, "isEqualToString:", v20);

              if (v43)
              {
                v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "getAPFSVolumeRole"));
                v45 = objc_msgSend(v44, "isEqualToString:", SKAPFSVolumeRoleData);

                if ((v45 & 1) != 0)
                {
                  v46 = v65;
                  v65 = v41;
                  v47 = v38;
                }
                else
                {
                  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "getAPFSVolumeRole"));
                  v49 = objc_msgSend(v48, "isEqualToString:", SKAPFSVolumeRoleSystem);

                  v46 = v38;
                  v47 = v41;
                  if (!v49)
                    continue;
                }
                v50 = v41;

                v38 = v47;
              }
            }
            v37 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
          }
          while (v37);

          v51 = v65;
          if (v65)
          {
            v10 = v62;
            v11 = &APFSCancelContainerResize_ptr;
            v9 = v64;
            v13 = v59;
            v12 = v60;
            if (v38)
            {
              objc_msgSend(v67, "addObject:", v65);
              objc_msgSend(v67, "addObject:", v38);
              v34 = v57;
              goto LABEL_56;
            }
          }
          else
          {
            v10 = v62;
            v11 = &APFSCancelContainerResize_ptr;
            v9 = v64;
            v13 = v59;
            v12 = v60;
          }
          v34 = v57;
LABEL_55:
          objc_msgSend(v67, "addObject:", v13);
LABEL_56:

LABEL_57:
LABEL_58:

          v12 = (char *)v12 + 1;
        }
        while (v12 != v9);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
      }
      while (v9);
    }

    v5 = v61;
  }
  else
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation diskWithFSRefresh:](self, "diskWithFSRefresh:", v5));
    if (v55)
      objc_msgSend(v67, "addObject:", v55);

  }
  return v67;
}

- (BOOL)toOperateWithDisk:(id)a3
{
  return 1;
}

- (void)diskArbCallbackWithDissenter:(__DADissenter *)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  void *v10;
  __CFString *v11;
  id v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  __CFString *v23;

  if (a3)
  {
    -[SKBaseDiskArbOperation setDAstatus:](self, "setDAstatus:", DADissenterGetStatus(a3));
    -[SKBaseDiskArbOperation setDissenterPID:](self, "setDissenterPID:", DADissenterGetProcessID(a3));
    -[SKBaseDiskArbOperation setDAstatusString:](self, "setDAstatusString:", DADissenterGetStatusString(a3));
    v5 = sub_10000BA9C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation currentOperationName](self, "currentOperationName"));
      v8 = -[SKBaseDiskArbOperation DAstatus](self, "DAstatus");
      v9 = -[SKBaseDiskArbOperation dissenterPID](self, "dissenterPID");
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation DAstatusString](self, "DAstatusString"));
      if (v10)
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation DAstatusString](self, "DAstatusString"));
      else
        v11 = CFSTR("(no status details)");
      v14 = 136316162;
      v15 = "-[SKBaseDiskArbOperation diskArbCallbackWithDissenter:]";
      v16 = 2112;
      v17 = v7;
      v18 = 1024;
      v19 = v8;
      v20 = 1024;
      v21 = v9;
      v22 = 2112;
      v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s: %@: dissented with status 0x%x by pid %d: %@", (uint8_t *)&v14, 0x2Cu);
      if (v10)

      goto LABEL_11;
    }
  }
  else
  {
    -[SKBaseDiskArbOperation setDAstatus:](self, "setDAstatus:");
    v12 = sub_10000BA9C();
    v6 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation currentOperationName](self, "currentOperationName"));
      v14 = 136315394;
      v15 = "-[SKBaseDiskArbOperation diskArbCallbackWithDissenter:]";
      v16 = 2112;
      v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %@: success", (uint8_t *)&v14, 0x16u);
LABEL_11:

    }
  }

  -[SKBaseDiskArbOperation setDiskArbOpDone:](self, "setDiskArbOpDone:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
  objc_msgSend(v13, "dispatchToWorkThread:", &stru_100045280);

}

- (BOOL)completeDiskArbOp
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation currentOperationName](self, "currentOperationName"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation description](self, "description"));
    -[SKBaseDiskArbOperation setCurrentOperationName:](self, "setCurrentOperationName:", v4);

  }
  v5 = sub_10000BA9C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation currentOperationName](self, "currentOperationName"));
    v12 = 136315394;
    v13 = "-[SKBaseDiskArbOperation completeDiskArbOp]";
    v14 = 2112;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %@: running", (uint8_t *)&v12, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  if (!-[SKBaseDiskArbOperation diskArbOpDone](self, "diskArbOpDone"))
  {
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 1.0));
      objc_msgSend(v8, "runMode:beforeDate:", NSDefaultRunLoopMode, v9);

    }
    while (!-[SKBaseDiskArbOperation diskArbOpDone](self, "diskArbOpDone"));
  }
  -[SKBaseDiskArbOperation setDiskArbOpDone:](self, "setDiskArbOpDone:", 0);
  v10 = -[SKBaseDiskArbOperation DAstatus](self, "DAstatus") == 0;

  return v10;
}

- (id)newDAError
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation DAstatusString](self, "DAstatusString"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation DAstatusString](self, "DAstatusString"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, kSKErrorDiskArbErrorStringKey);

    v6 = -[SKBaseDiskArbOperation DAstatus](self, "DAstatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation DAstatusString](self, "DAstatusString"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DA error code 0x%x: %@"), v6, v7));

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DA error code 0x%x"), -[SKBaseDiskArbOperation DAstatus](self, "DAstatus")));
  }
  v9 = -[SKBaseDiskArbOperation dissenterPID](self, "dissenterPID");
  v10 = objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation description](self, "description"));
  v11 = (void *)v10;
  if (v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ dissented by process with PID %d, %@"), v10, -[SKBaseDiskArbOperation dissenterPID](self, "dissenterPID"), v8));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, NSDebugDescriptionErrorKey);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[SKBaseDiskArbOperation dissenterPID](self, "dissenterPID")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, kSKErrorDissenterPIDKey);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ failed, %@"), v10, v8));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, NSDebugDescriptionErrorKey);

  }
  if (-[SKBaseDiskArbOperation DAstatus](self, "DAstatus") < 49152
    || -[SKBaseDiskArbOperation DAstatus](self, "DAstatus") > 49258)
  {
    v14 = objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](SKError, "errorWithCode:userInfo:", -[SKBaseDiskArbOperation defaultErrorCode](self, "defaultErrorCode"), v3));
  }
  else
  {
    v14 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, (int)(-[SKBaseDiskArbOperation DAstatus](self, "DAstatus") & 0xFFFF3FFF), v3));
  }
  v15 = (void *)v14;

  return v15;
}

- (id)newPerformOperation
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, CFSTR("No implementation provided for generic base class."), 0));
  objc_exception_throw(v2);
}

- (BOOL)run
{
  id v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);

  v3 = -[SKBaseDiskArbOperation newPerformOperation](self, "newPerformOperation");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation callbackBlock](self, "callbackBlock"));

  if (v4)
  {
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation callbackBlock](self, "callbackBlock"));
    ((void (**)(_QWORD, id))v5)[2](v5, v3);

  }
  -[SKManagerOperation finished](self, "finished");

  return v3 == 0;
}

- (void)removeWithMountPoint:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("/private/var/mnt")))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v14 = 0;
    v5 = objc_msgSend(v4, "removeItemAtPath:error:", v3, &v14);
    v6 = v14;

    v7 = sub_10000BA9C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = v8;
    if (v5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v3;
        v10 = "Removed %@";
        v11 = v9;
        v12 = OS_LOG_TYPE_DEFAULT;
        v13 = 12;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, buf, v13);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v3;
      v17 = 2112;
      v18 = v6;
      v10 = "Failed to remove %@: %@";
      v11 = v9;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 22;
      goto LABEL_7;
    }

  }
}

- (id)callbackBlock
{
  return self->_callbackBlock;
}

- (void)setCallbackBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int)dissenterPID
{
  return self->_dissenterPID;
}

- (void)setDissenterPID:(int)a3
{
  self->_dissenterPID = a3;
}

- (int)DAstatus
{
  return self->_DAstatus;
}

- (void)setDAstatus:(int)a3
{
  self->_DAstatus = a3;
}

- (NSString)DAstatusString
{
  return self->_DAstatusString;
}

- (void)setDAstatusString:(id)a3
{
  objc_storeStrong((id *)&self->_DAstatusString, a3);
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (NSString)currentOperationName
{
  return self->_currentOperationName;
}

- (void)setCurrentOperationName:(id)a3
{
  objc_storeStrong((id *)&self->_currentOperationName, a3);
}

- (int64_t)defaultErrorCode
{
  return self->_defaultErrorCode;
}

- (BOOL)diskArbOpDone
{
  return self->_diskArbOpDone;
}

- (void)setDiskArbOpDone:(BOOL)a3
{
  self->_diskArbOpDone = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentOperationName, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_DAstatusString, 0);
  objc_storeStrong(&self->_callbackBlock, 0);
}

@end
