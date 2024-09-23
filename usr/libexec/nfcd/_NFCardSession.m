@implementation _NFCardSession

- (_NFCardSession)initWithConfig:(id)a3 allowlistChecker:(id)a4 remoteObject:(id)a5 workQueue:(id)a6
{
  id v10;
  id v11;
  _NFCardSession *v12;
  _NFCardSession *v13;
  NFUIService *v14;
  NFUIService *uiService;
  NFUIService *v16;
  NFUIService *v17;
  void *v18;
  _NFCardSession *v19;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v21.receiver = self;
  v21.super_class = (Class)_NFCardSession;
  v12 = -[_NFXPCSession initWithRemoteObject:workQueue:](&v21, "initWithRemoteObject:workQueue:", a5, a6);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_allowlistChecker, a4);
    v14 = objc_opt_new(NFUIService);
    uiService = v13->_uiService;
    v13->_uiService = v14;

    v16 = v13->_uiService;
    if (v16)
    {
      -[NFUIService coreNFCUISetMode:](v16, "coreNFCUISetMode:", 3);
      v17 = v13->_uiService;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "initialUIText"));
      -[NFUIService coreNFCUISetScanText:](v17, "coreNFCUISetScanText:", v18);

      v13->_uiServiceWasActivated = 0;
      -[_NFHCESession setReadOnConnected:](v13, "setReadOnConnected:", 1);
    }
    v19 = v13;
  }

  return v13;
}

- (void)_activateUIControllerWithCompletion:(id)a3
{
  void (**v5)(id, _QWORD);
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
  NFUIService *uiService;
  NFUIService *v19;
  const char *Name;
  _QWORD v21[5];
  void (**v22)(id, _QWORD);
  _QWORD v23[5];
  id v24[2];
  id buf;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;

  v5 = (void (**)(id, _QWORD))a3;
  if (self->_uiServiceWasActivated)
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
      v12 = 45;
      if (isMetaClass)
        v12 = 43;
      v8(6, "%c[%{public}s %{public}s]:%i UI already activated", v12, ClassName, Name, 69);
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
      LODWORD(buf) = 67109890;
      HIDWORD(buf) = v17;
      v26 = 2082;
      v27 = object_getClassName(self);
      v28 = 2082;
      v29 = sel_getName(a2);
      v30 = 1024;
      v31 = 69;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i UI already activated", (uint8_t *)&buf, 0x22u);
    }

    v5[2](v5, 0);
  }
  else
  {
    objc_initWeak(&buf, self);
    uiService = self->_uiService;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100192298;
    v23[3] = &unk_1002EA450;
    objc_copyWeak(v24, &buf);
    v24[1] = (id)a2;
    v23[4] = self;
    -[NFUIService coreNFCUISetInvalidationHandler:](uiService, "coreNFCUISetInvalidationHandler:", v23);
    v19 = self->_uiService;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10019261C;
    v21[3] = &unk_1002EA478;
    v21[4] = self;
    v22 = v5;
    -[NFUIService coreNFCUIActivateWithCompletion:](v19, "coreNFCUIActivateWithCompletion:", v21);

    objc_destroyWeak(v24);
    objc_destroyWeak(&buf);
  }

}

- (void)_initPaymentAIDList
{
  void *v3;
  NSMutableOrderedSet *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_NFCardSession paymentAIDList](self, "paymentAIDList"));

  if (!v3)
  {
    v4 = objc_opt_new(NSMutableOrderedSet);
    -[_NFCardSession setPaymentAIDList:](self, "setPaymentAIDList:", v4);

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_NFCardSession allowlistChecker](self, "allowlistChecker", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nfcCardSessionAIDPrefixList"));

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_asHexString"));
          if (+[NFATLMobileSettings findAID:filterType:](NFATLMobileSettings, "findAID:filterType:", v12, 1)|| +[NFATLMobileSettings findAID:filterType:](NFATLMobileSettings, "findAID:filterType:", v12, 0))
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[_NFCardSession paymentAIDList](self, "paymentAIDList"));
            objc_msgSend(v13, "addObject:", v11);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
}

