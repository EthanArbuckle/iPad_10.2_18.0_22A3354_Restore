@implementation NFStorageControllerApplet

void __58__NFStorageControllerApplet_fetchAppletEntitiesWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const void **v6;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint32_t v23;
  void *v24;
  void *v25;
  char isKindOfClass;
  id v27;
  void *v28;
  void *v29;
  const void **v30;
  uint64_t v31;
  void (*v32)(uint64_t, const char *, ...);
  objc_class *v33;
  _BOOL4 v34;
  const char *v35;
  uint64_t v36;
  objc_class *v37;
  int v38;
  const char *v39;
  const char *v40;
  const void **v41;
  uint64_t v42;
  void (*v43)(uint64_t, const char *, ...);
  objc_class *v44;
  _BOOL4 v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  NSObject *v49;
  objc_class *v50;
  int v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  id obj;
  uint8_t buf[4];
  int v65;
  __int16 v66;
  const char *v67;
  __int16 v68;
  const char *v69;
  __int16 v70;
  int v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  int v75;
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  +[AppletEntity fetchRequest](AppletEntity, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[NFStorageController managedObjectContext](*(id **)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v6 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v8(3, "%c[%{public}s %{public}s]:%i Failed to execute fetch request: %{public}@", v13, ClassName, Name, 52, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    }
    dispatch_get_specific(*v6);
    NFSharedLogGetLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15))
        v16 = 43;
      else
        v16 = 45;
      v17 = object_getClassName(*(id *)(a1 + 32));
      v18 = sel_getName(*(SEL *)(a1 + 56));
      v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 67110146;
      v65 = v16;
      v66 = 2082;
      v67 = v17;
      v68 = 2082;
      v69 = v18;
      v70 = 1024;
      v71 = 52;
      v72 = 2114;
      v73 = v19;
      v20 = "%c[%{public}s %{public}s]:%i Failed to execute fetch request: %{public}@";
      v21 = v14;
      v22 = OS_LOG_TYPE_ERROR;
      v23 = 44;
LABEL_11:
      _os_log_impl(&dword_216CE4000, v21, v22, v20, buf, v23);
    }
  }
  else if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject version](v14, "version") == 4)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[NSObject crsUpdateCounter](v14, "crsUpdateCounter"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject applets](v14, "applets");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v27 = objc_alloc(MEMORY[0x24BDBCE30]);
        -[NSObject applets](v14, "applets");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)objc_msgSend(v27, "initWithArray:", v28);

      }
      else
      {
        v29 = 0;
      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKey:", v24, CFSTR("crsUpdateCounter"));
      v56 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v57 = objc_alloc(MEMORY[0x24BDD17C8]);
      -[NSObject seid](v14, "seid");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = (void *)objc_msgSend(v57, "initWithString:", v58);
      objc_msgSend(v56, "setObject:forKey:", v59, CFSTR("seid"));

      if (v29)
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKey:", v29, CFSTR("applets"));
      -[NFStorageController managedObjectContext](*(id **)(a1 + 32));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "reset");

    }
    else
    {
      v41 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v42 = NFLogGetLogger();
      if (v42)
      {
        v43 = (void (*)(uint64_t, const char *, ...))v42;
        v44 = object_getClass(*(id *)(a1 + 32));
        v45 = class_isMetaClass(v44);
        v46 = object_getClassName(*(id *)(a1 + 32));
        v47 = sel_getName(*(SEL *)(a1 + 56));
        v62 = -[NSObject version](v14, "version");
        v48 = 45;
        if (v45)
          v48 = 43;
        v43(3, "%c[%{public}s %{public}s]:%i Wrong applet storage version %llu, expecting %d", v48, v46, v47, 63, v62, 4);
      }
      dispatch_get_specific(*v41);
      NFSharedLogGetLogger();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        v50 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v50))
          v51 = 43;
        else
          v51 = 45;
        v52 = object_getClassName(*(id *)(a1 + 32));
        v53 = sel_getName(*(SEL *)(a1 + 56));
        v54 = -[NSObject version](v14, "version");
        *(_DWORD *)buf = 67110402;
        v65 = v51;
        v66 = 2082;
        v67 = v52;
        v68 = 2082;
        v69 = v53;
        v70 = 1024;
        v71 = 63;
        v72 = 2048;
        v73 = v54;
        v74 = 1024;
        v75 = 4;
        _os_log_impl(&dword_216CE4000, v49, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Wrong applet storage version %llu, expecting %d", buf, 0x32u);
      }

      v55 = (id)objc_msgSend(*(id *)(a1 + 32), "_deleteAllAppletEntities");
    }
  }
  else
  {
    v30 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v31 = NFLogGetLogger();
    if (v31)
    {
      v32 = (void (*)(uint64_t, const char *, ...))v31;
      v33 = object_getClass(*(id *)(a1 + 32));
      v34 = class_isMetaClass(v33);
      v35 = object_getClassName(*(id *)(a1 + 32));
      v61 = sel_getName(*(SEL *)(a1 + 56));
      v36 = 45;
      if (v34)
        v36 = 43;
      v32(6, "%c[%{public}s %{public}s]:%i No applets found in storage", v36, v35, v61, 58);
    }
    dispatch_get_specific(*v30);
    NFSharedLogGetLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v37 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v37))
        v38 = 43;
      else
        v38 = 45;
      v39 = object_getClassName(*(id *)(a1 + 32));
      v40 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67109890;
      v65 = v38;
      v66 = 2082;
      v67 = v39;
      v68 = 2082;
      v69 = v40;
      v70 = 1024;
      v71 = 58;
      v20 = "%c[%{public}s %{public}s]:%i No applets found in storage";
      v21 = v14;
      v22 = OS_LOG_TYPE_DEFAULT;
      v23 = 34;
      goto LABEL_11;
    }
  }

}

