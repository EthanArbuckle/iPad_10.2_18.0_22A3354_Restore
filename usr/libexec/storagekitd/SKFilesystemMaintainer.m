@implementation SKFilesystemMaintainer

- (SKFilesystemMaintainer)initWithDisk:(id)a3
{
  id v4;
  void *v5;
  SKFilesystemMaintainer *v6;
  id v8;

  v8 = a3;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));

  v6 = -[SKFilesystemMaintainer initWithDisks:](self, "initWithDisks:", v5, v8);
  return v6;
}

- (SKFilesystemMaintainer)initWithDisks:(id)a3
{
  id v5;
  SKFilesystemMaintainer *v6;
  SKFilesystemMaintainer *v7;
  uint64_t v8;
  SKProgress *progress;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SKFilesystemMaintainer;
  v6 = -[SKFilesystemMaintainer init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_disks, a3);
    v8 = objc_claimAutoreleasedReturnValue(+[SKProgress progressWithTotalUnitCount:](SKProgress, "progressWithTotalUnitCount:", 100));
    progress = v7->_progress;
    v7->_progress = (SKProgress *)v8;

  }
  return v7;
}

- (FSClient)client
{
  FSClient *client;
  SKFilesystemMaintainer *v4;
  FSClient *v5;
  FSClient *v6;

  client = self->_client;
  if (!client)
  {
    v4 = self;
    objc_sync_enter(v4);
    if (!self->_client)
    {
      v5 = objc_opt_new(FSClient);
      v6 = self->_client;
      self->_client = v5;

    }
    objc_sync_exit(v4);

    client = self->_client;
  }
  return client;
}

