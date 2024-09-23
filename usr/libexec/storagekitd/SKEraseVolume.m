@implementation SKEraseVolume

- (id)syncDiskFromDaemon:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allDisks"));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100012D28;
  v15[3] = &unk_100045188;
  v8 = v5;
  v16 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v15));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filteredArrayUsingPredicate:", v9));

  if (objc_msgSend(v10, "count") == (id)1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
  }
  else
  {
    v17 = v8;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:disks:userInfo:](SKError, "errorWithCode:disks:userInfo:", 300, v12, 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SKError nilWithError:error:](SKError, "nilWithError:error:", v13, a4));

  }
  return v11;
}

- (BOOL)requiresEraseDiskForAPFS
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SKBaseManager sharedManager](SKBaseManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume disk](self, "disk"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "wholeDiskForDisk:", v4));

  if (objc_msgSend(v5, "canPartitionDisk"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "type"));
    v7 = objc_msgSend(v6, "isEqualToString:", kSKDiskTypeGPTWholeDisk) ^ 1;

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

+ (void)reProbeWithDisk:(id)a3 isEncrypted:(BOOL)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  SKDiskNotificationWaiter *v13;
  void *v14;
  SKDiskNotificationWaiter *v15;
  id v16;
  unsigned int v17;
  id v18;
  NSObject *v19;
  dispatch_time_t v20;
  _BOOL4 v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  unsigned __int8 v28;
  id v29;
  NSObject *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;

  v5 = a3;
  v6 = objc_opt_class(SKAPFSStoreDisk);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "container"));
    v5 = v7;
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "container"));
      v10 = objc_msgSend(v9, "isLiveFSAPFSDisk");

      v5 = v7;
      if (v10)
      {
        v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "container"));

      }
    }

  }
  if ((objc_msgSend(v5, "isLiveFSAPFSDisk") & 1) != 0
    || (v26 = objc_opt_class(SKAPFSStoreDisk), (objc_opt_isKindOfClass(v5, v26) & 1) == 0)
    && (v27 = objc_opt_class(SKAPFSDisk), (objc_opt_isKindOfClass(v5, v27) & 1) == 0))
  {
    if (!objc_msgSend(v5, "isLiveFSAPFSDisk") || a4)
    {
      v33 = 0;
      v28 = objc_msgSend(v5, "reProbeWithError:", &v33);
      v18 = v33;
      if ((v28 & 1) != 0)
        goto LABEL_25;
      v29 = sub_10000BA9C();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v36 = "+[SKEraseVolume(Daemon) reProbeWithDisk:isEncrypted:]";
        v37 = 2112;
        v38 = v5;
        v39 = 2112;
        v40 = v18;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s: Failed to reProbe %@, %@", buf, 0x20u);
      }
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "disksNotificationsWaiters"));

      v13 = [SKDiskNotificationWaiter alloc];
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "diskIdentifier"));
      v15 = -[SKDiskNotificationWaiter initWithDiskIdentifier:](v13, "initWithDiskIdentifier:", v14);

      v16 = v12;
      objc_sync_enter(v16);
      objc_msgSend(v16, "addObject:", v15);
      objc_sync_exit(v16);

      v34 = 0;
      v17 = objc_msgSend(v5, "reProbeWithError:", &v34);
      v18 = v34;
      if (v17)
      {
        v19 = objc_claimAutoreleasedReturnValue(-[SKDiskNotificationWaiter semaphore](v15, "semaphore"));
        v20 = dispatch_time(0, 30000000000);
        v21 = dispatch_semaphore_wait(v19, v20) == 0;

        v22 = sub_10000BA9C();
        v23 = objc_claimAutoreleasedReturnValue(v22);
        v24 = v23;
        if (v21)
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "diskIdentifier"));
            *(_DWORD *)buf = 136315394;
            v36 = "+[SKEraseVolume(Daemon) reProbeWithDisk:isEncrypted:]";
            v37 = 2112;
            v38 = v32;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s: Received disk notification for %@", buf, 0x16u);

          }
        }
        else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "diskIdentifier"));
          *(_DWORD *)buf = 136315394;
          v36 = "+[SKEraseVolume(Daemon) reProbeWithDisk:isEncrypted:]";
          v37 = 2112;
          v38 = v25;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s: Timeout waiting for notification about %@", buf, 0x16u);

        }
      }
      else
      {
        v31 = sub_10000BA9C();
        v24 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v36 = "+[SKEraseVolume(Daemon) reProbeWithDisk:isEncrypted:]";
          v37 = 2112;
          v38 = v5;
          v39 = 2112;
          v40 = v18;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s: Failed to reProbe %@ (LiveFS), %@", buf, 0x20u);
        }
      }

      v30 = v16;
      objc_sync_enter(v30);
      -[NSObject removeObject:](v30, "removeObject:", v15);
      objc_sync_exit(v30);

    }
    goto LABEL_25;
  }
  v18 = 0;
