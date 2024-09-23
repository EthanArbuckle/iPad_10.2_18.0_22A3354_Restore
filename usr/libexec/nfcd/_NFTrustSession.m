@implementation _NFTrustSession

+ (id)validateEntitlements:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *specific;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void (*v25)(uint64_t, const char *, ...);
  objc_class *v26;
  _BOOL4 v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  objc_class *v34;
  int v35;
  id v36;
  id v37;
  void *v38;
  const char *ClassName;
  const char *Name;
  _QWORD v42[4];
  _QWORD v43[4];
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
  __int16 v54;
  const __CFString *v55;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "applicationIdentifier"));

  if (!v6)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v10(3, "%c[%{public}s %{public}s]:%i Missing entitlement: %{public}@", v13, ClassName, Name, 38, CFSTR("application-identifier"));
    }
    v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v15 = NFSharedLogGetLogger(v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = object_getClass(a1);
      if (class_isMetaClass(v17))
        v18 = 43;
      else
        v18 = 45;
      *(_DWORD *)buf = 67110146;
      v47 = v18;
      v48 = 2082;
      v49 = object_getClassName(a1);
      v50 = 2082;
      v51 = sel_getName(a2);
      v52 = 1024;
      v53 = 38;
      v54 = 2114;
      v55 = CFSTR("application-identifier");
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing entitlement: %{public}@", buf, 0x2Cu);
    }

    v19 = objc_alloc((Class)NSError);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v44 = NSLocalizedDescriptionKey;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Not entitled"));
    v45 = v21;
    v22 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));
    v7 = objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 32, v22);
    goto LABEL_24;
  }
  if ((objc_msgSend(v5, "purpleTrustAccess") & 1) == 0)
  {
    v23 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v24 = NFLogGetLogger(v23);
    if (v24)
    {
      v25 = (void (*)(uint64_t, const char *, ...))v24;
      v26 = object_getClass(a1);
      v27 = class_isMetaClass(v26);
      v28 = object_getClassName(a1);
      v29 = sel_getName(a2);
      v30 = 43;
      if (!v27)
        v30 = 45;
      v25(3, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring PT access", v30, v28, v29, 43);
    }
    v31 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v32 = NFSharedLogGetLogger(v31);
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = object_getClass(a1);
      if (class_isMetaClass(v34))
        v35 = 43;
      else
        v35 = 45;
      *(_DWORD *)buf = 67109890;
      v47 = v35;
      v48 = 2082;
      v49 = object_getClassName(a1);
      v50 = 2082;
      v51 = sel_getName(a2);
      v52 = 1024;
      v53 = 43;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring PT access", buf, 0x22u);
    }

    v36 = objc_alloc((Class)NSError);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v42[0] = NSLocalizedDescriptionKey;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Not entitled"));
    v43[0] = v21;
    v43[1] = &off_1002FEA00;
    v42[1] = CFSTR("Line");
    v42[2] = CFSTR("Method");
    v22 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v43[2] = v22;
    v42[3] = NSDebugDescriptionErrorKey;
    v37 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 44);
    v43[3] = v37;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v42, 4));
    v7 = objc_msgSend(v36, "initWithDomain:code:userInfo:", v20, 32, v38);

LABEL_24:
    goto LABEL_25;
  }
  v7 = 0;
LABEL_25:

  return v7;
}

- (_NFTrustSession)initWithRemoteObject:(id)a3 workQueue:(id)a4
{
  _NFTrustSession *v5;
  id v6;
  void *v7;
  void *v8;
  id *v9;
  id *v10;
  NSObject *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void (*v15)(uint64_t, const char *, ...);
  objc_class *v16;
  _BOOL4 v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  const char *v24;
  const char *v25;
  const char *v26;
  void *specific;
  uint64_t Logger;
  void (*v29)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  objc_class *v36;
  int v37;
  const char *v38;
  const char *v39;
  _NFTrustSession *v40;
  void *v41;
  void *v43;
  uint64_t v44;
  void (*v45)(uint64_t, const char *, ...);
  objc_class *v46;
  _BOOL4 v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  objc_class *v51;
  int v52;
  const char *v53;
  const char *v54;
  const char *v55;
  const char *v56;
  const char *v57;
  const char *Name;
  const char *v59;
  id v60;
  objc_super v61;
  uint8_t buf[4];
  int v63;
  __int16 v64;
  const char *v65;
  __int16 v66;
  const char *v67;
  __int16 v68;
  int v69;
  __int16 v70;
  const __CFString *v71;

  v61.receiver = self;
  v61.super_class = (Class)_NFTrustSession;
  v5 = -[_NFXPCSession initWithRemoteObject:workQueue:](&v61, "initWithRemoteObject:workQueue:", a3, a4);
  if (!v5)
    goto LABEL_27;
  v6 = sub_100030030((uint64_t)NFTrustDataBase);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[_NFTrustSession setTrustDB:](v5, "setTrustDB:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_NFTrustSession trustDB](v5, "trustDB"));
  if (!v8)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v29 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(v5);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(v5);
      Name = sel_getName(a2);
      v33 = 45;
      if (isMetaClass)
        v33 = 43;
      v29(3, "%c[%{public}s %{public}s]:%i Could not get DataBase", v33, ClassName, Name, 58);
    }
    v34 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v35 = NFSharedLogGetLogger(v34);
    v11 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v36 = object_getClass(v5);
      if (class_isMetaClass(v36))
        v37 = 43;
      else
        v37 = 45;
      v38 = object_getClassName(v5);
      v39 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v63 = v37;
      v64 = 2082;
      v65 = v38;
      v66 = 2082;
      v67 = v39;
      v68 = 1024;
      v69 = 58;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not get DataBase", buf, 0x22u);
    }
    goto LABEL_24;
  }
  v9 = (id *)objc_claimAutoreleasedReturnValue(-[_NFTrustSession trustDB](v5, "trustDB"));
  v60 = 0;
  v10 = sub_10002E9F4(v9, CFSTR("A000000704C0000000000002"), &v60);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v60;

  if (!v11)
  {
    -[_NFTrustSession setTrustDBApplet:](v5, "setTrustDBApplet:", v12);
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[_NFTrustSession trustDBApplet](v5, "trustDBApplet"));

    if (!v41)
    {
      v43 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v44 = NFLogGetLogger(v43);
      if (v44)
      {
        v45 = (void (*)(uint64_t, const char *, ...))v44;
        v46 = object_getClass(v5);
        v47 = class_isMetaClass(v46);
        v56 = object_getClassName(v5);
        v59 = sel_getName(a2);
        v48 = 45;
        if (v47)
          v48 = 43;
        v45(3, "%c[%{public}s %{public}s]:%i Could not find DB Applet with AID %{public}@ in DataBase", v48, v56, v59, 75, CFSTR("A000000704C0000000000002"));
      }
      v49 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v50 = NFSharedLogGetLogger(v49);
      v21 = objc_claimAutoreleasedReturnValue(v50);
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      v51 = object_getClass(v5);
      if (class_isMetaClass(v51))
        v52 = 43;
      else
        v52 = 45;
      v53 = object_getClassName(v5);
      v54 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v63 = v52;
      v64 = 2082;
      v65 = v53;
      v66 = 2082;
      v67 = v54;
      v68 = 1024;
      v69 = 75;
      v70 = 2114;
      v71 = CFSTR("A000000704C0000000000002");
      v26 = "%c[%{public}s %{public}s]:%i Could not find DB Applet with AID %{public}@ in DataBase";
      goto LABEL_13;
    }