- (id)fetchAppletEntitiesWithError:(id *)a3
{
  void *v6;
  void *v7;
  const void **v8;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v11;
  const char *ClassName;
  const char *Name;
  NSObject *v14;
  objc_class *v15;
  int v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  id v20;
  const void **v22;
  uint64_t v23;
  void (*v24)(uint64_t, const char *, ...);
  objc_class *v25;
  _BOOL4 isMetaClass;
  const char *v27;
  uint64_t v28;
  NSObject *v29;
  objc_class *v30;
  int v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  const char *v39;
  _QWORD v40[8];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint8_t buf[4];
  int v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  uint64_t v56;
  uint8_t v57[8];
  _BYTE v58[32];
  id v59;
  _QWORD v60[5];
  _QWORD v61[6];

  v61[5] = *MEMORY[0x24BDAC8D0];
  -[NFStorageController managedObjectContext]((id *)&self->super.super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    *(_QWORD *)v57 = 0;
    *(_QWORD *)v58 = v57;
    *(_QWORD *)&v58[8] = 0x3032000000;
    *(_QWORD *)&v58[16] = __Block_byref_object_copy_;
    *(_QWORD *)&v58[24] = __Block_byref_object_dispose_;
    v59 = (id)objc_opt_new();
    v41 = 0;
    v42 = &v41;
    v43 = 0x3032000000;
    v44 = __Block_byref_object_copy_;
    v45 = __Block_byref_object_dispose_;
    v46 = 0;
    -[NFStorageController managedObjectContext]((id *)&self->super.super.isa);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __58__NFStorageControllerApplet_fetchAppletEntitiesWithError___block_invoke;
    v40[3] = &unk_24D610E00;
    v40[4] = self;
    v40[5] = &v41;
    v40[6] = v57;
    v40[7] = a2;
    objc_msgSend(v7, "performBlockAndWait:", v40);

    if (a3)
      *a3 = objc_retainAutorelease((id)v42[5]);
    v8 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(self);
      if (class_isMetaClass(Class))
        v11 = 43;
      else
        v11 = 45;
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      Logger(6, "%c[%{public}s %{public}s]:%i applets: %{public}@", v11, ClassName, Name, 86, *(_QWORD *)(*(_QWORD *)v58 + 40));
    }
    dispatch_get_specific(*v8);
    NFSharedLogGetLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = object_getClass(self);
      if (class_isMetaClass(v15))
        v16 = 43;
      else
        v16 = 45;
      v17 = object_getClassName(self);
      v18 = sel_getName(a2);
      v19 = *(_QWORD *)(*(_QWORD *)v58 + 40);
      *(_DWORD *)buf = 67110146;
      v48 = v16;
      v49 = 2082;
      v50 = v17;
      v51 = 2082;
      v52 = v18;
      v53 = 1024;
      v54 = 86;
      v55 = 2114;
      v56 = v19;
      _os_log_impl(&dword_216CE4000, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i applets: %{public}@", buf, 0x2Cu);
    }

    v20 = *(id *)(*(_QWORD *)v58 + 40);
    _Block_object_dispose(&v41, 8);

    _Block_object_dispose(v57, 8);
    return v20;
  }
  else
  {
    v22 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v23 = NFLogGetLogger();
    if (v23)
    {
      v24 = (void (*)(uint64_t, const char *, ...))v23;
      v25 = object_getClass(self);
      isMetaClass = class_isMetaClass(v25);
      v27 = object_getClassName(self);
      v39 = sel_getName(a2);
      v28 = 45;
      if (isMetaClass)
        v28 = 43;
      v24(3, "%c[%{public}s %{public}s]:%i managedObjectContext is NULL", v28, v27, v39, 36);
    }
    dispatch_get_specific(*v22);
    NFSharedLogGetLogger();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = object_getClass(self);
      if (class_isMetaClass(v30))
        v31 = 43;
      else
        v31 = 45;
      *(_DWORD *)v57 = 67109890;
      *(_DWORD *)&v57[4] = v31;
      *(_WORD *)v58 = 2082;
      *(_QWORD *)&v58[2] = object_getClassName(self);
      *(_WORD *)&v58[10] = 2082;
      *(_QWORD *)&v58[12] = sel_getName(a2);
      *(_WORD *)&v58[20] = 1024;
      *(_DWORD *)&v58[22] = 36;
      _os_log_impl(&dword_216CE4000, v29, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i managedObjectContext is NULL", v57, 0x22u);
    }

    if (a3)
    {
      v32 = objc_alloc(MEMORY[0x24BDD1540]);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "nfcd");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unknown Error");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v61[0] = v34;
      v61[1] = &unk_24D611F10;
      v60[1] = CFSTR("Line");
      v60[2] = CFSTR("Method");
      v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v61[2] = v35;
      v60[3] = *MEMORY[0x24BDD0BA0];
      v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 38);
      v61[3] = v36;
      v60[4] = *MEMORY[0x24BDD0FD8];
      v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("managedObjectContext is NULL"));
      v61[4] = v37;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v61, v60, 5);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *a3 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v33, 6, v38);

    }
    return 0;
  }
}

