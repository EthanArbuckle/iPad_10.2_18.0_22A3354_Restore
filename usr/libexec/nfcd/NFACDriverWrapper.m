@implementation NFACDriverWrapper

- (NFACDriverWrapper)init
{
  NFACDriverWrapper *v2;
  NFACDriverWrapper *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *sessionOwners;
  NSMutableDictionary *v6;
  NSMutableDictionary *remoteTags;
  NSMutableArray *v8;
  NSMutableArray *multiTagState;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NFACDriverWrapper;
  v2 = -[NFACDriverWrapper init](&v11, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lastFieldOffTime = 0;
    v4 = objc_opt_new(NSMutableDictionary);
    sessionOwners = v3->_sessionOwners;
    v3->_sessionOwners = v4;

    v6 = objc_opt_new(NSMutableDictionary);
    remoteTags = v3->_remoteTags;
    v3->_remoteTags = v6;

    v8 = objc_opt_new(NSMutableArray);
    multiTagState = v3->_multiTagState;
    v3->_multiTagState = v8;

  }
  return v3;
}

- (id)owners
{
  NFACDriverWrapper *v2;
  id v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSMutableDictionary copy](v2->_sessionOwners, "copy");
  objc_sync_exit(v2);

  return v3;
}

- (void)setFailForwardDelegate:(id)a3
{
  id v4;
  NFACDriverWrapper *obj;

  obj = self;
  v4 = a3;
  objc_sync_enter(obj);
  objc_storeWeak((id *)&obj->_ffDelegate, v4);

  objc_sync_exit(obj);
}

- (void)configureDriverSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flags")));
  self->_flags = (unint64_t)objc_msgSend(v5, "unsignedLongValue");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pollPeriod")));
  self->_pollingPeriod = objc_msgSend(v6, "unsignedIntValue");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("multiTagPollPeriod")));
  self->_multiTagPollingPeriod = objc_msgSend(v7, "unsignedIntValue");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("multiTagPollRetries")));
  self->_multiTagPollingRetries = objc_msgSend(v8, "unsignedIntValue");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("typeATagDataRate")));
  self->_typeATagDataRate = objc_msgSend(v9, "unsignedIntValue");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ntag5DataRate")));
  self->_ntag5DataRate = objc_msgSend(v10, "unsignedIntValue");

  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ntag5T1")));
  self->_ntag5T1 = objc_msgSend(v11, "unsignedIntValue");

}

- (unint64_t)openSession:(id)a3
{
  NSMutableDictionary *v5;
  NFACDriverWrapper *v6;
  int sessionCount;
  unint64_t v8;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v12;
  const char *ClassName;
  const char *Name;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  const char *v20;
  const char *v21;
  NSMutableDictionary *v22;
  void *v23;
  void *v24;
  void (*v25)(uint64_t, const char *, ...);
  objc_class *v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  objc_class *v34;
  int v35;
  const char *v36;
  const char *v37;
  void *v38;
  void *v39;
  void *v40;
  void (*v41)(uint64_t, const char *, ...);
  objc_class *v42;
  uint64_t v43;
  const char *v44;
  const char *v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  objc_class *v49;
  int v50;
  const char *v51;
  const char *v52;
  void *v53;
  void (*v54)(uint64_t, const char *, ...);
  objc_class *v55;
  uint64_t v56;
  const char *v57;
  const char *v58;
  void *v59;
  uint64_t v60;
  NSObject *v61;
  objc_class *v62;
  int v63;
  const char *v64;
  const char *v65;
  NSMutableDictionary *sessionOwners;
  char v68;
  uint8_t buf[4];
  int v70;
  __int16 v71;
  const char *v72;
  __int16 v73;
  const char *v74;
  __int16 v75;
  int v76;
  __int16 v77;
  NSMutableDictionary *v78;
  __int16 v79;
  void *v80;

  v5 = (NSMutableDictionary *)a3;
  v68 = 0;
  v6 = self;
  objc_sync_enter(v6);
  sessionCount = v6->_sessionCount;
  if (!sessionCount)
  {
    v6->_isClosing = 0;
    v8 = -[NFACDriverWrapper _openDriver:](v6, "_openDriver:", &v68);
    if (v8 != 1)
    {
      v6->_isClosing = 1;
      goto LABEL_48;
    }
    sessionCount = v6->_sessionCount;
  }
  v6->_sessionCount = sessionCount + 1;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
  if (Logger)
  {
    Class = object_getClass(v6);
    if (class_isMetaClass(Class))
      v12 = 43;
    else
      v12 = 45;
    ClassName = object_getClassName(v6);
    Name = sel_getName(a2);
    Logger(3, "%c[%{public}s %{public}s]:%i Session count: %lu", v12, ClassName, Name, 166, v6->_sessionCount);
  }
  v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v16 = NFSharedLogGetLogger(v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v18 = object_getClass(v6);
    if (class_isMetaClass(v18))
      v19 = 43;
    else
      v19 = 45;
    v20 = object_getClassName(v6);
    v21 = sel_getName(a2);
    v22 = (NSMutableDictionary *)v6->_sessionCount;
    *(_DWORD *)buf = 67110146;
    v70 = v19;
    v71 = 2082;
    v72 = v20;
    v73 = 2082;
    v74 = v21;
    v75 = 1024;
    v76 = 166;
    v77 = 2048;
    v78 = v22;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session count: %lu", buf, 0x2Cu);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v6->_sessionOwners, "objectForKey:", v5));
  v24 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if (v23)
  {
    v25 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v24);
    if (v25)
    {
      v26 = object_getClass(v6);
      if (class_isMetaClass(v26))
        v27 = 43;
      else
        v27 = 45;
      v28 = object_getClassName(v6);
      v29 = sel_getName(a2);
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v6->_sessionOwners, "objectForKeyedSubscript:", v5));
      v25(3, "%c[%{public}s %{public}s]:%i Owner %{public}@ already has a session : %{public}@", v27, v28, v29, 168, v5, v30);

    }
    v31 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v32 = NFSharedLogGetLogger(v31);
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = object_getClass(v6);
      if (class_isMetaClass(v34))
        v35 = 43;
      else
        v35 = 45;
      v36 = object_getClassName(v6);
      v37 = sel_getName(a2);
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v6->_sessionOwners, "objectForKeyedSubscript:", v5));
      *(_DWORD *)buf = 67110402;
      v70 = v35;
      v71 = 2082;
      v72 = v36;
      v73 = 2082;
      v74 = v37;
      v75 = 1024;
      v76 = 168;
      v77 = 2114;
      v78 = v5;
      v79 = 2114;
      v80 = v38;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Owner %{public}@ already has a session : %{public}@", buf, 0x36u);

    }
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v6->_sessionOwners, "objectForKeyedSubscript:", v5));
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v39, "intValue") + 1));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_sessionOwners, "setObject:forKeyedSubscript:", v40, v5);

  }
  else
  {
    v41 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v24);
    if (v41)
    {
      v42 = object_getClass(v6);
      if (class_isMetaClass(v42))
        v43 = 43;
      else
        v43 = 45;
      v44 = object_getClassName(v6);
      v45 = sel_getName(a2);
      v41(6, "%c[%{public}s %{public}s]:%i Opening session on behalf of %{public}@", v43, v44, v45, 172, v5);
    }
    v46 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v47 = NFSharedLogGetLogger(v46);
    v48 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      v49 = object_getClass(v6);
      if (class_isMetaClass(v49))
        v50 = 43;
      else
        v50 = 45;
      v51 = object_getClassName(v6);
      v52 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v70 = v50;
      v71 = 2082;
      v72 = v51;
      v73 = 2082;
      v74 = v52;
      v75 = 1024;
      v76 = 172;
      v77 = 2114;
      v78 = v5;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Opening session on behalf of %{public}@", buf, 0x2Cu);
    }

    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_sessionOwners, "setObject:forKeyedSubscript:", v39, v5);
  }

  v53 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v54 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v53);
  if (v54)
  {
    v55 = object_getClass(v6);
    if (class_isMetaClass(v55))
      v56 = 43;
    else
      v56 = 45;
    v57 = object_getClassName(v6);
    v58 = sel_getName(a2);
    v54(6, "%c[%{public}s %{public}s]:%i Session Owners: %{public}@", v56, v57, v58, 175, v6->_sessionOwners);
  }
  v59 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v60 = NFSharedLogGetLogger(v59);
  v61 = objc_claimAutoreleasedReturnValue(v60);
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    v62 = object_getClass(v6);
    if (class_isMetaClass(v62))
      v63 = 43;
    else
      v63 = 45;
    v64 = object_getClassName(v6);
    v65 = sel_getName(a2);
    sessionOwners = v6->_sessionOwners;
    *(_DWORD *)buf = 67110146;
    v70 = v63;
    v71 = 2082;
    v72 = v64;
    v73 = 2082;
    v74 = v65;
    v75 = 1024;
    v76 = 175;
    v77 = 2114;
    v78 = sessionOwners;
    _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Session Owners: %{public}@", buf, 0x2Cu);
  }

  v8 = 1;
LABEL_48:
  objc_sync_exit(v6);

  if (v68)
    -[NFACDriverWrapper triggerFailForward](v6, "triggerFailForward");

  return v8;
}

- (void)closeSession:(id)a3
{
  NSMutableDictionary *v5;
  NFACDriverWrapper *v6;
  void *v7;
  unsigned int v8;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v12;
  const char *ClassName;
  const char *Name;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  void *v20;
  void (*v21)(uint64_t, const char *, ...);
  objc_class *v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  objc_class *v30;
  int v31;
  const char *v32;
  const char *v33;
  void *v34;
  void *v35;
  void (*v36)(uint64_t, const char *, ...);
  objc_class *v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  objc_class *v44;
  int v45;
  const char *v46;
  const char *v47;
  NSMutableDictionary *v48;
  uint64_t v49;
  void *v50;
  void (*v51)(uint64_t, const char *, ...);
  objc_class *v52;
  uint64_t v53;
  const char *v54;
  const char *v55;
  void *v56;
  uint64_t v57;
  NSObject *v58;
  objc_class *v59;
  int v60;
  void *v61;
  int sessionCount;
  char v63;
  void *v64;
  void (*v65)(uint64_t, const char *, ...);
  objc_class *v66;
  uint64_t v67;
  const char *v68;
  const char *v69;
  void *v70;
  uint64_t v71;
  NSObject *v72;
  objc_class *v73;
  int v74;
  const char *v75;
  const char *v76;
  NSMutableDictionary *v77;
  void *v78;
  void (*v79)(uint64_t, const char *, ...);
  objc_class *v80;
  uint64_t v81;
  const char *v82;
  const char *v83;
  void *v84;
  uint64_t v85;
  NSObject *v86;
  objc_class *v87;
  int v88;
  const char *v89;
  const char *v90;
  NSMutableDictionary *sessionOwners;
  char v92;
  void *v93;
  uint8_t buf[4];
  int v95;
  __int16 v96;
  const char *v97;
  __int16 v98;
  const char *v99;
  __int16 v100;
  int v101;
  __int16 v102;
  NSMutableDictionary *v103;
  __int16 v104;
  void *v105;

  v5 = (NSMutableDictionary *)a3;
  v6 = self;
  objc_sync_enter(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v6->_sessionOwners, "objectForKey:", v5));
  if (objc_msgSend(v7, "BOOLValue") && objc_msgSend(v7, "intValue"))
  {
    v8 = objc_msgSend(v7, "intValue");
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if (v8 == 1)
    {
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
      if (Logger)
      {
        Class = object_getClass(v6);
        if (class_isMetaClass(Class))
          v12 = 43;
        else
          v12 = 45;
        ClassName = object_getClassName(v6);
        Name = sel_getName(a2);
        Logger(6, "%c[%{public}s %{public}s]:%i Closing session on behalf of %{public}@", v12, ClassName, Name, 199, v5);
      }
      v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v16 = NFSharedLogGetLogger(v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = object_getClass(v6);
        if (class_isMetaClass(v18))
          v19 = 43;
        else
          v19 = 45;
        *(_DWORD *)buf = 67110146;
        v95 = v19;
        v96 = 2082;
        v97 = object_getClassName(v6);
        v98 = 2082;
        v99 = sel_getName(a2);
        v100 = 1024;
        v101 = 199;
        v102 = 2114;
        v103 = v5;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Closing session on behalf of %{public}@", buf, 0x2Cu);
      }

      -[NSMutableDictionary removeObjectForKey:](v6->_sessionOwners, "removeObjectForKey:", v5);
    }
    else
    {
      v51 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
      if (v51)
      {
        v52 = object_getClass(v6);
        if (class_isMetaClass(v52))
          v53 = 43;
        else
          v53 = 45;
        v54 = object_getClassName(v6);
        v55 = sel_getName(a2);
        v51(6, "%c[%{public}s %{public}s]:%i Decrementing session on behalf of %{public}@", v53, v54, v55, 202, v5);
      }
      v56 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v57 = NFSharedLogGetLogger(v56);
      v58 = objc_claimAutoreleasedReturnValue(v57);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        v59 = object_getClass(v6);
        if (class_isMetaClass(v59))
          v60 = 43;
        else
          v60 = 45;
        *(_DWORD *)buf = 67110146;
        v95 = v60;
        v96 = 2082;
        v97 = object_getClassName(v6);
        v98 = 2082;
        v99 = sel_getName(a2);
        v100 = 1024;
        v101 = 202;
        v102 = 2114;
        v103 = v5;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Decrementing session on behalf of %{public}@", buf, 0x2Cu);
      }

      v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v7, "intValue") - 1));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_sessionOwners, "setObject:forKeyedSubscript:", v61, v5);

    }
    sessionCount = v6->_sessionCount;
    if (sessionCount > 0
      || (v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler")),
          objc_msgSend(v93, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("NFACDriverWrapper.m"), 206, CFSTR("Session over released")), v93, (sessionCount = v6->_sessionCount) != 0))
    {
      v63 = 0;
      v6->_sessionCount = sessionCount - 1;
    }
    else
    {
      v63 = 1;
    }
    v64 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v65 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v64);
    if (v65)
    {
      v66 = object_getClass(v6);
      if (class_isMetaClass(v66))
        v67 = 43;
      else
        v67 = 45;
      v68 = object_getClassName(v6);
      v69 = sel_getName(a2);
      v65(3, "%c[%{public}s %{public}s]:%i Session count: %lu", v67, v68, v69, 212, v6->_sessionCount);
    }
    v70 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v71 = NFSharedLogGetLogger(v70);
    v72 = objc_claimAutoreleasedReturnValue(v71);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    {
      v73 = object_getClass(v6);
      if (class_isMetaClass(v73))
        v74 = 43;
      else
        v74 = 45;
      v75 = object_getClassName(v6);
      v76 = sel_getName(a2);
      v77 = (NSMutableDictionary *)v6->_sessionCount;
      *(_DWORD *)buf = 67110146;
      v95 = v74;
      v96 = 2082;
      v97 = v75;
      v98 = 2082;
      v99 = v76;
      v100 = 1024;
      v101 = 212;
      v102 = 2048;
      v103 = v77;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session count: %lu", buf, 0x2Cu);
    }

    v78 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v79 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v78);
    if (v79)
    {
      v80 = object_getClass(v6);
      if (class_isMetaClass(v80))
        v81 = 43;
      else
        v81 = 45;
      v82 = object_getClassName(v6);
      v83 = sel_getName(a2);
      v79(6, "%c[%{public}s %{public}s]:%i Session Owners: %{public}@", v81, v82, v83, 213, v6->_sessionOwners);
    }
    v84 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v85 = NFSharedLogGetLogger(v84);
    v86 = objc_claimAutoreleasedReturnValue(v85);
    if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
    {
      v87 = object_getClass(v6);
      if (class_isMetaClass(v87))
        v88 = 43;
      else
        v88 = 45;
      v89 = object_getClassName(v6);
      v90 = sel_getName(a2);
      sessionOwners = v6->_sessionOwners;
      *(_DWORD *)buf = 67110146;
      v95 = v88;
      v96 = 2082;
      v97 = v89;
      v98 = 2082;
      v99 = v90;
      v100 = 1024;
      v101 = 213;
      v102 = 2114;
      v103 = sessionOwners;
      _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Session Owners: %{public}@", buf, 0x2Cu);
    }

    if (v6->_sessionCount)
      v92 = 1;
    else
      v92 = v63;
    if ((v92 & 1) == 0)
    {
      v6->_isClosing = 1;
      -[NFACDriverWrapper _closeDriverAndLeaveHWEnabled:](v6, "_closeDriverAndLeaveHWEnabled:", 0);
    }
  }
  else
  {
    v20 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v21 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v20);
    if (v21)
    {
      v22 = object_getClass(v6);
      if (class_isMetaClass(v22))
        v23 = 43;
      else
        v23 = 45;
      v24 = object_getClassName(v6);
      v25 = sel_getName(a2);
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v6->_sessionOwners, "objectForKeyedSubscript:", v5));
      v21(3, "%c[%{public}s %{public}s]:%i Owner %{public}@ does not have a session : %{public}@", v23, v24, v25, 192, v5, v26);

    }
    v27 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v28 = NFSharedLogGetLogger(v27);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = object_getClass(v6);
      if (class_isMetaClass(v30))
        v31 = 43;
      else
        v31 = 45;
      v32 = object_getClassName(v6);
      v33 = sel_getName(a2);
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v6->_sessionOwners, "objectForKeyedSubscript:", v5));
      *(_DWORD *)buf = 67110402;
      v95 = v31;
      v96 = 2082;
      v97 = v32;
      v98 = 2082;
      v99 = v33;
      v100 = 1024;
      v101 = 192;
      v102 = 2114;
      v103 = v5;
      v104 = 2114;
      v105 = v34;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Owner %{public}@ does not have a session : %{public}@", buf, 0x36u);

    }
    v35 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v36 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v35);
    if (v36)
    {
      v37 = object_getClass(v6);
      if (class_isMetaClass(v37))
        v38 = 43;
      else
        v38 = 45;
      v39 = object_getClassName(v6);
      v40 = sel_getName(a2);
      v36(3, "%c[%{public}s %{public}s]:%i Session owners : %{public}@", v38, v39, v40, 193, v6->_sessionOwners);
    }
    v41 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v42 = NFSharedLogGetLogger(v41);
    v43 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      v44 = object_getClass(v6);
      if (class_isMetaClass(v44))
        v45 = 43;
      else
        v45 = 45;
      v46 = object_getClassName(v6);
      v47 = sel_getName(a2);
      v48 = v6->_sessionOwners;
      *(_DWORD *)buf = 67110146;
      v95 = v45;
      v96 = 2082;
      v97 = v46;
      v98 = 2082;
      v99 = v47;
      v100 = 1024;
      v101 = 193;
      v102 = 2114;
      v103 = v48;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session owners : %{public}@", buf, 0x2Cu);
    }

    if (NFIsInternalBuild(v49))
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("NFACDriverWrapper.m"), 195, CFSTR("driver session not held"));

    }
  }

  objc_sync_exit(v6);
}

- (void)stopNowAndLeveHWEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *specific;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  NFACDriverWrapper *v18;
  const char *Name;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;

  v3 = a3;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
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
    v8(6, "%c[%{public}s %{public}s]:%i Closing driver now !", v12, ClassName, Name, 223);
  }
  v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v14 = NFSharedLogGetLogger(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = object_getClass(self);
    if (class_isMetaClass(v16))
      v17 = 43;
    else
      v17 = 45;
    *(_DWORD *)buf = 67109890;
    v21 = v17;
    v22 = 2082;
    v23 = object_getClassName(self);
    v24 = 2082;
    v25 = sel_getName(a2);
    v26 = 1024;
    v27 = 223;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Closing driver now !", buf, 0x22u);
  }

  v18 = self;
  objc_sync_enter(v18);
  v18->_isClosing = 1;
  -[NFACDriverWrapper _closeDriverAndLeaveHWEnabled:](v18, "_closeDriverAndLeaveHWEnabled:", v3);
  objc_sync_exit(v18);

}

- (BOOL)_isClosed
{
  return self->_isClosing;
}