LABEL_27:
    v40 = v5;
    goto LABEL_28;
  }
  v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v14 = NFLogGetLogger(v13);
  if (v14)
  {
    v15 = (void (*)(uint64_t, const char *, ...))v14;
    v16 = object_getClass(v5);
    v17 = class_isMetaClass(v16);
    v55 = object_getClassName(v5);
    v57 = sel_getName(a2);
    v18 = 45;
    if (v17)
      v18 = 43;
    v15(3, "%c[%{public}s %{public}s]:%i Could not get DB Applet from DataBase : %{public}@", v18, v55, v57, 67, v11);
  }
  v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v20 = NFSharedLogGetLogger(v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    goto LABEL_14;
  v22 = object_getClass(v5);
  if (class_isMetaClass(v22))
    v23 = 43;
  else
    v23 = 45;
  v24 = object_getClassName(v5);
  v25 = sel_getName(a2);
  *(_DWORD *)buf = 67110146;
  v63 = v23;
  v64 = 2082;
  v65 = v24;
  v66 = 2082;
  v67 = v25;
  v68 = 1024;
  v69 = 67;
  v70 = 2114;
  v71 = (const __CFString *)v11;
  v26 = "%c[%{public}s %{public}s]:%i Could not get DB Applet from DataBase : %{public}@";
LABEL_13:
  _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, v26, buf, 0x2Cu);
LABEL_14:

LABEL_24:
  v40 = 0;
LABEL_28:

  return v40;
}

- (void)didStartSession:(id)a3
{
  id v4;
  void *v5;
  NFSecureElementWrapper *v6;
  NFSecureElementWrapper *secureElementWrapper;
  id v8;
  void *v9;
  void *v10;
  objc_super v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
  v6 = (NFSecureElementWrapper *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "secureElementWrapper"));
  secureElementWrapper = self->_secureElementWrapper;
  self->_secureElementWrapper = v6;

  if (v4)
  {
    v8 = 0;
  }
  else
  {
    v12 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_NFTrustSession getListOfKeysWithError:](self, "getListOfKeysWithError:", &v12));
    v8 = v12;
    -[_NFTrustSession setKeys:](self, "setKeys:", v9);

  }
  v11.receiver = self;
  v11.super_class = (Class)_NFTrustSession;
  -[_NFSession didStartSession:](&v11, "didStartSession:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
  objc_msgSend(v10, "didStartSession:", v4);

}

- (BOOL)willStartSession
{
  objc_super v4;

  sub_10023B69C((uint64_t)NFSecureElementWrapper);
  v4.receiver = self;
  v4.super_class = (Class)_NFTrustSession;
  return -[_NFSession willStartSession](&v4, "willStartSession");
}

- (id)initialRoutingConfig
{
  return +[NFRoutingConfig embeddedWiredModeWithFD:](NFRoutingConfig, "embeddedWiredModeWithFD:", 1);
}