- (id)name
{
  return CFSTR("Applet");
}

- (id)dbProtectionType
{
  return (id)*MEMORY[0x24BDD0CF8];
}

- (id)_deleteAllAppletEntities
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  const void **v9;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  const char *v18;
  const char *v19;
  const char *ClassName;
  const char *Name;
  id v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  +[AppletEntity fetchRequest](AppletEntity, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB5E8]), "initWithFetchRequest:", v4);
  -[NFStorageController managedObjectContext]((id *)&self->super.super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v7 = (id)objc_msgSend(v6, "executeRequest:error:", v5, &v23);
  v8 = v23;

  if (v8)
  {
    v9 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v14 = 45;
      if (isMetaClass)
        v14 = 43;
      v11(3, "%c[%{public}s %{public}s]:%i Failed to execute delete request: %{public}@", v14, ClassName, Name, 100, v8);
    }
    dispatch_get_specific(*v9);
    NFSharedLogGetLogger();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = object_getClass(self);
      if (class_isMetaClass(v16))
        v17 = 43;
      else
        v17 = 45;
      v18 = object_getClassName(self);
      v19 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v25 = v17;
      v26 = 2082;
      v27 = v18;
      v28 = 2082;
      v29 = v19;
      v30 = 1024;
      v31 = 100;
      v32 = 2114;
      v33 = v8;
      _os_log_impl(&dword_216CE4000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to execute delete request: %{public}@", buf, 0x2Cu);
    }

  }
  return v8;
}

