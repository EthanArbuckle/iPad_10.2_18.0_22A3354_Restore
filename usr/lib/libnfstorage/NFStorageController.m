@implementation NFStorageController

- (id)managedObjectModel
{
  id v1;
  id v2;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v1 = a1[2];
  if (v1)
  {
    v2 = v1;
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDBCF48];
    v5 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(a1, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("/System/Library/PrivateFrameworks/NearField.framework/NFStorage%@Model.momd"), v6);
    objc_msgSend(v4, "URLWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDBB6B0]), "initWithContentsOfURL:", v8);
    v10 = a1[2];
    a1[2] = (id)v9;

    v2 = a1[2];
  }
  return v2;
}

- (id)managedObjectContext
{
  id *v1;
  id v2;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  const void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *v14;
  _BOOL4 v15;
  const char *v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  int v22;
  const char *v23;
  const char *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  id v41;
  id v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  const void **v46;
  uint64_t v47;
  void (*v48)(uint64_t, const char *, ...);
  objc_class *v49;
  _BOOL4 v50;
  const char *v51;
  uint64_t v52;
  NSObject *v53;
  objc_class *v54;
  int v55;
  const char *v56;
  const char *v57;
  const void **v58;
  uint64_t Logger;
  void (*v60)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v63;
  NSObject *v64;
  objc_class *v65;
  int v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  void (*v70)(uint64_t, const char *, ...);
  objc_class *v71;
  _BOOL4 v72;
  uint64_t v73;
  NSObject *v74;
  objc_class *v75;
  int v76;
  const char *v77;
  const char *v78;
  void *v79;
  id v80;
  void *v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  void (*v85)(uint64_t, const char *, ...);
  objc_class *v86;
  _BOOL4 v87;
  uint64_t v88;
  NSObject *v89;
  objc_class *v90;
  int v91;
  const char *v92;
  const char *v93;
  const char *ClassName;
  const char *v95;
  const char *v96;
  const char *v97;
  const char *Name;
  const char *v99;
  const char *v100;
  NSObject *v101;
  id v102;
  id v103;
  _QWORD v104[3];
  _QWORD v105[3];
  uint8_t buf[4];
  int v107;
  __int16 v108;
  const char *v109;
  __int16 v110;
  const char *v111;
  __int16 v112;
  int v113;
  __int16 v114;
  NSObject *v115;
  __int16 v116;
  NSObject *v117;
  uint64_t v118;
  _QWORD v119[3];

  v1 = a1;
  v119[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return v1;
  v2 = a1[1];
  if (v2)
    return (id *)v2;
  v4 = a1[3];
  if (v4)
  {
    v5 = v4;
LABEL_53:
    v82 = objc_msgSend(objc_alloc(MEMORY[0x24BDBB6A0]), "initWithConcurrencyType:", 1);
    v83 = v1[1];
    v1[1] = (id)v82;

    objc_msgSend(v1[1], "setPersistentStoreCoordinator:", v5);
    goto LABEL_54;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NFStorageController homePath]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDBB4F8];
  v118 = *MEMORY[0x24BDBB4F8];
  v119[0] = *MEMORY[0x24BDD0CF8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v119, &v118, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = 0;
  objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, v9, &v103);
  v10 = v103;

  if (!v10)
  {
    v26 = (void *)MEMORY[0x24BDBCF48];
    -[NFStorageController homePath]();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v1, "name");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v28, "initWithFormat:", CFSTR("NFStorage%@.sqlite"), v29);
    objc_msgSend(v27, "stringByAppendingPathComponent:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "fileURLWithPath:", v31);
    v20 = objc_claimAutoreleasedReturnValue();

    v32 = (void *)MEMORY[0x24BDBCED8];
    v33 = *MEMORY[0x24BDBB420];
    v104[0] = *MEMORY[0x24BDBB488];
    v104[1] = v33;
    v105[0] = MEMORY[0x24BDBD1C8];
    v105[1] = MEMORY[0x24BDBD1C8];
    v104[2] = v8;
    objc_msgSend(v1, "dbProtectionType");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v105[2] = v34;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v105, v104, 3);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "dictionaryWithDictionary:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    -[NFStorageController managedObjectModel](v1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      v38 = objc_alloc(MEMORY[0x24BDBB738]);
      -[NFStorageController managedObjectModel](v1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v38, "initWithManagedObjectModel:", v39);
      v41 = v1[3];
      v1[3] = (id)v40;

      v42 = v1[3];
      v43 = *MEMORY[0x24BDBB580];
      v102 = 0;
      objc_msgSend(v42, "addPersistentStoreWithType:configuration:URL:options:error:", v43, 0, v20, v36, &v102);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v102;

      if (v44)
      {
        v10 = v45;
LABEL_50:
        v5 = v1[3];
        goto LABEL_51;
      }
      v58 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v60 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(v1);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(v1);
        Name = sel_getName(sel_persistentStoreCoordinator);
        v63 = 45;
        if (isMetaClass)
          v63 = 43;
        v58 = (const void **)MEMORY[0x24BEDCDB0];
        v60(3, "%c[%{public}s %{public}s]:%i Failed to add SQLite store type: %{public}@", v63, ClassName, Name, 105, v45);
      }
      dispatch_get_specific(*v58);
      NFSharedLogGetLogger();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        v65 = object_getClass(v1);
        if (class_isMetaClass(v65))
          v66 = 43;
        else
          v66 = 45;
        v67 = object_getClassName(v1);
        v68 = sel_getName(sel_persistentStoreCoordinator);
        *(_DWORD *)buf = 67110146;
        v107 = v66;
        v58 = (const void **)MEMORY[0x24BEDCDB0];
        v108 = 2082;
        v109 = v67;
        v110 = 2082;
        v111 = v68;
        v112 = 1024;
        v113 = 105;
        v114 = 2114;
        v115 = v45;
        _os_log_impl(&dword_216CE4000, v64, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to add SQLite store type: %{public}@", buf, 0x2Cu);
      }

      dispatch_get_specific(*v58);
      v69 = NFLogGetLogger();
      if (v69)
      {
        v70 = (void (*)(uint64_t, const char *, ...))v69;
        v71 = object_getClass(v1);
        v72 = class_isMetaClass(v71);
        v95 = object_getClassName(v1);
        v99 = sel_getName(sel_persistentStoreCoordinator);
        v73 = 45;
        if (v72)
          v73 = 43;
        v58 = (const void **)MEMORY[0x24BEDCDB0];
        v70(3, "%c[%{public}s %{public}s]:%i Deleting old DB at %{public}@", v73, v95, v99, 108, v20);
      }
      dispatch_get_specific(*v58);
      NFSharedLogGetLogger();
      v74 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      {
        v75 = object_getClass(v1);
        if (class_isMetaClass(v75))
          v76 = 43;
        else
          v76 = 45;
        v77 = object_getClassName(v1);
        v78 = sel_getName(sel_persistentStoreCoordinator);
        *(_DWORD *)buf = 67110146;
        v107 = v76;
        v58 = (const void **)MEMORY[0x24BEDCDB0];
        v108 = 2082;
        v109 = v77;
        v110 = 2082;
        v111 = v78;
        v112 = 1024;
        v113 = 108;
        v114 = 2114;
        v115 = v20;
        _os_log_impl(&dword_216CE4000, v74, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Deleting old DB at %{public}@", buf, 0x2Cu);
      }

      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "removeItemAtURL:error:", v20, 0);

      v80 = v1[3];
      v101 = v45;
      objc_msgSend(v80, "addPersistentStoreWithType:configuration:URL:options:error:", v43, 0, v20, v36, &v101);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v101;

      if (v81)
        goto LABEL_50;
      dispatch_get_specific(*v58);
      v84 = NFLogGetLogger();
      if (v84)
      {
        v85 = (void (*)(uint64_t, const char *, ...))v84;
        v86 = object_getClass(v1);
        v87 = class_isMetaClass(v86);
        v96 = object_getClassName(v1);
        v100 = sel_getName(sel_persistentStoreCoordinator);
        v88 = 45;
        if (v87)
          v88 = 43;
        v85(3, "%c[%{public}s %{public}s]:%i Failed to add SQLite store type after removing: %{public}@", v88, v96, v100, 116, v10);
      }
      dispatch_get_specific(*v58);
      NFSharedLogGetLogger();
      v89 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
      {
        v90 = object_getClass(v1);
        if (class_isMetaClass(v90))
          v91 = 43;
        else
          v91 = 45;
        v92 = object_getClassName(v1);
        v93 = sel_getName(sel_persistentStoreCoordinator);
        *(_DWORD *)buf = 67110146;
        v107 = v91;
        v108 = 2082;
        v109 = v92;
        v110 = 2082;
        v111 = v93;
        v112 = 1024;
        v113 = 116;
        v114 = 2114;
        v115 = v10;
        _os_log_impl(&dword_216CE4000, v89, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to add SQLite store type after removing: %{public}@", buf, 0x2Cu);
      }

    }
    else
    {
      v46 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v47 = NFLogGetLogger();
      if (v47)
      {
        v48 = (void (*)(uint64_t, const char *, ...))v47;
        v49 = object_getClass(v1);
        v50 = class_isMetaClass(v49);
        v51 = object_getClassName(v1);
        v97 = sel_getName(sel_persistentStoreCoordinator);
        v52 = 45;
        if (v50)
          v52 = 43;
        v48(3, "%c[%{public}s %{public}s]:%i Failed to load model", v52, v51, v97, 95);
      }
      dispatch_get_specific(*v46);
      NFSharedLogGetLogger();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        v54 = object_getClass(v1);
        if (class_isMetaClass(v54))
          v55 = 43;
        else
          v55 = 45;
        v56 = object_getClassName(v1);
        v57 = sel_getName(sel_persistentStoreCoordinator);
        *(_DWORD *)buf = 67109890;
        v107 = v55;
        v108 = 2082;
        v109 = v56;
        v110 = 2082;
        v111 = v57;
        v112 = 1024;
        v113 = 95;
        _os_log_impl(&dword_216CE4000, v53, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to load model", buf, 0x22u);
      }

      v10 = 0;
    }
    v5 = 0;
