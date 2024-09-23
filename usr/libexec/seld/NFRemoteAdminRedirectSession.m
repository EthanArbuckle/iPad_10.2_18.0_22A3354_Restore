@implementation NFRemoteAdminRedirectSession

- (NFRemoteAdminRedirectSession)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NFRemoteAdminRedirectSession;
  return -[NFRemoteAdminRedirectSession init](&v3, "init");
}

- (NFRemoteAdminRedirectSession)initWithState:(id)a3 oneTimeConnection:(BOOL)a4 secureElementManagerSession:(id)a5
{
  id v9;
  id v10;
  NFRemoteAdminRedirectSession *v11;
  uint64_t v12;
  NSString *targetSEID;
  objc_super v15;

  v9 = a3;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)NFRemoteAdminRedirectSession;
  v11 = -[NFRemoteAdminRedirectSession init](&v15, "init");
  if (v11)
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "seid"));
    targetSEID = v11->_targetSEID;
    v11->_targetSEID = (NSString *)v12;

    objc_storeStrong((id *)&v11->_redirectState, a3);
    objc_storeStrong((id *)&v11->_seSession, a5);
    v11->_allocateSESession = v10 == 0;
    v11->_oneTimeConnection = a4;
  }

  return v11;
}

- (void)abort:(int64_t)a3
{
  NFRemoteAdminRedirectSession *v5;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v9;
  const char *ClassName;
  const char *Name;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  void *v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;

  v5 = self;
  objc_sync_enter(v5);
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
  if (Logger)
  {
    Class = object_getClass(v5);
    if (class_isMetaClass(Class))
      v9 = 43;
    else
      v9 = 45;
    ClassName = object_getClassName(v5);
    Name = sel_getName(a2);
    Logger(6, "%c[%{public}s %{public}s]:%i Aborting...", v9, ClassName, Name, 67);
  }
  v12 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v13 = NFSharedLogGetLogger(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = object_getClass(v5);
    if (class_isMetaClass(v15))
      v16 = 43;
    else
      v16 = 45;
    *(_DWORD *)buf = 67109890;
    v19 = v16;
    v20 = 2082;
    v21 = object_getClassName(v5);
    v22 = 2082;
    v23 = sel_getName(a2);
    v24 = 1024;
    v25 = 67;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Aborting...", buf, 0x22u);
  }

  v5->_abort = a3;
  if (v5->_allocateSESession)
    -[NFSecureElementManagerSession endSessionWithCompletion:](v5->_seSession, "endSessionWithCompletion:", &stru_100054778);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession connection](v5, "connection"));
  objc_msgSend(v17, "disconnect");

  objc_sync_exit(v5);
}

- (BOOL)aborted
{
  NFRemoteAdminRedirectSession *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_abort > 0;
  objc_sync_exit(v2);

  return v3;
}

- (int64_t)abortedReason
{
  NFRemoteAdminRedirectSession *v2;
  int64_t abort;

  v2 = self;
  objc_sync_enter(v2);
  abort = v2->_abort;
  objc_sync_exit(v2);

  return abort;
}

- (void)processNotification:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
  objc_msgSend(v5, "setNotification:", v4);

}

- (id)getNextRequest
{
  NSDictionary *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char *v14;
  _UNKNOWN **v15;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  Class isa;
  Class v22;
  uint64_t v23;
  Class v24;
  objc_class *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *i;
  void *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  id v34;
  NSMutableDictionary *v35;
  void *specific;
  uint64_t Logger;
  void (*v38)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  const __CFString *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  objc_class *v48;
  int v49;
  const char *v50;
  const char *v51;
  const __CFString *v52;
  void *v53;
  char *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void (*v61)(uint64_t, const char *, ...);
  objc_class *v62;
  _BOOL4 v63;
  NSMutableDictionary *v64;
  char *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  NSObject *v70;
  objc_class *v71;
  int v72;
  const char *v73;
  const char *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  unsigned int v85;
  void *v86;
  id v87;
  NSDictionary *v88;
  void *v89;
  uint64_t v90;
  void (*v91)(uint64_t, const char *, ...);
  objc_class *v92;
  _BOOL4 v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  NSObject *v98;
  objc_class *v99;
  int v100;
  const char *v101;
  const char *v102;
  void *v103;
  uint64_t v104;
  void (*v105)(uint64_t, const char *, ...);
  objc_class *v106;
  _BOOL4 v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  NSObject *v112;
  objc_class *v113;
  int v114;
  const char *v115;
  const char *v116;
  const char *v117;
  const char *v118;
  const char *v119;
  const char *v120;
  SEL sel;
  NSMutableDictionary *v122;
  __CFString *v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  id v128;
  uint8_t v129[128];
  uint8_t buf[4];
  int v131;
  __int16 v132;
  const char *v133;
  __int16 v134;
  const char *v135;
  __int16 v136;
  int v137;
  __int16 v138;
  const __CFString *v139;

  v3 = (NSDictionary *)self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
  v5 = objc_msgSend(v4, "step");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary redirectState](v3, "redirectState"));
  v7 = v6;
  if (v5 == (id)2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "redirectResponse"));

    return v8;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "unsentScriptResponse"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary redirectState](v3, "redirectState"));
  v12 = v11;
  if (v10)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "unsentScriptResponse"));

    return v13;
  }
  v14 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "whitelistedInstances"));

  v15 = &APSEnvironmentProduction_ptr;
  v16 = objc_opt_new(NSMutableDictionary);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary redirectState](v3, "redirectState"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "version"));
  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary redirectState](v3, "redirectState"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "version"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v20, CFSTR("version"));

  }
  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", &off_100057280, CFSTR("version"));
  }

  if (v14)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v14, CFSTR("whitelistedInstances"));
  isa = v3[1].super.isa;
  if (isa)
  {
    v123 = 0;
  }
  else
  {
    v22 = v3[2].super.isa;
    v128 = 0;
    v23 = objc_claimAutoreleasedReturnValue(-[objc_class stateInformationWithRedirectInfo:error:](v22, "stateInformationWithRedirectInfo:error:", v16, &v128));
    v123 = (__CFString *)v128;
    v24 = v3[1].super.isa;
    v3[1].super.isa = (Class)v23;

    isa = v3[1].super.isa;
    if (!isa)
    {
LABEL_23:
      v35 = v16;
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v38 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(v3);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(v3);
        Name = sel_getName(a2);
        if (v123)
          v43 = v123;
        else
          v43 = &stru_100055418;
        v44 = 45;
        if (isMetaClass)
          v44 = 43;
        v38(3, "%c[%{public}s %{public}s]:%i Failed to query state information %{public}@", v44, ClassName, Name, 164, v43);
      }
      v45 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v46 = NFSharedLogGetLogger(v45);
      v47 = objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        v48 = object_getClass(v3);
        if (class_isMetaClass(v48))
          v49 = 43;
        else
          v49 = 45;
        v50 = object_getClassName(v3);
        v51 = sel_getName(a2);
        v52 = v123;
        *(_DWORD *)buf = 67110146;
        if (!v123)
          v52 = &stru_100055418;
        v131 = v49;
        v132 = 2082;
        v133 = v50;
        v134 = 2082;
        v135 = v51;
        v136 = 1024;
        v137 = 164;
        v138 = 2114;
        v139 = v52;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to query state information %{public}@", buf, 0x2Cu);
      }
      v3 = 0;
      v16 = v35;
      goto LABEL_90;
    }
  }
  if (!-[objc_class count](isa, "count"))
    goto LABEL_23;
  v126 = 0u;
  v127 = 0u;
  v124 = 0u;
  v125 = 0u;
  v25 = v3[1].super.isa;
  v26 = -[objc_class countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v124, v129, 16);
  v122 = v16;
  if (v26)
  {
    v27 = v26;
    sel = v14;
    v28 = *(_QWORD *)v125;
    while (2)
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(_QWORD *)v125 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * (_QWORD)i);
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "NF_stringForKey:", CFSTR("SEID")));
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary targetSEID](v3, "targetSEID"));
        v33 = objc_msgSend(v31, "isEqualToString:", v32);

        if (v33)
        {
          v34 = v30;

          goto LABEL_39;
        }

      }
      v27 = -[objc_class countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v124, v129, 16);
      if (v27)
        continue;
      break;
    }
    v34 = 0;