- (id)updateAppletEntitiesWithConfig:(id)a3
{
  id v5;
  void *v6;
  const void **v7;
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  void *v16;
  void *v17;
  objc_class *v18;
  _BOOL4 v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  objc_class *v23;
  int v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  const char *ClassName;
  const char *Name;
  const char *v34;
  _QWORD v35[5];
  id v36;
  SEL v37;
  uint8_t buf[4];
  int v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  id v47;
  _QWORD v48[4];
  _QWORD v49[5];

  v49[4] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[NFStorageController managedObjectContext]((id *)&self->super.super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  Logger = NFLogGetLogger();
  v9 = (void (*)(uint64_t, const char *, ...))Logger;
  if (v6)
  {
    if (Logger)
    {
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v12 = 45;
      if (isMetaClass)
        v12 = 43;
      v9(6, "%c[%{public}s %{public}s]:%i new Applet Config=%{public}@", v12, ClassName, Name, 122, v5);
    }
    dispatch_get_specific(*v7);
    NFSharedLogGetLogger();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = object_getClass(self);
      if (class_isMetaClass(v14))
        v15 = 43;
      else
        v15 = 45;
      *(_DWORD *)buf = 67110146;
      v39 = v15;
      v40 = 2082;
      v41 = object_getClassName(self);
      v42 = 2082;
      v43 = sel_getName(a2);
      v44 = 1024;
      v45 = 122;
      v46 = 2114;
      v47 = v5;
      _os_log_impl(&dword_216CE4000, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i new Applet Config=%{public}@", buf, 0x2Cu);
    }

    -[NFStorageController managedObjectContext]((id *)&self->super.super.isa);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __60__NFStorageControllerApplet_updateAppletEntitiesWithConfig___block_invoke;
    v35[3] = &unk_24D610E78;
    v35[4] = self;
    v37 = a2;
    v36 = v5;
    objc_msgSend(v16, "performBlock:", v35);

    v17 = 0;
  }
  else
  {
    if (Logger)
    {
      v18 = object_getClass(self);
      v19 = class_isMetaClass(v18);
      v20 = object_getClassName(self);
      v34 = sel_getName(a2);
      v21 = 45;
      if (v19)
        v21 = 43;
      v9(3, "%c[%{public}s %{public}s]:%i managedObjectContext is NULL", v21, v20, v34, 118);
    }
    dispatch_get_specific(*v7);
    NFSharedLogGetLogger();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = object_getClass(self);
      if (class_isMetaClass(v23))
        v24 = 43;
      else
        v24 = 45;
      *(_DWORD *)buf = 67109890;
      v39 = v24;
      v40 = 2082;
      v41 = object_getClassName(self);
      v42 = 2082;
      v43 = sel_getName(a2);
      v44 = 1024;
      v45 = 118;
      _os_log_impl(&dword_216CE4000, v22, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i managedObjectContext is NULL", buf, 0x22u);
    }

    v25 = objc_alloc(MEMORY[0x24BDD1540]);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "nfcd");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v27;
    v49[1] = &unk_24D611F28;
    v48[1] = CFSTR("Line");
    v48[2] = CFSTR("Method");
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v49[2] = v28;
    v48[3] = *MEMORY[0x24BDD0BA0];
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 119);
    v49[3] = v29;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, v48, 4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v25, "initWithDomain:code:userInfo:", v26, 12, v30);

  }
  return v17;
}