- (id)selectInstance
{
  void *v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void (*v16)(uint64_t, const char *, ...);
  objc_class *v17;
  _BOOL4 v18;
  const char *v19;
  const char *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  objc_class *v28;
  int v29;
  const char *v30;
  const char *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void **v37;
  NSErrorUserInfoKey *v38;
  void *v39;
  id v40;
  void *specific;
  uint64_t Logger;
  void (*v43)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  objc_class *v51;
  int v52;
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
  id *v70;
  id v71;
  void *v72;
  uint64_t v73;
  void (*v74)(uint64_t, const char *, ...);
  objc_class *v75;
  _BOOL4 v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  NSObject *v81;
  objc_class *v82;
  int v83;
  const char *v84;
  const char *v85;
  void *v86;
  uint64_t v87;
  void (*v88)(uint64_t, const char *, ...);
  objc_class *v89;
  _BOOL4 v90;
  const char *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  NSObject *v96;
  objc_class *v97;
  int v98;
  const char *v99;
  const char *v100;
  unsigned int v101;
  const char *Name;
  const char *v103;
  const char *v104;
  uint64_t v105;
  id v106;
  NSErrorUserInfoKey v107;
  void *v108;
  NSErrorUserInfoKey v109;
  void *v110;
  NSErrorUserInfoKey v111;
  void *v112;
  NSErrorUserInfoKey v113;
  void *v114;
  uint8_t buf[4];
  int v116;
  __int16 v117;
  const char *v118;
  __int16 v119;
  const char *v120;
  __int16 v121;
  int v122;
  __int16 v123;
  void *v124;
  __int16 v125;
  id v126;
  NSErrorUserInfoKey v127;
  void *v128;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_NFTrustSession trustDBApplet](self, "trustDBApplet"));

  if (!v4)
  {
    v6 = sub_1001308D0();
    return (id)objc_claimAutoreleasedReturnValue(v6);
  }
  if (-[_NFTrustSession isInstanceSelected](self, "isInstanceSelected"))
    return 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_NFTrustSession secureElementWrapper](self, "secureElementWrapper"));

  if (!v7)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v43 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v47 = 45;
      if (isMetaClass)
        v47 = 43;
      v43(3, "%c[%{public}s %{public}s]:%i secureElementWrapper is nil, error in NFCd, could not select instance", v47, ClassName, Name, 144);
    }
    v48 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v49 = NFSharedLogGetLogger(v48);
    v50 = objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      v51 = object_getClass(self);
      if (class_isMetaClass(v51))
        v52 = 43;
      else
        v52 = 45;
      *(_DWORD *)buf = 67109890;
      v116 = v52;
      v117 = 2082;
      v118 = object_getClassName(self);
      v119 = 2082;
      v120 = sel_getName(a2);
      v121 = 1024;
      v122 = 144;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i secureElementWrapper is nil, error in NFCd, could not select instance", buf, 0x22u);
    }

    v53 = objc_alloc((Class)NSError);
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v127 = NSLocalizedDescriptionKey;
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unknown Error"));
    v128 = v54;
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v128, &v127, 1));
    v40 = objc_msgSend(v53, "initWithDomain:code:userInfo:", v13, 6, v55);

    goto LABEL_29;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_NFTrustSession secureElementWrapper](self, "secureElementWrapper"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_NFTrustSession trustDBApplet](self, "trustDBApplet"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "instanceAID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSData NF_dataWithHexString:](NSData, "NF_dataWithHexString:", v10));
  v106 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectByName:error:", v11, &v106));
  v13 = v106;

  if (v13)
  {
    v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v15 = NFLogGetLogger(v14);
    if (v15)
    {
      v16 = (void (*)(uint64_t, const char *, ...))v15;
      v17 = object_getClass(self);
      v18 = class_isMetaClass(v17);
      v19 = object_getClassName(self);
      v20 = sel_getName(a2);
      v21 = v12;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[_NFTrustSession trustDBApplet](self, "trustDBApplet"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "instanceAID"));
      v24 = 45;
      if (v18)
        v24 = 43;
      v16(3, "%c[%{public}s %{public}s]:%i Could not select instance (AID: %{public}@): %{public}@", v24, v19, v20, 151, v23, v13);

      v12 = v21;
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
      v30 = object_getClassName(self);
      v31 = sel_getName(a2);
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[_NFTrustSession trustDBApplet](self, "trustDBApplet"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "instanceAID"));
      *(_DWORD *)buf = 67110402;
      v116 = v29;
      v117 = 2082;
      v118 = v30;
      v119 = 2082;
      v120 = v31;
      v121 = 1024;
      v122 = 151;
      v123 = 2114;
      v124 = v33;
      v125 = 2114;
      v126 = v13;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not select instance (AID: %{public}@): %{public}@", buf, 0x36u);

    }
    v34 = objc_alloc((Class)NSError);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v113 = NSLocalizedDescriptionKey;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unknown Error"));
    v114 = v36;
    v37 = &v114;
    v38 = &v113;
  }
  else if (v12)
  {
    if (objc_msgSend(v12, "status") == 27266)
    {
      v56 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v57 = NFLogGetLogger(v56);
      if (v57)
      {
        v58 = (void (*)(uint64_t, const char *, ...))v57;
        v59 = object_getClass(self);
        v60 = class_isMetaClass(v59);
        v61 = object_getClassName(self);
        v103 = sel_getName(a2);
        v62 = 45;
        if (v60)
          v62 = 43;
        v58(3, "%c[%{public}s %{public}s]:%i Failed to select instance, instance not found on device, erase database for this instance", v62, v61, v103, 161);
      }
      v63 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v64 = NFSharedLogGetLogger(v63);
      v65 = objc_claimAutoreleasedReturnValue(v64);
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        v66 = object_getClass(self);
        if (class_isMetaClass(v66))
          v67 = 43;
        else
          v67 = 45;
        v68 = object_getClassName(self);
        v69 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v116 = v67;
        v117 = 2082;
        v118 = v68;
        v119 = 2082;
        v120 = v69;
        v121 = 1024;
        v122 = 161;
        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select instance, instance not found on device, erase database for this instance", buf, 0x22u);
      }

      v70 = (id *)objc_claimAutoreleasedReturnValue(-[_NFTrustSession trustDB](self, "trustDB"));
      v71 = sub_10002FC68(v70);

      v34 = objc_alloc((Class)NSError);
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v109 = NSLocalizedDescriptionKey;
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unknown Error"));
      v110 = v36;
      v37 = &v110;
      v38 = &v109;
    }
    else
    {
      if (objc_msgSend(v12, "status") == 36864)
      {
        -[_NFTrustSession setIsInstanceSelected:](self, "setIsInstanceSelected:", 1);
        v40 = 0;
        goto LABEL_18;
      }
      v86 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v87 = NFLogGetLogger(v86);
      if (v87)
      {
        v88 = (void (*)(uint64_t, const char *, ...))v87;
        v89 = object_getClass(self);
        v90 = class_isMetaClass(v89);
        v91 = object_getClassName(self);
        v92 = sel_getName(a2);
        v105 = objc_msgSend(v12, "status");
        v93 = 45;
        if (v90)
          v93 = 43;
        v88(3, "%c[%{public}s %{public}s]:%i Failed to select instance %u", v93, v91, v92, 167, v105);
      }
      v94 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v95 = NFSharedLogGetLogger(v94);
      v96 = objc_claimAutoreleasedReturnValue(v95);
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v97 = object_getClass(self);
        if (class_isMetaClass(v97))
          v98 = 43;
        else
          v98 = 45;
        v99 = object_getClassName(self);
        v100 = sel_getName(a2);
        v101 = objc_msgSend(v12, "status");
        *(_DWORD *)buf = 67110146;
        v116 = v98;
        v117 = 2082;
        v118 = v99;
        v119 = 2082;
        v120 = v100;
        v121 = 1024;
        v122 = 167;
        v123 = 1024;
        LODWORD(v124) = v101;
        _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select instance %u", buf, 0x28u);
      }

      v34 = objc_alloc((Class)NSError);
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v107 = NSLocalizedDescriptionKey;
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unknown Error"));
      v108 = v36;
      v37 = &v108;
      v38 = &v107;
    }
  }
  else
  {
    v72 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v73 = NFLogGetLogger(v72);
    if (v73)
    {
      v74 = (void (*)(uint64_t, const char *, ...))v73;
      v75 = object_getClass(self);
      v76 = class_isMetaClass(v75);
      v77 = object_getClassName(self);
      v104 = sel_getName(a2);
      v78 = 45;
      if (v76)
        v78 = 43;
      v74(3, "%c[%{public}s %{public}s]:%i Failed to select instance, expecting RAPDU", v78, v77, v104, 156);
    }
    v79 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v80 = NFSharedLogGetLogger(v79);
    v81 = objc_claimAutoreleasedReturnValue(v80);
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
    {
      v82 = object_getClass(self);
      if (class_isMetaClass(v82))
        v83 = 43;
      else
        v83 = 45;
      v84 = object_getClassName(self);
      v85 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v116 = v83;
      v117 = 2082;
      v118 = v84;
      v119 = 2082;
      v120 = v85;
      v121 = 1024;
      v122 = 156;
      _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select instance, expecting RAPDU", buf, 0x22u);
    }

    v34 = objc_alloc((Class)NSError);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v111 = NSLocalizedDescriptionKey;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unknown Error"));
    v112 = v36;
    v37 = &v112;
    v38 = &v111;
  }
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v38, 1));
  v40 = objc_msgSend(v34, "initWithDomain:code:userInfo:", v35, 6, v39);