LABEL_39:

    v47 = v34;
    v14 = (char *)sel;
    v16 = v122;
    v15 = &APSEnvironmentProduction_ptr;
    if (!v3)
      goto LABEL_89;
  }
  else
  {

    v47 = 0;
  }
  v53 = (void *)objc_opt_new(v15[55]);
  if (v47)
  {
    v54 = v14;
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary redirectState](v3, "redirectState"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "version"));
    if (v56)
    {
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary redirectState](v3, "redirectState"));
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "version"));
      objc_msgSend(v53, "setObject:forKeyedSubscript:", v58, CFSTR("kVersion"));

    }
    else
    {
      objc_msgSend(v53, "setObject:forKeyedSubscript:", &off_100057280, CFSTR("kVersion"));
    }

    v75 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary redirectState](v3, "redirectState"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "forwardDataToSP"));
    if (v76)
    {
      v77 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary redirectState](v3, "redirectState"));
      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "forwardDataToSP"));
      objc_msgSend(v53, "setObject:forKeyedSubscript:", v78, CFSTR("forwardData"));

    }
    else
    {
      objc_msgSend(v53, "setObject:forKeyedSubscript:", &__NSDictionary0__struct, CFSTR("forwardData"));
    }

    v79 = (void *)objc_opt_new(v15[55]);
    objc_msgSend(v79, "setObject:forKeyedSubscript:", CFSTR("internal"), CFSTR("secureElementType"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary targetSEID](v3, "targetSEID"));

    if (v80)
    {
      v81 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary targetSEID](v3, "targetSEID"));
      objc_msgSend(v79, "setObject:forKeyedSubscript:", v81, CFSTR("SEID"));

      v82 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject NF_dictionaryForKey:](v47, "NF_dictionaryForKey:", CFSTR("casdCertificate")));
      if (v82)
      {
        objc_msgSend(v79, "setObject:forKeyedSubscript:", v82, CFSTR("casdCertificate"));
        v83 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary redirectState](v3, "redirectState"));
        v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "version"));
        v85 = objc_msgSend(v84, "intValue");

        if (v85 == 4)
        {
          v86 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject NF_arrayForKey:](v47, "NF_arrayForKey:", CFSTR("protocolV4Containers")));
          if (objc_msgSend(v86, "count"))
            objc_msgSend(v79, "setObject:forKeyedSubscript:", v86, CFSTR("containers"));

        }
        v87 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithDictionary:", v79);
        objc_msgSend(v53, "setObject:forKeyedSubscript:", v87, CFSTR("SEStateInfo"));

        v88 = (NSDictionary *)objc_msgSend(objc_alloc((Class)NSDictionary), "initWithDictionary:", v53);
      }
      else
      {
        v103 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v104 = NFLogGetLogger(v103);
        if (v104)
        {
          v105 = (void (*)(uint64_t, const char *, ...))v104;
          v106 = object_getClass(v3);
          v107 = class_isMetaClass(v106);
          v108 = object_getClassName(v3);
          v120 = sel_getName("_generateRequestForSEState:");
          v109 = 45;
          if (v107)
            v109 = 43;
          v105(3, "%c[%{public}s %{public}s]:%i Missing CASD certificate", v109, v108, v120, 117);
        }
        v110 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v111 = NFSharedLogGetLogger(v110);
        v112 = objc_claimAutoreleasedReturnValue(v111);
        if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
        {
          v113 = object_getClass(v3);
          if (class_isMetaClass(v113))
            v114 = 43;
          else
            v114 = 45;
          v115 = object_getClassName(v3);
          v116 = sel_getName("_generateRequestForSEState:");
          *(_DWORD *)buf = 67109890;
          v131 = v114;
          v132 = 2082;
          v133 = v115;
          v134 = 2082;
          v135 = v116;
          v136 = 1024;
          v137 = 117;
          _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing CASD certificate", buf, 0x22u);
        }

        v88 = objc_opt_new(NSDictionary);
      }
      v3 = v88;

    }
    else
    {
      v89 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v90 = NFLogGetLogger(v89);
      if (v90)
      {
        v91 = (void (*)(uint64_t, const char *, ...))v90;
        v92 = object_getClass(v3);
        v93 = class_isMetaClass(v92);
        v94 = object_getClassName(v3);
        v119 = sel_getName("_generateRequestForSEState:");
        v95 = 45;
        if (v93)
          v95 = 43;
        v91(3, "%c[%{public}s %{public}s]:%i Invalid SEID", v95, v94, v119, 111);
      }
      v96 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v97 = NFSharedLogGetLogger(v96);
      v98 = objc_claimAutoreleasedReturnValue(v97);
      if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
      {
        v99 = object_getClass(v3);
        if (class_isMetaClass(v99))
          v100 = 43;
        else
          v100 = 45;
        v101 = object_getClassName(v3);
        v102 = sel_getName("_generateRequestForSEState:");
        *(_DWORD *)buf = 67109890;
        v131 = v100;
        v132 = 2082;
        v133 = v101;
        v134 = 2082;
        v135 = v102;
        v136 = 1024;
        v137 = 111;
        _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid SEID", buf, 0x22u);
      }

      v3 = objc_opt_new(NSDictionary);
    }

    v14 = v54;
    v16 = v122;
  }
  else
  {
    v59 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v60 = NFLogGetLogger(v59);
    if (v60)
    {
      v61 = (void (*)(uint64_t, const char *, ...))v60;
      v62 = object_getClass(v3);
      v63 = class_isMetaClass(v62);
      v64 = v16;
      v65 = v14;
      v66 = object_getClassName(v3);
      v118 = sel_getName("_generateRequestForSEState:");
      v67 = 45;
      if (v63)
        v67 = 43;
      v117 = v66;
      v14 = v65;
      v16 = v64;
      v61(3, "%c[%{public}s %{public}s]:%i Failed to find STATE!!!!", v67, v117, v118, 101);
    }
    v68 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v69 = NFSharedLogGetLogger(v68);
    v70 = objc_claimAutoreleasedReturnValue(v69);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      v71 = object_getClass(v3);
      if (class_isMetaClass(v71))
        v72 = 43;
      else
        v72 = 45;
      v73 = object_getClassName(v3);
      v74 = sel_getName("_generateRequestForSEState:");
      *(_DWORD *)buf = 67109890;
      v131 = v72;
      v132 = 2082;
      v133 = v73;
      v134 = 2082;
      v135 = v74;
      v136 = 1024;
      v137 = 101;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to find STATE!!!!", buf, 0x22u);
    }

    v3 = (NSDictionary *)objc_msgSend(objc_alloc((Class)NSDictionary), "initWithDictionary:", v53);
  }

LABEL_89:
LABEL_90:

  return v3;
}

- (unint64_t)executeScript:(id)a3
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NFSecureElementManagerSession *seSession;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  uint64_t v33;
  void (*v34)(uint64_t, const char *, ...);
  objc_class *v35;
  _BOOL4 v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  objc_class *v41;
  int v42;
  const char *v43;
  const char *v44;
  void *v45;
  uint64_t v46;
  void (*v47)(uint64_t, const char *, ...);
  objc_class *v48;
  _BOOL4 v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  objc_class *v55;
  int v56;
  const char *v57;
  const char *v58;
  const char *v59;
  NSObject *v60;
  uint32_t v61;
  void *v62;
  uint64_t v63;
  void (*v64)(uint64_t, const char *, ...);
  objc_class *v65;
  _BOOL4 v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  objc_class *v72;
  int v73;
  const char *v74;
  const char *v75;
  id v76;
  unint64_t v77;
  unsigned int redirectStepError;
  void *v79;
  uint64_t v80;
  void (*v81)(uint64_t, const char *, ...);
  objc_class *v82;
  _BOOL4 v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  objc_class *v88;
  int v89;
  const char *v90;
  const char *v91;
  unsigned int v93;
  void *v94;
  uint64_t v95;
  void (*v96)(uint64_t, const char *, ...);
  objc_class *v97;
  _BOOL4 v98;
  const char *v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  objc_class *v104;
  int v105;
  const char *v106;
  const char *v107;
  unsigned int v108;
  void *v109;
  uint64_t v110;
  void (*v111)(uint64_t, const char *, ...);
  objc_class *v112;
  _BOOL4 v113;
  const char *v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  objc_class *v119;
  int v120;
  const char *v121;
  const char *v122;
  unsigned int v123;
  void *v124;
  uint64_t v125;
  void (*v126)(uint64_t, const char *, ...);
  objc_class *v127;
  _BOOL4 v128;
  const char *v129;
  uint64_t v130;
  void *v131;
  uint64_t v132;
  objc_class *v133;
  int v134;
  const char *v135;
  const char *v136;
  void *v137;
  const char *v138;
  const char *Name;
  const char *v140;
  const char *v141;
  const char *v142;
  const char *v143;
  id v144;
  id v145;
  uint8_t buf[4];
  int v147;
  __int16 v148;
  const char *v149;
  __int16 v150;
  const char *v151;
  __int16 v152;
  int v153;
  __int16 v154;
  id v155;

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
    v9(6, "%c[%{public}s %{public}s]:%i Executing TSM script", v13, ClassName, Name, 187);
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
    v147 = v18;
    v148 = 2082;
    v149 = object_getClassName(self);
    v150 = 2082;
    v151 = sel_getName(a2);
    v152 = 1024;
    v153 = 187;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Executing TSM script", buf, 0x22u);
  }

  v19 = (void *)objc_opt_new(NFRunScriptParameters);
  if (!v19)
  {
    v137 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v137, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFRemoteAdminRedirectSession.m"), 191, CFSTR("Out of resources"));

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
  objc_msgSend(v19, "setCheckAIDAllowList:", objc_msgSend(v20, "step") == (id)1);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession targetSEID](self, "targetSEID"));
  objc_msgSend(v19, "setSeid:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "whitelistedInstances"));
  objc_msgSend(v19, "setAIDAllowList:", v23);

  objc_msgSend(v19, "setInitialSelectBeforeRun:", self->_performInitialAIDSelectFromWhitelist);
  seSession = self->_seSession;
  v145 = 0;
  LODWORD(v22) = -[NFSecureElementManagerSession runScript:parameters:outputResults:](seSession, "runScript:parameters:outputResults:", v7, v19, &v145);

  v25 = v145;
  self->_redirectStepError = v22;
  self->_performInitialAIDSelectFromWhitelist = 0;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
  objc_msgSend(v26, "setUnsentScriptResponse:", v25);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "performanceMetrics"));
  objc_msgSend(v19, "outTotalAPDUExecutionDuration");
  v30 = v29;
  objc_msgSend(v28, "totalAPDUTime");
  objc_msgSend(v28, "setTotalAPDUTime:", v30 + v31);

  v32 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v33 = NFLogGetLogger(v32);
  if (v33)
  {
    v34 = (void (*)(uint64_t, const char *, ...))v33;
    v35 = object_getClass(self);
    v36 = class_isMetaClass(v35);
    v138 = object_getClassName(self);
    v140 = sel_getName(a2);
    v37 = 45;
    if (v36)
      v37 = 43;
    v34(6, "%c[%{public}s %{public}s]:%i scriptResults = %{public}@", v37, v138, v140, 209, v25);
  }
  v38 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v39 = NFSharedLogGetLogger(v38);
  v40 = objc_claimAutoreleasedReturnValue(v39);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    v41 = object_getClass(self);
    if (class_isMetaClass(v41))
      v42 = 43;
    else
      v42 = 45;
    v43 = object_getClassName(self);
    v44 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    v147 = v42;
    v148 = 2082;
    v149 = v43;
    v150 = 2082;
    v151 = v44;
    v152 = 1024;
    v153 = 209;
    v154 = 2114;
    v155 = v25;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i scriptResults = %{public}@", buf, 0x2Cu);
  }

  if (objc_msgSend(v19, "outIncompleteExecution"))
  {
    v45 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v46 = NFLogGetLogger(v45);
    if (v46)
    {
      v47 = (void (*)(uint64_t, const char *, ...))v46;
      v48 = object_getClass(self);
      v49 = class_isMetaClass(v48);
      v50 = object_getClassName(self);
      v141 = sel_getName(a2);
      v51 = 45;
      if (v49)
        v51 = 43;
      v47(5, "%c[%{public}s %{public}s]:%i Incomplete script execution", v51, v50, v141, 212);
    }
    v52 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v53 = NFSharedLogGetLogger(v52);
    v54 = objc_claimAutoreleasedReturnValue(v53);
    if (!os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      goto LABEL_42;
    v55 = object_getClass(self);
    if (class_isMetaClass(v55))
      v56 = 43;
    else
      v56 = 45;
    v57 = object_getClassName(self);
    v58 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v147 = v56;
    v148 = 2082;
    v149 = v57;
    v150 = 2082;
    v151 = v58;
    v152 = 1024;
    v153 = 212;
    v59 = "%c[%{public}s %{public}s]:%i Incomplete script execution";
    v60 = v54;
    v61 = 34;
LABEL_41:
    _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, v59, buf, v61);
LABEL_42:
    v77 = 6;
    goto LABEL_56;
  }
  if (objc_msgSend(v19, "outFailureResponseDetected"))
  {
    v62 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v63 = NFLogGetLogger(v62);
    if (v63)
    {
      v64 = (void (*)(uint64_t, const char *, ...))v63;
      v65 = object_getClass(self);
      v66 = class_isMetaClass(v65);
      v67 = object_getClassName(self);
      v68 = sel_getName(a2);
      v144 = objc_msgSend(v19, "outFinalSWStatus");
      v69 = 45;
      if (v66)
        v69 = 43;
      v64(5, "%c[%{public}s %{public}s]:%i Failure response detected: 0x%lX", v69, v67, v68, 216, v144);
    }
    v70 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v71 = NFSharedLogGetLogger(v70);
    v54 = objc_claimAutoreleasedReturnValue(v71);
    if (!os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      goto LABEL_42;
    v72 = object_getClass(self);
    if (class_isMetaClass(v72))
      v73 = 43;
    else
      v73 = 45;
    v74 = object_getClassName(self);
    v75 = sel_getName(a2);
    v76 = objc_msgSend(v19, "outFinalSWStatus");
    *(_DWORD *)buf = 67110146;
    v147 = v73;
    v148 = 2082;
    v149 = v74;
    v150 = 2082;
    v151 = v75;
    v152 = 1024;
    v153 = 216;
    v154 = 2048;
    v155 = v76;
    v59 = "%c[%{public}s %{public}s]:%i Failure response detected: 0x%lX";
    v60 = v54;
    v61 = 44;
    goto LABEL_41;
  }
  redirectStepError = self->_redirectStepError;
  if (redirectStepError == 3 || redirectStepError == 15 || -[NFRemoteAdminRedirectSession aborted](self, "aborted"))
  {
    v79 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v80 = NFLogGetLogger(v79);
    if (v80)
    {
      v81 = (void (*)(uint64_t, const char *, ...))v80;
      v82 = object_getClass(self);
      v83 = class_isMetaClass(v82);
      v84 = object_getClassName(self);
      v142 = sel_getName(a2);
      v85 = 45;
      if (v83)
        v85 = 43;
      v81(3, "%c[%{public}s %{public}s]:%i Aborting redirect step.", v85, v84, v142, 221);
    }
    v86 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v87 = NFSharedLogGetLogger(v86);
    v54 = objc_claimAutoreleasedReturnValue(v87);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      v88 = object_getClass(self);
      if (class_isMetaClass(v88))
        v89 = 43;
      else
        v89 = 45;
      v90 = object_getClassName(self);
      v91 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v147 = v89;
      v148 = 2082;
      v149 = v90;
      v150 = 2082;
      v151 = v91;
      v152 = 1024;
      v153 = 221;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Aborting redirect step.", buf, 0x22u);
    }
    v77 = 1;
  }
  else
  {
    v93 = self->_redirectStepError;
    if (v93)
    {
      if (v93 == 7)
      {
        v94 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v95 = NFLogGetLogger(v94);
        if (v95)
        {
          v96 = (void (*)(uint64_t, const char *, ...))v95;
          v97 = object_getClass(self);
          v98 = class_isMetaClass(v97);
          v99 = object_getClassName(self);
          v100 = sel_getName(a2);
          v101 = 45;
          if (v98)
            v101 = 43;
          v96(4, "%c[%{public}s %{public}s]:%i Redirect step was not successful (_redirectStepError=%u).", v101, v99, v100, 224, self->_redirectStepError);
        }
        v102 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v103 = NFSharedLogGetLogger(v102);
        v54 = objc_claimAutoreleasedReturnValue(v103);
        v77 = 16;
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          v104 = object_getClass(self);
          if (class_isMetaClass(v104))
            v105 = 43;
          else
            v105 = 45;
          v106 = object_getClassName(self);
          v107 = sel_getName(a2);
          v108 = self->_redirectStepError;
          *(_DWORD *)buf = 67110146;
          v147 = v105;
          v148 = 2082;
          v149 = v106;
          v150 = 2082;
          v151 = v107;
          v152 = 1024;
          v153 = 224;
          v154 = 1024;
          LODWORD(v155) = v108;
          v77 = 16;
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Redirect step was not successful (_redirectStepError=%u).", buf, 0x28u);
        }
      }
      else
      {
        v109 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v110 = NFLogGetLogger(v109);
        if (v110)
        {
          v111 = (void (*)(uint64_t, const char *, ...))v110;
          v112 = object_getClass(self);
          v113 = class_isMetaClass(v112);
          v114 = object_getClassName(self);
          v115 = sel_getName(a2);
          v116 = 45;
          if (v113)
            v116 = 43;
          v111(4, "%c[%{public}s %{public}s]:%i Redirect step was not successful (_redirectStepError=%u).", v116, v114, v115, 227, self->_redirectStepError);
        }
        v117 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v118 = NFSharedLogGetLogger(v117);
        v54 = objc_claimAutoreleasedReturnValue(v118);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          v119 = object_getClass(self);
          if (class_isMetaClass(v119))
            v120 = 43;
          else
            v120 = 45;
          v121 = object_getClassName(self);
          v122 = sel_getName(a2);
          v123 = self->_redirectStepError;
          *(_DWORD *)buf = 67110146;
          v147 = v120;
          v148 = 2082;
          v149 = v121;
          v150 = 2082;
          v151 = v122;
          v152 = 1024;
          v153 = 227;
          v154 = 1024;
          LODWORD(v155) = v123;
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Redirect step was not successful (_redirectStepError=%u).", buf, 0x28u);
        }
        v77 = 10;
      }
    }
    else
    {
      if (v25)
      {
        v77 = 6;
        goto LABEL_57;
      }
      v124 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v125 = NFLogGetLogger(v124);
      if (v125)
      {
        v126 = (void (*)(uint64_t, const char *, ...))v125;
        v127 = object_getClass(self);
        v128 = class_isMetaClass(v127);
        v129 = object_getClassName(self);
        v143 = sel_getName(a2);
        v130 = 45;
        if (v128)
          v130 = 43;
        v126(3, "%c[%{public}s %{public}s]:%i C-APDU execution failure", v130, v129, v143, 230);
      }
      v131 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v132 = NFSharedLogGetLogger(v131);
      v54 = objc_claimAutoreleasedReturnValue(v132);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        v133 = object_getClass(self);
        if (class_isMetaClass(v133))
          v134 = 43;
        else
          v134 = 45;
        v135 = object_getClassName(self);
        v136 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v147 = v134;
        v148 = 2082;
        v149 = v135;
        v150 = 2082;
        v151 = v136;
        v152 = 1024;
        v153 = 230;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i C-APDU execution failure", buf, 0x22u);
      }
      v77 = 4;
    }
  }
