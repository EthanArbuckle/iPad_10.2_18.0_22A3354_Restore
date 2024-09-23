@implementation NFFieldDetectManager

- (void)enumerateFieldDetectSessionsUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = (void (**)(id, _QWORD))a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldDetectManager fieldDetectSessions](self, "fieldDetectSessions", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSHashTable)fieldDetectSessions
{
  return self->_fieldDetectSessions;
}

- (NFFieldDetectManager)init
{
  NFFieldDetectManager *v2;
  uint64_t v3;
  NSHashTable *fieldDetectSessions;
  NSMutableSet *v5;
  NSMutableSet *persistentFieldDetectClients;
  NSMutableSet *v7;
  NSMutableSet *suspensionRequestor;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void (*v21)(uint64_t, const char *, ...);
  objc_class *v22;
  _BOOL4 v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  objc_class *v29;
  int v30;
  const char *v31;
  const char *v32;
  void *v33;
  id v34;
  void *specific;
  uint64_t Logger;
  void (*v37)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  objc_class *v44;
  int v45;
  const char *v46;
  const char *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void (*v51)(uint64_t, const char *, ...);
  objc_class *v52;
  _BOOL4 v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  NSObject *v58;
  objc_class *v59;
  int v60;
  const char *v61;
  const char *v62;
  NFFieldDetectManager *v63;
  const char *Name;
  const char *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  id obj;
  objc_super v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t buf[4];
  int v77;
  __int16 v78;
  const char *v79;
  __int16 v80;
  const char *v81;
  __int16 v82;
  int v83;
  __int16 v84;
  void *v85;
  uint8_t v86[4];
  int v87;
  __int16 v88;
  const char *v89;
  __int16 v90;
  const char *v91;
  __int16 v92;
  int v93;

  v71.receiver = self;
  v71.super_class = (Class)NFFieldDetectManager;
  v2 = -[NFFieldDetectManager init](&v71, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    fieldDetectSessions = v2->_fieldDetectSessions;
    v2->_fieldDetectSessions = (NSHashTable *)v3;

    v5 = objc_opt_new(NSMutableSet);
    persistentFieldDetectClients = v2->_persistentFieldDetectClients;
    v2->_persistentFieldDetectClients = v5;

    v7 = objc_opt_new(NSMutableSet);
    suspensionRequestor = v2->_suspensionRequestor;
    v2->_suspensionRequestor = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v9, "removeObjectForKey:", CFSTR("FieldDetect"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "arrayForKey:", CFSTR("FieldDetectClients")));
    if (v10)
    {
      v11 = objc_opt_class(NSArray);
      if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
      {
        v68 = v10;
        v69 = v9;
        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        obj = v10;
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v86, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v73;
          do
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(_QWORD *)v73 != v14)
                objc_enumerationMutation(obj);
              v16 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)i);
              v17 = objc_opt_class(NSString);
              if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
              {
                if (objc_msgSend(v16, "lengthOfBytesUsingEncoding:", 4))
                {
                  v18 = objc_claimAutoreleasedReturnValue(-[NFFieldDetectManager persistentFieldDetectClients](v2, "persistentFieldDetectClients"));
                  -[NSObject addObject:](v18, "addObject:", v16);
                }
                else
                {
                  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                  Logger = NFLogGetLogger(specific);
                  if (Logger)
                  {
                    v37 = (void (*)(uint64_t, const char *, ...))Logger;
                    Class = object_getClass(v2);
                    isMetaClass = class_isMetaClass(Class);
                    ClassName = object_getClassName(v2);
                    Name = sel_getName("_loadPersistentClient");
                    v41 = 45;
                    if (isMetaClass)
                      v41 = 43;
                    v37(4, "%c[%{public}s %{public}s]:%i Dropping invalid entry, empty", v41, ClassName, Name, 62);
                  }
                  v42 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                  v43 = NFSharedLogGetLogger(v42);
                  v18 = objc_claimAutoreleasedReturnValue(v43);
                  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                  {
                    v44 = object_getClass(v2);
                    if (class_isMetaClass(v44))
                      v45 = 43;
                    else
                      v45 = 45;
                    v46 = object_getClassName(v2);
                    v47 = sel_getName("_loadPersistentClient");
                    *(_DWORD *)buf = 67109890;
                    v77 = v45;
                    v78 = 2082;
                    v79 = v46;
                    v80 = 2082;
                    v81 = v47;
                    v82 = 1024;
                    v83 = 62;
                    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Dropping invalid entry, empty", buf, 0x22u);
                  }
                }
              }
              else
              {
                v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v20 = NFLogGetLogger(v19);
                if (v20)
                {
                  v21 = (void (*)(uint64_t, const char *, ...))v20;
                  v22 = object_getClass(v2);
                  v23 = class_isMetaClass(v22);
                  v24 = object_getClassName(v2);
                  v25 = sel_getName("_loadPersistentClient");
                  v67 = objc_opt_class(v16);
                  v26 = 45;
                  if (v23)
                    v26 = 43;
                  v21(4, "%c[%{public}s %{public}s]:%i Dropping invalid entry (%@)", v26, v24, v25, 59, v67);
                }
                v27 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v28 = NFSharedLogGetLogger(v27);
                v18 = objc_claimAutoreleasedReturnValue(v28);
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                {
                  v29 = object_getClass(v2);
                  if (class_isMetaClass(v29))
                    v30 = 43;
                  else
                    v30 = 45;
                  v31 = object_getClassName(v2);
                  v32 = sel_getName("_loadPersistentClient");
                  v33 = (void *)objc_opt_class(v16);
                  *(_DWORD *)buf = 67110146;
                  v77 = v30;
                  v78 = 2082;
                  v79 = v31;
                  v80 = 2082;
                  v81 = v32;
                  v82 = 1024;
                  v83 = 59;
                  v84 = 2112;
                  v85 = v33;
                  v34 = v33;
                  _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Dropping invalid entry (%@)", buf, 0x2Cu);

                }
              }

            }
            v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v86, 16);
          }
          while (v13);
        }

        v48 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldDetectManager persistentFieldDetectClients](v2, "persistentFieldDetectClients"));
        objc_msgSend(v48, "count");

        v10 = v68;
        v9 = v69;
      }
      else
      {
        v49 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v50 = NFLogGetLogger(v49);
        if (v50)
        {
          v51 = (void (*)(uint64_t, const char *, ...))v50;
          v52 = object_getClass(v2);
          v53 = class_isMetaClass(v52);
          v54 = object_getClassName(v2);
          v66 = sel_getName("_loadPersistentClient");
          v55 = 45;
          if (v53)
            v55 = 43;
          v51(3, "%c[%{public}s %{public}s]:%i Invalid client list; remove", v55, v54, v66, 52);
        }
        v56 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v57 = NFSharedLogGetLogger(v56);
        v58 = objc_claimAutoreleasedReturnValue(v57);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          v59 = object_getClass(v2);
          if (class_isMetaClass(v59))
            v60 = 43;
          else
            v60 = 45;
          v61 = object_getClassName(v2);
          v62 = sel_getName("_loadPersistentClient");
          *(_DWORD *)v86 = 67109890;
          v87 = v60;
          v88 = 2082;
          v89 = v61;
          v90 = 2082;
          v91 = v62;
          v92 = 1024;
          v93 = 52;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid client list; remove",
            v86,
            0x22u);
        }

        objc_msgSend(v9, "removeObjectForKey:", CFSTR("FieldDetectClients"));
      }
    }

    v63 = v2;
  }

  return v2;
}