void __60__NFStorageControllerApplet_updateAppletEntitiesWithConfig___block_invoke(uint64_t a1)
{
  const void **v2;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v5;
  const char *ClassName;
  const char *Name;
  NSObject *v8;
  objc_class *v9;
  int v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  id *v23;
  const void **v24;
  void (*v25)(uint64_t, const char *, ...);
  objc_class *v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  NSObject *v30;
  objc_class *v31;
  int v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  id obj;
  _QWORD v38[10];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint8_t v57[4];
  int v58;
  __int16 v59;
  const char *v60;
  __int16 v61;
  const char *v62;
  __int16 v63;
  int v64;
  __int16 v65;
  uint64_t v66;
  uint8_t buf[8];
  _BYTE v68[40];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy_;
  v55 = __Block_byref_object_dispose_;
  objc_msgSend(*(id *)(a1 + 32), "_deleteAllAppletEntities");
  v56 = (id)objc_claimAutoreleasedReturnValue();
  if (v52[5])
  {
    v2 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(Class))
        v5 = 43;
      else
        v5 = 45;
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      Logger(3, "%c[%{public}s %{public}s]:%i Failed to delete all: %{public}@", v5, ClassName, Name, 129, v52[5]);
    }
    dispatch_get_specific(*v2);
    NFSharedLogGetLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v9))
        v10 = 43;
      else
        v10 = 45;
      v11 = object_getClassName(*(id *)(a1 + 32));
      v12 = sel_getName(*(SEL *)(a1 + 48));
      v13 = v52[5];
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)&buf[4] = v10;
      *(_WORD *)v68 = 2082;
      *(_QWORD *)&v68[2] = v11;
      *(_WORD *)&v68[10] = 2082;
      *(_QWORD *)&v68[12] = v12;
      *(_WORD *)&v68[20] = 1024;
      *(_DWORD *)&v68[22] = 129;
      *(_WORD *)&v68[26] = 2114;
      *(_QWORD *)&v68[28] = v13;
      _os_log_impl(&dword_216CE4000, v8, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to delete all: %{public}@", buf, 0x2Cu);
    }

    -[NFStorageController managedObjectContext](*(id **)(a1 + 32));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "reset");

  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)v68 = buf;
    *(_QWORD *)&v68[8] = 0x3032000000;
    *(_QWORD *)&v68[16] = __Block_byref_object_copy_;
    *(_QWORD *)&v68[24] = __Block_byref_object_dispose_;
    *(_QWORD *)&v68[32] = 0;
    v45 = 0;
    v46 = &v45;
    v47 = 0x3032000000;
    v48 = __Block_byref_object_copy_;
    v49 = __Block_byref_object_dispose_;
    v50 = 0;
    v39 = 0;
    v40 = &v39;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy_;
    v43 = __Block_byref_object_dispose_;
    v44 = 0;
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __60__NFStorageControllerApplet_updateAppletEntitiesWithConfig___block_invoke_118;
    v38[3] = &unk_24D610E50;
    v15 = *(void **)(a1 + 40);
    v38[4] = *(_QWORD *)(a1 + 32);
    v38[5] = &v51;
    v16 = *(_QWORD *)(a1 + 48);
    v38[6] = buf;
    v38[7] = &v45;
    v38[8] = &v39;
    v38[9] = v16;
    objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v38);
    if (!v52[5])
    {
      v17 = (void *)MEMORY[0x24BDBB658];
      -[NFStorageController managedObjectContext](*(id **)(a1 + 32));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("AppletEntity"), v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "setVersion:", 4);
      objc_msgSend(v19, "setCrsUpdateCounter:", objc_msgSend(*(id *)(*(_QWORD *)v68 + 40), "longLongValue"));
      objc_msgSend(v19, "setSeid:", v46[5]);
      objc_msgSend(v19, "setApplets:", v40[5]);
      -[NFStorageController managedObjectContext](*(id **)(a1 + 32));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "hasChanges");

      if (v21)
      {
        -[NFStorageController managedObjectContext](*(id **)(a1 + 32));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (id *)(v52 + 5);
        obj = (id)v52[5];
        objc_msgSend(v22, "save:", &obj);
        objc_storeStrong(v23, obj);

        if (v52[5])
        {
          v24 = (const void **)MEMORY[0x24BEDCDB0];
          dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
          v25 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v25)
          {
            v26 = object_getClass(*(id *)(a1 + 32));
            if (class_isMetaClass(v26))
              v27 = 43;
            else
              v27 = 45;
            v28 = object_getClassName(*(id *)(a1 + 32));
            v29 = sel_getName(*(SEL *)(a1 + 48));
            v25(3, "%c[%{public}s %{public}s]:%i Failed to save: %{public}@", v27, v28, v29, 188, v52[5]);
          }
          dispatch_get_specific(*v24);
          NFSharedLogGetLogger();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v31 = object_getClass(*(id *)(a1 + 32));
            if (class_isMetaClass(v31))
              v32 = 43;
            else
              v32 = 45;
            v33 = object_getClassName(*(id *)(a1 + 32));
            v34 = sel_getName(*(SEL *)(a1 + 48));
            v35 = v52[5];
            *(_DWORD *)v57 = 67110146;
            v58 = v32;
            v59 = 2082;
            v60 = v33;
            v61 = 2082;
            v62 = v34;
            v63 = 1024;
            v64 = 188;
            v65 = 2114;
            v66 = v35;
            _os_log_impl(&dword_216CE4000, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to save: %{public}@", v57, 0x2Cu);
          }

        }
      }

    }
    -[NFStorageController managedObjectContext](*(id **)(a1 + 32));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "reset");

    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(&v45, 8);

    _Block_object_dispose(buf, 8);
  }
  _Block_object_dispose(&v51, 8);

}