- (id)createReceiverUsingFSKit:(id)a3 opts:(id)a4 taskGroup:(id)a5 writable:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  NSObject *v11;
  SKFSTaskPair *v12;
  SKFSTaskMessageHandler *v13;
  void *v14;
  SKFSTaskMessageHandler *v15;
  SKFSTaskPair *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  SKFSTaskPair *v24;
  id v25;
  NSObject *v26;
  SKFSTaskPair *v27;
  NSObject *v29;
  void *v30;
  id v31;
  _QWORD v32[4];
  SKFSTaskPair *v33;
  SKFilesystemMaintainer *v34;
  id v35;
  NSObject *v36;

  v6 = a6;
  v10 = a3;
  v11 = a5;
  v31 = a4;
  v12 = [SKFSTaskPair alloc];
  v13 = [SKFSTaskMessageHandler alloc];
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystemMaintainer progress](self, "progress"));
  v15 = -[SKFSTaskMessageHandler initWithProgress:dispatchGroup:](v13, "initWithProgress:dispatchGroup:", v14, v11);
  v16 = -[SKFSTaskPair initWithMessageHandler:](v12, "initWithMessageHandler:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "diskIdentifier"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[FSBlockDeviceResource proxyResourceForBSDName:writable:](FSBlockDeviceResource, "proxyResourceForBSDName:writable:", v17, v6));

  dispatch_group_enter(v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystemMaintainer client](self, "client"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "filesystem"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bundle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bundleIdentifier"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SKFSTaskPair receiver](v16, "receiver"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "getConnection"));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100024BEC;
  v32[3] = &unk_100045760;
  v24 = v16;
  v33 = v24;
  v34 = self;
  v35 = v10;
  v36 = v11;
  v29 = v11;
  v25 = v10;
  objc_msgSend(v18, "checkResource:usingBundle:options:connection:replyHandler:", v30, v21, v31, v23, v32);

  v26 = v36;
  v27 = v24;

  return v27;
}

- (BOOL)runMaintenanceOperationWithArgsCreator:(id)a3 error:(id *)a4
{
  uint64_t (**v5)(id, void *, id *);
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSMutableArray *v11;
  unsigned __int8 v12;
  void *v13;
  NSMutableArray *v14;
  void *v15;
  id v16;
  SKFilesystemMaintainer *v17;
  uint64_t v18;
  void *v19;
  SKWaitableAggregate *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  void *i;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  SKWaitableAggregate *v41;
  SKTaskExecuter *v42;
  SKFSTaskPairsWaiter *v43;
  void *v44;
  SKWaitableAggregate *v45;
  SKWaitableAggregate *v46;
  NSMutableArray *v47;
  void *v48;
  SKWaitableAggregate *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  NSObject *v56;
  NSMutableArray *v58;
  SKFilesystemMaintainer *v59;
  uint64_t (**v60)(id, void *, id *);
  NSMutableArray *v61;
  dispatch_group_t v62;
  SKWaitableAggregate *v63;
  unsigned int v64;
  uint64_t v65;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[2];
  uint8_t v72[128];
  uint8_t buf[4];
  const char *v74;
  __int16 v75;
  void *v76;

  v5 = (uint64_t (**)(id, void *, id *))a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystemMaintainer disks](self, "disks"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_1000457A0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filteredArrayUsingPredicate:", v7));

  if (objc_msgSend(v8, "count"))
  {
    v9 = sub_10000BA9C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v74 = "-[SKFilesystemMaintainer runMaintenanceOperationWithArgsCreator:error:]";
      v75 = 2112;
      v76 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s: Cannot run maintenance operation on disks without filesystem, %@", buf, 0x16u);
    }

    v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:disks:userInfo:](SKError, "errorWithCode:disks:userInfo:", 117, v8, 0));
    v12 = +[SKError failWithError:error:](SKError, "failWithError:error:", v11, a4);
    goto LABEL_28;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystemMaintainer progress](self, "progress"));
  objc_msgSend(v13, "setCompletedUnitCount:", 0);

  v58 = objc_opt_new(NSMutableArray);
  v14 = objc_opt_new(NSMutableArray);
  v62 = dispatch_group_create();
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystemMaintainer disks](self, "disks"));
  v16 = objc_msgSend(v15, "count");

  if (!v16)
  {
LABEL_18:
    v41 = [SKWaitableAggregate alloc];
    v11 = v58;
    v42 = -[SKTaskExecuter initWithTasks:]([SKTaskExecuter alloc], "initWithTasks:", v58);
    v71[0] = v42;
    v43 = -[SKFSTaskPairsWaiter initWithTaskPairs:]([SKFSTaskPairsWaiter alloc], "initWithTaskPairs:", v14);
    v71[1] = v43;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v71, 2));
    v45 = -[SKWaitableAggregate initWithWaitables:](v41, "initWithWaitables:", v44);

    v12 = -[SKWaitableAggregate waitWithError:](v45, "waitWithError:", a4);
    goto LABEL_27;
  }
  v17 = self;
  v18 = 0;
  v60 = v5;
  v61 = v14;
  v59 = self;
  while (1)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystemMaintainer disks](v17, "disks"));
    v20 = (SKWaitableAggregate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", v18));

    v21 = v5[2](v5, v20, a4);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    if (!v22)
    {
      v46 = v20;
      v12 = 0;
LABEL_23:

      v11 = v58;
      v45 = v46;
      goto LABEL_27;
    }
    v65 = v18;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SKWaitableAggregate filesystem](v20, "filesystem"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "repairArgs"));
    v64 = objc_msgSend(v22, "containsObject:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[SKWaitableAggregate filesystem](v20, "filesystem"));
    LODWORD(v24) = objc_msgSend(v25, "isExtension");

    if (!(_DWORD)v24)
    {
      v47 = objc_opt_new(NSMutableArray);
      -[NSMutableArray addObjectsFromArray:](v47, "addObjectsFromArray:", v22);
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[SKWaitableAggregate filesystem](v20, "filesystem"));
      v49 = v20;
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "xmlOutputArg"));

      if (v50)
      {
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[SKWaitableAggregate filesystem](v49, "filesystem"));
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "xmlOutputArg"));
        -[NSMutableArray addObject:](v47, "addObject:", v52);

      }
      v46 = v49;
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[SKWaitableAggregate diskIdentifier](v49, "diskIdentifier"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/dev/%@"), v53));
      -[NSMutableArray addObject:](v47, "addObject:", v54);

      v12 = +[SKError failWithPOSIXCode:error:](SKError, "failWithPOSIXCode:error:", 45, a4);
      goto LABEL_23;
    }
    v63 = v20;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[SKWaitableAggregate filesystem](v20, "filesystem"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bundle"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bundleIdentifier"));
    v29 = sub_1000240D8(v28, 0, a4);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

    if (!v30)
      break;
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v31 = v22;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v33; i = (char *)i + 1)
        {
          if (*(_QWORD *)v68 != v34)
            objc_enumerationMutation(v31);
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)i), "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_100046738));
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[FSTaskOption optionWithoutValue:](FSTaskOption, "optionWithoutValue:", v36));
          objc_msgSend(v30, "addOption:", v37);

        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
      }
      while (v33);
    }

    v17 = v59;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystemMaintainer createReceiverUsingFSKit:opts:taskGroup:writable:](v59, "createReceiverUsingFSKit:opts:taskGroup:writable:", v63, v30, v62, -[SKWaitableAggregate isWritable](v63, "isWritable") | v64));
    v14 = v61;
    -[NSMutableArray addObject:](v61, "addObject:", v38);

    v18 = v65 + 1;
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystemMaintainer disks](v59, "disks"));
    v40 = objc_msgSend(v39, "count");

    v5 = v60;
    if (v65 + 1 >= (unint64_t)v40)
      goto LABEL_18;
  }
  v55 = sub_10000BA9C();
  v56 = objc_claimAutoreleasedReturnValue(v55);
  v11 = v58;
  v14 = v61;
  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v74 = "-[SKFilesystemMaintainer runMaintenanceOperationWithArgsCreator:error:]";
    _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "%s: Failed to create bundle options", buf, 0xCu);
  }

  v12 = 0;
  v45 = v63;
