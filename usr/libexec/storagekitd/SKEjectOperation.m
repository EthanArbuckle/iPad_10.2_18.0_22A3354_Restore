@implementation SKEjectOperation

- (SKEjectOperation)initWithDisk:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  SKEjectOperation *v7;
  void *v8;
  void *v9;
  void *v10;
  SKDisk *v11;
  SKDisk *diskToEject;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SKEjectOperation;
  v7 = -[SKBaseDiskArbOperation initWithTarget:options:callbackBlock:](&v14, "initWithTarget:options:callbackBlock:", v6, &__NSDictionary0__struct, a4);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "wholeDiskForDisk:", v6));

    if (v9)
      v10 = v9;
    else
      v10 = v6;
    v11 = v10;
    diskToEject = v7->_diskToEject;
    v7->_diskToEject = v11;

  }
  return v7;
}

- (id)_wholeDisksToEject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKEjectOperation diskToEject](self, "diskToEject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKEjectOperation diskToEject](self, "diskToEject"));
  v7 = objc_opt_class(SKAPFSContainerDisk);
  isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKEjectOperation diskToEject](self, "diskToEject"));
  v10 = v9;
  if ((isKindOfClass & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "physicalStores"));
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v34;
      do
      {
        v15 = 0;
        v16 = v5;
        do
        {
          if (*(_QWORD *)v34 != v14)
            objc_enumerationMutation(v11);
          v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "wholeDiskForDisk:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v15)));

          if (v5)
            objc_msgSend(v4, "addObject:", v5);
          v15 = (char *)v15 + 1;
          v16 = v5;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v13);
    }

  }
  else
  {
    objc_msgSend(v4, "addObject:", v9);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "children"));
  v19 = v18;
  if (v18)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
          v25 = objc_opt_class(SKAPFSStoreDisk);
          if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0)
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "container"));
            if (v26)
              objc_msgSend(v17, "addObject:", v26);

          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v21);
    }
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
  objc_msgSend(v17, "addObjectsFromArray:", v27);

  return v17;
}

- (void)_deepUnmountWithWholeDisk:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  void *v19;
  _BYTE v20[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "children"));
  if (v5)
    objc_msgSend(v4, "addObjectsFromArray:", v5);
  objc_msgSend(v4, "addObject:", v3);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    v9 = kSKDiskMountOptionRecursive;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v18 = v9;
        v19 = &__kCFBooleanTrue;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
        +[SKUnmountOperation unmountWithDisk:options:error:](SKUnmountOperation, "unmountWithDisk:options:error:", v11, v12, 0);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v7);
  }

}

- (BOOL)run
{
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  __DADisk *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  char isKindOfClass;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  id v23;
  void (**v24)(_QWORD, _QWORD);
  BOOL v25;
  void *v26;
  void *v28;
  _QWORD v29[5];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKEjectOperation _wholeDisksToEject](self, "_wholeDisksToEject"));
  v4 = sub_10000BA9C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "-[SKEjectOperation run]";
    v36 = 1024;
    LODWORD(v37) = objc_msgSend(v3, "count");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Ejecting %d disks", buf, 0x12u);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (!v7)
  {
LABEL_22:

LABEL_26:
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10002A8D4;
    v29[3] = &unk_100044B78;
    v29[4] = self;
    objc_msgSend(v26, "syncAllDisksWithCompletionBlock:", v29);

    v25 = 1;
    goto LABEL_27;
  }
  v8 = v7;
  v9 = *(_QWORD *)v31;
  v28 = v6;
LABEL_5:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v31 != v9)
      objc_enumerationMutation(v6);
    v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v10);
    -[SKEjectOperation _deepUnmountWithWholeDisk:](self, "_deepUnmountWithWholeDisk:", v11);
    v12 = sub_10000BA9C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[SKEjectOperation run]";
      v36 = 2112;
      v37 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: Ejecting %@", buf, 0x16u);
    }

    v14 = (__DADisk *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "daDisk"));
    if (!v14)
      goto LABEL_20;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Eject of %@"), v11));
    -[SKBaseDiskArbOperation setCurrentOperationName:](self, "setCurrentOperationName:", v15);

    DADiskEject(v14, 0, (DADiskEjectCallback)sub_100017048, self);
    if (!-[SKBaseDiskArbOperation completeDiskArbOp](self, "completeDiskArbOp"))
      break;
LABEL_17:
    v21 = sub_10000BA9C();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v35 = "-[SKEjectOperation run]";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s: Ejected", buf, 0xCu);
    }

LABEL_20:
    if (v8 == (id)++v10)
    {
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      if (v8)
        goto LABEL_5;
      goto LABEL_22;
    }
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SKEjectOperation diskToEject](self, "diskToEject"));
  if ((objc_msgSend(v11, "isEqual:", v16) & 1) == 0)
  {
    v17 = objc_opt_class(SKAPFSContainerDisk);
    isKindOfClass = objc_opt_isKindOfClass(v11, v17);

    if ((isKindOfClass & 1) == 0)
      goto LABEL_24;
    v19 = sub_10000BA9C();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[SKEjectOperation run]";
      v36 = 2112;
      v37 = v11;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s: %@ failed to eject, continue anyway", buf, 0x16u);
    }

    v6 = v28;
    goto LABEL_17;
  }

LABEL_24:
  v23 = -[SKBaseDiskArbOperation newDAError](self, "newDAError");

  v6 = v28;
  if (!v23)
    goto LABEL_26;
  v24 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation callbackBlock](self, "callbackBlock"));
  ((void (**)(_QWORD, id))v24)[2](v24, v23);

  -[SKManagerOperation finished](self, "finished");
  v25 = 0;
LABEL_27:

  return v25;
}

- (id)description
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SKEjectOperation diskToEject](self, "diskToEject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Eject Operation for %@"), v2));

  return v3;
}

- (int64_t)defaultErrorCode
{
  return 403;
}

- (SKDisk)diskToEject
{
  return (SKDisk *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDiskToEject:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diskToEject, 0);
}

@end