void __60__NFStorageControllerApplet_updateAppletEntitiesWithConfig___block_invoke_118(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  _BYTE *v10;
  const void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *v14;
  _BOOL4 v15;
  const char *v16;
  const char *v17;
  objc_class *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  const char *v24;
  const char *v25;
  objc_class *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const void **v37;
  uint64_t Logger;
  void (*v39)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  objc_class *v44;
  id v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  objc_class *v49;
  int v50;
  const char *v51;
  const char *v52;
  objc_class *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  _QWORD *v62;
  _QWORD *v63;
  uint64_t v64;
  void *v65;
  const void **v66;
  uint64_t v67;
  void (*v68)(uint64_t, const char *, ...);
  objc_class *v69;
  _BOOL4 v70;
  const char *v71;
  const char *v72;
  objc_class *v73;
  id v74;
  void *v75;
  uint64_t v76;
  NSObject *v77;
  objc_class *v78;
  int v79;
  const char *v80;
  const char *v81;
  objc_class *v82;
  void *v83;
  const void **v84;
  uint64_t v85;
  void (*v86)(uint64_t, const char *, ...);
  objc_class *v87;
  _BOOL4 v88;
  const char *v89;
  const char *v90;
  objc_class *v91;
  id v92;
  void *v93;
  uint64_t v94;
  NSObject *v95;
  objc_class *v96;
  int v97;
  const char *v98;
  const char *v99;
  objc_class *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  id v106;
  _BYTE *v107;
  _QWORD v108[6];
  _QWORD v109[4];
  _QWORD v110[4];
  _QWORD v111[4];
  _QWORD v112[4];
  _QWORD v113[4];
  _QWORD v114[4];
  _QWORD v115[4];
  _QWORD v116[4];
  uint8_t buf[4];
  int v118;
  __int16 v119;
  const char *v120;
  __int16 v121;
  const char *v122;
  __int16 v123;
  int v124;
  __int16 v125;
  void *v126;
  uint64_t v127;

  v127 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("crsUpdateCounter")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = *(_QWORD *)(a1 + 48);
LABEL_18:
        objc_storeStrong((id *)(*(_QWORD *)(v9 + 8) + 40), a3);
        goto LABEL_53;
      }
      v107 = a4;
      v37 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v39 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(*(id *)(a1 + 32));
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(*(id *)(a1 + 32));
        Name = sel_getName(*(SEL *)(a1 + 72));
        v44 = (objc_class *)objc_opt_class();
        NSStringFromClass(v44);
        v45 = v8;
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 45;
        if (isMetaClass)
          v47 = 43;
        v39(3, "%c[%{public}s %{public}s]:%i invalid type (%{public}@) for counter", v47, ClassName, Name, 146, v46);

        v8 = v45;
      }
      dispatch_get_specific(*v37);
      NFSharedLogGetLogger();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v49 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v49))
          v50 = 43;
        else
          v50 = 45;
        v51 = object_getClassName(*(id *)(a1 + 32));
        v52 = sel_getName(*(SEL *)(a1 + 72));
        v53 = (objc_class *)objc_opt_class();
        NSStringFromClass(v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67110146;
        v118 = v50;
        v119 = 2082;
        v120 = v51;
        v121 = 2082;
        v122 = v52;
        v123 = 1024;
        v124 = 146;
        v125 = 2114;
        v126 = v54;
        _os_log_impl(&dword_216CE4000, v48, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i invalid type (%{public}@) for counter", buf, 0x2Cu);

      }
      v55 = objc_alloc(MEMORY[0x24BDD1540]);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "nfcd");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v113[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v114[0] = v57;
      v114[1] = &unk_24D611F58;
      v113[1] = CFSTR("Line");
      v113[2] = CFSTR("Method");
      v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 72)));
      v114[2] = v58;
      v113[3] = *MEMORY[0x24BDD0BA0];
      v59 = v8;
      v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 72)), 147);
      v114[3] = v60;
      v61 = (void *)MEMORY[0x24BDBCE70];
      v62 = v114;
      v63 = v113;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("seid")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = *(_QWORD *)(a1 + 56);
        goto LABEL_18;
      }
      v107 = a4;
      v66 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v67 = NFLogGetLogger();
      if (v67)
      {
        v68 = (void (*)(uint64_t, const char *, ...))v67;
        v69 = object_getClass(*(id *)(a1 + 32));
        v70 = class_isMetaClass(v69);
        v71 = object_getClassName(*(id *)(a1 + 32));
        v72 = sel_getName(*(SEL *)(a1 + 72));
        v73 = (objc_class *)objc_opt_class();
        NSStringFromClass(v73);
        v74 = v8;
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = 45;
        if (v70)
          v76 = 43;
        v68(3, "%c[%{public}s %{public}s]:%i invalid type (%{public}@) for seid", v76, v71, v72, 154, v75);

        v8 = v74;
      }
      dispatch_get_specific(*v66);
      NFSharedLogGetLogger();
      v77 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        v78 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v78))
          v79 = 43;
        else
          v79 = 45;
        v80 = object_getClassName(*(id *)(a1 + 32));
        v81 = sel_getName(*(SEL *)(a1 + 72));
        v82 = (objc_class *)objc_opt_class();
        NSStringFromClass(v82);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67110146;
        v118 = v79;
        v119 = 2082;
        v120 = v80;
        v121 = 2082;
        v122 = v81;
        v123 = 1024;
        v124 = 154;
        v125 = 2114;
        v126 = v83;
        _os_log_impl(&dword_216CE4000, v77, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i invalid type (%{public}@) for seid", buf, 0x2Cu);

      }
      v55 = objc_alloc(MEMORY[0x24BDD1540]);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "nfcd");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v111[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v112[0] = v57;
      v112[1] = &unk_24D611F70;
      v111[1] = CFSTR("Line");
      v111[2] = CFSTR("Method");
      v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 72)));
      v112[2] = v58;
      v111[3] = *MEMORY[0x24BDD0BA0];
      v59 = v8;
      v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 72)), 155);
      v112[3] = v60;
      v61 = (void *)MEMORY[0x24BDBCE70];
      v62 = v112;
      v63 = v111;
    }
    else
    {
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("applets")))
        goto LABEL_53;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3);
        v108[0] = MEMORY[0x24BDAC760];
        v108[2] = __60__NFStorageControllerApplet_updateAppletEntitiesWithConfig___block_invoke_127;
        v108[3] = &unk_24D610E28;
        v64 = *(_QWORD *)(a1 + 72);
        v65 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        v108[1] = 3221225472;
        v108[4] = *(_QWORD *)(a1 + 40);
        v108[5] = v64;
        objc_msgSend(v65, "enumerateObjectsUsingBlock:", v108);
        goto LABEL_53;
      }
      v107 = a4;
      v84 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v85 = NFLogGetLogger();
      if (v85)
      {
        v86 = (void (*)(uint64_t, const char *, ...))v85;
        v87 = object_getClass(*(id *)(a1 + 32));
        v88 = class_isMetaClass(v87);
        v89 = object_getClassName(*(id *)(a1 + 32));
        v90 = sel_getName(*(SEL *)(a1 + 72));
        v91 = (objc_class *)objc_opt_class();
        NSStringFromClass(v91);
        v92 = v8;
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = 45;
        if (v88)
          v94 = 43;
        v86(3, "%c[%{public}s %{public}s]:%i invalid type (%{public}@) for applets", v94, v89, v90, 162, v93);

        v8 = v92;
      }
      dispatch_get_specific(*v84);
      NFSharedLogGetLogger();
      v95 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
      {
        v96 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v96))
          v97 = 43;
        else
          v97 = 45;
        v98 = object_getClassName(*(id *)(a1 + 32));
        v99 = sel_getName(*(SEL *)(a1 + 72));
        v100 = (objc_class *)objc_opt_class();
        NSStringFromClass(v100);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67110146;
        v118 = v97;
        v119 = 2082;
        v120 = v98;
        v121 = 2082;
        v122 = v99;
        v123 = 1024;
        v124 = 162;
        v125 = 2114;
        v126 = v101;
        _os_log_impl(&dword_216CE4000, v95, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i invalid type (%{public}@) for applets", buf, 0x2Cu);

      }
      v55 = objc_alloc(MEMORY[0x24BDD1540]);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "nfcd");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v109[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v110[0] = v57;
      v110[1] = &unk_24D611F88;
      v109[1] = CFSTR("Line");
      v109[2] = CFSTR("Method");
      v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 72)));
      v110[2] = v58;
      v109[3] = *MEMORY[0x24BDD0BA0];
      v59 = v8;
      v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 72)), 163);
      v110[3] = v60;
      v61 = (void *)MEMORY[0x24BDBCE70];
      v62 = v110;
      v63 = v109;
    }
    objc_msgSend(v61, "dictionaryWithObjects:forKeys:count:", v62, v63, 4);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = objc_msgSend(v55, "initWithDomain:code:userInfo:", v56, 10, v102);
    v104 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v105 = *(void **)(v104 + 40);
    *(_QWORD *)(v104 + 40) = v103;

    v8 = v59;
    *v107 = 1;
    goto LABEL_53;
  }
  v106 = v8;
  v10 = a4;
  v11 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  v12 = NFLogGetLogger();
  if (v12)
  {
    v13 = (void (*)(uint64_t, const char *, ...))v12;
    v14 = object_getClass(*(id *)(a1 + 32));
    v15 = class_isMetaClass(v14);
    v16 = object_getClassName(*(id *)(a1 + 32));
    v17 = sel_getName(*(SEL *)(a1 + 72));
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 45;
    if (v15)
      v20 = 43;
    v13(3, "%c[%{public}s %{public}s]:%i invalid type (%{public}@) for key", v20, v16, v17, 141, v19);

  }
  dispatch_get_specific(*v11);
  NFSharedLogGetLogger();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v22 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v22))
      v23 = 43;
    else
      v23 = 45;
    v24 = object_getClassName(*(id *)(a1 + 32));
    v25 = sel_getName(*(SEL *)(a1 + 72));
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67110146;
    v118 = v23;
    v119 = 2082;
    v120 = v24;
    v121 = 2082;
    v122 = v25;
    v123 = 1024;
    v124 = 141;
    v125 = 2114;
    v126 = v27;
    _os_log_impl(&dword_216CE4000, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i invalid type (%{public}@) for key", buf, 0x2Cu);

  }
  v28 = objc_alloc(MEMORY[0x24BDD1540]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "nfcd");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v115[0] = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v116[0] = v30;
  v116[1] = &unk_24D611F40;
  v115[1] = CFSTR("Line");
  v115[2] = CFSTR("Method");
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 72)));
  v116[2] = v31;
  v115[3] = *MEMORY[0x24BDD0BA0];
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 72)), 142);
  v116[3] = v32;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v116, v115, 4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v28, "initWithDomain:code:userInfo:", v29, 10, v33);
  v35 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v36 = *(void **)(v35 + 40);
  *(_QWORD *)(v35 + 40) = v34;

  *v10 = 1;
  v8 = v106;