LABEL_56:

LABEL_57:
  return v77;
}

- (unint64_t)executeHttpRequest:(id)a3 httpHeader:(id)a4 response:(id)a5 responseHeader:(id)a6 duration:(double *)a7 sessionError:(id *)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *specific;
  uint64_t Logger;
  void (*v29)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  objc_class *v37;
  int v38;
  const char *v39;
  const char *v40;
  const char *v41;
  void *v42;
  uint64_t v43;
  void (*v44)(uint64_t, const char *, ...);
  objc_class *v45;
  _BOOL4 v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  objc_class *v52;
  int v53;
  const char *v54;
  const char *v55;
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
  _BOOL4 oneTimeConnection;
  void *v71;
  uint64_t v72;
  void (*v73)(uint64_t, const char *, ...);
  objc_class *v74;
  _BOOL4 v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  objc_class *v80;
  int v81;
  const char *v82;
  const char *v83;
  objc_class *v84;
  _BOOL4 v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  NSObject *v90;
  objc_class *v91;
  int v92;
  const char *v93;
  const char *v94;
  const char *Name;
  const char *v96;
  const char *v97;
  const char *v98;
  const char *v99;
  uint64_t v100;
  uint8_t buf[4];
  int v102;
  __int16 v103;
  const char *v104;
  __int16 v105;
  const char *v106;
  __int16 v107;
  int v108;

  v100 = 0;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession connection](self, "connection"));
  v20 = objc_msgSend(v19, "performRequest:body:header:response:responseHeader:httpStatus:duration:sessionError:", 0, v18, v17, v16, v15, &v100, a7, a8);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
  v22 = objc_msgSend(v21, "step");

  if (v22 == (id)1)
  {
    if ((v20 & 0xFFFFFFF7) == 0x11)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
      objc_msgSend(v23, "setHttpStatus:", 0);
    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v100));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
      objc_msgSend(v24, "setHttpStatus:", v23);

    }
  }
  if (v20 <= 0x19 && ((1 << (char)v20) & 0x2060000) != 0)
    +[NFExceptionsCALogger postAnalyticsTSMConnectivityException:](NFExceptionsCALogger, "postAnalyticsTSMConnectivityException:", v20);
  if (v100 == 412)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
    objc_msgSend(v25, "setUnsentScriptResponse:", 0);

    return 6;
  }
  if (!(_DWORD)v20)
    return 8 * (v100 == 404);
  if (((_DWORD)v20 - 19) <= 1)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v29 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v33 = 45;
      if (isMetaClass)
        v33 = 43;
      v29(6, "%c[%{public}s %{public}s]:%i Server error", v33, ClassName, Name, 283);
    }
    v34 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v35 = NFSharedLogGetLogger(v34);
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    v37 = object_getClass(self);
    if (class_isMetaClass(v37))
      v38 = 43;
    else
      v38 = 45;
    v39 = object_getClassName(self);
    v40 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v102 = v38;
    v103 = 2082;
    v104 = v39;
    v105 = 2082;
    v106 = v40;
    v107 = 1024;
    v108 = 283;
    v41 = "%c[%{public}s %{public}s]:%i Server error";
LABEL_22:
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, v41, buf, 0x22u);
LABEL_23:

    return 3;
  }
  if ((_DWORD)v20 == 17)
  {
    v56 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v57 = NFLogGetLogger(v56);
    if (v57)
    {
      v58 = (void (*)(uint64_t, const char *, ...))v57;
      v59 = object_getClass(self);
      v60 = class_isMetaClass(v59);
      v61 = object_getClassName(self);
      v97 = sel_getName(a2);
      v62 = 45;
      if (v60)
        v62 = 43;
      v58(6, "%c[%{public}s %{public}s]:%i Network client error", v62, v61, v97, 292);
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
      *(_DWORD *)buf = 67109890;
      v102 = v67;
      v103 = 2082;
      v104 = v68;
      v105 = 2082;
      v106 = v69;
      v107 = 1024;
      v108 = 292;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Network client error", buf, 0x22u);
    }

    return 15;
  }
  else if ((_DWORD)v20 == 25)
  {
    v42 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v43 = NFLogGetLogger(v42);
    if (v43)
    {
      v44 = (void (*)(uint64_t, const char *, ...))v43;
      v45 = object_getClass(self);
      v46 = class_isMetaClass(v45);
      v47 = object_getClassName(self);
      v96 = sel_getName(a2);
      v48 = 45;
      if (v46)
        v48 = 43;
      v44(6, "%c[%{public}s %{public}s]:%i Network Unavailable", v48, v47, v96, 288);
    }
    v49 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v50 = NFSharedLogGetLogger(v49);
    v51 = objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v52 = object_getClass(self);
      if (class_isMetaClass(v52))
        v53 = 43;
      else
        v53 = 45;
      v54 = object_getClassName(self);
      v55 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v102 = v53;
      v103 = 2082;
      v104 = v54;
      v105 = 2082;
      v106 = v55;
      v107 = 1024;
      v108 = 288;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Network Unavailable", buf, 0x22u);
    }

    return 2;
  }
  else
  {
    oneTimeConnection = self->_oneTimeConnection;
    v71 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v72 = NFLogGetLogger(v71);
    v73 = (void (*)(uint64_t, const char *, ...))v72;
    if (oneTimeConnection)
    {
      if (v72)
      {
        v74 = object_getClass(self);
        v75 = class_isMetaClass(v74);
        v76 = object_getClassName(self);
        v98 = sel_getName(a2);
        v77 = 45;
        if (v75)
          v77 = 43;
        v73(6, "%c[%{public}s %{public}s]:%i Other error, short retry only", v77, v76, v98, 298);
      }
      v78 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v79 = NFSharedLogGetLogger(v78);
      v36 = objc_claimAutoreleasedReturnValue(v79);
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        goto LABEL_23;
      v80 = object_getClass(self);
      if (class_isMetaClass(v80))
        v81 = 43;
      else
        v81 = 45;
      v82 = object_getClassName(self);
      v83 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v102 = v81;
      v103 = 2082;
      v104 = v82;
      v105 = 2082;
      v106 = v83;
      v107 = 1024;
      v108 = 298;
      v41 = "%c[%{public}s %{public}s]:%i Other error, short retry only";
      goto LABEL_22;
    }
    if (v72)
    {
      v84 = object_getClass(self);
      v85 = class_isMetaClass(v84);
      v86 = object_getClassName(self);
      v99 = sel_getName(a2);
      v87 = 45;
      if (v85)
        v87 = 43;
      v73(6, "%c[%{public}s %{public}s]:%i Other error", v87, v86, v99, 301);
    }
    v88 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v89 = NFSharedLogGetLogger(v88);
    v90 = objc_claimAutoreleasedReturnValue(v89);
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      v91 = object_getClass(self);
      if (class_isMetaClass(v91))
        v92 = 43;
      else
        v92 = 45;
      v93 = object_getClassName(self);
      v94 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v102 = v92;
      v103 = 2082;
      v104 = v93;
      v105 = 2082;
      v106 = v94;
      v107 = 1024;
      v108 = 301;
      _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Other error", buf, 0x22u);
    }

    return 4;
  }
}