- (int)_componentModeToSERouting:(unint64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

- (id)setRouting:(id)a3
{
  id v6;
  NFACDriverWrapper *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *specific;
  uint64_t Logger;
  void (*v15)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  NFRoutingConfig *currentRouting;
  void *v25;
  void (*v26)(uint64_t, const char *, ...);
  objc_class *v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  objc_class *v34;
  int v35;
  const char *v36;
  const char *v37;
  void *v38;
  void (*v39)(uint64_t, const char *, ...);
  objc_class *v40;
  uint64_t v41;
  const char *v42;
  const char *v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  objc_class *v47;
  int v48;
  const char *v49;
  const char *v50;
  unsigned int v51;
  int v52;
  void *v53;
  void (*v54)(uint64_t, const char *, ...);
  objc_class *v55;
  uint64_t v56;
  const char *v57;
  const char *v58;
  void *v59;
  uint64_t v60;
  NSObject *v61;
  objc_class *v62;
  int v63;
  const char *v64;
  const char *v65;
  unsigned int v66;
  unsigned int v67;
  unsigned int v68;
  void *v69;
  void (*v70)(uint64_t, const char *, ...);
  objc_class *v71;
  uint64_t v72;
  const char *v73;
  const char *v74;
  void *v75;
  uint64_t v76;
  NSObject *v77;
  objc_class *v78;
  int v79;
  const char *v80;
  const char *v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void (*v87)(uint64_t, const char *, ...);
  objc_class *v88;
  uint64_t v89;
  const char *v90;
  const char *v91;
  void *v92;
  uint64_t v93;
  NSObject *v94;
  objc_class *v95;
  int v96;
  const char *v97;
  const char *v98;
  void *v99;
  void (*v100)(uint64_t, const char *, ...);
  objc_class *v101;
  uint64_t v102;
  const char *v103;
  const char *v104;
  void *v105;
  uint64_t v106;
  NSObject *v107;
  objc_class *v108;
  int v109;
  const char *v110;
  const char *v111;
  id v112;
  void *v113;
  void *v114;
  void *v115;
  const char *ClassName;
  const char *Name;
  int v119;
  uint64_t v120;
  int v121;
  int v122;
  uint64_t v123;
  int v124;
  NSErrorUserInfoKey v125;
  void *v126;
  NSErrorUserInfoKey v127;
  void *v128;
  uint8_t buf[4];
  int v130;
  __int16 v131;
  const char *v132;
  __int16 v133;
  const char *v134;
  __int16 v135;
  int v136;
  __int16 v137;
  id v138;
  NSErrorUserInfoKey v139;
  void *v140;

  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  if (-[NFACDriverWrapper _isClosed](v7, "_isClosed"))
  {
    v8 = objc_alloc((Class)NSError);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v139 = NSLocalizedDescriptionKey;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Aborted"));
    v140 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v140, &v139, 1));
    v12 = objc_msgSend(v8, "initWithDomain:code:userInfo:", v9, 3, v11);

    objc_sync_exit(v7);
    goto LABEL_97;
  }
  objc_sync_exit(v7);

  v124 = 0;
  v123 = 0;
  objc_msgSend(v6, "calculateFieldDetectEnabled:", 0);
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v15 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(v7);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(v7);
    Name = sel_getName(a2);
    v18 = 45;
    if (isMetaClass)
      v18 = 43;
    v15(6, "%c[%{public}s %{public}s]:%i requesting: %{public}@", v18, ClassName, Name, 258, v6);
  }
  v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v20 = NFSharedLogGetLogger(v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = object_getClass(v7);
    if (class_isMetaClass(v22))
      v23 = 43;
    else
      v23 = 45;
    *(_DWORD *)buf = 67110146;
    v130 = v23;
    v131 = 2082;
    v132 = object_getClassName(v7);
    v133 = 2082;
    v134 = sel_getName(a2);
    v135 = 1024;
    v136 = 258;
    v137 = 2114;
    v138 = v6;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i requesting: %{public}@", buf, 0x2Cu);
  }

  if (v6)
  {
    currentRouting = v7->_currentRouting;
    if (currentRouting)
    {
      if (-[NFRoutingConfig isEquivalentRouting:](currentRouting, "isEquivalentRouting:", v6))
      {
        v25 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v26 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v25);
        if (v26)
        {
          v27 = object_getClass(v7);
          if (class_isMetaClass(v27))
            v28 = 43;
          else
            v28 = 45;
          v29 = object_getClassName(v7);
          v30 = sel_getName(a2);
          v26(6, "%c[%{public}s %{public}s]:%i Routing did not change", v28, v29, v30, 260);
        }
        v31 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v32 = NFSharedLogGetLogger(v31);
        v33 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v34 = object_getClass(v7);
          if (class_isMetaClass(v34))
            v35 = 43;
          else
            v35 = 45;
          v36 = object_getClassName(v7);
          v37 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v130 = v35;
          v131 = 2082;
          v132 = v36;
          v133 = 2082;
          v134 = v37;
          v135 = 1024;
          v136 = 260;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Routing did not change", buf, 0x22u);
        }

LABEL_85:
        v12 = 0;
        goto LABEL_97;
      }
    }
  }
  if ((objc_msgSend(v6, "wantsReader") & 1) != 0 || objc_msgSend(v6, "wantsMultiTag"))
  {
    v38 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v39 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v38);
    if (v39)
    {
      v40 = object_getClass(v7);
      if (class_isMetaClass(v40))
        v41 = 43;
      else
        v41 = 45;
      v42 = object_getClassName(v7);
      v43 = sel_getName(a2);
      v39(6, "%c[%{public}s %{public}s]:%i Setting pollingMask: 0x%04x", v41, v42, v43, 266, objc_msgSend(v6, "polling"));
    }
    v44 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v45 = NFSharedLogGetLogger(v44);
    v46 = objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      v47 = object_getClass(v7);
      if (class_isMetaClass(v47))
        v48 = 43;
      else
        v48 = 45;
      v49 = object_getClassName(v7);
      v50 = sel_getName(a2);
      v51 = objc_msgSend(v6, "polling");
      *(_DWORD *)buf = 67110146;
      v130 = v48;
      v131 = 2082;
      v132 = v49;
      v133 = 2082;
      v134 = v50;
      v135 = 1024;
      v136 = 266;
      v137 = 1024;
      LODWORD(v138) = v51;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Setting pollingMask: 0x%04x", buf, 0x28u);
    }

    -[NFACDriverWrapper setPollingConfig:tagNotificationConfig:](v7, "setPollingConfig:tagNotificationConfig:", objc_msgSend(v6, "polling"), objc_msgSend(v6, "tagDiscoveryConfig"));
    v52 = 1;
  }
  else
  {
    v52 = 0;
  }
  if (objc_msgSend(v6, "wantsMultiTag"))
  {
    v53 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v54 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v53);
    if (v54)
    {
      v55 = object_getClass(v7);
      if (class_isMetaClass(v55))
        v56 = 43;
      else
        v56 = 45;
      v57 = object_getClassName(v7);
      v58 = sel_getName(a2);
      v54(6, "%c[%{public}s %{public}s]:%i Enabling Multitag routing", v56, v57, v58, 273);
    }
    v59 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v60 = NFSharedLogGetLogger(v59);
    v61 = objc_claimAutoreleasedReturnValue(v60);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      v62 = object_getClass(v7);
      if (class_isMetaClass(v62))
        v63 = 43;
      else
        v63 = 45;
      v64 = object_getClassName(v7);
      v65 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v130 = v63;
      v131 = 2082;
      v132 = v64;
      v133 = 2082;
      v134 = v65;
      v135 = 1024;
      v136 = 273;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Enabling Multitag routing", buf, 0x22u);
    }

    v66 = 1;
  }
  else
  {
    v67 = objc_msgSend(v6, "wantsMultiTag");
    v66 = v67 ^ -[NFRoutingConfig wantsMultiTag](v7->_currentRouting, "wantsMultiTag");
  }
  LODWORD(v123) = -[NFACDriverWrapper _componentModeToSERouting:](v7, "_componentModeToSERouting:", objc_msgSend(v6, "embeddedMode"));
  if ((v52 & 1) != 0)
    v68 = 3;
  else
    v68 = -[NFACDriverWrapper _componentModeToSERouting:](v7, "_componentModeToSERouting:", objc_msgSend(v6, "hostMode"));
  HIDWORD(v123) = v68;
  v121 = 0;
  v119 = objc_msgSend(v6, "fdOn");
  v120 = objc_msgSend(v6, "pollingType");
  v122 = 0;
  if (v52 && -[NFReaderRestrictor readerModeProtectionActive](v7->_readerPolicy, "readerModeProtectionActive"))
  {
    v69 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v70 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v69);
    if (v70)
    {
      v71 = object_getClass(v7);
      if (class_isMetaClass(v71))
        v72 = 43;
      else
        v72 = 45;
      v73 = object_getClassName(v7);
      v74 = sel_getName(a2);
      v70(4, "%c[%{public}s %{public}s]:%i Denying reader mode, protection active", v72, v73, v74, 293);
    }
    v75 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v76 = NFSharedLogGetLogger(v75);
    v77 = objc_claimAutoreleasedReturnValue(v76);
    if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
    {
      v78 = object_getClass(v7);
      if (class_isMetaClass(v78))
        v79 = 43;
      else
        v79 = 45;
      v80 = object_getClassName(v7);
      v81 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v130 = v79;
      v131 = 2082;
      v132 = v80;
      v133 = 2082;
      v134 = v81;
      v135 = 1024;
      v136 = 293;
      _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Denying reader mode, protection active", buf, 0x22u);
    }

    v82 = objc_alloc((Class)NSError);
    v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v127 = NSLocalizedDescriptionKey;
    v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Reader mode temporarily disabled"));
    v128 = v84;
    v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v128, &v127, 1));
    v12 = objc_msgSend(v82, "initWithDomain:code:userInfo:", v83, 47, v85);

  }
  else
  {
    if (!objc_msgSend(v6, "pollingType")
      && -[NFReaderRestrictor readerModeStoppedShouldCooloffRun](v7->_readerPolicy, "readerModeStoppedShouldCooloffRun"))
    {
      -[NFACDriverWrapper openSession:](v7, "openSession:", CFSTR("Cooloff"));
    }
    if ((NFDriverSetConfiguration(v7->_driver, &v119, &v123) & 1) != 0)
    {
      objc_storeStrong((id *)&v7->_currentRouting, a3);
      v86 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v87 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v86);
      if (v87)
      {
        v88 = object_getClass(v7);
        if (class_isMetaClass(v88))
          v89 = 43;
        else
          v89 = 45;
        v90 = object_getClassName(v7);
        v91 = sel_getName(a2);
        v87(6, "%c[%{public}s %{public}s]:%i Operating mode changed to:%{public}@", v89, v90, v91, 307, v6);
      }
      v92 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v93 = NFSharedLogGetLogger(v92);
      v94 = objc_claimAutoreleasedReturnValue(v93);
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
      {
        v95 = object_getClass(v7);
        if (class_isMetaClass(v95))
          v96 = 43;
        else
          v96 = 45;
        v97 = object_getClassName(v7);
        v98 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v130 = v96;
        v131 = 2082;
        v132 = v97;
        v133 = 2082;
        v134 = v98;
        v135 = 1024;
        v136 = 307;
        v137 = 2114;
        v138 = v6;
        _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Operating mode changed to:%{public}@", buf, 0x2Cu);
      }

      if (v66)
        -[NFACDriverWrapper _writeSMCMultiTagEnabled:](v7, "_writeSMCMultiTagEnabled:", objc_msgSend(v6, "wantsMultiTag"));
      goto LABEL_85;
    }
    v99 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v100 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v99);
    if (v100)
    {
      v101 = object_getClass(v7);
      if (class_isMetaClass(v101))
        v102 = 43;
      else
        v102 = 45;
      v103 = object_getClassName(v7);
      v104 = sel_getName(a2);
      v100(3, "%c[%{public}s %{public}s]:%i Failed to set configuration: %{public}@", v102, v103, v104, 302, v6);
    }
    v105 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v106 = NFSharedLogGetLogger(v105);
    v107 = objc_claimAutoreleasedReturnValue(v106);
    if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
    {
      v108 = object_getClass(v7);
      if (class_isMetaClass(v108))
        v109 = 43;
      else
        v109 = 45;
      v110 = object_getClassName(v7);
      v111 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v130 = v109;
      v131 = 2082;
      v132 = v110;
      v133 = 2082;
      v134 = v111;
      v135 = 1024;
      v136 = 302;
      v137 = 2114;
      v138 = v6;
      _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to set configuration: %{public}@", buf, 0x2Cu);
    }

    v112 = objc_alloc((Class)NSError);
    v113 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v125 = NSLocalizedDescriptionKey;
    v114 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Stack Error"));
    v126 = v114;
    v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v126, &v125, 1));
    v12 = objc_msgSend(v112, "initWithDomain:code:userInfo:", v113, 15, v115);

  }
LABEL_97:

  return v12;
}

- (BOOL)readerModeProtectionActive
{
  return -[NFReaderRestrictor readerModeProtectionActive](self->_readerPolicy, "readerModeProtectionActive");
}

- (id)state
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *remoteTags;
  NSMutableDictionary *v8;
  id v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NFThermalMonitor *thermalMonitor;
  NSNumber *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  NSMutableDictionary *v31;
  NFACDriverWrapper *v32;
  NSMutableDictionary *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  NSMutableDictionary *v39;
  _BYTE v40[128];

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isClosing));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, CFSTR("isClosing"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_lastFieldOffTime));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, CFSTR("Last Field OFF time"));

  v6 = objc_opt_new(NSMutableDictionary);
  remoteTags = self->_remoteTags;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10007744C;
  v38[3] = &unk_1002E6B58;
  v8 = v6;
  v39 = v8;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](remoteTags, "enumerateKeysAndObjectsUsingBlock:", v38);
  v31 = v8;
  v9 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithDictionary:", v8);
  v33 = v3;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, CFSTR("Remote Tags"));

  v10 = objc_opt_new(NSMutableArray);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v32 = self;
  v11 = self->_multiTagState;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        v17 = objc_alloc((Class)NSMutableDictionary);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "asDictionary"));
        v19 = objc_msgSend(v17, "initWithDictionary:", v18);

        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "NF_dataForKey:", CFSTR("identifier")));
        v21 = v20;
        if (v20)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "NF_asHexString"));
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v22, CFSTR("identifier"));

        }
        -[NSMutableArray addObject:](v10, "addObject:", v19);

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v13);
  }

  v23 = objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:", v10);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", v23, CFSTR("Multi Tags"));

  thermalMonitor = v32->_thermalMonitor;
  if (thermalMonitor)
  {
    v25 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", sub_100074D78(thermalMonitor));
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", v26, CFSTR("ThermalState"));

  }
  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", CFSTR("N/A"), CFSTR("ThermalState"));
  }
  v27 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithDictionary:", v32->_sessionOwners);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", v27, CFSTR("driverSessionOpened"));

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v32->_sessionCount));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", v28, CFSTR("driverSessionCount"));

  v29 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithDictionary:", v33);
  return v29;
}

- (void)simulateCrash:(unsigned __int16)a3 reason:(const char *)a4
{
  NFDriverSimulateCrash(self->_driver, a3, a4);
}

- (void)driverRestartDiscovery
{
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  const char *Name;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i Restarting Discovery", v10, ClassName, Name, 389);
  }
  v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v12 = NFSharedLogGetLogger(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(self);
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    *(_DWORD *)buf = 67109890;
    v18 = v15;
    v19 = 2082;
    v20 = object_getClassName(self);
    v21 = 2082;
    v22 = sel_getName(a2);
    v23 = 1024;
    v24 = 389;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Restarting Discovery", buf, 0x22u);
  }

}

- (void)driverPLLUnlock
{
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  void *v16;
  id v17;
  void *v18;
  const char *Name;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i PLL UNLOCK", v10, ClassName, Name, 394);
  }
  v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v12 = NFSharedLogGetLogger(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(self);
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    *(_DWORD *)buf = 67109890;
    v21 = v15;
    v22 = 2082;
    v23 = object_getClassName(self);
    v24 = 2082;
    v25 = sel_getName(a2);
    v26 = 1024;
    v27 = 394;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i PLL UNLOCK", buf, 0x22u);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NFACDriverWrapper delegate](self, "delegate"));
  objc_msgSend(v16, "handlePLLUnlock");

  v17 = sub_1001F2AB0((uint64_t)NFFuryCALogger);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  sub_1001F40A8((uint64_t)v18, CFSTR("pllUnlock"));

}

- (void)driverDidDetectHardwareReset:(const char *)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[NFACDriverWrapper delegate](self, "delegate"));
  objc_msgSend(v4, "handleHardwareReset:", a3);

}

- (void)driverDidDetectFieldChange:(BOOL)a3
{
  void *specific;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;

  if (-[NFACDriverWrapper _isClosed](self, "_isClosed", a3))
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v11 = 45;
      if (isMetaClass)
        v11 = 43;
      v7(3, "%c[%{public}s %{public}s]:%i Driver session is closed", v11, ClassName, Name, 409);
    }
    v12 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v13 = NFSharedLogGetLogger(v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = object_getClass(self);
      if (class_isMetaClass(v15))
        v16 = 43;
      else
        v16 = 45;
      *(_DWORD *)buf = 67109890;
      v19 = v16;
      v20 = 2082;
      v21 = object_getClassName(self);
      v22 = 2082;
      v23 = sel_getName(a2);
      v24 = 1024;
      v25 = 409;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Driver session is closed", buf, 0x22u);
    }

  }
}

- (void)driverDidDetectHostCardReader:(void *)a3
{
  void *specific;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v11 = 45;
    if (isMetaClass)
      v11 = 43;
    v7(6, "%c[%{public}s %{public}s]:%i Host card reader detected", v11, ClassName, Name, 416);
  }
  v12 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v13 = NFSharedLogGetLogger(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = object_getClass(self);
    if (class_isMetaClass(v15))
      v16 = 43;
    else
      v16 = 45;
    *(_DWORD *)buf = 67109890;
    v19 = v16;
    v20 = 2082;
    v21 = object_getClassName(self);
    v22 = 2082;
    v23 = sel_getName(a2);
    v24 = 1024;
    v25 = 416;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Host card reader detected", buf, 0x22u);
  }

}

- (void)driverDidDetectRemoteTags:(_NFDriverRemoteTag *)a3 count:(unsigned __int8)a4
{
  unsigned int v4;
  void *specific;
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  NSMutableArray *v19;
  unint64_t v20;
  NSMutableArray *v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  _NFDriverRemoteTag *v26;
  unsigned int var0;
  id v28;
  int v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  void (*v41)(uint64_t, const char *, ...);
  objc_class *v42;
  _BOOL4 v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  objc_class *v49;
  int v50;
  const char *v51;
  const char *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void (*v57)(uint64_t, const char *, ...);
  objc_class *v58;
  _BOOL4 v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  NSObject *v64;
  objc_class *v65;
  int v66;
  const char *v67;
  const char *v68;
  void *v69;
  uint64_t v70;
  void (*v71)(uint64_t, const char *, ...);
  objc_class *v72;
  _BOOL4 v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  NSObject *v78;
  objc_class *v79;
  int v80;
  const char *v81;
  const char *v82;
  void *v83;
  NSMutableDictionary *remoteTags;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void (*v90)(uint64_t, const char *, ...);
  objc_class *v91;
  _BOOL4 v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  objc_class *v97;
  int v98;
  const char *v99;
  const char *v100;
  NSObject *v101;
  const char *Name;
  const char *v103;
  const char *v104;
  const char *v105;
  const char *v106;
  const char *sel;
  uint64_t v108;
  _QWORD v110[2];
  _QWORD v111[2];
  uint8_t buf[4];
  int v113;
  __int16 v114;
  const char *v115;
  __int16 v116;
  const char *v117;
  __int16 v118;
  int v119;

  v4 = a4;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v13 = 45;
    if (isMetaClass)
      v13 = 43;
    v9(6, "%c[%{public}s %{public}s]:%i ", v13, ClassName, Name, 421);
  }
  v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v15 = NFSharedLogGetLogger(v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = object_getClass(self);
    if (class_isMetaClass(v17))
      v18 = 43;
    else
      v18 = 45;
    *(_DWORD *)buf = 67109890;
    v113 = v18;
    v114 = 2082;
    v115 = object_getClassName(self);
    v116 = 2082;
    v117 = sel_getName(a2);
    v118 = 1024;
    v119 = 421;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v19 = objc_opt_new(NSMutableArray);
  -[NSMutableDictionary removeAllObjects](self->_remoteTags, "removeAllObjects");
  if (a3 && v4)
  {
    v20 = 0;
    sel = a2;
    v108 = 96 * v4;
    while (2)
    {
      v21 = v19;
      v22 = objc_alloc_init((Class)NFTagInternal);
      v23 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", a3[v20 / 0x60].var3, a3[v20 / 0x60].var4);
      objc_msgSend(v22, "_setIdentifier:", v23);
      switch(a3[v20 / 0x60].var1)
      {
        case 0:
          objc_msgSend(v22, "_setTechnology:", 0);
          v24 = v22;
          v25 = 0;
          goto LABEL_29;
        case 1:
          objc_msgSend(v22, "_setTechnology:", 1);
          v26 = &a3[v20 / 0x60];
          var0 = a3[v20 / 0x60].var2.var0.var0;
          if (var0 <= 2)
            objc_msgSend(v22, "_setType:", var0 + 1);
          v28 = objc_alloc((Class)NSData);
          goto LABEL_24;
        case 2:
          objc_msgSend(v22, "_setTechnology:", 2);
          v29 = a3[v20 / 0x60].var2.var0.var0;
          if (v29 == 2)
          {
            v24 = v22;
            v25 = 6;
          }
          else if (v29 == 1)
          {
            v24 = v22;
            v25 = 5;
          }
          else
          {
            if (v29)
              goto LABEL_61;
            v24 = v22;
            v25 = 4;
          }
LABEL_29:
          objc_msgSend(v24, "_setType:", v25);
LABEL_61:
          v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "tagID"));
          remoteTags = self->_remoteTags;
          v110[0] = CFSTR("tagHandle");
          v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", a3[v20 / 0x60].var0));
          v110[1] = CFSTR("type");
          v111[0] = v85;
          v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v22, "type")));
          v111[1] = v86;
          v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v111, v110, 2));
          -[NSMutableDictionary setObject:forKey:](remoteTags, "setObject:forKey:", v87, v83);

          objc_msgSend(v22, "_setUID:", v83);
          v19 = v21;
          -[NSMutableArray addObject:](v21, "addObject:", v22);

          v20 += 96;
          if (v108 != v20)
            continue;
          -[NFReaderRestrictor tagDetected](self->_readerPolicy, "tagDetected");
          v101 = objc_claimAutoreleasedReturnValue(-[NFACDriverWrapper delegate](self, "delegate"));
          -[NSObject handleRemoteTagsDetected:](v101, "handleRemoteTagsDetected:", v19);
          break;
        case 3:
          objc_msgSend(v22, "_setTechnology:", 4);
          objc_msgSend(v22, "_setType:", 7);
          v30 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", (char *)&a3[v20 / 0x60].var2.var0.var0 + 1, a3[v20 / 0x60].var2.var2.var0);
          objc_msgSend(v22, "_setIdentifier:", v30);

          v31 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", (char *)&a3[v20 / 0x60].var2.var0.var0 + 1, a3[v20 / 0x60].var2.var2.var0);
          objc_msgSend(v22, "_setIDm:", v31);

          v32 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &a3[v20 / 0x60].var2.var6.var3[4], 8);
          objc_msgSend(v22, "_setPMm:", v32);

          v33 = objc_alloc((Class)NSArray);
          v34 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &a3[v20 / 0x60].var2.var6.var3[12], 2);
          v35 = objc_msgSend(v33, "initWithObjects:", v34, 0);
          objc_msgSend(v22, "_setSystemCodes:", v35);

          goto LABEL_61;
        case 4:
          objc_msgSend(v22, "_setTechnology:", 1);
          objc_msgSend(v22, "_setType:", 9);
          v28 = objc_alloc((Class)NSData);
          v26 = &a3[v20 / 0x60];