- (void)_invalidateUIController
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
    v6(6, "%c[%{public}s %{public}s]:%i Invalidating...", v10, ClassName, Name, 126);
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
    v24 = 126;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalidating...", buf, 0x22u);
  }

  -[NFUIService coreNFCUIInvalidate](self->_uiService, "coreNFCUIInvalidate");
}

- (void)_invalidateUIControllerWithStatus:(BOOL)a3
{
  _BOOL4 v3;
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
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  _BOOL4 v28;

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
    v8(6, "%c[%{public}s %{public}s]:%i Invalidating with status %{public}d...", v11, ClassName, Name, 132, v3);
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
    v20 = v16;
    v21 = 2082;
    v22 = object_getClassName(self);
    v23 = 2082;
    v24 = sel_getName(a2);
    v25 = 1024;
    v26 = 132;
    v27 = 1026;
    v28 = v3;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalidating with status %{public}d...", buf, 0x28u);
  }

  -[NFUIService coreNFCUITagScannedCount:](self->_uiService, "coreNFCUITagScannedCount:", v3);
  -[NFUIService coreNFCUIInvalidate](self->_uiService, "coreNFCUIInvalidate");
}

- (void)sendAPDU:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  v9 = objc_claimAutoreleasedReturnValue(-[_NFSession workQueue](self, "workQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100192C80;
  v12[3] = &unk_1002E6268;
  v14 = v8;
  v15 = a2;
  v12[4] = self;
  v13 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, v12);

}

- (void)startEmulationWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  SEL v12;
  uint8_t buf[16];

  v5 = a3;
  v6 = NFSharedSignpostLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_START_EMULATION_XPC", ", buf, 2u);
  }

  v8 = objc_claimAutoreleasedReturnValue(-[_NFSession workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100193118;
  block[3] = &unk_1002E5D28;
  v11 = v5;
  v12 = a2;
  block[4] = self;
  v9 = v5;
  dispatch_async(v8, block);

}

- (void)stopEmulationWithStatus:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig routingOffWithFD:](NFRoutingConfig, "routingOffWithFD:", 1));
  -[_NFHCESession stopEmulationAndConfigWithRouting:completion:](self, "stopEmulationAndConfigWithRouting:completion:", v7, v6);

  -[_NFCardSession _invalidateUIControllerWithStatus:](self, "_invalidateUIControllerWithStatus:", v4);
}

- (void)updateUIString:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _NFCardSession *v14;
  id v15;
  SEL v16;

  v7 = a3;
  v8 = a4;
  v9 = objc_claimAutoreleasedReturnValue(-[_NFSession workQueue](self, "workQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100193888;
  v12[3] = &unk_1002E5D50;
  v13 = v7;
  v14 = self;
  v15 = v8;
  v16 = a2;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, v12);

}

- (void)_sendErrorStatus:(unsigned __int16)a3
{
  id v4;
  __int16 v5;

  v5 = __rev16(a3);
  v4 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v5, 2);
  -[_NFCardSession sendAPDU:completion:](self, "sendAPDU:completion:", v4, &stru_1002EA498);

}