LABEL_53:

}

void __60__NFStorageControllerApplet_updateAppletEntitiesWithConfig___block_invoke_127(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  char isKindOfClass;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    *a4 = 1;
    v8 = objc_alloc(MEMORY[0x24BDD1540]);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "nfcd");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    v18[1] = &unk_24D611FA0;
    v17[1] = CFSTR("Line");
    v17[2] = CFSTR("Method");
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 40)));
    v18[2] = v11;
    v17[3] = *MEMORY[0x24BDD0BA0];
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 40)), 170);
    v18[3] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v8, "initWithDomain:code:userInfo:", v9, 10, v13);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

  }
}

- (void)deleteAllAppletEntities
{
  void *v4;
  NSObject *v5;
  const void **v6;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v12;
  objc_class *v13;
  int v14;
  const char *Name;
  _QWORD v16[6];
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[NFStorageController managedObjectContext]((id *)&self->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NFStorageController managedObjectContext]((id *)&self->super.super.isa);
    v5 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __52__NFStorageControllerApplet_deleteAllAppletEntities__block_invoke;
    v16[3] = &unk_24D610EA0;
    v16[4] = self;
    v16[5] = a2;
    -[NSObject performBlock:](v5, "performBlock:", v16);
  }
  else
  {
    v6 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v12 = 45;
      if (isMetaClass)
        v12 = 43;
      v8(3, "%c[%{public}s %{public}s]:%i managedObjectContext is NULL", v12, ClassName, Name, 204);
    }
    dispatch_get_specific(*v6);
    NFSharedLogGetLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v13 = object_getClass(self);
      if (class_isMetaClass(v13))
        v14 = 43;
      else
        v14 = 45;
      *(_DWORD *)buf = 67109890;
      v18 = v14;
      v19 = 2082;
      v20 = object_getClassName(self);
      v21 = 2082;
      v22 = sel_getName(a2);
      v23 = 1024;
      v24 = 204;
      _os_log_impl(&dword_216CE4000, v5, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i managedObjectContext is NULL", buf, 0x22u);
    }
  }

}

