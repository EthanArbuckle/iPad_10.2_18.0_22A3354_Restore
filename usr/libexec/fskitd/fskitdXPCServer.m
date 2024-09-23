@implementation fskitdXPCServer

- (id)initForEntitledClient:(BOOL)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)fskitdXPCServer;
  result = -[fskitdXPCServer init](&v5, "init");
  if (result)
    *((_BYTE *)result + 9) = a3;
  return result;
}

- (void)handleInvalidated
{
  fskitdXPCServer *v2;
  NSXPCConnection *ourConn;
  _BOOL4 hasTaskInterest;
  void *v5;
  fskitdXPCServer *v6;
  void *v7;

  v2 = self;
  objc_sync_enter(v2);
  ourConn = v2->_ourConn;
  v2->_ourConn = 0;

  hasTaskInterest = v2->_hasTaskInterest;
  objc_sync_exit(v2);

  if (hasTaskInterest)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "taskUpdateClients"));
    objc_sync_enter(v5);
    v6 = v2;
    objc_sync_enter(v6);
    if (v2->_hasTaskInterest)
    {
      v2->_hasTaskInterest = 0;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "taskUpdateClients"));
      objc_msgSend(v7, "removeObject:", v6);

    }
    objc_sync_exit(v6);

    objc_sync_exit(v5);
    objc_msgSend((id)qword_10005C720, "taskSetChanged");
  }
}

- (void)switchToFSKit:(id)a3
{
  void *v4;
  void (**v5)(id, _QWORD);
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  int v13;
  const char *v14;

  v4 = (void *)qword_10005C720;
  v5 = (void (**)(id, _QWORD))a3;
  objc_msgSend(v4, "startedWork");
  if (self->_clientHasEntitlement)
    v6 = objc_claimAutoreleasedReturnValue(+[FSKitConstants FSAllClientXPCProtocols](FSKitConstants, "FSAllClientXPCProtocols"));
  else
    v6 = objc_claimAutoreleasedReturnValue(+[FSKitConstants FSClientXPCProtocol](FSKitConstants, "FSClientXPCProtocol"));
  v7 = (void *)v6;
  -[NSXPCConnection setExportedInterface:](self->_ourConn, "setExportedInterface:", v6);

  v9 = fskit_std_log(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_clientHasEntitlement)
      v11 = "yes";
    else
      v11 = "no";
    v13 = 136315138;
    v14 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Hello FSClient! entitlement %s", (uint8_t *)&v13, 0xCu);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[FSKitConstants FSClientHostXPCProtocol](FSKitConstants, "FSClientHostXPCProtocol"));
  -[NSXPCConnection setRemoteObjectInterface:](self->_ourConn, "setRemoteObjectInterface:", v12);

  v5[2](v5, 0);
}

- (void)listMounts:(BOOL)a3 reply:(id)a4
{
  _BOOL8 v4;
  void *v5;
  void (**v6)(id, id);
  id v7;

  v4 = a3;
  v5 = (void *)qword_10005C720;
  v6 = (void (**)(id, id))a4;
  objc_msgSend(v5, "startedWork");
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C760, "list:", v4));
  v6[2](v6, v7);

}

- (void)LiveMounterReallyMountVolume:(id)a3 fileSystem:(id)a4 displayName:(id)a5 provider:(id)a6 domainError:(id)a7 on:(id)a8 how:(int)a9 options:(id)a10 auditToken:(id *)a11 reply:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void (**v22)(id, _QWORD);
  id v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  _BOOL4 v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  _BOOL4 v32;
  int v33;
  int v34;
  id v35;
  NSObject *v36;
  id v37;
  uint64_t v38;
  NSObject *v39;
  id *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  unsigned __int8 v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  int *v55;
  NSObject *v56;
  intptr_t v57;
  uint64_t v58;
  NSObject *v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  int v63;
  BOOL v64;
  BOOL v65;
  uint64_t v66;
  NSObject *v67;
  uint64_t v68;
  NSObject *v69;
  uint64_t v70;
  const char *v71;
  NSObject *v72;
  os_log_type_t v73;
  uint32_t v74;
  uint64_t v75;
  int AppBooleanValue;
  unsigned int v77;
  int v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  NSObject *v85;
  id v86;
  dispatch_semaphore_t v87;
  uint64_t v88;
  NSObject *v89;
  intptr_t v90;
  uint64_t v91;
  NSObject *v92;
  uint64_t v93;
  uint64_t v94;
  NSObject *v95;
  uint64_t v96;
  NSObject *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  NSObject *v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unsigned int v110;
  id v111;
  id v112;
  void *v113;
  id v114;
  _QWORD v115[4];
  NSObject *v116;
  _BYTE *v117;
  _QWORD v118[4];
  NSObject *v119;
  uint64_t *v120;
  id obj;
  Boolean keyExistsAndHasValidFormat;
  uint64_t v123;
  uint64_t *v124;
  uint64_t v125;
  uint64_t (*v126)(uint64_t, uint64_t);
  void (*v127)(uint64_t);
  id v128;
  uint8_t v129[4];
  uint64_t v130;
  __int16 v131;
  uint64_t v132;
  _BYTE buf[32];
  _BYTE v134[20];
  __int16 v135;
  int v136;

  v17 = a3;
  v112 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v111 = a10;
  v22 = (void (**)(id, _QWORD))a12;
  v123 = 0;
  v124 = &v123;
  v125 = 0x3032000000;
  v126 = sub_10001DC84;
  v127 = sub_10001DC94;
  v128 = 0;
  v23 = v17;
  keyExistsAndHasValidFormat = 0;
  v24 = livefs_std_log(v23);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  v110 = a9;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413570;
    *(_QWORD *)&buf[4] = v23;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v18;
    *(_WORD *)&buf[22] = 2112;
    *(_QWORD *)&buf[24] = v19;
    *(_WORD *)v134 = 2112;
    *(_QWORD *)&v134[2] = v20;
    *(_WORD *)&v134[10] = 2112;
    *(_QWORD *)&v134[12] = v21;
    v135 = 1024;
    v136 = a9;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "ReallyMountVolume:volume:%@:displayName:%@:provider:%@:domainError:%@:on:%@:how:0x%08x", buf, 0x3Au);
  }
  v113 = v18;

  if (v20)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "domain"));
    if (!objc_msgSend(v26, "isEqual:", NSPOSIXErrorDomain))
    {
LABEL_9:

      goto LABEL_10;
    }
    v27 = objc_msgSend(v20, "code") == (id)80;

    if (v27)
    {
      v29 = livefs_std_log(v28);
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        sub_10003B64C();

      v26 = v20;
      v20 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSFileProviderErrorDomain, -1000, 0));
      goto LABEL_9;
    }
  }
LABEL_10:
  if ((objc_msgSend(v23, "containsString:", CFSTR("/")) & 1) != 0
    || objc_msgSend(v23, "containsString:", CFSTR(":")))
  {
    v31 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v114 = 0;
LABEL_13:
    v36 = v124[5];
    v124[5] = v31;
LABEL_41:

    goto LABEL_42;
  }
  if (objc_msgSend(v21, "isAbsolutePath"))
    v37 = v21;
  else
    v37 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), off_10005C6F0, v21));
  v114 = v37;
  v38 = livefs_std_log(v37);
  v39 = objc_claimAutoreleasedReturnValue(v38);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v19;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v114;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "ReallyMountVolume: Enter for provider %{public}@ mounting: %@", buf, 0x16u);
  }

  v40 = (id *)(v124 + 5);
  obj = (id)v124[5];
  v35 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C760, "preflightMountWithName:displayName:storageName:provider:path:error:", v23, v18, v23, v19, v21, &obj));
  objc_storeStrong(v40, obj);
  if (v124[5])
  {
    v42 = livefs_std_log(v41);
    v36 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      sub_10003B5EC();
LABEL_40:
    v32 = 0;
    v33 = 0;
    v34 = 0;
    goto LABEL_41;
  }
  if (v35)
  {
    if ((a9 & 0x40) == 0 && (unint64_t)objc_msgSend(v35, "currentState") <= 1)
    {
      v31 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 17, 0));
      v32 = 0;
      v33 = 0;
      v34 = 0;
      goto LABEL_13;
    }
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "displayName"));
    if (objc_msgSend(v43, "isEqualToString:", v18))
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "storageName"));
      if ((objc_msgSend(v44, "isEqualToString:", v23) & 1) != 0)
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "mntOn"));
        v46 = objc_msgSend(v45, "isEqualToString:", v114);

        if ((v46 & 1) != 0)
          goto LABEL_37;
LABEL_36:
        objc_msgSend(v35, "refreshPath:displayName:storageName:", v114, v113, v23);
        goto LABEL_37;
      }

    }
    goto LABEL_36;
  }
  v47 = objc_msgSend(objc_alloc((Class)FSAuditToken), "initWithToken:", a11);
  LODWORD(v107) = -1;
  v35 = +[mountEntry newWithName:fileSystem:displayName:storageName:provider:path:mountID:auditToken:mntTable:](mountEntry, "newWithName:fileSystem:displayName:storageName:provider:path:mountID:auditToken:mntTable:", v23, v112, v18, v23, v19, v114, v107, v47, qword_10005C760);

  if (!v35)
  {
    v49 = livefs_std_log(v48);
    v50 = objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      sub_10003B324();

    v31 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 516, 0));
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    goto LABEL_13;
  }
LABEL_37:
  v51 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C750, "mkMountPath:mountID:", v21, objc_msgSend(v35, "midx")));
  v52 = (void *)v124[5];
  v124[5] = v51;

  if (v51)
  {
    v54 = livefs_std_log(v53);
    v36 = objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      sub_10003B58C();
    goto LABEL_40;
  }
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("LIFS_DA"), CFSTR("com.apple.filesystems.livefileproviderd"), &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat || AppBooleanValue)
  {
    v77 = objc_msgSend(CFSTR("com.apple.filesystems.UserFS.FileProvider"), "isEqualToString:", v19);
    v78 = a9;
    if (v77)
      v78 = a9 | 0x100;
    v110 = v78;
  }
  BYTE4(v108) = (v110 & 0x40) != 0;
  LODWORD(v108) = v110;
  v79 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "addMountNamed:displayName:mountID:mountedOn:provider:fpStorage:domainError:how:isReAdd:", v23, v113, objc_msgSend(v35, "midx"), v21, v19, v23, v20, v108));
  v80 = (void *)v124[5];
  v124[5] = v79;

  if (v124[5])
  {
    v82 = livefs_std_log(v81);
    v36 = objc_claimAutoreleasedReturnValue(v82);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      sub_10003B52C();
    v32 = 0;
    v33 = 0;
    goto LABEL_110;
  }
  v83 = objc_msgSend(v35, "setDomainError:", v20);
  if (v20)
  {
    v84 = livefs_std_log(v83);
    v85 = objc_claimAutoreleasedReturnValue(v84);
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
      sub_10003B500();

    v110 |= 2u;
  }
  v86 = objc_msgSend(v35, "setCurrentState:", 1);
  v32 = (v110 & 4) == 0;
  if ((v110 & 4) == 0)
  {
    v87 = dispatch_semaphore_create(0);
    v88 = livefs_std_log(v87);
    v89 = objc_claimAutoreleasedReturnValue(v88);
    if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v19;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v20;
      _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEFAULT, "Adding domain %@ for provider %@ domainError %@", buf, 0x20u);
    }

    v118[0] = _NSConcreteStackBlock;
    v118[1] = 3221225472;
    v118[2] = sub_10001DC9C;
    v118[3] = &unk_100055568;
    v120 = &v123;
    v36 = v87;
    v119 = v36;
    +[LivefsDomainManager addDomain:displayName:storage:provider:domainError:how:reply:](LivefsDomainManager, "addDomain:displayName:storage:provider:domainError:how:reply:", v23, v113, v23, v19, v20, v110, v118);
    v90 = dispatch_semaphore_wait(v36, 0xFFFFFFFFFFFFFFFFLL);
    if (v124[5])
    {

      v32 = 0;
LABEL_109:
      v33 = 1;
LABEL_110:
      v34 = 1;
      goto LABEL_41;
    }
    v91 = livefs_std_log(v90);
    v92 = objc_claimAutoreleasedReturnValue(v91);
    if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v19;
      _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "addDomain succeeded for provider %@", buf, 0xCu);
    }

    v94 = livefs_std_log(v93);
    v95 = objc_claimAutoreleasedReturnValue(v94);
    if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
      sub_10003B48C();

  }
  v96 = livefs_std_log(v86);
  v97 = objc_claimAutoreleasedReturnValue(v96);
  v110 |= (v110 >> 5) & 2;
  if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
    sub_10003B410();

  if ((v110 & 2) == 0)
  {
    v99 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "connect"));
    v100 = (void *)v124[5];
    v124[5] = v99;

    if (v99)
    {
      v101 = livefs_std_log(v98);
      v36 = objc_claimAutoreleasedReturnValue(v101);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        sub_10003B3B0();
      goto LABEL_109;
    }
  }
  v102 = livefs_std_log(v98);
  v103 = objc_claimAutoreleasedReturnValue(v102);
  if (os_log_type_enabled(v103, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v23;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v110;
    *(_WORD *)&buf[18] = 2112;
    *(_QWORD *)&buf[20] = v111;
    _os_log_debug_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_DEBUG, "ReallyMountVolume:mount mp for volume:%@ how:0x%08x mountOptions:%@", buf, 0x1Cu);
  }

  v104 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "mount:options:", v110, v111));
  v105 = (void *)v124[5];
  v124[5] = v104;

  if (v104)
  {
    v106 = livefs_std_log(v55);
    v36 = objc_claimAutoreleasedReturnValue(v106);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      sub_10003B350();
    goto LABEL_109;
  }
  if ((v110 & 2) == 0)
    v55 = (int *)-[fskitdXPCServer doKernelMount:providerName:mountEntry:](self, "doKernelMount:providerName:mountEntry:", v114, v19, v35);
  v33 = 1;
  v34 = 1;