LABEL_18:
LABEL_29:

  return v40;
}

- (void)deselectInstance
{
  void *v4;
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
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void (*v24)(uint64_t, const char *, ...);
  objc_class *v25;
  _BOOL4 v26;
  const char *v27;
  const char *v28;
  const char *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  objc_class *v37;
  int v38;
  const char *v39;
  const char *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void (*v45)(uint64_t, const char *, ...);
  objc_class *v46;
  _BOOL4 v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
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
  const char *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  objc_class *v66;
  int v67;
  const char *v68;
  const char *v69;
  unsigned int v70;
  const char *v71;
  NSObject *v72;
  uint32_t v73;
  void *v74;
  uint64_t v75;
  void (*v76)(uint64_t, const char *, ...);
  objc_class *v77;
  _BOOL4 v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  objc_class *v83;
  int v84;
  const char *v85;
  const char *v86;
  const char *Name;
  const char *v88;
  const char *v89;
  uint64_t v90;
  id v91;
  uint8_t buf[4];
  int v93;
  __int16 v94;
  const char *v95;
  __int16 v96;
  const char *v97;
  __int16 v98;
  int v99;
  __int16 v100;
  void *v101;
  __int16 v102;
  NSObject *v103;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_NFTrustSession trustDBApplet](self, "trustDBApplet"));

  if (!v4)
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
      v7(3, "%c[%{public}s %{public}s]:%i Could not deselect instance, instance not found in database", v11, ClassName, Name, 182);
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
      v93 = v16;
      v94 = 2082;
      v95 = object_getClassName(self);
      v96 = 2082;
      v97 = sel_getName(a2);
      v98 = 1024;
      v99 = 182;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not deselect instance, instance not found in database", buf, 0x22u);
    }

  }
  -[_NFTrustSession setIsInstanceSelected:](self, "setIsInstanceSelected:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[_NFTrustSession secureElementWrapper](self, "secureElementWrapper"));

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[_NFTrustSession secureElementWrapper](self, "secureElementWrapper"));
    v19 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_100269CE6, 8);
    v91 = 0;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "selectByName:error:", v19, &v91));
    v21 = v91;

    if (v21)
    {
      v22 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v23 = NFLogGetLogger(v22);
      if (v23)
      {
        v24 = (void (*)(uint64_t, const char *, ...))v23;
        v25 = object_getClass(self);
        v26 = class_isMetaClass(v25);
        v27 = object_getClassName(self);
        v28 = sel_getName(a2);
        v29 = a2;
        v30 = v20;
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[_NFTrustSession trustDBApplet](self, "trustDBApplet"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "instanceAID"));
        v33 = 45;
        if (v26)
          v33 = 43;
        v24(3, "%c[%{public}s %{public}s]:%i Could not deselect instance (AID: %{public}@): %{public}@", v33, v27, v28, 195, v32, v21);

        v20 = v30;
        a2 = v29;
      }
      v34 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v35 = NFSharedLogGetLogger(v34);
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v37 = object_getClass(self);
        if (class_isMetaClass(v37))
          v38 = 43;
        else
          v38 = 45;
        v39 = object_getClassName(self);
        v40 = sel_getName(a2);
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[_NFTrustSession trustDBApplet](self, "trustDBApplet"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "instanceAID"));
        *(_DWORD *)buf = 67110402;
        v93 = v38;
        v94 = 2082;
        v95 = v39;
        v96 = 2082;
        v97 = v40;
        v98 = 1024;
        v99 = 195;
        v100 = 2114;
        v101 = v42;
        v102 = 2114;
        v103 = v21;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not deselect instance (AID: %{public}@): %{public}@", buf, 0x36u);

      }
      goto LABEL_53;
    }
    if (v20)
    {
      if (objc_msgSend(v20, "status") == 36864)
      {
LABEL_54:

        goto LABEL_55;
      }
      v56 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v57 = NFLogGetLogger(v56);
      if (v57)
      {
        v58 = (void (*)(uint64_t, const char *, ...))v57;
        v59 = object_getClass(self);
        v60 = class_isMetaClass(v59);
        v61 = object_getClassName(self);
        v62 = sel_getName(a2);
        v90 = objc_msgSend(v20, "status");
        v63 = 45;
        if (v60)
          v63 = 43;
        v58(3, "%c[%{public}s %{public}s]:%i Failed to deselect instance %u", v63, v61, v62, 205, v90);
      }
      v64 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v65 = NFSharedLogGetLogger(v64);
      v36 = objc_claimAutoreleasedReturnValue(v65);
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
LABEL_53:

        goto LABEL_54;
      }
      v66 = object_getClass(self);
      if (class_isMetaClass(v66))
        v67 = 43;
      else
        v67 = 45;
      v68 = object_getClassName(self);
      v69 = sel_getName(a2);
      v70 = objc_msgSend(v20, "status");
      *(_DWORD *)buf = 67110146;
      v93 = v67;
      v94 = 2082;
      v95 = v68;
      v96 = 2082;
      v97 = v69;
      v98 = 1024;
      v99 = 205;
      v100 = 1024;
      LODWORD(v101) = v70;
      v71 = "%c[%{public}s %{public}s]:%i Failed to deselect instance %u";
      v72 = v36;
      v73 = 40;
    }
    else
    {
      v74 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v75 = NFLogGetLogger(v74);
      if (v75)
      {
        v76 = (void (*)(uint64_t, const char *, ...))v75;
        v77 = object_getClass(self);
        v78 = class_isMetaClass(v77);
        v79 = object_getClassName(self);
        v89 = sel_getName(a2);
        v80 = 45;
        if (v78)
          v80 = 43;
        v76(3, "%c[%{public}s %{public}s]:%i Failed to deselect instance, expecting RAPDU", v80, v79, v89, 200);
      }
      v81 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v82 = NFSharedLogGetLogger(v81);
      v36 = objc_claimAutoreleasedReturnValue(v82);
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        goto LABEL_53;
      v83 = object_getClass(self);
      if (class_isMetaClass(v83))
        v84 = 43;
      else
        v84 = 45;
      v85 = object_getClassName(self);
      v86 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v93 = v84;
      v94 = 2082;
      v95 = v85;
      v96 = 2082;
      v97 = v86;
      v98 = 1024;
      v99 = 200;
      v71 = "%c[%{public}s %{public}s]:%i Failed to deselect instance, expecting RAPDU";
      v72 = v36;
      v73 = 34;
    }
    _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, v71, buf, v73);
    goto LABEL_53;
  }
  v43 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v44 = NFLogGetLogger(v43);
  if (v44)
  {
    v45 = (void (*)(uint64_t, const char *, ...))v44;
    v46 = object_getClass(self);
    v47 = class_isMetaClass(v46);
    v48 = object_getClassName(self);
    v88 = sel_getName(a2);
    v49 = 45;
    if (v47)
      v49 = 43;
    v45(3, "%c[%{public}s %{public}s]:%i secureElementWrapper is nil, could not deselect instance", v49, v48, v88, 188);
  }
  v50 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v51 = NFSharedLogGetLogger(v50);
  v21 = objc_claimAutoreleasedReturnValue(v51);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v52 = object_getClass(self);
    if (class_isMetaClass(v52))
      v53 = 43;
    else
      v53 = 45;
    v54 = object_getClassName(self);
    v55 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v93 = v53;
    v94 = 2082;
    v95 = v54;
    v96 = 2082;
    v97 = v55;
    v98 = 1024;
    v99 = 188;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i secureElementWrapper is nil, could not deselect instance", buf, 0x22u);
  }