- (BOOL)validateReceivedAPDU:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  unsigned int v10;
  unsigned int v11;
  BOOL v12;
  unsigned int v13;
  char v14;
  void *v15;
  uint64_t v16;
  void (*v17)(uint64_t, const char *, ...);
  objc_class *v18;
  _BOOL4 v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  objc_class *v25;
  int v26;
  const char *v27;
  NSObject *v28;
  os_log_type_t v29;
  void *specific;
  uint64_t Logger;
  void (*v32)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  void *v36;
  const char *v37;
  const char *Name;
  _NFCardSession *v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  objc_class *v45;
  int v46;
  const char *v47;
  const char *v48;
  void *v49;
  const char *v50;
  void *v51;
  uint64_t v52;
  void (*v53)(uint64_t, const char *, ...);
  objc_class *v54;
  _BOOL4 v55;
  const char *v56;
  void *v57;
  const char *v58;
  const char *v59;
  void *v60;
  _NFCardSession *v61;
  id v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  objc_class *v67;
  int v68;
  const char *v69;
  const char *v70;
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
  BOOL v82;
  void *v84;
  void *v85;
  id v86;
  id v87;
  uint64_t v88;
  void *i;
  void *v90;
  void *v91;
  id v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void (*v98)(uint64_t, const char *, ...);
  objc_class *v99;
  _BOOL4 v100;
  const char *v101;
  const char *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  NSObject *v108;
  objc_class *v109;
  int v110;
  const char *v111;
  const char *v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  void (*v117)(uint64_t, const char *, ...);
  objc_class *v118;
  _BOOL4 v119;
  const char *v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  objc_class *v124;
  int v125;
  void *v126;
  unsigned __int8 v127;
  const char *v128;
  const char *v129;
  const char *v130;
  const char *v131;
  const char *v132;
  const char *sel;
  _BYTE *v134;
  id v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  uint8_t v140[128];
  uint8_t buf[4];
  int v142;
  __int16 v143;
  const char *v144;
  __int16 v145;
  const char *v146;
  __int16 v147;
  int v148;
  __int16 v149;
  void *v150;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(-[_NFHCESession caLogger](self, "caLogger"));
  v7 = (void *)v6;
  if (v6)
    *(_BYTE *)(v6 + 85) = 1;
  v8 = objc_msgSend(objc_alloc((Class)NFCommandAPDU), "initWithData:", v5);
  v9 = v8;
  if (!v8)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v32 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      v36 = v7;
      v37 = a2;
      Name = sel_getName(a2);
      v39 = self;
      v40 = v5;
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NF_asHexString"));
      v129 = Name;
      a2 = v37;
      v7 = v36;
      v42 = 45;
      if (isMetaClass)
        v42 = 43;
      v32(3, "%c[%{public}s %{public}s]:%i Invalid ISO7816 APDU detected, %{public}@", v42, ClassName, v129, 232, v41);

      v5 = v40;
      self = v39;
      v9 = 0;
    }
    v43 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v44 = NFSharedLogGetLogger(v43);
    v24 = objc_claimAutoreleasedReturnValue(v44);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_54;
    v45 = object_getClass(self);
    if (class_isMetaClass(v45))
      v46 = 43;
    else
      v46 = 45;
    v47 = object_getClassName(self);
    v48 = sel_getName(a2);
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NF_asHexString"));
    *(_DWORD *)buf = 67110146;
    v142 = v46;
    v143 = 2082;
    v144 = v47;
    v145 = 2082;
    v146 = v48;
    v147 = 1024;
    v148 = 232;
    v149 = 2114;
    v150 = v49;
    v50 = "%c[%{public}s %{public}s]:%i Invalid ISO7816 APDU detected, %{public}@";
LABEL_42:
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, v50, buf, 0x2Cu);