LABEL_42:
  if (v124[5])
  {
    if (v35)
      v55 = (int *)objc_msgSend(v35, "setCurrentState:", 2);
    if (v32)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      *(_QWORD *)&buf[24] = sub_10001DC84;
      *(_QWORD *)v134 = sub_10001DC94;
      *(_QWORD *)&v134[8] = 0;
      v115[0] = _NSConcreteStackBlock;
      v115[1] = 3221225472;
      v115[2] = sub_10001DD1C;
      v115[3] = &unk_100055568;
      v117 = buf;
      v56 = dispatch_semaphore_create(0);
      v116 = v56;
      +[LivefsDomainManager removeDomain:provider:how:reply:](LivefsDomainManager, "removeDomain:provider:how:reply:", v23, v19, v110, v115);
      v57 = dispatch_semaphore_wait(v56, 0xFFFFFFFFFFFFFFFFLL);
      if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
      {
        v58 = livefs_std_log(v57);
        v59 = objc_claimAutoreleasedReturnValue(v58);
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          v60 = v124[5];
          v61 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
          *(_DWORD *)v129 = 138412546;
          v130 = v60;
          v131 = 2112;
          v132 = v61;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "While recovering from %@, domain cleanup encountered %@", v129, 0x16u);
        }

      }
      _Block_object_dispose(buf, 8);

    }
    if (v33)
      v55 = (int *)objc_msgSend((id)qword_10005C720, "removeMountNamed:provider:", v23, v19);
    if (v34)
    {
      if (v35)
        v62 = objc_msgSend(v35, "unmount:", 7);
      v55 = (int *)rmdir((const char *)objc_msgSend(objc_retainAutorelease(v114), "fileSystemRepresentation"));
      if ((_DWORD)v55)
      {
        v55 = __error();
        v63 = *v55;
        v64 = v35 && v63 == 2;
        v65 = v64;
        if (v63 && !v65)
        {
          v66 = livefs_std_log(v55);
          v67 = objc_claimAutoreleasedReturnValue(v66);
          if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
            sub_10003B2B4(v63, v67);

        }
      }
    }
  }
  if (v124[5])
  {
    v68 = livefs_std_log(v55);
    v69 = objc_claimAutoreleasedReturnValue(v68);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      v70 = v124[5];
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v70;
      v71 = "ReallyMountVolume: returning %@";
      v72 = v69;
      v73 = OS_LOG_TYPE_DEFAULT;
      v74 = 12;
LABEL_73:
      _os_log_impl((void *)&_mh_execute_header, v72, v73, v71, buf, v74);
    }
  }
  else
  {
    v75 = livefs_std_log(v55);
    v69 = objc_claimAutoreleasedReturnValue(v75);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v71 = "ReallyMountVolume:finish:success";
      v72 = v69;
      v73 = OS_LOG_TYPE_INFO;
      v74 = 2;
      goto LABEL_73;
    }
  }

  v22[2](v22, v124[5]);
  _Block_object_dispose(&v123, 8);

}

- (void)doKernelMount:(id)a3 providerName:(id)a4 mountEntry:(id)a5
{
  id v7;
  id v8;
  id v9;
  dispatch_queue_global_t global_queue;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  global_queue = dispatch_get_global_queue(2, 0);
  v11 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001DE4C;
  block[3] = &unk_100055590;
  v16 = v7;
  v17 = v8;
  v18 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v7;
  dispatch_async(v11, block);

}

- (void)LiveMounterMountVolume:(id)a3 provider:(id)a4 on:(id)a5 how:(int)a6 reply:(id)a7
{
  -[fskitdXPCServer mountVolume:displayName:provider:domainError:on:how:reply:](self, "mountVolume:displayName:provider:domainError:on:how:reply:", a3, a3, a4, 0, a5, *(_QWORD *)&a6, a7);
}

- (void)mountVolume:(id)a3 displayName:(id)a4 provider:(id)a5 domainError:(id)a6 on:(id)a7 how:(int)a8 options:(id)a9 reply:(id)a10
{
  uint64_t v10;

  LODWORD(v10) = a8;
  -[fskitdXPCServer mountVolume:fileSystem:displayName:provider:domainError:on:how:options:reply:](self, "mountVolume:fileSystem:displayName:provider:domainError:on:how:options:reply:", a3, 0, a4, a5, a6, a7, v10, a9, a10);
}

- (void)mountVolume:(id)a3 fileSystem:(id)a4 displayName:(id)a5 provider:(id)a6 domainError:(id)a7 on:(id)a8 how:(int)a9 options:(id)a10 reply:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  dispatch_queue_global_t global_queue;
  NSObject *v26;
  void *v27;
  _QWORD block[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  int v37;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a10;
  v24 = a11;
  if (v17 && v20 && v22)
  {
    objc_msgSend((id)qword_10005C720, "startedWork");
    global_queue = dispatch_get_global_queue(2, 0);
    v26 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001E1E8;
    block[3] = &unk_1000555B8;
    block[4] = self;
    v29 = v17;
    v30 = v18;
    v31 = v19;
    v32 = v20;
    v33 = v21;
    v34 = v22;
    v37 = a9;
    v35 = v23;
    v36 = v24;
    dispatch_async(v26, block);

  }
  else
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
    (*((void (**)(id, void *))v24 + 2))(v24, v27);

  }
}

- (void)mountVolume:(id)a3 displayName:(id)a4 provider:(id)a5 domainError:(id)a6 on:(id)a7 how:(int)a8 reply:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  dispatch_queue_global_t global_queue;
  NSObject *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  int v31;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  if (v15 && v17 && v19)
  {
    objc_msgSend((id)qword_10005C720, "startedWork");
    global_queue = dispatch_get_global_queue(2, 0);
    v22 = objc_claimAutoreleasedReturnValue(global_queue);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10001E448;
    v24[3] = &unk_1000555E0;
    v24[4] = self;
    v25 = v15;
    v26 = v16;
    v27 = v17;
    v28 = v18;
    v29 = v19;
    v31 = a8;
    v30 = v20;
    dispatch_async(v22, v24);

  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
    (*((void (**)(id, void *))v20 + 2))(v20, v23);

  }
}

- (void)mountVolume:(id)a3 fileSystem:(id)a4 displayName:(id)a5 provider:(id)a6 domainError:(id)a7 on:(id)a8 how:(int)a9 options:(id)a10 auditToken:(id *)a11 reply:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void (**v26)(_QWORD, _QWORD);
  dispatch_queue_global_t global_queue;
  NSObject *v28;
  __int128 v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  _QWORD block[5];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void (**v42)(_QWORD, _QWORD);
  int v43;
  __int128 v44;
  __int128 v45;

  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a10;
  v25 = a12;
  v26 = (void (**)(_QWORD, _QWORD))v25;
  if (!self->_clientHasEntitlement)
  {
    v30 = fskit_std_log(v25);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      sub_10003B79C();

    v32 = fs_errorForPOSIXError(1);
    v33 = objc_claimAutoreleasedReturnValue(v32);
    goto LABEL_10;
  }
  if (!v18 || !v21 || !v23)
  {
    v33 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
LABEL_10:
    v34 = (void *)v33;
    v26[2](v26, v33);

    goto LABEL_11;
  }
  objc_msgSend((id)qword_10005C720, "startedWork");
  global_queue = dispatch_get_global_queue(2, 0);
  v28 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E72C;
  block[3] = &unk_100055608;
  block[4] = self;
  v36 = v18;
  v37 = v20;
  v38 = v21;
  v39 = v22;
  v40 = v23;
  v43 = a9;
  v41 = v24;
  v29 = *(_OWORD *)&a11->var0[4];
  v44 = *(_OWORD *)a11->var0;
  v45 = v29;
  v42 = v26;
  dispatch_async(v28, block);

LABEL_11:
}

- (void)reallyUpdateErrorStateForVolume:(id)a3 provider:(id)a4 domainError:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *);
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void **v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  id v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *))a6;
  v14 = (void *)qword_10005C720;
  v28 = 0;
  v23 = _NSConcreteStackBlock;
  v24 = 3221225472;
  v25 = sub_10001E978;
  v26 = &unk_100055630;
  v15 = v12;
  v27 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "updateMountEntry:provider:settingsDictionary:updateBlock:", v10, v11, &v28, &v23));
  v17 = v28;
  if (v16)
  {
    v13[2](v13, v16);
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C760, "lookupName:provider:", v10, v11));
    v19 = v18;
    if (v18)
    {
      if (v15)
      {
        objc_msgSend(v18, "setDomainError:", v15);
      }
      else
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "domainError"));

        objc_msgSend(v19, "setDomainError:", 0);
        if (v20)
        {
          v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "mntOn"));
          v22 = v21;
          if ((objc_msgSend(v21, "isAbsolutePath") & 1) == 0)
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), off_10005C6F0, v21, v23, v24, v25, v26));

          }
          -[fskitdXPCServer doKernelMount:providerName:mountEntry:](self, "doKernelMount:providerName:mountEntry:", v22, v11, v19);

        }
      }
    }
    +[LivefsDomainManager updateDomain:reply:](LivefsDomainManager, "updateDomain:reply:", v17, v13);

  }
}

- (void)updateErrorStateForVolume:(id)a3 provider:(id)a4 domainError:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  dispatch_queue_global_t global_queue;
  NSObject *v15;
  void *v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  id v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10 && v11)
  {
    objc_msgSend((id)qword_10005C720, "startedWork");
    global_queue = dispatch_get_global_queue(2, 0);
    v15 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001EB70;
    block[3] = &unk_100055658;
    block[4] = self;
    v18 = v10;
    v19 = v11;
    v20 = v12;
    v21 = v13;
    dispatch_async(v15, block);

  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
    (*((void (**)(id, void *))v13 + 2))(v13, v16);

  }
}