- (BOOL)isActive
{
  void *v2;
  void *v4;
  id v5;
  void *v6;
  BOOL v7;

  sub_1000D3FA4(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldDetectManager fieldDetectSessions](self, "fieldDetectSessions"));
  v5 = objc_msgSend(v4, "count");
  if (!v5)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldDetectManager persistentFieldDetectClients](self, "persistentFieldDetectClients"));
    if (!objc_msgSend(v2, "count"))
    {
      v7 = 0;
LABEL_6:

      goto LABEL_7;
    }
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldDetectManager suspensionRequestor](self, "suspensionRequestor"));
  v7 = objc_msgSend(v6, "count") == 0;

  if (!v5)
    goto LABEL_6;
LABEL_7:

  return v7;
}

- (unint64_t)totalPersistentClient
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldDetectManager persistentFieldDetectClients](self, "persistentFieldDetectClients"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (unint64_t)totalFieldDetectSessions
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldDetectManager fieldDetectSessions](self, "fieldDetectSessions"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (NSArray)persistentObserverNames
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldDetectManager persistentFieldDetectClients](self, "persistentFieldDetectClients"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allObjects"));

  return (NSArray *)v3;
}

- (NSArray)fieldDetectSessionClientNames
{
  NSMutableArray *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __CFString *v13;
  const __CFString *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = objc_opt_new(NSMutableArray);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldDetectManager fieldDetectSessions](self, "fieldDetectSessions", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v8);
        if (v9)
        {
          v10 = objc_opt_class(_NFXPCSession);
          if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "connection"));
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_userInfo"));
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ClientName")));

            if (v13)
              v14 = v13;
            else
              v14 = &stru_1002ED8A8;
            -[NSMutableArray addObject:](v3, "addObject:", v14);

          }
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)suspend:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t Logger;
  NSObject *v8;
  void *v9;
  id *v10;
  id *v11;
  NSObject *v12;
  id *v13;
  _QWORD block[4];
  id *v15;
  uint8_t buf[4];
  id v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldDetectManager suspensionRequestor](self, "suspensionRequestor"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    Logger = NFSharedLogGetLogger(0);
    v8 = objc_claimAutoreleasedReturnValue(Logger);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v4;
      _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "SuspensionOwner %{public}@ is currently active", buf, 0xCu);
    }

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldDetectManager suspensionRequestor](self, "suspensionRequestor"));
  objc_msgSend(v9, "addObject:", v4);

  v10 = (id *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
  v11 = sub_100111A40(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D452C;
  block[3] = &unk_1002E5C58;
  v15 = v10;
  v13 = v10;
  dispatch_async(v12, block);

}

- (void)resume:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t Logger;
  NSObject *v8;
  void *v9;
  id *v10;
  id *v11;
  NSObject *v12;
  id *v13;
  _QWORD block[4];
  id *v15;
  uint8_t buf[4];
  id v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldDetectManager suspensionRequestor](self, "suspensionRequestor"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) == 0)
  {
    Logger = NFSharedLogGetLogger(0);
    v8 = objc_claimAutoreleasedReturnValue(Logger);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v4;
      _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "SuspensionOwner %{public}@ unavailable", buf, 0xCu);
    }

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldDetectManager suspensionRequestor](self, "suspensionRequestor"));
  objc_msgSend(v9, "removeObject:", v4);

  v10 = (id *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
  v11 = sub_100111A40(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D46A4;
  block[3] = &unk_1002E5C58;
  v15 = v10;
  v13 = v10;
  dispatch_async(v12, block);

}

- (void)addFieldDetectSession:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  sub_1000D3FA4(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldDetectManager fieldDetectSessions](self, "fieldDetectSessions"));
  v6 = objc_msgSend(v5, "count");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldDetectManager fieldDetectSessions](self, "fieldDetectSessions"));
  objc_msgSend(v7, "addObject:", v4);

  if (!v6)
  {
    v8 = (id)os_transaction_create("com.apple.nfcd.fielddetect");
    -[NFFieldDetectManager setFieldDetectTransaction:](self, "setFieldDetectTransaction:", v8);

  }
}