void __52__NFStorageControllerApplet_deleteAllAppletEntities__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  int v4;
  void *v5;
  const void **v6;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  const char *v15;
  const char *v16;
  void *v17;
  const char *ClassName;
  const char *Name;
  id v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_deleteAllAppletEntities");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    -[NFStorageController managedObjectContext](*(id **)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasChanges");

    if (v4)
    {
      -[NFStorageController managedObjectContext](*(id **)(a1 + 32));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      objc_msgSend(v5, "save:", &v20);
      v2 = v20;

      if (v2)
      {
        v6 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        Logger = NFLogGetLogger();
        if (Logger)
        {
          v8 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(*(id *)(a1 + 32));
          isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(*(id *)(a1 + 32));
          Name = sel_getName(*(SEL *)(a1 + 40));
          v11 = 45;
          if (isMetaClass)
            v11 = 43;
          v8(3, "%c[%{public}s %{public}s]:%i Failed to save: %{public}@", v11, ClassName, Name, 216, v2);
        }
        dispatch_get_specific(*v6);
        NFSharedLogGetLogger();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = object_getClass(*(id *)(a1 + 32));
          if (class_isMetaClass(v13))
            v14 = 43;
          else
            v14 = 45;
          v15 = object_getClassName(*(id *)(a1 + 32));
          v16 = sel_getName(*(SEL *)(a1 + 40));
          *(_DWORD *)buf = 67110146;
          v22 = v14;
          v23 = 2082;
          v24 = v15;
          v25 = 2082;
          v26 = v16;
          v27 = 1024;
          v28 = 216;
          v29 = 2114;
          v30 = v2;
          _os_log_impl(&dword_216CE4000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to save: %{public}@", buf, 0x2Cu);
        }

      }
    }
    else
    {
      v2 = 0;
    }
  }
  -[NFStorageController managedObjectContext](*(id **)(a1 + 32));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "reset");

}

@end