LABEL_54:
    -[_NFCardSession _sendErrorStatus:](self, "_sendErrorStatus:", 27265);
    v82 = 0;
    goto LABEL_55;
  }
  v10 = objc_msgSend(v8, "isSecureMessaging");
  v11 = objc_msgSend(v9, "isSelectByDFNameCommand");
  if (v11)
    v12 = v10 == 0;
  else
    v12 = 1;
  if (!v12)
  {
    v51 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v52 = NFLogGetLogger(v51);
    if (v52)
    {
      v53 = (void (*)(uint64_t, const char *, ...))v52;
      v54 = object_getClass(self);
      v55 = class_isMetaClass(v54);
      v56 = object_getClassName(self);
      v57 = v7;
      v58 = a2;
      v59 = sel_getName(a2);
      v60 = v9;
      v61 = self;
      v62 = v5;
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NF_asHexString"));
      v130 = v59;
      a2 = v58;
      v7 = v57;
      v64 = 45;
      if (v55)
        v64 = 43;
      v53(3, "%c[%{public}s %{public}s]:%i Invalid ISO7816 SELECT command detected, %{public}@", v64, v56, v130, 241, v63);

      v5 = v62;
      self = v61;
      v9 = v60;
    }
    v65 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v66 = NFSharedLogGetLogger(v65);
    v24 = objc_claimAutoreleasedReturnValue(v66);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_54;
    v67 = object_getClass(self);
    if (class_isMetaClass(v67))
      v68 = 43;
    else
      v68 = 45;
    v69 = object_getClassName(self);
    v70 = sel_getName(a2);
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NF_asHexString"));
    *(_DWORD *)buf = 67110146;
    v142 = v68;
    v143 = 2082;
    v144 = v69;
    v145 = 2082;
    v146 = v70;
    v147 = 1024;
    v148 = 241;
    v149 = 2114;
    v150 = v49;
    v50 = "%c[%{public}s %{public}s]:%i Invalid ISO7816 SELECT command detected, %{public}@";
    goto LABEL_42;
  }
  v13 = v11;
  if ((id)-[_NFCardSession cardState](self, "cardState") == (id)1)
    v14 = v13;
  else
    v14 = 1;
  if ((v14 & 1) == 0)
  {
    v71 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v72 = NFLogGetLogger(v71);
    if (v72)
    {
      v73 = (void (*)(uint64_t, const char *, ...))v72;
      v74 = object_getClass(self);
      v75 = class_isMetaClass(v74);
      v76 = object_getClassName(self);
      v131 = sel_getName(a2);
      v77 = 45;
      if (v75)
        v77 = 43;
      v73(6, "%c[%{public}s %{public}s]:%i No active application selected", v77, v76, v131, 247);
    }
    v78 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v79 = NFSharedLogGetLogger(v78);
    v24 = objc_claimAutoreleasedReturnValue(v79);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      goto LABEL_54;
    v80 = object_getClass(self);
    if (class_isMetaClass(v80))
      v81 = 43;
    else
      v81 = 45;
    *(_DWORD *)buf = 67109890;
    v142 = v81;
    v143 = 2082;
    v144 = object_getClassName(self);
    v145 = 2082;
    v146 = sel_getName(a2);
    v147 = 1024;
    v148 = 247;
    v27 = "%c[%{public}s %{public}s]:%i No active application selected";
    goto LABEL_52;
  }
  if (!v13)
  {
    if ((id)-[_NFCardSession cardState](self, "cardState") == (id)3)
    {
      v82 = 1;
      goto LABEL_55;
    }
    -[_NFCardSession setCardState:](self, "setCardState:", 1);
    v115 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v116 = NFLogGetLogger(v115);
    if (v116)
    {
      v117 = (void (*)(uint64_t, const char *, ...))v116;
      v118 = object_getClass(self);
      v119 = class_isMetaClass(v118);
      v120 = object_getClassName(self);
      v132 = sel_getName(a2);
      v121 = 45;
      if (v119)
        v121 = 43;
      v117(6, "%c[%{public}s %{public}s]:%i No active application selected", v121, v120, v132, 295);
    }
    v122 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v123 = NFSharedLogGetLogger(v122);
    v24 = objc_claimAutoreleasedReturnValue(v123);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      goto LABEL_54;
    v124 = object_getClass(self);
    if (class_isMetaClass(v124))
      v125 = 43;
    else
      v125 = 45;
    *(_DWORD *)buf = 67109890;
    v142 = v125;
    v143 = 2082;
    v144 = object_getClassName(self);
    v145 = 2082;
    v146 = sel_getName(a2);
    v147 = 1024;
    v148 = 295;
    v27 = "%c[%{public}s %{public}s]:%i No active application selected";
LABEL_52:
    v28 = v24;
    v29 = OS_LOG_TYPE_DEFAULT;
LABEL_53:
    _os_log_impl((void *)&_mh_execute_header, v28, v29, v27, buf, 0x22u);
    goto LABEL_54;
  }
  if (objc_msgSend(v9, "payloadLength") >= 0x11)
  {
    v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v16 = NFLogGetLogger(v15);
    if (v16)
    {
      v17 = (void (*)(uint64_t, const char *, ...))v16;
      v18 = object_getClass(self);
      v19 = class_isMetaClass(v18);
      v20 = object_getClassName(self);
      v128 = sel_getName(a2);
      v21 = 45;
      if (v19)
        v21 = 43;
      v17(3, "%c[%{public}s %{public}s]:%i Invalid ISO7816 SELECT command detected; AID length invalid",
        v21,
        v20,
        v128,
        254);
    }
    v22 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v23 = NFSharedLogGetLogger(v22);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_54;
    v25 = object_getClass(self);
    if (class_isMetaClass(v25))
      v26 = 43;
    else
      v26 = 45;
    *(_DWORD *)buf = 67109890;
    v142 = v26;
    v143 = 2082;
    v144 = object_getClassName(self);
    v145 = 2082;
    v146 = sel_getName(a2);
    v147 = 1024;
    v148 = 254;
    v27 = "%c[%{public}s %{public}s]:%i Invalid ISO7816 SELECT command detected; AID length invalid";
    v28 = v24;
    v29 = OS_LOG_TYPE_ERROR;
    goto LABEL_53;
  }
  sel = a2;
  v134 = v7;
  v135 = v5;
  v138 = 0u;
  v139 = 0u;
  v136 = 0u;
  v137 = 0u;
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[_NFCardSession allowlistChecker](self, "allowlistChecker"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "nfcCardSessionAIDPrefixList"));

  v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v136, v140, 16);
  if (v86)
  {
    v87 = v86;
    v88 = *(_QWORD *)v137;
    while (2)
    {
      for (i = 0; i != v87; i = (char *)i + 1)
      {
        if (*(_QWORD *)v137 != v88)
          objc_enumerationMutation(v85);
        v90 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * (_QWORD)i);
        v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "payload"));
        v92 = objc_msgSend(v91, "length");
        v93 = objc_msgSend(v90, "length");

        if (v92 >= v93)
        {
          v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "payload"));
          v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "subdataWithRange:", 0, objc_msgSend(v90, "length")));

          if (objc_msgSend(v95, "isEqualToData:", v90))
          {
            v126 = (void *)objc_claimAutoreleasedReturnValue(-[_NFCardSession paymentAIDList](self, "paymentAIDList"));
            v127 = objc_msgSend(v126, "containsObject:", v95);

            -[_NFCardSession setCardState:](self, "setCardState:", 2);
            v7 = v134;
            if (v134)
              v134[86] = v127;
            v82 = 1;
            v5 = v135;
            goto LABEL_55;
          }

        }
      }
      v87 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v136, v140, 16);
      if (v87)
        continue;
      break;
    }
  }

  -[_NFCardSession setCardState:](self, "setCardState:", 1);
  v96 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v97 = NFLogGetLogger(v96);
  if (v97)
  {
    v98 = (void (*)(uint64_t, const char *, ...))v97;
    v99 = object_getClass(self);
    v100 = class_isMetaClass(v99);
    v101 = object_getClassName(self);
    v102 = sel_getName(sel);
    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "payload"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "NF_asHexString"));
    v105 = 45;
    if (v100)
      v105 = 43;
    v98(6, "%c[%{public}s %{public}s]:%i AID %{public}@ is disallowed", v105, v101, v102, 287, v104);

  }
  v106 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v107 = NFSharedLogGetLogger(v106);
  v108 = objc_claimAutoreleasedReturnValue(v107);
  v5 = v135;
  if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
  {
    v109 = object_getClass(self);
    if (class_isMetaClass(v109))
      v110 = 43;
    else
      v110 = 45;
    v111 = object_getClassName(self);
    v112 = sel_getName(sel);
    v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "payload"));
    v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "NF_asHexString"));
    *(_DWORD *)buf = 67110146;
    v142 = v110;
    v143 = 2082;
    v144 = v111;
    v145 = 2082;
    v146 = v112;
    v147 = 1024;
    v148 = 287;
    v149 = 2114;
    v150 = v114;
    _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i AID %{public}@ is disallowed", buf, 0x2Cu);

  }
  -[_NFCardSession _sendErrorStatus:](self, "_sendErrorStatus:", 27266);
  v82 = 0;
  v7 = v134;