LABEL_24:
          v36 = objc_msgSend(v28, "initWithBytes:length:", v26->var2.var6.var3, v26->var2.var0.var4);
          objc_msgSend(v22, "_setHistoricalBytes:", v36);

          v37 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v26->var2.var4.var0[5], 2);
          objc_msgSend(v22, "_setAtqa:", v37);

          v38 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v26->var2.var3.var0[4], 1);
          objc_msgSend(v22, "_setSak:", v38);

          goto LABEL_61;
        case 5:
          objc_msgSend(v22, "_setTechnology:", 16);
          v24 = v22;
          v25 = 8;
          goto LABEL_29;
        case 6:
          objc_msgSend(v22, "_setTechnology:", 1);
          v24 = v22;
          v25 = 11;
          goto LABEL_29;
        case 7:
          objc_msgSend(v22, "_setTechnology:", 1);
          v24 = v22;
          v25 = 12;
          goto LABEL_29;
        case 8:
          objc_msgSend(v22, "_setTechnology:", 0);
          v24 = v22;
          v25 = 10;
          goto LABEL_29;
        case 9:
          v39 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v40 = NFLogGetLogger(v39);
          if (v40)
          {
            v41 = (void (*)(uint64_t, const char *, ...))v40;
            v42 = object_getClass(self);
            v43 = class_isMetaClass(v42);
            v44 = object_getClassName(self);
            v103 = sel_getName(sel);
            v45 = 45;
            if (v43)
              v45 = 43;
            v41(6, "%c[%{public}s %{public}s]:%i Found silent tag", v45, v44, v103, 498);
          }
          v46 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v47 = NFSharedLogGetLogger(v46);
          v48 = objc_claimAutoreleasedReturnValue(v47);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            v49 = object_getClass(self);
            if (class_isMetaClass(v49))
              v50 = 43;
            else
              v50 = 45;
            v51 = object_getClassName(self);
            v52 = sel_getName(sel);
            *(_DWORD *)buf = 67109890;
            v113 = v50;
            v114 = 2082;
            v115 = v51;
            v116 = 2082;
            v117 = v52;
            v118 = 1024;
            v119 = 498;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Found silent tag", buf, 0x22u);
          }

          objc_msgSend(v22, "_setTechnology:", 1);
          objc_msgSend(v22, "_setType:", 3);
          v53 = v22;
          v54 = 1;
          goto LABEL_60;
        case 0xA:
          v55 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v56 = NFLogGetLogger(v55);
          if (v56)
          {
            v57 = (void (*)(uint64_t, const char *, ...))v56;
            v58 = object_getClass(self);
            v59 = class_isMetaClass(v58);
            v60 = object_getClassName(self);
            v104 = sel_getName(sel);
            v61 = 45;
            if (v59)
              v61 = 43;
            v57(6, "%c[%{public}s %{public}s]:%i Found silent A2 tag", v61, v60, v104, 504);
          }
          v62 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v63 = NFSharedLogGetLogger(v62);
          v64 = objc_claimAutoreleasedReturnValue(v63);
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            v65 = object_getClass(self);
            if (class_isMetaClass(v65))
              v66 = 43;
            else
              v66 = 45;
            v67 = object_getClassName(self);
            v68 = sel_getName(sel);
            *(_DWORD *)buf = 67109890;
            v113 = v66;
            v114 = 2082;
            v115 = v67;
            v116 = 2082;
            v117 = v68;
            v118 = 1024;
            v119 = 504;
            _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Found silent A2 tag", buf, 0x22u);
          }

          objc_msgSend(v22, "_setTechnology:", 1);
          objc_msgSend(v22, "_setType:", 3);
          v53 = v22;
          v54 = 2;
          goto LABEL_60;
        case 0xB:
          v69 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v70 = NFLogGetLogger(v69);
          if (v70)
          {
            v71 = (void (*)(uint64_t, const char *, ...))v70;
            v72 = object_getClass(self);
            v73 = class_isMetaClass(v72);
            v74 = object_getClassName(self);
            v105 = sel_getName(sel);
            v75 = 45;
            if (v73)
              v75 = 43;
            v71(6, "%c[%{public}s %{public}s]:%i Found silent A3 tag", v75, v74, v105, 510);
          }
          v76 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v77 = NFSharedLogGetLogger(v76);
          v78 = objc_claimAutoreleasedReturnValue(v77);
          if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
          {
            v79 = object_getClass(self);
            if (class_isMetaClass(v79))
              v80 = 43;
            else
              v80 = 45;
            v81 = object_getClassName(self);
            v82 = sel_getName(sel);
            *(_DWORD *)buf = 67109890;
            v113 = v80;
            v114 = 2082;
            v115 = v81;
            v116 = 2082;
            v117 = v82;
            v118 = 1024;
            v119 = 510;
            _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Found silent A3 tag", buf, 0x22u);
          }

          objc_msgSend(v22, "_setTechnology:", 1);
          objc_msgSend(v22, "_setType:", 3);
          v53 = v22;
          v54 = 3;
LABEL_60:
          objc_msgSend(v53, "_setSilentType:", v54);
          goto LABEL_61;
        default:
          goto LABEL_61;
      }
      break;
    }
  }
  else
  {
    v88 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v89 = NFLogGetLogger(v88);
    if (v89)
    {
      v90 = (void (*)(uint64_t, const char *, ...))v89;
      v91 = object_getClass(self);
      v92 = class_isMetaClass(v91);
      v93 = object_getClassName(self);
      v106 = sel_getName(a2);
      v94 = 45;
      if (v92)
        v94 = 43;
      v90(3, "%c[%{public}s %{public}s]:%i Invalid tag data", v94, v93, v106, 428);
    }
    v95 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v96 = NFSharedLogGetLogger(v95);
    v101 = objc_claimAutoreleasedReturnValue(v96);
    if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
    {
      v97 = object_getClass(self);
      if (class_isMetaClass(v97))
        v98 = 43;
      else
        v98 = 45;
      v99 = object_getClassName(self);
      v100 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v113 = v98;
      v114 = 2082;
      v115 = v99;
      v116 = 2082;
      v117 = v100;
      v118 = 1024;
      v119 = 428;
      _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid tag data", buf, 0x22u);
    }
  }

}

- (void)_getHandleForTag:(id)a3
{
  NSMutableDictionary *remoteTags;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  remoteTags = self->_remoteTags;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "UID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](remoteTags, "objectForKey:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("tagHandle")));
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "pointerValue");
  else
    v8 = 0;

  return v8;
}

- (unsigned)connectTag:(id)a3
{
  id v5;
  NFACDriverWrapper *v6;
  unsigned int v7;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v11;
  const char *ClassName;
  const char *Name;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;

  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  if (-[NFACDriverWrapper _isClosed](v6, "_isClosed"))
  {
    v7 = 3;
  }
  else if (NFDriverRemoteDevConnect(v6->_driver, -[NFACDriverWrapper _getHandleForTag:](v6, "_getHandleForTag:", v5), 0))
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
    if (Logger)
    {
      Class = object_getClass(v6);
      if (class_isMetaClass(Class))
        v11 = 43;
      else
        v11 = 45;
      ClassName = object_getClassName(v6);
      Name = sel_getName(a2);
      Logger(3, "%c[%{public}s %{public}s]:%i Failed to connect to tag: %{public}@", v11, ClassName, Name, 549, v5);
    }
    v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v15 = NFSharedLogGetLogger(v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = object_getClass(v6);
      if (class_isMetaClass(v17))
        v18 = 43;
      else
        v18 = 45;
      *(_DWORD *)buf = 67110146;
      v21 = v18;
      v22 = 2082;
      v23 = object_getClassName(v6);
      v24 = 2082;
      v25 = sel_getName(a2);
      v26 = 1024;
      v27 = 549;
      v28 = 2114;
      v29 = v5;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to connect to tag: %{public}@", buf, 0x2Cu);
    }

    v7 = 28;
  }
  else
  {
    v7 = 0;
  }
  objc_sync_exit(v6);

  return v7;
}

- (unsigned)disconnectTag:(id)a3 tagRemovalDetect:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  NFACDriverWrapper *v8;
  unsigned int v9;
  int v10;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v14;
  const char *ClassName;
  const char *Name;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  id v32;

  v4 = a4;
  v7 = a3;
  v8 = self;
  objc_sync_enter(v8);
  if (-[NFACDriverWrapper _isClosed](v8, "_isClosed"))
  {
    v9 = 3;
  }
  else
  {
    v10 = NFDriverRemoteDevDisconnect(v8->_driver, -[NFACDriverWrapper _getHandleForTag:](v8, "_getHandleForTag:", v7), v4);
    if (v10)
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
      if (Logger)
      {
        Class = object_getClass(v8);
        if (class_isMetaClass(Class))
          v14 = 43;
        else
          v14 = 45;
        ClassName = object_getClassName(v8);
        Name = sel_getName(a2);
        Logger(3, "%c[%{public}s %{public}s]:%i Failed to disconnect tag: %{public}@", v14, ClassName, Name, 566, v7);
      }
      v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v18 = NFSharedLogGetLogger(v17);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = object_getClass(v8);
        if (class_isMetaClass(v20))
          v21 = 43;
        else
          v21 = 45;
        *(_DWORD *)buf = 67110146;
        v24 = v21;
        v25 = 2082;
        v26 = object_getClassName(v8);
        v27 = 2082;
        v28 = sel_getName(a2);
        v29 = 1024;
        v30 = 566;
        v31 = 2114;
        v32 = v7;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to disconnect tag: %{public}@", buf, 0x2Cu);
      }

      if (v10 == 18)
        v9 = 51;
      else
        v9 = 15;
    }
    else
    {
      if (v4
        && -[NFReaderRestrictor readerModeStoppedShouldCooloffRun](v8->_readerPolicy, "readerModeStoppedShouldCooloffRun"))
      {
        -[NFACDriverWrapper openSession:](v8, "openSession:", CFSTR("Cooloff"));
      }
      v9 = 0;
    }
  }
  objc_sync_exit(v8);

  return v9;
}

- (BOOL)queryTagNDEFCapability:(id)a3 hasNdefAbility:(_NFNDEFTagInfo *)a4 error:(id *)a5
{
  id v9;
  NFACDriverWrapper *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v21;
  const char *ClassName;
  const char *Name;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  objc_class *v27;
  int v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSErrorUserInfoKey v40;
  void *v41;
  NSErrorUserInfoKey v42;
  void *v43;
  NSErrorUserInfoKey v44;
  void *v45;
  uint8_t buf[4];
  int v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  int v53;
  _QWORD v54[4];
  _QWORD v55[4];

  v9 = a3;
  v10 = self;
  objc_sync_enter(v10);
  if (-[NFACDriverWrapper _isClosed](v10, "_isClosed"))
  {
    if (a5)
    {
      v11 = objc_alloc((Class)NSError);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v54[0] = NSLocalizedDescriptionKey;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Exiting"));
      v55[0] = v13;
      v55[1] = &off_1002FE250;
      v54[1] = CFSTR("Line");
      v54[2] = CFSTR("Method");
      v14 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v55[2] = v14;
      v54[3] = NSDebugDescriptionErrorKey;
      v15 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 584);
      v55[3] = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v55, v54, 4));
      *a5 = objc_msgSend(v11, "initWithDomain:code:userInfo:", v12, 4, v16);

LABEL_4:
      LOBYTE(a5) = 0;
    }
  }
  else
  {
    v17 = NFDriverRemoteDevCheckNdef(v10->_driver, -[NFACDriverWrapper _getHandleForTag:](v10, "_getHandleForTag:", v9), a4);
    if (v17)
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
      if (Logger)
      {
        Class = object_getClass(v10);
        if (class_isMetaClass(Class))
          v21 = 43;
        else
          v21 = 45;
        ClassName = object_getClassName(v10);
        Name = sel_getName(a2);
        Logger(3, "%c[%{public}s %{public}s]:%i Failed to perform Ndef check", v21, ClassName, Name, 591);
      }
      v24 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v25 = NFSharedLogGetLogger(v24);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = object_getClass(v10);
        if (class_isMetaClass(v27))
          v28 = 43;
        else
          v28 = 45;
        *(_DWORD *)buf = 67109890;
        v47 = v28;
        v48 = 2082;
        v49 = object_getClassName(v10);
        v50 = 2082;
        v51 = sel_getName(a2);
        v52 = 1024;
        v53 = 591;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to perform Ndef check", buf, 0x22u);
      }

      if (a5)
      {
        if (v17 == 5)
        {
          v34 = objc_alloc((Class)NSError);
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
          v42 = NSLocalizedDescriptionKey;
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid Parameter"));
          v43 = v36;
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1));
          *a5 = objc_msgSend(v34, "initWithDomain:code:userInfo:", v35, 10, v37);

        }
        else
        {
          v29 = objc_alloc((Class)NSError);
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
          if (v17 == 6)
          {
            v44 = NSLocalizedDescriptionKey;
            v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Tag Not Found"));
            v45 = v31;
            v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));
            *a5 = objc_msgSend(v29, "initWithDomain:code:userInfo:", v30, 28, v32);

          }
          else
          {
            v40 = NSLocalizedDescriptionKey;
            v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Stack Error"));
            v41 = v38;
            v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
            *a5 = objc_msgSend(v29, "initWithDomain:code:userInfo:", v30, 15, v39);

          }
        }
        goto LABEL_4;
      }
    }
    else
    {
      if (a5)
        *a5 = 0;
      LOBYTE(a5) = 1;
    }
  }
  objc_sync_exit(v10);

  return (char)a5;
}

- (unsigned)queryMifareTagCapability:(id)a3 error:(id *)a4
{
  id v7;
  uint64_t v8;
  NFACDriverWrapper *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void (*v18)(uint64_t, const char *, ...);
  objc_class *v19;
  _BOOL4 isMetaClass;
  const char *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  objc_class *v26;
  int v27;
  id v28;
  void *v29;
  void *v30;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v34;
  const char *ClassName;
  const char *Name;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  objc_class *v40;
  int v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  const char *v47;
  NSErrorUserInfoKey v48;
  void *v49;
  uint8_t v50[4];
  int v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  int v57;
  uint8_t buf[48];
  uint64_t v59;
  _QWORD v60[4];
  _QWORD v61[4];
  NSErrorUserInfoKey v62;
  void *v63;

  v7 = a3;
  v8 = objc_opt_class(NFTagInternal);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    v9 = self;
    objc_sync_enter(v9);
    if (-[NFACDriverWrapper _isClosed](v9, "_isClosed"))
    {
      if (!a4)
      {
LABEL_33:
        objc_sync_exit(v9);
        goto LABEL_34;
      }
      v10 = objc_alloc((Class)NSError);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v60[0] = NSLocalizedDescriptionKey;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Exiting"));
      v61[0] = v12;
      v61[1] = &off_1002FE268;
      v60[1] = CFSTR("Line");
      v60[2] = CFSTR("Method");
      v13 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v61[2] = v13;
      v60[3] = NSDebugDescriptionErrorKey;
      v14 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 627);
      v61[3] = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v61, v60, 4));
      *a4 = objc_msgSend(v10, "initWithDomain:code:userInfo:", v11, 4, v15);

    }
    else
    {
      v59 = 0;
      memset(buf, 0, sizeof(buf));
      if (!NFDriverRemoteDevGetMiFareInfo(v9->_driver, -[NFACDriverWrapper _getHandleForTag:](v9, "_getHandleForTag:", v7), buf))
      {
        if ((*(_DWORD *)buf - 1) >= 4)
          LODWORD(a4) = 0;
        else
          LODWORD(a4) = *(_DWORD *)buf + 12;
        goto LABEL_33;
      }
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
      if (Logger)
      {
        Class = object_getClass(v9);
        if (class_isMetaClass(Class))
          v34 = 43;
        else
          v34 = 45;
        ClassName = object_getClassName(v9);
        Name = sel_getName(a2);
        Logger(3, "%c[%{public}s %{public}s]:%i Failed to query MIFARE info", v34, ClassName, Name, 635);
      }
      v37 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v38 = NFSharedLogGetLogger(v37);
      v39 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        v40 = object_getClass(v9);
        if (class_isMetaClass(v40))
          v41 = 43;
        else
          v41 = 45;
        *(_DWORD *)v50 = 67109890;
        v51 = v41;
        v52 = 2082;
        v53 = object_getClassName(v9);
        v54 = 2082;
        v55 = sel_getName(a2);
        v56 = 1024;
        v57 = 635;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to query MIFARE info", v50, 0x22u);
      }

      if (!a4)
        goto LABEL_33;
      v42 = objc_alloc((Class)NSError);
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v48 = NSLocalizedDescriptionKey;
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Stack Error"));
      v49 = v44;
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1));
      *a4 = objc_msgSend(v42, "initWithDomain:code:userInfo:", v43, 15, v45);

    }
    LODWORD(a4) = 0;
    goto LABEL_33;
  }
  v16 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v17 = NFLogGetLogger(v16);
  if (v17)
  {
    v18 = (void (*)(uint64_t, const char *, ...))v17;
    v19 = object_getClass(self);
    isMetaClass = class_isMetaClass(v19);
    v21 = object_getClassName(self);
    v47 = sel_getName(a2);
    v22 = 45;
    if (isMetaClass)
      v22 = 43;
    v18(3, "%c[%{public}s %{public}s]:%i Invalid tag parameter", v22, v21, v47, 619);
  }
  v23 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v24 = NFSharedLogGetLogger(v23);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v26 = object_getClass(self);
    if (class_isMetaClass(v26))
      v27 = 43;
    else
      v27 = 45;
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)&buf[4] = v27;
    *(_WORD *)&buf[8] = 2082;
    *(_QWORD *)&buf[10] = object_getClassName(self);
    *(_WORD *)&buf[18] = 2082;
    *(_QWORD *)&buf[20] = sel_getName(a2);
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = 619;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid tag parameter", buf, 0x22u);
  }

  if (a4)
  {
    v28 = objc_alloc((Class)NSError);
    v9 = (NFACDriverWrapper *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v62 = NSLocalizedDescriptionKey;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid Parameter"));
    v63 = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1));
    *a4 = objc_msgSend(v28, "initWithDomain:code:userInfo:", v9, 10, v30);

    LODWORD(a4) = 0;
LABEL_34:

  }
  return a4;
}

- (id)readNdefDataFromTag:(id)a3 messageSize:(unsigned int)a4 error:(id *)a5
{
  id v9;
  NFACDriverWrapper *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void (*v18)(uint64_t, const char *, ...);
  objc_class *v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  objc_class *v26;
  int v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD *v32;
  void *v33;
  void (*v34)(uint64_t, const char *, ...);
  objc_class *v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  objc_class *v42;
  int v43;
  const char *v44;
  const char *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v54;
  const char *ClassName;
  const char *Name;
  void *v57;
  uint64_t v58;
  NSObject *v59;
  objc_class *v60;
  int v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  id v71;
  void *v72;
  void (*v73)(uint64_t, const char *, ...);
  objc_class *v74;
  uint64_t v75;
  const char *v76;
  const char *v77;
  void *v78;
  uint64_t v79;
  NSObject *v80;
  objc_class *v81;
  int v82;
  const char *v83;
  const char *v84;
  id v85;
  unsigned int v86;
  NSErrorUserInfoKey v87;
  void *v88;
  NSErrorUserInfoKey v89;
  void *v90;
  NSErrorUserInfoKey v91;
  void *v92;
  uint8_t buf[4];
  int v94;
  __int16 v95;
  const char *v96;
  __int16 v97;
  const char *v98;
  __int16 v99;
  int v100;
  __int16 v101;
  id v102;
  __int16 v103;
  int v104;
  NSErrorUserInfoKey v105;
  void *v106;
  NSErrorUserInfoKey v107;
  void *v108;
  _QWORD v109[4];
  _QWORD v110[4];

  v9 = a3;
  v10 = self;
  objc_sync_enter(v10);
  if (-[NFACDriverWrapper _isClosed](v10, "_isClosed"))
  {
    if (a5)
    {
      v11 = objc_alloc((Class)NSError);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v109[0] = NSLocalizedDescriptionKey;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Exiting"));
      v110[0] = v13;
      v110[1] = &off_1002FE280;
      v109[1] = CFSTR("Line");
      v109[2] = CFSTR("Method");
      v14 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v110[2] = v14;
      v109[3] = NSDebugDescriptionErrorKey;
      v15 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 666);
      v110[3] = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v110, v109, 4));
      *a5 = objc_msgSend(v11, "initWithDomain:code:userInfo:", v12, 4, v16);