- (void)removeFieldDetectSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  sub_1000D3FA4(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldDetectManager fieldDetectSessions](self, "fieldDetectSessions"));
  objc_msgSend(v5, "removeObject:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldDetectManager fieldDetectSessions](self, "fieldDetectSessions"));
  v7 = objc_msgSend(v6, "count");

  if (!v7)
    -[NFFieldDetectManager setFieldDetectTransaction:](self, "setFieldDetectTransaction:", 0);
}

- (BOOL)containsFieldDetectSession:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldDetectManager fieldDetectSessions](self, "fieldDetectSessions"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)addPersistentFieldObserver:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "NF_userInfo"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ClientName")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldDetectManager persistentFieldDetectClients](self, "persistentFieldDetectClients"));
  objc_msgSend(v5, "addObject:", v9);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldDetectManager persistentFieldDetectClients](self, "persistentFieldDetectClients"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));
  objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("FieldDetectClients"));

}

- (void)removePersistentFieldObserver:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "NF_userInfo"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ClientName")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldDetectManager persistentFieldDetectClients](self, "persistentFieldDetectClients"));
  objc_msgSend(v5, "removeObject:", v12);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldDetectManager persistentFieldDetectClients](self, "persistentFieldDetectClients"));
  v7 = objc_msgSend(v6, "count");

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v9 = v8;
  if (v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldDetectManager persistentFieldDetectClients](self, "persistentFieldDetectClients"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allObjects"));
    objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("FieldDetectClients"));

  }
  else
  {
    objc_msgSend(v8, "removeObjectForKey:", CFSTR("FieldDetectClients"));
  }

}