LABEL_55:

  return v82;
}

- (void)asyncReadAPDUWithCompletion:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  _QWORD v14[4];

  v5 = a3;
  v6 = objc_alloc((Class)NSError);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v13[0] = NSLocalizedDescriptionKey;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Feature Not Supported"));
  v14[0] = v8;
  v14[1] = &off_100300A88;
  v13[1] = CFSTR("Line");
  v13[2] = CFSTR("Method");
  v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
  v14[2] = v9;
  v13[3] = NSDebugDescriptionErrorKey;
  v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 304);
  v14[3] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 4));
  v12 = objc_msgSend(v6, "initWithDomain:code:userInfo:", v7, 14, v11);
  (*((void (**)(id, _QWORD, id))a3 + 2))(v5, 0, v12);

}

- (void)readAPDUWithCompletion:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  _QWORD v14[4];

  v5 = a3;
  v6 = objc_alloc((Class)NSError);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v13[0] = NSLocalizedDescriptionKey;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Feature Not Supported"));
  v14[0] = v8;
  v14[1] = &off_100300AA0;
  v13[1] = CFSTR("Line");
  v13[2] = CFSTR("Method");
  v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
  v14[2] = v9;
  v13[3] = NSDebugDescriptionErrorKey;
  v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 308);
  v14[3] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 4));
  v12 = objc_msgSend(v6, "initWithDomain:code:userInfo:", v7, 14, v11);
  (*((void (**)(id, _QWORD, id))a3 + 2))(v5, 0, v12);

}