LABEL_50:
      a5 = 0;
      goto LABEL_51;
    }
    goto LABEL_51;
  }
  if (a4 <= 0x8000)
  {
    if (!a4)
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
      if (Logger)
      {
        Class = object_getClass(v10);
        if (class_isMetaClass(Class))
          v54 = 43;
        else
          v54 = 45;
        ClassName = object_getClassName(v10);
        Name = sel_getName(a2);
        Logger(5, "%c[%{public}s %{public}s]:%i zero-length message", v54, ClassName, Name, 678);
      }
      v57 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v58 = NFSharedLogGetLogger(v57);
      v59 = objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        v60 = object_getClass(v10);
        if (class_isMetaClass(v60))
          v61 = 43;
        else
          v61 = 45;
        *(_DWORD *)buf = 67109890;
        v94 = v61;
        v95 = 2082;
        v96 = object_getClassName(v10);
        v97 = 2082;
        v98 = sel_getName(a2);
        v99 = 1024;
        v100 = 678;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i zero-length message", buf, 0x22u);
      }

      if (a5)
      {
        v62 = objc_alloc((Class)NSError);
        v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        v105 = NSLocalizedDescriptionKey;
        v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Zero-length NDEF message"));
        v106 = v64;
        v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1));
        *a5 = objc_msgSend(v62, "initWithDomain:code:userInfo:", v63, 49, v65);

        goto LABEL_50;
      }
      goto LABEL_51;
    }
    if (a5)
      *a5 = 0;
    v32 = (_QWORD *)NFDataCreateWithLength(a4);
    v86 = 0;
    if (!v32)
    {
      if (a5)
      {
        v66 = objc_alloc((Class)NSError);
        v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        v87 = NSLocalizedDescriptionKey;
        v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "No resources"));
        v88 = v68;
        v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1));
        *a5 = objc_msgSend(v66, "initWithDomain:code:userInfo:", v67, 34, v69);

        goto LABEL_50;
      }
      goto LABEL_51;
    }
    if (NFDriverRemoteDevReadNdef(v10->_driver, -[NFACDriverWrapper _getHandleForTag:](v10, "_getHandleForTag:", v9), v32, &v86))
    {
      v33 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v34 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v33);
      if (v34)
      {
        v35 = object_getClass(v10);
        if (class_isMetaClass(v35))
          v36 = 43;
        else
          v36 = 45;
        v37 = object_getClassName(v10);
        v38 = sel_getName(a2);
        v34(3, "%c[%{public}s %{public}s]:%i Failed to read NDEF from tag %{public}@, status=%d", v36, v37, v38, 694, v9, 0);
      }
      v39 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v40 = NFSharedLogGetLogger(v39);
      v41 = objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        v42 = object_getClass(v10);
        if (class_isMetaClass(v42))
          v43 = 43;
        else
          v43 = 45;
        v44 = object_getClassName(v10);
        v45 = sel_getName(a2);
        *(_DWORD *)buf = 67110402;
        v94 = v43;
        v95 = 2082;
        v96 = v44;
        v97 = 2082;
        v98 = v45;
        v99 = 1024;
        v100 = 694;
        v101 = 2114;
        v102 = v9;
        v103 = 1024;
        v104 = 0;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to read NDEF from tag %{public}@, status=%d", buf, 0x32u);
      }

      if (!a5)
        goto LABEL_35;
      v46 = objc_alloc((Class)NSError);
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v91 = NSLocalizedDescriptionKey;
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Stack Error"));
      v92 = v48;
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1));
      v50 = objc_msgSend(v46, "initWithDomain:code:userInfo:", v47, 15, v49);
    }
    else
    {
      if (v86)
      {
        v71 = objc_alloc((Class)NSData);
        a5 = (id *)objc_msgSend(v71, "initWithBytes:length:", *v32, v86);
        goto LABEL_54;
      }
      v72 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v73 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v72);
      if (v73)
      {
        v74 = object_getClass(v10);
        if (class_isMetaClass(v74))
          v75 = 43;
        else
          v75 = 45;
        v76 = object_getClassName(v10);
        v77 = sel_getName(a2);
        v73(5, "%c[%{public}s %{public}s]:%i zero-length message", v75, v76, v77, 708);
      }
      v78 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v79 = NFSharedLogGetLogger(v78);
      v80 = objc_claimAutoreleasedReturnValue(v79);
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        v81 = object_getClass(v10);
        if (class_isMetaClass(v81))
          v82 = 43;
        else
          v82 = 45;
        v83 = object_getClassName(v10);
        v84 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v94 = v82;
        v95 = 2082;
        v96 = v83;
        v97 = 2082;
        v98 = v84;
        v99 = 1024;
        v100 = 708;
        _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i zero-length message", buf, 0x22u);
      }

      if (!a5)
      {
LABEL_35:
        a5 = 0;
LABEL_54:
        NFDataRelease(v32);
        goto LABEL_51;
      }
      v85 = objc_alloc((Class)NSError);
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v89 = NSLocalizedDescriptionKey;
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Zero-length NDEF message"));
      v90 = v48;
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1));
      v50 = objc_msgSend(v85, "initWithDomain:code:userInfo:", v47, 49, v49);
    }
    *a5 = v50;

    goto LABEL_35;
  }
  v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v18 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v17);
  if (v18)
  {
    v19 = object_getClass(v10);
    if (class_isMetaClass(v19))
      v20 = 43;
    else
      v20 = 45;
    v21 = object_getClassName(v10);
    v22 = sel_getName(a2);
    v18(5, "%c[%{public}s %{public}s]:%i NDEF message size is over the read limit", v20, v21, v22, 673);
  }
  v23 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v24 = NFSharedLogGetLogger(v23);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = object_getClass(v10);
    if (class_isMetaClass(v26))
      v27 = 43;
    else
      v27 = 45;
    *(_DWORD *)buf = 67109890;
    v94 = v27;
    v95 = 2082;
    v96 = object_getClassName(v10);
    v97 = 2082;
    v98 = sel_getName(a2);
    v99 = 1024;
    v100 = 673;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i NDEF message size is over the read limit", buf, 0x22u);
  }

  if (a5)
  {
    v28 = objc_alloc((Class)NSError);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v107 = NSLocalizedDescriptionKey;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "NDEF message size is over the limit"));
    v108 = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1));
    *a5 = objc_msgSend(v28, "initWithDomain:code:userInfo:", v29, 43, v31);

    goto LABEL_50;
  }
LABEL_51:
  objc_sync_exit(v10);

  return a5;
}

- (BOOL)writeLockNdef:(id)a3 error:(id *)a4
{
  id v7;
  NFACDriverWrapper *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  BOOL v16;
  id v17;
  id v18;
  id v19;
  NSErrorUserInfoKey v21;
  void *v22;
  NSErrorUserInfoKey v23;
  void *v24;
  _QWORD v25[4];
  _QWORD v26[4];

  v7 = a3;
  v8 = self;
  objc_sync_enter(v8);
  if (-[NFACDriverWrapper _isClosed](v8, "_isClosed"))
  {
    if (!a4)
    {
LABEL_11:
      v16 = 0;
      goto LABEL_12;
    }
    v9 = objc_alloc((Class)NSError);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v25[0] = NSLocalizedDescriptionKey;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Exiting"));
    v26[0] = v11;
    v26[1] = &off_1002FE298;
    v25[1] = CFSTR("Line");
    v25[2] = CFSTR("Method");
    v12 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v26[2] = v12;
    v25[3] = NSDebugDescriptionErrorKey;
    v13 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 729);
    v26[3] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 4));
    *a4 = objc_msgSend(v9, "initWithDomain:code:userInfo:", v10, 4, v14);

LABEL_10:
    goto LABEL_11;
  }
  v15 = NFDriverRemoteDevWriteLockNdef(v8->_driver, -[NFACDriverWrapper _getHandleForTag:](v8, "_getHandleForTag:", v7));
  v16 = v15 == 0;
  if (a4 && v15)
  {
    if (v15 == 6)
    {
      v17 = objc_alloc((Class)NSError);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v23 = NSLocalizedDescriptionKey;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Connection Closed"));
      v24 = v11;
      v12 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
      v18 = objc_msgSend(v17, "initWithDomain:code:userInfo:", v10, 21, v12);
    }
    else
    {
      v19 = objc_alloc((Class)NSError);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v21 = NSLocalizedDescriptionKey;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Stack Error"));
      v22 = v11;
      v12 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
      v18 = objc_msgSend(v19, "initWithDomain:code:userInfo:", v10, 15, v12);
    }
    *a4 = v18;
    goto LABEL_10;
  }
LABEL_12:
  objc_sync_exit(v8);

  return v16;
}

- (unsigned)checkTagPresence:(id)a3
{
  id v4;
  NFACDriverWrapper *v5;
  unsigned int v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (-[NFACDriverWrapper _isClosed](v5, "_isClosed"))
  {
    v6 = 3;
  }
  else if (NFDriverRemoteDevCheckPresence(v5->_driver, -[NFACDriverWrapper _getHandleForTag:](v5, "_getHandleForTag:", v4)))
  {
    v6 = 28;
  }
  else
  {
    v6 = 0;
  }
  objc_sync_exit(v5);

  return v6;
}

- (id)enableContinuousWave:(BOOL)a3 withFrequencySweep:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  NFACDriverWrapper *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  NSErrorUserInfoKey v15;
  void *v16;
  NSErrorUserInfoKey v17;
  void *v18;

  v4 = a4;
  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  if (-[NFACDriverWrapper _isClosed](v6, "_isClosed"))
  {
    v7 = objc_alloc((Class)NSError);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v17 = NSLocalizedDescriptionKey;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Aborted"));
    v18 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
    v11 = objc_msgSend(v7, "initWithDomain:code:userInfo:", v8, 3, v10);
  }
  else
  {
    if (!NFDriverContinuousWave(v6->_driver, v5, v4))
    {
      v13 = 0;
      goto LABEL_6;
    }
    v12 = objc_alloc((Class)NSError);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v15 = NSLocalizedDescriptionKey;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Stack Error"));
    v16 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    v11 = objc_msgSend(v12, "initWithDomain:code:userInfo:", v8, 15, v10);
  }
  v13 = v11;

LABEL_6:
  objc_sync_exit(v6);

  return v13;
}

- (id)transceive:(id)a3 tag:(id)a4 maxTimeout:(double)a5 error:(id *)a6
{
  NFACDriverWrapper *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  NFACDriverWrapper *v18;
  id v19;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v23;
  const char *ClassName;
  const char *Name;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  objc_class *v30;
  int v31;
  const char *v32;
  const char *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  void *v39;
  void (*v40)(uint64_t, const char *, ...);
  objc_class *v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  objc_class *v49;
  int v50;
  const char *v51;
  const char *v52;
  void *v53;
  id v54;
  id v55;
  void *ErrorCode;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v62;
  void (*v63)(uint64_t, const char *, ...);
  objc_class *v64;
  uint64_t v65;
  const char *v66;
  const char *v67;
  void *v68;
  uint64_t v69;
  NSObject *v70;
  objc_class *v71;
  int v72;
  const char *v73;
  const char *v74;
  unsigned int v75;
  void *v76;
  void (*v77)(uint64_t, const char *, ...);
  objc_class *v78;
  uint64_t v79;
  const char *v80;
  const char *v81;
  void *v82;
  uint64_t v83;
  NSObject *v84;
  objc_class *v85;
  int v86;
  const char *v87;
  const char *v88;
  uint64_t v89;
  id v90;
  id v91;
  _QWORD *v92;
  _QWORD v93[2];
  _QWORD v94[2];
  NSErrorUserInfoKey v95;
  void *v96;
  uint8_t buf[4];
  int v98;
  __int16 v99;
  const char *v100;
  __int16 v101;
  const char *v102;
  __int16 v103;
  int v104;
  __int16 v105;
  void *v106;
  _QWORD v107[4];
  _QWORD v108[4];

  v90 = a3;
  v91 = a4;
  v11 = self;
  objc_sync_enter(v11);
  if (-[NFACDriverWrapper _isClosed](v11, "_isClosed"))
  {
    if (a6)
    {
      v12 = objc_alloc((Class)NSError);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v107[0] = NSLocalizedDescriptionKey;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Exiting"));
      v108[0] = v14;
      v108[1] = &off_1002FE2B0;
      v107[1] = CFSTR("Line");
      v107[2] = CFSTR("Method");
      v15 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v108[2] = v15;
      v107[3] = NSDebugDescriptionErrorKey;
      v16 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 787);
      v108[3] = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v108, v107, 4));
      *a6 = objc_msgSend(v12, "initWithDomain:code:userInfo:", v13, 4, v17);

    }
    objc_sync_exit(v11);
    v18 = 0;
    goto LABEL_52;
  }
  v19 = objc_retainAutorelease(v90);
  v89 = NFDataCreateWithBytesNoCopy(objc_msgSend(v19, "bytes"), objc_msgSend(v19, "length"), 0);
  v92 = 0;
  if (a5 < 0.0)
    a5 = 5.0;
  if (a6)
    *a6 = 0;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
  if (Logger)
  {
    Class = object_getClass(v11);
    if (class_isMetaClass(Class))
      v23 = 43;
    else
      v23 = 45;
    ClassName = object_getClassName(v11);
    Name = sel_getName(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "NF_asHexString"));
    Logger(6, "%c[%{public}s %{public}s]:%i TX: %{public}@", v23, ClassName, Name, 801, v26);

  }
  v27 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v28 = NFSharedLogGetLogger(v27);
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = object_getClass(v11);
    if (class_isMetaClass(v30))
      v31 = 43;
    else
      v31 = 45;
    v32 = object_getClassName(v11);
    v33 = sel_getName(a2);
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "NF_asHexString"));
    *(_DWORD *)buf = 67110146;
    v98 = v31;
    v99 = 2082;
    v100 = v32;
    v101 = 2082;
    v102 = v33;
    v103 = 1024;
    v104 = 801;
    v105 = 2114;
    v106 = v34;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i TX: %{public}@", buf, 0x2Cu);

  }
  if (objc_msgSend(v91, "technology") == 4)
  {
    v35 = NFDriverRemoteDeviceFelicaTransceive(v11->_driver, -[NFACDriverWrapper _getHandleForTag:](v11, "_getHandleForTag:", v91), v89, &v92, a5);
LABEL_26:
    v36 = v35;
    goto LABEL_27;
  }
  if (objc_msgSend(v91, "technology") == 16)
  {
    v35 = NFDriverRemoteDeviceIso15693Transceive(v11->_driver, -[NFACDriverWrapper _getHandleForTag:](v11, "_getHandleForTag:", v91), v89, &v92, a5);
    goto LABEL_26;
  }
  if (objc_msgSend(v91, "technology") == 1 || objc_msgSend(v91, "technology") == 2)
  {
    v35 = NFDriverRemoteDeviceIso14443Transceive(v11->_driver, -[NFACDriverWrapper _getHandleForTag:](v11, "_getHandleForTag:", v91), v89, &v92, a5);
    goto LABEL_26;
  }
  v62 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v63 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v62);
  if (v63)
  {
    v64 = object_getClass(v11);
    if (class_isMetaClass(v64))
      v65 = 43;
    else
      v65 = 45;
    v66 = object_getClassName(v11);
    v67 = sel_getName(a2);
    v63(3, "%c[%{public}s %{public}s]:%i Tag tech = %d", v65, v66, v67, 813, objc_msgSend(v91, "technology"));
  }
  v68 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v69 = NFSharedLogGetLogger(v68);
  v70 = objc_claimAutoreleasedReturnValue(v69);
  if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
  {
    v71 = object_getClass(v11);
    if (class_isMetaClass(v71))
      v72 = 43;
    else
      v72 = 45;
    v73 = object_getClassName(v11);
    v74 = sel_getName(a2);
    v75 = objc_msgSend(v91, "technology");
    *(_DWORD *)buf = 67110146;
    v98 = v72;
    v99 = 2082;
    v100 = v73;
    v101 = 2082;
    v102 = v74;
    v103 = 1024;
    v104 = 813;
    v105 = 1024;
    LODWORD(v106) = v75;
    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Tag tech = %d", buf, 0x28u);
  }

  v76 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v77 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v76);
  if (v77)
  {
    v78 = object_getClass(v11);
    if (class_isMetaClass(v78))
      v79 = 43;
    else
      v79 = 45;
    v80 = object_getClassName(v11);
    v81 = sel_getName(a2);
    v77(3, "%c[%{public}s %{public}s]:%i Reader mode transceive is not supported for this tag type", v79, v80, v81, 814);
  }
  v82 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v83 = NFSharedLogGetLogger(v82);
  v84 = objc_claimAutoreleasedReturnValue(v83);
  if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
  {
    v85 = object_getClass(v11);
    if (class_isMetaClass(v85))
      v86 = 43;
    else
      v86 = 45;
    v87 = object_getClassName(v11);
    v88 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v98 = v86;
    v99 = 2082;
    v100 = v87;
    v101 = 2082;
    v102 = v88;
    v103 = 1024;
    v104 = 814;
    _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Reader mode transceive is not supported for this tag type", buf, 0x22u);
  }

  v36 = 5;
LABEL_27:
  if (v92)
  {
    v37 = objc_alloc((Class)NSData);
    v38 = objc_msgSend(v37, "initWithBytes:length:", *v92, v92[1]);
  }
  else
  {
    v38 = 0;
  }
  v39 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v40 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v39);
  if (v40)
  {
    v41 = object_getClass(v11);
    if (class_isMetaClass(v41))
      v42 = 43;
    else
      v42 = 45;
    v43 = object_getClassName(v11);
    v44 = sel_getName(a2);
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "NF_asHexString"));
    v40(6, "%c[%{public}s %{public}s]:%i RX: %{public}@", v42, v43, v44, 822, v45);

  }
  v46 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v47 = NFSharedLogGetLogger(v46);
  v48 = objc_claimAutoreleasedReturnValue(v47);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    v49 = object_getClass(v11);
    if (class_isMetaClass(v49))
      v50 = 43;
    else
      v50 = 45;
    v51 = object_getClassName(v11);
    v52 = sel_getName(a2);
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "NF_asHexString"));
    *(_DWORD *)buf = 67110146;
    v98 = v50;
    v99 = 2082;
    v100 = v51;
    v101 = 2082;
    v102 = v52;
    v103 = 1024;
    v104 = 822;
    v105 = 2114;
    v106 = v53;
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i RX: %{public}@", buf, 0x2Cu);

  }
  NFDataRelease(v89);
  NFDataRelease(v92);
  if ((_DWORD)v36 || !v38)
  {
    if ((_DWORD)v36 == 6)
    {
      v55 = objc_alloc((Class)NSError);
      ErrorCode = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v95 = NSLocalizedDescriptionKey;
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Tag Not Found"));
      v96 = v57;
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1));
      v54 = objc_msgSend(v55, "initWithDomain:code:userInfo:", ErrorCode, 28, v58);
    }
    else
    {
      ErrorCode = (void *)NFDriverCreateErrorCode(v36);
      if (!ErrorCode)
      {
        v54 = 0;
        goto LABEL_48;
      }
      v59 = objc_alloc((Class)NSError);
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v93[0] = NSLocalizedDescriptionKey;
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Stack Error"));
      v93[1] = NSUnderlyingErrorKey;
      v94[0] = v58;
      v94[1] = ErrorCode;
      v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v94, v93, 2));
      v54 = objc_msgSend(v59, "initWithDomain:code:userInfo:", v57, 15, v60);

    }
LABEL_48:

    goto LABEL_49;
  }
  v54 = 0;
LABEL_49:
  objc_sync_exit(v11);

  if (a6)
    *a6 = objc_retainAutorelease(v54);
  v11 = (NFACDriverWrapper *)v38;

  v18 = v11;
LABEL_52:

  return v18;
}