- (void)removeAllPersistentFieldObservers
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldDetectManager persistentFieldDetectClients](self, "persistentFieldDetectClients"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldDetectManager persistentFieldDetectClients](self, "persistentFieldDetectClients"));
    objc_msgSend(v5, "removeAllObjects");

    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("FieldDetectClients"));

  }
}

- (id)getStateDumpInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  _QWORD v11[4];

  v10[0] = CFSTR("persistentFieldDetectClients");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldDetectManager persistentObserverNames](self, "persistentObserverNames"));
  v11[0] = v3;
  v10[1] = CFSTR("numFieldDetectSessions");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NFFieldDetectManager totalFieldDetectSessions](self, "totalFieldDetectSessions")));
  v11[1] = v4;
  v10[2] = CFSTR("fieldDetectClients");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldDetectManager fieldDetectSessionClientNames](self, "fieldDetectSessionClientNames"));
  v11[2] = v5;
  v10[3] = CFSTR("suspensionRequestors");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldDetectManager suspensionRequestor](self, "suspensionRequestor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));
  v11[3] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 4));

  return v8;
}

- (void)setFieldDetectSessions:(id)a3
{
  objc_storeStrong((id *)&self->_fieldDetectSessions, a3);
}

- (NSMutableSet)persistentFieldDetectClients
{
  return self->_persistentFieldDetectClients;
}

- (void)setPersistentFieldDetectClients:(id)a3
{
  objc_storeStrong((id *)&self->_persistentFieldDetectClients, a3);
}

- (NSMutableSet)suspensionRequestor
{
  return self->_suspensionRequestor;
}

- (void)setSuspensionRequestor:(id)a3
{
  objc_storeStrong((id *)&self->_suspensionRequestor, a3);
}

- (OS_os_transaction)fieldDetectTransaction
{
  return self->_fieldDetectTransaction;
}

- (void)setFieldDetectTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_fieldDetectTransaction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldDetectTransaction, 0);
  objc_storeStrong((id *)&self->_suspensionRequestor, 0);
  objc_storeStrong((id *)&self->_persistentFieldDetectClients, 0);
  objc_storeStrong((id *)&self->_fieldDetectSessions, 0);
}

@end