+ (void)LiveMounterDoUnmountPreflight:(id)a3 how:(int)a4 reply:(id)a5
{
  uint64_t v6;
  id v7;
  void (**v8)(id, _QWORD, void *);
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  int v18;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a5;
  v9 = livefs_std_log(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mntOn"));
      v15 = 138543618;
      v16 = v12;
      v17 = 1024;
      v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Unmounting %{public}@ how %02x", (uint8_t *)&v15, 0x12u);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "volumeName"));
    objc_msgSend(v7, "unmountPreflight:", v6);
    v8[2](v8, 0, v13);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "mntOn"));
      v15 = 138543362;
      v16 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}@ is not mounted", (uint8_t *)&v15, 0xCu);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 2, 0));
    ((void (**)(id, void *, void *))v8)[2](v8, v13, 0);
  }

}

+ (void)LiveMounterDoUnmountCleanup:(id)a3 how:(int)a4 reply:(id)a5
{
  uint64_t v6;
  id v7;
  void (**v8)(id, void *, _QWORD);
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  dispatch_semaphore_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void **v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  NSObject *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v8 = (void (**)(id, void *, _QWORD))a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_10001DC84;
  v30 = sub_10001DC94;
  v31 = 0;
  if (!v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 2, 0));
    v8[2](v8, v9, 0);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "volumeName"));
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "unmountPostflight:", v6));
  v12 = (void *)v27[5];
  v27[5] = v11;

  if ((v6 & 2) != 0)
  {
    v13 = dispatch_semaphore_create(0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "providerName"));
    v20 = _NSConcreteStackBlock;
    v21 = 3221225472;
    v22 = sub_10001EF98;
    v23 = &unk_100055568;
    v25 = &v26;
    v15 = v13;
    v24 = v15;
    +[LivefsDomainManager removeDomain:provider:how:reply:](LivefsDomainManager, "removeDomain:provider:how:reply:", v10, v14, v6, &v20);

    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    if (!v27[5])
    {
      v16 = (void *)qword_10005C720;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "providerName", v20, v21, v22, v23));
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "removeMountNamed:provider:", v10, v17));
      v19 = (void *)v27[5];
      v27[5] = v18;

      if (!v27[5])
      {
        objc_msgSend((id)qword_10005C760, "remove:", v7);
        objc_msgSend(v7, "setCurrentState:", 2);
      }
    }

  }
  ((void (**)(id, void *, void *))v8)[2](v8, (void *)v27[5], v10);

  _Block_object_dispose(&v26, 8);
}

+ (void)LiveMounterDoUnmount:(id)a3 how:(int)a4 reply:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  dispatch_semaphore_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  void **v34;
  uint64_t v35;
  void (*v36)(uint64_t, void *);
  void *v37;
  NSObject *v38;
  uint64_t *v39;
  uint64_t v40;
  _QWORD v41[4];
  id v42;
  uint8_t v43[4];
  uint64_t v44;
  __int16 v45;
  void *v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  int v50;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v8 = a5;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  v40 = 0;
  v41[0] = &v40;
  v41[1] = 0x3032000000;
  v41[2] = sub_10001DC84;
  v41[3] = sub_10001DC94;
  v42 = 0;
  if (v7)
  {
    v10 = livefs_std_log(v8);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mntOn"));
      *(_DWORD *)buf = 138543618;
      v48 = v12;
      v49 = 1024;
      v50 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Unmounting %{public}@ how %02x", buf, 0x12u);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "volumeName"));
    v14 = objc_msgSend(v7, "unmountPreflight:", v6);
    if ((_DWORD)v14)
    {
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "unmount:", v6));
      v16 = *(void **)(v41[0] + 40);
      *(_QWORD *)(v41[0] + 40) = v15;

      if (!*(_QWORD *)(v41[0] + 40))
      {
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "unmountPostflight:", v6));
        v18 = *(void **)(v41[0] + 40);
        *(_QWORD *)(v41[0] + 40) = v17;

      }
    }
    if (*(_QWORD *)(v41[0] + 40))
    {
      v19 = livefs_std_log(v14);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mntOn"));
        sub_10003B7C8(v21, (uint64_t)v41, (uint64_t)buf, v20);
      }
    }
    else
    {
      if ((v6 & 2) == 0)
      {
LABEL_19:
        v31 = livefs_std_log(v14);
        v32 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          v33 = *(_QWORD *)(v41[0] + 40);
          *(_DWORD *)v43 = 138412546;
          v44 = v33;
          v45 = 2112;
          v46 = v13;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "unmount found mount, returning error %@, name %@", v43, 0x16u);
        }

        ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, *(_QWORD *)(v41[0] + 40), v13);
        goto LABEL_22;
      }
      v25 = dispatch_semaphore_create(0);
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "providerName"));
      v34 = _NSConcreteStackBlock;
      v35 = 3221225472;
      v36 = sub_10001F460;
      v37 = &unk_100055568;
      v39 = &v40;
      v20 = v25;
      v38 = v20;
      +[LivefsDomainManager removeDomain:provider:how:reply:](LivefsDomainManager, "removeDomain:provider:how:reply:", v13, v26, v6, &v34);

      dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
      if (!*(_QWORD *)(v41[0] + 40))
      {
        v27 = (void *)qword_10005C720;
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "providerName", v34, v35, v36, v37));
        v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "removeMountNamed:provider:", v13, v28));
        v30 = *(void **)(v41[0] + 40);
        *(_QWORD *)(v41[0] + 40) = v29;

        if (!*(_QWORD *)(v41[0] + 40))
        {
          objc_msgSend((id)qword_10005C760, "remove:", v7);
          objc_msgSend(v7, "setCurrentState:", 2);
        }
      }

    }
    goto LABEL_19;
  }
  v22 = livefs_std_log(v8);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "mntOn"));
    *(_DWORD *)buf = 138543362;
    v48 = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%{public}@ is not mounted", buf, 0xCu);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 2, 0));
  ((void (**)(_QWORD, void *, _QWORD))v9)[2](v9, v13, 0);
LABEL_22:

  _Block_object_dispose(&v40, 8);
}

- (void)unmountVolume:(id)a3 how:(int)a4 reply:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  int v23;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))v9;
  if (dword_10005C708)
  {
    v11 = livefs_std_log(v9);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v8;
      v22 = 1024;
      v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unmount for %@ with how %d", buf, 0x12u);
    }

  }
  objc_msgSend((id)qword_10005C720, "startedWork");
  if ((objc_msgSend(v8, "isAbsolutePath") & 1) != 0)
  {
    v13 = v8;
  }
  else
  {
    v14 = objc_alloc((Class)NSString);
    v13 = objc_msgSend(v14, "initWithFormat:", CFSTR("%@/%@"), off_10005C6F0, v8);
  }
  v15 = v13;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C760, "lookupByPath:", v13));
  if (v16)
  {
    objc_msgSend((id)objc_opt_class(self), "LiveMounterDoUnmount:how:reply:", v16, v6, v10);
  }
  else
  {
    v17 = livefs_std_log(0);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%{public}@ is not mounted", buf, 0xCu);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 2, 0));
    ((void (**)(_QWORD, void *, _QWORD))v10)[2](v10, v19, 0);

  }
}

- (void)unmountVolumeByID:(unsigned int)a3 how:(int)a4 reply:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  uint64_t v10;
  NSObject *v11;
  void *v12;
  _DWORD v13[2];
  __int16 v14;
  int v15;

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (dword_10005C708)
  {
    v10 = livefs_std_log(v8);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 67109376;
      v13[1] = v6;
      v14 = 1024;
      v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Unmount for ID %u with how %d", (uint8_t *)v13, 0xEu);
    }

  }
  if ((v6 + 1) > 1)
  {
    objc_msgSend((id)qword_10005C720, "startedWork");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C760, "lookup:", v6));
    objc_msgSend((id)objc_opt_class(self), "LiveMounterDoUnmount:how:reply:", v12, v5, v9);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
    ((void (**)(_QWORD, void *, _QWORD))v9)[2](v9, v12, 0);
  }

}

- (void)unmountVolume:(id)a3 provider:(id)a4 how:(int)a5 domainError:(id)a6 reply:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  fskitdXPCServer *v27;
  id v28;
  id v29;
  void (**v30)(_QWORD, _QWORD, _QWORD);
  int v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  int v37;
  __int16 v38;
  id v39;

  LODWORD(v9) = a5;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = (void (**)(_QWORD, _QWORD, _QWORD))v15;
  if (dword_10005C708)
  {
    v17 = livefs_std_log(v15);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v33 = v12;
      v34 = 2112;
      v35 = v13;
      v36 = 1024;
      v37 = v9;
      v38 = 2112;
      v39 = v14;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Unmount of %@ for %@ with how %d domError %@", buf, 0x26u);
    }

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C760, "lookupName:provider:", v12, v13));
  if (v19)
  {
    objc_msgSend((id)qword_10005C720, "startedWork");
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "domainError"));
    objc_msgSend(v19, "setDomainError:", v14);
    if (((v14 != 0) & (v9 >> 1)) != 0)
      v9 = v9 & 0xFFFFFFFD;
    else
      v9 = v9;
    v21 = (void *)objc_opt_class(self);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10001FAC4;
    v23[3] = &unk_100055680;
    v24 = v20;
    v25 = v14;
    v31 = v9;
    v26 = v19;
    v27 = self;
    v28 = v12;
    v29 = v13;
    v30 = v16;
    v22 = v20;
    objc_msgSend(v21, "LiveMounterDoUnmount:how:reply:", v26, v9, v23);

  }
  else
  {
    v22 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 2, 0));
    ((void (**)(_QWORD, id, _QWORD))v16)[2](v16, v22, 0);
  }

}

- (void)verboseLevel:(id)a3
{
  void *v3;
  void (**v4)(id, _QWORD);

  v3 = (void *)qword_10005C720;
  v4 = (void (**)(id, _QWORD))a3;
  objc_msgSend(v3, "startedWork");
  v4[2](v4, dword_10005C708);

}

- (void)setVerboseLevel:(int)a3 reply:(id)a4
{
  void (**v5)(id, _QWORD);
  void *v6;
  void *v7;
  NSErrorUserInfoKey v8;
  const __CFString *v9;

  v5 = (void (**)(id, _QWORD))a4;
  objc_msgSend((id)qword_10005C720, "startedWork");
  if (a3 < 0x65)
  {
    dword_10005C708 = a3;
    v5[2](v5, 0);
  }
  else
  {
    v8 = NSDebugDescriptionErrorKey;
    v9 = CFSTR("verbose level must be between 0 and 100");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, v6));
    ((void (**)(id, void *))v5)[2](v5, v7);

  }
}

- (void)installedExtensions:(id)a3
{
  id v4;
  NSXPCConnection *ourConn;
  id v6;
  _QWORD v7[4];
  id v8;
  _OWORD v9[2];

  v4 = a3;
  ourConn = self->_ourConn;
  if (ourConn)
    -[NSXPCConnection auditToken](ourConn, "auditToken");
  else
    memset(v9, 0, sizeof(v9));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001FDE8;
  v7[3] = &unk_1000556A8;
  v8 = v4;
  v6 = v4;
  -[fskitdXPCServer _installedExtensionsForAuditToken:replyHandler:](self, "_installedExtensionsForAuditToken:replyHandler:", v9, v7);

}