- (int)_ntag5DriverRateFromTagRate:(int)a3
{
  uint64_t v3;
  int v4;
  int v5;
  void *specific;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;

  v3 = *(_QWORD *)&a3;
  if (a3 > 211)
  {
    if (a3 != 212)
    {
      if (a3 != 424 && a3 != 848)
        return 0;
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
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
        v11(6, "%c[%{public}s %{public}s]:%i NTAG5 rate %d is too high - using 212kbps", v14, ClassName, Name, 856, v3);
      }
      v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v16 = NFSharedLogGetLogger(v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = object_getClass(self);
        if (class_isMetaClass(v18))
          v19 = 43;
        else
          v19 = 45;
        *(_DWORD *)buf = 67110146;
        v23 = v19;
        v24 = 2082;
        v25 = object_getClassName(self);
        v26 = 2082;
        v27 = sel_getName(a2);
        v28 = 1024;
        v29 = 856;
        v30 = 1024;
        v31 = v3;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i NTAG5 rate %d is too high - using 212kbps", buf, 0x28u);
      }

    }
    return 4;
  }
  if (a3 == 106)
    v4 = 3;
  else
    v4 = 0;
  if (a3 == 52)
    v5 = 2;
  else
    v5 = v4;
  if (a3 == 26)
    return 1;
  else
    return v5;
}

- (id)setISO15693DataRate:(int)a3 forTag:(id)a4
{
  id v7;
  unsigned int ntag5DataRate;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NFACDriverWrapper *v12;
  unsigned int v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  _QWORD v24[4];

  v7 = a4;
  ntag5DataRate = self->_ntag5DataRate;
  if (ntag5DataRate)
    v9 = ntag5DataRate;
  else
    v9 = a3;
  v10 = -[NFACDriverWrapper _ntag5DriverRateFromTagRate:](self, "_ntag5DriverRateFromTagRate:", v9);
  if ((_DWORD)v10
    && (v11 = v10,
        v12 = self,
        objc_sync_enter(v12),
        v13 = NFDriverISO15693SetDataRate(v12->_driver, -[NFACDriverWrapper _getHandleForTag:](v12, "_getHandleForTag:", v7), v11, v12->_ntag5T1), objc_sync_exit(v12), v12, v13))
  {
    v14 = objc_alloc((Class)NSError);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v23[0] = NSLocalizedDescriptionKey;
    if (v13 >= 0x47)
      v16 = 71;
    else
      v16 = v13;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002E6910[v16]));
    v24[0] = v17;
    v24[1] = &off_1002FE2C8;
    v23[1] = CFSTR("Line");
    v23[2] = CFSTR("Method");
    v18 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v24[2] = v18;
    v23[3] = NSDebugDescriptionErrorKey;
    v19 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 885);
    v24[3] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 4));
    v21 = objc_msgSend(v14, "initWithDomain:code:userInfo:", v15, v13, v20);

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (int)_typeADriverRateFromTagRate:(int)a3
{
  uint64_t v3;
  int v7;
  int v8;
  void *specific;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;

  v3 = *(_QWORD *)&a3;
  if (a3 > 211)
  {
    if (a3 == 848)
      v7 = 4;
    else
      v7 = 0;
    if (a3 == 424)
      v8 = 3;
    else
      v8 = v7;
    if (a3 == 212)
      return 2;
    else
      return v8;
  }
  else
  {
    if (a3 == 26 || a3 == 52)
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
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
        v11(6, "%c[%{public}s %{public}s]:%i tag rate %d is too low for type A - using 106kbps", v14, ClassName, Name, 895, v3);
      }
      v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v16 = NFSharedLogGetLogger(v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = object_getClass(self);
        if (class_isMetaClass(v18))
          v19 = 43;
        else
          v19 = 45;
        *(_DWORD *)buf = 67110146;
        v23 = v19;
        v24 = 2082;
        v25 = object_getClassName(self);
        v26 = 2082;
        v27 = sel_getName(a2);
        v28 = 1024;
        v29 = 895;
        v30 = 1024;
        v31 = v3;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i tag rate %d is too low for type A - using 106kbps", buf, 0x28u);
      }

    }
    else if (a3 != 106)
    {
      return 0;
    }
    return 1;
  }
}

- (id)setTypeATagDataRate:(int)a3
{
  unsigned int typeATagDataRate;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NFACDriverWrapper *v9;
  unsigned int v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  _QWORD v21[4];

  typeATagDataRate = self->_typeATagDataRate;
  if (typeATagDataRate)
    *(_QWORD *)&a3 = typeATagDataRate;
  else
    v6 = a3;
  v7 = -[NFACDriverWrapper _typeADriverRateFromTagRate:](self, "_typeADriverRateFromTagRate:", *(_QWORD *)&a3);
  if (!(_DWORD)v7)
    return 0;
  v8 = v7;
  v9 = self;
  objc_sync_enter(v9);
  v10 = NFDriverSetTypeATagDataRate(v9->_driver, v8);
  objc_sync_exit(v9);

  if (!v10)
    return 0;
  v11 = objc_alloc((Class)NSError);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v20[0] = NSLocalizedDescriptionKey;
  if (v10 >= 0x47)
    v13 = 71;
  else
    v13 = v10;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002E6910[v13]));
  v21[0] = v14;
  v21[1] = &off_1002FE2E0;
  v20[1] = CFSTR("Line");
  v20[2] = CFSTR("Method");
  v15 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
  v21[2] = v15;
  v20[3] = NSDebugDescriptionErrorKey;
  v16 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 930);
  v21[3] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 4));
  v18 = objc_msgSend(v11, "initWithDomain:code:userInfo:", v12, v10, v17);

  return v18;
}

- (unsigned)getTagType:(id)a3
{
  NSMutableDictionary *remoteTags;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;

  remoteTags = self->_remoteTags;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "UID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](remoteTags, "objectForKey:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("type")));
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "unsignedIntValue");
  else
    v8 = 0;

  return v8;
}

- (_NFData)readFromHCEDevice:(void *)a3
{
  NFACDriverWrapper *v4;
  _NFData *v5;

  v4 = self;
  objc_sync_enter(v4);
  if (-[NFACDriverWrapper _isClosed](v4, "_isClosed"))
    v5 = 0;
  else
    v5 = (_NFData *)NFDriverRemoteDevReceive(v4->_driver, a3, 0);
  objc_sync_exit(v4);

  return v5;
}

- (BOOL)sendToHCEDevice:(void *)a3 buffer:(const void *)a4 length:(unsigned int)a5
{
  uint64_t v5;
  NFACDriverWrapper *v8;
  char v9;

  v5 = *(_QWORD *)&a5;
  v8 = self;
  objc_sync_enter(v8);
  if (-[NFACDriverWrapper _isClosed](v8, "_isClosed"))
    v9 = 0;
  else
    v9 = NFDriverRemoteDevSend(v8->_driver, a3, a4, v5);
  objc_sync_exit(v8);

  return v9;
}

- (void)setPollingConfig:(int)a3 tagNotificationConfig:(_NFDriverTagDiscoveryNtf)a4
{
  NFDriverSetPollingConfig(self->_driver, *(_QWORD *)&a3, *(unsigned int *)&a4);
}

- (BOOL)_restartDiscoveryWithReconfig:(BOOL)a3
{
  _BOOL8 v3;
  NFACDriverWrapper *v4;
  unsigned __int8 v5;
  int restarted;
  unsigned int v7;

  v3 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = -[NFACDriverWrapper _isClosed](v4, "_isClosed");
  if ((v5 & 1) != 0)
  {
    LOBYTE(restarted) = 0;
  }
  else
  {
    if (v4->_driver->var4)
      v7 = -[NFReaderRestrictor readerModeProtectionActive](v4->_readerPolicy, "readerModeProtectionActive");
    else
      v7 = 0;
    if (-[NFReaderRestrictor readerModeStoppedShouldCooloffRun](v4->_readerPolicy, "readerModeStoppedShouldCooloffRun"))
    {
      -[NFACDriverWrapper openSession:](v4, "openSession:", CFSTR("Cooloff"));
      v7 = 1;
    }
    restarted = NFDriverRestartDiscovery(v4->_driver, v3);
    if ((restarted & v7) == 1)
    {
      -[NFReaderRestrictor triggerBurnoutTimer](v4->_readerPolicy, "triggerBurnoutTimer");
      LOBYTE(restarted) = 1;
    }
  }
  objc_sync_exit(v4);

  return restarted & ~v5;
}

- (BOOL)restartDiscovery
{
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 1008);
  }
  v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v12 = NFSharedLogGetLogger(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(self);
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    *(_DWORD *)buf = 67109890;
    v19 = v15;
    v20 = 2082;
    v21 = object_getClassName(self);
    v22 = 2082;
    v23 = sel_getName(a2);
    v24 = 1024;
    v25 = 1008;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  return -[NFACDriverWrapper _restartDiscoveryWithReconfig:](self, "_restartDiscoveryWithReconfig:", 1);
}

- (BOOL)resumeDiscovery
{
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 1014);
  }
  v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v12 = NFSharedLogGetLogger(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(self);
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    *(_DWORD *)buf = 67109890;
    v19 = v15;
    v20 = 2082;
    v21 = object_getClassName(self);
    v22 = 2082;
    v23 = sel_getName(a2);
    v24 = 1024;
    v25 = 1014;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  return -[NFACDriverWrapper _restartDiscoveryWithReconfig:](self, "_restartDiscoveryWithReconfig:", 0);
}

- (id)getDieID
{
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  unint64_t v16;
  int v17;
  id v18;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  void (*v23)(uint64_t, const char *, ...);
  objc_class *v24;
  _BOOL4 v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  objc_class *v30;
  int v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *Name;
  const char *v36;
  unsigned int v37;
  uint8_t buf[8];
  __int16 v39;
  const char *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  unint64_t v46;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 1021);
  }
  v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v12 = NFSharedLogGetLogger(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(self);
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)&buf[4] = v15;
    v39 = 2082;
    v40 = object_getClassName(self);
    v41 = 2082;
    v42 = sel_getName(a2);
    v43 = 1024;
    v44 = 1021;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v16 = -[NFACDriverWrapper openSession:](self, "openSession:", CFSTR("DieID"));
  if (v16 == 1)
  {
    v37 = 0;
    *(_QWORD *)buf = 0;
    v17 = NFDriverReadDieID(self->_driver, buf, &v37);
    -[NFACDriverWrapper closeSession:](self, "closeSession:", CFSTR("DieID"));
    if (v17 && *(_QWORD *)buf)
    {
      v18 = objc_alloc((Class)NSData);
      return objc_msgSend(v18, "initWithBytesNoCopy:length:", *(_QWORD *)buf, v37);
    }
  }
  else
  {
    v20 = v16;
    v21 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v22 = NFLogGetLogger(v21);
    if (v22)
    {
      v23 = (void (*)(uint64_t, const char *, ...))v22;
      v24 = object_getClass(self);
      v25 = class_isMetaClass(v24);
      v34 = object_getClassName(self);
      v36 = sel_getName(a2);
      v26 = 45;
      if (v25)
        v26 = 43;
      v23(3, "%c[%{public}s %{public}s]:%i Failed to open session; hwState=%lu", v26, v34, v36, 1025, v20);
    }
    v27 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v28 = NFSharedLogGetLogger(v27);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = object_getClass(self);
      if (class_isMetaClass(v30))
        v31 = 43;
      else
        v31 = 45;
      v32 = object_getClassName(self);
      v33 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)&buf[4] = v31;
      v39 = 2082;
      v40 = v32;
      v41 = 2082;
      v42 = v33;
      v43 = 1024;
      v44 = 1025;
      v45 = 2048;
      v46 = v20;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to open session; hwState=%lu",
        buf,
        0x2Cu);
    }

  }
  return 0;
}

- (BOOL)configureMultiTagPolling
{
  void *v5;

  if (!self->_driver)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFACDriverWrapper.m"), 1044, CFSTR("driver not open"));

  }
  return NFDriverConfigureAutomaticMultiTagPolling();
}

- (id)queryMultiTagState:(BOOL *)a3 error:(id *)a4
{
  NSMutableArray *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  char v19;
  char v20;
  void *v21;
  BOOL v23;
  _OWORD v24[48];
  int buf;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  _BOOL4 v30;
  NSErrorUserInfoKey v31;
  void *v32;

  v7 = objc_opt_new(NSMutableArray);
  bzero(v24, 0x300uLL);
  v23 = 0;
  if (NFDriverGetMultiTagState(self->_driver, &v23, 0, v24))
  {
    if (a4)
    {
      v8 = objc_alloc((Class)NSError);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v31 = NSLocalizedDescriptionKey;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Security Violation"));
      v32 = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
      *a4 = objc_msgSend(v8, "initWithDomain:code:userInfo:", v9, 8, v11);

    }
    v12 = 0;
  }
  else
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
    if (Logger)
      Logger(6, "%s:%i MultiTag Enabled: %d", "-[NFACDriverWrapper queryMultiTagState:error:]", 1061, v23);
    v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v16 = NFSharedLogGetLogger(v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      buf = 136446722;
      v26 = "-[NFACDriverWrapper queryMultiTagState:error:]";
      v27 = 1024;
      v28 = 1061;
      v29 = 1024;
      v30 = v23;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}s:%i MultiTag Enabled: %d", (uint8_t *)&buf, 0x18u);
    }

    if (a3)
      *a3 = v23;
    v18 = 0;
    v19 = 1;
    do
    {
      v20 = v19;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NFACDriverWrapper _internalTagFromMultiTag:](self, "_internalTagFromMultiTag:", &v24[6 * v18 + 12]));
      if (v21)
        -[NSMutableArray addObject:](v7, "addObject:", v21);

      v19 = 0;
      v18 = 1;
    }
    while ((v20 & 1) != 0);
    v12 = v7;
  }

  return v12;
}

- (BOOL)clearMultiTagPollingState
{
  void *v5;

  if (!self->_driver)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFACDriverWrapper.m"), 1079, CFSTR("driver not open"));

  }
  return NFDriverClearAutomaticMultiTagPollingState();
}

- (BOOL)getRFSettings:(id)a3
{
  id v5;
  NFACDriverWrapper *v6;
  char v7;
  void *v9;

  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  if (!v6->_driver)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("NFACDriverWrapper.m"), 1093, CFSTR("driver not open"));

  }
  v7 = NFDriverRFSettingsCopy();
  objc_sync_exit(v6);

  return v7;
}

- (id)getPowerCounters:(id *)a3
{
  uint64_t PowerCounter;
  int v7;
  BOOL v8;
  double v9;
  double v10;
  _UNKNOWN **v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *specific;
  uint64_t Logger;
  void (*v20)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  objc_class *v28;
  int v29;
  id v30;
  id ErrorCode;
  id v32;
  NSMutableDictionary *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  const char *v43;
  id *v44;
  void *v45;
  id v46;
  const __CFString *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void (*v58)(uint64_t, const char *, ...);
  objc_class *v59;
  _BOOL4 v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  NSObject *v65;
  objc_class *v66;
  int v67;
  const char *v68;
  const char *v69;
  NSDate *lastPowerStateQuery;
  NSDate *v71;
  NSDate *v72;
  const char *Name;
  const char *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t buf[4];
  int v80;
  __int16 v81;
  const char *v82;
  __int16 v83;
  const char *v84;
  __int16 v85;
  int v86;
  __int16 v87;
  double v88;
  __int16 v89;
  NSMutableDictionary *v90;
  NSErrorUserInfoKey v91;
  void *v92;
  NSErrorUserInfoKey v93;
  void *v94;
  NSErrorUserInfoKey v95;
  void *v96;
  _QWORD v97[2];
  _QWORD v98[2];
  NSErrorUserInfoKey v99;
  NSMutableDictionary *v100;

  v77 = 0u;
  v78 = 0u;
  v76 = 0u;
  if (!self->_lastPowerStateQuery)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v20 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v24 = 45;
      if (isMetaClass)
        v24 = 43;
      v20(3, "%c[%{public}s %{public}s]:%i Power state tracking not available", v24, ClassName, Name, 1131);
    }
    v25 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v26 = NFSharedLogGetLogger(v25);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = object_getClass(self);
      if (class_isMetaClass(v28))
        v29 = 43;
      else
        v29 = 45;
      *(_DWORD *)buf = 67109890;
      v80 = v29;
      v81 = 2082;
      v82 = object_getClassName(self);
      v83 = 2082;
      v84 = sel_getName(a2);
      v85 = 1024;
      v86 = 1131;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Power state tracking not available", buf, 0x22u);
    }

    v30 = objc_alloc((Class)NSError);
    ErrorCode = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v99 = NSLocalizedDescriptionKey;
    v33 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid State"));
    v100 = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1));
    v36 = objc_msgSend(v30, "initWithDomain:code:userInfo:", ErrorCode, 12, v34);
    goto LABEL_21;
  }
  PowerCounter = NFDriverGetPowerCounter(self->_driver, &v76);
  v7 = PowerCounter;
  if ((_DWORD)PowerCounter)
    v8 = (_DWORD)PowerCounter == 15;
  else
    v8 = 1;
  if (!v8)
  {
    ErrorCode = (id)NFDriverCreateErrorCode(PowerCounter);
    v32 = objc_alloc((Class)NSError);
    v33 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v97[0] = NSLocalizedDescriptionKey;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Stack Error"));
    v97[1] = NSUnderlyingErrorKey;
    v98[0] = v34;
    v98[1] = ErrorCode;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v98, v97, 2));
    v36 = objc_msgSend(v32, "initWithDomain:code:userInfo:", v33, 15, v35);

LABEL_21:
    goto LABEL_47;
  }
  -[NSDate timeIntervalSinceNow](self->_lastPowerStateQuery, "timeIntervalSinceNow");
  v10 = v9;
  v33 = objc_opt_new(NSMutableDictionary);
  v11 = &AMFDRSealingMapCopyLocalData_ptr;
  if (v7 == 15)
  {
    if ((_DWORD)v76 == -1 || (v12 = DWORD1(v76), DWORD1(v76) == -1))
    {
      v13 = objc_alloc((Class)NSError);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v95 = NSLocalizedDescriptionKey;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Overflow"));
      v96 = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1));
      v17 = objc_msgSend(v13, "initWithDomain:code:userInfo:", v14, 45, v16);

      goto LABEL_24;
    }
  }
  else
  {
    v12 = DWORD1(v76);
  }
  v37 = -((double)(v12 + v76) - v10 * -1000.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:"));
  -[NSMutableDictionary setObject:forKey:](v33, "setObject:forKey:", v38, CFSTR("idleTime"));

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", DWORD1(v76)));
  -[NSMutableDictionary setObject:forKey:](v33, "setObject:forKey:", v39, CFSTR("rfTime"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v37));
  -[NSMutableDictionary setObject:forKey:](v33, "setObject:forKey:", v14, CFSTR("sleepTime"));
  v17 = 0;
LABEL_24:

  if (v7 == 15 && DWORD2(v77) == -1)
  {
    v40 = objc_alloc((Class)NSError);
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v93 = NSLocalizedDescriptionKey;
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Overflow"));
    v94 = v42;
    v43 = a2;
    v44 = a3;
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1));
    v46 = objc_msgSend(v40, "initWithDomain:code:userInfo:", v41, 45, v45);

    a3 = v44;
    a2 = v43;
    v11 = &AMFDRSealingMapCopyLocalData_ptr;
    v17 = v46;
  }
  else
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", DWORD2(v77)));
    if (-[NSMutableArray count](self->_multiTagState, "count"))
      v47 = CFSTR("vGpioFalseDetectCountWithTags");
    else
      v47 = CFSTR("vGpioFalseDetectCount");
    -[NSMutableDictionary setObject:forKey:](v33, "setObject:forKey:", v41, v47);
    v48 = sub_1001F2AB0((uint64_t)NFFuryCALogger);
    v42 = (void *)objc_claimAutoreleasedReturnValue(v48);
    sub_1001F3C0C((uint64_t)v42, v41);
  }

  if (v7 == 15 && DWORD2(v76) == -1)
  {
    v49 = objc_alloc((Class)NSError);
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v91 = NSLocalizedDescriptionKey;
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Overflow"));
    v92 = v51;
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1));
    v53 = objc_msgSend(v49, "initWithDomain:code:userInfo:", v50, 45, v52);

    v17 = v53;
  }
  else
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11[260], "numberWithUnsignedLongLong:", DWORD2(v76)));
    -[NSMutableDictionary setObject:forKey:](v33, "setObject:forKey:", v50, CFSTR("SEUptime"));
  }

  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11[260], "numberWithBool:", BYTE4(v77)));
  -[NSMutableDictionary setObject:forKey:](v33, "setObject:forKey:", v54, CFSTR("eseStatus"));

  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11[260], "numberWithBool:", BYTE5(v77)));
  -[NSMutableDictionary setObject:forKey:](v33, "setObject:forKey:", v55, CFSTR("mboxStatus"));

  v56 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v57 = NFLogGetLogger(v56);
  if (v57)
  {
    v58 = (void (*)(uint64_t, const char *, ...))v57;
    v59 = object_getClass(self);
    v60 = class_isMetaClass(v59);
    v61 = object_getClassName(self);
    v75 = sel_getName(a2);
    v62 = 45;
    if (v60)
      v62 = 43;
    v58(6, "%c[%{public}s %{public}s]:%i Last query was %g seconds ago, power dict = %{public}@", v62, v61, v75, 1177, *(_QWORD *)&v10, v33);
  }
  v63 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v64 = NFSharedLogGetLogger(v63);
  v65 = objc_claimAutoreleasedReturnValue(v64);
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    v66 = object_getClass(self);
    if (class_isMetaClass(v66))
      v67 = 43;
    else
      v67 = 45;
    v68 = object_getClassName(self);
    v69 = sel_getName(a2);
    *(_DWORD *)buf = 67110402;
    v80 = v67;
    v81 = 2082;
    v82 = v68;
    v83 = 2082;
    v84 = v69;
    v85 = 1024;
    v86 = 1177;
    v87 = 2048;
    v88 = v10;
    v89 = 2114;
    v90 = v33;
    _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Last query was %g seconds ago, power dict = %{public}@", buf, 0x36u);
  }

  if (a3)
    *a3 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithDictionary:", v33);
  lastPowerStateQuery = self->_lastPowerStateQuery;
  self->_lastPowerStateQuery = 0;

  v71 = (NSDate *)objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeIntervalSinceNow:", 0.0);
  v72 = self->_lastPowerStateQuery;
  self->_lastPowerStateQuery = v71;

  ErrorCode = v17;
  v36 = ErrorCode;