- (void)restartDiscovery
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
    v6(5, "%c[%{public}s %{public}s]:%i Feature not supported", v10, ClassName, Name, 312);
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
    v24 = 312;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Feature not supported", buf, 0x22u);
  }

}

- (void)requestEmulationAssertion:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  _QWORD v15[4];

  v6 = a4;
  v7 = objc_alloc((Class)NSError);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v14[0] = NSLocalizedDescriptionKey;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Feature Not Supported"));
  v15[0] = v9;
  v15[1] = &off_100300AB8;
  v14[1] = CFSTR("Line");
  v14[2] = CFSTR("Method");
  v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
  v15[2] = v10;
  v14[3] = NSDebugDescriptionErrorKey;
  v11 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 317);
  v15[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 4));
  v13 = objc_msgSend(v7, "initWithDomain:code:userInfo:", v8, 14, v12);
  (*((void (**)(id, id))a4 + 2))(v6, v13);

}

- (void)resumeSessionFromWaitingOnFieldWithCompletion:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  _QWORD v14[4];

  v5 = a3;
  v6 = objc_alloc((Class)NSError);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v13[0] = NSLocalizedDescriptionKey;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Feature Not Supported"));
  v14[0] = v8;
  v14[1] = &off_100300AD0;
  v13[1] = CFSTR("Line");
  v13[2] = CFSTR("Method");
  v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
  v14[2] = v9;
  v13[3] = NSDebugDescriptionErrorKey;
  v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 321);
  v14[3] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 4));
  v12 = objc_msgSend(v6, "initWithDomain:code:userInfo:", v7, 14, v11);
  (*((void (**)(id, id))a3 + 2))(v5, v12);

}

+ (id)validateEntitlements:(id)a3
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *specific;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  int v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD *v26;
  _QWORD *v27;
  void *v28;
  uint64_t v29;
  void (*v30)(uint64_t, const char *, ...);
  objc_class *v31;
  _BOOL4 v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  objc_class *v38;
  int v39;
  void *v40;
  const char *Name;
  const char *v43;
  _QWORD v44[4];
  _QWORD v45[4];
  _QWORD v46[4];
  _QWORD v47[4];
  uint8_t buf[4];
  int v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  int v55;

  v5 = a3;
  if ((objc_msgSend(v5, "nfcCardSessionAccess") & 1) == 0)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      v15 = 45;
      if (isMetaClass)
        v15 = 43;
      v11(3, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card access", v15, ClassName, Name, 329);
    }
    v16 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v17 = NFSharedLogGetLogger(v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = object_getClass(a1);
      if (class_isMetaClass(v19))
        v20 = 43;
      else
        v20 = 45;
      *(_DWORD *)buf = 67109890;
      v49 = v20;
      v50 = 2082;
      v51 = object_getClassName(a1);
      v52 = 2082;
      v53 = sel_getName(a2);
      v54 = 1024;
      v55 = 329;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card access", buf, 0x22u);
    }

    v21 = objc_alloc((Class)NSError);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v46[0] = NSLocalizedDescriptionKey;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Not entitled"));
    v47[0] = v23;
    v47[1] = &off_100300AE8;
    v46[1] = CFSTR("Line");
    v46[2] = CFSTR("Method");
    v24 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v47[2] = v24;
    v46[3] = NSDebugDescriptionErrorKey;
    v25 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 330);
    v47[3] = v25;
    v26 = v47;
    v27 = v46;
    goto LABEL_24;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nfcCardSessionAIDPrefixList"));
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    v28 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v29 = NFLogGetLogger(v28);
    if (v29)
    {
      v30 = (void (*)(uint64_t, const char *, ...))v29;
      v31 = object_getClass(a1);
      v32 = class_isMetaClass(v31);
      v33 = object_getClassName(a1);
      v43 = sel_getName(a2);
      v34 = 45;
      if (v32)
        v34 = 43;
      v30(3, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring non-empty AID prefix list", v34, v33, v43, 334);
    }
    v35 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v36 = NFSharedLogGetLogger(v35);
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = object_getClass(a1);
      if (class_isMetaClass(v38))
        v39 = 43;
      else
        v39 = 45;
      *(_DWORD *)buf = 67109890;
      v49 = v39;
      v50 = 2082;
      v51 = object_getClassName(a1);
      v52 = 2082;
      v53 = sel_getName(a2);
      v54 = 1024;
      v55 = 334;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring non-empty AID prefix list", buf, 0x22u);
    }

    v21 = objc_alloc((Class)NSError);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v44[0] = NSLocalizedDescriptionKey;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Not entitled"));
    v45[0] = v23;
    v45[1] = &off_100300B00;
    v44[1] = CFSTR("Line");
    v44[2] = CFSTR("Method");
    v24 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v45[2] = v24;
    v44[3] = NSDebugDescriptionErrorKey;
    v25 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 335);
    v45[3] = v25;
    v26 = v45;
    v27 = v44;