- (void)setEnabledStateForIdentifier:(id)a3 newState:(BOOL)a4 replyHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, void *);
  NSXPCConnection *ourConn;
  uint64_t v11;
  void *v12;
  _OWORD v13[2];

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  if (self->_clientHasEntitlement)
  {
    ourConn = self->_ourConn;
    if (ourConn)
      -[NSXPCConnection auditToken](ourConn, "auditToken");
    else
      memset(v13, 0, sizeof(v13));
    -[fskitdXPCServer setEnabledStateForToken:identifier:newState:replyHandler:](self, "setEnabledStateForToken:identifier:newState:replyHandler:", v13, v8, v6, v9);
  }
  else
  {
    v11 = fs_errorForPOSIXError(1);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v9[2](v9, v12);

  }
}

- (void)installedExtensionWithShortName:(id)a3 replyHandler:(id)a4
{
  id v6;
  id v7;
  NSXPCConnection *ourConn;
  void *v9;
  _OWORD v10[2];

  v6 = a3;
  v7 = a4;
  ourConn = self->_ourConn;
  if (ourConn)
    -[NSXPCConnection auditToken](ourConn, "auditToken");
  else
    memset(v10, 0, sizeof(v10));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FSAuditToken tokenWithToken:](FSAuditToken, "tokenWithToken:", v10));
  -[fskitdXPCServer _installedExtensionWithShortName:user:replyHandler:](self, "_installedExtensionWithShortName:user:replyHandler:", v6, v9, v7);

}

- (void)installedExtensionWithShortName:(id)a3 user:(id)a4 replyHandler:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;

  if (self->_clientHasEntitlement)
  {
    v11 = a5;
    -[fskitdXPCServer _installedExtensionWithShortName:user:replyHandler:](self, "_installedExtensionWithShortName:user:replyHandler:", a3, a4);
  }
  else
  {
    v9 = a5;
    v10 = fs_errorForPOSIXError(1);
    v11 = (id)objc_claimAutoreleasedReturnValue(v10);
    (*((void (**)(id, _QWORD))a5 + 2))(v9, 0);

  }
}

- (void)_installedExtensionWithShortName:(id)a3 user:(id)a4 replyHandler:(id)a5
{
  objc_msgSend((id)qword_10005C748, "currentExtensionForShortName:auditToken:replyHandler:", a3, a4, a5);
}

- (id)getExtensionModuleFromID:(id)a3 forToken:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v5 = a3;
  v6 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_10001DC84;
  v30 = sub_10001DC94;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_10001DC84;
  v24 = sub_10001DC94;
  v25 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000201B4;
  v19[3] = &unk_100055338;
  v19[4] = &v20;
  v19[5] = &v26;
  objc_msgSend((id)qword_10005C748, "currentExtensionsForToken:replyHandler:", v6, v19);
  if (v21[5])
  {
    v7 = 0;
  }
  else
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = sub_10001DC84;
    v17 = sub_10001DC94;
    v18 = 0;
    v8 = (void *)v27[5];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100020220;
    v10[3] = &unk_1000556D0;
    v11 = v5;
    v12 = &v13;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);
    v7 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v7;
}

- (id)getBundleIDFromShortName:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_10001DC84;
  v14 = sub_10001DC94;
  v15 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000203C0;
  v7[3] = &unk_1000556F8;
  v4 = a3;
  v8 = v4;
  v9 = &v10;
  -[fskitdXPCServer installedExtensionWithShortName:replyHandler:](self, "installedExtensionWithShortName:replyHandler:", v4, v7);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (BOOL)extensionSupportsResource:(id)a3 resource:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;

  v5 = a3;
  v6 = objc_msgSend(a4, "kind");
  if (v6 == (id)3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attributes"));
    v8 = v7;
    v9 = &FSModuleIdentityAttributeSupportsServerURLs;
    goto LABEL_5;
  }
  if (v6 == (id)1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attributes"));
    v8 = v7;
    v9 = &FSModuleIdentityAttributeSupportsBlockResources;
LABEL_5:
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", *v9));

    if (v10 && (objc_msgSend(v10, "BOOLValue") & 1) != 0)
      goto LABEL_15;
    goto LABEL_13;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attributes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", FSModuleIdentityAttributeSupportsBlockResources));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attributes"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("FSSupportsServerURLs")));

  if ((!v10 || (objc_msgSend(v10, "BOOLValue") & 1) == 0)
    && (!v13 || (objc_msgSend(v13, "BOOLValue") & 1) == 0))
  {

LABEL_15:
    v14 = 1;
    goto LABEL_16;
  }

LABEL_13:
  v14 = 0;
LABEL_16:

  return v14;
}

- (void)getRealResource:(id)a3 auditToken:(id)a4 reply:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, id, _QWORD);
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  _QWORD v42[6];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, id, _QWORD))a5;
  if (objc_msgSend(v7, "kind") != (id)1)
  {
    if (objc_msgSend(v7, "kind") != (id)2 || !byte_10005C738)
      goto LABEL_23;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[FSGenericURLResource dynamicCast:](FSGenericURLResource, "dynamicCast:", v7));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
    objc_sync_enter(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "getResourceID"));
    v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "getResource:", v18));

    if (!v19)
    {
      v19 = v15;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
      objc_msgSend(v20, "updateResource:", v19);

    }
    objc_sync_exit(v16);

    v9[2](v9, v19, 0);
    v7 = v19;
    goto LABEL_24;
  }
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = sub_10001DC84;
  v53 = sub_10001DC94;
  v54 = (id)objc_claimAutoreleasedReturnValue(+[FSBlockDeviceResource dynamicCast:](FSBlockDeviceResource, "dynamicCast:", v7));
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = sub_10001DC84;
  v47 = sub_10001DC94;
  v48 = 0;
  v10 = (void *)v50[5];
  if (!v10)
    goto LABEL_13;
  v11 = objc_msgSend(v10, "fileDescriptor");
  if ((_DWORD)v11 != -1)
  {
    if (v50[5])
    {
      v12 = fskit_std_log(v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "getResourceID"));
        sub_10003BA28();
      }

      v9[2](v9, (id)v50[5], 0);
      v14 = 0;
      goto LABEL_22;
    }
LABEL_13:
    v14 = 1;
    goto LABEL_22;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v50[5], "BSDName"));
  v22 = objc_msgSend((id)v50[5], "isWritable");
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100020A08;
  v42[3] = &unk_100055720;
  v42[4] = &v43;
  v42[5] = &v49;
  +[FSBlockDeviceResource openWithBSDName:writable:auditToken:replyHandler:](FSBlockDeviceResource, "openWithBSDName:writable:auditToken:replyHandler:", v21, v22, v8, v42);

  v23 = (id)v50[5];
  if (v44[5])
  {
    v25 = fskit_std_log(v24);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_10003B9B8(v26, v27, v28, v29, v30, v31, v32, v33);

    v34 = 0;
    v35 = v44[5];
  }
  else
  {
    v36 = fskit_std_log(v24);
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "getResourceID"));
      sub_10003B96C();
    }

    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
    objc_sync_enter(v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
    objc_msgSend(v39, "updateResource:", v23);

    objc_sync_exit(v38);
    v35 = 0;
    v34 = v23;
  }
  v9[2](v9, v34, v35);
  v14 = 0;
  v7 = v23;
LABEL_22:
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(&v49, 8);
  if ((v14 & 1) != 0)
  {
LABEL_23:
    v40 = fs_errorForPOSIXError(22);
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    ((void (**)(id, id, void *))v9)[2](v9, 0, v41);

  }
LABEL_24:

}

- (id)applyResource:(id)a3 targetBundle:(id)a4 instanceID:(id)a5 initiatorAuditToken:(id)a6 authorizingAuditToken:(id)a7 isProbe:(BOOL)a8 usingBlock:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  _BOOL8 v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  id v32;
  id v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  id v41;
  id v43;
  uint64_t v44;
  NSObject *v45;
  id v46;
  void *v47;
  id *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  id v52;
  uint64_t v53;
  NSObject *v54;
  NSObject *v55;
  void *v56;
  NSObject *v57;
  intptr_t v58;
  uint64_t v59;
  NSObject *v60;
  id v61;
  void *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  id v66;
  void (**v67)(id, id, id, id, _QWORD *);
  NSObject *group;
  _QWORD v69[4];
  NSObject *v70;
  id v71;
  _BYTE *v72;
  uint64_t *v73;
  _QWORD *v74;
  _QWORD v75[4];
  NSObject *v76;
  uint64_t *v77;
  _QWORD v78[4];
  NSObject *v79;
  uint64_t *v80;
  id obj;
  _QWORD v82[6];
  _QWORD v83[6];
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t (*v87)(uint64_t, uint64_t);
  void (*v88)(uint64_t);
  id v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t (*v93)(uint64_t, uint64_t);
  void (*v94)(uint64_t);
  id v95;
  uint64_t v96;
  id *v97;
  uint64_t v98;
  uint64_t (*v99)(uint64_t, uint64_t);
  void (*v100)(uint64_t);
  id v101;
  _QWORD v102[3];
  char v103;
  _BYTE buf[24];
  id v105;
  char v106[24];

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v67 = (void (**)(id, id, id, id, _QWORD *))a9;
  group = dispatch_group_create();
  v102[0] = 0;
  v102[1] = v102;
  v102[2] = 0x2020000000;
  v103 = 1;
  v96 = 0;
  v97 = (id *)&v96;
  v98 = 0x3032000000;
  v99 = sub_10001DC84;
  v100 = sub_10001DC94;
  v101 = 0;
  v90 = 0;
  v91 = &v90;
  v92 = 0x3032000000;
  v93 = sub_10001DC84;
  v94 = sub_10001DC94;
  v95 = 0;
  v84 = 0;
  v85 = &v84;
  v86 = 0x3032000000;
  v87 = sub_10001DC84;
  v88 = sub_10001DC94;
  v89 = 0;
  v19 = fskit_std_log(objc_msgSend((id)qword_10005C720, "startedWork"));
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    sub_10003BB7C((uint64_t)v14, (uint64_t)v106, (uint64_t)objc_msgSend(v14, "kind"), v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[fskitdXPCServer getExtensionModuleFromID:forToken:](self, "getExtensionModuleFromID:forToken:", v15, v17));
  v22 = v21;
  if (!v21)
  {
    v34 = fskit_std_log(0);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      sub_10003BA74();
    goto LABEL_19;
  }
  v23 = objc_msgSend(v21, "isEnabled");
  if ((v23 & 1) == 0)
  {
    v36 = fskit_std_log(v23);
    v35 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[fskitdXPCServer applyResource:targetBundle:instanceID:initiatorAuditToken:authorizingAuditT"
                           "oken:isProbe:usingBlock:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v15;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%s: Attempt to start disabled extension %@", buf, 0x16u);
    }
    v37 = 1;
    goto LABEL_20;
  }
  v24 = -[fskitdXPCServer extensionSupportsResource:resource:](self, "extensionSupportsResource:resource:", v22, v14);
  if (!v24)
  {
    v38 = fskit_std_log(v24);
    v35 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "getResourceID"));
      sub_10003BB2C(v39, (uint64_t)v15, buf);
    }
LABEL_19:
    v37 = 74;