- (unint64_t)performRedirect
{
  unint64_t v4;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;
  id v8;
  void *v9;
  void *v10;
  void *specific;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  id v19;
  const char *ClassName;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  objc_class *v25;
  int v26;
  const char *v27;
  const char *v28;
  void *v29;
  uint64_t v30;
  void (*v31)(uint64_t, const char *, ...);
  objc_class *v32;
  _BOOL4 v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  objc_class *v38;
  int v39;
  void *v40;
  NSMutableDictionary *v41;
  NSMutableDictionary *v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  void (*v47)(uint64_t, const char *, ...);
  objc_class *v48;
  _BOOL4 v49;
  const char *v50;
  const char *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  NSObject *v56;
  objc_class *v57;
  int v58;
  const char *v59;
  const char *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void (*v66)(uint64_t, const char *, ...);
  objc_class *v67;
  _BOOL4 v68;
  NSMutableDictionary *v69;
  void *v70;
  id v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  objc_class *v76;
  NSObject *v77;
  int v78;
  const char *v79;
  const char *v80;
  void *v81;
  NSObject *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void (*v86)(uint64_t, const char *, ...);
  objc_class *v87;
  _BOOL4 v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  objc_class *v93;
  NSObject *v94;
  int v95;
  const char *v96;
  const char *v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  void (*v102)(uint64_t, const char *, ...);
  objc_class *v103;
  _BOOL4 v104;
  NSObject *v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  NSObject *v110;
  objc_class *v111;
  NSObject *v112;
  int v113;
  const char *v114;
  const char *v115;
  void *v116;
  void *v117;
  void *v118;
  unint64_t v119;
  void *v120;
  const char *v122;
  const char *v123;
  const char *v124;
  const char *v125;
  const char *Name;
  const char *v127;
  const char *v128;
  const char *v129;
  const char *v130;
  id v131;
  void *v132;
  id v133;
  double v134;
  uint8_t buf[4];
  int v136;
  __int16 v137;
  const char *v138;
  __int16 v139;
  const char *v140;
  __int16 v141;
  int v142;
  __int16 v143;
  unint64_t v144;

  if (-[NFRemoteAdminRedirectSession aborted](self, "aborted"))
    return 1;
  v5 = objc_autoreleasePoolPush();
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession getNextRequest](self, "getNextRequest"));
  if (v6)
  {
    v7 = objc_opt_new(NSMutableDictionary);
    v133 = 0;
    v134 = 0.0;
    v4 = -[NFRemoteAdminRedirectSession executeHttpRequest:httpHeader:response:responseHeader:duration:sessionError:](self, "executeHttpRequest:httpHeader:response:responseHeader:duration:sessionError:", v6, 0, v7, 0, &v134, &v133);
    v8 = v133;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "performanceMetrics"));
    objc_msgSend(v10, "setNsUrlSessionError:", v8);

    if (v4)
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v13 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        v16 = v5;
        v17 = v7;
        v18 = v6;
        v19 = v8;
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v21 = 45;
        if (isMetaClass)
          v21 = 43;
        v122 = ClassName;
        v8 = v19;
        v6 = v18;
        v7 = v17;
        v5 = v16;
        v13(6, "%c[%{public}s %{public}s]:%i HTTP failed, status=0x%lx", v21, v122, Name, 419, v4);
      }
      v22 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v23 = NFSharedLogGetLogger(v22);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = object_getClass(self);
        if (class_isMetaClass(v25))
          v26 = 43;
        else
          v26 = 45;
        v27 = object_getClassName(self);
        v28 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v136 = v26;
        v137 = 2082;
        v138 = v27;
        v139 = 2082;
        v140 = v28;
        v141 = 1024;
        v142 = 419;
        v143 = 2048;
        v144 = v4;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i HTTP failed, status=0x%lx", buf, 0x2Cu);
      }

      if (v4 != 2)
        sub_100010C3C(self, 0, v134);
    }
    else
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
      objc_msgSend(v40, "setUnsentScriptResponse:", 0);

      sub_100010C3C(self, -[NSMutableDictionary count](v7, "count") != 0, v134);
      v41 = v7;
      v42 = v41;
      if (self)
      {
        if (-[NSMutableDictionary count](v41, "count"))
        {
          v131 = v8;
          v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v42, "objectForKeyedSubscript:", CFSTR("kVersion")));
          v44 = objc_msgSend(v43, "integerValue");

          v132 = v5;
          if (v44 != (id)2)
          {
            v45 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v46 = NFLogGetLogger(v45);
            if (v46)
            {
              v47 = (void (*)(uint64_t, const char *, ...))v46;
              v48 = object_getClass(self);
              v49 = class_isMetaClass(v48);
              v50 = object_getClassName(self);
              v51 = sel_getName("_processRedirectCommands:");
              v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v44));
              v53 = 45;
              if (v49)
                v53 = 43;
              v47(6, "%c[%{public}s %{public}s]:%i Protocol version = %{public}@", v53, v50, v51, 337, v52);

            }
            v54 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v55 = NFSharedLogGetLogger(v54);
            v56 = objc_claimAutoreleasedReturnValue(v55);
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
            {
              v57 = object_getClass(self);
              if (class_isMetaClass(v57))
                v58 = 43;
              else
                v58 = 45;
              v59 = object_getClassName(self);
              v60 = sel_getName("_processRedirectCommands:");
              v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v44));
              *(_DWORD *)buf = 67110146;
              v136 = v58;
              v137 = 2082;
              v138 = v59;
              v139 = 2082;
              v140 = v60;
              v141 = 1024;
              v142 = 337;
              v143 = 2114;
              v144 = (unint64_t)v61;
              _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Protocol version = %{public}@", buf, 0x2Cu);

            }
          }
          v62 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary NF_numberForKey:](v42, "NF_numberForKey:", CFSTR("SPStatusCode")));
          if (v62)
          {
            v63 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
            objc_msgSend(v63, "setSpStatusCode:", v62);
          }
          else
          {
            v81 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary NF_stringForKey:](v42, "NF_stringForKey:", CFSTR("SPStatusCode")));
            v63 = v81;
            if (v81)
            {
              v82 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v81, "integerValue")));
              v83 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
              objc_msgSend(v83, "setSpStatusCode:", v82);

            }
            else
            {
              v84 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v85 = NFLogGetLogger(v84);
              if (v85)
              {
                v86 = (void (*)(uint64_t, const char *, ...))v85;
                v87 = object_getClass(self);
                v88 = class_isMetaClass(v87);
                v89 = object_getClassName(self);
                v129 = sel_getName("_processRedirectCommands:");
                v90 = 45;
                if (v88)
                  v90 = 43;
                v124 = v89;
                v62 = 0;
                v86(6, "%c[%{public}s %{public}s]:%i SPStatusCode not available", v90, v124, v129, 350);
              }
              v91 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v92 = NFSharedLogGetLogger(v91);
              v82 = objc_claimAutoreleasedReturnValue(v92);
              if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
              {
                v93 = object_getClass(self);
                v94 = v62;
                if (class_isMetaClass(v93))
                  v95 = 43;
                else
                  v95 = 45;
                v96 = object_getClassName(self);
                v97 = sel_getName("_processRedirectCommands:");
                *(_DWORD *)buf = 67109890;
                v136 = v95;
                v62 = v94;
                v137 = 2082;
                v138 = v96;
                v139 = 2082;
                v140 = v97;
                v141 = 1024;
                v142 = 350;
                _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i SPStatusCode not available", buf, 0x22u);
              }
            }

          }
          v98 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary NF_numberForKey:](v42, "NF_numberForKey:", CFSTR("kStartNewSession")));
          v99 = v98;
          if (v98
            && objc_msgSend(v98, "BOOLValue")
            && !-[NFRemoteAdminRedirectSession startNewSession](self, "startNewSession"))
          {
            v100 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v101 = NFLogGetLogger(v100);
            if (v101)
            {
              v102 = (void (*)(uint64_t, const char *, ...))v101;
              v103 = object_getClass(self);
              v104 = class_isMetaClass(v103);
              v105 = v62;
              v106 = object_getClassName(self);
              v130 = sel_getName("_processRedirectCommands:");
              v107 = 45;
              if (v104)
                v107 = 43;
              v125 = v106;
              v62 = v105;
              v102(3, "%c[%{public}s %{public}s]:%i Failed to restart session", v107, v125, v130, 362);
            }
            v108 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v109 = NFSharedLogGetLogger(v108);
            v110 = objc_claimAutoreleasedReturnValue(v109);
            if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
            {
              v111 = object_getClass(self);
              v112 = v62;
              if (class_isMetaClass(v111))
                v113 = 43;
              else
                v113 = 45;
              v114 = object_getClassName(self);
              v115 = sel_getName("_processRedirectCommands:");
              *(_DWORD *)buf = 67109890;
              v136 = v113;
              v62 = v112;
              v137 = 2082;
              v138 = v114;
              v139 = 2082;
              v140 = v115;
              v141 = 1024;
              v142 = 362;
              _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to restart session", buf, 0x22u);
            }

          }
          v116 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary NF_dictionaryForKey:](v42, "NF_dictionaryForKey:", CFSTR("forwardData")));
          if (v116)
          {
            v117 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
            objc_msgSend(v117, "setForwardDataToSMP:", v116);

          }
          v118 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary NF_arrayForKey:](v42, "NF_arrayForKey:", CFSTR("kCommands")));
          if (!objc_msgSend(v118, "count")
            || (v119 = -[NFRemoteAdminRedirectSession executeScript:](self, "executeScript:", v42), v119 == 6)
            || (v4 = v119) == 0)
          {
            v120 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary NF_dictionaryForKey:](v42, "NF_dictionaryForKey:", CFSTR("kNotification")));
            if (v120)
              -[NFRemoteAdminRedirectSession processNotification:](self, "processNotification:", v120);
            if (objc_msgSend(v118, "count"))
              v4 = 6;
            else
              v4 = 0;

          }
          v8 = v131;
          v5 = v132;
        }
        else
        {
          v64 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v65 = NFLogGetLogger(v64);
          if (v65)
          {
            v66 = (void (*)(uint64_t, const char *, ...))v65;
            v67 = object_getClass(self);
            v68 = class_isMetaClass(v67);
            v69 = v7;
            v70 = v6;
            v71 = v8;
            v72 = object_getClassName(self);
            v128 = sel_getName("_processRedirectCommands:");
            v73 = 45;
            if (v68)
              v73 = 43;
            v123 = v72;
            v8 = v71;
            v6 = v70;
            v7 = v69;
            v66(6, "%c[%{public}s %{public}s]:%i no further action required", v73, v123, v128, 330);
          }
          v74 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v75 = NFSharedLogGetLogger(v74);
          v62 = objc_claimAutoreleasedReturnValue(v75);
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            v76 = object_getClass(self);
            v77 = v62;
            if (class_isMetaClass(v76))
              v78 = 43;
            else
              v78 = 45;
            v79 = object_getClassName(self);
            v80 = sel_getName("_processRedirectCommands:");
            *(_DWORD *)buf = 67109890;
            v136 = v78;
            v62 = v77;
            v137 = 2082;
            v138 = v79;
            v139 = 2082;
            v140 = v80;
            v141 = 1024;
            v142 = 330;
            _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i no further action required", buf, 0x22u);
          }
          v4 = 0;
        }

      }
      else
      {
        v4 = 0;
      }

    }
  }
  else
  {
    v29 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v30 = NFLogGetLogger(v29);
    if (v30)
    {
      v31 = (void (*)(uint64_t, const char *, ...))v30;
      v32 = object_getClass(self);
      v33 = class_isMetaClass(v32);
      v34 = object_getClassName(self);
      v127 = sel_getName(a2);
      v35 = 45;
      if (v33)
        v35 = 43;
      v31(3, "%c[%{public}s %{public}s]:%i Failed to get next request", v35, v34, v127, 404);
    }
    v36 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v37 = NFSharedLogGetLogger(v36);
    v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_ERROR))
    {
      v38 = object_getClass(self);
      if (class_isMetaClass(v38))
        v39 = 43;
      else
        v39 = 45;
      *(_DWORD *)buf = 67109890;
      v136 = v39;
      v137 = 2082;
      v138 = object_getClassName(self);
      v139 = 2082;
      v140 = sel_getName(a2);
      v141 = 1024;
      v142 = 404;
      _os_log_impl((void *)&_mh_execute_header, &v7->super.super, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get next request", buf, 0x22u);
    }
    v4 = 3;
  }

  objc_autoreleasePoolPop(v5);
  return v4;
}