LABEL_47:

  return v36;
}

- (id)combinePowerCounters:(id)a3 with:(id)a4 overflow:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  char *v36;
  void *v37;
  char *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSMutableDictionary *v44;
  void *v45;
  NSMutableDictionary *v46;
  void *v47;
  const __CFString *v48;
  id v49;

  v5 = a5;
  v7 = a3;
  v8 = (NSMutableDictionary *)a4;
  v9 = objc_opt_new(NSMutableDictionary);
  if (objc_msgSend(v7, "count"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("idleTime")));
    v11 = objc_msgSend(v10, "intValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("idleTime")));
    v13 = objc_msgSend(v12, "intValue") + v11;

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v13));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v14, CFSTR("idleTime"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("rfTime")));
    LODWORD(v13) = objc_msgSend(v15, "intValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("rfTime")));
    v17 = objc_msgSend(v16, "intValue") + v13;

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v17));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v18, CFSTR("rfTime"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sleepTime")));
    LODWORD(v17) = objc_msgSend(v19, "intValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("sleepTime")));
    v21 = objc_msgSend(v20, "intValue") + v17;

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v21));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v22, CFSTR("sleepTime"));

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("falseDetect")));
    LODWORD(v21) = objc_msgSend(v23, "intValue");
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("falseDetect")));
    v25 = objc_msgSend(v24, "intValue") + v21;

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v25));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v26, CFSTR("falseDetect"));

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("vGpioFalseDetectCount")));
    LODWORD(v25) = objc_msgSend(v27, "intValue");
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("vGpioFalseDetectCount")));
    v29 = objc_msgSend(v28, "intValue") + v25;

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v29));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v30, CFSTR("vGpioFalseDetectCount"));

    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("vGpioFalseDetectCountWithTags")));
    LODWORD(v29) = objc_msgSend(v31, "intValue");
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("vGpioFalseDetectCountWithTags")));
    v33 = objc_msgSend(v32, "intValue") + v29;

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v33));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v34, CFSTR("vGpioFalseDetectCountWithTags"));

    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SEUptime")));
    v36 = (char *)objc_msgSend(v35, "longLongValue");
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("SEUptime")));
    v38 = &v36[(_QWORD)objc_msgSend(v37, "longLongValue")];

    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v38));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v39, CFSTR("SEUptime"));

    if (v5)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v40, CFSTR("Overflow"));

    }
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("eseStatus")));

    if (v41)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("eseStatus")));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v42, CFSTR("eseStatus"));

    }
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("mboxStatus")));

    v44 = v9;
    if (v43)
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("mboxStatus")));
      v46 = v9;
      v47 = v45;
      v48 = CFSTR("mboxStatus");
LABEL_10:
      -[NSMutableDictionary setObject:forKeyedSubscript:](v46, "setObject:forKeyedSubscript:", v47, v48);

      v44 = v9;
    }
  }
  else
  {
    v44 = v8;
    if (v5)
    {
      -[NSMutableDictionary addEntriesFromDictionary:](v9, "addEntriesFromDictionary:", v8);
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
      v48 = CFSTR("Overflow");
      v46 = v9;
      v47 = v45;
      goto LABEL_10;
    }
  }
  v49 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithDictionary:", v44);

  return v49;
}

- (BOOL)triggerDelayedWake:(unsigned __int8)a3
{
  return NFDriverTriggerDelayedWake(self->_driver, a3);
}

- (id)pushSignedRF:(id)a3
{
  void *specific;
  id v7;
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  const char *Name;
  NSErrorUserInfoKey v36;
  void *v37;
  NSErrorUserInfoKey v38;
  void *v39;
  uint8_t buf[4];
  int v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v7 = a3;
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v13 = 45;
    if (isMetaClass)
      v13 = 43;
    v9(6, "%c[%{public}s %{public}s]:%i ", v13, ClassName, Name, 1246);
  }
  v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v15 = NFSharedLogGetLogger(v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = object_getClass(self);
    if (class_isMetaClass(v17))
      v18 = 43;
    else
      v18 = 45;
    *(_DWORD *)buf = 67109890;
    v41 = v18;
    v42 = 2082;
    v43 = object_getClassName(self);
    v44 = 2082;
    v45 = sel_getName(a2);
    v46 = 1024;
    v47 = 1246;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v19 = objc_retainAutorelease(v7);
  v20 = objc_msgSend(v19, "bytes");
  v21 = objc_msgSend(v19, "length");

  v22 = NFDataCreateWithBytes(v20, v21);
  if (v22)
  {
    v23 = v22;
    v24 = NFDriverRFSettingsPushSignedSetting(self->_driver, v22);
    NFDataRelease(v23);
    if ((v24 & 1) != 0)
      return 0;
    v33 = objc_alloc((Class)NSError);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v36 = NSLocalizedDescriptionKey;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unknown Error"));
    v37 = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
    v30 = v33;
    v31 = v27;
    v32 = 6;
  }
  else
  {
    v26 = objc_alloc((Class)NSError);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v38 = NSLocalizedDescriptionKey;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "No resources"));
    v39 = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
    v30 = v26;
    v31 = v27;
    v32 = 34;
  }
  v34 = objc_msgSend(v30, "initWithDomain:code:userInfo:", v31, v32, v29);

  return v34;
}

- (void)_getDriverConfig:(_NFDriverConfig *)a3
{
  id var2;

  *(_OWORD *)&a3->var2 = 0u;
  *(_OWORD *)&a3->var4 = 0u;
  *(_OWORD *)&a3->var0 = 0u;
  var2 = a3->var2;
  a3->var2 = 0;

  a3->var0 = "com.apple.spmi.nfc.hammerfest";
  a3->var3 = self->_flags | 0x80000;
  a3->var4 = self->_pollingPeriod;
  a3->var6 = self->_multiTagPollingPeriod;
  a3->var7 = self->_multiTagPollingRetries;
}

- (void)setDriverCallbacks
{
  NFDriverSetCallback(self->_driver, 0, sub_10007DA14, self);
  NFDriverSetCallback(self->_driver, 1, sub_100005F88, self);
  NFDriverSetCallback(self->_driver, 6, sub_10007DA1C, self);
  NFDriverSetCallback(self->_driver, 7, sub_10007DA24, self);
  NFDriverSetCallback(self->_driver, 10, j__objc_msgSend_driverPLLUnlock, self);
  NFDriverSetCallback(self->_driver, 11, sub_10007DF04, self);
  NFDriverSetCallback(self->_driver, 21, sub_10007DF10, self);
}

- (BOOL)getControllerInfo:(id *)a3
{
  NFACDriverWrapper *v4;
  _NFDriver *driver;
  char ControllerInfo;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v18;
  const char *ClassName;
  const char *Name;
  void *v21;
  uint64_t v22;
  objc_class *v23;
  int v24;
  const char *v25;
  const char *v26;
  void *v28;
  NFHardwareControllerInfo *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  _QWORD v35[7];
  _QWORD v36[7];
  uint8_t buf[4];
  int v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;

  v4 = self;
  objc_sync_enter(v4);
  driver = v4->_driver;
  if (!driver)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, v4, CFSTR("NFACDriverWrapper.m"), 1290, CFSTR("driver not open"));

    driver = v4->_driver;
  }
  v31 = 0;
  v32 = 0;
  v34 = 0;
  v33 = 0;
  ControllerInfo = NFDriverGetControllerInfo(driver, &v31);
  if ((ControllerInfo & 1) != 0)
  {
    v29 = [NFHardwareControllerInfo alloc];
    v35[0] = CFSTR("siliconVersion");
    v7 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v31));
    v36[0] = v7;
    v35[1] = CFSTR("siliconName");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", HIDWORD(v31)));
    v36[1] = v8;
    v35[2] = CFSTR("ROMVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v32));
    v36[2] = v9;
    v35[3] = CFSTR("firmwareVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", HIDWORD(v32)));
    v36[3] = v10;
    v35[4] = CFSTR("firmwareRevision");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v33));
    v36[4] = v11;
    v35[5] = CFSTR("middlewareVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", HIDWORD(v33)));
    v36[5] = v12;
    v35[6] = CFSTR("hasMFW");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4->_driver->var10));
    v36[6] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v36, v35, 7));
    *a3 = -[NFHardwareControllerInfo initWithDictionary:](v29, "initWithDictionary:", v14);

  }
  else
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
    if (Logger)
    {
      Class = object_getClass(v4);
      if (class_isMetaClass(Class))
        v18 = 43;
      else
        v18 = 45;
      ClassName = object_getClassName(v4);
      Name = sel_getName(a2);
      Logger(3, "%c[%{public}s %{public}s]:%i Failed to get info", v18, ClassName, Name, 1294);
    }
    v21 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v22 = NFSharedLogGetLogger(v21);
    v7 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v23 = object_getClass(v4);
      if (class_isMetaClass(v23))
        v24 = 43;
      else
        v24 = 45;
      v25 = object_getClassName(v4);
      v26 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v38 = v24;
      v39 = 2082;
      v40 = v25;
      v41 = 2082;
      v42 = v26;
      v43 = 1024;
      v44 = 1294;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get info", buf, 0x22u);
    }
  }

  objc_sync_exit(v4);
  return ControllerInfo;
}

- (BOOL)_writeSMCMultiTagEnabled:(BOOL)a3
{
  _BOOL4 v3;
  const __CFDictionary *v6;
  io_service_t MatchingService;
  io_object_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  int v20;
  const char *v21;
  const char *v22;
  void *specific;
  uint64_t Logger;
  void (*v25)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  objc_class *v33;
  int v34;
  _BOOL4 v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void (*v39)(uint64_t, const char *, ...);
  objc_class *v40;
  _BOOL4 v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  objc_class *v46;
  int v47;
  const char *v48;
  const char *v49;
  const char *v50;
  NSObject *v51;
  os_log_type_t v52;
  uint32_t v53;
  objc_class *v54;
  _BOOL4 v55;
  const char *v56;
  const char *v57;
  const __CFString *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  objc_class *v62;
  int v63;
  const char *v64;
  const char *v65;
  const __CFString *v66;
  const char *v68;
  const char *v69;
  const char *v70;
  const char *Name;
  const char *v72;
  io_connect_t connect;
  uint8_t v74[4];
  int v75;
  __int16 v76;
  const char *v77;
  __int16 v78;
  const char *v79;
  __int16 v80;
  int v81;
  __int16 v82;
  const __CFString *v83;
  uint64_t buf;
  _BYTE buf_8[40];
  __int128 v86;
  __int128 v87;
  uint64_t v88;

  v3 = a3;
  v6 = IOServiceMatching("AppleSMCSensorDispatcher");
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v6);
  if (!MatchingService)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v25 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v29 = 45;
      if (isMetaClass)
        v29 = 43;
      v25(3, "%c[%{public}s %{public}s]:%i Failed to get AppleSMCSensorDispatcher", v29, ClassName, Name, 1316);
    }
    v30 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v31 = NFSharedLogGetLogger(v30);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = object_getClass(self);
      if (class_isMetaClass(v33))
        v34 = 43;
      else
        v34 = 45;
      LODWORD(buf) = 67109890;
      HIDWORD(buf) = v34;
      *(_WORD *)buf_8 = 2082;
      *(_QWORD *)&buf_8[2] = object_getClassName(self);
      *(_WORD *)&buf_8[10] = 2082;
      *(_QWORD *)&buf_8[12] = sel_getName(a2);
      *(_WORD *)&buf_8[20] = 1024;
      *(_DWORD *)&buf_8[22] = 1316;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get AppleSMCSensorDispatcher", (uint8_t *)&buf, 0x22u);
    }

    goto LABEL_23;
  }
  v8 = MatchingService;
  connect = 0;
  v9 = IOServiceOpen(MatchingService, mach_task_self_, 0, &connect);
  IOObjectRelease(v8);
  if (!(_DWORD)v9)
  {
    buf = 1;
    v88 = 0;
    v86 = 0u;
    v87 = 0u;
    *(_OWORD *)&buf_8[24] = 0u;
    *(_QWORD *)buf_8 = 1313227587;
    *(_OWORD *)&buf_8[8] = v3;
    v36 = IOConnectCallStructMethod(connect, 3u, &buf, 0x58uLL, 0, 0);
    IOServiceClose(connect);
    v35 = v36 == 0;
    v37 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v38 = NFLogGetLogger(v37);
    v39 = (void (*)(uint64_t, const char *, ...))v38;
    if ((_DWORD)v36)
    {
      if (v38)
      {
        v40 = object_getClass(self);
        v41 = class_isMetaClass(v40);
        v69 = object_getClassName(self);
        v72 = sel_getName(a2);
        v42 = 45;
        if (v41)
          v42 = 43;
        v39(3, "%c[%{public}s %{public}s]:%i Failed to write data to SMC - %x", v42, v69, v72, 1337, v36);
      }
      v43 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v44 = NFSharedLogGetLogger(v43);
      v45 = objc_claimAutoreleasedReturnValue(v44);
      if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        goto LABEL_50;
      v46 = object_getClass(self);
      if (class_isMetaClass(v46))
        v47 = 43;
      else
        v47 = 45;
      v48 = object_getClassName(self);
      v49 = sel_getName(a2);
      *(_DWORD *)v74 = 67110146;
      v75 = v47;
      v76 = 2082;
      v77 = v48;
      v78 = 2082;
      v79 = v49;
      v80 = 1024;
      v81 = 1337;
      v82 = 1024;
      LODWORD(v83) = v36;
      v50 = "%c[%{public}s %{public}s]:%i Failed to write data to SMC - %x";
      v51 = v45;
      v52 = OS_LOG_TYPE_ERROR;
      v53 = 40;
    }
    else
    {
      if (v38)
      {
        v54 = object_getClass(self);
        v55 = class_isMetaClass(v54);
        v56 = object_getClassName(self);
        v57 = sel_getName(a2);
        if (v3)
          v58 = CFSTR("on");
        else
          v58 = CFSTR("off");
        v59 = 45;
        if (v55)
          v59 = 43;
        v39(6, "%c[%{public}s %{public}s]:%i Sent notification to SMC about power %{public}@", v59, v56, v57, 1340, v58);
      }
      v60 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v61 = NFSharedLogGetLogger(v60);
      v45 = objc_claimAutoreleasedReturnValue(v61);
      if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        goto LABEL_50;
      v62 = object_getClass(self);
      if (class_isMetaClass(v62))
        v63 = 43;
      else
        v63 = 45;
      v64 = object_getClassName(self);
      v65 = sel_getName(a2);
      *(_DWORD *)v74 = 67110146;
      if (v3)
        v66 = CFSTR("on");
      else
        v66 = CFSTR("off");
      v75 = v63;
      v76 = 2082;
      v77 = v64;
      v78 = 2082;
      v79 = v65;
      v80 = 1024;
      v81 = 1340;
      v82 = 2114;
      v83 = v66;
      v50 = "%c[%{public}s %{public}s]:%i Sent notification to SMC about power %{public}@";
      v51 = v45;
      v52 = OS_LOG_TYPE_DEFAULT;
      v53 = 44;
    }
    _os_log_impl((void *)&_mh_execute_header, v51, v52, v50, v74, v53);
LABEL_50:

    return v35;
  }
  v10 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v11 = NFLogGetLogger(v10);
  if (v11)
  {
    v12 = (void (*)(uint64_t, const char *, ...))v11;
    v13 = object_getClass(self);
    v14 = class_isMetaClass(v13);
    v68 = object_getClassName(self);
    v70 = sel_getName(a2);
    v15 = 45;
    if (v14)
      v15 = 43;
    v12(3, "%c[%{public}s %{public}s]:%i Could not open service: %#x", v15, v68, v70, 1324, v9);
  }
  v16 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v17 = NFSharedLogGetLogger(v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v19 = object_getClass(self);
    if (class_isMetaClass(v19))
      v20 = 43;
    else
      v20 = 45;
    v21 = object_getClassName(self);
    v22 = sel_getName(a2);
    LODWORD(buf) = 67110146;
    HIDWORD(buf) = v20;
    *(_WORD *)buf_8 = 2082;
    *(_QWORD *)&buf_8[2] = v21;
    *(_WORD *)&buf_8[10] = 2082;
    *(_QWORD *)&buf_8[12] = v22;
    *(_WORD *)&buf_8[20] = 1024;
    *(_DWORD *)&buf_8[22] = 1324;
    *(_WORD *)&buf_8[26] = 1024;
    *(_DWORD *)&buf_8[28] = v9;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not open service: %#x", (uint8_t *)&buf, 0x28u);
  }

LABEL_23:
  LOBYTE(v35) = 0;
  return v35;
}

- (BOOL)hwInBadState
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  void *v5;
  unsigned __int8 v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("FailForwardNeeded")));
  v4 = objc_msgSend(v3, "BOOLValue");

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("FailForwardInProgress")));
  v6 = objc_msgSend(v5, "BOOLValue");

  return v4 | v6;
}

- (void)failForwardCompleted
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v2 = NFSharedSignpostLog(self);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HWRecovery-Hammerfest", "end", v5, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("FailForwardNeeded"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("FailForwardInProgress"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("FailForwardLastAttemptTimestamp"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("FailForwardDetectedTimestamp"));

}

- (void)triggerFailForward
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  uint64_t v8;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *v10;
  _BOOL4 v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  NSObject *WeakRetained;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *specific;
  uint64_t Logger;
  void (*v26)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  objc_class *v33;
  int v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  unsigned int v40;
  void *v41;
  uint64_t v42;
  void (*v43)(uint64_t, const char *, ...);
  objc_class *v44;
  _BOOL4 v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  objc_class *v50;
  int v51;
  void *v52;
  const char *ClassName;
  const char *v54;
  const char *Name;
  const char *v56;
  uint8_t buf[4];
  unsigned int v58;
  __int16 v59;
  const char *v60;
  __int16 v61;
  const char *v62;
  __int16 v63;
  int v64;
  __int16 v65;
  NSObject *v66;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("enableFailForwardOnAPDEV")));
  v6 = objc_msgSend(v5, "BOOLValue");

  if (!NFProductIsDevBoard() || (v6 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_ffDelegate);
    v16 = WeakRetained;
    if (WeakRetained)
    {
      v20 = NFSharedSignpostLog(WeakRetained);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_signpost_enabled(v21))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HWRecovery-Hammerfest", "begin", buf, 2u);
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      v23 = objc_claimAutoreleasedReturnValue(-[NSObject triggerHammerfestRecoveryAt:](v16, "triggerHammerfestRecoveryAt:", v22));

      if (v23)
      {
        specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        Logger = NFLogGetLogger(specific);
        if (Logger)
        {
          v26 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(self);
          isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(self);
          Name = sel_getName(a2);
          v29 = 45;
          if (isMetaClass)
            v29 = 43;
          v26(3, "%c[%{public}s %{public}s]:%i Failed to trigger recovery (%@)!", v29, ClassName, Name, 1384, v23);
        }
        v30 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v31 = NFSharedLogGetLogger(v30);
        v32 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = object_getClass(self);
          if (class_isMetaClass(v33))
            v34 = 43;
          else
            v34 = 45;
          v35 = object_getClassName(self);
          v36 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          v58 = v34;
          v59 = 2082;
          v60 = v35;
          v61 = 2082;
          v62 = v36;
          v63 = 1024;
          v64 = 1384;
          v65 = 2112;
          v66 = v23;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to trigger recovery (%@)!", buf, 0x2Cu);
        }

        v38 = NFSharedSignpostLog(v37);
        v39 = objc_claimAutoreleasedReturnValue(v38);
        if (os_signpost_enabled(v39))
        {
          v40 = -[NSObject code](v23, "code");
          *(_DWORD *)buf = 67109120;
          v58 = v40;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v39, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HWRecovery-Hammerfest", "begin, error.code: %d", buf, 8u);
        }

      }
      else
      {
        objc_msgSend(v4, "setBool:forKey:", 1, CFSTR("FailForwardInProgress"));
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        objc_msgSend(v4, "setObject:forKey:", v52, CFSTR("FailForwardLastAttemptTimestamp"));

        self->_failForwardAttemptedAfterFirstUnlock = 1;
      }
    }
    else
    {
      v41 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v42 = NFLogGetLogger(v41);
      if (v42)
      {
        v43 = (void (*)(uint64_t, const char *, ...))v42;
        v44 = object_getClass(self);
        v45 = class_isMetaClass(v44);
        v46 = object_getClassName(self);
        v56 = sel_getName(a2);
        v47 = 45;
        if (v45)
          v47 = 43;
        v43(3, "%c[%{public}s %{public}s]:%i delegate not set!", v47, v46, v56, 1377);
      }
      v48 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v49 = NFSharedLogGetLogger(v48);
      v23 = objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v50 = object_getClass(self);
        if (class_isMetaClass(v50))
          v51 = 43;
        else
          v51 = 45;
        *(_DWORD *)buf = 67109890;
        v58 = v51;
        v59 = 2082;
        v60 = object_getClassName(self);
        v61 = 2082;
        v62 = sel_getName(a2);
        v63 = 1024;
        v64 = 1377;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i delegate not set!", buf, 0x22u);
      }
    }

  }
  else
  {
    v7 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v8 = NFLogGetLogger(v7);
    if (v8)
    {
      v9 = (void (*)(uint64_t, const char *, ...))v8;
      v10 = object_getClass(self);
      v11 = class_isMetaClass(v10);
      v12 = object_getClassName(self);
      v54 = sel_getName(a2);
      v13 = 45;
      if (v11)
        v13 = 43;
      v9(3, "%c[%{public}s %{public}s]:%i skipping Fail Forward - assuming HW not present", v13, v12, v54, 1369);
    }
    v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v15 = NFSharedLogGetLogger(v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = object_getClass(self);
      if (class_isMetaClass(v17))
        v18 = 43;
      else
        v18 = 45;
      *(_DWORD *)buf = 67109890;
      v58 = v18;
      v59 = 2082;
      v60 = object_getClassName(self);
      v61 = 2082;
      v62 = sel_getName(a2);
      v63 = 1024;
      v64 = 1369;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i skipping Fail Forward - assuming HW not present", buf, 0x22u);
    }
  }

}