LABEL_20:

    v40 = fs_errorForPOSIXError(v37);
    v33 = (id)objc_claimAutoreleasedReturnValue(v40);
    goto LABEL_21;
  }
  v25 = (void *)qword_10005C728;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fs_containerIdentifier"));
  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472;
  v83[2] = sub_10002142C;
  v83[3] = &unk_100055748;
  v83[4] = &v96;
  v83[5] = &v84;
  objc_msgSend(v25, "extensionForBundle:user:instance:replyHandler:", v15, v17, v26, v83);

  if (v97[5]
    || (v28 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)v85[5], "errorFromStartingProc")),
        v29 = v97[5],
        v97[5] = (id)v28,
        v29,
        v97[5]))
  {
    v30 = fskit_std_log(v27);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = v97[5];
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[fskitdXPCServer applyResource:targetBundle:instanceID:initiatorAuditToken:authorizingAuditT"
                           "oken:isProbe:usingBlock:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2112;
      v105 = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%s: Starting extension for %@ reported error %@", buf, 0x20u);
    }

LABEL_11:
    v33 = v97[5];
LABEL_21:
    v41 = v33;
    goto LABEL_22;
  }
  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472;
  v82[2] = sub_100021498;
  v82[3] = &unk_100055770;
  v82[4] = &v96;
  v82[5] = &v90;
  v43 = -[fskitdXPCServer getRealResource:auditToken:reply:](self, "getRealResource:auditToken:reply:", v14, v17, v82);
  if (v97[5])
  {
    v44 = fskit_std_log(v43);
    v45 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "getResourceID"));
      sub_10003BAE0();
    }

    objc_msgSend((id)qword_10005C720, "removeReferencesToTask:", v16);
    objc_msgSend((id)qword_10005C720, "taskSetChanged");
    goto LABEL_11;
  }
  v46 = (id)v91[5];

  v47 = (void *)v85[5];
  v48 = v97;
  obj = v97[5];
  v66 = objc_msgSend(v47, "newXPCConnectionWithError:", &obj);
  objc_storeStrong(v48 + 5, obj);
  if (v97[5])
  {
    v50 = fskit_std_log(v49);
    v51 = objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v52 = v97[5];
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[fskitdXPCServer applyResource:targetBundle:instanceID:initiatorAuditToken:authorizingAuditT"
                           "oken:isProbe:usingBlock:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2112;
      v105 = v52;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "%s: Connecting to extension for %@ intending to probe reported error %@", buf, 0x20u);
    }

    v41 = v97[5];
  }
  else
  {
    v53 = fskit_std_log(v49);
    v54 = objc_claimAutoreleasedReturnValue(v53);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v15;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "About to talk to the connection for %@", buf, 0xCu);
    }

    dispatch_group_enter(group);
    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472;
    v78[2] = sub_100021508;
    v78[3] = &unk_100055568;
    v80 = &v96;
    v55 = group;
    v79 = v55;
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "remoteObjectProxyWithErrorHandler:", v78));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fs_containerIdentifier"));
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472;
    v75[2] = sub_100021554;
    v75[3] = &unk_100055568;
    v77 = &v96;
    v57 = v55;
    v76 = v57;
    objc_msgSend(v65, "checkIn:replyHandler:", v56, v75);

    v58 = dispatch_group_wait(v57, 0xFFFFFFFFFFFFFFFFLL);
    if (v97[5])
    {
      v59 = fskit_std_log(v58);
      v60 = objc_claimAutoreleasedReturnValue(v59);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v61 = v97[5];
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "-[fskitdXPCServer applyResource:targetBundle:instanceID:initiatorAuditToken:authorizingAudi"
                             "tToken:isProbe:usingBlock:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v15;
        *(_WORD *)&buf[22] = 2112;
        v105 = v61;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "%s: checkIn to extension %@ reported error %@", buf, 0x20u);
      }

      v41 = v97[5];
    }
    else
    {
      v62 = (void *)v85[5];
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "getResourceID"));
      objc_msgSend(v62, "addResourceID:", v63);

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      LOBYTE(v105) = 0;
      dispatch_group_enter(v57);
      v69[0] = _NSConcreteStackBlock;
      v69[1] = 3221225472;
      v69[2] = sub_10002162C;
      v69[3] = &unk_100055798;
      v64 = v57;
      v70 = v64;
      v72 = buf;
      v73 = &v84;
      v74 = v102;
      v71 = v46;
      v67[2](v67, v15, v71, v66, v69);
      dispatch_group_wait(v64, 0xFFFFFFFFFFFFFFFFLL);
      v41 = v97[5];

      _Block_object_dispose(buf, 8);
    }

  }
  v14 = v46;
LABEL_22:

  _Block_object_dispose(&v84, 8);
  _Block_object_dispose(&v90, 8);

  _Block_object_dispose(&v96, 8);
  _Block_object_dispose(v102, 8);

  return v41;
}

- (id)canStartProbeTask:(id)a3 resource:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getResourceID"));
  v10 = objc_msgSend(v8, "getResourceState:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FSBlockDeviceResource dynamicCast:](FSBlockDeviceResource, "dynamicCast:", v6));
  v12 = v11;
  if (v10 >= 2
    && (v10 - 4 <= 0xFFFFFFFD ? (v15 = v11 == 0) : (v15 = 1),
        v15 || (objc_msgSend(v11, "isWritable") & 1) != 0))
  {
    v16 = fs_errorForPOSIXError(16);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v17 = fskit_std_log(v14);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getResourceID"));
      sub_10003BBC8();
    }

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
    objc_msgSend(v13, "addTaskUUID:resource:", v5, v6);

    v14 = 0;
  }

  objc_sync_exit(v7);
  return v14;
}

- (void)probeResource:(id)a3 usingBundle:(id)a4 replyHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSXPCConnection *ourConn;
  _OWORD v12[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  ourConn = self->_ourConn;
  if (ourConn)
    -[NSXPCConnection auditToken](ourConn, "auditToken");
  else
    memset(v12, 0, sizeof(v12));
  -[fskitdXPCServer _probeResource:usingBundle:auditToken:replyHandler:](self, "_probeResource:usingBundle:auditToken:replyHandler:", v8, v9, v12, v10);

}

- (id)canStartTask:(id)a3 resource:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getResourceID"));
  v10 = objc_msgSend(v8, "getResourceState:", v9);

  if (v10)
  {
    v11 = fs_errorForPOSIXError(16);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = fskit_std_log(v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getResourceID"));
      sub_10003BC14();
    }

  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
    objc_msgSend(v15, "addTaskUUID:resource:", v5, v6);

    v12 = 0;
  }
  objc_sync_exit(v7);

  return v12;
}

- (id)canStartUnloadTask:(id)a3 resource:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v5 = a3;
  v6 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_10001DC84;
  v32 = sub_10001DC94;
  v33 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getTaskUUIDs:", v6));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "tasks"));
    objc_sync_enter(v10);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100021F30;
    v25[3] = &unk_1000557C0;
    v27 = &v28;
    v26 = v6;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v25);

    objc_sync_exit(v10);
  }
  if (!v29[5])
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getResourceID"));
    v13 = objc_msgSend(v11, "getResourceState:", v12);

    if (v13 <= 6 && ((1 << v13) & 0x71) != 0)
    {
      v15 = fskit_std_log(v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getResourceID"));
        sub_10003BCAC();
      }

      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
      -[NSObject addTaskUUID:resource:](v17, "addTaskUUID:resource:", v5, v6);
    }
    else
    {
      v20 = fs_errorForPOSIXError(70);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      v22 = (void *)v29[5];
      v29[5] = v21;

      v24 = fskit_std_log(v23);
      v17 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getResourceID"));
        objc_claimAutoreleasedReturnValue(objc_msgSend((id)v29[5], "localizedDescription"));
        sub_10003BC60();
      }
    }

  }
  objc_sync_exit(v7);

  v18 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  return v18;
}

- (void)doCheckResource:(id)a3 usingBundle:(id)a4 options:(id)a5 connection:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSXPCConnection *ourConn;
  _OWORD v18[2];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  ourConn = self->_ourConn;
  if (ourConn)
    -[NSXPCConnection auditToken](ourConn, "auditToken");
  else
    memset(v18, 0, sizeof(v18));
  -[fskitdXPCServer _checkResource:usingBundle:options:auditToken:connection:replyHandler:](self, "_checkResource:usingBundle:options:auditToken:connection:replyHandler:", v12, v13, v14, v18, v15, v16);

}

- (void)checkResource:(id)a3 usingBundle:(id)a4 options:(id)a5 connection:(id)a6 replyHandler:(id)a7
{
  -[fskitdXPCServer doCheckResource:usingBundle:options:connection:reply:](self, "doCheckResource:usingBundle:options:connection:reply:", a3, a4, a5, a6, a7);
}

- (void)checkVolume:(id)a3 options:(id)a4 connection:(id)a5 replyHandler:(id)a6
{
  void *v6;
  void (**v7)(id, _QWORD, id);
  uint64_t v8;
  id v9;

  v6 = (void *)qword_10005C720;
  v7 = (void (**)(id, _QWORD, id))a6;
  objc_msgSend(v6, "startedWork");
  v8 = fs_errorForPOSIXError(45);
  v9 = (id)objc_claimAutoreleasedReturnValue(v8);
  v7[2](v7, 0, v9);

}

- (id)getInitiatorBundleIDForToken:(id *)a3
{
  __int128 v3;
  __SecTask *v4;
  __SecTask *v5;
  __CFString *v6;
  __CFString *v7;
  CFTypeID v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  audit_token_t v21;

  v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v21.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v21.val[4] = v3;
  v4 = SecTaskCreateWithAuditToken(0, &v21);
  if (v4)
  {
    v5 = v4;
    v6 = (__CFString *)SecTaskCopyValueForEntitlement(v4, CFSTR("application-identifier"), 0);
    if (v6)
    {
      v7 = v6;
      v8 = CFGetTypeID(v6);
      if (v8 == CFStringGetTypeID())
      {
        CFRelease(v5);
        v10 = fskit_std_log(v9);
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          sub_10003BD68();
        goto LABEL_11;
      }
      CFRelease(v7);
    }
    CFRelease(v5);
  }
  v12 = fskit_std_log(v4);
  v11 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_10003BCF8(v11, v13, v14, v15, v16, v17, v18, v19);
  v7 = &stru_100056698;
LABEL_11:

  return v7;
}

- (id)getInitiatorSigningIDForToken:(id *)a3
{
  __int128 v3;
  __SecTask *v4;
  __SecTask *v5;
  __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  audit_token_t cf;

  v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)cf.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&cf.val[4] = v3;
  v4 = SecTaskCreateWithAuditToken(0, &cf);
  if (!v4)
  {
LABEL_6:
    v19 = fskit_std_log(v4);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      sub_10003BDD8(v20, v21, v22, v23, v24, v25, v26, v27);

    return &stru_100056698;
  }
  v5 = v4;
  *(_QWORD *)cf.val = 0;
  v6 = (__CFString *)SecTaskCopySigningIdentifier(v4, (CFErrorRef *)&cf);
  CFRelease(v5);
  v7 = *(_QWORD *)cf.val;
  v9 = fskit_std_log(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10003BEC4(v11, v12, v13, v14, v15, v16, v17, v18);

    CFRelease(*(CFTypeRef *)cf.val);
    goto LABEL_6;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_10003BE48((uint64_t)v6, v11, v29);

  return v6;
}

- (void)formatResource:(id)a3 usingBundle:(id)a4 options:(id)a5 connection:(id)a6 replyHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSXPCConnection *ourConn;
  _OWORD v18[2];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  ourConn = self->_ourConn;
  if (ourConn)
    -[NSXPCConnection auditToken](ourConn, "auditToken");
  else
    memset(v18, 0, sizeof(v18));
  -[fskitdXPCServer _formatResource:usingBundle:options:auditToken:connection:replyHandler:](self, "_formatResource:usingBundle:options:auditToken:connection:replyHandler:", v12, v13, v14, v18, v15, v16);

}

- (void)currentTasks:(id)a3
{
  id v4;
  NSXPCConnection *ourConn;
  id v6;
  _QWORD v7[4];
  id v8;
  _OWORD v9[2];

  v4 = a3;
  ourConn = self->_ourConn;
  if (ourConn)
    -[NSXPCConnection auditToken](ourConn, "auditToken");
  else
    memset(v9, 0, sizeof(v9));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002251C;
  v7[3] = &unk_1000556A8;
  v8 = v4;
  v6 = v4;
  -[fskitdXPCServer _currentTasksForAuditToken:replyHandler:](self, "_currentTasksForAuditToken:replyHandler:", v9, v7);

}