LABEL_55:

}

- (id)getListOfKeysWithError:(id *)a3
{
  void *v6;
  _BOOL4 v7;
  id v8;
  _QWORD *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  id v13;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v17;
  const char *ClassName;
  const char *Name;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  objc_class *v23;
  int v24;
  const char *v25;
  const char *v26;
  id v27;
  _QWORD v29[8];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  NSMutableArray *v41;
  const __CFString *v42;
  void *v43;
  uint8_t buf[4];
  int v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  int v51;

  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = sub_1000C6574;
  v40 = sub_1000C6584;
  v41 = objc_opt_new(NSMutableArray);
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_1000C6574;
  v34 = sub_1000C6584;
  v35 = 0;
  if (!a3)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
    if (Logger)
    {
      Class = object_getClass(self);
      if (class_isMetaClass(Class))
        v17 = 43;
      else
        v17 = 45;
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      Logger(3, "%c[%{public}s %{public}s]:%i getListOfKeysWithError expects error to be returned", v17, ClassName, Name, 220);
    }
    v20 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v21 = NFSharedLogGetLogger(v20);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = object_getClass(self);
      if (class_isMetaClass(v23))
        v24 = 43;
      else
        v24 = 45;
      v25 = object_getClassName(self);
      v26 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v45 = v24;
      v46 = 2082;
      v47 = v25;
      v48 = 2082;
      v49 = v26;
      v50 = 1024;
      v51 = 220;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i getListOfKeysWithError expects error to be returned", buf, 0x22u);
    }

LABEL_16:
    v13 = 0;
    goto LABEL_18;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_NFTrustSession trustDB](self, "trustDB"));
  v7 = v6 == 0;

  if (v7)
  {
    v27 = sub_1001308D0();
    v13 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue(v27);
    goto LABEL_18;
  }
  v8 = (id)objc_claimAutoreleasedReturnValue(-[_NFTrustSession selectInstance](self, "selectInstance"));
  *a3 = v8;
  if (v8)
    goto LABEL_16;
  v9 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[_NFTrustSession trustDB](self, "trustDB"));
  v10 = (objc_class *)objc_opt_class(NFTrustDBKey);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000C658C;
  v29[3] = &unk_1002E7CF8;
  v29[4] = self;
  v29[5] = &v30;
  v29[6] = &v36;
  v29[7] = a2;
  sub_1000303CC(v9, v10, v29);

  v42 = CFSTR("totalPurpleTrustKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend((id)v37[5], "count")));
  v43 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1));
  +[NFGeneralStatisticsCALogger updateGeneralDeviceStatistic:](NFGeneralStatisticsCALogger, "updateGeneralDeviceStatistic:", v12);

  *a3 = objc_retainAutorelease((id)v31[5]);
  v13 = (id)v37[5];
LABEL_18:
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  return v13;
}

- (void)listKeysWithCompletion:(id)a3
{
  id v5;
  OS_dispatch_queue *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  SEL v11;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_NFTrustSession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C6F28;
  block[3] = &unk_1002E5D28;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (unint64_t)getNumberOfKeys:(id *)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_NFTrustSession keys](self, "keys", a3));
  v4 = objc_msgSend(v3, "count");

  return (unint64_t)v4;
}