LABEL_27:

LABEL_28:
  return v12;
}

- (BOOL)verifyWithError:(id *)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;

  v5 = sub_10000BA9C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystemMaintainer disks](self, "disks"));
    *(_DWORD *)buf = 136315394;
    v19 = "-[SKFilesystemMaintainer verifyWithError:]";
    v20 = 2112;
    v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Started verify on %@", buf, 0x16u);

  }
  v17 = 0;
  v8 = -[SKFilesystemMaintainer runMaintenanceOperationWithArgsCreator:error:](self, "runMaintenanceOperationWithArgsCreator:error:", &stru_1000457E0, &v17);
  v9 = v17;
  v10 = sub_10000BA9C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if ((v8 & 1) != 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystemMaintainer disks](self, "disks"));
      *(_DWORD *)buf = 136315394;
      v19 = "-[SKFilesystemMaintainer verifyWithError:]";
      v20 = 2112;
      v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Finished verify on %@", buf, 0x16u);

    }
    v14 = 1;
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystemMaintainer disks](self, "disks"));
      *(_DWORD *)buf = 136315394;
      v19 = "-[SKFilesystemMaintainer verifyWithError:]";
      v20 = 2112;
      v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s: Failed to verify disk(s) %@", buf, 0x16u);

    }
    v12 = objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:underlyingError:](SKError, "errorWithCode:underlyingError:", 350, v9));
    v14 = +[SKError failWithError:error:](SKError, "failWithError:error:", v12, a3);
  }

  return v14;
}

- (BOOL)repairWithError:(id *)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  unsigned __int8 v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  NSObject *v27;
  id v29;
  NSObject *obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint8_t v39[128];
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  void *v43;

  v4 = sub_10000BA9C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystemMaintainer disks](self, "disks"));
    *(_DWORD *)buf = 136315394;
    v41 = "-[SKFilesystemMaintainer repairWithError:]";
    v42 = 2112;
    v43 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Started repair on %@", buf, 0x16u);

  }
  v36 = 0;
  v7 = -[SKFilesystemMaintainer runMaintenanceOperationWithArgsCreator:error:](self, "runMaintenanceOperationWithArgsCreator:error:", &stru_100045800, &v36);
  v8 = v36;
  v9 = v8;
  if ((v7 & 1) != 0)
  {
    v29 = v8;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = objc_claimAutoreleasedReturnValue(-[SKFilesystemMaintainer disks](self, "disks"));
    v10 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v33;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v33 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[SKManager syncSharedManager](SKManager, "syncSharedManager"));
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "diskIdentifier"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "diskForString:", v16));

          v37 = kSKDiskMountOptionRestore;
          v38 = &__kCFBooleanTrue;
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
          LOBYTE(v16) = objc_msgSend(v17, "mountWithOptionsDictionary:error:", v18, a3);

          if ((v16 & 1) == 0)
          {
            v26 = sub_10000BA9C();
            v27 = objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v41 = "-[SKFilesystemMaintainer repairWithError:]";
              v42 = 2112;
              v43 = v17;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s: Failed to remount disk %@ after repair", buf, 0x16u);
            }

            v22 = 0;
            v9 = v29;
            v20 = obj;
            goto LABEL_21;
          }

        }
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
        if (v11)
          continue;
        break;
      }
    }

    v19 = sub_10000BA9C();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystemMaintainer disks](self, "disks"));
      *(_DWORD *)buf = 136315394;
      v41 = "-[SKFilesystemMaintainer repairWithError:]";
      v42 = 2112;
      v43 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s: Finished repair on %@", buf, 0x16u);

    }
    v22 = 1;
    v9 = v29;
  }
  else
  {
    v23 = sub_10000BA9C();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystemMaintainer disks](self, "disks"));
      *(_DWORD *)buf = 136315394;
      v41 = "-[SKFilesystemMaintainer repairWithError:]";
      v42 = 2112;
      v43 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s: Failed to repair disk(s) %@", buf, 0x16u);

    }
    v20 = objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:underlyingError:](SKError, "errorWithCode:underlyingError:", 351, v9));
    v22 = +[SKError failWithError:error:](SKError, "failWithError:error:", v20, a3);
  }
LABEL_21:

  return v22;
}

- (NSArray)disks
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (SKProgress)progress
{
  return (SKProgress *)objc_getProperty(self, a2, 24, 1);
}

- (void)setProgress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_disks, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end