- (unint64_t)performCheckIn
{
  void *v4;
  void *v5;
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
  NSMutableDictionary *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  NFRemoteAdminState *v27;
  NSObject *v28;
  objc_class *v29;
  _BOOL4 v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  objc_class *v35;
  int v36;
  void *v38;
  uint64_t v39;
  void (*v40)(uint64_t, const char *, ...);
  objc_class *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  objc_class *v46;
  int v47;
  const char *v48;
  const char *v49;
  const char *Name;
  const char *v51;
  _BOOL4 v52;
  const char *v53;
  id v54;
  uint8_t buf[4];
  int v56;
  __int16 v57;
  const char *v58;
  __int16 v59;
  const char *v60;
  __int16 v61;
  int v62;
  __int16 v63;
  unint64_t v64;

  v4 = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession getNextRequest](self, "getNextRequest"));
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  v8 = (void (*)(uint64_t, const char *, ...))Logger;
  if (v5)
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
      v8(6, "%c[%{public}s %{public}s]:%i Sending redirect result to TSM", v12, ClassName, Name, 448);
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
      v56 = v17;
      v57 = 2082;
      v58 = object_getClassName(self);
      v59 = 2082;
      v60 = sel_getName(a2);
      v61 = 1024;
      v62 = 448;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Sending redirect result to TSM", buf, 0x22u);
    }

    v18 = objc_opt_new(NSMutableDictionary);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "httpHeaderInfo"));
    v54 = 0;
    v21 = -[NFRemoteAdminRedirectSession executeHttpRequest:httpHeader:response:responseHeader:duration:sessionError:](self, "executeHttpRequest:httpHeader:response:responseHeader:duration:sessionError:", v5, v20, v18, 0, 0, &v54);
    v22 = v54;

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary NF_numberForKey:](v18, "NF_numberForKey:", CFSTR("kStartNewSession")));
    if (objc_msgSend(v23, "BOOLValue"))
    {
      v24 = sub_100033D5C();
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminState serverIdentifier](self->_redirectState, "serverIdentifier"));
      v27 = sub_100038214(v25, v26);
      v28 = objc_claimAutoreleasedReturnValue(v27);

      -[NSObject setPendingImmediateRetry:](v28, "setPendingImmediateRetry:", 1);
      -[NSObject save](v28, "save");
      v21 = 12;
    }
    else
    {
      if (v21 <= 0xC && ((1 << v21) & 0x1011) != 0)
        goto LABEL_26;
      v38 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v39 = NFLogGetLogger(v38);
      if (v39)
      {
        v40 = (void (*)(uint64_t, const char *, ...))v39;
        v41 = object_getClass(self);
        v52 = class_isMetaClass(v41);
        v53 = object_getClassName(self);
        v42 = sel_getName(a2);
        v43 = 45;
        if (v52)
          v43 = 43;
        v40(3, "%c[%{public}s %{public}s]:%i Failed to post redirect result to TSM, status=0x%lx", v43, v53, v42, 463, v21);
      }
      v44 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v45 = NFSharedLogGetLogger(v44);
      v28 = objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v46 = object_getClass(self);
        if (class_isMetaClass(v46))
          v47 = 43;
        else
          v47 = 45;
        v48 = object_getClassName(self);
        v49 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v56 = v47;
        v57 = 2082;
        v58 = v48;
        v59 = 2082;
        v60 = v49;
        v61 = 1024;
        v62 = 463;
        v63 = 2048;
        v64 = v21;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to post redirect result to TSM, status=0x%lx", buf, 0x2Cu);
      }
    }

LABEL_26:
    goto LABEL_27;
  }
  if (Logger)
  {
    v29 = object_getClass(self);
    v30 = class_isMetaClass(v29);
    v31 = object_getClassName(self);
    v51 = sel_getName(a2);
    v32 = 45;
    if (v30)
      v32 = 43;
    v8(3, "%c[%{public}s %{public}s]:%i Failed to get next request", v32, v31, v51, 444);
  }
  v33 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v34 = NFSharedLogGetLogger(v33);
  v18 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v34);
  if (os_log_type_enabled(&v18->super.super, OS_LOG_TYPE_ERROR))
  {
    v35 = object_getClass(self);
    if (class_isMetaClass(v35))
      v36 = 43;
    else
      v36 = 45;
    *(_DWORD *)buf = 67109890;
    v56 = v36;
    v57 = 2082;
    v58 = object_getClassName(self);
    v59 = 2082;
    v60 = sel_getName(a2);
    v61 = 1024;
    v62 = 444;
    _os_log_impl((void *)&_mh_execute_header, &v18->super.super, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get next request", buf, 0x22u);
  }
  v21 = 3;
LABEL_27:

  objc_autoreleasePoolPop(v4);
  return v21;
}