- (id)deleteDBKey:(id)a3
{
  id *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *specific;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  void (*v33)(uint64_t, const char *, ...);
  objc_class *v34;
  _BOOL4 v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  objc_class *v40;
  int v41;
  void *v42;
  void *v43;
  _UNKNOWN **v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  void (*v50)(uint64_t, const char *, ...);
  objc_class *v51;
  _BOOL4 v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  NSObject *v56;
  objc_class *v57;
  int v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  uint64_t v64;
  void *v65;
  id v66;
  void *v67;
  uint64_t v68;
  NSObject *v69;
  NSObject *v70;
  id v71;
  void *v72;
  uint64_t v73;
  void (*v74)(uint64_t, const char *, ...);
  objc_class *v75;
  _BOOL4 v76;
  const char *v77;
  id v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  NSObject *v82;
  objc_class *v83;
  int v84;
  const char *v85;
  const char *v86;
  id v87;
  void *v88;
  uint64_t v89;
  _QWORD *v90;
  id v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void (*v95)(uint64_t, const char *, ...);
  objc_class *v96;
  _BOOL4 v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  NSObject *v101;
  objc_class *v102;
  int v103;
  const char *v104;
  const char *v105;
  void *v106;
  void *v107;
  id v108;
  void *v109;
  uint64_t v110;
  void (*v111)(uint64_t, const char *, ...);
  objc_class *v112;
  _BOOL4 v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  NSObject *v117;
  objc_class *v118;
  int v119;
  const char *v120;
  const char *v121;
  void *v122;
  const char *ClassName;
  const char *v124;
  const char *v125;
  const char *v126;
  const char *v127;
  const char *Name;
  const char *v129;
  const char *v130;
  const char *v131;
  const char *v132;
  const char *v133;
  int v134;
  _QWORD v135[4];
  _QWORD v136[4];
  _QWORD v137[4];
  _QWORD v138[4];
  _QWORD v139[4];
  _QWORD v140[4];
  uint8_t buf[4];
  int v142;
  __int16 v143;
  const char *v144;
  __int16 v145;
  const char *v146;
  __int16 v147;
  int v148;
  __int16 v149;
  id v150;
  __int16 v151;
  id v152;
  _QWORD v153[4];
  _QWORD v154[4];
  _QWORD v155[4];
  _QWORD v156[4];
  _QWORD v157[4];
  _QWORD v158[4];

  v5 = (id *)a3;
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[_NFTrustSession trustDB](self, "trustDB"));
    if (v6)
    {
      v7 = (void *)v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[_NFTrustSession trustDBApplet](self, "trustDBApplet"));

      if (v8)
      {
        v9 = objc_claimAutoreleasedReturnValue(-[_NFTrustSession selectInstance](self, "selectInstance"));
        if (v9)
        {
          v10 = (id)v9;
          specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          Logger = NFLogGetLogger(specific);
          if (Logger)
          {
            v13 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(self);
            isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(self);
            Name = sel_getName(a2);
            v16 = 45;
            if (isMetaClass)
              v16 = 43;
            v13(3, "%c[%{public}s %{public}s]:%i Failed to select instance : %{public}@", v16, ClassName, Name, 365, v10);
          }
          v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v18 = NFSharedLogGetLogger(v17);
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v20 = object_getClass(self);
            if (class_isMetaClass(v20))
              v21 = 43;
            else
              v21 = 45;
            *(_DWORD *)buf = 67110146;
            v142 = v21;
            v143 = 2082;
            v144 = object_getClassName(self);
            v145 = 2082;
            v146 = sel_getName(a2);
            v147 = 1024;
            v148 = 365;
            v149 = 2114;
            v150 = v10;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select instance : %{public}@", buf, 0x2Cu);
          }

          goto LABEL_17;
        }
        v27 = v5[4];
        if (v27)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[_NFTrustSession trustDBApplet](self, "trustDBApplet"));
          v30 = sub_100031814(v29, v27);
          v10 = (id)objc_claimAutoreleasedReturnValue(v30);

          if (v10)
          {
            v31 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v32 = NFLogGetLogger(v31);
            if (v32)
            {
              v33 = (void (*)(uint64_t, const char *, ...))v32;
              v34 = object_getClass(self);
              v35 = class_isMetaClass(v34);
              v124 = object_getClassName(self);
              v129 = sel_getName(a2);
              v36 = 45;
              if (v35)
                v36 = 43;
              v33(3, "%c[%{public}s %{public}s]:%i Failed to clean DB Applet slot : %{public}@", v36, v124, v129, 373, v10);
            }
            v37 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v38 = NFSharedLogGetLogger(v37);
            v39 = objc_claimAutoreleasedReturnValue(v38);
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              v40 = object_getClass(self);
              if (class_isMetaClass(v40))
                v41 = 43;
              else
                v41 = 45;
              *(_DWORD *)buf = 67110146;
              v142 = v41;
              v143 = 2082;
              v144 = object_getClassName(self);
              v145 = 2082;
              v146 = sel_getName(a2);
              v147 = 1024;
              v148 = 373;
              v149 = 2114;
              v150 = v10;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to clean DB Applet slot : %{public}@", buf, 0x2Cu);
            }

            v155[0] = CFSTR("purpleTrustOperationType");
            v155[1] = CFSTR("purpleTrustOperationErrorStep");
            v156[0] = &off_1002FEA18;
            v156[1] = &off_1002FEA60;
            v156[2] = &off_1002FEA30;
            v155[2] = CFSTR("purpleTrustOperationCAErrorCode");
            v155[3] = CFSTR("purpleTrustOperationErrorCode");
            v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v10, "code")));
            v156[3] = v42;
            v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v156, v155, 4));

            sub_1001ECCDC((uint64_t)NFPeerPaymentAndPurpleTrustCALogger, v43);
            v44 = &off_1003062B8;
            goto LABEL_44;
          }
        }
        v45 = v5[3];

        if (v45)
          objc_storeStrong(v5 + 3, 0);
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[_NFTrustSession trustDB](self, "trustDB"));
        v47 = sub_10002F654((uint64_t)v46);
        v10 = (id)objc_claimAutoreleasedReturnValue(v47);

        if (v10)
        {
          v48 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v49 = NFLogGetLogger(v48);
          if (v49)
          {
            v50 = (void (*)(uint64_t, const char *, ...))v49;
            v51 = object_getClass(self);
            v52 = class_isMetaClass(v51);
            v125 = object_getClassName(self);
            v130 = sel_getName(a2);
            v53 = 45;
            if (v52)
              v53 = 43;
            v50(3, "%c[%{public}s %{public}s]:%i Failed to commit NFTrustDB : %{public}@ ...", v53, v125, v130, 397, v10);
          }
          v54 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v55 = NFSharedLogGetLogger(v54);
          v56 = objc_claimAutoreleasedReturnValue(v55);
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            v57 = object_getClass(self);
            if (class_isMetaClass(v57))
              v58 = 43;
            else
              v58 = 45;
            *(_DWORD *)buf = 67110146;
            v142 = v58;
            v143 = 2082;
            v144 = object_getClassName(self);
            v145 = 2082;
            v146 = sel_getName(a2);
            v147 = 1024;
            v148 = 397;
            v149 = 2114;
            v150 = v10;
            _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to commit NFTrustDB : %{public}@ ...", buf, 0x2Cu);
          }

          v153[0] = CFSTR("purpleTrustOperationType");
          v153[1] = CFSTR("purpleTrustOperationErrorStep");
          v154[0] = &off_1002FEA18;
          v154[1] = &off_1002FEA60;
          v154[2] = &off_1002FEA30;
          v153[2] = CFSTR("purpleTrustOperationCAErrorCode");
          v153[3] = CFSTR("purpleTrustOperationErrorCode");
          v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v10, "code")));
          v154[3] = v59;
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v154, v153, 4));

          sub_1001ECCDC((uint64_t)NFPeerPaymentAndPurpleTrustCALogger, v43);
          v44 = &off_1003062E0;
          goto LABEL_44;
        }
        objc_storeStrong(v5 + 4, 0);
        v62 = NFSharedSignpostLog(v61);
        v63 = objc_claimAutoreleasedReturnValue(v62);
        if (os_signpost_enabled(v63))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v63, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "deleteKeyInSlot", ", buf, 2u);
        }

        if (v27
          && (v65 = (void *)objc_claimAutoreleasedReturnValue(-[_NFTrustSession secureElementWrapper](self, "secureElementWrapper")),
              v66 = sub_1000AE670(v65, v27),
              v67 = (void *)objc_claimAutoreleasedReturnValue(v66),
              v65,
              v67))
        {
          v68 = NFSharedSignpostLog(v64);
          v69 = objc_claimAutoreleasedReturnValue(v68);
          if (os_signpost_enabled(v69))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v69, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "deleteKeyInSlot", "failed", buf, 2u);
          }

          v70 = objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "domain"));
          if (-[NSObject isEqualToString:](v70, "isEqualToString:", CFSTR("GP")))
          {
            v71 = objc_msgSend(v67, "code");

            if (v71 != (id)27272)
            {
LABEL_68:
              v90 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[_NFTrustSession trustDB](self, "trustDB"));
              v91 = sub_10002F0B0(v90, v5);
              v92 = (void *)objc_claimAutoreleasedReturnValue(v91);

              if (v92)
              {
                v93 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v94 = NFLogGetLogger(v93);
                if (v94)
                {
                  v95 = (void (*)(uint64_t, const char *, ...))v94;
                  v96 = object_getClass(self);
                  v97 = class_isMetaClass(v96);
                  v126 = object_getClassName(self);
                  v131 = sel_getName(a2);
                  v98 = 45;
                  if (v97)
                    v98 = 43;
                  v95(3, "%c[%{public}s %{public}s]:%i Failed to remove Key from NFTrustDB : %{public}@ ...", v98, v126, v131, 449, v92);
                }
                v99 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v100 = NFSharedLogGetLogger(v99);
                v101 = objc_claimAutoreleasedReturnValue(v100);
                if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
                {
                  v102 = object_getClass(self);
                  if (class_isMetaClass(v102))
                    v103 = 43;
                  else
                    v103 = 45;
                  v104 = object_getClassName(self);
                  v105 = sel_getName(a2);
                  *(_DWORD *)buf = 67110146;
                  v142 = v103;
                  v143 = 2082;
                  v144 = v104;
                  v145 = 2082;
                  v146 = v105;
                  v147 = 1024;
                  v148 = 449;
                  v149 = 2114;
                  v150 = v92;
                  _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to remove Key from NFTrustDB : %{public}@ ...", buf, 0x2Cu);
                }

                v137[0] = CFSTR("purpleTrustOperationType");
                v137[1] = CFSTR("purpleTrustOperationErrorStep");
                v138[0] = &off_1002FEA18;
                v138[1] = &off_1002FEA78;
                v138[2] = &off_1002FEA30;
                v137[2] = CFSTR("purpleTrustOperationCAErrorCode");
                v137[3] = CFSTR("purpleTrustOperationErrorCode");
                v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v92, "code")));
                v138[3] = v106;
                v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v138, v137, 4));

                sub_1001ECCDC((uint64_t)NFPeerPaymentAndPurpleTrustCALogger, v43);
                +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:](NFGeneralStatisticsCALogger, "updateAnalyticsGeneralTransactionStatistics:", &off_100306330);
                v60 = v92;
                goto LABEL_45;
              }
              v107 = (void *)objc_claimAutoreleasedReturnValue(-[_NFTrustSession trustDB](self, "trustDB"));
              v108 = sub_10002F654((uint64_t)v107);
              v10 = (id)objc_claimAutoreleasedReturnValue(v108);

              if (!v10)
                goto LABEL_18;
              v109 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v110 = NFLogGetLogger(v109);
              if (v110)
              {
                v111 = (void (*)(uint64_t, const char *, ...))v110;
                v112 = object_getClass(self);
                v113 = class_isMetaClass(v112);
                v127 = object_getClassName(self);
                v132 = sel_getName(a2);
                v114 = 45;
                if (v113)
                  v114 = 43;
                v111(3, "%c[%{public}s %{public}s]:%i Failed to commit NFTrustDB : %{public}@ ...", v114, v127, v132, 470, v10);
              }
              v115 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v116 = NFSharedLogGetLogger(v115);
              v117 = objc_claimAutoreleasedReturnValue(v116);
              if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
              {
                v118 = object_getClass(self);
                if (class_isMetaClass(v118))
                  v119 = 43;
                else
                  v119 = 45;
                v120 = object_getClassName(self);
                v121 = sel_getName(a2);
                *(_DWORD *)buf = 67110146;
                v142 = v119;
                v143 = 2082;
                v144 = v120;
                v145 = 2082;
                v146 = v121;
                v147 = 1024;
                v148 = 470;
                v149 = 2114;
                v150 = v10;
                _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to commit NFTrustDB : %{public}@ ...", buf, 0x2Cu);
              }

              v135[0] = CFSTR("purpleTrustOperationType");
              v135[1] = CFSTR("purpleTrustOperationErrorStep");
              v136[0] = &off_1002FEA18;
              v136[1] = &off_1002FEA78;
              v136[2] = &off_1002FEA30;
              v135[2] = CFSTR("purpleTrustOperationCAErrorCode");
              v135[3] = CFSTR("purpleTrustOperationErrorCode");
              v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v10, "code")));
              v136[3] = v122;
              v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v136, v135, 4));

              sub_1001ECCDC((uint64_t)NFPeerPaymentAndPurpleTrustCALogger, v43);
              v44 = &off_100306358;