- (void)currentResourceIDs:(id)a3
{
  id v4;
  NSXPCConnection *ourConn;
  id v6;
  _QWORD v7[4];
  id v8;
  _OWORD v9[2];

  v4 = a3;
  ourConn = self->_ourConn;
  if (ourConn)
    -[NSXPCConnection auditToken](ourConn, "auditToken");
  else
    memset(v9, 0, sizeof(v9));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000225C4;
  v7[3] = &unk_1000556A8;
  v8 = v4;
  v6 = v4;
  -[fskitdXPCServer _currentResourceIDsForAuditToken:replyHandler:](self, "_currentResourceIDsForAuditToken:replyHandler:", v9, v7);

}

- (void)currentContainers:(id)a3
{
  id v4;
  NSXPCConnection *ourConn;
  id v6;
  _QWORD v7[4];
  id v8;
  _OWORD v9[2];

  v4 = a3;
  ourConn = self->_ourConn;
  if (ourConn)
    -[NSXPCConnection auditToken](ourConn, "auditToken");
  else
    memset(v9, 0, sizeof(v9));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002266C;
  v7[3] = &unk_1000556A8;
  v8 = v4;
  v6 = v4;
  -[fskitdXPCServer _currentContainersForAuditToken:replyHandler:](self, "_currentContainersForAuditToken:replyHandler:", v9, v7);

}

- (void)setTaskUpdateInterest:(BOOL)a3 replyHandler:(id)a4
{
  _BOOL4 v4;
  void *v6;
  fskitdXPCServer *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void (**v11)(id, _QWORD);

  v4 = a3;
  v11 = (void (**)(id, _QWORD))a4;
  objc_msgSend((id)qword_10005C720, "startedWork");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "taskUpdateClients"));
  objc_sync_enter(v6);
  v7 = self;
  objc_sync_enter(v7);
  if (v7->_ourConn)
  {
    v7->_hasTaskInterest = v4;
    if (v4)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "taskUpdateClients"));
      objc_msgSend(v8, "addObject:", v7);
LABEL_6:

      goto LABEL_7;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "taskUpdateClients"));
    v10 = objc_msgSend(v9, "containsObject:", v7);

    if (v10)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "taskUpdateClients"));
      objc_msgSend(v8, "removeObject:", v7);
      goto LABEL_6;
    }
  }
LABEL_7:
  objc_sync_exit(v7);

  objc_sync_exit(v6);
  objc_msgSend((id)qword_10005C720, "taskSetChanged");
  v11[2](v11, 0);

}

- (void)getProgressPortForTask:(id)a3 replyHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v5 = a3;
  v6 = a4;
  objc_msgSend((id)qword_10005C720, "startedWork");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "tasks"));
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "tasks"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v5));

  objc_sync_exit(v7);
  if (v9
    && (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "taskReferenceHolder")),
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[fskitdExtensionInstance dynamicCast:](fskitdExtensionInstance, "dynamicCast:", v10)), v10, v11))
  {
    v23 = 0;
    v12 = objc_msgSend(v11, "newXPCConnectionWithError:", &v23);
    v13 = v23;
    if (v13)
    {
      v14 = v13;
      (*((void (**)(id, _QWORD, _QWORD, id))v6 + 2))(v6, 0, 0, v13);

    }
    else
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000229BC;
      v21[3] = &unk_1000551E8;
      v16 = v6;
      v22 = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v21));
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1000229D4;
      v18[3] = &unk_1000553B0;
      v20 = v16;
      v19 = v9;
      objc_msgSend(v17, "getProgressPortForTask:replyHandler:", v5, v18);

    }
  }
  else
  {
    v15 = fs_errorForPOSIXError(2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v15);
    (*((void (**)(id, _QWORD, _QWORD, void *))v6 + 2))(v6, 0, 0, v11);
  }

}

- (void)cancelTask:(id)a3 replyHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSXPCConnection *ourConn;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSXPCConnection *v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  void *v48;
  _OWORD v49[2];
  _OWORD v50[2];
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = fskit_std_log(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    sub_10003C07C();

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "tasks"));
  objc_sync_enter(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "tasks"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v6));

  objc_sync_exit(v10);
  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "taskReferenceHolder"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[fskitdExtensionInstance dynamicCast:](fskitdExtensionInstance, "dynamicCast:", v14));

    if (v15)
    {
      ourConn = self->_ourConn;
      if (ourConn)
        -[NSXPCConnection auditToken](ourConn, "auditToken");
      else
        memset(v50, 0, sizeof(v50));
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[fskitdXPCServer getInitiatorBundleIDForToken:](self, "getInitiatorBundleIDForToken:", v50));
      v33 = self->_ourConn;
      if (v33)
        -[NSXPCConnection auditToken](v33, "auditToken");
      else
        memset(v49, 0, sizeof(v49));
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[fskitdXPCServer getInitiatorSigningIDForToken:](self, "getInitiatorSigningIDForToken:", v49));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "taskInitiatorID"));
      if ((objc_msgSend(v32, "isEqualToString:", v35) & 1) != 0)
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "taskSigningID"));
        v37 = objc_msgSend(v34, "isEqualToString:", v36);

        if (v37)
        {
          objc_msgSend(v15, "terminate");
          v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "updatedDescriptionInState:error:", 3, 0));

          v40 = +[fskitdExtensionClient postTaskStatusUpdate:](fskitdExtensionClient, "postTaskStatusUpdate:", v39);
          v41 = 0;
LABEL_24:
          v45 = fskit_std_log(v40);
          v46 = objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            sub_10003C010();

          v7[2](v7, v41);
          v12 = (void *)v39;
          goto LABEL_27;
        }
      }
      else
      {

      }
      v42 = fskit_std_log(v38);
      v43 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "taskInitiatorID"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "taskSigningID"));
        *(_DWORD *)buf = 136316162;
        v52 = "-[fskitdXPCServer cancelTask:replyHandler:]";
        v53 = 2112;
        v54 = v32;
        v55 = 2112;
        v56 = v34;
        v57 = 2112;
        v58 = v47;
        v59 = 2112;
        v60 = v48;
        _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%s: Can't cancel task, the initator (%@:%@) isn't the same initator of the task (%@:%@)", buf, 0x34u);

      }
      v44 = fs_errorForPOSIXError(13);
      v40 = (id)objc_claimAutoreleasedReturnValue(v44);
      v41 = v40;
      v39 = (uint64_t)v12;
      goto LABEL_24;
    }
    v21 = fskit_std_log(v16);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_10003BFA0(v22, v23, v24, v25, v26, v27, v28, v29);

    v30 = fs_errorForPOSIXError(2);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v7[2](v7, v31);

  }
  else
  {
    v18 = fskit_std_log(v13);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_10003BF34();

    v20 = fs_errorForPOSIXError(2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v7[2](v7, v12);
  }
LABEL_27:

}

- (id)canStartActivateTask:(id)a3 resource:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  int v25;
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getTaskUUIDs:", v6));

  if (objc_msgSend(v9, "count"))
  {
    v10 = fs_errorForPOSIXError(16);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = fskit_std_log(v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getResourceID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedDescription"));
      v25 = 136315906;
      v26 = "-[fskitdXPCServer canStartActivateTask:resource:]";
      v27 = 2112;
      v28 = v14;
      v29 = 2112;
      v30 = v9;
      v31 = 2112;
      v32 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s:%@: Can't start new task, previous task is running: %@, error: %@", (uint8_t *)&v25, 0x2Au);

    }
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getResourceID"));
    v18 = objc_msgSend(v16, "getResourceState:", v17);

    if (v18 == 4)
    {
      v20 = fskit_std_log(v19);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getResourceID"));
        sub_10003C0E8();
      }

      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
      -[NSObject addTaskUUID:resource:](v13, "addTaskUUID:resource:", v5, v6);
      v11 = 0;
    }
    else
    {
      v22 = fs_errorForPOSIXError(70);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v22);
      v23 = fskit_std_log(v11);
      v13 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getResourceID"));
        objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedDescription"));
        sub_10003C134();
      }
    }
  }

  objc_sync_exit(v7);
  return v11;
}

- (void)activateVolume:(id)a3 usingBundle:(id)a4 options:(id)a5 replyHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSXPCConnection *ourConn;
  _OWORD v15[2];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  ourConn = self->_ourConn;
  if (ourConn)
    -[NSXPCConnection auditToken](ourConn, "auditToken");
  else
    memset(v15, 0, sizeof(v15));
  -[fskitdXPCServer _activateVolume:usingBundle:options:auditToken:replyHandler:](self, "_activateVolume:usingBundle:options:auditToken:replyHandler:", v10, v11, v12, v15, v13);

}

- (void)activateVolume:(id)a3 shortName:(id)a4 options:(id)a5 replyHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *);
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *))a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[fskitdXPCServer getBundleIDFromShortName:](self, "getBundleIDFromShortName:", v11));
  if (v14)
  {
    -[fskitdXPCServer activateVolume:usingBundle:options:replyHandler:](self, "activateVolume:usingBundle:options:replyHandler:", v10, v14, v12, v13);
  }
  else
  {
    v15 = fskit_std_log(0);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10003C180();

    v17 = fs_errorForPOSIXError(22);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v13[2](v13, v18);

  }
}

- (id)canStartDeactivateTask:(id)a3 resource:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v5 = a3;
  v6 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_10001DC84;
  v32 = sub_10001DC94;
  v33 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getTaskUUIDs:", v6));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "tasks"));
    objc_sync_enter(v10);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100023520;
    v25[3] = &unk_1000557C0;
    v27 = &v28;
    v26 = v6;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v25);

    objc_sync_exit(v10);
  }
  if (!v29[5])
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getResourceID"));
    v13 = objc_msgSend(v11, "getResourceState:", v12);

    if (v13 - 5 > 1)
    {
      v18 = fs_errorForPOSIXError(70);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      v20 = (void *)v29[5];
      v29[5] = v19;

      v22 = fskit_std_log(v21);
      v17 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getResourceID"));
        objc_claimAutoreleasedReturnValue(objc_msgSend((id)v29[5], "localizedDescription"));
        sub_10003C238();
      }
    }
    else
    {
      v15 = fskit_std_log(v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getResourceID"));
        sub_10003C1EC();
      }

      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
      -[NSObject addTaskUUID:resource:](v17, "addTaskUUID:resource:", v5, v6);
    }

  }
  objc_sync_exit(v7);

  v23 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  return v23;
}

- (void)deactivateVolume:(id)a3 usingBundle:(id)a4 numericOptions:(unint64_t)a5 replyHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSXPCConnection *ourConn;
  _OWORD v14[2];

  v10 = a3;
  v11 = a4;
  v12 = a6;
  ourConn = self->_ourConn;
  if (ourConn)
    -[NSXPCConnection auditToken](ourConn, "auditToken");
  else
    memset(v14, 0, sizeof(v14));
  -[fskitdXPCServer _deactivateVolume:usingBundle:numericOptions:auditToken:replyHandler:](self, "_deactivateVolume:usingBundle:numericOptions:auditToken:replyHandler:", v10, v11, a5, v14, v12);

}

- (void)deactivateVolume:(id)a3 shortName:(id)a4 numericOptions:(unint64_t)a5 replyHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *);
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *))a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[fskitdXPCServer getBundleIDFromShortName:](self, "getBundleIDFromShortName:", v11));
  if (v13)
  {
    -[fskitdXPCServer deactivateVolume:usingBundle:numericOptions:replyHandler:](self, "deactivateVolume:usingBundle:numericOptions:replyHandler:", v10, v13, a5, v12);
  }
  else
  {
    v14 = fskit_std_log(0);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10003C284();

    v16 = fs_errorForPOSIXError(22);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v12[2](v12, v17);

  }
}