- (unint64_t)run
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  unint64_t v8;
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
  const char *v20;
  const char *v21;
  void *v22;
  void *v23;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void (*v32)(uint64_t, const char *, ...);
  objc_class *v33;
  _BOOL4 v34;
  const char *v35;
  id v36;
  const char *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  objc_class *v43;
  int v44;
  const char *v45;
  id v46;
  const char *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void (*v53)(uint64_t, const char *, ...);
  objc_class *v54;
  _BOOL4 v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  NSObject *v59;
  objc_class *v60;
  int v61;
  const char *v62;
  const char *v63;
  void *v64;
  id v65;
  void *v66;
  uint64_t v67;
  void (*v68)(uint64_t, const char *, ...);
  objc_class *v69;
  _BOOL4 v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  NSObject *v75;
  objc_class *v76;
  int v77;
  const char *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  unsigned __int8 v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t v86;
  BOOL v87;
  void *v88;
  uint64_t v89;
  void (*v90)(uint64_t, const char *, ...);
  objc_class *v91;
  _BOOL4 v92;
  const char *v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  NSObject *v98;
  objc_class *v99;
  int v100;
  const char *v101;
  const char *v102;
  unsigned int v103;
  unsigned int v104;
  void *v105;
  uint64_t v106;
  void (*v107)(uint64_t, const char *, ...);
  objc_class *v108;
  _BOOL4 v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  NSObject *v114;
  objc_class *v115;
  int v116;
  const char *v117;
  const char *v118;
  int v119;
  void *v120;
  uint64_t v121;
  void (*v122)(uint64_t, const char *, ...);
  objc_class *v123;
  _BOOL4 v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  NSObject *v129;
  objc_class *v130;
  int v131;
  const char *v132;
  const char *v133;
  void *v134;
  uint64_t v135;
  void (*v136)(uint64_t, const char *, ...);
  objc_class *v137;
  _BOOL4 v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  NSObject *v142;
  objc_class *v143;
  int v144;
  const char *v145;
  const char *v146;
  objc_class *v147;
  _BOOL4 v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  uint64_t v152;
  NSObject *v153;
  objc_class *v154;
  int v155;
  const char *v156;
  const char *v157;
  void *v158;
  void *v159;
  uint64_t v160;
  double v161;
  double v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  id v167;
  void *v168;
  uint64_t v169;
  void (*v170)(uint64_t, const char *, ...);
  objc_class *v171;
  _BOOL4 v172;
  const char *v173;
  uint64_t v174;
  void *v175;
  uint64_t v176;
  NSObject *v177;
  objc_class *v178;
  int v179;
  const char *v180;
  const char *v181;
  unint64_t v182;
  char v183;
  void *v184;
  void *v185;
  unsigned __int8 v186;
  unint64_t v187;
  void *v188;
  uint64_t v189;
  void (*v190)(uint64_t, const char *, ...);
  objc_class *v191;
  _BOOL4 v192;
  const char *v193;
  uint64_t v194;
  void *v195;
  uint64_t v196;
  NSObject *v197;
  objc_class *v198;
  int v199;
  const char *v200;
  const char *v201;
  void *v202;
  uint64_t v203;
  void *v204;
  void *v205;
  id v206;
  void *v207;
  void *v208;
  uint64_t v209;
  void (*v210)(uint64_t, const char *, ...);
  objc_class *v211;
  _BOOL4 v212;
  const char *v213;
  const char *v214;
  uint64_t v215;
  void *v216;
  uint64_t v217;
  NSObject *v218;
  objc_class *v219;
  int v220;
  const char *v221;
  const char *v222;
  unsigned int v223;
  void *v224;
  uint64_t v225;
  void (*v226)(uint64_t, const char *, ...);
  objc_class *v227;
  _BOOL4 v228;
  const char *v229;
  uint64_t v230;
  void *v231;
  uint64_t v232;
  NSObject *v233;
  objc_class *v234;
  int v235;
  const char *v236;
  const char *v237;
  void *v238;
  void *v239;
  uint64_t v240;
  void (*v241)(uint64_t, const char *, ...);
  objc_class *v242;
  _BOOL4 v243;
  const char *v244;
  uint64_t v245;
  void *v246;
  uint64_t v247;
  NSObject *v248;
  objc_class *v249;
  int v250;
  const char *v251;
  const char *v252;
  void *v253;
  uint64_t v254;
  void (*v255)(uint64_t, const char *, ...);
  objc_class *v256;
  _BOOL4 v257;
  const char *v258;
  uint64_t v259;
  void *v260;
  uint64_t v261;
  NSObject *v262;
  objc_class *v263;
  int v264;
  const char *v265;
  const char *v266;
  void *v267;
  uint64_t v268;
  void (*v269)(uint64_t, const char *, ...);
  objc_class *v270;
  _BOOL4 v271;
  const char *v272;
  uint64_t v273;
  void *v274;
  uint64_t v275;
  NSObject *v276;
  objc_class *v277;
  int v278;
  const char *v279;
  const char *v280;
  const char *ClassName;
  const char *v282;
  const char *v283;
  const char *v284;
  const char *v285;
  const char *v286;
  const char *Name;
  const char *v288;
  const char *v289;
  const char *v290;
  const char *v291;
  const char *v292;
  const char *v293;
  const char *v294;
  const char *v295;
  const char *v296;
  const char *v297;
  const char *v298;
  const char *v299;
  const char *v300;
  id v301;
  id v302;
  id v303;
  uint8_t buf[4];
  int v305;
  __int16 v306;
  const char *v307;
  __int16 v308;
  const char *v309;
  __int16 v310;
  int v311;
  __int16 v312;
  id v313;

  v302 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NFSecureElement embeddedSecureElementWithError:](NFSecureElement, "embeddedSecureElementWithError:", &v302));
  v5 = v302;
  if (!v4 || (objc_msgSend(v4, "available") & 1) == 0)
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
      v11(3, "%c[%{public}s %{public}s]:%i eSE unavailable, aborting.  Error - %{public}@", v14, ClassName, Name, 656, v5);
    }
    v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v16 = NFSharedLogGetLogger(v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = object_getClass(self);
      if (class_isMetaClass(v18))
        v19 = 43;
      else
        v19 = 45;
      v20 = object_getClassName(self);
      v21 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v305 = v19;
      v306 = 2082;
      v307 = v20;
      v308 = 2082;
      v309 = v21;
      v310 = 1024;
      v311 = 656;
      v312 = 2114;
      v313 = v5;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i eSE unavailable, aborting.  Error - %{public}@", buf, 0x2Cu);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
    objc_msgSend(v22, "setStep:", 3);

    v8 = 1;
    goto LABEL_15;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
  v7 = objc_msgSend(v6, "step");

  v301 = v5;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    if (self)
    {
      v303 = 0;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NFSecureElement embeddedSecureElementWithError:](NFSecureElement, "embeddedSecureElementWithError:", &v303));
      v26 = v303;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "serialNumber"));
      if (v27)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession targetSEID](self, "targetSEID"));
        v29 = objc_msgSend(v28, "caseInsensitiveCompare:", v27);

        if (v29)
        {
          v30 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v31 = NFLogGetLogger(v30);
          if (v31)
          {
            v32 = (void (*)(uint64_t, const char *, ...))v31;
            v33 = object_getClass(self);
            v34 = class_isMetaClass(v33);
            v35 = object_getClassName(self);
            v36 = v26;
            v37 = sel_getName("_redirectStart");
            v38 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession targetSEID](self, "targetSEID"));
            v288 = v37;
            v26 = v36;
            v39 = 45;
            if (v34)
              v39 = 43;
            v32(5, "%c[%{public}s %{public}s]:%i Invalid target SEID:%{public}@", v39, v35, v288, 484, v38);

          }
          v40 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v41 = NFSharedLogGetLogger(v40);
          v42 = objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            v43 = object_getClass(self);
            if (class_isMetaClass(v43))
              v44 = 43;
            else
              v44 = 45;
            v45 = object_getClassName(self);
            v46 = v26;
            v47 = sel_getName("_redirectStart");
            v48 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession targetSEID](self, "targetSEID"));
            *(_DWORD *)buf = 67110146;
            v305 = v44;
            v306 = 2082;
            v307 = v45;
            v308 = 2082;
            v309 = v47;
            v26 = v46;
            v310 = 1024;
            v311 = 484;
            v312 = 2114;
            v313 = v48;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalid target SEID:%{public}@", buf, 0x2Cu);

          }
          v49 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
          objc_msgSend(v49, "setStep:", 2);

          v50 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
          objc_msgSend(v50, "setIncompleteReason:", CFSTR("ScriptExecutionError"));
        }
        else
        {
          v50 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
          objc_msgSend(v50, "setStep:", 1);
        }

        v59 = objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
        -[NSObject save](v59, "save");
        v8 = 0;
      }
      else
      {
        v51 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v52 = NFLogGetLogger(v51);
        if (v52)
        {
          v53 = (void (*)(uint64_t, const char *, ...))v52;
          v54 = object_getClass(self);
          v55 = class_isMetaClass(v54);
          v282 = object_getClassName(self);
          v289 = sel_getName("_redirectStart");
          v56 = 45;
          if (v55)
            v56 = 43;
          v53(3, "%c[%{public}s %{public}s]:%i Missing primary SEID (error - %{public}@", v56, v282, v289, 478, v26);
        }
        v57 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v58 = NFSharedLogGetLogger(v57);
        v59 = objc_claimAutoreleasedReturnValue(v58);
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          v60 = object_getClass(self);
          if (class_isMetaClass(v60))
            v61 = 43;
          else
            v61 = 45;
          v62 = object_getClassName(self);
          v63 = sel_getName("_redirectStart");
          *(_DWORD *)buf = 67110146;
          v305 = v61;
          v306 = 2082;
          v307 = v62;
          v308 = 2082;
          v309 = v63;
          v310 = 1024;
          v311 = 478;
          v312 = 2114;
          v313 = v26;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing primary SEID (error - %{public}@", buf, 0x2Cu);
        }
        v8 = 4;
      }

    }
    else
    {
      v8 = 0;
    }
    v5 = v301;
  }
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
  v65 = objc_msgSend(v64, "step");

  if (v65 == (id)1)
  {
    if (self)
    {
      self->_performInitialAIDSelectFromWhitelist = 1;
      v66 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v67 = NFLogGetLogger(v66);
      if (v67)
      {
        v68 = (void (*)(uint64_t, const char *, ...))v67;
        v69 = object_getClass(self);
        v70 = class_isMetaClass(v69);
        v71 = object_getClassName(self);
        v290 = sel_getName("_redirectInProgress");
        v72 = 45;
        if (v70)
          v72 = 43;
        v68(6, "%c[%{public}s %{public}s]:%i Communicating with SP-TSM", v72, v71, v290, 531);
      }
      v73 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v74 = NFSharedLogGetLogger(v73);
      v75 = objc_claimAutoreleasedReturnValue(v74);
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        v76 = object_getClass(self);
        if (class_isMetaClass(v76))
          v77 = 43;
        else
          v77 = 45;
        v78 = object_getClassName(self);
        v79 = sel_getName("_redirectInProgress");
        *(_DWORD *)buf = 67109890;
        v305 = v77;
        v306 = 2082;
        v307 = v78;
        v308 = 2082;
        v309 = v79;
        v310 = 1024;
        v311 = 531;
        _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Communicating with SP-TSM", buf, 0x22u);
      }

      v80 = mach_continuous_time();
      if (-[NFRemoteAdminRedirectSession openSession](self, "openSession"))
      {
        v81 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
        v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "redirectUrl"));
        v83 = -[NFRemoteAdminRedirectSession openConnection:](self, "openConnection:", v82);

        if ((v83 & 1) != 0)
        {
          if (!-[NFRemoteAdminRedirectSession aborted](self, "aborted"))
          {
            v84 = 0;
            do
            {
              v85 = -[NFRemoteAdminRedirectSession performRedirect](self, "performRedirect");
              if (v85 == 6)
              {
                v84 = 0;
              }
              else
              {
                v86 = v85;
                v87 = v85 == 15 || v85 == 3;
                if (!v87 || v84 > 2)
                  goto LABEL_100;
                v88 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v89 = NFLogGetLogger(v88);
                if (v89)
                {
                  v90 = (void (*)(uint64_t, const char *, ...))v89;
                  v91 = object_getClass(self);
                  v92 = class_isMetaClass(v91);
                  v93 = object_getClassName(self);
                  v94 = sel_getName("_redirectInProgress");
                  v95 = 45;
                  if (v92)
                    v95 = 43;
                  v90(6, "%c[%{public}s %{public}s]:%i Retrying in %d seconds", v95, v93, v94, 546, dword_100041134[v84]);
                }
                v96 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v97 = NFSharedLogGetLogger(v96);
                v98 = objc_claimAutoreleasedReturnValue(v97);
                if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
                {
                  v99 = object_getClass(self);
                  if (class_isMetaClass(v99))
                    v100 = 43;
                  else
                    v100 = 45;
                  v101 = object_getClassName(self);
                  v102 = sel_getName("_redirectInProgress");
                  v103 = dword_100041134[v84];
                  *(_DWORD *)buf = 67110146;
                  v305 = v100;
                  v306 = 2082;
                  v307 = v101;
                  v308 = 2082;
                  v309 = v102;
                  v310 = 1024;
                  v311 = 546;
                  v312 = 1024;
                  LODWORD(v313) = v103;
                  _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Retrying in %d seconds", buf, 0x28u);
                }

                sleep(dword_100041134[v84++]);
              }
            }
            while (!-[NFRemoteAdminRedirectSession aborted](self, "aborted"));
          }
          v86 = 6;
        }
        else
        {
          v120 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v121 = NFLogGetLogger(v120);
          if (v121)
          {
            v122 = (void (*)(uint64_t, const char *, ...))v121;
            v123 = object_getClass(self);
            v124 = class_isMetaClass(v123);
            v125 = object_getClassName(self);
            v292 = sel_getName("_redirectInProgress");
            v126 = 45;
            if (v124)
              v126 = 43;
            v122(3, "%c[%{public}s %{public}s]:%i Failed to open connection", v126, v125, v292, 535);
          }
          v127 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v128 = NFSharedLogGetLogger(v127);
          v129 = objc_claimAutoreleasedReturnValue(v128);
          if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
          {
            v130 = object_getClass(self);
            if (class_isMetaClass(v130))
              v131 = 43;
            else
              v131 = 45;
            v132 = object_getClassName(self);
            v133 = sel_getName("_redirectInProgress");
            *(_DWORD *)buf = 67109890;
            v305 = v131;
            v306 = 2082;
            v307 = v132;
            v308 = 2082;
            v309 = v133;
            v310 = 1024;
            v311 = 535;
            _os_log_impl((void *)&_mh_execute_header, v129, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to open connection", buf, 0x22u);
          }

          v86 = 2;
        }
LABEL_100:
        if (-[NFRemoteAdminRedirectSession aborted](self, "aborted"))
          v8 = 1;
        else
          v8 = v86;
        sub_100011DBC(self, v8);
        -[NFRemoteAdminRedirectSession closeConnection](self, "closeConnection");
        -[NFRemoteAdminRedirectSession closeSession](self, "closeSession");
        v134 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v135 = NFLogGetLogger(v134);
        if (v135)
        {
          v136 = (void (*)(uint64_t, const char *, ...))v135;
          v137 = object_getClass(self);
          v138 = class_isMetaClass(v137);
          v284 = object_getClassName(self);
          v293 = sel_getName("_redirectInProgress");
          v139 = 45;
          if (v138)
            v139 = 43;
          v136(6, "%c[%{public}s %{public}s]:%i Redirect processing completed: %d", v139, v284, v293, 560, v8);
        }
        v140 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v141 = NFSharedLogGetLogger(v140);
        v142 = objc_claimAutoreleasedReturnValue(v141);
        if (os_log_type_enabled(v142, OS_LOG_TYPE_DEFAULT))
        {
          v143 = object_getClass(self);
          if (class_isMetaClass(v143))
            v144 = 43;
          else
            v144 = 45;
          v145 = object_getClassName(self);
          v146 = sel_getName("_redirectInProgress");
          *(_DWORD *)buf = 67110146;
          v305 = v144;
          v306 = 2082;
          v307 = v145;
          v308 = 2082;
          v309 = v146;
          v310 = 1024;
          v311 = 560;
          v312 = 1024;
          LODWORD(v313) = v8;
          _os_log_impl((void *)&_mh_execute_header, v142, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Redirect processing completed: %d", buf, 0x28u);
        }

        v119 = 1;
        v5 = v301;
      }
      else
      {
        v104 = -[NFRemoteAdminRedirectSession aborted](self, "aborted");
        v105 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v106 = NFLogGetLogger(v105);
        v107 = (void (*)(uint64_t, const char *, ...))v106;
        if (v104)
        {
          if (v106)
          {
            v108 = object_getClass(self);
            v109 = class_isMetaClass(v108);
            v110 = object_getClassName(self);
            v291 = sel_getName("_redirectInProgress");
            v111 = 45;
            if (v109)
              v111 = 43;
            v283 = v110;
            v5 = v301;
            v107(6, "%c[%{public}s %{public}s]:%i Aborted", v111, v283, v291, 562);
          }
          v112 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v113 = NFSharedLogGetLogger(v112);
          v114 = objc_claimAutoreleasedReturnValue(v113);
          if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
          {
            v115 = object_getClass(self);
            if (class_isMetaClass(v115))
              v116 = 43;
            else
              v116 = 45;
            v117 = object_getClassName(self);
            v118 = sel_getName("_redirectInProgress");
            *(_DWORD *)buf = 67109890;
            v305 = v116;
            v306 = 2082;
            v307 = v117;
            v308 = 2082;
            v309 = v118;
            v310 = 1024;
            v311 = 562;
            _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Aborted", buf, 0x22u);
          }

          v8 = 1;
          sub_100011DBC(self, 1);
          v119 = 1;
        }
        else
        {
          if (v106)
          {
            v147 = object_getClass(self);
            v148 = class_isMetaClass(v147);
            v149 = object_getClassName(self);
            v294 = sel_getName("_redirectInProgress");
            v150 = 45;
            if (v148)
              v150 = 43;
            v285 = v149;
            v5 = v301;
            v107(3, "%c[%{public}s %{public}s]:%i Failed to open SE wired mode", v150, v285, v294, 566);
          }
          v151 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v152 = NFSharedLogGetLogger(v151);
          v153 = objc_claimAutoreleasedReturnValue(v152);
          if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
          {
            v154 = object_getClass(self);
            if (class_isMetaClass(v154))
              v155 = 43;
            else
              v155 = 45;
            v156 = object_getClassName(self);
            v157 = sel_getName("_redirectInProgress");
            *(_DWORD *)buf = 67109890;
            v305 = v155;
            v306 = 2082;
            v307 = v156;
            v308 = 2082;
            v309 = v157;
            v310 = 1024;
            v311 = 566;
            _os_log_impl((void *)&_mh_execute_header, v153, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to open SE wired mode", buf, 0x22u);
          }

          v119 = 0;
          v8 = 14;
        }
      }
      v158 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
      v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v158, "performanceMetrics"));
      v160 = mach_continuous_time();
      v161 = (double)(unint64_t)GetElapsedTimeInMillisecondsFromMachTime(v160, v80) / 1000.0;
      objc_msgSend(v159, "totalSessionTime");
      objc_msgSend(v159, "setTotalSessionTime:", v162 + v161);

      if (v119)
      {
        v163 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
        objc_msgSend(v163, "incrementStep");

        v164 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
        objc_msgSend(v164, "clearRetryInterval");

        v165 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
        objc_msgSend(v165, "save");

      }
    }
    else
    {
      v8 = 0;
    }
  }
  v166 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
  v167 = objc_msgSend(v166, "step");

  if (v167 != (id)2)
    goto LABEL_16;
  if (!self)
  {
    v8 = 0;
    goto LABEL_16;
  }
  v168 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v169 = NFLogGetLogger(v168);
  if (v169)
  {
    v170 = (void (*)(uint64_t, const char *, ...))v169;
    v171 = object_getClass(self);
    v172 = class_isMetaClass(v171);
    v173 = object_getClassName(self);
    v295 = sel_getName("_redirectCheckIn");
    v174 = 45;
    if (v172)
      v174 = 43;
    v170(6, "%c[%{public}s %{public}s]:%i Performing post-redirect TSM check in", v174, v173, v295, 608);
  }
  v175 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v176 = NFSharedLogGetLogger(v175);
  v177 = objc_claimAutoreleasedReturnValue(v176);
  if (os_log_type_enabled(v177, OS_LOG_TYPE_DEFAULT))
  {
    v178 = object_getClass(self);
    if (class_isMetaClass(v178))
      v179 = 43;
    else
      v179 = 45;
    v180 = object_getClassName(self);
    v181 = sel_getName("_redirectCheckIn");
    *(_DWORD *)buf = 67109890;
    v305 = v179;
    v306 = 2082;
    v307 = v180;
    v308 = 2082;
    v309 = v181;
    v310 = 1024;
    v311 = 608;
    _os_log_impl((void *)&_mh_execute_header, v177, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Performing post-redirect TSM check in", buf, 0x22u);
  }

  v182 = 0;
  v183 = 0;
  v8 = 4;
  do
  {
    if ((v183 & 1) != 0
      || (v184 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState")),
          v185 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v184, "sourceUrl")),
          v186 = -[NFRemoteAdminRedirectSession openConnection:](self, "openConnection:", v185),
          v185,
          v184,
          (v186 & 1) != 0))
    {
      v187 = -[NFRemoteAdminRedirectSession performCheckIn](self, "performCheckIn");
      v183 = 1;
      if (v187 == 6)
        continue;
      if (v187 != 3)
      {
        v8 = v187;
        goto LABEL_171;
      }
    }
    else
    {
      v188 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v189 = NFLogGetLogger(v188);
      if (v189)
      {
        v190 = (void (*)(uint64_t, const char *, ...))v189;
        v191 = object_getClass(self);
        v192 = class_isMetaClass(v191);
        v193 = object_getClassName(self);
        v296 = sel_getName("_redirectCheckIn");
        v194 = 45;
        if (v192)
          v194 = 43;
        v190(3, "%c[%{public}s %{public}s]:%i Failed to open connection", v194, v193, v296, 615);
      }
      v195 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v196 = NFSharedLogGetLogger(v195);
      v197 = objc_claimAutoreleasedReturnValue(v196);
      if (os_log_type_enabled(v197, OS_LOG_TYPE_ERROR))
      {
        v198 = object_getClass(self);
        if (class_isMetaClass(v198))
          v199 = 43;
        else
          v199 = 45;
        v200 = object_getClassName(self);
        v201 = sel_getName("_redirectCheckIn");
        *(_DWORD *)buf = 67109890;
        v305 = v199;
        v306 = 2082;
        v307 = v200;
        v308 = 2082;
        v309 = v201;
        v310 = 1024;
        v311 = 615;
        _os_log_impl((void *)&_mh_execute_header, v197, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to open connection", buf, 0x22u);
      }

      v202 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
      v203 = objc_claimAutoreleasedReturnValue(objc_msgSend(v202, "retryInterval"));
      v204 = (void *)v203;
      if (v203)
        v205 = *(void **)(v203 + 16);
      else
        v205 = 0;
      v206 = v205;

      if (v206)
        goto LABEL_171;
      v183 = 0;
    }
    v207 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
    objc_msgSend(v207, "clearRetryInterval");

    if (v182 > 2)
      goto LABEL_171;
    if (byte_10005C3E8)
    {
      v208 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v209 = NFLogGetLogger(v208);
      if (v209)
      {
        v210 = (void (*)(uint64_t, const char *, ...))v209;
        v211 = object_getClass(self);
        v212 = class_isMetaClass(v211);
        v213 = object_getClassName(self);
        v214 = sel_getName("_redirectCheckIn");
        v215 = 45;
        if (v212)
          v215 = 43;
        v210(6, "%c[%{public}s %{public}s]:%i [TSM] Retrying in %d seconds", v215, v213, v214, 630, dword_100041134[v182]);
      }
      v216 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v217 = NFSharedLogGetLogger(v216);
      v218 = objc_claimAutoreleasedReturnValue(v217);
      if (os_log_type_enabled(v218, OS_LOG_TYPE_DEFAULT))
      {
        v219 = object_getClass(self);
        if (class_isMetaClass(v219))
          v220 = 43;
        else
          v220 = 45;
        v221 = object_getClassName(self);
        v222 = sel_getName("_redirectCheckIn");
        v223 = dword_100041134[v182];
        *(_DWORD *)buf = 67110146;
        v305 = v220;
        v306 = 2082;
        v307 = v221;
        v308 = 2082;
        v309 = v222;
        v310 = 1024;
        v311 = 630;
        v312 = 1024;
        LODWORD(v313) = v223;
        _os_log_impl((void *)&_mh_execute_header, v218, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Retrying in %d seconds", buf, 0x28u);
      }

    }
    sleep(dword_100041134[v182++]);
  }
  while (!-[NFRemoteAdminRedirectSession aborted](self, "aborted"));
  v8 = 6;
LABEL_171:
  v5 = v301;
  switch(__ROR8__(v8, 2))
  {
    case 0:
    case 3:
      v224 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v225 = NFLogGetLogger(v224);
      if (v225)
      {
        v226 = (void (*)(uint64_t, const char *, ...))v225;
        v227 = object_getClass(self);
        v228 = class_isMetaClass(v227);
        v229 = object_getClassName(self);
        v297 = sel_getName("_processRedirectCheckInResult:");
        v230 = 45;
        if (v228)
          v230 = 43;
        v286 = v229;
        v5 = v301;
        v226(6, "%c[%{public}s %{public}s]:%i Redirect check in completed", v230, v286, v297, 586);
      }
      v231 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v232 = NFSharedLogGetLogger(v231);
      v233 = objc_claimAutoreleasedReturnValue(v232);
      if (os_log_type_enabled(v233, OS_LOG_TYPE_DEFAULT))
      {
        v234 = object_getClass(self);
        if (class_isMetaClass(v234))
          v235 = 43;
        else
          v235 = 45;
        v236 = object_getClassName(self);
        v237 = sel_getName("_processRedirectCheckInResult:");
        *(_DWORD *)buf = 67109890;
        v305 = v235;
        v306 = 2082;
        v307 = v236;
        v308 = 2082;
        v309 = v237;
        v310 = 1024;
        v311 = 586;
        _os_log_impl((void *)&_mh_execute_header, v233, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Redirect check in completed", buf, 0x22u);
      }

      v238 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
      objc_msgSend(v238, "incrementStep");
      goto LABEL_213;
    case 1:
      v239 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v240 = NFLogGetLogger(v239);
      if (v240)
      {
        v241 = (void (*)(uint64_t, const char *, ...))v240;
        v242 = object_getClass(self);
        v243 = class_isMetaClass(v242);
        v244 = object_getClassName(self);
        v298 = sel_getName("_processRedirectCheckInResult:");
        v245 = 45;
        if (v243)
          v245 = 43;
        v241(6, "%c[%{public}s %{public}s]:%i Redirect check in - long retry", v245, v244, v298, 592);
      }
      v246 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v247 = NFSharedLogGetLogger(v246);
      v248 = objc_claimAutoreleasedReturnValue(v247);
      if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
      {
        v249 = object_getClass(self);
        if (class_isMetaClass(v249))
          v250 = 43;
        else
          v250 = 45;
        v251 = object_getClassName(self);
        v252 = sel_getName("_processRedirectCheckInResult:");
        *(_DWORD *)buf = 67109890;
        v305 = v250;
        v306 = 2082;
        v307 = v251;
        v308 = 2082;
        v309 = v252;
        v310 = 1024;
        v311 = 592;
        _os_log_impl((void *)&_mh_execute_header, v248, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Redirect check in - long retry", buf, 0x22u);
      }

      v238 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
      objc_msgSend(v238, "incrementLongRetry");
      v8 = 4;
      goto LABEL_213;
    case 2:
      v253 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v254 = NFLogGetLogger(v253);
      if (v254)
      {
        v255 = (void (*)(uint64_t, const char *, ...))v254;
        v256 = object_getClass(self);
        v257 = class_isMetaClass(v256);
        v258 = object_getClassName(self);
        v299 = sel_getName("_processRedirectCheckInResult:");
        v259 = 45;
        if (v257)
          v259 = 43;
        v255(6, "%c[%{public}s %{public}s]:%i Device not registered", v259, v258, v299, 589);
      }
      v260 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v261 = NFSharedLogGetLogger(v260);
      v262 = objc_claimAutoreleasedReturnValue(v261);
      if (os_log_type_enabled(v262, OS_LOG_TYPE_DEFAULT))
      {
        v263 = object_getClass(self);
        if (class_isMetaClass(v263))
          v264 = 43;
        else
          v264 = 45;
        v265 = object_getClassName(self);
        v266 = sel_getName("_processRedirectCheckInResult:");
        *(_DWORD *)buf = 67109890;
        v305 = v264;
        v306 = 2082;
        v307 = v265;
        v308 = 2082;
        v309 = v266;
        v310 = 1024;
        v311 = 589;
        _os_log_impl((void *)&_mh_execute_header, v262, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Device not registered", buf, 0x22u);
      }

      v238 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
      objc_msgSend(v238, "incrementStep");
      v8 = 8;
      goto LABEL_213;
    default:
      if (!-[NFRemoteAdminRedirectSession aborted](self, "aborted"))
        goto LABEL_214;
      v267 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v268 = NFLogGetLogger(v267);
      if (v268)
      {
        v269 = (void (*)(uint64_t, const char *, ...))v268;
        v270 = object_getClass(self);
        v271 = class_isMetaClass(v270);
        v272 = object_getClassName(self);
        v300 = sel_getName("_processRedirectCheckInResult:");
        v273 = 45;
        if (v271)
          v273 = 43;
        v269(6, "%c[%{public}s %{public}s]:%i Abort check in", v273, v272, v300, 595);
      }
      v274 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v275 = NFSharedLogGetLogger(v274);
      v276 = objc_claimAutoreleasedReturnValue(v275);
      if (os_log_type_enabled(v276, OS_LOG_TYPE_DEFAULT))
      {
        v277 = object_getClass(self);
        if (class_isMetaClass(v277))
          v278 = 43;
        else
          v278 = 45;
        v279 = object_getClassName(self);
        v280 = sel_getName("_processRedirectCheckInResult:");
        *(_DWORD *)buf = 67109890;
        v305 = v278;
        v306 = 2082;
        v307 = v279;
        v308 = 2082;
        v309 = v280;
        v310 = 1024;
        v311 = 595;
        _os_log_impl((void *)&_mh_execute_header, v276, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Abort check in", buf, 0x22u);
      }

      v238 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
      objc_msgSend(v238, "incrementStep");
      v8 = 1;
LABEL_213:

LABEL_214:
      -[NFRemoteAdminRedirectSession closeConnection](self, "closeConnection");
      break;
  }
LABEL_15:
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
  objc_msgSend(v23, "save");

LABEL_16:
  return v8;
}

- (BOOL)startNewSession
{
  return 1;
}

- (BOOL)openSession
{
  NFSecureElementManagerSession *seSession;
  id v5;
  void *v6;
  dispatch_semaphore_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  dispatch_time_t v11;
  intptr_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[5];
  NSObject *v19;
  SEL v20;

  seSession = self->_seSession;
  if (!seSession)
  {
    v5 = sub_1000180C8();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    sub_10001CCC0((uint64_t)v6);

    v7 = dispatch_semaphore_create(0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NFHardwareManager sharedHardwareManager](NFHardwareManager, "sharedHardwareManager"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100013B70;
    v18[3] = &unk_1000547A0;
    v18[4] = self;
    v20 = a2;
    v9 = v7;
    v19 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startSecureElementManagerSessionWithPriority:", v18));

    do
    {
      if (-[NFRemoteAdminRedirectSession aborted](self, "aborted"))
        break;
      v11 = dispatch_time(0, 119000000000);
      v12 = dispatch_semaphore_wait(v9, v11);
      v13 = sub_1000180C8();
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      sub_10001CD04(v14);

    }
    while (v12);
    v15 = sub_1000180C8();
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    sub_10001CC7C((uint64_t)v16);

    if (-[NFRemoteAdminRedirectSession aborted](self, "aborted"))
    {
      objc_msgSend(v10, "endSessionWithCompletion:", &stru_1000547C0);

      return 0;
    }

    seSession = self->_seSession;
  }
  return seSession != 0;
}

- (BOOL)closeSession
{
  NFSecureElementManagerSession *seSession;

  seSession = self->_seSession;
  if (seSession && self->_allocateSESession)
    -[NFSecureElementManagerSession endSessionWithCompletion:](seSession, "endSessionWithCompletion:", &stru_1000547E0);
  return 1;
}

- (BOOL)openConnection:(id)a3
{
  id v5;
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
  void *v18;
  uint64_t v19;
  void (*v20)(uint64_t, const char *, ...);
  objc_class *v21;
  _BOOL4 v22;
  const char *v23;
  const char *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  objc_class *v30;
  int v31;
  const char *v32;
  const char *v33;
  void *v34;
  NFRemoteAdminConnectionHTTP *v35;
  void *v36;
  _BOOL8 v37;
  void *v38;
  NSObject *v39;
  BOOL v40;
  void *v41;
  uint64_t v42;
  void (*v43)(uint64_t, const char *, ...);
  objc_class *v44;
  _BOOL4 v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  objc_class *v49;
  int v50;
  const char *v51;
  const char *v52;
  void *v53;
  uint64_t v54;
  void (*v55)(uint64_t, const char *, ...);
  objc_class *v56;
  _BOOL4 v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  NSObject *v62;
  objc_class *v63;
  int v64;
  const char *v65;
  const char *v66;
  const char *ClassName;
  const char *v69;
  const char *Name;
  const char *v71;
  const char *v72;
  uint8_t buf[4];
  int v74;
  __int16 v75;
  const char *v76;
  __int16 v77;
  const char *v78;
  __int16 v79;
  int v80;
  __int16 v81;
  id v82;

  v5 = a3;
  if (byte_10005C3E8)
  {
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
      v8(6, "%c[%{public}s %{public}s]:%i [TSM] %@", v11, ClassName, Name, 741, v5);
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
      v74 = v16;
      v75 = 2082;
      v76 = object_getClassName(self);
      v77 = 2082;
      v78 = sel_getName(a2);
      v79 = 1024;
      v80 = 741;
      v81 = 2112;
      v82 = v5;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] %@", buf, 0x2Cu);
    }

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v5));
  if (!v17)
  {
    v41 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v42 = NFLogGetLogger(v41);
    if (v42)
    {
      v43 = (void (*)(uint64_t, const char *, ...))v42;
      v44 = object_getClass(self);
      v45 = class_isMetaClass(v44);
      v69 = object_getClassName(self);
      v71 = sel_getName(a2);
      v46 = 45;
      if (v45)
        v46 = 43;
      v43(3, "%c[%{public}s %{public}s]:%i Invalid URL string: %{public}@", v46, v69, v71, 745, v5);
    }
    v47 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v48 = NFSharedLogGetLogger(v47);
    v39 = objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v49 = object_getClass(self);
      if (class_isMetaClass(v49))
        v50 = 43;
      else
        v50 = 45;
      v51 = object_getClassName(self);
      v52 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v74 = v50;
      v75 = 2082;
      v76 = v51;
      v77 = 2082;
      v78 = v52;
      v79 = 1024;
      v80 = 745;
      v81 = 2114;
      v82 = v5;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid URL string: %{public}@", buf, 0x2Cu);
    }
    goto LABEL_46;
  }
  if (byte_10005C3E8)
  {
    v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v19 = NFLogGetLogger(v18);
    if (v19)
    {
      v20 = (void (*)(uint64_t, const char *, ...))v19;
      v21 = object_getClass(self);
      v22 = class_isMetaClass(v21);
      v23 = object_getClassName(self);
      v24 = sel_getName(a2);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "absoluteString"));
      v26 = 45;
      if (v22)
        v26 = 43;
      v20(6, "%c[%{public}s %{public}s]:%i [TSM] url: %@", v26, v23, v24, 749, v25);

    }
    v27 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v28 = NFSharedLogGetLogger(v27);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = object_getClass(self);
      if (class_isMetaClass(v30))
        v31 = 43;
      else
        v31 = 45;
      v32 = object_getClassName(self);
      v33 = sel_getName(a2);
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "absoluteString"));
      *(_DWORD *)buf = 67110146;
      v74 = v31;
      v75 = 2082;
      v76 = v32;
      v77 = 2082;
      v78 = v33;
      v79 = 1024;
      v80 = 749;
      v81 = 2112;
      v82 = v34;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] url: %@", buf, 0x2Cu);

    }
  }
  v35 = [NFRemoteAdminConnectionHTTP alloc];
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
  v37 = objc_msgSend(v36, "step") != (id)1;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NFSecureElement embeddedSecureElementWithError:](NFSecureElement, "embeddedSecureElementWithError:", 0));
  v39 = -[NFRemoteAdminConnectionHTTP initWithURL:SEID:showProprietaryHeaders:disableEVTrustValidation:](v35, "initWithURL:SEID:showProprietaryHeaders:disableEVTrustValidation:", v17, 0, v37, objc_msgSend(v38, "isProductionSigned") ^ 1);

  if (!v39)
  {
    v53 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v54 = NFLogGetLogger(v53);
    if (v54)
    {
      v55 = (void (*)(uint64_t, const char *, ...))v54;
      v56 = object_getClass(self);
      v57 = class_isMetaClass(v56);
      v58 = object_getClassName(self);
      v72 = sel_getName(a2);
      v59 = 45;
      if (v57)
        v59 = 43;
      v55(3, "%c[%{public}s %{public}s]:%i Failed to create connection", v59, v58, v72, 757);
    }
    v60 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v61 = NFSharedLogGetLogger(v60);
    v62 = objc_claimAutoreleasedReturnValue(v61);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      v63 = object_getClass(self);
      if (class_isMetaClass(v63))
        v64 = 43;
      else
        v64 = 45;
      v65 = object_getClassName(self);
      v66 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v74 = v64;
      v75 = 2082;
      v76 = v65;
      v77 = 2082;
      v78 = v66;
      v79 = 1024;
      v80 = 757;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to create connection", buf, 0x22u);
    }

    v39 = 0;
    goto LABEL_46;
  }
  if (-[NSObject connect](v39, "connect"))
  {
LABEL_46:
    v40 = 0;
    goto LABEL_47;
  }
  -[NFRemoteAdminRedirectSession setConnection:](self, "setConnection:", v39);
  v40 = 1;
LABEL_47:

  return v40;
}

- (void)closeConnection
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession connection](self, "connection"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession connection](self, "connection"));
    objc_msgSend(v4, "disconnect");

    -[NFRemoteAdminRedirectSession setConnection:](self, "setConnection:", 0);
  }
}

- (NFRemoteAdminRedirectState)redirectState
{
  return self->_redirectState;
}

- (NSString)targetSEID
{
  return self->_targetSEID;
}

- (NFRemoteAdminConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (unsigned)redirectStepError
{
  return self->_redirectStepError;
}

- (void)setRedirectStepError:(unsigned int)a3
{
  self->_redirectStepError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_targetSEID, 0);
  objc_storeStrong((id *)&self->_redirectState, 0);
  objc_storeStrong((id *)&self->_seSession, 0);
  objc_storeStrong((id *)&self->_seStateInfos, 0);
}

@end