LABEL_44:
              +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:](NFGeneralStatisticsCALogger, "updateAnalyticsGeneralTransactionStatistics:", v44);
              v60 = v10;
LABEL_45:
              v10 = v60;

              goto LABEL_18;
            }
            v72 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v73 = NFLogGetLogger(v72);
            if (v73)
            {
              v74 = (void (*)(uint64_t, const char *, ...))v73;
              v75 = object_getClass(self);
              v76 = class_isMetaClass(v75);
              v133 = object_getClassName(self);
              v77 = sel_getName(a2);
              v78 = v5[1];
              v79 = 45;
              if (v76)
                v79 = 43;
              v74(3, "%c[%{public}s %{public}s]:%i Key with identifier %{public}@ is supposed to be in slot %{public}@ but slot is empty", v79, v133, v77, 426, v78, v27);

            }
            v80 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v81 = NFSharedLogGetLogger(v80);
            v82 = objc_claimAutoreleasedReturnValue(v81);
            if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
            {
              v83 = object_getClass(self);
              if (class_isMetaClass(v83))
                v84 = 43;
              else
                v84 = 45;
              v134 = v84;
              v85 = object_getClassName(self);
              v86 = sel_getName(a2);
              v87 = v5[1];
              *(_DWORD *)buf = 67110402;
              v142 = v134;
              v143 = 2082;
              v144 = v85;
              v145 = 2082;
              v146 = v86;
              v147 = 1024;
              v148 = 426;
              v149 = 2114;
              v150 = v87;
              v151 = 2114;
              v152 = v27;
              _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Key with identifier %{public}@ is supposed to be in slot %{public}@ but slot is empty", buf, 0x36u);

            }
            v139[0] = CFSTR("purpleTrustOperationType");
            v139[1] = CFSTR("purpleTrustOperationErrorStep");
            v140[0] = &off_1002FEA18;
            v140[1] = &off_1002FEA78;
            v140[2] = &off_1002FEA90;
            v139[2] = CFSTR("purpleTrustOperationCAErrorCode");
            v139[3] = CFSTR("purpleTrustOperationErrorCode");
            v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v67, "code")));
            v140[3] = v88;
            v70 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v140, v139, 4));

            sub_1001ECCDC((uint64_t)NFPeerPaymentAndPurpleTrustCALogger, v70);
            +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:](NFGeneralStatisticsCALogger, "updateAnalyticsGeneralTransactionStatistics:", &off_100306308);
          }
        }
        else
        {
          v89 = NFSharedSignpostLog(v64);
          v70 = objc_claimAutoreleasedReturnValue(v89);
          if (os_signpost_enabled(v70))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v70, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "deleteKeyInSlot", ", buf, 2u);
          }
          v67 = 0;
        }

        goto LABEL_68;
      }
    }
    v22 = sub_1001308D0();
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v157[0] = CFSTR("purpleTrustOperationType");
    v157[1] = CFSTR("purpleTrustOperationErrorStep");
    v158[0] = &off_1002FEA18;
    v158[1] = &off_1002FEA18;
    v158[2] = &off_1002FEA30;
    v157[2] = CFSTR("purpleTrustOperationCAErrorCode");
    v157[3] = CFSTR("purpleTrustOperationErrorCode");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v23, "code")));
    v158[3] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v158, v157, 4));

    sub_1001ECCDC((uint64_t)NFPeerPaymentAndPurpleTrustCALogger, v25);
    +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:](NFGeneralStatisticsCALogger, "updateAnalyticsGeneralTransactionStatistics:", &off_100306290);
    v10 = v23;

  }
  else
  {
    v26 = sub_100130D58(CFSTR("Could not delete Key with nil DB Key"));
    v10 = (id)objc_claimAutoreleasedReturnValue(v26);
  }