- (void)loadResource:(id)a3 usingBundle:(id)a4 options:(id)a5 replyHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSXPCConnection *ourConn;
  _OWORD v15[2];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  ourConn = self->_ourConn;
  if (ourConn)
    -[NSXPCConnection auditToken](ourConn, "auditToken");
  else
    memset(v15, 0, sizeof(v15));
  -[fskitdXPCServer _loadResource:usingBundle:options:auditToken:replyHandler:](self, "_loadResource:usingBundle:options:auditToken:replyHandler:", v10, v11, v12, v15, v13);

}

- (void)loadResource:(id)a3 shortName:(id)a4 options:(id)a5 replyHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[fskitdXPCServer getBundleIDFromShortName:](self, "getBundleIDFromShortName:", v11));
  if (v14)
  {
    -[fskitdXPCServer loadResource:usingBundle:options:replyHandler:](self, "loadResource:usingBundle:options:replyHandler:", v10, v14, v12, v13);
  }
  else
  {
    v15 = fskit_std_log(0);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10003C2F0();

    v17 = fs_errorForPOSIXError(22);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v13[2](v13, 0, v18);

  }
}

- (void)unloadResource:(id)a3 usingBundle:(id)a4 options:(id)a5 replyHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSXPCConnection *ourConn;
  _OWORD v15[2];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  ourConn = self->_ourConn;
  if (ourConn)
    -[NSXPCConnection auditToken](ourConn, "auditToken");
  else
    memset(v15, 0, sizeof(v15));
  -[fskitdXPCServer _unloadResource:usingBundle:options:auditToken:replyHandler:](self, "_unloadResource:usingBundle:options:auditToken:replyHandler:", v10, v11, v12, v15, v13);

}

- (void)unloadResource:(id)a3 shortName:(id)a4 options:(id)a5 replyHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *);
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *))a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[fskitdXPCServer getBundleIDFromShortName:](self, "getBundleIDFromShortName:", v11));
  if (v14)
  {
    -[fskitdXPCServer unloadResource:usingBundle:options:replyHandler:](self, "unloadResource:usingBundle:options:replyHandler:", v10, v14, v12, v13);
  }
  else
  {
    v15 = fskit_std_log(0);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10003C35C();

    v17 = fs_errorForPOSIXError(22);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v13[2](v13, v18);

  }
}

- (void)activateVolume:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 replyHandler:(id)a7
{
  __int128 v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  _OWORD v17[2];

  if (self->_clientHasEntitlement)
  {
    v12 = *(_OWORD *)&a6->var0[4];
    v17[0] = *(_OWORD *)a6->var0;
    v17[1] = v12;
    v13 = a7;
    -[fskitdXPCServer _activateVolume:usingBundle:options:auditToken:replyHandler:](self, "_activateVolume:usingBundle:options:auditToken:replyHandler:", a3, a4, a5, v17, v13);

  }
  else
  {
    v14 = a7;
    v15 = fs_errorForPOSIXError(1);
    v16 = (id)objc_claimAutoreleasedReturnValue(v15);
    (*((void (**)(id, id))a7 + 2))(v14, v16);

  }
}

- (void)_activateVolume:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 replyHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  dispatch_queue_global_t global_queue;
  NSObject *v17;
  __int128 v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  fskitdXPCServer *v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  objc_msgSend((id)qword_10005C720, "startedWork");
  global_queue = dispatch_get_global_queue(0, 0);
  v17 = objc_claimAutoreleasedReturnValue(global_queue);
  block[1] = 3221225472;
  v18 = *(_OWORD *)&a6->var0[4];
  v29 = *(_OWORD *)a6->var0;
  block[0] = _NSConcreteStackBlock;
  block[2] = sub_100023D64;
  block[3] = &unk_100055888;
  v30 = v18;
  v24 = v13;
  v25 = v12;
  v27 = v14;
  v28 = v15;
  v26 = self;
  v19 = v14;
  v20 = v15;
  v21 = v12;
  v22 = v13;
  dispatch_async(v17, block);

}

- (void)checkResource:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 connection:(id)a7 replyHandler:(id)a8
{
  __int128 v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _OWORD v19[2];

  if (self->_clientHasEntitlement)
  {
    v14 = *(_OWORD *)&a6->var0[4];
    v19[0] = *(_OWORD *)a6->var0;
    v19[1] = v14;
    v15 = a8;
    -[fskitdXPCServer _checkResource:usingBundle:options:auditToken:connection:replyHandler:](self, "_checkResource:usingBundle:options:auditToken:connection:replyHandler:", a3, a4, a5, v19, a7, v15);

  }
  else
  {
    v16 = a8;
    v17 = fs_errorForPOSIXError(1);
    v18 = (id)objc_claimAutoreleasedReturnValue(v17);
    (*((void (**)(id, _QWORD, id))a8 + 2))(v16, 0, v18);

  }
}

- (void)_checkResource:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 connection:(id)a7 replyHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  dispatch_queue_global_t global_queue;
  NSObject *v20;
  __int128 v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  objc_msgSend((id)qword_10005C720, "startedWork");
  global_queue = dispatch_get_global_queue(0, 0);
  v20 = objc_claimAutoreleasedReturnValue(global_queue);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10002490C;
  v27[3] = &unk_100055928;
  v27[4] = self;
  v28 = v14;
  v21 = *(_OWORD *)&a6->var0[4];
  v33 = *(_OWORD *)a6->var0;
  v34 = v21;
  v29 = v15;
  v30 = v16;
  v31 = v17;
  v32 = v18;
  v22 = v17;
  v23 = v16;
  v24 = v15;
  v25 = v18;
  v26 = v14;
  dispatch_async(v20, v27);

}

- (void)checkVolume:(id)a3 options:(id)a4 auditToken:(id *)a5 connection:(id)a6 replyHandler:(id)a7
{
  void *v7;
  void (**v8)(id, _QWORD, id);
  uint64_t v9;
  id v10;

  v7 = (void *)qword_10005C720;
  v8 = (void (**)(id, _QWORD, id))a7;
  objc_msgSend(v7, "startedWork");
  v9 = fs_errorForPOSIXError(45);
  v10 = (id)objc_claimAutoreleasedReturnValue(v9);
  v8[2](v8, 0, v10);

}

- (void)currentContainersForAuditToken:(id *)a3 replyHandler:(id)a4
{
  __int128 v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  _OWORD v11[2];

  if (self->_clientHasEntitlement)
  {
    v6 = *(_OWORD *)&a3->var0[4];
    v11[0] = *(_OWORD *)a3->var0;
    v11[1] = v6;
    v7 = a4;
    -[fskitdXPCServer _currentContainersForAuditToken:replyHandler:](self, "_currentContainersForAuditToken:replyHandler:", v11, v7);

  }
  else
  {
    v8 = a4;
    v9 = fs_errorForPOSIXError(1);
    v10 = (id)objc_claimAutoreleasedReturnValue(v9);
    (*((void (**)(id, _QWORD, id))a4 + 2))(v8, 0, v10);

  }
}

- (void)_currentContainersForAuditToken:(id *)a3 replyHandler:(id)a4
{
  void *v4;
  void (**v5)(id, id, _QWORD);
  id v6;

  v4 = (void *)qword_10005C720;
  v5 = (void (**)(id, id, _QWORD))a4;
  objc_msgSend(v4, "startedWork");
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C728, "getInstancesInfo"));
  v5[2](v5, v6, 0);

}

- (void)currentResourceIDsForAuditToken:(id *)a3 replyHandler:(id)a4
{
  __int128 v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  _OWORD v11[2];

  if (self->_clientHasEntitlement)
  {
    v6 = *(_OWORD *)&a3->var0[4];
    v11[0] = *(_OWORD *)a3->var0;
    v11[1] = v6;
    v7 = a4;
    -[fskitdXPCServer _currentResourceIDsForAuditToken:replyHandler:](self, "_currentResourceIDsForAuditToken:replyHandler:", v11, v7);

  }
  else
  {
    v8 = a4;
    v9 = fs_errorForPOSIXError(1);
    v10 = (id)objc_claimAutoreleasedReturnValue(v9);
    (*((void (**)(id, _QWORD, id))a4 + 2))(v8, 0, v10);

  }
}

- (void)_currentResourceIDsForAuditToken:(id *)a3 replyHandler:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void (**v9)(void);

  v9 = (void (**)(void))a4;
  objc_msgSend((id)qword_10005C720, "startedWork");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getResources"));

  objc_sync_exit(v4);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));
  }
  else
  {
    v8 = fs_errorForPOSIXError(22);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }
  v9[2]();

}

- (void)currentTasksForAuditToken:(id *)a3 replyHandler:(id)a4
{
  __int128 v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  _OWORD v11[2];

  if (self->_clientHasEntitlement)
  {
    v6 = *(_OWORD *)&a3->var0[4];
    v11[0] = *(_OWORD *)a3->var0;
    v11[1] = v6;
    v7 = a4;
    -[fskitdXPCServer _currentTasksForAuditToken:replyHandler:](self, "_currentTasksForAuditToken:replyHandler:", v11, v7);

  }
  else
  {
    v8 = a4;
    v9 = fs_errorForPOSIXError(1);
    v10 = (id)objc_claimAutoreleasedReturnValue(v9);
    (*((void (**)(id, _QWORD, id))a4 + 2))(v8, 0, v10);

  }
}

- (void)_currentTasksForAuditToken:(id *)a3 replyHandler:(id)a4
{
  void (**v5)(id, void *, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  NSXPCConnection *ourConn;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _OWORD v14[2];

  v5 = (void (**)(id, void *, _QWORD))a4;
  objc_msgSend((id)qword_10005C720, "startedWork");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "tasks"));
  objc_sync_enter(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "tasks"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allValues"));

  objc_sync_exit(v6);
  if (self->_clientHasEntitlement)
  {
    v5[2](v5, v8, 0);
  }
  else
  {
    ourConn = self->_ourConn;
    if (ourConn)
      -[NSXPCConnection auditToken](ourConn, "auditToken");
    else
      memset(v14, 0, sizeof(v14));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100025924;
    v12[3] = &unk_100055950;
    v13 = (id)objc_claimAutoreleasedReturnValue(-[fskitdXPCServer getInitiatorBundleIDForToken:](self, "getInitiatorBundleIDForToken:", v14));
    v10 = v13;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fs_filter:", v12));
    v5[2](v5, v11, 0);

  }
}

- (void)deactivateVolume:(id)a3 usingBundle:(id)a4 numericOptions:(unint64_t)a5 auditToken:(id *)a6 replyHandler:(id)a7
{
  __int128 v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  _OWORD v17[2];

  if (self->_clientHasEntitlement)
  {
    v12 = *(_OWORD *)&a6->var0[4];
    v17[0] = *(_OWORD *)a6->var0;
    v17[1] = v12;
    v13 = a7;
    -[fskitdXPCServer _deactivateVolume:usingBundle:numericOptions:auditToken:replyHandler:](self, "_deactivateVolume:usingBundle:numericOptions:auditToken:replyHandler:", a3, a4, a5, v17, v13);

  }
  else
  {
    v14 = a7;
    v15 = fs_errorForPOSIXError(1);
    v16 = (id)objc_claimAutoreleasedReturnValue(v15);
    (*((void (**)(id, id))a7 + 2))(v14, v16);

  }
}