LABEL_24:
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v27, 4));
    v8 = objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 32, v40);

    goto LABEL_25;
  }
  v8 = 0;
LABEL_25:

  return v8;
}

- (void)handleFieldChanged:(BOOL)a3
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
  const char *v17;
  const char *v18;
  void *v19;
  const char *ClassName;
  const char *Name;
  objc_super v22;
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

  v3 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_NFCardSession;
  -[_NFHCESession handleFieldChanged:](&v22, "handleFieldChanged:");
  if (-[_NFCardSession fieldPresent](self, "fieldPresent") != v3)
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
      v8(6, "%c[%{public}s %{public}s]:%i fieldPresent=%{public}d", v11, ClassName, Name, 346, v3);
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
      v17 = object_getClassName(self);
      v18 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v24 = v16;
      v25 = 2082;
      v26 = v17;
      v27 = 2082;
      v28 = v18;
      v29 = 1024;
      v30 = 346;
      v31 = 1026;
      v32 = v3;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i fieldPresent=%{public}d", buf, 0x28u);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
    objc_msgSend(v19, "fieldChanged:", v3);

    -[_NFCardSession setFieldPresent:](self, "setFieldPresent:", v3);
  }
}

- (void)handleFieldNotification:(id)a3
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
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
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
  id v31;

  v5 = a3;
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
    v8(6, "%c[%{public}s %{public}s]:%i %{public}@", v11, ClassName, Name, 355, v5);
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
    v23 = v16;
    v24 = 2082;
    v25 = object_getClassName(self);
    v26 = 2082;
    v27 = sel_getName(a2);
    v28 = 1024;
    v29 = 355;
    v30 = 2114;
    v31 = v5;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v18 = NFSharedSignpostLog(v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_FIELD_NTF", ", buf, 2u);
  }

}

- (void)cleanup
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
  uint64_t v17;
  void (*v18)(uint64_t, const char *, ...);
  objc_class *v19;
  _BOOL4 v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  objc_class *v26;
  int v27;
  const char *v28;
  const char *v29;
  const char *Name;
  const char *v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;

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
    v6(6, "%c[%{public}s %{public}s]:%i Cleanup ...", v10, ClassName, Name, 361);
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
    v33 = v15;
    v34 = 2082;
    v35 = object_getClassName(self);
    v36 = 2082;
    v37 = sel_getName(a2);
    v38 = 1024;
    v39 = 361;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Cleanup ...", buf, 0x22u);
  }

  if (-[_NFSession needsCleanup](self, "needsCleanup"))
  {
    -[_NFCardSession _invalidateUIController](self, "_invalidateUIController");
  }
  else
  {
    v16 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v17 = NFLogGetLogger(v16);
    if (v17)
    {
      v18 = (void (*)(uint64_t, const char *, ...))v17;
      v19 = object_getClass(self);
      v20 = class_isMetaClass(v19);
      v21 = object_getClassName(self);
      v31 = sel_getName(a2);
      v22 = 45;
      if (v20)
        v22 = 43;
      v18(6, "%c[%{public}s %{public}s]:%i Cleanup not needed ...", v22, v21, v31, 363);
    }
    v23 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v24 = NFSharedLogGetLogger(v23);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = object_getClass(self);
      if (class_isMetaClass(v26))
        v27 = 43;
      else
        v27 = 45;
      v28 = object_getClassName(self);
      v29 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v33 = v27;
      v34 = 2082;
      v35 = v28;
      v36 = 2082;
      v37 = v29;
      v38 = 1024;
      v39 = 363;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Cleanup not needed ...", buf, 0x22u);
    }

  }
}