LABEL_25:

}

- (id)createStateMachineWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  _QWORD *v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
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
  unsigned __int8 v44;
  const __CFString *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  char isKindOfClass;
  void *v52;
  void *v53;
  void *v54;
  unsigned int v55;
  void *v56;
  unsigned int v57;
  const __CFString *v58;
  SKStateTransitionEntry *v59;
  SKStateTransitionEntry *v60;
  SKStateTransitionEntry *v61;
  SKStateTransitionEntry *v62;
  SKStateTransitionEntry *v63;
  id v64;
  SKStateTransitionEntry *v65;
  SKStateTransitionEntry *v66;
  SKStateTransitionEntry *v67;
  SKStateTransitionEntry *v68;
  SKStateTransitionEntry *v69;
  void *v70;
  SKStateTransitionEntry *v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  const __CFString *v83;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  const __CFString *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  _QWORD *v97;
  _QWORD *v98;
  _QWORD *v99;
  _QWORD *v100;
  _QWORD *v101;
  _QWORD *v102;
  _QWORD v103[5];
  __CFString *v104;
  id v105;
  _QWORD v106[5];
  __CFString *v107;
  _QWORD v108[5];
  __CFString *v109;
  _QWORD v110[5];
  __CFString *v111;
  _QWORD v112[5];
  __CFString *v113;
  _QWORD v114[5];
  __CFString *v115;
  _QWORD v116[14];
  uint8_t buf[4];
  const char *v118;
  void *v119;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume disk](self, "disk"));

  if (v5)
    goto LABEL_3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume diskRepresentation](self, "diskRepresentation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "knownDiskForDictionary:", v7));
  -[SKEraseVolume setDisk:](self, "setDisk:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume disk](self, "disk"));
  if (v9)
  {
LABEL_3:
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume validateWithError:](self, "validateWithError:", a3));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume descriptor](self, "descriptor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "filesystem"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume descriptor](self, "descriptor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
      v15 = objc_msgSend(v12, "isValidName:error:", v14, a3);

      if (v15)
      {
        v114[0] = _NSConcreteStackBlock;
        v114[1] = 3221225472;
        v114[2] = sub_100013CE4;
        v114[3] = &unk_100044C68;
        v114[4] = self;
        v115 = CFSTR("probeFinishedEvent");
        v16 = objc_retainBlock(v114);
        v112[0] = _NSConcreteStackBlock;
        v112[1] = 3221225472;
        v112[2] = sub_100013E60;
        v112[3] = &unk_100044C68;
        v112[4] = self;
        v113 = CFSTR("umountFinishedEvent");
        v102 = objc_retainBlock(v112);
        v110[0] = _NSConcreteStackBlock;
        v110[1] = 3221225472;
        v110[2] = sub_100013FF8;
        v110[3] = &unk_100044C68;
        v110[4] = self;
        v111 = CFSTR("volumeDeletedEvent");
        v101 = objc_retainBlock(v110);
        v108[0] = _NSConcreteStackBlock;
        v108[1] = 3221225472;
        v108[2] = sub_100014280;
        v108[3] = &unk_100044C68;
        v108[4] = self;
        v109 = CFSTR("newfsFinishedEvent");
        v17 = objc_retainBlock(v108);
        v106[0] = _NSConcreteStackBlock;
        v106[1] = 3221225472;
        v106[2] = sub_1000143CC;
        v106[3] = &unk_100044C68;
        v106[4] = self;
        v107 = CFSTR("rePartitionedEvent");
        v100 = objc_retainBlock(v106);
        v103[0] = _NSConcreteStackBlock;
        v103[1] = 3221225472;
        v103[2] = sub_1000145D8;
        v103[3] = &unk_1000451B0;
        v103[4] = self;
        v99 = v17;
        v104 = CFSTR("volumeCreatedEvent");
        v105 = v99;
        v98 = objc_retainBlock(v103);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume descriptor](self, "descriptor"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "filesystem"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "majorType"));
        if (objc_msgSend(v20, "isEqualToString:", CFSTR("apfs")))
        {
          v21 = -[SKEraseVolume requiresEraseDiskForAPFS](self, "requiresEraseDiskForAPFS");

          if (v21)
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[SKBaseManager sharedManager](SKBaseManager, "sharedManager"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume disk](self, "disk"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "wholeDiskForDisk:", v23));

            v25 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume descriptor](self, "descriptor"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(+[SKPartitionDescriptor descriptorWithVolume:](SKPartitionDescriptor, "descriptorWithVolume:", v25));
            v119 = v26;
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v119, 1));
            v28 = (void *)objc_claimAutoreleasedReturnValue(+[SKEraseDisk eraseDiskWithRootDisk:descriptors:error:](SKEraseDisk, "eraseDiskWithRootDisk:descriptors:error:", v24, v27, a3));

            if (v28)
            {
              v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "children"));
              v30 = v29;
              if (v29 && (unint64_t)-[NSObject count](v29, "count") >= 2)
              {
                v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectAtIndexedSubscript:](v30, "objectAtIndexedSubscript:", 0));
                -[SKEraseVolume setDisk:](self, "setDisk:", v31);

              }
              v32 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume progress](self, "progress"));
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "progress"));
              v34 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume progress](self, "progress"));
              objc_msgSend(v32, "chainChildProgress:withPendingUnitCount:", v33, objc_msgSend(v34, "totalUnitCount"));

              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "createStateMachineWithError:", a3));
            }
            else
            {
              v85 = sub_10000BA9C();
              v30 = objc_claimAutoreleasedReturnValue(v85);
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315138;
                v118 = "-[SKEraseVolume(Daemon) createStateMachineWithError:]";
                _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s: Failed to create eraser for unsupported partition scheme change", buf, 0xCu);
              }
              v35 = 0;
            }
            goto LABEL_34;
          }
        }
        else
        {

        }
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume disk](self, "disk"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "filesystem"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "majorType"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume descriptor](self, "descriptor"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "filesystem"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "majorType"));
        v44 = objc_msgSend(v40, "isEqualToString:", v43);

        if ((v44 & 1) != 0)
          goto LABEL_16;
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume descriptor](self, "descriptor"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "filesystem"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "majorType"));
        if ((objc_msgSend(v48, "isEqualToString:", CFSTR("apfs")) & 1) != 0)
        {
          v49 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume disk](self, "disk"));
          v50 = objc_opt_class(SKAPFSStoreDisk);
          isKindOfClass = objc_opt_isKindOfClass(v49, v50);

          if ((isKindOfClass & 1) != 0)
          {
LABEL_16:
            v45 = CFSTR("eraseToSameFSEvent");
            goto LABEL_24;
          }
        }
        else
        {

        }
        v52 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume descriptor](self, "descriptor"));
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "filesystem"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "majorType"));
        v55 = objc_msgSend(v54, "isEqualToString:", CFSTR("apfs"));

        if (v55)
          v45 = CFSTR("eraseToAPFSEvent");
        else
          v45 = CFSTR("eraseTodifferentFSEvent");