- (void)_deactivateVolume:(id)a3 usingBundle:(id)a4 numericOptions:(unint64_t)a5 auditToken:(id *)a6 replyHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  dispatch_queue_global_t global_queue;
  NSObject *v16;
  __int128 v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  fskitdXPCServer *v24;
  id v25;
  unint64_t v26;
  __int128 v27;
  __int128 v28;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  objc_msgSend((id)qword_10005C720, "startedWork");
  global_queue = dispatch_get_global_queue(0, 0);
  v16 = objc_claimAutoreleasedReturnValue(global_queue);
  block[1] = 3221225472;
  v17 = *(_OWORD *)&a6->var0[4];
  v27 = *(_OWORD *)a6->var0;
  block[0] = _NSConcreteStackBlock;
  block[2] = sub_100025B40;
  block[3] = &unk_1000559C8;
  v28 = v17;
  v22 = v13;
  v23 = v12;
  v24 = self;
  v25 = v14;
  v26 = a5;
  v18 = v14;
  v19 = v12;
  v20 = v13;
  dispatch_async(v16, block);

}

- (void)formatResource:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 connection:(id)a7 replyHandler:(id)a8
{
  __int128 v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _OWORD v19[2];

  if (self->_clientHasEntitlement)
  {
    v14 = *(_OWORD *)&a6->var0[4];
    v19[0] = *(_OWORD *)a6->var0;
    v19[1] = v14;
    v15 = a8;
    -[fskitdXPCServer _formatResource:usingBundle:options:auditToken:connection:replyHandler:](self, "_formatResource:usingBundle:options:auditToken:connection:replyHandler:", a3, a4, a5, v19, a7, v15);

  }
  else
  {
    v16 = a8;
    v17 = fs_errorForPOSIXError(1);
    v18 = (id)objc_claimAutoreleasedReturnValue(v17);
    (*((void (**)(id, _QWORD, id))a8 + 2))(v16, 0, v18);

  }
}

- (void)_formatResource:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 connection:(id)a7 replyHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  dispatch_queue_global_t global_queue;
  NSObject *v20;
  __int128 v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  objc_msgSend((id)qword_10005C720, "startedWork");
  global_queue = dispatch_get_global_queue(0, 0);
  v20 = objc_claimAutoreleasedReturnValue(global_queue);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000267C4;
  v27[3] = &unk_100055928;
  v27[4] = self;
  v28 = v14;
  v21 = *(_OWORD *)&a6->var0[4];
  v33 = *(_OWORD *)a6->var0;
  v34 = v21;
  v29 = v15;
  v30 = v16;
  v31 = v17;
  v32 = v18;
  v22 = v17;
  v23 = v16;
  v24 = v15;
  v25 = v18;
  v26 = v14;
  dispatch_async(v20, v27);

}

- (void)installedExtensionsForAuditToken:(id *)a3 replyHandler:(id)a4
{
  __int128 v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  _OWORD v11[2];

  if (self->_clientHasEntitlement)
  {
    v6 = *(_OWORD *)&a3->var0[4];
    v11[0] = *(_OWORD *)a3->var0;
    v11[1] = v6;
    v7 = a4;
    -[fskitdXPCServer _installedExtensionsForAuditToken:replyHandler:](self, "_installedExtensionsForAuditToken:replyHandler:", v11, v7);

  }
  else
  {
    v8 = a4;
    v9 = fs_errorForPOSIXError(1);
    v10 = (id)objc_claimAutoreleasedReturnValue(v9);
    (*((void (**)(id, _QWORD, id))a4 + 2))(v8, 0, v10);

  }
}

- (void)_installedExtensionsForAuditToken:(id *)a3 replyHandler:(id)a4
{
  void (**v6)(id, uint64_t, _QWORD);
  uint64_t v7;
  NSObject *v8;
  void *v9;
  __int128 v10;
  void *v11;
  NSXPCConnection *ourConn;
  id v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _OWORD v19[2];
  _QWORD v20[6];
  uint8_t buf[16];
  __int128 v22;
  _QWORD v23[5];
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_10001DC84;
  v29 = sub_10001DC94;
  v30 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = sub_10001DC84;
  v23[4] = sub_10001DC94;
  v24 = 0;
  v7 = fskit_std_log(objc_msgSend((id)qword_10005C720, "startedWork"));
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Getting extensions", buf, 2u);
  }

  v9 = (void *)qword_10005C748;
  v10 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)buf = *(_OWORD *)a3->var0;
  v22 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FSAuditToken tokenWithToken:](FSAuditToken, "tokenWithToken:", buf));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100027694;
  v20[3] = &unk_100055338;
  v20[4] = v23;
  v20[5] = &v25;
  objc_msgSend(v9, "currentExtensionsForToken:replyHandler:", v11, v20);

  if (self->_clientHasEntitlement)
  {
    v6[2](v6, v26[5], 0);
  }
  else
  {
    ourConn = self->_ourConn;
    if (ourConn)
      -[NSXPCConnection auditToken](ourConn, "auditToken");
    else
      memset(v19, 0, sizeof(v19));
    v13 = (id)objc_claimAutoreleasedReturnValue(-[fskitdXPCServer getInitiatorBundleIDForToken:](self, "getInitiatorBundleIDForToken:", v19));
    v14 = (void *)v26[5];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100027700;
    v17[3] = &unk_1000559F0;
    v15 = v13;
    v18 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fs_filter:", v17));
    v6[2](v6, (uint64_t)v16, 0);

  }
  _Block_object_dispose(v23, 8);

  _Block_object_dispose(&v25, 8);
}

- (void)setEnabledStateForToken:(id *)a3 identifier:(id)a4 newState:(BOOL)a5 replyHandler:(id)a6
{
  _BOOL8 v6;
  void *v9;
  id v10;
  id v11;
  void *v12;
  __int128 v13;
  void *v14;
  _OWORD v15[2];

  v6 = a5;
  v9 = (void *)qword_10005C720;
  v10 = a6;
  v11 = a4;
  objc_msgSend(v9, "startedWork");
  v12 = (void *)qword_10005C748;
  v13 = *(_OWORD *)&a3->var0[4];
  v15[0] = *(_OWORD *)a3->var0;
  v15[1] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[FSAuditToken tokenWithToken:](FSAuditToken, "tokenWithToken:", v15));
  objc_msgSend(v12, "setEnabledStateForToken:identifier:newState:replyHandler:", v14, v11, v6, v10);

}

- (void)loadResource:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 replyHandler:(id)a7
{
  __int128 v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  _OWORD v17[2];

  if (self->_clientHasEntitlement)
  {
    v12 = *(_OWORD *)&a6->var0[4];
    v17[0] = *(_OWORD *)a6->var0;
    v17[1] = v12;
    v13 = a7;
    -[fskitdXPCServer _loadResource:usingBundle:options:auditToken:replyHandler:](self, "_loadResource:usingBundle:options:auditToken:replyHandler:", a3, a4, a5, v17, v13);

  }
  else
  {
    v14 = a7;
    v15 = fs_errorForPOSIXError(1);
    v16 = (id)objc_claimAutoreleasedReturnValue(v15);
    (*((void (**)(id, _QWORD, id))a7 + 2))(v14, 0, v16);

  }
}

- (void)_loadResource:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 replyHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  dispatch_queue_global_t global_queue;
  NSObject *v20;
  __int128 v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  fskitdXPCServer *v30;
  id v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  objc_msgSend((id)qword_10005C720, "startedWork");
  v17 = (void *)objc_opt_new(NSUUID, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fs_containerIdentifier"));

  global_queue = dispatch_get_global_queue(0, 0);
  v20 = objc_claimAutoreleasedReturnValue(global_queue);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100027A40;
  v27[3] = &unk_100055928;
  v21 = *(_OWORD *)&a6->var0[4];
  v34 = *(_OWORD *)a6->var0;
  v35 = v21;
  v28 = v13;
  v29 = v18;
  v30 = self;
  v31 = v12;
  v32 = v14;
  v33 = v15;
  v22 = v14;
  v23 = v12;
  v24 = v15;
  v25 = v18;
  v26 = v13;
  dispatch_async(v20, v27);

}

- (void)probeResource:(id)a3 usingBundle:(id)a4 auditToken:(id *)a5 replyHandler:(id)a6
{
  __int128 v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  _OWORD v15[2];

  if (self->_clientHasEntitlement)
  {
    v10 = *(_OWORD *)&a5->var0[4];
    v15[0] = *(_OWORD *)a5->var0;
    v15[1] = v10;
    v11 = a6;
    -[fskitdXPCServer _probeResource:usingBundle:auditToken:replyHandler:](self, "_probeResource:usingBundle:auditToken:replyHandler:", a3, a4, v15, v11);

  }
  else
  {
    v12 = a6;
    v13 = fs_errorForPOSIXError(1);
    v14 = (id)objc_claimAutoreleasedReturnValue(v13);
    (*((void (**)(id, _QWORD, id))a6 + 2))(v12, 0, v14);

  }
}

- (void)_probeResource:(id)a3 usingBundle:(id)a4 auditToken:(id *)a5 replyHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  dispatch_queue_global_t global_queue;
  NSObject *v17;
  __int128 v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = fskit_std_log(objc_msgSend((id)qword_10005C720, "startedWork"));
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "getResourceID"));
    *(_DWORD *)buf = 138412290;
    v29 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Probe starting on %@", buf, 0xCu);

  }
  global_queue = dispatch_get_global_queue(0, 0);
  v17 = objc_claimAutoreleasedReturnValue(global_queue);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10002880C;
  v22[3] = &unk_100055B48;
  v22[4] = self;
  v23 = v10;
  v24 = v11;
  v25 = v12;
  v18 = *(_OWORD *)&a5->var0[4];
  v26 = *(_OWORD *)a5->var0;
  v27 = v18;
  v19 = v11;
  v20 = v12;
  v21 = v10;
  dispatch_async(v17, v22);

}

- (void)unloadResource:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 replyHandler:(id)a7
{
  __int128 v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  _OWORD v17[2];

  if (self->_clientHasEntitlement)
  {
    v12 = *(_OWORD *)&a6->var0[4];
    v17[0] = *(_OWORD *)a6->var0;
    v17[1] = v12;
    v13 = a7;
    -[fskitdXPCServer _unloadResource:usingBundle:options:auditToken:replyHandler:](self, "_unloadResource:usingBundle:options:auditToken:replyHandler:", a3, a4, a5, v17, v13);

  }
  else
  {
    v14 = a7;
    v15 = fs_errorForPOSIXError(1);
    v16 = (id)objc_claimAutoreleasedReturnValue(v15);
    (*((void (**)(id, id))a7 + 2))(v14, v16);

  }
}

- (void)_unloadResource:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 replyHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  dispatch_queue_global_t global_queue;
  NSObject *v17;
  __int128 v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  fskitdXPCServer *v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  objc_msgSend((id)qword_10005C720, "startedWork");
  global_queue = dispatch_get_global_queue(0, 0);
  v17 = objc_claimAutoreleasedReturnValue(global_queue);
  block[1] = 3221225472;
  v18 = *(_OWORD *)&a6->var0[4];
  v29 = *(_OWORD *)a6->var0;
  block[0] = _NSConcreteStackBlock;
  block[2] = sub_100029344;
  block[3] = &unk_100055888;
  v30 = v18;
  v24 = v13;
  v25 = v12;
  v27 = v14;
  v28 = v15;
  v26 = self;
  v19 = v14;
  v20 = v15;
  v21 = v12;
  v22 = v13;
  dispatch_async(v17, block);

}

- (NSXPCConnection)ourConn
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOurConn:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)hasTaskInterest
{
  return self->_hasTaskInterest;
}

- (void)setHasTaskInterest:(BOOL)a3
{
  self->_hasTaskInterest = a3;
}

- (BOOL)clientHasEntitlement
{
  return self->_clientHasEntitlement;
}

- (void)setClientHasEntitlement:(BOOL)a3
{
  self->_clientHasEntitlement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ourConn, 0);
}

@end