LABEL_51:

    goto LABEL_52;
  }
  v11 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  v12 = NFLogGetLogger();
  if (v12)
  {
    v13 = (void (*)(uint64_t, const char *, ...))v12;
    v14 = object_getClass(v1);
    v15 = class_isMetaClass(v14);
    v16 = object_getClassName(v1);
    v17 = sel_getName(sel_persistentStoreCoordinator);
    -[NFStorageController homePath]();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 45;
    if (v15)
      v19 = 43;
    v13(3, "%c[%{public}s %{public}s]:%i Failed to create home directory %{public}@: %{public}@", v19, v16, v17, 75, v18, v10);

  }
  dispatch_get_specific(*v11);
  NFSharedLogGetLogger();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v21 = object_getClass(v1);
    if (class_isMetaClass(v21))
      v22 = 43;
    else
      v22 = 45;
    v23 = object_getClassName(v1);
    v24 = sel_getName(sel_persistentStoreCoordinator);
    -[NFStorageController homePath]();
    v25 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67110402;
    v107 = v22;
    v108 = 2082;
    v109 = v23;
    v110 = 2082;
    v111 = v24;
    v112 = 1024;
    v113 = 75;
    v114 = 2114;
    v115 = v25;
    v116 = 2114;
    v117 = v10;
    _os_log_impl(&dword_216CE4000, v20, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to create home directory %{public}@: %{public}@", buf, 0x36u);

  }
  v5 = 0;
LABEL_52:

  if (v5)
    goto LABEL_53;
LABEL_54:
  v1 = (id *)v1[1];

  return v1;
}

- (id)homePath
{
  uid_t v0;
  passwd *v1;
  void *v2;

  v0 = geteuid();
  if (!v0)
    v0 = getuid();
  v1 = getpwuid(v0);
  if (v1)
    v1 = (passwd *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v1->pw_dir);
  -[passwd stringByAppendingPathComponent:](v1, "stringByAppendingPathComponent:", CFSTR("/Library/NFStorage/"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_managedObjectModel, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

@end