- (unint64_t)_openDriver:(BOOL *)a3
{
  id WeakRetained;
  _UNKNOWN **v7;
  id v8;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v12;
  const char *ClassName;
  const char *Name;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  const char *v20;
  const char *v21;
  void *v22;
  NSDate *v23;
  NSDate *lastPowerStateQuery;
  id v25;
  unint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void (*v30)(uint64_t, const char *, ...);
  objc_class *v31;
  _BOOL4 isMetaClass;
  const char *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  objc_class *v38;
  int v39;
  void *v40;
  void (*v41)(uint64_t, const char *, ...);
  objc_class *v42;
  uint64_t v43;
  const char *v44;
  const char *v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  objc_class *v49;
  int v50;
  const char *v51;
  const char *v52;
  void *v53;
  _BOOL4 v54;
  double v55;
  double v56;
  void *v57;
  uint64_t v58;
  void (*v59)(uint64_t, const char *, ...);
  objc_class *v60;
  uint64_t v61;
  const char *v62;
  const char *v63;
  void *v64;
  uint64_t v65;
  NSObject *v66;
  objc_class *v67;
  int v68;
  const char *v69;
  const char *v70;
  void *v71;
  void (*v72)(uint64_t, const char *, ...);
  objc_class *v73;
  uint64_t v74;
  const char *v75;
  const char *v76;
  void *v77;
  uint64_t v78;
  NSObject *v79;
  objc_class *v80;
  int v81;
  const char *v82;
  const char *v83;
  const char *v84;
  void *v85;
  uint64_t v86;
  id v87;
  void *v88;
  double v89;
  double v90;
  void *v91;
  void (*v92)(uint64_t, const char *, ...);
  objc_class *v93;
  uint64_t v94;
  const char *v95;
  const char *v96;
  void *v97;
  uint64_t v98;
  NSObject *v99;
  objc_class *v100;
  int v101;
  const char *v102;
  const char *v103;
  void *v104;
  void (*v105)(uint64_t, const char *, ...);
  objc_class *v106;
  uint64_t v107;
  const char *v108;
  const char *v109;
  void *v110;
  uint64_t v111;
  objc_class *v112;
  int v113;
  const char *v114;
  const char *v115;
  uint64_t v116;
  NSObject *v117;
  _NFDriver *v118;
  uint64_t v119;
  NSObject *v120;
  uint64_t v121;
  uint64_t v122;
  NSObject *v123;
  id v124;
  uint64_t Stack;
  id v126;
  uint64_t v127;
  NSObject *v128;
  id v129;
  id v130;
  void *v131;
  void *v132;
  void (*v133)(uint64_t, const char *, ...);
  objc_class *v134;
  uint64_t v135;
  const char *v136;
  const char *v137;
  void *v138;
  uint64_t v139;
  NSObject *v140;
  objc_class *v141;
  int v142;
  const char *v143;
  const char *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void (*v149)(uint64_t, const char *, ...);
  objc_class *v150;
  uint64_t v151;
  const char *v152;
  const char *v153;
  void *v154;
  uint64_t v155;
  NSObject *v156;
  objc_class *v157;
  int v158;
  const char *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  NSObject *v163;
  objc_class *v164;
  uint64_t v165;
  const char *v166;
  const char *v167;
  void *v168;
  uint64_t v169;
  objc_class *v170;
  int v171;
  const char *v172;
  const char *v173;
  void *v174;
  void (*v175)(uint64_t, const char *, ...);
  objc_class *v176;
  uint64_t v177;
  const char *v178;
  const char *v179;
  void *v180;
  uint64_t v181;
  NSObject *v182;
  objc_class *v183;
  int v184;
  const char *v185;
  const char *v186;
  void *v187;
  void (*v188)(uint64_t, const char *, ...);
  objc_class *v189;
  uint64_t v190;
  const char *v191;
  const char *v192;
  void *v193;
  uint64_t v194;
  NSObject *v195;
  objc_class *v196;
  int v197;
  const char *v198;
  const char *v199;
  void (*v201)(uint64_t, const char *, ...);
  objc_class *v202;
  uint64_t v203;
  const char *v204;
  const char *v205;
  void *v206;
  uint64_t v207;
  NSObject *v208;
  objc_class *v209;
  int v210;
  const char *v211;
  const char *v212;
  void *v213;
  void (*v214)(uint64_t, const char *, ...);
  objc_class *v215;
  uint64_t v216;
  const char *v217;
  const char *v218;
  void *v219;
  uint64_t v220;
  NSObject *v221;
  objc_class *v222;
  int v223;
  const char *v224;
  const char *v225;
  void *v226;
  void (*v227)(uint64_t, const char *, ...);
  objc_class *v228;
  uint64_t v229;
  const char *v230;
  const char *v231;
  void *v232;
  uint64_t v233;
  objc_class *v234;
  int v235;
  const char *v236;
  const char *v237;
  const char *v238;
  void *v239;
  BOOL *v240;
  int v241;
  id v242;
  _QWORD v243[3];
  int v244;
  char v245;
  _QWORD v246[2];
  _QWORD v247[2];
  uint8_t v248[4];
  int v249;
  __int16 v250;
  const char *v251;
  __int16 v252;
  const char *v253;
  __int16 v254;
  int v255;
  __int16 v256;
  uint64_t v257;
  uint8_t buf[8];
  __int16 v259;
  _BYTE v260[18];
  __int16 v261;
  int v262;
  __int16 v263;
  double v264;

  WeakRetained = objc_loadWeakRetained((id *)&self->_ffDelegate);
  v7 = &AMFDRSealingMapCopyLocalData_ptr;
  if (self->_driver)
  {
LABEL_2:
    v242 = 0;
    -[NFACDriverWrapper getControllerInfo:](self, "getControllerInfo:", &v242);
    v8 = v242;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
    if (Logger)
    {
      Class = object_getClass(self);
      if (class_isMetaClass(Class))
        v12 = 43;
      else
        v12 = 45;
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      Logger(6, "%c[%{public}s %{public}s]:%i Controller info : %{public}@", v12, ClassName, Name, 1555, v8);
    }
    v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v16 = NFSharedLogGetLogger(v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = object_getClass(self);
      if (class_isMetaClass(v18))
        v19 = 43;
      else
        v19 = 45;
      v20 = object_getClassName(self);
      v21 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)&buf[4] = v19;
      v259 = 2082;
      *(_QWORD *)v260 = v20;
      *(_WORD *)&v260[8] = 2082;
      *(_QWORD *)&v260[10] = v21;
      v261 = 1024;
      v262 = 1555;
      v263 = 2114;
      v264 = *(double *)&v8;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Controller info : %{public}@", buf, 0x2Cu);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NFACDriverWrapper delegate](self, "delegate"));
    objc_msgSend(v22, "handleStackLoad");

    -[NFReaderRestrictor stackLoaded:](self->_readerPolicy, "stackLoaded:", 0);
    v23 = (NSDate *)objc_msgSend(objc_alloc((Class)v7[236]), "initWithTimeIntervalSinceNow:", 0.0);
    lastPowerStateQuery = self->_lastPowerStateQuery;
    self->_lastPowerStateQuery = v23;

    NFDriverConfigureAutomaticMultiTagPolling(self->_driver);
    v25 = -[NFACDriverWrapper setTypeATagDataRate:](self, "setTypeATagDataRate:", 0);
    v26 = 1;
    goto LABEL_170;
  }
  v240 = a3;
  v241 = MKBDeviceUnlockedSinceBoot();
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v28 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v29 = NFLogGetLogger(v28);
  if (v29)
  {
    v30 = (void (*)(uint64_t, const char *, ...))v29;
    v31 = object_getClass(self);
    isMetaClass = class_isMetaClass(v31);
    v33 = object_getClassName(self);
    v238 = sel_getName(a2);
    v34 = 45;
    if (isMetaClass)
      v34 = 43;
    v30(6, "%c[%{public}s %{public}s]:%i starting stack", v34, v33, v238, 1404);
  }
  v35 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v36 = NFSharedLogGetLogger(v35);
  v37 = objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    v38 = object_getClass(self);
    if (class_isMetaClass(v38))
      v39 = 43;
    else
      v39 = 45;
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)&buf[4] = v39;
    v259 = 2082;
    *(_QWORD *)v260 = object_getClassName(self);
    *(_WORD *)&v260[8] = 2082;
    *(_QWORD *)&v260[10] = sel_getName(a2);
    v261 = 1024;
    v262 = 1404;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i starting stack", buf, 0x22u);
  }

  self->_lastFieldOffTime = 0;
  if (!WeakRetained)
  {
    v40 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v41 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v40);
    if (v41)
    {
      v42 = object_getClass(self);
      if (class_isMetaClass(v42))
        v43 = 43;
      else
        v43 = 45;
      v44 = object_getClassName(self);
      v45 = sel_getName(a2);
      v41(4, "%c[%{public}s %{public}s]:%i delegate not set!?", v43, v44, v45, 1414);
    }
    v46 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v47 = NFSharedLogGetLogger(v46);
    v48 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v49 = object_getClass(self);
      if (class_isMetaClass(v49))
        v50 = 43;
      else
        v50 = 45;
      v51 = object_getClassName(self);
      v52 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = v50;
      v259 = 2082;
      *(_QWORD *)v260 = v51;
      *(_WORD *)&v260[8] = 2082;
      *(_QWORD *)&v260[10] = v52;
      v261 = 1024;
      v262 = 1414;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i delegate not set!?", buf, 0x22u);
    }

  }
  if (objc_msgSend(WeakRetained, "getPrimaryHardwareState") == 3)
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("FailForwardDetectedTimestamp")));
    if (v53)
    {
      v54 = v241 == 1;
      objc_msgSend(v8, "timeIntervalSinceDate:", v53);
      v56 = v55;
      if (v55 <= 600.0)
        v54 = 0;
      v57 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v58 = NFLogGetLogger(v57);
      v59 = (void (*)(uint64_t, const char *, ...))v58;
      if (v54)
      {
        if (v58)
        {
          v60 = object_getClass(self);
          if (class_isMetaClass(v60))
            v61 = 43;
          else
            v61 = 45;
          v62 = object_getClassName(self);
          v63 = sel_getName(a2);
          v59(6, "%c[%{public}s %{public}s]:%i Fail forward still in progress for %f seconds - try again...", v61, v62, v63, 1425, *(_QWORD *)&v56);
        }
        v64 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v65 = NFSharedLogGetLogger(v64);
        v66 = objc_claimAutoreleasedReturnValue(v65);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          v67 = object_getClass(self);
          if (class_isMetaClass(v67))
            v68 = 43;
          else
            v68 = 45;
          v69 = object_getClassName(self);
          v70 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)&buf[4] = v68;
          v259 = 2082;
          *(_QWORD *)v260 = v69;
          *(_WORD *)&v260[8] = 2082;
          *(_QWORD *)&v260[10] = v70;
          v261 = 1024;
          v262 = 1425;
          v263 = 2048;
          v264 = v56;
          _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Fail forward still in progress for %f seconds - try again...", buf, 0x2Cu);
        }

        goto LABEL_61;
      }
      if (v58)
      {
        v164 = object_getClass(self);
        if (class_isMetaClass(v164))
          v165 = 43;
        else
          v165 = 45;
        v166 = object_getClassName(self);
        v167 = sel_getName(a2);
        v59(3, "%c[%{public}s %{public}s]:%i Fail forward in progress - bail out...", v165, v166, v167, 1428);
      }
      v168 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v169 = NFSharedLogGetLogger(v168);
      v79 = objc_claimAutoreleasedReturnValue(v169);
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
      {
        v170 = object_getClass(self);
        if (class_isMetaClass(v170))
          v171 = 43;
        else
          v171 = 45;
        v172 = object_getClassName(self);
        v173 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&buf[4] = v171;
        v259 = 2082;
        *(_QWORD *)v260 = v172;
        *(_WORD *)&v260[8] = 2082;
        *(_QWORD *)&v260[10] = v173;
        v261 = 1024;
        v262 = 1428;
        v84 = "%c[%{public}s %{public}s]:%i Fail forward in progress - bail out...";
LABEL_144:
        _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, v84, buf, 0x22u);
      }
    }
    else
    {
      if (!objc_msgSend(WeakRetained, "isRecoveryInProgress"))
      {
LABEL_61:

        goto LABEL_62;
      }
      objc_msgSend(v27, "setObject:forKey:", v8, CFSTR("FailForwardDetectedTimestamp"));
      v71 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v72 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v71);
      if (v72)
      {
        v73 = object_getClass(self);
        if (class_isMetaClass(v73))
          v74 = 43;
        else
          v74 = 45;
        v75 = object_getClassName(self);
        v76 = sel_getName(a2);
        v72(3, "%c[%{public}s %{public}s]:%i Fail forward detected - bail out...", v74, v75, v76, 1435);
      }
      v77 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v78 = NFSharedLogGetLogger(v77);
      v79 = objc_claimAutoreleasedReturnValue(v78);
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
      {
        v80 = object_getClass(self);
        if (class_isMetaClass(v80))
          v81 = 43;
        else
          v81 = 45;
        v82 = object_getClassName(self);
        v83 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&buf[4] = v81;
        v259 = 2082;
        *(_QWORD *)v260 = v82;
        *(_WORD *)&v260[8] = 2082;
        *(_QWORD *)&v260[10] = v83;
        v261 = 1024;
        v262 = 1435;
        v84 = "%c[%{public}s %{public}s]:%i Fail forward detected - bail out...";
        goto LABEL_144;
      }
    }

    goto LABEL_169;
  }
LABEL_62:
  if (!objc_msgSend(v27, "BOOLForKey:", CFSTR("FailForwardInProgress")))
    goto LABEL_91;
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("FailForwardLastAttemptTimestamp")));
  v86 = objc_opt_class(NSDate);
  if ((objc_opt_isKindOfClass(v85, v86) & 1) == 0 || (v87 = v85) == 0)
  {
    if (v241 == 1)
    {
      objc_msgSend(v27, "removeObjectForKey:", CFSTR("FailForwardInProgress"));
      v104 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v105 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v104);
      if (v105)
      {
        v106 = object_getClass(self);
        if (class_isMetaClass(v106))
          v107 = 43;
        else
          v107 = 45;
        v108 = object_getClassName(self);
        v109 = sel_getName(a2);
        v105(6, "%c[%{public}s %{public}s]:%i No FF timestamp stored - try again...", v107, v108, v109, 1467);
      }
      v110 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v111 = NFSharedLogGetLogger(v110);
      v99 = objc_claimAutoreleasedReturnValue(v111);
      if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
      {
        v112 = object_getClass(self);
        if (class_isMetaClass(v112))
          v113 = 43;
        else
          v113 = 45;
        v114 = object_getClassName(self);
        v115 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&buf[4] = v113;
        v259 = 2082;
        *(_QWORD *)v260 = v114;
        *(_WORD *)&v260[8] = 2082;
        *(_QWORD *)&v260[10] = v115;
        v261 = 1024;
        v262 = 1467;
        _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No FF timestamp stored - try again...", buf, 0x22u);
      }
      v88 = 0;
      goto LABEL_90;
    }
    v187 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v188 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v187);
    if (v188)
    {
      v189 = object_getClass(self);
      if (class_isMetaClass(v189))
        v190 = 43;
      else
        v190 = 45;
      v191 = object_getClassName(self);
      v192 = sel_getName(a2);
      v188(4, "%c[%{public}s %{public}s]:%i No FF timestamp stored but device is locked - bail out...", v190, v191, v192, 1470);
    }
    v193 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v194 = NFSharedLogGetLogger(v193);
    v195 = objc_claimAutoreleasedReturnValue(v194);
    if (os_log_type_enabled(v195, OS_LOG_TYPE_ERROR))
    {
      v196 = object_getClass(self);
      if (class_isMetaClass(v196))
        v197 = 43;
      else
        v197 = 45;
      v198 = object_getClassName(self);
      v199 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = v197;
      v259 = 2082;
      *(_QWORD *)v260 = v198;
      *(_WORD *)&v260[8] = 2082;
      *(_QWORD *)&v260[10] = v199;
      v261 = 1024;
      v262 = 1470;
      _os_log_impl((void *)&_mh_execute_header, v195, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i No FF timestamp stored but device is locked - bail out...", buf, 0x22u);
    }
    v88 = 0;
LABEL_168:

    goto LABEL_169;
  }
  v88 = v87;
  objc_msgSend(v8, "timeIntervalSinceDate:", v87);
  v90 = v89;
  if (v89 <= 86400.0 && self->_failForwardAttemptedAfterFirstUnlock || v241 != 1)
  {
    v226 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v227 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v226);
    if (v227)
    {
      v228 = object_getClass(self);
      if (class_isMetaClass(v228))
        v229 = 43;
      else
        v229 = 45;
      v230 = object_getClassName(self);
      v231 = sel_getName(a2);
      v227(3, "%c[%{public}s %{public}s]:%i Hammerfest recovery in progress - bail out...", v229, v230, v231, 1460);
    }
    v232 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v233 = NFSharedLogGetLogger(v232);
    v195 = objc_claimAutoreleasedReturnValue(v233);
    if (os_log_type_enabled(v195, OS_LOG_TYPE_ERROR))
    {
      v234 = object_getClass(self);
      if (class_isMetaClass(v234))
        v235 = 43;
      else
        v235 = 45;
      v236 = object_getClassName(self);
      v237 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = v235;
      v259 = 2082;
      *(_QWORD *)v260 = v236;
      *(_WORD *)&v260[8] = 2082;
      *(_QWORD *)&v260[10] = v237;
      v261 = 1024;
      v262 = 1460;
      _os_log_impl((void *)&_mh_execute_header, v195, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Hammerfest recovery in progress - bail out...", buf, 0x22u);
    }
    goto LABEL_168;
  }
  objc_msgSend(v27, "removeObjectForKey:", CFSTR("FailForwardInProgress"));
  objc_msgSend(v27, "removeObjectForKey:", CFSTR("FailForwardLastAttemptTimestamp"));
  v91 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v92 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v91);
  if (v92)
  {
    v93 = object_getClass(self);
    if (class_isMetaClass(v93))
      v94 = 43;
    else
      v94 = 45;
    v95 = object_getClassName(self);
    v96 = sel_getName(a2);
    v92(6, "%c[%{public}s %{public}s]:%i Still in recovery but last attempt was  %f seconds ago - try again...", v94, v95, v96, 1457, *(_QWORD *)&v90);
  }
  v97 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v98 = NFSharedLogGetLogger(v97);
  v99 = objc_claimAutoreleasedReturnValue(v98);
  if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
  {
    v100 = object_getClass(self);
    if (class_isMetaClass(v100))
      v101 = 43;
    else
      v101 = 45;
    v102 = object_getClassName(self);
    v103 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)&buf[4] = v101;
    v259 = 2082;
    *(_QWORD *)v260 = v102;
    *(_WORD *)&v260[8] = 2082;
    *(_QWORD *)&v260[10] = v103;
    v261 = 1024;
    v262 = 1457;
    v263 = 2048;
    v264 = v90;
    _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Still in recovery but last attempt was  %f seconds ago - try again...", buf, 0x2Cu);
  }
LABEL_90:

LABEL_91:
  if (!objc_msgSend(v27, "BOOLForKey:", CFSTR("FailForwardNeeded"))
    || (objc_msgSend(v27, "BOOLForKey:", CFSTR("FailForwardInProgress")) & 1) != 0)
  {
    v116 = NFSharedSignpostLog(objc_msgSend(v27, "removeObjectForKey:", CFSTR("FailForwardDetectedTimestamp")));
    v117 = objc_claimAutoreleasedReturnValue(v116);
    if (os_signpost_enabled(v117))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v117, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "NFDriverOpen", ", buf, 2u);
    }

    *(_QWORD *)&v260[6] = 0;
    -[NFACDriverWrapper _getDriverConfig:](self, "_getDriverConfig:", buf);
    v245 = 1;
    v118 = (_NFDriver *)NFDriverOpen(buf, &v245);
    self->_driver = v118;
    if (!v118)
    {
      v148 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v149 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v148);
      if (v149)
      {
        v150 = object_getClass(self);
        if (class_isMetaClass(v150))
          v151 = 43;
        else
          v151 = 45;
        v152 = object_getClassName(self);
        v153 = sel_getName(a2);
        v149(3, "%c[%{public}s %{public}s]:%i Failed to open device: %s", v151, v152, v153, 1493, *(_QWORD *)buf);
      }
      v154 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v155 = NFSharedLogGetLogger(v154);
      v156 = objc_claimAutoreleasedReturnValue(v155);
      if (os_log_type_enabled(v156, OS_LOG_TYPE_ERROR))
      {
        v157 = object_getClass(self);
        if (class_isMetaClass(v157))
          v158 = 43;
        else
          v158 = 45;
        v159 = object_getClassName(self);
        v160 = sel_getName(a2);
        *(_DWORD *)v248 = 67110146;
        v249 = v158;
        v250 = 2082;
        v251 = v159;
        v252 = 2082;
        v253 = v160;
        v254 = 1024;
        v255 = 1493;
        v256 = 2080;
        v257 = *(_QWORD *)buf;
        _os_log_impl((void *)&_mh_execute_header, v156, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to open device: %s", v248, 0x2Cu);
      }

      v162 = NFSharedSignpostLog(v161);
      v163 = objc_claimAutoreleasedReturnValue(v162);
      if (os_signpost_enabled(v163))
      {
        *(_WORD *)v248 = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v163, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "NFDriverOpen", ", v248, 2u);
      }

      if (v245)
        v26 = 2;
      else
        v26 = 3;
      LODWORD(Stack) = 1;
LABEL_197:

      v7 = &AMFDRSealingMapCopyLocalData_ptr;
      if ((_DWORD)Stack)
        goto LABEL_171;
      goto LABEL_2;
    }
    v119 = NFSharedSignpostLog(-[NFACDriverWrapper setDriverCallbacks](self, "setDriverCallbacks"));
    v120 = objc_claimAutoreleasedReturnValue(v119);
    if (os_signpost_enabled(v120))
    {
      *(_WORD *)v248 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v120, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "NFDriverOpen", ", v248, 2u);
    }

    v122 = NFSharedSignpostLog(v121);
    v123 = objc_claimAutoreleasedReturnValue(v122);
    if (os_signpost_enabled(v123))
    {
      *(_WORD *)v248 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v123, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "LoadStack", ", v248, 2u);
    }

    v239 = (void *)objc_claimAutoreleasedReturnValue(+[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger"));
    v124 = objc_msgSend(v239, "getTimestamp");
    Stack = NFDriverLoadStack(self->_driver, 4);
    v126 = objc_msgSend(v239, "getDurationFrom:", v124);
    v127 = NFSharedSignpostLog(v126);
    v128 = objc_claimAutoreleasedReturnValue(v127);
    if (os_signpost_enabled(v128))
    {
      *(_WORD *)v248 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v128, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "LoadStack", ", v248, 2u);
    }

    memset(v243, 0, sizeof(v243));
    v244 = 0;
    NFDriverGetControllerInfo(self->_driver, v243);
    v129 = objc_msgSend(v239, "getHardwareTypeForCA:", HIDWORD(v243[0]));
    v130 = sub_1001F2AB0((uint64_t)NFFuryCALogger);
    v131 = (void *)objc_claimAutoreleasedReturnValue(v130);
    sub_1001F2D74((uint64_t)v131, (uint64_t)v126, Stack, (uint64_t)v129, v241 == 1);

    if (Stack <= 0x11)
    {
      if (((1 << Stack) & 0x34004) != 0)
      {
        NFDriverClose(self->_driver);
        self->_driver = 0;
        objc_msgSend(v27, "setBool:forKey:", 1, CFSTR("FailForwardNeeded"));
        v132 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        if (v241 == 1)
        {
          v133 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v132);
          if (v133)
          {
            v134 = object_getClass(self);
            if (class_isMetaClass(v134))
              v135 = 43;
            else
              v135 = 45;
            v136 = object_getClassName(self);
            v137 = sel_getName(a2);
            v133(3, "%c[%{public}s %{public}s]:%i Failed to start stack: %d; recovery triggered",
              v135,
              v136,
              v137,
              1529,
              Stack);
          }
          v138 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v139 = NFSharedLogGetLogger(v138);
          v140 = objc_claimAutoreleasedReturnValue(v139);
          if (os_log_type_enabled(v140, OS_LOG_TYPE_ERROR))
          {
            v141 = object_getClass(self);
            if (class_isMetaClass(v141))
              v142 = 43;
            else
              v142 = 45;
            v143 = object_getClassName(self);
            v144 = sel_getName(a2);
            *(_DWORD *)v248 = 67110146;
            v249 = v142;
            v250 = 2082;
            v251 = v143;
            v252 = 2082;
            v253 = v144;
            v254 = 1024;
            v255 = 1529;
            v256 = 1024;
            LODWORD(v257) = Stack;
            _os_log_impl((void *)&_mh_execute_header, v140, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to start stack: %d; recovery triggered",
              v248,
              0x28u);
          }

          v145 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%du"), Stack));
          v246[0] = CFSTR("FailureKey");
          v246[1] = CFSTR("Result");
          v247[0] = CFSTR("ttrFury");
          v146 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", Stack));
          v247[1] = v146;
          v147 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v247, v246, 2));
          sub_100187F1C((uint64_t)NFBugCapture, CFSTR("Failed to start stack; FailForward triggered"),
            v145,
            v147);

          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)v248 = 67240192;
            v249 = Stack;
            _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to start stack; FailForward triggered (result=%{public}du)",
              v248,
              8u);
          }
          *v240 = 1;

        }
        else
        {
          v201 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v132);
          if (v201)
          {
            v202 = object_getClass(self);
            if (class_isMetaClass(v202))
              v203 = 43;
            else
              v203 = 45;
            v204 = object_getClassName(self);
            v205 = sel_getName(a2);
            v201(3, "%c[%{public}s %{public}s]:%i Failed to start stack: %d; but not unlocked yet - postpone",
              v203,
              v204,
              v205,
              1539,
              Stack);
          }
          v206 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v207 = NFSharedLogGetLogger(v206);
          v208 = objc_claimAutoreleasedReturnValue(v207);
          if (os_log_type_enabled(v208, OS_LOG_TYPE_ERROR))
          {
            v209 = object_getClass(self);
            if (class_isMetaClass(v209))
              v210 = 43;
            else
              v210 = 45;
            v211 = object_getClassName(self);
            v212 = sel_getName(a2);
            *(_DWORD *)v248 = 67110146;
            v249 = v210;
            v250 = 2082;
            v251 = v211;
            v252 = 2082;
            v253 = v212;
            v254 = 1024;
            v255 = 1539;
            v256 = 1024;
            LODWORD(v257) = Stack;
            _os_log_impl((void *)&_mh_execute_header, v208, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to start stack: %d; but not unlocked yet - postpone",
              v248,
              0x28u);
          }

        }
LABEL_195:
        LODWORD(Stack) = 1;
        goto LABEL_196;
      }
      if (!(_DWORD)Stack)
      {
LABEL_196:

        v26 = 2;
        goto LABEL_197;
      }
    }
    v213 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v214 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v213);
    if (v214)
    {
      v215 = object_getClass(self);
      if (class_isMetaClass(v215))
        v216 = 43;
      else
        v216 = 45;
      v217 = object_getClassName(self);
      v218 = sel_getName(a2);
      v214(3, "%c[%{public}s %{public}s]:%i Failed to start stack : %d", v216, v217, v218, 1545, Stack);
    }
    v219 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v220 = NFSharedLogGetLogger(v219);
    v221 = objc_claimAutoreleasedReturnValue(v220);
    if (os_log_type_enabled(v221, OS_LOG_TYPE_ERROR))
    {
      v222 = object_getClass(self);
      if (class_isMetaClass(v222))
        v223 = 43;
      else
        v223 = 45;
      v224 = object_getClassName(self);
      v225 = sel_getName(a2);
      *(_DWORD *)v248 = 67110146;
      v249 = v223;
      v250 = 2082;
      v251 = v224;
      v252 = 2082;
      v253 = v225;
      v254 = 1024;
      v255 = 1545;
      v256 = 1024;
      LODWORD(v257) = Stack;
      _os_log_impl((void *)&_mh_execute_header, v221, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to start stack : %d", v248, 0x28u);
    }

    NFDriverClose(self->_driver);
    self->_driver = 0;
    goto LABEL_195;
  }
  v174 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v175 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v174);
  if (v175)
  {
    v176 = object_getClass(self);
    if (class_isMetaClass(v176))
      v177 = 43;
    else
      v177 = 45;
    v178 = object_getClassName(self);
    v179 = sel_getName(a2);
    v175(4, "%c[%{public}s %{public}s]:%i HW in bad state but recovery is not triggered - trigger it now", v177, v178, v179, 1476);
  }
  v180 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v181 = NFSharedLogGetLogger(v180);
  v182 = objc_claimAutoreleasedReturnValue(v181);
  if (os_log_type_enabled(v182, OS_LOG_TYPE_ERROR))
  {
    v183 = object_getClass(self);
    if (class_isMetaClass(v183))
      v184 = 43;
    else
      v184 = 45;
    v185 = object_getClassName(self);
    v186 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)&buf[4] = v184;
    v259 = 2082;
    *(_QWORD *)v260 = v185;
    *(_WORD *)&v260[8] = 2082;
    *(_QWORD *)&v260[10] = v186;
    v261 = 1024;
    v262 = 1476;
    _os_log_impl((void *)&_mh_execute_header, v182, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i HW in bad state but recovery is not triggered - trigger it now", buf, 0x22u);
  }

  *v240 = 1;
LABEL_169:

  v26 = 2;
LABEL_170:

LABEL_171:
  return v26;
}

- (void)setPowerConsumptionMonitor:(id)a3
{
  id v4;
  NFThermalMonitor *v5;
  NFThermalMonitor *thermalMonitor;
  NFLastOneReaderRestrictor *v7;
  NFReaderRestrictor *readerPolicy;

  v4 = a3;
  v5 = (NFThermalMonitor *)sub_1000746B4((id *)[NFThermalMonitor alloc], v4);

  thermalMonitor = self->_thermalMonitor;
  self->_thermalMonitor = v5;

  v7 = -[NFLastOneReaderRestrictor initWithThermalMonitor:delegate:]([NFLastOneReaderRestrictor alloc], "initWithThermalMonitor:delegate:", self->_thermalMonitor, self);
  readerPolicy = self->_readerPolicy;
  self->_readerPolicy = &v7->super;

}

- (void)_closeDriverAndLeaveHWEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *specific;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  void *v17;
  NFReaderRestrictor *readerPolicy;
  NFThermalMonitor *thermalMonitor;
  NSDate *lastPowerStateQuery;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  _BOOL4 v32;

  if (self->_driver)
  {
    v3 = a3;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v11 = 45;
      if (isMetaClass)
        v11 = 43;
      v8(6, "%c[%{public}s %{public}s]:%i stopping stack; leaveHWOn=%d", v11, ClassName, Name, 1585, v3);
    }
    v12 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v13 = NFSharedLogGetLogger(v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = object_getClass(self);
      if (class_isMetaClass(v15))
        v16 = 43;
      else
        v16 = 45;
      *(_DWORD *)buf = 67110146;
      v24 = v16;
      v25 = 2082;
      v26 = object_getClassName(self);
      v27 = 2082;
      v28 = sel_getName(a2);
      v29 = 1024;
      v30 = 1585;
      v31 = 1024;
      v32 = v3;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i stopping stack; leaveHWOn=%d",
        buf,
        0x28u);
    }

    if (!v3)
      -[NFACDriverWrapper _writeSMCMultiTagEnabled:](self, "_writeSMCMultiTagEnabled:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NFACDriverWrapper delegate](self, "delegate"));
    objc_msgSend(v17, "handleStackUnload");

    -[NFReaderRestrictor stackUnloaded](self->_readerPolicy, "stackUnloaded");
    readerPolicy = self->_readerPolicy;
    self->_readerPolicy = 0;

    thermalMonitor = self->_thermalMonitor;
    self->_thermalMonitor = 0;

    NFDriverUnloadStackAndLeaveHWEnabled(self->_driver, v3);
    NFDriverClose(self->_driver);
    self->_driver = 0;
    lastPowerStateQuery = self->_lastPowerStateQuery;
    self->_lastPowerStateQuery = 0;

  }
}

- (id)_internalTagFromMultiTag:(_NFDriverRemoteTag *)a3
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *specific;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void (*v27)(uint64_t, const char *, ...);
  objc_class *v28;
  _BOOL4 v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  objc_class *v35;
  int v36;
  void *v37;
  uint64_t v38;
  void (*v39)(uint64_t, const char *, ...);
  objc_class *v40;
  _BOOL4 v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  objc_class *v47;
  int v48;
  const char *Name;
  const char *v50;
  const char *v51;
  uint8_t buf[4];
  int v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  int v59;

  if (!a3 || !a3->var4)
    return 0;
  v6 = objc_alloc_init((Class)NFTagInternal);
  v7 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", a3->var3, a3->var4);
  objc_msgSend(v6, "_setIdentifier:", v7);
  switch(a3->var1)
  {
    case 1:
      objc_msgSend(v6, "_setTechnology:", 1);
      v8 = v6;
      v9 = 1;
      goto LABEL_13;
    case 2:
      objc_msgSend(v6, "_setTechnology:", 2);
      v8 = v6;
      v9 = 4;
      goto LABEL_13;
    case 3:
      objc_msgSend(v6, "_setTechnology:", 4);
      v8 = v6;
      v9 = 7;
      goto LABEL_13;
    case 4:
      objc_msgSend(v6, "_setTechnology:", 1);
      v8 = v6;
      v9 = 9;
      goto LABEL_13;
    case 5:
      objc_msgSend(v6, "_setTechnology:", 16);
      v8 = v6;
      v9 = 8;
      goto LABEL_13;
    case 6:
      objc_msgSend(v6, "_setTechnology:", 1);
      v8 = v6;
      v9 = 11;
      goto LABEL_13;
    case 7:
      objc_msgSend(v6, "_setTechnology:", 1);
      v8 = v6;
      v9 = 12;
      goto LABEL_13;
    case 9:
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v13 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v17 = 45;
        if (isMetaClass)
          v17 = 43;
        v13(6, "%c[%{public}s %{public}s]:%i Found silent tag", v17, ClassName, Name, 1651);
      }
      v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v19 = NFSharedLogGetLogger(v18);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = object_getClass(self);
        if (class_isMetaClass(v21))
          v22 = 43;
        else
          v22 = 45;
        *(_DWORD *)buf = 67109890;
        v53 = v22;
        v54 = 2082;
        v55 = object_getClassName(self);
        v56 = 2082;
        v57 = sel_getName(a2);
        v58 = 1024;
        v59 = 1651;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Found silent tag", buf, 0x22u);
      }

      objc_msgSend(v6, "_setTechnology:", 1);
      objc_msgSend(v6, "_setType:", 3);
      v23 = v6;
      v24 = 1;
      goto LABEL_44;
    case 0xA:
      v25 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v26 = NFLogGetLogger(v25);
      if (v26)
      {
        v27 = (void (*)(uint64_t, const char *, ...))v26;
        v28 = object_getClass(self);
        v29 = class_isMetaClass(v28);
        v30 = object_getClassName(self);
        v50 = sel_getName(a2);
        v31 = 45;
        if (v29)
          v31 = 43;
        v27(6, "%c[%{public}s %{public}s]:%i Found silent A2 tag", v31, v30, v50, 1657);
      }
      v32 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v33 = NFSharedLogGetLogger(v32);
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = object_getClass(self);
        if (class_isMetaClass(v35))
          v36 = 43;
        else
          v36 = 45;
        *(_DWORD *)buf = 67109890;
        v53 = v36;
        v54 = 2082;
        v55 = object_getClassName(self);
        v56 = 2082;
        v57 = sel_getName(a2);
        v58 = 1024;
        v59 = 1657;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Found silent A2 tag", buf, 0x22u);
      }

      objc_msgSend(v6, "_setTechnology:", 1);
      objc_msgSend(v6, "_setType:", 3);
      v23 = v6;
      v24 = 2;
      goto LABEL_44;
    case 0xB:
      v37 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v38 = NFLogGetLogger(v37);
      if (v38)
      {
        v39 = (void (*)(uint64_t, const char *, ...))v38;
        v40 = object_getClass(self);
        v41 = class_isMetaClass(v40);
        v42 = object_getClassName(self);
        v51 = sel_getName(a2);
        v43 = 45;
        if (v41)
          v43 = 43;
        v39(6, "%c[%{public}s %{public}s]:%i Found silent A3 tag", v43, v42, v51, 1663);
      }
      v44 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v45 = NFSharedLogGetLogger(v44);
      v46 = objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v47 = object_getClass(self);
        if (class_isMetaClass(v47))
          v48 = 43;
        else
          v48 = 45;
        *(_DWORD *)buf = 67109890;
        v53 = v48;
        v54 = 2082;
        v55 = object_getClassName(self);
        v56 = 2082;
        v57 = sel_getName(a2);
        v58 = 1024;
        v59 = 1663;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Found silent A3 tag", buf, 0x22u);
      }

      objc_msgSend(v6, "_setTechnology:", 1);
      objc_msgSend(v6, "_setType:", 3);
      v23 = v6;
      v24 = 3;
LABEL_44:
      objc_msgSend(v23, "_setSilentType:", v24);
      break;
    default:
      objc_msgSend(v6, "_setTechnology:", 0);
      v8 = v6;
      v9 = 0;
LABEL_13:
      objc_msgSend(v8, "_setType:", v9);
      break;
  }

  return v6;
}

- (void)driverDidDetectMultiTagStateChange:(_NFDriverMultiTagStateInfo *)a3 rfError:(BOOL)a4
{
  _BOOL8 v4;
  void *specific;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  uint64_t v20;
  char v21;
  char v22;
  void *v23;
  void *v24;
  const char *Name;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;

  v4 = a4;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v10 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v14 = 45;
    if (isMetaClass)
      v14 = 43;
    v10(6, "%c[%{public}s %{public}s]:%i ", v14, ClassName, Name, 1680);
  }
  v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v16 = NFSharedLogGetLogger(v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = object_getClass(self);
    if (class_isMetaClass(v18))
      v19 = 43;
    else
      v19 = 45;
    *(_DWORD *)buf = 67109890;
    v27 = v19;
    v28 = 2082;
    v29 = object_getClassName(self);
    v30 = 2082;
    v31 = sel_getName(a2);
    v32 = 1024;
    v33 = 1680;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  -[NSMutableArray removeAllObjects](self->_multiTagState, "removeAllObjects");
  v20 = 0;
  v21 = 1;
  do
  {
    v22 = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NFACDriverWrapper _internalTagFromMultiTag:](self, "_internalTagFromMultiTag:", &a3->var1[v20]));
    if (v23)
      -[NSMutableArray addObject:](self->_multiTagState, "addObject:", v23);

    v21 = 0;
    v20 = 1;
  }
  while ((v22 & 1) != 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NFACDriverWrapper delegate](self, "delegate"));
  objc_msgSend(v24, "handleMultiTagStateChanged:rfError:", self->_multiTagState, v4);

}

- (void)handleReaderBurnoutTimer
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[NFACDriverWrapper delegate](self, "delegate"));
  objc_msgSend(v2, "handleReaderBurnoutTimer");

}

- (void)handleReaderBurnoutCleared
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NFACDriverWrapper delegate](self, "delegate"));
  objc_msgSend(v3, "handleReaderBurnoutCleared");

  -[NFACDriverWrapper closeSession:](self, "closeSession:", CFSTR("Cooloff"));
}

- (NFACDriverWrapperDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (NFACDriverWrapperDelegate *)a3;
}

- (BOOL)fieldPresent
{
  return self->_fieldPresent;
}

- (NFRoutingConfig)currentRouting
{
  return (NFRoutingConfig *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ffDelegate);
  objc_storeStrong((id *)&self->_thermalMonitor, 0);
  objc_storeStrong((id *)&self->_readerPolicy, 0);
  objc_storeStrong((id *)&self->_lastPowerStateQuery, 0);
  objc_storeStrong((id *)&self->_multiTagState, 0);
  objc_storeStrong((id *)&self->_remoteTags, 0);
  objc_storeStrong((id *)&self->_currentRouting, 0);
  objc_storeStrong((id *)&self->_sessionOwners, 0);
}

@end