LABEL_17:
  v27 = 0;
LABEL_18:

  return v10;
}

- (void)deleteKey:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  OS_dispatch_queue *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  SEL v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_NFTrustSession;
  v9 = -[_NFSession workQueue](&v17, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000C86B4;
  v13[3] = &unk_1002E7D60;
  v15 = v8;
  v16 = a2;
  v13[4] = self;
  v14 = v7;
  v11 = v7;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)createKey:(id)a3 cresteKeyRequest:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  OS_dispatch_queue *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[6];
  id v17;
  id v18;
  SEL v19;
  objc_super v20;

  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_NFTrustSession;
  v11 = a3;
  v12 = -[_NFSession workQueue](&v20, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue(v12);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C91F0;
  block[3] = &unk_1002E7D88;
  v18 = v10;
  v19 = a2;
  block[4] = self;
  block[5] = v11;
  v17 = v9;
  v14 = v9;
  v15 = v10;
  dispatch_async(v13, block);

}

- (void)signWithKey:(id)a3 signRequest:(id)a4 paymentRequest:(id)a5 authorization:(id)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  OS_dispatch_queue *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD block[5];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  SEL v30;
  objc_super v31;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v31.receiver = self;
  v31.super_class = (Class)_NFTrustSession;
  v17 = a4;
  v18 = -[_NFSession workQueue](&v31, "workQueue");
  v19 = objc_claimAutoreleasedReturnValue(v18);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CB69C;
  block[3] = &unk_1002E7DB0;
  v29 = v16;
  v30 = a2;
  block[4] = self;
  v25 = v13;
  v26 = v17;
  v27 = v15;
  v28 = v14;
  v20 = v14;
  v21 = v15;
  v22 = v13;
  v23 = v16;
  dispatch_async(v19, block);

}

- (BOOL)isSessionSEOnly
{
  return 1;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_applicationIdentifier, a3);
}

- (BOOL)isInstanceSelected
{
  return self->_isInstanceSelected;
}

- (void)setIsInstanceSelected:(BOOL)a3
{
  self->_isInstanceSelected = a3;
}

- (NFTrustDBApplet)trustDBApplet
{
  return self->_trustDBApplet;
}

- (void)setTrustDBApplet:(id)a3
{
  objc_storeStrong((id *)&self->_trustDBApplet, a3);
}

- (NFTrustDataBase)trustDB
{
  return self->_trustDB;
}

- (void)setTrustDB:(id)a3
{
  objc_storeStrong((id *)&self->_trustDB, a3);
}

- (NSArray)keys
{
  return self->_keys;
}

- (void)setKeys:(id)a3
{
  objc_storeStrong((id *)&self->_keys, a3);
}

- (NFSecureElementWrapper)secureElementWrapper
{
  return self->_secureElementWrapper;
}

- (void)setSecureElementWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_secureElementWrapper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureElementWrapper, 0);
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->_trustDB, 0);
  objc_storeStrong((id *)&self->_trustDBApplet, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end