LABEL_24:
        v56 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume disk](self, "disk"));
        v57 = objc_msgSend(v56, "canPartitionDisk");

        if (v57)
          v58 = CFSTR("rePartitionedEvent");
        else
          v58 = v45;
        v90 = v58;
        v59 = sub_10000A200((uint64_t)CFSTR("nonAPFSDiskState"), (uint64_t)CFSTR("eraseToSameFSEvent"), (uint64_t)v99, (uint64_t)CFSTR("nonAPFSDiskState"));
        v96 = objc_claimAutoreleasedReturnValue(v59);
        v116[0] = v96;
        v60 = sub_10000A200((uint64_t)CFSTR("nonAPFSDiskState"), (uint64_t)CFSTR("newfsFinishedEvent"), (uint64_t)v16, (uint64_t)CFSTR("nonAPFSDiskState"));
        v95 = objc_claimAutoreleasedReturnValue(v60);
        v116[1] = v95;
        v61 = sub_10000A200((uint64_t)CFSTR("nonAPFSDiskState"), (uint64_t)CFSTR("probeFinishedEvent"), (uint64_t)v102, (uint64_t)CFSTR("nonAPFSDiskState"));
        v94 = objc_claimAutoreleasedReturnValue(v61);
        v116[2] = v94;
        v62 = sub_10000A200((uint64_t)CFSTR("nonAPFSDiskState"), (uint64_t)CFSTR("eraseTodifferentFSEvent"), (uint64_t)v100, (uint64_t)CFSTR("nonAPFSDiskState"));
        v93 = (void *)objc_claimAutoreleasedReturnValue(v62);
        v116[3] = v93;
        v63 = sub_10000A200((uint64_t)CFSTR("nonAPFSDiskState"), (uint64_t)CFSTR("rePartitionedEvent"), (uint64_t)v99, (uint64_t)CFSTR("nonAPFSDiskState"));
        v92 = (void *)objc_claimAutoreleasedReturnValue(v63);
        v116[4] = v92;
        v64 = sub_10000A250((uint64_t)CFSTR("nonAPFSDiskState"), (uint64_t)CFSTR("umountFinishedEvent"));
        v91 = (void *)objc_claimAutoreleasedReturnValue(v64);
        v116[5] = v91;
        v65 = sub_10000A200((uint64_t)CFSTR("nonAPFSDiskState"), (uint64_t)CFSTR("eraseToAPFSEvent"), (uint64_t)v100, (uint64_t)CFSTR("APFSDiskState"));
        v89 = (void *)objc_claimAutoreleasedReturnValue(v65);
        v116[6] = v89;
        v66 = sub_10000A200((uint64_t)CFSTR("APFSDiskState"), (uint64_t)CFSTR("eraseTodifferentFSEvent"), (uint64_t)v101, (uint64_t)CFSTR("nonAPFSDiskState"));
        v88 = (void *)objc_claimAutoreleasedReturnValue(v66);
        v116[7] = v88;
        v67 = sub_10000A200((uint64_t)CFSTR("nonAPFSDiskState"), (uint64_t)CFSTR("volumeDeletedEvent"), (uint64_t)v100, (uint64_t)CFSTR("nonAPFSDiskState"));
        v87 = (void *)objc_claimAutoreleasedReturnValue(v67);
        v116[8] = v87;
        v68 = sub_10000A200((uint64_t)CFSTR("APFSDiskState"), (uint64_t)CFSTR("eraseToSameFSEvent"), (uint64_t)v98, (uint64_t)CFSTR("APFSDiskState"));
        v86 = (void *)objc_claimAutoreleasedReturnValue(v68);
        v116[9] = v86;
        v69 = sub_10000A200((uint64_t)CFSTR("APFSDiskState"), (uint64_t)CFSTR("rePartitionedEvent"), (uint64_t)v99, (uint64_t)CFSTR("APFSDiskState"));
        v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
        v116[10] = v70;
        v97 = v16;
        v71 = sub_10000A200((uint64_t)CFSTR("APFSDiskState"), (uint64_t)CFSTR("newfsFinishedEvent"), (uint64_t)v16, (uint64_t)CFSTR("APFSDiskState"));
        v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
        v116[11] = v72;
        v73 = sub_10000A250((uint64_t)CFSTR("APFSDiskState"), (uint64_t)CFSTR("volumeCreatedEvent"));
        v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
        v116[12] = v74;
        v75 = sub_10000A250((uint64_t)CFSTR("APFSDiskState"), (uint64_t)CFSTR("probeFinishedEvent"));
        v76 = (void *)objc_claimAutoreleasedReturnValue(v75);
        v116[13] = v76;
        v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v116, 14));
        v78 = (void *)objc_claimAutoreleasedReturnValue(+[SKStateTransitionTable tableWithTransitionEntries:](SKStateTransitionTable, "tableWithTransitionEntries:", v77));
        v79 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume disk](self, "disk"));
        v80 = objc_opt_class(SKAPFSDisk);
        if ((objc_opt_isKindOfClass(v79, v80) & 1) != 0)
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[SKStateMachine machineWithStateTransitionTable:startState:startEvent:](SKStateMachine, "machineWithStateTransitionTable:startState:startEvent:", v78, CFSTR("APFSDiskState"), v90));
        }
        else
        {
          v81 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume disk](self, "disk"));
          v82 = objc_opt_class(SKAPFSStoreDisk);
          if ((objc_opt_isKindOfClass(v81, v82) & 1) != 0)
            v83 = CFSTR("APFSDiskState");
          else
            v83 = CFSTR("nonAPFSDiskState");
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[SKStateMachine machineWithStateTransitionTable:startState:startEvent:](SKStateMachine, "machineWithStateTransitionTable:startState:startEvent:", v78, v83, v90, SKStateTransitionTable, v86, v87, v88, v89));

        }
        v24 = (void *)v96;
        v16 = v97;
        v30 = v94;
        v28 = (void *)v95;
LABEL_34:

        return v35;
      }
    }
    v35 = 0;
  }
  else
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume diskRepresentation](self, "diskRepresentation"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](SKError, "errorWithCode:userInfo:", 117, v36));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[SKError nilWithError:error:](SKError, "nilWithError:error:", v37, a3));

  }
  return v35;
}

@end
