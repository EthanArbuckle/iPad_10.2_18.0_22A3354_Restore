@implementation SKFilesystemCreator

- (SKFilesystemCreator)init
{
  SKFilesystemCreator *v2;
  uint64_t v3;
  SKProgress *progress;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKFilesystemCreator;
  v2 = -[SKFilesystemCreator init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[SKProgress progressWithTotalUnitCount:](SKProgress, "progressWithTotalUnitCount:", 100));
    progress = v2->_progress;
    v2->_progress = (SKProgress *)v3;

  }
  return v2;
}

- (BOOL)setupTaskUpdateHandlerWithClient:(id)a3 taskPairs:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  dispatch_semaphore_t v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v9 = dispatch_semaphore_create(0);
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = sub_1000233B8;
    v23 = sub_1000233C8;
    v24 = 0;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10002608C;
    v17[3] = &unk_100045848;
    v18 = v8;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100026474;
    v14[3] = &unk_100045870;
    v16 = &v19;
    v10 = v9;
    v15 = v10;
    objc_msgSend(v7, "setTaskUpdateHandler:replyHandler:", v17, v14);
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    v11 = (void *)v20[5];
    v12 = v11 == 0;
    if (a5 && v11)
      *a5 = objc_retainAutorelease(v11);

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (BOOL)createWithVolumes:(id)a3 error:(id *)a4
{
  id v4;
  NSObject *v5;
  FSClient *v6;
  void *i;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  SKFSTaskPair *v13;
  SKFSTaskMessageHandler *v14;
  void *v15;
  SKFSTaskMessageHandler *v16;
  SKFSTaskPair *v17;
  NSMutableArray *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  FSClient *v44;
  FSClient *v45;
  FSClient *v46;
  SKRemoteAPFSFormatTask *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  SKTaskLineParser *v55;
  SKTaskLineParser *v56;
  SKTaskLineParser *v57;
  SKTaskLineParser *v58;
  SKWaitableAggregate *v59;
  SKFSTaskPairsWaiter *v60;
  void *v61;
  SKWaitableAggregate *v62;
  SKRemoteTaskExecuter *v63;
  NSObject *v64;
  id v65;
  NSObject *v66;
  NSObject *p_super;
  void *v68;
  id v69;
  id v70;
  SKWaitableAggregate *v72;
  NSMutableArray *v74;
  NSMutableArray *v75;
  SKFSTaskPair *v76;
  void *v77;
  uint64_t v78;
  id v79;
  NSObject *group;
  SKWaitableAggregate *obj;
  SKRemoteAPFSFormatTask *v83;
  id v84;
  _QWORD v85[5];
  _QWORD v86[5];
  _QWORD v87[4];
  SKFSTaskPair *v88;
  FSClient *v89;
  SKFilesystemCreator *v90;
  SKWaitableAggregate *v91;
  void *v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  uint8_t buf[4];
  const char *v98;
  __int16 v99;
  SKWaitableAggregate *v100;
  __int16 v101;
  int v102;
  _QWORD v103[2];
  _BYTE v104[128];

  v72 = (SKWaitableAggregate *)a3;
  v74 = objc_opt_new(NSMutableArray);
  v75 = objc_opt_new(NSMutableArray);
  v4 = sub_10000BA9C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v98 = "-[SKFilesystemCreator createWithVolumes:error:]";
    v99 = 2112;
    v100 = v72;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Creating volumes %@", buf, 0x16u);
  }

  v6 = objc_opt_new(FSClient);
  group = dispatch_group_create();
  if (-[SKFilesystemCreator setupTaskUpdateHandlerWithClient:taskPairs:error:](self, "setupTaskUpdateHandlerWithClient:taskPairs:error:", v6, v75, a4))
  {
    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    obj = v72;
    v79 = -[SKWaitableAggregate countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v93, v104, 16);
    if (v79)
    {
      v78 = *(_QWORD *)v94;
      while (2)
      {
        for (i = 0; i != v79; i = (char *)i + 1)
        {
          if (*(_QWORD *)v94 != v78)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * (_QWORD)i);
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filesystem", v72));
          v10 = objc_msgSend(v9, "isExtension");

          if (v10)
          {
            if (!v6)
            {
              v69 = sub_10000BA9C();
              p_super = objc_claimAutoreleasedReturnValue(v69);
              if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315138;
                v98 = "-[SKFilesystemCreator createWithVolumes:error:]";
                _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_ERROR, "%s: Cannot create FSClient object for extension erase", buf, 0xCu);
              }
              LOBYTE(v63) = 0;
              goto LABEL_34;
            }
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "disk"));
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "diskIdentifier"));
            v83 = (SKRemoteAPFSFormatTask *)objc_claimAutoreleasedReturnValue(+[FSBlockDeviceResource proxyResourceForBSDName:writable:](FSBlockDeviceResource, "proxyResourceForBSDName:writable:", v12, 1));

            v13 = [SKFSTaskPair alloc];
            v14 = [SKFSTaskMessageHandler alloc];
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystemCreator progress](self, "progress"));
            v16 = -[SKFSTaskMessageHandler initWithProgress:dispatchGroup:](v14, "initWithProgress:dispatchGroup:", v15, group);
            v17 = -[SKFSTaskPair initWithMessageHandler:](v13, "initWithMessageHandler:", v16);

            v18 = v75;
            objc_sync_enter(v18);
            -[NSMutableArray addObject:](v18, "addObject:", v17);
            objc_sync_exit(v18);

            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filesystem"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bundle"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bundleIdentifier"));
            v22 = sub_1000240D8(v21, 1, a4);
            v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

            if (!v23)
            {
              v70 = sub_10000BA9C();
              v63 = (SKRemoteTaskExecuter *)objc_claimAutoreleasedReturnValue(v70);
              if (os_log_type_enabled(&v63->super, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315138;
                v98 = "-[SKFilesystemCreator createWithVolumes:error:]";
                _os_log_impl((void *)&_mh_execute_header, &v63->super, OS_LOG_TYPE_ERROR, "%s: Failed to create bundle options", buf, 0xCu);
              }

              LOBYTE(v63) = 0;
              p_super = &v83->super;
              goto LABEL_34;
            }
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(+[FSTaskOption option:value:](FSTaskOption, "option:value:", CFSTR("v"), v24));
            objc_msgSend(v23, "addOption:", v25);

            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filesystem"));
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "majorType"));
            LODWORD(v25) = objc_msgSend(v27, "isEqualToString:", CFSTR("apfs"));

            if ((_DWORD)v25)
            {
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filesystem"));
              v29 = objc_msgSend(v28, "isCaseSensitive") ? CFSTR("e") : CFSTR("i");
              v30 = (void *)objc_claimAutoreleasedReturnValue(+[FSTaskOption optionWithoutValue:](FSTaskOption, "optionWithoutValue:", v29));
              objc_msgSend(v23, "addOption:", v30);

              v31 = (void *)objc_claimAutoreleasedReturnValue(+[FSTaskOption optionWithoutValue:](FSTaskOption, "optionWithoutValue:", CFSTR("w")));
              objc_msgSend(v23, "addOption:", v31);

              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filesystem"));
              LODWORD(v30) = objc_msgSend(v32, "isEncrypted");

              if ((_DWORD)v30)
              {
                v33 = (void *)objc_claimAutoreleasedReturnValue(+[FSTaskOption optionWithoutValue:](FSTaskOption, "optionWithoutValue:", CFSTR("E")));
                objc_msgSend(v23, "addOption:", v33);

                v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "password"));
                v35 = (void *)objc_claimAutoreleasedReturnValue(+[FSTaskOption option:value:](FSTaskOption, "option:value:", CFSTR("S"), v34));
                objc_msgSend(v23, "addOption:", v35);

              }
            }
            dispatch_group_enter(group);
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filesystem"));
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "bundle"));
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "bundleIdentifier"));
            v39 = (void *)objc_claimAutoreleasedReturnValue(-[SKFSTaskPair receiver](v17, "receiver"));
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "getConnection"));
            v87[0] = _NSConcreteStackBlock;
            v87[1] = 3221225472;
            v87[2] = sub_100026F64;
            v87[3] = &unk_1000458D8;
            v88 = v17;
            v77 = v37;
            v41 = v36;
            v42 = v23;
            v43 = i;
            v44 = v6;
            v45 = v6;
            v89 = v45;
            v90 = self;
            v91 = obj;
            v92 = v8;
            v76 = v17;
            v46 = v45;
            v6 = v44;
            i = v43;
            -[FSClient formatResource:usingBundle:options:connection:replyHandler:](v46, "formatResource:usingBundle:options:connection:replyHandler:", v83, v38, v42, v40, v87);

          }
          else
          {
            v47 = [SKRemoteAPFSFormatTask alloc];
            v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
            v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "disk"));
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filesystem"));
            v51 = objc_msgSend(v50, "isCaseSensitive");
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "password"));
            v83 = -[SKRemoteAPFSFormatTask initWithName:disk:caseSensitive:password:](v47, "initWithName:disk:caseSensitive:password:", v48, v49, v51, v52);

            v53 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystemCreator progress](self, "progress"));
            v54 = (void *)objc_claimAutoreleasedReturnValue(-[SKRemoteAPFSFormatTask progress](v83, "progress"));
            objc_msgSend(v53, "addChild:withPendingUnitCount:", v54, 0x64 / (unint64_t)-[SKWaitableAggregate count](obj, "count"));

            v55 = [SKTaskLineParser alloc];
            v86[0] = _NSConcreteStackBlock;
            v86[1] = 3221225472;
            v86[2] = sub_1000272DC;
            v86[3] = &unk_100045900;
            v86[4] = self;
            v56 = -[SKTaskLineParser initWithCallback:](v55, "initWithCallback:", v86);
            -[SKRemoteAPFSFormatTask setStdoutParser:](v83, "setStdoutParser:", v56);

            v57 = [SKTaskLineParser alloc];
            v85[0] = _NSConcreteStackBlock;
            v85[1] = 3221225472;
            v85[2] = sub_100027330;
            v85[3] = &unk_100045900;
            v85[4] = self;
            v58 = -[SKTaskLineParser initWithCallback:](v57, "initWithCallback:", v85);
            -[SKRemoteAPFSFormatTask setStderrParser:](v83, "setStderrParser:", v58);

            -[NSMutableArray addObject:](v74, "addObject:", v83);
          }

        }
        v79 = -[SKWaitableAggregate countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v93, v104, 16);
        if (v79)
          continue;
        break;
      }
    }

    v59 = [SKWaitableAggregate alloc];
    v63 = -[SKRemoteTaskExecuter initWithTasks:]([SKRemoteTaskExecuter alloc], "initWithTasks:", v74);
    v103[0] = v63;
    v60 = -[SKFSTaskPairsWaiter initWithTaskPairs:]([SKFSTaskPairsWaiter alloc], "initWithTaskPairs:", v75);
    v103[1] = v60;
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v103, 2));
    v62 = -[SKWaitableAggregate initWithWaitables:](v59, "initWithWaitables:", v61);

    v84 = 0;
    LODWORD(v63) = -[SKWaitableAggregate waitWithError:](v62, "waitWithError:", &v84);
    v64 = v84;
    v65 = sub_10000BA9C();
    v66 = objc_claimAutoreleasedReturnValue(v65);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v98 = "-[SKFilesystemCreator createWithVolumes:error:]";
      v99 = 2112;
      v100 = obj;
      v101 = 1024;
      v102 = (int)v63;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "%s: Finished creating volumes %@, status %hhd", buf, 0x1Cu);
    }

    -[FSClient setTaskUpdateHandler:replyHandler:](v6, "setTaskUpdateHandler:replyHandler:", 0, 0);
    p_super = v64;
    if (v64)
    {
      v68 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:underlyingError:](SKError, "errorWithCode:underlyingError:", 352, v64));
      LOBYTE(v63) = +[SKError failWithError:error:](SKError, "failWithError:error:", v68, a4);

      obj = v62;
      p_super = v64;
    }
    else
    {
      obj = v62;
    }
LABEL_34:

  }
  else
  {
    LOBYTE(v63) = 0;
  }

  return (char)v63;
}

- (SKProgress)progress
{
  return (SKProgress *)objc_getProperty(self, a2, 8, 1);
}

- (void)setProgress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
}

@end