- (id)initialRoutingConfigWithField:(id)a3
{
  id v5;
  id v6;
  void *v7;
  objc_super v9;
  _QWORD v10[6];

  v5 = a3;
  if (-[_NFHCESession emulationOnSessionStart](self, "emulationOnSessionStart"))
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100195CCC;
    v10[3] = &unk_1002E5F60;
    v10[4] = self;
    v10[5] = a2;
    -[_NFCardSession _activateUIControllerWithCompletion:](self, "_activateUIControllerWithCompletion:", v10);
  }
  v9.receiver = self;
  v9.super_class = (Class)_NFCardSession;
  v6 = -[_NFHCESession initialRoutingConfigWithField:](&v9, "initialRoutingConfigWithField:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (id)initialRoutingConfig
{
  id v4;
  objc_super v6;
  _QWORD v7[6];

  if (-[_NFHCESession emulationOnSessionStart](self, "emulationOnSessionStart"))
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100195F14;
    v7[3] = &unk_1002E5F60;
    v7[4] = self;
    v7[5] = a2;
    -[_NFCardSession _activateUIControllerWithCompletion:](self, "_activateUIControllerWithCompletion:", v7);
  }
  v6.receiver = self;
  v6.super_class = (Class)_NFCardSession;
  v4 = -[_NFHCESession initialRoutingConfig](&v6, "initialRoutingConfig");
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (NFServiceWhitelistChecker)allowlistChecker
{
  return self->_allowlistChecker;
}

- (int64_t)cardState
{
  return self->_cardState;
}

- (void)setCardState:(int64_t)a3
{
  self->_cardState = a3;
}

- (BOOL)fieldPresent
{
  return self->_fieldPresent;
}

- (void)setFieldPresent:(BOOL)a3
{
  self->_fieldPresent = a3;
}

- (NSMutableOrderedSet)paymentAIDList
{
  return self->_paymentAIDList;
}

- (void)setPaymentAIDList:(id)a3
{
  objc_storeStrong((id *)&self->_paymentAIDList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentAIDList, 0);
  objc_storeStrong((id *)&self->_allowlistChecker, 0);
  objc_storeStrong((id *)&self->_uiService, 0);
}

+ (void)isEligibleWithUserPrompt:(BOOL)a3 auditToken:(id *)a4 completion:(id)a5
{
  id v9;
  NFTCCChecker *v10;
  uint64_t v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15[2];
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  id v19;
  SEL v20;
  __int128 v21;
  __int128 v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v9 = a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_1001962B0;
  v28 = sub_1001962C0;
  v10 = sub_1000AA1F8((uint64_t)NFTCCChecker);
  v29 = (id)objc_claimAutoreleasedReturnValue(v10);
  v11 = v25[5];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001962C8;
  v16[3] = &unk_1002EA4E8;
  v19 = a1;
  v20 = a2;
  v12 = v9;
  v17 = v12;
  v18 = &v24;
  v23 = a3;
  v13 = *(_OWORD *)&a4->var0[4];
  v21 = *(_OWORD *)a4->var0;
  v22 = v13;
  v14 = *(_OWORD *)&a4->var0[4];
  v15[0] = *(_OWORD *)a4->var0;
  v15[1] = v14;
  sub_1000AA494(v11, 0, v15, v16);

  _Block_object_dispose(&v24, 8);
}

@end
